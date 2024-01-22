*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

        MOVE.L #%100,   D0  ;binary 4 in hex
        MOVE.L #$100,   D1  ;hex
        MOVE.L #100,    D2  ;decimal    64 in hex
        ;moves into data registers
        MOVE.L D0,  $3000   
        MOVE.L D1,  $3010
        MOVE.L D2,  $3020   ;moves values from registers to memory
        
        MOVE.W #100,    $3020   ;moves word decimal to memory
        MOVE.W #$100,    $3010  ;moves word hex to memory
        MOVE.W #%100,    $3000  ;moves word binary to memory
        
        MOVE.B #100,    $3020   ;moves byte decimal to memory
        MOVE.B #$64,    $3010   ;moves byte hex to memory
        MOVE.B #%10001111,    $3000 ;moves byte binary to memory
        ;word and byte can overwrite parts of long data

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
