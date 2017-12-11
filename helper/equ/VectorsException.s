                                    ; #######  CPU Exception Vectors                              ###########
                                    ; ------+-----------------------------------------------------+----------
_p_bus_error        EQU $00000008   ; long  | Bus Error                                           | SD
_p_adress_error     EQU $0000000C   ; long  | Address Error                                       | SD
_p_illegal          EQU $00000010   ; long  | Illegal Instruction                                 | SD
_p_div_zero         EQU $00000014   ; long  | Zero Divide                                         | SD
_p_chk              EQU $00000018   ; long  | CHK, CHK2 Instruction                               | SD
_p_cpTrapcc         EQU $0000001C   ; long  | cpTRAPcc, TRAPcc, TRAPV                             | SD
_p_priv_violation   EQU $00000020   ; long  | Privilege Violation                                 | SD
_p_trace            EQU $00000024   ; long  | Trace                                               | SD
_p_lineA            EQU $00000028   ; long  | Line 1010 Emulator (LineA)                          | SD
_p_lineF            EQU $0000002C   ; long  | Line 1111 Emulator (LineF)                          | SD
_p_fpu_violation    EQU $00000034   ; long  | Coprocessor Protocol Violation (68030)              | SD
_p_format_error     EQU $00000038   ; long  | Format Error (68010)                                | SD
_p_uninit_irq       EQU $0000003C   ; long  | Uninitialized Interrupt Vector                      | SD
_p_spurious_error   EQU $00000060   ; long  | Spurious Interrupt (Bus error during interrupt)     | SD  
