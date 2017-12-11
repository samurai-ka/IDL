                                    ; ####### DMA/WD1772 Disk controller                          ###########
                                    ; ------+-----------------------------------------------------+----------
fdc_sectcount       EQU $FFFF8604   ; word  | FDC access/sector count                              | R/W
fdc_status          EQU $FFFF8606   ; word  | DMA mode/status                            BIT 2 1 0 | R
                                    ;       | Condition of FDC DATA REQUEST signal ----------' | | |
                                    ;       |  0 - sector count null,1 - not null -------------' | |
                                    ;       |  0 - no error, 1 - DMA error ----------------------' |
                   ;EQU $FFFF8606   ; word  | DMA mode/status                BIT 8 7 6 . 4 3 2 1 . | W
                                    ;       |  0 - read FDC/HDC,1 - write -------' | | | | | | |   |
                                    ;       |  0 - HDC access,1 - FDC access ------' | | | | | |   |
                                    ;       |  0 - DMA on,1 - no DMA ----------------' | | | | |   |
                                    ;       |  Reserved -------------------------------' | | | |   |
                                    ;       |  0 - FDC reg,1 - sector count reg ---------' | | |   |
                                    ;       |  0 - FDC access,1 - HDC access --------------' | |   |
                                    ;       |  0 - pin A1 low, 1 - pin A1 high --------------' |   |
                                    ;       |  0 - pin A0 low, 1 - pin A0 high ----------------'   |
fdc_dma_h           EQU $FFFF8609   ; byte  | DMA base and counter (High byte)                     | R/W
fdc_dma_m           EQU $FFFF860B   ; byte  | DMA base and counter (Mid byte)                      | R/W
fdc_dma_l           EQU $FFFF860D   ; byte  | DMA base and counter (Low byte)                      | R/W
fdc_density         EQU $FFFF860E   ; byte  | High Density Drive                           BIT 1 0 | R/W
                                    ;       |   FDDS  (0=DD, 1=HD)  ---------------------------' | |
                                    ;       |   FCCLK (0=8MHz, 1=16MHz)  ------------------------' |
