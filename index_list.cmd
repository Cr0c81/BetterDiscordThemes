type index0.txt>index.html
dir *.jpg /b > filelist.txt
for /F "eol=; tokens=*" %%i in (filelist.txt) do echo "<img src=%%i><h4>%%i</h4>">>index.html
type index1.txt>>index.html