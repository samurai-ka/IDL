;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
                section text
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
; IDL Function 'Clear Framebuffer'
;   a6  =>  pointer to screen
;   d7  =>  size of screen
;   d6  =>  Value to write to buffer
;------------------------------------------------------------------------------
; IDL_Clear_Framebuffer:
;                 move.l  #320*200,D7

; .clearLoop              
;                 ; clr.w   (a6)+
;                 move.w  D6,(A6)+
;                 dbra    D7,.clearLoop

;                 rts

; ------------------------------------------------------------------
; CLEAR_FRAMEBUFFER <address-register>,<size-in-bytes>
;
; Beispiel:
;       lea framebuffer,a0
;       CLEAR_FRAMEBUFFER a0,320*200
;
; Eingabe:
;       \1 = Adressregister mit Beginn des Framebuffers
;       \2 = statische Größe in Byte
;
; Zerstört:
;       d6 = Schleifenzähler
;       d7 = Nullwert
;       \1 = zeigt anschließend direkt hinter den Framebuffer
;
; Voraussetzung:
;       Größe ist durch 64 teilbar.
;       Größe / 64 liegt zwischen 1 und 65536.
; ------------------------------------------------------------------

                macro   CLEAR_FRAMEBUFFER

                ifne    (\2)&63
                    fail    "CLEAR_FRAMEBUFFER: size must be divisible by 64"
                endif

                ifle    \2
                    fail    "CLEAR_FRAMEBUFFER: size must be greater than zero"
                endif

                ifgt    ((\2)/64)-1-$ffff
                    fail    "CLEAR_FRAMEBUFFER: loop counter exceeds DBRA range"
                endif

                moveq   #0,d7
                move.w  #((\2)/64)-1,d6

.loop\@:
                rept    16
                    move.l  d7,(\1)+
                endr

                dbra    d6,.loop\@

                endm

                ;------------------------------------------------------------------------------
; IDL Function 'Get Videobase'
;   a6  <=  pointer to videobase address
;   d7      destroyed
;------------------------------------------------------------------------------
; IDL_Get_Videobase:
;                 clr.w   D7
;                 move.b  shifter_dbaseh,D7
;                 lsl.l   #8,D7
;                 move.b  shifter_dbasem,D7
;                 lsl.l   #8,D7
;                 move.b  shifter_dbasel,D7
;                 move.l  D7,A6                   ; Return pointer in A6
;                 rts

; ------------------------------------------------------------------
; GET_SCREENBASE_FAST <address-register>
;
; Liest die aktuell programmierte VIDEL-Bildschirmadresse.
;
; Beispiel:
;       GET_SCREENBASE_FAST a0
;
; Ergebnis:
;       \1 = Bildschirmadresse
;
; Zerstört:
;       d7
; ------------------------------------------------------------------
                macro GET_SCREENBASE

                moveq #0,d7
                move.b shifter_dbaseh.w,d7
                lsl.l #8,d7
                move.b shifter_dbasem.w,d7
                lsl.l #8,d7
                move.b shifter_dbasel.w,d7
                movea.l d7,\1

                endm

;------------------------------------------------------------------------------
; IDL Function 'Set Videobase'
;   a6  =>  pointer to videobase
;   d7      destroyed
;------------------------------------------------------------------------------
; IDL_Set_Videobase:
;                 move.l  A6,D7
;                 move.b  D7,shifter_dbasel       ; put in low screen address byte
;                 lsr.l   #8,D7
;                 move.b  D7,shifter_dbasem       ; put in mid screen address byte
;                 lsr.l   #8,D7
;                 move.b  D7,shifter_dbaseh       ; put in high screen address byte
;                 rts

; ------------------------------------------------------------------
; SET_SCREENBASE_FAST <source>
;
; Setzt die VIDEL-Bildschirmadresse.
;
; Erlaubte Übergabe:
;       Adressregister
;       Datenregister
;       Longword-Speichervariable
;       statisch definierte Adresse
;
; Beispiele:
;       SET_SCREENBASE_FAST a0
;       SET_SCREENBASE_FAST d0
;       SET_SCREENBASE_FAST screen_ptr
;       SET_SCREENBASE_FAST framebuffer
;
; Zerstört:
;       d7
;
; Wichtig:
;       Wenn als Quelle d7 übergeben wird, bleibt die ursprüngliche
;       Adresse nach Ausführung nicht erhalten.
; ------------------------------------------------------------------
                macro SET_SCREENBASE

                move.l \1,d7
                move.b d7,shifter_dbasel.w
                lsr.l #8,d7
                move.b d7,shifter_dbasem.w
                lsr.l #8,d7
                move.b d7,shifter_dbaseh.w

                endm

;------------------------------------------------------------------------------
                section bss
;------------------------------------------------------------------------------
                even
; _p_screen_1:    ds.w    384*288             ; TC Screen
_p_screen_2:    ds.w    384*288                 ; TC Screen
_p_screen_3:    ds.w    384*288                 ; TC Screen

_p_screen_1:    ds.w    320*200                 ; TC Screen
