; Inter Development Demo Library
;
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
			section data
;------------------------------------------------------------------------------			
; 			even
; AudioSystemLockedText:
; 			dc.b	"Audiosystem...                  ",27,112,"   OK   ",27,113,13,10,0

;             even
; exit_dsplocked_text:
;             dc.b	13,10
;             dc.b	"Audio:                          ",27,112," FAILED ",27,113,7,13,10
;             dc.b	"The DSP is already in use by an other",13,10
;             dc.b	"application. Shutdown all other running",13,10
;             dc.b	"applications or restart your system.",13,10
;             dc.b	13,10,"Press any key to exit.",13,10,0

;             even
; exit_sndlocked_text:
;             dc.b	13,10
;             dc.b	"Audio:                          ",27,112," FAILED ",27,113,7,13,10
;             dc.b	"The Falcon audio subsystem already in",13,10
;             dc.b	"use by another application.",13,10
;             dc.b	13,10,"Press any key to exit.",13,10,0
;             even

; ;------------------------------------------------------------------------------
; 			section	bss
; ;------------------------------------------------------------------------------

; DSPLock:	        ds.b	1
; AudioSystemLock:	ds.b	1
