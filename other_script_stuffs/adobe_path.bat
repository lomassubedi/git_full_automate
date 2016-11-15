set sh_exe=sh.exe
REM get Git directory
rem for %i in (git.exe) do @echo. %~$PATH:i
for %%i in (git.exe) do set git_path=%%~$PATH:i	
echo %git_path%




call Trim git_path %git_path%
rem set sh_exe_path=%git_path%
rem set sh_exe_path=%sh_exe_path:git.exe=%
echo %sh_exe_path%
pause

rem set sh_exe_path=%sh_exe_path%%sh_exe%

rem set sh_exe_path=%sh_exe_path:git.exe=sh.exe%
set sh_exe_path=^"%sh_exe_path%^"
set %sh_exe_path%=%sh
rem set sh_exe_path=%sh_exe_path: "="%
echo %sh_exe_path%