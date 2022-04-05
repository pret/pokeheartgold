	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov113_021E5900
ov113_021E5900: ; 0x021E5900
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _021E5912
	cmp r1, #1
	beq _021E5954
	b _021E5964
_021E5912:
	bl ov113_021E59F8
	mov r2, #2
	mov r0, #3
	mov r1, #0x98
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0x16
	add r0, r6, #0
	lsl r1, r1, #4
	mov r2, #0x98
	bl OverlayManager_CreateAndGetData
	mov r2, #0x16
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x98
	str r0, [r4]
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov113_021E5A7C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _021E5964
_021E5954:
	bl OverlayManager_GetData
	bl ov113_021E5B70
	cmp r0, #0
	beq _021E5964
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E5964:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov113_021E5900

	thumb_func_start ov113_021E5968
ov113_021E5968: ; 0x021E5968
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #4
	bhi _021E59B2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5984: ; jump table
	.short _021E598E - _021E5984 - 2 ; case 0
	.short _021E5996 - _021E5984 - 2 ; case 1
	.short _021E599E - _021E5984 - 2 ; case 2
	.short _021E59A6 - _021E5984 - 2 ; case 3
	.short _021E59AE - _021E5984 - 2 ; case 4
_021E598E:
	bl ov113_021E5BC4
	str r0, [r4]
	b _021E59B2
_021E5996:
	bl ov113_021E5C0C
	str r0, [r4]
	b _021E59B2
_021E599E:
	bl ov113_021E5C60
	str r0, [r4]
	b _021E59B2
_021E59A6:
	bl ov113_021E5C68
	str r0, [r4]
	b _021E59B2
_021E59AE:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E59B2:
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_0200D020
	add r5, #0xb4
	ldr r0, [r5]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov113_021E5968

	thumb_func_start ov113_021E59C8
ov113_021E59C8: ; 0x021E59C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov113_021E5BB0
	cmp r0, #0
	bne _021E59DE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E59DE:
	bl ov113_021E59F8
	add r0, r4, #0
	bl ov113_021E5B60
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x98
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov113_021E59C8

	thumb_func_start ov113_021E59F8
ov113_021E59F8: ; 0x021E59F8
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
	ldr r0, _021E5A40 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E5A44 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	pop {r3, pc}
	.balign 4, 0
_021E5A40: .word 0xFFFFE0FF
_021E5A44: .word 0x04001000
	thumb_func_end ov113_021E59F8

	thumb_func_start ov113_021E5A48
ov113_021E5A48: ; 0x021E5A48
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r7, r0, #0
	add r6, r1, #0
	add r4, r5, #0
_021E5A52:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #1
	bl Pokedex_GetSeenFormeByIdx_Unown
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r0, #0
	add r1, #0xe6
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #1
	bhi _021E5A70
	strb r0, [r6, r5]
	add r5, r5, #1
_021E5A70:
	add r4, r4, #1
	cmp r4, #0x1c
	blt _021E5A52
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov113_021E5A48

	thumb_func_start ov113_021E5A7C
ov113_021E5A7C: ; 0x021E5A7C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0]
	bl sub_020183F0
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	bl Options_GetTextFrameDelay
	strb r0, [r5, #0x18]
	add r0, r4, #0
	bl Options_GetFrame
	strb r0, [r5, #0x19]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	bl Sav2_Pokedex_get
	str r0, [r5, #0xc]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	bl SavArray_Flags_get
	bl ScriptState_GetUnownReportLevel
	add r1, r5, #0
	add r1, #0x3c
	strb r0, [r1]
	add r0, r5, #0
	bl ov113_021E5D80
	strb r0, [r5, #0x1d]
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl Pokedex_GetSeenFormeNum_Unown
	strb r0, [r5, #0x1f]
	add r0, r5, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r0, #4
	blo _021E5B10
	mov r1, #0
_021E5ADE:
	add r0, r5, r1
	add r0, #0x20
	strb r1, [r0]
	add r1, r1, #1
	cmp r1, #0x19
	ble _021E5ADE
	ldr r0, [r5, #0xc]
	add r1, sp, #0
	bl ov113_021E5A48
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	mov r4, #0
	cmp r3, #0
	ble _021E5B32
	add r2, sp, #0
_021E5AFE:
	ldrb r1, [r2]
	add r0, r5, r4
	add r0, #0x3a
	add r4, r4, #1
	strb r1, [r0]
	add r2, r2, #1
	cmp r4, r3
	blt _021E5AFE
	b _021E5B32
_021E5B10:
	ldrb r0, [r5, #0x1f]
	mov r4, #0
	cmp r0, #0
	ble _021E5B32
	mov r6, #1
_021E5B1A:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	add r2, r6, #0
	bl Pokedex_GetSeenFormeByIdx_Unown
	add r1, r5, r4
	add r1, #0x20
	strb r0, [r1]
	ldrb r0, [r5, #0x1f]
	add r4, r4, #1
	cmp r4, r0
	blt _021E5B1A
_021E5B32:
	ldrb r0, [r5, #0x1f]
	mov r1, #0xe
	bl _s32_div_f
	strb r0, [r5, #0x1c]
	ldrb r0, [r5, #0x1f]
	cmp r0, #0
	beq _021E5B52
	mov r1, #0xe
	bl _s32_div_f
	cmp r1, #0
	beq _021E5B52
	ldrb r0, [r5, #0x1c]
	add r0, r0, #1
	strb r0, [r5, #0x1c]
_021E5B52:
	ldrb r1, [r5, #0x1c]
	ldrb r0, [r5, #0x1d]
	add r0, r1, r0
	add r0, r0, #1
	strb r0, [r5, #0x1b]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov113_021E5A7C

	thumb_func_start ov113_021E5B60
ov113_021E5B60: ; 0x021E5B60
	add r1, r0, #0
	ldr r0, [r1, #4]
	ldr r3, _021E5B6C ; =sub_02018410
	ldr r0, [r0]
	ldr r1, [r1, #0x14]
	bx r3
	.balign 4, 0
_021E5B6C: .word sub_02018410
	thumb_func_end ov113_021E5B60

	thumb_func_start ov113_021E5B70
ov113_021E5B70: ; 0x021E5B70
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E5B80
	cmp r1, #1
	beq _021E5B8C
	b _021E5BAC
_021E5B80:
	bl ov113_021E5CF8
	ldrh r0, [r4, #0x10]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5BAC
_021E5B8C:
	bl ov113_021E5D4C
	bl sub_020210BC
	mov r0, #1
	bl sub_02021148
	mov r1, #0
	mov r0, #0x45
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #0
	strh r0, [r4, #0x10]
	mov r0, #1
	pop {r4, pc}
_021E5BAC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov113_021E5B70

	thumb_func_start ov113_021E5BB0
ov113_021E5BB0: ; 0x021E5BB0
	push {r4, lr}
	add r4, r0, #0
	bl sub_02021238
	add r0, r4, #0
	bl ov113_021E5D28
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov113_021E5BB0

	thumb_func_start ov113_021E5BC4
ov113_021E5BC4: ; 0x021E5BC4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _021E5BD6
	cmp r0, #1
	beq _021E5BF4
	b _021E5C06
_021E5BD6:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #0x10]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5C06
_021E5BF4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5C06
	mov r0, #0
	strh r0, [r4, #0x10]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, pc}
_021E5C06:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov113_021E5BC4

	thumb_func_start ov113_021E5C0C
ov113_021E5C0C: ; 0x021E5C0C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrh r1, [r4, #0x10]
	cmp r1, #0
	beq _021E5C1E
	cmp r1, #1
	beq _021E5C46
	b _021E5C58
_021E5C1E:
	bl ov113_021E5EC4
	cmp r0, #0
	bne _021E5C58
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #0x10]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5C58
_021E5C46:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5C58
	mov r0, #0
	strh r0, [r4, #0x10]
	add sp, #0xc
	mov r0, #4
	pop {r3, r4, pc}
_021E5C58:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov113_021E5C0C

	thumb_func_start ov113_021E5C60
ov113_021E5C60: ; 0x021E5C60
	ldr r3, _021E5C64 ; =ov113_021E5D60
	bx r3
	.balign 4, 0
_021E5C64: .word ov113_021E5D60
	thumb_func_end ov113_021E5C60

	thumb_func_start ov113_021E5C68
ov113_021E5C68: ; 0x021E5C68
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrh r0, [r4, #0x10]
	cmp r0, #3
	bhi _021E5CF2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5C80: ; jump table
	.short _021E5C88 - _021E5C80 - 2 ; case 0
	.short _021E5CA8 - _021E5C80 - 2 ; case 1
	.short _021E5CC0 - _021E5C80 - 2 ; case 2
	.short _021E5CE0 - _021E5C80 - 2 ; case 3
_021E5C88:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	mov r2, #2
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #0x10]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5CF2
_021E5CA8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5CF2
	ldrb r1, [r4, #0x1a]
	add r0, r4, #0
	bl ov113_021E5DA4
	ldrh r0, [r4, #0x10]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5CF2
_021E5CC0:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #3
	str r0, [sp, #8]
	mov r0, #0
	mov r2, #5
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldrh r0, [r4, #0x10]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	b _021E5CF2
_021E5CE0:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5CF2
	mov r0, #0
	strh r0, [r4, #0x10]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, pc}
_021E5CF2:
	mov r0, #3
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov113_021E5C68

	thumb_func_start ov113_021E5CF8
ov113_021E5CF8: ; 0x021E5CF8
	push {r4, lr}
	add r4, r0, #0
	bl ov113_021E6300
	add r0, r4, #0
	bl ov113_021E650C
	add r0, r4, #0
	bl ov113_021E6680
	add r0, r4, #0
	bl ov113_021E671C
	add r0, r4, #0
	bl ov113_021E6988
	ldr r0, _021E5D24 ; =ov113_021E62B0
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	nop
_021E5D24: .word ov113_021E62B0
	thumb_func_end ov113_021E5CF8

	thumb_func_start ov113_021E5D28
ov113_021E5D28: ; 0x021E5D28
	push {r4, lr}
	add r4, r0, #0
	bl ov113_021E69A8
	add r0, r4, #0
	bl ov113_021E6754
	add r0, r4, #0
	bl ov113_021E66E4
	add r0, r4, #0
	bl ov113_021E663C
	add r0, r4, #0
	bl ov113_021E6490
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov113_021E5D28

	thumb_func_start ov113_021E5D4C
ov113_021E5D4C: ; 0x021E5D4C
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl ov113_021E5E64
	ldrb r1, [r4, #0x1a]
	add r0, r4, #0
	bl ov113_021E5DA4
	pop {r4, pc}
	thumb_func_end ov113_021E5D4C

	thumb_func_start ov113_021E5D60
ov113_021E5D60: ; 0x021E5D60
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov113_021E5F94
	ldr r1, [sp]
	cmp r1, #0
	bne _021E5D7C
	add r0, r4, #0
	bl ov113_021E5F48
_021E5D7C:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov113_021E5D60

	thumb_func_start ov113_021E5D80
ov113_021E5D80: ; 0x021E5D80
	add r0, #0x3c
	ldrb r3, [r0]
	ldr r2, _021E5DA0 ; =ov113_021E6BD0
	mov r1, #0
_021E5D88:
	ldrh r0, [r2]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x18
	cmp r0, r3
	bgt _021E5D9A
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #6
	blt _021E5D88
_021E5D9A:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	bx lr
	.balign 4, 0
_021E5DA0: .word ov113_021E6BD0
	thumb_func_end ov113_021E5D80

	thumb_func_start ov113_021E5DA4
ov113_021E5DA4: ; 0x021E5DA4
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x78
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x88
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	add r0, #0x98
	mov r1, #0
	bl FillWindowPixelBuffer
	ldrb r3, [r4, #0x1a]
	cmp r3, #0
	bne _021E5DD4
	add r0, r4, #0
	bl ov113_021E5FC0
	b _021E5DF6
_021E5DD4:
	ldrb r2, [r4, #0x1c]
	sub r1, r3, #1
	cmp r1, r2
	bge _021E5DE8
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov113_021E6084
	b _021E5DF6
_021E5DE8:
	add r1, r2, #1
	sub r1, r3, r1
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov113_021E613C
_021E5DF6:
	mov r1, #0
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldrb r2, [r4, #0x1a]
	ldr r0, [r4, #0x48]
	add r2, r2, #1
	bl BufferIntegerAsString
	mov r0, #0
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrb r2, [r4, #0x1b]
	ldr r0, [r4, #0x48]
	add r3, r1, #0
	bl BufferIntegerAsString
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x50]
	ldr r2, [r4, #0x58]
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E5E60 ; =0x000F0200
	add r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x50]
	add r0, #0x98
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	add r0, #0x78
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x88
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x98
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	bl ov113_021E6B1C
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E5E60: .word 0x000F0200
	thumb_func_end ov113_021E5DA4

	thumb_func_start ov113_021E5E64
ov113_021E5E64: ; 0x021E5E64
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	bl sub_02024964
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [r4, #0x54]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	mov r5, #0x30
	sub r3, r5, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E5EC0 ; =0x00070F00
	lsr r3, r3, #1
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r4, #0x54]
	add r0, #0x68
	mov r1, #4
	bl AddTextPrinterParameterized2
	add r4, #0x68
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021E5EC0: .word 0x00070F00
	thumb_func_end ov113_021E5E64

	thumb_func_start ov113_021E5EC4
ov113_021E5EC4: ; 0x021E5EC4
	ldr r3, _021E5ECC ; =sub_02024B68
	add r0, #0xb8
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021E5ECC: .word sub_02024B68
	thumb_func_end ov113_021E5EC4

	thumb_func_start ov113_021E5ED0
ov113_021E5ED0: ; 0x021E5ED0
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _021E5EE2
	cmp r1, #1
	beq _021E5EF4
	cmp r1, #2
	beq _021E5F16
	b _021E5F3C
_021E5EE2:
	ldr r0, _021E5F40 ; =0x000005DD
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	bl ov113_021E5E64
	mov r0, #1
	pop {r4, pc}
_021E5EF4:
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _021E5EFE
	mov r0, #2
	pop {r4, pc}
_021E5EFE:
	sub r0, r0, #1
	strb r0, [r4, #0x1a]
	add r4, #0xbc
	ldr r0, [r4]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	ldr r0, _021E5F44 ; =0x000005DC
	bl PlaySE
	mov r0, #3
	pop {r4, pc}
_021E5F16:
	ldrb r0, [r4, #0x1b]
	ldrb r1, [r4, #0x1a]
	sub r0, r0, #1
	cmp r1, r0
	blt _021E5F24
	mov r0, #2
	pop {r4, pc}
_021E5F24:
	add r0, r1, #1
	strb r0, [r4, #0x1a]
	add r4, #0xc0
	ldr r0, [r4]
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	ldr r0, _021E5F44 ; =0x000005DC
	bl PlaySE
	mov r0, #3
	pop {r4, pc}
_021E5F3C:
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_021E5F40: .word 0x000005DD
_021E5F44: .word 0x000005DC
	thumb_func_end ov113_021E5ED0

	thumb_func_start ov113_021E5F48
ov113_021E5F48: ; 0x021E5F48
	push {r3, lr}
	ldr r1, _021E5F8C ; =gSystem
	ldr r2, [r1, #0x48]
	ldr r1, _021E5F90 ; =0x00000CF3
	tst r1, r2
	beq _021E5F58
	mov r1, #0
	str r1, [r0, #0x14]
_021E5F58:
	ldr r1, _021E5F8C ; =gSystem
	ldr r3, [r1, #0x48]
	mov r1, #2
	add r2, r3, #0
	tst r2, r1
	beq _021E5F6C
	mov r1, #0
	bl ov113_021E5ED0
	pop {r3, pc}
_021E5F6C:
	mov r2, #0x40
	tst r2, r3
	beq _021E5F7A
	mov r1, #1
	bl ov113_021E5ED0
	pop {r3, pc}
_021E5F7A:
	mov r2, #0x80
	tst r2, r3
	beq _021E5F86
	bl ov113_021E5ED0
	pop {r3, pc}
_021E5F86:
	add r0, r1, #0
	pop {r3, pc}
	nop
_021E5F8C: .word gSystem
_021E5F90: .word 0x00000CF3
	thumb_func_end ov113_021E5F48

	thumb_func_start ov113_021E5F94
ov113_021E5F94: ; 0x021E5F94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E5FBC ; =ov113_021E6B82
	add r4, r1, #0
	bl sub_0202529C
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _021E5FAE
	mov r0, #2
	pop {r3, r4, r5, pc}
_021E5FAE:
	mov r0, #1
	str r0, [r4]
	str r0, [r5, #0x14]
	add r0, r5, #0
	bl ov113_021E5ED0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5FBC: .word ov113_021E6B82
	thumb_func_end ov113_021E5F94

	thumb_func_start ov113_021E5FC0
ov113_021E5FC0: ; 0x021E5FC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0x13
	add r6, r0, #0
	lsl r1, r1, #4
	add r1, r6, r1
	mov r2, #6
	bl ov113_021E6238
	mov r1, #1
	lsl r1, r1, #8
	add r0, r6, #0
	add r1, r6, r1
	mov r2, #2
	bl ov113_021E6238
	mov r4, #0
	add r5, r6, #0
	add r7, r4, #0
_021E5FE6:
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r7, #0
	bl sub_0200DCE8
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xe
	blt _021E5FE6
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	add r0, r6, #0
	ldr r1, [r6, #0x50]
	add r0, #0x78
	mov r2, #0
	mov r3, #0x38
	bl ov113_021E629C
	mov r0, #0
	ldr r1, [r6, #0x5c]
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r2, #0xb0
	sub r2, r2, r3
	add r0, r6, #0
	lsl r2, r2, #0x10
	ldr r1, [r6, #0x5c]
	add r0, #0x78
	lsr r2, r2, #0x10
	mov r3, #0x48
	bl ov113_021E629C
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x50]
	mov r1, #3
	bl ReadMsgDataIntoString
	add r0, r6, #0
	ldr r1, [r6, #0x50]
	add r0, #0x88
	mov r2, #4
	mov r3, #0x3c
	bl ov113_021E629C
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x4c]
	mov r1, #4
	bl ReadMsgDataIntoString
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldrb r2, [r6, #0x1f]
	ldr r0, [r6, #0x48]
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r6, #0x48]
	ldr r1, [r6, #0x50]
	ldr r2, [r6, #0x4c]
	bl StringExpandPlaceholders
	add r0, r6, #0
	ldr r1, [r6, #0x50]
	add r0, #0x88
	mov r2, #4
	mov r3, #0x4c
	bl ov113_021E629C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov113_021E5FC0

	thumb_func_start ov113_021E6084
ov113_021E6084: ; 0x021E6084
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #5
	add r5, r0, #0
	lsl r1, r1, #6
	add r1, r5, r1
	mov r2, #6
	bl ov113_021E6238
	mov r1, #0x11
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #2
	bl ov113_021E6238
	mov r0, #0xe
	mul r0, r4
	str r0, [sp, #4]
	add r0, r5, #0
	str r0, [sp, #0xc]
	add r0, #0x88
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r4, #0
	str r0, [sp, #8]
	add r0, #0x78
	str r5, [sp]
	add r6, r4, #0
	str r0, [sp, #8]
_021E60C2:
	ldr r0, [sp, #4]
	add r7, r0, r4
	ldrb r0, [r5, #0x1f]
	cmp r7, r0
	blt _021E60DA
	ldr r0, [sp]
	mov r1, #0
	add r0, #0xc4
	ldr r0, [r0]
	bl sub_0200DCE8
	b _021E612A
_021E60DA:
	ldr r0, [sp]
	mov r1, #1
	add r0, #0xc4
	ldr r0, [r0]
	bl sub_0200DCE8
	add r2, r5, r7
	add r2, #0x20
	ldrb r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov113_021E6AE8
	add r1, r5, r7
	add r1, #0x20
	ldrb r1, [r1]
	ldr r0, [r5, #0x44]
	ldr r2, [r5, #0x50]
	add r1, #0x14
	bl ReadMsgDataIntoString
	cmp r4, #7
	bge _021E6118
	lsl r3, r6, #0x10
	ldr r0, [sp, #8]
	ldr r1, [r5, #0x50]
	mov r2, #0x30
	lsr r3, r3, #0x10
	bl ov113_021E629C
	b _021E612A
_021E6118:
	add r3, r6, #0
	sub r3, #0xa8
	lsl r3, r3, #0x10
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x50]
	mov r2, #0x30
	lsr r3, r3, #0x10
	bl ov113_021E629C
_021E612A:
	ldr r0, [sp]
	add r4, r4, #1
	add r0, r0, #4
	add r6, #0x18
	str r0, [sp]
	cmp r4, #0xe
	blt _021E60C2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov113_021E6084

	thumb_func_start ov113_021E613C
ov113_021E613C: ; 0x021E613C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r1, [sp, #4]
	cmp r1, #0
	bne _021E617C
	mov r1, #0x15
	lsl r1, r1, #4
	add r1, r5, r1
	mov r2, #6
	bl ov113_021E6238
	mov r1, #0x12
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r5, r1
	mov r2, #2
	bl ov113_021E6238
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_021E6168:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r7, #0
	bl sub_0200DCE8
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0xe
	blt _021E6168
_021E617C:
	ldr r0, [sp, #4]
	ldr r1, _021E6234 ; =ov113_021E6BD0
	lsl r0, r0, #2
	add r4, r1, r0
	ldrh r1, [r1, r0]
	lsl r0, r1, #0x10
	lsr r2, r0, #0x18
	add r0, r5, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r2, r0
	bgt _021E61E8
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1e
	mov r6, #0
	cmp r0, #0
	ble _021E61E8
	add r7, r5, #0
	add r7, #0x78
_021E61A2:
	ldrh r1, [r4]
	ldr r0, [r5, #0x44]
	ldr r2, [r5, #0x50]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	add r1, r1, r6
	bl ReadMsgDataIntoString
	ldrh r0, [r4]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	add r0, r0, r6
	cmp r0, #0xf
	bne _021E61D0
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x50]
	add r0, r7, #0
	mov r2, #3
	mov r3, #4
	bl ov113_021E6274
	b _021E61DC
_021E61D0:
	ldr r1, [r5, #0x50]
	add r0, r7, #0
	mov r2, #4
	mov r3, #0x18
	bl ov113_021E629C
_021E61DC:
	ldrh r0, [r4]
	add r6, r6, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	cmp r6, r0
	blt _021E61A2
_021E61E8:
	ldrh r1, [r4, #2]
	lsl r0, r1, #0x10
	lsr r2, r0, #0x18
	add r0, r5, #0
	add r0, #0x3c
	ldrb r0, [r0]
	cmp r2, r0
	bgt _021E622E
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1e
	mov r6, #0
	cmp r0, #0
	ble _021E622E
	add r7, r5, #0
	add r7, #0x88
_021E6206:
	ldrh r1, [r4, #2]
	ldr r0, [r5, #0x44]
	ldr r2, [r5, #0x50]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	add r1, r1, r6
	bl ReadMsgDataIntoString
	ldr r1, [r5, #0x50]
	add r0, r7, #0
	mov r2, #4
	mov r3, #0x18
	bl ov113_021E629C
	ldrh r0, [r4, #2]
	add r6, r6, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	cmp r6, r0
	blt _021E6206
_021E622E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6234: .word ov113_021E6BD0
	thumb_func_end ov113_021E613C

	thumb_func_start ov113_021E6238
ov113_021E6238: ; 0x021E6238
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	ldr r0, [r1, #8]
	add r4, r2, #0
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrb r0, [r1, #0xc]
	add r3, r2, #0
	str r0, [sp, #0x14]
	ldrb r0, [r1, #0xd]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x40]
	bl CopyToBgTilemapRect
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x40]
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov113_021E6238

	thumb_func_start ov113_021E6274
ov113_021E6274: ; 0x021E6274
	push {r4, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	str r1, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r1, _021E6298 ; =0x00010200
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	add r1, r2, #0
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E6298: .word 0x00010200
	thumb_func_end ov113_021E6274

	thumb_func_start ov113_021E629C
ov113_021E629C: ; 0x021E629C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r2, #0
	str r3, [sp]
	mov r2, #0
	add r3, r4, #0
	bl ov113_021E6274
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov113_021E629C

	thumb_func_start ov113_021E62B0
ov113_021E62B0: ; 0x021E62B0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _021E62C0
	bl sub_0200D034
_021E62C0:
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #0x40]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E62D8 ; =0x027E0000
	ldr r1, _021E62DC ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_021E62D8: .word 0x027E0000
_021E62DC: .word 0x00003FF8
	thumb_func_end ov113_021E62B0

	thumb_func_start ov113_021E62E0
ov113_021E62E0: ; 0x021E62E0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E62FC ; =ov113_021E6CD0
	add r3, sp, #0
	mov r2, #5
_021E62EA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E62EA
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E62FC: .word ov113_021E6CD0
	thumb_func_end ov113_021E62E0

	thumb_func_start ov113_021E6300
ov113_021E6300: ; 0x021E6300
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	add r4, r0, #0
	bl ov113_021E62E0
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0xa8
	ldr r5, _021E646C ; =ov113_021E6B94
	str r0, [r4, #0x40]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r2, _021E6470 ; =0x04000304
	ldr r0, _021E6474 ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _021E6478 ; =ov113_021E6C3C
	add r3, sp, #0x8c
	and r0, r1
	strh r0, [r2]
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
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x40]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E647C ; =ov113_021E6C74
	add r3, sp, #0x70
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
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x40]
	mov r1, #6
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6480 ; =ov113_021E6BE8
	add r3, sp, #0x54
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
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x40]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6484 ; =ov113_021E6C04
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E6488 ; =ov113_021E6C20
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _021E648C ; =ov113_021E6C58
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #6
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E646C: .word ov113_021E6B94
_021E6470: .word 0x04000304
_021E6474: .word 0xFFFF7FFF
_021E6478: .word ov113_021E6C3C
_021E647C: .word ov113_021E6C74
_021E6480: .word ov113_021E6BE8
_021E6484: .word ov113_021E6C04
_021E6488: .word ov113_021E6C20
_021E648C: .word ov113_021E6C58
	thumb_func_end ov113_021E6300

	thumb_func_start ov113_021E6490
ov113_021E6490: ; 0x021E6490
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #6
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #5
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	bl FreeToHeap
	ldr r2, _021E64D8 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_021E64D8: .word 0x04000304
	thumb_func_end ov113_021E6490

	thumb_func_start ov113_021E64DC
ov113_021E64DC: ; 0x021E64DC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	str r3, [sp]
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #1
	add r3, r4, #4
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r4]
	ldr r0, [r4, #4]
	ldrh r0, [r0]
	lsr r0, r0, #3
	strb r0, [r4, #0xc]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #2]
	lsr r0, r0, #3
	strb r0, [r4, #0xd]
	ldr r0, [r4, #4]
	add r0, #0xc
	str r0, [r4, #8]
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov113_021E64DC

	thumb_func_start ov113_021E650C
ov113_021E650C: ; 0x021E650C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xf1
	bl NARC_ctor
	mov r2, #0
	str r2, [sp]
	ldr r1, [r5]
	add r3, r2, #0
	str r1, [sp, #4]
	mov r1, #5
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #7
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #9
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	mov r1, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #6
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #8
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x40]
	add r0, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r3, [r5]
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0xa
	bl ov113_021E64DC
	mov r0, #5
	lsl r0, r0, #6
	ldr r3, [r5]
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0xc
	bl ov113_021E64DC
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r3, [r5]
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0xe
	bl ov113_021E64DC
	mov r0, #1
	lsl r0, r0, #8
	ldr r3, [r5]
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0xb
	bl ov113_021E64DC
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r3, [r5]
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0xd
	bl ov113_021E64DC
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r3, [r5]
	add r0, r5, r0
	add r1, r4, #0
	mov r2, #0xf
	bl ov113_021E64DC
	add r0, r4, #0
	bl NARC_dtor
	ldrb r0, [r5, #0x19]
	mov r1, #1
	add r2, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #0xd
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	bl LoadUserFrameGfx2
	mov r1, #6
	ldr r2, [r5]
	mov r0, #0
	lsl r1, r1, #6
	bl LoadFontPal1
	mov r1, #6
	ldr r2, [r5]
	mov r0, #4
	lsl r1, r1, #6
	bl LoadFontPal1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov113_021E650C

	thumb_func_start ov113_021E663C
ov113_021E663C: ; 0x021E663C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x12
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #1
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov113_021E663C

	thumb_func_start ov113_021E6680
ov113_021E6680: ; 0x021E6680
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl FontID_Alloc
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #1
	bl NewMsgDataFromNarc
	str r0, [r4, #0x44]
	mov r0, #0x10
	ldr r2, [r4]
	add r1, r0, #0
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x48]
	mov r0, #2
	ldr r1, [r4]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r4, #0x4c]
	mov r0, #2
	ldr r1, [r4]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x44]
	mov r1, #0
	bl NewString_ReadMsgData
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x44]
	mov r1, #5
	bl NewString_ReadMsgData
	str r0, [r4, #0x58]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, [r4]
	bl PlayerProfile_GetPlayerName_NewString
	str r0, [r4, #0x5c]
	pop {r4, pc}
	thumb_func_end ov113_021E6680

	thumb_func_start ov113_021E66E4
ov113_021E66E4: ; 0x021E66E4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl String_dtor
	ldr r0, [r4, #0x58]
	bl String_dtor
	ldr r0, [r4, #0x54]
	bl String_dtor
	ldr r0, [r4, #0x50]
	bl String_dtor
	ldr r0, [r4, #0x4c]
	bl String_dtor
	ldr r0, [r4, #0x48]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x44]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov113_021E66E4

	thumb_func_start ov113_021E671C
ov113_021E671C: ; 0x021E671C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _021E6750 ; =ov113_021E6C90
	mov r6, #0
	add r5, #0x68
_021E6728:
	ldr r0, [r7, #0x40]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #4
	blt _021E6728
	ldr r0, [r7]
	bl sub_0201660C
	add r7, #0xa8
	str r0, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6750: .word ov113_021E6C90
	thumb_func_end ov113_021E671C

	thumb_func_start ov113_021E6754
ov113_021E6754: ; 0x021E6754
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0x68
_021E675E:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _021E675E
	add r6, #0xa8
	ldr r0, [r6]
	bl sub_02016624
	pop {r4, r5, r6, pc}
	thumb_func_end ov113_021E6754

	thumb_func_start ov113_021E677C
ov113_021E677C: ; 0x021E677C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r5]
	bl sub_0200CF18
	add r1, r5, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, _021E6920 ; =ov113_021E6CB0
	ldr r2, _021E6924 ; =ov113_021E6BA4
	mov r3, #2
	bl sub_0200CF70
	ldr r0, [r5]
	bl sub_0200B2E0
	ldr r0, [r5]
	bl sub_0200B2E8
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r5, #0
	add r1, #0xb0
	str r0, [r1]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x11
	bl sub_0200CFF4
	mov r3, #0
	add r0, r5, #0
	add r1, r5, #0
	str r3, [sp]
	add r0, #0xac
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, _021E6928 ; =ov113_021E6B74
	bl sub_0200D2A4
	ldr r3, _021E692C ; =ov113_021E6BB8
	add r2, sp, #0x10
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF38
	add r1, r5, #0
	add r1, #0xb4
	str r0, [r1]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x10
	bl sub_0200D3F8
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_0200E2B0
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	bl sub_0200E2B4
	ldr r1, [r5]
	mov r0, #0x14
	bl NARC_ctor
	add r1, r5, #0
	add r1, #0xfc
	str r0, [r1]
	bl sub_02074490
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	add r2, r5, #0
	str r1, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb4
	add r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl sub_0200D5D4
	bl sub_02074494
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	add r2, r5, #0
	add r0, #0xac
	add r1, #0xb4
	add r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl sub_0200D6EC
	bl sub_020744A0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, #0x14
	bl sub_0200D704
	mov r4, #0
	add r6, r4, #0
	mov r7, #2
_021E68B4:
	mov r0, #0xc9
	mov r1, #0
	add r2, r4, #0
	bl GetMonIconNaixEx
	str r6, [sp]
	add r3, r0, #0
	add r1, r5, #0
	add r2, r5, #0
	str r7, [sp, #4]
	add r0, r4, #1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xac
	add r1, #0xb4
	add r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl sub_0200D504
	add r4, r4, #1
	cmp r4, #7
	blt _021E68B4
	mov r4, #7
	mov r6, #0
	mov r7, #1
_021E68EA:
	mov r0, #0xc9
	mov r1, #0
	add r2, r4, #0
	bl GetMonIconNaixEx
	str r6, [sp]
	add r3, r0, #0
	add r1, r5, #0
	add r2, r5, #0
	str r7, [sp, #4]
	add r0, r4, #1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xac
	add r1, #0xb4
	add r2, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl sub_0200D504
	add r4, r4, #1
	cmp r4, #0xe
	blt _021E68EA
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6920: .word ov113_021E6CB0
_021E6924: .word ov113_021E6BA4
_021E6928: .word ov113_021E6B74
_021E692C: .word ov113_021E6BB8
	thumb_func_end ov113_021E677C

	thumb_func_start ov113_021E6930
ov113_021E6930: ; 0x021E6930
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r0, #0xac
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D998
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xac
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl sub_0200D0E4
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xb0
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	bl NARC_dtor
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200D108
	add r0, r4, #0
	mov r1, #0
	add r0, #0xac
	str r1, [r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	pop {r4, pc}
	thumb_func_end ov113_021E6930

	thumb_func_start ov113_021E6988
ov113_021E6988: ; 0x021E6988
	push {r4, lr}
	add r4, r0, #0
	bl ov113_021E677C
	add r0, r4, #0
	bl ov113_021E69CC
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	pop {r4, pc}
	thumb_func_end ov113_021E6988

	thumb_func_start ov113_021E69A8
ov113_021E69A8: ; 0x021E69A8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineBToggleLayers
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov113_021E6AB0
	add r0, r4, #0
	bl ov113_021E6930
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov113_021E69A8

	thumb_func_start ov113_021E69CC
ov113_021E69CC: ; 0x021E69CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r6, _021E6AAC ; =ov113_021E6CF8
	mov r7, #0
	add r4, r5, #0
_021E69D8:
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, r6, #0
	bl sub_0200D2B4
	add r1, r4, #0
	add r1, #0xb8
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	add r0, #0xb8
	ldr r0, [r0]
	mov r1, #2
	bl sub_02024A04
	add r7, r7, #1
	add r6, #0x28
	add r4, r4, #4
	cmp r7, #3
	blt _021E69D8
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	mov r0, #1
	mov r1, #0
	str r0, [sp, #0x30]
	mov r0, #0xc9
	add r2, r1, #0
	bl GetMonIconPaletteEx
	mov r4, #0
	str r0, [sp, #0x10]
	str r4, [sp, #0x34]
	mov r1, #0x28
	add r0, sp, #4
	strh r1, [r0]
	mov r0, #1
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	sub r0, r0, #2
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	mov r7, #0x1d
	str r4, [sp]
	add r6, r5, #0
_021E6A56:
	cmp r4, #7
	add r0, sp, #4
	bge _021E6A64
	strh r7, [r0, #2]
	mov r0, #2
	str r0, [sp, #0x14]
	b _021E6A6E
_021E6A64:
	ldr r1, [sp]
	sub r1, #0x9b
	strh r1, [r0, #2]
	mov r0, #1
	str r0, [sp, #0x14]
_021E6A6E:
	add r0, r4, #1
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb4
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #4
	bl sub_0200D734
	add r1, r6, #0
	add r1, #0xc4
	str r0, [r1]
	add r0, r6, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [sp]
	add r4, r4, #1
	add r0, #0x18
	add r7, #0x18
	add r6, r6, #4
	str r0, [sp]
	cmp r4, #0xe
	blt _021E6A56
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6AAC: .word ov113_021E6CF8
	thumb_func_end ov113_021E69CC

	thumb_func_start ov113_021E6AB0
ov113_021E6AB0: ; 0x021E6AB0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
_021E6AB8:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6AC6
	bl sub_0200D9DC
_021E6AC6:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0xe
	blt _021E6AB8
	mov r4, #0
_021E6AD0:
	add r0, r5, #0
	add r0, #0xb8
	ldr r0, [r0]
	cmp r0, #0
	beq _021E6ADE
	bl sub_02024758
_021E6ADE:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021E6AD0
	pop {r4, r5, r6, pc}
	thumb_func_end ov113_021E6AB0

	thumb_func_start ov113_021E6AE8
ov113_021E6AE8: ; 0x021E6AE8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xc9
	mov r1, #0
	bl GetMonIconNaixEx
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r4, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xac
	add r1, #0xb4
	add r5, #0xfc
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r5]
	bl sub_0200E2B8
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov113_021E6AE8

	thumb_func_start ov113_021E6B1C
ov113_021E6B1C: ; 0x021E6B1C
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x1b]
	cmp r0, #1
	beq _021E6B2C
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _021E6B3A
_021E6B2C:
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	b _021E6B46
_021E6B3A:
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
_021E6B46:
	ldrb r0, [r4, #0x1b]
	cmp r0, #1
	beq _021E6B54
	ldrb r1, [r4, #0x1a]
	sub r0, r0, #1
	cmp r1, r0
	bne _021E6B60
_021E6B54:
	add r4, #0xc0
	ldr r0, [r4]
	mov r1, #7
	bl Set2dSpriteAnimSeqNo
	pop {r4, pc}
_021E6B60:
	add r4, #0xc0
	ldr r0, [r4]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	pop {r4, pc}
	thumb_func_end ov113_021E6B1C

	.rodata

_021E6B6C:
	.byte 0x00, 0x0F, 0x07, 0x00
	.byte 0x00, 0x0F, 0x01, 0x00

ov113_021E6B74: ; 0x021E6B74
	.byte 0x06, 0x00, 0x07, 0x00, 0x05, 0x00, 0x04, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x49, 0x00

ov113_021E6B82: ; 0x021E6B82
	.byte 0xA0, 0xC0, 0xC0, 0x00, 0x10, 0x25, 0xDC, 0xF4, 0x78, 0x8D, 0xDC, 0xF4, 0xFF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov113_021E6B94: ; 0x021E6B94
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov113_021E6BA4: ; 0x021E6BA4
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov113_021E6BB8: ; 0x021E6BB8
	.byte 0x0E, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov113_021E6BD0: ; 0x021E6BD0
	.byte 0x46, 0x01, 0x47, 0x01, 0x48, 0x02, 0x49, 0x03, 0x4A, 0x04, 0x4B, 0x04, 0x4C, 0x05, 0x4D, 0x06
	.byte 0xCE, 0x07, 0x51, 0x07, 0x52, 0x08, 0x53, 0x08

ov113_021E6BE8: ; 0x021E6BE8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov113_021E6C04: ; 0x021E6C04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov113_021E6C20: ; 0x021E6C20
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov113_021E6C3C: ; 0x021E6C3C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov113_021E6C58: ; 0x021E6C58
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov113_021E6C74: ; 0x021E6C74
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov113_021E6C90: ; 0x021E6C90
	.byte 0x01, 0x19, 0x15, 0x06, 0x02, 0x0C, 0xE1, 0x01, 0x05, 0x02, 0x03, 0x18, 0x14, 0x0C, 0x01, 0x00
	.byte 0x01, 0x02, 0x01, 0x18, 0x14, 0x0C, 0x01, 0x00, 0x01, 0x1C, 0x09, 0x03, 0x02, 0x0C, 0xED, 0x01

ov113_021E6CB0: ; 0x021E6CB0
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov113_021E6CD0: ; 0x021E6CD0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov113_021E6CF8: ; 0x021E6CF8
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xEC, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xEC, 0x00, 0x84, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x021E6D70
