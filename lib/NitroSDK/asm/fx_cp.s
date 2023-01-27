	.include "asm/macros.inc"
	.include "fx_cp.inc"
	.include "global.inc"
	.text

	arm_func_start FX_Div
FX_Div: ; 0x020CCBA0
	stmdb sp!, {r3, lr}
	bl FX_DivAsync
	bl FX_GetDivResult
	ldmia sp!, {r3, pc}
	arm_func_end FX_Div

	arm_func_start FX_Inv
FX_Inv: ; 0x020CCBB0
	stmdb sp!, {r3, lr}
	bl FX_InvAsync
	bl FX_GetDivResult
	ldmia sp!, {r3, pc}
	arm_func_end FX_Inv

	arm_func_start FX_InvFx64c
FX_InvFx64c: ; 0x020CCBC0
	stmdb sp!, {r3, lr}
	bl FX_InvAsync
	ldr r1, _020CCBE4 ; =0x04000280
_020CCBCC:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020CCBCC
	ldr r1, _020CCBE8 ; =0x040002A0
	ldmia r1, {r0, r1}
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CCBE4: .word 0x04000280
_020CCBE8: .word 0x040002A0
	arm_func_end FX_InvFx64c

	arm_func_start FX_Sqrt
FX_Sqrt: ; 0x020CCBEC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	movle r0, #0
	ldmleia sp!, {r3, pc}
	ldr r2, _020CCC1C ; =0x040002B0
	mov r1, #1
	strh r1, [r2]
	mov r1, #0
	str r1, [r2, #8]
	str r0, [r2, #0xc]
	bl FX_GetSqrtResult
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CCC1C: .word 0x040002B0
	arm_func_end FX_Sqrt

	arm_func_start FX_GetDivResultFx64c
FX_GetDivResultFx64c: ; 0x020CCC20
	ldr r1, _020CCC3C ; =0x04000280
_020CCC24:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020CCC24
	ldr r1, _020CCC40 ; =0x040002A0
	ldmia r1, {r0, r1}
	bx lr
	.align 2, 0
_020CCC3C: .word 0x04000280
_020CCC40: .word 0x040002A0
	arm_func_end FX_GetDivResultFx64c

	arm_func_start FX_GetDivResult
FX_GetDivResult: ; 0x020CCC44
	ldr r1, _020CCC74 ; =0x04000280
_020CCC48:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020CCC48
	ldr r0, _020CCC78 ; =0x040002A0
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r2, r1, #0x80000
	adc r1, r0, #0
	mov r0, r2, lsr #0x14
	orr r0, r0, r1, lsl #12
	bx lr
	.align 2, 0
_020CCC74: .word 0x04000280
_020CCC78: .word 0x040002A0
	arm_func_end FX_GetDivResult

	arm_func_start FX_InvAsync
FX_InvAsync: ; 0x020CCC7C
	ldr r2, _020CCCA8 ; =0x04000280
	mov r1, #1
	strh r1, [r2]
	mov r1, #0
	str r1, [r2, #0x10]
	mov r1, #0x1000
	str r1, [r2, #0x14]
	str r0, [r2, #0x18]
	mov r0, #0
	str r0, [r2, #0x1c]
	bx lr
	.align 2, 0
_020CCCA8: .word 0x04000280
	arm_func_end FX_InvAsync

	arm_func_start FX_GetSqrtResult
FX_GetSqrtResult: ; 0x020CCCAC
	ldr r1, _020CCCD0 ; =0x040002B0
_020CCCB0:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020CCCB0
	ldr r0, _020CCCD4 ; =0x040002B4
	ldr r0, [r0]
	add r0, r0, #0x200
	mov r0, r0, lsr #0xa
	bx lr
	.align 2, 0
_020CCCD0: .word 0x040002B0
_020CCCD4: .word 0x040002B4
	arm_func_end FX_GetSqrtResult

	arm_func_start FX_DivAsync
FX_DivAsync: ; 0x020CCCD8
	ldr r3, _020CCCFC ; =0x04000280
	mov r2, #1
	strh r2, [r3]
	mov r2, #0
	str r2, [r3, #0x10]
	str r0, [r3, #0x14]
	str r1, [r3, #0x18]
	str r2, [r3, #0x1c]
	bx lr
	.align 2, 0
_020CCCFC: .word 0x04000280
	arm_func_end FX_DivAsync

	arm_func_start FX_DivS32
FX_DivS32: ; 0x020CCD00
	ldr r2, _020CCD34 ; =0x04000280
	mov r3, #0
	strh r3, [r2]
	str r0, [r2, #0x10]
	str r1, [r2, #0x18]
	mov r0, r3
	str r0, [r2, #0x1c]
_020CCD1C:
	ldrh r0, [r2]
	tst r0, #0x8000
	bne _020CCD1C
	ldr r0, _020CCD38 ; =0x040002A0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020CCD34: .word 0x04000280
_020CCD38: .word 0x040002A0
	arm_func_end FX_DivS32

	arm_func_start FX_ModS32
FX_ModS32: ; 0x020CCD3C
	ldr r2, _020CCD70 ; =0x04000280
	mov r3, #0
	strh r3, [r2]
	str r0, [r2, #0x10]
	str r1, [r2, #0x18]
	mov r0, r3
	str r0, [r2, #0x1c]
_020CCD58:
	ldrh r0, [r2]
	tst r0, #0x8000
	bne _020CCD58
	ldr r0, _020CCD74 ; =0x040002A8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020CCD70: .word 0x04000280
_020CCD74: .word 0x040002A8
	arm_func_end FX_ModS32
