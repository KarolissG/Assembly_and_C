
    ORG    $1000
START:             
    ;MOVE HEALTH TO MEMORY $3000
    MOVE.B  #$64,   $3000  
    
    MOVE.B  #200,   $4000   ;BOSS HEALTH
     
    ;LOAD VALUES INTO MEMORY AND ADDRESS REGISTERS
    LEA     $3000,  A1 
    LEA     $4000,  A4
    LEA     STRENGTH,   A2
    LEA     POSITION,   A3
    LEA     GOLD,   A5
    
    MOVE.B  (A2),D1 ;MOVE STRENGTH VALUE INTO D1
    BSR     BATTLE  ;START BATTLE 
   
BATTLE:
    BSR ATTACK  ;BOTH ATTACK
    BSR ATTACK
    BSR ATTACK
    BSR HEAL_UP ;PLAYER HEALS
    BSR ATTACK
    BRA LOOT    ;PLAYER GETS LOOT AND HEALS TO FULL
    
HEAL_UP:
    SUB.B   #1,   (A3)  ;STEP BACK
    BSR     HEALTH_PICKUP   ;HEAL
    ADD.B   #1,   (A3)  #STEP FORWARD
    RTS
      
ATTACK: 
    ;HIT BY BOSS -20 HP
    SUB.B   #20,    (A1)
    SUB.B   D1,  (A4)   ;HIT BOSS FOR VALUE IN D1 (STRENGTH)
    RTS
   
HEALTH_PICKUP:
    ;POP POTION HEALTH +50 HP 
    ADD.B   #50,    (A1)  
    RTS

LOOT:
    ADD.B   #14,    (A2)    ;ADD STRENGTH FROM LOOT
    MOVE.B  #$64,    (A1)   ;FULL HEAL
    ADD.B   #60,    (A5)    ;+60 GOLD 

    SIMHALT       
STRENGTH    DC.B    $32 
POSITION    DC.B    $11  
GOLD        DC.B    $49
   
    
    END    START        





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
