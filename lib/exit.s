; IDL
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
			
exit:
			bsr		IDL_Release_AudioLock       ; Release all locks on the Falcon Audiosystem
			bsr		IDL_Restore_SystemRegisters	; Restore all registers

;			cmp.b	#1,DSPLock
;			bne.s	.next1
;			bsr.s	IDL_UnlockDSP		
;.next1:
;			cmp.b	#1,AudioSystemLock
;			bne.s	.next2
;			bsr.s	IDL_UnlockAudioSystem
;.next2:
			rts

;------------------------------------------------------------------------------
;			Subs
;------------------------------------------------------------------------------
;IDL_UnlockDSP:
;			move.w	#$69,-(sp)		;Dsp_Unlock()
;			trap	#14				;
;			addq.l	#2,sp			;
;			rts
;------------------------------------------------------------------------------
;IDL_UnlockAudioSystem:
;		move.w	#$81,-(sp)			;Unlocksnd()
;		trap	#14					;
;		addq.l	#2,sp				;
;		rts							;
;------------------------------------------------------------------------------

			; clear the keyboard buffer
;			bsr		clear_keyboard_buffer	;clear kbd buffer

			; test if error text must be shown
;			tst.l	error_txt				;see if print error message
;			beq.w	_Pterm					;
;			bsr		print_error
			
			; Wait for any key
;			bsr		crawcin					;wait key

;			rts
