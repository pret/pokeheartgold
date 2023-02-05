	.include "asm/macros.inc"
	.include "fx_mtx22.inc"
	.include "global.inc"
	.text

	arm_func_start MTX_Identity22_
MTX_Identity22_: ; 0x020CAF70
	mov r1, #0
	mov r2, #0x1000
	mov r3, #0
	stmia r0!, {r2, r3}
	stmia r0!, {r1, r2}
	bx lr
	arm_func_end MTX_Identity22_

	thumb_func_start MTX_Rot22_
MTX_Rot22_: ; 0x020CAF88
	str r2, [r0]
	str r1, [r0, #4]
	neg r1, r1
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	thumb_func_end MTX_Rot22_

	arm_func_start MTX_ScaleApply22
MTX_ScaleApply22: ; 0x020CAF94
	stmdb sp!, {r3, lr}
	ldr ip, [r0]
	smull lr, ip, r2, ip
	mov lr, lr, lsr #0xc
	orr lr, lr, ip, lsl #20
	str lr, [r1]
	ldr ip, [r0, #4]
	smull lr, ip, r2, ip
	mov r2, lr, lsr #0xc
	orr r2, r2, ip, lsl #20
	str r2, [r1, #4]
	ldr r2, [r0, #8]
	smull ip, r2, r3, r2
	mov ip, ip, lsr #0xc
	orr ip, ip, r2, lsl #20
	str ip, [r1, #8]
	ldr r0, [r0, #0xc]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end MTX_ScaleApply22
