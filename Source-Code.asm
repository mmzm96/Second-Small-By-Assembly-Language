.MODEL SMALL
.STACK 100H
.DATA
L1 DB ? ;VARIABLE
C DB ?
M1 DB 'Enter 4 numbers to find 2nd SMALL number: $' 
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    LEA AX,M1  ;MASSAGE SHOW
    MOV AH,9   ;CHARACTER SHOW
    INT 21H
    
    ;NEW LINE
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H
    
    ;INPUT
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    ;SPACE
    MOV AH,2
    MOV DL,009
    INT 21H
   
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,009
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,009
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    ;NEW LINE
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H    
    MOV AH,2
    MOV DL,010
    INT 21H
    MOV DL,013
    INT 21H
        
    ;COMPARE
    CMP BL,BH
    JLE BLL 
    
    CMP BH,CL
    JLE BHH
    
    CMP CL,CH
    JLE CLLG
    JGE CHLG
    
    BLL:        ;LABEL NAME
    CMP BL,CL
    JLE BLL1
    
    CMP CL,CH
    JLE CLLG
    JGE CHLG
    
    BLL1:
    CMP BL,CH
    JLE BLLG
    JGE CHLG
    
    BHH:
    CMP BH,CH
    JLE BHLG
    JGE CHLG
    
    BLLG:
    MOV L1,BL
    SUB BH,BL
    ADD BH,48
    MOV C,BH

    SUB CH,BL
    ADD CH,48
    MOV AH,CH

    SUB CL,BL
    ADD CL,48
    MOV DH,CL
    
    CMP C,AH
    JLE BLLG1
    
    CMP AH,DH
    JLE BLLG2
    JGE BLLG3
    
    BLLG1:
    CMP C,DH
    JGE BLLG3
    
    MOV BL,L1
    ADD BL,C
    SUB BL,48
    JMP BLP
    
    BLLG2:
    MOV BL,L1
    ADD BL,AH
    SUB BL,48
    JMP BLP 
    
    BLLG3:
    MOV BL,L1
    ADD BL,DH
    SUB BL,48
    JMP BLP
    
    BLP:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
   
    BHLG:
    MOV L1,BH
    SUB BL,BH
    ADD BL,48
    MOV C,BL

    SUB CH,BH
    ADD CH,48
    MOV AH,CH
    
    SUB CL,BH
    ADD CL,48
    MOV DH,CL
    
    CMP C,AH
    JLE BHLG1
    
    CMP AH,DH
    JLE BHLG2
    JGE BHLG3
    
    BHLG1:
    CMP C,DH
    JGE BHLG3
    
    MOV BH,L1
    ADD BH,C
    SUB BH,48
    JMP BHP
    
    BHLG2:
    MOV BH,L1
    ADD BH,AH
    SUB BH,48
    JMP BHP 
    
    BHLG3:
    MOV BH,L1
    ADD BH,DH
    SUB BH,48
    JMP BLP
    
    BHP:
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT
    
    CLLG:
    MOV L1,CL
    SUB BH,CL
    ADD BH,48
    MOV C,BH
  
    SUB CH,CL
    ADD CH,48
    MOV AH,CH
    
    SUB BL,CL
    ADD BL,48
    MOV DH,BL
    
    CMP C,AH
    JLE CLLG1
    
    CMP AH,DH
    JLE CLLG2
    JGE CLLG3
    
    CLLG1:
    CMP C,DH
    JGE CLLG3
    
    MOV CL,L1
    ADD CL,C
    SUB CL,48
    JMP CLP
    
    CLLG2:
    MOV CL,L1
    ADD CL,AH
    SUB CL,48
    JMP CLP 
    
    CLLG3:
    MOV CL,L1
    ADD CL,DH
    SUB CL,48
    JMP CLP
    
    CLP:
    MOV AH,2
    MOV DL,CL
    INT 21H
    JMP EXIT
    
    CHLG:
    MOV L1,CH
    SUB BH,CH
    ADD BH,48
    MOV C,BH
  
    SUB BL,CH
    ADD BL,48
    MOV AH,BL
    
    SUB CL,CH
    ADD CL,48
    MOV DH,CL
    
    CMP C,AH
    JLE CHLG1
    
    CMP AH,DH
    JLE CHLG2
    JGE CHLG3
    
    CHLG1:
    CMP C,DH
    JGE CHLG3
    
    MOV CH,L1
    ADD CH,C
    SUB CH,48
    JMP CHP
    
    CHLG2:
    MOV CH,L1
    ADD CH,AH
    SUB CH,48
    JMP CHP 
    
    CHLG3:
    MOV CH,L1
    ADD CH,DH
    SUB CH,48
    JMP CHP
    
    CHP:
    MOV AH,2
    MOV DL,CH
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
