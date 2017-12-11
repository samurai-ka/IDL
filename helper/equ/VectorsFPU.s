                                    ; ####### FPU Vectors (68881/68882/Internal)                  ###########
                                    ; ------+-----------------------------------------------------+----------
_p_ffcp_bcon        EQU $000000C0   ;       | FFCP Branch or Set on Unordered Condition           | SD
_p_ffcp_inexact     EQU $000000C4   ;       | FFCP Inexact Result                                 | SD
_p_ffcp_divzero     EQU $000000C8   ;       | FFCP Divide by Zero                                 | SD
_p_ffcp_underflow   EQU $000000CC   ;       | FFCP Underflow                                      | SD
_p_ffcp_operand     EQU $000000D0   ;       | FFCP Operand Error                                  | SD
_p_ffcp_overflow    EQU $000000D4   ;       | FFCP Overflow                                       | SD
_p_ffcp_nan         EQU $000000D8   ;       | FFCP Signaling NAN                                  | SD
