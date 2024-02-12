
    ORG    $1000
START:                  ; first instruction of program

INITIALIZE:
    MOVE.B  #3, D0
    MOVE.B  #0, D1

GAME_LOOP:
    CMP.B   #1, D0  ;COMPARE #1 TO VALUE IN D0
    BNE GAME_POINTS ;IF Not Equal BRANCH INTO GAME_POINTS
    BEQ GAME_OVER   ;IF EQual BRANCH INTO GAME_OVER
GAME_POINTS:
    ADD.B   #10,    D1
    SUB.B   #1, D0
    BRA     GAME_LOOP
    
GAME_OVER:

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
