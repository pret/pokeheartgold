	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start OS_IrqHandler
OS_IrqHandler: ; 0x037F84E4
	stmdb sp!, {lr}
	mov ip, #0x4000000
	add ip, ip, #0x210
	ldr r1, [ip, #-8]
	cmp r1, #0
	ldmeqia sp!, {pc}
	ldmia ip, {r1, r2}
	ands r1, r1, r2
	ldmeqia sp!, {pc}
	mov r3, #1
	mov r0, #0
_037F8510:
	ands r2, r1, r3, lsl r0
	addeq r0, r0, #1
	beq _037F8510
	str r2, [ip, #4]
	ldr r1, _037F8530 ; =OS_IRQTable
	ldr r0, [r1, r0, lsl #2]
	ldr lr, _037F8534 ; =OS_IrqHandler_ThreadSwitch
	bx r0
	.align 2, 0
_037F8530: .word OS_IRQTable
_037F8534: .word OS_IrqHandler_ThreadSwitch
	arm_func_end OS_IrqHandler

	arm_func_start OS_IrqHandler_ThreadSwitch
OS_IrqHandler_ThreadSwitch: ; 0x037F8538
	ldr ip, _037F8654 ; =0x03806BA4
	mov r3, #0
	ldr ip, [ip]
	mov r2, #1
	cmp ip, #0
	beq _037F8588
_037F8550:
	str r2, [ip, #0x48]
	str r3, [ip, #0x5c]
	str r3, [ip, #0x60]
	ldr r0, [ip, #0x64]
	str r3, [ip, #0x64]
	mov ip, r0
	cmp ip, #0
	bne _037F8550
	ldr ip, _037F8654 ; =0x03806BA4
	str r3, [ip]
	str r3, [ip, #4]
	ldr ip, _037F8658 ; =OSi_ThreadInfo
	mov r1, #1
	strh r1, [ip]
_037F8588:
	ldr ip, _037F8658 ; =OSi_ThreadInfo
	ldrh r1, [ip]
	cmp r1, #0
	ldreq pc, [sp], #4
	mov r1, #0
	strh r1, [ip]
	mov r3, #0xd2
	msr cpsr_c, r3
	add r2, ip, #8
	ldr r1, [r2]
_037F85B0:
	cmp r1, #0
	ldrneh r0, [r1, #0x48]
	cmpne r0, #1
	ldrne r1, [r1, #0x4c]
	bne _037F85B0
	cmp r1, #0
	bne _037F85D8
_037F85CC:
	mov r3, #0x92
	msr cpsr_c, r3
	ldr pc, [sp], #4
_037F85D8:
	ldr r0, [ip, #4]
	cmp r1, r0
	beq _037F85CC
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _037F8600
	stmdb sp!, {r0, r1, ip}
	mov lr, pc
	bx r3
_037F85FC:
	ldmia sp!, {r0, r1, ip}
_037F8600:
	str r1, [ip, #4]
	mrs r2, spsr
	str r2, [r0, #0]!
	ldmib sp!, {r2, r3}
	stmib r0!, {r2, r3}
	ldmib sp!, {r2, r3, ip, lr}
	stmib r0!, {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	stmib r0!, {lr}
	mov r3, #0xd3
	msr cpsr_c, r3
	stmib r0!, {sp}
	ldr sp, [r1, #0x44]
	mov r3, #0xd2
	msr cpsr_c, r3
	ldr r2, [r1, #0]!
	msr spsr_fc, r2
	ldr lr, [r1, #0x40]
	ldmib r1, {r0, r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, sp, lr} ^
	mov r0, r0
	stmda sp!, {r0, r1, r2, r3, ip, lr}
	ldmia sp!, {pc}
	.align 2, 0
_037F8654: .word 0x03806BA4
_037F8658: .word OSi_ThreadInfo
	arm_func_end OS_IrqHandler_ThreadSwitch

	; os/irqTable.c

	arm_func_start OS_IrqDummy
OS_IrqDummy: ; 0x037F865C
	bx lr
	arm_func_end OS_IrqDummy

	arm_func_start OSi_IrqCallback
OSi_IrqCallback: ; 0x037F8660
	stmdb sp!, {r3, r4, r5, lr}
	mov r1, #0xc
	mul r5, r0, r1
	ldr r2, _037F86D8 ; =0x03806BAC
	ldr r3, _037F86DC ; =OSi_IrqCallbackInfoIndex
	mov r4, r0, lsl #1
	ldr r1, [r2, r5]
	mov r0, #0
	ldrh r3, [r3, r4]
	mov r4, #1
	str r0, [r2, r5]
	cmp r1, #0
	mov r4, r4, lsl r3
	beq _037F86A8
	ldr r0, _037F86E0 ; =0x03806BB4
	ldr r0, [r0, r5]
	mov lr, pc
	bx r1
_037F86A8:
	ldr r2, _037F86E4 ; =0x0380FFF8
	ldr r0, _037F86E8 ; =0x03806BB0
	ldr r1, [r2]
	orr r1, r1, r4
	str r1, [r2]
	ldr r0, [r0, r5]
	cmp r0, #0
	bne _037F86D0
	mov r0, r4
	bl OS_DisableIrqMask
_037F86D0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F86D8: .word 0x03806BAC
_037F86DC: .word OSi_IrqCallbackInfoIndex
_037F86E0: .word 0x03806BB4
_037F86E4: .word 0x0380FFF8
_037F86E8: .word 0x03806BB0
	arm_func_end OSi_IrqCallback

	arm_func_start OSi_IrqDma0
OSi_IrqDma0: ; 0x037F86EC
	ldr ip, _037F86F8 ; =OSi_IrqCallback
	mov r0, #0
	bx ip
	.align 2, 0
_037F86F8: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma0

	arm_func_start OSi_IrqDma1
OSi_IrqDma1: ; 0x037F86FC
	ldr ip, _037F8708 ; =OSi_IrqCallback
	mov r0, #1
	bx ip
	.align 2, 0
_037F8708: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma1

	arm_func_start OSi_IrqDma2
OSi_IrqDma2: ; 0x037F870C
	ldr ip, _037F8718 ; =OSi_IrqCallback
	mov r0, #2
	bx ip
	.align 2, 0
_037F8718: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma2

	arm_func_start OSi_IrqDma3
OSi_IrqDma3: ; 0x037F871C
	ldr ip, _037F8728 ; =OSi_IrqCallback
	mov r0, #3
	bx ip
	.align 2, 0
_037F8728: .word OSi_IrqCallback
	arm_func_end OSi_IrqDma3

	arm_func_start OSi_IrqTimer0
OSi_IrqTimer0: ; 0x037F872C
	ldr ip, _037F8738 ; =OSi_IrqCallback
	mov r0, #4
	bx ip
	.align 2, 0
_037F8738: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer0

	arm_func_start OSi_IrqTimer1
OSi_IrqTimer1: ; 0x037F873C
	ldr ip, _037F8748 ; =OSi_IrqCallback
	mov r0, #5
	bx ip
	.align 2, 0
_037F8748: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer1

	arm_func_start OSi_IrqTimer2
OSi_IrqTimer2: ; 0x037F874C
	ldr ip, _037F8758 ; =OSi_IrqCallback
	mov r0, #6
	bx ip
	.align 2, 0
_037F8758: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer2

	arm_func_start OSi_IrqTimer3
OSi_IrqTimer3: ; 0x037F875C
	ldr ip, _037F8768 ; =OSi_IrqCallback
	mov r0, #7
	bx ip
	.align 2, 0
_037F8768: .word OSi_IrqCallback
	arm_func_end OSi_IrqTimer3

	arm_func_start OSi_IrqVBlank
OSi_IrqVBlank: ; 0x037F876C
	stmdb sp!, {r3, lr}
	ldr r2, _037F87B0 ; =0x027FFC3C
	ldr r0, _037F87B4 ; =0x03806BAC
	ldr r1, [r2]
	ldr r3, [r0, #0x60]
	add r0, r1, #1
	str r0, [r2]
	cmp r3, #0
	beq _037F8798
	mov lr, pc
	bx r3
_037F8798:
	ldr r1, _037F87B8 ; =0x0380FFF8
	ldr r0, [r1]
	orr r0, r0, #1
	str r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F87B0: .word 0x027FFC3C
_037F87B4: .word 0x03806BAC
_037F87B8: .word 0x0380FFF8
	arm_func_end OSi_IrqVBlank

	; os/interrupt.c

	arm_func_start OS_InitIrqTable
OS_InitIrqTable: ; 0x037F87BC
	ldr r0, _037F87D8 ; =0x03806BA4
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, _037F87DC ; =0x027FFC3C
	str r2, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_037F87D8: .word 0x03806BA4
_037F87DC: .word 0x027FFC3C
	arm_func_end OS_InitIrqTable

	arm_func_start OS_SetIrqFunction
OS_SetIrqFunction: ; 0x037F87E0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _037F8870 ; =OS_IRQTable
	mov sb, #0
	mov r2, #0xc
	ldr r5, _037F8874 ; =0x03806C0C
	ldr r7, _037F8878 ; =0x03806BAC
	mov r8, sb
	mov lr, sb
	mov ip, #1
	mov r3, r2
_037F8808:
	tst r0, #1
	beq _037F8858
	mov sl, r8
	cmp sb, #8
	blt _037F882C
	cmp sb, #0xb
	suble r6, sb, #8
	mlale sl, r6, r3, r7
	ble _037F8850
_037F882C:
	cmp sb, #3
	blt _037F8844
	cmp sb, #6
	addle r6, sb, #1
	mlale sl, r6, r2, r7
	ble _037F8850
_037F8844:
	cmp sb, #0
	strne r1, [r4, sb, lsl #2]
	moveq sl, r5
_037F8850:
	cmp sl, #0
	stmneia sl, {r1, ip, lr}
_037F8858:
	add sb, sb, #1
	cmp sb, #0x19
	mov r0, r0, lsr #1
	blt _037F8808
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037F8870: .word OS_IRQTable
_037F8874: .word 0x03806C0C
_037F8878: .word 0x03806BAC
	arm_func_end OS_SetIrqFunction

	arm_func_start OSi_EnterTimerCallback
OSi_EnterTimerCallback: ; 0x037F887C
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _037F88BC ; =0x03806BDC
	ldr r3, _037F88C0 ; =0x03806BE4
	str r1, [ip, r4]
	add r0, r0, #3
	mov r1, #1
	mov r0, r1, lsl r0
	str r2, [r3, r4]
	bl OS_EnableIrqMask
	ldr r0, _037F88C4 ; =0x03806BE0
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F88BC: .word 0x03806BDC
_037F88C0: .word 0x03806BE4
_037F88C4: .word 0x03806BE0
	arm_func_end OSi_EnterTimerCallback

	arm_func_start OS_SetIrqMask
OS_SetIrqMask: ; 0x037F88C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableIrq
	ldr r1, _037F88F8 ; =0x04000210
	ldr r3, [r1]
	sub r2, r1, #8
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F88F8: .word 0x04000210
	arm_func_end OS_SetIrqMask

	arm_func_start OS_DisableIrq
OS_DisableIrq: ; 0x037F88FC
	ldr r2, _037F8910 ; =0x04000208
	mov r1, #0
	ldrh r0, [r2]
	strh r1, [r2]
	bx lr
	.align 2, 0
_037F8910: .word 0x04000208
	arm_func_end OS_DisableIrq

	arm_func_start OS_EnableIrqMask
OS_EnableIrqMask: ; 0x037F8914
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableIrq
	ldr ip, _037F8948 ; =0x04000210
	ldr r3, [ip]
	sub r2, ip, #8
	orr r1, r3, r4
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F8948: .word 0x04000210
	arm_func_end OS_EnableIrqMask

	arm_func_start OS_DisableIrqMask
OS_DisableIrqMask: ; 0x037F894C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableIrq
	ldr ip, _037F8984 ; =0x04000210
	mvn r1, r4
	ldr r3, [ip]
	sub r2, ip, #8
	and r1, r3, r1
	str r1, [ip]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F8984: .word 0x04000210
	arm_func_end OS_DisableIrqMask

	arm_func_start OS_ResetRequestIrqMask
OS_ResetRequestIrqMask: ; 0x037F8988
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableIrq
	ldr r1, _037F89B8 ; =0x04000214
	ldr r3, [r1]
	sub r2, r1, #0xc
	str r4, [r1]
	ldrh r1, [r2]
	strh r0, [r2]
	mov r0, r3
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F89B8: .word 0x04000214
	arm_func_end OS_ResetRequestIrqMask

	; os/spinLock.c

	arm_func_start OS_InitLock
OS_InitLock: ; 0x037F89BC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _037F8A24 ; =0x03806C18
	ldr r1, [r0]
	cmp r1, #0
	bne _037F8A1C
	ldr r4, _037F8A28 ; =0x027FFFF0
	mov r2, #1
	mov r1, #0
	str r2, [r0]
	strh r1, [r4, #6]
	mov r5, #0x400
	b _037F89F4
_037F89EC:
	mov r0, r5
	bl VENEER_SVC_WaitByLoop
_037F89F4:
	ldrh r0, [r4, #4]
	cmp r0, #0x7f
	bne _037F89EC
	ldr r1, _037F8A2C ; =0x027FFFB8
	mvn r0, #0
	str r0, [r1]
	mov r0, r0, lsl #0x10
	str r0, [r1, #4]
	mov r0, #0xbf
	strh r0, [r4, #6]
_037F8A1C:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037F8A24: .word 0x03806C18
_037F8A28: .word 0x027FFFF0
_037F8A2C: .word 0x027FFFB8
	arm_func_end OS_InitLock

	arm_func_start VENEER_SVC_WaitByLoop
VENEER_SVC_WaitByLoop: ; 0x037F8A30
	ldr ip, _037F8A38 ; =SVC_WaitByLoop
	bx ip
	.align 2, 0
_037F8A38: .word SVC_WaitByLoop
	arm_func_end VENEER_SVC_WaitByLoop

	arm_func_start OSi_DoUnlockByWord
OSi_DoUnlockByWord: ; 0x037F8A3C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	ldrh r1, [r7, #4]
	mov r6, r2
	cmp r0, r1
	mov r5, r3
	mvnne r0, #1
	bne _037F8AB0
	cmp r5, #0
	beq _037F8A6C
	bl OS_DisableInterrupts_IrqAndFiq
	b _037F8A70
_037F8A6C:
	bl OS_DisableInterrupts
_037F8A70:
	mov r4, r0
	mov r0, #0
	strh r0, [r7, #4]
	cmp r6, #0
	beq _037F8A8C
	mov lr, pc
	bx r6
_037F8A8C:
	mov r0, #0
	str r0, [r7]
	cmp r5, #0
	mov r0, r4
	beq _037F8AA8
	bl OS_RestoreInterrupts_IrqAndFiq
	b _037F8AAC
_037F8AA8:
	bl OS_RestoreInterrupts
_037F8AAC:
	mov r0, #0
_037F8AB0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end OSi_DoUnlockByWord

	arm_func_start OSi_DoTryLockByWord
OSi_DoTryLockByWord: ; 0x037F8AB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r3
	mov sb, r0
	mov r8, r1
	mov r7, r2
	beq _037F8AD8
	bl OS_DisableInterrupts_IrqAndFiq
	b _037F8ADC
_037F8AD8:
	bl OS_DisableInterrupts
_037F8ADC:
	mov r5, r0
	mov r0, sb
	mov r1, r8
	bl MI_SwapWord
	movs r4, r0
	bne _037F8B08
	cmp r7, #0
	beq _037F8B04
	mov lr, pc
	bx r7
_037F8B04:
	strh sb, [r8, #4]
_037F8B08:
	cmp r6, #0
	mov r0, r5
	beq _037F8B1C
	bl OS_RestoreInterrupts_IrqAndFiq
	b _037F8B20
_037F8B1C:
	bl OS_RestoreInterrupts
_037F8B20:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end OSi_DoTryLockByWord

	arm_func_start OSi_DoLockByWord
OSi_DoLockByWord: ; 0x037F8B2C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r6, _037F8B74 ; =0x027FFFE8
	ldr r5, _037F8B78 ; =OSi_AllocateCartridgeBus
	mov r8, r0
	mov r7, #0x400
	mov r4, #1
	b _037F8B50
_037F8B48:
	mov r0, r7
	bl VENEER_SVC_WaitByLoop
_037F8B50:
	mov r0, r8
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl OSi_DoTryLockByWord
	cmp r0, #0
	bgt _037F8B48
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037F8B74: .word 0x027FFFE8
_037F8B78: .word OSi_AllocateCartridgeBus
	arm_func_end OSi_DoLockByWord

	arm_func_start OS_UnlockCartridge
OS_UnlockCartridge: ; 0x037F8B7C
	ldr ip, _037F8B90 ; =OSi_DoUnlockByWord
	ldr r1, _037F8B94 ; =0x027FFFE8
	ldr r2, _037F8B98 ; =OSi_FreeCartridgeBus
	mov r3, #1
	bx ip
	.align 2, 0
_037F8B90: .word OSi_DoUnlockByWord
_037F8B94: .word 0x027FFFE8
_037F8B98: .word OSi_FreeCartridgeBus
	arm_func_end OS_UnlockCartridge

	arm_func_start OS_UnLockCartridge
OS_UnLockCartridge: ; 0x037F8B9C
	ldr r1, _037F8BA4 ; =OS_UnlockCartridge
	bx r1
	.align 2, 0
_037F8BA4: .word OS_UnlockCartridge
	arm_func_end OS_UnLockCartridge

	arm_func_start OS_TryLockCartridge
OS_TryLockCartridge: ; 0x037F8BA8
	ldr ip, _037F8BBC ; =OSi_DoTryLockByWord
	ldr r1, _037F8BC0 ; =0x027FFFE8
	ldr r2, _037F8BC4 ; =OSi_AllocateCartridgeBus
	mov r3, #1
	bx ip
	.align 2, 0
_037F8BBC: .word OSi_DoTryLockByWord
_037F8BC0: .word 0x027FFFE8
_037F8BC4: .word OSi_AllocateCartridgeBus
	arm_func_end OS_TryLockCartridge

	arm_func_start OSi_AllocateCartridgeBus
OSi_AllocateCartridgeBus: ; 0x037F8BC8
	bx lr
	arm_func_end OSi_AllocateCartridgeBus

	arm_func_start OSi_FreeCartridgeBus
OSi_FreeCartridgeBus: ; 0x037F8BCC
	bx lr
	arm_func_end OSi_FreeCartridgeBus

	arm_func_start OS_UnlockCard
OS_UnlockCard: ; 0x037F8BD0
	ldr ip, _037F8BE4 ; =OSi_DoUnlockByWord
	ldr r1, _037F8BE8 ; =0x027FFFE0
	ldr r2, _037F8BEC ; =OSi_FreeCardBus
	mov r3, #0
	bx ip
	.align 2, 0
_037F8BE4: .word OSi_DoUnlockByWord
_037F8BE8: .word 0x027FFFE0
_037F8BEC: .word OSi_FreeCardBus
	arm_func_end OS_UnlockCard

	arm_func_start OS_TryLockCard
OS_TryLockCard: ; 0x037F8BF0
	ldr ip, _037F8C04 ; =OSi_DoTryLockByWord
	ldr r1, _037F8C08 ; =0x027FFFE0
	ldr r2, _037F8C0C ; =OSi_AllocateCardBus
	mov r3, #0
	bx ip
	.align 2, 0
_037F8C04: .word OSi_DoTryLockByWord
_037F8C08: .word 0x027FFFE0
_037F8C0C: .word OSi_AllocateCardBus
	arm_func_end OS_TryLockCard

	arm_func_start OSi_AllocateCardBus
OSi_AllocateCardBus: ; 0x037F8C10
	bx lr
	arm_func_end OSi_AllocateCardBus

	arm_func_start OSi_FreeCardBus
OSi_FreeCardBus: ; 0x037F8C14
	bx lr
	arm_func_end OSi_FreeCardBus

	arm_func_start OS_ReadOwnerOfLockWord
OS_ReadOwnerOfLockWord: ; 0x037F8C18
	ldrh r0, [r0, #4]
	bx lr
	arm_func_end OS_ReadOwnerOfLockWord

	arm_func_start OS_GetLockID
OS_GetLockID: ; 0x037F8C20
	ldr r3, _037F8CB0 ; =0x027FFFB8
	ldr r1, [r3]
	mov r2, #0
	mov r0, #-0x80000000
_037F8C30:
	tst r1, r0
	bne _037F8C4C
	add r2, r2, #1
	cmp r2, #0x20
	beq _037F8C4C
	mov r0, r0, lsr #1
	b _037F8C30
_037F8C4C:
	cmp r2, #0x20
	movne r0, #0x80
	bne _037F8C94
	add r3, r3, #4
	ldr r1, [r3]
	mov r2, #0
	mov r0, #-0x80000000
_037F8C68:
	tst r1, r0
	bne _037F8C84
	add r2, r2, #1
	cmp r2, #0x20
	beq _037F8C84
	mov r0, r0, lsr #1
	b _037F8C68
_037F8C84:
	cmp r2, #0x20
	ldr r0, _037F8CB4 ; =0xFFFFFFFD
	bxeq lr
	mov r0, #0xa0
_037F8C94:
	add r0, r0, r2
	mov r1, #-0x80000000
	mov r1, r1, lsr r2
	ldr r2, [r3]
	bic r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_037F8CB0: .word 0x027FFFB8
_037F8CB4: .word 0xFFFFFFFD
	arm_func_end OS_GetLockID

	arm_func_start OS_ReleaseLockID
OS_ReleaseLockID: ; 0x037F8CB8
	ldr r3, _037F8CE4 ; =0x027FFFB8
	cmp r0, #0xa0
	addpl r3, r3, #4
	subpl r0, r0, #0xa0
	submi r0, r0, #0x80
	mov r1, #-0x80000000
	mov r1, r1, lsr r0
	ldr r2, [r3]
	orr r2, r2, r1
	str r2, [r3]
	bx lr
	.align 2, 0
_037F8CE4: .word 0x027FFFB8
	arm_func_end OS_ReleaseLockID

	.data

OSi_IrqCallbackInfoIndex: ; 0x03806A74
	.byte 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

	.public OS_IRQTable
OS_IRQTable: ; 0x03806A88
	.word OSi_IrqVBlank
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OSi_IrqTimer0
	.word OSi_IrqTimer1
	.word OSi_IrqTimer2
	.word OSi_IrqTimer3
	.word OS_IrqDummy
	.word OSi_IrqDma0
	.word OSi_IrqDma1
	.word OSi_IrqDma2
	.word OSi_IrqDma3
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
