	.include "asm/macros.inc"
	.include "g3x.inc"
	.include "global.inc"

	.public GXi_DmaId

	.text

	arm_func_start G3X_Init
G3X_Init: ; 0x020CF564
	stmdb sp!, {r3, lr}
	bl G3X_ClearFifo
	ldr r1, _020CF650 ; =0x04000504
	mov r0, #0
	str r0, [r1]
_020CF578:
	ldr r0, [r1, #0xfc]
	tst r0, #0x8000000
	bne _020CF578
	ldr r0, _020CF654 ; =0x04000060
	mov r2, #0
	strh r2, [r0]
	str r2, [r1, #0xfc]
	str r2, [r0, #-0x50]
	ldrh ip, [r0]
	ldr r2, _020CF658 ; =0xFFFFCFFD
	ldr r3, _020CF65C ; =0x0000CFFB
	orr ip, ip, #0x2000
	strh ip, [r0]
	ldrh ip, [r0]
	orr ip, ip, #0x1000
	strh ip, [r0]
	ldrh ip, [r0]
	and r2, ip, r2
	strh r2, [r0]
	ldrh r2, [r0]
	bic r2, r2, #0x3000
	orr r2, r2, #0x10
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r2, r3
	strh r2, [r0]
	ldr r0, [r1, #0xfc]
	orr r0, r0, #0x8000
	str r0, [r1, #0xfc]
	ldr r0, [r1, #0xfc]
	bic r0, r0, #0xc0000000
	orr r0, r0, #0x80000000
	str r0, [r1, #0xfc]
	bl G3X_InitMtxStack
	ldr r1, _020CF660 ; =0x04000350
	mov r2, #0
	ldr r0, _020CF664 ; =0x00007FFF
	str r2, [r1]
	strh r0, [r1, #4]
	strh r2, [r1, #6]
	str r2, [r1, #8]
	strh r2, [r1, #0xc]
	sub r1, r1, #0x348
	ldrh r0, [r1]
	bic r0, r0, #3
	strh r0, [r1]
	bl G3X_InitTable
	ldr r2, _020CF668 ; =0x001F0080
	ldr r1, _020CF66C ; =0x040004A4
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CF650: .word 0x04000504
_020CF654: .word 0x04000060
_020CF658: .word 0xFFFFCFFD
_020CF65C: .word 0x0000CFFB
_020CF660: .word 0x04000350
_020CF664: .word 0x00007FFF
_020CF668: .word 0x001F0080
_020CF66C: .word 0x040004A4
	arm_func_end G3X_Init

	arm_func_start G3X_Reset
G3X_Reset: ; 0x020CF670
	stmdb sp!, {r3, lr}
	ldr r2, _020CF6CC ; =0x04000600
_020CF678:
	ldr r0, [r2]
	tst r0, #0x8000000
	bne _020CF678
	ldr r0, [r2]
	ldr r1, _020CF6D0 ; =0x04000060
	orr r0, r0, #0x8000
	str r0, [r2]
	ldrh r0, [r1]
	orr r0, r0, #0x2000
	strh r0, [r1]
	ldrh r0, [r1]
	orr r0, r0, #0x1000
	strh r0, [r1]
	bl G3X_ResetMtxStack
	ldr r2, _020CF6D4 ; =0x001F0080
	ldr r1, _020CF6D8 ; =0x040004A4
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CF6CC: .word 0x04000600
_020CF6D0: .word 0x04000060
_020CF6D4: .word 0x001F0080
_020CF6D8: .word 0x040004A4
	arm_func_end G3X_Reset

	arm_func_start G3X_ClearFifo
G3X_ClearFifo: ; 0x020CF6DC
	stmdb sp!, {r3, lr}
	ldr r0, _020CF6FC ; =0x04000400
	bl GXi_NopClearFifo128_
	ldr r1, _020CF700 ; =0x04000600
_020CF6EC:
	ldr r0, [r1]
	tst r0, #0x8000000
	bne _020CF6EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CF6FC: .word 0x04000400
_020CF700: .word 0x04000600
	arm_func_end G3X_ClearFifo

	arm_func_start G3X_InitMtxStack
G3X_InitMtxStack: ; 0x020CF704
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _020CF790 ; =0x04000600
	ldr r0, [r1]
	orr r0, r0, #0x8000
	str r0, [r1]
	add r4, sp, #4
_020CF720:
	mov r0, r4
	bl G3X_GetMtxStackLevelPV
	cmp r0, #0
	bne _020CF720
	add r4, sp, #0
_020CF734:
	mov r0, r4
	bl G3X_GetMtxStackLevelPJ
	cmp r0, #0
	bne _020CF734
	ldr r1, _020CF794 ; =0x04000440
	mov r0, #3
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x14]
	str r0, [r1]
	ldr r0, [sp]
	mov r2, #0
	cmp r0, #0
	strne r0, [r1, #8]
	ldr r1, _020CF798 ; =0x04000454
	mov r0, #2
	str r2, [r1]
	str r0, [r1, #-0x14]
	ldr r0, [sp, #4]
	str r0, [r1, #-0xc]
	str r2, [r1]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CF790: .word 0x04000600
_020CF794: .word 0x04000440
_020CF798: .word 0x04000454
	arm_func_end G3X_InitMtxStack

	arm_func_start G3X_ResetMtxStack
G3X_ResetMtxStack: ; 0x020CF79C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _020CF824 ; =0x04000600
	ldr r0, [r1]
	orr r0, r0, #0x8000
	str r0, [r1]
	add r4, sp, #4
_020CF7B8:
	mov r0, r4
	bl G3X_GetMtxStackLevelPV
	cmp r0, #0
	bne _020CF7B8
	add r4, sp, #0
_020CF7CC:
	mov r0, r4
	bl G3X_GetMtxStackLevelPJ
	cmp r0, #0
	bne _020CF7CC
	ldr r1, _020CF828 ; =0x04000440
	mov r0, #3
	str r0, [r1]
	mov r0, #0
	str r0, [r1, #0x14]
	str r0, [r1]
	ldr r0, [sp]
	ldr r2, _020CF828 ; =0x04000440
	cmp r0, #0
	strne r0, [r1, #8]
	mov r0, #2
	str r0, [r2]
	ldr r1, [sp, #4]
	mov r0, #0
	str r1, [r2, #8]
	str r0, [r2, #0x14]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CF824: .word 0x04000600
_020CF828: .word 0x04000440
	arm_func_end G3X_ResetMtxStack

	arm_func_start G3X_SetFog
G3X_SetFog: ; 0x020CF82C
	cmp r0, #0
	beq _020CF860
	ldr ip, _020CF878 ; =0x0400035C
	mov r0, r1, lsl #6
	strh r3, [ip]
	sub r3, ip, #0x2fc
	ldrh r1, [r3]
	orr r0, r0, r2, lsl #8
	orr r0, r0, #0x80
	bic r1, r1, #0x3f40
	orr r0, r1, r0
	strh r0, [r3]
	bx lr
_020CF860:
	ldr r2, _020CF87C ; =0x04000060
	ldr r0, _020CF880 ; =0x0000CF7F
	ldrh r1, [r2]
	and r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_020CF878: .word 0x0400035C
_020CF87C: .word 0x04000060
_020CF880: .word 0x0000CF7F
	arm_func_end G3X_SetFog

	arm_func_start G3X_GetClipMtx
G3X_GetClipMtx: ; 0x020CF884
	stmdb sp!, {r3, lr}
	ldr r2, _020CF8B0 ; =0x04000600
	mov r1, r0
	ldr r0, [r2]
	tst r0, #0x8000000
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x40
	bl MI_Copy64B
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CF8B0: .word 0x04000600
	arm_func_end G3X_GetClipMtx

	arm_func_start G3X_GetVectorMtx
G3X_GetVectorMtx: ; 0x020CF8B4
	stmdb sp!, {r3, lr}
	ldr r2, _020CF8E0 ; =0x04000600
	mov r1, r0
	ldr r0, [r2]
	tst r0, #0x8000000
	mvnne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, r2, #0x80
	bl MI_Copy36B
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CF8E0: .word 0x04000600
	arm_func_end G3X_GetVectorMtx

	arm_func_start G3X_SetEdgeColorTable
G3X_SetEdgeColorTable: ; 0x020CF8E4
	ldr ip, _020CF8F4 ; =MIi_CpuCopy16
	ldr r1, _020CF8F8 ; =0x04000330
	mov r2, #0x10
	bx ip
	.align 2, 0
_020CF8F4: .word MIi_CpuCopy16
_020CF8F8: .word 0x04000330
	arm_func_end G3X_SetEdgeColorTable

	arm_func_start G3X_SetFogTable
G3X_SetFogTable: ; 0x020CF8FC
	ldr ip, _020CF908 ; =MI_Copy32B
	ldr r1, _020CF90C ; =0x04000360
	bx ip
	.align 2, 0
_020CF908: .word MI_Copy32B
_020CF90C: .word 0x04000360
	arm_func_end G3X_SetFogTable

	arm_func_start G3X_SetClearColor
G3X_SetClearColor: ; 0x020CF910
	ldr ip, [sp]
	orr r0, r0, r1, lsl #16
	orr r1, r0, r3, lsl #24
	cmp ip, #0
	ldr r0, _020CF934 ; =0x04000350
	orrne r1, r1, #0x8000
	str r1, [r0]
	strh r2, [r0, #4]
	bx lr
	.align 2, 0
_020CF934: .word 0x04000350
	arm_func_end G3X_SetClearColor

	arm_func_start G3X_InitTable
G3X_InitTable: ; 0x020CF938
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _020CF9C8 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	ldr r1, _020CF9CC ; =0x04000330
	beq _020CF988
	mov r2, #0
	str r2, [sp]
	mov r3, #0x10
	str r2, [sp, #4]
	bl MI_DmaFill32Async
	ldr r0, _020CF9C8 ; =GXi_DmaId
	ldr r1, _020CF9D0 ; =0x04000360
	ldr r0, [r0]
	mov r2, #0
	mov r3, #0x60
	bl MI_DmaFill32
	b _020CF9A4
_020CF988:
	mov r0, #0
	mov r2, #0x10
	bl MIi_CpuClear32
	ldr r1, _020CF9D0 ; =0x04000360
	mov r0, #0
	mov r2, #0x60
	bl MIi_CpuClear32
_020CF9A4:
	mov r2, #0
	ldr r0, _020CF9D4 ; =0x040004D0
	mov r1, r2
_020CF9B0:
	add r2, r2, #1
	str r1, [r0]
	cmp r2, #0x20
	blt _020CF9B0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020CF9C8: .word GXi_DmaId
_020CF9CC: .word 0x04000330
_020CF9D0: .word 0x04000360
_020CF9D4: .word 0x040004D0
	arm_func_end G3X_InitTable

	arm_func_start G3X_GetMtxStackLevelPV
G3X_GetMtxStackLevelPV: ; 0x020CF9D8
	ldr r2, _020CFA04 ; =0x04000600
	ldr r1, [r2]
	tst r1, #0x4000
	mvnne r0, #0
	bxne lr
	ldr r1, [r2]
	and r1, r1, #0x1f00
	mov r1, r1, lsr #8
	str r1, [r0]
	mov r0, #0
	bx lr
	.align 2, 0
_020CFA04: .word 0x04000600
	arm_func_end G3X_GetMtxStackLevelPV

	arm_func_start G3X_GetMtxStackLevelPJ
G3X_GetMtxStackLevelPJ: ; 0x020CFA08
	ldr r2, _020CFA34 ; =0x04000600
	ldr r1, [r2]
	tst r1, #0x4000
	mvnne r0, #0
	bxne lr
	ldr r1, [r2]
	and r1, r1, #0x2000
	mov r1, r1, lsr #0xd
	str r1, [r0]
	mov r0, #0
	bx lr
	.align 2, 0
_020CFA34: .word 0x04000600
	arm_func_end G3X_GetMtxStackLevelPJ

	arm_func_start G3X_GetBoxTestResult
G3X_GetBoxTestResult: ; 0x020CFA38
	ldr r2, _020CFA60 ; =0x04000600
	ldr r1, [r2]
	tst r1, #1
	mvnne r0, #0
	bxne lr
	ldr r1, [r2]
	and r1, r1, #2
	str r1, [r0]
	mov r0, #0
	bx lr
	.align 2, 0
_020CFA60: .word 0x04000600
	arm_func_end G3X_GetBoxTestResult

	arm_func_start G3X_SetHOffset
G3X_SetHOffset: ; 0x020CFA64
	ldr r1, _020CFA70 ; =0x04000010
	str r0, [r1]
	bx lr
	.align 2, 0
_020CFA70: .word 0x04000010
	arm_func_end G3X_SetHOffset

	arm_func_start GXi_NopClearFifo128_
GXi_NopClearFifo128_: ; 0x020CFA74
	mov r1, #0
	mov r2, #0
	mov r3, #0
	mov ip, #0
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	stmia r0, {r1, r2, r3, ip}
	bx lr
	arm_func_end GXi_NopClearFifo128_
