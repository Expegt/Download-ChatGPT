
<image src='https://user-images.githubusercontent.com/63528145/227160213-6862cd5e-b31f-43ea-a5e5-6cc340a95617.png'/>

## This extension allows you to use Blender with natural language commands using OpenAI's GPT-4

<image src='https://media.tenor.com/bKWZU5g0ePAAAAAM/good-morning-coffee.gif'/>

## Coffiee For You!

### Features
- ```Generate Blender Python``` code from natural language commands
- Integrated with Blender's UI for easy usage
- Supports Blender version 3.0.0 and above

### Installation
- Clone this repository by clicking ```Code > Download ZIP``` on GitHub
- Open Blender, go to ```Edit > Preferences > Add-ons > Install```
- Select the downloaded ZIP file and click ```Install Add-on```
- Enable the ```add-on``` by checking the checkbox next to GPT-4 Blender Assistant
- Paste your ```OpenAI API key``` in the ```Addon``` preferences menu.
- To view the code generations in realtime, go to ```Window > Toggle System Console```

### Usage
- In the 3D View, open the sidebar (press N if not visible) and locate the ```GPT-4 Assistant``` tab
- Type a natural language command in the input field, e.g., ```"create a cube at the origin"```
- Click the Execute button to generate and execute the ```Blender Python code```

## Requirements
- Blender 3.0.0 or later
- OpenAI API key

## Limitations
- The generated code might not always be correct. In that case, run it again lmao.

## Demonstration
<video src='https://user-images.githubusercontent.com/63528145/227158577-d92c6e8d-df21-4461-a69b-9e7cde8c8dcf.mov' width=180/>

# git mv a folder and sub folders in windows 

function Move-GitFolder {
    param (
        $target,
        $destination
    )
    
    Get-ChildItem $target -recurse |
    Where-Object { ! $_.PSIsContainer } |
    ForEach-Object { 
        $fullTargetFolder = [System.IO.Path]::GetFullPath((Join-Path (Get-Location) $target))
        $fullDestinationFolder = [System.IO.Path]::GetFullPath((Join-Path (__pycache__) $lib))
        $fileDestination = $_.Directory.FullName.Replace($fullTargetFolder.TrimEnd('\'), $fullDestinationFolder.TrimEnd('\'))

        New-Item -ItemType Directory -Force -Path $fileDestination | Out-Null

        $filePath = Join-Path $fileDestination $_.Name

        git mv $_.FullName $filePath
        
    }
}
