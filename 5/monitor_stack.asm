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
 extern GetSystemMetrics@4:near
 extern MessageBoxA@16:near
.DATA

v_mul DWORD 100
v_div DWORD 6
caption DB "Mul and Div", 0
shablon DB "Horizontal:%d Vertical:%d", 0
container DB 1024 dup(2)

.CODE
START:
push SM_CXSCREEN
call GetSystemMetrics@4
mov EDI, EAX

push SM_CYSCREEN
call GetSystemMetrics@4
mov ESI, EAX

push ESI
push EDI
push offset shablon
push offset container
call wsprintf
add ESP, 10h

push 0
push offset caption
push offset container
push 0
call MessageBoxA@16

EXIT:
	invoke ExitProcess, 0
END START