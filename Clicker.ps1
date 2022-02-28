################### Autoclicker Mouseclicker script #######################

[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic') | Out-Null

if ($psISE){
    Split-Path -Path $psISE.CurrentFile.FullPath | Out-Null     
}
else{
    $global:PSScriptRoot
}

$signature=@'
[DllImport("user32.dll",CharSet=CharSet.Auto,CallingConvention=CallingConvention.StdCall)]
public static extern void mouse_event(long dwFlags, long dx, long dy, long cButtons, long dwExtraInfo);
'@

$SendMouseClick = Add-Type -memberDefinition $signature -name "Win32MouseEventNew" -namespace Win32Functions -passThru

$NameofFile = [Microsoft.VisualBasic.Interaction]::InputBox("Write in the name of the file you want to get the mouseclicker log from.`n`nDont use space and dont add any extention such as .txt, .ps1, .csv", "Name for file", "Example-Filename")

$nameoffiledontmatch = $true

while($nameoffiledontmatch -eq $true){
    if(!(Test-Path ("$PSScriptRoot\functionclickerfiles\$NameofFile.txt"))){
        $NameofFile = [Microsoft.VisualBasic.Interaction]::InputBox("There is no Mouseclicker log with that name!`n`nWrite in the name of the file you want to get the mouseclicker log from.`n`nDont use space and dont add any extention such as .txt, .ps1, .csv", "Name for file", "Example-Filename")
    }
    else{
        $nameoffiledontmatch = $false
    }
}

$contentfromfile = Get-Content -Path "$PSScriptRoot\functionclickerfiles\$NameofFile.txt"

foreach($line in $contentfromfile){
    Write-Host $line
    $linesplit = $line.Split(",")
    $secwait = $linesplit[2].split(":")[2].split(".")[0]
    
    #sleep

    Start-Sleep 

    Start-Sleep -Seconds $secwait

    #move mouse
    [System.Windows.Forms.Cursor]::Position = New-Object System.Drawing.Point($linesplit[3], $linesplit[4])
    
    if($linesplit[1] -eq "left"){
        $SendMouseClick::mouse_event(0x00000002, 0, 0, 0, 0);   #Left click down
        $SendMouseClick::mouse_event(0x00000004, 0, 0, 0, 0);   #Left click up
    }
    else{
        $SendMouseClick::mouse_event(0x00000008, 0, 0, 0, 0);   #Right click down
        $SendMouseClick::mouse_event(0x00000010, 0, 0, 0, 0);   #Right click up
    }
}