                                    ; ####### 6850 ACIA I/O Chips                                  ###########
                                    ; ------+------------------------------------------------------+----------
acia_keyboard_ctrl  EQU $FFFFFC00   ; byte  | Keyboard ACIA control            BIT 7 6 5 4 3 2 1 0 | W
                                    ;       | Rx Int enable (1 - enable) ----------' | | | | | | | |
                                    ;       | Tx Interrupts                          | | | | | | | |
                                    ;       | 00 - RTS low, Tx int disable ----------+-+ | | | | | |
                                    ;       | 01 - RTS low, Tx int enable -----------+-+ | | | | | |
                                    ;       | 10 - RTS high, Tx int disable ---------+-+ | | | | | |
                                    ;       | 11 - RTS low, Tx int disable,          | | | | | | | |
                                    ;       |      Tx a break onto data out ---------+-' | | | | | |
                                    ;       | Settings                                   | | | | | |
                                    ;       | 000 - 7 bit, even, 2 stop bit -------------+-+-+ | | |
                                    ;       | 001 - 7 bit, odd, 2 stop bit --------------+-+-+ | | |
                                    ;       | 010 - 7 bit, even, 1 stop bit -------------+-+-+ | | |
                                    ;       | 011 - 7 bit, odd, 1 stop bit --------------+-+-+ | | |
                                    ;       | 100 - 8 bit, 2 stop bit -------------------+-+-+ | | |
                                    ;       | 101 - 8 bit, 1 stop bit -------------------+-+-+ | | |
                                    ;       | 110 - 8 bit, even, 1 stop bit -------------+-+-+ | | |
                                    ;       | 111 - 8 bit, odd, 1 stop bit --------------+-+-' | | |
                                    ;       | Clock divide                                     | | |
                                    ;       | 00 - Normal -------------------------------------+-+ |
                                    ;       | 01 - Div by 16 ----------------------------------+-+ |
                                    ;       | 10 - Div by 64 ----------------------------------+-+ |
                                    ;       | 11 - Master reset -------------------------------+-' |
                   ;EQU $FFFFFC00   ; byte  | Keyboard ACIA control            BIT 7 6 5 4 3 2 1 0 | R
                                    ;       | Interrupt request -------------------' | | | | | | | |
                                    ;       | Parity error --------------------------' | | | | | | |
                                    ;       | Rx overrun ------------------------------' | | | | | |
                                    ;       | Framing error -----------------------------' | | | | |
                                    ;       | CTS -----------------------------------------' | | | |
                                    ;       | DCD -------------------------------------------' | | |
                                    ;       | Tx data register empty --------------------------' | |
                                    ;       | Rx data register full -----------------------------' |
acia_keyboard_data  EQU $FFFFFC02   ; byte  | Keyboard ACIA data                                   | R/W
acia_midi_ctrl      EQU $FFFFFC04   ; byte  | MIDI ACIA control                BIT 7 6 5 4 3 2 1 0 | W
                                    ;       | Rx Int enable (1 - enable) ----------' | | | | | | | |
                                    ;       | Tx Interrupts                          | | | | | | | |
                                    ;       | 00 - RTS low, Tx int disable ----------+-+ | | | | | |
                                    ;       | 01 - RTS low, Tx int enable -----------+-+ | | | | | |
                                    ;       | 10 - RTS high, Tx int disable ---------+-+ | | | | | |
                                    ;       | 11 - RTS low, Tx int disable,          | | | | | | | |
                                    ;       |      Tx a break onto data out ---------+-' | | | | | |
                                    ;       | Settings                                   | | | | | |
                                    ;       | 000 - 7 bit, even, 2 stop bit -------------+-+-+ | | |
                                    ;       | 001 - 7 bit, odd, 2 stop bit --------------+-+-+ | | |
                                    ;       | 010 - 7 bit, even, 1 stop bit -------------+-+-+ | | |
                                    ;       | 011 - 7 bit, odd, 1 stop bit --------------+-+-+ | | |
                                    ;       | 100 - 8 bit, 2 stop bit -------------------+-+-+ | | |
                                    ;       | 101 - 8 bit, 1 stop bit -------------------+-+-+ | | |
                                    ;       | 110 - 8 bit, even, 1 stop bit -------------+-+-+ | | |
                                    ;       | 111 - 8 bit, odd, 1 stop bit --------------+-+-' | | |
                                    ;       | Clock divide                                     | | |
                                    ;       | 00 - Normal -------------------------------------+-+ |
                                    ;       | 01 - Div by 16 ----------------------------------+-+ |
                                    ;       | 10 - Div by 64 ----------------------------------+-+ |
                                    ;       | 11 - Master reset -------------------------------+-' |
                   ;EQU $FFFFFC04   ; byte  | MIDI ACIA control                BIT 7 6 5 4 3 2 1 0 | R
                                    ;       | Interrupt request -------------------' | | | | | | | |
                                    ;       | Parity error --------------------------' | | | | | | |
                                    ;       | Rx overrun ------------------------------' | | | | | |
                                    ;       | Framing error -----------------------------' | | | | |
                                    ;       | CTS -----------------------------------------' | | | |
                                    ;       | DCD -------------------------------------------' | | |
                                    ;       | Tx data register empty --------------------------' | |
                                    ;       | Rx data register full -----------------------------' |
acia_midi_data      EQU $FFFFFC06   ; byte  | MIDI ACIA data                                       | R/W
