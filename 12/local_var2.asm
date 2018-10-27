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
Function proto :DWORD, :DWORD
.DATA

.CODE
START:

mov EAX, 66h
mov EBX, 55h
invoke Function, EAX, EBX

EXIT:
	invoke ExitProcess, 0

Function proc param1:DWORD, param2:DWORD
local var1, var2:DWORD
mov EAX, param1
mov var1, EAX
push param2
pop var2
ret 8
Function endp
END START