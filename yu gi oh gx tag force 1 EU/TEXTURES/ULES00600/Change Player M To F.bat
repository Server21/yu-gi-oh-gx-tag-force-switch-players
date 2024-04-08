@echo off

set "input_file=textures.ini"
set "temp_file=%input_file%.tmp"

if exist "%temp_file%" del "%temp_file%"

(for /f "tokens=*" %%a in ('type "%input_file%"') do (
    set "line=%%a"
    setlocal enabledelayedexpansion
    
    rem Sostituzione M1 con F1 e viceversa
    set "line=!line:M1=|M1|!"
    set "line=!line:F1=M1!"
    set "line=!line:|M1|=F1!"

    rem Sostituzione IconM con IconF e viceversa
    set "line=!line:IconM=|IconM|!"
    set "line=!line:IconF=IconM!"
    set "line=!line:|IconM|=IconF!"

    echo !line!
    endlocal
)) > "%temp_file%"

move /y "%temp_file%" "%input_file%" >nul

echo change the last two values manually textures.ini i.e. Icon M1 to Icon F1 and inverse
pause
