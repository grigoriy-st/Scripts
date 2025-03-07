# Запуск скрипта от имени админа

# Смена кодировки
[Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

# Смена владельца и удаление папки с языками
Takeown /f "C:\Program Files\WindowsPowerShell\Modules\PSReadLine"
Remove-Item -Path "C:\Program Files\WindowsPowerShell\Modules\PSReadLine" -Recurse

# Переустановка модуля
Install-Module PSReadLine
