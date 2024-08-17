;
; Inter Development Demo Library
;

;------------------------------------------------------------------------------
			section data
;------------------------------------------------------------------------------			
			even
IsRGBText:
			dc.b	"Videl: RGB                      ",27,112,"   OK   ",27,113,CR,LF,0

			even
IsVGAText:
			dc.b	"Videl: VGA (Meh!)               ",27,112,"   OK   ",27,113,CR,LF,0

			even
exit_mono_text:	
            dc.b	13,10
            dc.b	"Videl: Mono                     ",27,112," FAILED ",27,113,7,CR,LF
            dc.b	"This presentation is not made to be view",CR,LF
            dc.b	"on a monochrome monitor. Please, connect",CR,LF
            dc.b	"a supported display like RGB or VGA to",CR,LF
            dc.b	"your Falcon030 and try again.",CR,LF
            dc.b	CR,LF,"Press any key to exit.",CR,LF,0

            even
exit_mxalloc_text:	
            dc.b	13,10
            dc.b	"Memory allocation               ",27,112," FAILED ",27,113,7,CR,LF
            dc.b	CR,LF,"Press any key to exit.",CR,LF,0

;------------------------------------------------------------------------------
			section	bss
;------------------------------------------------------------------------------
ScreenType:	    ds.b	1
vsync_flag:     ds.b    1

; _p_screen_1:	ds.l	1					; screen address 1
; _p_screen_2:	ds.l	1					; screen address 2
; _p_screen_3:	ds.l	1					; screen address 3
; _p_screen_1:    ds.w    384*288             ; TC Screen
; _p_screen_2:    ds.w    384*288             ; TC Screen
; _p_screen_3:    ds.w    384*288             ; TC Screen
