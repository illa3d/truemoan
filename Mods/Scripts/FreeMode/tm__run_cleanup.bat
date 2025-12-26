@echo off
setlocal EnableDelayedExpansion

echo.
echo TrueMoan Cleanup, will delete obsolete files:
echo.

rem === File list, defined outside loops, each file on its own line ===
set FILES_LIST="tm_a_presets.lua"^
 "tm_a_presets_faunap.lua"^
 "tm_a_presets_illa3d.lua"^
 "tm_common_faunap.lua"^
 "tm_CONFIG.lua"^
 "tm_main README.txt"^
 "tm_main_freemodehg_faunap.lua"^
 "tm_main_freemodehg_faunap_readme.txt"^
 "tm_main_illa3d.lua"^
 "tm_main_illa3d_README.txt"^
 "tm_main_masterchief.lua"^
 "tm_main_masterchief_readme.txt"^
 "tm_menu_facelab_faunap.lua"^
 "tm_menu_illa3d.lua"

rem === Display file list ===
for %%F in (!FILES_LIST!) do echo %%~F

echo.
rem === Ask user using CHOICE with specific keys Y and N ===
choice /C YN /N /M "Delete [Y/N]"

if errorlevel 2 goto CANCEL
if errorlevel 1 goto DELETE

:DELETE
echo.
echo Deleting files...
for %%F in (!FILES_LIST!) do (
    if exist %%~F del /Q "%%~F"
)
echo Done.
goto :EOF

:CANCEL
echo.
echo Cleanup canceled.
goto :EOF
