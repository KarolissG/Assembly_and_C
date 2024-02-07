
    ORG    $1000
START:             
    ;MOVE HEALTH TO MEMORY $3000
    MOVE.B  #100,   $3000   
    
    ;LOAD MEMORY ADDRESS $3000 INTO REGISTER A1
    LEA     $3000,  A1 
     
    ;HIT BY NPC -20 HP
    SUB.B   #20,    (A1)
    
    ;PICK UP HEALTH PACH +10 HP 
    ADD.B   #10,    (A1)   


    SIMHALT            
    
    END    START        


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
