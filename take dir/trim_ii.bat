@echo off

call :Test1 & call :Test2 & call :Test3 & exit /b

:Trim
SetLocal EnableDelayedExpansion
set Params=%*
for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
exit /b

:Test1
set Value=   a b c   
set Expected=a b c
call :Trim Actual %Value%
if "%Expected%" == "%Actual%" (echo Test1 passed) else (echo Test1 failed)
exit /b

:Test2
SetLocal EnableDelayedExpansion
set Value=   a \ / : * ? " ' < > | ` ~ @ # $ [ ] & ( ) + - _ = z    
set Expected=a \ / : * ? " ' < > | ` ~ @ # $ [ ] & ( ) + - _ = z
call :Trim Actual !Value!
if !Expected! == !Actual! (echo Test2 passed) else (echo Test2 failed)
exit /b

:Test3
set /p Value="Enter string to trim: " %=%
echo Before: [%Value%]
call :Trim Value %Value%
echo After : [%Value%]
pause