	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D0EB0:
	.space 4
_021D0EB4:
	.space 0x20
_021D0ED4:
	.space 0x20

	.text

	thumb_func_start sub_0200B150
sub_0200B150: ; 0x0200B150
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	cmp r4, #4
	bge _0200B164
	mov r0, #4
	cmp r1, #0x7c
	ble _0200B164
	sub r4, r0, r4
	sub r1, r1, r4
_0200B164:
	cmp r2, #1
	bge _0200B174
	mov r4, #1
	cmp r3, #0x1e
	ble _0200B176
	sub r2, r4, r2
	sub r3, r3, r2
	b _0200B176
_0200B174:
	add r4, r2, #0
_0200B176:
	ldr r2, [sp, #0x20]
	str r2, [sp]
	ldr r2, [sp, #0x24]
	str r2, [sp, #4]
	ldr r2, [sp, #0x28]
	str r2, [sp, #8]
	ldr r2, [sp, #0x2c]
	str r2, [sp, #0xc]
	ldr r2, [sp, #0x30]
	str r2, [sp, #0x10]
	add r2, r4, #0
	bl sub_0200B194
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end sub_0200B150

	thumb_func_start sub_0200B194
sub_0200B194: ; 0x0200B194
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0200B220 ; =_021D0EB0
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _0200B1AC
	bl GF_AssertFail
_0200B1AC:
	ldr r0, [sp, #0x30]
	mov r1, #0x3c
	bl AllocFromHeap
	ldr r1, _0200B220 ; =_021D0EB0
	cmp r0, #0
	str r0, [r1]
	bne _0200B1C0
	bl GF_AssertFail
_0200B1C0:
	ldr r1, _0200B220 ; =_021D0EB0
	lsl r3, r6, #0x10
	ldr r2, [sp, #0x30]
	ldr r0, [r1]
	lsr r3, r3, #0x10
	str r2, [r0, #0x38]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r1]
	lsl r1, r5, #0x10
	lsl r2, r4, #0x10
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl NNS_G2dGetNewOamManagerInstance
	cmp r0, #0
	bne _0200B1EC
	bl GF_AssertFail
_0200B1EC:
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0200B220 ; =_021D0EB0
	ldr r2, [sp, #0x24]
	ldr r3, [sp, #0x28]
	ldr r0, [r0]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x1c
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl NNS_G2dGetNewOamManagerInstance
	cmp r0, #0
	bne _0200B21C
	bl GF_AssertFail
_0200B21C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200B220: .word _021D0EB0
	thumb_func_end sub_0200B194

	thumb_func_start sub_0200B224
sub_0200B224: ; 0x0200B224
	push {r3, lr}
	ldr r0, _0200B240 ; =_021D0EB0
	ldr r0, [r0]
	cmp r0, #0
	beq _0200B23C
	bl NNS_G2dApplyAndResetOamManagerBuffer
	ldr r0, _0200B240 ; =_021D0EB0
	ldr r0, [r0]
	add r0, #0x1c
	bl NNS_G2dApplyAndResetOamManagerBuffer
_0200B23C:
	pop {r3, pc}
	nop
_0200B240: .word _021D0EB0
	thumb_func_end sub_0200B224

	thumb_func_start sub_0200B244
sub_0200B244: ; 0x0200B244
	push {r3, lr}
	ldr r0, _0200B278 ; =_021D0EB0
	ldr r0, [r0]
	cmp r0, #0
	bne _0200B252
	bl GF_AssertFail
_0200B252:
	ldr r0, _0200B278 ; =_021D0EB0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_0200B2E0
	ldr r0, _0200B278 ; =_021D0EB0
	ldr r0, [r0]
	ldr r0, [r0, #0x38]
	bl sub_0200B2E8
	ldr r0, _0200B278 ; =_021D0EB0
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _0200B278 ; =_021D0EB0
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_0200B278: .word _021D0EB0
	thumb_func_end sub_0200B244

	thumb_func_start sub_0200B27C
sub_0200B27C: ; 0x0200B27C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, _0200B2C8 ; =_021D0EB0
	add r7, r1, #0
	ldr r0, [r0]
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #0
	bne _0200B294
	bl GF_AssertFail
_0200B294:
	cmp r5, #1
	bne _0200B2B0
	ldr r0, _0200B2CC ; =sub_02025C98
	ldr r2, _0200B2D0 ; =sub_0200B2F0
	str r0, [sp]
	str r5, [sp, #4]
	ldr r3, _0200B2D4 ; =sub_0200B334
	add r0, r6, #0
	add r1, r7, #0
	str r4, [sp, #8]
	bl sub_02025C54
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0200B2B0:
	ldr r0, _0200B2CC ; =sub_02025C98
	ldr r2, _0200B2D8 ; =sub_0200B310
	str r0, [sp]
	str r5, [sp, #4]
	ldr r3, _0200B2DC ; =sub_0200B358
	add r0, r6, #0
	add r1, r7, #0
	str r4, [sp, #8]
	bl sub_02025C54
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0200B2C8: .word _021D0EB0
_0200B2CC: .word sub_02025C98
_0200B2D0: .word sub_0200B2F0
_0200B2D4: .word sub_0200B334
_0200B2D8: .word sub_0200B310
_0200B2DC: .word sub_0200B358
	thumb_func_end sub_0200B27C

	thumb_func_start sub_0200B2E0
sub_0200B2E0: ; 0x0200B2E0
	ldr r3, _0200B2E4 ; =sub_02024BBC
	bx r3
	.balign 4, 0
_0200B2E4: .word sub_02024BBC
	thumb_func_end sub_0200B2E0

	thumb_func_start sub_0200B2E8
sub_0200B2E8: ; 0x0200B2E8
	ldr r3, _0200B2EC ; =sub_02024BF4
	bx r3
	.balign 4, 0
_0200B2EC: .word sub_02024BF4
	thumb_func_end sub_0200B2E8

	thumb_func_start sub_0200B2F0
sub_0200B2F0: ; 0x0200B2F0
	push {r4, lr}
	add r3, r0, #0
	ldr r0, _0200B30C ; =_021D0EB0
	add r2, r1, #0
	ldr r0, [r0]
	add r1, r3, #0
	bl NNS_G2dEntryOamManagerOamWithAffineIdx
	add r4, r0, #0
	bne _0200B308
	bl GF_AssertFail
_0200B308:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0200B30C: .word _021D0EB0
	thumb_func_end sub_0200B2F0

	thumb_func_start sub_0200B310
sub_0200B310: ; 0x0200B310
	push {r4, lr}
	add r3, r0, #0
	ldr r0, _0200B330 ; =_021D0EB0
	add r2, r1, #0
	ldr r0, [r0]
	add r1, r3, #0
	add r0, #0x1c
	bl NNS_G2dEntryOamManagerOamWithAffineIdx
	add r4, r0, #0
	bne _0200B32A
	bl GF_AssertFail
_0200B32A:
	add r0, r4, #0
	pop {r4, pc}
	nop
_0200B330: .word _021D0EB0
	thumb_func_end sub_0200B310

	thumb_func_start sub_0200B334
sub_0200B334: ; 0x0200B334
	push {r4, lr}
	add r1, r0, #0
	ldr r0, _0200B350 ; =_021D0EB0
	ldr r0, [r0]
	bl NNS_G2dEntryOamManagerAffine
	add r4, r0, #0
	ldr r0, _0200B354 ; =0x0000FFFE
	cmp r4, r0
	bne _0200B34C
	bl GF_AssertFail
_0200B34C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0200B350: .word _021D0EB0
_0200B354: .word 0x0000FFFE
	thumb_func_end sub_0200B334

	thumb_func_start sub_0200B358
sub_0200B358: ; 0x0200B358
	push {r4, lr}
	add r1, r0, #0
	ldr r0, _0200B378 ; =_021D0EB0
	ldr r0, [r0]
	add r0, #0x1c
	bl NNS_G2dEntryOamManagerAffine
	add r4, r0, #0
	ldr r0, _0200B37C ; =0x0000FFFE
	cmp r4, r0
	bne _0200B372
	bl GF_AssertFail
_0200B372:
	add r0, r4, #0
	pop {r4, pc}
	nop
_0200B378: .word _021D0EB0
_0200B37C: .word 0x0000FFFE
	thumb_func_end sub_0200B358

	thumb_func_start sub_0200B380
sub_0200B380: ; 0x0200B380
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x10
	ldrsb r2, [r5, r0]
	mov r0, #0x14
	ldrsh r0, [r5, r0]
	add r1, r2, #0
	mov r7, #0x1a
	ldrsh r2, [r5, r7]
	mul r1, r0
	mov r6, #0xa
	ldrsh r0, [r5, r6]
	add r1, r2, r1
	mov r4, #0
	cmp r0, r1
	beq _0200B3DE
	cmp r2, r0
	beq _0200B3DE
	strh r1, [r5, #0x1a]
	ldrh r3, [r5, #0x18]
	ldrh r0, [r5, #0x16]
	add r2, r5, #0
	add r1, r5, #0
	add r0, r3, r0
	strh r0, [r5, #0x18]
	ldrh r3, [r5, #0x18]
	ldrh r0, [r5, #8]
	add r2, #0x1a
	add r1, #0x18
	cmp r3, r0
	blo _0200B3E2
	mov r3, #0x10
	ldrsh r0, [r2, r4]
	ldrsb r3, [r5, r3]
	add r0, r0, r3
	strh r0, [r2]
	ldrsh r2, [r5, r7]
	ldrsh r0, [r5, r6]
	cmp r2, r0
	beq _0200B3DA
	ldrh r2, [r1]
	ldrh r0, [r5, #8]
	sub r0, r2, r0
	strh r0, [r1]
	b _0200B3E2
_0200B3DA:
	mov r4, #1
	b _0200B3E2
_0200B3DE:
	strh r0, [r5, #0x1a]
	mov r4, #1
_0200B3E2:
	ldr r1, [r5, #4]
	mov r0, #1
	tst r0, r1
	beq _0200B3F8
	mov r2, #0x1a
	ldrsh r2, [r5, r2]
	ldr r0, _0200B414 ; =0x04000050
	ldr r1, [r5]
	bl G2x_SetBlendBrightness_
	b _0200B40A
_0200B3F8:
	mov r0, #2
	tst r0, r1
	beq _0200B40A
	mov r2, #0x1a
	ldrsh r2, [r5, r2]
	ldr r0, _0200B418 ; =0x04001050
	ldr r1, [r5]
	bl G2x_SetBlendBrightness_
_0200B40A:
	cmp r4, #1
	bne _0200B412
	mov r0, #0
	str r0, [r5, #0x1c]
_0200B412:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200B414: .word 0x04000050
_0200B418: .word 0x04001050
	thumb_func_end sub_0200B380

	thumb_func_start sub_0200B41C
sub_0200B41C: ; 0x0200B41C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _0200B430
	bl GF_AssertFail
_0200B430:
	ldr r1, [sp, #0x18]
	mov r0, #1
	lsl r1, r1, #0x18
	str r0, [r5, #0x1c]
	lsr r1, r1, #0x18
	str r1, [r5]
	ldr r1, [sp, #0x1c]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [r5, #4]
	strh r4, [r5, #8]
	strh r6, [r5, #0xa]
	strh r7, [r5, #0x1a]
	sub r1, r7, r6
	strh r1, [r5, #0x12]
	mov r1, #0x12
	ldrsh r2, [r5, r1]
	cmp r2, #0
	ble _0200B45C
	sub r1, #0x13
	strb r1, [r5, #0x10]
	b _0200B466
_0200B45C:
	strb r0, [r5, #0x10]
	ldrsh r0, [r5, r1]
	sub r1, #0x13
	mul r1, r0
	strh r1, [r5, #0x12]
_0200B466:
	mov r0, #0x12
	ldrsh r0, [r5, r0]
	add r1, r4, #0
	bl _s32_div_f
	strh r0, [r5, #0x14]
	mov r0, #0x12
	ldrsh r0, [r5, r0]
	add r1, r4, #0
	bl _s32_div_f
	strh r1, [r5, #0x16]
	mov r0, #0
	strh r0, [r5, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0200B41C

	thumb_func_start sub_0200B484
sub_0200B484: ; 0x0200B484
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	cmp r5, #0
	beq _0200B4DA
	ldr r1, [sp, #0x20]
	mov r0, #1
	tst r0, r1
	beq _0200B4B6
	ldr r0, _0200B4E0 ; =0x04000050
	add r1, r4, #0
	bl G2x_SetBlendBrightness_
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0200B4E4 ; =_021D0ED4
	add r1, r5, #0
	add r2, r7, #0
	add r3, r6, #0
	bl sub_0200B41C
_0200B4B6:
	ldr r1, [sp, #0x20]
	mov r0, #2
	tst r0, r1
	beq _0200B4DA
	ldr r0, _0200B4E8 ; =0x04001050
	add r1, r4, #0
	add r2, r6, #0
	bl G2x_SetBlendBrightness_
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _0200B4EC ; =_021D0EB4
	add r1, r5, #0
	add r2, r7, #0
	add r3, r6, #0
	bl sub_0200B41C
_0200B4DA:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200B4E0: .word 0x04000050
_0200B4E4: .word _021D0ED4
_0200B4E8: .word 0x04001050
_0200B4EC: .word _021D0EB4
	thumb_func_end sub_0200B484

	thumb_func_start SetBrightness
SetBrightness: ; 0x0200B4F0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	mov r0, #1
	add r6, r1, #0
	tst r0, r4
	beq _0200B506
	ldr r0, _0200B520 ; =0x04000050
	add r2, r5, #0
	bl G2x_SetBlendBrightness_
_0200B506:
	mov r0, #2
	tst r0, r4
	beq _0200B516
	ldr r0, _0200B524 ; =0x04001050
	add r1, r6, #0
	add r2, r5, #0
	bl G2x_SetBlendBrightness_
_0200B516:
	add r0, r4, #0
	bl sub_0200B554
	pop {r4, r5, r6, pc}
	nop
_0200B520: .word 0x04000050
_0200B524: .word 0x04001050
	thumb_func_end SetBrightness

	thumb_func_start sub_0200B528
sub_0200B528: ; 0x0200B528
	push {r3, lr}
	ldr r0, _0200B548 ; =_021D0ED4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r0, _0200B54C ; =_021D0EB4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r0, _0200B550 ; =_021D0EB4
	mov r1, #0
	str r1, [r0, #0x3c]
	str r1, [r0, #0x1c]
	pop {r3, pc}
	.balign 4, 0
_0200B548: .word _021D0ED4
_0200B54C: .word _021D0EB4
_0200B550: .word _021D0EB4
	thumb_func_end sub_0200B528

	thumb_func_start sub_0200B554
sub_0200B554: ; 0x0200B554
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	tst r0, r4
	beq _0200B56E
	ldr r0, _0200B588 ; =_021D0ED4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r0, _0200B58C ; =_021D0EB4
	mov r1, #0
	str r1, [r0, #0x3c]
_0200B56E:
	mov r0, #2
	tst r0, r4
	beq _0200B584
	ldr r0, _0200B590 ; =_021D0EB4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r0, _0200B58C ; =_021D0EB4
	mov r1, #0
	str r1, [r0, #0x1c]
_0200B584:
	pop {r4, pc}
	nop
_0200B588: .word _021D0ED4
_0200B58C: .word _021D0EB4
_0200B590: .word _021D0EB4
	thumb_func_end sub_0200B554

	thumb_func_start sub_0200B594
sub_0200B594: ; 0x0200B594
	push {r3, lr}
	ldr r0, _0200B5B4 ; =_021D0EB4
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	beq _0200B5A4
	ldr r0, _0200B5B8 ; =_021D0ED4
	bl sub_0200B380
_0200B5A4:
	ldr r0, _0200B5B4 ; =_021D0EB4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0200B5B2
	ldr r0, _0200B5BC ; =_021D0EB4
	bl sub_0200B380
_0200B5B2:
	pop {r3, pc}
	.balign 4, 0
_0200B5B4: .word _021D0EB4
_0200B5B8: .word _021D0ED4
_0200B5BC: .word _021D0EB4
	thumb_func_end sub_0200B594

	thumb_func_start sub_0200B5C0
sub_0200B5C0: ; 0x0200B5C0
	cmp r0, #3
	bne _0200B5D6
	ldr r0, _0200B5FC ; =_021D0EB4
	ldr r1, [r0, #0x3c]
	cmp r1, #0
	bne _0200B5F6
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	bne _0200B5F6
	mov r0, #1
	bx lr
_0200B5D6:
	cmp r0, #1
	bne _0200B5E6
	ldr r0, _0200B5FC ; =_021D0EB4
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	bne _0200B5F6
	mov r0, #1
	bx lr
_0200B5E6:
	cmp r0, #2
	bne _0200B5F6
	ldr r0, _0200B5FC ; =_021D0EB4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	bne _0200B5F6
	mov r0, #1
	bx lr
_0200B5F6:
	mov r0, #0
	bx lr
	nop
_0200B5FC: .word _021D0EB4
	thumb_func_end sub_0200B5C0

	thumb_func_start sub_0200B600
sub_0200B600: ; 0x0200B600
	lsl r1, r1, #8
	orr r1, r0
	ldr r0, _0200B60C ; =_021D0EB4
	str r1, [r0, #0x20]
	bx lr
	nop
_0200B60C: .word _021D0EB4
	thumb_func_end sub_0200B600
