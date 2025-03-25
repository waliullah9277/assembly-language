.MODEL SMALL
.STACK 100H

.DATA
    a1   DB 0DH, 0AH, "Enter the number1: $"
    a2   DB 0DH, 0AH, "Enter the number2: $"
    a3   DB 0DH, 0AH, "Num1 is big $"
    a4   DB 0DH, 0AH, "Num2 is big $"
    num1 DB ?
    num2 DB ?

.CODE
MAIN PROC
    ; Initialize DS segment
             MOV AX, @DATA
             MOV DS, AX
    
    ; Print message for num1
             MOV AH, 9
             LEA DX, a1
             INT 21H

    ; Read num1 (character)
             MOV AH, 1
             INT 21H

             MOV AH, 1
             INT 21H
             SUB AL, 30H      ; Convert ASCII to number
             MOV num1, AL

    ; Print message for num2
             MOV AH, 9
             LEA DX, a2
             INT 21H

    ; Read num2 (character)
             MOV AH, 1
             INT 21H
    
             MOV AH, 1
             INT 21H
             SUB AL, 30H      ; Convert ASCII to number
             MOV num2, AL

    ; Compare num1 and num2
             MOV AL, num1
             CMP AL, num2
             JG  NUM1_BIG
             JL  NUM2_BIG

    NUM1_BIG:
             MOV AH, 9
             LEA DX, a3
             INT 21H
             JMP EXIT

    NUM2_BIG:
             MOV AH, 9
             LEA DX, a4
             INT 21H
             JMP EXIT

    EXIT:    
             MOV AH, 4CH
             INT 21H
MAIN ENDP
END MAIN
