@echo off
echo "-----------------------------------------------------"
echo "port scanning start!(IPv4)---------------------------"
echo "-----------------------------------------------------"
echo "port scanning (LAN/TCPALL) start!(IPv4)--------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR LAN TCPALL IPv4 192.168.0.1 
echo "-----------------------------------------------------"
echo "port scanning (LAN/TCPALL) end!(IPv4)----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (LAN/INTENSE) start!(IPv4)--------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR LAN INTENSE IPv4 192.168.0.1
echo "-----------------------------------------------------"
echo "port scanning (LAN/INTENSE) end!(IPv4)----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (LAN/UDPALL) start!(IPv4)--------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
echo cmd.exe /C nmapcmdlists.bat HGJ310_BR LAN UDPALL IPv4 192.168.0.1
echo "-----------------------------------------------------"
echo "port scanning (LAN/UDPALL) end!(IPv4)----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
echo timeout 5

echo "-----------------------------------------------------"
echo "port scanning start!(IPv6)---------------------------"
echo "-----------------------------------------------------"
echo "port scanning (LAN/TCPALL) start!(IPv6)--------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR LAN TCPALL IPv6 2001:2b8:54:ca00::1
echo "-----------------------------------------------------"
echo "port scanning (LAN/TCPALL) end!(IPv6)----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (LAN/INTENSE) start!(IPv6)--------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR LAN INTENSE IPv6 2001:2b8:54:ca00::1
echo "-----------------------------------------------------"
echo "port scanning (LAN/INTENSE) end!(IPv6)----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (LAN/UDP) start!(IPv6)-----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
echo cmd.exe /C nmapcmdlists.bat HGJ310_BR LAN UDPALL IPv6 2001:2b8:54:ca00::1
echo "-----------------------------------------------------"
echo "port scanning (LAN/UDP) end!(IPv6)-------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
echo timeout 5


echo %DATE%_%TIME%
echo "-----------------------------------------------------"
timeout 5
echo "-----------------------------------------------------"
echo "convert from xml files to html!"
echo "-----------------------------------------------------"
python .\convert_xmltohtml.py
echo "-----------------------------------------------------"
echo "send html files by email!"
echo "-----------------------------------------------------"
timeout 5
python .\sendemail_html.py
echo "-----------------------------------------------------"
echo "all steps finished!"
echo "-----------------------------------------------------"
