.386
	.model flat, stdcall
	option casemap :none

	include c:\masm32\include\windows.inc
	include c:\masm32\include\kernel32.inc
	include c:\masm32\include\user32.inc
	include c:\masm32\include\shell32.inc
	include c:\masm32\include\advapi32.inc
	include c:\masm32\include\gdi32.inc
	include c:\masm32\include\comdlg32.inc
	include c:\masm32\include\winmm.inc

	includelib c:\masm32\lib\masm32.lib
	includelib c:\masm32\lib\ole32.lib
	includelib c:\masm32\lib\winmm.lib
	includelib c:\masm32\lib\comctl32.lib
	includelib c:\masm32\lib\kernel32.lib
	includelib c:\masm32\lib\user32.lib
    includelib c:\masm32\lib\gdi32.lib
    includelib c:\masm32\lib\advapi32.lib
MainWindow proto :DWORD, :DWORD, :DWORD, :DWORD
ModuleTimer proto hwnd1:DWORD, uMsg:DWORD, idEvent:DWORD, dvTime:DWORD
public HINST
.DATA
HINST DD 0
hwnd DD 0
class db "My_Window", 0
caption db "Get Name Process by ID", 0
class_edit db "Edit", 0
msg MSG <0>
shablon db "Color:%#08X", 0
contener db 256 dup(0)

.CODE
START:

invoke GetModuleHandle, 0
mov HINST, EAX
call RegisterClass
cmp EAX, 0
JE EXIT
invoke CreateWindowEx, 0, addr class, addr caption, WS_OVERLAPPEDWINDOW, 100, 130, 500, 500, 0, 0, HINST, 0
mov hwnd, EAX
invoke ShowWindow, hwnd, 1
invoke UpdateWindow, hwnd
msg_loop:
	invoke GetMessage, addr msg, 0, 0, 0
	cmp EAX, 0
	JE EXIT
	invoke TranslateMessage, addr msg
	invoke DispatchMessage, addr msg 
JMP msg_loop
EXIT:
	invoke ExitProcess, 0

MyRegisterClass proc
local struct_wndclass:WNDCLASSEX

mov struct_wndclass.cbSize, WNDCLASSEX
mov struct_wndclass.style, CS_DBLCLKS
mov struct_wndclass.lpfnWndProc, MainWindow
mov struct_wndclass.cbClsExtra, 0
mov struct_wndclass.cbWndExtra, 0
mov EAX, HINST
mov struct_wndclass.hInstance, EAX
mov struct_wndclass.lpszClassName, offset class
invoke LoadIcon, HINST, 101
mov struct_wndclass.hIcon, EAX
invoke LoadIcon, HINST, 102
mov struct_wndclass.hIconSm, EAX
invoke LoadCursor, 0, IDC_ARROW
mov struct_wndclass.hCursor, EAX
invoke CreateSolidBrush, 00FF0000h
invoke GetStockObject, BLACK_BRUSH
mov struct_wndclass.hbrBackground, EAX
invoke RegisterClassExA, addr struct_wndclass

ret
MyRegisterClass endp

MainWindow proc uses EBX ESI EDI hwnd_:DWORD, msg_:DWORD, wParam_:DWORD, lParam_:DWORD
local point_:POINT
cmp msg_, WM_CREATE
JE WMCREATE
cmp msg_, WM_DESTROY
JE WMDESTROY
_def_:
	invoke DefWindowProc, hwnd_, msg_, wParam_, lParam_
	JMP FINISH
WMCREATE:
	invoke CreateWindowEx, WS_EX_CLIENTEDGE, addr class_edit, 0, WS_CHILD + WS_VISIBLE, 100, 130, 300, 25, hwnd_, 1, HINST, 0
	invoke CreateWindowEx, WS_EX_CLIENTEDGE, addr class_edit, 0, WS_CHILD + WS_VISIBLE, 20, 180, 450, 30, hwnd_, 2, HINST, 0
	invoke SetTimer, hwnd_, 1, 1000, ModuleTimer
	JMP FINISH
WMDESTROY:
	invoke PostQuitMessage, 0
FINISH:
ret 16
MainWindow endp
END START