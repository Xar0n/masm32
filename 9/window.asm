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
hwnd DWORD 0
caption db "Window", 0
text db 100 dup (0)
class db 256 dup (0)
.CODE
START:

invoke GetForegroundWindow
mov hwnd, EAX
invoke GetWindowText, hwnd, addr text, 100
invoke GetClassName, hwnd, addr class, 256
invoke MessageBox, 0, addr class, addr text, 0

EXIT:
	invoke ExitProcess, 0
END START