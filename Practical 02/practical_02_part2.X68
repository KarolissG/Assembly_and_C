*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

                            ;moves into data registers
        MOVE.L #%100,   D0  ;move long binary (4 in hex)
        MOVE.L #$100,   D1  ;long hex into memory
        MOVE.L #100,    D2  ;long decimal into memory    64 in hex
        
        MOVE.L D0,  $3000   
        MOVE.L D1,  $3010
        MOVE.L D2,  $3020   ;moves values from registers to memory
        
        MOVE.W #100,    $3020   ;moves word decimal to memory
        MOVE.W #$100,    $3010  ;moves word hex to memory
        MOVE.W #%100,    $3000  ;moves word binary to memory
        ;word data overwrite part of long data
        
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
