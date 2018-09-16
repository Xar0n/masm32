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
disk db "D:", 0
contener db 256 dup(0)
.CODE
START:

invoke GetLogicalDrives
invoke GetLogicalDriveStrings, 256, addr contener
invoke GetDriveType, addr disk

EXIT:
	invoke ExitProcess, 0
END START