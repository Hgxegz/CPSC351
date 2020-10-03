extern printf
extern scanf
extern input_array
extern print_array
extern array_sum
global manager

section .data
longIntFormat db "%ld",0
backIn db "Back in manager.", 10, 0
stringFormat db "%s", 0

section .bss
  array: resq 100

section .text

manager:
  push rbp
  push rdi
  push r13

  mov rbp, rsp
  mov rdi, array
  call input_array
  mov r13, rax
  mov rsi, rax 
  call array_sum
  
  ;check if we are back in manager
  mov rdi, stringFormat
  mov rsi, backIn
  mov rax, 0
  call printf

  mov rdi, array
  mov qword rsi, r13
  call print_array

  mov rax, 0

  pop r12
  pop rdi
  pop rbp

  ret
