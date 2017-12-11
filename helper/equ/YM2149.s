                                    ; ####### YM2149 Sound Chip                                   ###########
                                    ; ------+-----------------------------------------------------+----------
YM2149_Read         EQU $FFFF8800   ; byte  | Read data/Register select                            | R/W
                                    ;       | 0 Channel A Freq Low             BIT 7 6 5 4 3 2 1 0 |
                                    ;       | 1 Channel A Freq High                    BIT 3 2 1 0 |
                                    ;       | 2 Channel B Freq Low             BIT 7 6 5 4 3 2 1 0 |
                                    ;       | 3 Channel B Freq High                    BIT 3 2 1 0 |
                                    ;       | 4 Channel C Freq Low             BIT 7 6 5 4 3 2 1 0 |
                                    ;       | 5 Channel C Freq High                    BIT 3 2 1 0 | 
                                    ;       | 6 Noise Freq                         BIT 5 4 3 2 1 0 |
                                    ;       | 7 Mixer Control                  BIT 7 6 5 4 3 2 1 0 |
                                    ;       |   Port B IN/OUT (1=Output) ----------' | | | | | | | |
                                    ;       |   Port A IN/OUT -----------------------' | | | | | | |
                                    ;       |   Channel C Noise (1=Off) ---------------' | | | | | |
                                    ;       |   Channel B Noise -------------------------' | | | | |
                                    ;       |   Channel A Noise ---------------------------' | | | |
                                    ;       |   Channel C Tone (0=On) -----------------------' | | |
                                    ;       |   Channel B Tone --------------------------------' | |
                                    ;       |   Channel A Tone ----------------------------------' |
                                    ;       | 8 Channel A Amplitude Control          BIT 4 3 2 1 0 |
                                    ;       |   Fixed/Variable Level (0=Fixed) ----------' | | | | |
                                    ;       |   Amplitude level control -------------------+-+-+-' |
                                    ;       | 9 Channel B Amplitude Control          BIT 4 3 2 1 0 |
                                    ;       |   Fixed/Variable Level --------------------' | | | | |
                                    ;       |   Amplitude level control -------------------+-+-+-' |
                                    ;       | 10 Channel C Amplitude Control         BIT 4 3 2 1 0 |
                                    ;       |   Fixed/Variable Level --------------------' | | | | |
                                    ;       |   Amplitude level control -------------------+-+-+-' |
                                    ;       | 11 Envelope Period High          BIT 7 6 5 4 3 2 1 0 |
                                    ;       | 12 Envelope Period Low           BIT 7 6 5 4 3 2 1 0 |
                                    ;       | 13 Envelope Shape                        BIT 3 2 1 0 |
                                    ;       |   Continue ----------------------------------' | | | |
                                    ;       |   Attack --------------------------------------' | | |
                                    ;       |   Alternate -------------------------------------' | |
                                    ;       |   Hold --------------------------------------------' |
                                    ;       |    00xx - \____________________________________      |
                                    ;       |    01xx - /|___________________________________      |
                                    ;       |    1000 - \|\|\|\|\|\|\|\|\|\|\|\|\|\|\|\|\|\|\      |
                                    ;       |    1001 - \____________________________________      |
                                    ;       |    1010 - \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\      |
                                    ;       |    1011 - \|-----------------------------------      |
                                    ;       |    1100 - /|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/|/      |
                                    ;       |    1101 - /------------------------------------      |
                                    ;       |    1110 - /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/      |
                                    ;       |    1111 - /|___________________________________      |
                                    ;       | 14 Port A                        BIT 7 6 5 4 3 2 1 0 |
                                    ;       |   IDE Drive On/OFF ------------------+ | | | | | | | |    
                                    ;       |   Internal Speaker On/Off -------------' | | | | | | | 
                                    ;       |   Centronics STROBE ---------------------' | | | | | |
                                    ;       |   DSP RESET -------------------------------' | | | | |    
                                    ;       |   Centronics SELECT IN ----------------------' | | | |    
                                    ;       |   Drive SELECT B ------------------------------' | | |
                                    ;       |   Drive SELECT A --------------------------------' | |
                                    ;       |   Drive SIDE SELECT -------------------------------' |
                                    ;       | 15 Port B (Parallel port)                            |
YM2149_Write        EQU $FFFF8802   ; byte  | Write data                                           | W
                                    ;       +------------------------------------------------------+
                                    ;       | Note: PSG Registers are now fixed at these addresses.|
                                    ;       | All other addresses are masked out on the Falcon. Any|
                                    ;       | writes to the shadow registers $8804-$88FF will cause|
                                    ;       | bus errors. Game/Demo coders beware!                 |
