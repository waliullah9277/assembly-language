; Simple program in 8086 Assembly to check if an input number is even or odd

.model small
.stack 100h
.data
even_msg db ' is an even number!$', 0  ; Message for even numbers  
odd_msg db ' is an odd number!$', 0    ; Message for odd numbers    
input_msg db 'Enter a number: $', 0  ; user input 
newline db 0Ah, 0Dh, '$'  ; new line  

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 5  ; repeat in this loop 5 times

r:
    ; Display input message
    mov ah, 9
    lea dx, input_msg
    int 21h
    
    ; Read user input
    mov ah, 1
    int 21h
    mov bl, al  ; Store input character
    
    ; Print newline before output
    mov ah, 9
    lea dx, newline
    int 21h   
    
    mov ah, 9
    lea dx, newline
    int 21h 
    
    
    ; Print the input number before showing result
    mov dl, bl
    mov ah, 2
    int 21h
    
    
    sub bl, '0'  ; Convert ASCII to integer
    
    mov al, bl   
    mov dl, 2    
    xor ah, ah   
    div dl       
    
    cmp ah, 0  
    jne odd      ; If remainder is not 0, it's odd

    ; Even case
    mov ah, 9
    lea dx, even_msg
    int 21h
    jmp next_input

odd:
    ; Odd case
    mov ah, 9
    lea dx, odd_msg
    int 21h

next_input:
    ; Print newline after output
    mov ah, 9
    lea dx, newline
    int 21h  
    
    mov ah, 9
    lea dx, newline
    int 21h
    
    loop r  ; repeat until CX reaches 0

main endp
end main