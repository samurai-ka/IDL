; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;	IDF Function 'IDF_Get_AudioLock'
;------------------------------------------------------------------------------
IDF_Get_AudioLock:
			move.w	#$68,-(sp)			; XBIOS Dsp_Lock()
			trap	#14					; Call
			addq.l	#2,sp				; Stack cleanup
			
			tst.w	d0					;dsp locked?
			beq.s	.DSPlocked			;ok
			move.l	#exit_dsplocked_text,error_txt		;error message
			bra.w	error				;

.DSPlocked:	move.b	#1,DSPLock			;1 restore dsp_lock

			move.w	#$80,-(sp)			; XBIOS Locksnd()
			trap	#14					; Call
			addq.l	#2,sp				; Stack cleanup
			
			cmp.w	#1,d0				; soundsystem lock
			beq.s	.SndLocked			; ok
			move.l	#exit_sndlocked_text,error_txt		;error message
			bra.w	error				;

.SndLocked:	move.b	#1,AudioSystemLock	; 2 restore locksnd

			move.l	#AudioSystemLockedText,d0
			bsr		_Cconws				; Print Success

			rts
