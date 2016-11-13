@echo off
setlocal EnableDelayedExpansion

rem Automate get git directory
rem where /R C:\ sh.exe

REM get Git directory
rem for %i in (git.exe) do @echo. %~$PATH:i
for %%i in (git.exe) do (
	set git_path=%i%
	)

echo %git_path%

set git_bash_dir="C:\Program Files\Git\bin\sh.exe"
set script_file_name=\bash_script.sh

REM get current path
set dirVar=%cd%
rem append the file name
set final_path=%cd%%script_file_name%

rem Get drive letter with colon
set drive=%final_path:~0,2%
rem echo %drive%

rem Copy path in DOS style 
set unix_path=%final_path% 

rem replace '\' with '/' for unix path conversion
set unix_path=%unix_path:\=/%

rem convert DOS drive notation to unix style drive i.e. C: to /C/
set unix_path=!unix_path:%drive%=%drive:~0,1%!

rem Add quotation marks at the end
set unix_path=^"^/%unix_path%^" &rem append '"'

rem discard white space at the end and manage to place "\ " instead of 
rem white space present directory
set unix_path=%unix_path: "="%
set unix_path=%unix_path: =\ %
set unix_path=%unix_path:"\="%

echo %unix_path%

%git_bash_dir% --login -i -c %unix_path%
pause

