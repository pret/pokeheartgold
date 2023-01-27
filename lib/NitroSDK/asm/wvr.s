	.include "asm/macros.inc"
	.include "wvr.inc"
	.include "global.inc"

	.bss

wvrLockId:
	.space 2

wvrVRam:
	.space 2

wvrArg:
	.space 4

wvrCallback:
	.space 4

	.text

	arm_func_start WVR_StartUpAsync
WVR_StartUpAsync: ; 0x0209E00C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl PXI_Init
	mov r0, #0xf
	mov r1, #1
	bl PXI_IsCallbackReady
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r8, _0209E234 ; =.bss
	ldrh r0, [r8]
	cmp r0, #0
	bne _0209E06C
	mvn r4, #2
_0209E04C:
	bl OS_GetLockID
	cmp r0, r4
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	strh r0, [r8]
	ldrh r0, [r8]
	cmp r0, #0
	beq _0209E04C
_0209E06C:
	bl OS_DisableInterrupts
	ldr r1, _0209E234 ; =.bss
	mov r4, r0
	ldr r2, [r1, #8]
	cmp r2, #0
	beq _0209E090
	bl OS_RestoreInterrupts
	mov r0, #5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E090:
	ldrh r2, [r1, #2]
	cmp r2, #0
	beq _0209E0A8
	bl OS_RestoreInterrupts
	mov r0, #5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E0A8:
	cmp r7, #4
	beq _0209E0C4
	cmp r7, #8
	beq _0209E104
	cmp r7, #0xc
	beq _0209E144
	b _0209E18C
_0209E0C4:
	ldrh r1, [r1]
	mov r0, #4
	bl OSi_TryLockVram
	cmp r0, #0
	bne _0209E0E8
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E0E8:
	ldr r0, _0209E234 ; =.bss
	mov r2, #4
	ldr r1, _0209E238 ; =0x04000242
	strh r2, [r0, #2]
	mov r0, #0x82
	strb r0, [r1]
	b _0209E198
_0209E104:
	ldrh r1, [r1]
	mov r0, #8
	bl OSi_TryLockVram
	cmp r0, #0
	bne _0209E128
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E128:
	ldr r0, _0209E234 ; =.bss
	mov r2, #8
	ldr r1, _0209E23C ; =0x04000243
	strh r2, [r0, #2]
	mov r0, #0x82
	strb r0, [r1]
	b _0209E198
_0209E144:
	ldrh r1, [r1]
	mov r0, #0xc
	bl OSi_TryLockVram
	cmp r0, #0
	bne _0209E168
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E168:
	ldr r0, _0209E234 ; =.bss
	mov r2, #0xc
	ldr r1, _0209E238 ; =0x04000242
	strh r2, [r0, #2]
	mov r0, #0x82
	strb r0, [r1]
	mov r0, #0x8a
	strb r0, [r1, #1]
	b _0209E198
_0209E18C:
	bl OS_RestoreInterrupts
	mov r0, #3
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E198:
	mov r0, #0xf
	mov r1, #0
	bl PXI_IsCallbackReady
	cmp r0, #0
	bne _0209E1B8
	ldr r1, _0209E240 ; =WvrReceiveCallback
	mov r0, #0xf
	bl PXI_SetFifoRecvCallback
_0209E1B8:
	cmp r6, #0
	ldrne r0, _0209E234 ; =.bss
	strne r6, [r0, #8]
	bne _0209E1D4
	ldr r1, _0209E244 ; =WvrDummyAsyncCallback
	ldr r0, _0209E234 ; =.bss
	str r1, [r0, #8]
_0209E1D4:
	ldr r3, _0209E234 ; =.bss
	mov r0, #0xf
	mov r1, #0x10000
	mov r2, #0
	str r5, [r3, #4]
	bl PXI_SendWordByFifo
	cmp r0, #0
	bge _0209E224
	ldr r1, _0209E234 ; =.bss
	ldrh r0, [r1, #2]
	ldrh r1, [r1]
	bl OSi_UnlockVram
	ldr r1, _0209E234 ; =.bss
	mov r2, #0
	strh r2, [r1, #2]
	mov r0, r4
	str r2, [r1, #8]
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0209E224:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_0209E234: .word .bss
_0209E238: .word 0x04000242
_0209E23C: .word 0x04000243
_0209E240: .word WvrReceiveCallback
_0209E244: .word WvrDummyAsyncCallback
	arm_func_end WVR_StartUpAsync

	arm_func_start WVR_TerminateAsync
WVR_TerminateAsync: ; 0x0209E248
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	bl PXI_Init
	mov r0, #0xf
	mov r1, #1
	bl PXI_IsCallbackReady
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
	bl OS_DisableInterrupts
	ldr r1, _0209E31C ; =.bss
	mov r4, r0
	ldr r1, [r1, #8]
	cmp r1, #0
	beq _0209E294
	bl OS_RestoreInterrupts
	mov r0, #5
	ldmia sp!, {r4, r5, r6, pc}
_0209E294:
	mov r0, #0xf
	mov r1, #0
	bl PXI_IsCallbackReady
	cmp r0, #0
	bne _0209E2B4
	ldr r1, _0209E320 ; =WvrReceiveCallback
	mov r0, #0xf
	bl PXI_SetFifoRecvCallback
_0209E2B4:
	cmp r6, #0
	ldrne r0, _0209E31C ; =.bss
	strne r6, [r0, #8]
	bne _0209E2D0
	ldr r1, _0209E324 ; =WvrDummyAsyncCallback
	ldr r0, _0209E31C ; =.bss
	str r1, [r0, #8]
_0209E2D0:
	ldr r3, _0209E31C ; =.bss
	mov r0, #0xf
	mov r1, #0x20000
	mov r2, #0
	str r5, [r3, #4]
	bl PXI_SendWordByFifo
	cmp r0, #0
	bge _0209E30C
	ldr r1, _0209E31C ; =.bss
	mov r2, #0
	mov r0, r4
	str r2, [r1, #8]
	bl OS_RestoreInterrupts
	mov r0, #4
	ldmia sp!, {r4, r5, r6, pc}
_0209E30C:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209E31C: .word .bss
_0209E320: .word WvrReceiveCallback
_0209E324: .word WvrDummyAsyncCallback
	arm_func_end WVR_TerminateAsync

	arm_func_start WvrReceiveCallback
WvrReceiveCallback: ; 0x0209E328
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, #0x10000
	ldr r2, _0209E3FC ; =.bss
	rsb r0, r0, #0
	and r0, r1, r0
	cmp r0, #0x10000
	and r6, r1, #0xff
	ldr r4, [r2, #8]
	ldr r5, [r2, #4]
	beq _0209E35C
	cmp r0, #0x20000
	beq _0209E394
	b _0209E3D4
_0209E35C:
	cmp r6, #7
	bne _0209E3D4
	ldrh r0, [r2, #2]
	cmp r0, #0
	ldrneh r0, [r2]
	cmpne r0, #0
	beq _0209E3D4
	ldrh r0, [r2, #2]
	ldrh r1, [r2]
	bl OSi_UnlockVram
	ldr r0, _0209E3FC ; =.bss
	mov r1, #0
	strh r1, [r0, #2]
	b _0209E3D4
_0209E394:
	cmp r6, #0
	bne _0209E3C8
	ldrh r0, [r2, #2]
	cmp r0, #0
	ldrneh r0, [r2]
	cmpne r0, #0
	beq _0209E3C8
	ldrh r0, [r2, #2]
	ldrh r1, [r2]
	bl OSi_UnlockVram
	ldr r0, _0209E3FC ; =.bss
	mov r1, #0
	strh r1, [r0, #2]
_0209E3C8:
	mov r0, #0xf
	mov r1, #0
	bl PXI_SetFifoRecvCallback
_0209E3D4:
	cmp r4, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, _0209E3FC ; =.bss
	mov r3, #0
	str r3, [r2, #8]
	mov r0, r5
	mov r1, r6
	str r3, [r2, #4]
	blx r4
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209E3FC: .word .bss
	arm_func_end WvrReceiveCallback

	arm_func_start WvrDummyAsyncCallback
WvrDummyAsyncCallback: ; 0x0209E400
	bx lr
	arm_func_end WvrDummyAsyncCallback
