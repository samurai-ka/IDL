; Inter Development Demo Library
; (c) 1993-2012

					MC68030
			
					output	'c:\dev\src\idl\demo.tos'
					include 'main.s'
			
;SupportST			equ	0
;SupportSTE			equ	0
;SupportF030		equ	1

;SupportRGB			equ	1
SupportVGA:			set	1

;SupportMP2			equ	0
;SupportACE			equ	0

;CheckMem			equ		4				; Minimum memory set to = 4 or 14
show_CpuCycles		SET 	0				; Turn on/off raster time visualization
