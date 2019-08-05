@echo off 
:: port scanning automation script 

:: python .\test_emailsend.py
:: (Case 1) LAN, TCP   
:: .\nmap -p 1-15535 -T4 -A -v 192.168.0.1 -oX result.xml
:: connection type: LAN, WAN
:: protocol type: TCP, UDP

set strLAN=LAN  
set strWAN=WAN
set strTCP=TCP
set strUDP=UDP
set strDATE=%DATE%
::echo %strDATE%

set strHOUR=%TIME:~0,2%
if "%strHOUR:~0,1%" == " " set strHOUR=0%strHOUR:~1,1%
::echo hour=%strHOUR%
set strMIN=%TIME:~3,2%
if "%strMIN:~0,1%" == " " set strMIN=0%strMIN:~1,1%
::echo min=%strMIN%
set strSEC=%TIME:~6,2%
if "%strSEC:~0,1%" == " " set strSEC=0%strSEC:~1,1%
::echo secs=%strSEC%

::set /p modName= Please write a model name. (e.g. HGJ310, HP610) :
::set /p conType= Please choose connection type. (e.g. LAN, WAN) :
::set /p protType= Please choose protocol type. (e.g. TCP, UDP) :
::set /p tarAddr= Please choose target address. (e.g. 192.168.0.1, 221.140.xxx,xxx) :


if "%1"=="" goto _ERROR
if "%2"=="" goto _ERROR
if "%3"=="" goto _ERROR
if "%4"=="" goto _ERROR


if %strLAN%==%2 (
    if %strTCP%==%3 (
        echo "-----LAN and TCP have chosen.-----"
        ::goto _TCP
        nmap -p 1-65535 -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_result.xml %4
    ) else (
        echo "-----LAN and UDP have chosen.-----"
        ::goto _UDP
        nmap -p 1-65535 -sU -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_result.xml %4
    )  
) else (
    if %strTCP%==%3 (
        echo "-----WAN and TCP have chosen.-----"
        ::goto _TCP
        nmap -p 1-65535 -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_result.xml %4
    ) else (
        echo "-----WAN and UDP have chosen.-----"
        ::goto _UDP
        nmap -p 1-65535 -sU -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_result.xml %4
    )
)

goto _QUIT


rem:_TCP
::nmap -p 1-65535 -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_result.xml %4
::goto _QUIT

rem:_UDP
::nmap -p 1-65535 -sS -sU -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_result.xml %4
::goto _QUIT



:_ERROR
echo "-------------------------------------------------------------------------------"
echo "Please type input values like an example.                                      "
echo "e.g. *.bat HGJ310 LAN TCP 192.168.1.1                                          "
echo "In 1st value, please write a model name. (e.g. HGJ310, HP610)                  "
echo "In 2nd value, Please choose connection type. (e.g. LAN, WAN)                   "
echo "In 3rd value, please choose protocol type. (e.g. TCP, UDP)                     "
echo "In 4th value, please choose target address. (e.g. 192.168.0.1, 221.140.xxx,xxx)"
echo "-------------------------------------------------------------------------------"
goto _QUIT


:_QUIT