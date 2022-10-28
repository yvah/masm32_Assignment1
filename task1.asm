.386
.model flat, stdcall
option casemap:none

include     \masm32\include\masm32rt.inc

.data

.data?

.code

start:
    mov ebx, 100
    mov eax, 0
    add eax, ebx

    mov edx, ebx
    mov ecx, ebx

    cmp ebx, 0
    jle warning0

sumN1:
    dec ebx
    add eax, ebx
    cmp eax, 2147483647
    jo warning
    cmp ebx, 0
    jne loop1
    

 sumN2:
    lea edx, [ecx+1]
    mul ecx
    jo warning
    test edx, edx
    jnz warning
    cmp edx, eax
    je end_sum
    
end_sum:
    print str$(eax), 13, 10, 0
    ret
    
warning:
    print "the overflow occured: ", 13, 10, 0
    print "sum(N) of this value can't be stored in 32bit", 13, 10, 0
    jo end_sum
    ret
    
warning0:
    print "N must be greater than 0", 13, 10, 0
    jo end_sum
    ret
END start