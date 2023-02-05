	.include "asm/macros.inc"
	.include "mi_dma_gxcommand.inc"
	.include "global.inc"

	.public MIi_CheckAnotherAutoDMA
	.public MIi_CheckDma0SourceAddress
	.public MIi_DmaSetParams
	.public OSi_EnterDmaCallback

	.bss

MIiGXDmaParam: ; 0x021E1A20
	.space 0x20

	.section .itcm,4,1,4

	arm_func_start MI_SendGXCommand
MI_SendGXCommand: ; 0x01FF8580
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r8, r2
	mov sl, r0
	mov sb, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r3, #0
	bl MIi_CheckDma0SourceAddress
	add r0, sl, sl, lsl #1
	add r0, r0, #2
	mov r0, r0, lsl #2
	add r0, r0, #0xb0
	add r6, r0, #0x4000000
_01FF85B0:
	ldr r0, [r6]
	tst r0, #-0x80000000
	bne _01FF85B0
	cmp r8, #0
	beq _01FF85FC
	ldr fp, _01FF860C ; =0x04000400
	ldr r4, _01FF8610 ; =0x84400000
	mov r5, #0x1d8
_01FF85D0:
	cmp r8, #0x1d8
	movhi r7, r5
	movls r7, r8
	mov r0, sl
	mov r1, sb
	mov r2, fp
	orr r3, r4, r7, lsr #2
	bl MIi_DmaSetParams
	subs r8, r8, r7
	add sb, sb, r7
	bne _01FF85D0
_01FF85FC:
	ldr r0, [r6]
	tst r0, #-0x80000000
	bne _01FF85FC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_01FF860C: .word 0x04000400
_01FF8610: .word 0x84400000
	arm_func_end MI_SendGXCommand

	.text

	arm_func_start MI_SendGXCommandAsync
MI_SendGXCommandAsync: ; 0x020D44A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #0
	bne _020D44CC
	cmp r3, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [sp, #8]
	blx r3
	ldmia sp!, {r4, pc}
_020D44CC:
	ldr r0, _020D4594 ; =MIiGXDmaParam
_020D44D0:
	ldr ip, [r0]
	cmp ip, #0
	bne _020D44D0
	ldr ip, _020D4598 ; =0x04000600
_020D44E0:
	ldr r0, [ip]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	tst r0, #2
	beq _020D44E0
	ldr ip, _020D4594 ; =MIiGXDmaParam
	mov r0, #1
	str r0, [ip]
	str r4, [ip, #4]
	str r1, [ip, #8]
	str r2, [ip, #0xc]
	str r3, [ip, #0x10]
	ldr lr, [sp, #8]
	mov r0, r4
	mov r3, #0
	str lr, [ip, #0x14]
	bl MIi_CheckDma0SourceAddress
	mov r0, r4
	bl MI_WaitDma
	bl OS_DisableInterrupts
	ldr r1, _020D4598 ; =0x04000600
	mov r4, r0
	ldr r0, [r1]
	ldr r1, _020D4594 ; =MIiGXDmaParam
	and r0, r0, #0xc0000000
	mov r2, r0, lsr #0x1e
	mov r0, #0x200000
	str r2, [r1, #0x18]
	bl OS_GetIrqFunction
	ldr r1, _020D4594 ; =MIiGXDmaParam
	ldr r2, _020D4598 ; =0x04000600
	str r0, [r1, #0x1c]
	ldr r0, [r2]
	ldr r1, _020D459C ; =MIi_FIFOCallback
	bic r0, r0, #0xc0000000
	orr r3, r0, #0x40000000
	mov r0, #0x200000
	str r3, [r2]
	bl OS_SetIrqFunction
	mov r0, #0x200000
	bl OS_EnableIrqMask
	bl MIi_FIFOCallback
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020D4594: .word MIiGXDmaParam
_020D4598: .word 0x04000600
_020D459C: .word MIi_FIFOCallback
	arm_func_end MI_SendGXCommandAsync

	arm_func_start MIi_FIFOCallback
MIi_FIFOCallback: ; 0x020D45A0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020D463C ; =MIiGXDmaParam
	ldr r5, [r0, #0xc]
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020D463C ; =MIiGXDmaParam
	cmp r5, #0x1d8
	ldr r1, [r0, #0xc]
	movhs r5, #0x1d8
	ldr r4, [r0, #8]
	subs r1, r1, r5
	str r1, [r0, #0xc]
	add r1, r4, r5
	str r1, [r0, #8]
	bne _020D4618
	ldr r0, [r0, #4]
	ldr r1, _020D4640 ; =MIi_DMACallback
	mov r2, #0
	bl OSi_EnterDmaCallback
	ldr r0, _020D463C ; =MIiGXDmaParam
	mov r3, #0x3bc00000
	rsb r3, r3, #0
	ldr r0, [r0, #4]
	ldr r2, _020D4644 ; =0x04000400
	mov r1, r4
	orr r3, r3, r5, lsr #2
	bl MIi_DmaSetParams
	mov r0, #0x200000
	bl OS_ResetRequestIrqMask
	ldmia sp!, {r3, r4, r5, pc}
_020D4618:
	ldr r3, _020D4648 ; =0x84400000
	ldr r0, [r0, #4]
	ldr r2, _020D4644 ; =0x04000400
	mov r1, r4
	orr r3, r3, r5, lsr #2
	bl MIi_DmaSetParams
	mov r0, #0x200000
	bl OS_ResetRequestIrqMask
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020D463C: .word MIiGXDmaParam
_020D4640: .word MIi_DMACallback
_020D4644: .word 0x04000400
_020D4648: .word 0x84400000
	arm_func_end MIi_FIFOCallback

	arm_func_start MIi_DMACallback
MIi_DMACallback: ; 0x020D464C
	stmdb sp!, {r3, lr}
	mov r0, #0x200000
	bl OS_DisableIrqMask
	ldr r2, _020D46A4 ; =0x04000600
	ldr r0, _020D46A8 ; =MIiGXDmaParam
	ldr r1, [r2]
	ldr r3, [r0, #0x18]
	bic r1, r1, #0xc0000000
	orr r1, r1, r3, lsl #30
	str r1, [r2]
	ldr r1, [r0, #0x1c]
	mov r0, #0x200000
	bl OS_SetIrqFunction
	ldr r0, _020D46A8 ; =MIiGXDmaParam
	mov r1, #0
	str r1, [r0]
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D46A4: .word 0x04000600
_020D46A8: .word MIiGXDmaParam
	arm_func_end MIi_DMACallback

	arm_func_start MI_SendGXCommandAsyncFast
MI_SendGXCommandAsyncFast: ; 0x020D46AC
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r2
	mov r6, r0
	mov r5, r1
	bne _020D46D4
	cmp r3, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [sp, #0x10]
	blx r3
	ldmia sp!, {r4, r5, r6, pc}
_020D46D4:
	ldr r0, _020D4758 ; =MIiGXDmaParam
_020D46D8:
	ldr r1, [r0]
	cmp r1, #0
	bne _020D46D8
	ldr r2, _020D4758 ; =MIiGXDmaParam
	mov r0, #1
	str r0, [r2]
	str r6, [r2, #4]
	ldr ip, [sp, #0x10]
	str r3, [r2, #0x10]
	mov r0, r6
	mov r1, #0x38000000
	str ip, [r2, #0x14]
	bl MIi_CheckAnotherAutoDMA
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, #0
	bl MIi_CheckDma0SourceAddress
	mov r0, r6
	bl MI_WaitDma
	mov r0, r6
	ldr r1, _020D475C ; =MIi_DMAFastCallback
	mov r2, #0
	bl OSi_EnterDmaCallback
	mov r0, r6
	mov r1, r5
	ldr r2, _020D4760 ; =0x04000400
	mov r3, #0x3c00000
	rsb r3, r3, #0
	orr r3, r3, r4, lsr #2
	bl MIi_DmaSetParams
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020D4758: .word MIiGXDmaParam
_020D475C: .word MIi_DMAFastCallback
_020D4760: .word 0x04000400
	arm_func_end MI_SendGXCommandAsyncFast

	arm_func_start MIi_DMAFastCallback
MIi_DMAFastCallback: ; 0x020D4764
	stmdb sp!, {r3, lr}
	ldr r0, _020D478C ; =MIiGXDmaParam
	mov r1, #0
	str r1, [r0]
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	blx r1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020D478C: .word MIiGXDmaParam
	arm_func_end MIi_DMAFastCallback
