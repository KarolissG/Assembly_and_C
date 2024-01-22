*-----------------------------------------------------------
* Title      :
* Written by :Karolis Grigaliunas
* Date       :
* Description: Show memory overwriting
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

        MOVE.L #%10011,   D0  ;binary 13 in hex
        MOVE.L #$A3F843A1,   D1  ;hex
        MOVE.L #256,    D2  ;decimal 100 in hex
        
        MOVE.L D0,  $3000   ;moving data in registers D0-2 to memory
        MOVE.L D1,  $3010
        MOVE.L D2,  $3020
        
        MOVE.B #128,    D3   ;decimal 80 in hex
        MOVE.B #$AF,    D4   ;hex affects the long value stored in same location
        MOVE.B #%1100110,    D5 ;binary 66 in hex
        
        MOVE.B D3,  $3000   ;moving data in registers D3-5 to memory 
        MOVE.B D4,  $3010   ;byte overwrites part of long data 
        MOVE.B D5,  $3020
        
        MOVE.L $3010,   D6  ;move the overwriten long value to register D6
        
        MOVE.W #99,    $3000   ;decimal 63 in hex   
        MOVE.W #$C4,    $3010  ;hex put into memory
        MOVE.W #%10110,    $3020  ;binary 16 in hex
                            ;moving data straight to memory
                            ;this overwrites the byte data
                            
        MOVE.L #56, $3000   ;decimal 38 in hex
        MOVE.L #$8E,    $3010
        MOVE.L #%11110000,  $3020   ;binary F0 in hex
        ;LONG DATA OVERWRITES MEMORY LOCATION FULLY

        

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
