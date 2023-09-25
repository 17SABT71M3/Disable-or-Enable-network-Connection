REM BCDEDIT /ENUM 2>nul 1>nul
REM cls
REM I AM A CHRISTIAN 
REM ****************

REM First
echo off
BCDEDIT /ENUM 2>nul 1>nul
cls
IF %ERRORLEVEL%==0 echo off& cls&title Main&echo.------------Welcome!---------------&echo.            to&echo.              Net Disabler&timeout 2 >NUL
IF %ERRORLEVEL%==1 TITLE User Mode.&echo off&cls&echo. ----------------------------------------------------------------------------------&echo.^|This script cannot make changes to the Network without Administrative Priveleges ^|&echo. ----------------------------------------------------------------------------------&echo.&echo.What can you do:&echo.Run this script with administrative priveleges Next time ;)&timeout 1 >nul&echo (right-click bat file and select "Run as Administrator)"&echo.Press any key to continue running anyway&pause >NUL
set /a helper_interval=1600
set /a break_interval=2
REM set break_interval=0 to skip early messages..
REM If helper is not clearing up files/cleaning
REM please adjust above variable helper_interval to make it 
REM make it shorter/longer if it still works for you
REM In Milliseconds
@echo off 
title Starting...
mode 30,20
echo.=== ATTENTION ===
echo.
echo./* initiating
echo.   junk clean-up ! 
echo.
echo. 
echo.  Helper files
echo.need to be cleaned.
echo.
echo. 
echo. using a helper window
echo.~~
echo.--------------------------
ECHO.if files are not removed
echo.increase %%helper_interval%% 
echo.variable
echo. --------------------------
echo.Helper 
color B1 
timeout %break_interval% >NUL
set /a randum=%random%
REM start cmd /c "mode 57,7& echo off &cls & title The_Watcher&timeout 7 >NUL& del Delete_me_Csv.netcon.%randum%.CSV"
set FILE_1=Delete_me_Csv.netcon.%randum%.CSV
echo csvFileName = "%FILE_1%"  >>PARENT_FAWNER_%RANDUM%.VBS 
echo childScriptContent = _  >>PARENT_FAWNER_%RANDUM%.VBS 
echo "WScript.Sleep %helper_interval%" ^& vbCrLf ^& _  >>PARENT_FAWNER_%RANDUM%.VBS 
echo "Set objFSO = CreateObject(""Scripting.FileSystemObject"")" ^& vbCrLf ^& _  >>PARENT_FAWNER_%RANDUM%.VBS 
echo "If objFSO.FileExists(""" ^& csvFileName ^& """) Then" ^& vbCrLf ^& _  >>PARENT_FAWNER_%RANDUM%.VBS 
echo "   objFSO.DeleteFile(""" ^& csvFileName ^& """)" ^& vbCrLf ^& _  >>PARENT_FAWNER_%RANDUM%.VBS 
echo "End if" ^& vbCrLf ^& _  >>PARENT_FAWNER_%RANDUM%.VBS 
echo "objFSO.DeleteFile(WScript.ScriptFullName)"  >>PARENT_FAWNER_%RANDUM%.VBS 
echo childScriptFileName = "delete_me_%randum%.vbs"  >>PARENT_FAWNER_%RANDUM%.VBS 
echo Set objFSO = CreateObject("Scripting.FileSystemObject")  >>PARENT_FAWNER_%RANDUM%.VBS 
echo Set objFile = objFSO.CreateTextFile(childScriptFileName, True)  >>PARENT_FAWNER_%RANDUM%.VBS 
echo objFile.Write childScriptContent  >>PARENT_FAWNER_%RANDUM%.VBS 
echo objFile.Close  >>PARENT_FAWNER_%RANDUM%.VBS 
echo Set objShell = CreateObject("WScript.Shell")  >>PARENT_FAWNER_%RANDUM%.VBS 
echo objShell.Run childScriptFileName, 0, False  >>PARENT_FAWNER_%RANDUM%.VBS 
start cmd /c "echo off &title Running VBS script...& ( for /l %%i in (1,1,50) do type delete_me_%randum%.vbs ) &cls& color C2 & ( for /l %%i in (1,1,20) do echo ALL the JUNK Files ARE Going To BE Deleted!  )"
wscript PARENT_FAWNER_%RANDUM%.VBS 
rem mode 35,8 
echo off
title Watcher

color F

wmic nic get netconnectionid,netconnectionstatus,netenabled /format:CSV >> Delete_me_Csv.netcon.%randum%.CSV
type Delete_me_Csv.netcon.%randum%.CSV | find /v "NetConnectionID,NetConnectionStatus,NetEnabled" >> Delete_me_Csv.netcon.%randum%2.CSV

ECHO OFF
CLS
title Enable Disable Network
echo.**************************************************************
echo. Disable/Enable
echo.--------------------------------------------------------------
setlocal enabledelayedexpansion
set list=
set /a counter=0
mode 40,20
for /f "delims=" %%i in (Delete_me_Csv.netcon.%randum%2.CSV) do for /f "tokens=1,2,3,4 delims=," %%a in ("%%i") do if "%%b" NEQ "" set interface[!counter!]=%%b&set /a counter+=1
REM echo. There are !counter! results. Here are the names-
set /a counter=counter-1
for /l %%i in (0,1,!counter!) do set temp=!interface[%%i]!&set ptr[%%i]=!temp:^&amp^;=^&!

for /l %%i in (0,1,!counter!) do echo %%i.!ptr[%%i]!
del Delete_me_Csv.netcon.%randum%2.CSV
del PArENT_FAWNER_%RANDUM%.VBS 

:tryagain
set /a x=1
set /p delet=
set delet="%delet%"
set delet=%delet:^=^^%
set delet=%delet:^=^^^=%
set delet=%delet:&=^&%
set delet=%delet:`=``%
set delet=%delet:>=^>%
set delet=%delet:\=\\"%
set delet=%delet:"=%

if "!delet!"=="" (ECHO EMPTY STRING& GOTO tryAGAIN)

for /f %%i in ('powershell -c "\""%delet%"\" -match '^[0-9]$'"') do set stat=%%i


if "%stat%"=="True" (Echo.) Else (Echo.Please Enter A Choice.&Goto tryagain)

for /f %%i in ('powershell -c "$str=%delet%;write-host $str"') do set number=%%i
if !number! LEQ !counter! (echo.GoodChoice 1>NUL) else (echo.Invalid Number&goto tryagain)
set interface2day=!ptr[%number%]!
title. Choose Enable or Disable
echo.Chosen Interface !!interface2day!!
CALL :again "!!interface2day!!"
EndLocal
setlocal Enabledelayedexpansion

:again
echo.xXx
set well_received=%~1
echo. %well_received%
set good_works=%well_received%
echo.^(1^)Disable
echo.^(2^)Enable

set /a x=1
set /p delet=
set delet="%delet%"

set delet=%delet:^=^^%

set delet=%delet:^=^^^=%

set delet=%delet:&=^&%

set delet=%delet:`=``%

set delet=%delet:>=^>%

set delet=%delet:\=\\"%

set delet=%delet:"=%


if "!delet!"=="" (ECHO EMPTY STRING& GOTO AGAIN)

for /f %%i in ('powershell -c "\""%delet%"\" -match '^[0-9]$'"') do set stat=%%i


if "%stat%"=="True" (Echo.) Else (Echo.Please Enter A Choice.&Goto again)

for /f %%i in ('powershell -c "$str=%delet%;write-host $str"') do set number=%%i
if !number!==1 (goto disable)
if !number!==2 (goto enable) else (goto Invalid Choice&goto again)
:disable
echo.Disabling..
echo. netsh interface set interface "%good_works%" disable
netsh interface set interface "%good_works%" disable
goto eof
Rem.netsh interface set interface "%good_works%" disable 2>&1>con
:enable
echo.Enabling...
netsh interface set interface "%good_works%" enable

:eof
Pause >nul
