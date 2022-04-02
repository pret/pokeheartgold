	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov19_022598C0
ov19_022598C0: ; 0x022598C0
	push {r3, r4, r5, lr}
	mov r1, #0x76
	add r5, r0, #0
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x76
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0xb
	str r0, [r4]
	str r5, [r4, #0x14]
	ldr r0, [r5, #8]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	str r0, [r4, #0x1c]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	bl sub_020183F0
	mov r1, #0x1d
	str r0, [r4, #8]
	lsl r1, r1, #4
	ldr r0, [r4, #0x1c]
	add r1, r4, r1
	bl sub_0206A8C0
	ldr r0, _02259914 ; =ov19_02259950
	add r1, r4, #0
	mov r2, #1
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02259914: .word ov19_02259950
	thumb_func_end ov19_022598C0

	thumb_func_start ov19_02259918
ov19_02259918: ; 0x02259918
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl sub_0201F988
	add r4, r0, #0
	mov r0, #0x43
	lsl r0, r0, #2
	ldr r1, [r4, #8]
	add r0, r5, r0
	bl sub_02018410
	add r0, r4, #0
	bl ov19_022599D4
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl DestroySysTask
	mov r0, #0
	add r5, #0xd8
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov19_02259918

	thumb_func_start ov19_02259950
ov19_02259950: ; 0x02259950
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02259964
	cmp r0, #1
	beq _02259972
	cmp r0, #2
	beq _0225998E
	b _022599A0
_02259964:
	add r0, r4, #0
	bl ov19_022599AC
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, pc}
_02259972:
	ldr r0, _022599A8 ; =0x0400006C
	bl GXx_GetMasterBrightness_
	cmp r0, #0
	bne _022599A0
	add r0, r4, #0
	bl ov19_022599F8
	cmp r0, #0
	beq _022599A0
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _022599A0
_0225998E:
	add r0, r4, #0
	bl ov19_02259E44
	cmp r0, #0
	beq _022599A0
	ldr r0, [r4, #0x1c]
	ldr r1, [r4, #0xc]
	bl sub_0206A8DC
_022599A0:
	ldr r0, [r4, #0x5c]
	bl sub_0202457C
	pop {r4, pc}
	.balign 4, 0
_022599A8: .word 0x0400006C
	thumb_func_end ov19_02259950

	thumb_func_start ov19_022599AC
ov19_022599AC: ; 0x022599AC
	push {r4, lr}
	add r4, r0, #0
	bl ov19_02259AD8
	add r0, r4, #0
	bl ov19_02259BC0
	add r0, r4, #0
	bl ov19_02259C68
	add r0, r4, #0
	bl ov19_02259CF4
	add r0, r4, #0
	bl ov19_02259D44
	add r0, r4, #0
	bl ov19_02259F64
	pop {r4, pc}
	thumb_func_end ov19_022599AC

	thumb_func_start ov19_022599D4
ov19_022599D4: ; 0x022599D4
	push {r4, lr}
	add r4, r0, #0
	bl ov19_02259DF4
	add r0, r4, #0
	bl ov19_02259D24
	add r0, r4, #0
	bl ov19_02259CBC
	add r0, r4, #0
	bl ov19_02259C64
	add r0, r4, #0
	bl ov19_02259B90
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov19_022599D4

	thumb_func_start ov19_022599F8
ov19_022599F8: ; 0x022599F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov19_02259ABC
	add r4, r0, #0
	bne _02259A14
	add r0, r5, #0
	bl ov19_02259A94
	add r4, r0, #0
	bne _02259A18
	mov r0, #0
	str r0, [r5, #8]
	b _02259A18
_02259A14:
	mov r0, #1
	str r0, [r5, #8]
_02259A18:
	cmp r4, #1
	beq _02259A26
	cmp r4, #2
	beq _02259A3A
	cmp r4, #3
	beq _02259A5C
	b _02259A84
_02259A26:
	add r0, r5, #0
	mov r1, #0
	bl ov19_02259E20
	ldr r0, _02259A8C ; =0x000005DD
	bl PlaySE
	mov r0, #1
	str r0, [r5, #0xc]
	b _02259A88
_02259A3A:
	mov r0, #0x75
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _02259A48
	mov r0, #0
	pop {r3, r4, r5, pc}
_02259A48:
	add r0, r5, #0
	mov r1, #1
	bl ov19_02259E20
	ldr r0, _02259A90 ; =0x000005DC
	bl PlaySE
	mov r0, #2
	str r0, [r5, #0xc]
	b _02259A88
_02259A5C:
	mov r0, #0x75
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r0, r0, #1
	ldrb r0, [r5, r0]
	sub r0, r0, #1
	cmp r1, r0
	blt _02259A70
	mov r0, #0
	pop {r3, r4, r5, pc}
_02259A70:
	add r0, r5, #0
	mov r1, #2
	bl ov19_02259E20
	ldr r0, _02259A90 ; =0x000005DC
	bl PlaySE
	mov r0, #3
	str r0, [r5, #0xc]
	b _02259A88
_02259A84:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02259A88:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02259A8C: .word 0x000005DD
_02259A90: .word 0x000005DC
	thumb_func_end ov19_022599F8

	thumb_func_start ov19_02259A94
ov19_02259A94: ; 0x02259A94
	ldr r0, _02259AB8 ; =gSystem
	ldr r2, [r0, #0x48]
	mov r0, #3
	add r1, r2, #0
	tst r1, r0
	beq _02259AA4
	mov r0, #1
	bx lr
_02259AA4:
	mov r1, #0x20
	tst r1, r2
	beq _02259AAE
	mov r0, #2
	bx lr
_02259AAE:
	mov r1, #0x10
	tst r1, r2
	bne _02259AB6
	mov r0, #0
_02259AB6:
	bx lr
	.balign 4, 0
_02259AB8: .word gSystem
	thumb_func_end ov19_02259A94

	thumb_func_start ov19_02259ABC
ov19_02259ABC: ; 0x02259ABC
	push {r3, lr}
	ldr r0, _02259AD4 ; =ov19_0225A05E
	bl sub_02025224
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02259AD0
	mov r0, #0
	pop {r3, pc}
_02259AD0:
	add r0, r0, #1
	pop {r3, pc}
	.balign 4, 0
_02259AD4: .word ov19_0225A05E
	thumb_func_end ov19_02259ABC

	thumb_func_start ov19_02259AD8
ov19_02259AD8: ; 0x02259AD8
	push {r4, r5, lr}
	sub sp, #0x54
	add r4, r0, #0
	mov r0, #3
	bl GXS_SetGraphicsMode
	ldr r5, _02259B84 ; =ov19_0225A070
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	ldr r0, [r4, #0x18]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02259B88 ; =ov19_0225A08C
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	ldr r0, [r4, #0x18]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02259B8C ; =ov19_0225A0A8
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #7
	str r0, [r3]
	ldr r0, [r4, #0x18]
	mov r3, #2
	bl InitBgFromTemplate
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #7
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	mov r2, #0
	ldr r0, [r4, #0x18]
	mov r1, #7
	sub r3, r2, #4
	bl BgSetPosTextAndCommit
	add sp, #0x54
	pop {r4, r5, pc}
	.balign 4, 0
_02259B84: .word ov19_0225A070
_02259B88: .word ov19_0225A08C
_02259B8C: .word ov19_0225A0A8
	thumb_func_end ov19_02259AD8

	thumb_func_start ov19_02259B90
ov19_02259B90: ; 0x02259B90
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0
	ldr r0, [r4, #0x18]
	mov r1, #7
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x18]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl FreeBgTilemapBuffer
	mov r0, #0
	bl GXS_SetGraphicsMode
	pop {r4, pc}
	thumb_func_end ov19_02259B90

	thumb_func_start ov19_02259BC0
ov19_02259BC0: ; 0x02259BC0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xab
	bl NARC_ctor
	mov r3, #0
	str r3, [sp]
	ldr r1, [r5]
	add r4, r0, #0
	str r1, [sp, #4]
	mov r1, #4
	add r2, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x18]
	add r0, r4, #0
	mov r3, #6
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5]
	mov r1, #5
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r3, sp, #0x10
	bl GfGfxLoader_GetCharDataFromOpenNarc
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #0x1d
	lsl r3, r3, #4
	ldr r3, [r5, r3]
	ldr r2, [sp, #0x10]
	ldrb r3, [r3, #4]
	ldr r0, [r5, #0x18]
	mov r7, #0x19
	lsl r3, r3, #0x18
	lsr r3, r3, #0x19
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	add r5, r3, #0
	mul r5, r7
	add r5, #0x40
	ldr r2, [r2, #0x14]
	lsl r3, r5, #6
	add r2, r2, r3
	mov r1, #7
	lsl r3, r7, #6
	bl BG_LoadCharTilesData
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov19_02259BC0

	thumb_func_start ov19_02259C64
ov19_02259C64: ; 0x02259C64
	bx lr
	.balign 4, 0
	thumb_func_end ov19_02259C64

	thumb_func_start ov19_02259C68
ov19_02259C68: ; 0x02259C68
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r1, [r6]
	mov r0, #4
	bl FontID_Alloc
	mov r0, #0
	ldr r3, [r6]
	mov r1, #0x1b
	add r2, r0, #0
	bl NewMsgDataFromNarc
	str r0, [r6, #0x24]
	ldr r2, [r6]
	mov r0, #6
	mov r1, #0x16
	bl ScrStrBufs_new_custom
	str r0, [r6, #0x28]
	ldr r1, [r6]
	mov r0, #0x80
	bl String_ctor
	str r0, [r6, #0x2c]
	ldr r0, [r6, #0x24]
	mov r1, #0
	bl NewString_ReadMsgData
	str r0, [r6, #0x30]
	mov r4, #0
	add r5, r6, #0
_02259CA6:
	add r1, r4, #0
	ldr r0, [r6, #0x24]
	add r1, #0xa
	bl NewString_ReadMsgData
	str r0, [r5, #0x34]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02259CA6
	pop {r4, r5, r6, pc}
	thumb_func_end ov19_02259C68

	thumb_func_start ov19_02259CBC
ov19_02259CBC: ; 0x02259CBC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02259CC4:
	ldr r0, [r5, #0x34]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02259CC4
	ldr r0, [r6, #0x30]
	bl String_dtor
	ldr r0, [r6, #0x2c]
	bl String_dtor
	ldr r0, [r6, #0x28]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x24]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov19_02259CBC

	thumb_func_start ov19_02259CF4
ov19_02259CF4: ; 0x02259CF4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _02259D20 ; =ov19_0225A04E
	mov r6, #0
	add r5, #0x3c
_02259D00:
	ldr r0, [r7, #0x18]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #2
	blt _02259D00
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259D20: .word ov19_0225A04E
	thumb_func_end ov19_02259CF4

	thumb_func_start ov19_02259D24
ov19_02259D24: ; 0x02259D24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x3c
_02259D2C:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #2
	blt _02259D2C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov19_02259D24

	thumb_func_start ov19_02259D44
ov19_02259D44: ; 0x02259D44
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	ldr r3, [sp]
	ldr r1, _02259DEC ; =ov19_0225A040
	ldr r3, [r3]
	add r0, #0x5c
	mov r2, #3
	bl ov01_021E7FDC
	ldr r5, [sp]
	ldr r4, _02259DF0 ; =ov19_0225A0C4
	add r7, r5, #0
	mov r6, #0
	add r7, #0x5c
_02259D60:
	add r0, r7, #0
	add r1, r4, #0
	bl ov01_021E81F0
	mov r1, #7
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r6, #3
	blt _02259D60
	mov r1, #0x75
	ldr r0, [sp]
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _02259DA8
	ldr r0, [sp]
	sub r1, #0x10
	ldr r0, [r0, r1]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	b _02259DB4
_02259DA8:
	ldr r0, [sp]
	sub r1, #0x10
	ldr r0, [r0, r1]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
_02259DB4:
	mov r1, #0x75
	lsl r1, r1, #2
	ldr r0, [sp]
	add r2, r1, #1
	ldrb r3, [r0, r1]
	ldrb r0, [r0, r2]
	sub r0, r0, #1
	cmp r3, r0
	blt _02259DD4
	ldr r0, [sp]
	sub r1, #0xc
	ldr r0, [r0, r1]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	b _02259DE0
_02259DD4:
	ldr r0, [sp]
	sub r1, #0xc
	ldr r0, [r0, r1]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
_02259DE0:
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259DEC: .word ov19_0225A040
_02259DF0: .word ov19_0225A0C4
	thumb_func_end ov19_02259D44

	thumb_func_start ov19_02259DF4
ov19_02259DF4: ; 0x02259DF4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r6, #7
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #6
_02259E00:
	ldr r0, [r5, r6]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _02259E00
	add r7, #0x5c
	add r0, r7, #0
	bl ov01_021E8194
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov19_02259DF4

	thumb_func_start ov19_02259E20
ov19_02259E20: ; 0x02259E20
	push {r3, r4, r5, lr}
	mov r2, #0x73
	lsl r2, r2, #2
	strb r1, [r0, r2]
	sub r2, #0xc
	add r5, r0, r2
	lsl r4, r1, #2
	ldr r2, _02259E40 ; =_0225A03C
	ldr r0, [r5, r4]
	ldrb r1, [r2, r1]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r4]
	bl sub_02024964
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02259E40: .word _0225A03C
	thumb_func_end ov19_02259E20

	thumb_func_start ov19_02259E44
ov19_02259E44: ; 0x02259E44
	push {r3, lr}
	mov r1, #0x73
	lsl r1, r1, #2
	ldrb r2, [r0, r1]
	sub r1, #0xc
	lsl r2, r2, #2
	add r0, r0, r2
	ldr r0, [r0, r1]
	bl sub_02024B68
	cmp r0, #0
	bne _02259E60
	mov r0, #1
	pop {r3, pc}
_02259E60:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov19_02259E44

	thumb_func_start ov19_02259E64
ov19_02259E64: ; 0x02259E64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [sp, #0x20]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl BufferPlayersName
	ldrh r0, [r5, #0x32]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_02068F98
	mov r0, #0
	str r0, [sp]
	mov r3, #2
	add r0, r4, #0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #4]
	bl BufferString
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x18
	bl CopyU16ArrayToString
	mov r0, #0
	mov r1, #2
	str r0, [sp]
	add r0, r4, #0
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #4]
	bl BufferString
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	add r0, r4, #0
	lsr r2, r2, #0x18
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	mov r2, #0x7d
	lsl r2, r2, #4
	add r2, r3, r2
	mov r1, #3
	mov r3, #4
	bl BufferIntegerAsString
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	add r0, r4, #0
	lsr r2, r2, #0x10
	lsl r2, r2, #0x18
	mov r1, #4
	lsr r2, r2, #0x18
	bl BufferIntegerAsString
	mov r3, #2
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x38]
	add r0, r4, #0
	lsr r2, r2, #8
	lsl r2, r2, #0x18
	mov r1, #5
	lsr r2, r2, #0x18
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov19_02259E64

	thumb_func_start ov19_02259F0C
ov19_02259F0C: ; 0x02259F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r5, #0
	add r7, r0, #0
	str r5, [sp, #0x10]
_02259F16:
	ldr r0, [sp, #0x10]
	mov r4, #0
	add r0, r0, #2
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_02259F20:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, r4, r5
	add r3, r4, #0
	str r0, [sp, #8]
	mov r0, #0
	add r2, r2, #1
	add r3, #0xd
	str r0, [sp, #0xc]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r7, #0x18]
	mov r1, #7
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r4, r4, #1
	cmp r4, #5
	blt _02259F20
	ldr r0, [sp, #0x10]
	add r5, r5, #5
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _02259F16
	ldr r0, [r7, #0x18]
	mov r1, #7
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov19_02259F0C

	thumb_func_start ov19_02259F64
ov19_02259F64: ; 0x02259F64
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4, #0x30]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	mov r5, #0x40
	sub r3, r5, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A000 ; =0x00010500
	lsr r3, r3, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x30]
	add r0, #0x3c
	mov r1, #4
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x3c
	bl ScheduleWindowCopyToVram
	ldr r0, [r4, #0x10]
	str r0, [sp]
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	ldr r3, [r4]
	bl ov19_02259E64
	mov r0, #0x1d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ov19_0225A008
	cmp r0, #1
	ldr r0, [r4, #0x28]
	bls _02259FCC
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x38]
	bl StringExpandPlaceholders
	b _02259FD4
_02259FCC:
	ldr r1, [r4, #0x2c]
	ldr r2, [r4, #0x34]
	bl StringExpandPlaceholders
_02259FD4:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0225A004 ; =0x00030200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x2c]
	add r0, #0x4c
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x4c
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl ov19_02259F0C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0225A000: .word 0x00010500
_0225A004: .word 0x00030200
	thumb_func_end ov19_02259F64

	thumb_func_start ov19_0225A008
ov19_0225A008: ; 0x0225A008
	push {r3, r4}
	mov r1, #0
	ldr r3, _0225A038 ; =0x000001ED
	add r2, r1, #0
_0225A010:
	lsl r4, r2, #2
	add r4, r0, r4
	add r4, #0x6c
	ldrh r4, [r4]
	cmp r4, #0
	ble _0225A026
	cmp r4, r3
	bgt _0225A026
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
_0225A026:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	cmp r2, #6
	blo _0225A010
	add r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_0225A038: .word 0x000001ED
	thumb_func_end ov19_0225A008

	.rodata

_0225A03C:
	.byte 0x09, 0x01, 0x04, 0x00

ov19_0225A040: ; 0x0225A040
	.byte 0x02, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x48, 0x00

ov19_0225A04E: ; 0x0225A04E
	.byte 0x05, 0x18
	.byte 0x15, 0x08, 0x02, 0x01, 0xF0, 0x01, 0x05, 0x01, 0x08, 0x1C, 0x08, 0x0A, 0x10, 0x01

ov19_0225A05E: ; 0x0225A05E
	.byte 0xA2, 0xBC
	.byte 0xC2, 0xFE, 0x18, 0x38, 0x50, 0x60, 0x18, 0x38, 0xA0, 0xB0, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

ov19_0225A070: ; 0x0225A070
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov19_0225A08C: ; 0x0225A08C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov19_0225A0A8: ; 0x0225A0A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x0D, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov19_0225A0C4: ; 0x0225A0C4
	.byte 0x01, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x58, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x28, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
