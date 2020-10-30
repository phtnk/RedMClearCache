@echo off
setlocal
echo.&echo :: RedM Clear Cache ::

@REM O P T I O N S

@REM set RUNREDM=true (no spaces!) if RedM launcher should be started
set RUNREDM=false

@REM set CONFIRM=true to confirm every item before deletion
set CONFIRM=false

@REM only change this if your RedM installation is not in the default folder
set REDMPATH=%localappdata%\RedM

:: ------------------------------------
set CACHEPATH=%REDMPATH%\RedM.app\cache
if NOT exist "%CACHEPATH%" (
	echo.&echo The path '%CACHEPATH%' cannot be found. Paste the path to your RedM installation in REDMPATH, if you moved it from its default folder.
	goto end
)
echo :: clearing cache in
echo     %CACHEPATH%

:files
echo.&echo ::  deleting files...
for /f %%f in ('dir /A:-D /b "%CACHEPATH%\*.*"') do (
	if "%CONFIRM%" == "true" (
		del /p "%CACHEPATH%\%%f"
	) else (
		echo      %CACHEPATH%\%%f
		del "%CACHEPATH%\%%f"
	)
)

:subfolders
echo.&echo ::  deleting subfolders...
for /f %%f in ('dir /A:D /b "%CACHEPATH%"') do (
	if NOT "%%f" == "game" (
		if "%CONFIRM%" == "true" (
			rmdir /s "%CACHEPATH%\%%f"
		) else (
			echo      %CACHEPATH%\%%f
			rmdir /s /q "%CACHEPATH%\%%f"
		)
	) else echo     ^(%CACHEPATH%\%%f^) skipped...
)

echo.&echo done

if "%RUNREDM%"=="true" (
	start "" "%REDMPATH%\RedM.exe"
	endlocal
) else (
	:end
	endlocal
	pause
)
