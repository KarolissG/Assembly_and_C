
    ORG    $1000
START:                  ; first instruction of program
    
    LEA PLAYER_POSITION,    A1
    LEA EMEMY_POSITION, A2        
    ;EMENY
    MOVE.B  (A1)+,D1     ;X
    MOVE.B  (A1),D2    ;Y
    ;PLAYER
    MOVE.B  (A2)+,D3     ;X
    MOVE.B  (A2),D4    ;Y
    
COLLISION_CHECK_X:
    CMP D1, D3  
    BEQ COLLISION_CHECK_Y
    CMP #55,    D1
    BNE ENEMY_NEXT_MOVE_X
    CMP #55,    D3
    BSR PLYR_NEXT_MOVE_X   
   
    
COLLISION_CHECK_Y:
    CMP D2, D4
    BEQ COLLISION
    CMP #55,    D2
    BNE ENEMY_NEXT_MOVE_Y
    CMP #55,    D4
    BNE PLYR_NEXT_MOVE_Y
    BRA COLLISION_CHECK_X
    
PLYR_NEXT_MOVE_X:
    ADD.B   #1, D3
    RTS
ENEMY_NEXT_MOVE_X:
    ADD.B   #1, D1 
    RTS
PLYR_NEXT_MOVE_Y:
    ADD.B   #1, D4
    RTS
ENEMY_NEXT_MOVE_Y:
    ADD.B   #1, D2
    RTS
   
COLLISION:
    BRA GAME_OVER
    
GAME_OVER:

    SIMHALT             ; halt simulator
    
PLAYER_POSITION: DC.B   10, 15 ;DECLARE BYTE LIST
EMEMY_POSITION: DC.B    50, 55
* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
