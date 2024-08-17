; Inter Development Demo Library
;
;------------------------------------------------------------------------------
				section	text
;------------------------------------------------------------------------------

;-----------------------------------------------------------------------------
init:
				bsr		IDL_Get_System			; Test if the System is a Falcon
				bsr		IDL_Set_F030_16MHz		; Go full power (16MHz)
				bsr		IDL_Get_DisplayType		; Test the Falcon Video system
				bsr		IDL_Get_SystemMemory
				bsr		IDL_Save_SystemRegisters ; Save all registers
				bsr		IDL_Get_AudioLock		; Get a lock on the Falcon Audiosystem
				bsr		IDL_Init_YMChip			; Reseting YM and internal speaker off
				rts

;-----------------------------------------------------------------------------
;			Includes
;			Add includes after the bsr call, otherwise it crashes *headscratch*
;-----------------------------------------------------------------------------
				include	'lib\init\System\System.s'
				include	'lib\init\Video\Video.s'
				include	'lib\init\Audio\Audio.s'

;------------------------------------------------------------------------------
				section	data
;------------------------------------------------------------------------------			
				even

;------------------------------------------------------------------------------
				section	bss
;------------------------------------------------------------------------------
				even
cookie_result:	ds.l	1
