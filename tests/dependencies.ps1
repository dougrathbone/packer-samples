Describe  'Base requirements and tools installed' {
    It 'Installs Web Deploy' {
        { Get-Command "webdeploy.exe" -ErrorAction Stop } | Should Not Throw
    }

    It 'Installs Git' {
        { Get-Command "git" -ErrorAction Stop } | Should Not Throw
    }
}