extern printf
extern scanf
extern input_array
extern print_array
extern array_sum
global manager

section .data
welcomeMessage db "Welcome to Arrays of Integers",10,0
authorIntro db "Brought to you by Devin Heng",10,0
progExplanation db "This program will sum your array of integers",10,0
longIntFormat db "%ld",0
stringFormat db "%s", 0

section .bss
  array: resq 100

section .text

manager:
  ;All the pushes and pops
  push rbp
  push rdi
  push r13
  mov rbp, rsp
  ;Print the welcome message
  mov rdi, stringFormat
  mov rsi, welcomeMessage
  mov rax, 0
  call printf
  ;===============================;
  ;Author introduction
  mov rdi, stringFormat 
  mov rsi, authorIntro
  mov rax, 0
  call printf
  ;===============================;
  ;Program explanation
  mov rdi, stringFormat
  mov rsi, progExplanation
  mov rax, 0
  call printf
  ;================================;
  ;MOVE INTO INPUT_ARRAY.ASM FILE
  mov rdi, array ;puts array into rdi to get access in other files
  call input_array
  mov r13, rax ;holds the size of the array in r13
  ;================================;
  ;summing up the array in SUM.ASM FILE
  mov rsi, rax ;holds the size of the array in rsi as well
  call array_sum
  ;=================================;
  ;PRINT ARRAY FUNCTION FROM DISPLAY_ARRAY.CPP
  mov rdi, array
  mov qword rsi, r13
  call print_array


  mov rax, 0
  pop r12
  pop rdi
  pop rbp

  ret
