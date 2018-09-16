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
var_dword DD 0B89F54C4h
var_word DW 54C4h
var_word2 DW 7777h
contener db 256 dup(0)
.CODE
START:

lea EAX, var_dword
add EAX, dword ptr var_word
mov EBX, dword ptr var_word2

mov EAX, 0
sub EBX, EBX

mov EBX, var_dword
mov AX, var_word2
mov BX, var_word2
mov AL, byte ptr var_word
mov BL, byte ptr var_word

EXIT:
	invoke ExitProcess, 0
END START