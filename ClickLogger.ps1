################### Autoclicker Mouseclicklogger script #######################

if ($psISE){
    Split-Path -Path $psISE.CurrentFile.FullPath        
}
else{
    $global:PSScriptRoot
}

$NameofFile = [Microsoft.VisualBasic.Interaction]::InputBox("Write the name of the file you want to save this mouseclick log too. `n `nDont use space and dont add any extention such as .txt, .ps1, .csv", "Name for file", "Example-Filename")

if(!(Test-Path ("$PSScriptRoot\functionclickerfiles"))){
    New-Item -Path "$PSScriptRoot\" -ItemType Directory -Name "functionclickerfiles"
}
New-Item -Path "$PSScriptRoot\functionclickerfiles\$NameofFile.txt"

$index = 0

Write-Host "Ready to record" -ForegroundColor Magenta
while ($true) {
    ## Given that we have started
    if($true){
        if([System.Windows.Forms.UserControl]::MouseButtons -eq "Left"){
            if($index -eq 0){
                $Firsttime = Get-Date
            }
            $Secondtime = Get-Date
            $interval = $Secondtime - $Firsttime + 1
            $X = [System.Windows.Forms.Cursor]::Position.X
            $Y = [System.Windows.Forms.Cursor]::Position.Y

            $texttoappend = "$index,Left,$interval,$X,$y"
            Write-Host $texttoappend

            Add-Content -Value $texttoappend -Path "$PSScriptRoot\functionclickerfiles\$NameofFile.txt"
            $index++
            Start-Sleep 0.2
            $Firsttime = Get-Date
        }
        elseif([System.Windows.Forms.UserControl]::MouseButtons -eq "Right"){
            if($index -eq 0){
                $Firsttime = Get-Date
            }
            $Secondtime = Get-Date
            $interval = $Secondtime - $Firsttime + 1
            $X = [System.Windows.Forms.Cursor]::Position.X
            $Y = [System.Windows.Forms.Cursor]::Position.Y

            $texttoappend = "$index,Right,$interval,$X,$y"
            Write-Host $texttoappend

            Add-Content -Value $texttoappend -Path "$PSScriptRoot\functionclickerfiles\$NameofFile.txt"
            $index++
            Start-Sleep 0.2        
            $Firsttime = Get-Date
        }

    }

    Start-Sleep 1
}