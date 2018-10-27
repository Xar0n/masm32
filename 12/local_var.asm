.386
	.model flat, stdcall
	option casemap :none

	include c:\masm32\include\windows.inc
	include c:\masm32\include\kernel32.inc
	include c:\masm32\include\user32.inc

	includelib c:\masm32\lib\comctl32.lib
	includelib c:\masm32\lib\kernel32.lib
	includelib c:\masm32\lib\user32.lib
    includelib c:\masm32\lib\gdi32.lib
    includelib c:\masm32\lib\advapi32.lib
Function proto
.DATA

.CODE
START:

invoke Function

EXIT:
	invoke ExitProcess, 0


Function proc

local var1, var2, var3:DWORD
local string[256]:BYTE
local pMas[30]:DWORD
local var4:WORD
local var5:DWORD

ret
Function endp
END START