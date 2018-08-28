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

caption DB "MATH", 0
addition DWORD ?
subtraction DWORD ?
string_shablon DB "addition:%d, subtraction:%d", 0
string_container DB 1024 dup(1)

.CODE
START:

mov addition, 1000
mov subtraction, 1000
add addition, 100
sub subtraction, 100

invoke wsprintf, addr string_container, addr string_shablon, addition, subtraction

invoke MessageBox, 0, addr string_container, addr caption, 0

EXIT:
	invoke ExitProcess, 0
END START