@echo off

set SetDefaultBrowser_DebugLevel=2

call "%~dp0..\.common\env.bat"

call SetDefaultBrowser "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory="C:\.chrome\profiles\01" >"%~dp0.\test.log" 2>&1

move "%BASEDIR%\tmp\SetDefaultBrowser.reg" "%~dp0.\test.reg"
