	.include "asm/macros.inc"
	.include "MSL_Common_alloc.inc"
	.include "global.inc"

	.text

	arm_func_start malloc
malloc: ; 0x020E4970
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl __sys_alloc
	ldmia sp!, {r3, pc}
	arm_func_end malloc

	arm_func_start free
free: ; 0x020E4988
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl __sys_free
	ldmia sp!, {r3, pc}
	arm_func_end free

	exception malloc, 0x0019, 0x00100000
	exception free, 0x0015, 0x00100000
