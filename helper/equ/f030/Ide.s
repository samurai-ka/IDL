                                    ; ####### IDE Controller 	                                  ###########
                                    ; ------+-----------------------------------------------------+----------
ide_dr              EQU $FFF00000   ; long  | Data Register                                       | R/W
ide_er              EQU $FFF00005   ; byte  | Error Register                  BIT 7 6 5 4 3 2 1 0 | R
                                    ;       | Bad block mark ---------------------' | | | | | | | |
                                    ;       | Uncorrectable error ------------------' | | | | | | |
                                    ;       | Media change ---------------------------' | | | | | |
                                    ;       | ID-Field not found -----------------------' | | | | |
                                    ;       | Media change requested ---------------------' | | | |
                                    ;       | Command aborted ------------------------------' | | |
                                    ;       | Track 0 not found ------------------------------' | |
                                    ;       | DAM not found ------------------------------------' |
ide_scr             EQU $FFF00009   ; byte  | Sector Count Register                               | W
ide_snr             EQU $FFF0000D   ; byte  | Sector Number Register                              | W
ide_clr             EQU $FFF00011   ; byte  | Cylinder Low Register                               | W
ide_chr             EQU $FFF00015   ; byte  | Cylinder High Register                              | W
ide_dhr             EQU $FFF00019   ; byte  | Drive Head Register                                 | W
ide_sr              EQU $FFF0001D   ; byte  | Status Register                                     | R
ide_cr              EQU $FFF0001D   ; byte  | Command Register                                    | W
ide_asr             EQU $FFF00039   ; byte  | Alternate Status Register                           | R
ide_dor             EQU $FFF00039   ; byte  | Data Output Register                                | W
