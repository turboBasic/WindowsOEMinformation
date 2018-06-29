$projectRoot = Resolve-Path $PSScriptRoot\..
$moduleRoot = Split-Path (Resolve-Path $projectRoot\*\*.psm1)
$moduleName = Split-Path $moduleRoot -Leaf
$projectRoot, $moduleRoot, $moduleName | Write-Host



Describe "General project validation: $moduleName" {

    $scripts = Get-ChildItem $projectRoot -Include *.ps1,*.psm1,*.psd1 -Recurse

    # TestCases are splatted to the script so we need hashtables
    $testCase = $scripts | Foreach-Object { @{ file = $_}  }

    It "Script <file> should be valid powershell" -TestCases $testCase {
        Param( $file )

        $file.FullName | Should -Exist

        $contents = Get-Content -Path $file.FullName -ErrorAction Stop
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize( $contents, [ref] $errors )
        $errors.Count | Should -Be 0
    }

    It "Module '$moduleName' can import cleanly" {
        {Import-Module (Join-Path $moduleRoot "$moduleName.psm1") -force } | Should -Not -Throw
    }
}



Describe "Validate registry changes" {
    InModuleScope $moduleName {
        Mock Set-ItemProperty {}

        Set-WindowsOemInformation -Manufacturer 'Some manufacturer' -SupportUrl 'https://localhost' -force

        It "Correctly processes registry changes" {
            Assert-MockCalled Set-ItemProperty -times 2
        }
    }
}
