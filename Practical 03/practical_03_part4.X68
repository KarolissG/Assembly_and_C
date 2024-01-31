*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  

    LEA HEALTH, A1      ;save all declared values into address registers
    LEA POINTS, A2
    LEA MONEY,  A3
    LEA HUNGER, A4
    LEA STAMINA,A5
    LEA DEBT,   A6
    
    
    SUB.W #100, (A5)    ;-10 0 STAMINA
    SUB.B #10,  (A1)    ;-10 HEALTH
    SUB.B #3,   (A4)    ;-3 HUNGER
    ADD.B #10,  (A1)    ;+10 HEALTH
    SUB.W #10000,(A3)   ;-10,000 MONEY
    SUB.L #10000,(A6)   ;-10,000 BOUNTY
    ADD.B #25,  (A2)    ;+25 POINTS
    
    
                        ;MOVE UPDATED VALUES INTO DATA REGISTERS
    MOVE.B (A2),D0      ;POINTS
    MOVE.B (A1),D1      ;HEALTH
    MOVE.W (A5),D2      ;STAMINA
    MOVE.B (A4),D3      ;HUNGER
    MOVE.W (A3),D4      ;MONEY
    MOVE.L (A6),D5      ;DEBT
    
    
    
    
                                                  
    SIMHALT            

HEALTH  dc.b $64        ;Declares a byte value HEALTH variable of hex value 64
POINTS  dc.b $00        ;declare points byte as hex 0
MONEY   dc.w $2AC6      ;declare money as word 2AC6 in hex (10,950)in decimal
HUNGER  dc.b $24        ;declare hunger as byte hex 24
STAMINA dc.w $315       ;declare stamina as hex 315 (789) in decimal
DEBT  dc.l $F4240       ;declare debt as hex F4240 (1 mil) in decimal
    END    START        ; last line of source









































*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
