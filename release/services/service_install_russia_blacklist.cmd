@ECHO OFF
PUSHD "%~dp0"
set _arch=x86
IF "%PROCESSOR_ARCHITECTURE%"=="AMD64" (set _arch=x86_64)
IF DEFINED PROCESSOR_ARCHITEW6432 (set _arch=x86_64)

echo This script should be run with administrator privileges.
echo Right click - run as administrator.
echo Press any key if you're running it as administrator.
pause
sc stop "LavenesDPI"
sc delete "LavenesDPI"
sc create "LavenesDPI" binPath= "\"%CD%\%_arch%\lavenesdpi.exe\" -1 --blacklist \"%CD%\blacklist.txt\"" start= "demand"
sc description "LavenesDPI" "Passive Deep Packet Inspection blocker and Active DPI circumvention utility"
sc start "LavenesDPI"

POPD
