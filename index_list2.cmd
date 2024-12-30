@echo off
set iview=d:\Total Commander\IrfanView\i_view64.exe
type index0.html>index.html
dir /A:D /B > dirs_temp.txt
del _data\dirs.txt
for /F "eol=; tokens=*" %%i in (dirs_temp.txt) do if NOT "%%i"==".idea" if NOT "%%i"=="fonts" if NOT "%%i"==".git" if NOT "%%i"=="iptv" IF NOT "%%i"=="_data" CALL :create_filelist %%i

type index1.html>>index.html
del dirs_temp.txt
goto exit

:create_filelist
echo %1
echo %1>>_data\dirs.txt
SETLOCAL
set DIR=%1
cd %DIR%
dir *.jpg *.png *.jpeg /b /O:N>..\_data\%1.txt
if NOT exist preview mkdir preview
for /F "eol=; tokens=*" %%i in (..\_data\%1.txt) do CALL :convert %1 %%i
cd..
ENDLOCAL

:exit

:convert
SET var=%cd%
if NOT ["%2"]==[""] "%iview%" %var%\%2 /silent /resize_long=512 /aspectratio /convert="%var%\preview\%2"