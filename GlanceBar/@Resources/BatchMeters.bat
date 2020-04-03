
:: Use this script to create batches of meters with a numeric pattern.

@echo off
cls
title Batch Meters

:userCheck
if "%username%"=="Cyber" (
	goto start
) else (
	echo.
	echo This script was used for quick and easy duplication of meters during the development of this skin. 
	echo.
	echo It appears that you aren't Cyber, so there's really no point in running this.
	echo.
	echo If you still want to run the script, press a key.
	echo Otherwise, you may close this window.
	pause > nul
	goto start
)

:start
echo.
echo Creating meters...
echo If you see any text after this, check the code.

echo. > temp.txt

set temp=13
set temp2=2
:loop
(
	echo [Section%temp%B]
	echo Meter=Shape
	echo Container=SettingsContainer
	echo Shape=Rectangle -15,^([CategoryTitle2:Y]+[CategoryTitle2:H]+5+^(35*%temp2%^)^),260,35,18,18 ^| Fill Color 0,0,0,#Section%temp%BOpa# ^| StrokeWidth 0
	echo MouseActionCursor=0
	echo MouseOverAction=[!SetVariable #CURRENTSECTION#Opa "30"][!Update]
	echo MouseLeaveAction=[!SetVariable #CURRENTSECTION#Opa "0"][!Update]
	echo LeftMouseUpAction=[]
	echo DynamicVariables=1
	echo.
	echo [Section%temp%BIcon]
	echo Meter=String
	echo Container=SettingsContainer
	echo Text=
	echo X=35
	echo Y=^([CategoryTitle2:Y]+[CategoryTitle2:H]+24+^(35*%temp2%^)^)
	echo FontFace=Segoe MDL2 Assets
	echo FontSize=14
	echo FontColor=000000
	echo StringAlign=LeftCenter
	echo AntiAlias=1
	echo ClipString=2
	echo DynamicVariables=1
	echo.
	echo [Section%temp%BText]
	echo Meter=String
	echo Container=SettingsContainer
	echo Text=Volume
	echo X=15R
	echo Y=0r
	echo FontFace=Product Sans
	echo FontSize=10
	echo FontColor=000000
	echo StringAlign=LeftCenter
	echo AntiAlias=1
	echo ClipString=2
	echo DynamicVariables=1
	echo.
) >> temp.txt

set /a temp+=1
set /a temp2+=1
if %temp%==17 goto end
goto loop

:end
echo.
pause
exit