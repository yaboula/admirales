@echo off
color 0A
title Limpiar Cache del Servidor
echo =========================================
echo       Limpiando Cache del Servidor...
echo =========================================
echo.

if exist "%~dp0cache" (
    RMDIR /s /q "%~dp0cache"
    echo [+] Carpeta 'cache' eliminada con exito.
) else (
    echo [-] La carpeta 'cache' no existe o ya esta limpia.
)

if exist "%~dp0server\cache" (
    RMDIR /s /q "%~dp0server\cache"
    echo [+] Carpeta 'server\cache' eliminada con exito.
) else (
    echo [-] La carpeta 'server\cache' no existe o ya esta limpia.
)

echo.
echo =========================================
echo       Cache eliminada correctamente.
echo =========================================
pause