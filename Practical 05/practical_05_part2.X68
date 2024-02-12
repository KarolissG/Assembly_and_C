
    ORG    $1000
START:                  ; first instruction of program
    
    LEA PLAYER_POSITION,    A1
    LEA EMEMY_POSITION, A2
    
    MOVE.B  #50, D1
    MOVE.B  #0, D2

COLLISION_CHECK:
    CMP D2, D1      ;COMPARE D2 TO D1
    BLT NEXT_MOVE   ;IF D2 IS Less Than D1 BRANCH INTO NEXT_MOVE
    BEQ COLLISION   ;IF D2 IS EQUAL TO D1 BRANCH INTO COLLISION
    
NEXT_MOVE:
    ADD.B   #1,    D2   
    BRA COLLISION_CHECK ;BRANCH INTO COLLISION_CHECK


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
