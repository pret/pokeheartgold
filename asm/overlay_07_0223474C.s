	.include "macros.inc"
	.include "overlay_07.inc"
	.include "global.inc"

    .text 

	thumb_func_start ov07_0223474C
ov07_0223474C: ; 0x0223474C
	push {r3, lr}
	add r3, r1, #0
	ldr r1, [r0]
	mov r2, #0
	bl ov07_0223476C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0223474C

	thumb_func_start ov07_0223475C
ov07_0223475C: ; 0x0223475C
	push {r3, lr}
	add r3, r1, #0
	ldr r1, [r0, #4]
	mov r2, #1
	bl ov07_0223476C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0223475C

	thumb_func_start ov07_0223476C
ov07_0223476C: ; 0x0223476C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl Pokepic_Push
	ldr r0, [r5, #4]
	lsl r1, r0, #1
	add r1, r5, r1
	ldrh r6, [r1, #0x28]
	add r1, r5, r0
	add r1, #0x30
	ldrb r1, [r1]
	add r2, r5, r0
	add r2, #0x38
	str r1, [sp, #0x1c]
	add r1, r5, r0
	lsl r0, r0, #2
	ldrb r2, [r2]
	add r0, r5, r0
	add r1, #0x34
	ldr r0, [r0, #0x3c]
	ldrb r1, [r1]
	str r2, [sp, #0x18]
	str r0, [sp, #0x14]
	cmp r7, #0
	beq _022347C2
	add r0, r5, r4
	add r0, #0x4c
	ldrb r2, [r0]
	mov r0, #1
	tst r0, r2
	beq _022347BE
	mov r4, #0
	b _022347D4
_022347BE:
	mov r4, #2
	b _022347D4
_022347C2:
	add r0, r5, r4
	add r0, #0x4c
	ldrb r2, [r0]
	mov r0, #1
	tst r0, r2
	beq _022347D2
	mov r4, #2
	b _022347D4
_022347D2:
	mov r4, #0
_022347D4:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	lsl r1, r6, #0x10
	lsl r2, r2, #0x18
	lsl r3, r4, #0x18
	str r0, [sp, #8]
	add r0, sp, #0x28
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl Pokepic_GetTemplate
	add r7, r0, #0
	add r3, sp, #0x28
	add r2, r7, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl Pokepic_ScheduleReloadFromNarc
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldrh r0, [r7, #6]
	str r0, [sp, #0xc]
	ldr r3, [r5]
	ldrh r0, [r7]
	lsl r3, r3, #2
	add r3, r5, r3
	ldr r3, [r3, #8]
	ldrh r1, [r7, #2]
	ldr r3, [r3]
	bl sub_02014540
	ldr r1, [r5]
	ldr r3, [sp, #0x18]
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r2, r4, #0x18
	lsl r3, r3, #0x18
	ldrh r0, [r7]
	ldr r1, [r1, #8]
	lsr r2, r2, #0x18
	str r0, [r1, #4]
	ldr r1, [r5]
	ldrh r0, [r7, #4]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	lsr r3, r3, #0x18
	str r0, [r1, #8]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	str r0, [sp]
	lsl r0, r6, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl GetMonPicHeightBySpeciesGenderForm
	ldr r1, [r5]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, [r5]
	lsl r1, r0, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	add r0, r5, r0
	ldr r1, [r1, #0xc]
	add r0, #0x4c
	lsl r1, r1, #0x18
	asr r7, r1, #0x18
	ldrb r0, [r0]
	mov r1, #1
	bl ov07_02234B5C
	str r0, [sp, #0x20]
	ldr r0, [r5]
	ldr r2, [sp, #0x20]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r1, #1
	add r2, r2, r7
	bl Pokepic_SetAttr
	cmp r4, #2
	bne _02234948
	ldr r1, [sp, #0x10]
	mov r0, #0xb4
	bl NARC_New
	add r1, sp, #0x24
	lsl r2, r6, #0x10
	add r1, #2
	lsr r2, r2, #0x10
	add r4, r0, #0
	bl sub_020729D8
	add r1, sp, #0x24
	lsl r2, r6, #0x10
	add r0, r4, #0
	add r1, #1
	lsr r2, r2, #0x10
	bl sub_020729FC
	lsl r2, r6, #0x10
	add r0, r4, #0
	add r1, sp, #0x24
	lsr r2, r2, #0x10
	bl sub_02072A20
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5]
	add r2, sp, #0x24
	lsl r0, r0, #2
	add r0, r5, r0
	ldrb r2, [r2]
	ldr r0, [r0, #0x18]
	mov r1, #0x2e
	bl Pokepic_SetAttr
	ldr r0, [r5]
	ldr r2, [sp, #0x20]
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, #0x24
	ldr r0, [r0, #0x18]
	mov r1, #0x14
	str r2, [sp, #0x20]
	bl Pokepic_SetAttr
	ldr r0, [r5]
	add r3, sp, #0x24
	lsl r0, r0, #2
	mov r2, #1
	add r0, r5, r0
	ldrsb r2, [r3, r2]
	ldr r0, [r0, #0x18]
	mov r1, #0x15
	bl Pokepic_SetAttr
	ldr r0, [r5]
	mov r2, #0x24
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r1, #0x16
	sub r2, r2, r7
	bl Pokepic_SetAttr
	ldr r0, [r5]
	add r3, sp, #0x24
	lsl r0, r0, #2
	mov r2, #2
	add r0, r5, r0
	ldrsb r2, [r3, r2]
	ldr r0, [r0, #0x18]
	mov r1, #0x29
	bl Pokepic_SetAttr
_02234948:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0223476C

	thumb_func_start ov07_0223494C
ov07_0223494C: ; 0x0223494C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	str r1, [sp, #0x10]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl Pokepic_Pop
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl Pokepic_GetTemplate
	add r4, r0, #0
	ldr r0, [r5]
	lsl r1, r0, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x28]
	lsl r3, r0, #2
	str r1, [sp, #0x1c]
	add r1, r5, r0
	add r1, #0x30
	ldrb r1, [r1]
	str r1, [sp, #0x18]
	add r1, r5, r0
	add r1, #0x38
	ldrb r1, [r1]
	add r0, r5, r0
	add r0, #0x4c
	str r1, [sp, #0x14]
	add r1, r5, r3
	ldr r7, [r1, #0x3c]
	ldrb r1, [r0]
	mov r0, #1
	tst r0, r1
	beq _0223499E
	mov r6, #2
	b _022349A0
_0223499E:
	mov r6, #0
_022349A0:
	str r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrh r0, [r4, #6]
	add r3, r5, r3
	ldr r2, [sp, #0x10]
	str r0, [sp, #0xc]
	ldr r3, [r3, #8]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r3, [r3]
	bl sub_02014540
	ldr r1, [r5]
	ldrh r0, [r4]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	ldr r3, [sp, #0x14]
	str r0, [r1, #4]
	ldr r1, [r5]
	lsl r2, r6, #0x18
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r3, r3, #0x18
	ldrh r0, [r4, #4]
	ldr r1, [r1, #8]
	lsr r2, r2, #0x18
	str r0, [r1, #8]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x18
	str r7, [sp]
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	lsr r3, r3, #0x18
	bl GetMonPicHeightBySpeciesGenderForm
	ldr r1, [r5]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, [r5]
	mov r1, #1
	lsl r4, r0, #2
	add r0, r5, r0
	add r0, #0x4c
	ldrb r0, [r0]
	bl ov07_02234B5C
	add r1, r5, r4
	add r2, r0, #0
	ldr r0, [r1, #8]
	ldr r3, [r0, #0xc]
	ldr r0, [r1, #0x18]
	mov r1, #1
	add r2, r3, r2
	bl Pokepic_SetAttr
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0223494C

	thumb_func_start ov07_02234A20
ov07_02234A20: ; 0x02234A20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl Pokepic_Push
	mov r0, #0x72
	add r3, sp, #0
	add r1, r0, #0
	strh r0, [r3, #4]
	add r1, #0x90
	strh r1, [r3, #8]
	mov r1, #0
	strh r1, [r3, #0xa]
	strb r1, [r3, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5]
	add r2, r5, r1
	add r2, #0x4c
	ldrb r4, [r2]
	mov r2, #1
	tst r4, r2
	beq _02234A5E
	add r0, #0x8f
	strh r0, [r3, #6]
	mov r4, #0x87
	b _02234A64
_02234A5E:
	add r2, #0xff
	strh r2, [r3, #6]
	mov r4, #0x86
_02234A64:
	lsl r0, r1, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl Pokepic_GetTemplate
	add r7, r0, #0
	add r3, sp, #4
	add r2, r7, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl Pokepic_ScheduleReloadFromNarc
	ldr r3, [r5]
	ldrh r0, [r7]
	lsl r3, r3, #2
	add r3, r5, r3
	ldr r3, [r3, #8]
	ldrh r1, [r7, #2]
	ldr r3, [r3]
	add r2, r6, #0
	bl sub_02014400
	ldr r2, [r5]
	add r1, sp, #0
	lsl r2, r2, #2
	add r2, r5, r2
	ldrh r0, [r1, #4]
	ldr r2, [r2, #8]
	str r0, [r2, #4]
	ldr r0, [r5]
	ldrh r1, [r1, #8]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #8]
	add r2, r4, #0
	str r1, [r0, #8]
	add r0, sp, #0
	mov r1, #0x75
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrb r1, [r0]
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, [r5]
	mov r1, #1
	lsl r4, r0, #2
	add r0, r5, r0
	add r0, #0x4c
	ldrb r0, [r0]
	bl ov07_02234B5C
	add r2, r5, r4
	ldr r1, [r2, #8]
	ldr r1, [r1, #0xc]
	add r4, r1, r0
	ldr r0, [r2, #0x18]
	mov r1, #1
	add r2, r4, #0
	bl Pokepic_SetAttr
	ldr r1, [r5]
	mov r2, #1
	add r0, r5, r1
	add r0, #0x4c
	ldrb r0, [r0]
	tst r0, r2
	beq _02234B58
	lsl r0, r1, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r1, #0x2e
	bl Pokepic_SetAttr
	ldr r0, [r5]
	add r2, sp, #0
	ldrb r3, [r2]
	lsl r0, r0, #2
	add r0, r5, r0
	mov r2, #0x24
	sub r2, r2, r3
	ldr r0, [r0, #0x18]
	mov r1, #0x14
	add r2, r4, r2
	bl Pokepic_SetAttr
	ldr r0, [r5]
	mov r1, #0x15
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r2, #0
	bl Pokepic_SetAttr
	ldr r0, [r5]
	add r2, sp, #0
	lsl r0, r0, #2
	ldrb r3, [r2]
	add r0, r5, r0
	mov r2, #0x24
	ldr r0, [r0, #0x18]
	mov r1, #0x16
	sub r2, r2, r3
	bl Pokepic_SetAttr
	ldr r0, [r5]
	mov r1, #0x29
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r2, #0
	bl Pokepic_SetAttr
_02234B58:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02234A20

	thumb_func_start ov07_02234B5C
ov07_02234B5C: ; 0x02234B5C
	cmp r1, #0
	bne _02234B68
	lsl r1, r0, #2
	ldr r0, _02234B78 ; =gBattlerEncounterX
	ldrsh r0, [r0, r1]
	bx lr
_02234B68:
	mov r2, #6
	mul r2, r0
	ldr r0, _02234B7C ; =ov07_022377F4
	lsl r1, r1, #1
	add r0, r0, r2
	ldrsh r0, [r1, r0]
	bx lr
	nop
_02234B78: .word gBattlerEncounterX
_02234B7C: .word ov07_022377F4
	thumb_func_end ov07_02234B5C

    .rodata

	.public gBattlerEncounterX
gBattlerEncounterX: ; 0x022377DC
	.byte 0x40, 0x00, 0x20, 0x00
	.byte 0xC0, 0x00, 0xE0, 0x00, 0x28, 0x00, 0x20, 0x00, 0xD8, 0x00, 0xE0, 0x00, 0x50, 0x00, 0x20, 0x00
	.byte 0xB0, 0x00, 0xE0, 0x00

	.public ov07_022377F4
ov07_022377F4: ; 0x022377F4
	.short 0x0150, 0x0070, 0xFE00
	.short 0xFFB0, 0x0032, 0xFD80
	.short 0x013C, 0x0070, 0xFE00
	.short 0xFFC4, 0x0032, 0xFF9C
	.short 0x0164, 0x0078, 0x0000
	.short 0xFF9C, 0x002A, 0xFD80

	.public gSlideTrainerInCoords
gSlideTrainerInCoords:
	.short 0xFFB0, 0x0070, 0xFE00
	.short 0x0150, 0x0032, 0xFD80
	.short 0xFFB0, 0x0070, 0xFE00
	.short 0x0150, 0x0032, 0xFD80
	.short 0xFFB0, 0x0070, 0xFE00
	.short 0x0150, 0x0032, 0xFD80

