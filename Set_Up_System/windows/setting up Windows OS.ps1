
# Устанавливаем сплошной чёрный цвет
Set-ItemProperty -Path "HKCU:\Control Panel\Colors" -Name "Background" -Value "0 0 0"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "BackgroundColor" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "UseSolidColorBackground" -Value 1

# Принудительно обновляем рабочий стол
Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
'@
[Wallpaper]::SystemParametersInfo(0x0014, 0, "", 0x01)
Stop-Process -Name explorer -Force

# ------- Bottom Panel -------

# Отключаем поисковую строку
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchboxTaskbarMode" -Value 0

# Отключаем кнопку "Представление задач"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0

# Перезапускаем проводник для применения
Stop-Process -Name explorer -Force

# Botom Taskbar
winget install ChrisAndriessen.TaskbarX
# Setting Up Taskbar
Start-Process "C:\ProgramData\chocolatey\lib\taskbarx\tools\TaskbarX.exe" -ArgumentList "-position center -animation fade"

# Small tabs in bottom pannel
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarSmallIcons" -Value 1
# Set Dark theme
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0
Stop-Process -Name explorer -Force

# For download

# Массив пакетов для установки
$packages = @(
    "microsoft-windows-terminal",    # Windows Terminal
    "git",                          # Git
    "vscode",                       # Visual Studio Code
    "7zip",                         # 7-Zip
    "firefox",                      # Mozilla Firefox
    "python",                       # Python
    "docker-desktop",               # Docker Desktop
    "docker"
    "docker-cli"
    "vlc"                           # VLC Media Player
    "komorebi",
    "kubernetes-cli",
    "less",
    "microsoft-windows-terminal",
    "oh-my-posh",
    "powertoys",
    "taskbarx",
    "vcredist140",
    "vim",
    "cascadia-code-nerd-font",
    "grep",
    "mc"
)

Write-Host "Начинаю установку пакетов..." -ForegroundColor Cyan

# Устанавливаем каждый пакет из массива
foreach ($package in $packages) {
    Write-Host "Устанавливаю $package..." -ForegroundColor Green
    choco install $package -y --no-progress
}
