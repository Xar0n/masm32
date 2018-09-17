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
.DATA
param DD 0888888h
caption db "Param", 0
shablon db "PARAM:%#08x", 0
contener db 256 dup (0)
.CODE
START:

push param
push offset shablon
push offset contener
push offset caption
call function_void

EXIT:
	invoke ExitProcess, 0

function_void proc
	push EBP
	mov EAX, [EBP-0Ch] ;param
	mov EBX, [EBP-10h] ;shablon
	mov ECX, [EBP-14h] ;contener
	mov EDX, [EBP-18h] ;caption
	pushad
	invoke wsprintf, ECX, EBX, EAX
	popad
	invoke MessageBox, 0, ECX, EDX, 0
	pop EBP
	mov EAX, 33333333h
	ret 16  
function_void endp
END START