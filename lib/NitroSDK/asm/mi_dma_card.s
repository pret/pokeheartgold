	.include "asm/macros.inc"
	.include "mi_dma_card.inc"
	.include "global.inc"

	.public MIi_CheckAnotherAutoDMA
	.public MIi_CheckDma0SourceAddress
	.public MIi_DmaSetParams

	.text

	arm_func_start MIi_CardDmaCopy32
MIi_CardDmaCopy32: ; 0x020D4CE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	mov r6, r0
	mov r7, r3
	mvn r1, #0
	mov r4, r2
	bl MIi_CheckAnotherAutoDMA
	mov r0, r6
	mov r1, r5
	mov r2, r7
	mov r3, #0x1000000
	bl MIi_CheckDma0SourceAddress
	cmp r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, r6, r6, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r1, r0, #0x4000000
_020D4D34:
	ldr r0, [r1]
	tst r0, #0x80000000
	bne _020D4D34
	ldr r3, _020D4D58 ; =0xAF000001
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl MIi_DmaSetParams
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020D4D58: .word 0xAF000001
	arm_func_end MIi_CardDmaCopy32
