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

HINST DWORD 0
strHello DB "Hello", 0
strHelloWorld DB "Hello world", 0

.CODE
START:
	invoke MessageBox, 0, addr strHelloWorld, addr strHello, 0
EXIT:
	invoke ExitProcess, 0
END START