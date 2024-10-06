	.include "asm/macros.inc"
	.include "global.inc"

    .public SND_StopChannel

	.text

	arm_func_start SND_Enable
SND_Enable: ; 0x037FB630
	ldr r1, _037FB644 ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB644: .word 0x04000501
	arm_func_end SND_Enable

	arm_func_start SND_Shutdown
SND_Shutdown: ; 0x037FB648
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FB694 ; =0x04000501
	mov r5, #0
	ldrb r0, [r1]
	bic r0, r0, #0x80
	strb r0, [r1]
	mov r4, #1
_037FB664:
	mov r0, r5
	mov r1, r4
	bl SND_StopChannel
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FB664
	ldr r0, _037FB698 ; =0x04000508
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FB694: .word 0x04000501
_037FB698: .word 0x04000508
	arm_func_end SND_Shutdown

	arm_func_start SND_BeginSleep
SND_BeginSleep: ; 0x037FB69C
	stmdb sp!, {r3, lr}
	ldr r2, _037FB6E0 ; =0x04000501
	mov r0, #0x80
	ldrb r1, [r2]
	bic r1, r1, #0x80
	strb r1, [r2]
	bl __VENEER_SVC_ResetSoundBias
	mov r0, #0x40000
	bl OS_SpinWait
	mov r0, #1
	bl PMi_ResetControl
	ldr r1, _037FB6E4 ; =0x04000304
	ldrh r0, [r1]
	bic r0, r0, #1
	strh r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FB6E0: .word 0x04000501
_037FB6E4: .word 0x04000304
	arm_func_end SND_BeginSleep

	arm_func_start __VENEER_SVC_ResetSoundBias
__VENEER_SVC_ResetSoundBias: ; 0x037FB6E8
	ldr ip, _037FB6F0 ; =SVC_ResetSoundBias
	bx ip
	.align 2, 0
_037FB6F0: .word SVC_ResetSoundBias
	arm_func_end __VENEER_SVC_ResetSoundBias

	arm_func_start SND_EndSleep
SND_EndSleep: ; 0x037FB6F4
	stmdb sp!, {r3, lr}
	ldr r2, _037FB738 ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	orr r1, r1, #1
	strh r1, [r2]
	bl PMi_SetControl
	mov r0, #0x100
	bl __VENEER_SVC_SetSoundBias
	ldr r0, _037FB73C ; =0x0007AB80
	bl OS_SpinWait
	ldr r1, _037FB740 ; =0x04000501
	ldrb r0, [r1]
	orr r0, r0, #0x80
	strb r0, [r1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FB738: .word 0x04000304
_037FB73C: .word 0x0007AB80
_037FB740: .word 0x04000501
	arm_func_end SND_EndSleep

	arm_func_start __VENEER_SVC_SetSoundBias
__VENEER_SVC_SetSoundBias: ; 0x037FB744
	ldr ip, _037FB74C ; =SVC_SetSoundBias
	bx ip
	.align 2, 0
_037FB74C: .word SVC_SetSoundBias
	arm_func_end __VENEER_SVC_SetSoundBias

	arm_func_start SND_SetMasterVolume
SND_SetMasterVolume: ; 0x037FB750
	ldr r1, _037FB75C ; =0x04000500
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB75C: .word 0x04000500
	arm_func_end SND_SetMasterVolume

	arm_func_start SND_SetOutputSelector
SND_SetOutputSelector: ; 0x037FB760
	ldr ip, _037FB794 ; =0x04000501
	mov r3, r3, lsl #5
	ldrb ip, [ip]
	tst ip, #0x80
	movne ip, #1
	moveq ip, #0
	orr r3, r3, ip, lsl #7
	orr r2, r3, r2, lsl #4
	orr r2, r2, r1, lsl #2
	ldr r1, _037FB794 ; =0x04000501
	orr r0, r0, r2
	strb r0, [r1]
	bx lr
	.align 2, 0
_037FB794: .word 0x04000501
	arm_func_end SND_SetOutputSelector
