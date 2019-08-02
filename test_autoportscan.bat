@echo off
echo "-----------------------------------------------------"
echo "port scanning start!---------------------------------"
echo "-----------------------------------------------------"
echo "port scanning (LAN/TCP) start!-----------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C test_portscan.bat t9x LAN TCP 192.168.1.1
echo "-----------------------------------------------------"
echo "port scanning (LAN/TCP) end!-------------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
sleep 10
echo "-----------------------------------------------------"
echo "port scanning (LAN/UDP) start!-----------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C test_portscan.bat t9x LAN UDP 192.168.1.1
echo "-----------------------------------------------------"
echo "port scanning (LAN/UDP) end!-------------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
sleep 10
echo "-----------------------------------------------------"
echo "port scanning (WAN/TCP) start!-----------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C test_portscan.bat t9x WAN TCP 221.140.31.202
echo "-----------------------------------------------------"
echo "port scanning (WAN/TCP) end!-------------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
sleep 10
echo "-----------------------------------------------------"
echo "port scanning (WAN/UDP) start!-----------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
cmd.exe /C test_portscan.bat t9x WAN UDP 221.140.31.202
echo "-----------------------------------------------------"
echo "port scanning (WAN/UDP) end!-------------------------"
echo %DATE%_%TIME%
echo "-----------------------------------------------------"
sleep 10
echo "-----------------------------------------------------"
echo "convert from xml files to html!"
echo "-----------------------------------------------------"
pytest .\convert_xmltohtml.py
echo "-----------------------------------------------------"
echo "send html files by email!"
echo "-----------------------------------------------------"
sleep 10
pytest .\sendemail_html.py
echo "-----------------------------------------------------"
echo "all steps finished!"
echo "-----------------------------------------------------"