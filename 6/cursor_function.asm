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
cursor_r RECT <0>
cursor_p POINT <0>
string db "API-Cursor", 0
shablon db "X:%d Y:%d", 0
contener db 256 dup (0)
.CODE
START:

invoke GetCursorPos, addr cursor_p
invoke wsprintf, addr contener, addr shablon, cursor_p.x, cursor_p.y
invoke MessageBox, 0, addr contener, addr string, 0
invoke SetCursorPos, 500, 300
mov cursor_r.left, 450
mov cursor_r.top, 250
mov cursor_r.right, 550
mov cursor_r.bottom, 350
invoke ClipCursor, addr cursor_r
call load_cursor

EXIT:
	invoke ExitProcess, 0

load_cursor proc
	invoke LoadCursor, 0, IDC_SIZEWE
	invoke SetSystemCursor, EAX, OCR_NORMAL
	invoke ShowCursor, 0
	invoke ShowCursor, 1	
ret
load_cursor endp
END START