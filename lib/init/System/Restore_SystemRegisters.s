;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
				section	text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'Restore_SystemRegisters'
;------------------------------------------------------------------------------
IDL_Restore_SystemRegisters:
				ori		#$0700,SR				; Interrupts off

				movea.l	SavRegStackState(PC),A6	; Pointer to the userstack to save the registers

				move.b	(A6)+,mfp_timerCD_ctrl.w ; Restore registers - MFP
				move.b	(A6)+,mfp_timerB_ctrl.w
				move.b	(A6)+,mfp_timerA_ctrl.w
				move.b	(A6)+,mfp_vector_reg.w
				move.b	(A6)+,mfp_irqB_mask.w
				move.b	(A6)+,mfp_irqA_mask.w
				move.b	(A6)+,mfp_irqB_enable.w
				move.b	(A6)+,mfp_irqA_enable.w

				move.l	(A6)+,_p_mfp_timer_a.w	; Restore registers - Exception vectors
				move.l	(A6)+,_p_mfp_timer_b.w
				move.l	(A6)+,_p_mfp_timer_c.w
				move.l	(A6)+,_p_mfp_timer_d.w
				move.l	(A6)+,_p_mfp_io4.w
				move.l	(A6)+,_p_vbl.w
				move.l	(A6)+,_p_hbl.w
				move.l	(A6)+,_p_adress_error.w
				move.l	(A6)+,_p_bus_error.w

				lea.l	f030_videl_pal256.w,A0	; Save registers - 256-Colors-Register
				lea.l	SaveRegF030Pal,A1
				move.w	#256-1,D7
.loop256Pal:
				move.l	(A1)+,(A0)+
				dbra	D7,.loop256Pal

				movem.l	(A6)+,D0-D7				; Restore registers - 16-Colors-Register
				movem.l	$ffff8240.w,D0-D7		; 

				; move.w	shifter_dbaseh-1,-(a6)	    ; Restore Shifter video base registers
				; move.w	shifter_dbasem-1,-(a6)
				; move.w	shifter_dbasel-1,-(a6)

;			move.l  (a6)+,$FFFF8200.w		        ; Restore registers - shifter
;			move.b  (a6)+,$FFFF8260.w		        ; ST Rez doesn't need to be restored

				move.w	(A6)+,-(SP)				; Set mode = -1 (Reads the screen settings instead setting them)
				move.w	#88,-(SP)				; XBIOS Int16 Vsetmode() - Set Video hardware register
				trap	#14						; Falcon XBIOS function to obtain the video hardware settings
				addq.l	#4,SP					; Correct stack

				move.w	SavSR,SR				; Restore status register

				bsr		clear_keyboard_buffer
				move.l	#SystemRestoredText,D0
				bsr		_Cconws

				rts
