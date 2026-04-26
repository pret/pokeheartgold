	.include "asm/macros.inc"
	.include "overlay_97.inc"
	.include "global.inc"

	.text

	.extern PokeathlonBox_Init
	.extern PokeathlonBox_Main
	.extern PokeathlonBox_Exit
	.extern ov97_0221E6DC
	.extern ov97_0221E700
	.extern PokeathlonBox_SetGraphicsBanks
	.extern PokeathlonBox_SetGraphicsModes
	.extern PokeathlonBox_SetObjCharTransferTemplate
	.extern ov97_0221E864
	.extern ov97_0221E88C
	.extern PokeathlonBox_GetBoxMon
	.extern PokeathlonBox_GetLightBoxMon
	.extern PokeathlonBox_GetBoxName
	.extern PokeathlonBox_CopySelectedMons
	.extern PokeathlonBox_GetPartyMonStats
	.extern PokeathlonBox_GetBoxMonStats
	.extern PokeathlonBox_GetLightBoxMonStats
	.extern ov97_0221EC14
	.extern ov97_0221EDE4
	.extern PokeathlonBox_InitGraphics
	.extern PokeathlonBox_SetupGraphics
	.extern ov97_0221EFD0
	.extern PokeathlonBox_RenderAndAnimateSprites
	.extern PokeathlonBox_ReleaseGraphics
	.extern ov97_0221F0E0
	.extern ov97_0221F14C

	thumb_func_start ov97_0221F1D8
ov97_0221F1D8: ; 0x0221F1D8
	push {r3, r4, r5, lr}
	sub sp, #0x70
	ldr r5, _0221F284 ; =ov97_0221FD20
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x54
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0221F288 ; =ov97_0221FD3C
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0221F28C ; =ov97_0221FD04
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0221F290 ; =ov97_0221FD58
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
	add r0, r4, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	add sp, #0x70
	pop {r3, r4, r5, pc}
	nop
_0221F284: .word ov97_0221FD20
_0221F288: .word ov97_0221FD3C
_0221F28C: .word ov97_0221FD04
_0221F290: .word ov97_0221FD58
	thumb_func_end ov97_0221F1D8

	thumb_func_start ov97_0221F294
ov97_0221F294: ; 0x0221F294
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r2, r4, #0
	add r2, #0x68
	ldrh r2, [r2]
	ldr r0, [r4, #0x70]
	mov r1, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl BufferPokeathlonCourseName
	ldr r0, [r4, #0x70]
	ldr r1, [r4, #0x6c]
	ldr r3, [r4]
	mov r2, #0
	bl ReadMsgData_ExpandPlaceholders
	add r5, r0, #0
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 ; =0x00010200
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #8
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r4, #0
	add r0, #8
	bl CopyWindowToVram
	add r0, r5, #0
	bl String_Delete
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x6a
	ldrh r0, [r0]
	cmp r0, #0
	beq _0221F32A
	ldr r0, [r4, #0x6c]
	mov r1, #1
	bl NewString_ReadMsgData
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 ; =0x00010200
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x18
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	bl String_Delete
_0221F32A:
	add r0, r4, #0
	add r0, #0x18
	bl CopyWindowToVram
	add r0, r4, #0
	add r0, #0x48
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x6c]
	mov r1, #8
	bl NewString_ReadMsgData
	mov r1, #0
	add r5, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 ; =0x00010200
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x48
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	bl String_Delete
	ldr r0, [r4, #0x6c]
	mov r1, #4
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x48
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	bl String_Delete
	ldr r0, [r4, #0x6c]
	mov r1, #6
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x48
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	bl String_Delete
	ldr r0, [r4, #0x6c]
	mov r1, #5
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x48
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	bl String_Delete
	ldr r0, [r4, #0x6c]
	mov r1, #7
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F424 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x48
	add r2, r5, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	bl String_Delete
	add r4, #0x48
	add r0, r4, #0
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221F424: .word 0x00010200
	thumb_func_end ov97_0221F294

	thumb_func_start ov97_0221F428
ov97_0221F428: ; 0x0221F428
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x74]
	add r4, r1, #0
	add r1, #0xa
	bl CopyU16ArrayToString
	add r0, r5, #0
	add r0, #0x28
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F564 ; =0x00010200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r5, #0x74]
	add r0, #0x28
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	add r0, #0x28
	bl CopyWindowToVram
	ldrb r0, [r4, #8]
	cmp r0, #0
	bne _0221F4A8
	ldr r0, [r5, #0x6c]
	mov r1, #2
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x38
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F568 ; =0x00070800
	add r2, r6, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x38
	mov r3, #4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	add r0, #0x38
	bl CopyWindowToVram
	add r0, r6, #0
	bl String_Delete
	b _0221F4FE
_0221F4A8:
	cmp r0, #1
	bne _0221F4EC
	ldr r0, [r5, #0x6c]
	mov r1, #3
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x38
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x38
	add r2, r6, #0
	mov r3, #4
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r0, r5, #0
	add r0, #0x38
	bl CopyWindowToVram
	add r0, r6, #0
	bl String_Delete
	b _0221F4FE
_0221F4EC:
	add r0, r5, #0
	add r0, #0x38
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x38
	bl CopyWindowToVram
_0221F4FE:
	ldrh r0, [r4, #4]
	ldr r1, [r5]
	bl GetSpeciesName
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x70]
	mov r1, #0
	add r2, r4, #0
	bl BufferString
	add r0, r4, #0
	bl String_Delete
	ldr r0, [r5, #0x70]
	ldr r1, [r5, #0x6c]
	ldr r3, [r5]
	mov r2, #9
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x58
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221F564 ; =0x00010200
	add r2, r4, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x58
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	add r5, #0x58
	add r0, r5, #0
	bl CopyWindowToVram
	add r0, r4, #0
	bl String_Delete
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221F564: .word 0x00010200
_0221F568: .word 0x00070800
	thumb_func_end ov97_0221F428

	thumb_func_start ov97_0221F56C
ov97_0221F56C: ; 0x0221F56C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r4, #0
	add r5, #0x78
	add r0, r5, #0
	add r6, r1, #0
	bl ov97_0221FBDC
	add r0, r4, #0
	add r0, #0x78
	bl ov97_0221FC54
	mov r0, #0xb3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	add r4, #0x78
	add r0, r4, #0
	add r1, r6, #0
	bl ov97_0221F5F8
	ldr r1, _0221F5F4 ; =ov97_0221FCFC
	add r0, sp, #0
	ldrb r2, [r1]
	add r7, sp, #0
	mov r4, #0
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	strb r2, [r0, #2]
	ldrb r2, [r1, #3]
	ldrb r1, [r1, #4]
	strb r2, [r0, #3]
	strb r1, [r0, #4]
_0221F5B8:
	ldrb r1, [r7, r4]
	add r0, r6, r1
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221F5D6
	lsl r0, r1, #2
	add r1, r5, r0
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	b _0221F5E6
_0221F5D6:
	lsl r0, r1, #2
	add r1, r5, r0
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
_0221F5E6:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _0221F5B8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F5F4: .word ov97_0221FCFC
	thumb_func_end ov97_0221F56C

	thumb_func_start ov97_0221F5F8
ov97_0221F5F8: ; 0x0221F5F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	mov r0, #0
	str r1, [sp, #4]
	str r0, [sp, #8]
_0221F604:
	ldr r0, [sp, #8]
	lsl r1, r0, #3
	ldr r0, [sp, #4]
	add r7, r0, r1
	mov r0, #0x28
	ldrsb r0, [r7, r0]
	cmp r0, #0
	ble _0221F638
	ldr r0, [sp, #8]
	mov r1, #0x18
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl Sprite_SetAnimCtrlSeq
	b _0221F674
_0221F638:
	bge _0221F65E
	ldr r0, [sp, #8]
	mov r1, #0x18
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl Sprite_SetAnimCtrlSeq
	b _0221F674
_0221F65E:
	ldr r0, [sp, #8]
	mov r1, #0x18
	mul r1, r0
	ldr r0, [sp]
	add r1, r0, r1
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
_0221F674:
	ldr r0, [sp, #8]
	mov r1, #0x18
	mul r1, r0
	ldr r0, [sp]
	mov r4, #0
	add r5, r0, r1
_0221F680:
	add r0, r7, r4
	add r0, #0x29
	ldrb r0, [r0]
	cmp r0, #4
	bhi _0221F72A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221F696: ; jump table
	.short _0221F6A0 - _0221F696 - 2 ; case 0
	.short _0221F6B2 - _0221F696 - 2 ; case 1
	.short _0221F6D0 - _0221F696 - 2 ; case 2
	.short _0221F6EE - _0221F696 - 2 ; case 3
	.short _0221F70C - _0221F696 - 2 ; case 4
_0221F6A0:
	lsl r0, r4, #2
	add r1, r5, r0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl Sprite_SetDrawFlag
	b _0221F72E
_0221F6B2:
	lsl r0, r4, #2
	add r6, r5, r0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #3
	bl Sprite_SetAnimCtrlSeq
	b _0221F72E
_0221F6D0:
	lsl r0, r4, #2
	add r6, r5, r0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl Sprite_SetAnimCtrlSeq
	b _0221F72E
_0221F6EE:
	lsl r0, r4, #2
	add r6, r5, r0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl Sprite_SetAnimCtrlSeq
	b _0221F72E
_0221F70C:
	lsl r0, r4, #2
	add r6, r5, r0
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #1
	bl Sprite_SetDrawFlag
	mov r0, #0x1e
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #2
	bl Sprite_SetAnimCtrlSeq
	b _0221F72E
_0221F72A:
	bl GF_AssertFail
_0221F72E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _0221F680
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	cmp r0, #5
	bhs _0221F748
	b _0221F604
_0221F748:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov97_0221F5F8

	thumb_func_start ov97_0221F74C
ov97_0221F74C: ; 0x0221F74C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r7, #0x6d
	lsl r7, r7, #2
	str r0, [sp, #4]
	add r0, #0x78
	add r6, r7, #0
	str r0, [sp, #4]
	mov r4, #0
	add r6, #0x14
_0221F760:
	ldr r0, [sp, #4]
	lsl r1, r4, #2
	add r5, r0, r1
	ldr r0, [r5, r7]
	mov r1, #0
	bl Sprite_SetDrawFlag
	ldr r0, [r5, r6]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _0221F760
	mov r0, #0
	mov r6, #0x1e
	str r0, [sp]
	add r7, r0, #0
	lsl r6, r6, #4
_0221F78A:
	ldr r1, [sp]
	mov r0, #0x18
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #4]
	mov r1, #0
	add r5, r0, r2
	mov r0, #0x77
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Sprite_SetDrawFlag
	mov r4, #0
_0221F7A4:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r6]
	add r1, r7, #0
	bl Sprite_SetDrawFlag
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _0221F7A4
	ldr r0, [sp]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	cmp r0, #5
	blo _0221F78A
	mov r1, #0x95
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #0
	bl Sprite_SetDrawFlag
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov97_0221F74C

	thumb_func_start ov97_0221F7DC
ov97_0221F7DC: ; 0x0221F7DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r1, r5, #0
	ldr r2, [r5]
	mov r0, #0x42
	add r1, #8
	bl G2dRenderer_Init
	str r0, [r5, #4]
	add r0, r5, #0
	mov r2, #1
	add r0, #8
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r0, #0x10
	mov r1, #1
	bl GfGfx_EngineBTogglePlanes
	mov r7, #0x13
	mov r6, #0
	add r4, r5, #0
	lsl r7, r7, #4
_0221F80E:
	ldr r2, [r5]
	mov r0, #3
	add r1, r6, #0
	bl Create2DGfxResObjMan
	str r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blt _0221F80E
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r1, #0xf3
	str r0, [sp, #8]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r2, #7
	bl AddCharResObjFromNarc
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r2, #4
	str r2, [sp, #8]
	ldr r0, [r5]
	sub r1, #0x14
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r1, #0xf3
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xf3
	mov r2, #6
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r3, #1
	str r3, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [r5]
	sub r1, #0x14
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xf3
	mov r2, #5
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200ADA4
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r1, #0xa2
	str r0, [sp, #8]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r2, #0x42
	mov r3, #0
	bl AddCharResObjFromNarc
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [r5]
	sub r1, #0x2c
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r1, #0xa2
	mov r2, #0x41
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xa2
	mov r2, #0x43
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [r5]
	sub r1, #0x2c
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0xa2
	mov r2, #0x44
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200ADA4
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r1, #0x5d
	str r0, [sp, #8]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r2, #9
	mov r3, #0
	bl AddCharResObjFromNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [r5]
	sub r1, #0x44
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	mov r1, #0x5d
	mov r2, #6
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	sub r1, #0x44
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0x5d
	mov r2, #0xa
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	sub r1, #0x44
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	mov r1, #0x5d
	mov r2, #0xa
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r5, r1]
	sub r1, #0xc
	ldr r0, [r5, r1]
	bl sub_0200ADA4
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AF94
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov97_0221F7DC

	thumb_func_start ov97_0221F9E0
ov97_0221F9E0: ; 0x0221F9E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r4, #0
_0221F9E8:
	lsl r6, r4, #5
	add r6, #0x68
	lsl r0, r4, #2
	add r7, r5, r0
	str r6, [sp]
	mov r0, #0xa8
	str r0, [sp, #4]
	str r4, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	mov r2, #2
	mov r3, #0
	bl ov97_0221FAEC
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r7, r1]
	mov r1, #1
	str r6, [sp]
	mov r0, #0xa8
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl ov97_0221FAEC
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r7, r1]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _0221F9E8
	mov r0, #0
	str r0, [sp, #0x10]
_0221FA3C:
	ldr r1, _0221FAE8 ; =ov97_0221FCF4
	ldr r0, [sp, #0x10]
	mov r2, #1
	ldrb r0, [r1, r0]
	mov r1, #0x18
	mov r3, #0
	lsl r6, r0, #4
	ldr r0, [sp, #0x10]
	add r6, #0x30
	mul r1, r0
	mov r0, #0x60
	str r0, [sp]
	add r7, r5, r1
	str r6, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov97_0221FAEC
	mov r1, #0x77
	lsl r1, r1, #2
	str r0, [r7, r1]
	mov r4, #0
_0221FA70:
	lsl r0, r4, #4
	add r0, #0xa8
	str r0, [sp]
	str r6, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #2
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl ov97_0221FAEC
	lsl r1, r4, #2
	add r2, r7, r1
	mov r1, #0x1e
	lsl r1, r1, #4
	str r0, [r2, r1]
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #5
	blo _0221FA70
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	cmp r0, #5
	blo _0221FA3C
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x48
	str r0, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	str r2, [sp, #0xc]
	bl ov97_0221FAEC
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r1, #0x32
	ldr r0, [r5]
	lsl r1, r1, #6
	bl Heap_Alloc
	mov r1, #0x96
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov97_0221FBA0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0221FAE8: .word ov97_0221FCF4
	thumb_func_end ov97_0221F9E0

	thumb_func_start ov97_0221FAEC
ov97_0221FAEC: ; 0x0221FAEC
	push {r3, r4, r5, lr}
	sub sp, #0x80
	add r4, r0, #0
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	add r5, r2, #0
	str r0, [sp, #8]
	mov r2, #0
	mov r0, #0x13
	str r2, [sp, #0xc]
	lsl r0, r0, #4
	str r3, [sp, #0x10]
	ldr r3, [r4, r0]
	str r3, [sp, #0x14]
	add r3, r0, #4
	ldr r3, [r4, r3]
	str r3, [sp, #0x18]
	add r3, r0, #0
	add r3, #8
	ldr r3, [r4, r3]
	add r0, #0xc
	str r3, [sp, #0x1c]
	ldr r0, [r4, r0]
	add r3, r1, #0
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x2c
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r4]
	add r2, sp, #0x2c
	str r0, [sp]
	ldr r1, [r4, #4]
	add r0, sp, #0x50
	mov r3, #2
	bl ov97_0221FB80
	ldr r0, [sp, #0x90]
	str r5, [sp, #0x74]
	lsl r0, r0, #0xc
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x94]
	lsl r1, r0, #0xc
	mov r0, #1
	lsl r0, r0, #0x14
	add r0, r1, r0
	str r0, [sp, #0x5c]
	add r0, sp, #0x50
	bl Sprite_CreateAffine
	mov r1, #1
	add r4, r0, #0
	bl Sprite_SetAnimActiveFlag
	ldr r1, [sp, #0x98]
	add r0, r4, #0
	bl Sprite_SetAnimCtrlSeq
	add r0, r4, #0
	mov r1, #1
	bl Sprite_SetPriority
	ldr r1, [sp, #0x9c]
	add r0, r4, #0
	bl Sprite_SetDrawFlag
	add r0, r4, #0
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov97_0221FAEC

	thumb_func_start ov97_0221FB80
ov97_0221FB80: ; 0x0221FB80
	str r1, [r0]
	str r2, [r0, #4]
	mov r2, #0
	mov r1, #1
	str r2, [r0, #0x10]
	lsl r1, r1, #0xc
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	strh r2, [r0, #0x20]
	str r2, [r0, #0x24]
	ldr r1, [sp]
	str r3, [r0, #0x28]
	str r1, [r0, #0x2c]
	bx lr
	.balign 4, 0
	thumb_func_end ov97_0221FB80

	thumb_func_start ov97_0221FBA0
ov97_0221FBA0: ; 0x0221FBA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r4, [r5, r0]
	sub r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AF00
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl SpriteTransfer_GetPaletteProxy
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl NNS_G2dGetImageLocation
	mov r1, #0x9f
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r4, #0
	mov r1, #2
	bl NNS_G2dGetImagePaletteLocation
	mov r1, #0xa
	lsl r1, r1, #6
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	thumb_func_end ov97_0221FBA0

	thumb_func_start ov97_0221FBDC
ov97_0221FBDC: ; 0x0221FBDC
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5, #6]
	mov r3, #2
	str r0, [sp]
	ldrb r0, [r5, #7]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	ldrh r1, [r5, #4]
	ldrb r2, [r5, #8]
	add r0, sp, #0x14
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r5]
	mov r3, #0x96
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrh r0, [r5, #4]
	add r1, sp, #0x10
	lsl r3, r3, #2
	str r0, [sp, #0xc]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	ldr r2, [r4]
	ldr r3, [r4, r3]
	bl sub_02014540
	add r1, sp, #0x10
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #8]
	ldr r2, [r4]
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0x10
	add r5, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	cmp r0, #1
	beq _0221FC3A
	bl GF_AssertFail
_0221FC3A:
	ldr r0, [sp, #0x10]
	mov r1, #0x97
	lsl r1, r1, #2
	ldr r0, [r0, #0xc]
	add r1, r4, r1
	mov r2, #0x20
	bl MIi_CpuCopy16
	add r0, r5, #0
	bl Heap_Free
	add sp, #0x24
	pop {r4, r5, pc}
	thumb_func_end ov97_0221FBDC

	thumb_func_start ov97_0221FC54
ov97_0221FC54: ; 0x0221FC54
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0x32
	ldr r0, [r4, r0]
	lsl r1, r1, #6
	bl DC_FlushRange
	mov r1, #0x96
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, #0x24
	mov r2, #0x32
	ldr r1, [r4, r1]
	lsl r2, r2, #6
	bl GXS_LoadOBJ
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0x20
	bl DC_FlushRange
	mov r1, #0x97
	lsl r1, r1, #2
	add r0, r4, r1
	add r1, #0x24
	ldr r1, [r4, r1]
	mov r2, #0x20
	bl GXS_LoadOBJPltt
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov97_0221FC54

	.rodata

	.global pokeathlonBoxObjCharTransferTemplate
pokeathlonBoxObjCharTransferTemplate:
	.byte 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00

	.global pokeathlonBoxGraphicsModes
pokeathlonBoxGraphicsModes: ; 0x0221FCA8
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global ov97_0221FCB8
ov97_0221FCB8: ; 0x0221FCB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

	.global pokeathlonBoxGraphicsBanks
pokeathlonBoxGraphicsBanks: ; 0x0221FCCC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov97_0221FCF4: ; 0x0221FCF4
	.byte 0x01, 0x03, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00

ov97_0221FCFC: ; 0x0221FCFC
	.byte 0x01, 0x03, 0x02, 0x04
	.byte 0x00, 0x00, 0x00, 0x00

ov97_0221FD04: ; 0x0221FD04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x02, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov97_0221FD20: ; 0x0221FD20
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov97_0221FD3C: ; 0x0221FD3C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov97_0221FD58: ; 0x0221FD58
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02, 0x01, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	; 0x0221FD74
