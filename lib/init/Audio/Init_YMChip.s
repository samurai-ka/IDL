;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
;
; Soundchip init
; Turns of the speaker inside of Falcons
;

IDL_Init_YMChip:
                moveq   #10,D0
                lea     YM2149_Read.w,A0
                lea     YM2149_Write.w,A1

.init_YM_loop:
                move.b D0,(A0)                      ; #10 -> ym_select
                clr.b   (A1)                        ; #0 -> ym_write
                dbra    D0,.init_YM_loop            ; loop killing of all YM generators
 
                move.b  #7,(A0)                     ; #7 -> ym_select
                move.b  #%01111111,(A1)             ; #127 -> ym_write, Noise & Tone off
 
                move.b  #14,(A0)                    ; # 14 -> ym_select
                move.b  #%01100110,(A1)             ; #38+64 -> ym_write, killing internal speaker
                
                rts
