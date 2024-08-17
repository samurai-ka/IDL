; Inter Development Demo Library
; (c) 1993-2012

				; output	'c:\dev\src\idl\demo.tos'
				include	'main.s'
			
				opt		D+						; Include all symbols for debugging in the output file. Default is off in Devpac-comptability mode, otherwise on.
				; OPT		X+				; Only include xdefs in the output file (no symbols). This flag has always the inverted state of d.
				; OPT		A+				; Automatically optimize absolute to PC-relative references. Default is off in Devpac-comptability mode, otherwise on.
				mc68030
				; m68882
;					OPT		opt-speed

;SupportST			equ	0
;SupportSTE			equ	0
;SupportF030		equ	1

;SupportRGB			equ	1
SupportVGA:		set		1

;SupportMP2			equ	0
;SupportACE			equ	0

;CheckMem			equ		4				; Minimum memory set to = 4 or 14
show_CpuCycles	set		1						; Turn on/off raster time visualization
