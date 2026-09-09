;
; Inter Development Demo Library
;
;------------------------------------------------------------------------------
                section text
;------------------------------------------------------------------------------

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


; ------------------------------------------------------------------
; WAIT_FOR_VBL
;
; Wartet auf den nächsten VBL.
;

; Beispiele:
;       WAIT_FOR_VBL
;
; Wichtig:
;       Wenn debug auf 1 steht, wird das Register f030_videl_pal256.w auf 160 gesetzt,
;       um die VBL-Rate zu erhöhen. Nach dem Warten wird das Register wieder auf 0 gesetzt.
; ------------------------------------------------------------------
                macro WAIT_FOR_VBL

                IFNE    debug
                    move.l  #160,f030_videl_pal256.w
                ENDC

                sf      vsync_flag
.waitvblloop:
                tst.b   vsync_flag
                beq.s   .waitvblloop

                IFNE    debug
                    clr.l   f030_videl_pal256.w
                ENDC

                endm
