                                    ; ########  Trap Vectors (Trap #n = Vector number + 32 + n)   ###########
                                    ; ------+-----------------------------------------------------+----------
_p_trap0            EQU $00000080   ;       | Trap #0                                             | SD
_p_trap1            EQU $00000084   ;       | Trap #1 (GemDOS)                                    | SD
_p_trap2            EQU $00000088   ;       | Trap #2 (AES/VDI)                                   | SD
_p_trap3            EQU $0000008C   ;       | Trap #3                                             | SD
_p_trap4            EQU $00000090   ;       | Trap #4                                             | SD
_p_trap5            EQU $00000094   ;       | Trap #5                                             | SD
_p_trap6            EQU $00000098   ;       | Trap #6                                             | SD
_p_trap7            EQU $0000009C   ;       | Trap #7                                             | SD
_p_trap8            EQU $000000A0   ;       | Trap #8                                             | SD
_p_trap9            EQU $000000A4   ;       | Trap #9                                             | SD
_p_trap10           EQU $000000A8   ;       | Trap #10                                            | SD
_p_trap11           EQU $000000AC   ;       | Trap #11                                            | SD
_p_trap12           EQU $000000B0   ;       | Trap #12                                            |
_p_trap13           EQU $000000B4   ;       | Trap #13 (BIOS)                                     | SD
_p_trap14           EQU $000000B8   ;       | Trap #14 (XBIOS)                                    | SD
