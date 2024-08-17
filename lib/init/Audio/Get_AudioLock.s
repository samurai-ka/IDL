; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;	IDL Function 'IDL_Get_AudioLock'
;------------------------------------------------------------------------------
IDL_Get_AudioLock:
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

;------------------------------------------------------------------------------
			section data
;------------------------------------------------------------------------------			
			even
AudioSystemLockedText:
			dc.b	"Audiosystem...                  ",27,112,"   OK   ",27,113,13,10
			dc.b	0

            even
exit_dsplocked_text:
            dc.b	13,10
            dc.b	"Audio:                          ",27,112," FAILED ",27,113,7,13,10
            dc.b	"The DSP is already in use by an other",13,10
            dc.b	"application. Shutdown all other running",13,10
            dc.b	"applications or restart your system.",13,10
            dc.b	13,10,"Press any key to exit.",13,10
			dc.b	0

            even
exit_sndlocked_text:
            dc.b	13,10
            dc.b	"Audio:                          ",27,112," FAILED ",27,113,7,13,10
            dc.b	"The Falcon audio subsystem already in",13,10
            dc.b	"use by another application.",13,10
            dc.b	13,10,"Press any key to exit.",13,10
			dc.b	0
            even

;------------------------------------------------------------------------------
			section	bss
;------------------------------------------------------------------------------

DSPLock:	        ds.b	1
AudioSystemLock:	ds.b	1
