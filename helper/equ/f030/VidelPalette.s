                                    ; #######  Falcon VIDEL Palette Registers                      ###########
                                    ; ------+------------------------------------------------------+----------
                                    ;       |             BIT 33222222 22221111 111111             |
                                    ;       |                 10987654 32109876 54321098 76543210  |
                                    ;       |                 RRRRRr.. GGGGGg.. ........ BBBBBb..  |
f030_videl_pal256   EQU $FFFF9800   ; long  | Palette Register  0                 Lowercase = LSB  |R/W 
                   ;        :       ;       |   :        :      :                                  | :     
                   ;    $FFFF9BFC   ;       | Palette Register 255                                 |R/W
