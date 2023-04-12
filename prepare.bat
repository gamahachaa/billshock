@echo off
echo %1
echo %2
set BINDIR=%2\export\html5\bin

echo %BINDIR%

powershell -Command "cd "%BINDIR%""
powershell -Command "git add *"
powershell -Command "git commit -m cleaning_for_master"
powershell -Command "git checkout master"