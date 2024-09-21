git init
git add .
git status
$message = Read-Host "Enter text message:"
git commit -m $message
git status

echo "Press enter to continue"
$key = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
if ($key.VirtualKeyCode -eq 13) {

    Write-Host "Upload rep"
}

git push git@github.com:grigoriy-st/Scripts.git


echo "SUCCESS"
Start-Sleep -s 4