type index0.txt>index.html
dir *.jpg *.png *.jpeg /b > filelist.txt
for /F "eol=; tokens=*" %%i in (filelist.txt) do echo ^<img src=%%i width=256px onclick=CopyToClipboard("%%i")^>^<br^>%%i^<br^> >>index.html
type index1.txt>>index.html
del filelist.txt