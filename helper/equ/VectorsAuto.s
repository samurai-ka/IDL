                                    ; ########  Auto-Vector Interrupts                            ###########
                                    ; ------+-----------------------------------------------------+----------
_p_auto1            EQU $00000064   ; long  | Level 1 Int Autovector (NOT USED)                   | SD
_p_hbl              EQU $00000068   ; long  | Level 2 Int Autovector (HBL)                        | SD
_p_auto3            EQU $0000006C   ; long  | Level 3 Int Autovector (NOT USED)                   | SD
_p_vbl              EQU $00000070   ; long  | Level 4 Int Autovector (VBL)                        | SD
_p_auto5            EQU $00000074   ; long  | Level 5 Int Autovector (NOT USED)                   | SD
_p_auto6            EQU $00000078   ; long  | Level 6 Int Autovector (NOT USED)                   | SD
_p_auto7            EQU $0000007C   ; long  | Level 7 Int Autovector (NOT USED)                   | SD
