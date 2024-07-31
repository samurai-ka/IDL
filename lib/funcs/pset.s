;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'Pixel Set (4 planes)'
;   a0 => byte in bit plane to be set.
;   d0 => bit in byte...
;   d1 => offset to next plane
;   d2 => color
;------------------------------------------------------------------------------
IDL_P_Set_4:		    move.b	Table(pc,d2.w),d2	    ; offset of function
                        jmp	    Table(pc,d2)		    ; call it!

Table:		            dc.b	.0-Table, .1-Table, .2-Table, .3-Table
		                even

.3:                     bset.b  d0,(a0)			        ; bpl0
                        adda.l	d1,a0			        ; a0->bpl1
.2:                     bset.b	d0,(a0,d1)		        ; bpl1 or bpl2
.1:                     bset.b	d0,(a0)			        ; bpl0 or bpl1
.0:                     rts

;------------------------------------------------------------------------------
; IDL Function 'Pixel Set (8 planes)'
;   a1  =>  pointer to screen
;   d7  =>  size of screen
;------------------------------------------------------------------------------
IDL_P_Set_8:
                        rts

;------------------------------------------------------------------------------
; IDL Function 'Pixel Set (truecolor)'
;   a1  =>  pointer to screen
;   d7  =>  size of screen
;------------------------------------------------------------------------------
IDL_P_Set_16:

                        rts