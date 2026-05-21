@echo off
rmdir /S /Q "C:\OSPanel\userdata\MySQL-8.0-Win10\Answer_Book_problem" 2>nul
xcopy "%1\Answer_Book_problem" "C:\OSPanel\userdata\MySQL-8.0-Win10\Answer_Book_problem\" /E /I /Y