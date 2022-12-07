Set-ExecutionPolicy RemoteSigned
$folder = read-host 'Enter folder name?'
mkdir $folder; cd $folder
$a = [char[]]@(65..90)
[char[]]@(65..90) | foreach { new-item -path .\$_.html -value '
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="utf-8">
 </head>
 <body>
 <a href="_.html">_</a>
 </body>
 </html>' }

get-childitem . -filter *.html | foreach-object { (get-content $_ -raw) -replace '_', (get-random -inputobject $a) | set-content -path .\$_ }

cd ..