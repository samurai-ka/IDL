;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
                section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; Wait for next VBL and then continue
;------------------------------------------------------------------------------

IDL_Wait_vbl:
                IFNE    debug
                move.l  #160,f030_videl_pal256.w
                ENDC

                sf      vsync_flag
.waitvblloop:
                tst.b   vsync_flag
                beq.s   .waitvblloop

                IFNE    debug
                clr.l   f030_videl_pal256.w
                ENDC

                rts
