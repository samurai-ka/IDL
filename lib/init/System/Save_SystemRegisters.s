;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'Save_SystemRegisters'
;------------------------------------------------------------------------------
IDL_Save_SystemRegisters:
			move.w  SR,SavSR        					; Statusregister retten
			ori     #$0700,sr       					; Interrupts off
			move.l	#SavRegStack,a6						; Pointer to the userstack to save the registers

			move.w  #-1,-(sp)							; Set mode = -1 (Reads the screen settings instead setting them)
			move.w  #88,-(sp)							; XBIOS Int16 Vsetmode() - Set Video hardware register
			trap    #14									; Falcon XBIOS function to obtain the video hardware settings
			addq.l  #4,sp								; Correct stack
			move.w  d0,-(a6)							; Save mode

			movem.l $FFFF8240.w,D0-D7					; Save registers - 16-Colors-Register
			movem.l D0-D7,-(a6)

			lea.l	f030_videl_pal256.w,a0				; Save registers - 256-Colors-Register CHANGE THIS TO STACK
			lea.l	SaveRegF030Pal,a1
			move.w	#256-1,d7
.loop256Pal:
			move.l	(a0)+,(a1)+
			dbra	d7,.loop256Pal

			move.l  _p_bus_error.w,-(a6)				; Save registers - Exception vectors
			move.l  _p_adress_error.w,-(a6)
			move.l  _p_hbl.w,-(a6)
			move.l  _p_vbl.w,-(a6)
			move.l  _p_mfp_io4.w,-(a6)
			move.l  _p_mfp_timer_d.w,-(a6)
			move.l  _p_mfp_timer_c.w,-(a6)
			move.l  _p_mfp_timer_b.w,-(a6)
			move.l  _p_mfp_timer_a.w,-(a6)

			move.b  mfp_irqA_enable.w,-(a6)				; Save registers - MFP
			move.b  mfp_irqB_enable.w,-(a6)
			move.b  mfp_irqA_mask.w,-(a6)
			move.b  mfp_irqB_mask.w,-(a6)
			move.b  mfp_vector_reg.w,-(a6)
			move.b  mfp_timerA_ctrl.w,-(a6)
			move.b  mfp_timerB_ctrl.w,-(a6)
			move.b  mfp_timerCD_ctrl.w,-(a6)

			move.l	a6,SavRegStackState					; Save the position of the user stack

			andi    #$F8FF,sr       					; Interrupts on

			bsr		clear_keyboard_buffer
			move.l	#SystemSavedText,d0
			bsr		_Cconws

			rts



;ds_w6:					move    SR,-(SP)        		; Save status register
;						ori     #$0700,SR       		; Interrupts off

;						move.w  system_flag(PC),D0		; Wich system is this?
;						cmp.w   #%1000,D0				; 1=ST,2=STe,4=MSTe,8=F030,16=TT
;						beq.s   xbios_rez_falcon

;						move.w  #4,-(sp)				; XBIOS Int16 Getrez() - Return current screen resolution code
;						trap    #14						; The XBIOS routine Getrez obtains the current resolution of the screen
;        				addq.l  #2,sp					; Correct stack
;						move.w	d0,-(sp)				; Save rez

;                		move.w  #12,D7

;xbios_rez_falcon:
						; move.w  #-1,-(sp)				; Set mode = -1 (Reads the screen settings instead setting them)
                		; move.w  #88,-(sp)				; XBIOS Int16 Vsetmode() - Set Video hardware register
                		; trap    #14						; Falcon XBIOS function to obtain the video hardware settings
                		; addq.l  #4,sp					; Correct stack
                		; move.w  d0,SaveRegScrMode				; Save mode
				
;                		move.w  #3,-(SP)
;                		move.w  #14,D7

; ds_w12:
; 						move.w  #2,-(sp)     			; XBIOS *Phybase - Returns the physical start address of the video memory
; 						trap    #14          			; The XBIOS routine Physbase returns the physical start address of the RAM region currently being used for the video memory
; 						addq.l  #2,sp        			; Correct stack
; 						move.l	d0,-(sp)				; Save paddr

;ds_w12:         move.w  #2,-(SP)        ; Bildschirmadresse retten
;                trap    #14
;                addq.l  #2,SP
;                move.l  D0,-(SP)
;                move.l  D0,-(SP)	; WARUM WIRD HIER ZWEIMAL D0 GESICHERT???

;                 move.w  #5,-(SP)
;                 move.w  D7,-(SP)

;                 lea     2048,A0
;                 move.w  #509,D0
; ds_l0:          move.l  -(A0),-(SP)
;                 dbra    D0,ds_l0

;                 move.b  $FFFF8260.w,-(SP) ; Shifter - Register retten
;                 move.l  $FFFF8200.w,-(SP)
;                 movem.l $FFFF8240.w,D0-D7 ; 16-Farb-Register retten
;                 movem.l D0-D7,-(SP)

;                 move.l  $08.w,-(SP)
;                 move.l  $0C.w,-(SP)
;                 move.l  $68.w,-(SP)     ; Exceptionsvektoren retten
;                 move.l  $70.w,-(SP)
;                 move.l  $0118.w,-(SP)
;                 move.l  $0120.w,-(SP)
;                 move.l  $0134.w,-(SP)

;                 move.b  $FFFFFA07.w,-(SP) ; MFP - Register retten
;                 move.b  $FFFFFA09.w,-(SP)
;                 move.b  $FFFFFA13.w,-(SP)
;                 move.b  $FFFFFA15.w,-(SP)
;                 move.b  $FFFFFA17.w,-(SP)
;                 move.b  $FFFFFA19.w,-(SP)
;                 move.b  $FFFFFA1B.w,-(SP)
;                 move.b  $FFFFFA1D.w,-(SP)

;                 move.l  SP,original_sp
; ; Alles abschalten...
;                 lea     $FFFFFA07.w,A1  ; MFP - Interrupts stoppen
;                 moveq   #0,D1
;                 moveq   #7,D0
; ds_l2:          move.b  D1,(A1)
;                 addq.l  #2,A1
;                 dbra    D0,ds_l2

;                 lea     dummy_rte(PC),A0
;                 move.l  A0,$08.w
;                 move.l  A0,$0C.w
;                 lea     dummy_rte(PC),A0 ; Exceptionsvektoren auf RTE setzen
;                 move.l  A0,$68.w
;                 move.l  A0,$70.w
;                 move.l  A0,$0118.w
;                 move.l  A0,$0120.w
;                 move.l  A0,$0134.w
