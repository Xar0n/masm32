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
.CODE
START:

mov EAX, -5
mov EBX, 5
cmp EAX, EBX
JA $_point1_
JG $_point2_
nop
nop
$_point1_:
nop
$_point2_:
nop
EXIT:
	invoke ExitProcess, 0
END START