param([string]$path=$PSScriptRoot)
$files=Get-ChildItem -LiteralPath $path -Filter *.mp3 -File
foreach($f in $files){
  $base=([IO.Path]::GetFileNameWithoutExtension($f.Name)) -replace '[\s\.]+$',''
  $dst=Join-Path $f.DirectoryName "$base.m4a"
  ffmpeg -y -loglevel error -nostdin -i "$($f.FullName)" -vn -map 0:a:0 -c:a copy -bsf:a aac_adtstoasc "$dst" 2>$null
  if(Test-Path -LiteralPath $dst){ Write-Host "$($f.Name)  OK" } else { Write-Host "$($f.Name)  FAIL" }
}
