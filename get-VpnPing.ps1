<# 
Copyright 2017, Joshua Porrata
Are you a business?
If you are then you should consider contacting me for a license to use this simpe little script. 
It's nt actually free for businesses, it just has no copy protection. 
Contact me at my email address localbeautytampabay@gmail.com for details on very low business rates. 
Copyright 2017, Joshua Porrata
All-rights reserved
No Warranty or guarantee that this script wont hurt you exists nor is it implied.
Use at your own risk.  #>

#This Script will take each hostname from a list of hostnames 
#ping them 4 times
#average those pings
#sort them and display 
#lowest to highest so you can figure out which host might possibly be quikest

#You need to place a plain ole text file with a lists of hosts seperated by a linebreak
#the file needs to be named VpnHosts.txt

Clear-Host

Write-Host "`n***********************************************" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***Copyright 2017, Joshua Porrata**************" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***This program is not free for business use***" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***Contact me at localbeautytampabay@gmail.com*" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***for a cheap business license****************" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***Donations are wholeheartedly accepted ******" -BackgroundColor Black -ForegroundColor Red
Write-Host "***accepted @ www.paypal.me/lbtpa**************" -BackgroundColor Black -ForegroundColor Red
Write-Host "***********************************************`n" -BackgroundColor Black -ForegroundColor DarkGreen

$hostnames = Get-Content .\VpnHosts.txt
$hostcount = $hostnames.count
$i = 1
$pingArray = @()
if($hostnames -eq $null){
Break
}
Write-Host "Found $hostcount Hostnames `nBegining Tests`n"
foreach ($Hostname in $hostnames) {
    Write-Host "Testing connection to: $hostname $i of $hostcount"
    $loopTest = Test-Connection $Hostname
    $avgTime = ($loopTest.Responsetime[0] + $loopTest.Responsetime[1] + $loopTest.Responsetime[2] + $loopTest.Responsetime[3]) / 4
    $loopArray = New-Object PSObject @()
    $loopArray | Add-Member -MemberType NoteProperty -Name "Hostname" -Value $Hostname
    $loopArray | Add-Member -MemberType NoteProperty -Name "AvgTime" -Value $avgTime
    $pingArray += $loopArray
    $i++
}
$pingArray = $pingArray | Sort-Object AvgTime
$pingArray | Format-Table

Write-Host "`n***********************************************" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***Copyright 2017, Joshua Porrata**************" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***This program is not free for business use***" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***Contact me at localbeautytampabay@gmail.com*" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***for a cheap business license****************" -BackgroundColor Black -ForegroundColor DarkGreen
Write-Host "***Donations are wholeheartedly accepted ******" -BackgroundColor Black -ForegroundColor Red
Write-Host "***accepted @ www.paypal.me/lbtpa**************" -BackgroundColor Black -ForegroundColor Red
Write-Host "***********************************************`n" -BackgroundColor Black -ForegroundColor DarkGreen