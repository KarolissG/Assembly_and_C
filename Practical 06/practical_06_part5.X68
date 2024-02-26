    ORG    $1000
START:                  ; first instruction of program

    LEA $4000,  SP  ;MEMORY IN STACK
    
    MOVE.B  #1,    -(SP)    ;MOVES BACKWARDS THROUGH MEMORY STACK
    MOVE.B  #2,    -(SP)
    MOVE.B  #3,    -(SP)
    MOVE.B  #4,    -(SP)


    MOVE.B  (SP)+,  D1  ;MOVES FORWARD THROUGH MEMORY STACK
    MOVE.B  (SP)+,  D1
    MOVE.B  (SP)+,  D1
    MOVE.B  (SP)+,  D1
    
    

END:
   
    END    START    


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
