*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  

    LEA HEALTH, A1      ;Puts the address of HEALTH into A1
    LEA POINTS, A2
    LEA MONEY,  A3
    LEA HUNGER, A4
    LEA STAMINA,A5
    LEA BOUNTY, A6
    
    
    SUB.W #100,  (A5)   ;-10 STAMINA
    SUB.B #10,  (A1)    ;-10 HEALTH
    SUB.B #3,   (A4)    ;-3 HUNGER
    ADD.B #10,   (A1)    ;+10 HEALTH
    SUB.W #10000,(A3)   ;-10,000 MONEY
    SUB.L #10000,(A6)   ;-10,000 BOUNTY
    
    
                                                  
    SIMHALT            

HEALTH  dc.b $64         ;Declares a byte value HEALTH variable of hex value 64
POINTS  dc.b $00         ;declare points byte as hex 0
MONEY   dc.w $2AC6       ;declare money as word 2AC6 in hex (10,950)in decimal
HUNGER  dc.b $24         ;declare hunger as byte hex 24
STAMINA dc.w $315        ;declare stamina as hex 315 (789) in decimal
BOUNTY  dc.l $F4240      ;declare bounty as hex F4240 (1 mil) in decimal
    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
