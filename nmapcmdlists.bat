@echo off 
:: port scanning automation script 

:: python .\test_emailsend.py
:: (Case 1) LAN, TCP   
:: .\nmap -p 1-15535 -T4 -A -v 192.168.0.1 -oX result.xml
:: connection type: LAN, WAN
:: protocol type: TCP, UDP

set strLAN=LAN  
set strWAN=WAN
set strTCPALL=TCPALL
set strUDPALL=UDPALL
:: An option for 'Intense Scan Plus UDP' which is in zenmap
set strINTENSE=INTENSE

set strIPv4=IPv4
set strIPv6=IPv6

set strDATE=%DATE%

echo "'''''''''''''''"
echo %1
echo %2
echo %3
echo %4
echo %5
echo "'''''''''''''''"

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
::set /p protType= Please choose protocol type. (e.g. TCPALL, UDPALL, INTENSE) :
::set /p tarAddr= Please choose target address. (e.g. 192.168.0.1, 221.140.xxx,xxx, 2001:2B8:54:xxxx::x, ...) :


if "%1"=="" goto _ERROR
if "%2"=="" goto _ERROR
if "%3"=="" goto _ERROR
if "%4"=="" goto _ERROR
if "%5"=="" goto _ERROR


:: IPv4 Case
if %strIPv4%==%4 (
    if %strLAN%==%2 (
        if %strTCPALL%==%3 (
            echo "-----IPv4 LAN and TCP for all port have chosen.-----"
            ::goto _TCP
            nmap -p 1-65535 -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %5 -d
        ) else (
            if %strUDPALL%==%3 (
                echo "-----IPv4 LAN and UDP for all port have chosen.-----"
                ::goto _UDP
                nmap -p 1-65535 -sU -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %5 -d
            ) else (
                echo "-----IPv4 LAN & Intense Scan plus UDP have chosen.-----"
                ::goto _UDP
                ::nmap -p 1-65535 -sU -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %4 -d
                nmap -sS -sU -T4 -A -v Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %5 -d
            )
        )  
    ) else (
        if %strTCPALL%==%3 (
            echo "-----IPv4 WAN and TCP for all port have chosen.-----"
            ::goto _TCP
            nmap -p 1-65535 -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %5 -d
        ) else (
            if %strUDPALL%==%3 (
                echo "-----IPv4 WAN and UDP for all port have chosen.-----"
                ::goto _UDP
                nmap -p 1-65535 -sU -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %5 -d
            ) else (
                echo "-----IPv4 WAN & Intense Scan plus UDP have chosen.-----"
                ::goto _UDP
                ::nmap -p 1-65535 -sU -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %4 -d
                nmap -sS -sU -T4 -A -v Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %5 -d
            )
        )
    )
)

::goto _QUIT

:: IPv6 Case
if %strIPv6%==%4 ( 
    if %strLAN%==%2 (
        if %strTCPALL%==%3 (
            echo "-----IPV6 LAN and TCP for all port have chosen.-----"
            ::goto _TCP
            nmap -6 -p 1-65535 -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv6%_result.xml %5 -d
        ) else (
            if %strUDPALL%==%3 (
                echo "-----IPv6 LAN and UDP for all port have chosen.-----"
                ::goto _UDP
                nmap -6 -p 1-65535 -sU -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv6%_result.xml %5 -d
            ) else (
                echo "-----IPv6 LAN & Intense Scan plus UDP have chosen.-----"
                ::goto _UDP
                ::nmap -p 1-65535 -sU -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %4 -d
                nmap -6 -sS -sU -T4 -A -v Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv6%_result.xml %5 -d
            )
        )  
    ) else (
        if %strTCPALL%==%3 (
            echo "-----IPv6 WAN and TCP for all port have chosen.-----"
            ::goto _TCP
            nmap -6 -p 1-65535 -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv6%_result.xml %5 -d
        ) else (
            if %strUDPALL%==%3 (
                echo "-----IPv6 WAN and UDP for all port have chosen.-----"
                ::goto _UDP
                nmap -6 -p 1-65535 -sU -T4 -A -v -Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv6%_result.xml %5 -d
            ) else (
                echo "-----IPv6 WAN & Intense Scan plus UDP have chosen.-----"
                ::goto _UDP
                ::nmap -p 1-65535 -sU -T4 -A -v -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv4%_result.xml %4 -d
                nmap -6 -sS -sU -T4 -A -v Pn -oX %1_%2_%3_%strDATE%_%strHOUR%-%strMIN%-%strSEC%_%strIPv6%_result.xml %5 -d
            )
            
        )
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
echo "e.g. *.bat HGJ310 LAN TCP 192.168.1.1 IPv4                                     "
echo "In 1st value, please write a model name. (e.g. HGJ310, HP610)                  "
echo "In 2nd value, Please choose connection type. (e.g. LAN, WAN)                   "
echo "In 3rd value, please choose protocol type. (e.g. TCP, UDP, INTENSE)            "
echo "In 4th value, please choose IPv6 or IPv4. (e.g. IPv4, IPv6)                    "
echo "In 5th value, please choose target address.                                    "
echo "(e.g. 192.168.0.1, 221.140.xxx,xxx, 2001:2B8:54:xxxx::x, ...)                  "
echo "-------------------------------------------------------------------------------"

goto _QUIT


:_QUIT