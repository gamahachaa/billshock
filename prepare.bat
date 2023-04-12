@echo off
echo %1
echo %2
set BINDIR=%2\export\html5\bin

echo %BINDIR%

powershell -Command "cd "%BINDIR%""
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% add *"
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% commit -m cleaning_for_master"
powershell -Command "git --git-dir=%BINDIR%\.git --work-tree=%BINDIR% checkout master"