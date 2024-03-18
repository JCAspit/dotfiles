#
# ~/.bash_profile
#

for file in ~/.{bash_prompt,aliases}; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

export PATH=$PATH:/home/jcaspit/.spicetify
