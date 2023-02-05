	.include "asm/macros.inc"
	.include "mi_dma_hblank.inc"
	.include "global.inc"

	.public MIi_CheckAnotherAutoDMA
	.public MIi_CheckDma0SourceAddress
	.public MIi_DmaSetParams

	.text

	arm_func_start MI_HBlankDmaCopy32
MI_HBlankDmaCopy32: ; 0x020D43E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r4, r3
	mov r1, #0x10000000
	mov r5, r2
	bl MIi_CheckAnotherAutoDMA
	mov r0, r7
	mov r1, r6
	mov r2, r4
	mov r3, #0
	bl MIi_CheckDma0SourceAddress
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl MI_WaitDma
	ldr r3, _020D4444 ; =0x96600000
	mov r0, r7
	mov r1, r6
	mov r2, r5
	orr r3, r3, r4, lsr #2
	bl MIi_DmaSetParams
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D4444: .word 0x96600000
	arm_func_end MI_HBlankDmaCopy32

	arm_func_start MI_HBlankDmaCopy16
MI_HBlankDmaCopy16: ; 0x020D4448
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r7, r0
	mov r4, r3
	mov r1, #0x10000000
	mov r5, r2
	bl MIi_CheckAnotherAutoDMA
	mov r0, r7
	mov r1, r6
	mov r2, r4
	mov r3, #0
	bl MIi_CheckDma0SourceAddress
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r7
	bl MI_WaitDma
	ldr r3, _020D44A4 ; =0x92600000
	mov r0, r7
	mov r1, r6
	mov r2, r5
	orr r3, r3, r4, lsr #1
	bl MIi_DmaSetParams
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D44A4: .word 0x92600000
	arm_func_end MI_HBlankDmaCopy16
