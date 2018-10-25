.386
	.model flat, stdcall
	option casemap :none

	include c:\masm32\include\windows.inc
	include c:\masm32\include\kernel32.inc
	include c:\masm32\include\user32.inc
	include c:\masm32\include\advapi32.inc

	includelib c:\masm32\lib\comctl32.lib
	includelib c:\masm32\lib\kernel32.lib
	includelib c:\masm32\lib\user32.lib
    includelib c:\masm32\lib\gdi32.lib
    includelib c:\masm32\lib\advapi32.lib
FunctionClientPoint proto :DWORD
.DATA
hwnd_desc DWORD 0
hwnd_win DWORD 0
point_w POINT <0>
rect_w RECT <0>
caption db "Parametr", 0
shablon db "ScreenX:%d Screen:%d ClientX:%d ClientY:%d", 0
contener db 256 dup(0)
.CODE
START:

invoke GetForegroundWindow
mov hwnd_win, EAX
invoke GetDesktopWindow
mov hwnd_desc, EAX
invoke GetWindowRect, hwnd_win, addr rect_w
invoke FunctionClientPoint, addr rect_w
EXIT:
	invoke ExitProcess, 0

FunctionClientPoint proc ptrRect:DWORD
local x_point:DWORD
local y_point:DWORD
pushad

mov EBX, ptrRect
mov EAX, [EBX + RECT.right]
sub EAX, [EBX + RECT.left]
mov ECX, [EBX + RECT.bottom]
sub ECX, [EBX + RECT.top]
xor EDX, EDX
mov ESI, 2
div ESI
mov point_w.x, EAX
mov x_point, EAX
xor EDX, EDX
mov ESI, 2
div ESI
mov point_w.y, EAX
mov y_point, EAX

invoke ClientToScreen, hwnd_win, addr point_w
invoke wsprintf, addr contener, addr shablon, point_w.x, point_w.y, x_point, y_point
invoke MessageBox, 0, addr contener, addr caption, 0
invoke ScreenToClient, hwnd_win, addr point_w
invoke MapWindowPoints, hwnd_desc, hwnd_win, addr point_w, 1

popad
ret 4
FunctionClientPoint endp
END START