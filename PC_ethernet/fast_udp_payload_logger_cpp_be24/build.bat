@echo off
setlocal
REM Edit this if your Npcap SDK is somewhere else.
set NPCAP_SDK=C:\npcap-sdk-1.16
if not exist "%NPCAP_SDK%\Include\pcap.h" (
    echo ERROR: Could not find "%NPCAP_SDK%\Include\pcap.h"
    echo Edit build.bat and set NPCAP_SDK to your Npcap SDK folder.
    exit /b 1
)
if not exist build mkdir build
if not exist output mkdir output
cl /nologo /O2 /EHsc /std:c++17 ^
    /I"include" /I"%NPCAP_SDK%\Include" ^
    src\main.cpp ^
    src\ConsoleUI.cpp ^
    src\NpcapLogger.cpp ^
    src\PacketParser.cpp ^
    src\PayloadWriter.cpp ^
    src\Utils.cpp ^
    /Fe:build\fast_udp_payload_logger.exe ^
    /link /LIBPATH:"%NPCAP_SDK%\Lib\x64" wpcap.lib Packet.lib Ws2_32.lib
if errorlevel 1 (
    echo Build failed.
    exit /b 1
)
echo.
echo Build OK:
echo   build\fast_udp_payload_logger.exe
echo.
echo Run as Administrator:
echo   build\fast_udp_payload_logger.exe
