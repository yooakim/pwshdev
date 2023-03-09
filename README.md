# PowerShell Visual Studio Code Dev Container

This repository contains a starter DevContainer for developing with PowerShell.

## Login to Azure

In order to use the Az PowerShell cmdlets you must be logged in. The simpålest way to to this is to use the _device flow_ and login as follows:

Connect-AzAccount -DeviceAuth

## Adding extensions

If you want to add extensions to VS Code, update the file [devcontainer.json](.devcontainer/devcontainer.json)

## Using Pester

The container includes Pester so you can use test driven development. The code from the Pester [quick start](https://pester.dev/docs/quick-start#splitting-to-tests-and-function) is included. Open the VS Code terminal and start a test run as follows:

    Invoke-Pester -Output Detailed

this will discover testfiles and execute them.
