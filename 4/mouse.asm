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

caption DB "Mouse focus", 0
text DB "Move here", 0

.CODE
START:
	invoke SwapMouseButton, 1
	invoke ShowCursor, 0
	invoke MessageBox, 0, addr text, addr caption, 0
EXIT:
	invoke ExitProcess, 0
END START