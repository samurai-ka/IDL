; Inter Development Demo Library
; (c) 1993-2012

;-----------------------------------------------------------------------------
;		Codestart and Transient Program Area
;-----------------------------------------------------------------------------
		move.l	4(sp),a0						; Pointer on BASEPAGE
		lea		mystack,sp						; Set Stack-Pointer
		move.l	#$100,d0						; Basepage lenght
		add.l	$c(a0),d0						; Text-Segment lenght
		add.l	$14(a0),d0						; Data-Segment lenght
		add.l	$1c(a0),d0						; BSS-Segment lenght
		move.l	d0,-(sp)						; Result on Stack
		move.l	a0,-(sp)						; Basepage-Adresse on Stack
		clr.w	-(sp)							; Clearing all up

		move.w	#$4a,-(sp)						; Mshrink()
		trap	#1								; Call GEMDOS
		lea		$c(sp),sp						; Stack cleanup

		pea		main(pc)						; Pointer main
		move.w	#38,-(sp)						; Supervisior mode
		trap	#14								; on
		addq.l	#6,sp							; Stack cleanup

		move.w	d0,-(sp)						; Return Call
_Pterm:	move.w	#$4c,-(sp)						; Pterm()
		trap	#1								; Call GEMDOS. Over and out!
				; EOF
;-----------------------------------------------------------------------------
;			Main
;-----------------------------------------------------------------------------
main:
		bsr		clear_keyboard_buffer
		move.l	#DemoHeaderText,d0
		bsr		_Cconws
;bsr		crawcin					; Wait for any key

		bsr		init

;-----------------------------------------------------------------------------
;			Demoloop
;-----------------------------------------------------------------------------
;demoloop:
;bsr		IDL_Get_System
;move.l	(cookie_result),d1
;cmp.l	d0,cookie_result

		bsr		crawcin							; Wait for key

		move.w	#$4,-(sp)						; Offset 2 / TC
		move.w	#88,-(sp)						; Offset 0
		trap	#14								; Call XBIOS
		addq.l	#4,sp							; Correct stack

		bsr		IDL_Get_Videobase				; Get Videobase point in A6

		; lea		_p_screen_1,a6					; Set Framebuffer to pointer
		move.w	#%0110101010010101,d6			; Set blit
		bsr		IDL_Clear_Framebuffer			; Call Clear Framebuffer
		; bsr		IDL_Set_Videobase				; a6 already set to framebuffer. Call Set_Videobase address

		bsr		IDL_Mainloop			


;-----------------------------------------------------------------------------
			
		bsr		exit
			
		bsr		clear_keyboard_buffer
		move.l	#DummyText,d0
		bsr		_Cconws
		bsr		crawcin
			
		rts
;-----------------------------------------------------------------------------
;			Includes
;			equ.s		definitions for all kind of registers, vectors, etc.
;						include/exclude files there to configure which
;						EQU should be added
;			scankeys.s	The scankeys and some ASCII codes
;			init.s		Initalize the enviroment before entering the mainloop
;			exit.s		After exiting the mainloop and restore the system
;-----------------------------------------------------------------------------
		include	'helper\equ.s'
		include	'helper\scankeys.s'
		include	'lib\init.s'
		include	'lib\exit.s'			
		include	'lib\error.s'
;-----------------------------------------------------------------------------
		section	data
;-----------------------------------------------------------------------------
		even
DemoHeaderText:
;					"         1         2         3         4"
;					"1234567890123456789012345678901234567890"
		dc.b	27,69
		dc.b	27,112,"     Inter Development Demo Library     ",27,113,CR,LF
		dc.b	"     An Indepentend Production 2017     ",CR,LF,CR,LF,CR,LF
		dc.b	0
		even

DummyText:
		dc.b	"Exit functions done...",0
;-----------------------------------------------------------------------------
		section	bss
;-----------------------------------------------------------------------------
		even
		ds.l	2000							; 2000 LongWords Stackspace
mystack: ds.l	2			
save_stack: ds.l 1


SystemType ds.b	1

ScreenWidth equ	384*2							; Overscan 384 pixel @ TrueColor (2x .w)
ScreenHight equ	288
ScreenBuffers equ 3
