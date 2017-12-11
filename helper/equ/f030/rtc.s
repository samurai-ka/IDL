                                    ; #######  F030 RTC Chip (DS1287)               	          ###########
                                    ; ------+-----------------------------------------------------+----------
f030_rtc_rs         EQU $FFFF8961   ; byte  | Register select                                     | W     
                                    ;       | 0 - Current Second                                  |
                                    ;       | 1 - Second for alarm                                |
                                    ;       | 2 - Current Minute                                  |
                                    ;       | 3 - Minute for alarm                                |
                                    ;       | 4 - Current Hour                                    |
                                    ;       | 5 - Hour for alarm                                  |
                                    ;       | 6 - Day of week (1=Sunday, 2=Monday, 3=...)         |
                                    ;       | 7 - Day of Month                                    |
                                    ;       | 8 - Month                                           |
                                    ;       | 9 - Year (example : '93' for this year)             |
                                    ;       | A                                             BIT 7 |
                                    ;       |     If set, update time in progress --------------' |
                                    ;       |     don't read time & date registers                |
                                    ;       | B                               BIT 7 6 5 4 3 2 1 0 |
                                    ;       | 1 = Write Protect time & date ------'   | |   | | | |
                                    ;       | 1 = Enable alarm interrupt -------------' |   | | | |
                                    ;       | 1 = Interrupt after time updated ---------'   | | | |
                                    ;       | 1 = Format Binary, 0 = Format BCD ------------' | | |
                                    ;       | 1 = 24hr format, 0 = 12hr format ---------------' | |
                                    ;       | 1 = Summer hours, 0 = Winter hours ---------------' |
                                    ;       | C                                         BIT 6 5 4 |
                                    ;       |  ??? -----------------------------------------' | | |
                                    ;       | 1 = alarm is ringing ---------------------------' | |
                                    ;       | 1 = date is updated ------------------------------' |
                                    ;       | On interrupt, read this register to determine       |
                                    ;       | source.                                             |
                                    ;       | D                                             BIT 7 |
                                    ;       | 1 = Battery dead ---------------------------------' |
f030_rtc_rd         EQU $FFFF8963   ; byte  | Register data                                       | R/W   