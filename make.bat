ECHO Off
CLS

set GEMDOS_TARGET_PATH=C:\temp\Hatari\gemdos-hd\IDL
set HATARI_BASE_PATH=C:\temp\Hatari\hatari-2.5.0_windows64
set VASM_BASE_PATH=C:\temp\Hatari\vbcc

ECHO "Compiling %1.s%"
%VASM_BASE_PATH%\bin\vasmm68k_mot.exe -Ddebug=1 -no-opt -Ftos -noesc -o out\%1.tos %1.s

ECHO "Copying %1 to Gemdos drive..."
COPY /N /Y %USERPROFILE%\Sources\IDL\out\%1.tos %GEMDOS_TARGET_PATH%

ECHO "Starting Hatari..."
%HATARI_BASE_PATH%\hatari.exe -c "C:\Users\D0275801\AppData\Local\Hatari\F030_14M_16MHz_T404.cfg" --fast-boot 1 -w --confirm-quit 0 --compatible 1 -W --debug-except illegal -D "%GEMDOS_TARGET_PATH%\%1.tos"
