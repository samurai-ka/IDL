                                    ; #######  Falcon030 VIDEL Video Controller                   ###########
                                    ; ------+-----------------------------------------------------+----------
f030_videl_offsetnl EQU $FFFF820E   ; word  | Offset to next line                                 | R/W 
f030_videl_vwrap    EQU $FFFF8210   ; word  | VWRAP - Linewidth in words                          | R/W 
f030_videl_spshift  EQU $FFFF8266   ; word  | SPSHIFT                  BIT 10 . 8 . 6 5 4 3 2 1 0 | R/W 
                                    ;       |2-colour mode -----------------'   |   | | | | | | | |
                                    ;       |Truecolour mode -------------------'   | | | | | | | |
                                    ;       |Use external hsync --------------------' | | | | | | |
                                    ;       |Use external vsync ----------------------' | | | | | |
                                    ;       |8 Bitplane mode ---------------------------' | | | | |
                                    ;       |? Bitplane mode -----------------------------' | | | |
                                    ;       |? Bitplane mode -------------------------------' | | |
                                    ;       |? Bitplane mode ---------------------------------' | |
                                    ;       |? Bitplane mode -----------------------------------' |
                                    ;       +-----------------------------------------------------+
                                    ;       |      Horizontal Control Registers            (9bit) |
f030_videl_hcr_hhc  EQU $FFFF8280   ; word  |HHC - Horizontal Hold Counter                        | R   
f030_videl_hcr_hht  EQU $FFFF8282   ; word  |HHT - Horizontal Hold Timer                          | R/W 
f030_videl_hcr_hbb  EQU $FFFF8284   ; word  |HBB - Horizontal Border Begin                        | R/W 
f030_videl_hcr_hbe  EQU $FFFF8286   ; word  |HBE - Horizontal Border End                          | R/W 
f030_videl_hcr_hdb  EQU $FFFF8288   ; word  |HDB - Horizontal Display Begin                       | R/W 
f030_videl_hcr_hde  EQU $FFFF828A   ; word  |HDE - Horizontal Display End                         | R/W 
f030_videl_hcr_hss  EQU $FFFF828C   ; word  |HSS - Horizontal SS                                  | R/W 
f030_videl_hcr_hfs  EQU $FFFF828E   ; word  |HFS - Horizontal FS                                  | R/W 
f030_videl_hcr_hee  EQU $FFFF8290   ; word  |HEE - Horizontal EE                                  | R/W 
                                    ;       +-----------------------------------------------------+
                                    ;       |      Vertical Control Registers              (10bit)|
f030_videl_vcr_vfc  EQU $FFFF82A0   ; word  |VFC - Vertcial Frequency Counter                     | R   
f030_videl_vcr_vft  EQU $FFFF82A2   ; word  |VFT - Vertical Frequency Timer                       | R/W 
f030_videl_vcr_vbb  EQU $FFFF82A4   ; word  |VBB - Vertical Border Begin  (count in 1/2 lines)    | R/W 
f030_videl_vcr_vbe  EQU $FFFF82A6   ; word  |VBE - Vertical Border End    (count in 1/2 lines)    | R/W 
f030_videl_vcr_vdb  EQU $FFFF82A8   ; word  |VDB - Vertical Display Begin                         | R/W 
f030_videl_vcr_vde  EQU $FFFF82AA   ; word  |VDE - Vertical Display End                           | R/W 
f030_videl_vcr_vss  EQU $FFFF82AC   ; word  |VSS - Vertical SS                                    | R/W 
                                    ;       +-----------------------------------------------------+
f030_videl_vclock   EQU $FFFF82C0   ; word  |??? - Video Clock (?) (Super78 puts $182 here)       | R/W 
f030_videl_vctrl    EQU $FFFF82C2   ; word  |VCO - Video Control                      BIT 3 2 1 0 | R/W 
                                    ;       |Quarter pixel width (quadruple pixels) ------' | | | |
                                    ;       |Half pixel width (double pixels) --------------' | | |
                                    ;       |Skip line (interlace) ---------------------------' | |
                                    ;       |Line doubling -------------------------------------' |