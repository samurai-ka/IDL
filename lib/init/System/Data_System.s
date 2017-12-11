;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
			section data
;------------------------------------------------------------------------------			
			even
exit_st_text:
			dc.b	CR,LF
			dc.b	"System:                         ",27,112," FAILED ",27,113,7,CR,LF
			dc.b	CR,LF
			dc.b	"It seems like you're trying to run this",CR,LF
			dc.b	"presentation on a ST. This demo is",CR,LF
			dc.b	"intend to run on a Falcon030 or",CR,LF
			dc.b	"compatible systems only.",CR,LF
			dc.b	CR,LF,"Press any key to exit.",CR,LF,0
            dc.b    0

			even
exit_system_text:
			dc.b	CR,LF
			dc.b	"System:                         ",27,112," FAILED ",27,113,7,CR,LF
			dc.b	CR,LF
			dc.b	"It seems like you're trying to run this",CR,LF
			dc.b	"presentation on a unsupported system.",CR,LF
			dc.b	"This demo is intend to run on a",CR,LF
			dc.b	"Falcon 030 or compatible systems only.",CR,LF
			dc.b	CR,LF,"Press any key to exit.",CR,LF
            dc.b    0

			even
IsFalcon030Text:
			dc.b	"System: Falcon030               ",27,112,"   OK   ",27,113,CR,LF
			dc.b	0

			even
cookie_VDO:
			dc.b	"_VDO"

			even
SystemSavedText:
			dc.b	"System status saved...          ",27,112,"   OK   ",27,113,CR,LF,0

			even
SystemRestoredText:
			dc.b	"System status restored...       ",27,112,"   OK   ",27,113,CR,LF,0

			even
exit_1mb_text:
            dc.b	CR,LF
            dc.b	"Memory: 1mb                     ",27,112," FAILED ",27,113,7,CR,LF
            dc.b	"This presentation is not made to be view",CR,LF
            dc.b	"with only 1mb of ram. Upgrade to 14mb",CR,LF
            dc.b	"and try again. Srly...",CR,LF
            dc.b	CR,LF,"Press any key to exit.",CR,LF,0

            even
exit_4mb_text:
            dc.b	CR,LF
            dc.b	"Memory: 4mb                     ",27,112," FAILED ",27,113,7,CR,LF
            dc.b	"This presentation is not made to be view",CR,LF
            dc.b	"with only 4mb of ram. Upgrade to 14mb",CR,LF
            dc.b	"and try again. Srly...",CR,LF
            dc.b	CR,LF,"Press any key to exit.",CR,LF,0

            even
is14mbText:
            dc.b	"Memory: 14mb                    ",27,112,"   OK   ",27,113,CR,LF,0

			even
SystemSetToMaxSpeedText:
            dc.b	"Speed: 16MHz                    ",27,112,"   OK   ",27,113,CR,LF,0

;------------------------------------------------------------------------------
			section	bss
;------------------------------------------------------------------------------
cookie_MCH_result:	ds.b	1
cookie_VDO_result:	ds.b	1

;					even
					ds.l	200				; 200 LongWords Stackspace
SavRegStack:		ds.l	2				; Stack starting point
SavRegStackState:	ds.l	1				; Pointer with the last position of the user stack
SavSR:				ds.w 	1
SaveRegScrLaddr:	ds.l 	1				; logical screen address
SaveRegScrPaddr:	ds.l 	1				; physical screen address
SaveRegScrRez:		ds.w 	1				; screen rez
SaveRegScrMode:		ds.w 	1
SaveRegShifterA:	ds.b	1
SaveRegShifterB:	ds.l	1
SaveRegF030Pal:		ds.l	256				; Falcon Palette