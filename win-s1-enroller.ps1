##### SentinelOne Enrollment #####
# Windows S1 Enrollment Script
#
#
$S1_URL = "https://URL-TO-PKG.GOES/HERE.msi"
$S1_TOKEN = "SITE-TOKEN-GOES-HERE"
#
#
# Installing SentinelOne
try
{
	if(-not(Test-path 'C:\Program Files\SentinelOne')) {
		Invoke-WebRequest -Uri $S1_URL -OutFile ${env:tmp}\'s1-install.exe'
		sleep 3
		${env:tmp}\'s1-install.exe' -t $S1_TOKEN
		Write-Host "[*] SentinelOne successfully installed!" -ForegroundColor Green
		Exit 0
	}
	else {
		Write-Host "[*] SentinelOne already installed on this system." -ForegroundColor Cyan
		Exit 0
}
catch
{
	Write-Host "[*] Error with: Installing SentinelOne"
	Write-Host "[*] SentinelOne failed to install." -ForegroundColor Red
	Exit 1
}
