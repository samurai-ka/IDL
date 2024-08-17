# Inter Demo Libray

The Inter Development Demo libray for Atari Falcon030 is a set of low level functions to develop computer demos.

## Build

`> make demo`

Creates the file demo.tos

## Principles

Every function of the library that does not need to be executed in real time should be outsourced to a separate subroutine. This is done to reduce the number of lines in the source code per file to improve readability.

---

## Functions

### Helpers

- [acia](../helper/equ/acia.s)
- blitter
- cardride
- dmasound
- fdc
- mfp
- shifter
- SystemCrashpage
- SystemVariable
- Vectors
  - Auto
  - Exception
  - FPU
  - MFP
  - Reset
  - Trap
- YM2149
- zilog
- equ
- scankeys

### Initalzation

### Videl

### Sound

### DSP
