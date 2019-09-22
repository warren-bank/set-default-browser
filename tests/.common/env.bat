@echo off

set _cd=%cd%
cd /D "%~dp0..\.."
set BASEDIR=%cd%
cd /D "%_cd%"
set _cd=

set PATH=%BASEDIR%\bin;%PATH%
