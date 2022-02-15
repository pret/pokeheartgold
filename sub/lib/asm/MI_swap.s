	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start MI_SwapWord
MI_SwapWord: ; 0x037FB240
	swp r0, r0, [r1]
	bx lr
	arm_func_end MI_SwapWord
