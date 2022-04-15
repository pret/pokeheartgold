	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov17_02201BC0
ov17_02201BC0: ; 0x02201BC0
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
	ldr r0, _02201C08 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02201C0C ; =0x04001000
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
_02201C08: .word 0xFFFFE0FF
_02201C0C: .word 0x04001000
	thumb_func_end ov17_02201BC0

	thumb_func_start ov17_02201C10
ov17_02201C10: ; 0x02201C10
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _02201C22
	cmp r1, #1
	beq _02201C64
	b _02201C74
_02201C22:
	bl ov17_02201BC0
	mov r2, #2
	mov r0, #3
	mov r1, #0x83
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0x6b
	add r0, r6, #0
	lsl r1, r1, #2
	mov r2, #0x83
	bl OverlayManager_CreateAndGetData
	mov r2, #0x6b
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x83
	str r0, [r4]
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov17_02201D30
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02201C74
_02201C64:
	bl OverlayManager_GetData
	bl ov17_02201DF0
	cmp r0, #0
	beq _02201C74
	mov r0, #1
	pop {r4, r5, r6, pc}
_02201C74:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_02201C10

	thumb_func_start ov17_02201C78
ov17_02201C78: ; 0x02201C78
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #9
	bhi _02201CF4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02201C94: ; jump table
	.short _02201CA8 - _02201C94 - 2 ; case 0
	.short _02201CB0 - _02201C94 - 2 ; case 1
	.short _02201CB8 - _02201C94 - 2 ; case 2
	.short _02201CC0 - _02201C94 - 2 ; case 3
	.short _02201CC8 - _02201C94 - 2 ; case 4
	.short _02201CD0 - _02201C94 - 2 ; case 5
	.short _02201CD8 - _02201C94 - 2 ; case 6
	.short _02201CE0 - _02201C94 - 2 ; case 7
	.short _02201CE8 - _02201C94 - 2 ; case 8
	.short _02201CF0 - _02201C94 - 2 ; case 9
_02201CA8:
	bl ov17_02201E50
	str r0, [r4]
	b _02201CF4
_02201CB0:
	bl ov17_02201EA8
	str r0, [r4]
	b _02201CF4
_02201CB8:
	bl ov17_02201EFC
	str r0, [r4]
	b _02201CF4
_02201CC0:
	bl ov17_02201F18
	str r0, [r4]
	b _02201CF4
_02201CC8:
	bl ov17_02201FE8
	str r0, [r4]
	b _02201CF4
_02201CD0:
	bl ov17_02202094
	str r0, [r4]
	b _02201CF4
_02201CD8:
	bl ov17_02202184
	str r0, [r4]
	b _02201CF4
_02201CE0:
	bl ov17_02202320
	str r0, [r4]
	b _02201CF4
_02201CE8:
	bl ov17_02202378
	str r0, [r4]
	b _02201CF4
_02201CF0:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02201CF4:
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov17_02201C78

	thumb_func_start ov17_02201D04
ov17_02201D04: ; 0x02201D04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov17_02201E3C
	cmp r0, #0
	bne _02201D1A
	mov r0, #0
	pop {r3, r4, r5, pc}
_02201D1A:
	add r0, r4, #0
	bl ov17_02201DD8
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x83
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02201D04

	thumb_func_start ov17_02201D30
ov17_02201D30: ; 0x02201D30
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl sub_020183F0
	str r0, [r5, #0x74]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	bl Options_GetTextFrameDelay
	add r1, r5, #0
	add r1, #0x78
	strb r0, [r1]
	add r0, r4, #0
	bl Options_GetFrame
	add r1, r5, #0
	add r1, #0x79
	strb r0, [r1]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	str r0, [r5, #0xc]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	str r0, [r5, #0x10]
	ldr r0, [r5]
	bl ov16_022014A0
	str r0, [r5, #0x1c]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_BerryPots_get
	str r0, [r5, #0x14]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_BerryPotRTC_get
	str r0, [r5, #0x18]
	ldr r1, [r5, #4]
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	beq _02201DA6
	ldrb r1, [r1, #0x15]
	b _02201DA8
_02201DA6:
	mov r1, #0
_02201DA8:
	add r0, r5, #0
	add r0, #0x7c
	strb r1, [r0]
	add r0, r5, #0
	bl ov17_022023B0
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	bl ov16_022018F0
	add r1, r5, #0
	add r1, #0x82
	strh r0, [r1]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	bl ov16_0220191C
	add r1, r5, #0
	add r1, #0x84
	strh r0, [r1]
	add r0, r5, #0
	bl ov17_0220387C
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02201D30

	thumb_func_start ov17_02201DD8
ov17_02201DD8: ; 0x02201DD8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x74]
	ldr r0, [r0, #4]
	ldr r0, [r0, #4]
	bl sub_02018410
	pop {r4, pc}
	thumb_func_end ov17_02201DD8

	thumb_func_start ov17_02201DF0
ov17_02201DF0: ; 0x02201DF0
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02201E04
	cmp r1, #1
	beq _02201E16
	b _02201E38
_02201E04:
	bl ov17_022024CC
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02201E38
_02201E16:
	bl ov17_02202528
	bl sub_020210BC
	mov r0, #1
	bl sub_02021148
	mov r1, #0
	mov r0, #0x45
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #0
	add r4, #0x70
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_02201E38:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov17_02201DF0

	thumb_func_start ov17_02201E3C
ov17_02201E3C: ; 0x02201E3C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02021238
	add r0, r4, #0
	bl ov17_02202500
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov17_02201E3C

	thumb_func_start ov17_02201E50
ov17_02201E50: ; 0x02201E50
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _02201E64
	cmp r0, #1
	beq _02201E88
	b _02201EA2
_02201E64:
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
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02201EA2
_02201E88:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02201EA2
	add r0, r4, #0
	mov r1, #0
	add r0, #0x70
	strh r1, [r0]
	add r0, r4, #0
	bl ov17_02202440
	add sp, #0xc
	pop {r3, r4, pc}
_02201EA2:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov17_02201E50

	thumb_func_start ov17_02201EA8
ov17_02201EA8: ; 0x02201EA8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _02201EBC
	cmp r0, #1
	beq _02201EE2
	b _02201EF6
_02201EBC:
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
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02201EF6
_02201EE2:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02201EF6
	mov r0, #0
	add r4, #0x70
	strh r0, [r4]
	add sp, #0xc
	mov r0, #9
	pop {r3, r4, pc}
_02201EF6:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov17_02201EA8

	thumb_func_start ov17_02201EFC
ov17_02201EFC: ; 0x02201EFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov17_02203A34
	add r4, r0, #0
	cmp r4, #2
	bne _02201F12
	add r0, r5, #0
	mov r1, #1
	bl ov17_022037C8
_02201F12:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov17_02201EFC

	thumb_func_start ov17_02201F18
ov17_02201F18: ; 0x02201F18
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02201F2C
	cmp r1, #1
	beq _02201F58
	b _02201FE4
_02201F2C:
	mov r1, #0
	bl ov17_022029C8
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #0
	bl ov17_02202910
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02201FE4
_02201F58:
	bl ov17_02202A50
	mov r2, #0
	mvn r2, r2
	cmp r0, r2
	beq _02201FE4
	add r1, r4, #0
	mov r3, #0
	add r1, #0x70
	strh r3, [r1]
	cmp r0, #2
	beq _02201F76
	sub r1, r3, #2
	cmp r0, r1
	bne _02201F8E
_02201F76:
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	mov r0, #2
	pop {r3, r4, r5, pc}
_02201F8E:
	add r1, r4, #0
	add r1, #0x7c
	ldrb r5, [r1]
	ldr r1, [r4, #4]
	lsr r2, r2, #0x10
	strb r5, [r1, #0x15]
	ldr r1, [r4, #4]
	cmp r0, #0
	strh r2, [r1, #0x16]
	bne _02201FC2
	add r0, r4, #0
	add r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	bne _02201FBA
	add r0, r4, #0
	mov r1, #2
	mov r2, #4
	bl ov17_02202944
	mov r0, #8
	pop {r3, r4, r5, pc}
_02201FBA:
	ldr r0, [r4, #4]
	mov r1, #1
	strb r1, [r0, #0x14]
	b _02201FE0
_02201FC2:
	add r0, r4, #0
	add r0, #0x82
	ldrh r0, [r0]
	cmp r0, #0
	bne _02201FDA
	add r0, r4, #0
	mov r1, #1
	mov r2, #4
	bl ov17_02202944
	mov r0, #8
	pop {r3, r4, r5, pc}
_02201FDA:
	ldr r0, [r4, #4]
	mov r1, #2
	strb r1, [r0, #0x14]
_02201FE0:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02201FE4:
	mov r0, #3
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02201F18

	thumb_func_start ov17_02201FE8
ov17_02201FE8: ; 0x02201FE8
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02201FFC
	cmp r1, #1
	beq _02202028
	b _02202090
_02201FFC:
	mov r1, #1
	bl ov17_022029C8
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #5
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #0
	bl ov17_02202910
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02202090
_02202028:
	bl ov17_02202A50
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02202090
	add r2, r4, #0
	mov r3, #0
	add r2, #0x70
	strh r3, [r2]
	cmp r0, #1
	beq _02202046
	sub r2, r3, #2
	cmp r0, r2
	bne _0220205E
_02202046:
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	mov r0, #2
	pop {r4, pc}
_0220205E:
	add r0, r4, #0
	add r0, #0x82
	ldrh r0, [r0]
	cmp r0, #0
	bne _02202076
	add r0, r4, #0
	mov r1, #1
	mov r2, #4
	bl ov17_02202944
	mov r0, #8
	pop {r4, pc}
_02202076:
	add r0, r4, #0
	add r0, #0x7c
	ldrb r2, [r0]
	ldr r0, [r4, #4]
	lsr r1, r1, #0x10
	strb r2, [r0, #0x15]
	ldr r0, [r4, #4]
	strh r1, [r0, #0x16]
	ldr r0, [r4, #4]
	mov r1, #2
	strb r1, [r0, #0x14]
	mov r0, #1
	pop {r4, pc}
_02202090:
	mov r0, #4
	pop {r4, pc}
	thumb_func_end ov17_02201FE8

	thumb_func_start ov17_02202094
ov17_02202094: ; 0x02202094
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _022020AC
	cmp r1, #1
	beq _022020E2
	cmp r1, #2
	beq _02202130
	b _02202152
_022020AC:
	mov r1, #2
	bl ov17_022029C8
	add r0, r4, #0
	mov r1, #0
	bl ov17_02202910
	add r0, r4, #0
	add r0, #0x7c
	ldrb r2, [r0]
	mov r1, #0x14
	add r0, r4, #0
	mul r1, r2
	add r1, r4, r1
	add r1, #0x21
	ldrb r1, [r1]
	mov r3, #1
	add r1, r1, #5
	bl ov17_02202944
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02202180
_022020E2:
	bl ov17_02202A50
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02202180
	cmp r0, #1
	beq _022020F8
	sub r1, r1, #1
	cmp r0, r1
	bne _02202116
_022020F8:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x70
	strh r1, [r0]
	add r0, r4, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	mov r0, #2
	pop {r4, pc}
_02202116:
	add r0, r4, #0
	mov r1, #3
	mov r2, #4
	mov r3, #0
	bl ov17_02202944
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02202180
_02202130:
	bl ov17_022025B8
	cmp r0, #0
	beq _02202180
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #4
	mov r3, #0
	bl ov17_02202944
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x70
	strh r1, [r0]
_02202152:
	add r0, r4, #0
	bl ov17_02202460
	cmp r0, #0
	beq _02202180
	add r0, r4, #0
	bl ov17_022028B8
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	mov r0, #0
	add r4, #0x70
	strh r0, [r4]
	mov r0, #2
	pop {r4, pc}
_02202180:
	mov r0, #5
	pop {r4, pc}
	thumb_func_end ov17_02202094

	thumb_func_start ov17_02202184
ov17_02202184: ; 0x02202184
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x70
	ldrh r1, [r1]
	cmp r1, #5
	bhi _022021E2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0220219E: ; jump table
	.short _022021AA - _0220219E - 2 ; case 0
	.short _022021D6 - _0220219E - 2 ; case 1
	.short _02202262 - _0220219E - 2 ; case 2
	.short _02202288 - _0220219E - 2 ; case 3
	.short _022022B4 - _0220219E - 2 ; case 4
	.short _022022DA - _0220219E - 2 ; case 5
_022021AA:
	mov r1, #3
	bl ov17_022029C8
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #0xa
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #0
	bl ov17_02202910
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02202316
_022021D6:
	bl ov17_02202A50
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022021E4
_022021E2:
	b _02202316
_022021E4:
	cmp r0, #1
	beq _022021EE
	sub r1, r1, #1
	cmp r0, r1
	bne _0220220C
_022021EE:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x70
	strh r1, [r0]
	add r0, r4, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	mov r0, #2
	pop {r3, r4, r5, pc}
_0220220C:
	add r0, r4, #0
	add r0, #0x7c
	ldrb r1, [r0]
	add r2, r4, #0
	mov r0, #0x14
	add r2, #0x20
	mul r0, r1
	add r5, r2, r0
	ldrb r0, [r2, r0]
	bl ov16_022018B4
	add r1, r0, #0
	ldrb r2, [r5, #5]
	ldr r0, [r4, #0xc]
	ldr r3, [r4]
	bl Bag_HasSpaceForItem
	cmp r0, #0
	beq _02202244
	add r0, r4, #0
	mov r1, #3
	add r0, #0x70
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0
	bl ov17_02202900
	b _02202316
_02202244:
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #0x10
	mov r3, #0
	bl ov17_02202944
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02202316
_02202262:
	bl ov17_02202460
	cmp r0, #0
	beq _02202316
	add r0, r4, #0
	mov r1, #0
	add r0, #0x70
	strh r1, [r0]
	add r0, r4, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	mov r0, #2
	pop {r3, r4, r5, pc}
_02202288:
	bl ov17_0220279C
	cmp r0, #0
	beq _02202316
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #0xe
	mov r3, #0
	bl ov17_02202944
	ldr r0, _0220231C ; =0x000004A9
	bl PlayFanfare
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _02202316
_022022B4:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _02202316
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #0xf
	mov r3, #0
	bl ov17_02202944
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x70
	strh r1, [r0]
_022022DA:
	add r0, r4, #0
	bl ov17_02202460
	cmp r0, #0
	beq _02202316
	add r0, r4, #0
	bl ov17_02202B98
	add r0, r4, #0
	bl ov17_022028B8
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202900
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	mov r0, #0
	add r4, #0x70
	strh r0, [r4]
	mov r0, #2
	pop {r3, r4, r5, pc}
_02202316:
	mov r0, #6
	pop {r3, r4, r5, pc}
	nop
_0220231C: .word 0x000004A9
	thumb_func_end ov17_02202184

	thumb_func_start ov17_02202320
ov17_02202320: ; 0x02202320
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x70
	ldrh r1, [r1]
	cmp r1, #0
	beq _02202334
	cmp r1, #1
	beq _02202348
	b _0220236E
_02202334:
	ldr r0, _02202374 ; =0x00000888
	bl PlaySE
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	add r4, #0x70
	add r0, r0, #1
	strh r0, [r4]
	b _0220236E
_02202348:
	bl ov17_02202460
	cmp r0, #0
	beq _0220236E
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	mov r0, #0
	add r4, #0x70
	strh r0, [r4]
	mov r0, #2
	pop {r4, pc}
_0220236E:
	mov r0, #7
	pop {r4, pc}
	nop
_02202374: .word 0x00000888
	thumb_func_end ov17_02202320

	thumb_func_start ov17_02202378
ov17_02202378: ; 0x02202378
	push {r4, lr}
	add r4, r0, #0
	bl ov17_02202460
	cmp r0, #0
	beq _0220239C
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
	mov r0, #2
	pop {r4, pc}
_0220239C:
	mov r0, #8
	pop {r4, pc}
	thumb_func_end ov17_02202378

	thumb_func_start ov17_022023A0
ov17_022023A0: ; 0x022023A0
	cmp r0, #0x5f
	blo _022023A8
	cmp r0, #0x63
	bls _022023AC
_022023A8:
	mov r0, #0
	bx lr
_022023AC:
	mov r0, #1
	bx lr
	thumb_func_end ov17_022023A0

	thumb_func_start ov17_022023B0
ov17_022023B0: ; 0x022023B0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	add r0, #0x7b
	strb r1, [r0]
	ldr r0, [r4, #4]
	ldrb r2, [r0, #0x14]
	cmp r2, #0
	beq _02202438
	ldrh r0, [r0, #0x16]
	ldr r1, _0220243C ; =0x0000FFFF
	cmp r0, r1
	beq _02202438
	cmp r2, #1
	bne _022023F6
	bl ov17_022023A0
	cmp r0, #0
	beq _02202438
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x16]
	bl ov16_022018E4
	add r1, r4, #0
	add r1, #0x7c
	add r2, r0, #0
	ldrb r1, [r1]
	ldr r0, [r4, #0x14]
	bl ov16_0220165C
	add r0, r4, #0
	mov r1, #1
	add r0, #0x7b
	strb r1, [r0]
	b _0220242A
_022023F6:
	cmp r2, #2
	bne _0220242A
	bl ItemIdIsBerry
	cmp r0, #0
	beq _02202438
	ldr r0, [r4, #4]
	ldrh r0, [r0, #0x16]
	bl ov16_022018C4
	add r1, r4, #0
	add r1, #0x7c
	add r3, r0, #0
	ldrb r1, [r1]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x1c]
	bl ov16_02201610
	ldr r0, [r4, #0x10]
	mov r1, #5
	bl GameStats_Inc
	add r0, r4, #0
	mov r1, #2
	add r0, #0x7b
	strb r1, [r0]
_0220242A:
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	ldrh r1, [r1, #0x16]
	ldr r3, [r4]
	mov r2, #1
	bl Bag_TakeItem
_02202438:
	pop {r4, pc}
	nop
_0220243C: .word 0x0000FFFF
	thumb_func_end ov17_022023B0

	thumb_func_start ov17_02202440
ov17_02202440: ; 0x02202440
	ldr r3, [r0, #4]
	mov r1, #0
	ldrb r2, [r3, #0x14]
	strb r1, [r3, #0x14]
	cmp r2, #0
	bne _02202450
	mov r0, #2
	bx lr
_02202450:
	add r0, #0x7b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0220245C
	mov r0, #7
	bx lr
_0220245C:
	mov r0, #2
	bx lr
	thumb_func_end ov17_02202440

	thumb_func_start ov17_02202460
ov17_02202460: ; 0x02202460
	push {r4, lr}
	add r4, r0, #0
	bl System_GetTouchNew
	cmp r0, #0
	beq _02202478
	ldr r0, _022024C0 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	str r0, [r4, #0x74]
	pop {r4, pc}
_02202478:
	ldr r0, _022024C4 ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _022024C8 ; =0x00000CF3
	tst r0, r1
	beq _02202486
	mov r0, #0
	str r0, [r4, #0x74]
_02202486:
	ldr r0, _022024C4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0220249A
	ldr r0, _022024C0 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	pop {r4, pc}
_0220249A:
	add r0, r4, #0
	add r0, #0x7a
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x7a
	ldrb r0, [r0]
	add r4, #0x7a
	sub r0, r0, #1
	strb r0, [r4]
	cmp r1, #0
	bne _022024BA
	ldr r0, _022024C0 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	pop {r4, pc}
_022024BA:
	mov r0, #0
	pop {r4, pc}
	nop
_022024C0: .word 0x000005DC
_022024C4: .word gSystem
_022024C8: .word 0x00000CF3
	thumb_func_end ov17_02202460

	thumb_func_start ov17_022024CC
ov17_022024CC: ; 0x022024CC
	push {r4, lr}
	add r4, r0, #0
	bl ov17_02202C4C
	add r0, r4, #0
	bl ov17_02202E28
	add r0, r4, #0
	bl ov17_02202F0C
	add r0, r4, #0
	bl ov17_02202FC4
	add r0, r4, #0
	bl ov17_02203030
	add r0, r4, #0
	bl ov17_02203278
	ldr r0, _022024FC ; =ov17_02202BF8
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	.balign 4, 0
_022024FC: .word ov17_02202BF8
	thumb_func_end ov17_022024CC

	thumb_func_start ov17_02202500
ov17_02202500: ; 0x02202500
	push {r4, lr}
	add r4, r0, #0
	bl ov17_02203290
	add r0, r4, #0
	bl ov17_02203084
	add r0, r4, #0
	bl ov17_02203004
	add r0, r4, #0
	bl ov17_02202F7C
	add r0, r4, #0
	bl ov17_02202EFC
	add r0, r4, #0
	bl ov17_02202DD0
	pop {r4, pc}
	thumb_func_end ov17_02202500

	thumb_func_start ov17_02202528
ov17_02202528: ; 0x02202528
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r1, #0
	bl ov17_02202850
	add r0, r4, #0
	bl ov17_022028B8
	add r0, r4, #0
	add r0, #0x7b
	ldrb r0, [r0]
	cmp r0, #0
	beq _02202580
	cmp r0, #1
	beq _0220254C
	cmp r0, #2
	beq _02202566
	b _02202580
_0220254C:
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #0xb
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #0
	bl ov17_02202910
	b _02202594
_02202566:
	add r2, r4, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #0xc
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #0
	bl ov17_02202910
	b _02202594
_02202580:
	add r0, r4, #0
	mov r1, #0
	mov r2, #4
	mov r3, #1
	bl ov17_02202944
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202910
_02202594:
	add r0, r4, #0
	mov r1, #0
	bl ov17_022037C8
	mov r5, #0
_0220259E:
	add r0, r4, #0
	add r1, r5, #0
	bl ov17_02203404
	add r0, r4, #0
	add r1, r5, #0
	bl ov17_02202A84
	add r5, r5, #1
	cmp r5, #4
	blt _0220259E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov17_02202528

	thumb_func_start ov17_022025B8
ov17_022025B8: ; 0x022025B8
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x72
	ldrh r1, [r1]
	cmp r1, #4
	bhi _02202662
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022025D2: ; jump table
	.short _022025DC - _022025D2 - 2 ; case 0
	.short _0220264C - _022025D2 - 2 ; case 1
	.short _022026A2 - _022025D2 - 2 ; case 2
	.short _02202718 - _022025D2 - 2 ; case 3
	.short _0220274E - _022025D2 - 2 ; case 4
_022025DC:
	add r0, #0x7c
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x80
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x81
	strb r1, [r0]
	add r1, #0x6d
	ldr r0, [r4, r1]
	add r1, r4, #0
	add r1, #0x80
	ldrb r2, [r1]
	mov r1, #0x1b
	mul r1, r2
	add r1, #0x1f
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	mov r2, #0x38
	bl sub_0200DD88
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #8
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024964
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x72
	ldrh r0, [r0]
	add r4, #0x72
	add r0, r0, #1
	strh r0, [r4]
	b _02202792
_0220264C:
	add r0, #0x7f
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x7f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x7f
	strb r1, [r0]
	cmp r2, #0xf
	bhs _02202664
_02202662:
	b _02202792
_02202664:
	ldr r0, _02202798 ; =0x00000889
	bl PlaySE
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024964
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #9
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x72
	ldrh r0, [r0]
	add r4, #0x72
	add r0, r0, #1
	strh r0, [r4]
	b _02202792
_022026A2:
	add r1, r4, #0
	add r1, #0x7f
	ldrb r3, [r1]
	add r1, r4, #0
	add r1, #0x7f
	ldrb r1, [r1]
	add r2, r1, #1
	add r1, r4, #0
	add r1, #0x7f
	strb r2, [r1]
	cmp r3, #0
	bne _022026C4
	add r1, r4, #0
	add r1, #0x80
	ldrb r1, [r1]
	bl ov17_02202B58
_022026C4:
	add r0, r4, #0
	add r0, #0x7f
	ldrb r0, [r0]
	cmp r0, #0x1e
	bhs _022026D6
	add r0, r4, #0
	bl ov17_02203A54
	b _02202792
_022026D6:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x81
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _02202704
	ldr r0, _02202798 ; =0x00000889
	mov r1, #2
	bl StopSE
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #8
	bl Set2dSpriteAnimSeqNo
	mov r0, #4
	add r4, #0x72
	strh r0, [r4]
	b _02202792
_02202704:
	add r0, r4, #0
	bl ov17_0220351C
	add r0, r4, #0
	add r0, #0x72
	ldrh r0, [r0]
	add r4, #0x72
	add r0, r0, #1
	strh r0, [r4]
	b _02202792
_02202718:
	add r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02202792
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x81
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x80
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x81
	strb r1, [r0]
	add r1, #0x69
	ldr r0, [r4, r1]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #2
	add r4, #0x72
	strh r0, [r4]
	b _02202792
_0220274E:
	add r1, r4, #0
	add r1, #0x7f
	ldrb r3, [r1]
	add r1, r4, #0
	add r1, #0x7f
	ldrb r1, [r1]
	add r2, r1, #1
	add r1, r4, #0
	add r1, #0x7f
	strb r2, [r1]
	cmp r3, #0xf
	blo _02202792
	bl ov17_0220387C
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7f
	strb r1, [r0]
	add r4, #0x72
	strh r1, [r4]
	mov r0, #1
	pop {r4, pc}
_02202792:
	mov r0, #0
	pop {r4, pc}
	nop
_02202798: .word 0x00000889
	thumb_func_end ov17_022025B8

	thumb_func_start ov17_0220279C
ov17_0220279C: ; 0x0220279C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x72
	ldrh r1, [r1]
	cmp r1, #0
	beq _022027B4
	cmp r1, #1
	beq _022027EA
	cmp r1, #2
	beq _02202834
	b _0220284C
_022027B4:
	add r1, r4, #0
	add r1, #0x7c
	ldrb r1, [r1]
	bl ov17_02203460
	add r0, r4, #0
	add r0, #0x7c
	ldrb r1, [r0]
	mov r0, #0x14
	mul r0, r1
	add r0, r4, r0
	add r0, #0x25
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x7e
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x72
	ldrh r0, [r0]
	add r4, #0x72
	add r0, r0, #1
	strh r0, [r4]
	b _0220284C
_022027EA:
	add r1, r4, #0
	add r1, #0x7f
	ldrb r1, [r1]
	cmp r1, #0
	bne _0220280E
	bl ov17_02203638
	add r0, r4, #0
	add r0, #0x7e
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x7e
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #8
	add r0, #0x7f
	strb r1, [r0]
_0220280E:
	add r0, r4, #0
	add r0, #0x7f
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x7f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x7e
	ldrb r0, [r0]
	cmp r0, #0
	bne _0220284C
	add r0, r4, #0
	add r0, #0x72
	ldrh r0, [r0]
	add r4, #0x72
	add r0, r0, #1
	strh r0, [r4]
	b _0220284C
_02202834:
	add r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0220284C
	add r0, r4, #0
	mov r1, #0
	add r0, #0x7f
	strb r1, [r0]
	add r4, #0x72
	strh r1, [r4]
	mov r0, #1
	pop {r4, pc}
_0220284C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov17_0220279C

	thumb_func_start ov17_02202850
ov17_02202850: ; 0x02202850
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024964
	add r0, r4, #0
	add r0, #0xfc
	mov r1, #0
	bl FillWindowPixelBuffer
	add r1, r4, #0
	add r1, #0xa8
	ldr r1, [r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r1, #0
	add r3, r0, #0
	add r2, r4, #0
	mov r5, #0x30
	sub r3, r5, r3
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022028B4 ; =0x00010200
	add r2, #0xa8
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	ldr r2, [r2]
	add r0, #0xfc
	mov r1, #4
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	add r4, #0xfc
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022028B4: .word 0x00010200
	thumb_func_end ov17_02202850

	thumb_func_start ov17_022028B8
ov17_022028B8: ; 0x022028B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x7c
	ldrb r4, [r0]
	mov r0, #0x5a
	mov r1, #0x1b
	add r2, r4, #1
	mul r1, r2
	lsl r0, r0, #2
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0x60
	bl sub_0200DD88
	mov r0, #0x14
	mul r0, r4
	add r0, r5, r0
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #3
	bls _022028F2
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
_022028F2:
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_022028B8

	thumb_func_start ov17_02202900
ov17_02202900: ; 0x02202900
	mov r2, #0x5a
	lsl r2, r2, #2
	ldr r3, _0220290C ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, r2]
	bx r3
	nop
_0220290C: .word Set2dSpriteVisibleFlag
	thumb_func_end ov17_02202900

	thumb_func_start ov17_02202910
ov17_02202910: ; 0x02202910
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r6, r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r4, #0
_02202922:
	ldr r0, [r5, #0x30]
	cmp r0, #0
	beq _02202938
	add r1, r5, #0
	add r1, #0x21
	ldrb r1, [r1]
	cmp r1, #2
	blo _02202938
	add r1, r6, #0
	bl Set2dSpriteAnimActiveFlag
_02202938:
	add r4, r4, #1
	add r5, #0x14
	cmp r4, #4
	blt _02202922
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov17_02202910

	thumb_func_start ov17_02202944
ov17_02202944: ; 0x02202944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r5, r0, #0
	add r7, r3, #0
	str r2, [sp, #0x10]
	cmp r6, #0
	bne _02202958
	mov r0, #0x43
	b _0220295A
_02202958:
	mov r0, #0x47
_0220295A:
	lsl r0, r0, #2
	add r4, r5, r0
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	cmp r7, #0
	beq _02202994
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	mov r1, #0
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	add r0, #0x88
	ldr r0, [r0]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xd
	bl DrawFrameAndWindow2
_02202994:
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	bl ov17_022036FC
	mov r3, #0
	add r2, r5, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r2, #0xa4
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #0x3c
	add r5, #0x7a
	strb r0, [r5]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov17_02202944

	thumb_func_start ov17_022029C8
ov17_022029C8: ; 0x022029C8
	push {r4, r5, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r0, _02202A48 ; =ov17_02203D60
	add r2, sp, #0xc
	ldrh r3, [r0, #0xc]
	add r1, sp, #0xc
	strh r3, [r2]
	ldrh r3, [r0, #0xe]
	strh r3, [r2, #2]
	ldrh r3, [r0, #0x10]
	strh r3, [r2, #4]
	ldrh r3, [r0, #0x12]
	strh r3, [r2, #6]
	ldrh r3, [r0, #0x14]
	ldrh r0, [r0, #0x16]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	lsl r0, r4, #2
	add r3, r5, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	lsl r3, r4, #3
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	str r0, [sp, #0x1c]
	ldr r0, _02202A4C ; =ov17_02203E88
	ldr r0, [r0, r3]
	mov r3, #0xf
	strb r0, [r2, #0x14]
	ldrb r2, [r2, #0x14]
	lsl r0, r2, #1
	add r2, r2, r0
	mov r0, #0x10
	sub r0, r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x74]
	add r0, #0x8c
	lsl r2, r2, #0x18
	ldr r0, [r0]
	lsr r2, r2, #0x18
	bl sub_020185FC
	mov r1, #0x6a
	lsl r1, r1, #2
	str r0, [r5, r1]
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_02202A48: .word ov17_02203D60
_02202A4C: .word ov17_02203E88
	thumb_func_end ov17_022029C8

	thumb_func_start ov17_02202A50
ov17_02202A50: ; 0x02202A50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020186A4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02202A80
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02018674
	str r0, [r5, #0x74]
	mov r0, #0x6a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02018680
	add r0, r4, #0
_02202A80:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov17_02202A50

	thumb_func_start ov17_02202A84
ov17_02202A84: ; 0x02202A84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r1, #0
	add r5, r0, #0
	mov r0, #0x14
	add r7, r6, #0
	mul r7, r0
	add r0, r5, #0
	add r0, #0x20
	add r4, r0, r7
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _02202AA8
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02202AA8
	bl sub_02024758
_02202AA8:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _02202AC8
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r6, #3
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	bl sub_020249D4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_02202AC8:
	ldr r0, _02202B54 ; =ov17_02203EA8
	add r1, sp, #0
	mov r2, #0x28
	bl MI_CpuCopy8
	add r0, r6, #1
	mov r1, #0x1b
	add r2, r0, #0
	mul r2, r1
	add r1, sp, #0
	strh r2, [r1, #4]
	ldrb r2, [r4, #1]
	cmp r2, #1
	beq _02202AEA
	cmp r2, #2
	beq _02202AF0
	b _02202AF6
_02202AEA:
	mov r0, #5
	strh r0, [r1, #0xa]
	b _02202AFE
_02202AF0:
	mov r0, #6
	strh r0, [r1, #0xa]
	b _02202AFE
_02202AF6:
	str r0, [sp]
	ldrb r0, [r4, #1]
	sub r0, r0, #3
	strh r0, [r1, #0xa]
_02202AFE:
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl sub_0200D2B4
	str r0, [r4, #0x10]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldrb r0, [r4, #1]
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _02202B32
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r1, r5, r7
	add r1, #0x2a
	ldrb r1, [r1]
	ldr r0, [r4, #0x10]
	bl sub_020249D4
	b _02202B38
_02202B32:
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
_02202B38:
	add r0, r6, #3
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r5, r7
	add r1, #0x2a
	ldrb r1, [r1]
	bl sub_020249D4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02202B54: .word ov17_02203EA8
	thumb_func_end ov17_02202A84

	thumb_func_start ov17_02202B58
ov17_02202B58: ; 0x02202B58
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r2, r5, #0
	add r6, r1, #0
	mov r0, #0x14
	add r2, #0x20
	mul r0, r6
	add r4, r2, r0
	ldr r0, [r5, #0x14]
	bl ov16_02201644
	add r0, r5, #0
	bl ov17_0220387C
	add r0, r6, #3
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	bl sub_020249D4
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _02202B94
	ldrb r1, [r4, #0xa]
	ldr r0, [r4, #0x10]
	bl sub_020249D4
_02202B94:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov17_02202B58

	thumb_func_start ov17_02202B98
ov17_02202B98: ; 0x02202B98
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x7c
	ldrb r1, [r0]
	add r6, r5, #0
	mov r0, #0x14
	add r7, r1, #0
	mul r7, r0
	add r6, #0x20
	ldr r0, [r5, #0x14]
	add r4, r6, r7
	bl ov16_02201674
	ldrb r0, [r6, r7]
	bl ov16_022018B4
	add r1, r0, #0
	ldrb r2, [r4, #5]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	bl Bag_AddItem
	add r0, r5, #0
	bl ov17_0220387C
	ldr r0, [r4, #0x10]
	bl sub_02024758
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r0, #0x7c
	ldrb r0, [r0]
	add r0, r0, #3
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	bl sub_020249D4
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl GameStats_AddSpecial
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov17_02202B98

	thumb_func_start ov17_02202BF8
ov17_02202BF8: ; 0x02202BF8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02202C0A
	bl sub_0200D034
_02202C0A:
	bl NNS_GfdDoVramTransfer
	add r4, #0x88
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02202C24 ; =0x027E0000
	ldr r1, _02202C28 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_02202C24: .word 0x027E0000
_02202C28: .word 0x00003FF8
	thumb_func_end ov17_02202BF8

	thumb_func_start ov17_02202C2C
ov17_02202C2C: ; 0x02202C2C
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02202C48 ; =ov17_02203ED0
	add r3, sp, #0
	mov r2, #5
_02202C36:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02202C36
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_02202C48: .word ov17_02203ED0
	thumb_func_end ov17_02202C2C

	thumb_func_start ov17_02202C4C
ov17_02202C4C: ; 0x02202C4C
	push {r4, r5, lr}
	sub sp, #0x9c
	add r4, r0, #0
	bl ov17_02202C2C
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r1, r4, #0
	add r1, #0x88
	add r3, sp, #0x8c
	ldr r5, _02202DB0 ; =ov17_02203D88
	str r0, [r1]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r2, _02202DB4 ; =0x04000304
	ldr r0, _02202DB8 ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _02202DBC ; =ov17_02203E30
	add r3, sp, #0x70
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
	mov r1, #4
	str r0, [r3]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02202DC0 ; =ov17_02203DDC
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
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02202DC4 ; =ov17_02203DF8
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #0
	str r0, [r3]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02202DC8 ; =ov17_02203E14
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02202DCC ; =ov17_02203E4C
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
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r3, [r4]
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #7
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	mov r0, #0
	ldr r3, [r4]
	mov r1, #0x20
	add r2, r0, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r3, [r4]
	mov r0, #3
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	add sp, #0x9c
	pop {r4, r5, pc}
	.balign 4, 0
_02202DB0: .word ov17_02203D88
_02202DB4: .word 0x04000304
_02202DB8: .word 0xFFFF7FFF
_02202DBC: .word ov17_02203E30
_02202DC0: .word ov17_02203DDC
_02202DC4: .word ov17_02203DF8
_02202DC8: .word ov17_02203E14
_02202DCC: .word ov17_02203E4C
	thumb_func_end ov17_02202C4C

	thumb_func_start ov17_02202DD0
ov17_02202DD0: ; 0x02202DD0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #3
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #7
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r4, #0x88
	ldr r0, [r4]
	bl FreeToHeap
	ldr r2, _02202E24 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_02202E24: .word 0x04000304
	thumb_func_end ov17_02202DD0

	thumb_func_start ov17_02202E28
ov17_02202E28: ; 0x02202E28
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xda
	bl NARC_ctor
	mov r2, #0
	str r2, [sp]
	ldr r1, [r5]
	add r3, r2, #0
	str r1, [sp, #4]
	mov r1, #3
	add r4, r0, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0x88
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #4
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0x88
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #5
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r1, #0
	str r1, [sp]
	ldr r0, [r5]
	mov r2, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0x88
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #1
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0x88
	ldr r2, [r2]
	add r0, r4, #0
	mov r1, #2
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x65
	lsl r0, r0, #2
	str r4, [r5, r0]
	add r0, r5, #0
	add r0, #0x79
	ldrb r0, [r0]
	mov r1, #0
	mov r2, #1
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #0xd
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	bl LoadUserFrameGfx2
	mov r1, #6
	ldr r2, [r5]
	mov r0, #0
	lsl r1, r1, #6
	bl LoadFontPal1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02202E28

	thumb_func_start ov17_02202EFC
ov17_02202EFC: ; 0x02202EFC
	mov r1, #0x65
	lsl r1, r1, #2
	ldr r3, _02202F08 ; =NARC_dtor
	ldr r0, [r0, r1]
	bx r3
	nop
_02202F08: .word NARC_dtor
	thumb_func_end ov17_02202EFC

	thumb_func_start ov17_02202F0C
ov17_02202F0C: ; 0x02202F0C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r1, [r6]
	mov r0, #4
	bl FontID_Alloc
	ldr r3, [r6]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xf8
	bl NewMsgDataFromNarc
	add r1, r6, #0
	add r1, #0x9c
	str r0, [r1]
	mov r0, #0x10
	ldr r2, [r6]
	add r1, r0, #0
	bl ScrStrBufs_new_custom
	add r1, r6, #0
	add r1, #0xa0
	str r0, [r1]
	ldr r1, [r6]
	mov r0, #0x80
	bl String_ctor
	add r1, r6, #0
	add r1, #0xa4
	str r0, [r1]
	add r0, r6, #0
	add r0, #0x9c
	ldr r0, [r0]
	mov r1, #0
	bl NewString_ReadMsgData
	add r1, r6, #0
	add r1, #0xa8
	str r0, [r1]
	mov r4, #0
	add r5, r6, #0
_02202F5E:
	add r0, r6, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r1, r4, #6
	bl NewString_ReadMsgData
	add r1, r5, #0
	add r1, #0xb0
	add r4, r4, #1
	add r5, r5, #4
	str r0, [r1]
	cmp r4, #0x11
	blt _02202F5E
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov17_02202F0C

	thumb_func_start ov17_02202F7C
ov17_02202F7C: ; 0x02202F7C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02202F84:
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x11
	blt _02202F84
	add r0, r6, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl String_dtor
	add r0, r6, #0
	add r0, #0xa4
	ldr r0, [r0]
	bl String_dtor
	add r0, r6, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl ScrStrBufs_delete
	add r6, #0x9c
	ldr r0, [r6]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_02202F7C

	thumb_func_start ov17_02202FC4
ov17_02202FC4: ; 0x02202FC4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _02203000 ; =ov17_02203DC4
	mov r6, #0
	add r5, #0xfc
_02202FD0:
	add r0, r7, #0
	add r0, #0x88
	ldr r0, [r0]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #3
	blt _02202FD0
	ldr r0, [r7]
	bl sub_0201660C
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r7, r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02203000: .word ov17_02203DC4
	thumb_func_end ov17_02202FC4

	thumb_func_start ov17_02203004
ov17_02203004: ; 0x02203004
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r4, #0
	add r5, #0xfc
_0220300E:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	blt _0220300E
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_02016624
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov17_02203004

	thumb_func_start ov17_02203030
ov17_02203030: ; 0x02203030
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0
	ldr r5, _02203080 ; =ov17_02203E88
	str r0, [sp]
	add r6, r7, #0
_0220303C:
	ldr r0, [r5]
	ldr r1, [r7]
	bl ListMenuItems_ctor
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, [r5]
	mov r4, #0
	cmp r0, #0
	ble _02203070
_02203052:
	ldr r2, [r5, #4]
	mov r0, #0x66
	add r1, r7, #0
	lsl r0, r0, #2
	add r1, #0x9c
	ldrb r2, [r2, r4]
	ldr r0, [r6, r0]
	ldr r1, [r1]
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	ldr r0, [r5]
	add r4, r4, #1
	cmp r4, r0
	blt _02203052
_02203070:
	ldr r0, [sp]
	add r5, #8
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp]
	cmp r0, #4
	blt _0220303C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02203080: .word ov17_02203E88
	thumb_func_end ov17_02203030

	thumb_func_start ov17_02203084
ov17_02203084: ; 0x02203084
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, #0x66
	add r5, r0, #0
	add r6, r4, #0
	lsl r7, r7, #2
_02203090:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	str r6, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02203090
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov17_02203084

	thumb_func_start ov17_022030A8
ov17_022030A8: ; 0x022030A8
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r4]
	bl sub_0200CF18
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _0220320C ; =ov17_02203E68
	ldr r2, _02203210 ; =ov17_02203D98
	mov r3, #8
	bl sub_0200CF70
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200CF38
	mov r1, #0x4d
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x19
	bl sub_0200CFF4
	mov r3, #0
	mov r1, #0x13
	str r3, [sp]
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _02203214 ; =ov17_02203D78
	bl sub_0200D2A4
	ldr r1, [r4]
	mov r0, #0x12
	bl NARC_ctor
	mov r2, #0x19
	lsl r2, r2, #4
	str r0, [r4, r2]
	ldr r5, _02203218 ; =ov17_02203DAC
	add r3, sp, #0x10
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	sub r2, #0x60
	stmia r3!, {r0, r1}
	ldr r0, [r4, r2]
	bl sub_0200CF38
	mov r1, #0x4e
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, sp, #0x10
	bl sub_0200D3F8
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200E2B0
	add r1, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200E2B4
	mov r0, #0x95
	mov r1, #1
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	mov r2, #0x13
	str r0, [sp, #4]
	mov r0, #0xfa
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r1, r2, #0
	str r0, [sp, #8]
	ldr r0, [r4, r2]
	add r1, #8
	add r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0200D504
	mov r0, #0x95
	mov r1, #2
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r2, #0x13
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r1, r2, #0
	str r0, [sp, #0xc]
	ldr r0, [r4, r2]
	add r1, #8
	add r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0200D5D4
	bl GetItemIconCell
	add r3, r0, #0
	mov r0, #0
	mov r2, #0x13
	str r0, [sp]
	mov r0, #0xfa
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r4, r2]
	add r1, #8
	add r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0200D6EC
	bl GetItemIconAnim
	add r3, r0, #0
	mov r0, #0
	mov r2, #0x13
	str r0, [sp]
	mov r0, #0xfa
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r4, r2]
	add r1, #8
	add r2, #0x60
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl sub_0200D71C
	ldr r0, [r4]
	mov r1, #0
	bl sub_02018424
	add r4, #0x8c
	str r0, [r4]
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0220320C: .word ov17_02203E68
_02203210: .word ov17_02203D98
_02203214: .word ov17_02203D78
_02203218: .word ov17_02203DAC
	thumb_func_end ov17_022030A8

	thumb_func_start ov17_0220321C
ov17_0220321C: ; 0x0220321C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl sub_02018474
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl NARC_dtor
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, #8
	ldr r1, [r4, r1]
	bl sub_0200D998
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D0E4
	mov r1, #0x4e
	lsl r1, r1, #2
	mov r2, #0
	str r2, [r4, r1]
	sub r0, r1, #4
	sub r1, #8
	str r2, [r4, r0]
	ldr r0, [r4, r1]
	bl sub_0200D108
	mov r0, #0x13
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov17_0220321C

	thumb_func_start ov17_02203278
ov17_02203278: ; 0x02203278
	push {r4, lr}
	add r4, r0, #0
	bl ov17_022030A8
	add r0, r4, #0
	bl ov17_022032AC
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	thumb_func_end ov17_02203278

	thumb_func_start ov17_02203290
ov17_02203290: ; 0x02203290
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov17_022033E4
	add r0, r4, #0
	bl ov17_0220321C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov17_02203290

	thumb_func_start ov17_022032AC
ov17_022032AC: ; 0x022032AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r6, _022033D4 ; =ov17_02203EF8
	mov r7, #0
	add r5, r4, #0
_022032B6:
	mov r0, #0x13
	mov r1, #0x4d
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r6, #0
	bl sub_0200D2B4
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r7, r7, #1
	add r6, #0x28
	add r5, r5, #4
	cmp r7, #1
	ble _022032B6
	mov r1, #0x13
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _022033D8 ; =ov17_02203F48
	bl sub_0200D2B4
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r6, #0
	add r7, r6, #0
	str r4, [sp]
_0220331E:
	add r0, r6, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r5, r4, r0
	mov r0, #0x13
	mov r1, #0x4d
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _022033DC ; =ov17_02203F70
	bl sub_0200D2B4
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	add r1, r7, #0
	add r1, #0x1b
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0x63
	bl sub_0200DD88
	ldr r1, [sp]
	mov r0, #0x59
	add r1, #0x2a
	lsl r0, r0, #2
	ldrb r1, [r1]
	ldr r0, [r5, r0]
	bl sub_020249D4
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r6, #7
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r5, r4, r0
	mov r0, #0x13
	mov r1, #0x4d
	lsl r0, r0, #4
	lsl r1, r1, #2
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	ldr r2, _022033E0 ; =ov17_02203F98
	bl sub_0200D2B4
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #0
	add r1, r7, #0
	add r1, #0x1b
	lsl r1, r1, #0x10
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	mov r2, #0x58
	bl sub_0200DD88
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [sp]
	add r6, r6, #1
	add r0, #0x14
	add r7, #0x1b
	str r0, [sp]
	cmp r6, #4
	blt _0220331E
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022033D4: .word ov17_02203EF8
_022033D8: .word ov17_02203F48
_022033DC: .word ov17_02203F70
_022033E0: .word ov17_02203F98
	thumb_func_end ov17_022032AC

	thumb_func_start ov17_022033E4
ov17_022033E4: ; 0x022033E4
	push {r4, r5, r6, lr}
	mov r6, #0x59
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_022033EE:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _022033F8
	bl sub_02024758
_022033F8:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _022033EE
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov17_022033E4

	thumb_func_start ov17_02203404
ov17_02203404: ; 0x02203404
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x14
	mul r0, r6
	add r0, r5, r0
	add r0, #0x20
	ldrb r4, [r0]
	cmp r4, #0
	beq _02203420
	sub r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02203420:
	mov r0, #0
	mov r2, #0x13
	str r0, [sp]
	add r0, r6, #1
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x64
	add r3, r4, #0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r3, #0x4c
	bl sub_0200E2B8
	mov r0, #0
	mov r2, #0x13
	str r0, [sp]
	add r0, r6, #1
	lsl r2, r2, #4
	str r0, [sp, #4]
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #0x64
	add r4, #0xc
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r3, r4, #0
	bl sub_0200E2EC
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_02203404

	thumb_func_start ov17_02203460
ov17_02203460: ; 0x02203460
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x14
	mul r0, r1
	add r0, r5, r0
	add r0, #0x20
	ldrb r0, [r0]
	bl ov16_022018B4
	mov r1, #1
	add r4, r0, #0
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	mov r2, #0x13
	str r0, [sp]
	mov r0, #0xfa
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r1, #8
	add r2, #0x60
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200E2B8
	add r0, r4, #0
	mov r1, #2
	bl GetItemIndexMapping
	add r3, r0, #0
	mov r0, #0
	mov r2, #0x13
	str r0, [sp]
	mov r0, #0xfa
	lsl r2, r2, #4
	lsl r0, r0, #4
	add r1, r2, #0
	str r0, [sp, #4]
	ldr r0, [r5, r2]
	add r1, #8
	add r2, #0x60
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl sub_0200E2EC
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02203460

	thumb_func_start ov17_022034C8
ov17_022034C8: ; 0x022034C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	add r0, sp, #0
	strh r4, [r0]
	strh r6, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #2
	str r0, [sp, #0x2c]
	mov r0, #0xfa
	lsl r0, r0, #4
	str r1, [sp, #0xc]
	str r1, [sp, #0x30]
	mov r1, #1
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	sub r0, r1, #2
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r0, [r5, r1]
	add r1, #8
	ldr r1, [r5, r1]
	add r2, sp, #0
	bl sub_0200D734
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov17_022034C8

	thumb_func_start ov17_0220351C
ov17_0220351C: ; 0x0220351C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r5, [r4]
	add r0, #0x80
	ldrb r0, [r0]
	strb r0, [r4, #6]
	add r0, r5, #0
	add r0, #0x81
	ldrb r0, [r0]
	strb r0, [r4, #7]
	add r0, r5, #0
	add r0, #0x81
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x80
	ldrb r0, [r0]
	sub r0, r1, r0
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	cmp r1, #0
	ble _02203560
	mov r0, #1
	strb r0, [r4, #9]
	b _0220356C
_02203560:
	mov r0, #0
	mvn r0, r0
	strb r0, [r4, #9]
	neg r0, r1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
_0220356C:
	mov r0, #0x1b
	mul r0, r1
	lsl r0, r0, #0x18
	asr r1, r0, #0x18
	asr r0, r1, #1
	lsr r0, r0, #0x1e
	add r0, r1, r0
	asr r0, r0, #2
	strb r0, [r4, #8]
	add r0, r5, #0
	add r0, #0x80
	ldrb r0, [r0]
	add r1, r4, #0
	mov r2, #0
	strb r0, [r4, #0xa]
	ldr r0, _022035A0 ; =ov17_022035A4
	bl CreateSysTask
	add r0, r5, #0
	add r0, #0x7d
	ldrb r0, [r0]
	add r5, #0x7d
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_022035A0: .word ov17_022035A4
	thumb_func_end ov17_0220351C

	thumb_func_start ov17_022035A4
ov17_022035A4: ; 0x022035A4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #9
	ldrsb r1, [r5, r1]
	add r7, r0, #0
	mov r0, #0x5b
	lsl r1, r1, #0x12
	ldr r4, [r5]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	mov r2, #0
	bl sub_0200DEA0
	mov r0, #0x5b
	lsl r0, r0, #2
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	mov r1, #0x1b
	sub r0, #0x1f
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldrb r0, [r5, #0xa]
	cmp r6, r0
	beq _022035F8
	ldrb r0, [r5, #7]
	cmp r6, r0
	beq _022035F8
	add r0, r4, #0
	add r1, r6, #0
	bl ov17_02202B58
	strb r6, [r5, #0xa]
_022035F8:
	ldrb r0, [r5, #8]
	sub r0, r0, #1
	strb r0, [r5, #8]
	ldrb r0, [r5, #8]
	cmp r0, #0
	bne _02203634
	ldrb r2, [r5, #7]
	mov r1, #0x1b
	mov r0, #0x5b
	mul r1, r2
	lsl r0, r0, #2
	add r1, #0x1f
	lsl r1, r1, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	mov r2, #0x38
	bl sub_0200DD88
	add r0, r4, #0
	add r0, #0x7d
	ldrb r0, [r0]
	add r4, #0x7d
	sub r0, r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
_02203634:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov17_022035A4

	thumb_func_start ov17_02203638
ov17_02203638: ; 0x02203638
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r5, [r4]
	add r0, #0x7c
	ldrb r0, [r0]
	add r1, r4, #0
	mov r2, #0
	strb r0, [r4, #6]
	ldr r0, _02203670 ; =ov17_02203674
	bl CreateSysTask
	add r0, r5, #0
	add r0, #0x7d
	ldrb r0, [r0]
	add r5, #0x7d
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02203670: .word ov17_02203674
	thumb_func_end ov17_02203638

	thumb_func_start ov17_02203674
ov17_02203674: ; 0x02203674
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5, #4]
	ldr r4, [r5]
	cmp r0, #0
	beq _0220368C
	cmp r0, #1
	beq _022036BA
	cmp r0, #2
	beq _022036D6
	pop {r4, r5, r6, pc}
_0220368C:
	add r0, r4, #0
	add r4, #0x7e
	ldrb r3, [r4]
	ldrb r2, [r5, #6]
	mov r1, #0x1b
	add r3, r3, #2
	mul r1, r2
	add r1, #0x23
	lsl r1, r1, #0x10
	lsl r3, r3, #0x18
	asr r1, r1, #0x10
	mov r2, #0x50
	lsr r3, r3, #0x18
	bl ov17_022034C8
	str r0, [r5, #8]
	ldr r0, _022036F8 ; =0x000005DD
	bl PlaySE
	ldrb r0, [r5, #4]
	add r0, r0, #1
	strb r0, [r5, #4]
	pop {r4, r5, r6, pc}
_022036BA:
	mov r1, #2
	ldr r0, [r5, #8]
	sub r2, r1, #4
	bl sub_0200DED0
	ldrb r1, [r5, #5]
	add r0, r1, #1
	strb r0, [r5, #5]
	cmp r1, #8
	blo _022036F4
	ldrb r0, [r5, #4]
	add r0, r0, #1
	strb r0, [r5, #4]
	pop {r4, r5, r6, pc}
_022036D6:
	ldr r0, [r5, #8]
	bl sub_0200D9DC
	add r0, r4, #0
	add r0, #0x7d
	ldrb r0, [r0]
	add r4, #0x7d
	sub r0, r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_022036F4:
	pop {r4, r5, r6, pc}
	nop
_022036F8: .word 0x000005DD
	thumb_func_end ov17_02203674

	thumb_func_start ov17_022036FC
ov17_022036FC: ; 0x022036FC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	add r1, r4, #0
	mov r0, #0x14
	add r1, #0x20
	mul r0, r2
	add r6, r1, r0
	cmp r5, #0x10
	bhi _02203794
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0220371E: ; jump table
	.short _02203794 - _0220371E - 2 ; case 0
	.short _02203794 - _0220371E - 2 ; case 1
	.short _02203794 - _0220371E - 2 ; case 2
	.short _02203794 - _0220371E - 2 ; case 3
	.short _02203794 - _0220371E - 2 ; case 4
	.short _02203740 - _0220371E - 2 ; case 5
	.short _0220376C - _0220371E - 2 ; case 6
	.short _0220376C - _0220371E - 2 ; case 7
	.short _0220376C - _0220371E - 2 ; case 8
	.short _0220376C - _0220371E - 2 ; case 9
	.short _02203756 - _0220371E - 2 ; case 10
	.short _02203740 - _0220371E - 2 ; case 11
	.short _0220376C - _0220371E - 2 ; case 12
	.short _02203794 - _0220371E - 2 ; case 13
	.short _02203756 - _0220371E - 2 ; case 14
	.short _0220376C - _0220371E - 2 ; case 15
	.short _0220376C - _0220371E - 2 ; case 16
_02203740:
	ldrb r0, [r6, #4]
	bl ov16_022018D4
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #2
	bl BufferItemName
	b _022037AA
_02203756:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xa0
	ldrb r2, [r6, #5]
	ldr r0, [r0]
	mov r1, #1
	mov r3, #2
	bl BufferIntegerAsString
_0220376C:
	ldrb r0, [r6]
	ldr r1, [r4]
	bl GetNutName
	mov r1, #0
	add r6, r0, #0
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r2, r6, #0
	add r3, r1, #0
	bl BufferString
	add r0, r6, #0
	bl String_dtor
	b _022037AA
_02203794:
	lsl r1, r5, #2
	add r0, r4, #0
	add r1, r4, r1
	add r0, #0xa4
	add r1, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl StringCopy
	add sp, #8
	pop {r4, r5, r6, pc}
_022037AA:
	lsl r2, r5, #2
	add r0, r4, #0
	add r1, r4, #0
	add r2, r4, r2
	add r0, #0xa0
	add r1, #0xa4
	add r2, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	bl StringExpandPlaceholders
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov17_022036FC

	thumb_func_start ov17_022037C8
ov17_022037C8: ; 0x022037C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r4, r0, #0
	add r7, r1, #0
	add r0, sp, #0x38
	add r1, sp, #0x1c
	bl GF_RTC_CopyDateTime
	add r0, sp, #0x38
	add r1, sp, #0x1c
	bl RTC_ConvertDateTimeToSecond
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, [r4, #0x18]
	add r1, sp, #0x28
	add r2, sp, #0x10
	bl ov16_02201820
	add r0, sp, #0x28
	add r1, sp, #0x10
	bl RTC_ConvertDateTimeToSecond
	sub r2, r5, r0
	mov ip, r6
	mov r2, ip
	sbc r2, r1
	bge _02203828
	add r2, sp, #0x1c
	ldmia r2!, {r0, r1}
	add r3, sp, #4
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	mov r5, sp
	sub r5, #0xc
	str r0, [r3]
	add r3, sp, #0x38
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x18]
	ldmia r5!, {r1, r2, r3}
	bl ov16_022017FC
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
_02203828:
	sub r0, r5, r0
	sbc r6, r1
	add r1, r6, #0
	mov r2, #0x3c
	mov r3, #0
	bl _ll_sdiv
	add r2, r0, #0
	beq _02203876
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x1c]
	bl ov16_02201760
	add r0, r4, #0
	bl ov17_0220387C
	add r2, sp, #0x1c
	mov r5, sp
	ldmia r2!, {r0, r1}
	add r3, sp, #4
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	sub r5, #0xc
	str r0, [r3]
	add r3, sp, #0x38
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x18]
	ldmia r5!, {r1, r2, r3}
	bl ov16_022017FC
	cmp r7, #0
	beq _02203876
	add r0, r4, #0
	bl ov17_02203928
_02203876:
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov17_022037C8

	thumb_func_start ov17_0220387C
ov17_0220387C: ; 0x0220387C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02203884:
	add r0, r5, #0
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2b
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x21
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2c
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x2a
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2d
	strb r1, [r0]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_022015BC
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_022015B0
	add r1, r5, #0
	add r1, #0x21
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_022015EC
	add r1, r5, #0
	add r1, #0x22
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_022015E0
	add r1, r5, #0
	add r1, #0x23
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_02201650
	add r1, r5, #0
	add r1, #0x24
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_02201668
	add r1, r5, #0
	add r1, #0x25
	strb r0, [r1]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_022015F8
	strh r0, [r5, #0x26]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_02201604
	strh r0, [r5, #0x28]
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	bl ov16_022015C4
	add r1, r5, #0
	add r1, #0x2a
	add r4, r4, #1
	add r5, #0x14
	strb r0, [r1]
	cmp r4, #4
	blt _02203884
	pop {r4, r5, r6, pc}
	thumb_func_end ov17_0220387C

	thumb_func_start ov17_02203928
ov17_02203928: ; 0x02203928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r7, r0, #0
	str r0, [sp]
	mov r6, #0
	add r4, #0x20
	add r5, r0, #0
	add r7, #0x7d
_0220393A:
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xd]
	cmp r1, r0
	beq _0220395A
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_020249D4
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _0220395A
	ldrb r1, [r4, #0xa]
	ldr r0, [r4, #0x10]
	bl sub_020249D4
_0220395A:
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	beq _0220398E
	ldr r0, [sp]
	mov r1, #8
	ldr r0, [r0]
	bl AllocFromHeap
	str r0, [sp, #4]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r1, [sp]
	ldr r0, [sp, #4]
	mov r2, #0
	str r1, [r0]
	strb r6, [r0, #4]
	ldr r0, _0220399C ; =ov17_022039A0
	ldr r1, [sp, #4]
	bl CreateSysTask
	ldrb r0, [r7]
	add r0, r0, #1
	strb r0, [r7]
_0220398E:
	add r6, r6, #1
	add r4, #0x14
	add r5, r5, #4
	cmp r6, #4
	blt _0220393A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0220399C: .word ov17_022039A0
	thumb_func_end ov17_02203928

	thumb_func_start ov17_022039A0
ov17_022039A0: ; 0x022039A0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5, #6]
	ldr r4, [r5]
	cmp r0, #0
	beq _022039B4
	cmp r0, #1
	beq _022039D6
	pop {r4, r5, r6, pc}
_022039B4:
	ldrb r0, [r5, #4]
	add r0, r0, #7
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, _02203A30 ; =0x00000569
	bl PlaySE
	ldrb r0, [r5, #6]
	add r0, r0, #1
	strb r0, [r5, #6]
	pop {r4, r5, r6, pc}
_022039D6:
	ldrb r1, [r5, #5]
	add r0, r1, #1
	strb r0, [r5, #5]
	cmp r1, #0xf
	bne _022039FA
	ldrb r1, [r5, #4]
	add r0, r4, #0
	bl ov17_02202A84
	add r0, r4, #0
	add r0, #0x7c
	ldrb r1, [r0]
	ldrb r0, [r5, #4]
	cmp r1, r0
	bne _022039FA
	add r0, r4, #0
	bl ov17_022028B8
_022039FA:
	ldrb r0, [r5, #5]
	cmp r0, #0x1e
	blo _02203A2C
	ldrb r0, [r5, #4]
	add r0, r0, #7
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	add r0, #0x7d
	ldrb r0, [r0]
	add r4, #0x7d
	sub r0, r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_02203A2C:
	pop {r4, r5, r6, pc}
	nop
_02203A30: .word 0x00000569
	thumb_func_end ov17_022039A0

	thumb_func_start ov17_02203A34
ov17_02203A34: ; 0x02203A34
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov17_02203B68
	ldr r1, [sp]
	cmp r1, #0
	bne _02203A50
	add r0, r4, #0
	bl ov17_02203AD4
_02203A50:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov17_02203A34

	thumb_func_start ov17_02203A54
ov17_02203A54: ; 0x02203A54
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov17_02203C20
	ldr r1, [sp]
	cmp r1, #0
	bne _02203A70
	add r0, r4, #0
	bl ov17_02203B88
_02203A70:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov17_02203A54

	thumb_func_start ov17_02203A74
ov17_02203A74: ; 0x02203A74
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #5
	bhi _02203AB0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02203A88: ; jump table
	.short _02203A94 - _02203A88 - 2 ; case 0
	.short _02203A94 - _02203A88 - 2 ; case 1
	.short _02203A94 - _02203A88 - 2 ; case 2
	.short _02203A94 - _02203A88 - 2 ; case 3
	.short _02203AA2 - _02203A88 - 2 ; case 4
	.short _02203AB0 - _02203A88 - 2 ; case 5
_02203A94:
	ldr r0, _02203AD0 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov17_022028B8
	b _02203ACC
_02203AA2:
	add r4, #0x7d
	ldrb r1, [r4]
	cmp r1, #0
	bne _02203ACC
	bl ov17_02203D00
	pop {r4, pc}
_02203AB0:
	add r0, r4, #0
	add r0, #0x7d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02203ACC
	ldr r0, _02203AD0 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	bl ov17_02202850
	mov r0, #1
	pop {r4, pc}
_02203ACC:
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_02203AD0: .word 0x000005DC
	thumb_func_end ov17_02203A74

	thumb_func_start ov17_02203AD4
ov17_02203AD4: ; 0x02203AD4
	push {r4, lr}
	ldr r1, _02203B60 ; =gSystem
	mov r3, #0
	ldr r2, [r1, #0x48]
	ldr r1, _02203B64 ; =0x00000CF3
	tst r1, r2
	beq _02203AE4
	str r3, [r0, #0x74]
_02203AE4:
	ldr r1, _02203B60 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #2
	tst r1, r2
	beq _02203AF6
	mov r1, #5
	bl ov17_02203A74
	pop {r4, pc}
_02203AF6:
	mov r1, #1
	add r4, r2, #0
	tst r4, r1
	beq _02203B06
	mov r1, #4
	bl ov17_02203A74
	pop {r4, pc}
_02203B06:
	mov r4, #0x20
	tst r4, r2
	beq _02203B2A
	add r2, r0, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r2, r2, #3
	lsr r4, r2, #0x1f
	lsl r3, r2, #0x1e
	sub r3, r3, r4
	mov r2, #0x1e
	ror r3, r2
	add r2, r0, #0
	add r3, r4, r3
	add r2, #0x7c
	strb r3, [r2]
	add r3, r1, #0
	b _02203B4C
_02203B2A:
	mov r4, #0x10
	tst r2, r4
	beq _02203B4C
	add r2, r0, #0
	add r2, #0x7c
	ldrb r2, [r2]
	add r2, r2, #1
	lsr r4, r2, #0x1f
	lsl r3, r2, #0x1e
	sub r3, r3, r4
	mov r2, #0x1e
	ror r3, r2
	add r2, r0, #0
	add r3, r4, r3
	add r2, #0x7c
	strb r3, [r2]
	add r3, r1, #0
_02203B4C:
	cmp r3, #0
	beq _02203B5C
	add r1, r0, #0
	add r1, #0x7c
	ldrb r1, [r1]
	bl ov17_02203A74
	pop {r4, pc}
_02203B5C:
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_02203B60: .word gSystem
_02203B64: .word 0x00000CF3
	thumb_func_end ov17_02203AD4

	thumb_func_start ov17_02203B68
ov17_02203B68: ; 0x02203B68
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov17_02203CC8
	add r1, r0, #0
	bpl _02203B7A
	mov r0, #2
	pop {r3, r4, r5, pc}
_02203B7A:
	mov r0, #1
	str r0, [r4]
	str r0, [r5, #0x74]
	add r0, r5, #0
	bl ov17_02203A74
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02203B68

	thumb_func_start ov17_02203B88
ov17_02203B88: ; 0x02203B88
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x81
	ldrb r1, [r1]
	mov r0, #0
	cmp r1, #0xff
	bne _02203C16
	ldr r1, _02203C18 ; =gSystem
	ldr r2, [r1, #0x48]
	ldr r1, _02203C1C ; =0x00000CF3
	tst r1, r2
	beq _02203BA4
	str r0, [r4, #0x74]
_02203BA4:
	ldr r1, _02203C18 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #0x20
	tst r1, r2
	beq _02203BCC
	add r0, r4, #0
	add r0, #0x7c
	ldrb r0, [r0]
	add r0, r0, #3
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r4, #0
	add r1, r2, r1
	add r0, #0x7c
	strb r1, [r0]
	mov r0, #1
	b _02203BEE
_02203BCC:
	mov r1, #0x10
	tst r1, r2
	beq _02203BEE
	add r0, r4, #0
	add r0, #0x7c
	ldrb r0, [r0]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r4, #0
	add r1, r2, r1
	add r0, #0x7c
	strb r1, [r0]
	mov r0, #1
_02203BEE:
	cmp r0, #0
	beq _02203C14
	add r0, r4, #0
	add r0, #0x7c
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x81
	strb r1, [r0]
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r4, #0
	bl ov17_022028B8
	mov r0, #1
	pop {r4, pc}
_02203C14:
	mov r0, #0
_02203C16:
	pop {r4, pc}
	.balign 4, 0
_02203C18: .word gSystem
_02203C1C: .word 0x00000CF3
	thumb_func_end ov17_02203B88

	thumb_func_start ov17_02203C20
ov17_02203C20: ; 0x02203C20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	add r1, #0x81
	ldrb r1, [r1]
	cmp r1, #0xff
	beq _02203C34
	mov r0, #0
	pop {r3, r4, r5, pc}
_02203C34:
	bl ov17_02203C78
	cmp r0, #0
	blt _02203C46
	add r1, r5, #0
	add r1, #0x7c
	ldrb r1, [r1]
	cmp r1, r0
	bne _02203C4A
_02203C46:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02203C4A:
	mov r1, #1
	str r1, [r4]
	str r1, [r5, #0x74]
	add r1, r5, #0
	add r1, #0x7c
	strb r0, [r1]
	add r0, r5, #0
	add r0, #0x7c
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x81
	strb r1, [r0]
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r0, r5, #0
	bl ov17_022028B8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov17_02203C20

	thumb_func_start ov17_02203C78
ov17_02203C78: ; 0x02203C78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #0
	mov r4, #0x10
	add r6, sp, #0
_02203C82:
	strb r4, [r6, #2]
	ldrb r0, [r6, #2]
	add r0, #0x16
	strb r0, [r6, #3]
	add r0, r5, #0
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #3
	bhs _02203C9E
	mov r0, #0x58
	strb r0, [r6]
	ldrb r0, [r6]
	add r0, #0x18
	b _02203CA6
_02203C9E:
	mov r0, #0x48
	strb r0, [r6]
	ldrb r0, [r6]
	add r0, #0x20
_02203CA6:
	strb r0, [r6, #1]
	add r0, sp, #0
	bl sub_02025320
	cmp r0, #0
	beq _02203CB6
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_02203CB6:
	add r7, r7, #1
	add r4, #0x1c
	add r5, #0x14
	cmp r7, #4
	blt _02203C82
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov17_02203C78

	thumb_func_start ov17_02203CC8
ov17_02203CC8: ; 0x02203CC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02203CFC ; =ov17_02203FC0
	bl sub_02025320
	cmp r0, #0
	beq _02203CDA
	mov r0, #5
	pop {r4, pc}
_02203CDA:
	add r0, r4, #0
	bl ov17_02203C78
	cmp r0, #0
	blt _02203CF4
	add r1, r4, #0
	add r1, #0x7c
	strb r0, [r1]
	add r0, r4, #0
	bl ov17_022028B8
	mov r0, #4
	pop {r4, pc}
_02203CF4:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	nop
_02203CFC: .word ov17_02203FC0
	thumb_func_end ov17_02203CC8

	thumb_func_start ov17_02203D00
ov17_02203D00: ; 0x02203D00
	add r2, r0, #0
	add r0, #0x7c
	ldrb r1, [r0]
	mov r0, #0x14
	add r2, #0x20
	mul r0, r1
	add r2, r2, r0
	ldrb r1, [r2, #1]
	cmp r1, #5
	bgt _02203D30
	cmp r1, #0
	blt _02203D4A
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02203D24: ; jump table
	.short _02203D34 - _02203D24 - 2 ; case 0
	.short _02203D42 - _02203D24 - 2 ; case 1
	.short _02203D42 - _02203D24 - 2 ; case 2
	.short _02203D42 - _02203D24 - 2 ; case 3
	.short _02203D42 - _02203D24 - 2 ; case 4
	.short _02203D46 - _02203D24 - 2 ; case 5
_02203D30:
	cmp r1, #0xff
	b _02203D4A
_02203D34:
	ldrb r0, [r2, #4]
	cmp r0, #0
	beq _02203D3E
	mov r0, #4
	bx lr
_02203D3E:
	mov r0, #3
	bx lr
_02203D42:
	mov r0, #5
	bx lr
_02203D46:
	mov r0, #6
	bx lr
_02203D4A:
	mov r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end ov17_02203D00

	.rodata

ov17_02203D50:
	.byte 0x02, 0x01, 0x00, 0x00

ov17_02203D54:
	.byte 0x05, 0x01, 0x00, 0x00

ov17_02203D58:
	.byte 0x03, 0x01, 0x00, 0x00

ov17_02203D5C:
	.byte 0x04, 0x03, 0x01, 0x00

ov17_02203D60: ; 0x02203D60
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x04, 0x03, 0x00, 0x00, 0x06, 0x05, 0x00, 0x03, 0x04, 0x00, 0x0B
	.byte 0x00, 0x00, 0x3A, 0x00, 0x1F, 0x00, 0x54, 0x00

ov17_02203D78: ; 0x02203D78
	.byte 0x1E, 0x00, 0x1F, 0x00, 0x1D, 0x00, 0x1C, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4F, 0x00, 0x00, 0x00

ov17_02203D88: ; 0x02203D88
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203D98: ; 0x02203D98
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov17_02203DAC: ; 0x02203DAC
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov17_02203DC4: ; 0x02203DC4
	.byte 0x02, 0x19, 0x15, 0x06, 0x02, 0x09, 0xA2, 0x01, 0x00, 0x02, 0x13, 0x13
	.byte 0x04, 0x0C, 0xCA, 0x00, 0x00, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x36, 0x01

ov17_02203DDC: ; 0x02203DDC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203DF8: ; 0x02203DF8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov17_02203E14: ; 0x02203E14
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203E30: ; 0x02203E30
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203E4C: ; 0x02203E4C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203E68: ; 0x02203E68
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov17_02203E88: ; 0x02203E88
	.word 3, ov17_02203D5C
	.word 2, ov17_02203D58
	.word 2, ov17_02203D50
	.word 2, ov17_02203D54

ov17_02203EA8: ; 0x02203EA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203ED0: ; 0x02203ED0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203EF8: ; 0x02203EF8
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x60, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203F48: ; 0x02203F48
	.byte 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x38, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203F70: ; 0x02203F70
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x63, 0x00, 0x00, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203F98: ; 0x02203F98
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x58, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov17_02203FC0: ; 0x02203FC0
	.byte 0xA0, 0xC0, 0xC0, 0x00
