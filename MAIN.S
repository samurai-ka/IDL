; Inter Development Demo Library
; (c) 1993-2012

			OPT 	D+				; Include all symbols for debugging in the output file. Default is off in Devpac-comptability mode, otherwise on.
;			OPT		X+				; Only include xdefs in the output file (no symbols). This flag has always the inverted state of d.
;			OPT		A+				; Automatically optimize absolute to PC-relative references. Default is off in Devpac-comptability mode, otherwise on.
;			GLOBAL	m68030, m68882
;			OPT		opt-speed

;-----------------------------------------------------------------------------
;		Codestart and Transient Program Area
;-----------------------------------------------------------------------------
            move.l    4(sp),a0      ; Pointer on BASEPAGE
            lea       mystack,sp    ; Set Stack-Pointer
            move.l    #$100,d0      ; Basepage lenght
            add.l     $c(a0),d0     ; Text-Segment lenght
            add.l     $14(a0),d0    ; Data-Segment lenght
            add.l     $1c(a0),d0    ; BSS-Segment lenght
            move.l    d0,-(sp)      ; Result on Stack
            move.l    a0,-(sp)      ; Basepage-Adresse on Stack
            clr.w     -(sp)         ; Clearing all up

            move.w    #$4a,-(sp)    ; Mshrink()
            trap      #1            ; Call GEMDOS
            lea       $c(sp),sp     ; Stack cleanup

    		pea     main(pc)		; Pointer main
            move.w  #38,-(sp)		; Supervisior mode
            trap    #14				; on
            addq.l  #6,sp			; Stack cleanup

            move.w    d0,-(sp)      ; Return Call
_Pterm:     move.w    #$4c,-(sp)    ; Pterm()
            trap      #1            ; Call GEMDOS. Over and out!
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
;			init.s		Prepares the enviroment and sets up the main loop
;			exit.s		Shutdown the mainloop and restores the system
;-----------------------------------------------------------------------------
			include 'helper\equ.s'
			include 'helper\scankeys.s'
            include 'lib\init.s'
			include	'lib\exit.s'			
			include 'lib\error.s'
;-----------------------------------------------------------------------------
			section data
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
			section bss
;-----------------------------------------------------------------------------
			even
			ds.l	2000				; 2000 LongWords Stackspace
mystack:	ds.l	2			
save_stack:	ds.l	1


SystemType	ds.b	1

ScreenWidth		EQU		384*2				; Overscan 384 pixel @ TrueColor (2x .w)
ScreenHight		EQU		288
ScreenBuffers	EQU		3