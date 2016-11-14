@echo off
IF EXIST C:\Program Files (x86)\Git\bin do (
	echo TRUE
	) else do (
	echo FALSE
	)
rem IF EXIST C:\Program Files\Git\bin do (
rem 	echo FALSE
rem 	)