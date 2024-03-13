oh-my-posh init pwsh --config 'C:\Users\J\AppData\Local\Programs\oh-my-posh\themes\jblab_2021.omp.json' | Invoke-Expression

function dirs
{
	if ($args.Count -gt 0)
	{
		Get-ChildItem -Recurse -Include "$args" | Foreach-Object FullName
	}
	else
	{
		Get-ChildItem -Recurse | Foreach-Object FullName
	}
}

function admin
{
	if ($args.Count -gt 0)
	{
		$argList = "& '" + $args + "'"
		Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $argList
	}
	else
	{
		Start-Process "$psHome\powershell.exe" -Verb runAs
	}
}

Set-Alias -Name su -Value admin
Set-Alias -Name sudo -Value admin
# Set-Alias -Name vim -Value nvim

function Get-Uptime {
	Get-WmiObject win32_operatingsystem | select csname, @{LABEL='LastBootUpTime';
	EXPRESSION={$_.ConverttoDateTime($_.lastbootuptime)}}
}

function Find-File($name) {
	ls -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | foreach {
		$place_path = $_.directory
		echo "${place_path}\${_}"
	}
}

# Todo: check if file is valid path
function unzip($file) {
	if ($file -ne $null) {
	echo("Extracting", $file, "to", $pwd)
	$fullFile = Get-ChildItem -Path $pwd -Filter .\cove.zip | ForEach-Object{$_.FullName}
	Expand-Archive -Path $fullFile -DestinationPath $pwd
	}
	else
	{
		echo("Please provide a file.")
	}
}

function grep($regex, $dir) {
	if ( $dir ) {
		ls $dir | Select-String $regex
		return
	}
	$input | Select-String $regex
}

function touch($file) {
	"" | Out-File $file -Encoding ASCII
}

function pkill($name) {
	ps $name -ErrorAction SilentlyContinue | kill
}

function pgrep($name) {
	ps $name
}
