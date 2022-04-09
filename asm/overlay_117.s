	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov117_0225F020
ov117_0225F020: ; 0x0225F020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	str r0, [sp, #0x14]
	add r0, r1, #0
	ldr r0, [r0]
	str r1, [sp, #0x18]
	ldr r4, [r1, #0xc]
	cmp r0, #7
	bls _0225F034
	b _0225F330
_0225F034:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225F040: ; jump table
	.short _0225F050 - _0225F040 - 2 ; case 0
	.short _0225F0E0 - _0225F040 - 2 ; case 1
	.short _0225F100 - _0225F040 - 2 ; case 2
	.short _0225F124 - _0225F040 - 2 ; case 3
	.short _0225F262 - _0225F040 - 2 ; case 4
	.short _0225F274 - _0225F040 - 2 ; case 5
	.short _0225F2A4 - _0225F040 - 2 ; case 6
	.short _0225F2E0 - _0225F040 - 2 ; case 7
_0225F050:
	mov r1, #0x3d
	mov r0, #4
	lsl r1, r1, #4
	bl AllocFromHeap
	ldr r1, [sp, #0x18]
	mov r2, #0x3d
	str r0, [r1, #0xc]
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	ldr r0, [sp, #0x18]
	mov r1, #6
	ldr r4, [r0, #0xc]
	mov r2, #1
	add r0, r4, #0
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #0x9c
	str r0, [sp, #4]
	mov r0, #0x9e
	str r0, [sp, #8]
	mov r2, #0x9d
	str r2, [sp, #0xc]
	ldr r0, _0225F2B8 ; =0x000927C0
	add r2, #0x9f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	ldr r0, [r0, #0x20]
	add r2, r4, r2
	mov r3, #3
	bl ov01_021F0614
	mov r7, #0x4f
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #2
_0225F0A2:
	mov r0, #0
	str r0, [sp]
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, r7
	add r3, r2, #0
	bl ov01_021F0718
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #6
	blt _0225F0A2
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F0E0:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r1, r0, #0
	ldr r3, [sp, #0x18]
	sub r1, #0x11
	add r2, r1, #0
	add r3, r3, #4
	bl ov01_021EFCF8
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F100:
	ldr r1, [sp, #0x18]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _0225F134
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	mov r0, #0xf2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	add r0, r0, #4
	lsl r2, r1, #5
	ldr r1, _0225F2BC ; =ov117_0225FB0C
	ldr r1, [r1, r2]
	str r1, [r4, r0]
	b _0225F330
_0225F124:
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0
	blt _0225F136
_0225F134:
	b _0225F330
_0225F136:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #8
	str r1, [sp]
	mov r1, #0x86
	lsl r1, r1, #2
	add r2, r4, r1
	mov r1, #0x18
	mul r1, r0
	lsl r3, r0, #5
	add r0, r2, r1
	ldr r1, _0225F2C0 ; =ov117_0225FAF4
	ldr r2, _0225F2C4 ; =ov117_0225FAF8
	ldr r5, _0225F2C8 ; =ov117_0225FAFC
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	bl ov01_021EFEC8
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #8
	str r1, [sp]
	mov r1, #0xaa
	lsl r1, r1, #2
	add r2, r4, r1
	mov r1, #0x18
	mul r1, r0
	lsl r3, r0, #5
	add r0, r2, r1
	ldr r1, _0225F2CC ; =ov117_0225FB00
	ldr r2, _0225F2D0 ; =ov117_0225FB04
	ldr r5, _0225F2D4 ; =ov117_0225FB08
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	bl ov01_021EFEC8
	mov r0, #0x62
	lsl r0, r0, #2
	mov r1, #8
	add r3, r4, r0
	mov r0, #0xf2
	str r1, [sp]
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	mov r0, #0x18
	mul r0, r2
	add r0, r3, r0
	ldr r3, _0225F2D8 ; =0xFFFFF99A
	lsl r1, r1, #0xa
	mov r2, #0x29
	bl ov01_021EFEC8
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	sub r0, #0x90
	add r1, r4, r0
	mov r0, #0x14
	mul r0, r2
	lsl r3, r2, #5
	ldr r2, _0225F2DC ; =ov117_0225FB10
	add r0, r1, r0
	ldr r2, [r2, r3]
	mov r1, #0
	mov r3, #8
	bl ov01_021EFE34
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, _0225F2C0 ; =ov117_0225FAF4
	lsl r3, r0, #5
	ldr r2, _0225F2CC ; =ov117_0225FB00
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	add r0, sp, #0x40
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0x40
	bl sub_020247D4
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, sp, #0x34
	add r2, r1, #0
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0xf2
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r2, #2
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0x34
	bl sub_02024804
	mov r1, #0xf2
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	mov r3, #1
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, r1, #0
	sub r0, #0x18
	str r3, [r2, r0]
	ldr r0, [r4, r1]
	add r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #6
	blt _0225F256
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F256:
	lsl r2, r0, #5
	ldr r0, _0225F2BC ; =ov117_0225FB0C
	ldr r2, [r0, r2]
	add r0, r1, #4
	str r2, [r4, r0]
	b _0225F330
_0225F262:
	mov r1, #0xf1
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _0225F330
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F274:
	ldr r0, [sp, #0x18]
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB514
	mov r0, #0xc
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #0x22
	add r3, r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
_0225F2A4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225F330
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [r0]
	b _0225F330
	.balign 4, 0
_0225F2B8: .word 0x000927C0
_0225F2BC: .word ov117_0225FB0C
_0225F2C0: .word ov117_0225FAF4
_0225F2C4: .word ov117_0225FAF8
_0225F2C8: .word ov117_0225FAFC
_0225F2CC: .word ov117_0225FB00
_0225F2D0: .word ov117_0225FB04
_0225F2D4: .word ov117_0225FB08
_0225F2D8: .word 0xFFFFF99A
_0225F2DC: .word ov117_0225FB10
_0225F2E0:
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [sp, #0x18]
	ldr r0, [r0, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB4F4
	ldr r0, [sp, #0x18]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0225F300
	mov r0, #1
	str r0, [r1]
_0225F300:
	mov r7, #0x17
	mov r6, #0
	add r5, r4, #0
	lsl r7, r7, #4
_0225F308:
	ldr r0, [r5, r7]
	bl sub_02024758
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #6
	blt _0225F308
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	bl ov01_021F05F4
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	bl ov01_021EFCDC
_0225F330:
	mov r1, #0x86
	mov r0, #0
	lsl r1, r1, #2
	str r0, [sp, #0x1c]
	add r0, r4, r1
	str r0, [sp, #0x2c]
	add r0, r1, #0
	add r0, #0x90
	add r0, r4, r0
	sub r1, #0x90
	str r0, [sp, #0x28]
	add r0, r4, r1
	str r0, [sp, #0x24]
	mov r0, #0xce
	lsl r0, r0, #2
	add r0, r4, r0
	add r5, r4, #0
	str r0, [sp, #0x20]
	add r6, r4, #0
	add r7, r4, #0
_0225F358:
	mov r0, #0x3b
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0225F3E4
	ldr r0, [sp, #0x2c]
	bl ov01_021EFF28
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x28]
	bl ov01_021EFF28
	ldr r0, [sp, #0x24]
	bl ov01_021EFF28
	ldr r0, [sp, #0x20]
	bl ov01_021EFE44
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _0225F394
	mov r0, #0x3b
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r5, r0]
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
_0225F394:
	mov r1, #0x86
	mov r2, #0xaa
	lsl r1, r1, #2
	lsl r2, r2, #2
	ldr r1, [r6, r1]
	ldr r2, [r6, r2]
	add r0, sp, #0x40
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, sp, #0x40
	bl sub_020247D4
	mov r0, #0x62
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	add r0, sp, #0x34
	add r2, r1, #0
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, sp, #0x34
	bl sub_020247F4
	mov r1, #0xce
	lsl r1, r1, #2
	mov r0, #0x17
	ldr r1, [r7, r1]
	lsl r0, r0, #4
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	bl sub_02024818
_0225F3E4:
	ldr r0, [sp, #0x2c]
	add r5, r5, #4
	add r0, #0x18
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	add r6, #0x18
	add r0, #0x18
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	add r7, #0x14
	add r0, #0x18
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	add r0, #0x14
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
	cmp r0, #6
	blt _0225F358
	ldr r0, [sp, #0x18]
	ldr r0, [r0]
	cmp r0, #7
	beq _0225F41A
	ldr r0, [r4]
	bl sub_0202457C
_0225F41A:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov117_0225F020

	thumb_func_start ov117_0225F420
ov117_0225F420: ; 0x0225F420
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #4
	str r0, [sp]
	add r4, r1, #0
	add r1, r2, #0
	ldr r0, [r5, #0x20]
	mov r2, #0
	add r3, sp, #0xc
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r2, [sp, #0xc]
	mov r3, #0
	str r3, [sp]
	add r6, r0, #0
	ldrh r0, [r2]
	add r1, r4, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #8]
	bl LoadRectToBgTilemapRect
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	ldr r0, [r0, #8]
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov117_0225F420

	thumb_func_start ov117_0225F470
ov117_0225F470: ; 0x0225F470
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
	thumb_func_end ov117_0225F470

	thumb_func_start ov117_0225F4D4
ov117_0225F4D4: ; 0x0225F4D4
	ldr r3, _0225F4DC ; =ov117_0225F524
	ldr r2, _0225F4E0 ; =_0225FACC
	bx r3
	nop
_0225F4DC: .word ov117_0225F524
_0225F4E0: .word _0225FACC
	thumb_func_end ov117_0225F4D4

	thumb_func_start ov117_0225F4E4
ov117_0225F4E4: ; 0x0225F4E4
	ldr r3, _0225F4EC ; =ov117_0225F524
	ldr r2, _0225F4F0 ; =ov117_0225FAD4
	bx r3
	nop
_0225F4EC: .word ov117_0225F524
_0225F4F0: .word ov117_0225FAD4
	thumb_func_end ov117_0225F4E4

	thumb_func_start ov117_0225F4F4
ov117_0225F4F4: ; 0x0225F4F4
	ldr r3, _0225F4FC ; =ov117_0225F524
	ldr r2, _0225F500 ; =ov117_0225FADC
	bx r3
	nop
_0225F4FC: .word ov117_0225F524
_0225F500: .word ov117_0225FADC
	thumb_func_end ov117_0225F4F4

	thumb_func_start ov117_0225F504
ov117_0225F504: ; 0x0225F504
	ldr r3, _0225F50C ; =ov117_0225F524
	ldr r2, _0225F510 ; =ov117_0225FAE4
	bx r3
	nop
_0225F50C: .word ov117_0225F524
_0225F510: .word ov117_0225FAE4
	thumb_func_end ov117_0225F504

	thumb_func_start ov117_0225F514
ov117_0225F514: ; 0x0225F514
	ldr r3, _0225F51C ; =ov117_0225F524
	ldr r2, _0225F520 ; =ov117_0225FAEC
	bx r3
	nop
_0225F51C: .word ov117_0225F524
_0225F520: .word ov117_0225FAEC
	thumb_func_end ov117_0225F514

	thumb_func_start ov117_0225F524
ov117_0225F524: ; 0x0225F524
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r5]
	add r6, r2, #0
	mov r7, #4
	ldr r4, [r5, #0xc]
	cmp r0, #0xc
	bls _0225F53A
	b _0225FA98
_0225F53A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F546: ; jump table
	.short _0225F560 - _0225F546 - 2 ; case 0
	.short _0225F72E - _0225F546 - 2 ; case 1
	.short _0225F744 - _0225F546 - 2 ; case 2
	.short _0225F76A - _0225F546 - 2 ; case 3
	.short _0225F79C - _0225F546 - 2 ; case 4
	.short _0225F806 - _0225F546 - 2 ; case 5
	.short _0225F820 - _0225F546 - 2 ; case 6
	.short _0225F860 - _0225F546 - 2 ; case 7
	.short _0225F944 - _0225F546 - 2 ; case 8
	.short _0225F95E - _0225F546 - 2 ; case 9
	.short _0225F99E - _0225F546 - 2 ; case 10
	.short _0225FA16 - _0225F546 - 2 ; case 11
	.short _0225FA26 - _0225F546 - 2 ; case 12
_0225F560:
	mov r1, #0x6f
	add r0, r7, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x6f
	str r0, [r5, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r4, [r5, #0xc]
	mov r1, #1
	add r0, r4, #4
	add r2, r1, #0
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	ldrb r0, [r6, #1]
	mov r2, #5
	lsl r2, r2, #6
	str r0, [sp, #4]
	ldrb r0, [r6, #2]
	add r1, r4, #4
	add r2, r4, r2
	str r0, [sp, #8]
	ldrb r0, [r6, #3]
	str r0, [sp, #0xc]
	ldr r0, _0225F8D8 ; =0x000927C0
	str r0, [sp, #0x10]
	ldrb r3, [r6]
	ldr r0, [r5, #0x20]
	bl ov01_021F0614
	mov r0, #0
	mov r2, #5
	str r0, [sp]
	lsl r2, r2, #6
	str r0, [sp, #4]
	add r1, r4, r2
	add r0, r4, #4
	lsl r2, r2, #0xc
	lsl r3, r7, #0x11
	bl ov01_021F0718
	str r0, [r4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4]
	mov r1, #1
	bl sub_02024B78
	ldr r0, [r4]
	mov r1, #0
	bl sub_02024A04
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #5
	mov r1, #0x6a
	lsl r0, r0, #0x12
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #4
	lsl r2, r7, #0x11
	str r2, [r4, r0]
	mov r0, #0
	add r1, #8
	str r0, [r4, r1]
	add r0, r7, #0
	str r0, [sp]
	ldr r0, _0225F8DC ; =0x04000050
	mov r1, #2
	mov r2, #0x3d
	mov r3, #0xc
	bl G2x_SetBlendAlpha_
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #1
	bl SetBgPriority
	mov r0, #1
	mov r1, #2
	bl SetBgPriority
	mov r0, #0
	mov r1, #3
	bl SetBgPriority
	mov r0, #1
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #0xd9
	ldr r0, [r0, #8]
	mov r2, #0xd8
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	mov r3, #0xd7
	bl ov01_021F0454
	mov r0, #0x20
	str r0, [sp]
	str r7, [sp, #4]
	ldr r0, [r5, #0x20]
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x40
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x14
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r1, #0x66
	lsl r1, r1, #2
	str r2, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	add r1, r4, r1
	ldr r0, [r0, #8]
	mov r3, #0
	bl AddWindowParameterized
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r6, #4]
	add r1, r7, #0
	bl ov117_0225F470
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	ldr r0, _0225F8E0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	mov r1, #0xda
	ldr r0, [r0, #8]
	mov r2, #0xd8
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x20]
	mov r3, #0xd7
	bl ov01_021F0454
	ldr r0, _0225F8E4 ; =0x04000048
	mov r2, #0x3f
	ldrh r3, [r0]
	mov r1, #8
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r0]
	ldrh r6, [r0, #2]
	mov r1, #0x17
	bic r6, r2
	orr r1, r6
	orr r1, r3
	strh r1, [r0, #2]
	add r1, r0, #0
	mov r2, #0xff
	sub r1, #8
	strh r2, [r1]
	ldr r1, _0225F8E8 ; =0x00006060
	sub r0, r0, #4
	strh r1, [r0]
	add r2, #0x8d
	add r0, r4, r2
	add r1, r7, #0
	bl ov01_021F12B4
	mov r1, #0x10
	mov r0, #1
	add r2, r1, #0
	str r0, [sp]
	sub r2, #0x20
	add r3, r5, #4
	bl ov01_021EFCF8
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F72E:
	mov r0, #1
	add r1, r0, #0
	bl ToggleBgLayer
	mov r0, #0x6d
	mov r1, #0xc
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0225F744:
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	add r2, r1, #0
	mov r3, #0x18
	bl BgSetPosTextAndCommit
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	bgt _0225F816
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F76A:
	lsl r2, r7, #0x18
	ldr r1, [r2]
	ldr r0, _0225F8EC ; =0xFFFF1FFF
	and r1, r0
	lsl r0, r7, #0xb
	orr r0, r1
	str r0, [r2]
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	mov r0, #0x5d
	add r3, r7, #0
	lsl r0, r0, #2
	mov r2, #6
	str r3, [sp]
	add r0, r4, r0
	mov r1, #0
	lsl r2, r2, #0x10
	lsl r3, r3, #0xc
	bl ov01_021EFEC8
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0225F79C:
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	add r2, r1, #0
	mov r3, #0x18
	bl BgSetPosTextAndCommit
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	cmp r0, #0
	bne _0225F7DC
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #0x60
	asr r2, r0, #0xc
	sub r3, r3, r2
	ldr r0, _0225F8F0 ; =0x04000040
	mov r1, #0xff
	strh r1, [r0]
	lsl r3, r3, #8
	lsl r1, r1, #8
	add r2, #0x60
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	orr r1, r3
	strh r1, [r0, #4]
	b _0225FA98
_0225F7DC:
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225F8EC ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	ldr r0, [r5, #0x10]
	mov r2, #0
	ldr r0, [r0, #8]
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r0, #0x6d
	mov r1, #0xd
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F806:
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	sub r1, r1, #1
	str r1, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	ble _0225F818
_0225F816:
	b _0225FA98
_0225F818:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F820:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xdd
	bl ov117_0225F420
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	mov r1, #2
	bl SetBgPriority
	mov r0, #0x10
	str r0, [sp]
	ldr r0, _0225F8DC ; =0x04000050
	mov r1, #2
	mov r2, #0x3d
	mov r3, #0
	bl G2x_SetBlendAlpha_
	ldr r0, [r4]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x6d
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0225F860:
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r6, #0
	cmp r1, #0x10
	bgt _0225F892
	add r1, r1, #4
	str r1, [r4, r0]
	ldr r1, [r4, r0]
	cmp r1, #0x10
	ble _0225F87C
	mov r1, #0x10
	str r1, [r4, r0]
	mov r6, #1
_0225F87C:
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r3, [r4, r0]
	mov r0, #0x10
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _0225F8DC ; =0x04000050
	mov r1, #2
	mov r2, #0x3d
	bl G2x_SetBlendAlpha_
_0225F892:
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0x12
	sub r0, r0, r1
	lsl r0, r0, #1
	mov r1, #3
	bl _s32_div_f
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	add r0, r2, r0
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	asr r0, r0, #0xc
	cmp r0, #0x82
	bgt _0225F90C
	mov r0, #2
	lsl r0, r0, #0x12
	str r0, [r4, r1]
	cmp r6, #1
	bne _0225F90C
	mov r0, #1
	str r0, [sp]
	mov r0, #8
	mov r1, #0
	mov r2, #0x10
	mov r3, #0x1e
	bl sub_0200B484
	ldr r1, _0225F8F4 ; =0x000014A5
	b _0225F8F8
	nop
_0225F8D8: .word 0x000927C0
_0225F8DC: .word 0x04000050
_0225F8E0: .word 0x00010200
_0225F8E4: .word 0x04000048
_0225F8E8: .word 0x00006060
_0225F8EC: .word 0xFFFF1FFF
_0225F8F0: .word 0x04000040
_0225F8F4: .word 0x000014A5
_0225F8F8:
	mov r0, #0
	bl BG_SetMaskColor
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_0225F90C:
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #4
	ble _0225F91E
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
_0225F91E:
	mov r3, #0x6a
	lsl r3, r3, #2
	ldr r3, [r4, r3]
	ldr r0, [r5, #0x10]
	asr r3, r3, #0xc
	add r3, #8
	ldr r0, [r0, #8]
	mov r1, #2
	mov r2, #0
	neg r3, r3
	bl ScheduleSetBgPosText
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r0, [r4]
	add r1, r4, r1
	bl sub_020247D4
	b _0225FA98
_0225F944:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _0225F96E
	mov r0, #0x6d
	mov r1, #0x10
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F95E:
	mov r1, #0x6d
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	sub r0, r0, #1
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #0
	ble _0225F970
_0225F96E:
	b _0225FA98
_0225F970:
	mov r3, #8
	add r0, r1, #0
	str r3, [sp]
	sub r1, #0xc
	sub r0, #0x40
	ldr r1, [r4, r1]
	ldr r2, _0225FABC ; =0xFFFA0000
	add r0, r4, r0
	lsl r3, r3, #0xa
	bl ov01_021EFEC8
	mov r0, #0x6d
	mov r1, #8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225F99E:
	mov r1, #0x5d
	lsl r1, r1, #2
	add r0, r1, #0
	ldr r2, [r4, r1]
	add r0, #0x34
	add r1, #0x34
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	asr r0, r0, #0xc
	add r0, #8
	neg r3, r0
	bpl _0225F9C4
	ldr r0, [r5, #0x10]
	mov r1, #2
	ldr r0, [r0, #8]
	mov r2, #0
	bl ScheduleSetBgPosText
	b _0225F9CC
_0225F9C4:
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
_0225F9CC:
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r0, [r4]
	add r1, r4, r1
	bl sub_020247D4
	mov r0, #0x5d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021EFF28
	cmp r0, #0
	beq _0225FA98
	ldr r2, _0225FAC0 ; =0x04001000
	ldr r0, _0225FAC4 ; =0xFFFEFFFF
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	mov r1, #4
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r1, [sp, #8]
	ldr r3, _0225FAC8 ; =0x00007FFF
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225FA16:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225FA98
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0225FA98
_0225FA26:
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _0225FA30
	mov r0, #1
	str r0, [r1]
_0225FA30:
	mov r0, #0x63
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov01_021F12D0
	mov r0, #0x6e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4]
	bl sub_02024758
	mov r1, #5
	lsl r1, r1, #6
	add r0, r4, #4
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #4
	bl ov01_021F05F4
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	bl RemoveWindow
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #4
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0x10]
	mov r1, #3
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r5, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	ldr r1, [sp, #0x14]
	add r0, r5, #0
	bl ov01_021EFCDC
_0225FA98:
	mov r0, #0x6e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0225FAAC
	sub r0, #0x2c
	add r0, r4, r0
	mov r1, #2
	bl ov01_021F1310
_0225FAAC:
	ldr r0, [r5]
	cmp r0, #0xc
	beq _0225FAB8
	ldr r0, [r4, #4]
	bl sub_0202457C
_0225FAB8:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FABC: .word 0xFFFA0000
_0225FAC0: .word 0x04001000
_0225FAC4: .word 0xFFFEFFFF
_0225FAC8: .word 0x00007FFF
	thumb_func_end ov117_0225F524

	.rodata

_0225FACC:
	.byte 0xDE, 0xDF, 0xE0, 0xE1
	.byte 0xE8, 0x01, 0x00, 0x00

ov117_0225FAD4: ; 0x0225FAD4
	.byte 0xE2, 0xE3, 0xE4, 0xE5, 0xE6, 0x01, 0x00, 0x00

ov117_0225FADC: ; 0x0225FADC
	.byte 0xE6, 0xE7, 0xE8, 0xE9
	.byte 0xE5, 0x01, 0x00, 0x00

ov117_0225FAE4: ; 0x0225FAE4
	.byte 0xEA, 0xEB, 0xEC, 0xED, 0xDF, 0x01, 0x00, 0x00

ov117_0225FAEC: ; 0x0225FAEC
	.byte 0xEE, 0xEF, 0xF0, 0xF1
	.byte 0xBC, 0x02, 0x00, 0x00

ov117_0225FAF4: ; 0x0225FAF4
	.byte 0x00, 0x40, 0x10, 0x00

ov117_0225FAF8: ; 0x0225FAF8
	.byte 0x00, 0x00, 0x08, 0x00

ov117_0225FAFC: ; 0x0225FAFC
	.byte 0x00, 0x20, 0xFE, 0xFF

ov117_0225FB00: ; 0x0225FB00
	.byte 0x00, 0x00, 0x00, 0x00

ov117_0225FB04: ; 0x0225FB04
	.byte 0x00, 0x40, 0x06, 0x00

ov117_0225FB08: ; 0x0225FB08
	.byte 0x00, 0x40, 0x01, 0x00

ov117_0225FB0C: ; 0x0225FB0C
	.byte 0x04, 0x00, 0x00, 0x00

ov117_0225FB10: ; 0x0225FB10
	.byte 0xFE, 0xFF, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x08, 0x00, 0x00, 0xE0, 0x01, 0x00
	.byte 0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0xC0, 0xFE, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0xE0, 0x01, 0x00
	.byte 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x40, 0x06, 0x00, 0x00, 0x40, 0x01, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0xFD, 0xFF, 0x00, 0xC0, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x60, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0xC0, 0xFE, 0xFF, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0xFE, 0xFF, 0x00, 0x40, 0x10, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x20, 0xFE, 0xFF
	.byte 0x00, 0x00, 0x05, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x10, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0xE0, 0x01, 0x00
	.byte 0x00, 0x00, 0x0A, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0xC0, 0xFE, 0xFF, 0x03, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00
	; 0x0225FBB4
