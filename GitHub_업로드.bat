@echo off
setlocal
cd /d "%~dp0"
title Trickster RPG V7 - Upload to GitHub
where git >nul 2>nul
if errorlevel 1 (
 echo Git is not installed. Install Git for Windows first: https://git-scm.com/download/win
 pause
 exit /b 1
)
if exist .git (
 echo This folder already contains a Git repository. No changes made.
 pause
 exit /b 1
)
echo Target: https://github.com/harima-de/trickster-rpg
echo This will upload files to the NEW trickster-rpg repository.
echo The existing trickster-clicker repository will not be touched.
choice /c YN /m "Proceed"
if errorlevel 2 exit /b 0
git init -b main
if errorlevel 1 goto fail
git remote add origin https://github.com/harima-de/trickster-rpg.git
if errorlevel 1 goto fail
git add .
if errorlevel 1 goto fail
git -c user.name="Trickster RPG" -c user.email="trickster-rpg@users.noreply.github.com" commit -m "Add Trickster RPG V7 web game"
if errorlevel 1 goto fail
git push -u origin main
if errorlevel 1 goto fail
echo.
echo SUCCESS. GitHub upload completed.
pause
exit /b 0
:fail
echo.
echo Upload could not be completed. Copy the error and send it in chat.
pause
exit /b 1
