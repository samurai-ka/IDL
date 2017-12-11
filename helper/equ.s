; Inter Development Demo Library
; (c) 1993-2017

; ################## Vectors

            ;       CPU Reset Vectors
			include 'helper\equ\VectorsReset.s'

            ;       CPU Exception Vectors
			include 'helper\equ\VectorsException.s'

            ;       Auto-Vector Interrupts
			include 'helper\equ\VectorsAuto.s'

            ;       Trap Vectors (Trap #n = Vector number + 32 + n)
			include 'helper\equ\VectorsTrap.s'

            ;       FPU Vectors (68881/68882/Internal)
			include 'helper\equ\VectorsFPU.s'

            ;       PMMU (68851/Internal(68030))
			include 'helper\equ\f030\VectorsPMMU.s'

            ; ###   User Assigned Interrupt Vectors
			include 'helper\equ\VectorsMFP.s'

            ;       System Crash Page
			include 'helper\equ\SystemCrashpage.s'

; ################## ST

            ; ###   System Variables
			include 'helper\equ\SystemVariable.s'

            ;       IDE Controller
			include 'helper\equ\f030\Ide.s'

            ;       ROM expansion cartridge
			include 'helper\equ\cartridge.s'

            ;       SHIFTER Video Controller
			include 'helper\equ\shifter.s'

            ;       DMA/WD1772 Disk controller
			include 'helper\equ\fdc.s'

            ;       YM2149 Sound Chip
			include 'helper\equ\YM2149.s'

            ;       DMA Sound System
			include 'helper\equ\dmasound.s'

            ;       Blitter
			include 'helper\equ\blitter.s'

            ;       Zilog 8530 SCC
			include 'helper\equ\zilog.s'

            ;       MFP 68901 - Multi Function Peripheral Chip
			include 'helper\equ\mfp.s'

            ;       6850 ACIA I/O Chips
			include 'helper\equ\acia.s'

; ################# Falcon Includes

            ;       Falcon DMA/DSP Controllers (Crossbar) 
			include 'helper\equ\f030\crossbar.s'

            ;       Falcon RTC Chip (DS1287)
			include 'helper\equ\f030\rtc.s'

            ;       Falcon Extended Joystick/Lightpen Ports
			include 'helper\equ\f030\ExtendedJoy.s'

            ;       Falcon VIDEL Video Controller  
			include 'helper\equ\f030\Videl.s'

            ;       Falcon VIDEL Palette Registers
			include 'helper\equ\f030\VidelPalette.s'

            ;       Falcon DSP Host Interface
			include 'helper\equ\f030\DSPHostInterface.s'

            ;       Falcon030 BUS Expansion Space
			include 'helper\equ\f030\ExpansionBus.s'

            ;       Falcon030 SYSTEM Control
			include 'helper\equ\f030\system.s'

            ;       Falcon OS ROMs
			include 'helper\equ\f030\TOSRom.s'


; Reaaaallly old stuff down here. No use any more.....
; iera            EQU $FFFFFA07   ;Interrupt-Enable-Register A
; ierb            EQU $FFFFFA09   ;                                                               B
; imra            EQU $FFFFFA13
; isra            EQU $FFFFFA0F
; isrb            EQU $FFFFFA11
; tacr            EQU $FFFFFA19
; tbcr            EQU $FFFFFA1B
; tadr            EQU $FFFFFA1F
; tbdr            EQU $FFFFFA21
; tccr            EQU $FFFFFA1D
; tcdr            EQU $FFFFFA23
; aer             EQU $FFFFFA03
; stcolor         EQU $FFFF8240
; fcolor          EQU $FFFF9800
; vbl             EQU $70
; timer_a_int     EQU $0134
; timer_b_int     EQU $0120
; timer_c_int     EQU $0114

; ym_select       EQU $FFFF8800
; ym_write        EQU $FFFF8802
;ym_read         EQU $FFFF8800

; vbaselow        EQU $FFFF820D
; vbasemid        EQU $FFFF8203
; vbasehigh       EQU $FFFF8201
; vcountlow       EQU $FFFF8209
; vcountmid       EQU $FFFF8207
; vcounthigh      EQU $FFFF8205
; linewid         EQU $FFFF820F
; hscroll         EQU $FFFF8265

; keyctl          EQU $FFFFFC00
; keybd           EQU $FFFFFC02

; dsphost         EQU $FFFFA200
;hostintvec      EQU $03FC

;phystop			EQU $042E
;_p_cookiejar    EQU $05A0

; hop             EQU $FFFF8A3A
; op              EQU $FFFF8A3B
; line_nr         EQU $FFFF8A3C
; mode            EQU $FFFF8A3C
; skew            EQU $FFFF8A3D
; endmask1        EQU $FFFF8A28
; endmask2        EQU $FFFF8A2A
; endmask3        EQU $FFFF8A2C
; x_count         EQU $FFFF8A36
; y_count         EQU $FFFF8A38
; dest_x_inc      EQU $FFFF8A2E
; dest_y_inc      EQU $FFFF8A30
; dest_adr        EQU $FFFF8A32
; src_x_inc       EQU $FFFF8A20
; src_y_inc       EQU $FFFF8A22
; src_adr         EQU $FFFF8A24

; mpx_src             EQU $FFFF8930
; mpx_dst             EQU $FFFF8932
