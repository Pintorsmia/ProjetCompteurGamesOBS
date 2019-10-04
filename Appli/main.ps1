$MainMenu = Start-Job -FilePath "$PSScriptRoot\mainMenu.ps1"

Wait-job -Id $MainMenu.Id
$choix = Receive-Job -Id $MainMenu.Id
Remove-Job -Id $MainMenu.Id
if($choix -eq "CANCEL"){
    return $null
}
Write-Host $argum
<#
$pseudo = $choix[0]
$time = [int]$choix[1]
$reset = [int]$choix[2]     #1 ou 0

$job1 = Start-Job -FilePath ".\job1.ps1" -ArgumentList $pseudo,$time,$reset
$job2 = Start-Job -FilePath ".\job2.ps1"

Wait-Job -Id $job2.Id
Remove-Job -Id $job1.Id,$job2.Id -Force
#>