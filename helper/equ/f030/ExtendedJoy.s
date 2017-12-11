                                    ; ####### F030 Extended Joystick/Lightpen Ports    	           ###########
                                    ; ------+------------------------------------------------------+----------
f030_extjoy_buttons EQU $FFFF9200   ; word  | Fire buttons 1-4                         Bit 3 2 1 0 | R    
                                    ;       | Pause/F0 ------------------------------------' | | | |
                                    ;       | F1 --------------------------------------------' | | |
                                    ;       | F2 ----------------------------------------------' | |
                                    ;       | Option/F3 -----------------------------------------' |
f030_extjoy_rdmask  EQU $FFFF9202   ; word  | Read Mask (0 - pin read)                             | W    
f030_extjoy_inputs  EQU $FFFF9202   ; word  | Joystick Inputs                  BIT 7 6 5 4 3 2 1 0 | R    
                                    ;       | Controller 1 pin 4 ------------------' | | | | | | | |
                                    ;       | Controller 1 pin 3 --------------------' | | | | | | |
                                    ;       | Controller 1 pin 2 ----------------------' | | | | | |
                                    ;       | Controller 1 pin 1 ------------------------' | | | | |
                                    ;       | Controller 0 pin 4 --------------------------' | | | |
                                    ;       | Controller 0 pin 3/Paddle 1 Trigger -----------' | | |
                                    ;       | Controller 0 pin 2/Paddle 0 Trigger -------------' | |
                                    ;       | Controller 0 pin 1 --------------------------------' |
                                    ;       |                            BIT 15 14 13 12 11 10 9 8 |
                                    ;       | Controller 1 pin 14 -----------'   |  |  |  |  | | | |
                                    ;       | Controller 1 pin 13 ---------------'  |  |  |  | | | |
                                    ;       | Controller 1 pin 12 ------------------'  |  |  | | | |
                                    ;       | Controller 1 pin 11 ---------------------'  |  | | | |
                                    ;       | Controller 0 pin 14 ------------------------'  | | | |
                                    ;       | Controller 0 pin 13 ---------------------------' | | |
                                    ;       | Controller 0 pin 12 -----------------------------' | |
                                    ;       | Controller 0 pin 11 -------------------------------' |
f030_extjoy_padX0   EQU $FFFF9210   ; word  | X Paddle 0 Position              BIT 7 6 5 4 3 2 1 0 | R    
f030_extjoy_padY0   EQU $FFFF9212   ; word  | Y Paddle 0 Position              BIT 7 6 5 4 3 2 1 0 | R    
f030_extjoy_padX1   EQU $FFFF9214   ; word  | X Paddle 1 Position              BIT 7 6 5 4 3 2 1 0 | R    
f030_extjoy_padY1   EQU $FFFF9216   ; word  | Y Paddle 1 Position              BIT 7 6 5 4 3 2 1 0 | R    
f030_extjoy_lpX     EQU $FFFF9220   ; word  | Lightpen X-Position          BIT 9 8 7 6 5 4 3 2 1 0 | R    
f030_extjoy_lpY     EQU $FFFF9222   ; word  | Lightpen Y-Position          BIT 9 8 7 6 5 4 3 2 1 0 | R    
