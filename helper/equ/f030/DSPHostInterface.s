                                    ; ####### Falcon DSP Host Interface                            ###########
                                    ; ------+------------------------------------------------------+----------
f030_dsphost_irq_cr EQU $FFFFA200   ; byte  | Interrupt Ctrl Register          BIT 7 6 5 4 3 . 1 0 | R/W    ==> DSP X:$FFE9
                                    ;       | INIT bit ----------------------------' | | | |   | | |
                                    ;       | 00 - Interupt mode (DMA off) ----------+-+ | |   | | |
                                    ;       | 01 - 24-bit DMA mode ------------------+-+ | |   | | |
                                    ;       | 10 - 16-bit DMA mode ------------------+-+ | |   | | |
                                    ;       | 11 - 8-bit DMA mode -------------------+-' | |   | | |
                                    ;       | Host Flag 1 -------------------------------' |   | | |
                                    ;       | Host Flag 0 ---------------------------------'   | | |
                                    ;       |          Host mode Data transfers:               | | |
                                    ;       |               Interrupt mode                     | | |
                                    ;       | 00 - No interrupts (Polling) --------------------+-+ |
                                    ;       | 01 - RXDF Request (Interrupt) -------------------+-+ |
                                    ;       | 10 - TXDE Request (Interrupt) -------------------+-+ |
                                    ;       | 11 - RXDF and TXDE Request (Interrupts) ---------+-+ |
                                    ;       |                  DMA Mode                        | | |
                                    ;       | 00 - No DMA -------------------------------------+-+ |
                                    ;       | 01 - DSP to Host Request (RX) -------------------+-+ |
                                    ;       | 10 - Host to DSP Request (TX) -------------------+-+ |
                                    ;       | 11 - Undefined (Illegal) ------------------------+-' |
f030_dsphost_cvr    EQU $FFFFA201   ; byte  | Command Vector Register          BIT 7 . . 4 3 2 1 0 | R/W    ==> DSP X:$FFE9
                                    ;       | Host Command Bit (Handshake)---------'     | | | | | |
                                    ;       | Host Vector (0-31) ------------------------+-+-+-+-' |
f030_dsphost_irqsr  EQU $FFFFA202   ; byte  | Interrupt Status Reg             BIT 7 6 . 4 3 2 1 0 | R      ==> DSP X:$FFE8
                                    ;       | ISR Host Request --------------------' |   | | | | | |
                                    ;       | ISR DMA Status ------------------------'   | | | | | |
                                    ;       | Host Flag 3 -------------------------------' | | | | |
                                    ;       | Host Flag 2 ---------------------------------' | | | |
                                    ;       | ISR Transmitter Ready (TRDY) ------------------' | | |
                                    ;       | ISR Transmit Data Register Empty (TXDE) ---------' | |
                                    ;       | ISR Receive Data Register Full (RXDF) -------------' |
f030_dsphost_irqvr  EQU $FFFFA203   ; byte  | Interrupt Vector Register                            | R/W 
                   ;EQU $FFFFA204   ; byte  | Unused                                               |    
f030_dsphost_h      EQU $FFFFA205   ; byte  | DSP-Word High                                        | R/W    ==> DSP X:$FFEB 
f030_dsphost_m      EQU $FFFFA206   ; byte  | DSP-Word Mid                                         | R/W    ==> DSP X:$FFEB
f030_dsphost_l      EQU $FFFFA207   ; byte  | DSP-Word Low                                         | R/W    ==> DSP X:$FFEB 
