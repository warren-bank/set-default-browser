@echo off

set SetDefaultBrowser_DebugLevel=1

call "%~dp0..\.common\env.bat"

call SetDefaultBrowser "C:\PortableApps\SRWare Iron\67.0.3500.0\IronPortable.exe" >"%~dp0.\test.log" 2>&1
