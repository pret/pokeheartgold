	.include "asm/macros.inc"
	.include "overlay_121.inc"
	.include "global.inc"

	.text

	.extern ov121_021E6168

	thumb_func_start ov121_021E633C
ov121_021E633C: ; 0x021E633C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
	bl System_GetTouchHeld
	cmp r0, #0
	bne _021E63A2
	ldr r0, _021E6400 ; =gSystem
	ldr r4, [r0, #0x48]
	cmp r4, #0
	beq _021E63A2
	cmp r4, #0x20
	bgt _021E6370
	bge _021E6386
	cmp r4, #2
	bgt _021E636A
	cmp r4, #1
	blt _021E63A2
	beq _021E639A
	cmp r4, #2
	beq _021E639E
	b _021E63A2
_021E636A:
	cmp r4, #0x10
	beq _021E638A
	b _021E63A2
_021E6370:
	cmp r4, #0x80
	bgt _021E637C
	bge _021E6392
	cmp r4, #0x40
	beq _021E638E
	b _021E63A2
_021E637C:
	mov r0, #1
	lsl r0, r0, #0xa
	cmp r4, r0
	beq _021E6396
	b _021E63A2
_021E6386:
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E638A:
	mov r0, #7
	pop {r4, r5, r6, pc}
_021E638E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6392:
	mov r0, #2
	pop {r4, r5, r6, pc}
_021E6396:
	mov r0, #5
	pop {r4, r5, r6, pc}
_021E639A:
	mov r0, #8
	pop {r4, r5, r6, pc}
_021E639E:
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E63A2:
	cmp r4, #0
	bne _021E63FC
	bl System_GetTouchNew
	cmp r0, #0
	beq _021E63FC
	mov r0, #0x8b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl TouchscreenHitbox_FindHitboxAtTouchNew
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021E63FC
	cmp r0, #9
	bhi _021E63FC
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E63D0: ; jump table
	.short _021E63E4 - _021E63D0 - 2 ; case 0
	.short _021E63E4 - _021E63D0 - 2 ; case 1
	.short _021E63E4 - _021E63D0 - 2 ; case 2
	.short _021E63E4 - _021E63D0 - 2 ; case 3
	.short _021E63E4 - _021E63D0 - 2 ; case 4
	.short _021E63E4 - _021E63D0 - 2 ; case 5
	.short _021E63EA - _021E63D0 - 2 ; case 6
	.short _021E63EE - _021E63D0 - 2 ; case 7
	.short _021E63F4 - _021E63D0 - 2 ; case 8
	.short _021E63F8 - _021E63D0 - 2 ; case 9
_021E63E4:
	str r0, [r5]
	mov r0, #3
	pop {r4, r5, r6, pc}
_021E63EA:
	mov r0, #5
	pop {r4, r5, r6, pc}
_021E63EE:
	str r0, [r5]
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E63F4:
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E63F8:
	mov r0, #7
	pop {r4, r5, r6, pc}
_021E63FC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6400: .word gSystem
	thumb_func_end ov121_021E633C

	thumb_func_start ov121_021E6404
ov121_021E6404: ; 0x021E6404
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #8
	bhi _021E646E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6418: ; jump table
	.short _021E646E - _021E6418 - 2 ; case 0
	.short _021E646E - _021E6418 - 2 ; case 1
	.short _021E646E - _021E6418 - 2 ; case 2
	.short _021E646E - _021E6418 - 2 ; case 3
	.short _021E6458 - _021E6418 - 2 ; case 4
	.short _021E643C - _021E6418 - 2 ; case 5
	.short _021E642A - _021E6418 - 2 ; case 6
	.short _021E6434 - _021E6418 - 2 ; case 7
	.short _021E6458 - _021E6418 - 2 ; case 8
_021E642A:
	mov r1, #0
	mvn r1, r1
	bl ov121_021E662C
	b _021E646E
_021E6434:
	mov r1, #1
	bl ov121_021E662C
	b _021E646E
_021E643C:
	ldr r0, _021E6474 ; =0x000005DD
	bl PlaySE
	mov r0, #0x8a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #9
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #1
	bl ov121_021E6690
	b _021E646E
_021E6458:
	ldr r0, _021E6474 ; =0x000005DD
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r0, #1
	pop {r4, pc}
_021E646E:
	mov r0, #0
	pop {r4, pc}
	nop
_021E6474: .word 0x000005DD
	thumb_func_end ov121_021E6404

	thumb_func_start ov121_021E6478
ov121_021E6478: ; 0x021E6478
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #8
	bhi _021E653A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E648C: ; jump table
	.short _021E653A - _021E648C - 2 ; case 0
	.short _021E649E - _021E648C - 2 ; case 1
	.short _021E64A8 - _021E648C - 2 ; case 2
	.short _021E64B0 - _021E648C - 2 ; case 3
	.short _021E64EC - _021E648C - 2 ; case 4
	.short _021E64B8 - _021E648C - 2 ; case 5
	.short _021E653A - _021E648C - 2 ; case 6
	.short _021E653A - _021E648C - 2 ; case 7
	.short _021E6508 - _021E648C - 2 ; case 8
_021E649E:
	mov r1, #0
	mvn r1, r1
	bl ov121_021E6544
	pop {r4, pc}
_021E64A8:
	mov r1, #1
	bl ov121_021E6544
	pop {r4, pc}
_021E64B0:
	add r1, r2, #0
	bl ov121_021E65A8
	pop {r4, pc}
_021E64B8:
	ldr r0, _021E653C ; =0x00000232
	ldrsb r1, [r4, r0]
	add r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	ldr r0, _021E6540 ; =0x000005DD
	bge _021E64D2
	bl PlaySE
	add r0, r4, #0
	bl ov121_021E6EC0
	pop {r4, pc}
_021E64D2:
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	bl ov121_021E6690
	pop {r4, pc}
_021E64EC:
	ldr r0, _021E6540 ; =0x000005DD
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	bl ov121_021E6690
	pop {r4, pc}
_021E6508:
	ldr r0, _021E653C ; =0x00000232
	ldrsb r1, [r4, r0]
	add r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	ldr r0, _021E6540 ; =0x000005DD
	bge _021E6522
	bl PlaySE
	add r0, r4, #0
	bl ov121_021E6EC0
	pop {r4, pc}
_021E6522:
	bl PlaySE
	mov r0, #0x89
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	bl ov121_021E6690
_021E653A:
	pop {r4, pc}
	.balign 4, 0
_021E653C: .word 0x00000232
_021E6540: .word 0x000005DD
	thumb_func_end ov121_021E6478

	thumb_func_start ov121_021E6544
ov121_021E6544: ; 0x021E6544
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	ble _021E6570
	ldr r2, _021E65A0 ; =0x00000232
	ldrsb r0, [r4, r2]
	cmp r0, #6
	bne _021E655A
	mov r0, #0
	strb r0, [r4, r2]
	b _021E6592
_021E655A:
	add r1, r0, r1
	add r0, r2, #0
	add r0, #0x2f
	ldrb r0, [r4, r0]
	cmp r1, r0
	blt _021E656C
	mov r0, #6
	strb r0, [r4, r2]
	b _021E6592
_021E656C:
	strb r1, [r4, r2]
	b _021E6592
_021E6570:
	bge _021E6592
	ldr r2, _021E65A0 ; =0x00000232
	ldrsb r0, [r4, r2]
	cmp r0, #6
	bne _021E6586
	add r0, r2, #0
	add r0, #0x2f
	ldrb r0, [r4, r0]
	sub r0, r0, #1
	strb r0, [r4, r2]
	b _021E6592
_021E6586:
	add r0, r0, r1
	bpl _021E6590
	mov r0, #6
	strb r0, [r4, r2]
	b _021E6592
_021E6590:
	strb r0, [r4, r2]
_021E6592:
	ldr r0, _021E65A4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov121_021E65D8
	pop {r4, pc}
	.balign 4, 0
_021E65A0: .word 0x00000232
_021E65A4: .word 0x000005DC
	thumb_func_end ov121_021E6544

	thumb_func_start ov121_021E65A8
ov121_021E65A8: ; 0x021E65A8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	beq _021E65BA
	ldr r0, _021E65CC ; =0x00000261
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _021E65CA
_021E65BA:
	ldr r0, _021E65D0 ; =0x000005DC
	bl PlaySE
	ldr r0, _021E65D4 ; =0x00000232
	strb r4, [r5, r0]
	add r0, r5, #0
	bl ov121_021E65D8
_021E65CA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E65CC: .word 0x00000261
_021E65D0: .word 0x000005DC
_021E65D4: .word 0x00000232
	thumb_func_end ov121_021E65A8

	thumb_func_start ov121_021E65D8
ov121_021E65D8: ; 0x021E65D8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r2, _021E661C ; =0x00000232
	mov r0, #0xc
	ldrb r3, [r5, r2]
	sub r2, #0x1a
	add r4, r3, #0
	mul r4, r0
	ldr r0, _021E6620 ; =ov121_021E7140
	ldr r0, [r0, r4]
	lsl r0, r0, #0xc
	str r0, [sp]
	ldr r0, _021E6624 ; =ov121_021E7140 + 4
	ldr r0, [r0, r4]
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	bl Sprite_SetMatrix
	mov r0, #0x86
	ldr r1, _021E6628 ; =ov121_021E7140 + 8
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [r1, r4]
	bl Set2dSpriteAnimSeqNo
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_021E661C: .word 0x00000232
_021E6620: .word ov121_021E7140
_021E6624: .word ov121_021E7140 + 4
_021E6628: .word ov121_021E7140 + 8
	thumb_func_end ov121_021E65D8

	thumb_func_start ov121_021E662C
ov121_021E662C: ; 0x021E662C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x26
	lsl r0, r0, #4
	add r4, r1, #0
	ldrb r1, [r5, r0]
	add r1, r1, r4
	bpl _021E6644
	sub r0, r0, #2
	ldrb r0, [r5, r0]
	sub r1, r0, #1
	b _021E664E
_021E6644:
	sub r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r1, r0
	blt _021E664E
	mov r1, #0
_021E664E:
	mov r0, #0x26
	lsl r0, r0, #4
	strb r1, [r5, r0]
	mov r0, #0x5e
	lsl r0, r0, #4
	bl PlaySE
	cmp r4, #0
	ble _021E666E
	mov r0, #0x87
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	b _021E667C
_021E666E:
	bge _021E667C
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
_021E667C:
	add r0, r5, #0
	bl ov121_021E6DD8
	ldr r0, _021E668C ; =0x00000233
	mov r1, #0
	strb r1, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_021E668C: .word 0x00000233
	thumb_func_end ov121_021E662C

	thumb_func_start ov121_021E6690
ov121_021E6690: ; 0x021E6690
	push {r4, lr}
	ldr r2, _021E66E8 ; =0x00000231
	add r4, r0, #0
	strb r1, [r4, r2]
	cmp r1, #0
	bne _021E66C0
	add r0, r2, #1
	mov r1, #6
	strb r1, [r4, r0]
	sub r2, #0x15
	ldr r0, [r4, r2]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov121_021E67E4
	b _021E66E0
_021E66C0:
	add r0, r2, #1
	mov r1, #0
	sub r2, #0x15
	strb r1, [r4, r0]
	ldr r0, [r4, r2]
	bl Set2dSpriteVisibleFlag
	mov r0, #0x22
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov121_021E6E68
_021E66E0:
	add r0, r4, #0
	bl ov121_021E65D8
	pop {r4, pc}
	.balign 4, 0
_021E66E8: .word 0x00000231
	thumb_func_end ov121_021E6690

	thumb_func_start ov121_021E66EC
ov121_021E66EC: ; 0x021E66EC
	push {r3, r4, lr}
	sub sp, #0x14
	mov r1, #0x1e
	add r4, r0, #0
	mov r0, #0
	lsl r1, r1, #4
	mov r2, #0x9e
	bl LoadFontPal0
	mov r0, #7
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r2, #1
	str r2, [sp, #0x10]
	ldr r0, [r4]
	add r1, r4, #4
	mov r3, #5
	bl AddWindowParameterized
	mov r3, #7
	add r1, r4, #0
	str r3, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x19
	str r0, [sp, #0x10]
	ldr r0, [r4]
	add r1, #0x14
	mov r2, #1
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	add r0, #0xfa
	str r0, [sp, #0x10]
	add r1, r4, #0
	mov r2, #2
	ldr r0, [r4]
	add r1, #0x24
	add r3, r2, #0
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _021E67DC ; =0x00000179
	add r1, #0x34
	str r0, [sp, #0x10]
	ldr r0, [r4]
	mov r3, #0x19
	bl AddWindowParameterized
	mov r0, #0x15
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	str r2, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, _021E67E0 ; =0x00000185
	add r1, #0x44
	str r0, [sp, #0x10]
	ldr r0, [r4]
	mov r3, #4
	bl AddWindowParameterized
	mov r0, #1
	str r0, [sp]
	mov r0, #0x1c
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x54
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0x9a
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	mov r1, #0
	mov r2, #1
	str r0, [sp]
	mov r0, #0x9e
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r3, #0xc
	bl LoadUserFrameGfx2
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_021E67DC: .word 0x00000179
_021E67E0: .word 0x00000185
	thumb_func_end ov121_021E66EC

	thumb_func_start ov121_021E67E4
ov121_021E67E4: ; 0x021E67E4
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x54
	mov r1, #1
	bl ClearFrameAndWindow2
	add r4, #0x54
	add r0, r4, #0
	bl ClearWindowTilemapAndCopyToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov121_021E67E4

	thumb_func_start ov121_021E67FC
ov121_021E67FC: ; 0x021E67FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r4, r0, #0
	ldr r1, _021E69EC ; =0x0000025E
	mov r0, #0x9e
	ldrb r2, [r4, r1]
	mov r1, #0x3c
	mul r1, r2
	bl AllocFromHeap
	mov r2, #0x95
	lsl r2, r2, #2
	str r0, [r4, r2]
	ldr r0, [r4, r2]
	add r2, #0xa
	ldrb r3, [r4, r2]
	mov r2, #0x3c
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	mov r1, #0x97
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x9e
	bl sub_0202E9FC
	mov r1, #0x8e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	add r1, #0x26
	str r0, [sp, #0x10]
	ldrb r0, [r4, r1]
	cmp r0, #0
	bgt _021E684A
	b _021E69E8
_021E684A:
	ldr r0, [sp, #0x10]
	str r4, [sp, #8]
	str r0, [sp, #4]
	add r5, r0, #0
_021E6852:
	mov r2, #0x8d
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r0, [r4, r2]
	add r2, #0x29
	add r1, #0x2b
	ldrb r3, [r4, r2]
	mov r2, #0xd
	ldrb r1, [r4, r1]
	mul r2, r3
	add r2, r1, r2
	ldr r1, [sp, #0x10]
	add r1, r1, r2
	mov r2, #0x9e
	bl sub_0202EA80
	mov r1, #0x8f
	mov r3, #0
	ldr r2, [sp, #8]
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r0, r2, #0
	ldr r0, [r0, r1]
	mov ip, r3
	str r0, [sp, #0xc]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E68BE
	sub r0, r1, #4
	ldr r0, [r4, r0]
	add r3, r1, #0
	add r2, r0, #4
	ldr r0, [sp, #4]
	add r3, #0x18
	add r2, r2, r0
	add r0, r1, #0
	add r0, #0x18
	ldr r0, [r4, r0]
	add r0, r0, r5
	str r2, [r0, #4]
	add r0, r1, #0
	add r0, #0x18
	ldr r0, [r4, r0]
	mov r2, #1
	add r0, r0, r5
	strh r2, [r0, #8]
	ldr r3, [r4, r3]
	mov r0, #0xff
	add r3, r3, r5
	add r1, #0x18
	strb r0, [r3, #0xa]
	ldr r0, [r4, r1]
	str r2, [r0, r5]
	b _021E69C8
_021E68BE:
	add r2, r3, #0
	cmp r0, #0
	ble _021E6980
	ldr r0, [sp, #0xc]
	str r0, [sp]
	add r7, r0, #4
_021E68CA:
	mov r0, ip
	cmp r0, #0
	bne _021E6944
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp, #4]
	add r1, r1, r0
	ldr r6, [r1, #8]
	ldr r1, [sp]
	ldr r1, [r1, #8]
	cmp r6, r1
	blo _021E6944
	add r6, r0, #4
	ldr r0, [sp, #4]
	lsl r1, r3, #3
	add r0, r6, r0
	mov r6, #0x95
	lsl r6, r6, #2
	ldr r6, [r4, r6]
	add r3, r3, #1
	add r6, r5, r6
	add r6, r1, r6
	str r0, [r6, #4]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r6, r1, r0
	mov r0, #1
	strh r0, [r6, #8]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r6, r3, #3
	add r0, r5, r0
	add r1, r1, r0
	mov r0, #0xff
	strb r0, [r1, #0xa]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r0, r6, r0
	str r7, [r0, #4]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r1, r6, r0
	mov r0, #1
	strh r0, [r1, #8]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r0, r6, r0
	strb r2, [r0, #0xa]
	mov r0, #1
	mov ip, r0
	b _021E696C
_021E6944:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r6, r3, #3
	add r0, r5, r0
	add r0, r6, r0
	str r7, [r0, #4]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r1, r6, r0
	mov r0, #1
	strh r0, [r1, #8]
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r0, r5, r0
	add r0, r6, r0
	strb r2, [r0, #0xa]
_021E696C:
	ldr r0, [sp]
	add r2, r2, #1
	add r0, #0xc
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r3, r3, #1
	ldr r0, [r0]
	add r7, #0xc
	cmp r2, r0
	blt _021E68CA
_021E6980:
	mov r0, ip
	cmp r0, #0
	bne _021E69BA
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	lsl r2, r3, #3
	add r3, r1, #4
	ldr r1, [sp, #4]
	add r1, r3, r1
	add r3, r0, #0
	add r3, #0x1c
	ldr r3, [r4, r3]
	add r3, r3, r5
	add r3, r2, r3
	str r1, [r3, #4]
	add r3, r0, #0
	add r3, #0x1c
	ldr r3, [r4, r3]
	mov r1, #1
	add r3, r3, r5
	add r3, r2, r3
	strh r1, [r3, #8]
	add r0, #0x1c
	ldr r0, [r4, r0]
	mov r1, #0xff
	add r0, r0, r5
	add r0, r2, r0
	strb r1, [r0, #0xa]
_021E69BA:
	ldr r0, [sp, #0xc]
	ldr r0, [r0]
	add r1, r0, #1
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r1, [r0, r5]
_021E69C8:
	ldr r0, [sp, #8]
	add r5, #0x3c
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, _021E69EC ; =0x0000025E
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bge _021E69E8
	b _021E6852
_021E69E8:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E69EC: .word 0x0000025E
	thumb_func_end ov121_021E67FC

	thumb_func_start ov121_021E69F0
ov121_021E69F0: ; 0x021E69F0
	push {r4, r5, r6, lr}
	ldr r2, _021E6A48 ; =0x000001A5
	add r6, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r3, #0x9e
	bl NewMsgDataFromNarc
	str r0, [r6, #0x64]
	mov r0, #2
	mov r1, #0x4c
	mov r2, #0x9e
	bl MessageFormat_New_Custom
	str r0, [r6, #0x68]
	mov r0, #0x4c
	mov r1, #0x9e
	bl String_New
	str r0, [r6, #0x6c]
	ldr r0, [r6, #0x64]
	mov r1, #0x2b
	bl NewString_ReadMsgData
	str r0, [r6, #0x70]
	ldr r0, [r6, #0x64]
	mov r1, #0x2a
	bl NewString_ReadMsgData
	str r0, [r6, #0x74]
	mov r4, #0
	add r5, r6, #0
_021E6A30:
	add r1, r4, #0
	ldr r0, [r6, #0x64]
	add r1, #0x2c
	bl NewString_ReadMsgData
	str r0, [r5, #0x78]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _021E6A30
	pop {r4, r5, r6, pc}
	nop
_021E6A48: .word 0x000001A5
	thumb_func_end ov121_021E69F0

	thumb_func_start ov121_021E6A4C
ov121_021E6A4C: ; 0x021E6A4C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021E6A54:
	ldr r0, [r5, #0x78]
	bl String_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _021E6A54
	ldr r0, [r6, #0x70]
	bl String_Delete
	ldr r0, [r6, #0x74]
	bl String_Delete
	ldr r0, [r6, #0x6c]
	bl String_Delete
	ldr r0, [r6, #0x68]
	bl MessageFormat_Delete
	ldr r0, [r6, #0x64]
	bl DestroyMsgData
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov121_021E6A4C

	thumb_func_start ov121_021E6A84
ov121_021E6A84: ; 0x021E6A84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r2, #0x26
	lsl r2, r2, #4
	add r1, r2, #0
	add r4, r0, #0
	sub r1, #0xc
	ldr r1, [r4, r1]
	ldrb r0, [r4, r2]
	str r1, [sp, #0x20]
	mov r1, #0x3c
	mul r1, r0
	str r1, [sp, #0x24]
	sub r1, r2, #4
	ldrb r1, [r4, r1]
	lsl r0, r0, #3
	lsl r2, r1, #2
	ldr r1, _021E6C4C ; =ov121_021E7014
	ldr r1, [r1, r2]
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp, #0x18]
	mov r0, #0
	add r1, r0, #0
	ldr r2, _021E6C50 ; =0x00000261
	str r1, [sp, #0x1c]
	strb r1, [r4, r2]
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x14]
	ldr r1, [r2, r1]
	cmp r1, #0
	bgt _021E6ADC
	b _021E6C04
_021E6ADC:
	ldr r1, [sp, #0x24]
	add r7, r0, #0
	add r1, r2, r1
	str r1, [sp, #0x2c]
	add r1, r4, #0
	str r1, [sp, #0x28]
	add r1, #0x14
	str r1, [sp, #0x28]
_021E6AEC:
	ldr r1, [sp, #0x2c]
	ldrh r1, [r1, #8]
	cmp r1, #0
	beq _021E6BEA
	ldr r1, [sp, #0x2c]
	ldr r1, [r1, #4]
	ldr r5, [r1, #4]
	ldr r1, [sp, #0x10]
	ldr r1, [r1]
	cmp r5, r1
	bls _021E6B04
	add r5, r1, #0
_021E6B04:
	cmp r5, r0
	bge _021E6B0E
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_021E6B0E:
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x68]
	ldr r2, [sp, #0x18]
	mov r1, #0
	mov r3, #1
	bl BufferIntegerAsString
	ldr r0, [r4, #0x68]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x74]
	bl StringExpandPlaceholders
	mov r1, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x6c]
	add r0, r4, #4
	bl AddTextPrinterParameterizedWithColor
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r2, [sp, #0x2c]
	ldr r0, [r4, #0x68]
	ldr r2, [r2, #4]
	mov r1, #1
	ldr r2, [r2, #8]
	mov r3, #2
	bl BufferString
	ldr r0, [r4, #0x68]
	ldr r1, [r4, #0x6c]
	ldr r2, [r4, #0x70]
	bl StringExpandPlaceholders
	mov r1, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [r4, #0x6c]
	bl AddTextPrinterParameterizedWithColor
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #0x10]
	ldr r0, [r4, #0x68]
	ldrh r3, [r3, #4]
	mov r1, #0
	add r2, r5, #0
	bl BufferIntegerAsString
	ldr r2, [sp, #0x10]
	ldr r0, [r4, #0x68]
	ldrh r2, [r2, #6]
	ldr r1, [r4, #0x6c]
	lsl r2, r2, #2
	add r2, r4, r2
	sub r2, #0x38
	ldr r2, [r2]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r4, #0x6c]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov ip, r0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6C54 ; =0x00010200
	mov r3, #0xa0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r6, ip
	ldr r0, [sp, #0x28]
	ldr r2, [r4, #0x6c]
	mov r1, #0
	sub r3, r3, r6
	bl AddTextPrinterParameterizedWithColor
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	add r2, r4, r0
	ldr r0, _021E6C58 ; =0x00000262
	add r7, #0x10
	strb r1, [r2, r0]
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	add r1, r1, #1
	str r1, [sp, #0x14]
	cmp r1, #6
	bge _021E6C04
_021E6BEA:
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x20]
	add r1, #8
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	str r1, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	ldr r2, [r2, r1]
	ldr r1, [sp, #0x1c]
	cmp r1, r2
	bge _021E6C04
	b _021E6AEC
_021E6C04:
	add r0, r4, #0
	add r0, #0x14
	bl CopyWindowToVram
	add r0, r4, #4
	bl CopyWindowToVram
	ldr r1, _021E6C50 ; =0x00000261
	ldr r0, [sp, #0x14]
	strb r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x30
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _021E6C46
	add r0, r1, #0
	sub r0, #0x2f
	ldrsb r2, [r4, r0]
	ldrb r0, [r4, r1]
	cmp r2, r0
	blt _021E6C46
	cmp r2, #7
	bne _021E6C36
	bl GF_AssertFail
_021E6C36:
	ldr r0, _021E6C50 ; =0x00000261
	ldrb r1, [r4, r0]
	sub r0, #0x2f
	sub r1, r1, #1
	strb r1, [r4, r0]
	add r0, r4, #0
	bl ov121_021E65D8
_021E6C46:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6C4C: .word ov121_021E7014
_021E6C50: .word 0x00000261
_021E6C54: .word 0x00010200
_021E6C58: .word 0x00000262
	thumb_func_end ov121_021E6A84

	thumb_func_start ov121_021E6C5C
ov121_021E6C5C: ; 0x021E6C5C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x44
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x28
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CA0 ; =0x00030100
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x44
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x44
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6CA0: .word 0x00030100
	thumb_func_end ov121_021E6C5C

	thumb_func_start ov121_021E6CA4
ov121_021E6CA4: ; 0x021E6CA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0x34
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x29
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6CE8 ; =0x00030100
	mov r1, #4
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x34
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x34
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6CE8: .word 0x00030100
	thumb_func_end ov121_021E6CA4

	thumb_func_start ov121_021E6CEC
ov121_021E6CEC: ; 0x021E6CEC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _021E6D78 ; =0x00000232
	add r5, r0, #0
	ldrsb r0, [r5, r1]
	mov r3, #0xc
	add r2, r5, r0
	add r0, r1, #0
	add r0, #0x30
	ldrb r4, [r2, r0]
	add r0, r1, #0
	add r1, #0x2e
	add r0, #0x22
	ldr r2, [r5, r0]
	ldrb r1, [r5, r1]
	mov r0, #0x3c
	mul r0, r1
	add r6, r2, r0
	add r0, r5, #0
	mov r1, #1
	add r0, #0x54
	add r2, r1, #0
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r2, r4, #3
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	add r2, r6, r2
	ldr r2, [r2, #4]
	ldr r0, [r5, #0x68]
	ldr r2, [r2, #8]
	mov r1, #0
	bl BufferString
	ldr r0, [r5, #0x68]
	ldr r1, [r5, #0x64]
	mov r2, #0x31
	mov r3, #0x9e
	bl ReadMsgData_ExpandPlaceholders
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6D7C ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6D78: .word 0x00000232
_021E6D7C: .word 0x00010200
	thumb_func_end ov121_021E6CEC

	thumb_func_start ov121_021E6D80
ov121_021E6D80: ; 0x021E6D80
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #1
	add r5, r0, #0
	add r0, #0x54
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x34
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6DD4 ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6DD4: .word 0x00010200
	thumb_func_end ov121_021E6D80

	thumb_func_start ov121_021E6DD8
ov121_021E6DD8: ; 0x021E6DD8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x24
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x97
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E6DF4
	mov r1, #0x35
	b _021E6DF6
_021E6DF4:
	mov r1, #0x41
_021E6DF6:
	mov r0, #0x26
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	lsl r0, r0, #1
	add r5, r1, r0
	ldr r0, [r4, #0x64]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r4, #0x64]
	add r1, r5, #1
	bl NewString_ReadMsgData
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x24
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6E64 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x24
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r6, #0
	bl String_Delete
	add r0, r5, #0
	bl String_Delete
	add r4, #0x24
	add r0, r4, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021E6E64: .word 0x00010200
	thumb_func_end ov121_021E6DD8

	thumb_func_start ov121_021E6E68
ov121_021E6E68: ; 0x021E6E68
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r1, #1
	add r5, r0, #0
	add r0, #0x54
	add r2, r1, #0
	mov r3, #0xc
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0xff
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x64]
	mov r1, #0x30
	bl NewString_ReadMsgData
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E6EBC ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x54
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	bl String_Delete
	add r5, #0x54
	add r0, r5, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E6EBC: .word 0x00010200
	thumb_func_end ov121_021E6E68

	thumb_func_start ov121_021E6EC0
ov121_021E6EC0: ; 0x021E6EC0
	push {r4, r5, lr}
	sub sp, #0x14
	mov r2, #0x95
	lsl r2, r2, #2
	add r3, r2, #0
	add r4, r0, #0
	add r3, #0xc
	ldrb r5, [r4, r3]
	mov r3, #0x3c
	ldr r1, [r4, r2]
	mul r3, r5
	add r1, r1, r3
	add r3, r2, #0
	sub r3, #0x22
	ldrsb r3, [r4, r3]
	add r1, r1, #4
	add r5, r4, r3
	add r3, r2, #0
	add r3, #0xe
	ldrb r3, [r5, r3]
	lsl r3, r3, #3
	add r3, r1, r3
	add r1, r2, #4
	str r3, [r4, r1]
	ldr r1, [r4, r1]
	ldrb r1, [r1, #6]
	cmp r1, #0xff
	bne _021E6F0C
	mov r1, #3
	sub r2, #0x21
	strb r1, [r4, r2]
	bl ov121_021E6D80
	ldr r0, _021E6F50 ; =0x000005F2
	bl PlaySE
	add sp, #0x14
	pop {r4, r5, pc}
_021E6F0C:
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x8f
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #6
	strb r1, [r0, #0x11]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	bl YesNoPrompt_InitFromTemplate
	add r0, r4, #0
	bl ov121_021E6CEC
	bl ov121_021E6F58
	ldr r0, _021E6F54 ; =0x00000233
	mov r1, #2
	strb r1, [r4, r0]
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_021E6F50: .word 0x000005F2
_021E6F54: .word 0x00000233
	thumb_func_end ov121_021E6EC0

	thumb_func_start ov121_021E6F58
ov121_021E6F58: ; 0x021E6F58
	mov r1, #0x1e
	add r2, r1, #0
	ldr r3, _021E6F64 ; =G2x_SetBlendBrightness_
	ldr r0, _021E6F68 ; =0x04000050
	sub r2, #0x25
	bx r3
	.balign 4, 0
_021E6F64: .word G2x_SetBlendBrightness_
_021E6F68: .word 0x04000050
	thumb_func_end ov121_021E6F58

	thumb_func_start ov121_021E6F6C
ov121_021E6F6C: ; 0x021E6F6C
	ldr r0, _021E6F74 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
_021E6F74: .word 0x04000050
	thumb_func_end ov121_021E6F6C

	thumb_func_start ov121_021E6F78
ov121_021E6F78: ; 0x021E6F78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021E700C ; =0x0000025E
	ldrb r0, [r4, r0]
	cmp r0, #0
	ble _021E7008
	ldr r0, [sp, #4]
	str r0, [sp]
_021E6F8E:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	ldr r0, [sp]
	mov r6, #0
	add r1, r2, r0
	ldr r0, [r2, r0]
	add r7, r6, #0
	cmp r0, #0
	ble _021E6FF2
	add r5, r6, #0
_021E6FA4:
	add r0, r1, #4
	add r1, r0, r5
	ldrb r0, [r1, #6]
	mov ip, r0
	cmp r0, #0xff
	beq _021E6FDC
	ldrh r0, [r1, #4]
	cmp r0, #0
	bne _021E6FDC
	ldr r1, _021E7010 ; =0x0000025F
	mov r0, #0x8d
	ldrb r3, [r4, r1]
	sub r1, r1, #2
	ldrb r2, [r4, r1]
	mov r1, #0xd
	lsl r0, r0, #2
	mul r1, r2
	add r2, r3, r1
	ldr r1, [sp, #4]
	ldr r0, [r4, r0]
	add r1, r1, r2
	mov r2, ip
	sub r2, r2, r6
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0202E544
	add r6, r6, #1
_021E6FDC:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp]
	ldr r2, [sp]
	add r1, r1, r0
	ldr r0, [r2, r0]
	add r7, r7, #1
	add r5, #8
	cmp r7, r0
	blt _021E6FA4
_021E6FF2:
	ldr r0, [sp]
	add r0, #0x3c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, _021E700C ; =0x0000025E
	ldrb r1, [r4, r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	blt _021E6F8E
_021E7008:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E700C: .word 0x0000025E
_021E7010: .word 0x0000025F
	thumb_func_end ov121_021E6F78

	.rodata

	.global ov121_021E7014
ov121_021E7014:
	.word ov121_021E7110
	.word ov121_021E70C8

	.global ov121_021E701C
ov121_021E701C: ; 0x021E701C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E702C
ov121_021E702C: ; 0x021E702C
	.byte 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00

	.global ov121_021E703C
ov121_021E703C: ; 0x021E703C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x04
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E7058
ov121_021E7058: ; 0x021E7058
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.global ov121_021E7074
ov121_021E7074: ; 0x021E7074
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E7090
ov121_021E7090: ; 0x021E7090
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E70AC
ov121_021E70AC: ; 0x021E70AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov121_021E70C8
ov121_021E70C8:
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00, 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2E, 0x00
	.byte 0x3F, 0x42, 0x0F, 0x00, 0x06, 0x00, 0x2F, 0x00

	.global ov121_021E70E8
ov121_021E70E8: ; 0x021E70E8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

	.global ov121_021E7110
ov121_021E7110:
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00
	.byte 0x0F, 0x27, 0x00, 0x00, 0x04, 0x00, 0x2C, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x2D, 0x00

	.global ov121_021E7140
ov121_021E7140: ; 0x021E7140
	.byte 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0xE0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	; 0x021E7194
