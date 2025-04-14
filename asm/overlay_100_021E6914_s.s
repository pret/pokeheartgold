	.include "asm/macros.inc"
	.include "overlay_100.inc"
	.include "global.inc"

    .extern ov100_021E6C4C
    .extern ov100_021E6CF4

	.text

	thumb_func_start ov100_021E6F88
ov100_021E6F88: ; 0x021E6F88
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	strh r5, [r4]
	lsl r5, r5, #5
	add r0, r6, #0
	add r1, r5, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #4]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6F88

	thumb_func_start ov100_021E6FBC
ov100_021E6FBC: ; 0x021E6FBC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r2, [r5]
	mov r4, #0
	cmp r2, #0
	ble _021E6FF0
	add r6, r4, #0
_021E6FCA:
	ldr r1, [r5, #4]
	add r0, r1, r6
	ldrb r1, [r1, r6]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021E6FE6
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _021E6FE6
	lsl r1, r4, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl ov100_021E70A4
_021E6FE6:
	ldrh r2, [r5]
	add r4, r4, #1
	add r6, #0x20
	cmp r4, r2
	blt _021E6FCA
_021E6FF0:
	ldr r0, [r5, #4]
	mov r1, #0
	lsl r2, r2, #5
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6FBC

	thumb_func_start ov100_021E7014
ov100_021E7014: ; 0x021E7014
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	str r1, [sp]
	add r7, r2, #0
	add r5, r3, #0
	bl ov100_021E70FC
	add r6, r0, #0
	ldr r0, _021E70A0 ; =0x0000FFFF
	cmp r6, r0
	beq _021E709C
	ldr r2, [r4, #4]
	lsl r1, r6, #5
	ldrb r0, [r2, r1]
	mov r3, #1
	add r4, r2, r1
	bic r0, r3
	mov r3, #1
	orr r0, r3
	strb r0, [r2, r1]
	ldrb r3, [r2, r1]
	mov r0, #4
	orr r0, r3
	strb r0, [r2, r1]
	strb r7, [r4, #2]
	ldrb r0, [r4, #2]
	mov r1, #0xc
	sub r0, r0, #1
	strb r0, [r4, #3]
	ldrb r2, [r4, #2]
	ldr r0, [sp, #0x1c]
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldrb r3, [r4, #2]
	mov r2, #0xc
	ldr r0, [sp]
	ldr r1, [r4, #4]
	mul r2, r3
	bl MI_CpuCopy8
	ldrb r0, [r4, #2]
	cmp r5, r0
	blo _021E7074
	mov r0, #0
	strb r0, [r4, #1]
	b _021E7076
_021E7074:
	strb r5, [r4, #1]
_021E7076:
	ldrb r0, [r4]
	mov r1, #2
	bic r0, r1
	ldr r1, [sp, #0x18]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1e
	orr r0, r1
	strb r0, [r4]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x1c]
	add r0, r6, #0
_021E709C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E70A0: .word 0x0000FFFF
	thumb_func_end ov100_021E7014

	thumb_func_start ov100_021E70A4
ov100_021E70A4: ; 0x021E70A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	cmp r1, r0
	bhs _021E70BA
	ldr r0, [r5, #4]
	lsl r4, r1, #5
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E70BE
_021E70BA:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E70BE:
	ldrh r0, [r5, #2]
	cmp r0, r1
	bne _021E70CC
	ldr r0, _021E70F8 ; =0x0000FFFF
	strh r0, [r5, #2]
	mov r0, #0
	str r0, [r5, #8]
_021E70CC:
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, r0, r4
	ldrb r3, [r2, #2]
	ldr r0, [r2, #4]
	mov r2, #0xc
	mul r2, r3
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	add r0, r0, r4
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, [r5, #4]
	mov r1, #0
	add r0, r0, r4
	mov r2, #0x20
	bl MI_CpuFill8
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E70F8: .word 0x0000FFFF
	thumb_func_end ov100_021E70A4

	thumb_func_start ov100_021E70FC
ov100_021E70FC: ; 0x021E70FC
	ldrh r1, [r0]
	mov r3, #0
	cmp r1, #0
	bls _021E711E
	ldr r0, [r0, #4]
_021E7106:
	lsl r2, r3, #5
	ldrb r2, [r0, r2]
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bne _021E7114
	add r0, r3, #0
	bx lr
_021E7114:
	add r2, r3, #1
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	cmp r3, r1
	blo _021E7106
_021E711E:
	ldr r0, _021E7124 ; =0x0000FFFF
	bx lr
	nop
_021E7124: .word 0x0000FFFF
	thumb_func_end ov100_021E70FC

	thumb_func_start ov100_021E7128
ov100_021E7128: ; 0x021E7128
	push {r4, r5, r6, lr}
	add r6, r1, #0
	ldr r1, _021E71B0 ; =0x0000FFFF
	add r5, r2, #0
	cmp r6, r1
	bne _021E7138
	ldr r4, [r0, #8]
	b _021E7150
_021E7138:
	ldrh r1, [r0]
	cmp r6, r1
	bhs _021E714C
	ldr r1, [r0, #4]
	lsl r0, r6, #5
	add r4, r1, r0
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E7150
_021E714C:
	ldr r0, _021E71B0 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021E7150:
	ldrb r0, [r4]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E7184
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	ldrb r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	b _021E71AC
_021E7184:
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	ldrb r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
_021E71AC:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E71B0: .word 0x0000FFFF
	thumb_func_end ov100_021E7128

	thumb_func_start ov100_021E71B4
ov100_021E71B4: ; 0x021E71B4
	push {r3, r4, r5, lr}
	ldr r2, _021E72F4 ; =0x0000FFFF
	cmp r1, r2
	bne _021E71C0
	ldr r4, [r0, #8]
	b _021E71CE
_021E71C0:
	ldrh r2, [r0]
	cmp r1, r2
	blo _021E71C8
	b _021E72F2
_021E71C8:
	ldr r2, [r0, #4]
	lsl r0, r1, #5
	add r4, r2, r0
_021E71CE:
	ldrb r1, [r4, #1]
	mov r0, #0xc
	ldr r2, [r4, #4]
	mul r0, r1
	add r5, r2, r0
	ldrb r0, [r4]
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1f
	bne _021E726A
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E71F2
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, pc}
_021E71F2:
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, pc}
_021E726A:
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E727C
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl UnkImageStruct_SetSpritePositionXY
	pop {r3, r4, r5, pc}
_021E727C:
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
_021E72F2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E72F4: .word 0x0000FFFF
	thumb_func_end ov100_021E71B4

	thumb_func_start ov100_021E72F8
ov100_021E72F8: ; 0x021E72F8
	push {r4, lr}
	add r4, r1, #0
	ldrh r1, [r0]
	cmp r4, r1
	blo _021E7306
	ldr r0, _021E7330 ; =0x0000FFFF
	pop {r4, pc}
_021E7306:
	ldr r1, [r0, #4]
	lsl r3, r4, #5
	add r1, r1, r3
	str r1, [r0, #8]
	strh r4, [r0, #2]
	cmp r2, #0xff
	beq _021E7326
	ldr r1, [r0, #4]
	add r3, r1, r3
	ldrb r1, [r3, #2]
	cmp r2, r1
	blo _021E7324
	mov r1, #0
	strb r1, [r3, #1]
	b _021E7326
_021E7324:
	strb r2, [r3, #1]
_021E7326:
	ldr r1, _021E7330 ; =0x0000FFFF
	bl ov100_021E71B4
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_021E7330: .word 0x0000FFFF
	thumb_func_end ov100_021E72F8

	thumb_func_start ov100_021E7334
ov100_021E7334: ; 0x021E7334
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
	.balign 4, 0
	thumb_func_end ov100_021E7334

	thumb_func_start ov100_021E733C
ov100_021E733C: ; 0x021E733C
	ldr r2, _021E7364 ; =0x0000FFFF
	cmp r1, r2
	bne _021E7348
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
_021E7348:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E735A
	lsl r2, r1, #5
	ldr r1, [r0, #4]
	ldrb r0, [r1, r2]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E735E
_021E735A:
	mov r0, #0
	bx lr
_021E735E:
	add r0, r1, r2
	ldrb r0, [r0, #1]
	bx lr
	.balign 4, 0
_021E7364: .word 0x0000FFFF
	thumb_func_end ov100_021E733C

	thumb_func_start ov100_021E7368
ov100_021E7368: ; 0x021E7368
	push {r3, r4}
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021E73A8
	ldrb r3, [r0, #1]
	mov r2, #0xc
	ldr r4, [r0, #4]
	mul r2, r3
	add r2, r4, r2
	cmp r1, #3
	bhi _021E739E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E738A: ; jump table
	.short _021E739E - _021E738A - 2 ; case 0
	.short _021E7392 - _021E738A - 2 ; case 1
	.short _021E7396 - _021E738A - 2 ; case 2
	.short _021E739A - _021E738A - 2 ; case 3
_021E7392:
	ldrb r2, [r2, #3]
	b _021E73A0
_021E7396:
	ldrb r2, [r2, #4]
	b _021E73A0
_021E739A:
	ldrb r2, [r2, #5]
	b _021E73A0
_021E739E:
	ldrb r2, [r2, #2]
_021E73A0:
	ldrb r1, [r0, #3]
	cmp r2, r1
	bhi _021E73A8
	strb r2, [r0, #1]
_021E73A8:
	pop {r3, r4}
	bx lr
	thumb_func_end ov100_021E7368

	thumb_func_start ov100_021E73AC
ov100_021E73AC: ; 0x021E73AC
	push {r4, lr}
	add r4, r0, #0
	bl ov100_021E7368
	ldr r1, _021E73C4 ; =0x0000FFFF
	add r0, r4, #0
	bl ov100_021E71B4
	ldr r0, [r4, #8]
	ldrb r0, [r0, #1]
	pop {r4, pc}
	nop
_021E73C4: .word 0x0000FFFF
	thumb_func_end ov100_021E73AC

	thumb_func_start ov100_021E73C8
ov100_021E73C8: ; 0x021E73C8
	ldr r3, _021E73D0 ; =ov100_021E73D4
	add r2, r1, #0
	ldrh r1, [r0, #2]
	bx r3
	.balign 4, 0
_021E73D0: .word ov100_021E73D4
	thumb_func_end ov100_021E73C8

	thumb_func_start ov100_021E73D4
ov100_021E73D4: ; 0x021E73D4
	push {r3, r4, r5, lr}
	ldr r3, _021E7410 ; =0x0000FFFF
	cmp r1, r3
	bne _021E73E2
	ldr r4, [r0, #8]
	ldrh r1, [r0, #2]
	b _021E73FA
_021E73E2:
	ldrh r3, [r0]
	cmp r1, r3
	bhs _021E73F6
	ldr r5, [r0, #4]
	lsl r3, r1, #5
	add r4, r5, r3
	ldrb r3, [r5, r3]
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1f
	bne _021E73FA
_021E73F6:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E73FA:
	ldrb r3, [r4, #3]
	cmp r3, r2
	bhs _021E7404
	mov r2, #0
	b _021E7404
_021E7404:
	strb r2, [r4, #1]
	bl ov100_021E71B4
	ldrb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	nop
_021E7410: .word 0x0000FFFF
	thumb_func_end ov100_021E73D4

	thumb_func_start ov100_021E7414
ov100_021E7414: ; 0x021E7414
	push {r4, r5, r6, lr}
	add r5, r2, #0
	ldr r2, _021E749C ; =0x0000FFFF
	cmp r1, r2
	bne _021E7420
	ldrh r1, [r0, #2]
_021E7420:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E7498
	ldr r2, [r0, #4]
	lsl r0, r1, #5
	ldrb r1, [r2, r0]
	add r4, r2, r0
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	beq _021E7498
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1f
	bne _021E746A
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _021E7450
	ldr r0, [r4, #0x10]
	bl Sprite_ResetAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl thunk_Set2dSpriteAnimActiveFlag
	pop {r4, r5, r6, pc}
_021E7450:
	mov r6, #0
_021E7452:
	ldr r0, [r4, #0x10]
	bl Sprite_ResetAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl thunk_Set2dSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E7452
	pop {r4, r5, r6, pc}
_021E746A:
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _021E7480
	ldr r0, [r4, #0x10]
	bl UnkImageStruct_ResetSpriteAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	pop {r4, r5, r6, pc}
_021E7480:
	mov r6, #0
_021E7482:
	ldr r0, [r4, #0x10]
	bl UnkImageStruct_ResetSpriteAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E7482
_021E7498:
	pop {r4, r5, r6, pc}
	nop
_021E749C: .word 0x0000FFFF
	thumb_func_end ov100_021E7414

    .rodata

	.global ov100_021E764C
ov100_021E764C: ; 0x021E764C
	.byte 0x01, 0x01, 0x01, 0x01

ov100_021E7650:
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x29, 0x00, 0x28, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x52, 0x00

ov100_021E765E:
	.byte 0x2E, 0x00
	.byte 0x2F, 0x00, 0x2D, 0x00, 0x2C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x53, 0x00

ov100_021E766C:
	.byte 0x26, 0x00, 0x27, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x51, 0x00

ov100_021E767A:
	.byte 0x22, 0x00, 0x23, 0x00, 0x21, 0x00
	.byte 0x20, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x50, 0x00

ov100_021E7688:
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov100_021E769C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

	.global ov100_021E76BC
ov100_021E76BC: ; 0x021E76BC
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E7650
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E766C
	.word 0x000000C0, ov100_021E769C, ov100_021E7688, ov100_021E767A
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E765E
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E767A

	.global ov100_021E770C
ov100_021E770C: ; 0x021E770C
	.byte 0x02, 0x02, 0x02, 0x03
	.byte 0x01, 0x01, 0x01, 0x01
