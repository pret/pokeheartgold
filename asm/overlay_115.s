	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov115_0225F020
ov115_0225F020: ; 0x0225F020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r6, #0
	strh r6, [r5]
	add r4, r5, #0
	ldr r7, [sp, #0x28]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	strh r6, [r5, #2]
	add r4, #0x14
_0225F038:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r3, r7, #0
	bl ov01_021F0718
	str r0, [r5, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #4]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	cmp r6, #3
	beq _0225F07E
	ldr r0, [r5, #4]
	mov r1, #2
	bl sub_0202487C
	ldr r0, [r5, #4]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, r4, #0
	lsr r2, r1, #1
	mov r3, #6
	bl ov01_021EFE70
	b _0225F08C
_0225F07E:
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #6
	bl ov01_021EFE70
_0225F08C:
	add r6, r6, #1
	add r5, r5, #4
	add r4, #0x14
	cmp r6, #4
	blt _0225F038
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov115_0225F020

	thumb_func_start ov115_0225F09C
ov115_0225F09C: ; 0x0225F09C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0225F0A2:
	ldr r0, [r5, #4]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0225F0A2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov115_0225F09C

	thumb_func_start ov115_0225F0B4
ov115_0225F0B4: ; 0x0225F0B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r1, [sp]
	mov r0, #2
	ldrsh r1, [r1, r0]
	cmp r1, #4
	bge _0225F0EE
	ldr r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldrsh r1, [r2, r1]
	sub r2, r1, #1
	ldr r1, [sp]
	strh r2, [r1]
	add r2, r1, #0
	ldr r1, [sp, #4]
	ldrsh r1, [r2, r1]
	cmp r1, #0
	bgt _0225F0EE
	ldr r1, [sp]
	mov r2, #3
	strh r2, [r1]
	ldrsh r0, [r1, r0]
	add r1, r0, #1
	ldr r0, [sp]
	strh r1, [r0, #2]
_0225F0EE:
	ldr r0, [sp]
	mov r1, #2
	ldrsh r0, [r0, r1]
	mov r4, #0
	cmp r0, #0
	ble _0225F150
	ldr r7, [sp]
	ldr r6, [sp]
	add r7, #0x14
	add r5, r6, #0
_0225F102:
	add r0, r7, #0
	bl ov01_021EFE80
	ldr r1, [r6, #0x14]
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F074C
	ldr r0, [r5, #4]
	add r1, sp, #0xc
	bl sub_020247F4
	ldr r0, [r5, #4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0225F132
	mov r0, #0
	str r0, [sp, #4]
	b _0225F13E
_0225F132:
	cmp r4, #3
	beq _0225F13E
	ldr r0, [r5, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0225F13E:
	ldr r1, [sp]
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r4, r4, #1
	add r7, #0x14
	add r6, #0x14
	add r5, r5, #4
	cmp r4, r0
	blt _0225F102
_0225F150:
	ldr r0, [sp, #4]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov115_0225F0B4

	thumb_func_start ov115_0225F158
ov115_0225F158: ; 0x0225F158
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbd
	add r3, r5, #0
	bl NewMsgDataFromNarc
	add r6, r0, #0
	add r0, r5, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #0x80
	add r1, r5, #0
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x80
	add r1, r5, #0
	bl String_ctor
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0
	bl BufferTrainerName
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl DestroyMsgData
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov115_0225F158

	thumb_func_start ov115_0225F1BC
ov115_0225F1BC: ; 0x0225F1BC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	str r0, [sp]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbd
	add r3, r5, #0
	bl NewMsgDataFromNarc
	add r6, r0, #0
	add r0, r5, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	mov r0, #0x80
	add r1, r5, #0
	bl String_ctor
	add r7, r0, #0
	mov r0, #0x80
	add r1, r5, #0
	bl String_ctor
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0
	add r2, r5, #0
	bl ReadMsgDataIntoString
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0
	bl BufferRivalsName
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl DestroyMsgData
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov115_0225F1BC

	thumb_func_start ov115_0225F220
ov115_0225F220: ; 0x0225F220
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r7, r1, #0
	ldr r1, [r5]
	add r6, r2, #0
	ldr r4, [r5, #0xc]
	cmp r1, #0xf
	bls _0225F234
	b _0225F6BC
_0225F234:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0225F240: ; jump table
	.short _0225F260 - _0225F240 - 2 ; case 0
	.short _0225F3C0 - _0225F240 - 2 ; case 1
	.short _0225F3D6 - _0225F240 - 2 ; case 2
	.short _0225F3E2 - _0225F240 - 2 ; case 3
	.short _0225F450 - _0225F240 - 2 ; case 4
	.short _0225F470 - _0225F240 - 2 ; case 5
	.short _0225F49E - _0225F240 - 2 ; case 6
	.short _0225F4EA - _0225F240 - 2 ; case 7
	.short _0225F518 - _0225F240 - 2 ; case 8
	.short _0225F536 - _0225F240 - 2 ; case 9
	.short _0225F5A2 - _0225F240 - 2 ; case 10
	.short _0225F5B8 - _0225F240 - 2 ; case 11
	.short _0225F5DE - _0225F240 - 2 ; case 12
	.short _0225F5F6 - _0225F240 - 2 ; case 13
	.short _0225F616 - _0225F240 - 2 ; case 14
	.short _0225F626 - _0225F240 - 2 ; case 15
_0225F260:
	mov r1, #0xa6
	add r0, r7, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0xa6
	str r0, [r5, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r4, [r5, #0xc]
	mov r0, #0x20
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x20]
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x40
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xa
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r1, #0x9f
	lsl r1, r1, #2
	str r2, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	add r1, r4, r1
	ldr r0, [r0, #8]
	mov r3, #0
	bl AddWindowParameterized
	mov r0, #0x9f
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrh r0, [r6, #8]
	cmp r0, #0x17
	bne _0225F2D4
	ldr r0, [r5, #0x10]
	add r1, r7, #0
	ldr r0, [r0, #0xc]
	bl ov115_0225F1BC
	str r0, [sp, #0x14]
	b _0225F2DE
_0225F2D4:
	ldr r0, [r6, #4]
	add r1, r7, #0
	bl ov115_0225F158
	str r0, [sp, #0x14]
_0225F2DE:
	mov r1, #0
	str r1, [sp]
	ldr r0, _0225F62C ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r2, [sp, #0x14]
	add r0, r4, r0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	bl String_dtor
	add r0, r4, #0
	add r0, #0x44
	mov r1, #8
	mov r2, #3
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	ldrb r0, [r6, #0xd]
	mov r2, #6
	add r1, r4, #0
	str r0, [sp, #4]
	ldrb r0, [r6, #0xe]
	lsl r2, r2, #6
	add r1, #0x44
	str r0, [sp, #8]
	ldrb r0, [r6, #0xf]
	add r2, r4, r2
	str r0, [sp, #0xc]
	ldr r0, _0225F630 ; =0x000927C0
	str r0, [sp, #0x10]
	ldrb r3, [r6, #0xc]
	ldr r0, [r5, #0x20]
	bl ov01_021F0614
	mov r0, #1
	str r0, [sp]
	mov r0, #0x3c
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	ldr r0, _0225F634 ; =0x000927C1
	mov r2, #0x6d
	str r0, [sp, #0x10]
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r0, [r5, #0x20]
	add r1, #0x44
	add r2, r4, r2
	mov r3, #0x3b
	bl ov01_021F0614
	mov r0, #0
	str r0, [sp]
	mov r1, #6
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r1, r1, #6
	mov r2, #0x11
	mov r3, #0x42
	add r0, #0x44
	add r1, r4, r1
	lsl r2, r2, #0x10
	lsl r3, r3, #0xc
	bl ov01_021F0718
	mov r1, #0x7a
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x4a
	mov r2, #0x7b
	lsl r0, r0, #0xc
	str r0, [sp]
	lsl r2, r2, #2
	add r0, r4, r2
	add r1, r4, #0
	sub r2, #0x38
	mov r3, #0x12
	add r1, #0x44
	add r2, r4, r2
	lsl r3, r3, #0xe
	str r7, [sp, #4]
	bl ov115_0225F020
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldrb r2, [r6, #0xc]
	ldr r0, [r4, r0]
	add r1, r7, #0
	mov r3, #0xe
	bl ov115_02260254
	bl ov01_021F0B44
	str r0, [r4, #0x40]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F3C0:
	mov r0, #1
	mov r1, #0x10
	str r0, [sp]
	add r2, r1, #0
	add r3, r5, #4
	bl ov01_021EFCF8
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F3D6:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0225F458
	add r0, r1, #1
	str r0, [r5]
	b _0225F6BC
_0225F3E2:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #8]
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	ldrb r1, [r6, #0x12]
	ldrb r2, [r6, #0x11]
	ldrb r3, [r6, #0x10]
	ldr r0, [r5, #0x20]
	bl ov01_021F0454
	mov r0, #0xa3
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x1f
	str r0, [sp, #4]
	mov r0, #0x17
	str r0, [sp, #8]
	ldr r1, [r4, #0x40]
	add r0, r5, #0
	mov r2, #6
	mov r3, #8
	bl ov01_021F0B78
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #0
	mov r1, #2
	bl SetBgPriority
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F450:
	bl ov01_021EFE30
	cmp r0, #0
	bne _0225F45A
_0225F458:
	b _0225F6BC
_0225F45A:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [r4, #0x40]
	bl ov01_021F0B5C
	mov r0, #0xa5
	mov r1, #0xa
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225F6BC
_0225F470:
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0225F55E
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x7b
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov115_0225F0B4
	cmp r0, #1
	bne _0225F55E
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F49E:
	mov r0, #4
	str r0, [sp]
	mov r1, #0x11
	ldr r2, [r6]
	ldr r3, _0225F638 ; =0xFFFC0000
	add r0, r4, #0
	lsl r1, r1, #0x10
	bl ov01_021EFEC8
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024A04
	mov r2, #0x42
	ldr r1, [r4]
	add r0, sp, #0x1c
	lsl r2, r2, #0xc
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl sub_020247D4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F4EA:
	add r0, r4, #0
	bl ov01_021EFF28
	mov r2, #0x42
	add r6, r0, #0
	ldr r1, [r4]
	add r0, sp, #0x1c
	lsl r2, r2, #0xc
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl sub_020247D4
	cmp r6, #1
	bne _0225F55E
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F518:
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0
	mov r2, #0x10
	mov r3, #3
	bl ov01_021EFE34
	mov r0, #0xa5
	mov r1, #0xa
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F536:
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0225F55E
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFE44
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021F0DC8
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _0225F560
_0225F55E:
	b _0225F6BC
_0225F560:
	mov r3, #0
	str r3, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldrb r2, [r6, #0xc]
	ldr r0, [r4, r0]
	add r1, r7, #0
	bl ov115_02260254
	mov r0, #0xd
	mvn r0, r0
	mov r1, #0x21
	mov r2, #1
	bl SetBlendBrightness
	ldr r3, [r4]
	ldr r0, [r5, #0x10]
	asr r3, r3, #0xc
	sub r3, #0x5c
	ldr r0, [r0, #8]
	mov r1, #2
	mov r2, #0
	neg r3, r3
	bl ScheduleSetBgPosText
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F5A2:
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0x10
	mov r2, #0
	mov r3, #3
	bl ov01_021EFE34
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F5B8:
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFE44
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021F0DC8
	cmp r6, #1
	bne _0225F6BC
	ldr r0, [r5]
	mov r1, #0x1a
	add r0, r0, #1
	str r0, [r5]
	mov r0, #0xa5
	lsl r0, r0, #2
	str r1, [r4, r0]
	b _0225F6BC
_0225F5DE:
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bge _0225F6BC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F5F6:
	mov r0, #0xf
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _0225F63C ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F616:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225F6BC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225F6BC
_0225F626:
	ldr r1, _0225F63C ; =0x00007FFF
	b _0225F640
	nop
_0225F62C: .word 0x00010200
_0225F630: .word 0x000927C0
_0225F634: .word 0x000927C1
_0225F638: .word 0xFFFC0000
_0225F63C: .word 0x00007FFF
_0225F640:
	mov r0, #1
	bl sub_0200FBF4
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _0225F650
	mov r0, #1
	str r0, [r1]
_0225F650:
	mov r0, #0x7a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r0, #0x7b
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov115_0225F09C
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #6
	add r0, #0x44
	add r1, r4, r1
	bl ov01_021F06EC
	mov r1, #0x6d
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0x44
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	add r0, #0x44
	bl ov01_021F05F4
	mov r0, #0x9f
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225F700 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	mov r2, #1
	bl SetBlendBrightness
	ldr r0, [r5, #0x10]
	mov r2, #0
	ldr r0, [r0, #8]
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F6BC:
	mov r3, #0xa3
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	cmp r0, #1
	bne _0225F6EC
	ldr r0, [r5, #0x10]
	add r3, r3, #4
	ldr r0, [r0, #8]
	ldr r3, [r4, r3]
	mov r1, #3
	mov r2, #0
	bl ScheduleSetBgPosText
	mov r3, #0x29
	lsl r3, r3, #4
	ldr r0, [r4, r3]
	add r0, #0x1e
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x17
	sub r1, r1, r2
	mov r0, #0x17
	ror r1, r0
	add r0, r2, r1
	str r0, [r4, r3]
_0225F6EC:
	ldr r0, [r5]
	cmp r0, #0xf
	beq _0225F6F8
	ldr r0, [r4, #0x44]
	bl sub_0202457C
_0225F6F8:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F700: .word 0xFFFF1FFF
	thumb_func_end ov115_0225F220

	thumb_func_start ov115_0225F704
ov115_0225F704: ; 0x0225F704
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F724 ; =ov115_022603B0
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F720
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F720:
	pop {r3, r4, r5, pc}
	nop
_0225F724: .word ov115_022603B0
	thumb_func_end ov115_0225F704

	thumb_func_start ov115_0225F728
ov115_0225F728: ; 0x0225F728
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F748 ; =ov115_022603C4
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F744
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F744:
	pop {r3, r4, r5, pc}
	nop
_0225F748: .word ov115_022603C4
	thumb_func_end ov115_0225F728

	thumb_func_start ov115_0225F74C
ov115_0225F74C: ; 0x0225F74C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F76C ; =ov115_022603D8
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F768
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F768:
	pop {r3, r4, r5, pc}
	nop
_0225F76C: .word ov115_022603D8
	thumb_func_end ov115_0225F74C

	thumb_func_start ov115_0225F770
ov115_0225F770: ; 0x0225F770
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F790 ; =ov115_022603EC
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F78C
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F78C:
	pop {r3, r4, r5, pc}
	nop
_0225F790: .word ov115_022603EC
	thumb_func_end ov115_0225F770

	thumb_func_start ov115_0225F794
ov115_0225F794: ; 0x0225F794
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F7B4 ; =ov115_02260400
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F7B0
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F7B0:
	pop {r3, r4, r5, pc}
	nop
_0225F7B4: .word ov115_02260400
	thumb_func_end ov115_0225F794

	thumb_func_start ov115_0225F7B8
ov115_0225F7B8: ; 0x0225F7B8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F7D8 ; =ov115_02260414
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F7D4
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F7D4:
	pop {r3, r4, r5, pc}
	nop
_0225F7D8: .word ov115_02260414
	thumb_func_end ov115_0225F7B8

	thumb_func_start ov115_0225F7DC
ov115_0225F7DC: ; 0x0225F7DC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F7FC ; =ov115_02260428
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F7F8
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F7F8:
	pop {r3, r4, r5, pc}
	nop
_0225F7FC: .word ov115_02260428
	thumb_func_end ov115_0225F7DC

	thumb_func_start ov115_0225F800
ov115_0225F800: ; 0x0225F800
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F820 ; =ov115_0226043C
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F81C
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F81C:
	pop {r3, r4, r5, pc}
	nop
_0225F820: .word ov115_0226043C
	thumb_func_end ov115_0225F800

	thumb_func_start ov115_0225F824
ov115_0225F824: ; 0x0225F824
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F844 ; =ov115_02260450
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F840
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F840:
	pop {r3, r4, r5, pc}
	nop
_0225F844: .word ov115_02260450
	thumb_func_end ov115_0225F824

	thumb_func_start ov115_0225F848
ov115_0225F848: ; 0x0225F848
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F868 ; =ov115_02260464
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F864
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F864:
	pop {r3, r4, r5, pc}
	nop
_0225F868: .word ov115_02260464
	thumb_func_end ov115_0225F848

	thumb_func_start ov115_0225F86C
ov115_0225F86C: ; 0x0225F86C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F88C ; =ov115_02260478
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F888
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F888:
	pop {r3, r4, r5, pc}
	nop
_0225F88C: .word ov115_02260478
	thumb_func_end ov115_0225F86C

	thumb_func_start ov115_0225F890
ov115_0225F890: ; 0x0225F890
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F8B0 ; =ov115_0226048C
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F8AC
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F8AC:
	pop {r3, r4, r5, pc}
	nop
_0225F8B0: .word ov115_0226048C
	thumb_func_end ov115_0225F890

	thumb_func_start ov115_0225F8B4
ov115_0225F8B4: ; 0x0225F8B4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F8D4 ; =ov115_022604A0
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F8D0
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F8D0:
	pop {r3, r4, r5, pc}
	nop
_0225F8D4: .word ov115_022604A0
	thumb_func_end ov115_0225F8B4

	thumb_func_start ov115_0225F8D8
ov115_0225F8D8: ; 0x0225F8D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F8F8 ; =ov115_022604B4
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F8F4
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F8F4:
	pop {r3, r4, r5, pc}
	nop
_0225F8F8: .word ov115_022604B4
	thumb_func_end ov115_0225F8D8

	thumb_func_start ov115_0225F8FC
ov115_0225F8FC: ; 0x0225F8FC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F91C ; =ov115_022604C8
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F918
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F918:
	pop {r3, r4, r5, pc}
	nop
_0225F91C: .word ov115_022604C8
	thumb_func_end ov115_0225F8FC

	thumb_func_start ov115_0225F920
ov115_0225F920: ; 0x0225F920
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F940 ; =ov115_022604DC
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F93C
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F93C:
	pop {r3, r4, r5, pc}
	nop
_0225F940: .word ov115_022604DC
	thumb_func_end ov115_0225F920

	thumb_func_start ov115_0225F944
ov115_0225F944: ; 0x0225F944
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0225F964 ; =_02260374
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F220
	cmp r0, #1
	bne _0225F960
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0225F960:
	pop {r3, r4, r5, pc}
	nop
_0225F964: .word _02260374
	thumb_func_end ov115_0225F944

	thumb_func_start ov115_0225F968
ov115_0225F968: ; 0x0225F968
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov115_0225F968

	thumb_func_start ov115_0225F978
ov115_0225F978: ; 0x0225F978
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r6, r0, #0
	ldr r0, [r6]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r4, [r6, #0xc]
	cmp r0, #0xe
	bls _0225F98E
	bl _0226021C
_0225F98E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F99A: ; jump table
	.short _0225F9B8 - _0225F99A - 2 ; case 0
	.short _0225FAC6 - _0225F99A - 2 ; case 1
	.short _0225FBAE - _0225F99A - 2 ; case 2
	.short _0225FBC8 - _0225F99A - 2 ; case 3
	.short _0225FBE4 - _0225F99A - 2 ; case 4
	.short _0225FC0E - _0225F99A - 2 ; case 5
	.short _0225FD78 - _0225F99A - 2 ; case 6
	.short _0225FE4E - _0225F99A - 2 ; case 7
	.short _0225FE80 - _0225F99A - 2 ; case 8
	.short _0225FF02 - _0225F99A - 2 ; case 9
	.short _0225FF26 - _0225F99A - 2 ; case 10
	.short _0225FF4A - _0225F99A - 2 ; case 11
	.short _0225FF88 - _0225F99A - 2 ; case 12
	.short _02260102 - _0225F99A - 2 ; case 13
	.short _022601A8 - _0225F99A - 2 ; case 14
_0225F9B8:
	add r0, r1, #0
	mov r1, #0xc5
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0xc5
	str r0, [r6, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r4, [r6, #0xc]
	mov r1, #0xa
	add r0, r4, #0
	add r0, #0x5c
	mov r2, #4
	bl ov01_021F05C4
	ldr r0, [r6, #0x10]
	bl ov115_0225F968
	cmp r0, #0
	bne _0225FA16
	mov r0, #1
	str r0, [sp]
	mov r0, #0xd0
	str r0, [sp, #4]
	mov r0, #0xd1
	str r0, [sp, #8]
	mov r2, #0xd2
	str r2, [sp, #0xc]
	ldr r0, _0225FD58 ; =0x000927C0
	add r1, r4, #0
	str r0, [sp, #0x10]
	add r2, #0xc6
	ldr r0, [r6, #0x20]
	add r1, #0x5c
	add r2, r4, r2
	mov r3, #0xcf
	bl ov01_021F0614
	mov r0, #0xc1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0xcf
	b _0225FA44
_0225FA16:
	mov r0, #1
	str r0, [sp]
	mov r0, #0xd4
	str r0, [sp, #4]
	mov r0, #0xd5
	str r0, [sp, #8]
	mov r2, #0xd6
	str r2, [sp, #0xc]
	ldr r0, _0225FD58 ; =0x000927C0
	add r1, r4, #0
	str r0, [sp, #0x10]
	add r2, #0xc2
	ldr r0, [r6, #0x20]
	add r1, #0x5c
	add r2, r4, r2
	mov r3, #0xd3
	bl ov01_021F0614
	mov r0, #0xc1
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0xd3
_0225FA44:
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [sp, #0x18]
	mov r2, #0x73
	ldrh r3, [r0]
	mov r0, #1
	add r1, r4, #0
	str r0, [sp]
	add r0, r3, #1
	str r0, [sp, #4]
	add r0, r3, #2
	str r0, [sp, #8]
	add r0, r3, #3
	str r0, [sp, #0xc]
	ldr r0, _0225FD5C ; =0x000927C1
	lsl r2, r2, #2
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x20]
	add r1, #0x5c
	add r2, r4, r2
	bl ov01_021F0614
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0x30
	str r0, [sp, #4]
	mov r0, #0x31
	str r0, [sp, #8]
	mov r0, #0x32
	str r0, [sp, #0xc]
	ldr r0, _0225FD60 ; =0x000927C2
	mov r2, #2
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	add r1, r4, #0
	lsl r2, r2, #8
	ldrb r3, [r3, #2]
	ldr r0, [r6, #0x20]
	add r1, #0x5c
	add r2, r4, r2
	bl ov01_021F0614
	mov r0, #1
	str r0, [sp]
	mov r0, #0x3c
	str r0, [sp, #4]
	mov r0, #0x3d
	str r0, [sp, #8]
	mov r0, #0x3e
	str r0, [sp, #0xc]
	ldr r0, _0225FD64 ; =0x000927C3
	mov r2, #0x8d
	str r0, [sp, #0x10]
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r0, [r6, #0x20]
	add r1, #0x5c
	add r2, r4, r2
	mov r3, #0x3b
	bl ov01_021F0614
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FAC6:
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, sp, #0x2c
	add r2, r1, #0
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x24]
	add r0, r4, #0
	str r0, [sp, #0x28]
	add r0, #0x5c
	mov r7, #0
	add r5, r4, #0
	str r0, [sp, #0x28]
_0225FAEA:
	cmp r7, #3
	bge _0225FAF6
	mov r0, #0
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	b _0225FB06
_0225FAF6:
	sub r1, r7, #1
	mov r0, #0x34
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x24]
	add r1, r0, r2
	mov r0, #1
	str r0, [sp, #0x20]
_0225FB06:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [sp, #0x28]
	add r3, r2, #0
	bl ov01_021F0718
	mov r1, #0x9a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x20]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024A04
	ldr r0, [sp, #0x1c]
	add r7, r7, #1
	add r0, #0x34
	add r5, r5, #4
	str r0, [sp, #0x1c]
	cmp r7, #4
	blt _0225FAEA
	mov r2, #0x9a
	mov r0, #0
	lsl r2, r2, #2
	str r0, [sp]
	ldr r0, [r4, r2]
	add r2, #0xa0
	ldr r1, [sp, #0x14]
	ldr r2, [r4, r2]
	mov r3, #0xe
	bl ov115_02260254
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x18]
	mov r0, #0x9b
	lsl r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x14]
	mov r3, #0xe
	bl ov115_02260254
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #6
	lsl r0, r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x14]
	mov r2, #0x29
	add r1, r4, #0
	mov r3, #2
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r0, r4, r2
	sub r2, #0x5c
	add r1, #0x5c
	add r2, r4, r2
	lsl r3, r3, #0x12
	bl ov115_0225F020
	ldr r0, [r6, #0x10]
	bl ov01_021F0DDC
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FBAE:
	mov r1, #0x10
	mov r0, #1
	add r2, r1, #0
	add r3, r6, #4
	str r0, [sp]
	bl ov01_021EFCF8
	mov r0, #0
	str r0, [r6, #8]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FBC8:
	ldr r0, [r6, #8]
	add r0, r0, #1
	str r0, [r6, #8]
	cmp r0, #8
	bne _0225FBD6
	bl ov01_021F0E74
_0225FBD6:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _0225FBEC
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FBE4:
	bl ov01_021F0E90
	cmp r0, #1
	beq _0225FBEE
_0225FBEC:
	b _0226021C
_0225FBEE:
	ldr r0, [r6, #0x20]
	mov r1, #0x97
	bl ov01_021F0F08
	mov r0, #8
	str r0, [sp]
	ldr r0, _0225FD68 ; =0x04000050
	mov r1, #1
	mov r2, #0x1e
	mov r3, #0
	bl G2x_SetBlendAlpha_
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FC0E:
	mov r0, #6
	mov r2, #0xe
	mov r3, #5
	str r0, [sp]
	ldr r1, _0225FD6C ; =0xFFF80000
	add r0, r4, #0
	lsl r2, r2, #0xe
	lsl r3, r3, #0x10
	bl ov01_021EFEC8
	mov r2, #0x17
	ldr r1, [r4]
	add r0, sp, #0x38
	lsl r2, r2, #0xe
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r1, #6
	add r0, r4, #0
	mov r2, #0x32
	str r1, [sp]
	ldr r3, _0225FD70 ; =0xFFFB0000
	add r0, #0x30
	lsl r1, r1, #0x12
	lsl r2, r2, #0xe
	bl ov01_021EFEC8
	mov r2, #0x17
	ldr r1, [r4, #0x30]
	add r0, sp, #0x38
	lsl r2, r2, #0xe
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	sub r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x14]
	mov r1, #0x10
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	mov r2, #0
	mov r3, #0x40
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #0xd
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r1, #0xbd
	lsl r1, r1, #2
	str r2, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r6, #0x10]
	add r1, r4, r1
	ldr r0, [r0, #8]
	mov r3, #0x15
	bl AddWindowParameterized
	mov r0, #0xbd
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	ldrh r0, [r0, #6]
	bl ov115_0225F158
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	ldr r0, _0225FD74 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xbd
	lsl r0, r0, #2
	add r0, r4, r0
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	mov r0, #3
	str r0, [r6, #4]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
	.balign 4, 0
_0225FD58: .word 0x000927C0
_0225FD5C: .word 0x000927C1
_0225FD60: .word 0x000927C2
_0225FD64: .word 0x000927C3
_0225FD68: .word 0x04000050
_0225FD6C: .word 0xFFF80000
_0225FD70: .word 0xFFFB0000
_0225FD74: .word 0x00010200
_0225FD78:
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _0225FD9C
	sub r0, r0, #1
	str r0, [r6, #4]
	bne _0225FDA6
	mov r0, #3
	bl ov01_021F0FB8
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _0225FDA6
_0225FD9C:
	mov r0, #0x29
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov115_0225F0B4
_0225FDA6:
	add r0, r4, #0
	bl ov01_021EFF28
	mov r2, #0x17
	ldr r1, [r4]
	add r0, sp, #0x38
	lsl r2, r2, #0xe
	mov r3, #0
	bl ov01_021F074C
	add r5, sp, #0x38
	mov r2, #0x9e
	lsl r2, r2, #2
	add r3, r4, r2
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	sub r2, #0x10
	str r0, [r3]
	ldr r0, [r4, r2]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	add r0, r4, #0
	add r0, #0x30
	bl ov01_021EFF28
	mov r2, #0x17
	add r7, r0, #0
	ldr r1, [r4, #0x30]
	add r0, sp, #0x38
	lsl r2, r2, #0xe
	mov r3, #0
	bl ov01_021F074C
	add r5, sp, #0x38
	mov r2, #0xa1
	lsl r2, r2, #2
	add r3, r4, r2
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	sub r2, #0x18
	str r0, [r3]
	ldr r0, [r4, r2]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	sub r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	cmp r7, #1
	bne _0225FF3C
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FE4E:
	mov r0, #0x29
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov115_0225F0B4
	add r5, r0, #0
	bl ov01_021F1044
	cmp r5, #0
	beq _0225FF3C
	cmp r0, #0
	beq _0225FF3C
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	mov r2, #0x10
	mov r3, #3
	bl ov01_021EFE34
	bl ov01_021F1060
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FE80:
	add r0, r4, #0
	add r0, #0x48
	bl ov01_021EFE44
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x48
	bl ov01_021F0DC8
	cmp r5, #1
	bne _0225FF3C
	mov r3, #0
	mov r2, #0x9a
	str r3, [sp]
	lsl r2, r2, #2
	ldr r0, [r4, r2]
	add r2, #0xa0
	ldr r1, [sp, #0x14]
	ldr r2, [r4, r2]
	bl ov115_02260254
	mov r3, #0
	mov r0, #0x9b
	ldr r2, [sp, #0x18]
	str r3, [sp]
	lsl r0, r0, #2
	ldrh r2, [r2]
	ldr r0, [r4, r0]
	ldr r1, [sp, #0x14]
	bl ov115_02260254
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x27
	lsl r0, r0, #4
	mov r1, #2
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_02024868
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x9d
	lsl r0, r0, #2
	mov r1, #2
	ldr r0, [r4, r0]
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r0, [r6, #0x20]
	mov r1, #0x98
	bl ov01_021F0F08
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FF02:
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0x10
	mov r2, #0
	mov r3, #6
	bl ov01_021EFE34
	mov r0, #4
	bl ov01_021F0FB8
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FF26:
	add r0, r4, #0
	add r0, #0x48
	bl ov01_021EFE44
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x48
	bl ov01_021F0DC8
	cmp r5, #1
	beq _0225FF3E
_0225FF3C:
	b _0226021C
_0225FF3E:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	mov r0, #8
	str r0, [r6, #4]
	b _0226021C
_0225FF4A:
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _0225FF56
	sub r0, r0, #1
	str r0, [r6, #4]
	b _0226021C
_0225FF56:
	add r0, r2, #0
	ldrb r0, [r0, #3]
	mov r1, #0
	ldr r2, _02260248 ; =0xFFFFE000
	str r0, [sp]
	add r0, r4, #0
	add r3, r1, #0
	bl ov01_021EFEC8
	ldr r0, [sp, #0x18]
	mov r1, #0
	ldrb r0, [r0, #3]
	ldr r2, _02260248 ; =0xFFFFE000
	add r3, r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFEC8
	mov r0, #0
	str r0, [r6, #4]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_0225FF88:
	ldr r0, [r6, #4]
	add r0, r0, #1
	str r0, [r6, #4]
	add r0, r4, #0
	bl ov01_021EFF28
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFF28
	ldr r1, [r6, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, sp, #0x38
	bne _0225FFD0
	mov r2, #0x9e
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	add r2, r2, #4
	add r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	add r2, r3, r2
	mov r3, #0
	bl ov01_021F074C
	b _0225FFE8
_0225FFD0:
	mov r2, #0x9e
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	add r2, r2, #4
	sub r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	sub r2, r3, r2
	mov r3, #0
	bl ov01_021F074C
_0225FFE8:
	cmp r5, #0
	beq _0225FFFC
	mov r0, #0x9e
	lsl r0, r0, #2
	add r3, sp, #0x38
	add r2, r4, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
_0225FFFC:
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	ldr r1, [r6, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, sp, #0x38
	bne _02260058
	mov r2, #0xa1
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	add r2, r2, #4
	sub r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	sub r2, r3, r2
	mov r3, #0
	bl ov01_021F074C
	b _02260070
_02260058:
	mov r2, #0xa1
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	add r2, r2, #4
	add r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	add r2, r3, r2
	mov r3, #0
	bl ov01_021F074C
_02260070:
	cmp r5, #0
	beq _02260084
	mov r0, #0xa1
	lsl r0, r0, #2
	add r3, sp, #0x38
	add r2, r4, r0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
_02260084:
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	sub r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	cmp r5, #0
	bne _022600B4
	b _0226021C
_022600B4:
	ldr r0, [r6]
	mov r1, #0
	add r0, r0, #1
	str r0, [r6]
	mov r0, #4
	bl GX_EngineAToggleLayers
	mov r2, #3
	mov r0, #0x10
	lsl r2, r2, #0x12
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0
	lsr r3, r2, #3
	bl ov01_021EFEC8
	mov r0, #0x10
	mov r2, #3
	str r0, [sp]
	add r0, r4, #0
	lsl r2, r2, #0x12
	add r0, #0x18
	mov r1, #0
	lsr r3, r2, #3
	bl ov01_021EFEC8
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _0226024C ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	b _0226021C
_02260102:
	add r0, r4, #0
	bl ov01_021EFF28
	add r0, r4, #0
	add r0, #0x18
	bl ov01_021EFF28
	mov r2, #0x9e
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	add r2, r2, #4
	sub r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	add r0, sp, #0x38
	sub r2, r3, r2
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x27
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r2, #0xa1
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r1, [r4]
	add r2, r2, #4
	add r1, r3, r1
	ldr r3, [r4, r2]
	ldr r2, [r4, #0x18]
	add r0, sp, #0x38
	add r2, r3, r2
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	mov r0, #1
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x38]
	lsl r0, r0, #2
	sub r0, r1, r0
	str r0, [sp, #0x38]
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x38
	bl sub_020247D4
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0226021C
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0226021C
_022601A8:
	ldr r1, _0226024C ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	ldr r1, [r6, #0x14]
	cmp r1, #0
	beq _022601BA
	mov r0, #1
	str r0, [r1]
_022601BA:
	mov r0, #0x29
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov115_0225F09C
	mov r0, #0xbd
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r7, #0x9a
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_022601D6:
	ldr r0, [r5, r7]
	bl sub_02024758
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _022601D6
	mov r0, #0x66
	lsl r0, r0, #2
	add r7, r4, #0
	mov r6, #0
	add r5, r4, r0
	add r7, #0x5c
_022601F0:
	add r0, r7, #0
	add r1, r5, #0
	bl ov01_021F06EC
	add r6, r6, #1
	add r5, #0x34
	cmp r6, #4
	blt _022601F0
	add r4, #0x5c
	add r0, r4, #0
	bl ov01_021F05F4
	bl ov01_021F1060
	bl ov01_021F0EC0
	ldr r0, _02260250 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	add sp, #0x44
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0226021C:
	ldr r0, [r6]
	cmp r0, #0xe
	beq _02260242
	ldr r0, [r4, #0x5c]
	bl sub_0202457C
	ldr r0, [r6]
	cmp r0, #4
	ble _02260242
	bl sub_02026E48
	bl ov01_021F1008
	bl ov01_021F0EAC
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
_02260242:
	mov r0, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02260248: .word 0xFFFFE000
_0226024C: .word 0x00007FFF
_02260250: .word 0x04000050
	thumb_func_end ov115_0225F978

	thumb_func_start ov115_02260254
ov115_02260254: ; 0x02260254
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r7, r0, #0
	add r6, r2, #0
	add r0, r5, #0
	mov r1, #0x20
	str r3, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0x6d
	add r1, r6, #0
	add r2, sp, #8
	add r3, r5, #0
	bl GfGfxLoader_GetPlttData
	add r5, r0, #0
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	add r1, r4, #0
	mov r2, #0x10
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	ldr r0, [r0, #0xc]
	bl sub_02003DE8
	add r0, r7, #0
	bl sub_02024B34
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x20
	bl DC_FlushRange
	add r0, r6, #0
	mov r1, #1
	bl NNS_G2dGetImagePaletteLocation
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0x20
	bl GX_LoadOBJPltt
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov115_02260254

	thumb_func_start ov115_022602C0
ov115_022602C0: ; 0x022602C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _022602E0 ; =ov115_02260388
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _022602DC
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_022602DC:
	pop {r3, r4, r5, pc}
	nop
_022602E0: .word ov115_02260388
	thumb_func_end ov115_022602C0

	thumb_func_start ov115_022602E4
ov115_022602E4: ; 0x022602E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _02260304 ; =ov115_02260390
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _02260300
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_02260300:
	pop {r3, r4, r5, pc}
	nop
_02260304: .word ov115_02260390
	thumb_func_end ov115_022602E4

	thumb_func_start ov115_02260308
ov115_02260308: ; 0x02260308
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _02260328 ; =ov115_02260398
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _02260324
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_02260324:
	pop {r3, r4, r5, pc}
	nop
_02260328: .word ov115_02260398
	thumb_func_end ov115_02260308

	thumb_func_start ov115_0226032C
ov115_0226032C: ; 0x0226032C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _0226034C ; =ov115_022603A0
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _02260348
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_02260348:
	pop {r3, r4, r5, pc}
	nop
_0226034C: .word ov115_022603A0
	thumb_func_end ov115_0226032C

	thumb_func_start ov115_02260350
ov115_02260350: ; 0x02260350
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r2, _02260370 ; =ov115_022603A8
	add r0, r4, #0
	mov r1, #4
	bl ov115_0225F978
	cmp r0, #1
	bne _0226036C
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EFCDC
_0226036C:
	pop {r3, r4, r5, pc}
	nop
_02260370: .word ov115_022603A8
	thumb_func_end ov115_02260350

	.rodata

_02260374:
	.byte 0x00, 0x60, 0x0D, 0x00, 0x09, 0x01, 0x00, 0x00, 0x17, 0x00, 0x01, 0x00
	.byte 0x7F, 0x80, 0x81, 0x82, 0x2D, 0x2C, 0x2E, 0x00

ov115_02260388: ; 0x02260388
	.byte 0x83, 0x00, 0x2F, 0x20, 0x57, 0x00, 0xF5, 0x00

ov115_02260390: ; 0x02260390
	.byte 0x87, 0x00, 0x33, 0x20, 0x59, 0x00, 0xF7, 0x00

ov115_02260398: ; 0x02260398
	.byte 0x8B, 0x00, 0x34, 0x20, 0x70, 0x00, 0xA2, 0x01

ov115_022603A0: ; 0x022603A0
	.byte 0x8F, 0x00, 0x35, 0x20, 0x58, 0x00, 0xF6, 0x00

ov115_022603A8: ; 0x022603A8
	.byte 0x93, 0x00, 0x36, 0x09, 0x56, 0x00, 0xF4, 0x00

ov115_022603B0: ; 0x022603B0
	.byte 0x00, 0x60, 0x0D, 0x00, 0x14, 0x00, 0x00, 0x00, 0x42, 0x00, 0x01, 0x00, 0x3F, 0x40, 0x41, 0x42
	.byte 0x15, 0x14, 0x16, 0x00

ov115_022603C4: ; 0x022603C4
	.byte 0x00, 0x60, 0x0D, 0x00, 0x15, 0x00, 0x00, 0x00, 0x43, 0x00, 0x01, 0x00
	.byte 0x43, 0x44, 0x45, 0x46, 0x18, 0x17, 0x19, 0x00

ov115_022603D8: ; 0x022603D8
	.byte 0x00, 0x60, 0x0D, 0x00, 0x1E, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x47, 0x48, 0x49, 0x4A, 0x1B, 0x1A, 0x1C, 0x00

ov115_022603EC: ; 0x022603EC
	.byte 0x00, 0x60, 0x0D, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x48, 0x00, 0x01, 0x00, 0x4B, 0x4C, 0x4D, 0x4E, 0x1E, 0x1D, 0x1F, 0x00

ov115_02260400: ; 0x02260400
	.byte 0x00, 0x60, 0x0D, 0x00, 0x21, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x01, 0x00, 0x4F, 0x50, 0x51, 0x52
	.byte 0x21, 0x20, 0x22, 0x00

ov115_02260414: ; 0x02260414
	.byte 0x00, 0x60, 0x0D, 0x00, 0x22, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x01, 0x00
	.byte 0x53, 0x54, 0x55, 0x56, 0x24, 0x23, 0x25, 0x00

ov115_02260428: ; 0x02260428
	.byte 0x00, 0x60, 0x0D, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x01, 0x00, 0x57, 0x58, 0x59, 0x5A, 0x27, 0x26, 0x28, 0x00

ov115_0226043C: ; 0x0226043C
	.byte 0x00, 0x60, 0x0D, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x01, 0x00, 0x5B, 0x5C, 0x5D, 0x5E, 0x2A, 0x29, 0x2B, 0x00

ov115_02260450: ; 0x02260450
	.byte 0x00, 0x60, 0x0D, 0x00, 0xFD, 0x00, 0x00, 0x00, 0x62, 0x00, 0x01, 0x00, 0x5F, 0x60, 0x61, 0x62
	.byte 0x15, 0x14, 0x16, 0x00

ov115_02260464: ; 0x02260464
	.byte 0x00, 0x60, 0x0D, 0x00, 0xFE, 0x00, 0x00, 0x00, 0x67, 0x00, 0x01, 0x00
	.byte 0x63, 0x64, 0x65, 0x66, 0x18, 0x17, 0x19, 0x00

ov115_02260478: ; 0x02260478
	.byte 0x00, 0x60, 0x0D, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x67, 0x68, 0x69, 0x6A, 0x1B, 0x1A, 0x1C, 0x00

ov115_0226048C: ; 0x0226048C
	.byte 0x00, 0x60, 0x0D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x69, 0x00, 0x01, 0x00, 0x6B, 0x6C, 0x6D, 0x6E, 0x1E, 0x1D, 0x1F, 0x00

ov115_022604A0: ; 0x022604A0
	.byte 0x00, 0x60, 0x0D, 0x00, 0x01, 0x01, 0x00, 0x00, 0x6A, 0x00, 0x01, 0x00, 0x6F, 0x70, 0x71, 0x72
	.byte 0x21, 0x20, 0x22, 0x00

ov115_022604B4: ; 0x022604B4
	.byte 0x00, 0x60, 0x0D, 0x00, 0x02, 0x01, 0x00, 0x00, 0x6B, 0x00, 0x01, 0x00
	.byte 0x73, 0x74, 0x75, 0x76, 0x24, 0x23, 0x25, 0x00

ov115_022604C8: ; 0x022604C8
	.byte 0x00, 0x60, 0x0D, 0x00, 0x03, 0x01, 0x00, 0x00
	.byte 0x6C, 0x00, 0x01, 0x00, 0x77, 0x78, 0x79, 0x7A, 0x27, 0x26, 0x28, 0x00

ov115_022604DC: ; 0x022604DC
	.byte 0x00, 0x60, 0x0D, 0x00
	.byte 0x05, 0x01, 0x00, 0x00, 0x6E, 0x00, 0x01, 0x00, 0x7B, 0x7C, 0x7D, 0x7E, 0x2A, 0x29, 0x2B, 0x00
	; 0x022604F0
