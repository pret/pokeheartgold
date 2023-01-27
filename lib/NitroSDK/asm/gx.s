	.include "asm/macros.inc"
	.include "gx.inc"
	.include "global.inc"

	.bss

sDispMode:
	.space 2

	.public GXi_VRamLockId
GXi_VRamLockId:
	.space 2

	.data

	.public sIsDispOn
sIsDispOn:
	.word 1
	.public GXi_DmaId
GXi_DmaId:
	.word 3

	.text

	arm_func_start GX_Init
GX_Init: ; 0x020CD7C4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020CD8EC ; =0x04000304
	ldr r0, _020CD8F0 ; =0xFFFFFDF1
	ldrh r1, [r2]
	orr r1, r1, #0x8000
	strh r1, [r2]
	ldrh r1, [r2]
	and r0, r1, r0
	orr r0, r0, #0xe
	orr r0, r0, #0x200
	strh r0, [r2]
	ldrh r0, [r2]
	orr r0, r0, #1
	strh r0, [r2]
	bl GX_InitGXState
	ldr r5, _020CD8F4 ; =GXi_VRamLockId - 2
	ldrh r0, [r5, #2]
	cmp r0, #0
	bne _020CD838
	mvn r4, #2
_020CD814:
	bl OS_GetLockID
	mov r6, r0
	cmp r6, r4
	bne _020CD828
	bl OS_Terminate
_020CD828:
	strh r6, [r5, #2]
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _020CD814
_020CD838:
	ldr r0, _020CD8F8 ; =0x04000004
	mov r2, #0
	mov r3, #0x4000000
	strh r2, [r0]
	ldr r0, _020CD8FC ; =sIsDispOn
	str r2, [r3]
	ldr r0, [r0, #4]
	sub r1, r3, #0x4000001
	cmp r0, r1
	beq _020CD890
	add r1, r3, #8
	mov r3, #0x60
	bl MI_DmaFill32
	ldr r1, _020CD900 ; =0x0400006C
	mov r2, #0
	ldr r0, _020CD8FC ; =sIsDispOn
	strh r2, [r1]
	ldr r0, [r0, #4]
	ldr r1, _020CD904 ; =0x04001000
	mov r3, #0x70
	bl MI_DmaFill32
	b _020CD8B8
_020CD890:
	mov r0, r2
	add r1, r3, #8
	mov r2, #0x60
	bl MIi_CpuClear32
	ldr r3, _020CD900 ; =0x0400006C
	mov r0, #0
	ldr r1, _020CD904 ; =0x04001000
	mov r2, #0x70
	strh r0, [r3]
	bl MIi_CpuClear32
_020CD8B8:
	ldr r0, _020CD908 ; =0x04000020
	mov r2, #0x100
	strh r2, [r0]
	strh r2, [r0, #6]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x16]
	add r1, r0, #0x1000
	ldr r0, _020CD90C ; =0x04001026
	strh r2, [r1]
	strh r2, [r0]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020CD8EC: .word 0x04000304
_020CD8F0: .word 0xFFFFFDF1
_020CD8F4: .word GXi_VRamLockId - 2
_020CD8F8: .word 0x04000004
_020CD8FC: .word sIsDispOn
_020CD900: .word 0x0400006C
_020CD904: .word 0x04001000
_020CD908: .word 0x04000020
_020CD90C: .word 0x04001026
	arm_func_end GX_Init

	arm_func_start GX_HBlankIntr
GX_HBlankIntr: ; 0x020CD910
	ldr r2, _020CD940 ; =0x04000004
	cmp r0, #0
	ldrh r0, [r2]
	ldreqh r1, [r2]
	and r0, r0, #0x10
	biceq r1, r1, #0x10
	streqh r1, [r2]
	bxeq lr
	ldrh r1, [r2]
	orr r1, r1, #0x10
	strh r1, [r2]
	bx lr
	.align 2, 0
_020CD940: .word 0x04000004
	arm_func_end GX_HBlankIntr

	arm_func_start GX_VBlankIntr
GX_VBlankIntr: ; 0x020CD944
	ldr r2, _020CD974 ; =0x04000004
	cmp r0, #0
	ldrh r0, [r2]
	ldreqh r1, [r2]
	and r0, r0, #8
	biceq r1, r1, #8
	streqh r1, [r2]
	bxeq lr
	ldrh r1, [r2]
	orr r1, r1, #8
	strh r1, [r2]
	bx lr
	.align 2, 0
_020CD974: .word 0x04000004
	arm_func_end GX_VBlankIntr

	arm_func_start GX_DispOff
GX_DispOff: ; 0x020CD978
	stmdb sp!, {r3, lr}
	mov lr, #0x4000000
	ldr ip, [lr]
	ldr r1, _020CD9AC ; =sIsDispOn
	and r2, ip, #0x30000
	mov r3, #0
	ldr r0, _020CD9B0 ; =sDispMode
	mov r2, r2, lsr #0x10
	strh r3, [r1]
	strh r2, [r0]
	bic r0, ip, #0x30000
	str r0, [lr]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CD9AC: .word sIsDispOn
_020CD9B0: .word sDispMode
	arm_func_end GX_DispOff

	arm_func_start GX_DispOn
GX_DispOn: ; 0x020CD9B4
	ldr r0, _020CD9F4 ; =sDispMode
	ldr r1, _020CD9F8 ; =sIsDispOn
	ldrh r2, [r0]
	mov r0, #1
	strh r0, [r1]
	mov r1, #0x4000000
	cmp r2, #0
	ldreq r0, [r1]
	orreq r0, r0, #0x10000
	streq r0, [r1]
	bxeq lr
	ldr r0, [r1]
	bic r0, r0, #0x30000
	orr r0, r0, r2, lsl #16
	str r0, [r1]
	bx lr
	.align 2, 0
_020CD9F4: .word sDispMode
_020CD9F8: .word sIsDispOn
	arm_func_end GX_DispOn

	arm_func_start GX_SetGraphicsMode
GX_SetGraphicsMode: ; 0x020CD9FC
	stmdb sp!, {r3, lr}
	ldr r3, _020CDA58 ; =sIsDispOn
	mov lr, #0x4000000
	ldrh ip, [r3]
	ldr lr, [lr]
	ldr r3, _020CDA5C ; =sDispMode
	cmp ip, #0
	strh r0, [r3]
	ldr r3, _020CDA60 ; =0xFFF0FFF0
	moveq r0, #0
	and r3, lr, r3
	orr r0, r3, r0, lsl #16
	orr r0, r1, r0
	orr r1, r0, r2, lsl #3
	mov ip, #0x4000000
	ldr r0, _020CDA5C ; =sDispMode
	str r1, [ip]
	ldrh r0, [r0]
	cmp r0, #0
	ldreq r0, _020CDA58 ; =sIsDispOn
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CDA58: .word sIsDispOn
_020CDA5C: .word sDispMode
_020CDA60: .word 0xFFF0FFF0
	arm_func_end GX_SetGraphicsMode

	arm_func_start GXS_SetGraphicsMode
GXS_SetGraphicsMode: ; 0x020CDA64
	ldr r2, _020CDA7C ; =0x04001000
	ldr r1, [r2]
	bic r1, r1, #7
	orr r0, r1, r0
	str r0, [r2]
	bx lr
	.align 2, 0
_020CDA7C: .word 0x04001000
	arm_func_end GXS_SetGraphicsMode

	arm_func_start GXx_SetMasterBrightness_
GXx_SetMasterBrightness_: ; 0x020CDA80
	cmp r1, #0
	moveq r1, #0
	streqh r1, [r0]
	bxeq lr
	orrgt r1, r1, #0x4000
	strgth r1, [r0]
	rsble r1, r1, #0
	orrle r1, r1, #0x8000
	strleh r1, [r0]
	bx lr
	arm_func_end GXx_SetMasterBrightness_

	arm_func_start GXx_GetMasterBrightness_
GXx_GetMasterBrightness_: ; 0x020CDAA8
	ldrh r1, [r0]
	and r1, r1, #0xc000
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	moveq r0, #0
	bxeq lr
	cmp r1, #0x4000
	ldreqh r0, [r0]
	andeq r0, r0, #0x1f
	bxeq lr
	cmp r1, #0x8000
	movne r0, #0
	bxne lr
	ldrh r0, [r0]
	and r0, r0, #0x1f
	rsb r0, r0, #0
	bx lr
	arm_func_end GXx_GetMasterBrightness_
