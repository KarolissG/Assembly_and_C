
    ORG    $1000
START:             
    ;MOVE HEALTH TO MEMORY $3000
    MOVE.B  #100,   $3000   
    
    ;LOAD MEMORY ADDRESS $3000 INTO REGISTER A1
    LEA     $3000,  A1 
    ;BRANCH INTO TAKING DAMAGE
    BSR     TAKING_DAMAGE
BACK_IN_THE_GAME:
    ;HELP PLAYER
    BSR     HEALTH_PICKUP
    BRA     GAME_END
    
TAKING_DAMAGE: 
    ;HIT BY NPC -20 HP
    SUB.B   #20,    (A1)
    BRA     BACK_IN_THE_GAME
   
HEALTH_PICKUP:
    ;PICK UP HEALTH +10 HP 
    ADD.B   #10,    (A1)  
    RTS

GAME_END:
    ;GAME OVER
    MOVE.B  #$00,   (A1)


    SIMHALT            
    
    END    START        



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
