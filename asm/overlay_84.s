	.include "asm/macros.inc"
	.include "global.inc"

	.text

    .public BattleArcadeGameBoard_SetCursorPos
    .public ov84_0223EC88
    .public BattleArcade_GetWinstreak
    .public ov84_0223F28C
    .public ov84_0223F374

	thumb_func_start ov84_0223F5E4
ov84_0223F5E4: ; 0x0223F5E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #0x14
	mov r1, #0x6e
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	bl NARC_ctor
	str r0, [sp, #0x18]
	bl sub_02074490
	mov r1, #3
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	add r0, #0xc2
	ldr r0, [r6, r0]
	mov r1, #0x14
	mov r3, #0
	bl AddPlttResObjFromNarc
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r6, r1]
	bl sub_02074498
	add r2, r0, #0
	mov r0, #3
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xc6
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r6, r1]
	bl sub_020744A4
	add r2, r0, #0
	mov r0, #3
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xca
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r6, r1]
	mov r4, #0
	add r5, r6, #0
_0223F66A:
	cmp r4, #3
	bne _0223F6A0
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0223F68A
	add r0, r7, #0
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x1c]
	b _0223F6B4
_0223F68A:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x1c]
	b _0223F6B4
_0223F6A0:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x1c]
_0223F6B4:
	ldr r0, [sp, #0x20]
	bl Pokemon_GetIconNaix
	add r2, r0, #0
	add r0, r4, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [sp, #0x1c]
	bl Pokemon_GetIconNaix
	add r2, r0, #0
	add r0, r4, #7
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x18]
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	mov r1, #0x6b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blo _0223F66A
	ldr r0, [sp, #0x18]
	bl NARC_dtor
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F5E4

	thumb_func_start ov84_0223F714
ov84_0223F714: ; 0x0223F714
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xbe
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x15
	mov r3, #1
	bl AddCharResObjFromNarc
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r3, #0
	str r3, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x6e
	str r0, [sp, #0xc]
	add r0, #0xc2
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x39
	bl AddPlttResObjFromNarc
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xc6
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x17
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x6e
	str r0, [sp, #8]
	add r0, #0xca
	ldr r0, [r4, r0]
	mov r1, #0xb8
	mov r2, #0x16
	mov r3, #1
	bl AddCellOrAnimResObjFromNarc
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F714

	thumb_func_start ov84_0223F7A0
ov84_0223F7A0: ; 0x0223F7A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x6e
	mov r1, #0x14
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_0223F7BC:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0223F7BC
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x44]
	add r1, r6, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	add r2, r7, #0
	str r0, [sp, #8]
	add r0, sp, #0x4c
	ldrb r0, [r0]
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov84_0223F374
	str r0, [r4, #0x10]
	add r0, sp, #0x28
	ldrh r3, [r0, #0x14]
	strh r3, [r4, #0xc]
	ldrh r1, [r0, #0x18]
	add r0, sp, #0x4c
	ldrb r2, [r0]
	strh r1, [r4, #0xe]
	lsl r0, r3, #0xc
	strb r2, [r4, #0xb]
	lsl r1, r1, #0xc
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	cmp r2, #1
	bne _0223F808
	mov r0, #3
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x18]
_0223F808:
	ldr r0, [r4, #0x10]
	add r1, sp, #0x14
	bl sub_020247D4
	add r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F7A0

	thumb_func_start BattleArcadeObj_Delete
BattleArcadeObj_Delete: ; 0x0223F818
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02024758
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
	thumb_func_end BattleArcadeObj_Delete

	thumb_func_start BattleArcadeObj_Vanish
BattleArcadeObj_Vanish: ; 0x0223F82C
	ldr r3, _0223F834 ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0223F834: .word Set2dSpriteVisibleFlag
	thumb_func_end BattleArcadeObj_Vanish

	thumb_func_start ov84_0223F838
ov84_0223F838: ; 0x0223F838
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	lsl r1, r6, #0xc
	str r0, [r2]
	lsl r0, r4, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _0223F86A
	mov r0, #3
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #4]
_0223F86A:
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F838

	thumb_func_start BattleArcadeObj_SetAnimation
BattleArcadeObj_SetAnimation: ; 0x0223F878
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	ldr r0, [r5, #0x10]
	lsl r1, r1, #0xc
	bl sub_02024868
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl sub_02024950
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end BattleArcadeObj_SetAnimation

	thumb_func_start ov84_0223F894
ov84_0223F894: ; 0x0223F894
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_02024AA8
	pop {r4, pc}
	thumb_func_end ov84_0223F894

	thumb_func_start ov84_0223F8A8
ov84_0223F8A8: ; 0x0223F8A8
	ldr r3, _0223F8B0 ; =sub_0202484C
	ldr r0, [r0, #0x10]
	bx r3
	nop
_0223F8B0: .word Set2dSpriteAnimActiveFlag
	thumb_func_end ov84_0223F8A8

	thumb_func_start ov84_0223F8B4
ov84_0223F8B4: ; 0x0223F8B4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r4, #0
_0223F8BC:
	ldr r2, _0223F8E0 ; =ov84_0223F9F8
	lsl r6, r4, #4
	lsl r3, r4, #3
	add r0, r7, #0
	add r1, r5, r6
	add r2, r2, r3
	bl AddWindow
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0223F8BC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F8E0: .word ov84_0223F9F8
	thumb_func_end ov84_0223F8B4

	thumb_func_start ov84_0223F8E4
ov84_0223F8E4: ; 0x0223F8E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223F8EA:
	lsl r0, r4, #4
	add r0, r5, r0
	bl RemoveWindow
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #2
	blo _0223F8EA
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov84_0223F8E4

	.rodata

.public _0223F900

_0223F900:
	.byte 0x15, 0x10, 0x0A, 0x05

.public ov84_0223F904

ov84_0223F904: ; 0x0223F904
	.byte 0x3F, 0x3F, 0x3F, 0x3F, 0x15, 0x2A, 0x2A

.public ov84_0223F90B

ov84_0223F90B: ; 0x0223F90B
	.byte 0xFE, 0x80, 0x60, 0x20, 0xFF
	.byte 0x00, 0x00, 0x00

.public ov84_0223F913

ov84_0223F913: ; 0x0223F913
	.byte 0x14, 0x00, 0x10, 0x00, 0x08, 0x00, 0x04, 0x00, 0x03, 0x00, 0x02, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00

.public ov84_0223F924

ov84_0223F924: ; 0x0223F924
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

.public ov84_0223F934

ov84_0223F934: ; 0x0223F934
	.byte 0x0F, 0x0F, 0x28, 0x1E, 0x23, 0x14, 0x1E, 0x0F, 0x1E, 0x1E, 0x23, 0x05
	.byte 0x19, 0x28, 0x1E, 0x05, 0x0A, 0x4B, 0x0A, 0x05

.public ov84_0223F948

ov84_0223F948: ; 0x0223F948
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x06, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

.public ov84_0223F964

ov84_0223F964: ; 0x0223F964
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.public ov84_0223F980

ov84_0223F980: ; 0x0223F980
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x04, 0x03, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

.public ov84_0223F99C

ov84_0223F99C: ; 0x0223F99C
	.byte 0x7E, 0x45, 0x45, 0x45
	.byte 0x70, 0x70, 0x47, 0x78, 0x7E, 0x7E, 0x45, 0x45, 0x45, 0x70, 0x70, 0x47, 0x78, 0x7E, 0x46, 0x46
	.byte 0x46, 0x46, 0x68, 0x68, 0x7F, 0x47, 0x7F, 0x70, 0x78, 0x70, 0x7F, 0x40

.public ov84_0223F9BC

ov84_0223F9BC: ; 0x0223F9BC
	.byte 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

.public ov84_0223F9E4

ov84_0223F9E4: ; 0x0223F9E4
	.byte 0x0B, 0x0B, 0x0B, 0x0B

.public ov84_0223F9E8

ov84_0223F9E8: ; 0x0223F9E8
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00

ov84_0223F9F8: ; 0x0223F9F8
	.byte 0x01, 0x02, 0x13, 0x1B, 0x04, 0x0C, 0x01, 0x00
	.byte 0x01, 0x18, 0x0D, 0x07, 0x04, 0x0D, 0x6D, 0x00
	; 0x0223FA08

	.bss

_0223FA20:
	.space 0x20
