;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'Clear Framebuffer'
;   a6  =>  pointer to screen
;   d7  =>  size of screen
;   d6  =>  Value to write to buffer
;------------------------------------------------------------------------------
IDL_Clear_Framebuffer:
                        move.l  #320*200,d7

.clearLoop              
                        ; clr.w   (a6)+
                        move.w  d6,(a6)+
                        dbra    d7,.clearLoop

                        rts

;------------------------------------------------------------------------------
; IDL Function 'Get Videobase'
;   a6  =>  pointer to videobase address
;   d7      destroyed
;------------------------------------------------------------------------------
IDL_Get_Videobase:
                        clr.w   d7
                        move.b  shifter_dbaseh,d7
                        lsl.l   #8,d7
                        move.b  shifter_dbasem,d7
                        lsl.l   #8,d7
                        move.b  shifter_dbasel,d7
                        movea   d7,a6
                        rts

;------------------------------------------------------------------------------
; IDL Function 'Set Videobase'
;   a6  =>  pointer to videobase
;   d7      destroyed
;------------------------------------------------------------------------------
IDL_Set_Videobase:
                        move.l  a6,d7
                        move.b  d7,shifter_dbasel       ; put in low screen address byte
                        lsr.l   #8,d7
                        move.b  d7,shifter_dbasem       ; put in mid screen address byte
                        lsr.l   #8,d7
                        move.b  d7,shifter_dbaseh       ; put in high screen address byte
                        rts

;------------------------------------------------------------------------------
                        section	bss
;------------------------------------------------------------------------------
                        even
; _p_screen_1:    ds.w    384*288             ; TC Screen
_p_screen_2:    ds.w    384*288             ; TC Screen
_p_screen_3:    ds.w    384*288             ; TC Screen

_p_screen_1:    ds.w    320*200             ; TC Screen
