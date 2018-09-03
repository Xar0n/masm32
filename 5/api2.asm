.386
	.model flat, stdcall
	option casemap :none

	include C:\MASM32\INCLUDE\WINDOWS.INC
	include C:\MASM32\INCLUDE\KERNEL32.INC
	include C:\MASM32\INCLUDE\USER32.INC
	include C:\MASM32\INCLUDE\ADVAPI32.INC

	includelib C:\masm32\lib\comctl32.lib
    includelib C:\masm32\lib\user32.lib
    includelib C:\masm32\lib\gdi32.lib
    includelib C:\masm32\lib\kernel32.lib                
    includelib C:\masm32\lib\user32.lib
    includelib C:\masm32\lib\advapi32.lib 
.DATA

max_symbols DD 256
caption DB "API", 0
container DB 256 dup(0)

.CODE
START:

invoke GetCurrentDirectory, addr max_symbols, addr container
invoke GetModuleFileName, 0, addr container,
addr max_symbols
invoke GetWindowsDirectory, addr container, addr max_symbols
invoke GetUserName, addr container, addr max_symbols

invoke MessageBox, 0, addr container, addr caption, 0 

EXIT:
	invoke ExitProcess, 0
END START