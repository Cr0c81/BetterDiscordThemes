@echo off
set iview=d:\Total Commander\IrfanView\i_view64.exe
dir /A:D /B > dirs_temp.txt
del _data\dirs.html
for /F "eol=; tokens=*" %%i in (dirs_temp.txt) do if NOT "%%i"==".idea" if NOT "%%i"=="fonts" if NOT "%%i"==".git" if NOT "%%i"=="iptv" IF NOT "%%i"=="_data" CALL :create_filelist %%i

del dirs_temp.txt
goto exit

:create_filelist
echo %1
echo %1>>_data\dirs.html
SETLOCAL
set DIR=%1
cd %DIR%
dir *.jpg *.png *.jpeg /b /O:N>..\_data\%1.html
if NOT exist preview mkdir preview
for /F "eol=; tokens=*" %%i in (..\_data\%1.html) do CALL :convert %1 %%i
cd..
ENDLOCAL

:exit

:convert
SET var=%cd%
if NOT ["%2"]==[""] "%iview%" %var%\%2 /silent /resize_long=512 /aspectratio /convert="%var%\preview\%2"