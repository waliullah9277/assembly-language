.model small
.stack 100h
.data
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 1
    int 21h

    mov bl, al

    mov ah, 1
    int 21h

    add al, bl

    mov ah, 2
    mov dl, al
    int 21h

    sub al, bl

    mov ah, 2
    mov dl, al
    int 21h

    mul bl

    mov ah, 2
    mov dl, al
    int 21h

    div bl

    mov ah, 2
    mov dl, al
    int 21h

    mov ah, 2
    mov dl, ah
    int 21h

    mov ah, ch
    int 21h

    main endp
end main