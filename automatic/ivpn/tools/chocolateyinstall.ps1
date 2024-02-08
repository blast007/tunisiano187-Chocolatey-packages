﻿$url          = 'https://repo.ivpn.net/windows/bin/IVPN-Client-v3.14.2.exe'
$checksum     = '78e363c6405134ab4424650f2d0435c5a2f4120fcd1b0d4ce062fcd3f6dc471a'
$checksumType = 'SHA256'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  url           = $url
  softwareName  = 'ivpn*'
  checksum      = $checksum
  checksumType  = $checksumType
  silentArgs   = '/S'
}
$OSIsServerVersion = if ((Get-WmiObject -Class Win32_OperatingSystem).ProductType -ne 1) {$True} else {$False}
if($OSIsServerVersion) {
  Write-Warning "Only runs on Windows Clients (7/8/10/11), does not run on windows servers."
  exit 0
} else {
  Install-ChocolateyPackage @packageArgs
}
