@echo off
setlocal enabledelayedexpansion

if "%SetDefaultBrowser_DebugLevel%"=="3" (
  call :debug
  goto :done
)

rem :: SetDefaultBrowser "C:\path\to\browser.exe" --some --optional --switches

set browser_path=%~1

if not defined browser_path (
  echo ERROR: path to new default browser is not defined
  goto :done
)

if not defined SetDefaultBrowser_DebugLevel if not exist "%browser_path%" (
  echo ERROR: path to new default browser does not exist
  goto :done
)

set browser_opts=%*
if defined browser_opts set browser_opts=!browser_opts:"%browser_path%"=!
if defined browser_opts set browser_opts=!browser_opts:'%browser_path%'=!
if defined browser_opts set browser_opts=!browser_opts:%browser_path%=!
if defined browser_opts for /f "tokens=* delims= " %%a in ("!browser_opts!") do set browser_opts=%%a

set browser_path=%browser_path:\=\\%
if defined browser_opts set browser_opts=!browser_opts:\=\\!
if defined browser_opts set browser_opts=!browser_opts:"=\\\"!

set PATH=%~dp0..\tools;%PATH%

set reg_tpl="%~dp0..\tpl\%~n0.reg.tpl"
set reg_tmp="%~dp0..\tmp\%~n0.reg"

if exist %reg_tmp% del %reg_tmp% >NUL 2>NUL
copy %reg_tpl% %reg_tmp% >NUL 2>NUL

rem :: search  = {{browser_path}}
rem :: replace = %browser_path%
fart.exe -q -- %reg_tmp% "{{browser_path}}" "%browser_path%" >NUL 2>NUL

rem :: search  = {{browser_opts}}
rem :: replace = !browser_opts!
if defined browser_opts (
  fart.exe -q -- %reg_tmp% "{{browser_opts}}" "!browser_opts!" >NUL 2>NUL
) else (
  fart.exe -q --remove -- %reg_tmp% " {{browser_opts}}" >NUL 2>NUL
)

if "%SetDefaultBrowser_DebugLevel%"=="2" goto :done

regedit /S %reg_tmp%

if "%SetDefaultBrowser_DebugLevel%"=="1" call :debug

goto :done

:debug
  call :debug_key "HKEY_CURRENT_USER\Software\Classes\ftp\DefaultIcon"
  call :debug_key "HKEY_CURRENT_USER\Software\Classes\ftp\shell\open\command"
  call :debug_key "HKEY_CURRENT_USER\Software\Classes\http\DefaultIcon"
  call :debug_key "HKEY_CURRENT_USER\Software\Classes\http\shell\open\command"
  call :debug_key "HKEY_CURRENT_USER\Software\Classes\https\DefaultIcon"
  call :debug_key "HKEY_CURRENT_USER\Software\Classes\https\shell\open\command"
  call :debug_key "HKEY_LOCAL_MACHINE\Software\Classes\ftp\DefaultIcon"
  call :debug_key "HKEY_LOCAL_MACHINE\Software\Classes\ftp\shell\open\command"
  call :debug_key "HKEY_LOCAL_MACHINE\Software\Classes\http\DefaultIcon"
  call :debug_key "HKEY_LOCAL_MACHINE\Software\Classes\http\shell\open\command"
  call :debug_key "HKEY_LOCAL_MACHINE\Software\Classes\https\DefaultIcon"
  call :debug_key "HKEY_LOCAL_MACHINE\Software\Classes\https\shell\open\command"
  goto :eof

:debug_key
  set key=%~1
  set val=

  echo [%key%]:
  for /f "delims=" %%a in ('reg query "%key%" /ve 2^>NUL') do set val=%%a
  if ERRORLEVEL 1 (
    echo   not found
  ) else if not defined val (
    echo   not found
  ) else (
    rem :: skip first 27 chars: "    (Default)    REG_SZ    "
    echo   !val:~27!
  )
  echo.
  goto :eof

:done
  endlocal
