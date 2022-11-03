:: ADD THIS FILE TO WINDOWS SCHEDULLER.

:: Delete folders older than 30 days
forfiles -p C:\DB_BACKUPS\Backups\ -d -30 -c "cmd /c IF @isdir == TRUE rd /S /Q @path"

:: Create backup of DB using SQLCMD (only usable when installed)
sqlcmd -S VMNVME\SQLEXPRESS2017 -E -Q "Declare @FDate as varchar(10), @DirName as varchar(40) set @Fdate = (SELECT CONVERT(INT,CONVERT(CHAR(8),GETDATE()-1,112))) set @DirName = CONCAT('C:\DB_BACKUPS\Backups\', @Fdate, '\') SELECT @DirName EXEC master.dbo.xp_create_subdir @DirName EXEC sp_BackupDatabases @backupLocation=@DirName, @backupType='F'"


:: dummy for waiting to press enter (only for development)
::set /p DUMMY=Hit ENTER to continue...