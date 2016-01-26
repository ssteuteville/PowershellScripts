# Search And Replace
# snr <target> <replacement> [--rec]
# if the 3rd param is --rec this will do a recursive search
$ext = $args[0]
$target = $args[1]
$newString = $args[2]
if($args[3] -eq "-rec")
{
	$files = Get-ChildItem . *.$ext -rec
}
else
{
	$files = Get-ChildItem . *.$ext
}
foreach($file in $files)
{
	(Get-Content $file.PSPath) |
	Foreach-Object { $_ -replace $target, $newString } |
	Set-Content $file.PSPath 
}