	.include "asm/macros.inc"
	.include "mi_dma.inc"
	.include "global.inc"

	.public OSi_EnterDmaCallback

	.section .itcm,4,1,4

	arm_func_start MIi_DmaSetParams
MIi_DmaSetParams: ; 0x01FF8448
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl OS_DisableInterrupts
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r1, r1, #0x4000000
	str r5, [r1, #4]
	str r4, [r1, #8]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end MIi_DmaSetParams

	arm_func_start MIi_DmaSetParams_wait
MIi_DmaSetParams_wait: ; 0x01FF8488
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl OS_DisableInterrupts
	mov r1, #0xc
	mul r2, r7, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	str r6, [r2, #0xb0]
	add r3, r1, #0x4000000
	str r5, [r3, #4]
	ldr r2, _01FF84F0 ; =0x040000B0
	str r4, [r3, #8]
	ldr r1, [r2]
	cmp r7, #0
	ldr r1, [r2]
	bne _01FF84E8
	mov r2, #0
	str r2, [r3]
	ldr r1, _01FF84F4 ; =0x81400001
	str r2, [r3, #4]
	str r1, [r3, #8]
_01FF84E8:
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_01FF84F0: .word 0x040000B0
_01FF84F4: .word 0x81400001
	arm_func_end MIi_DmaSetParams_wait

	arm_func_start MIi_DmaSetParams_noInt
MIi_DmaSetParams_noInt: ; 0x01FF84F8
	mov ip, #0xc
	mul ip, r0, ip
	add r0, ip, #0xb0
	add ip, ip, #0x4000000
	str r1, [ip, #0xb0]
	add r0, r0, #0x4000000
	str r2, [r0, #4]
	str r3, [r0, #8]
	bx lr
	arm_func_end MIi_DmaSetParams_noInt

	arm_func_start MIi_DmaSetParams_wait_noInt
MIi_DmaSetParams_wait_noInt: ; 0x01FF851C
	stmdb sp!, {r3, lr}
	mov ip, #0xc
	mul lr, r0, ip
	add ip, lr, #0xb0
	add lr, lr, #0x4000000
	str r1, [lr, #0xb0]
	add ip, ip, #0x4000000
	str r2, [ip, #4]
	ldr r2, _01FF8578 ; =0x040000B0
	str r3, [ip, #8]
	ldr r1, [r2]
	cmp r0, #0
	ldr r0, [r2]
	bne _01FF8568
	mov r1, #0
	str r1, [ip]
	ldr r0, _01FF857C ; =0x81400001
	str r1, [ip, #4]
	str r0, [ip, #8]
_01FF8568:
	ldr r1, _01FF8578 ; =0x040000B0
	ldr r0, [r1]
	ldr r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_01FF8578: .word 0x040000B0
_01FF857C: .word 0x81400001
	arm_func_end MIi_DmaSetParams_wait_noInt

	.text

	arm_func_start MI_DmaFill32
MI_DmaFill32: ; 0x020D3F74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r3
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r5, r0, #0x4000000
_020D3FA0:
	ldr r0, [r5]
	tst r0, #0x80000000
	bne _020D3FA0
	bl OS_DisableInterrupts
	mov r2, r8, lsl #2
	add r1, r2, #0xe0
	mov r3, r4, lsr #2
	mov r4, r0
	add ip, r2, #0x4000000
	mov r0, r8
	mov r2, r7
	add r1, r1, #0x4000000
	orr r3, r3, #0x85000000
	str r6, [ip, #0xe0]
	bl MIi_DmaSetParams_wait_noInt
	mov r0, r4
	bl OS_RestoreInterrupts
_020D3FE4:
	ldr r0, [r5]
	tst r0, #0x80000000
	bne _020D3FE4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaFill32

	arm_func_start MI_DmaCopy32
MI_DmaCopy32: ; 0x020D3FF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	bl MIi_CheckDma0SourceAddress
	cmp r5, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r4, r0, #0x4000000
_020D4030:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D4030
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x84000000
	bl MIi_DmaSetParams_wait
_020D4054:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D4054
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaCopy32

	arm_func_start MI_DmaCopy16
MI_DmaCopy16: ; 0x020D4064
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r3
	mov r8, r0
	mov r7, r1
	mov r6, r2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r2, r5
	mov r3, #0
	bl MIi_CheckDma0SourceAddress
	add r0, r8, r8, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r4, r0, #0x4000000
_020D409C:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D409C
	mov r3, r5, lsr #1
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x80000000
	bl MIi_DmaSetParams_wait
_020D40C0:
	ldr r0, [r4]
	tst r0, #0x80000000
	bne _020D40C0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaCopy16

	arm_func_start MI_DmaFill32Async
MI_DmaFill32Async: ; 0x020D40D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r4, r3
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r8, [sp, #0x18]
	bne _020D4100
	cmp r8, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D4100:
	bl MI_WaitDma
	cmp r8, #0
	beq _020D4158
	ldr r2, [sp, #0x1c]
	mov r0, r7
	mov r1, r8
	bl OSi_EnterDmaCallback
	bl OS_DisableInterrupts
	mov r3, r4, lsr #2
	mov r2, r7, lsl #2
	add r1, r2, #0xe0
	add r2, r2, #0x4000000
	str r5, [r2, #0xe0]
	mov r4, r0
	mov r0, r7
	mov r2, r6
	add r1, r1, #0x4000000
	orr r3, r3, #0xc5000000
	bl MIi_DmaSetParams_noInt
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D4158:
	bl OS_DisableInterrupts
	mov r2, r7, lsl #2
	add r1, r2, #0xe0
	mov r3, r4, lsr #2
	mov r4, r0
	add ip, r2, #0x4000000
	mov r0, r7
	mov r2, r6
	add r1, r1, #0x4000000
	orr r3, r3, #0x85000000
	str r5, [ip, #0xe0]
	bl MIi_DmaSetParams_noInt
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaFill32Async

	arm_func_start MI_DmaCopy32Async
MI_DmaCopy32Async: ; 0x020D4194
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r3
	mov r6, r2
	mov r2, r5
	mov r3, #0
	mov r8, r0
	mov r7, r1
	ldr r4, [sp, #0x18]
	bl MIi_CheckDma0SourceAddress
	cmp r5, #0
	bne _020D41D4
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x1c]
	blx r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D41D4:
	mov r0, r8
	bl MI_WaitDma
	cmp r4, #0
	beq _020D4210
	ldr r2, [sp, #0x1c]
	mov r0, r8
	mov r1, r4
	bl OSi_EnterDmaCallback
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0xc4000000
	bl MIi_DmaSetParams
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020D4210:
	mov r3, r5, lsr #2
	mov r0, r8
	mov r1, r7
	mov r2, r6
	orr r3, r3, #0x84000000
	bl MIi_DmaSetParams
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end MI_DmaCopy32Async

	arm_func_start MI_WaitDma
MI_WaitDma: ; 0x020D422C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	add r1, r4, r4, lsl #1
	add r1, r1, #2
	mov r1, r1, lsl #2
	add r1, r1, #0xb0
	add r2, r1, #0x4000000
_020D424C:
	ldr r1, [r2]
	tst r1, #0x80000000
	bne _020D424C
	cmp r4, #0
	bne _020D4288
	mov r1, #0xc
	mul r2, r4, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	mov r3, #0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _020D4290 ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_020D4288:
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D4290: .word 0x81400001
	arm_func_end MI_WaitDma

	arm_func_start MI_StopDma
MI_StopDma: ; 0x020D4294
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r1, #6
	mul r1, r4, r1
	add r1, r1, #5
	mov r1, r1, lsl #1
	add r1, r1, #0x4000000
	ldrh r2, [r1, #0xb0]
	cmp r4, #0
	bic r2, r2, #0x3a00
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	bic r2, r2, #0x8000
	strh r2, [r1, #0xb0]
	ldrh r2, [r1, #0xb0]
	ldrh r1, [r1, #0xb0]
	bne _020D4304
	mov r1, #0xc
	mul r2, r4, r1
	add r1, r2, #0xb0
	add r2, r2, #0x4000000
	mov r3, #0
	str r3, [r2, #0xb0]
	add r2, r1, #0x4000000
	ldr r1, _020D430C ; =0x81400001
	str r3, [r2, #4]
	str r1, [r2, #8]
_020D4304:
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D430C: .word 0x81400001
	arm_func_end MI_StopDma

	arm_func_start MIi_CheckAnotherAutoDMA
MIi_CheckAnotherAutoDMA: ; 0x020D4310
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _020D4390 ; =0x040000B8
	mov r7, r0
	mov r6, r1
	mov r4, #0
_020D4324:
	cmp r4, r7
	beq _020D437C
	ldr r0, [r5]
	tst r0, #0x80000000
	andne r0, r0, #0x38000000
	cmpne r0, r6
	beq _020D437C
	cmp r0, #0x8000000
	cmpeq r6, #0x10000000
	beq _020D437C
	cmp r0, #0x10000000
	cmpeq r6, #0x8000000
	beq _020D437C
	cmp r0, #0x18000000
	cmpne r0, #0x20000000
	cmpne r0, #0x28000000
	cmpne r0, #0x30000000
	cmpne r0, #0x38000000
	cmpne r0, #0x8000000
	cmpne r0, #0x10000000
	bne _020D437C
	bl OS_Terminate
_020D437C:
	add r4, r4, #1
	cmp r4, #3
	add r5, r5, #0xc
	blt _020D4324
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D4390: .word 0x040000B8
	arm_func_end MIi_CheckAnotherAutoDMA

	arm_func_start MIi_CheckDma0SourceAddress
MIi_CheckDma0SourceAddress: ; 0x020D4394
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	cmp r3, #0
	and ip, r1, #0xff000000
	beq _020D43B8
	cmp r3, #0x800000
	subeq r1, r1, r2
	b _020D43BC
_020D43B8:
	add r1, r1, r2
_020D43BC:
	cmp ip, #0x4000000
	and r0, r1, #0xff000000
	beq _020D43E0
	cmp ip, #0x8000000
	bhs _020D43E0
	cmp r0, #0x4000000
	beq _020D43E0
	cmp r0, #0x8000000
	ldmloia sp!, {r3, pc}
_020D43E0:
	bl OS_Terminate
	ldmia sp!, {r3, pc}
	arm_func_end MIi_CheckDma0SourceAddress
