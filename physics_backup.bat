@echo off
set timestamp=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set timestamp=%timestamp: =0%
xcopy "C:\OSPanel\userdata\MySQL-8.0-Win10\Answer_Book_problem\" "Physics_Backups\backup%timestamp%\Answer_Book_problem\" /E /I /Y