; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------
IDL_Get_System:
			move.l	_p_cookies.w,d0			; Load cookiejar pointer, if $0000 => Z Flag true
			beq.s 	.JarNotInstalled		; if Zero Flag = True then Jump
			movea.l d0,a0
.loop:
			move.l  (a0)+,d0           		; get cookie
			beq.s   .exitGetSystem			; if Zero Flag = True then Jump
			move.l  (a0)+,d1				; get cookie value
			bsr.s   processCookies			; Process cookie
			bra.s   .loop
.JarNotInstalled:
			move.l	#exit_st_text,error_txt	; Set pointer error message
			bra.w	error					; move out
.exitGetSystem:
            rts

;-----------------------------------------------------------------
processCookies:
			cmpi.l	#"_MCH",d0				; looking for the _MCH cookie
			bne.s	.noMatch_MCHCookie
			swap	d1						; use the upper cookie value for compare
			cmpi.w	#$0003,d1				; $0003.w identifies Falcons
			beq.s	.match_MCHFalcon		; if Falcon > Jump else Error out
			move.l	#exit_system_text,error_txt
			bra.w	error
.match_MCHFalcon:
			move.b	#$01,cookie_MCH_result
			move.l	#IsFalcon030Text,d0
			bsr		_Cconws
.noMatch_MCHCookie:
			rts
