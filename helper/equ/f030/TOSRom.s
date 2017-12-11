                                    ; ####### F030 OS ROMs    		                              ###########
                                    ; ------+-----------------------------------------------------+----------
tos_rom             EQU $FFE00000   ; byte  |                                                     | R
                   ;                ;   :   |     |TOS 512K ROMs                                  |
                   ;EQU $FFE7FFFF   ; byte  |                                                     |
                   ;EQU $FFE80000   ; byte  |                                                     | R
                   ;                ;   :   |  :  |Image of TOS 512K ROMs 					      |               
                   ;EQU $FFEFFFFF   ; byte  |                                                     |
