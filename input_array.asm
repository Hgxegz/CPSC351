extern printf
extern scanf
extern isinteger
extern atolong


global input_array

section .data
  welcome db "This is the the end", 10, 0
  promptInt db "Enter the value for the array: ", 0
  intPrintFormat db "The number %d was received.", 10, 0
  incrementPrintFormat db "The incrementer is at %d.", 10, 0

  longIntFormat db "%ld",0
  stringFormat db "%s", 0


section .bss

section .text

input_array:

  push rbp
  mov rbp, rsp        ;now the base pointer(rbp) points to the top of the stack
  push rdi
  push rsi
  push rdx
  push rcx
  push r8
  push r9
  push r10
  push r11
  push r12
  push r13
  push r14
  push r15
  push rbx
  pushf               ;backup rflags

  ;registers rax, rip, and rsp are usually not backed up
  push qword -1


  mov r14, 0
  mov rbp, rsp
  mov r15, rdi  ;array is in rdi so we put that into r15

  loop_start:
  ;Prompt the value from the user
  mov rdi, stringFormat
  mov rsi, promptInt
  mov rax, 0
  call printf

  ;Get the value from the user
  ;mov rdi, longIntFormat
  ;push qword -1
  ;mov rsi, rsp
  ;mov rax, 0
  ;call scanf
  ;pop r13

  ;Get the value from the user
  mov rdi, longIntFormat
  push qword -1
  mov rsi, rsp
  mov rax, 0
  call scanf
  pop r13

  mov rax, 0
  mov rdi, r13
  call isinteger

  ;validate
  cmp rax, 1
  je validprocessing

  validprocessing:
    mov rax, 0
    mov rdi, rsp
    call atolong
    mov r13, rax

  mov rdi, intPrintFormat
  mov rsi, r13
  mov rax, 0
  call printf

  ;print out the number incrementer
  mov rdi, incrementPrintFormat
  mov rsi, r14
  mov rax, 0
  call printf

  cmp r13, 0
  jne in_array
  je end_loop


  in_array:
  mov qword [r15 + r14 * 8], r13
  inc r14
  jmp loop_start

  end_loop:
  mov rdi, stringFormat
  mov rsi, welcome
  mov rax, 0
  call printf


  ;Restore the original values to the general registers before returning to the caller
  pop rax
  mov rax, r14
  popf
  pop rbx
  pop r15
  pop r14
  pop r13
  pop r12
  pop r11
  pop r10
  pop r9
  pop r8
  pop rcx
  pop rdx
  pop rsi
  pop rdi
  pop rbp

  ret
