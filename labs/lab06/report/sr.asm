%include 'in_out.asm'

SECTION  .data
  task: DB 'f(x)=10+(31*x-5)',0
  vvod: DB 'Введите x: ',0
  ans: DB 'ответ: ',0

SECTION .bss
  x: RESB 80

SECTION .text
GLOBAL _start
_start:

 mov eax,task
 call sprintLF

 mov eax,vvod
 call sprint
 mov ecx,x
 mov edx,80
 call sread

 mov eax,x
 call atoi

 mov ebx,31
 mul ebx
 sub eax,5
 add eax,10
 mov ebx,eax

 mov eax, ans
 call sprint

 mov eax,ebx
 call iprintLF

 call quit

