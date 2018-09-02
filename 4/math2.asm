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
v_mul DWORD 100
v_div DWORD 6
caption DB "Mul and Div", 0
shablon DB "Mul:%d Div:%d Remainder:%d", 0
container DB 1024 dup(2)

.CODE
START:
mov EAX, v_mul
mov EBX, v_div
mov EDX, 0

mul EBX
mov EDI, EAX

mov EAX, v_mul
mov EDX, 0

div EBX
mov ESI, EAX

invoke wsprintf, addr container, addr shablon, EDI, ESI, EDX
invoke MessageBox, 0, addr container, addr caption, 0


EXIT:
	invoke ExitProcess, 0
END START