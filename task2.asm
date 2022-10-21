.386
.model flat, stdcall
option casemap:none

include     \masm32\include\masm32rt.inc

strcreator PROTO :DWORD, :DWORD

.data
    n dd 5

.data?

buf db 11 dup(?)

.code

start:
    cmp n, 0
    jl warning
    invoke  strcreator, n, ADDR buf
    invoke  StdOut, eax
    invoke  ExitProcess, 0
    
warning:
    print "N is less than 0", 13, 10, 0
    ret

strcreator PROC uses ebx x:DWORD, buffer:DWORD
    mov eax, x
    mov ebx, 10
    mov ecx, buffer
    add ecx, ebx

ascii_convert:
    xor edx, edx
    div ebx
    add edx, 48
    mov BYTE PTR [ecx], dl
    dec ecx
    test eax, eax
    jnz ascii_convert
    inc ecx
    mov eax, ecx
    ret

strcreator ENDP

END start