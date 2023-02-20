@echo off 


taskkill /f /im explorer.exe

timeout /t 2 /nobreak >nul
::C:\Users\%USERNAME%\Desktop
set "desktopSubPath=Desktop"
set "documentSubPath=Document"
set "pictureSubPath=Pictures"
set "musicSubPath=Music"
set "videoSubPath=Videos"


set desktopPath="%UserProfile%\%desktopSubPath%"
set documentPath="%UserProfile%\%documentSubPath%"
set picturePath="%UserProfile%\%pictureSubPath%"
set musicPath="%UserProfile%\%musicSubPath%"
set videoPath="%UserProfile%\%videoSubPath%"

::echo "%%USERPROFILE%%\%desktopSubPath%"
::echo %desktopPath%
::goto done
if not exist %desktopPath% mkdir %desktopPath%
if not exist %documentPath% mkdir %documentPath%
if not exist %picturePath% mkdir %picturePath%
if not exist %musicPath% mkdir %musicPath%
if not exist %videoPath% mkdir %videoPath%



:: Desktop
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop" /t REG_SZ /d "%desktopPath%" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Desktop" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\%desktopSubPath%" /f

:: Document
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Personal" /t REG_SZ /d "%documentPath%" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Personal" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\%documentSubPath%" /f

:: My Pictures
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Pictures" /t REG_SZ /d "%picturePath%" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Pictures" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\%pictureSubPath%" /f

:: My Music
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Music" /t REG_SZ /d "%musicPath%" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Music" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\%musicSubPath%" /f

:: My Video
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "My Video" /t REG_SZ /d "%videoPath%" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "My Video" /t REG_EXPAND_SZ /d "%%USERPROFILE%%\%videoSubPath%" /f





attrib -r -s -h "%desktopPath%" /S /D
attrib -r -s -h "%picturePath%" /S /D
attrib -r -s -h "%documentPath%" /S /D
attrib -r -s -h "%musicPath%" /S /D
attrib -r -s -h "%videoPath%" /S /D

timeout /t 1 /nobreak >nul

start explorer.exe

pause