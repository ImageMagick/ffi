@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat"
cl /FA /EP /nologo /I include src\x86\sysv_intel.S > src\x86\win32.asm
cl /FA /EP /nologo /I include src\x86\win64_intel.S > src\x86\win64.asm
pause