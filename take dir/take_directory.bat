@echo off
setlocal EnableDelayedExpansion

rem Automate get git directory
rem where /R C:\ sh.exe

REM Git directory
rem IF EXIST "%PROGRAMFILES(X86)%" (GOTO:64BIT) ELSE (GOTO:32BIT)
rem 	:64BIT
rem 	echo OS IS 64-BIT
rem 	GOTO:END

rem 	:32BIT
rem 	echo OS IS 32-BIT
rem 	GOTO:END
rem :END

set git_bash_dir="C:\Program Files\Git\bin\sh.exe"
set script_file_name=\bash_script.sh

REM get current path
set dirVar=%cd%
rem append the file name
set final_path=%cd%%script_file_name%

rem Get drive letter with colon
set drive=%final_path:~0,2%
echo %drive%

rem Copy path in DOS style 
set unix_path=%final_path% 

rem replace '\' with '/' for unix path conversion
set unix_path=%unix_path:\=/%

rem convert DOS drive notation to unix style drive i.e. C: to /C/
set unix_path=!unix_path:%drive%=%drive:~0,1%!

rem Add quotation marks at the end
set unix_path=^"^/%unix_path%^" 

rem discard white space at the end and manage to place "\ " instead of 
rem white space present directory
set unix_path=%unix_path: "="%
set unix_path=%unix_path: =\ %
set unix_path=%unix_path:"\="%

echo %unix_path%

%git_bash_dir% --login -i -c %unix_path%
pause

