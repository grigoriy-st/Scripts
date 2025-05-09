# Загрузка Oh My Posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_rainbow.omp.json" | Invoke-Expression

[System.Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$Host.UI.RawUI.BackgroundColor = "Black"