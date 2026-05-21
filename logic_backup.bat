@echo off
set timestamp=%DATE:~6,4%%DATE:~3,2%%DATE:~0,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
set timestamp=%timestamp: =0%
"C:\OSPanel\modules\database\MySQL-8.0-Win10\bin\mysqldump.exe" -u root Answer_Book_problem > "Logic_Backups\backup%timestamp%.sql"