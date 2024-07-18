# Скрипт не работает для xls-файлов.

# Get the current user
$currentUsername = "Имя пользователя, на которого нужно заменить"

# Iterate through Word documents
$wordApp = New-Object -ComObject Word.Application
$wordDocs = Get-ChildItem -Path "Путь до папки" -Recurse -Filter *.docx
foreach ($doc in $wordDocs) {
    $wordDoc = $wordApp.Documents.Open($doc.LastAuthor)
    $wordDoc.BuiltInDocumentProperties("Author").Value = $currentUsername
    $wordDoc.Save()
    $wordDoc.Close()
}
$wordApp.Quit()

# Iterate through Excel files
$excelApp = New-Object -ComObject Excel.Application
$excelFiles = Get-ChildItem -Path "Путь до папки" -Recurse -Filter *.xlsx
foreach ($file in $excelFiles) {
    $excelWorkbook = $excelApp.Workbooks.Open($file.LastAuthor)
    $excelWorkbook.BuiltInDocumentProperties("Author").Value = $currentUsername
    $excelWorkbook.Save()
    $excelWorkbook.Close()
}
$excelApp.Quit()

$excelApp = New-Object -ComObject Excel.Application
$excelFiles = Get-ChildItem -Path "D:\Practica" -Recurse -Filter *.xls
foreach ($file in $excelFiles) {
    $excelWorkbook = $excelApp.Workbooks.Open($file.LastAuthor)
    $excelWorkbook.BuiltInDocumentProperties("Author").Value = $currentUsername
    $excelWorkbook.Save()
    $excelWorkbook.Close()
}
$excelApp.Quit()

<#$excelApp = New-Object -ComObject Excel.Application
$excelFiles = Get-ChildItem -Path "E:\Practica" -Recurse -Filter *.mdb
foreach ($file in $excelFiles) {
    $excelWorkbook = $excelApp.Workbooks.Open($file.LastAuthor)
    $excelWorkbook.BuiltInDocumentProperties("Author").Value = $currentUsername
    $excelWorkbook.Save()
    $excelWorkbook.Close()
}
$excelApp.Quit()

$excelApp = New-Object -ComObject Excel.Application
$excelFiles = Get-ChildItem -Path "E:\Practica" -Recurse -Filter *.accdb
foreach ($file in $excelFiles) {
    $excelWorkbook = $excelApp.Workbooks.Open($file.LastAuthor)
    $excelWorkbook.BuiltInDocumentProperties("Author").Value = $currentUsername
    $excelWorkbook.Save()
    $excelWorkbook.Close()
}
$excelApp.Quit()
#>

# Iterate through PowerPoint files
$pptApp = New-Object -ComObject PowerPoint.Application
$pptFiles = Get-ChildItem -Path "Путь до файла" -Recurse -Filter *.pptx
foreach ($file in $pptFiles) {
    $pptPresentation = $pptApp.Presentations.Open($file.LastAuthor)
    $pptPresentation.BuiltInDocumentProperties("Author").Value = $currentUsername
    $pptPresentation.Save()
    $pptPresentation.Close()
}
$pptApp.Quit()
