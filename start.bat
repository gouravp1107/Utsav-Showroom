@echo off
title Utsav Website Server
cd /d "%~dp0backend"
where node >nul 2>nul || (echo Please install Node.js from https://nodejs.org and run again. & pause & exit /b)
start "" http://localhost:3000
node server.js
pause
