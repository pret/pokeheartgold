	.ifndef ASM_SCRIPT_INC
	.set ASM_SCRIPT_INC, 1
#pragma once
#include "constants/scrcmd.h"
    .option alignment off

	.macro scrdef offset
	.word \offset - . - 4
	.endm

	.macro scrdef_end
	.short SCRDEF_END
	.endm

	; Dummy command
	.macro nop
	.short 0
	.endm

	; Dummy command
	.macro dummy
	.short 1
	.endm

	; Exits script execution and returns control to the player
	.macro end
	.short 2
	.endm

	; Pauses for some frames, tracks the timer in a script variable
	.macro wait frames, var
	.short 3
	.short \frames
	.short \var
	.endm

	; Loads 8-bit value into the specified script register
	.macro loadbyte reg, val
	.short 4
	.byte \reg
	.byte \val
	.endm

	; Loads 32-bit value into the specified script register
	.macro loadword reg, val
	.short 5
	.byte \reg
	.word \val
	.endm

	; Reads byte at a specific memory address into a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro loadbytefromaddr reg, addr
	.short 6
	.byte \reg
	.word \addr
	.endm

	; Writes byte to a specific memory address from a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro writebytetoaddr addr, reg
	.short 7
	.word \addr
	.byte \reg
	.endm

	; Writes byte literal to a specific memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro setptrbyte addr, val
	.short 8
	.word \addr
	.byte \val
	.endm

	; Copies a byte between script registers
	.macro copylocal to, from
	.short 9
	.byte \to
	.byte \from
	.endm

	; Copies a byte between two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro copybyte to, from
	.short 10
	.word \to
	.word \from
	.endm

	; Compares values between script reg and script reg
	.macro comparelocaltolocal a, b
	.short 11
	.byte \a
	.byte \b
	.endm

	; Compares script reg to byte literal
	.macro comparelocaltovalue reg, val
	.short 12
	.byte \reg
	.byte \val
	.endm

	; Compares script reg to memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro comparelocaltoaddr reg, addr
	.short 13
	.byte \reg
	.word \addr
	.endm

	; Compares memory address to script reg
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtolocal addr, reg
	.short 14
	.word \addr
	.byte \reg
	.endm

	; Compares memory address to byte literal
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtovalue addr, val
	.short 15
	.word \addr
	.byte \val
	.endm

	; Compares bytes at two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtoaddr a, b
	.short 16
	.word \a
	.word \b
	.endm

	; Compares variable to 16-bit literal
	.macro comparevartovalue var, val
	.short 17
	.short \var
	.short \val
	.endm

	; Compares two variables
	.macro comparevartovar a, b
	.short 18
	.short \a
	.short \b
	.endm

	; Creates a new script context to run the indicated script asynchronously
	.macro runscript id
	.short 19
	.short \id
	.endm

	; Creates a new script context to run the indicated script and wait
	.macro runscriptwait id
	.short 20
	.short \id
	.endm

	; Yield to parent context
	.macro restartcurrentscript
	.short 21
	.endm

	; Absolute branch to offset in script
	.macro goto dest
	.short 22
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific object
	.macro objectgoto object, dest
	.short 23
	.byte \object
	.word \dest-.-4
	.endm

	; Branch to offset in script if interacting with a specific bg event
	.macro bggoto bg, dest
	.short 24
	.byte \bg
	.word \dest-.-4
	.endm

	; Branch to offset in script if facing a specific direction
	.macro directiongoto dir, dest
	.short 25
	.byte \dir
	.word \dest-.-4
	.endm

	; Call script as a subroutine
	.macro call sub
	.short 26
	.word \sub-.-4
	.endm

	; Return from subroutine
	.macro return
	.short 27
	.endm

	; Conditional branch to offset in script
	.macro gotoif condition, dest
	.short 28
	.byte \condition
	.word \dest-.-4
	.endm

	; Conditional call subroutine
	.macro callif condition, sub
	.short 29
	.byte \condition
	.word \sub-.-4
	.endm

	.endif ; ASM_SCRIPT_INC
