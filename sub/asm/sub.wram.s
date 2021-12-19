	.include "asm/macros.inc"
	.include "global.inc"

	.public OSi_IrqThreadQueue
	.public OSi_IrqCallbackInfo
	.public OS_InitLock__isInitialized

	.text
	.public OS_IRQTable

	; os/interrupt.c

	arm_func_start OS_InitIrqTable
OS_InitIrqTable: ; 0x037F87BC
	ldr r0, _037F87D8 ; =OSi_IrqThreadQueue
	mov r2, #0
	str r2, [r0, #4]
	ldr r1, _037F87DC ; =0x027FFC3C
	str r2, [r0]
	str r2, [r1]
	bx lr
	.align 2, 0
_037F87D8: .word OSi_IrqThreadQueue
_037F87DC: .word 0x027FFC3C
	arm_func_end OS_InitIrqTable

	arm_func_start OS_SetIrqFunction
OS_SetIrqFunction: ; 0x037F87E0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _037F8870 ; =OS_IRQTable
	mov sb, #0
	mov r2, #0xc
	ldr r5, _037F8874 ; =OSi_IrqCallbackInfo + 0x60
	ldr r7, _037F8878 ; =OSi_IrqCallbackInfo
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
_037F8874: .word OSi_IrqCallbackInfo + 0x60
_037F8878: .word OSi_IrqCallbackInfo
	arm_func_end OS_SetIrqFunction

	arm_func_start OSi_EnterTimerCallback
OSi_EnterTimerCallback: ; 0x037F887C
	stmdb sp!, {r4, lr}
	mov r3, #0xc
	mul r4, r0, r3
	ldr ip, _037F88BC ; =OSi_IrqCallbackInfo + 0x30
	ldr r3, _037F88C0 ; =OSi_IrqCallbackInfo + 0x38
	str r1, [ip, r4]
	add r0, r0, #3
	mov r1, #1
	mov r0, r1, lsl r0
	str r2, [r3, r4]
	bl OS_EnableIrqMask
	ldr r0, _037F88C4 ; =OSi_IrqCallbackInfo + 0x34
	mov r1, #1
	str r1, [r0, r4]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037F88BC: .word OSi_IrqCallbackInfo + 0x30
_037F88C0: .word OSi_IrqCallbackInfo + 0x38
_037F88C4: .word OSi_IrqCallbackInfo + 0x34
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
	ldr r0, _037F8A24 ; =OS_InitLock__isInitialized
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
_037F8A24: .word OS_InitLock__isInitialized
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
