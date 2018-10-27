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
caption db "Local String", 0
.CODE
START:

mov EAX, 55555555h
mov EBX, 66666666h
invoke Function, EAX, EBX

EXIT:
	invoke ExitProcess, 0

Function proc param1:DWORD, param2:DWORD
local string[256]:BYTE
local lenght_string:DWORD
	invoke lstrlen, addr caption
	mov lenght_string, EAX
	invoke RtlZeroMemory, addr string, 256
	invoke RtlMoveMemory, addr string, addr caption, lenght_string
ret 8
Function endp
END START