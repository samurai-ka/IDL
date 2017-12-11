;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; Wait for next VBL and then continue
;------------------------------------------------------------------------------

IDF_Wait_vbl:
;                IF show_CpuCycles
                move.l  #160,f030_videl_pal256.w
;                ENDC

                sf      vsync_flag
.waitvblloop:
                tst.b   vsync_flag
                beq.s   waitvblloop

;                IF show_CpuCycles
                clr.l   $f030_videl_pal256.w
;                ENDC

                rts
