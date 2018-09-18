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
caption db "Disks", 0
contener db 50 dup (0)
.CODE
START:

invoke GetLogicalDriveStrings, 50, addr contener
push offset contener
call null_contener
invoke MessageBox, 0, addr contener, addr caption, 0

EXIT:
	invoke ExitProcess, 0

null_contener proc
enter 0, 0
	mov ECX, 50
	mov EBX, [EBP+08]
	$_POINT_:
	cmp byte ptr[EBX], 0
	jne @F
		mov byte ptr[EBX], ' '
	@@:
	inc EBX
	loop $_POINT_
leave
ret 4
null_contener endp

END START