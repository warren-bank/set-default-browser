@echo off

set SetDefaultBrowser_DebugLevel=1

call "%~dp0..\.common\env.bat"

call SetDefaultBrowser "C:\PortableApps\Firefox\47.0.1\FirefoxPortable.exe" >"%~dp0.\test.log" 2>&1
