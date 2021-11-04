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
	.macro wait frames:req, var:req
	.short 3
	.short \frames
	.short \var
	.endm

	; Loads 8-bit value into the specified script register
	.macro loadbyte reg:req, val:req
	.short 4
	.byte \reg
	.byte \val
	.endm

	; Loads 32-bit value into the specified script register
	.macro loadword reg:req, val:req
	.short 5
	.byte \reg
	.word \val
	.endm

	; Reads byte at a specific memory address into a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro loadbytefromaddr reg:req, addr:req
	.short 6
	.byte \reg
	.word \addr
	.endm

	; Writes byte to a specific memory address from a script register
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro writebytetoaddr addr:req, reg:req
	.short 7
	.word \addr
	.byte \reg
	.endm

	; Writes byte literal to a specific memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro setptrbyte addr:req, val:req
	.short 8
	.word \addr
	.byte \val
	.endm

	; Copies a byte between script registers
	.macro copylocal to:req, from:req
	.short 9
	.byte \to
	.byte \from
	.endm

	; Copies a byte between two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro copybyte to:req, from:req
	.short 10
	.word \to
	.word \from
	.endm

	; Compares values between script reg and script reg
	.macro comparelocaltolocal a:req, b:req
	.short 11
	.byte \a
	.byte \b
	.endm

	; Compares script reg to byte literal
	.macro comparelocaltovalue reg:req, val:req
	.short 12
	.byte \reg
	.byte \val
	.endm

	; Compares script reg to memory address
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro comparelocaltoaddr reg:req, addr:req
	.short 13
	.byte \reg
	.word \addr
	.endm

	; Compares memory address to script reg
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtolocal addr:req, reg:req
	.short 14
	.word \addr
	.byte \reg
	.endm

	; Compares memory address to byte literal
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtovalue addr:req, val:req
	.short 15
	.word \addr
	.byte \val
	.endm

	; Compares bytes at two memory addresses
	; Because scripts are compiled in a code-agnostic fashion,
	; this command can never be assembled.
	.macro compareaddrtovalue a:req, b:req
	.short 16
	.word \a
	.word \b
	.endm

	; Compares variable to 16-bit literal
	.macro comparevartovalue var:req, val:req
	.short 17
	.short \var
	.short \val
	.endm

	; Compares two variables
	.macro comparevartovar a:req, b:req
	.short 18
	.short \a
	.short \b
	.endm

	.endif ; ASM_SCRIPT_INC
