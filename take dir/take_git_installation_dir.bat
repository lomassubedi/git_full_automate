@echo off
setlocal EnableDelayedExpansion

rem set sh_exe=sh.exe
REM get Git directory
rem for %i in (git.exe) do @echo. %~$PATH:i
for %%i in (git.exe) do set git_path=%%~$PATH:i	
echo %git_path%
rem set git_path=%git_path: =%

for /f "tokens=3 delims=\" %%G IN (%git_path%) DO echo %%G

rem for /f "tokens=2" %%G IN (%git_path%) DO @echo %%G

rem if exist C:\Program Files\Git\bin\sh.exe (
rem 	set git_sh_path="C:\Program Files\Git\bin\sh.exe"
rem 	echo %git_sh_path%
rem 	) else (
rem 	set git_sh_path="C:\Program Files (x86)\Git\bin\sh.exe"
rem 	echo %git_sh_path%
rem 	)


rem if not "%git_path%:Program Files (x86)%"=="Program Files (x86)"(
rem 	echo YES &rem set git_sh_path="C:\Program Files\Git\bin\sh.exe"
rem 	)
rem if not "%git_path%:Program Files%"=="Program Files" (
rem 	echo NO &rem set git_sh_path="C:\Program Files (x86)\Git\bin\sh.exe"
rem 	)

echo %git_sh_path%

rem for /f "tokens=4" %%G IN ("aaa bbb ccc ddd eee fff") DO echo %%G 


pause



rem call Trim git_path %git_path%

rem rem set sh_exe_path=%git_path%
rem rem set sh_exe_path=%sh_exe_path:git.exe=%
rem echo %sh_exe_path%
rem pause

rem rem set sh_exe_path=%sh_exe_path%%sh_exe%

rem rem set sh_exe_path=%sh_exe_path:git.exe=sh.exe%
rem set sh_exe_path=^"%sh_exe_path%^"
rem set %sh_exe_path%=%sh
rem rem set sh_exe_path=%sh_exe_path: "="%
rem echo %sh_exe_path%

rem :Trim
rem 	SetLocal EnableDelayedExpansion
rem 	set Params=%*
rem 	for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
rem 	exit /b