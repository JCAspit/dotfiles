#!/bin/sh

RED="\033[38;2;255;0;0m"
RESET="\033[m"

DOASEDIT_VERSION=1.0
USER_DO="root"

set -eu

msg() {
	echo "doasedit: $1"
}

error() {
	echo -e "${RED}doasedit: $1${RESET}"
	exit 0
}

help() {
	cat << EOF
doasedit - edit files as another user  |  like sudoedit, but with doas instead...

usage: doasedit -h | -V
usage: doasedit [-u user] file

Options:

  -h, --help                    display help message and exit
  -u, --user=user               run command (or edit file) as specified user
  -V, --version                 display version information and exit
  --                            stop processing command line arguments
EOF
}

if [ "$#" -eq 0 ]; then
	help
	exit 0
fi

while [ "$#" -gt 0 ]; do
	case "$1" in
		--)
			shift
			break
			;;
		--help | -h)
			help
			exit 0
			;;
		# To-do: Exit if multiple usages
		-u)
			USER_DO=$2
			shift
			shift
			;;
		--user=*)
			USER_DO=$(echo "$1" | cut -d '=' -f 2)
			shift
			;;
		--version | -V)
			# To-do: msg()?
			echo "Doasedit version: $DOASEDIT_VERSION"
			exit 0
			;;
		-*)
			error "invalid argument: $1"
			;;
		*)
			break
			;;
	esac
done

DOAS_CMD="doas -u $USER_DO"

# Pre-script checking
#if [ $(whoami) == "root" ]; then
if [ $(id -u) -eq 0 ]; then
	error "Cannot run \`doasedit\` as root."
fi

if [ ! $(command -v doas) ]; then
	error "\`doas\` is not installed."
fi

EDITOR=${EDITOR:-nvim}
EDITOR=${EDITOR:-vim}
EDITOR=${EDITOR:-vi}
EDITOR=${EDITOR:-nano}

if [ -z $EDITOR ]; then
	error "No editor specified. Please set your \$EDITOR environment variable and try again."
fi

if [ -z "$1" ]; then
	error "No file path provided."
fi

#if [ -w $(dirname "$1") ]; then
if [ -w "$1" ]; then
	error "$1: editing files in a writable directory is not permitted."
fi

if [ -d "$1" ]; then
	error "$1 is a directory."
fi

if [ -e "$1" ] && [ ! -r "$1" ]; then
	error "$1 is not readable."
fi

TEMP_DIR="/var/tmp/"

FILE_PATH=$(realpath "$1")
FILE_FULL="${FILE_PATH##*/}"
FILE_NAME="${FILE_FULL%.*}"
FILE_EXTENSION="${FILE_FULL##*.}"
if [ "$FILE_EXTENSION" == "$FILE_NAME" ]; then
	FILE_EXTENSION=""
fi

# Replicating `sudoedit` temp file naming schema, which preserves file extensions for the temporary file
RAND=$(tr -dc A-Za-z0-9 < /dev/urandom | head -c 8)

if [ -n "$FILE_EXTENSION" ]; then
	TEMP_NAME="$FILE_NAME$RAND.$FILE_EXTENSION"

else
	TEMP_NAME="$FILE_NAME.$RAND"

fi

TEMP_PATH=$TEMP_DIR$TEMP_NAME

## Debugging :>
#echo "File path: $FILE_PATH"
#echo "File full name: $FILE_FULL"
#echo "File name: $FILE_NAME"
#echo "File extension: $FILE_EXTENSION"
#echo
#echo "Temp name: $TEMP_NAME"
#echo "Temp directory: $TEMP_DIR"
#echo "Temp path: $TEMP_PATH"

if [ -e $FILE_PATH ]; then
	cp -a $FILE_PATH $TEMP_PATH
else
	touch $TEMP_PATH
fi

# Ensure read/write permissions for copy
$DOAS_CMD chown --silent $(id -u):$(id -g) $TEMP_PATH
$DOAS_CMD chmod --silent 644 $TEMP_PATH

$EDITOR $TEMP_PATH

# To-do: Mimic `sudoedit` functionality when file does not exist
# Note the lack of brackets
if cmp -s "$FILE_PATH" "$TEMP_PATH"; then
	msg "$FILE_PATH unchanged."
	rm -f $TEMP_PATH

else
	# If we're editing the doas configuration file, check for syntax errors
	if [ "$FILE_PATH" == "/etc/doas.conf" ]; then
		if ! doas -C $TEMP_PATH; then
			error "$FILE_PATH contains syntax errors. Writing may lock you out of your system. Kept changes at: $TEMP_PATH"
		fi
	fi

	# To-do: 3 attempts. If still wrong, don't delete temp file
	# Using dd to preserve permissions of original file
	if $DOAS_CMD dd status=none if=$TEMP_PATH of=$FILE_PATH; then
		rm -f $TEMP_PATH
	else
		error "Unable to write to $1.\ndoasedit: Left contents of edit session in $TEMP_PATH"
		# To-do: Put error message and silence `dd`	
		#error "Unable to write to $1: [ERROR MESSAGE HERE].\ndoasedit: Left contents of edit session in $TEMP_PATH"
	fi

fi
