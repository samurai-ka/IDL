                                    ; ####### Miscellaneous Vectors                               ###########
                                    ; ------+-----------------------------------------------------+----------
                    ;EQU $000000EC  ;       | (Unassigned, Reserved)                              | SD
                    ;               ;   :   |    :             :                                  |  :
                    ;EQU $000000FC  ;       | (Unassigned, Reserved)                              | SD

                                    ; ####### User Assigned Interrupt Vectors                     ###########
                                    ; ------+-----------------------------------------------------+----------
_p_mfp_io0          EQU $00000100   ;       | ST-MFP-0  - IO0 - Centronics BUSY   vector# $40     | SD
_p_mfp_io1          EQU $00000104   ;       | ST-MFP-1  - IO1 - Centronics ACK 	                  | SD
_p_mfp_io2          EQU $00000108   ;       | ST-MFP-2  - IO2 - MIDI ACIA INT		              | SD
_p_mfp_dspcon       EQU $0000010C   ;       | ST-MFP-3  - IO3 - DSP Connector INT 			      | SD
_p_mfp_timer_d      EQU $00000110   ;       | ST-MFP-4  - Timer D (USART timer)                   | SD
_p_mfp_timer_c      EQU $00000114   ;       | ST-MFP-5  - Timer C (200hz Clock)                   | SD
_p_mfp_io4          EQU $00000118   ;       | ST-MFP-6  - IO4 - Keyboard & MIDI ACIA INT	      | SD
_p_mfp_io5          EQU $0000011C   ;       | ST-MFP-7  - IO5 - FDC & HDC & IDE INT		          | SD
_p_mfp_timer_b      EQU $00000120   ;       | ST-MFP-8  - Timer B (HBL)                           | SD
_p_mfp_senderror    EQU $00000124   ;       | ST-MFP-9  - Send Error                              | SD
_p_mfp_sendbuff     EQU $00000128   ;       | ST-MFP-10 - Send buffer empty                       | SD
_p_mfp_receiveerr   EQU $0000012C   ;       | ST-MFP-11 - Receive error                           | SD
_p_mfp_receivebuf   EQU $00000130   ;       | ST-MFP-12 - Receive buffer full                     | SD
_p_mfp_timer_a      EQU $00000134   ;       | ST-MFP-13 - Timer A (STE sound)                     | SD
_p_mfp_io6          EQU $00000138   ;       | ST-MFP-14 - IO6 - RS-232 RING Indicator             | SD
_p_mfp_io7          EQU $0000013C   ;       | ST-MFP-15 - IO7 - SND INT 			      $4F     | SD
                                    ; ------+-----------------------------------------------------+----------
_p_mfp_sccirq       EQU $00000180   ;       | SCC Interrupt                               $60     | SD
                                    ;       |       :                                      :      |  :
                   ;EQU $000001BC   ;       | SCC Interrupt                               $6F     | SD
                                    ; ------+-----------------------------------------------------+----------
_p_mfp_dspirq       EQU $000001BC   ;       | DSP Interrupt  	                          $70	  | SD 
                                    ; ------+-----------------------------------------------------+----------
                    ;EQU $000001C0  ;       | User Defined, Unused                        $71     | SD
                                    ;   :   |   :     :        :                           :      |  :
                    ;EQU $0000037C  ;       | User Defined, Unused                        $DF     | SD
