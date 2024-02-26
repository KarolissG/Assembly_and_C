    ORG    $1000
START:                  ; first instruction of program

    LEA $4000,  A7
    
    MOVE.B  #1,    -(A7)    ;MOVES BACKWARDS THROUGH MEMORY
    MOVE.B  #2,    -(A7)
    MOVE.B  #3,    -(A7)
    MOVE.B  #4,    -(A7)


    MOVE.B  (A7)+,  D1  ;MOVES FORWARD THROUGH MEMORY  
    MOVE.B  (A7)+,  D1
    MOVE.B  (A7)+,  D1
    MOVE.B  (A7)+,  D1
    
    

END:
   
    END    START    


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
