.386
	.model flat, stdcall
	option casemap :none

	include c:\masm32\include\windows.inc
	include c:\masm32\include\kernel32.inc
	include c:\masm32\include\user32.inc
	include c:\masm32\include\advapi32.inc
	include c:\masm32\include\gdi32.inc

	includelib c:\masm32\lib\comctl32.lib
	includelib c:\masm32\lib\kernel32.lib
	includelib c:\masm32\lib\user32.lib
    includelib c:\masm32\lib\gdi32.lib
    includelib c:\masm32\lib\advapi32.lib
ModuleTimer proto hwnd1:DWORD, uMsg:DWORD, idEvent:DWORD, dvTime:DWORD
ModuleFindProcess proto hwnd1:DWORD, PID:DWORD
extern HINST:DWORD
.DATA
.CODE
START:

ModuleTimer proc hwnd1:DWORD, uMsg:DWORD, idEvent:DWORD, dvTime:DWORD
local boolean:DWORD

invoke GetDlgItemInt, hwnd1, 1, addr boolean, 0
.if boolean != 0
	invoke ModuleFindProcess, hwnd1, EAX
.endif
ret 16 
ModuleTimer endp

ModuleFindProcess proc hwnd1:DWORD, PID:DWORD
local snap:DWORD
local module_struct:MODULEENTRY32

invoke CreateToolhelp32Snapshot, TH32CS_SNAPMODULE, PID
mov snap, EAX
mov module_struct.dwSize, size MODULEENTRY32 ;НЕ ПОНЯТНО ЗАЧЕМ
invoke Module32FirstW, snap, addr module_struct
invoke GetLastError
.IF EAX == ERROR_NO_MORE_FILES
	JMP _finish_
.ENDIF
mov EAX, PID
.IF EAX == module_struct.th32ProcessID
	invoke SetDlgItemText, hwnd1, 2, addr module_struct.szExePath
	JMP _finish_
.ENDIF
_loop_:
mov module_struct.dwSize, size MODULEENTRY32
invoke Module32NextW, snap, addr module_struct
invoke GetLastError
.IF EAX == ERROR_NO_MORE_FILES || EAX != 0
	invoke Beep, 3000, 45
	JMP _finish_
.ENDIF
mov EAX, PID
.IF EAX == module_struct.th32ProcessID
	invoke SetDlgItemText, hwnd1, 2, addr module_struct.szExePath
	JMP _finish_
.ENDIF
JMP _loop_

_finish_:
ret 8
ModuleFindProcess endp
END START