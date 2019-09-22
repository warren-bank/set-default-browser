@echo off

call "%~dp0..\.common\env.bat"

call SetDefaultBrowser "%~dp0.\does-not-exist.exe" >"%~dp0.\test.log" 2>&1
