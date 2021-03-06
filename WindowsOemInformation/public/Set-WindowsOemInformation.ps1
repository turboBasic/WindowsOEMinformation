function Set-WindowsOemInformation {
<#


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

#>


        [CmdletBinding(
            PositionalBinding = $false,
            ConfirmImpact = 'High',
            SupportsShouldProcess,
            HelpURI = 'https://gist.githubusercontent.com/turboBasic/e8c9ab5a96335d4b1ebf11c73bae2a0b/raw/28ef55cc07a53b56e5b51046ffe4bc1971719fe6/Set-WindowsOemInformation.ps1'
        )]

        Param(

            [String] $Manufacturer,

            [String] $Model,

            [String] $SupportUrl,

            [String] $SupportPhone,

            [String] $SupportHours,

            [Switch] $Force

        )


    BEGIN 
    {
        Set-StrictMode -Version Latest 

        $key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation'

        if (-not $psBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $psCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $psBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $psCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
        if (-not $psBoundParameters.ContainsKey('Verbose')) {
            $VerbosePreference = $psCmdlet.SessionState.PSVariable.GetValue('VerbosePreference')
        }
    }


    PROCESS 
    {
        <#
        foreach ($item in $data) {
          Try { 
            $property = Get-ItemProperty -Path $item.Key -Name $item.Property -ErrorAction Stop | Select-Object -ExpandProperty $item.Property
            Write-Warning "$($item.Property) already exists and will not be overwritten"
          } 
          Catch { 
            Set-ItemProperty -Path $item.Key -Name $item.Property -Value $item.Value -Verbose
          }
          Finally {
            $result = Get-ItemProperty -Path $item.Key -Name $item.Property -ErrorAction SilentlyContinue | Select-Object -ExpandProperty $item.Property
            Write-Host "$($item.Property): $result"
          }
        } 
        #>
        
        if ($Force -or $psCmdlet.ShouldProcess((& hostname), "Change OEM information for computer")) {
            $ConfirmPreference = 'None'

            foreach ($property in 'Manufacturer', 'Model', 'SupportPhone', 'SupportHours', 'SupportUrl') {
                if ( $psBoundParameters.ContainsKey($property) ) 
                {
                    Write-Verbose "Change $key.$property to $($psBoundParameters[$property])"
                    Set-ItemProperty -Path $key -Name $property -Value $($psBoundParameters[$property]) -Confirm:$false
                }
            }
        }
        
    }

    END 
    {}

}