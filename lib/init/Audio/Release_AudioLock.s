; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;	IDL Function 'IDL_Release_AudioLock'
;------------------------------------------------------------------------------
IDL_Release_AudioLock:
			cmp.b	#1,DSPLock
			bne.s	.next1
			move.w	#$69,-(sp)			;Dsp_Unlock()
			trap	#14					;
			addq.l	#2,sp				;
.next1:
			cmp.b	#1,AudioSystemLock
			bne.s	.next2
			move.w	#$81,-(sp)			;Unlocksnd()
			trap	#14					;
			addq.l	#2,sp				;
.next2:
			rts
