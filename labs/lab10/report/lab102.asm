%include 'in_out.asm'

SECTION .data 
msg: DB 'Как вас зовут? ',0
file: DB 'name.txt',0
name: DB 'Меня зовут ',0

SECTION .bss
X: RESB 80

SECTION .text
GLOBAL _start
_start:
;Вывод приглашения “Как Вас зовут?”
    mov eax,msg
    call sprint
;ввести с клавиатуры свои фамилию и имя
    mov ecx,X
    mov edx,80
    call sread
;создать файл с именем name.txt
    mov ecx,0777o
    mov ebx,file
    mov eax,8
    int 80h
;записать в файл сообщение “Меня зовут”
    mov ecx, 2
    mov ebx, file
    mov eax, 5
    int 80h
    mov esi, eax
    mov eax, name
    call slen
    mov edx, eax
    mov ecx, name
    mov ebx, esi
    mov eax, 4
    int 80h
;дописать в файл строку введенную с клавиатуры
    mov eax,X 
    call slen 
    mov edx,eax 
    mov ecx,X 
    mov ebx,esi 
    mov eax,4 
    int 80h 
;закрыть файл
    mov ebx,esi
    mov eax,6
    int 80h
    call quit
