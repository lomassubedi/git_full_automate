@echo off
setlocal EnableDelayedExpansion

REM Git directory
set git_bash_dir="C:\Program Files\Git\bin\sh.exe"
set script_file_name=\bash_script.sh

REM get current path
set dirVar=%cd%
rem append the file name
set final_path=%cd%%script_file_name%

rem Get drive letter
set drive=%final_path:~0,2%
echo %drive%

set unix_path=%final_path% 
set unix_path=%unix_path:\=/%
set unix_path=!unix_path:%drive%=%drive:~0,1%!

set unix_path=^"^/%unix_path%^" 
echo %unix_path%

%git_bash_dir% --login -i -c %unix_path%

rem set unix_path=%final_path% 
rem set unix_path=%unix_path:\=/%
rem set unix_path=%unix_path:C:=/c%
rem set unix_path=^"%unix_path%^"
rem echo %unix_path%
rem echo %final_path%