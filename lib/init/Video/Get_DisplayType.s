;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;		monitor test
;		0=Mono, 1=RGB, 2=VGA
;------------------------------------------------------------------------------
IDL_Get_DisplayType:
			move.w	#$59,-(sp)			; VGetMonitor()
			trap	#14					; Execute
			addq.l	#2,sp				; Correct stack

			tst.w	d0					; Is the screen Mono?
			bne.s	.notMono			; No? check if VGA

			move.l	#exit_mono_text,error_txt	; Set pointer error message
			bra.w	error				;
		
.notMono:
			cmp.w	#2,d0				; Is screen VGA?
			beq.s	.isVGA				;
			
			move.b	d0,ScreenType		; 1 = RGB

			move.l	#IsRGBText,d0
			bsr		_Cconws

			rts			
.isVGA:
		;IF SupportVGA
			move.b	d0,ScreenType		; 2 = VGA
			move.l	#IsVGAText,d0
			bsr		_Cconws	
		;ELSE
		;	move.l	#exit_vga_text,error_txt	; Set pointer error message
		;	bra.w	error				;
		;ENDIF			
			rts			
