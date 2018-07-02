[![Build status](https://ci.appveyor.com/api/projects/status/a3jgi73wukccqwk1?svg=true)](https://ci.appveyor.com/project/mao/windowsoeminformation)

# [WindowsOemInformation](https://github.com/turboBasic/WindowsOemInformation)

## ![0xHexagram][hexagram]

Sets OEM information for PC running Windows operating system



## Usage

`Set-WindowsOemInformation -Manufacturer '🍄' -force`

    $oemInfo = @{ 
       Manufacturer = 'ƋƂ' 
       Model = 'Hexagent (Gigabyte GA-H67A-D3H-B3)' 
       SupportPhone = '911' 
       SupportHours = '0—24' 
       SupportUrl = 'http://localhost/contacts' 
    } 
    Set-WindowsOemInformation @oemInfo
   

## Installation

`Install-Module -Name WindowsOEMinformation`


[hexagram]: https://gist.githubusercontent.com/TurboBasic/9dfd228781a46c7b7076ec56bc40d5ab/raw/03942052ba28c4dc483efcd0ebf4bfc6809ed0d0/hexagram3D.png 'hexagram of Wisdom'
