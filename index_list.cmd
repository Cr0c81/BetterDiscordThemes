type index0.txt>index.html
dir *.jpg *.png *.jpeg /b > filelist.txt
//rem for /F "eol=; tokens=*" %%i in (filelist.txt) do echo ^<img src=%%i width=256px onclick=CopyToClipboard("%%i")^>^<br^>%%i^<br^> >>index.html
for /F "eol=; tokens=*" %%i in (filelist.txt) do echo ^<table style="display:inline-grid;" class="imgtd"^>^<tr^>^<th^>^<img src=%%i width=256px onclick=CopyToClipboard("%%i") class="imgel"^>^</th^>^</tr^>^<tr^>^<th^>%%i^</th^>^</tr^>^</tr^>^</table^> >>index.html
rem for /F "eol=; tokens=*" %%i in (filelist.txt) do echo ^<table style="display:block;" class="imgtd"^>^<tr^>^<img src=%%i width=256px onclick=CopyToClipboard("%%i")^>^</tr^>^<tr^>%%i^</tr^>^</tr^>^</table^> >>index.html
type index1.txt>>index.html
del filelist.txt