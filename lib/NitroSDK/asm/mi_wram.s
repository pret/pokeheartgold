	.include "asm/macros.inc"
	.include "mi_wram.inc"
	.include "global.inc"

	.text

	arm_func_start MI_SetWramBank
MI_SetWramBank: ; 0x020D3F64
	ldr r1, _020D3F70 ; =0x04000247
	strb r0, [r1]
	bx lr
	.align 2, 0
_020D3F70: .word 0x04000247 ; reg_GX_VRAMCNT_WRAM
	arm_func_end MI_SetWramBank
