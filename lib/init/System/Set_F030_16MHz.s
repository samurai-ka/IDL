;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
				section	text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'IDL_Set_F030_16MHz'
;------------------------------------------------------------------------------
IDL_Set_F030_16MHz:
				ori.b	#%00000101,f030_bus_ctrl ; Set the 68030 and Blitter to 16MHz

				move.l	#SystemSetToMaxSpeedText,D0
				bsr		_Cconws					; Print Success

				rts
