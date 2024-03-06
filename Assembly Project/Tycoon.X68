
* Title      : Business Tycoon
* Written by : Karolis Grigaliunas
* Student No.: C00287940 
* Date       :  
* Description: Basic business tycoon where you try get as much money as possible without going bankrupt
    ORG    $1000
START:
    
    LEA LAWSUIT_SUCCESS,    A3
    LEA AD_COST,    A4
    LEA TRAINING_COST,  A5
    LEA LEGAL_COST, A6
    

    LEA NAME,  A1
    MOVE.B  #14,    D0
    TRAP    #15
    MOVE.W  #2,  D0
    TRAP    #15
    MOVE.L  A1, A5 
    DIVU    #2,D1
    SUB.B   D1, BANNER_POS  
   
   ;REMOVE TYPING
    MOVE.B  #0,D1
    MOVE.B  #12, D0
    TRAP #15
    ;REMOVE _ WHEN INPUTING
    MOVE.B  #0,D1
    MOVE.B  #16, D0
    TRAP #15
 
    BSR PRINT_BANNER

LOOP:
    BSR HUD
 
    MOVE.B  #5, D0
    TRAP #15
   
    BSR SHOP_TEST    
    BRA LOOP
    
    
SHOP_TEST: 
    CMP #$31,D1
    BEQ PRINT_SHOP
    
    
    ADD.W   #$000001, MONTH_COUNT
    MOVE.L  INCOME, D2
    ADD.L   D2   ,MONEY
    MOVEQ.L #0, D2
    
    BRA LAWSUIT_TICK
    
LAWSUIT_TICK:
    MOVE.B  LAWSUIT_CHANCE, D3
    CMP #$64, D3
    BEQ LOOP
    ADD.B   #1, D7
    BRA ADD_CHANCE  

ADD_CHANCE:
    CMP #4, D7 
    BGE CHANCE100
    ADD.B   #1, LAWSUIT_CHANCE
    MOVE.B   #0, D7
    BRA LOOP
CHANCE100:
    SUB.B   #1, LAWSUIT_CHANCE
    RTS
RESET_CHANCE:
    MOVE.B  #$00,   LAWSUIT_CHANCE
    BRA SHOP
    
UPGRADE_AD:
    ADD.L   #100,   INCOME
    ADD.B   #1, AD_LVL
    BRA SHOP
UPGRADE_LEGAL:
    BSR ISMAX
    MOVE.B  (A3)+,  D4
    ADD.B   #1, LEGAL_LVL
    BRA SHOP
    
ISMAX:
    MOVE.B  (A3),   D4
    CMP #90,    D4
    BEQ SHOP
    RTS
    
EXIT_TEST:
    CMP #$31,   D1
    BEQ PRINT_BANNER
    CMP #$32,   D1
    BEQ UPGRADE_AD
    CMP #$33,   D1
    BEQ UPGRADE_LEGAL
    CMP #$34,   D1
    BEQ RESET_CHANCE
    
    RTS
COST_TEST2:
      
SHOP:  
    BSR PRINT_UPGRADES
    
    MOVE.B  #5, D0
    TRAP #15
    
    BSR EXIT_TEST
    BRA SHOP
HUD:
    BSR PRINT_MONEY  
    BSR PRINT_MONTH
    BSR PRINT_LEVELS  
    BSR NEWLINE
     
    MOVE.B  #11,    D0
    MOVE.W  #$001D, D1
    TRAP    #15
    
    LEA LINE,   A1
    MOVE.B  #14 ,D0
    TRAP    #15
     
    MOVE.B  #11,    D0
    MOVE.W  #$011E, D1
    TRAP    #15
    
    LEA SHOP_MSG,   A1
    MOVE.B  #14,    D0
    TRAP    #15
    CLR.L D1
    CLR.L D0
    RTS
PRINT_SHOP:
    ;CLEAR SCREEN
    MOVE.W  #$FF00,D1
    MOVE.B  #11, D0 
    TRAP #15
    CLR.L D1
  
    LEA LINE,   A1
    MOVE.B  #14 ,D0
    TRAP    #15
    BSR NEWLINE
    
    LEA SHOP_BANNER,   A1
    MOVE.B  #11,    D0
    MOVE.W  #$2301, D1
    TRAP    #15
    
    MOVE.B  #14,    D0
    TRAP    #15
    BSR NEWLINE
    
    LEA LINE,   A1
    TRAP    #15
    
    MOVE.B  #11,    D0
    MOVE.W  #$001D, D1
    TRAP    #15
    
    LEA LINE,   A1
    MOVE.B  #14 ,D0
    TRAP    #15
    
    MOVE.B  #11,    D0
    MOVE.W  #$011E, D1
    TRAP    #15
    
    LEA EXIT_MSG,   A1
    MOVE.B  #14,    D0
    TRAP    #15
    
    BRA SHOP
PRINT_UPGRADES:
    ;PRINT ADVERTISEMENT
    MOVE.B  #11,    D0
    MOVE.W  #$2B05, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA COST_MSG,   A1
    MOVE.B  #17,    D0
    MOVE.L  (A4),   D1
    TRAP    #15
    

    MOVE.B  #11,    D0
    MOVE.W  #$0006, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA     AD_UP,  A1
    MOVE.B  AD_LVL,  D1
    MOVE.B  #17,    D0
    TRAP    #15
    CLR.L D0  
    CLR.L D1

    MOVE.B  #11,    D0
    MOVE.W  #$1E07, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    LEA INCOME_AMOUNT,  A1
    MOVE.L  INCOME, D1
    MOVE.B  #17,    D0
    TRAP    #15
    ;PRINT LEGAL
    MOVE.B  #11,    D0
    MOVE.W  #$280A, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA COST_MSG,   A1
    MOVE.B  #17,    D0
    MOVE.L  (A6),   D1
    TRAP    #15
    
    MOVE.B  #11,    D0
    MOVE.W  #$000B, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA     LEGAL_UP,  A1
    MOVE.B  LEGAL_LVL,  D1
    MOVE.B  #17,    D0
    TRAP    #15  
    CLR.L D0  
    CLR.L D1

    MOVE.B  #11,    D0
    MOVE.W  #$190C, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
   
    LEA LEGAL_STRENGHT,  A1
    MOVE.B  (A3), D1
    MOVE.B  #17,    D0
    TRAP    #15
    ;PRINT TRAINING
    
    MOVE.B  #11,    D0
    MOVE.W  #$270F, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA COST_MSG,   A1
    MOVE.B  #17,    D0
    MOVE.L  (A5),   D1
    TRAP    #15
    
    MOVE.B  #11,    D0
    MOVE.W  #$0010, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    
    LEA TRAINING_UP,    A1
    MOVE.B LAWSUIT_CHANCE,  D1
    MOVE.B  #17,    D0
    TRAP    #15  
    CLR.L D0  
    CLR.L D1
    RTS
PRINT_BANNER:

    ;CLEAR SCREEN
    MOVE.W  #$FF00,D1
    MOVE.B  #11, D0 
    TRAP #15
    CLR.L D1
    
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
    BRA LOOP
    
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
    
    MOVE.B  #11,    D0
    MOVE.W  #$0008, D1
    TRAP    #15
    CLR.L D0  
    CLR.L D1
    LEA LAWSUIT,    A1
    MOVE.B LAWSUIT_CHANCE,  D1
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
MONEY   DC.L    1000
AD_LVL  DC.B    1
AD_COST DC.L    5000, 10000, 35000, 90000, 150000, 315000, 635000, 1250000, 34500000, 5530000
INCOME_UPGRADE  DC.L    350, 795, 1400, 8750, 13750, 28500, 53450, 80265, 295000, 468000 
INCOME_UP_ADDRESS   DC.W    0
LEGAL_LVL   DC.B    1
LEGAL_COST  DC.L    7500, 15000, 50000, 250000, 1000000
LAWSUIT_SUCCESS DC.B    20, 35, 60, 85, 90
LAWSUIT_CHANCE  DC.B    2
BANNER_POS  DC.W    $2501
INCOME  DC.L    50  
TRAINING_COST   DC.L   10000, 35000, 89750, 150000, 300000, 850000, 1500000, 4500000  

COST_MSG:   DC.B    'COST: $ ',0
SHOP_MSG:   DC.B    ' (1):SHOP',0
EXIT_MSG:   DC.B    '(1):BACK TO THE OFFICE :(',0
SHOP_BANNER:   DC.B    'SHOP',0
MONEY_MSG: DC.B ' MONEY: ',0
MONTH_MSG: DC.B ' MONTH: ',0
AD_LVL_MSG:    DC.B    ' ADVERT LVL : ',0
LEGAL_LVL_MSG:    DC.B    ' LEGAL LVL: ',0
LAWSUIT:    DC.B    ' LAWSUIT CHANCE: ',0
TRAINING_UP:   DC.B    '(4) UPGRADE TRAINING (RESET LAWSUIT CHANCE):  ',0
AD_UP:  DC.B    '(2) UPGRADE ADVERTISING (INCREASE ADVERT LEVEL):  ',0
INCOME_AMOUNT:  DC.B  ' INCOME (MONTHLY): ',0
LEGAL_UP:   DC.B    '(3) UPGRADE LEGALTEAM (INCREASE LEGAL LEVEL):  ',0
LEGAL_STRENGHT: DC.B    'LEGAL TEAM STRENGHT: ',0

NAME: DC.B  'Enter the name of your business: ',0
LINE:   DC.B    '----------------------------------------------------------------------------------------------'  ,0

EMPTY:    DC.B    ' ',0
    END    START




















*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
