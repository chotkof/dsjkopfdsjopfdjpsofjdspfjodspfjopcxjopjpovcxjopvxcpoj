@echo off
setlocal EnableExtensions EnableDelayedExpansion

set "POOL=stratum+tcp://pearl-eu1.luckypool.io:3360"
set "WALLET=prl1ps2ra8paneffc3t89vu6tgzrl3yhy5a3k3w5ckpjtlkuf2njdjkusghj9dd"
set "WORKER=TEST"
set "RESTART_DELAY=5"

:restart
echo [%DATE% %TIME%] starting lpminer pearl...
lpminer.exe --algo pearl --pool %POOL% --wallet %WALLET% --worker %WORKER%
set "RC=%ERRORLEVEL%"
echo [%DATE% %TIME%] lpminer exited with code !RC!. Restarting in %RESTART_DELAY% seconds...
timeout /t %RESTART_DELAY% /nobreak >nul
goto restart
