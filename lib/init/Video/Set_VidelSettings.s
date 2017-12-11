;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'IDL_Set_VidelSettings'
; a0.l  Pointer to a VDO sequence
;------------------------------------------------------------------------------
IDL_Set_VidelSettings:
                        bsr.s   IDL_Wait_vbl

                        movea.l (A0)+,A0
                        move.w  (A0)+,shifter_res.w
                        move.w  (A0)+,f030_videl_spshift.w      ; Falcon Shift Mode
                        move.l  (A0)+,f030_videl_hcr_hht.w      ; Horiz. Hold Timer + H. Border Begin
                        move.l  (A0)+,f030_videl_hcr_hbe.w      ; H. Border End + H. Display Begin
                        move.l  (A0)+,f030_videl_hcr_hde.w      ; H. Display End + H. Sync Start
                        move.l  (A0)+,f030_videl_vcr_vft.w      ; Vert. Freq. Timer + V. Border Begin
                        move.l  (A0)+,f030_videl_vcr_vbe.w      ; V. Border End + V. Display Begin
                        move.l  (A0)+,f030_videl_vcr_vde.w      ; V. Display End + V. Sync Start
                        move.l  (A0)+,f030_videl_vclock.w       ; Video Control + Video Mode
                        move.w  (A0)+,f030_videl_vwrap.w        ; line wide

                        rts
