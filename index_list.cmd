echo off
type index0.txt>index.html
dir /A:D /B > dirs.txt
for /F "eol=; tokens=*" %%i in (dirs.txt) do if NOT "%%i"==".idea" if NOT "%%i"=="fonts" if NOT "%%i"==".git" if NOT "%%i"=="iptv" CALL :create_filelist %%i

type index1.txt>>index.html
del dirs.txt
goto exit

:create_filelist
SETLOCAL
set DIR=%1
cd %DIR%
dir *.jpg *.png *.jpeg /b /O:N > filelist.txt
echo ^<details^>^<summary^>%DIR%^</summary^> >>..\index.html
for /F "eol=; tokens=*" %%i in (filelist.txt) do echo ^<table style="display:inline-grid;" class="imgtd"^>^<tr^>^<th^>^<img src=%DIR%/%%i width=256px onclick=CopyToClipboard("%DIR%/%%i") class="imgel"^>^</th^>^</tr^>^<tr^>^<th^>%%i^</th^>^</tr^>^</tr^>^</table^> >>..\index.html
echo ^</details^> >>..\index.html
del filelist.txt
cd..
ENDLOCAL

:exit