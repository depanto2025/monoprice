@echo off
chcp 65001 > nul
title UPLOAD MONOPRICE WEBSITE TO GITHUB
cd /d "%~dp0"

echo ==============================================================================
echo             🌐 UPLOAD MONOPRICE WEBSITE TO GITHUB PAGES 🌐
echo ==============================================================================
echo  This tool will upload all website files in this folder to your GitHub repo.
echo ==============================================================================
echo.
set /p repourl="Enter your GitHub Repository URL (e.g. https://github.com/USER/monoprice-web.git): "

if "%repourl%"=="" (
    echo No repository URL provided. Aborting.
    pause
    exit /b
)

echo.
echo Initializing Git repository...
git init
git add .
git commit -m "Deploy MONOPRICE Web Production Build"
git branch -M main
git remote remove origin 2>nul
git remote add origin %repourl%

echo.
echo Pushing to GitHub (you may be asked to authenticate in your browser)...
git push -u origin main --force

echo.
echo ==============================================================================
echo  Done! Now enable GitHub Pages:
echo  1. Open your repository on GitHub.
echo  2. Go to Settings -> Pages.
echo  3. Under 'Source', select 'Deploy from a branch' -> branch 'main' -> / (root).
echo  4. Click Save. Your website will be live in 1-2 minutes!
echo ==============================================================================
pause

