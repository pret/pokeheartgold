	.include "asm/macros.inc"
	.include "mi_init.inc"
	.include "global.inc"

	.public MI_SetWramBank

	.text

	arm_func_start MI_Init
MI_Init: ; 0x020D502C
	stmdb sp!, {r3, lr}
	mov r0, #3
	bl MI_SetWramBank
	mov r0, #0
	bl MI_StopDma
	ldmia sp!, {r3, pc}
	arm_func_end MI_Init
