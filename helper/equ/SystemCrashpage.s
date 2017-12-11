                                    ; ####### System Crash Page                                   ###########
                                    ; ------+-----------------------------------------------------+----------
proc_lives          EQU $00000380   ; long  | Validates System Crash Page if $12345678            |
proc_dregs          EQU $00000384   ; ..... | Saved registers D0-D7                               |
proc_aregs          EQU $000003A4   ; ..... | Saved registers A0-A7                               |
proc_enum           EQU $000003C4   ; long  | Vector number of crash exception                    |
proc_usp            EQU $000003C8   ; long  | Saved USP                                           |
proc_stk            EQU $000003CC   ; ..... | Saved 16 words from exception stack                 |
