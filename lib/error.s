;------------------------------------------------------------------------------
		section	text
;------------------------------------------------------------------------------
;			Error exit
;------------------------------------------------------------------------------
error:
			bsr 	clear_keyboard_buffer
			bsr		print_error
			bsr		crawcin					; wait for any key
			bsr		exit					; try to do a clean up
			jmp		_Pterm
			
;------------------------------------------------------------------------------
;			Subroutines for errors module
;------------------------------------------------------------------------------
print_error:
			move.l	error_txt,d0			;print error message
			bsr		_Cconws					;
			rts

clear_keyboard_buffer:
			bsr		bconstat
			
			tst.l	d0						;
			beq.s	.ok						;

			bsr		bconin
			bra.w	clear_keyboard_buffer	;			
.ok:
			rts								;

;------------------------------------------------------------------------------
;			Systemcalls for errors module
;------------------------------------------------------------------------------
bconstat:
			move.w	#2,-(sp)				; bconstat()
			move.w	#1,-(sp)				;
			trap	#13						;
			addq.l	#4,sp					;
			rts
;-----------------------------------------------------------------------------
bconin:
			move.w	#2,-(sp)				; bconin()
			move.w	#2,-(sp)				;
			trap	#13						;
			addq.l	#4,sp					;
			rts
;-----------------------------------------------------------------------------
_Cconws:
			move.l	d0,-(sp)				;cconws()
			move.w	#9,-(sp)				;
			trap	#1						;
			addq.l	#6,sp					;
			rts			
;-----------------------------------------------------------------------------
crawcin:
			move.w	#7,-(sp)				;crawcin()
			trap	#1						;
			addq.l	#2,sp					;
			rts								;
			
;------------------------------------------------------------------------------
			section	data
;				 0123456789012345678901234567890123456789
; 27,69 = ESC E = Clear Screen
;-----------------------------------------------------------------------------
			even

error_txt:	ds.l	1


exit_nostram_text:
		dc.b	27,69,13,10
		dc.b	"Memory:                           ",27,112," ERROR ",27,113,7,13,10
		dc.b	"Sorry, you don't have enough free ST-RAM",13,10
		dc.b	"to run this demo.",13,10
		dc.b	13,10,"Press any key to exit.",13,10,0
		even

exit_vga_text:	
		dc.b	13,10
		dc.b	"Videl: VGA                      ",27,112," FAILED ",27,113,7,13,10
		dc.b	"This presentation is not made to be view",13,10
		dc.b	"on a VGA monitor. Please, connect",13,10
		dc.b	"a supported display like RGB or TV to",13,10
		dc.b	"your Falcon030 and try again.",13,10
		dc.b	13,10,"Press any key to exit.",13,10,0
		even
		
exit_rgb_text:	
		dc.b	27,69,13,10
		dc.b	"Monitor:                             ",27,112,"   OK  ",27,113,13,10
		dc.b	13,10,"Press any key to exit.",13,10,0
		even

exit_nomodram_text:
		dc.b	27,69,13,10
		dc.b	"Sorry, you don't have enough free",13,10
		dc.b	"ST-RAM or Fast-RAM to run this demo.",13,10
		dc.b	13,10,"Press any key to exit.",13,10,0
		even

exit_musicnotfound_text:
		dc.b	27,69,13,10
		dc.b	"Sorry, the musicfile was not found.",13,10
		dc.b	13,10,"Press any key to exit.",13,10,0
		even

exit_filenotfound_text:
		dc.b	27,69,13,10
		dc.b	"Sorry, the file was not found.",13,10,13,10
		dc.b	"Press any key to exit.",13,10,0
		even
