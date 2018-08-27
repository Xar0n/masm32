	.386
	.model flat, stdcall
	option casemap :none

	include C:\MASM32\INCLUDE\WINDOWS.INC
	include C:\MASM32\INCLUDE\KERNEL32.INC
	include C:\MASM32\INCLUDE\USER32.INC

	includelib C:\MASM32\LIB\comctl32.lib
	includelib C:\MASM32\LIB\kernel32.lib
	includelib C:\MASM32\LIB\user32.lib
    includelib C:\MASM32\LIB\gdi32.lib
    includelib C:\MASM32\LIB\advapi32.lib
.DATA

VAR_LEVEL DD 4000
BEEP_LONG DWORD 1000
STR_HELLO DB "Hello, Name", 0
STR_BYTE_HELLO BYTE "Hello, Byte", 0

.CODE
START:

invoke MessageBox, 0, addr STR_BYTE_HELLO, addr STR_HELLO, 0
invoke Sleep, 2000
invoke Beep, VAR_LEVEL, BEEP_LONG

EXIT:
	invoke ExitProcess, 0
END START