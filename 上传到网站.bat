@echo off
rem ============================================================
rem  cf4ke 一键上传：把本文件夹推送到 GitHub（机房可访问）
rem  用法：把新材料丢进 D:\cf4ke 后，双击本文件即可
rem ============================================================
chcp 65001 >nul
cd /d D:\cf4ke

echo [1/3] staging files...
git add -A

echo [2/3] commit...
git commit -m "update %date% %time%"

echo [3/3] push to GitHub...
git push

echo.
echo Done. Website: https://YOUR-USERNAME.github.io/cf4ke/
echo Repo:     https://github.com/YOUR-USERNAME/cf4ke
pause
