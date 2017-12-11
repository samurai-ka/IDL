                                    ; ####### MFP 68901 - Multi Function Peripheral Chip           ###########
                                    ; ------+------------------------------------------------------+----------
                                    ;       |     MFP Master Clock is 2,457,600 cycles/second      |
                                    ; ------+------------------------------------------------------+----------
mfp_parallel_data   EQU $FFFFFA01   ; byte  | Parallel Port Data Register                          | R/W
                                    ; ------+------------------------------------------------------+----------
mfp_active_edge     EQU $FFFFFA03   ; byte  | Active Edge Register             BIT 7 6 5 4 3 2 1 0 | R/W
                                    ;       |                                      | | | | | | | | |
                                    ;       | IO7 - SND INT -----------------------' | | | | | | | |
                                    ;       | IO6 - RS-232 RING Indicator -----------' | | | | | | |
                                    ;       | IO5 - FDC & HDC & IDE INT ---------------' | | | | | |    
                                    ;       | IO4 - Keyboard & MIDI INT -----------------' | | | | |
                                    ;       | IO3 - DSP INT -------------------------------' | | | |    
                                    ;       | IO2 - MIDI INT --------------------------------' | | |    
                                    ;       | IO1 - Centronics ACK ----------------------------' | |    
                                    ;       | IO0 - Centronics BUSY -----------------------------' |
                                    ;       +-----------------------------------------------------+
                                    ;       |        When port bits are used for input only:       |
                                    ;       | 0 - Interrupt on pin high-low conversion             |
                                    ;       | 1 - Interrupt on pin low-high conversion             |
                                    ; ------+------------------------------------------------------+----------
mfp_data_direction  EQU $FFFFFA05   ; byte  | Data Direction                   BIT 7 6 5 4 3 2 1 0 | R/W
                                    ;       | 0 - In, 1 - Out ---------------------+-+-+-+-+-+-+-' |
                                    ; ------+------------------------------------------------------+----------
mfp_irqA_enable     EQU $FFFFFA07   ; byte  | Interrupt Enable A               BIT 7 6 5 4 3 2 1 0 | R/W
mfp_irqA_pending    EQU $FFFFFA0B   ; byte  | Interrupt Pending A              BIT 7 6 5 4 3 2 1 0 | R/W
mfp_irqA_service    EQU $FFFFFA0F   ; byte  | Interrupt In-service A           BIT 7 6 5 4 3 2 1 0 | R/W
mfp_irqA_mask       EQU $FFFFFA13   ; byte  | Interrupt Mask A                 BIT 7 6 5 4 3 2 1 0 | R/W
                                    ;       | MFP Address                          | | | | | | | | |
                                    ;       | $13C   SND INT ----------------------' | | | | | | | |
                                    ;       | $138   RS-232 Ring Detector -----------' | | | | | | |
                                    ;       | $134   (STE sound)  Timer A -------------' | | | | | |
                                    ;       | $130    Receive buffer full ---------------' | | | | |
                                    ;       | $12C          Receive error -----------------' | | | |
                                    ;       | $128      Send buffer empty -------------------' | | |
                                    ;       | $124             Send error ---------------------' | |
                                    ;       | $120   (HBL)        Timer B -----------------------' |
                                    ;       | 1 - Enable Interrupt           0 - Disable Interrupt |
                                    ; ------+------------------------------------------------------+----------
mfp_irqB_enable     EQU $FFFFFA09   ; byte  | Interrupt Enable B               BIT 7 6 5 4 3 2 1 0 | R/W
mfp_irqB_pending    EQU $FFFFFA0D   ; byte  | Interrupt Pending B              BIT 7 6 5 4 3 2 1 0 | R/W
mfp_irqB_service    EQU $FFFFFA11   ; byte  | Interrupt In-service B           BIT 7 6 5 4 3 2 1 0 | R/W
mfp_irqB_mask       EQU $FFFFFA15   ; byte  | Interrupt Mask B                 BIT 7 6 5 4 3 2 1 0 | R/W
                                    ;       | MFP Address                          | | | | | | | | |
                                    ;       | $11C        FDC/HDC/IDE INT ---------' | | | | | | | |
                                    ;       | $118      Keyboard/MIDI INT -----------' | | | | | | |
                                    ;       | $114 (200hz clock)  Timer C -------------' | | | | | |
                                    ;       | $110 (USART timer)  Timer D ---------------' | | | | |
                                    ;       | $10C      DSP Connector INT -----------------' | | | |
                                    ;       | $108               MIDI INT -------------------' | | |
                                    ;       | $104        Centronics  ACK ---------------------' | |
                                    ;       | $100        Centronics BUSY -----------------------' |
                                    ;       | 1 - Enable Interrupt           0 - Disable Interrupt |
                                    ; ------+------------------------------------------------------+----------
mfp_vector_reg      EQU $FFFFFA17     ; byte  | Vector Register                  BIT 7 6 5 4 3 . . . | R/W
                                    ;       | Vector Base Offset ------------------+-+-+-' |       |
                                    ;       | 1 - *Software End-interrupt mode ------------+       |
                                    ;       | 0 - Automatic End-interrupt mode ------------'       |
                                    ;       | * - Default operating mode                           |
                                    ; ------+------------------------------------------------------+----------
mfp_timerA_ctrl     EQU $FFFFFA19     ; byte  | Timer A Control                        BIT 4 3 2 1 0 | R/W
mfp_timerB_ctrl     EQU $FFFFFA1B     ; byte  | Timer B Control                        BIT 4 3 2 1 0 | R/W
                                    ;       | Reset (force output low) ------------------' | | | | |
                                    ;       +------------------------------------------------------+
                                    ;       | 0000 - Timer stop, no function executed              |
                                    ;       | 0001 - Delay mode, divide by 4                       |
                                    ;       | 0010 -     :           :     10                      |
                                    ;       | 0011 -     :           :     16                      |
                                    ;       | 0100 -     :           :     50                      |
                                    ;       | 0101 -     :           :     64                      |
                                    ;       | 0110 -     :           :     100                     |
                                    ;       | 0111 - Delay mode, divide by 200                     |
                                    ;       | 1000 - Event count mode                              |
                                    ;       | 1xxx - Pulse extension mode, divide as above         |
                                    ;       +------------------------------------------------------+
mfp_timerA_data     EQU $FFFFFA1F   ; byte  | Timer A Data                                         | R/W
mfp_timerB_data     EQU $FFFFFA21   ; byt e | Timer B Data                                         | R/W
                                    ; ------+------------------------------------------------------+----------
mfp_timerC_ctrl     EQU $FFFFFA1D   ; byte  | Timer C & D Control                BIT 6 5 4 . 2 1 0 | R/W
mfp_timerD_ctrl     EQU $FFFFFA1D   ;       |                                        Timer   Timer |
mfp_timerCD_ctrl    EQU $FFFFFA1D   ;       |                                          C       D   |
                                    ;       +------------------------------------------------------+
                                    ;       | 000 - Timer stop                                     |
                                    ;       | 001 - Delay mode, divide by 4                        |
                                    ;       | 010 -      :           :    10                       |
                                    ;       | 011 -      :           :    16                       |
                                    ;       | 100 -      :           :    50                       |
                                    ;       | 101 -      :           :    64                       |
                                    ;       | 110 -      :           :    100                      |
                                    ;       | 111 - Delay mode, divide by 200                      |
                                    ;       +------------------------------------------------------+
mfp_timerC_data     EQU $FFFFFA23   ; byte  | Timer C Data                                         | R/W
mfp_timerD_data     EQU $FFFFFA25   ; byte  | Timer D Data                                         | R/W
                                    ; ------+------------------------------------------------------+----------
mfp_sync_char       EQU $FFFFFA27   ; byte  | Sync Character                                       | R/W
mfp_USART_control   EQU $FFFFFA29   ; byte  | USART Control                    BIT 7 6 5 4 3 2 1 . | R/W
                                    ;       | Clock divide (1 - div by 16) --------' | | | | | | | |
                                    ;       | Word Length 00 - 8 bits ---------------+-+ | | | | | |
                                    ;       |             01 - 7 bits ---------------+-+ | | | | | |
                                    ;       |             10 - 6 bits ---------------+-+ | | | | | |
                                    ;       |             11 - 5 bits ---------------+-' | | | | | |
                                    ;       | Bits Stop Start Format                     | | | | | |
                                    ;       | 00     0    0   Synchronous ---------------+-+ | | | |
                                    ;       | 01     1    1   Asynchronous --------------+-+ | | | |
                                    ;       | 10     1    1.5 Asynchronous --------------+-+ | | | |
                                    ;       | 11     1    2   Asynchronous --------------+-' | | | |
                                    ;       | Parity (0 - ignore parity bit) ----------------' | | |
                                    ;       | Parity (0 - odd parity,1 - even) ----------------' | |
                                    ;       | Unused --------------------------------------------' |
mfp_receive_status  EQU $FFFFFA2B   ; byte  | Receiver Status                  BIT 7 6 5 4 3 2 1 0 | R/W
                                    ;       | Buffer full -------------------------' | | | | | | | |
                                    ;       | Overrun error -------------------------' | | | | | | |
                                    ;       | Parity error ----------------------------' | | | | | |
                                    ;       | Frame error -------------------------------' | | | | |
                                    ;       | Found - Search/Break detected ---------------' | | | |
                                    ;       | Match/Character in progress -------------------' | | |
                                    ;       | Synchronous strip enable ------------------------' | |
                                    ;       | Receiver enable bit -------------------------------' |
mfp_transmit_status EQU $FFFFFA2D   ; byte  | Transmitter Status               BIT 7 6 5 4 3 2 1 0 | R/W
                                    ;       | Buffer empty ------------------------' | | | | | | | |
                                    ;       | Underrun error ------------------------' | | | | | | |
                                    ;       | Auto turnaround -------------------------' | | | | | |
                                    ;       | End of transmission -----------------------' | | | | |
                                    ;       | Break ---------------------------------------' | | | |
                                    ;       | High bit --------------------------------------' | | |
                                    ;       | Low bit -----------------------------------------' | |
                                    ;       | Transmitter enable --------------------------------' |
mfp_USART_data      EQU $FFFFFA2F   ; byte  | USART data                                           | R/W
