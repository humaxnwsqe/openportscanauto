@echo off
echo "-----------------------------------------------------"
echo "port scanning (WAN/TCPALL) start!(IPv4)-----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR WAN TCPALL IPv4 221.140.31.187
echo "-----------------------------------------------------"
echo "port scanning (WAN/TCPALL) end!(IPv4)-------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (WAN/INTENSE) start!(IPv4)-----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR WAN INTENSE IPv4 221.140.31.187
echo "-----------------------------------------------------"
echo "port scanning (WAN/INTENSE) end!(IPv4)-------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (WAN/UDPALL) start!(IPv4)-----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
echo cmd.exe /C nmapcmdlists.bat HGJ310_BR WAN UDPALL IPv4 221.140.31.187
echo "-----------------------------------------------------"
echo "port scanning (WAN/UDPALL) end!(IPv4)-------------------"
timeout 5

echo "-----------------------------------------------------"
echo "port scanning (WAN/TCPALL) start!(IPv6)-----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR WAN TCPALL IPv6 2001:2b8:54:c00a:45bc:9ae5:4ef4:84f1
echo "-----------------------------------------------------"
echo "port scanning (WAN/TCPALL) end!(IPv6)-------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (WAN/INTENSE) start!(IPv6)-----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C nmapcmdlists.bat HGJ310_BR WAN INTENSE IPv6 2001:2b8:54:c00a:45bc:9ae5:4ef4:84f1
echo "-----------------------------------------------------"
echo "port scanning (WAN/INTENSE) end!(IPv6)-------------------"
timeout 5
echo "-----------------------------------------------------"
echo "port scanning (WAN/UDPALL) start!(IPv6)-----------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
echo cmd.exe /C nmapcmdlists.bat HGJ310_BR WAN UDPALL IPv6 2001:2b8:54:c00a:45bc:9ae5:4ef4:84f1
echo "-----------------------------------------------------"
echo "port scanning (WAN/UDPALL) end!(IPv6)-------------------"
timeout 5



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
