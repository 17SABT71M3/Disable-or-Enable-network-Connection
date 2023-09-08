set /a randum=%random%
wmic nic get netconnectionid,netconnectionstatus,netenabled /format:CSV >> CSV.NET_ID.NETCONN.%randum%.CSV
type CSV.NET_ID.NETCONN.%randum%.CSV | find /v "NetConnectionID,NetConnectionStatus,NetEnabled" >> CSV.NET_ID.NETCONN.%randum%2.CSV
del CSV.NET_ID.NETCONN.%randum%.CSV 
ECHO OFF
CLS
setlocal enabledelayedexpansion
set list=
set /a counter=0

for /f "delims=" %%i in (CSV.NET_ID.NETCONN.%randum%2.CSV) do for /f "tokens=1,2,3,4 delims=," %%a in ("%%i") do if "%%b" NEQ "" set interface[!counter!]=%%b&set /a counter+=1
REM echo. There are !counter! results. Here are the names-
set /a counter=counter-1
for /l %%i in (0,1,!counter!) do set temp=!interface[%%i]!&set ptr[%%i]=!temp:^&amp^;=^&!

for /l %%i in (0,1,!counter!) do echo %%i.!ptr[%%i]!
del CSV.NET_ID.NETCONN.%randum%2.CSV

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
echo.Chosen Interface !!interface2day!!
CALL :again "!!interface2day!!"
EndLocal
setlocal Enabledelayedexpansion

:again
echo.GERE
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
