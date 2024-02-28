
* Title      : Business Tycoon
* Written by : Karolis Grigaliunas
* Student No.: C00287940 
* Date       :  
* Description: Basic business tycoon where you try get as much money as possible without going bankrupt
    ORG    $1000
START:
    
    LEA MONTH_COUNT,    A2

    LEA NAME,  A1
    MOVE.B  #14,    D0
    TRAP    #15
    MOVE.W  #2,  D0
    TRAP    #15
    MOVE.L  A1, A5 
    DIVU    #2,D1
    SUB.B   D1, BANNER_POS  
    
    ;CLEAR SCREEN
    MOVE.W  #$FF00,D1
    MOVE.B  #11, D0 
    TRAP #15
    CLR.L D1
    
    
    BSR PRINT_BANNER
        
   ;REMOVE TYPING
    MOVE.B  #0,D1
    MOVE.B  #12, D0
    TRAP #15
    ;REMOVE _ WHEN INPUTING
    MOVE.B  #0,D1
    MOVE.B  #16, D0
    TRAP #15
    BRA LOOP
    BRA END

LOOP:
    BSR HUD
    
    ;WHEN INPUT RECONISED ADD ONE TO MONTH_COUNT AND ADD TO MONEY
    MOVE.B  #5, D0
    TRAP #15
    ADD.W   #$000001, MONTH_COUNT
    MOVE.L INCOME, D2
    ADD.L   D2    ,MONEY
    
    
     
    BRA LOOP
HUD:
    BSR PRINT_MONEY  
    BSR PRINT_MONTH
    BSR PRINT_LEVELS    
    RTS
    
PRINT_BANNER:
    LEA LINE,   A1
    MOVE.B  #14 ,D0
    TRAP    #15  
    
    MOVE.L  A5, A1
    MOVE.B  #11,    D0
    MOVE.W  BANNER_POS, D1
    TRAP    #15
    
    MOVE.L    A5, A1
    MOVE.B  #14,    D0
    TRAP    #15
    
    BSR NEWLINE
    LEA LINE,   A1
    MOVE.B  #14 ,D0
    TRAP    #15
    BSR NEWLINE
    RTS
    
PRINT_MONTH:
    MOVE.B  #11,    D0
    MOVE.W  #$0005, D1
    TRAP    #15
    
    LEA MONTH_MSG,  A1
    MOVE.W  MONTH_COUNT,  D1
    MOVE.B  #17,    D0 
    TRAP    #15
    CLR.L D1
    CLR.L D0
    RTS
    
PRINT_MONEY:
    
    MOVE.B  #11,    D0
    MOVE.W  #$0004, D1
    TRAP    #15

    LEA     MONEY_MSG,  A1
    MOVE.L  MONEY,  D1
    MOVE.B  #17,    D0
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    RTS
    
PRINT_LEVELS:
    MOVE.B  #11,    D0
    MOVE.W  #$0006, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA     AD_LVL_MSG,  A1
    MOVE.B  AD_LVL,  D1
    MOVE.B  #17,    D0
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    MOVE.B  #11,    D0
    MOVE.W  #$0007, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA     LEGAL_LVL_MSG,  A1
    MOVE.B  LEGAL_LVL,  D1
    MOVE.B  #17,    D0
    TRAP    #15  
    CLR.L D0  
    CLR.L D1
    RTS

NEWLINE:
    LEA EMPTY,    A1
    MOVE.B  #0, D0
    TRAP    #15
    RTS
    
RANDOM_NUMBER:     
    MOVE.B #8, D0       #Loads D1 with Time in 100's of Seconds since midnight (6 Bits)
    TRAP #15            #Place time in D1
    AND.L #$5FFFFF, D1  # AND 6 Bits to prevent any overflow
    DIVU #100, D1       #Divide by 100, 1000, 10000 depending on Number range required
    SWAP D1             #SWAP Higher Order Word and Lower Order Word in D1
    ADDQ.W #1, D1       #Add 1 to D1.W so number is at least 1
    MOVE.W D1, D2       #Extract the number from D1.W
    CLR.L D1            # Clear contents of D1
    MOVE.W D2, D1       #Move the generated number to D1
    RTS

END:

    SIMHALT 
    
MONTH_COUNT DC.W    0
MONEY   DC.L    10000
AD_LVL  DC.B    1
LEGAL_LVL   DC.B    1
LAWSUIT_CHANCE  DC.B    10
BANNER_POS: DC.W    $2501
INCOME  DC.L    500

    
LAWSUIT:    DC.B    ' LAWSUIT CHANCE: ',0
MONEY_MSG: DC.B ' MONEY: ',0
MONTH_MSG: DC.B ' MONTH: ',0
AD_LVL_MSG:    DC.B    ' ADVERT LVL: ',0
LEGAL_LVL_MSG:    DC.B    ' LEGAL LVL: ',0
NAME: DC.B  'Enter the name of your business: ',0
LINE:   DC.B    '----------------------------------------------------------------------------------------------'  ,0
EMPTY:    DC.B    ' ',0
    END    START










*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
