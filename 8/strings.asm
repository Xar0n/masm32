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
string1 db "string1", 0
string2 db "string2", 0
contener1 db 40 dup (0)
contener2 db 40 dup (0)
.CODE
START:

invoke lstrlen, addr string1
invoke lstrcpyn, addr contener1, addr string1, EAX
invoke lstrcpy, addr contener2, addr string2
invoke lstrcat, addr contener1, addr contener2
invoke lstrcmp, addr string1, addr string2
invoke lstrcmpi, addr string1, addr string2

EXIT:
	invoke ExitProcess, 0
END START