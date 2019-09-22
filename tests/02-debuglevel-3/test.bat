@echo off

set SetDefaultBrowser_DebugLevel=3

call "%~dp0..\.common\env.bat"

call SetDefaultBrowser >"%~dp0.\test.log" 2>&1
