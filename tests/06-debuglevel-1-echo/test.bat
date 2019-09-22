@echo off

set SetDefaultBrowser_DebugLevel=1

call "%~dp0..\.common\env.bat"

call SetDefaultBrowser "%BASEDIR%\tools\echo.exe" \a >"%~dp0.\test.log" 2>&1

explorer "https://play.alert/bell"
