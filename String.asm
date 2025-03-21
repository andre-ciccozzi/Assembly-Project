section .data
    nome db "Nome: Andre", 10, 0
    data db "Data: 21-02", 10, 0
    bytesWritten dq 0

section .text
    global main
    extern GetStdHandle, WriteConsoleA, ExitProcess

main:
    sub rsp, 40h

    mov ecx, -11
    call GetStdHandle
    mov rdi, rax

    mov rcx, rdi
    lea rdx, [rel nome]
    mov r8, 12
    lea r9, [rel bytesWritten]
    mov qword [rsp+20h], 0
    call WriteConsoleA

    mov rcx, rdi
    lea rdx, [rel data]
    mov r8, 11
    lea r9, [rel bytesWritten]
    mov qword [rsp+20h], 0
    call WriteConsoleA

    xor ecx, ecx
    call ExitProcess
