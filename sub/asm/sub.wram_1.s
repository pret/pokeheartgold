	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public MI_StopDma
	.public PXI_IsCallbackReady
	.public SND_Enable
	.public SND_SetMasterVolume
	.public SND_SetOutputSelector

	arm_func_start SND_SetupChannelPcm
SND_SetupChannelPcm: ; 0x037FB798
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FB850 ; =sMasterPan
	mov r8, r1
	ldr lr, [r4]
	ldr r1, _037FB854 ; =sSurroundDecay
	mov r7, r2
	ldr r5, [sp, #0x2c]
	ldr r4, _037FB858 ; =sOrgPan
	ldr ip, [sp, #0x20]
	ldr r2, _037FB85C ; =sOrgVolume
	strb r5, [r4, r0]
	cmp lr, #0
	ldr r1, [r1]
	movge r5, lr
	mov r6, r3
	mov r4, r0, lsl #4
	strb ip, [r2, r0]
	cmp r1, #0
	ble _037FB804
	ldr r1, _037FB860 ; =0x0000FFF5
	mov r2, #1
	tst r1, r2, lsl r0
	beq _037FB804
	mov r0, ip
	mov r1, r5
	bl CalcSurroundDecay
	mov ip, r0
_037FB804:
	ldr r2, [sp, #0x24]
	mov r0, r6, lsl #0x1b
	orr r0, r0, r7, lsl #29
	orr r1, r0, r5, lsl #16
	ldr r0, [sp, #0x28]
	orr r2, r1, r2, lsl #8
	add r1, r4, #0x4000000
	orr r2, ip, r2
	str r2, [r1, #0x400]
	ldr r3, [sp, #0x18]
	rsb r2, r0, #0x10000
	add r0, r1, #0x400
	strh r2, [r0, #8]
	ldr r2, [sp, #0x1c]
	strh r3, [r0, #0xa]
	str r2, [r1, #0x40c]
	str r8, [r1, #0x404]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FB850: .word sMasterPan
_037FB854: .word sSurroundDecay
_037FB858: .word sOrgPan
_037FB85C: .word sOrgVolume
_037FB860: .word 0x0000FFF5
	arm_func_end SND_SetupChannelPcm

	arm_func_start SND_SetupChannelPsg
SND_SetupChannelPsg: ; 0x037FB864
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FB8FC ; =sMasterPan
	mov r7, r1
	ldr ip, [r4]
	ldr r1, _037FB900 ; =sSurroundDecay
	mov r6, r3
	ldr r3, _037FB904 ; =sOrgVolume
	ldr r5, [sp, #0x1c]
	ldr r4, _037FB908 ; =sOrgPan
	ldr r1, [r1]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r2, [r3, r0]
	cmp r1, #0
	ble _037FB8C8
	ldr r1, _037FB90C ; =0x0000FFF5
	mov r3, #1
	tst r1, r3, lsl r0
	beq _037FB8C8
	mov r0, r2
	mov r1, r5
	bl CalcSurroundDecay
	mov r2, r0
_037FB8C8:
	mov r0, r7, lsl #0x18
	orr r0, r0, #0x60000000
	orr r0, r0, r5, lsl #16
	ldr r1, [sp, #0x18]
	orr r3, r0, r6, lsl #8
	add r0, r4, #0x4000000
	orr r2, r2, r3
	str r2, [r0, #0x400]
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FB8FC: .word sMasterPan
_037FB900: .word sSurroundDecay
_037FB904: .word sOrgVolume
_037FB908: .word sOrgPan
_037FB90C: .word 0x0000FFF5
	arm_func_end SND_SetupChannelPsg

	arm_func_start SND_SetupChannelNoise
SND_SetupChannelNoise: ; 0x037FB910
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _037FB9A0 ; =sMasterPan
	mov r7, r2
	ldr ip, [r4]
	ldr r2, _037FB9A4 ; =sSurroundDecay
	mov r6, r3
	ldr r3, _037FB9A8 ; =sOrgVolume
	ldr r5, [sp, #0x18]
	ldr r4, _037FB9AC ; =sOrgPan
	ldr r2, [r2]
	strb r5, [r4, r0]
	cmp ip, #0
	movge r5, ip
	mov r4, r0, lsl #4
	strb r1, [r3, r0]
	cmp r2, #0
	ble _037FB974
	ldr r2, _037FB9B0 ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FB974
	mov r0, r1
	mov r1, r5
	bl CalcSurroundDecay
	mov r1, r0
_037FB974:
	mov r0, r5, lsl #0x10
	orr r0, r0, #0x60000000
	orr r2, r0, r7, lsl #8
	add r0, r4, #0x4000000
	orr r1, r1, r2
	str r1, [r0, #0x400]
	rsb r1, r6, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FB9A0: .word sMasterPan
_037FB9A4: .word sSurroundDecay
_037FB9A8: .word sOrgVolume
_037FB9AC: .word sOrgPan
_037FB9B0: .word 0x0000FFF5
	arm_func_end SND_SetupChannelNoise

	arm_func_start SND_StopChannel
SND_StopChannel: ; 0x037FB9B4
	mov r3, r0, lsl #4
	add r0, r3, #0x4000000
	ldr r2, [r0, #0x400]
	add r0, r3, #0x400
	tst r1, #1
	bic r1, r2, #0x80000000
	add r0, r0, #0x4000000
	orrne r1, r1, #0x8000
	str r1, [r0]
	bx lr
	arm_func_end SND_StopChannel

	arm_func_start SND_SetChannelVolume
SND_SetChannelVolume: ; 0x037FB9DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _037FBA48 ; =sSurroundDecay
	ldr ip, _037FBA4C ; =sOrgVolume
	ldr r3, [r3]
	mov r5, r0
	mov r4, r2
	strb r1, [ip, r5]
	cmp r3, #0
	ble _037FBA2C
	ldr r0, _037FBA50 ; =0x0000FFF5
	mov r2, #1
	tst r0, r2, lsl r5
	beq _037FBA2C
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	ldrb r2, [r0, #0x402]
	mov r0, r1
	mov r1, r2
	bl CalcSurroundDecay
	mov r1, r0
_037FBA2C:
	mov r0, r5, lsl #4
	add r0, r0, #0x4000000
	orr r1, r1, r4, lsl #8
	add r0, r0, #0x400
	strh r1, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FBA48: .word sSurroundDecay
_037FBA4C: .word sOrgVolume
_037FBA50: .word 0x0000FFF5
	arm_func_end SND_SetChannelVolume

	arm_func_start SND_SetChannelTimer
SND_SetChannelTimer: ; 0x037FBA54
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	rsb r1, r1, #0x10000
	add r0, r0, #0x400
	strh r1, [r0, #8]
	bx lr
	arm_func_end SND_SetChannelTimer

	arm_func_start SND_SetChannelPan
SND_SetChannelPan: ; 0x037FBA6C
	stmdb sp!, {r4, lr}
	ldr r2, _037FBAD0 ; =sMasterPan
	ldr r3, _037FBAD4 ; =sOrgPan
	ldr r2, [r2]
	strb r1, [r3, r0]
	cmp r2, #0
	ldr r3, _037FBAD8 ; =sSurroundDecay
	mov r4, r0, lsl #4
	movge r1, r2
	add r2, r4, #0x4000000
	strb r1, [r2, #0x402]
	ldr r2, [r3]
	cmp r2, #0
	ble _037FBAC8
	ldr r2, _037FBADC ; =0x0000FFF5
	mov r3, #1
	tst r2, r3, lsl r0
	beq _037FBAC8
	ldr r2, _037FBAE0 ; =sOrgVolume
	ldrb r0, [r2, r0]
	bl CalcSurroundDecay
	add r1, r4, #0x4000000
	strb r0, [r1, #0x400]
_037FBAC8:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FBAD0: .word sMasterPan
_037FBAD4: .word sOrgPan
_037FBAD8: .word sSurroundDecay
_037FBADC: .word 0x0000FFF5
_037FBAE0: .word sOrgVolume
	arm_func_end SND_SetChannelPan

	arm_func_start SND_IsChannelActive
SND_IsChannelActive: ; 0x037FBAE4
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x403]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end SND_IsChannelActive

	arm_func_start SND_SetMasterPan
SND_SetMasterPan: ; 0x037FBB00
	ldr r1, _037FBB5C ; =sMasterPan
	cmp r0, #0
	str r0, [r1]
	blt _037FBB34
	mov r2, #0
	and r1, r0, #0xff
_037FBB18:
	mov r0, r2, lsl #4
	add r0, r0, #0x4000000
	add r2, r2, #1
	strb r1, [r0, #0x402]
	cmp r2, #0x10
	blt _037FBB18
	bx lr
_037FBB34:
	ldr r2, _037FBB60 ; =sOrgPan
	mov r3, #0
_037FBB3C:
	ldrb r1, [r2, r3]
	mov r0, r3, lsl #4
	add r0, r0, #0x4000000
	add r3, r3, #1
	strb r1, [r0, #0x402]
	cmp r3, #0x10
	blt _037FBB3C
	bx lr
	.align 2, 0
_037FBB5C: .word sMasterPan
_037FBB60: .word sOrgPan
	arm_func_end SND_SetMasterPan

	arm_func_start SND_GetChannelControl
SND_GetChannelControl: ; 0x037FBB64
	mov r0, r0, lsl #4
	add r0, r0, #0x4000000
	ldr r0, [r0, #0x400]
	bx lr
	arm_func_end SND_GetChannelControl

	arm_func_start SNDi_SetSurroundDecay
SNDi_SetSurroundDecay: ; 0x037FBB74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _037FBBC8 ; =sSurroundDecay
	ldr r5, _037FBBCC ; =sOrgVolume
	ldr r4, _037FBBD0 ; =0x0000FFF5
	str r0, [r1]
	mov r7, #0
	mov r6, #1
_037FBB90:
	tst r4, r6, lsl r7
	beq _037FBBB4
	mov r8, r7, lsl #4
	add r0, r8, #0x4000000
	ldrb r1, [r0, #0x402]
	ldrb r0, [r5, r7]
	bl CalcSurroundDecay
	add r1, r8, #0x4000000
	strb r0, [r1, #0x400]
_037FBBB4:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FBB90
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FBBC8: .word sSurroundDecay
_037FBBCC: .word sOrgVolume
_037FBBD0: .word 0x0000FFF5
	arm_func_end SNDi_SetSurroundDecay

	arm_func_start CalcSurroundDecay
CalcSurroundDecay: ; 0x037FBBD4
	cmp r1, #0x18
	bge _037FBC04
	ldr r2, _037FBC38 ; =sSurroundDecay
	add r3, r1, #0x28
	ldr ip, [r2]
	ldr r1, _037FBC3C ; =0x00007FFF
	mul r2, ip, r3
	sub r1, r1, ip
	add r1, r2, r1, lsl #6
	mul r1, r0, r1
	mov r0, r1, asr #0x15
	bx lr
_037FBC04:
	cmp r1, #0x68
	bxle lr
	ldr r2, _037FBC38 ; =sSurroundDecay
	sub r1, r1, #0x28
	ldr ip, [r2]
	rsb r2, ip, #0
	mul r3, r2, r1
	add r1, ip, #0xff
	add r1, r1, #0x7f00
	add r1, r3, r1, lsl #6
	mul r1, r0, r1
	mov r0, r1, asr #0x15
	bx lr
	.align 2, 0
_037FBC38: .word sSurroundDecay
_037FBC3C: .word 0x00007FFF
	arm_func_end CalcSurroundDecay

	arm_func_start SND_CalcTimer
SND_CalcTimer: ; 0x037FBC40
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	rsb r0, r1, #0
	mov r4, #0
	b _037FBC5C
_037FBC54:
	sub r4, r4, #1
	add r0, r0, #0x300
_037FBC5C:
	cmp r0, #0
	blt _037FBC54
	b _037FBC70
_037FBC68:
	add r4, r4, #1
	sub r0, r0, #0x300
_037FBC70:
	cmp r0, #0x300
	bge _037FBC68
	bl __VENEER_SVC_GetPitchTable
	adds r3, r0, #0x10000
	mov r0, r5, asr #0x1f
	umull r2, r1, r3, r5
	mov ip, #0
	mla r1, r3, r0, r1
	adc r3, ip, #0
	sub r0, r4, #0x10
	mla r1, r3, r5, r1
	cmp r0, #0
	mov r4, #0x10000
	bgt _037FBCC8
	rsb r3, r0, #0
	mov r4, r2, lsr r3
	rsb r0, r3, #0x20
	orr r4, r4, r1, lsl r0
	sub r0, r3, #0x20
	mov r3, r1, lsr r3
	orr r4, r4, r1, lsr r0
	b _037FBD24
_037FBCC8:
	cmp r0, #0x20
	bge _037FBD1C
	rsb r5, r0, #0x20
	sub lr, ip, #1
	mov r6, lr, lsl r5
	rsb r3, r5, #0x20
	orr r6, r6, lr, lsr r3
	sub r3, r5, #0x20
	orr r6, r6, lr, lsl r3
	and r3, r1, r6
	and r6, r2, lr, lsl r5
	cmp r3, ip
	cmpeq r6, ip
	subne r0, r4, #1
	bne _037FBD54
	mov r3, r1, lsl r0
	orr r3, r3, r2, lsr r5
	sub r1, r0, #0x20
	mov r4, r2, lsl r0
	orr r3, r3, r2, lsl r1
	b _037FBD24
_037FBD1C:
	sub r0, r4, #1
	b _037FBD54
_037FBD24:
	mov r0, #0x10
	cmp r3, #0
	cmpeq r4, #0x10
	mov r1, #0
	movlo r4, r0
	blo _037FBD4C
	ldr r0, _037FBD5C ; =0x0000FFFF
	cmp r3, r1
	cmpeq r4, r0
	movhi r4, r0
_037FBD4C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
_037FBD54:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FBD5C: .word 0x0000FFFF
	arm_func_end SND_CalcTimer

	arm_func_start __VENEER_SVC_GetPitchTable
__VENEER_SVC_GetPitchTable: ; 0x037FBD60
	ldr ip, _037FBD68 ; =SVC_GetPitchTable
	bx ip
	.align 2, 0
_037FBD68: .word SVC_GetPitchTable
	arm_func_end __VENEER_SVC_GetPitchTable

	arm_func_start SND_CalcChannelVolume
SND_CalcChannelVolume: ; 0x037FBD6C
	stmdb sp!, {r4, lr}
	ldr r1, _037FBDDC ; =0xFFFFFD2D
	mov r4, r0
	cmp r4, r1
	movlt r4, r1
	blt _037FBD8C
	cmp r4, #0
	movgt r4, #0
_037FBD8C:
	add r0, r4, #0xd3
	add r0, r0, #0x200
	bl __VENEER_SVC_GetVolumeTable
	mvn r2, #0xef
	cmp r4, r2
	movlt r1, #3
	blt _037FBDC8
	add r1, r2, #0x78
	cmp r4, r1
	movlt r1, #2
	blt _037FBDC8
	add r1, r2, #0xb4
	cmp r4, r1
	movlt r1, #1
	movge r1, #0
_037FBDC8:
	orr r0, r0, r1, lsl #8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FBDDC: .word 0xFFFFFD2D
	arm_func_end SND_CalcChannelVolume

	arm_func_start __VENEER_SVC_GetVolumeTable
__VENEER_SVC_GetVolumeTable: ; 0x037FBDE0
	ldr ip, _037FBDE8 ; =SVC_GetVolumeTable
	bx ip
	.align 2, 0
_037FBDE8: .word SVC_GetVolumeTable
	arm_func_end __VENEER_SVC_GetVolumeTable

	arm_func_start SND_SinIdx
SND_SinIdx: ; 0x037FBDEC
	cmp r0, #0x20
	ldrlt r1, _037FBE54 ; =SinTable
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x40
	ldrlt r1, _037FBE54 ; =SinTable
	rsblt r0, r0, #0x40
	ldrltsb r0, [r1, r0]
	bxlt lr
	cmp r0, #0x60
	bge _037FBE34
	ldr r1, _037FBE54 ; =SinTable
	sub r0, r0, #0x40
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
_037FBE34:
	ldr r1, _037FBE54 ; =SinTable
	sub r0, r0, #0x60
	rsb r0, r0, #0x20
	ldrsb r0, [r1, r0]
	rsb r0, r0, #0
	mov r0, r0, lsl #0x18
	mov r0, r0, asr #0x18
	bx lr
	.align 2, 0
_037FBE54: .word SinTable
	arm_func_end SND_SinIdx

	arm_func_start SND_CalcRandom
SND_CalcRandom: ; 0x037FBE58
	ldr r2, _037FBE80 ; =u$3681
	ldr r0, _037FBE84 ; =0x0019660D
	ldr r3, [r2]
	ldr r1, _037FBE88 ; =0x3C6EF35F
	mla r1, r3, r0, r1
	mov r0, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	str r1, [r2]
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_037FBE80: .word u$3681
_037FBE84: .word 0x0019660D
_037FBE88: .word 0x3C6EF35F
	arm_func_end SND_CalcRandom

	arm_func_start SND_Init
SND_Init: ; 0x037FBE8C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _037FBEE8 ; =initialized$3619
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _037FBEDC
	mov r0, #1
	str r0, [r1]
	bl SND_CommandInit
	mov r0, #0x400
	str r0, [sp]
	ldr r0, _037FBEEC ; =sndThread
	ldr r1, _037FBEF0 ; =SndThread
	ldr r3, _037FBEF4 ; =sWeakLockChannel
	mov r2, #0
	str r4, [sp, #4]
	bl OS_CreateThread
	ldr r0, _037FBEEC ; =sndThread
	bl OS_WakeupThreadDirect
_037FBEDC:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FBEE8: .word initialized$3619
_037FBEEC: .word sndThread
_037FBEF0: .word SndThread
_037FBEF4: .word sWeakLockChannel
	arm_func_end SND_Init

	arm_func_start SND_StartIntervalTimer
SND_StartIntervalTimer: ; 0x037FBEF8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	bl OS_GetTick
	ldr r3, _037FBF3C ; =SndAlarmCallback
	adds ip, r0, #0x10000
	str r3, [sp, #4]
	mov lr, #0
	str lr, [sp, #8]
	adc r2, r1, #0
	ldr r3, _037FBF40 ; =0x00000AA8
	ldr r0, _037FBF44 ; =sndAlarm
	mov r1, ip
	str lr, [sp]
	bl OS_SetPeriodicAlarm
	add sp, sp, #0xc
	ldmia sp!, {lr}
	bx lr
	.align 2, 0
_037FBF3C: .word SndAlarmCallback
_037FBF40: .word 0x00000AA8
_037FBF44: .word sndAlarm
	arm_func_end SND_StartIntervalTimer

	arm_func_start SND_StopIntervalTimer
SND_StopIntervalTimer: ; 0x037FBF48
	ldr ip, _037FBF54 ; =OS_CancelAlarm
	ldr r0, _037FBF58 ; =sndAlarm
	bx ip
	.align 2, 0
_037FBF54: .word OS_CancelAlarm
_037FBF58: .word sndAlarm
	arm_func_end SND_StopIntervalTimer

	arm_func_start SND_SendWakeupMessage
SND_SendWakeupMessage: ; 0x037FBF5C
	ldr ip, _037FBF70 ; =OS_SendMessage
	ldr r0, _037FBF74 ; =sndMesgQueue
	mov r1, #2
	mov r2, #0
	bx ip
	.align 2, 0
_037FBF70: .word OS_SendMessage
_037FBF74: .word sndMesgQueue
	arm_func_end SND_SendWakeupMessage

	arm_func_start SNDi_LockMutex
SNDi_LockMutex: ; 0x037FBF78
	bx lr
	arm_func_end SNDi_LockMutex

	arm_func_start SNDi_UnlockMutex
SNDi_UnlockMutex: ; 0x037FBF7C
	bx lr
	arm_func_end SNDi_UnlockMutex

	arm_func_start SndAlarmCallback
SndAlarmCallback: ; 0x037FBF80
	ldr ip, _037FBF94 ; =OS_SendMessage
	ldr r0, _037FBF98 ; =sndMesgQueue
	mov r1, #1
	mov r2, #0
	bx ip
	.align 2, 0
_037FBF94: .word OS_SendMessage
_037FBF98: .word sndMesgQueue
	arm_func_end SndAlarmCallback

	arm_func_start SndThread
SndThread: ; 0x037FBF9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r0, _037FC07C ; =sndMesgQueue
	ldr r1, _037FC080 ; =sndMesgBuffer
	mov r2, #8
	bl OS_InitMessageQueue
	ldr r0, _037FC084 ; =sndAlarm
	bl OS_CreateAlarm
	bl SND_ExChannelInit
	bl SND_SeqInit
	bl SND_AlarmInit
	bl SND_Enable
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl SND_SetOutputSelector
	mov r0, #0x7f
	bl SND_SetMasterVolume
	bl OS_GetTick
	ldr r2, _037FC088 ; =SndAlarmCallback
	adds r4, r0, #0x10000
	str r2, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp]
	adc r2, r1, #0
	ldr r3, _037FC08C ; =0x00000AA8
	ldr r0, _037FC084 ; =sndAlarm
	mov r1, r4
	bl OS_SetPeriodicAlarm
	ldr r7, _037FC07C ; =sndMesgQueue
	mov r4, #1
	add r6, sp, #0xc
	mov r8, #0
	mov r5, r4
_037FC02C:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov sb, r8
	bl OS_ReceiveMessage
	ldr r0, [sp, #0xc]
	cmp r0, #1
	beq _037FC054
	cmp r0, #2
	b _037FC058
_037FC054:
	mov sb, r4
_037FC058:
	bl SND_UpdateExChannel
	bl SND_CommandProc
	mov r0, sb
	bl SND_SeqMain
	mov r0, sb
	bl SND_ExChannelMain
	bl SND_UpdateSharedWork
	bl SND_CalcRandom
	b _037FC02C
	.align 2, 0
_037FC07C: .word sndMesgQueue
_037FC080: .word sndMesgBuffer
_037FC084: .word sndAlarm
_037FC088: .word SndAlarmCallback
_037FC08C: .word 0x00000AA8
	arm_func_end SndThread

	arm_func_start SND_SetupCapture
SND_SetupCapture: ; 0x037FC090
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [sp, #0x10]
	mov r5, r0, lsl #3
	cmp r4, #0
	movne r4, #0
	moveq r4, #1
	mov ip, r4, lsl #2
	ldr lr, [sp, #0x14]
	orr r1, ip, r1, lsl #3
	orr ip, r1, lr, lsl #1
	ldr r4, [sp, #0x18]
	add r0, r0, #0x4000000
	orr r4, r4, ip
	strb r4, [r0, #0x508]
	add r1, r5, #0x4000000
	str r2, [r1, #0x510]
	add r0, r1, #0x500
	strh r3, [r0, #0x14]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end SND_SetupCapture

	arm_func_start SND_IsCaptureActive
SND_IsCaptureActive: ; 0x037FC0E0
	add r0, r0, #0x4000000
	ldrb r0, [r0, #0x508]
	tst r0, #0x80
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end SND_IsCaptureActive

	arm_func_start SND_ExChannelInit
SND_ExChannelInit: ; 0x037FC0F8
	stmdb sp!, {r3, lr}
	ldr r3, _037FC14C ; =SNDi_Work
	mov lr, #0
	mov r0, #0x54
_037FC108:
	mul r1, lr, r0
	add ip, r3, r1
	strb lr, [r3, r1]
	ldrb r1, [ip, #3]
	add lr, lr, #1
	bic r2, r1, #0xf8
	and r1, r2, #0xff
	bic r1, r1, #1
	strb r1, [ip, #3]
	cmp lr, #0x10
	blt _037FC108
	ldr r0, _037FC150 ; =sWeakLockChannel
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC14C: .word SNDi_Work
_037FC150: .word sWeakLockChannel
	arm_func_end SND_ExChannelInit

	arm_func_start SND_UpdateExChannel
SND_UpdateExChannel: ; 0x037FC154
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x18
	ldr r7, _037FC33C ; =SNDi_Work
	mov sb, #0
	mov r4, #2
	mov r5, #1
	mov r6, sb
	mov sl, #0x54
_037FC174:
	mla r8, sb, sl, r7
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _037FC2D4
	tst r0, #2
	beq _037FC19C
	mov r0, sb
	mov r1, r6
	bl SND_StopChannel
_037FC19C:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #1
	beq _037FC278
	ldrb r0, [r8, #1]
	cmp r0, #0
	beq _037FC1D0
	cmp r0, #1
	beq _037FC228
	cmp r0, #2
	beq _037FC254
	b _037FC2D4
_037FC1D0:
	ldrb r0, [r8, #0x39]
	ldrh ip, [r8, #0x24]
	cmp r0, #0
	ldrh r0, [r8, #0x3e]
	movne r3, r5
	str r0, [sp]
	ldr r2, [r8, #0x40]
	and r1, ip, #0xff
	str r2, [sp, #4]
	str r1, [sp, #8]
	mov r0, ip, asr #8
	str r0, [sp, #0xc]
	ldrh r1, [r8, #0x26]
	moveq r3, r4
	str r1, [sp, #0x10]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp, #0x14]
	ldr r1, [r8, #0x44]
	ldrb r2, [r8, #0x38]
	bl SND_SetupChannelPcm
	b _037FC2D4
_037FC228:
	ldrh r3, [r8, #0x24]
	ldrh r1, [r8, #0x26]
	mov r0, sb
	str r1, [sp]
	ldrb r1, [r8, #0x23]
	and r2, r3, #0xff
	str r1, [sp, #4]
	ldr r1, [r8, #0x44]
	mov r3, r3, asr #8
	bl SND_SetupChannelPsg
	b _037FC2D4
_037FC254:
	ldrh r2, [r8, #0x24]
	ldrb r1, [r8, #0x23]
	mov r0, sb
	str r1, [sp]
	ldrh r3, [r8, #0x26]
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl SND_SetupChannelNoise
	b _037FC2D4
_037FC278:
	tst r0, #4
	beq _037FC28C
	ldrh r1, [r8, #0x26]
	mov r0, sb
	bl SND_SetChannelTimer
_037FC28C:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #8
	beq _037FC2B4
	ldrh r2, [r8, #0x24]
	mov r0, sb
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl SND_SetChannelVolume
_037FC2B4:
	ldrb r0, [r8, #3]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	tst r0, #0x10
	beq _037FC2D4
	ldrb r1, [r8, #0x23]
	mov r0, sb
	bl SND_SetChannelPan
_037FC2D4:
	add sb, sb, #1
	cmp sb, #0x10
	blt _037FC174
	ldr r3, _037FC33C ; =SNDi_Work
	mov r4, #0
	mov r1, #0x54
_037FC2EC:
	mla r5, r4, r1, r3
	ldrb r0, [r5, #3]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1b
	beq _037FC324
	tst r0, #1
	movne r0, r4, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r2, [r0, #0x403]
	orrne r2, r2, #0x80
	strneb r2, [r0, #0x403]
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	strb r0, [r5, #3]
_037FC324:
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FC2EC
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FC33C: .word SNDi_Work
	arm_func_end SND_UpdateExChannel

	arm_func_start SND_ExChannelMain
SND_ExChannelMain: ; 0x037FC340
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov fp, r0
	mov r0, #0x8000
	rsb r0, r0, #0
	mov r6, #0
	str r0, [sp]
	mov r4, r6
_037FC35C:
	ldr r0, _037FC6E8 ; =SNDi_Work
	mov r1, #0x54
	mla r5, r6, r1, r0
	ldrb r2, [r5, #3]
	mov r7, #0
	mov r0, r2, lsl #0x1f
	mov r8, r7
	mov sb, r7
	movs r0, r0, lsr #0x1f
	beq _037FC6D4
	mov r0, r2, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FC3C0
	bic r1, r2, #0xf8
	mov r0, r2, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #1
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
	and r0, r0, #0xff
	bic r0, r0, #2
	strb r0, [r5, #3]
	b _037FC410
_037FC3C0:
	mov r0, r6
	bl SND_IsChannelActive
	cmp r0, #0
	bne _037FC410
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, r7
	streqb r0, [r5, #0x22]
	beq _037FC3F8
	ldr r2, [r5, #0x4c]
	mov r0, r5
	mov r1, #1
	mov lr, pc
	bx r3
_037FC3F8:
	mov r0, #0
	strh r0, [r5, #0x24]
	ldrb r0, [r5, #3]
	bic r0, r0, #1
	strb r0, [r5, #3]
	b _037FC6D4
_037FC410:
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #8]
	mov r2, r0, lsl #1
	ldr r0, _037FC6EC ; =SNDi_DecibelTable
	ldrsh r2, [r0, r2]
	ldrb r0, [r5, #5]
	add r7, r7, r2
	sub r0, r1, r0
	add r8, r8, r0, lsl #6
	mov r0, r5
	mov r1, fp
	bl SND_UpdateExChannelEnvelope
	ldrsh r3, [r5, #0x32]
	add r7, r7, r0
	cmp r3, #0
	moveq r0, #0
	beq _037FC498
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x18]
	cmp r0, r2
	movge r0, #0
	bge _037FC498
	sub r0, r2, r0
	smull r0, r1, r3, r0
	mov r3, r2, asr #0x1f
	bl _ll_sdiv
	cmp fp, #0
	beq _037FC498
	ldrb r1, [r5, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	ldrne r1, [r5, #0x14]
	addne r1, r1, #1
	strne r1, [r5, #0x14]
_037FC498:
	ldrsh r1, [r5, #0xc]
	add r2, r8, r0
	ldrsh r0, [r5, #6]
	add r1, r7, r1
	add r7, r1, r0
	ldrsh r1, [r5, #0xe]
	add r0, r5, #0x28
	add r8, r2, r1
	bl SND_GetLfoValue
	mov r1, r0, asr #0x1f
	cmp r1, #0
	mov sl, r0
	cmpeq r0, r4
	beq _037FC524
	ldrb r2, [r5, #0x28]
	cmp r2, #0
	beq _037FC510
	cmp r2, #1
	beq _037FC4F8
	cmp r2, #2
	moveq r1, r1, lsl #6
	orreq r1, r1, r0, lsr #26
	moveq sl, r0, lsl #6
	b _037FC51C
_037FC4F8:
	mov r2, #0x3c
	umull sl, r3, r0, r2
	mov r0, #0x3c
	mla r3, r1, r0, r3
	mov r1, r3
	b _037FC51C
_037FC510:
	mov r1, r1, lsl #6
	orr r1, r1, r0, lsr #26
	mov sl, r0, lsl #6
_037FC51C:
	mov sl, sl, lsr #0xe
	orr sl, sl, r1, lsl #18
_037FC524:
	cmp fp, #0
	beq _037FC534
	add r0, r5, #0x28
	bl SND_UpdateLfo
_037FC534:
	ldrb r0, [r5, #0x28]
	cmp r0, #0
	beq _037FC564
	cmp r0, #1
	beq _037FC554
	cmp r0, #2
	addeq sb, sb, sl
	b _037FC568
_037FC554:
	ldr r0, [sp]
	cmp r7, r0
	addgt r7, r7, sl
	b _037FC568
_037FC564:
	add r8, r8, sl
_037FC568:
	ldrsb r1, [r5, #0xa]
	ldrb r0, [r5, #4]
	add sb, sb, r1
	cmp r0, #0x7f
	mulne r0, sb, r0
	addne r0, r0, #0x40
	movne sb, r0, asr #7
	ldrsb r1, [r5, #0xb]
	ldrb r0, [r5, #2]
	add sb, sb, r1
	cmp r0, #3
	bne _037FC5F4
	ldr r0, _037FC6F0 ; =0xFFFFFD2D
	cmp r7, r0
	bgt _037FC5F4
	ldrb r0, [r5, #3]
	bic r0, r0, #0xf8
	orr r0, r0, #0x10
	strb r0, [r5, #3]
	ldr r3, [r5, #0x48]
	cmp r3, #0
	moveq r0, #0
	streqb r0, [r5, #0x22]
	beq _037FC5DC
	ldr r2, [r5, #0x4c]
	mov r0, r5
	mov r1, #1
	mov lr, pc
	bx r3
_037FC5DC:
	mov r0, #0
	strh r0, [r5, #0x24]
	ldrb r0, [r5, #3]
	bic r0, r0, #1
	strb r0, [r5, #3]
	b _037FC6D4
_037FC5F4:
	mov r0, r7
	bl SND_CalcChannelVolume
	mov r7, r0
	ldrh r0, [r5, #0x3c]
	mov r1, r8
	bl SND_CalcTimer
	ldrb r1, [r5, #1]
	cmp r1, #1
	ldreq r1, _037FC6F4 ; =0x0000FFFC
	andeq r0, r0, r1
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	adds sb, sb, #0x40
	movmi sb, #0
	bmi _037FC638
	cmp sb, #0x7f
	movgt sb, #0x7f
_037FC638:
	ldrh r1, [r5, #0x24]
	cmp r7, r1
	beq _037FC66C
	strh r7, [r5, #0x24]
	ldrb r1, [r5, #3]
	bic r2, r1, #0xf8
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x1b
	orr r1, r1, #8
	and r1, r1, #0xff
	mov r1, r1, lsl #0x1b
	orr r1, r2, r1, lsr #24
	strb r1, [r5, #3]
_037FC66C:
	ldrh r1, [r5, #0x26]
	cmp r0, r1
	beq _037FC6A0
	strh r0, [r5, #0x26]
	ldrb r0, [r5, #3]
	bic r1, r0, #0xf8
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #4
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
_037FC6A0:
	ldrb r0, [r5, #0x23]
	cmp sb, r0
	beq _037FC6D4
	strb sb, [r5, #0x23]
	ldrb r0, [r5, #3]
	bic r1, r0, #0xf8
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x1b
	orr r0, r0, #0x10
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1b
	orr r0, r1, r0, lsr #24
	strb r0, [r5, #3]
_037FC6D4:
	add r6, r6, #1
	cmp r6, #0x10
	blt _037FC35C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FC6E8: .word SNDi_Work
_037FC6EC: .word SNDi_DecibelTable
_037FC6F0: .word 0xFFFFFD2D
_037FC6F4: .word 0x0000FFFC
	arm_func_end SND_ExChannelMain

	arm_func_start SND_StartExChannelPcm
SND_StartExChannelPcm: ; 0x037FC6F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #1]
	mov lr, r2
	add ip, r4, #0x38
	ldmia r1, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	mov r0, r4
	mov r1, r3
	str lr, [r4, #0x44]
	bl StartExChannel
	mov r0, #1
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end SND_StartExChannelPcm

	arm_func_start SND_StartExChannelPsg
SND_StartExChannelPsg: ; 0x037FC734
	stmdb sp!, {r3, lr}
	ldrb r3, [r0]
	cmp r3, #8
	movlo r0, #0
	blo _037FC774
	cmp r3, #0xd
	movhi r0, #0
	bhi _037FC774
	mov r3, #1
	strb r3, [r0, #1]
	str r1, [r0, #0x44]
	ldr r3, _037FC77C ; =0x00001F46
	mov r1, r2
	strh r3, [r0, #0x3c]
	bl StartExChannel
	mov r0, #1
_037FC774:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC77C: .word 0x00001F46
	arm_func_end SND_StartExChannelPsg

	arm_func_start SND_StartExChannelNoise
SND_StartExChannelNoise: ; 0x037FC780
	stmdb sp!, {r3, lr}
	ldrb r2, [r0]
	cmp r2, #0xe
	movlo r0, #0
	blo _037FC7B8
	cmp r2, #0xf
	movhi r0, #0
	bhi _037FC7B8
	ldr r2, _037FC7C0 ; =0x00001F46
	mov r3, #2
	strb r3, [r0, #1]
	strh r2, [r0, #0x3c]
	bl StartExChannel
	mov r0, #1
_037FC7B8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FC7C0: .word 0x00001F46
	arm_func_end SND_StartExChannelNoise

	arm_func_start SND_UpdateExChannelEnvelope
SND_UpdateExChannelEnvelope: ; 0x037FC7C4
	cmp r1, #0
	beq _037FC85C
	ldrb r1, [r0, #2]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _037FC85C
_037FC7DC: ; jump table
	b _037FC7EC ; case 0
	b _037FC814 ; case 1
	b _037FC85C ; case 2
	b _037FC84C ; case 3
_037FC7EC:
	ldr r2, [r0, #0x10]
	ldrb r1, [r0, #0x1c]
	rsb r2, r2, #0
	mul r1, r2, r1
	mov r1, r1, asr #8
	rsbs r1, r1, #0
	str r1, [r0, #0x10]
	moveq r1, #1
	streqb r1, [r0, #2]
	b _037FC85C
_037FC814:
	ldrb r2, [r0, #0x1d]
	ldr r1, _037FC868 ; =SNDi_DecibelTable
	mov r2, r2, lsl #1
	ldrsh r3, [r1, r2]
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x1e]
	mov ip, r3, lsl #7
	sub r1, r2, r1
	str r1, [r0, #0x10]
	cmp r1, r3, lsl #7
	strle ip, [r0, #0x10]
	movle r1, #2
	strleb r1, [r0, #2]
	b _037FC85C
_037FC84C:
	ldr r2, [r0, #0x10]
	ldrh r1, [r0, #0x20]
	sub r1, r2, r1
	str r1, [r0, #0x10]
_037FC85C:
	ldr r0, [r0, #0x10]
	mov r0, r0, asr #7
	bx lr
	.align 2, 0
_037FC868: .word SNDi_DecibelTable
	arm_func_end SND_UpdateExChannelEnvelope

	arm_func_start SND_SetExChannelAttack
SND_SetExChannelAttack: ; 0x037FC86C
	cmp r1, #0x6d
	ldrge r2, _037FC888 ; =attack_table$3790
	rsblt r1, r1, #0xff
	rsbge r1, r1, #0x7f
	ldrgeb r1, [r2, r1]
	strb r1, [r0, #0x1c]
	bx lr
	.align 2, 0
_037FC888: .word attack_table$3790
	arm_func_end SND_SetExChannelAttack

	arm_func_start SND_SetExChannelDecay
SND_SetExChannelDecay: ; 0x037FC88C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl CalcRelease
	strh r0, [r4, #0x1e]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end SND_SetExChannelDecay

	arm_func_start SND_SetExChannelSustain
SND_SetExChannelSustain: ; 0x037FC8A8
	strb r1, [r0, #0x1d]
	bx lr
	arm_func_end SND_SetExChannelSustain

	arm_func_start SND_SetExChannelRelease
SND_SetExChannelRelease: ; 0x037FC8B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl CalcRelease
	strh r0, [r4, #0x20]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end SND_SetExChannelRelease

	arm_func_start SND_ReleaseExChannel
SND_ReleaseExChannel: ; 0x037FC8CC
	mov r1, #3
	strb r1, [r0, #2]
	bx lr
	arm_func_end SND_ReleaseExChannel

	arm_func_start SND_IsExChannelActive
SND_IsExChannelActive: ; 0x037FC8D8
	ldrb r0, [r0, #3]
	mov r0, r0, lsl #0x1f
	mov r0, r0, lsr #0x1f
	bx lr
	arm_func_end SND_IsExChannelActive

	arm_func_start SND_AllocExChannel
SND_AllocExChannel: ; 0x037FC8E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FCAA0 ; =sWeakLockChannel
	mov r6, r1
	ldr r1, [r4, #4]
	mov r5, r3
	mvn r1, r1
	cmp r2, #0
	and r0, r0, r1
	ldreq r1, [r4]
	mov r4, #0
	mvneq r1, r1
	andeq r0, r0, r1
	ldr r3, _037FCAA4 ; =shift$4005
	ldr r8, _037FCAA8 ; =channel_order$3829
	mov sb, r4
	mvn r1, #0
	mov fp, #1
_037FC92C:
	ldrb ip, [r8, sb]
	tst r0, fp, lsl ip
	beq _037FC9AC
	ldr r2, _037FCAAC ; =SNDi_Work
	mov r7, #0x54
	mla sl, ip, r7, r2
	cmp r4, #0
	moveq r4, sl
	beq _037FC9AC
	ldrb r7, [r4, #0x22]
	ldrb r2, [sl, #0x22]
	cmp r2, r7
	bhi _037FC9AC
	bne _037FC9A8
	ldrh r2, [r4, #0x24]
	ldrh r7, [sl, #0x24]
	mov ip, r2, lsl #0x18
	mov ip, ip, lsr #0x14
	ldrb r2, [r3, r2, asr #8]
	mov lr, r7, lsl #0x18
	mov r2, ip, asr r2
	mov ip, lr, lsr #0x14
	ldrb r7, [r3, r7, asr #8]
	cmp r2, ip, asr r7
	beq _037FC99C
	movlt r2, fp
	movge r2, r1
	b _037FC9A0
_037FC99C:
	mov r2, #0
_037FC9A0:
	cmp r2, #0
	bge _037FC9AC
_037FC9A8:
	mov r4, sl
_037FC9AC:
	add sb, sb, #1
	cmp sb, #0x10
	blt _037FC92C
	cmp r4, #0
	moveq r0, #0
	beq _037FCA98
	ldrb r0, [r4, #0x22]
	cmp r6, r0
	movlt r0, #0
	blt _037FCA98
	ldr r3, [r4, #0x48]
	cmp r3, #0
	beq _037FC9F4
	ldr r2, [r4, #0x4c]
	mov r0, r4
	mov r1, #0
	mov lr, pc
	bx r3
_037FC9F4:
	ldrb r0, [r4, #3]
	mov r7, #0
	bic r0, r0, #0xf8
	orr r1, r0, #0x10
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r4, #3]
	str r7, [r4, #0x50]
	ldr r0, [sp, #0x28]
	str r5, [r4, #0x48]
	str r0, [r4, #0x4c]
	str r7, [r4, #0x34]
	strb r6, [r4, #0x22]
	mov r3, #0x7f
	strh r3, [r4, #0x24]
	ldrb r1, [r4, #3]
	mov r0, #0x3c
	bic r2, r1, #2
	and r1, r2, #0xff
	orr r1, r1, #4
	strb r1, [r4, #3]
	strb r0, [r4, #8]
	strb r0, [r4, #5]
	strb r3, [r4, #9]
	strb r7, [r4, #0xa]
	strh r7, [r4, #0xc]
	strh r7, [r4, #6]
	strh r7, [r4, #0xe]
	strb r7, [r4, #0xb]
	strb r3, [r4, #4]
	strh r7, [r4, #0x32]
	str r7, [r4, #0x18]
	str r7, [r4, #0x14]
	ldr r1, _037FCAB0 ; =0x0000FFFF
	strb r7, [r4, #0x1c]
	strh r1, [r4, #0x1e]
	strb r3, [r4, #0x1d]
	add r0, r4, #0x28
	strh r1, [r4, #0x20]
	bl SND_InitLfoParam
	mov r0, r4
_037FCA98:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCAA0: .word sWeakLockChannel
_037FCAA4: .word shift$4005
_037FCAA8: .word channel_order$3829
_037FCAAC: .word SNDi_Work
_037FCAB0: .word 0x0000FFFF
	arm_func_end SND_AllocExChannel

	arm_func_start SND_FreeExChannel
SND_FreeExChannel: ; 0x037FCAB4
	cmp r0, #0
	movne r1, #0
	strne r1, [r0, #0x48]
	strne r1, [r0, #0x4c]
	bx lr
	arm_func_end SND_FreeExChannel

	arm_func_start SND_StopUnlockedChannel
SND_StopUnlockedChannel: ; 0x037FCAC8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, #0
	ldr r7, _037FCB70 ; =SNDi_Work
	ldr r4, _037FCB74 ; =sWeakLockChannel
	mov sl, r0
	mov r5, sb
	mov r6, #1
	mov fp, #0x54
	b _037FCB58
_037FCAEC:
	tst sl, #1
	beq _037FCB50
	ldr r0, [r4, #4]
	mla r8, sb, fp, r7
	tst r0, r6, lsl sb
	bne _037FCB50
	ldr r3, [r8, #0x48]
	cmp r3, #0
	beq _037FCB24
	ldr r2, [r8, #0x4c]
	mov r0, r8
	mov r1, #0
	mov lr, pc
	bx r3
_037FCB24:
	mov r0, sb
	mov r1, #0
	bl SND_StopChannel
	strb r5, [r8, #0x22]
	mov r0, r8
	bl SND_FreeExChannel
	ldrb r0, [r8, #3]
	bic r1, r0, #0xf8
	and r0, r1, #0xff
	bic r0, r0, #1
	strb r0, [r8, #3]
_037FCB50:
	add sb, sb, #1
	mov sl, sl, lsr #1
_037FCB58:
	cmp sb, #0x10
	bge _037FCB68
	cmp sl, #0
	bne _037FCAEC
_037FCB68:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCB70: .word SNDi_Work
_037FCB74: .word sWeakLockChannel
	arm_func_end SND_StopUnlockedChannel

	arm_func_start SND_LockChannel
SND_LockChannel: ; 0x037FCB78
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r8, #0
	ldr r5, _037FCC50 ; =SNDi_Work
	mov sb, r1
	mov r7, sl
	mov fp, r8
	mov r4, #1
	b _037FCC14
_037FCB9C:
	tst r7, #1
	beq _037FCC0C
	ldr r0, _037FCC54 ; =sWeakLockChannel
	ldr r1, [r0, #4]
	mov r0, #0x54
	mla r6, r8, r0, r5
	tst r1, r4, lsl r8
	bne _037FCC0C
	ldr r3, [r6, #0x48]
	cmp r3, #0
	beq _037FCBDC
	ldr r2, [r6, #0x4c]
	mov r0, r6
	mov r1, #0
	mov lr, pc
	bx r3
_037FCBDC:
	mov r0, r8
	mov r1, #0
	bl SND_StopChannel
	strb fp, [r6, #0x22]
	mov r0, r6
	bl SND_FreeExChannel
	ldrb r0, [r6, #3]
	bic r0, r0, #0xf8
	strb r0, [r6, #3]
	and r0, r0, #0xff
	bic r0, r0, #1
	strb r0, [r6, #3]
_037FCC0C:
	add r8, r8, #1
	mov r7, r7, lsr #1
_037FCC14:
	cmp r8, #0x10
	bge _037FCC24
	cmp r7, #0
	bne _037FCB9C
_037FCC24:
	tst sb, #1
	ldrne r0, _037FCC54 ; =sWeakLockChannel
	ldrne r1, [r0]
	orrne r1, r1, sl
	strne r1, [r0]
	ldreq r0, _037FCC54 ; =sWeakLockChannel
	ldreq r1, [r0, #4]
	orreq r1, r1, sl
	streq r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FCC50: .word SNDi_Work
_037FCC54: .word sWeakLockChannel
	arm_func_end SND_LockChannel

	arm_func_start SND_UnlockChannel
SND_UnlockChannel: ; 0x037FCC58
	tst r1, #1
	ldreq r1, _037FCC8C ; =sWeakLockChannel
	mvneq r0, r0
	ldreq r2, [r1, #4]
	andeq r0, r2, r0
	streq r0, [r1, #4]
	bxeq lr
	ldr r1, _037FCC8C ; =sWeakLockChannel
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_037FCC8C: .word sWeakLockChannel
	arm_func_end SND_UnlockChannel

	arm_func_start SND_GetLockedChannel
SND_GetLockedChannel: ; 0x037FCC90
	tst r0, #1
	ldrne r0, _037FCCA8 ; =sWeakLockChannel
	ldrne r0, [r0]
	ldreq r0, _037FCCA8 ; =sWeakLockChannel
	ldreq r0, [r0, #4]
	bx lr
	.align 2, 0
_037FCCA8: .word sWeakLockChannel
	arm_func_end SND_GetLockedChannel

	arm_func_start SND_InvalidateWave
SND_InvalidateWave: ; 0x037FCCAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _037FCD24 ; =SNDi_Work
	mov r6, #0
	mov r8, r0
	mov r7, r1
	mov r4, r6
	mov sb, #0x54
_037FCCC8:
	mla r2, r6, sb, r5
	ldrb r1, [r2, #3]
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FCD0C
	ldrb r0, [r2, #1]
	cmp r0, #0
	bne _037FCD0C
	ldr r0, [r2, #0x44]
	cmp r8, r0
	cmpls r0, r7
	bhi _037FCD0C
	bic r3, r1, #2
	mov r0, r6
	mov r1, r4
	strb r3, [r2, #3]
	bl SND_StopChannel
_037FCD0C:
	add r0, r6, #1
	and r6, r0, #0xff
	cmp r6, #0x10
	blo _037FCCC8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FCD24: .word SNDi_Work
	arm_func_end SND_InvalidateWave

	arm_func_start SND_InitLfoParam
SND_InitLfoParam: ; 0x037FCD28
	mov r2, #0
	strb r2, [r0]
	strb r2, [r0, #2]
	mov r1, #1
	strb r1, [r0, #3]
	mov r1, #0x10
	strb r1, [r0, #1]
	strh r2, [r0, #4]
	bx lr
	arm_func_end SND_InitLfoParam

	arm_func_start SND_UpdateLfo
SND_UpdateLfo: ; 0x037FCD4C
	ldrh r2, [r0, #6]
	ldrh r1, [r0, #4]
	cmp r2, r1
	addlo r1, r2, #1
	strloh r1, [r0, #6]
	bxlo lr
	ldrh r1, [r0, #8]
	ldrb r2, [r0, #1]
	add r1, r1, r2, lsl #6
	mov r3, r1, lsr #8
	b _037FCD7C
_037FCD78:
	sub r3, r3, #0x80
_037FCD7C:
	cmp r3, #0x80
	bhs _037FCD78
	ldrh r1, [r0, #8]
	add r1, r1, r2, lsl #6
	strh r1, [r0, #8]
	ldrh r1, [r0, #8]
	and r1, r1, #0xff
	strh r1, [r0, #8]
	ldrh r1, [r0, #8]
	orr r1, r1, r3, lsl #8
	strh r1, [r0, #8]
	bx lr
	arm_func_end SND_UpdateLfo

	arm_func_start SND_GetLfoValue
SND_GetLfoValue: ; 0x037FCDAC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #2]
	cmp r0, #0
	moveq r0, #0
	beq _037FCDF4
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #4]
	cmp r1, r0
	movlo r0, #0
	blo _037FCDF4
	ldrh r0, [r4, #8]
	mov r0, r0, lsr #8
	bl SND_SinIdx
	ldrb r1, [r4, #2]
	ldrb r2, [r4, #3]
	mul r0, r1, r0
	mul r0, r2, r0
_037FCDF4:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end SND_GetLfoValue

	arm_func_start CalcRelease
CalcRelease: ; 0x037FCDFC
	stmdb sp!, {r3, lr}
	cmp r0, #0x7f
	ldreq r0, _037FCE4C ; =0x0000FFFF
	beq _037FCE44
	cmp r0, #0x7e
	moveq r0, #0x3c00
	beq _037FCE44
	cmp r0, #0x32
	movlt r0, r0, lsl #1
	addlt r0, r0, #1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _037FCE44
	rsb r1, r0, #0x7e
	mov r0, #0x1e00
	bl _s32_div_f
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_037FCE44:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FCE4C: .word 0x0000FFFF
	arm_func_end CalcRelease

	arm_func_start StartExChannel
StartExChannel: ; 0x037FCE50
	ldr r3, _037FCE84 ; =0xFFFE9680
	mov r2, #0
	str r3, [r0, #0x10]
	strb r2, [r0, #2]
	str r1, [r0, #0x34]
	strh r2, [r0, #0x30]
	strh r2, [r0, #0x2e]
	ldrb r1, [r0, #3]
	orr r2, r1, #2
	bic r1, r2, #1
	orr r1, r1, #1
	strb r1, [r0, #3]
	bx lr
	.align 2, 0
_037FCE84: .word 0xFFFE9680
	arm_func_end StartExChannel

	arm_func_start SND_SeqInit
SND_SeqInit: ; 0x037FCE88
	stmdb sp!, {r3, lr}
	ldr r3, _037FCEE4 ; =SNDi_Work + 0x540
	mov lr, #0
	mov r0, #0x24
_037FCE98:
	mul r2, lr, r0
	ldrb r1, [r3, r2]
	add ip, r3, r2
	bic r1, r1, #1
	strb r1, [r3, r2]
	strb lr, [ip, #1]
	add lr, lr, #1
	cmp lr, #0x10
	blt _037FCE98
	ldr r1, _037FCEE8 ; =SNDi_Work + 0x780
	mov r2, #0
_037FCEC4:
	ldrb r0, [r1, r2, lsl #6]
	bic r0, r0, #1
	strb r0, [r1, r2, lsl #6]
	add r2, r2, #1
	cmp r2, #0x20
	blt _037FCEC4
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FCEE4: .word SNDi_Work + 0x540
_037FCEE8: .word SNDi_Work + 0x780
	arm_func_end SND_SeqInit

	arm_func_start SND_SeqMain
SND_SeqMain: ; 0x037FCEEC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r6, #0
	mov sb, r0
	mov r5, r6
_037FCEFC:
	mov r0, #0x24
	mul r0, r5, r0
	ldr r2, _037FD044 ; =SNDi_Work + 0x540
	ldrb r1, [r2, r0]
	add r4, r2, r0
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD020
	mov r0, r1, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FD00C
	cmp sb, #0
	beq _037FCFD8
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _037FCFD8
	mov r8, #0
	b _037FCF54
_037FCF44:
	ldrh r0, [r4, #0x1c]
	add r8, r8, #1
	sub r0, r0, #0xf0
	strh r0, [r4, #0x1c]
_037FCF54:
	ldrh r0, [r4, #0x1c]
	cmp r0, #0xf0
	bhs _037FCF44
	mov r7, #0
	mov sl, #1
	b _037FCF90
_037FCF6C:
	mov r0, r4
	mov r1, sl
	bl PlayerSeqMain
	cmp r0, #0
	beq _037FCF8C
	mov r0, r4
	bl FinishPlayer
	b _037FCF98
_037FCF8C:
	add r7, r7, #1
_037FCF90:
	cmp r7, r8
	blt _037FCF6C
_037FCF98:
	ldr r0, _037FD048 ; =SNDi_SharedWork
	ldr r2, [r0]
	cmp r2, #0
	beq _037FCFC0
	ldrb r1, [r4, #1]
	mov r0, #0x24
	mla r2, r1, r0, r2
	ldr r0, [r2, #0x40]
	add r0, r0, r7
	str r0, [r2, #0x40]
_037FCFC0:
	ldrh r2, [r4, #0x18]
	ldrh r1, [r4, #0x1a]
	ldrh r0, [r4, #0x1c]
	mul r1, r2, r1
	add r0, r0, r1, asr #8
	strh r0, [r4, #0x1c]
_037FCFD8:
	mov r8, #0
	mov r7, #1
_037FCFE0:
	mov r0, r4
	mov r1, r8
	bl GetPlayerTrack
	cmp r0, #0
	beq _037FD000
	mov r1, r4
	mov r2, r7
	bl UpdateTrackChannel
_037FD000:
	add r8, r8, #1
	cmp r8, #0x10
	blt _037FCFE0
_037FD00C:
	ldrb r0, [r4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r0, #1
	orrne r6, r6, r0, lsl r5
_037FD020:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FCEFC
	ldr r0, _037FD048 ; =SNDi_SharedWork
	ldr r0, [r0]
	cmp r0, #0
	strne r6, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_037FD044: .word SNDi_Work + 0x540
_037FD048: .word SNDi_SharedWork
	arm_func_end SND_SeqMain

	arm_func_start SND_PrepareSeq
SND_PrepareSeq: ; 0x037FD04C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r0, #0x24
	mul r5, sb, r0
	ldr r6, _037FD21C ; =SNDi_Work + 0x540
	mov r8, r1
	ldrb r0, [r6, r5]
	mov r7, r2
	mov r0, r0, lsl #0x1f
	mov r4, r3
	add r5, r6, r5
	movs r0, r0, lsr #0x1f
	beq _037FD088
	mov r0, r5
	bl FinishPlayer
_037FD088:
	ldrb r1, [r5]
	mov r0, #0x78
	bic r1, r1, #4
	strb r1, [r5]
	str r4, [r5, #0x20]
	strh r0, [r5, #0x18]
	mov r0, #0x100
	strh r0, [r5, #0x1a]
	mov r0, #0xf0
	strh r0, [r5, #0x1c]
	mov r0, #0x7f
	strb r0, [r5, #5]
	mov r2, #0
	strh r2, [r5, #6]
	mov r0, #0x40
	strb r0, [r5, #4]
	mov r1, #0xff
_037FD0CC:
	add r0, r5, r2
	add r2, r2, #1
	strb r1, [r0, #8]
	cmp r2, #0x10
	blt _037FD0CC
	ldr r1, _037FD220 ; =SNDi_SharedWork
	ldr r3, [r1]
	cmp r3, #0
	beq _037FD12C
	ldrb r2, [r5, #1]
	mov r0, #0x24
	mla r0, r2, r0, r3
	mov r6, #0
	str r6, [r0, #0x40]
	mvn r4, #0
	mov r0, #0x24
_037FD10C:
	ldr r2, [r1]
	ldrb r3, [r5, #1]
	mla r2, r3, r0, r2
	add r2, r2, r6, lsl #1
	add r6, r6, #1
	strh r4, [r2, #0x20]
	cmp r6, #0x10
	blt _037FD10C
_037FD12C:
	bl AllocTrack
	movs r4, r0
	bmi _037FD214
	ldr r0, _037FD224 ; =SNDi_Work + 0x780
	add r6, r0, r4, lsl #6
	mov r0, r6
	bl InitTrack
	str r8, [r6, #0x24]
	add r0, r8, r7
	str r0, [r6, #0x28]
	strb r4, [r5, #8]
	ldr r0, [r6, #0x28]
	bl InitCache
	mov r0, r6
	bl ReadByte
	cmp r0, #0xfe
	ldrne r0, [r6, #0x28]
	subne r0, r0, #1
	strne r0, [r6, #0x28]
	bne _037FD1E0
	mov r0, r6
	bl ReadByte
	mov r4, r0
	mov r0, r6
	bl ReadByte
	orr r0, r4, r0, lsl #8
	mov r0, r0, lsl #0x10
	ldr r4, _037FD224 ; =SNDi_Work + 0x780
	mov r8, r0, lsr #0x11
	mov r7, #1
	b _037FD1D8
_037FD1A8:
	tst r8, #1
	beq _037FD1CC
	bl AllocTrack
	movs r6, r0
	bmi _037FD1E0
	add r0, r4, r6, lsl #6
	bl InitTrack
	add r0, r5, r7
	strb r6, [r0, #8]
_037FD1CC:
	mov r0, r8, lsl #0xf
	add r7, r7, #1
	mov r8, r0, lsr #0x10
_037FD1D8:
	cmp r8, #0
	bne _037FD1A8
_037FD1E0:
	ldrb r1, [r5]
	ldr r0, _037FD220 ; =SNDi_SharedWork
	bic r1, r1, #1
	ldr r2, [r0]
	orr r1, r1, #1
	and r0, r1, #0xff
	bic r0, r0, #2
	strb r0, [r5]
	cmp r2, #0
	ldrne r1, [r2, #4]
	movne r0, #1
	orrne r0, r1, r0, lsl sb
	strne r0, [r2, #4]
_037FD214:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FD21C: .word SNDi_Work + 0x540
_037FD220: .word SNDi_SharedWork
_037FD224: .word SNDi_Work + 0x780
	arm_func_end SND_PrepareSeq

	arm_func_start ReadByte
ReadByte: ; 0x037FD228
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _037FD280 ; =sMmlPrintEnable
	mov r5, r0
	ldr r4, [r5, #0x28]
	ldr r0, [r1, #4]
	cmp r4, r0
	blo _037FD250
	ldr r0, [r1, #8]
	cmp r4, r0
	blo _037FD258
_037FD250:
	mov r0, r4
	bl InitCache
_037FD258:
	ldr r0, _037FD280 ; =sMmlPrintEnable
	ldr r1, [r5, #0x28]
	ldr r2, [r0, #4]
	ldr r0, _037FD284 ; =seqCache + 0x8
	sub r2, r4, r2
	ldrb r0, [r0, r2]
	add r1, r1, #1
	str r1, [r5, #0x28]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FD280: .word sMmlPrintEnable
_037FD284: .word seqCache + 0x8
	arm_func_end ReadByte

	arm_func_start SND_StartPreparedSeq
SND_StartPreparedSeq: ; 0x037FD288
	mov r1, #0x24
	mul r1, r0, r1
	ldr r2, _037FD2A4 ; =SNDi_Work + 0x540
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	bx lr
	.align 2, 0
_037FD2A4: .word SNDi_Work + 0x540
	arm_func_end SND_StartPreparedSeq

	arm_func_start SND_StartSeq
SND_StartSeq: ; 0x037FD2A8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl SND_PrepareSeq
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD2D4 ; =SNDi_Work + 0x540
	ldrb r0, [r2, r1]
	orr r0, r0, #2
	strb r0, [r2, r1]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FD2D4: .word SNDi_Work + 0x540
	arm_func_end SND_StartSeq

	arm_func_start SND_StopSeq
SND_StopSeq: ; 0x037FD2D8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x24
	mul r1, r4, r0
	ldr r2, _037FD32C ; =SNDi_Work + 0x540
	ldrb r0, [r2, r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD324
	add r0, r2, r1
	bl FinishPlayer
	ldr r0, _037FD330 ; =SNDi_SharedWork
	ldr r2, [r0]
	cmp r2, #0
	movne r0, #1
	ldrne r1, [r2, #4]
	mvnne r0, r0, lsl r4
	andne r0, r1, r0
	strne r0, [r2, #4]
_037FD324:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FD32C: .word SNDi_Work + 0x540
_037FD330: .word SNDi_SharedWork
	arm_func_end SND_StopSeq

	arm_func_start SND_PauseSeq
SND_PauseSeq: ; 0x037FD334
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r4, r0, r2
	ldr r5, _037FD3A8 ; =SNDi_Work + 0x540
	and r0, r1, #0xff
	ldrb r2, [r5, r4]
	mov r0, r0, lsl #0x1f
	bic r2, r2, #4
	orr r0, r2, r0, lsr #29
	strb r0, [r5, r4]
	cmp r1, #0
	beq _037FD3A0
	mov r8, #0
	mov r6, #0x7f
_037FD36C:
	mov r1, r8
	add r0, r5, r4
	bl GetPlayerTrack
	movs r7, r0
	beq _037FD394
	mov r2, r6
	add r1, r5, r4
	bl ReleaseTrackChannelAll
	mov r0, r7
	bl FreeTrackChannelAll
_037FD394:
	add r8, r8, #1
	cmp r8, #0x10
	blt _037FD36C
_037FD3A0:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD3A8: .word SNDi_Work + 0x540
	arm_func_end SND_PauseSeq

	arm_func_start SND_SkipSeq
SND_SkipSeq: ; 0x037FD3AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, _037FD470 ; =SNDi_Work + 0x540
	mov r2, #0x24
	mla r6, r0, r2, r3
	mov r8, r1
	mov r7, #0
	mov r4, #0x7f
_037FD3C8:
	mov r0, r6
	mov r1, r7
	bl GetPlayerTrack
	movs r5, r0
	beq _037FD3F0
	mov r1, r6
	mov r2, r4
	bl ReleaseTrackChannelAll
	mov r0, r5
	bl FreeTrackChannelAll
_037FD3F0:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FD3C8
	bl SND_StopIntervalTimer
	mov r4, #0
	mov r5, r4
	b _037FD430
_037FD40C:
	mov r0, r6
	mov r1, r5
	bl PlayerSeqMain
	cmp r0, #0
	beq _037FD42C
	mov r0, r6
	bl FinishPlayer
	b _037FD438
_037FD42C:
	add r4, r4, #1
_037FD430:
	cmp r4, r8
	blo _037FD40C
_037FD438:
	bl SND_StartIntervalTimer
	ldr r0, _037FD474 ; =SNDi_SharedWork
	ldr r3, [r0]
	cmp r3, #0
	beq _037FD468
	ldrb r1, [r6, #1]
	mov r0, #0x24
	mul r2, r1, r0
	add r1, r3, #0x40
	ldr r0, [r1, r2]
	add r0, r0, r4
	str r0, [r1, r2]
_037FD468:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD470: .word SNDi_Work + 0x540
_037FD474: .word SNDi_SharedWork
	arm_func_end SND_SkipSeq

	arm_func_start SND_SetTrackMute
SND_SetTrackMute: ; 0x037FD478
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	ldr r5, _037FD4E0 ; =SNDi_Work + 0x540
	mov r8, r1
	mov r7, r2
	mov r6, #0
	b _037FD4C8
_037FD498:
	tst r8, #1
	beq _037FD4C0
	mov r1, r6
	add r0, r5, r4
	bl GetPlayerTrack
	cmp r0, #0
	beq _037FD4C0
	mov r2, r7
	add r1, r5, r4
	bl SetTrackMute
_037FD4C0:
	add r6, r6, #1
	mov r8, r8, lsr #1
_037FD4C8:
	cmp r6, #0x10
	bge _037FD4D8
	cmp r8, #0
	bne _037FD498
_037FD4D8:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD4E0: .word SNDi_Work + 0x540
	arm_func_end SND_SetTrackMute

	arm_func_start SND_SetTrackAllocatableChannel
SND_SetTrackAllocatableChannel: ; 0x037FD4E4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r3, #0x24
	mul r4, r0, r3
	mov r0, r2, lsl #0x10
	ldr r5, _037FD550 ; =SNDi_Work + 0x540
	mov r7, r1
	mov r6, #0
	mov r8, r0, lsr #0x10
	b _037FD538
_037FD508:
	tst r7, #1
	beq _037FD530
	mov r1, r6
	add r0, r5, r4
	bl GetPlayerTrack
	cmp r0, #0
	strneh r8, [r0, #0x1e]
	ldrneb r1, [r0]
	orrne r1, r1, #0x80
	strneb r1, [r0]
_037FD530:
	add r6, r6, #1
	mov r7, r7, lsr #1
_037FD538:
	cmp r6, #0x10
	bge _037FD548
	cmp r7, #0
	bne _037FD508
_037FD548:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD550: .word SNDi_Work + 0x540
	arm_func_end SND_SetTrackAllocatableChannel

	arm_func_start SND_InvalidateSeq
SND_InvalidateSeq: ; 0x037FD554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r6, _037FD5DC ; =SNDi_Work + 0x540
	mov r7, #0
	mov sl, r0
	mov sb, r1
	mov fp, r7
	mov r4, #0x24
_037FD570:
	mul r5, r7, r4
	ldrb r0, [r6, r5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _037FD5C8
	mov r8, fp
	b _037FD5C0
_037FD58C:
	mov r1, r8
	add r0, r6, r5
	bl GetPlayerTrack
	cmp r0, #0
	beq _037FD5BC
	ldr r0, [r0, #0x28]
	cmp sl, r0
	cmpls r0, sb
	bhi _037FD5BC
	add r0, r6, r5
	bl FinishPlayer
	b _037FD5C8
_037FD5BC:
	add r8, r8, #1
_037FD5C0:
	cmp r8, #0x10
	blt _037FD58C
_037FD5C8:
	add r7, r7, #1
	cmp r7, #0x10
	blt _037FD570
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD5DC: .word SNDi_Work + 0x540
	arm_func_end SND_InvalidateSeq

	arm_func_start SND_InvalidateBank
SND_InvalidateBank: ; 0x037FD5E0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _037FD638 ; =SNDi_Work + 0x540
	mov r7, r0
	mov r6, r1
	mov r5, #0
	mov r8, #0x24
_037FD5F8:
	mul r0, r5, r8
	ldrb r1, [r4, r0]
	add r0, r4, r0
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	beq _037FD624
	ldr r1, [r0, #0x20]
	cmp r7, r1
	cmpls r1, r6
	bhi _037FD624
	bl FinishPlayer
_037FD624:
	add r5, r5, #1
	cmp r5, #0x10
	blt _037FD5F8
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FD638: .word SNDi_Work + 0x540
	arm_func_end SND_InvalidateBank

	arm_func_start SNDi_SetPlayerParam
SNDi_SetPlayerParam: ; 0x037FD63C
	stmdb sp!, {r3, lr}
	ldr lr, _037FD67C ; =SNDi_Work + 0x540
	mov ip, #0x24
	mla ip, r0, ip, lr
	cmp r3, #1
	beq _037FD668
	cmp r3, #2
	beq _037FD670
	cmp r3, #4
	streq r2, [ip, r1]
	b _037FD674
_037FD668:
	strb r2, [ip, r1]
	b _037FD674
_037FD670:
	strh r2, [ip, r1]
_037FD674:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FD67C: .word SNDi_Work + 0x540
	arm_func_end SNDi_SetPlayerParam

	arm_func_start SNDi_SetTrackParam
SNDi_SetTrackParam: ; 0x037FD680
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, #0x24
	mul r5, r0, r4
	mov r8, r3
	mov r0, r8, lsl #0x10
	ldr r7, [sp, #0x28]
	mov sl, r1
	mov sb, r2
	mov r6, #0
	mov fp, r0, lsr #0x10
	and r4, r8, #0xff
	b _037FD700
_037FD6B0:
	tst sl, #1
	beq _037FD6F8
	ldr r0, _037FD718 ; =SNDi_Work + 0x540
	mov r1, r6
	add r0, r0, r5
	bl GetPlayerTrack
	cmp r0, #0
	beq _037FD6F8
	cmp r7, #1
	beq _037FD6EC
	cmp r7, #2
	beq _037FD6F4
	cmp r7, #4
	streq r8, [r0, sb]
	b _037FD6F8
_037FD6EC:
	strb r4, [r0, sb]
	b _037FD6F8
_037FD6F4:
	strh fp, [r0, sb]
_037FD6F8:
	add r6, r6, #1
	mov sl, sl, lsr #1
_037FD700:
	cmp r6, #0x10
	bge _037FD710
	cmp sl, #0
	bne _037FD6B0
_037FD710:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FD718: .word SNDi_Work + 0x540
	arm_func_end SNDi_SetTrackParam

	arm_func_start InitCache
InitCache: ; 0x037FD71C
	ldr r1, _037FD754 ; =sMmlPrintEnable
	bic r2, r0, #3
	str r2, [r1, #4]
	add r0, r2, #0x10
	str r0, [r1, #8]
	ldr r0, [r2]
	str r0, [r1, #0xc]
	ldr r0, [r2, #4]
	str r0, [r1, #0x10]
	ldr r0, [r2, #8]
	str r0, [r1, #0x14]
	ldr r0, [r2, #0xc]
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_037FD754: .word sMmlPrintEnable
	arm_func_end InitCache

	arm_func_start Read24
Read24: ; 0x037FD758
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl ReadByte
	mov r4, r0
	mov r0, r5
	bl ReadByte
	orr r4, r4, r0, lsl #8
	mov r0, r5
	bl ReadByte
	orr r0, r4, r0, lsl #16
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end Read24

	arm_func_start ReadArg
ReadArg: ; 0x037FD788
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	mov r6, r1
	cmp r2, #4
	addls pc, pc, r2, lsl #2
	b _037FD87C
_037FD7A0: ; jump table
	b _037FD7B4 ; case 0
	b _037FD7C0 ; case 1
	b _037FD7E0 ; case 2
	b _037FD81C ; case 3
	b _037FD800 ; case 4
_037FD7B4:
	bl ReadByte
	mov r5, r0
	b _037FD87C
_037FD7C0:
	bl ReadByte
	mov r5, r0
	mov r0, r4
	bl ReadByte
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r5, r0, lsr #0x10
	b _037FD87C
_037FD7E0:
	mov r5, #0
_037FD7E4:
	mov r0, r4
	bl ReadByte
	and r1, r0, #0x7f
	tst r0, #0x80
	orr r5, r1, r5, lsl #7
	bne _037FD7E4
	b _037FD87C
_037FD800:
	bl ReadByte
	mov r1, r0
	mov r0, r6
	bl GetVariablePtr
	cmp r0, #0
	ldrnesh r5, [r0]
	b _037FD87C
_037FD81C:
	bl ReadByte
	mov r5, r0
	mov r0, r4
	bl ReadByte
	orr r0, r5, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, r4
	mov r5, r1, lsl #0x10
	bl ReadByte
	mov r6, r0
	mov r0, r4
	bl ReadByte
	orr r0, r6, r0, lsl #8
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	bl SND_CalcRandom
	mov r1, r4, lsl #0x10
	mov r1, r1, asr #0x10
	sub r1, r1, r5, asr #16
	add r1, r1, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	add r5, r0, r5, asr #16
_037FD87C:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end ReadArg

	arm_func_start InitTrack
InitTrack: ; 0x037FD888
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	ldrb r1, [r4]
	mov r2, #0xff
	orr r1, r1, #2
	bic ip, r1, #4
	strb r1, [r4]
	and r1, ip, #0xff
	bic r3, r1, #8
	strb ip, [r4]
	and r1, r3, #0xff
	bic ip, r1, #0x10
	strb r3, [r4]
	and r1, ip, #0xff
	bic r3, r1, #0x20
	and r1, r3, #0xff
	orr r1, r1, #0x40
	strb ip, [r4]
	bic r1, r1, #0x80
	strb r1, [r4]
	strb r0, [r4, #0x3b]
	strh r0, [r4, #2]
	mov r1, #0x40
	strb r1, [r4, #0x12]
	mov r1, #0x7f
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strh r0, [r4, #0xa]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #6]
	strh r0, [r4, #0xc]
	strb r2, [r4, #0xe]
	strb r2, [r4, #0xf]
	strb r2, [r4, #0x10]
	strb r2, [r4, #0x11]
	strb r1, [r4, #1]
	mov r1, #2
	strb r1, [r4, #7]
	mov r1, #0x3c
	strb r1, [r4, #0x14]
	strb r0, [r4, #0x15]
	strh r0, [r4, #0x16]
	strb r0, [r4, #0x13]
	add r0, r2, #0xff00
	strh r0, [r4, #0x1e]
	add r0, r4, #0x18
	bl SND_InitLfoParam
	mov r0, #0
	str r0, [r4, #0x20]
	str r0, [r4, #0x3c]
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end InitTrack

	arm_func_start StartTrack
StartTrack: ; 0x037FD968
	str r1, [r0, #0x24]
	add r1, r1, r2
	str r1, [r0, #0x28]
	bx lr
	arm_func_end StartTrack

	arm_func_start ReleaseTrackChannelAll
ReleaseTrackChannelAll: ; 0x037FD978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r2
	mov r4, r0
	mov r2, #0
	bl UpdateTrackChannel
	ldr r5, [r4, #0x3c]
	and r6, r7, #0xff
	mov r4, #1
	b _037FD9D0
_037FD99C:
	mov r0, r5
	bl SND_IsExChannelActive
	cmp r0, #0
	beq _037FD9CC
	cmp r7, #0
	blt _037FD9C0
	mov r0, r5
	mov r1, r6
	bl SND_SetExChannelRelease
_037FD9C0:
	mov r0, r5
	strb r4, [r5, #0x22]
	bl SND_ReleaseExChannel
_037FD9CC:
	ldr r5, [r5, #0x50]
_037FD9D0:
	cmp r5, #0
	bne _037FD99C
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end ReleaseTrackChannelAll

	arm_func_start FreeTrackChannelAll
FreeTrackChannelAll: ; 0x037FD9E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r4, [r5, #0x3c]
	b _037FD9FC
_037FD9F0:
	mov r0, r4
	bl SND_FreeExChannel
	ldr r4, [r4, #0x50]
_037FD9FC:
	cmp r4, #0
	bne _037FD9F0
	mov r0, #0
	str r0, [r5, #0x3c]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end FreeTrackChannelAll

	arm_func_start GetPlayerTrack
GetPlayerTrack: ; 0x037FDA14
	cmp r1, #0xf
	movgt r0, #0
	bxgt lr
	add r0, r0, r1
	ldrb r1, [r0, #8]
	cmp r1, #0xff
	moveq r0, #0
	ldrne r0, _037FDA3C ; =SNDi_Work + 0x780
	addne r0, r0, r1, lsl #6
	bx lr
	.align 2, 0
_037FDA3C: .word SNDi_Work + 0x780
	arm_func_end GetPlayerTrack

	arm_func_start ClosePlayerTrack
ClosePlayerTrack: ; 0x037FDA40
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r1
	bl GetPlayerTrack
	movs r5, r0
	beq _037FDA8C
	mov r1, r6
	mvn r2, #0
	bl ReleaseTrackChannelAll
	mov r0, r5
	bl FreeTrackChannelAll
	add ip, r6, #8
	ldrb r2, [ip, r4]
	ldr r3, _037FDA94 ; =SNDi_Work + 0x780
	mov r0, #0xff
	ldrb r1, [r3, r2, lsl #6]
	bic r1, r1, #1
	strb r1, [r3, r2, lsl #6]
	strb r0, [ip, r4]
_037FDA8C:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FDA94: .word SNDi_Work + 0x780
	arm_func_end ClosePlayerTrack

	arm_func_start FinishPlayer
FinishPlayer: ; 0x037FDA98
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, #0
_037FDAA4:
	mov r0, r5
	mov r1, r4
	bl ClosePlayerTrack
	add r4, r4, #1
	cmp r4, #0x10
	blt _037FDAA4
	ldrb r0, [r5]
	bic r0, r0, #1
	strb r0, [r5]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end FinishPlayer

	arm_func_start ChannelCallback
ChannelCallback: ; 0x037FDAD0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	cmp r1, #1
	bne _037FDAF0
	mov r1, #0
	strb r1, [r5, #0x22]
	bl SND_FreeExChannel
_037FDAF0:
	ldr r1, [r4, #0x3c]
	cmp r1, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r4, #0x3c]
	beq _037FDB28
	b _037FDB1C
_037FDB08:
	cmp r0, r5
	ldreq r0, [r5, #0x50]
	streq r0, [r1, #0x50]
	beq _037FDB28
	mov r1, r0
_037FDB1C:
	ldr r0, [r1, #0x50]
	cmp r0, #0
	bne _037FDB08
_037FDB28:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end ChannelCallback

	arm_func_start UpdateTrackChannel
UpdateTrackChannel: ; 0x037FDB30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r0, [sl, #7]
	ldrb r6, [sl, #4]
	ldrb r3, [sl, #5]
	ldrb fp, [r1, #5]
	mov r5, r0, lsl #6
	mov r8, r3, lsl #1
	ldrb r4, [sl, #1]
	ldrsb r7, [sl, #6]
	mov sb, r6, lsl #1
	ldr r0, _037FDC84 ; =SNDi_DecibelTable
	mul r6, r7, r5
	mov r3, fp, lsl #1
	ldrsh sb, [r0, sb]
	ldrsh r7, [r0, r8]
	ldrsh r0, [r0, r3]
	add r8, sb, r7
	ldrsb r3, [sl, #8]
	cmp r4, #0x7f
	mulne r4, r3, r4
	addne r3, r4, #0x40
	mov r4, #0x8000
	ldrsh r5, [sl, #0xc]
	mov sb, r2
	add r2, r5, r6, asr #7
	ldrsh r7, [sl, #0xa]
	ldrsh r1, [r1, #6]
	ldrsb r5, [sl, #9]
	movne r3, r3, asr #7
	add r0, r0, r8
	rsb r4, r4, #0
	cmp r0, r4
	movlt r0, r4
	mov r4, #0x8000
	add r1, r7, r1
	rsb r4, r4, #0
	cmp r1, r4
	movlt r1, r4
	add r3, r3, r5
	mvn r4, #0x7f
	cmp r3, r4
	movlt r3, r4
	blt _037FDBE8
	cmp r3, #0x7f
	movgt r3, #0x7f
_037FDBE8:
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x18
	mov r1, r1, lsl #0x10
	ldr r8, [sl, #0x3c]
	mov r6, r0, asr #0x10
	mov r5, r2, asr #0x10
	mov r4, r3, asr #0x18
	mov r7, r1, asr #0x10
	mov fp, #1
	b _037FDC74
_037FDC14:
	strh r7, [r8, #6]
	ldrb r0, [r8, #2]
	cmp r0, #3
	beq _037FDC70
	strh r6, [r8, #0xc]
	strh r5, [r8, #0xe]
	strb r4, [r8, #0xb]
	ldrb r0, [sl, #1]
	strb r0, [r8, #4]
	ldrh r0, [sl, #0x18]
	strh r0, [r8, #0x28]
	ldrh r0, [sl, #0x1a]
	strh r0, [r8, #0x2a]
	ldrh r0, [sl, #0x1c]
	strh r0, [r8, #0x2c]
	ldr r0, [r8, #0x34]
	cmp r0, #0
	bne _037FDC70
	cmp sb, #0
	beq _037FDC70
	mov r0, r8
	strb fp, [r8, #0x22]
	bl SND_ReleaseExChannel
_037FDC70:
	ldr r8, [r8, #0x50]
_037FDC74:
	cmp r8, #0
	bne _037FDC14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FDC84: .word SNDi_DecibelTable
	arm_func_end UpdateTrackChannel

	arm_func_start PlayerSeqMain
PlayerSeqMain: ; 0x037FDC88
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r2, #0
	str r2, [sp, #0x10]
	str r1, [sp, #8]
	mov r7, r0
	mov sl, r2
_037FDCA4:
	mov r0, r7
	mov r1, sl
	bl GetPlayerTrack
	movs r8, r0
	ldrne r0, [r8, #0x28]
	cmpne r0, #0
	beq _037FE7A4
	ldr r0, [r8, #0x3c]
	b _037FDD00
_037FDCC8:
	ldr r1, [r0, #0x34]
	cmp r1, #0
	subgt r1, r1, #1
	strgt r1, [r0, #0x34]
	ldrb r1, [r0, #3]
	mov r1, r1, lsl #0x1d
	movs r1, r1, lsr #0x1f
	bne _037FDCFC
	ldr r2, [r0, #0x14]
	ldr r1, [r0, #0x18]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #0x14]
_037FDCFC:
	ldr r0, [r0, #0x50]
_037FDD00:
	cmp r0, #0
	bne _037FDCC8
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _037FDD30
	ldr r0, [r8, #0x3c]
	cmp r0, #0
	movne r0, #0
	bne _037FE788
	bic r0, r1, #0x10
	strb r0, [r8]
_037FDD30:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	subgt r0, r0, #1
	strgt r0, [r8, #0x20]
	cmpgt r0, #0
	movgt r0, #0
	bgt _037FE788
	ldr r0, [r8, #0x28]
	bl InitCache
	ldr r0, _037FE7CC ; =0x0000FFFF
	sub fp, r0, #0x10000
	b _037FE768
_037FDD60:
	mov r0, r8
	mov sb, #0
	mov r4, #1
	bl ReadByte
	mov r6, r0
	cmp r6, #0xa2
	bne _037FDD94
	mov r0, r8
	bl ReadByte
	mov r6, r0
	ldrb r0, [r8]
	mov r0, r0, lsl #0x19
	mov r4, r0, lsr #0x1f
_037FDD94:
	cmp r6, #0xa0
	bne _037FDDB0
	mov r0, r8
	bl ReadByte
	mov r6, r0
	mov r5, #3
	mov sb, #1
_037FDDB0:
	cmp r6, #0xa1
	bne _037FDDCC
	mov r0, r8
	bl ReadByte
	mov r6, r0
	mov r5, #4
	mov sb, #1
_037FDDCC:
	tst r6, #0x80
	bne _037FE050
	mov r0, r8
	bl ReadByte
	cmp sb, #0
	str r0, [sp, #0xc]
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl ReadArg
	cmp r4, #0
	mov r4, r0
	ldrsb r0, [r8, #0x13]
	add sb, r6, r0
	beq _037FE768
	cmp sb, #0
	movlt sb, #0
	blt _037FDE20
	cmp sb, #0x7f
	movgt sb, #0x7f
_037FDE20:
	ldrb r1, [r8]
	mov r0, r1, lsl #0x1d
	movs r0, r0, lsr #0x1f
	bne _037FE024
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _037FE024
	mov r0, r1, lsl #0x1c
	mov r6, #0
	movs r0, r0, lsr #0x1f
	ldrne r6, [r8, #0x3c]
	cmpne r6, #0
	strneb sb, [r6, #8]
	ldrne r0, [sp, #0xc]
	strneb r0, [r6, #9]
	cmp r6, #0
	bne _037FDF54
	ldr r0, [r7, #0x20]
	ldrh r1, [r8, #2]
	mov r2, sb
	add r3, sp, #0x16
	bl SND_ReadInstData
	cmp r0, #0
	beq _037FE024
	ldrb r0, [sp, #0x16]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _037FE024
_037FDE90: ; jump table
	b _037FE024 ; case 0
	b _037FDEA4 ; case 1
	b _037FDEAC ; case 2
	b _037FDEB4 ; case 3
	b _037FDEA4 ; case 4
_037FDEA4:
	ldr r1, _037FE7CC ; =0x0000FFFF
	b _037FDEB8
_037FDEAC:
	mov r1, #0x3f00
	b _037FDEB8
_037FDEB4:
	mov r1, #0xc000
_037FDEB8:
	ldrh r0, [r8, #0x1e]
	ldr r3, _037FE7D0 ; =ChannelCallback
	str r8, [sp]
	ldrb r2, [r8]
	and r0, r1, r0
	mov r2, r2, lsl #0x18
	ldrb r6, [r7, #4]
	ldrb r1, [r8, #0x12]
	mov r2, r2, lsr #0x1f
	add r1, r6, r1
	bl SND_AllocExChannel
	movs r6, r0
	beq _037FE024
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1c
	movs r0, r0, lsr #0x1f
	movne r3, fp
	bne _037FDF0C
	cmp r4, #0
	movgt r3, r4
	movle r3, fp
_037FDF0C:
	ldr r2, [sp, #0xc]
	ldr r1, [r7, #0x20]
	mov r0, r6
	str r1, [sp]
	add r1, sp, #0x16
	str r1, [sp, #4]
	mov r1, sb
	bl SND_NoteOn
	cmp r0, #0
	bne _037FDF48
	mov r0, #0
	strb r0, [r6, #0x22]
	mov r0, r6
	bl SND_FreeExChannel
	b _037FE024
_037FDF48:
	ldr r0, [r8, #0x3c]
	str r0, [r6, #0x50]
	str r6, [r8, #0x3c]
_037FDF54:
	ldrb r1, [r8, #0xe]
	cmp r1, #0xff
	beq _037FDF68
	mov r0, r6
	bl SND_SetExChannelAttack
_037FDF68:
	ldrb r1, [r8, #0xf]
	cmp r1, #0xff
	beq _037FDF7C
	mov r0, r6
	bl SND_SetExChannelDecay
_037FDF7C:
	ldrb r1, [r8, #0x10]
	cmp r1, #0xff
	beq _037FDF90
	mov r0, r6
	bl SND_SetExChannelSustain
_037FDF90:
	ldrb r1, [r8, #0x11]
	cmp r1, #0xff
	beq _037FDFA4
	mov r0, r6
	bl SND_SetExChannelRelease
_037FDFA4:
	ldrsh r0, [r8, #0x16]
	strh r0, [r6, #0x32]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _037FDFD4
	ldrsh r1, [r6, #0x32]
	ldrb r0, [r8, #0x14]
	sub r0, r0, sb
	mov r0, r0, lsl #0x16
	add r0, r1, r0, asr #16
	strh r0, [r6, #0x32]
_037FDFD4:
	ldrb r0, [r8, #0x15]
	cmp r0, #0
	bne _037FE000
	cmp r4, #0
	movgt r0, r4
	movle r0, fp
	str r0, [r6, #0x18]
	ldrb r0, [r6, #3]
	bic r0, r0, #4
	strb r0, [r6, #3]
	b _037FE01C
_037FE000:
	mul r1, r0, r0
	ldrsh r0, [r6, #0x32]
	cmp r0, #0
	rsblt r0, r0, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xb
	str r0, [r6, #0x18]
_037FE01C:
	mov r0, #0
	str r0, [r6, #0x14]
_037FE024:
	strb sb, [r8, #0x14]
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	beq _037FE768
	str r4, [r8, #0x20]
	cmp r4, #0
	ldreqb r0, [r8]
	orreq r0, r0, #0x10
	streqb r0, [r8]
	b _037FE768
_037FE050:
	and r0, r6, #0xf0
	cmp r0, #0xc0
	bgt _037FE084
	bge _037FE1CC
	cmp r0, #0x90
	bgt _037FE078
	bge _037FE0F0
	cmp r0, #0x80
	beq _037FE0A8
	b _037FE768
_037FE078:
	cmp r0, #0xb0
	beq _037FE47C
	b _037FE768
_037FE084:
	cmp r0, #0xe0
	bgt _037FE09C
	bge _037FE428
	cmp r0, #0xd0
	beq _037FE1CC
	b _037FE768
_037FE09C:
	cmp r0, #0xf0
	beq _037FE6C4
	b _037FE768
_037FE0A8:
	cmp sb, #0
	movne r2, r5
	moveq r2, #2
	mov r0, r8
	mov r1, r7
	bl ReadArg
	cmp r4, #0
	beq _037FE768
	cmp r6, #0x80
	beq _037FE0DC
	cmp r6, #0x81
	beq _037FE0E4
	b _037FE768
_037FE0DC:
	str r0, [r8, #0x20]
	b _037FE768
_037FE0E4:
	cmp r0, #0x10000
	strlth r0, [r8, #2]
	b _037FE768
_037FE0F0:
	cmp r6, #0x93
	beq _037FE10C
	cmp r6, #0x94
	beq _037FE16C
	cmp r6, #0x95
	beq _037FE188
	b _037FE768
_037FE10C:
	mov r0, r8
	bl ReadByte
	mov r6, r0
	mov r0, r8
	bl Read24
	cmp r4, #0
	mov sb, r0
	beq _037FE768
	mov r1, r6
	mov r0, r7
	bl GetPlayerTrack
	movs r4, r0
	cmpne r4, r8
	beq _037FE768
	mov r1, r7
	mov r2, fp
	bl ReleaseTrackChannelAll
	mov r0, r4
	bl FreeTrackChannelAll
	mov r0, r4
	mov r2, sb
	ldr r1, [r8, #0x24]
	bl StartTrack
	b _037FE768
_037FE16C:
	mov r0, r8
	bl Read24
	cmp r4, #0
	ldrne r1, [r8, #0x24]
	addne r0, r1, r0
	strne r0, [r8, #0x28]
	b _037FE768
_037FE188:
	mov r0, r8
	bl Read24
	cmp r4, #0
	beq _037FE768
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _037FE768
	add r1, r8, r1, lsl #2
	ldr r2, [r8, #0x28]
	str r2, [r1, #0x2c]
	ldrb r1, [r8, #0x3b]
	add r1, r1, #1
	strb r1, [r8, #0x3b]
	ldr r1, [r8, #0x24]
	add r0, r1, r0
	str r0, [r8, #0x28]
	b _037FE768
_037FE1CC:
	cmp sb, #0
	movne r2, r5
	moveq r2, #0
	mov r0, r8
	mov r1, r7
	bl ReadArg
	cmp r4, #0
	strb r0, [sp, #0x14]
	beq _037FE768
	sub r1, r6, #0xc0
	cmp r1, #0x17
	addls pc, pc, r1, lsl #2
	b _037FE768
_037FE200: ; jump table
	b _037FE3F8 ; case 0
	b _037FE260 ; case 1
	b _037FE278 ; case 2
	b _037FE3E0 ; case 3
	b _037FE3EC ; case 4
	b _037FE284 ; case 5
	b _037FE290 ; case 6
	b _037FE29C ; case 7
	b _037FE35C ; case 8
	b _037FE3A4 ; case 9
	b _037FE2C4 ; case 10
	b _037FE2D0 ; case 11
	b _037FE2DC ; case 12
	b _037FE2E8 ; case 13
	b _037FE3C4 ; case 14
	b _037FE2B8 ; case 15
	b _037FE2F4 ; case 16
	b _037FE300 ; case 17
	b _037FE30C ; case 18
	b _037FE318 ; case 19
	b _037FE324 ; case 20
	b _037FE26C ; case 21
	b _037FE408 ; case 22
	b _037FE390 ; case 23
_037FE260:
	and r0, r0, #0xff
	strb r0, [r8, #4]
	b _037FE768
_037FE26C:
	and r0, r0, #0xff
	strb r0, [r8, #5]
	b _037FE768
_037FE278:
	and r0, r0, #0xff
	strb r0, [r7, #5]
	b _037FE768
_037FE284:
	and r0, r0, #0xff
	strb r0, [r8, #7]
	b _037FE768
_037FE290:
	and r0, r0, #0xff
	strb r0, [r8, #0x12]
	b _037FE768
_037FE29C:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #2
	orr r0, r1, r0, lsr #30
	strb r0, [r8]
	b _037FE768
_037FE2B8:
	and r0, r0, #0xff
	strb r0, [r8, #0x15]
	b _037FE768
_037FE2C4:
	and r0, r0, #0xff
	strb r0, [r8, #0x1a]
	b _037FE768
_037FE2D0:
	and r0, r0, #0xff
	strb r0, [r8, #0x19]
	b _037FE768
_037FE2DC:
	and r0, r0, #0xff
	strb r0, [r8, #0x18]
	b _037FE768
_037FE2E8:
	and r0, r0, #0xff
	strb r0, [r8, #0x1b]
	b _037FE768
_037FE2F4:
	and r0, r0, #0xff
	strb r0, [r8, #0xe]
	b _037FE768
_037FE300:
	and r0, r0, #0xff
	strb r0, [r8, #0xf]
	b _037FE768
_037FE30C:
	and r0, r0, #0xff
	strb r0, [r8, #0x10]
	b _037FE768
_037FE318:
	and r0, r0, #0xff
	strb r0, [r8, #0x11]
	b _037FE768
_037FE324:
	ldrb r1, [r8, #0x3b]
	cmp r1, #3
	bhs _037FE768
	add r2, r8, r1, lsl #2
	and r1, r0, #0xff
	ldr r0, [r8, #0x28]
	str r0, [r2, #0x2c]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0
	strb r1, [r0, #0x38]
	ldrb r0, [r8, #0x3b]
	add r0, r0, #1
	strb r0, [r8, #0x3b]
	b _037FE768
_037FE35C:
	and r0, r0, #0xff
	mov r1, r0, lsl #0x1f
	ldrb r2, [r8]
	mov r0, r8
	bic r2, r2, #8
	orr r1, r2, r1, lsr #28
	strb r1, [r8]
	mov r1, r7
	mov r2, fp
	bl ReleaseTrackChannelAll
	mov r0, r8
	bl FreeTrackChannelAll
	b _037FE768
_037FE390:
	and r2, r0, #0xff
	mov r0, r8
	mov r1, r7
	bl SetTrackMute
	b _037FE768
_037FE3A4:
	and r1, r0, #0xff
	ldrsb r0, [r8, #0x13]
	add r0, r1, r0
	strb r0, [r8, #0x14]
	ldrb r0, [r8]
	orr r0, r0, #0x20
	strb r0, [r8]
	b _037FE768
_037FE3C4:
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	ldrb r1, [r8]
	bic r1, r1, #0x20
	orr r0, r1, r0, lsr #26
	strb r0, [r8]
	b _037FE768
_037FE3E0:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #0x13]
	b _037FE768
_037FE3EC:
	ldrsb r0, [sp, #0x14]
	strb r0, [r8, #6]
	b _037FE768
_037FE3F8:
	and r0, r0, #0xff
	sub r0, r0, #0x40
	strb r0, [r8, #8]
	b _037FE768
_037FE408:
	ldr r1, _037FE7D4 ; =sMmlPrintEnable
	ldr r1, [r1]
	cmp r1, #0
	beq _037FE768
	and r1, r0, #0xff
	mov r0, r7
	bl GetVariablePtr
	b _037FE768
_037FE428:
	cmp sb, #0
	movne r2, r5
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl ReadArg
	mov r0, r0, lsl #0x10
	cmp r4, #0
	mov r0, r0, asr #0x10
	beq _037FE768
	cmp r6, #0xe0
	beq _037FE474
	cmp r6, #0xe1
	beq _037FE46C
	cmp r6, #0xe3
	streqh r0, [r8, #0x16]
	b _037FE768
_037FE46C:
	strh r0, [r7, #0x18]
	b _037FE768
_037FE474:
	strh r0, [r8, #0x1c]
	b _037FE768
_037FE47C:
	mov r0, r8
	bl ReadByte
	cmp sb, #0
	movne r2, r5
	mov sb, r0
	moveq r2, #1
	mov r0, r8
	mov r1, r7
	bl ReadArg
	mov r0, r0, lsl #0x10
	mov r1, sb
	mov sb, r0, asr #0x10
	mov r0, r7
	bl GetVariablePtr
	cmp r4, #0
	mov r4, r0
	cmpne r4, #0
	beq _037FE768
	sub r0, r6, #0xb0
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _037FE768
_037FE4D4: ; jump table
	b _037FE50C ; case 0
	b _037FE514 ; case 1
	b _037FE524 ; case 2
	b _037FE534 ; case 3
	b _037FE544 ; case 4
	b _037FE560 ; case 5
	b _037FE584 ; case 6
	b _037FE768 ; case 7
	b _037FE5BC ; case 8
	b _037FE5E8 ; case 9
	b _037FE614 ; case 10
	b _037FE640 ; case 11
	b _037FE66C ; case 12
	b _037FE698 ; case 13
_037FE50C:
	strh sb, [r4]
	b _037FE768
_037FE514:
	ldrsh r0, [r4]
	add r0, r0, sb
	strh r0, [r4]
	b _037FE768
_037FE524:
	ldrsh r0, [r4]
	sub r0, r0, sb
	strh r0, [r4]
	b _037FE768
_037FE534:
	ldrsh r0, [r4]
	mul r1, r0, sb
	strh r1, [r4]
	b _037FE768
_037FE544:
	cmp sb, #0
	beq _037FE768
	mov r1, sb
	ldrsh r0, [r4]
	bl _s32_div_f
	strh r0, [r4]
	b _037FE768
_037FE560:
	cmp sb, #0
	ldrgesh r0, [r4]
	movge r0, r0, lsl sb
	strgeh r0, [r4]
	ldrltsh r1, [r4]
	rsblt r0, sb, #0
	movlt r0, r1, asr r0
	strlth r0, [r4]
	b _037FE768
_037FE584:
	cmp sb, #0
	rsblt r0, sb, #0
	movlt r0, r0, lsl #0x10
	mov r6, #0
	movlt sb, r0, asr #0x10
	movlt r6, #1
	bl SND_CalcRandom
	add r1, sb, #1
	mul r1, r0, r1
	mov r0, r1, asr #0x10
	cmp r6, #0
	rsbne r0, r0, #0
	strh r0, [r4]
	b _037FE768
_037FE5BC:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	moveq r0, #1
	movne r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE5E8:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movge r0, #1
	movlt r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE614:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movgt r0, #1
	movle r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE640:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movle r0, #1
	movgt r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE66C:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movlt r0, #1
	movge r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE698:
	ldrsh r0, [r4]
	ldrb r1, [r8]
	cmp r0, sb
	movne r0, #1
	moveq r0, #0
	and r0, r0, #0xff
	mov r0, r0, lsl #0x1f
	bic r1, r1, #0x40
	orr r0, r1, r0, lsr #25
	strb r0, [r8]
	b _037FE768
_037FE6C4:
	cmp r4, #0
	beq _037FE768
	sub r0, r6, #0xfc
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _037FE768
_037FE6DC: ; jump table
	b _037FE714 ; case 0
	b _037FE6EC ; case 1
	b _037FE768 ; case 2
	b _037FE760 ; case 3
_037FE6EC:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _037FE768
	sub r0, r0, #1
	strb r0, [r8, #0x3b]
	and r0, r0, #0xff
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x2c]
	str r0, [r8, #0x28]
	b _037FE768
_037FE714:
	ldrb r0, [r8, #0x3b]
	cmp r0, #0
	beq _037FE768
	add r1, r8, r0
	ldrb r0, [r1, #0x37]
	cmp r0, #0
	beq _037FE748
	sub r0, r0, #1
	ands r0, r0, #0xff
	ldreqb r0, [r8, #0x3b]
	subeq r0, r0, #1
	streqb r0, [r8, #0x3b]
	beq _037FE768
_037FE748:
	strb r0, [r1, #0x37]
	ldrb r0, [r8, #0x3b]
	add r0, r8, r0, lsl #2
	ldr r0, [r0, #0x28]
	str r0, [r8, #0x28]
	b _037FE768
_037FE760:
	mvn r0, #0
	b _037FE788
_037FE768:
	ldr r0, [r8, #0x20]
	cmp r0, #0
	bne _037FE784
	ldrb r0, [r8]
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	beq _037FDD60
_037FE784:
	mov r0, #0
_037FE788:
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x10]
	beq _037FE7A4
	mov r0, r7
	mov r1, sl
	bl ClosePlayerTrack
_037FE7A4:
	add sl, sl, #1
	cmp sl, #0x10
	blt _037FDCA4
	ldr r0, [sp, #0x10]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FE7CC: .word 0x0000FFFF
_037FE7D0: .word ChannelCallback
_037FE7D4: .word sMmlPrintEnable
	arm_func_end PlayerSeqMain

	arm_func_start GetVariablePtr
GetVariablePtr: ; 0x037FE7D8
	ldr r2, _037FE818 ; =SNDi_SharedWork
	ldr r3, [r2]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r1, #0x10
	addge r2, r3, #0x260
	subge r0, r1, #0x10
	addge r0, r2, r0, lsl #1
	bxge lr
	ldrb r2, [r0, #1]
	add r3, r3, #0x20
	mov r0, #0x24
	mla r0, r2, r0, r3
	add r0, r0, r1, lsl #1
	bx lr
	.align 2, 0
_037FE818: .word SNDi_SharedWork
	arm_func_end GetVariablePtr

	arm_func_start AllocTrack
AllocTrack: ; 0x037FE81C
	ldr ip, _037FE85C ; =SNDi_Work + 0x780
	mov r0, #0
	b _037FE84C
_037FE828:
	ldrb r1, [ip, r0, lsl #6]
	mov r3, r0, lsl #6
	mov r2, r1, lsl #0x1f
	movs r2, r2, lsr #0x1f
	biceq r1, r1, #1
	orreq r1, r1, #1
	streqb r1, [ip, r3]
	bxeq lr
	add r0, r0, #1
_037FE84C:
	cmp r0, #0x20
	blt _037FE828
	mvn r0, #0
	bx lr
	.align 2, 0
_037FE85C: .word SNDi_Work + 0x780
	arm_func_end AllocTrack

	arm_func_start SetTrackMute
SetTrackMute: ; 0x037FE860
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r2, #3
	addls pc, pc, r2, lsl #2
	b _037FE8D8
_037FE874: ; jump table
	b _037FE884 ; case 0
	b _037FE894 ; case 1
	b _037FE8A4 ; case 2
	b _037FE8BC ; case 3
_037FE884:
	ldrb r0, [r4]
	bic r0, r0, #4
	strb r0, [r4]
	b _037FE8D8
_037FE894:
	ldrb r0, [r4]
	orr r0, r0, #4
	strb r0, [r4]
	b _037FE8D8
_037FE8A4:
	ldrb r3, [r4]
	mvn r2, #0
	orr r3, r3, #4
	strb r3, [r4]
	bl ReleaseTrackChannelAll
	b _037FE8D8
_037FE8BC:
	ldrb r3, [r4]
	mov r2, #0x7f
	orr r3, r3, #4
	strb r3, [r4]
	bl ReleaseTrackChannelAll
	mov r0, r4
	bl FreeTrackChannelAll
_037FE8D8:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end SetTrackMute

	arm_func_start SND_ReadInstData
SND_ReadInstData: ; 0x037FE8E0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r1
	mov r6, r0
	mov r5, r2
	mov r4, r3
	movmi r0, #0
	bmi _037FEA58
	bl SNDi_LockMutex
	ldr r0, [r6, #0x38]
	cmp r7, r0
	blo _037FE918
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FE918:
	add r0, r6, r7, lsl #2
	ldr r1, [r0, #0x3c]
	and r0, r1, #0xff
	strb r1, [r4]
	cmp r0, #0x11
	mov r1, r1, lsr #8
	addls pc, pc, r0, lsl #2
	b _037FEA44
_037FE938: ; jump table
	b _037FEA44 ; case 0
	b _037FE980 ; case 1
	b _037FE980 ; case 2
	b _037FE980 ; case 3
	b _037FE980 ; case 4
	b _037FE980 ; case 5
	b _037FEA44 ; case 6
	b _037FEA44 ; case 7
	b _037FEA44 ; case 8
	b _037FEA44 ; case 9
	b _037FEA44 ; case 10
	b _037FEA44 ; case 11
	b _037FEA44 ; case 12
	b _037FEA44 ; case 13
	b _037FEA44 ; case 14
	b _037FEA44 ; case 15
	b _037FE9A0 ; case 16
	b _037FE9F0 ; case 17
_037FE980:
	add r3, r6, r1
	add r2, r4, #2
	mov r1, #5
_037FE98C:
	ldrh r0, [r3], #2
	subs r1, r1, #1
	strh r0, [r2], #2
	bne _037FE98C
	b _037FEA50
_037FE9A0:
	ldrb r0, [r6, r1]
	add r2, r6, r1
	ldrb r1, [r2, #1]
	cmp r5, r0
	blt _037FE9BC
	cmp r5, r1
	ble _037FE9C8
_037FE9BC:
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FE9C8:
	sub r1, r5, r0
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #2
	mov r1, #6
_037FE9DC:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _037FE9DC
	b _037FEA50
_037FE9F0:
	add r2, r6, r1
	mov r1, #0
	b _037FEA14
_037FE9FC:
	add r1, r1, #1
	cmp r1, #8
	blt _037FEA14
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FEA14:
	ldrb r0, [r2, r1]
	cmp r5, r0
	bgt _037FE9FC
	mov r0, #0xc
	mla r0, r1, r0, r2
	add r2, r0, #8
	mov r1, #6
_037FEA30:
	ldrh r0, [r2], #2
	subs r1, r1, #1
	strh r0, [r4], #2
	bne _037FEA30
	b _037FEA50
_037FEA44:
	bl SNDi_UnlockMutex
	mov r0, #0
	b _037FEA58
_037FEA50:
	bl SNDi_UnlockMutex
	mov r0, #1
_037FEA58:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end SND_ReadInstData

	arm_func_start SND_GetWaveDataAddress
SND_GetWaveDataAddress: ; 0x037FEA60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl SNDi_LockMutex
	add r0, r5, r4, lsl #2
	ldr r4, [r0, #0x3c]
	cmp r4, #0
	beq _037FEA8C
	cmp r4, #0x2000000
	addlo r4, r5, r4
	b _037FEA90
_037FEA8C:
	mov r4, #0
_037FEA90:
	bl SNDi_UnlockMutex
	mov r0, r4
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end SND_GetWaveDataAddress

	arm_func_start SND_NoteOn
SND_NoteOn: ; 0x037FEAA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, [sp, #0x24]
	mov sb, r0
	ldrb r4, [r5, #0xa]
	ldrb r0, [r5]
	cmp r4, #0xff
	mov r6, r3
	mov r8, r1
	mov r7, r2
	mvneq r6, #0
	moveq r4, #0
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _037FEB80
_037FEAD8: ; jump table
	b _037FEB80 ; case 0
	b _037FEAEC ; case 1
	b _037FEB5C ; case 2
	b _037FEB70 ; case 3
	b _037FEAEC ; case 4
_037FEAEC:
	cmp r0, #1
	bne _037FEB30
	ldr r2, [sp, #0x20]
	ldrh r0, [r5, #4]
	ldrh r1, [r5, #2]
	add r0, r2, r0, lsl #3
	ldr r0, [r0, #0x18]
	cmp r0, #0
	moveq r1, #0
	beq _037FEB3C
	ldr r2, [r0, #0x38]
	cmp r1, r2
	movhs r1, #0
	bhs _037FEB3C
	bl SND_GetWaveDataAddress
	mov r1, r0
	b _037FEB3C
_037FEB30:
	ldrh r1, [r5, #4]
	ldrh r0, [r5, #2]
	orr r1, r0, r1, lsl #16
_037FEB3C:
	cmp r1, #0
	moveq r0, #0
	beq _037FEB84
	mov r0, sb
	mov r3, r6
	add r2, r1, #0xc
	bl SND_StartExChannelPcm
	b _037FEB84
_037FEB5C:
	ldrh r1, [r5, #2]
	mov r0, sb
	mov r2, r6
	bl SND_StartExChannelPsg
	b _037FEB84
_037FEB70:
	mov r0, sb
	mov r1, r6
	bl SND_StartExChannelNoise
	b _037FEB84
_037FEB80:
	mov r0, #0
_037FEB84:
	cmp r0, #0
	moveq r0, #0
	beq _037FEBE0
	strb r8, [sb, #8]
	ldrb r1, [r5, #6]
	mov r0, sb
	strb r1, [sb, #5]
	strb r7, [sb, #9]
	ldrb r1, [r5, #7]
	bl SND_SetExChannelAttack
	ldrb r1, [r5, #8]
	mov r0, sb
	bl SND_SetExChannelDecay
	ldrb r1, [r5, #9]
	mov r0, sb
	bl SND_SetExChannelSustain
	mov r0, sb
	mov r1, r4
	bl SND_SetExChannelRelease
	ldrb r1, [r5, #0xb]
	mov r0, #1
	sub r1, r1, #0x40
	strb r1, [sb, #0xa]
_037FEBE0:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	arm_func_end SND_NoteOn

	arm_func_start SND_SetPlayerLocalVariable
SND_SetPlayerLocalVariable: ; 0x037FEBE8
	ldr ip, _037FEC04 ; =SNDi_SharedWork
	mov r3, #0x24
	ldr ip, [ip]
	mla r3, r0, r3, ip
	add r0, r3, r1, lsl #1
	strh r2, [r0, #0x20]
	bx lr
	.align 2, 0
_037FEC04: .word SNDi_SharedWork
	arm_func_end SND_SetPlayerLocalVariable

	arm_func_start SND_SetPlayerGlobalVariable
SND_SetPlayerGlobalVariable: ; 0x037FEC08
	ldr r2, _037FEC20 ; =SNDi_SharedWork
	ldr r2, [r2]
	add r0, r2, r0, lsl #1
	add r0, r0, #0x200
	strh r1, [r0, #0x60]
	bx lr
	.align 2, 0
_037FEC20: .word SNDi_SharedWork
	arm_func_end SND_SetPlayerGlobalVariable

	arm_func_start SND_UpdateSharedWork
SND_UpdateSharedWork: ; 0x037FEC24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _037FECB8 ; =SNDi_SharedWork
	mov r4, #0
	ldr r0, [r0]
	mov r5, r4
	cmp r0, #0
	beq _037FECB0
	mov r7, r4
	mov r6, #1
_037FEC48:
	mov r0, r7
	bl SND_IsChannelActive
	cmp r0, #0
	orrne r0, r4, r6, lsl r7
	movne r0, r0, lsl #0x10
	add r7, r7, #1
	movne r4, r0, lsr #0x10
	cmp r7, #0x10
	blt _037FEC48
	mov r0, #0
	bl SND_IsCaptureActive
	cmp r0, #0
	orrne r0, r5, #1
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	mov r0, #1
	bl SND_IsCaptureActive
	cmp r0, #0
	orrne r0, r5, #2
	movne r0, r0, lsl #0x10
	movne r5, r0, lsr #0x10
	ldr r0, _037FECB8 ; =SNDi_SharedWork
	ldr r1, [r0]
	strh r4, [r1, #8]
	ldr r0, [r0]
	strh r5, [r0, #0xa]
_037FECB0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FECB8: .word SNDi_SharedWork
	arm_func_end SND_UpdateSharedWork

	arm_func_start SND_AlarmInit
SND_AlarmInit: ; 0x037FECBC
	ldr r1, _037FECE4 ; =SNDi_Work
	mov r3, #0
	mov r2, r3
_037FECC8:
	add r0, r1, r3, lsl #6
	strb r2, [r0, #0xf80]
	add r3, r3, #1
	strb r2, [r0, #0xf81]
	cmp r3, #8
	blt _037FECC8
	bx lr
	.align 2, 0
_037FECE4: .word SNDi_Work
	arm_func_end SND_AlarmInit

	arm_func_start SND_SetupAlarm
SND_SetupAlarm: ; 0x037FECE8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr lr, _037FED40 ; =SNDi_Work + 0xF80
	ldr r4, [sp, #0x18]
	ldrb ip, [lr, r0, lsl #6]
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp ip, #0
	add r8, lr, r0, lsl #6
	beq _037FED20
	add r0, r8, #0x14
	bl OS_CancelAlarm
	mov r0, #0
	strb r0, [r8]
_037FED20:
	str r7, [r8, #4]
	str r6, [r8, #8]
	str r5, [r8, #0xc]
	ldr r0, [sp, #0x1c]
	str r4, [r8, #0x10]
	strb r0, [r8, #1]
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FED40: .word SNDi_Work + 0xF80
	arm_func_end SND_SetupAlarm

	arm_func_start SND_StartAlarm
SND_StartAlarm: ; 0x037FED44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	ldr r1, _037FEDF8 ; =SNDi_Work + 0xF80
	mov sb, r0
	ldrb r0, [r1, sb, lsl #6]
	add r8, r1, sb, lsl #6
	cmp r0, #0
	beq _037FED74
	add r0, r8, #0x14
	bl OS_CancelAlarm
	mov r0, #0
	strb r0, [r8]
_037FED74:
	ldrb r1, [r8, #1]
	ldr r7, [r8, #0xc]
	ldr r6, [r8, #0x10]
	add r0, r8, #0x14
	ldr r5, [r8, #4]
	ldr r4, [r8, #8]
	orr sb, sb, r1, lsl #8
	bl OS_CreateAlarm
	cmp r6, #0
	cmpeq r7, #0
	bne _037FEDBC
	ldr r3, _037FEDFC ; =AlarmHandler
	mov r1, r5
	mov r2, r4
	add r0, r8, #0x14
	str sb, [sp]
	bl OS_SetAlarm
	b _037FEDE4
_037FEDBC:
	bl OS_GetTick
	ldr r2, _037FEDFC ; =AlarmHandler
	adds r0, r5, r0
	stmib sp, {r2, sb}
	adc r2, r4, r1
	mov r1, r0
	mov r3, r7
	add r0, r8, #0x14
	str r6, [sp]
	bl OS_SetPeriodicAlarm
_037FEDE4:
	mov r0, #1
	strb r0, [r8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FEDF8: .word SNDi_Work + 0xF80
_037FEDFC: .word AlarmHandler
	arm_func_end SND_StartAlarm

	arm_func_start SND_StopAlarm
SND_StopAlarm: ; 0x037FEE00
	stmdb sp!, {r4, lr}
	ldr r2, _037FEE3C ; =SNDi_Work + 0xF80
	ldrb r1, [r2, r0, lsl #6]
	add r4, r2, r0, lsl #6
	cmp r1, #0
	beq _037FEE34
	add r0, r4, #0x14
	bl OS_CancelAlarm
	ldrb r1, [r4, #1]
	mov r0, #0
	add r1, r1, #1
	strb r1, [r4, #1]
	strb r0, [r4]
_037FEE34:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FEE3C: .word SNDi_Work + 0xF80
	arm_func_end SND_StopAlarm

	arm_func_start AlarmHandler
AlarmHandler: ; 0x037FEE40
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, #7
	mov r4, #0
_037FEE50:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _037FEE50
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end AlarmHandler

	arm_func_start SND_CommandInit
SND_CommandInit: ; 0x037FEE70
	stmdb sp!, {r3, lr}
	ldr r0, _037FEEA4 ; =sCommandMesgQueue
	ldr r1, _037FEEA8 ; =sCommandMesgBuffer
	mov r2, #8
	bl OS_InitMessageQueue
	ldr r1, _037FEEAC ; =PxiFifoCallback
	mov r0, #7
	bl PXI_SetFifoRecvCallback
	ldr r0, _037FEEB0 ; =SNDi_SharedWork
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FEEA4: .word sCommandMesgQueue
_037FEEA8: .word sCommandMesgBuffer
_037FEEAC: .word PxiFifoCallback
_037FEEB0: .word SNDi_SharedWork
	arm_func_end SND_CommandInit

	arm_func_start SND_CommandProc
SND_CommandProc: ; 0x037FEEB4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	b _037FF52C
_037FEEC0:
	ldr sl, _037FF550 ; =0x04000509
	ldr r6, [sp, #0x18]
	sub r4, sl, #1
	b _037FF510
_037FEED0:
	add r5, sp, #0x1c
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	ldr r0, [sp, #0x20]
	cmp r0, #0x21
	addls pc, pc, r0, lsl #2
	b _037FF50C
_037FEEF4: ; jump table
	b _037FEF7C ; case 0
	b _037FEF94 ; case 1
	b _037FEFA0 ; case 2
	b _037FEFB8 ; case 3
	b _037FEFC4 ; case 4
	b _037FEFD4 ; case 5
	b _037FEFE4 ; case 6
	b _037FEFFC ; case 7
	b _037FF024 ; case 8
	b _037FF038 ; case 9
	b _037FF04C ; case 10
	b _037FF068 ; case 11
	b _037FF080 ; case 12
	b _037FF148 ; case 13
	b _037FF324 ; case 14
	b _037FF3A4 ; case 15
	b _037FF3DC ; case 16
	b _037FF1EC ; case 17
	b _037FF234 ; case 18
	b _037FF25C ; case 19
	b _037FF29C ; case 20
	b _037FF2E4 ; case 21
	b _037FF40C ; case 22
	b _037FF418 ; case 23
	b _037FF424 ; case 24
	b _037FF430 ; case 25
	b _037FF448 ; case 26
	b _037FF458 ; case 27
	b _037FF468 ; case 28
	b _037FF4A8 ; case 29
	b _037FF478 ; case 30
	b _037FF488 ; case 31
	b _037FF498 ; case 32
	b _037FF4B8 ; case 33
_037FEF7C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SND_StartSeq
	b _037FF50C
_037FEF94:
	ldr r0, [sp, #0x24]
	bl SND_StopSeq
	b _037FF50C
_037FEFA0:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SND_PrepareSeq
	b _037FF50C
_037FEFB8:
	ldr r0, [sp, #0x24]
	bl SND_StartPreparedSeq
	b _037FF50C
_037FEFC4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_PauseSeq
	b _037FF50C
_037FEFD4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_SkipSeq
	b _037FF50C
_037FEFE4:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SNDi_SetPlayerParam
	b _037FF50C
_037FEFFC:
	ldr r1, [sp, #0x24]
	mov r0, r1, lsr #0x18
	and r0, r0, #0xff
	str r0, [sp]
	bic r0, r1, #0xff000000
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SNDi_SetTrackParam
	b _037FF50C
_037FF024:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl SND_SetTrackMute
	b _037FF50C
_037FF038:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	bl SND_SetTrackAllocatableChannel
	b _037FF50C
_037FF04C:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r2, r2, lsl #0x10
	mov r2, r2, asr #0x10
	bl SND_SetPlayerLocalVariable
	b _037FF50C
_037FF068:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	bl SND_SetPlayerGlobalVariable
	b _037FF50C
_037FF080:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl OS_DisableInterrupts
	mov r8, r0
	mov r2, #0
	b _037FF0BC
_037FF09C:
	tst r5, #1
	movne r0, r2, lsl #4
	addne r0, r0, #0x4000000
	ldrneb r1, [r0, #0x403]
	add r2, r2, #1
	orrne r1, r1, #0x80
	strneb r1, [r0, #0x403]
	mov r5, r5, lsr #1
_037FF0BC:
	cmp r2, #0x10
	bge _037FF0CC
	cmp r5, #0
	bne _037FF09C
_037FF0CC:
	tst r6, #1
	beq _037FF0F8
	tst r6, #2
	ldrneh r1, [r4]
	orrne r0, r1, #0x80
	orrne r0, r0, #0x8000
	strneh r0, [r4]
	ldreqb r0, [r4]
	orreq r0, r0, #0x80
	streqb r0, [r4]
	b _037FF108
_037FF0F8:
	tst r6, #2
	ldrneb r0, [sl]
	orrne r0, r0, #0x80
	strneb r0, [sl]
_037FF108:
	mov r5, #0
	b _037FF128
_037FF110:
	tst r7, #1
	beq _037FF120
	mov r0, r5
	bl SND_StartAlarm
_037FF120:
	add r5, r5, #1
	mov r7, r7, lsr #1
_037FF128:
	cmp r5, #8
	bge _037FF138
	cmp r7, #0
	bne _037FF110
_037FF138:
	mov r0, r8
	bl OS_RestoreInterrupts
	bl SND_UpdateSharedWork
	b _037FF50C
_037FF148:
	ldr sb, [sp, #0x30]
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	bl OS_DisableInterrupts
	mov fp, r0
	mov r8, #0
	b _037FF180
_037FF168:
	tst r7, #1
	beq _037FF178
	mov r0, r8
	bl SND_StopAlarm
_037FF178:
	add r8, r8, #1
	mov r7, r7, lsr #1
_037FF180:
	cmp r8, #8
	bge _037FF190
	cmp r7, #0
	bne _037FF168
_037FF190:
	mov r7, #0
	b _037FF1B4
_037FF198:
	tst r5, #1
	beq _037FF1AC
	mov r0, r7
	mov r1, sb
	bl SND_StopChannel
_037FF1AC:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF1B4:
	cmp r7, #0x10
	bge _037FF1C4
	cmp r5, #0
	bne _037FF198
_037FF1C4:
	tst r6, #1
	movne r0, #0
	strneb r0, [r4]
	tst r6, #2
	movne r0, #0
	strneb r0, [sl]
	mov r0, fp
	bl OS_RestoreInterrupts
	bl SND_UpdateSharedWork
	b _037FF50C
_037FF1EC:
	ldr r1, [sp, #0x2c]
	mov r0, r1, lsr #0x1d
	and r0, r0, #1
	str r0, [sp]
	mov r0, r1, lsr #0x1c
	and r0, r0, #1
	str r0, [sp, #4]
	mov r0, r1, lsr #0x1b
	and r0, r0, #1
	str r0, [sp, #8]
	mov r0, r1, lsr #0x1f
	and r0, r0, #1
	mov r1, r1, lsr #0x1e
	and r1, r1, #1
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	bl SND_SetupCapture
	b _037FF50C
_037FF234:
	ldr r0, [sp, #0x30]
	mov r2, #0
	str r0, [sp, #4]
	ldr r3, [sp, #0x2c]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_SetupAlarm
	b _037FF50C
_037FF25C:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _037FF288
_037FF26C:
	tst r5, #1
	beq _037FF280
	mov r0, r7
	mov r1, r6
	bl SND_SetChannelTimer
_037FF280:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF288:
	cmp r7, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF26C
	b _037FF50C
_037FF29C:
	ldr r7, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r8, #0
	b _037FF2D0
_037FF2B0:
	tst r5, #1
	beq _037FF2C8
	mov r0, r8
	mov r1, r6
	mov r2, r7
	bl SND_SetChannelVolume
_037FF2C8:
	add r8, r8, #1
	mov r5, r5, lsr #1
_037FF2D0:
	cmp r8, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF2B0
	b _037FF50C
_037FF2E4:
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x24]
	mov r7, #0
	b _037FF310
_037FF2F4:
	tst r5, #1
	beq _037FF308
	mov r0, r7
	mov r1, r6
	bl SND_SetChannelPan
_037FF308:
	add r7, r7, #1
	mov r5, r5, lsr #1
_037FF310:
	cmp r7, #0x10
	bge _037FF50C
	cmp r5, #0
	bne _037FF2F4
	b _037FF50C
_037FF324:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x24]
	mov r1, r3, lsl #0x10
	ldr r2, [sp, #0x2c]
	mov r1, r1, lsr #0x10
	str r1, [sp]
	ldr r1, _037FF554 ; =0x003FFFFF
	and r1, r2, r1
	str r1, [sp, #4]
	mov r1, r2, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #8]
	mov r1, r2, lsr #0x16
	and r1, r1, #3
	str r1, [sp, #0xc]
	mov r1, r0, lsr #0x10
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	str r1, [sp, #0x10]
	mov r1, r3, lsr #0x10
	mov r2, r3, lsr #0x18
	and r1, r1, #0x7f
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x28]
	mov r0, r0, lsl #0x10
	mov r3, r3, lsr #0x1a
	mov r0, r0, lsr #0x10
	bic r1, r1, #0xf8000000
	and r2, r2, #3
	and r3, r3, #3
	bl SND_SetupChannelPcm
	b _037FF50C
_037FF3A4:
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	mov r0, r1, lsl #8
	mov r0, r0, lsr #0x10
	str r0, [sp]
	and r0, r1, #0x7f
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x30]
	and r2, r3, #0x7f
	mov r3, r3, lsr #8
	and r3, r3, #3
	bl SND_SetupChannelPsg
	b _037FF50C
_037FF3DC:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	and r0, r1, #0x7f
	str r0, [sp]
	mov r0, r1, lsl #8
	mov r3, r0, lsr #0x10
	ldr r0, [sp, #0x24]
	and r1, r2, #0x7f
	mov r2, r2, lsr #8
	and r2, r2, #3
	bl SND_SetupChannelNoise
	b _037FF50C
_037FF40C:
	ldr r0, [sp, #0x24]
	bl SNDi_SetSurroundDecay
	b _037FF50C
_037FF418:
	ldr r0, [sp, #0x24]
	bl SND_SetMasterVolume
	b _037FF50C
_037FF424:
	ldr r0, [sp, #0x24]
	bl SND_SetMasterPan
	b _037FF50C
_037FF430:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	bl SND_SetOutputSelector
	b _037FF50C
_037FF448:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_LockChannel
	b _037FF50C
_037FF458:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_UnlockChannel
	b _037FF50C
_037FF468:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_StopUnlockedChannel
	b _037FF50C
_037FF478:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_InvalidateSeq
	b _037FF50C
_037FF488:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_InvalidateBank
	b _037FF50C
_037FF498:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x28]
	bl SND_InvalidateWave
	b _037FF50C
_037FF4A8:
	ldr r1, [sp, #0x24]
	ldr r0, _037FF558 ; =SNDi_SharedWork
	str r1, [r0]
	b _037FF50C
_037FF4B8:
	ldr r5, [sp, #0x24]
	ldr r0, _037FF55C ; =SNDi_Work
	mov r1, r5
	mov r2, #0x1180
	bl MIi_CpuCopy32
	ldr r0, _037FF55C ; =SNDi_Work
	add r1, r5, #0x1000
	str r0, [r1, #0x1c0]
	mov r6, #0
_037FF4DC:
	mov r0, r6
	bl SND_GetChannelControl
	add r1, r5, r6, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x180]
	add r6, r6, #1
	cmp r6, #0x10
	blt _037FF4DC
	mov r0, #0
	bl SND_GetLockedChannel
	add r1, r5, #0x1000
	str r0, [r1, #0x1c4]
_037FF50C:
	ldr r6, [sp, #0x1c]
_037FF510:
	cmp r6, #0
	bne _037FEED0
	ldr r0, _037FF558 ; =SNDi_SharedWork
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
_037FF52C:
	ldr r0, _037FF560 ; =sCommandMesgQueue
	add r1, sp, #0x18
	mov r2, #0
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _037FEEC0
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF550: .word 0x04000509
_037FF554: .word 0x003FFFFF
_037FF558: .word SNDi_SharedWork
_037FF55C: .word SNDi_Work
_037FF560: .word sCommandMesgQueue
	arm_func_end SND_CommandProc

	arm_func_start PxiFifoCallback
PxiFifoCallback: ; 0x037FF564
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	bl OS_DisableInterrupts
	mov r4, r0
	cmp r5, #0x2000000
	blo _037FF590
	ldr r0, _037FF5AC ; =sCommandMesgQueue
	mov r1, r5
	mov r2, #0
	bl OS_SendMessage
	b _037FF59C
_037FF590:
	cmp r5, #0
	bne _037FF59C
	bl SND_SendWakeupMessage
_037FF59C:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_037FF5AC: .word sCommandMesgQueue
	arm_func_end PxiFifoCallback

	arm_func_start FS_Init
FS_Init: ; 0x037FF5B0
	ldr ip, _037FF5B8 ; =CARD_Init
	bx ip
	.align 2, 0
_037FF5B8: .word CARD_Init
	arm_func_end FS_Init

	arm_func_start CARDi_InitCommon
CARDi_InitCommon: ; 0x037FF5BC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, _037FF660 ; =cardi_common
	mov r2, #0
	mvn r1, #2
	str r1, [r4, #0xc]
	mov r0, #4
	str r0, [r4, #0xf0]
	str r2, [r4, #0x10]
	str r2, [r4, #0x1c]
	str r2, [r4]
	str r2, [r4, #8]
	str r2, [r4, #0x18]
	str r2, [r4, #0x14]
	str r2, [r4, #0xf8]
	str r2, [r4, #0xf4]
	mov r0, #0x400
	str r0, [sp]
	ldr ip, [r4, #0xf0]
	ldr r1, _037FF664 ; =CARDi_TaskThread
	ldr r3, _037FF668 ; =status_checked$3825
	add r0, r4, #0x48
	str ip, [sp, #4]
	bl OS_CreateThread
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
	ldr r1, _037FF66C ; =CARDi_OnFifoRecv
	mov r0, #0xb
	bl PXI_SetFifoRecvCallback
	ldr r0, _037FF670 ; =0x027FFC40
	ldrh r0, [r0]
	cmp r0, #2
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF674 ; =CARDi_EnableFlag
	moveq r1, #1
	streq r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FF660: .word cardi_common
_037FF664: .word CARDi_TaskThread
_037FF668: .word status_checked$3825
_037FF66C: .word CARDi_OnFifoRecv
_037FF670: .word 0x027FFC40
_037FF674: .word CARDi_EnableFlag
	arm_func_end CARDi_InitCommon

	arm_func_start CARD_SetThreadPriority
CARD_SetThreadPriority: ; 0x037FF678
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _037FF6B4 ; =cardi_common
	mov r7, r0
	bl OS_DisableInterrupts
	ldr r6, [r5, #0xf0]
	mov r4, r0
	mov r1, r7
	add r0, r5, #0x48
	str r7, [r5, #0xf0]
	bl OS_SetThreadPriority
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r6
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FF6B4: .word cardi_common
	arm_func_end CARD_SetThreadPriority

	arm_func_start CARD_GetRomHeader
CARD_GetRomHeader: ; 0x037FF6B8
	ldr r0, _037FF6C0 ; =0x027FFA80
	bx lr
	.align 2, 0
_037FF6C0: .word 0x027FFA80
	arm_func_end CARD_GetRomHeader

	arm_func_start CARDi_CommandEnd
CARDi_CommandEnd: ; 0x037FF6C4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	mov r4, r1
	adds r1, r5, r4
	beq _037FF75C
	cmp r5, #0
	beq _037FF6E4
	bl OS_Sleep
_037FF6E4:
	cmp r4, #0
	beq _037FF738
	sub r7, r4, r5
	mov r4, #0
	mov r5, #1
	mov r6, #5
	b _037FF718
_037FF700:
	cmp r7, #5
	movlt r8, r7
	movge r8, r6
	mov r0, r8
	bl OS_Sleep
	sub r7, r7, r8
_037FF718:
	bl CARDi_CommandReadStatus
	tst r0, #1
	moveq r0, r5
	movne r0, r4
	cmp r0, #0
	bne _037FF738
	cmp r7, #0
	bgt _037FF700
_037FF738:
	bl CARDi_CommandReadStatus
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	ldreq r0, _037FF764 ; =cardi_common
	moveq r1, #4
	ldreq r0, [r0]
	streq r1, [r0]
_037FF75C:
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_037FF764: .word cardi_common
	arm_func_end CARDi_CommandEnd

	arm_func_start CARDi_CommandReadStatus
CARDi_CommandReadStatus: ; 0x037FF768
	stmdb sp!, {r3, lr}
	ldr ip, _037FF7AC ; =status_checked$3825
	mov lr, #2
	ldr r0, _037FF7B0 ; =arg$3983
	ldr r3, _037FF7B4 ; =CARDi_CommWriteCore
	mov r1, #0
	mov r2, #1
	str lr, [ip, #4]
	bl CARDi_CommArray
	ldr r3, _037FF7B8 ; =CARDi_CommReadCore
	add r1, sp, #0
	mov r0, #0
	mov r2, #1
	bl CARDi_CommArray
	ldrb r0, [sp]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF7AC: .word status_checked$3825
_037FF7B0: .word arg$3983
_037FF7B4: .word CARDi_CommWriteCore
_037FF7B8: .word CARDi_CommReadCore
	arm_func_end CARDi_CommandReadStatus

	arm_func_start CARDi_WaitPrevCommand
CARDi_WaitPrevCommand: ; 0x037FF7BC
	stmdb sp!, {r3, lr}
	mov r0, #0
	mov r1, #0x32
	bl CARDi_CommandEnd
	ldr r0, _037FF7F4 ; =cardi_common
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #4
	moveq r0, #6
	streq r0, [r1]
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FF7F4: .word cardi_common
	arm_func_end CARDi_WaitPrevCommand

	arm_func_start CARDi_CommArray
CARDi_CommArray: ; 0x037FF7F8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _037FF9B0 ; =cardi_param
	ldr r6, _037FF9B4 ; =0x0000A040
	ldr r5, _037FF9B8 ; =0x040001A0
	stmib r4, {r0, r1}
	mov r8, r2
	mov r7, r3
	strh r6, [r5]
	b _037FF98C
_037FF81C:
	ldr r0, _037FF9BC ; =_03806AF4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _037FF92C
	ldr r0, _037FF9C0 ; =cardi_common
	ldr r0, [r0]
	ldr r0, [r0, #4]
	mov r0, r0, asr #0x10
	and r0, r0, #0xff
	cmp r0, #0xff
	bne _037FF92C
	bl OS_GetTick
	ldr fp, _037FF9BC ; =_03806AF4
	mov r5, r0
	mov r6, r1
	mov sb, #0xfa00
_037FF85C:
	bl OS_GetTick
	mov r3, #0
	subs sl, r0, r5
	sbc lr, r1, r6
	mov ip, r3
	umull r0, r1, sl, sb
	mla r1, sl, ip, r1
	mla r1, lr, sb, r1
	ldr r2, _037FF9C4 ; =0x000082EA
	bl _ll_udiv
	ldrb r2, [fp]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF85C
	ldr r0, _037FF9C8 ; =0x0000A042
	ldr r1, _037FF9B8 ; =0x040001A0
	strh r0, [r1]
_037FF8A0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8A0
	ldr r0, _037FF9CC ; =0x040001A2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_037FF8BC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF8BC
	ldr r1, _037FF9CC ; =0x040001A2
	ldr r0, _037FF9BC ; =_03806AF4
	ldrh r2, [r1]
	mov r1, #0
	strh r2, [sp]
	str r1, [r0, #4]
	bl OS_GetTick
	mov r6, r0
	mov sb, r1
	mov r5, #0xfa00
_037FF8F0:
	bl OS_GetTick
	mov r3, #0
	subs ip, r0, r6
	sbc fp, r1, sb
	mov sl, r3
	umull r0, r1, ip, r5
	mla r1, ip, sl, r1
	mla r1, fp, r5, r1
	ldr r2, _037FF9C4 ; =0x000082EA
	bl _ll_udiv
	ldr r2, _037FF9BC ; =_03806AF4
	ldrb r2, [r2]
	cmp r1, r2, asr #31
	cmpeq r0, r2
	blo _037FF8F0
_037FF92C:
	ldr r0, [r4]
	subs r0, r0, #1
	str r0, [r4]
	ldrne r1, _037FF9B4 ; =0x0000A040
	ldrne r0, _037FF9B8 ; =0x040001A0
	strneh r1, [r0]
	bne _037FF960
	ldr r1, _037FF9B8 ; =0x040001A0
	mov r2, #0xa000
	strh r2, [r1]
	ldr r0, _037FF9BC ; =_03806AF4
	mov r1, #1
	str r1, [r0, #4]
_037FF960:
	ldr r1, _037FF9B8 ; =0x040001A0
_037FF964:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FF964
	mov r0, r4
	mov lr, pc
	bx r7
	ldr r0, [r4]
	cmp r0, #0
	beq _037FF994
	sub r8, r8, #1
_037FF98C:
	cmp r8, #0
	bne _037FF81C
_037FF994:
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _037FF9B8 ; =0x040001A0
	moveq r1, #0
	streqh r1, [r0]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FF9B0: .word cardi_param
_037FF9B4: .word 0x0000A040
_037FF9B8: .word 0x040001A0
_037FF9BC: .word _03806AF4
_037FF9C0: .word cardi_common
_037FF9C4: .word 0x000082EA
_037FF9C8: .word 0x0000A042
_037FF9CC: .word 0x040001A2
	arm_func_end CARDi_CommArray

	arm_func_start CARDi_CommReadCore
CARDi_CommReadCore: ; 0x037FF9D0
	ldr r1, _037FFA0C ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FF9E0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FF9E0
	ldr r2, _037FFA0C ; =0x040001A2
	ldr r1, [r0, #8]
	ldrh r2, [r2]
	strb r2, [r1]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	bx lr
	.align 2, 0
_037FFA0C: .word 0x040001A2
	arm_func_end CARDi_CommReadCore

	arm_func_start CARDi_CommWriteCore
CARDi_CommWriteCore: ; 0x037FFA10
	stmdb sp!, {r3}
	sub sp, sp, #4
	ldr r1, [r0, #4]
	ldr r2, _037FFA5C ; =0x040001A2
	ldrb r1, [r1]
	strh r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	sub r1, r2, #2
_037FFA38:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _037FFA38
	ldr r0, _037FFA5C ; =0x040001A2
	ldrh r0, [r0]
	strh r0, [sp]
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	.align 2, 0
_037FFA5C: .word 0x040001A2
	arm_func_end CARDi_CommWriteCore

	arm_func_start CARDi_CommVerifyCore
CARDi_CommVerifyCore: ; 0x037FFA60
	ldr r1, _037FFAC0 ; =0x040001A2
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_037FFA70:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _037FFA70
	ldr r2, _037FFAC0 ; =0x040001A2
	ldr r1, [r0, #4]
	ldrh r2, [r2]
	ldrb r1, [r1]
	and r2, r2, #0xff
	cmp r2, r1
	beq _037FFAB0
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r1, [r0]
	cmp r1, #1
	movhi r1, #1
	strhi r1, [r0]
_037FFAB0:
	ldr r1, [r0, #4]
	add r1, r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_037FFAC0: .word 0x040001A2
	arm_func_end CARDi_CommVerifyCore

	arm_func_start CARDi_WriteEnable
CARDi_WriteEnable: ; 0x037FFAC4
	stmdb sp!, {r3, lr}
	ldr ip, _037FFAEC ; =status_checked$3825
	mov r2, #1
	ldr r0, _037FFAF0 ; =buf$3759
	ldr r3, _037FFAF4 ; =CARDi_CommWriteCore
	mov r1, #0
	str r2, [ip, #4]
	bl CARDi_CommArray
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFAEC: .word status_checked$3825
_037FFAF0: .word buf$3759
_037FFAF4: .word CARDi_CommWriteCore
	arm_func_end CARDi_WriteEnable

	arm_func_start CARDi_SendSpiAddressingCommand
CARDi_SendSpiAddressingCommand: ; 0x037FFAF8
	stmdb sp!, {r3, lr}
	ldr r2, _037FFB90 ; =cardi_common
	ldr r2, [r2]
	ldr r2, [r2, #0x28]
	cmp r2, #1
	beq _037FFB24
	cmp r2, #2
	beq _037FFB40
	cmp r2, #3
	beq _037FFB58
	b _037FFB74
_037FFB24:
	mov r3, r0, lsr #5
	and r3, r3, #8
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #16
	str r0, [sp]
	b _037FFB74
_037FFB40:
	and r3, r0, #0xff00
	mov ip, r0, lsl #0x18
	orr r0, r1, r3
	orr r0, r0, ip, lsr #8
	str r0, [sp]
	b _037FFB74
_037FFB58:
	mov r3, r0, lsr #8
	and r3, r3, #0xff00
	and ip, r0, #0xff00
	orr r1, r1, r3
	orr r1, r1, ip, lsl #8
	orr r0, r1, r0, lsl #24
	str r0, [sp]
_037FFB74:
	ldr r3, _037FFB94 ; =CARDi_CommWriteCore
	add r0, sp, #0
	add r2, r2, #1
	mov r1, #0
	bl CARDi_CommArray
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037FFB90: .word cardi_common
_037FFB94: .word CARDi_CommWriteCore
	arm_func_end CARDi_SendSpiAddressingCommand

	arm_func_start CARDi_InitStatusRegister
CARDi_InitStatusRegister: ; 0x037FFB98
	stmdb sp!, {r4, lr}
	ldr r0, _037FFBE8 ; =cardi_common
	ldr r0, [r0]
	ldrb r4, [r0, #0x54]
	cmp r4, #0xff
	beq _037FFBE0
	ldr r0, _037FFBEC ; =status_checked$3825
	ldr r0, [r0]
	cmp r0, #0
	bne _037FFBE0
	bl CARDi_CommandReadStatus
	cmp r4, r0
	beq _037FFBD4
	mov r0, r4
	bl CARDi_SetWriteProtectCore
_037FFBD4:
	ldr r0, _037FFBEC ; =status_checked$3825
	mov r1, #1
	str r1, [r0]
_037FFBE0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FFBE8: .word cardi_common
_037FFBEC: .word status_checked$3825
	arm_func_end CARDi_InitStatusRegister

	arm_func_start CARDi_ReadBackupCore
CARDi_ReadBackupCore: ; 0x037FFBF0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFC48
	ldr r0, _037FFC50 ; =cardi_common
	ldr r2, _037FFC54 ; =status_checked$3825
	ldr r1, [r0]
	mov r0, r6
	ldr r3, [r1, #0x28]
	mov r1, #3
	add r3, r3, #1
	add r3, r3, r4
	str r3, [r2, #4]
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFC58 ; =CARDi_CommReadCore
	mov r1, r5
	mov r2, r4
	mov r0, #0
	bl CARDi_CommArray
_037FFC48:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_037FFC50: .word cardi_common
_037FFC54: .word status_checked$3825
_037FFC58: .word CARDi_CommReadCore
	arm_func_end CARDi_ReadBackupCore

	arm_func_start CARDi_ProgramBackupCore
CARDi_ProgramBackupCore: ; 0x037FFC5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFD00
	ldr r0, _037FFD08 ; =cardi_common
	ldr fp, _037FFD0C ; =status_checked$3825
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFCF8
_037FFC90:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl CARDi_WriteEnable
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #2
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFD10 ; =CARDi_CommWriteCore
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl CARDi_CommArray
	ldr r0, [r5, #0x2c]
	mov r1, #0
	bl CARDi_CommandEnd
	ldr r0, [r5]
	cmp r0, #0
	bne _037FFD00
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_037FFCF8:
	cmp r8, #0
	bne _037FFC90
_037FFD00:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFD08: .word cardi_common
_037FFD0C: .word status_checked$3825
_037FFD10: .word CARDi_CommWriteCore
	arm_func_end CARDi_ProgramBackupCore

	arm_func_start CARDi_WriteBackupCore
CARDi_WriteBackupCore: ; 0x037FFD14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov sb, r1
	mov r8, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFDB8
	ldr r0, _037FFDC0 ; =cardi_common
	ldr fp, _037FFDC4 ; =status_checked$3825
	ldr r5, [r0]
	ldr r6, [r5, #0x24]
	sub r4, r6, #1
	b _037FFDB0
_037FFD48:
	and r0, sl, r4
	sub r7, r6, r0
	cmp r7, r8
	movhi r7, r8
	bl CARDi_WriteEnable
	ldr r1, [r5, #0x28]
	mov r0, sl
	add r1, r1, #1
	add r1, r1, r7
	str r1, [fp, #4]
	mov r1, #0xa
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFDC8 ; =CARDi_CommWriteCore
	mov r0, sb
	mov r1, #0
	mov r2, r7
	bl CARDi_CommArray
	ldr r0, [r5, #0x30]
	ldr r1, [r5, #0x34]
	bl CARDi_CommandEnd
	ldr r0, [r5]
	cmp r0, #0
	bne _037FFDB8
	add sb, sb, r7
	add sl, sl, r7
	sub r8, r8, r7
_037FFDB0:
	cmp r8, #0
	bne _037FFD48
_037FFDB8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_037FFDC0: .word cardi_common
_037FFDC4: .word status_checked$3825
_037FFDC8: .word CARDi_CommWriteCore
	arm_func_end CARDi_WriteBackupCore

	arm_func_start CARDi_VerifyBackupCore
CARDi_VerifyBackupCore: ; 0x037FFDCC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFE48
	ldr r0, _037FFE50 ; =cardi_common
	ldr r2, _037FFE54 ; =status_checked$3825
	ldr r4, [r0]
	mov r0, #1
	str r0, [r2, #0x10]
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	add r3, r1, r5
	mov r1, #3
	str r3, [r2, #4]
	bl CARDi_SendSpiAddressingCommand
	ldr r3, _037FFE58 ; =CARDi_CommVerifyCore
	mov r0, r6
	mov r2, r5
	mov r1, #0
	bl CARDi_CommArray
	ldr r0, [r4]
	cmp r0, #0
	ldreq r0, _037FFE54 ; =status_checked$3825
	ldreq r0, [r0, #0x10]
	cmpeq r0, #0
	moveq r0, #1
	streq r0, [r4]
_037FFE48:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_037FFE50: .word cardi_common
_037FFE54: .word status_checked$3825
_037FFE58: .word CARDi_CommVerifyCore
	arm_func_end CARDi_VerifyBackupCore

	arm_func_start CARDi_EraseBackupSectorCore
CARDi_EraseBackupSectorCore: ; 0x037FFE5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFEF0 ; =cardi_common
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x1c]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _037FFEE8
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFEE8
	ldr r8, _037FFEF4 ; =status_checked$3825
	mov sb, #0xd8
	b _037FFEE0
_037FFEA4:
	bl CARDi_WriteEnable
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl CARDi_SendSpiAddressingCommand
	ldr r0, [r4, #0x40]
	ldr r1, [r4, #0x44]
	bl CARDi_CommandEnd
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFEE8
	add r7, r7, r5
	sub r6, r6, r5
_037FFEE0:
	cmp r6, #0
	bne _037FFEA4
_037FFEE8:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFEF0: .word cardi_common
_037FFEF4: .word status_checked$3825
	arm_func_end CARDi_EraseBackupSectorCore

	arm_func_start CARDi_EraseBackupSubSectorCore
CARDi_EraseBackupSubSectorCore: ; 0x037FFEF8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r2, _037FFF8C ; =cardi_common
	mov r7, r0
	ldr r4, [r2]
	mov r6, r1
	ldr r5, [r4, #0x20]
	orr r0, r7, r6
	sub r1, r5, #1
	tst r1, r0
	movne r0, #2
	strne r0, [r4]
	bne _037FFF84
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFF84
	ldr r8, _037FFF90 ; =status_checked$3825
	mov sb, #0x20
	b _037FFF7C
_037FFF40:
	bl CARDi_WriteEnable
	ldr r1, [r4, #0x28]
	mov r0, r7
	add r1, r1, #1
	str r1, [r8, #4]
	mov r1, sb
	bl CARDi_SendSpiAddressingCommand
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x4c]
	bl CARDi_CommandEnd
	ldr r0, [r4]
	cmp r0, #0
	bne _037FFF84
	add r7, r7, r5
	sub r6, r6, r5
_037FFF7C:
	cmp r6, #0
	bne _037FFF40
_037FFF84:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_037FFF8C: .word cardi_common
_037FFF90: .word status_checked$3825
	arm_func_end CARDi_EraseBackupSubSectorCore

	arm_func_start CARDi_EraseChipCore
CARDi_EraseChipCore: ; 0x037FFF94
	stmdb sp!, {r4, lr}
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _037FFFD8
	ldr r0, _037FFFE0 ; =cardi_common
	ldr r4, [r0]
	bl CARDi_WriteEnable
	ldr r1, _037FFFE4 ; =status_checked$3825
	mov r2, #1
	ldr r0, _037FFFE8 ; =arg$3806
	ldr r3, _037FFFEC ; =CARDi_CommWriteCore
	str r2, [r1, #4]
	mov r1, #0
	bl CARDi_CommArray
	ldr r0, [r4, #0x38]
	ldr r1, [r4, #0x3c]
	bl CARDi_CommandEnd
_037FFFD8:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_037FFFE0: .word cardi_common
_037FFFE4: .word status_checked$3825
_037FFFE8: .word arg$3806
_037FFFEC: .word CARDi_CommWriteCore
	arm_func_end CARDi_EraseChipCore

	arm_func_start CARDi_SetWriteProtectCore
CARDi_SetWriteProtectCore: ; 0x037FFFF0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	bl CARDi_WaitPrevCommand
	cmp r0, #0
	beq _03800074
	ldr r0, _0380007C ; =cardi_common
	strb r4, [sp, #1]
	mov r1, #1
	ldr sb, [r0]
	ldr r5, _03800080 ; =CARDi_CommWriteCore
	ldr r4, _03800084 ; =status_checked$3825
	strb r1, [sp]
	mov sl, #0xa
	add r7, sp, #0
	mov r8, #2
	mov r6, #0
	mov fp, #5
_03800034:
	bl CARDi_WriteEnable
	mov r0, r7
	str r8, [r4, #4]
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl CARDi_CommArray
	mov r0, fp
	mov r1, #0
	bl CARDi_CommandEnd
	ldr r0, [sb]
	cmp r0, #4
	bne _03800074
	sub sl, sl, #1
	cmp sl, #0
	bgt _03800034
_03800074:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_0380007C: .word cardi_common
_03800080: .word CARDi_CommWriteCore
_03800084: .word status_checked$3825
	arm_func_end CARDi_SetWriteProtectCore

	arm_func_start CARDi_SetRomOp
CARDi_SetRomOp: ; 0x03800088
	ldr r3, _038000E0 ; =0x040001A4
_0380008C:
	ldr r2, [r3]
	tst r2, #-0x80000000
	bne _0380008C
	ldr r3, _038000E4 ; =0x040001A1
	mov r2, #0xc0
	strb r2, [r3]
	mov r2, r0, lsr #0x18
	strb r2, [r3, #7]
	mov r2, r0, lsr #0x10
	strb r2, [r3, #8]
	mov r2, r0, lsr #8
	strb r2, [r3, #9]
	strb r0, [r3, #0xa]
	mov r0, r1, lsr #0x18
	strb r0, [r3, #0xb]
	mov r0, r1, lsr #0x10
	strb r0, [r3, #0xc]
	mov r0, r1, lsr #8
	strb r0, [r3, #0xd]
	strb r1, [r3, #0xe]
	bx lr
	.align 2, 0
_038000E0: .word 0x040001A4
_038000E4: .word 0x040001A1
	arm_func_end CARDi_SetRomOp

	arm_func_start CARDi_ReadEnd
CARDi_ReadEnd: ; 0x038000E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _03800158 ; =cardi_common
	mov r1, #0
	ldr r0, [r4]
	str r1, [r0]
	ldr r7, [r4, #0x3c]
	ldr r6, [r4, #0x40]
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800134
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_03800134:
	mov r0, r5
	bl OS_RestoreInterrupts
	cmp r7, #0
	beq _03800150
	mov r0, r6
	mov lr, pc
	bx r7
_03800150:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800158: .word cardi_common
	arm_func_end CARDi_ReadEnd

	arm_func_start CARDi_GetRomFlag
CARDi_GetRomFlag: ; 0x0380015C
	ldr r1, _03800178 ; =cardi_rom_header_addr
	ldr r1, [r1]
	ldr r1, [r1, #0x60]
	bic r1, r1, #0x7000000
	orr r0, r1, r0
	orr r0, r0, #0xa0000000
	bx lr
	.align 2, 0
_03800178: .word cardi_rom_header_addr
	arm_func_end CARDi_GetRomFlag

	arm_func_start CARDi_ReadCard
CARDi_ReadCard: ; 0x0380017C
	bx lr
	arm_func_end CARDi_ReadCard

	arm_func_start CARDi_ReadRomIDCore
CARDi_ReadRomIDCore: ; 0x03800180
	stmdb sp!, {r3, lr}
	mov r0, #-0x48000000
	mov r1, #0
	bl CARDi_SetRomOp
	mov r0, #0x7000000
	bl CARDi_GetRomFlag
	mov r1, #0x2000
	rsb r1, r1, #0
	ldr r2, _038001C8 ; =0x040001A4
	and r0, r0, r1
	str r0, [r2]
_038001AC:
	ldr r0, [r2]
	tst r0, #0x800000
	beq _038001AC
	ldr r0, _038001CC ; =0x04100010
	ldr r0, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038001C8: .word 0x040001A4
_038001CC: .word 0x04100010
	arm_func_end CARDi_ReadRomIDCore

	arm_func_start CARDi_ReadRomID
CARDi_ReadRomID: ; 0x038001D0
	stmdb sp!, {r4, lr}
	ldr r0, _038001FC ; =cardi_common
	mov r1, #0
	mov r2, r1
	bl CARDi_WaitTask
	bl CARDi_ReadRomIDCore
	mov r4, r0
	bl CARDi_ReadEnd
	mov r0, r4
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038001FC: .word cardi_common
	arm_func_end CARDi_ReadRomID

	arm_func_start CARDi_WaitTask
CARDi_WaitTask: ; 0x03800200
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl OS_DisableInterrupts
	mov r4, r0
	b _03800224
_0380021C:
	add r0, r7, #0xf4
	bl OS_SleepThread
_03800224:
	ldr r0, [r7, #0xfc]
	tst r0, #4
	bne _0380021C
	ldr r1, [r7, #0xfc]
	mov r0, r4
	orr r1, r1, #4
	str r1, [r7, #0xfc]
	str r6, [r7, #0x3c]
	str r5, [r7, #0x40]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end CARDi_WaitTask

	arm_func_start CARD_Init
CARD_Init: ; 0x03800254
	stmdb sp!, {r3, lr}
	ldr ip, _038002B4 ; =cardi_common
	ldr r0, [ip, #0xfc]
	cmp r0, #0
	bne _038002AC
	ldr r0, _038002B8 ; =cardi_rom_base
	mov r2, #0
	sub r1, r2, #1
	mov r3, #1
	str r3, [ip, #0xfc]
	str r2, [ip, #0x28]
	str r2, [ip, #0x24]
	str r2, [ip, #0x20]
	str r1, [ip, #0x2c]
	str r2, [ip, #0x3c]
	str r2, [ip, #0x40]
	str r2, [r0]
	bl CARDi_InitCommon
	ldr r1, _038002BC ; =CARDi_ReadCard
	ldr r0, _038002C0 ; =rom_stat
	str r1, [r0]
	bl CARD_InitPulledOutCallback
_038002AC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038002B4: .word cardi_common
_038002B8: .word cardi_rom_base
_038002BC: .word CARDi_ReadCard
_038002C0: .word rom_stat
	arm_func_end CARD_Init

	arm_func_start CARDi_OnFifoRecv
CARDi_OnFifoRecv: ; 0x038002C4
	stmdb sp!, {r3, lr}
	cmp r0, #0xb
	bne _0380039C
	cmp r2, #0
	beq _0380039C
	ldr r0, _038003A4 ; =cardi_common
	ldr r2, [r0, #8]
	cmp r2, #0
	streq r1, [r0, #4]
	ldr r2, [r0, #4]
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800368
_038002F8: ; jump table
	b _03800338 ; case 0
	b _03800368 ; case 1
	b _0380035C ; case 2
	b _0380035C ; case 3
	b _0380035C ; case 4
	b _0380035C ; case 5
	b _0380035C ; case 6
	b _0380035C ; case 7
	b _0380035C ; case 8
	b _0380035C ; case 9
	b _0380035C ; case 10
	b _0380035C ; case 11
	b _0380035C ; case 12
	b _0380035C ; case 13
	b _0380035C ; case 14
	b _0380035C ; case 15
_03800338:
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _03800368
	cmp r2, #1
	ldreq r2, [r0, #0xfc]
	streq r1, [r0]
	orreq r1, r2, #0x10
	streq r1, [r0, #0xfc]
	b _03800368
_0380035C:
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_03800368:
	ldr r1, [r0, #0xfc]
	tst r1, #0x10
	ldreq r1, [r0, #8]
	addeq r1, r1, #1
	streq r1, [r0, #8]
	beq _0380039C
	ldr r1, [r0, #0xfc]
	mov r2, #0
	str r2, [r0, #8]
	tst r1, #4
	ldrne r0, [r0, #0xec]
	addeq r0, r0, #0x48
	bl OS_WakeupThreadDirect
_0380039C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038003A4: .word cardi_common
	arm_func_end CARDi_OnFifoRecv

	arm_func_start CARDi_TaskThread
CARDi_TaskThread: ; 0x038003A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _038005D8 ; =cardi_common
_038003B0:
	mov r5, #0
	bl OS_DisableInterrupts
	mov r6, r0
	add r8, r4, #0x48
	mov r7, r5
_038003C4:
	ldr r0, [r4, #0xfc]
	tst r0, #4
	bne _038003FC
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _03800408
	ldr r0, [r4, #0xfc]
	mov r5, #1
	orr r0, r0, #4
	str r0, [r4, #0xfc]
	ldr r0, [r4, #0xfc]
	bic r0, r0, #0x10
	str r0, [r4, #0xfc]
	b _03800418
_038003FC:
	ldr r0, [r4, #0xfc]
	tst r0, #8
	bne _03800418
_03800408:
	mov r0, r7
	str r8, [r4, #0xec]
	bl OS_SleepThread
	b _038003C4
_03800418:
	mov r0, r6
	bl OS_RestoreInterrupts
	cmp r5, #0
	beq _038005C4
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x58]
	mov r0, #1
	tst r1, r0, lsl r2
	moveq r0, #3
	streq r0, [r3]
	beq _03800568
	cmp r2, #0xf
	addls pc, pc, r2, lsl #2
	b _03800560
_03800460: ; jump table
	b _03800568 ; case 0
	b _03800568 ; case 1
	b _038004A0 ; case 2
	b _038004A8 ; case 3
	b _038004B8 ; case 4
	b _03800560 ; case 5
	b _038004C4 ; case 6
	b _038004D8 ; case 7
	b _038004EC ; case 8
	b _03800500 ; case 9
	b _03800560 ; case 10
	b _03800514 ; case 11
	b _03800534 ; case 12
	b _0380053C ; case 13
	b _03800550 ; case 14
	b _03800524 ; case 15
_038004A0:
	bl CARDi_InitStatusRegister
	b _03800568
_038004A8:
	bl CARDi_ReadRomIDCore
	ldr r1, [r4]
	str r0, [r1, #8]
	b _03800568
_038004B8:
	mov r0, #3
	str r0, [r3]
	b _03800568
_038004C4:
	ldr r0, [r3, #0xc]
	ldr r1, [r3, #0x10]
	ldr r2, [r3, #0x14]
	bl CARDi_ReadBackupCore
	b _03800568
_038004D8:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_WriteBackupCore
	b _03800568
_038004EC:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_ProgramBackupCore
	b _03800568
_03800500:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0xc]
	ldr r2, [r3, #0x14]
	bl CARDi_VerifyBackupCore
	b _03800568
_03800514:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl CARDi_EraseBackupSectorCore
	b _03800568
_03800524:
	ldr r0, [r3, #0x10]
	ldr r1, [r3, #0x14]
	bl CARDi_EraseBackupSubSectorCore
	b _03800568
_03800534:
	bl CARDi_EraseChipCore
	b _03800568
_0380053C:
	bl CARDi_CommandReadStatus
	ldr r1, [r4]
	ldr r1, [r1, #0x10]
	strb r0, [r1]
	b _03800568
_03800550:
	ldr r0, [r3, #0xc]
	ldrb r0, [r0]
	bl CARDi_SetWriteProtectCore
	b _03800568
_03800560:
	mov r0, #3
	str r0, [r3]
_03800568:
	mov r6, #0xb
	mov r5, #1
_03800570:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl PXI_SendWordByFifo
	cmp r0, #0
	blt _03800570
	bl OS_DisableInterrupts
	ldr r1, [r4, #0xfc]
	mov r5, r0
	bic r0, r1, #0x4c
	str r0, [r4, #0xfc]
	add r0, r4, #0xf4
	bl OS_WakeupThread
	ldr r0, [r4, #0xfc]
	tst r0, #0x10
	beq _038005B8
	add r0, r4, #0x48
	bl OS_WakeupThreadDirect
_038005B8:
	mov r0, r5
	bl OS_RestoreInterrupts
	b _038003B0
_038005C4:
	ldr r1, [r4, #0x44]
	mov r0, r4
	mov lr, pc
	bx r1
	b _038003B0
	.align 2, 0
_038005D8: .word cardi_common
	arm_func_end CARDi_TaskThread

	arm_func_start CARD_InitPulledOutCallback
CARD_InitPulledOutCallback: ; 0x038005DC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0380062C ; =skipCheck$3668
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _03800624
	mov r1, #1
	str r1, [r0, #8]
	bl PXI_Init
	mov r5, #0xe
	mov r4, #0
_03800604:
	mov r0, r5
	mov r1, r4
	bl PXI_IsCallbackReady
	cmp r0, #0
	beq _03800604
	ldr r1, _03800630 ; =CARDi_CallbackForPulledOut
	mov r0, #0xe
	bl PXI_SetFifoRecvCallback
_03800624:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380062C: .word skipCheck$3668
_03800630: .word CARDi_CallbackForPulledOut
	arm_func_end CARD_InitPulledOutCallback

	arm_func_start CARDi_CallbackForPulledOut
CARDi_CallbackForPulledOut: ; 0x03800634
	stmdb sp!, {r4, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	bne _0380068C
	mov r0, #0
	bl MI_StopDma
	mov r0, #1
	bl MI_StopDma
	mov r0, #2
	bl MI_StopDma
	mov r0, #3
	bl MI_StopDma
	mov r0, #0
	bl CTRDG_VibPulseEdgeUpdate
	bl OS_DisableInterrupts
	mov r4, r0
	bl SND_BeginSleep
	bl WVR_Shutdown
	mov r0, r4
	bl OS_RestoreInterrupts
	bl OS_Terminate
	b _03800690
_0380068C:
	bl OS_Terminate
_03800690:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end CARDi_CallbackForPulledOut

	arm_func_start CARD_IsPulledOut
CARD_IsPulledOut: ; 0x03800698
	stmdb sp!, {r3, lr}
	ldr r0, _038006D8 ; =skipCheck$3668
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _038006C8
	ldr r0, _038006DC ; =0x027FFE1F
	ldrb r0, [r0]
	tst r0, #0x80
	beq _038006C4
	bl CARD_CompareCardID
	b _038006C8
_038006C4:
	bl CARD_IsCardIreqLo
_038006C8:
	ldr r0, _038006D8 ; =skipCheck$3668
	ldr r0, [r0, #0xc]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038006D8: .word skipCheck$3668
_038006DC: .word 0x027FFE1F
	arm_func_end CARD_IsPulledOut

	arm_func_start CARD_CompareCardID
CARD_CompareCardID: ; 0x038006E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl OS_GetLockID
	mov r4, r0
	mvn r0, #2
	cmp r4, r0
	beq _03800758
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_TryLockCard
	cmp r0, #0
	bne _0380074C
	ldr r1, _03800778 ; =0x027FFC10
	ldrh r0, [r1]
	cmp r0, #0
	subeq r0, r1, #0x410
	subne r0, r1, #0x10
	ldr r0, [r0]
	str r0, [sp]
	bl CARDi_ReadRomID
	ldr r1, [sp]
	cmp r0, r1
	mov r0, r4, lsl #0x10
	moveq r5, #1
	mov r0, r0, lsr #0x10
	movne r5, #0
	bl OS_UnlockCard
_0380074C:
	mov r0, r4, lsl #0x10
	mov r0, r0, lsr #0x10
	bl OS_ReleaseLockID
_03800758:
	ldr r1, _0380077C ; =skipCheck$3668
	cmp r5, #0
	moveq r2, #1
	movne r2, #0
	str r2, [r1, #0xc]
	mov r0, r5
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03800778: .word 0x027FFC10
_0380077C: .word skipCheck$3668
	arm_func_end CARD_CompareCardID

	arm_func_start CARD_IsCardIreqLo
CARD_IsCardIreqLo: ; 0x03800780
	ldr r0, _038007A4 ; =0x04000214
	mov r2, #1
	ldr r1, [r0]
	mov r0, r2
	tst r1, #0x100000
	ldrne r1, _038007A8 ; =skipCheck$3668
	movne r0, #0
	strne r2, [r1, #0xc]
	bx lr
	.align 2, 0
_038007A4: .word 0x04000214
_038007A8: .word skipCheck$3668
	arm_func_end CARD_IsCardIreqLo

	arm_func_start CARD_CheckPullOut_Polling
CARD_CheckPullOut_Polling: ; 0x038007AC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _03800898 ; =skipCheck$3668
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
	ldr r2, _0380089C ; =0x027FFC40
	ldrh r0, [r2]
	cmp r0, #2
	beq _03800890
	ldr r1, _038008A0 ; =nextCount$3668
	mvn r0, #0
	ldr r3, [r1]
	cmp r3, r0
	ldreq r0, [r2, #-4]
	addeq r0, r0, #0xa
	streq r0, [r1]
	beq _03800890
	ldr r0, [r2, #-4]!
	cmp r0, r3
	blo _03800890
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1]
	bl CARD_IsPulledOut
	cmp r0, #0
	beq _03800840
	ldr r0, _03800898 ; =skipCheck$3668
	mov r1, #1
	str r1, [r0, #4]
	bl CARD_GetRomHeader
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _03800840
	ldr r0, _038008A0 ; =nextCount$3668
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _03800890
_03800840:
	ldr r0, _03800898 ; =skipCheck$3668
	ldr r1, _038008A0 ; =nextCount$3668
	ldr r0, [r0, #4]
	mov r2, #0
	str r2, [r1, #4]
	cmp r0, #0
	beq _03800890
	mov r7, #0x64
	mov r6, #0xe
	mov r5, #0x11
	mov r4, r2
	b _03800878
_03800870:
	mov r0, r7
	bl VENEER_SVC_WaitByLoop
_03800878:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl PXI_SendWordByFifo
	cmp r0, #0
	bne _03800870
_03800890:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03800898: .word skipCheck$3668
_0380089C: .word 0x027FFC40
_038008A0: .word nextCount$3668
	arm_func_end CARD_CheckPullOut_Polling

	.rodata

SinTable: ; 0x0380664C
	.byte 0x00, 0x06, 0x0C, 0x13
	.byte 0x19, 0x1F, 0x25, 0x2B, 0x31, 0x36, 0x3C, 0x41, 0x47, 0x4C, 0x51, 0x55, 0x5A, 0x5E, 0x62, 0x66
	.byte 0x6A, 0x6D, 0x70, 0x73, 0x75, 0x78, 0x7A, 0x7B, 0x7D, 0x7E, 0x7E, 0x7F, 0x7F

	.balign 4, 0

SNDi_DecibelTable: ; 0x03806670
	.byte 0x00, 0x80, 0x2E, 0xFD, 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD, 0xEE, 0xFD, 0x09, 0xFE
	.byte 0x20, 0xFE, 0x34, 0xFE, 0x46, 0xFE, 0x57, 0xFE, 0x66, 0xFE, 0x74, 0xFE, 0x81, 0xFE, 0x8D, 0xFE
	.byte 0x98, 0xFE, 0xA3, 0xFE, 0xAD, 0xFE, 0xB6, 0xFE, 0xBF, 0xFE, 0xC7, 0xFE, 0xCF, 0xFE, 0xD7, 0xFE
	.byte 0xDF, 0xFE, 0xE6, 0xFE, 0xEC, 0xFE, 0xF3, 0xFE, 0xF9, 0xFE, 0xFF, 0xFE, 0x05, 0xFF, 0x0B, 0xFF
	.byte 0x11, 0xFF, 0x16, 0xFF, 0x1B, 0xFF, 0x20, 0xFF, 0x25, 0xFF, 0x2A, 0xFF, 0x2E, 0xFF, 0x33, 0xFF
	.byte 0x37, 0xFF, 0x3C, 0xFF, 0x40, 0xFF, 0x44, 0xFF, 0x48, 0xFF, 0x4C, 0xFF, 0x50, 0xFF, 0x53, 0xFF
	.byte 0x57, 0xFF, 0x5B, 0xFF, 0x5E, 0xFF, 0x62, 0xFF, 0x65, 0xFF, 0x68, 0xFF, 0x6B, 0xFF, 0x6F, 0xFF
	.byte 0x72, 0xFF, 0x75, 0xFF, 0x78, 0xFF, 0x7B, 0xFF, 0x7E, 0xFF, 0x81, 0xFF, 0x83, 0xFF, 0x86, 0xFF
	.byte 0x89, 0xFF, 0x8C, 0xFF, 0x8E, 0xFF, 0x91, 0xFF, 0x93, 0xFF, 0x96, 0xFF, 0x99, 0xFF, 0x9B, 0xFF
	.byte 0x9D, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA5, 0xFF, 0xA7, 0xFF, 0xA9, 0xFF, 0xAB, 0xFF, 0xAE, 0xFF
	.byte 0xB0, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF, 0xB6, 0xFF, 0xB8, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBE, 0xFF
	.byte 0xC0, 0xFF, 0xC2, 0xFF, 0xC4, 0xFF, 0xC6, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCC, 0xFF, 0xCE, 0xFF
	.byte 0xCF, 0xFF, 0xD1, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD8, 0xFF, 0xDA, 0xFF, 0xDC, 0xFF
	.byte 0xDD, 0xFF, 0xDF, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF, 0xE7, 0xFF, 0xE9, 0xFF
	.byte 0xEA, 0xFF, 0xEC, 0xFF, 0xED, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF, 0xF5, 0xFF
	.byte 0xF6, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF, 0xFA, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFF, 0xFF, 0x00, 0x00

shift$4005: ; 0x03806770
	.byte 0x00, 0x01, 0x02, 0x04

channel_order$3829: ; 0x03806774
	.byte 0x04, 0x05, 0x06, 0x07, 0x02, 0x00, 0x03, 0x01, 0x08, 0x09, 0x0A, 0x0B
	.byte 0x0E, 0x0C, 0x0F, 0x0D

attack_table$3790: ; 0x03806784
	.byte 0x00, 0x01, 0x05, 0x0E, 0x1A, 0x26, 0x33, 0x3F, 0x49, 0x54, 0x5C, 0x64
	.byte 0x6D, 0x74, 0x7B, 0x7F, 0x84, 0x89, 0x8F

	.balign 4, 0
arg$3806: ; 0x03806798
	.byte 0xC7

	.balign 4, 0
arg$3983: ; 0x0380679C
	.byte 0x05

	.balign 4, 0
buf$3759: ; 0x038067A0
	.byte 0x06

	.section .data,4,1,1

sMasterPan: ; 0x03806AEC
	.word 0xFFFFFFFF

u$3681: ; 0x03806AF0
	.word 0x12345678

_03806AF4:
	.byte 50

	.balign 4, 0
_03806AF8:
	.word 1

cardi_rom_header_addr: ; 0x03806AFC
	.word 0x027FFE00

nextCount$3668: ; 0x03806B00
	.word 0xFFFFFFFF

isFirstCheck$3676: ; 0x03806B04
	.word 1

	.bss

	.type PADi_XYButtonAlarm,@object
	.public PADi_XYButtonAlarm
PADi_XYButtonAlarm: ; 0x03806E80
	.space 0x2C
	.size PADi_XYButtonAlarm,.-PADi_XYButtonAlarm

	.type sSurroundDecay,@object
sSurroundDecay: ; 0x03806EAC
	.space 0x4
	.size sSurroundDecay,.-sSurroundDecay

	.type sOrgPan,@object
sOrgPan: ; 0x03806EB0
	.space 0x10
	.size sOrgPan,.-sOrgPan

	.type sOrgVolume,@object
sOrgVolume: ; 0x03806EC0
	.space 0x10
	.size sOrgVolume,.-sOrgVolume

	.type initialized$3619,@object
initialized$3619: ; 0x03806ED0
	.space 0x4
	.size initialized$3619,.-initialized$3619

	.type sndMesgBuffer,@object
sndMesgBuffer: ; 0x03806ED4
	.space 0x20
	.size sndMesgBuffer,.-sndMesgBuffer

	.type sndMesgQueue,@object
sndMesgQueue: ; 0x03806EF4
	.space 0x20
	.size sndMesgQueue,.-sndMesgQueue

	.type sndAlarm,@object
sndAlarm: ; 0x03806F14
	.space 0x2C
	.size sndAlarm,.-sndAlarm

	.type sndThread,@object
sndThread: ; 0x03806F40
	.space 0xA4
	.size sndThread,.-sndThread

	.type sndStack,@object
sndStack: ; 0x03806FE4
	.space 0x400
	.size sndStack,.-sndStack

	.type sWeakLockChannel,@object
sWeakLockChannel: ; 0x038073E4
	.space 0x4
	.size sWeakLockChannel,.-sWeakLockChannel

	.type sLockChannel,@object
sLockChannel: ; 0x038073E8
	.space 0x4
	.size sLockChannel,.-sLockChannel

	.type sMmlPrintEnable,@object
sMmlPrintEnable: ; 0x038073EC
	.space 0x4
	.size sMmlPrintEnable,.-sMmlPrintEnable

	.type seqCache,@object
seqCache: ; 0x038073F0
	.space 0x18
	.size seqCache,.-seqCache

	.type SNDi_SharedWork,@object
SNDi_SharedWork: ; 0x03807408
	.space 0x4
	.size SNDi_SharedWork,.-SNDi_SharedWork

	.type SNDi_Work,@object
SNDi_Work: ; 0x0380740C
	.space 0x1180
	.size SNDi_Work,.-SNDi_Work

	.type sCommandMesgQueue,@object
sCommandMesgQueue: ; 0x0380858C
	.space 0x20
	.size sCommandMesgQueue,.-sCommandMesgQueue

	.type sCommandMesgBuffer,@object
sCommandMesgBuffer: ; 0x038085AC
	.space 0x20
	.size sCommandMesgBuffer,.-sCommandMesgBuffer

	.type CARDi_EnableFlag,@object
CARDi_EnableFlag: ; 0x038085CC
	.space 0x4
	.size CARDi_EnableFlag,.-CARDi_EnableFlag

	.balign 32, 0
	.type cardi_common,@object
cardi_common: ; 0x038085E0
	.space 0x200
	.size cardi_common,.-cardi_common

	.type cardi_thread_stack,@object
cardi_thread_stack: ; 0x038087E0
	.space 0x400
	.size cardi_thread_stack,.-cardi_thread_stack

	.type status_checked$3825,@object
status_checked$3825: ; 0x03808BE0
	.space 0x4
	.size status_checked$3825,.-status_checked$3825

	.type cardi_param,@object
cardi_param: ; 0x03808BE4
	.space 0x10
	.size cardi_param,.-cardi_param

	.type cardi_rom_base,@object
cardi_rom_base: ; 0x03808BF4
	.space 0x4
	.size cardi_rom_base,.-cardi_rom_base

	.balign 32, 0
	.type rom_stat,@object
rom_stat: ; 0x03808C00
	.space 0x220
	.size rom_stat,.-rom_stat

	.type skipCheck$3668,@object
skipCheck$3668: ; 0x03808E20
	.space 0x4
	.size skipCheck$3668,.-skipCheck$3668

	.type isCardPullOut,@object
isCardPullOut: ; 0x03808E24
	.space 0x4
	.size isCardPullOut,.-isCardPullOut

	.type isInitialized$3621,@object
isInitialized$3621: ; 0x03808E28
	.space 0x4
	.size isInitialized$3621,.-isInitialized$3621

	.type detectPullOut,@object
detectPullOut: ; 0x03808E2C
	.space 0x4
	.size detectPullOut,.-detectPullOut
