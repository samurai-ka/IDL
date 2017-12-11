; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section text
;------------------------------------------------------------------------------

;-----------------------------------------------------------------------------
init:
			bsr		IDF_Get_System				; Test if the System is a Falcon
			bsr		IDF_Set_F030_16MHz			; Go full power (16MHz)
			bsr		IDF_Get_DisplayType			; Test the Falcon Video system
			bsr		IDF_Get_SystemMemory
			bsr		IDF_Save_SystemRegisters	; Save all registers
			bsr		IDF_Get_AudioLock           ; Get a lock on the Falcon Audiosystem
			bsr		IDF_Init_YMChip				; Reseting YM and internal speaker off

			bsr		crawcin						; Wait for key
			
			rts

;-----------------------------------------------------------------------------
;			Includes
;			Add includes after the bsr call, otherwise it crashes *headscratch*
;-----------------------------------------------------------------------------
			include 'lib\init\System\System.s'
            include 'lib\init\Video\Video.s'
            include 'lib\init\Audio\Audio.s'

;------------------------------------------------------------------------------
			section data
;------------------------------------------------------------------------------			
			even

;------------------------------------------------------------------------------
			section	bss
;------------------------------------------------------------------------------
			even
cookie_result:	ds.l	1
