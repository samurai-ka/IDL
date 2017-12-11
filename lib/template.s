;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'Get_System'
; This Subroutine uses the buserror Vector to enum the system
; SystemType: Bit xxx43210
;                    ||||+- ST
;                    |||+-- STE
;                    ||+--- Mega STE
;                    |+---- Falcon 030
;                    +----- TT
;------------------------------------------------------------------------------
IDL_GetSet_Function:

			rts
;------------------------------------------------------------------------------
			section data
;------------------------------------------------------------------------------			
			even
;AudioSystemLockedText:
;				 0123456789012345678901234567890123456789
;			dc.b	"Audiosystem:                    ",27,112,"   OK   ",27,113,13,10,0

;			even

;------------------------------------------------------------------------------
			section	bss
;------------------------------------------------------------------------------

;cookie_result:	ds.l	1
