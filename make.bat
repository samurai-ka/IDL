D:\atari\vasm\bin\vasmm68k_mot_win32.exe -m68030 -no-opt -devpac -Ftos -noesc -o %1.tos %1.s
COPY /Y D:\Atari\DEV\src\IDL\%1.tos "D:\Atari\Falcon HDD\DEV\"

D:\Atari\hatari-2.0.0_windows64\hatari.exe -c "c:\users\Hagen\.hatari\F030_14M_16MHz_T404.cfg" --fast-boot 1 -w --confirm-quit 0 --compatible 1 -W --debug-except illegal -D "%1.tos"
rem D:\Atari\hatari-2.0.0_windows64\hatari.exe -c "c:\users\Hagen\.hatari\F030_14M_16MHz_T404.cfg" --fast-boot 1 -w --confirm-quit 0 "%1.tos"
rem D:\Atari\hatari-2.0.0_windows64\hatari.exe -c "c:\users\Hagen\.hatari\F030_14M_16MHz_T404.cfg" -w --grab
