                                    ; ####### System Variables                                    ###########
                                    ; ------+-----------------------------------------------------+----------
etv_timer           EQU $00000400   ; long  | GEM Event timer vector                              |
etv_critic          EQU $00000404   ; long  | GEM Critical error handler                          |
etv_term            EQU $00000408   ; long  | GEM Program termination vector                      |
etv_xtra            EQU $0000040C   ; long  | GEM Additional vector #1 (Unused)                   |
                                    ;       |   :   :     :     :    :    :                       |
                   ;EQU $0000041C   ; long  | GEM Additional vector #5 (Unused)                   |
memvalid            EQU $00000420   ; long  | Validates memory configuration if $752019F3         |
memctrl             EQU $00000424   ; word  | Copy of contents of $FF8001                         |
resvalid            EQU $00000426   ; long  | Validates resvector if $31415926                    |
resvector           EQU $0000042A   ; long  | Reset vector                                        |
phystop             EQU $0000042E   ; long  | Physical top of RAM                                 |
_membot             EQU $00000432   ; long  | Start of TPA (user memory)                          |
_memtop             EQU $00000436   ; long  | End of TPA (user memory)                            |
memval2             EQU $0000043A   ; long  | Validates memcntrl and memconf if $237698AA         |
flock               EQU $0000043E   ; word  | If nonzero, floppy disk VBL routine is disabled     |
seekrate            EQU $00000440   ; word  | Floppy Seek rate - 0:6ms, 1:12ms, 2:2ms, 3:3ms      |
_timer_ms           EQU $00000442   ; word  | Time between two timer calls (in milliseconds)      |
_fverify            EQU $00000444   ; word  | If not zero, verify floppy disk writes              |
_bootdev            EQU $00000446   ; word  | Default boot device                                 |
palmode             EQU $00000448   ; word  | 0 - NTSC (60hz), <>0 - PAL (50hz)                   |
defshiftmod         EQU $0000044A   ; word  | Default video resolution                            |
sshiftmod           EQU $0000044C   ; word  | Copy of contents of $FF8260                         |
_v_bas_ad           EQU $0000044E   ; long  | Pointer to video RAM (logical screen base)          |
vblsem              EQU $00000452   ; word  | If not zero, VBL routine is not executed            |
nvbls               EQU $00000454   ; word  | Number of vertical blank routines                   |
_vblqueue           EQU $00000456   ; long  | Pointer to list of vertical blank routines          |
colorptr            EQU $0000045A   ; long  | If not zero, points to color palette to be loaded   |
screenpt            EQU $0000045E   ; long  | If not zero, points to video ram for next VBL       |
_vbclock            EQU $00000462   ; long  | Counter for number of VBLs                          |
_frclock            EQU $00000466   ; long  | Number of VBL routines executed                     |
hdv_init            EQU $0000046A   ; long  | Vector for hard disk initialization                 |
swv_vec             EQU $0000046E   ; long  | Vector for resolution change                        |
hdv_bpb             EQU $00000472   ; long  | Vector for getbpb for hard disk                     |
hdv_rw              EQU $00000476   ; long  | Vector for read/write routine for hard disk         |
hdv_boot            EQU $0000047A   ; long  | Vector for hard disk boot                           |
hdv_mediach         EQU $0000047E   ; long  | Vector for hard disk media change                   |
_comload            EQU $00000482   ; word  | If not zero, attempt to load "COMMAND.PRG" on boot  |
conterm             EQU $00000484   ; byte  | Attribute vector for console output     BIT 3 2 1 0 |
                                    ;       | Return "kbshift" for BIOS conin ------------' | | | |
                                    ;       | System bell (1 - on) -------------------------' | | |
                                    ;       | Key repeat (1 - on) ----------------------------' | |
                                    ;       | Key click (1 - on) -------------------------------' |
trp14ret            EQU $00000486   ; long  | Return address for TRAP #14                (unused) |
criticret           EQU $0000048A   ; long  | Return address for critical error handler  (unused) |
themd               EQU $0000048E   ; long  | Memory descriptor block                             |
themdmd             EQU $0000049E   ; long  | Space for additional memory descriptors             |
savptr              EQU $000004A2   ; long  | Pointer to BIOS save registers block                |
_nflops             EQU $000004A6   ; word  | Number of connected floppy drives                   |
con_state           EQU $000004A8   ; long  | Vector for screen output                            |
save_row            EQU $000004AC   ; word  | Temporary storage for cursor line position          |
sav_context         EQU $000004AE   ; long  | Pointer to save area for exception processing       |
_bufl               EQU $000004B2   ; long  | Pointer to buffer control block for GEMDOS data     |
_bufl_fat           EQU $000004B6   ; long  | Pointer to buffer control block for GEMDOS fat/dir  |
_hz_200             EQU $000004BA   ; long  | Counter for 200hz system clock                      |
the_env             EQU $000004BC   ; long  | Pointer to default environment string               |
_drvbits            EQU $000004C2   ; long  | Bit allocation for physical drives (bit 0=A, 1=B..) |
_dskbufp            EQU $000004C6   ; long  | Pointer to 1024-byte disk buffer                    |
_autopath           EQU $000004CA   ; long  | Pointer to autoexecute path                         |
_vbl_lis            EQU $000004CE   ; long  | Pointer to VBL routine #1                           |
                                    ;   :   |   :      :  :     :     :                           |
                   ;EQU $000004EA   ; long  | Pointer to VBL routine #8                           |
_dumpflg            EQU $000004EE   ; word  | Flag for screen -> printer dump                     |
_prtabt             EQU $000004F0   ; word  | Printer abort flag                                  |
_sysbase            EQU $000004F2   ; long  | Pointer to start of OS                              |
_shell_p            EQU $000004F6   ; long  | Global shell pointer                                |
end_os              EQU $000004FA   ; long  | Pointer to end of OS                                |
exec_os             EQU $000004FE   ; long  | Pointer to entry point of OS                        |
scr_dump            EQU $00000502   ; long  | Pointer to screen dump routine                      |
prv_lsto            EQU $00000506   ; long  | Pointer to _lstostat()                              |
prv_lst             EQU $0000050A   ; long  | Pointer to _lstout()                                |
prv_auxo            EQU $0000050E   ; long  | Pointer to _auxostat()                              |
prv_aux             EQU $00000512   ; long  | Pointer to _auxout()                                |
pun_ptr             EQU $00000516   ; long  | If AHDI, pointer to pun_info                        |
memval3             EQU $0000051A   ; long  | If $5555AAAA, reset                                 |
xconstat            EQU $0000051E   ; long  | 8 Pointers to input-status routines                 |
xconin              EQU $0000053E   ; long  | 8 Pointers to input routines                        |
xcostat             EQU $0000055E   ; long  | 8 Pointers to output-status routines                |
xconout             EQU $0000057E   ; long  | 8 Pointers to output routines                       |
_longframe          EQU $0000059E   ; word  | If not 0, then not 68000 - use long stack frames    |
_p_cookies          EQU $000005A0   ; long  | Pointer to cookie jar                               |
_p_cookiejar        EQU $000005A0   ; long  | Pointer to cookie jar                               |
ramtop              EQU $000005A4   ; long  | Pointer to end of FastRam                           |
ramvalid            EQU $000005A8   ; long  | Validates ramtop if $1357BD13                       |
bell_hook           EQU $000005AC   ; long  | Pointer to routine for system bell                  |
kcl_hook            EQU $000005B0   ; long  | Pointer to routine for system keyclick              |
