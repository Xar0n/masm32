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

for_mul DD 100
for_div DD 6
caption DB "Mul and Div", 0
shablon DB "Horizontal:%d Vertical:%d", 0
container DB 1024 dup(1)

.CODE
START:

invoke GetSystemMetrics, SM_CXSCREEN
mov EDI, EAX
invoke GetSystemMetrics, SM_CYSCREEN
mov ESI, EAX
invoke wsprintf, addr container, addr shablon, EDI, ESI
invoke MessageBox, 0, addr container, addr caption, 0


EXIT:
	invoke ExitProcess, 0
END START