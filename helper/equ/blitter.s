                                    ; ####### Blitter                               	          ###########
                                    ; ------+-----------------------------------------------------+----------
blt_halftone_ram    EQU $FFFF8A00   ; word  | Halftone-RAM, Word 0                                 | R/W 
                                    ;   :   |    :     :     :  :                                  |  :     
                   ;EQU $FFFF8A1E   ; word  | Halftone-RAM, Word 15                                | R/W 
blt_src_x_inc       EQU $FFFF8A20   ; word  | Source X Increment                     (signed,even) | R/W 
blt_src_y_inc       EQU $FFFF8A22   ; word  | Source Y Increment                     (signed,even) | R/W 
blt_src_ar          EQU $FFFF8A24   ; long  | Source Address Register                (24 bit,even) | R/W 
blt_endmask1        EQU $FFFF8A28   ; word  | Endmask 1                    (First write of a line) | R/W 
blt_endmask2        EQU $FFFF8A2A   ; word  | Endmask 2                    (All other line writes) | R/W 
blt_endmask3        EQU $FFFF8A2C   ; word  | Endmask 3                     (Last write of a line) | R/W 
blt_dst_x_inc       EQU $FFFF8A2E   ; word  | Destination X Increment                (signed,even) | R/W 
blt_dst_y_inc       EQU $FFFF8A30   ; word  | Destination Y Increment                (signed,even) | R/W 
blt_dst_ar          EQU $FFFF8A32   ; long  | Destination Address Register           (24 bit,even) | R/W 
blt_bitblock_words  EQU $FFFF8A36   ; word  | Words per Line in Bit-Block                (0=65536) | R/W 
blt_bitblock_lines  EQU $FFFF8A38   ; word  | Lines per Bit-Block                        (0=65536) | R/W 
blt_halftone_ops    EQU $FFFF8A3A   ; byte  | Halftone Operation Register                  BIT 1 0 | R/W 
                                    ;       | 00 - All ones -----------------------------------+-+ |
                                    ;       | 01 - Halftone -----------------------------------+-+ |
                                    ;       | 10 - Source -------------------------------------+-+ |
                                    ;       | 11 - Source AND Halftone ------------------------+-' |
blt_log_ops_reg     EQU $FFFF8A3B   ; byte  | Logical Operation Register               BIT 3 2 1 0 | R/W 
                                    ;       | 0000 All zeros ------------------------------+-+-+-+ |
                                    ;       | 0001 Source AND destination -----------------+-+-+-+ |
                                    ;       | 0010 Source AND NOT destination -------------+-+-+-+ |
                                    ;       | 0011 Source ---------------------------------+-+-+-+ |
                                    ;       | 0100 NOT source AND destination -------------+-+-+-+ |
                                    ;       | 0101 Destination ----------------------------+-+-+-+ |
                                    ;       | 0110 Source XOR destination -----------------+-+-+-+ |
                                    ;       | 0111 Source OR destination ------------------+-+-+-+ |
                                    ;       | 1000 NOT source AND NOT destination ---------+-+-+-+ |
                                    ;       | 1001 NOT source XOR destination -------------+-+-+-+ |
                                    ;       | 1010 NOT destination ------------------------+-+-+-+ |
                                    ;       | 1011 Source OR NOT destination --------------+-+-+-+ |
                                    ;       | 1100 NOT source -----------------------------+-+-+-+ |
                                    ;       | 1101 NOT source OR destination --------------+-+-+-+ |
                                    ;       | 1110 NOT source OR NOT destination ----------+-+-+-+ |
                                    ;       | 1111 All ones -------------------------------+-+-+-' |
blt_linenr_reg      EQU $FFFF8A3C   ; byte  | Line Number Register             BIT 7 6 5 . 3 2 1 0 | R/W 
                                    ;       | BUSY --------------------------------' | |   | | | | |
                                    ;       | 0 - Share bus, 1 - Hog bus ------------' |   | | | | |
                                    ;       | SMUDGE mode -----------------------------'   | | | | |
                                    ;       | Halftone line number ------------------------+-+-+-' |
blt_skew_reg        EQU $FFFF8A3D   ; byte  | SKEW Register                    BIT 7 6 . . 3 2 1 0 | R/W 
                                    ;       | Force eXtra Source Read -------------' |     | | | | |
                                    ;       | No Final Source Read ------------------'     | | | | |
                                    ;       | Source skew ---------------------------------+-+-+-' |
