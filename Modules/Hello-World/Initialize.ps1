if ([string]::IsNullOrEmpty($ExampleState)) {
    Write-Information "Example not initialized."
    Write-Information "Initializing now..."
    $ExampleState = 'Initialized'
} else {
    Write-Information "Example already initialized."
}