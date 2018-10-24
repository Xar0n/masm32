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
GetArg proto :DWORD, :DWORD 
.DATA

str_ptr DD 0
str_len DD 0
caption db "ARGUMENT", 0
text db 100 dup(0)

.CODE
START:

invoke GetCommandLine
mov str_ptr, EAX
invoke lstrlen, str_ptr
mov str_len, EAX
invoke  GetArg, str_ptr, str_len 

EXIT:
	invoke ExitProcess, 0

GetArg proc p_str_ptr:DWORD, p_str_len:DWORD
pushad
	mov EBX, p_str_ptr
	xor ECX, ECX
	$_cycle_:
	cmp byte ptr[EBX], ' '
	jne $_inc_
		invoke MessageBox, 0, EBX, addr caption, 0
		popad
		JMP $_end_
	$_inc_:
	inc ECX
	inc EBX
	cmp ECX, p_str_len
	JB $_cycle_
popad
$_end_:
ret 8
GetArg endp
END START