@echo off
rem Setup script for Windows consoles.
rem Can be run over and over if you need to. If you see it change when
rem you do a git pull, you should run it again.

where pip3
if ERRORLEVEL 1 echo ERROR: pip3 not found. Did you install Python 3.6 or higher? && exit /b 1

echo.
echo ==========================================================================
echo Ensuring we have needed Python packages:
echo   BiblioPixel - https://github.com/ManiacalLabs/BiblioPixel  
echo ==========================================================================
echo.
call pip3 install -U bibliopixel
if ERRORLEVEL 1 echo ERROR: pip3 install failed with errorlevel %ERRORLEVEL% && exit /b 1

echo.
echo ==========================================================================
echo Complete!
echo ==========================================================================
echo.
