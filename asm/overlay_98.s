	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov98_0221E5C0
ov98_0221E5C0: ; 0x0221E5C0
	push {r4, lr}
	add r4, r0, #0
	bne _0221E5CA
	bl GF_AssertFail
_0221E5CA:
	ldr r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov98_0221E5C0

	thumb_func_start ov98_0221E5D0
ov98_0221E5D0: ; 0x0221E5D0
	push {r4, lr}
	add r4, r0, #0
	bne _0221E5DA
	bl GF_AssertFail
_0221E5DA:
	ldr r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov98_0221E5D0

	thumb_func_start ov98_0221E5E0
ov98_0221E5E0: ; 0x0221E5E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r1, [sp]
	mov r1, #0x18
	add r6, r0, #0
	add r5, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	str r6, [r4]
	add r0, r6, #0
	bl sub_0200CF18
	str r0, [r4, #4]
	bl sub_0200CF38
	str r0, [r4, #8]
	ldr r1, [r4]
	mov r0, #0x14
	bl NARC_ctor
	str r0, [r4, #0x10]
	mov r0, #0
	mvn r0, r0
	add r2, sp, #0x18
	ldr r3, _0221E67C ; =ov98_0221F1C0
	strb r0, [r4, #0x14]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _0221E680 ; =ov98_0221F1AC
	add r2, sp, #4
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r6, #0
	str r0, [r2]
	str r5, [sp, #4]
	ldr r0, [r4, #4]
	add r2, r7, #0
	mov r3, #0x20
	bl sub_0200CF70
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	add r2, r5, #0
	bl sub_0200CFF4
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r2, [sp]
	bl sub_0200D3F8
	ldr r0, [r4]
	bl sub_020030E8
	str r0, [r4, #0xc]
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E67C: .word ov98_0221F1C0
_0221E680: .word ov98_0221F1AC
	thumb_func_end ov98_0221E5E0

	thumb_func_start ov98_0221E684
ov98_0221E684: ; 0x0221E684
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7, #0x10]
	add r5, r1, #0
	add r6, r2, #0
	bl NARC_dtor
	ldr r0, [r7, #0xc]
	bl sub_02003104
	mov r4, #0
	cmp r6, #0
	bls _0221E6B4
_0221E69E:
	ldr r0, [r5]
	cmp r0, #0
	beq _0221E6AC
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r5]
_0221E6AC:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blo _0221E69E
_0221E6B4:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	bl sub_0200D998
	ldr r0, [r7, #4]
	bl sub_0200D108
	add r0, r7, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov98_0221E684

	thumb_func_start ov98_0221E6CC
ov98_0221E6CC: ; 0x0221E6CC
	push {r4, lr}
	add r4, r0, #0
	bne _0221E6D6
	bl GF_AssertFail
_0221E6D6:
	ldr r0, [r4, #8]
	bl sub_0200D020
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov98_0221E6CC

	thumb_func_start ov98_0221E6E0
ov98_0221E6E0: ; 0x0221E6E0
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, [r3, #4]
	ldr r1, [r3, #8]
	ldr r3, _0221E6EC ; =sub_0200D734
	bx r3
	.balign 4, 0
_0221E6EC: .word sub_0200D734
	thumb_func_end ov98_0221E6E0

	thumb_func_start ov98_0221E6F0
ov98_0221E6F0: ; 0x0221E6F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp]
	ldr r0, [sp, #0x58]
	add r5, r2, #0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	add r4, r1, #0
	str r0, [sp, #0x5c]
	mov r0, #0
	add r2, sp, #8
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	str r0, [r2]
	add r0, r3, #0
	str r3, [sp, #4]
	cmp r0, #0xa
	bls _0221E722
	bl GF_AssertFail
_0221E722:
	add r1, sp, #0x40
	mov r0, #0x14
	ldrsh r6, [r1, r0]
	ldr r0, [sp, #0x50]
	mov r7, #0
	lsl r0, r0, #2
	add r4, r4, r0
_0221E730:
	ldr r0, [sp, #4]
	cmp r7, r0
	bhs _0221E73A
	mov r1, #1
	b _0221E73C
_0221E73A:
	mov r1, #0
_0221E73C:
	add r0, sp, #8
	strh r1, [r0, #6]
	ldr r0, [r5]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #4]
	str r0, [sp, #0x20]
	ldr r0, [r5, #8]
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _0221E75A
	mov r0, #1
	b _0221E75C
_0221E75A:
	mov r0, #2
_0221E75C:
	str r0, [sp, #0x18]
	add r0, sp, #8
	strh r6, [r0]
	ldr r1, [sp, #0x58]
	strh r1, [r0, #2]
	ldr r0, [sp]
	add r1, sp, #8
	bl ov98_0221E6E0
	mov r1, #1
	stmia r4!, {r0}
	bl sub_0200DC78
	add r7, r7, #1
	add r6, #0x10
	cmp r7, #0xa
	blo _0221E730
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov98_0221E6F0

	thumb_func_start ov98_0221E784
ov98_0221E784: ; 0x0221E784
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r2, #0
	mov r2, #0
	add r4, r3, #0
	str r2, [sp]
	str r4, [sp, #4]
	ldr r2, [r5]
	mov r3, #0x4c
	str r2, [sp, #8]
	mov r2, #8
	add r6, r0, #0
	add r7, r1, #0
	bl sub_0200D4A4
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r5, #4]
	add r1, r7, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r2, #8
	mov r3, #0x4b
	bl sub_0200D564
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #8]
	add r1, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #8
	mov r3, #0x4d
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r2, #8
	mov r3, #0x4e
	bl sub_0200D704
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov98_0221E784

	thumb_func_start ov98_0221E7E8
ov98_0221E7E8: ; 0x0221E7E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r4, r1, #0
	str r2, [sp, #0x14]
	ldr r2, [r4]
	add r5, r0, #0
	lsl r1, r2, #0x17
	add r6, r3, #0
	lsr r1, r1, #0x17
	bne _0221E806
	mov r1, #0
	bl sub_0200DCE8
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
_0221E806:
	lsl r0, r2, #0xf
	lsr r0, r0, #0x1f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	lsl r1, r1, #0x10
	lsl r0, r0, #0x12
	lsr r0, r0, #0x1b
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	lsr r1, r1, #0x10
	str r0, [sp, #8]
	ldr r2, [r4]
	add r0, sp, #0x28
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1e
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #2
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r3, _0221E8A4 ; =ov98_0221F19C
	add r2, sp, #0x18
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x32
	ldr r0, [sp, #0x50]
	lsl r1, r1, #6
	bl AllocFromHeapAtEnd
	add r7, r0, #0
	str r7, [sp]
	ldr r0, [r4, #4]
	add r1, sp, #0x18
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldr r2, [sp, #0x50]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x17
	str r0, [sp, #0x10]
	ldrh r0, [r1, #0x10]
	ldrh r1, [r1, #0x12]
	add r3, sp, #0x18
	bl sub_02014510
	mov r2, #0x32
	add r0, r5, #0
	add r1, r7, #0
	lsl r2, r2, #6
	bl ov98_0221E9FC
	ldr r0, [sp, #0x50]
	str r6, [sp]
	str r0, [sp, #4]
	add r2, sp, #0x18
	ldrh r1, [r2, #0x10]
	ldrh r2, [r2, #0x14]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl ov98_0221EA4C
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DCE8
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E8A4: .word ov98_0221F19C
	thumb_func_end ov98_0221E7E8

	thumb_func_start ov98_0221E8A8
ov98_0221E8A8: ; 0x0221E8A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp, #0x10]
	ldr r7, [r0, #4]
	ldr r6, [r0, #8]
	ldr r0, [sp, #0x40]
	add r5, r1, #0
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	cmp r0, #0
	beq _0221E8C4
	mov r0, #0x1c
	str r0, [sp, #0x1c]
	b _0221E8C8
_0221E8C4:
	mov r0, #0x1d
	str r0, [sp, #0x1c]
_0221E8C8:
	bl sub_0207449C
	str r0, [sp, #0x28]
	bl sub_020744A8
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	mov r4, #0
	cmp r0, #0
	ble _0221E908
	ldr r0, [sp, #0x18]
	lsl r1, r0, #2
	ldr r0, _0221E96C ; =_0221F194
	ldr r0, [r0, r1]
	str r0, [sp, #0x20]
_0221E8E6:
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, r6, #0
	add r0, r0, r4
	str r0, [sp, #8]
	add r0, r7, #0
	mov r2, #0xb1
	bl sub_0200D4A4
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	cmp r4, r0
	blt _0221E8E6
_0221E908:
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #8]
	ldr r3, [sp, #0x28]
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	mov r2, #0x14
	bl sub_0200D6D4
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	ldr r3, [sp, #0x24]
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r6, #0
	mov r2, #0x14
	bl sub_0200D704
	ldr r0, [sp, #0x10]
	mov r1, #0x14
	ldrsb r0, [r0, r1]
	sub r1, #0x15
	cmp r0, r1
	bne _0221E966
	bl sub_02074490
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	mov r2, #0x14
	lsl r1, r0, #2
	ldr r0, _0221E96C ; =_0221F194
	ldr r0, [r0, r1]
	add r1, r6, #0
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	str r0, [sp, #0xc]
	add r0, r7, #0
	bl sub_0200D564
	ldr r1, [sp, #0x10]
	strb r0, [r1, #0x14]
_0221E966:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0221E96C: .word _0221F194
	thumb_func_end ov98_0221E8A8

	thumb_func_start ov98_0221E970
ov98_0221E970: ; 0x0221E970
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	mov r4, #2
	ldr r0, [sp, #0x20]
	add r5, r1, #0
	lsl r4, r4, #8
	cmp r0, #0
	beq _0221E984
	lsl r4, r4, #1
_0221E984:
	ldr r0, [r2]
	lsl r1, r0, #0x17
	lsl r0, r0, #0x12
	lsr r0, r0, #0x1b
	str r0, [sp]
	lsr r7, r1, #0x17
	ldr r2, [sp]
	add r0, r7, #0
	mov r1, #0
	bl GetMonIconNaixEx
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #8
	bl ov98_0221EAA8
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	ldr r1, [r1, #0x14]
	add r0, r5, #0
	add r2, r4, #0
	bl ov98_0221E9FC
	ldr r0, [sp, #4]
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0
	bl sub_0200DCE8
	ldr r1, [sp]
	add r0, r7, #0
	mov r2, #0
	bl GetMonIconPaletteEx
	mov r1, #0x14
	add r2, r0, #0
	ldrsb r1, [r6, r1]
	add r0, r5, #0
	add r1, r2, r1
	bl sub_0200DD10
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0221E9F8
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DC4C
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_0200DC8C
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DC78
_0221E9F8:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov98_0221E970

	thumb_func_start ov98_0221E9FC
ov98_0221E9FC: ; 0x0221E9FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r7, r2, #0
	bl sub_02024B60
	add r4, r0, #0
	ldr r0, [r5]
	bl sub_02024B1C
	add r1, r4, #0
	bl NNS_G2dGetImageLocation
	add r5, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl DC_FlushRange
	cmp r4, #1
	beq _0221EA2C
	cmp r4, #2
	beq _0221EA38
	b _0221EA44
_0221EA2C:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl GX_LoadOBJ
	pop {r3, r4, r5, r6, r7, pc}
_0221EA38:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl GXS_LoadOBJ
	pop {r3, r4, r5, r6, r7, pc}
_0221EA44:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov98_0221E9FC

	thumb_func_start ov98_0221EA4C
ov98_0221EA4C: ; 0x0221EA4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	str r2, [sp, #8]
	add r4, r3, #0
	beq _0221EA5E
	mov r5, #1
	add r6, r5, #0
	b _0221EA62
_0221EA5E:
	mov r5, #2
	mov r6, #5
_0221EA62:
	ldr r0, [r0]
	bl sub_02024B34
	add r1, r5, #0
	bl NNS_G2dGetImagePaletteLocation
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl GfGfxLoader_GXLoadPal
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0221EA9C
	cmp r4, #0
	beq _0221EA92
	ldr r0, _0221EAA0 ; =0x05000200
	b _0221EA94
_0221EA92:
	ldr r0, _0221EAA4 ; =0x05000600
_0221EA94:
	add r0, r5, r0
	mov r1, #0x20
	bl sub_02003F04
_0221EA9C:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EAA0: .word 0x05000200
_0221EAA4: .word 0x05000600
	thumb_func_end ov98_0221EA4C

	thumb_func_start ov98_0221EAA8
ov98_0221EAA8: ; 0x0221EAA8
	push {r3, lr}
	add r3, r2, #0
	ldr r2, [r0]
	str r2, [sp]
	ldr r0, [r0, #0x10]
	mov r2, #0
	bl GfGfxLoader_GetCharDataFromOpenNarc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov98_0221EAA8

	thumb_func_start ov98_0221EABC
ov98_0221EABC: ; 0x0221EABC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	ldr r1, [sp]
	mov r0, #4
	str r2, [sp, #8]
	add r6, r3, #0
	bl FontID_Alloc
	ldr r0, [sp]
	mov r1, #0x1c
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp, #8]
	lsl r5, r0, #4
	ldr r0, [sp]
	add r1, r5, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #4]
	bl MI_CpuFill8
	mov r1, #6
	ldr r2, [sp]
	mov r0, #0
	lsl r1, r1, #6
	bl LoadFontPal0
	mov r1, #6
	ldr r2, [sp]
	mov r0, #4
	lsl r1, r1, #6
	bl LoadFontPal0
	ldr r0, [sp, #8]
	mov r7, #0
	cmp r0, #0
	ble _0221EB44
	add r5, r7, #0
_0221EB1A:
	ldr r1, [r4, #4]
	ldr r0, [sp, #4]
	add r1, r1, r5
	add r2, r6, #0
	bl AddWindow
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, r0, r5
	bl FillWindowPixelBuffer
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl ClearWindowTilemap
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r6, #8
	add r5, #0x10
	cmp r7, r0
	blt _0221EB1A
_0221EB44:
	ldr r3, [sp]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	bl NewMsgDataFromNarc
	str r0, [r4, #0xc]
	ldr r2, [sp, #0x20]
	ldr r3, [sp]
	mov r0, #1
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #8]
	ldr r0, [sp]
	bl ScrStrBufs_new
	str r0, [r4, #0x10]
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0xa
	bl String_ctor
	str r0, [r4, #0x14]
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #8]
	str r0, [r4, #0x18]
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov98_0221EABC

	thumb_func_start ov98_0221EB84
ov98_0221EB84: ; 0x0221EB84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #4
	add r7, r1, #0
	bl FontID_Release
	ldr r0, [r5, #0x14]
	bl String_dtor
	ldr r0, [r5, #0x10]
	bl ScrStrBufs_delete
	ldr r0, [r5, #0xc]
	bl DestroyMsgData
	ldr r0, [r5, #8]
	bl DestroyMsgData
	mov r6, #0
	cmp r7, #0
	ble _0221EBC8
	add r4, r6, #0
_0221EBB0:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl RemoveWindow
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r7
	blt _0221EBB0
_0221EBC8:
	ldr r0, [r5, #4]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov98_0221EB84

	thumb_func_start ov98_0221EBD8
ov98_0221EBD8: ; 0x0221EBD8
	push {r4, lr}
	sub sp, #8
	mov r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	bl ov98_0221EBEC
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov98_0221EBD8

	thumb_func_start ov98_0221EBEC
ov98_0221EBEC: ; 0x0221EBEC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r4, #0
	str r4, [sp]
	add r5, sp, #0x10
	ldrb r5, [r5, #0x10]
	str r5, [sp, #4]
	ldr r5, [sp, #0x24]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	bl ov98_0221EC3C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov98_0221EBEC

	thumb_func_start ov98_0221EC08
ov98_0221EC08: ; 0x0221EC08
	push {r3, lr}
	sub sp, #0x10
	str r3, [sp]
	add r3, sp, #8
	ldrb r3, [r3, #0x10]
	str r3, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	bl ov98_0221EC3C
	add sp, #0x10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov98_0221EC08

	thumb_func_start ov98_0221EC24
ov98_0221EC24: ; 0x0221EC24
	push {r4, lr}
	sub sp, #0x10
	mov r4, #0
	str r4, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r3, [sp, #0xc]
	mov r3, #1
	bl ov98_0221EC3C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov98_0221EC24

	thumb_func_start ov98_0221EC3C
ov98_0221EC3C: ; 0x0221EC3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #0x10]
	mov r4, #0
	cmp r6, r0
	blo _0221EC54
	bl GF_AssertFail
_0221EC54:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #8]
	ldr r3, [r5]
	add r2, r7, #0
	bl ReadMsgData_ExpandPlaceholders
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0221EC8A
	ldr r1, [r5, #4]
	lsl r0, r6, #4
	add r0, r1, r0
	bl GetWindowWidth
	lsl r0, r0, #0x1b
	lsr r4, r0, #0x18
	ldr r0, [sp, #0x30]
	add r1, r7, #0
	mov r2, #0
	bl FontID_String_GetWidthMultiline
	sub r0, r4, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x17
	lsr r4, r0, #0x18
_0221EC8A:
	add r1, sp, #0x18
	ldr r0, [r5, #4]
	lsl r6, r6, #4
	ldrb r1, [r1, #0x1c]
	add r0, r0, r6
	bl FillWindowPixelBuffer
	add r3, sp, #0x18
	ldrb r0, [r3, #0x14]
	ldr r1, [sp, #0x30]
	add r2, r7, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ECCC ; =0x00010200
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	ldr r0, [r5, #4]
	add r0, r0, r6
	add r3, r4, r3
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #4]
	add r0, r0, r6
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221ECCC: .word 0x00010200
	thumb_func_end ov98_0221EC3C

	thumb_func_start ov98_0221ECD0
ov98_0221ECD0: ; 0x0221ECD0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	add r4, r1, #0
	add r6, r2, #0
	str r0, [sp, #4]
	add r2, r3, #0
	ldr r0, [r5, #0x10]
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x20]
	bl BufferIntegerAsString
	ldr r0, [r5, #8]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r1, r4, #0
	bl ov98_0221EF14
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221ED38 ; =0x00010200
	lsl r4, r4, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	add r0, r0, r4
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221ED38: .word 0x00010200
	thumb_func_end ov98_0221ECD0

	thumb_func_start ov98_0221ED3C
ov98_0221ED3C: ; 0x0221ED3C
	push {r3, lr}
	mov r3, #0
	str r3, [sp]
	bl ov98_0221ED48
	pop {r3, pc}
	thumb_func_end ov98_0221ED3C

	thumb_func_start ov98_0221ED48
ov98_0221ED48: ; 0x0221ED48
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r5, r1, #0
	add r1, r2, #0
	add r6, r3, #0
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	add r2, r7, #0
	bl StringExpandPlaceholders
	add r0, r4, #0
	add r1, r5, #0
	bl ov98_0221EF14
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	mov r1, #0
	lsl r5, r5, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EDA0 ; =0x00010200
	add r3, r6, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x14]
	add r0, r0, r5
	bl AddTextPrinterParameterized2
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl ScheduleWindowCopyToVram
	add r0, r7, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EDA0: .word 0x00010200
	thumb_func_end ov98_0221ED48

	thumb_func_start ov98_0221EDA4
ov98_0221EDA4: ; 0x0221EDA4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	add r4, r2, #0
	add r1, r3, #0
	ldr r0, [r0, #0x10]
	add r2, r5, #0
	add r3, r4, #0
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov98_0221EDA4

	thumb_func_start ov98_0221EDC4
ov98_0221EDC4: ; 0x0221EDC4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	add r4, r1, #0
	ldr r0, [r5, #0x10]
	ldr r2, [sp, #0x20]
	add r1, r3, #0
	bl BufferPlayersName
	ldr r0, [r5, #8]
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r1, r4, #0
	bl ov98_0221EF14
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE24 ; =0x00010200
	lsl r4, r4, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	add r0, r0, r4
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0221EE24: .word 0x00010200
	thumb_func_end ov98_0221EDC4

	thumb_func_start ov98_0221EE28
ov98_0221EE28: ; 0x0221EE28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _0221EE7C ; =0x000001ED
	add r7, r2, #0
	add r4, r1, #0
	ldr r6, [r5, #0xc]
	cmp r7, r0
	bls _0221EE3E
	bl GF_AssertFail
_0221EE3E:
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r7, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	lsl r4, r4, #4
	add r0, r0, r4
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EE80 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221EE7C: .word 0x000001ED
_0221EE80: .word 0x00010200
	thumb_func_end ov98_0221EE28

	thumb_func_start ov98_0221EE84
ov98_0221EE84: ; 0x0221EE84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov98_0221EF14
	ldr r1, [r5, #4]
	lsl r0, r4, #4
	add r0, r1, r0
	bl ScheduleWindowCopyToVram
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov98_0221EE84

	thumb_func_start ov98_0221EE9C
ov98_0221EE9C: ; 0x0221EE9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov98_0221EF14
	add r0, sp, #0x18
	ldrb r0, [r0, #0x10]
	mov r1, #0
	lsl r5, r5, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221EED8 ; =0x00010200
	add r2, r6, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #4]
	add r3, r7, #0
	add r0, r0, r5
	bl AddTextPrinterParameterized2
	ldr r0, [r4, #4]
	add r0, r0, r5
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EED8: .word 0x00010200
	thumb_func_end ov98_0221EE9C

	thumb_func_start ov98_0221EEDC
ov98_0221EEDC: ; 0x0221EEDC
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	ldr r3, _0221EEE8 ; =ClearWindowTilemapAndScheduleTransfer
	add r0, r2, r0
	bx r3
	nop
_0221EEE8: .word ClearWindowTilemapAndScheduleTransfer
	thumb_func_end ov98_0221EEDC

	thumb_func_start ov98_0221EEEC
ov98_0221EEEC: ; 0x0221EEEC
	ldr r3, [r0, #4]
	lsl r0, r1, #4
	add r0, r3, r0
	ldr r3, _0221EEF8 ; =SetWindowY
	add r1, r2, #0
	bx r3
	.balign 4, 0
_0221EEF8: .word SetWindowY
	thumb_func_end ov98_0221EEEC

	thumb_func_start ov98_0221EEFC
ov98_0221EEFC: ; 0x0221EEFC
	push {r4, lr}
	add r4, r0, #0
	bne _0221EF06
	bl GF_AssertFail
_0221EF06:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0221EF10
	bl GF_AssertFail
_0221EF10:
	ldr r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov98_0221EEFC

	thumb_func_start ov98_0221EF14
ov98_0221EF14: ; 0x0221EF14
	ldr r2, [r0, #4]
	lsl r0, r1, #4
	ldr r3, _0221EF20 ; =FillWindowPixelBuffer
	add r0, r2, r0
	mov r1, #0
	bx r3
	.balign 4, 0
_0221EF20: .word FillWindowPixelBuffer
	thumb_func_end ov98_0221EF14

	thumb_func_start ov98_0221EF24
ov98_0221EF24: ; 0x0221EF24
	push {r3, r4, lr}
	sub sp, #4
	ldr r2, _0221EF5C ; =ov98_0221F1E0
	add r1, sp, #0
	ldrb r3, [r2]
	add r0, sp, #0
	mov r4, #0
	strb r3, [r1]
	ldrb r3, [r2, #1]
	strb r3, [r1, #1]
	ldrb r3, [r2, #2]
	ldrb r2, [r2, #3]
	strb r3, [r1, #2]
	strb r2, [r1, #3]
	bl sub_02025320
	cmp r0, #0
	bne _0221EF52
	ldr r0, _0221EF60 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0221EF54
_0221EF52:
	mov r4, #1
_0221EF54:
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, pc}
	nop
_0221EF5C: .word ov98_0221F1E0
_0221EF60: .word gSystem
	thumb_func_end ov98_0221EF24

	thumb_func_start ov98_0221EF64
ov98_0221EF64: ; 0x0221EF64
	ldr r1, _0221EF7C ; =0x000001C2
	cmp r0, r1
	blo _0221EF6E
	mov r0, #2
	bx lr
_0221EF6E:
	sub r1, #0x1e
	cmp r0, r1
	blo _0221EF78
	mov r0, #1
	bx lr
_0221EF78:
	mov r0, #0
	bx lr
	.balign 4, 0
_0221EF7C: .word 0x000001C2
	thumb_func_end ov98_0221EF64

	thumb_func_start ov98_0221EF80
ov98_0221EF80: ; 0x0221EF80
	ldr r2, _0221EFA0 ; =ov98_0221F220
	mov r3, #0
_0221EF84:
	lsl r1, r3, #2
	ldr r1, [r2, r1]
	cmp r1, r0
	ble _0221EF96
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #0xa
	blo _0221EF84
_0221EF96:
	mov r0, #0xa
	sub r0, r0, r3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	.balign 4, 0
_0221EFA0: .word ov98_0221F220
	thumb_func_end ov98_0221EF80

	thumb_func_start ov98_0221EFA4
ov98_0221EFA4: ; 0x0221EFA4
	lsl r2, r0, #2
	ldr r0, _0221EFB0 ; =ov98_0221F1F8
	lsl r1, r1, #1
	add r0, r0, r2
	ldrh r0, [r1, r0]
	bx lr
	.balign 4, 0
_0221EFB0: .word ov98_0221F1F8
	thumb_func_end ov98_0221EFA4

	thumb_func_start ov98_0221EFB4
ov98_0221EFB4: ; 0x0221EFB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov98_0221EFA4
	ldr r1, _0221EFE4 ; =0x0000FFFF
	cmp r4, r1
	bne _0221EFC8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221EFC8:
	cmp r5, #0
	bne _0221EFD8
	cmp r4, r0
	bhs _0221EFD4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221EFD4:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221EFD8:
	cmp r4, r0
	bls _0221EFE0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221EFE0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221EFE4: .word 0x0000FFFF
	thumb_func_end ov98_0221EFB4

	thumb_func_start ov98_0221EFE8
ov98_0221EFE8: ; 0x0221EFE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov98_0221EFA4
	ldr r1, _0221F018 ; =0x0000FFFF
	cmp r4, r1
	bne _0221EFFC
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221EFFC:
	cmp r5, #0
	bne _0221F00C
	cmp r4, r0
	bhi _0221F008
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221F008:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221F00C:
	cmp r4, r0
	blo _0221F014
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221F014:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221F018: .word 0x0000FFFF
	thumb_func_end ov98_0221EFE8

	thumb_func_start ov98_0221F01C
ov98_0221F01C: ; 0x0221F01C
	lsl r1, r1, #3
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov98_0221F01C

	thumb_func_start ov98_0221F024
ov98_0221F024: ; 0x0221F024
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r5, _0221F050 ; =0x00000000
	bne _0221F030
	bl GF_AssertFail
_0221F030:
	ldr r7, _0221F054 ; =0x000001ED
	mov r4, #0
_0221F034:
	ldrb r0, [r6, r4]
	bl MATH_CountPopulation
	cmp r0, #5
	bne _0221F044
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_0221F044:
	add r4, r4, #1
	cmp r4, r7
	blt _0221F034
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F050: .word 0x00000000
_0221F054: .word 0x000001ED
	thumb_func_end ov98_0221F024

	thumb_func_start ov98_0221F058
ov98_0221F058: ; 0x0221F058
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
	mov r7, #0x2c
_0221F062:
	add r0, r4, #0
	mul r0, r7
	add r0, r6, r0
	mov r1, #0
	bl ov98_0221F01C
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl ov98_0221EFE8
	cmp r0, #0
	beq _0221F082
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0221F082:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xa
	blo _0221F062
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov98_0221F058

	thumb_func_start ov98_0221F090
ov98_0221F090: ; 0x0221F090
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0221F0DC ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0221F0E0 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r2, _0221F0E4 ; =0x04000304
	ldr r0, _0221F0E8 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	bl ov98_0221F174
	pop {r3, pc}
	nop
_0221F0DC: .word 0xFFFFE0FF
_0221F0E0: .word 0x04001000
_0221F0E4: .word 0x04000304
_0221F0E8: .word 0xFFFF7FFF
	thumb_func_end ov98_0221F090

	thumb_func_start ov98_0221F0EC
ov98_0221F0EC: ; 0x0221F0EC
	push {r3, lr}
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0221F118 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0221F11C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_0221F118: .word 0xFFFFE0FF
_0221F11C: .word 0x04001000
	thumb_func_end ov98_0221F0EC

	thumb_func_start ov98_0221F120
ov98_0221F120: ; 0x0221F120
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _0221F12C
	cmp r4, #5
	blo _0221F130
_0221F12C:
	bl GF_AssertFail
_0221F130:
	ldr r1, _0221F14C ; =ov98_0221F1E4
	lsl r2, r4, #2
	ldr r1, [r1, r2]
	add r0, r5, #0
	bl _u32_div_f
	add r0, r1, #0
	sub r1, r4, #1
	lsl r2, r1, #2
	ldr r1, _0221F14C ; =ov98_0221F1E4
	ldr r1, [r1, r2]
	bl _u32_div_f
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221F14C: .word ov98_0221F1E4
	thumb_func_end ov98_0221F120

	thumb_func_start ov98_0221F150
ov98_0221F150: ; 0x0221F150
	push {r3, r4, r5, lr}
	mov r5, #0
	cmp r0, #0
	bne _0221F15C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221F15C:
	mov r4, #0xa
_0221F15E:
	cmp r0, #0
	beq _0221F170
	add r1, r4, #0
	bl _s32_div_f
	add r1, r5, #1
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	b _0221F15E
_0221F170:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov98_0221F150

	thumb_func_start ov98_0221F174
ov98_0221F174: ; 0x0221F174
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0221F190 ; =ov98_0221F248
	add r3, sp, #0
	mov r2, #5
_0221F17E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0221F17E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0221F190: .word ov98_0221F248
	thumb_func_end ov98_0221F174

	.rodata

_0221F194:
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov98_0221F19C: ; 0x0221F19C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov98_0221F1AC: ; 0x0221F1AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00

ov98_0221F1C0: ; 0x0221F1C0
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov98_0221F1E0: ; 0x0221F1E0
	.byte 0xA0, 0xC0, 0xC0, 0x00

ov98_0221F1E4: ; 0x0221F1E4
	.byte 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0xE8, 0x03, 0x00, 0x00, 0x10, 0x27, 0x00, 0x00

ov98_0221F1F8: ; 0x0221F1F8
	.byte 0xB8, 0x0B, 0x60, 0x09, 0x23, 0x00, 0x32, 0x00
	.byte 0x28, 0x00, 0x3C, 0x00, 0x50, 0x00, 0x82, 0x00, 0x28, 0x00, 0x46, 0x00, 0x5E, 0x01, 0xF4, 0x01
	.byte 0x00, 0x30, 0x00, 0x40, 0x46, 0x00, 0x64, 0x00, 0x1E, 0x00, 0x37, 0x00, 0x03, 0x00, 0x09, 0x00

ov98_0221F220: ; 0x0221F220
	.byte 0xC8, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov98_0221F248: ; 0x0221F248
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x0221F270
