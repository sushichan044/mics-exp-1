     .section .rodata
.Lprompt: .string "> "
.Lread: .string "%ld"
.Lprint: .string "%ld\n"
     .text
.globl main
main:
     pushq %rbp
     movq %rsp, %rbp
     subq $16, %rsp
  movq $.Lprompt, %rdi
  movq $0, %rax
  call printf
  leaq -8(%rbp), %rsi
  movq $.Lread, %rdi
  movq $0, %rax
  call scanf
.L0:
  pushq -8(%rbp)
  pushq $2
  popq %rdx
  popq %rax
  cmpq %rdx, %rax
  setl %al
  movzbq %al, %rax
  pushq %rax
  popq %rax
  cmpq $0, %rax
  je .L1
  movq -8(%rbp), %rax
  addq $1, %rax
  movq %rax, -8(%rbp)
  popq %rsi
  movq $.Lprint, %rdi
  movq $0, %rax
  call printf
  jmp .L0
.L1:
     leave
     ret

