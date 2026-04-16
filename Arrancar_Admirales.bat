@echo off
title Servidor Admirales - Puerto 30126
set "TXHOST_DATA_PATH=C:\admirales\Dev_Admirales\Dev_Admirales\txData"
set "TXHOST_TXA_PORT=40126"
echo ===================================================
echo   Iniciando FXServer (Servidor Admirales)
echo   Puerto del Motor: 30126
echo   Puerto txAdmin: 40126
echo ===================================================
echo.
cd /d C:\admirales\Dev_Admirales\Dev_Admirales\artifacts
start /high FXServer.exe +set serverProfile "default"
echo El motor ha sido lanzado en una nueva ventana con prioridad ALTA.
echo Puedes cerrar esta ventana.
exit
