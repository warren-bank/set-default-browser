@echo off

set SetDefaultBrowser_DebugLevel=2

call "%~dp0..\.common\env.bat"

call SetDefaultBrowser "C:\PortableApps\GoogleChromePortable\GoogleChromePortable.exe" --check-for-update-interval=220752000 >"%~dp0.\test.log" 2>&1

move "%BASEDIR%\tmp\SetDefaultBrowser.reg" "%~dp0.\test.reg"
