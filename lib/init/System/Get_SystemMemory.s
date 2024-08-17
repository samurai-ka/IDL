;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
				section	text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'Get_SystemMemory'
;------------------------------------------------------------------------------
IDL_Get_SystemMemory:
;            btst    #%00000000,f030_memsize

				move.b	f030_conf_type,D0		; get memmap from register
				andi	#%00110000,D0			; mask out other bits
				cmp.b	#%00000000,D0			; compare for 1mb
				bne.s	.next4mb				; if not true move on else
				move.l	#exit_1mb_text,error_txt ; Set pointer error message
				bra.w	error					;
.next4mb
				cmp.b	#%00010000,D0			; compare for 4mb
				bne.s	.next14mb				; if not true move on else
				move.l	#exit_4mb_text,error_txt ; Set pointer error message
				bra.w	error					;
.next14mb
				move.l	#is14mbText,D0			; show text 14mb is ok
				bsr		_Cconws

				rts
