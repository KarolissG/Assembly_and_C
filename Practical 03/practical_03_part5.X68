
    ORG    $1000
START:            

    MOVE.L #ACHIEVEMENT_POINTS, A1  ;SAVE MEMORY ADDRESS INTO A1
    MOVE.L #0 ,D0                   ;MOVE 0 INTO D0 TO CLEAR THE REGISTER
    
    MOVE.L  (A1)+,D2                ;MOVE FIRST LIST NUM INTO D2
    ADD.L   D2, D0                  ;ADD D2 INTO D0
    
    MOVE.L  (A1)+,D2                ;MOVE SECOND LIST NUM INTO D2
    ADD.L   D2,D0                   ;ADD D2 INTO D0
    
    MOVE.L  (A1)+,D2                ;MOVE THIRD LIST NUM INTO D2
    ADD.L   D2,D0                   ;ADD D2 INTO D0
    
    MOVE.L  (A1)+,D2                ;MOVE FOURTH LIST NUM INTO D2
    ADD.L   D2,D0                   ;ADD D2 INTO D0
    
    MOVE.L  (A1)+,D2                ;MOVE FIFTH LIST NUM INTO D2
    ADD.L   D2,D0                   ;ADD D2 INTO D0
                                    ;FINAL VALUE(80 DECIMAL)(50 HEX)



    SIMHALT          
ACHIEVEMENT_POINTS: DC.L 5,10,15,20,30  ;DECLARE A LIST OF DECIMAL VALUES

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
