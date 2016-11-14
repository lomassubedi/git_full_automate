@echo off

call :Test3
pause

:Trim
SetLocal EnableDelayedExpansion
set Params=%*
for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
exit /b


:Test3
	rem for %%i in (git.exe) do set git_path=%%~$PATH:i	
	rem echo %git_path%
	rem set /p Value="Enter string to trim: " %=%


	set script_file_name=\bash_script.sh

	REM get current path
	set dirVar=%cd%
	rem echo %dirVar%

	rem append the file name
	set final_path=%dirVar%%script_file_name%

	rem Get drive letter with colon
	set drive=%final_path:~0,2%
	rem echo %drive%

	rem Copy path in DOS style 
	set unix_path=%final_path% 
	rem echo %unix_path%


	rem replace '\' with '/' for unix path conversion
	set unix_path=%unix_path:\=/%
	echo %unix_path%	

	rem convert DOS drive notation to unix style drive i.e. C: to /C/
	set unix_path=%unix_path::=%
	echo %unix_path%

	rem discard white space at the end and manage to place "\ " instead of 
	rem white space present directory
	rem set unix_path=%unix_path: "="%

	rem echo Before: [%git_path%]
	call :Trim unix_path %unix_path%
	rem echo After : [%git_path%]


	rem Add quotation marks at the end
	set unix_path=^"^/%unix_path%^"
	set unix_path=%unix_path: =\ %
	echo %unix_path%