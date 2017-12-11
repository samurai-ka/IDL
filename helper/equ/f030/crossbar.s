                                    ; ####### Falcon030 DMA/DSP Controllers                        ###########
                                    ; ------+------------------------------------------------------+----------
f030_cross_src_crtl EQU $FFFF8930   ; word  | Crossbar Source Controller                           | R/W 
                                    ;       +------------------------------------------------------+
                                    ;       | Source: A/D Convertor                BIT 15 14 13 12 |
                                    ;       | 1 - Connect, 0 - disconnect --------------'  |  |  | |
                                    ;       | 00 - 25.175Mhz clock ------------------------+--+  | |
                                    ;       | 01 - External clock -------------------------+--+  | |
                                    ;       | 10 - 32Mhz clock (Don't use) ----------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ;       +------------------------------------------------------+
                                    ;       | Source: External Input               BIT 11 10  9  8 |
                                    ;       | 0 - DSP IN, 1 - All others ---------------'  |  |  | |
                                    ;       | 00 - 25.175Mhz clock ------------------------+--+  | |
                                    ;       | 01 - External clock -------------------------+--+  | |
                                    ;       | 10 - 32Mhz clock ----------------------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ;       +------------------------------------------------------+
                                    ;       | Source: DSP-XMIT                     BIT  7  6  5  4 |
                                    ;       | 0 - Tristate and disconnect DSP ----------+  |  |  | |
                                    ;       |     (Only for external SSI use)           |  |  |  | |
                                    ;       | 1 - Connect DSP to multiplexer -----------'  |  |  | |
                                    ;       | 00 - 25.175Mhz clock ------------------------+--+  | |
                                    ;       | 01 - External clock -------------------------+--+  | |
                                    ;       | 10 - 32Mhz clock ----------------------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ;       +------------------------------------------------------+
                                    ;       | Source: DMA-PLAYBACK                 BIT  3  2  1  0 |
                                    ;       | 0 - Handshaking on, dest DSP-REC ---------+  |  |  | |
                                    ;       | 1 - Destination is not DSP-REC -----------'  |  |  | |
                                    ;       | 00 - 25.175Mhz clock ------------------------+--+  | |
                                    ;       | 01 - External clock -------------------------+--+  | |
                                    ;       | 10 - 32Mhz clock ----------------------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ; ------+------------------------------------------------------+----------
f030_cross_dst_crtl EQU $FFFF8932   ; word  | Crossbar Destination Controller                      | R/W 
                                    ;       +------------------------------------------------------+
                                    ;       | Destination: D/A Convertor           BIT 15 14 13 12 |
                                    ;       | 1 - Connect, 0 - Disconnect --------------'  |  |  | |
                                    ;       | 00 - Source DMA-PLAYBACK --------------------+--+  | |
                                    ;       | 01 - Source DSP-XMIT ------------------------+--+  | |
                                    ;       | 10 - Source External Input ------------------+--+  | |
                                    ;       | 11 - Source A/D Convertor -------------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ;       +------------------------------------------------------+
                                    ;       | Destination: External Output         BIT 11 10  9  8 |
                                    ;       | 0 - DSP out, 1 - All others --------------'  |  |  | |
                                    ;       | 00 - Source DMA-PLAYBACK --------------------+--+  | |
                                    ;       | 01 - Source DSP-XMIT ------------------------+--+  | |
                                    ;       | 10 - Source External Input ------------------+--+  | |
                                    ;       | 11 - Source A/D Convertor -------------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ;       +------------------------------------------------------+
                                    ;       | Destination: DSP-RECORD              BIT  7  6  5  4 |
                                    ;       | 0 - Tristate and disconnect DSP ----------+  |  |  | |
                                    ;       |     (Only for external SSI use)           |  |  |  | |
                                    ;       | 1 - Connect DSP to multiplexer -----------'  |  |  | |
                                    ;       | 00 - Source DMA-PLAYBACK --------------------+--+  | |
                                    ;       | 01 - Source DSP-XMIT ------------------------+--+  | |
                                    ;       | 10 - Source External Input ------------------+--+  | |
                                    ;       | 11 - Source A/D Convertor -------------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ;       +------------------------------------------------------+
                                    ;       | Destination: DMA-RECORD              BIT  3  2  1  0 |
                                    ;       | 0 - Handshaking on, src DSP-XMIT ---------+  |  |  | |
                                    ;       | 1 - Source is not DSP-XMIT ---------------'  |  |  | |
                                    ;       | 00 - Source DMA-PLAYBACK --------------------+--+  | |
                                    ;       | 01 - Source DSP-XMIT ------------------------+--+  | |
                                    ;       | 10 - Source External Input ------------------+--+  | |
                                    ;       | 11 - Source A/D Convertor -------------------+--'  | |
                                    ;       | 0 - Handshake on, 1 - Handshake off ---------------' |
                                    ; ------+------------------------------------------------------+----------
f030_frq_div_extclk EQU $FFFF8934   ; byte  | Frequency Divider External Clock         BIT 3 2 1 0 | R/W 
                                    ;       | 0000 - STe-Compatible mode                           |
                                    ;       | 0001 - 1111  Divide by 256 and then number           |
                                    ; ------+------------------------------------------------------+----------
f030_frq_div        EQU $FFFF8935   ; byte  | Frequency Divider Internal Sync          BIT 3 2 1 0 | R/W 
                                    ;       | 0000 - STe-Compatible mode   1000 - 10927Hz*         |
                                    ;       | 0001 - 49170Hz               1001 -  9834Hz          |
                                    ;       | 0010 - 32780Hz               1010 -  8940Hz*         |
                                    ;       | 0011 - 24585Hz               1011 -  8195Hz          |
                                    ;       | 0100 - 19668Hz               1100 -  7565Hz*         |
                                    ;       | 0101 - 16390Hz               1101 -  7024Hz*         |
                                    ;       | 0110 - 14049Hz*              1110 -  6556Hz*         |
                                    ;       | 0111 - 12292Hz               1111 -  6146Hz*         |
                                    ;       |               * - Invalid for CODEC                  |
                                    ; ------+------------------------------------------------------+----------
f030_rec_track_sel  EQU $FFFF8936   ; byte  | Record Tracks Select                         BIT 1 0 | R/W 
                                    ;       | 00 - Record 1 Track -----------------------------+-+ |
                                    ;       | 01 - Record 2 Tracks ----------------------------+-+ |
                                    ;       | 10 - Record 3 Tracks ----------------------------+-+ |
                                    ;       | 11 - Record 4 Tracks ----------------------------+-' |
                                    ; ------+------------------------------------------------------+----------
f030_codec_in_src   EQU $FFFF8937   ; byte  | CODEC Input Source from 16bit adder          BIT 1 0 | R/W 
                                    ;       | Source: Multiplexer -----------------------------' | |
                                    ;       | Source: A/D Convertor -----------------------------' |
                                    ; ------+------------------------------------------------------+----------
f030_codec_in_ADC   EQU $FFFF8938   ; byte  | CODEC ADC-Input for L+R Channel              BIT 1 0 | R/W 
                                    ;       | 0 - Microphone, 1 - Soundchip                    L R |
                                    ; ------+------------------------------------------------------+----------
f030_chan_amp       EQU $FFFF8939   ; byte  | Channel amplification                  BIT LLLL RRRR | R/W 
                                    ;       |           Amplification is in +1.5dB steps           |
                                    ; ------+------------------------------------------------------+----------
f030_chan_att       EQU $FFFF893A   ; word  | Channel attenuation                    BIT LLLL RRRR | R/W 
                                    ;       |            Attenuation is in -1.5dB steps            |
                                    ; ------+------------------------------------------------------+----------
f030_codec_sr       EQU $FFFF893C   ; byte  | CODEC-Status                                 BIT 1 0 | R/W 
                                    ;       | Left Channel Overflow ---------------------------' | |
                                    ;       | Right Channel Overflow ----------------------------' |
                                    ; ------+------------------------------------------------------+----------
f030__GPx_data_dir  EQU $FFFF8941   ; byte  | GPx Data Direction                         BIT 2 1 0 | R/W 
                                    ;       | 0 - In, 1 - Out -------------------------------+-+-' |
                                    ;       |  For the GP0-GP2 pins on the DSP connector           |
                                    ; ------+------------------------------------------------------+----------
f030_GPx_data_port  EQU $FFFF8943   ; byte  | GPx Data Port                              BIT 2 1 0 | R/W
