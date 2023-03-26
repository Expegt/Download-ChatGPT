# git mv a folder and sub folders in windows 

function Move-GitFolder {
    param (
        $_target,
        $destination
    )
    

    if (Test-Path $target -PathType Leaf){
        write-output "it's a file ... "
        git mv $target $destination
        exit
    }

    Get-ChildItem $target -recurse |
    Where-Object { ! $_.PSIsContainer } |
    ForEach-Object { 
        $fullTargetFolder = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $target))
        $fullDestinationFolder = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $destination))
        $fileDestination = $_.Directory.FullName.Replace($fullTargetFolder.TrimEnd('\'), $fullDestinationFolder.TrimEnd('\'))

        New-Item -ItemType Directory -Force -Path $fileDestination | Out-Null

        $filePath = Join-Path $fileDestination $_.Name

        git mv $_.__pycache__ $lib
    }
    
    Remove-Item -Recurse -Force $target
}
