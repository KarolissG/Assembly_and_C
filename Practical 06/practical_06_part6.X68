    ORG    $1000
START:                  ; first instruction of program

    MOVE.L  #HEALTH,    -(SP) ;MOVE HEALTH VALUE INTO STACK
    
    MOVE.B  #14,    D0
    MOVE.B  #14,    D1
    
    MOVE.L  D0,-(SP)    ;PLAYER X COORD
    MOVE.L  D1,-(SP)    ;ENEMY X COORD

    JSR GAME_LOOP
    BSR HEADS_UP_DISPLAY    
    BRA END_GAME
    
GAME_LOOP:                    ;OFFSET BY 4 BYTES
    MOVE.L 4(SP),D1          ;MOVE LONG FROM STACK TO A1
    MOVE.L 8(SP),D0  
    
    CMP D0, D1
    BEQ DAMAGE
    BRA NO_DAMAGE
   
DAMAGE:
HEADS_UP_DISPLAY:
    LEA MESSAGE,    A1
    MOVE.B  #14,    D0
    TRAP    #15
    MOVE.B  HEALTH, D1
    MOVE.B  #3, D0
    TRAP    #15
    RTS
 
END_GAME
    SIMHALT
HEALTH: DC.B    100
  
    END START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
