                                    ; ####### SHIFTER Video Controller                            ###########
                                    ; ------+-----------------------------------------------------+----------
shifter_dbaseh      EQU $FFFF8201   ; byte  | Video screen memory position (High byte)            | R/W
shifter_dbasem      EQU $FFFF8203   ; byte  | Video screen memory position (Mid byte)             | R/W
shifter_dbasel      EQU $FFFF820D   ; byte  | Video screen memory position (Low byte)             | R/W  
shifter_vcounthi    EQU $FFFF8205   ; byte  | Video address pointer (High byte)                   | R
shifter_vcountmid   EQU $FFFF8207   ; byte  | Video address pointer (Mid byte)                    | R
shifter_vcountlow   EQU $FFFF8209   ; byte  | Video address pointer (Low byte)                    | R
shifter_offset_nxl  EQU $FFFF820E   ; word  | Offset to next line                                 | R/W 
shifter_slwidth_h   EQU $FFFF820F   ; byte  | Width of a scanline (width in words-1)              | R/W  
shifter_slwidth_l   EQU $FFFF8210   ; word  | Width of a scanline (width in words)                | R/W 
shifter_horiz_scr   EQU $FFFF8265   ; byte  | Horizontal scroll register (0-15)                   | R/W  
                                    ; ------+-----------------------------------------------------+----------
shifter_videomode   EQU $FFFF820A   ; byte  | Video synchronization mode                  BIT 1 0 | R/W
                                    ;       | 0 - 60hz, 1 - 50hz -----------------------------+ | |
                                    ;       | 0 - internal, 1 - external sync ------------------' |     
                                    ; ------+-----------------------------------------------------+----------
shifter_res         EQU $FFFF8260   ; byte  | Shifter resolution                          BIT 1 0 | R/W
                                    ;       | 00 320x200x4 bitplanes (16 colors) -------------+-+ |
                                    ;       | 01 640x200x2 bitplanes (4 colors) --------------+-+ |
                                    ;       | 10 640x400x1 bitplane  (1 colors) --------------+-' |
shifter_res_tt      EQU $FFFF8262   ; word  | TT Shifter resolution                 BIT 15 . . 12 | R/W   
                                    ;       | Sample/Hold mode --------------------------'      | |
                                    ;       | Hypermono mode -----------------------------------' |
                                    ;       | Video Mode                               BIT 10 9 8 |
                                    ;       | 000  320x200x4 bitplanes (16 colors) ---------+-+-+ |
                                    ;       | 001  640x200x2 bitplanes (4 colors) ----------+-+-+ |
                                    ;       | 010  640x400x1 bitplane (2 colors)(Duochrome) +-+-+ |
                                    ;       | 100  640x480x4 bitplanes (16 colors) ---------+-+-+ |
                                    ;       | 110 1280x960x1 bitplane  (2 colors) ----------+-+-+ |
                                    ;       | 111  320x480x8 bitplanes (256 colors) --------+-+-' |
                                    ;       | ST Palette Bank                         BIT 3 2 1 0 |
