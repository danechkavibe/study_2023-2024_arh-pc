%include 'in_out.asm'
SECTION .data
msg1: DB 'Функция: f(x)=10х-4 ',0
msg2: DB 'Результат: ',0
SECTION .bss
x: RESB 80
res: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg1
call sprintLF
pop ecx ; загружаем количество значений x
pop edx ; загружаем адрес первого значения x
sub ecx,1
mov esi, 0 ; обнуляем сумму значений f(x)
next:
cmp ecx, 0 ; проверяем, есть ли еще значения x
jz _end ; если нет, переходим к завершению программы
pop eax ; загружаем очередное значение x
call atoi ; преобразуем значение x в число
call _calcul_f ; вызываем подпрограмму для вычисления f(x)
mov edi,eax
add esi, eax
loop next
_end:
mov eax, msg2
call sprint
mov eax, esi
call iprintLF
call quit
_calcul_f:
mov eax
mul eax 
add ebx, -4
ret

