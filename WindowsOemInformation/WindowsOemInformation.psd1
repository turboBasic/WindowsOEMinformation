@{
    # If authoring a script module, the RootModule is the name of your .psm1 file
    RootModule = 'WindowsOemInformation.psm1'

    Author = 'Andriy Melnyk <mao@bebee.xyz>'

    CompanyName = 'Cargonautica'

    ModuleVersion = '0.1'

    # Use the New-Guid command to generate a GUID, and copy/paste into the next line
    GUID = 'a4bc7e8a-cbfe-41d8-ab13-b45005c57429'

    Copyright = '2018 Andriy Melnyk'

    Description = "Writes manufacturer's name, support website, phone number and working hours. Those can be seen at system's properties and about screen of Windows"

    # Minimum PowerShell version supported by this module (optional, recommended)
    PowerShellVersion = '5.1.0.0'

    # Which PowerShell Editions does this module work with? (Core, Desktop)
    CompatiblePSEditions = @('Desktop', 'Core')

    # Which PowerShell functions are exported from your module? (eg. Get-CoolObject)
    FunctionsToExport = '*'

    # Which PowerShell aliases are exported from your module? (eg. gco)
    AliasesToExport = @('')

    # Which PowerShell variables are exported from your module? (eg. Fruits, Vegetables)
    VariablesToExport = @('')

    # PowerShell Gallery: Define your module's metadata
    PrivateData = @{
        PSData = @{
            # What keywords represent your PowerShell module? (eg. cloud, tools, framework, vendor)
            Tags = @('tools', 'windows', 'windows-10', 'windows-server-2016')

            # What software license is your code being released under? (see https://opensource.org/licenses)
            LicenseUri = 'https://choosealicense.com/licenses/mit'

            # What is the URL to your project's website?
            ProjectUri = 'https://github.com/turboBasic/WindowsOemInformation'

            # What is the URI to a custom icon file for your project? (optional)
            IconUri = 'https://gist.githubusercontent.com/turboBasic/9dfd228781a46c7b7076ec56bc40d5ab/raw/03942052ba28c4dc483efcd0ebf4bfc6809ed0d0/hexagram3D.png'

            # What new features, bug fixes, or deprecated features, are part of this release?
            ReleaseNotes = @'
'@
        }
    }

    # If your module supports updateable help, what is the URI to the help archive? (optional)
    HelpInfoURI = 'https://raw.githubusercontent.com/turboBasic/WindowsOEMinformation/master/HelpFile.md'
}
