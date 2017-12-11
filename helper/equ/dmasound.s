                                    ; ####### DMA Sound System                                     ###########
                                    ; ------+------------------------------------------------------+----------
dmasnd_bufirq       EQU $FFFF8900   ; byte  | Buffer interrupts                        BIT 3 2 1 0 |R/W 
                                    ;       | TimerA-Int at end of record buffer ----------' | | | |
                                    ;       | TimerA-Int at end of replay buffer ------------' | | |
                                    ;       | MFP-15-Int (I7) at end of record buffer ---------' | |
                                    ;       | MFP-15-Int (I7) at end of replay buffer -----------' |
                                    ; ------+------------------------------------------------------+----------
dmasnd_cr           EQU $FFFF8901   ; byte  | DMA Control Register             BIT 7 . 5 4 . . 1 0 | R/W
                                    ;       | 1 - select record register ----------+   | |     | | |    
                                    ;       | 0 - select replay register ----------'   | |     | | |    
                                    ;       | Loop record buffer ----------------------' |     | | |    
                                    ;       | DMA Record on -----------------------------'     | | |    
                                    ;       | Loop replay buffer ------------------------------' | |     
                                    ;       | DMA Replay on -------------------------------------' |     
                                    ; ------+------------------------------------------------------+----------
dmasnd_frameS_h     EQU $FFFF8903   ; byte  | Frame start address (high byte)                      | R/W  
dmasnd_frameS_m     EQU $FFFF8905   ; byte  | Frame start address (mid byte)                       | R/W  
dmasnd_frameS_l     EQU $FFFF8907   ; byte  | Frame start address (low byte)                       | R/W  
dmasnd_frameC_h     EQU $FFFF8909   ; byte  | Frame address counter (high byte)                    | R    
dmasnd_frameC_m     EQU $FFFF890B   ; byte  | Frame address counter (mid byte)                     | R    
dmasnd_frameC_l     EQU $FFFF890D   ; byte  | Frame address counter (low byte)                     | R    
dmasnd_frameE_h     EQU $FFFF890F   ; byte  | Frame end address (high byte)                        | R/W  
dmasnd_frameE_m     EQU $FFFF8911   ; byte  | Frame end address (mid byte)                         | R/W  
dmasnd_frameE_l     EQU $FFFF8913   ; byte  | Frame end address (low byte)                         | R/W  
                                    ; ------+------------------------------------------------------+----------
dmasnd_trackctrl    EQU $FFFF8920   ; byte  | DMA Track Control                    BIT 5 4 . . 1 0 | R/W 
                                    ;       | 00 - Set DAC to Track 0 -----------------+-+     | | |
                                    ;       | 01 - Set DAC to Track 1 -----------------+-+     | | |
                                    ;       | 10 - Set DAC to Track 2 -----------------+-+     | | |
                                    ;       | 11 - Set DAC to Track 3 -----------------+-'     | | |
                                    ;       | 00 - Play 1 Track -------------------------------+-+ |
                                    ;       | 01 - Play 2 Tracks ------------------------------+-+ |
                                    ;       | 10 - Play 3 Tracks ------------------------------+-+ |
                                    ;       | 11 - Play 4 Tracks ------------------------------+-' |
                                    ; ------+------------------------------------------------------+----------
dmasnd_mode         EQU $FFFF8921   ; byte  | Sound mode control               BIT 7 6 . . . . 1 0 | R/W  
                                    ;       | 0 - Stereo, 1 - Mono ----------------' |         | | |
                                    ;       | 0 - 8bit ------------------------------+         | | |
                                    ;       | 1 - 16bit -----------------------------'         | | |    
                                    ;       | Frequency control bits                           | | |
                                    ;       | 00 - Off ----------------------------------------+-+ |    
                                    ;       | 01 - 12517hz frequency --------------------------+-+ |
                                    ;       | 10 - 25033hz frequency --------------------------+-+ |
                                    ;       | 11 - 50066hz frequency --------------------------+-' |
                                    ;       | Samples are always signed. In stereo mode, data is   |
                                    ;       | arranged in pairs with high pair the left channel,low|
                                    ;       | pair right channel. Sample length MUST be even in    |
                                    ;       | either mono or stereo mode.                          |
                                    ;       | Example: 8 bit Stereo : LRLRLRLRLRLRLRLR             |
                                    ;       |         16 bit Stereo : LLRRLLRRLLRRLLRR 		       |
                                    ;       | 2 track 16 bit stereo : LLRRllrrLLRRllrr 	           |
