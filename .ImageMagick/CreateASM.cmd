@echo off
call "c:\Program Files\Microsoft Visual Studio\2022\Enterprise\Common7\Tools\VsDevCmd.bat"
cl /FA /EP /nologo /I ..\include ..\src\x86\sysv_intel.S > ..\src\x86\win32.asm
cl /FA /EP /nologo /I ..\include ..\src\x86\win64_intel.S > ..\src\x86\win64.asm
cl /FA /EP /nologo -D_M_ARM64 /I ..\include ..\src\aarch64\win64_armasm.S > ..\src\aarch64\winarm64.asm
pause