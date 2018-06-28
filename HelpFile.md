# Help file for Set-WindowsOemInformation cmdlet

    .SYNOPSIS
Sets OEM information for PC running Windows operating system

    .DESCRIPTION
Writes manufacturer's name, support website, phone number and working hours. Those can be seen at system's properties and about screen of Windows

    .PARAMETER Manufacturer
Manufacturer's name    

    .PARAMETER Model
Computer's model name

    .PARAMETER SupportUrl
Manufacturer's customer support URL   

    .PARAMETER SupportPhone
Manufacturer's customer support phone number

    .PARAMETER SupportHours
Manufacturer's customer support working hours   

    .NOTES
Copyright 2018 Andriy Melnyk (mao@bebee.xyz), all rights reserved    

    .EXAMPLE
$oemInfo = @{
    Manufacturer =  'ƋƂ'
    Model =         'Hexagent (Gigabyte GA-H67A-D3H-B3)'
    SupportPhone =  '911'
    SupportHours =  '0—24'
    SupportUrl =    'http://localhost/contacts'
}
Set-WindowsOemInformation @oemInfo

    .EXAMPLE
Set-WindowsOemInformation -Manufacturer '卐 Acer 卍' -force


    .LINK
https://raw.githubusercontent.com/turboBasic/WindowsOEMinformation/master/HelpFile.md    