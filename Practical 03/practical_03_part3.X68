*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  

    LEA HEALTH, A3      ;Puts the address of HEALTH into A3 
    SUB.B #10,  (A3)    ;Subtracts 10 from the value stored in address of (A3)
                                                  
    SIMHALT            

HEALTH dc.b $64         ;Declares a byte value HEALTH variable of hex value 64
    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
