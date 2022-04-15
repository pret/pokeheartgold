	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov59_02237D40
ov59_02237D40: ; 0x02237D40
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _02237D52
	cmp r1, #1
	beq _02237D94
	b _02237DA4
_02237D52:
	bl ov59_02238624
	mov r2, #2
	mov r0, #3
	mov r1, #0x86
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0xa7
	add r0, r6, #0
	lsl r1, r1, #2
	mov r2, #0x86
	bl OverlayManager_CreateAndGetData
	mov r2, #0xa7
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x86
	str r0, [r4]
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov59_02237E94
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02237DA4
_02237D94:
	bl OverlayManager_GetData
	bl ov59_02237F3C
	cmp r0, #0
	beq _02237DA4
	mov r0, #1
	pop {r4, r5, r6, pc}
_02237DA4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_02237D40

	thumb_func_start ov59_02237DA8
ov59_02237DA8: ; 0x02237DA8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #0x10
	bhi _02237E5A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02237DC4: ; jump table
	.short _02237DE6 - _02237DC4 - 2 ; case 0
	.short _02237DEE - _02237DC4 - 2 ; case 1
	.short _02237DF6 - _02237DC4 - 2 ; case 2
	.short _02237DFE - _02237DC4 - 2 ; case 3
	.short _02237E06 - _02237DC4 - 2 ; case 4
	.short _02237E0E - _02237DC4 - 2 ; case 5
	.short _02237E16 - _02237DC4 - 2 ; case 6
	.short _02237E1E - _02237DC4 - 2 ; case 7
	.short _02237E26 - _02237DC4 - 2 ; case 8
	.short _02237E2E - _02237DC4 - 2 ; case 9
	.short _02237E36 - _02237DC4 - 2 ; case 10
	.short _02237E3E - _02237DC4 - 2 ; case 11
	.short _02237E5A - _02237DC4 - 2 ; case 12
	.short _02237E5A - _02237DC4 - 2 ; case 13
	.short _02237E46 - _02237DC4 - 2 ; case 14
	.short _02237E4E - _02237DC4 - 2 ; case 15
	.short _02237E56 - _02237DC4 - 2 ; case 16
_02237DE6:
	bl ov59_02237FA4
	str r0, [r4]
	b _02237E5A
_02237DEE:
	bl ov59_0223801C
	str r0, [r4]
	b _02237E5A
_02237DF6:
	bl ov59_02238068
	str r0, [r4]
	b _02237E5A
_02237DFE:
	bl ov59_022380E4
	str r0, [r4]
	b _02237E5A
_02237E06:
	bl ov59_022380EC
	str r0, [r4]
	b _02237E5A
_02237E0E:
	bl ov59_0223811C
	str r0, [r4]
	b _02237E5A
_02237E16:
	bl ov59_02238124
	str r0, [r4]
	b _02237E5A
_02237E1E:
	bl ov59_02238218
	str r0, [r4]
	b _02237E5A
_02237E26:
	bl ov59_022382F4
	str r0, [r4]
	b _02237E5A
_02237E2E:
	bl ov59_0223834C
	str r0, [r4]
	b _02237E5A
_02237E36:
	bl ov59_022383B4
	str r0, [r4]
	b _02237E5A
_02237E3E:
	bl ov59_022384E4
	str r0, [r4]
	b _02237E5A
_02237E46:
	bl ov59_02238578
	str r0, [r4]
	b _02237E5A
_02237E4E:
	bl ov59_0223858C
	str r0, [r4]
	b _02237E5A
_02237E56:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02237E5A:
	mov r0, #0x25
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200D020
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_02237DA8

	thumb_func_start ov59_02237E68
ov59_02237E68: ; 0x02237E68
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov59_02237F74
	cmp r0, #0
	bne _02237E7E
	mov r0, #0
	pop {r3, r4, r5, pc}
_02237E7E:
	add r0, r4, #0
	bl ov59_02237F28
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x86
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_02237E68

	thumb_func_start ov59_02237E94
ov59_02237E94: ; 0x02237E94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	bl sub_020183F0
	str r0, [r5, #0x40]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x18]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	bl Options_GetTextFrameDelay
	add r1, r5, #0
	add r1, #0x45
	strb r0, [r1]
	add r0, r4, #0
	bl Options_GetFrame
	add r1, r5, #0
	add r1, #0x46
	strb r0, [r1]
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x18]
	add r0, r5, #0
	add r0, #0x44
	strb r1, [r0]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x10]
	str r0, [r5, #0x38]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x18]
	bl Save_ApricornBox_get
	str r0, [r5, #0x10]
	add r0, r5, #0
	bl ov59_02238768
	add r0, r5, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #3
	bne _02237F24
	add r0, r5, #0
	mov r1, #2
	add r0, #0x49
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0x4a
	strb r1, [r0]
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x1a]
	add r0, r5, #0
	add r0, #0x4b
	strb r1, [r0]
	ldr r0, [r5, #4]
	ldrb r1, [r0, #0x1b]
	add r0, r5, #0
	add r0, #0x4c
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #1
	add r0, #0x44
	strb r1, [r0]
	ldr r0, [r5, #4]
	strb r1, [r0, #0x18]
_02237F24:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov59_02237E94

	thumb_func_start ov59_02237F28
ov59_02237F28: ; 0x02237F28
	add r1, r0, #0
	ldr r0, [r1, #4]
	ldr r3, _02237F38 ; =sub_02018410
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x40]
	ldr r0, [r0, #0x14]
	bx r3
	nop
_02237F38: .word sub_02018410
	thumb_func_end ov59_02237F28

	thumb_func_start ov59_02237F3C
ov59_02237F3C: ; 0x02237F3C
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02237F4C
	cmp r1, #1
	beq _02237F58
	b _02237F6E
_02237F4C:
	bl ov59_02238674
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02237F6E
_02237F58:
	bl ov59_022386D0
	bl sub_020210BC
	mov r0, #1
	bl sub_02021148
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #1
	pop {r4, pc}
_02237F6E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_02237F3C

	thumb_func_start ov59_02237F74
ov59_02237F74: ; 0x02237F74
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _02237F82
	cmp r0, #1
	b _02237F94
_02237F82:
	bl sub_02021238
	add r0, r4, #0
	bl ov59_022386A8
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02237FA0
_02237F94:
	bl ov59_02238624
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #1
	pop {r4, pc}
_02237FA0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov59_02237F74

	thumb_func_start ov59_02237FA4
ov59_02237FA4: ; 0x02237FA4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _02237FB6
	cmp r0, #1
	beq _02237FD4
	b _02238016
_02237FB6:
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
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238016
_02237FD4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02238016
	mov r0, #0
	strh r0, [r4, #0x3c]
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02238010
	cmp r0, #1
	beq _02237FF4
	cmp r0, #2
	beq _0223800A
	b _02238010
_02237FF4:
	ldr r0, [r4, #0x10]
	bl sub_02031C00
	cmp r0, #1
	beq _02238004
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, pc}
_02238004:
	add sp, #0xc
	mov r0, #4
	pop {r3, r4, pc}
_0223800A:
	add sp, #0xc
	mov r0, #5
	pop {r3, r4, pc}
_02238010:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, pc}
_02238016:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov59_02237FA4

	thumb_func_start ov59_0223801C
ov59_0223801C: ; 0x0223801C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0
	beq _0223802E
	cmp r0, #1
	beq _0223804E
	b _02238060
_0223802E:
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
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238060
_0223804E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02238060
	mov r0, #0
	strh r0, [r4, #0x3c]
	add sp, #0xc
	mov r0, #0x10
	pop {r3, r4, pc}
_02238060:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223801C

	thumb_func_start ov59_02238068
ov59_02238068: ; 0x02238068
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	bne _022380C2
	mov r1, #1
	bl ov59_02238FF4
	ldr r0, [r4, #0x10]
	bl sub_02031C00
	cmp r0, #0
	beq _0223808C
	cmp r0, #2
	beq _0223809C
	cmp r0, #3
	beq _022380A8
	b _022380B2
_0223808C:
	add r2, r4, #0
	add r2, #0x45
	ldrb r2, [r2]
	add r0, r4, #0
	mov r1, #0x16
	bl ov59_02238CFC
	b _022380B2
_0223809C:
	add r0, r4, #0
	mov r1, #0x17
	mov r2, #0xff
	bl ov59_02238CFC
	b _022380B2
_022380A8:
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0xff
	bl ov59_02238CFC
_022380B2:
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02031BEC
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022380E0
_022380C2:
	bl ov59_022385AC
	cmp r0, #0
	beq _022380E0
	add r0, r4, #0
	mov r1, #0
	bl ov59_02238FF4
	add r0, r4, #0
	bl ov59_02238D74
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #4
	pop {r4, pc}
_022380E0:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov59_02238068

	thumb_func_start ov59_022380E4
ov59_022380E4: ; 0x022380E4
	ldr r3, _022380E8 ; =ov59_02239EF8
	bx r3
	.balign 4, 0
_022380E8: .word ov59_02239EF8
	thumb_func_end ov59_022380E4

	thumb_func_start ov59_022380EC
ov59_022380EC: ; 0x022380EC
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _022380FC
	cmp r1, #1
	beq _0223810A
	b _02238118
_022380FC:
	mov r1, #0
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238118
_0223810A:
	bl ov59_02239F18
	cmp r0, #4
	beq _0223811A
	mov r1, #0
	strh r1, [r4, #0x3c]
	pop {r4, pc}
_02238118:
	mov r0, #4
_0223811A:
	pop {r4, pc}
	thumb_func_end ov59_022380EC

	thumb_func_start ov59_0223811C
ov59_0223811C: ; 0x0223811C
	ldr r3, _02238120 ; =ov59_0223A03C
	bx r3
	.balign 4, 0
_02238120: .word ov59_0223A03C
	thumb_func_end ov59_0223811C

	thumb_func_start ov59_02238124
ov59_02238124: ; 0x02238124
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #3
	bhi _0223820C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223813A: ; jump table
	.short _02238142 - _0223813A - 2 ; case 0
	.short _02238160 - _0223813A - 2 ; case 1
	.short _0223817E - _0223813A - 2 ; case 2
	.short _022381DA - _0223813A - 2 ; case 3
_02238142:
	mov r1, #2
	bl ov59_02238FF4
	add r0, r4, #0
	mov r1, #1
	bl ov59_02238AB0
	add r0, r4, #0
	mov r1, #0xb
	bl ov59_02238C40
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238214
_02238160:
	bl ov59_0223A05C
	cmp r0, #6
	beq _02238214
	add r1, r4, #0
	add r1, #0x48
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #4
	add r0, #0x51
	strb r1, [r0]
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238214
_0223817E:
	add r1, r4, #0
	add r1, #0x51
	ldrb r3, [r1]
	add r1, r4, #0
	add r1, #0x51
	ldrb r1, [r1]
	sub r2, r1, #1
	add r1, r4, #0
	add r1, #0x51
	strb r2, [r1]
	cmp r3, #0
	bne _02238214
	add r1, r4, #0
	add r1, #0x48
	ldrb r1, [r1]
	cmp r1, #1
	bne _022381BE
	mov r1, #0
	bl ov59_02238FF4
	add r0, r4, #0
	mov r1, #0
	bl ov59_02238AB0
	add r0, r4, #0
	mov r1, #0xa
	bl ov59_02238C40
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #5
	pop {r4, pc}
_022381BE:
	mov r1, #0xc
	bl ov59_02238C40
	add r0, r4, #0
	mov r1, #0
	bl ov59_02238AB0
	add r0, r4, #0
	bl ov59_02238F58
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238214
_022381DA:
	bl ov59_02238FB4
	cmp r0, #0
	blt _02238214
	mov r1, #0
	strh r1, [r4, #0x3c]
	cmp r0, #0
	beq _022381FE
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #0x4d
	add r4, #0x4e
	ldrb r1, [r1]
	ldrb r2, [r4]
	bl ApricornBox_SetKurtApricorn
	mov r0, #1
	pop {r4, pc}
_022381FE:
	add r0, r4, #0
	bl ov59_02238FF4
	add r0, r4, #0
	mov r1, #0xa
	bl ov59_02238C40
_0223820C:
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #5
	pop {r4, pc}
_02238214:
	mov r0, #6
	pop {r4, pc}
	thumb_func_end ov59_02238124

	thumb_func_start ov59_02238218
ov59_02238218: ; 0x02238218
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #3
	bhi _022382D6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223822E: ; jump table
	.short _02238236 - _0223822E - 2 ; case 0
	.short _02238244 - _0223822E - 2 ; case 1
	.short _0223826A - _0223822E - 2 ; case 2
	.short _0223828A - _0223822E - 2 ; case 3
_02238236:
	mov r1, #2
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022382DE
_02238244:
	mov r1, #1
	bl ov59_022390A8
	cmp r0, #0
	beq _022382DE
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl ov59_0223919C
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov59_0223919C
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022382DE
_0223826A:
	add r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0
	bne _022382DE
	ldr r0, _022382E4 ; =0x000008E6
	bl PlaySE
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x15
	bl Set2dSpriteAnimSeqNo
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
_0223828A:
	ldr r0, _022382E8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _022382A2
	mov r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _022382EC ; =0x000005EA
	bl PlaySE
	mov r0, #0xa
	pop {r4, pc}
_022382A2:
	mov r0, #2
	tst r0, r1
	beq _022382B6
	mov r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _022382F0 ; =0x00000682
	bl PlaySE
	mov r0, #9
	pop {r4, pc}
_022382B6:
	bl System_GetTouchNew
	cmp r0, #0
	beq _022382DE
	mov r0, #0
	strh r0, [r4, #0x3c]
	ldr r0, _022382F0 ; =0x00000682
	bl PlaySE
	ldr r0, [r4, #0x40]
	cmp r0, #1
	beq _022382D2
	mov r0, #0
	str r0, [r4, #0x40]
_022382D2:
	mov r0, #9
	pop {r4, pc}
_022382D6:
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #4
	pop {r4, pc}
_022382DE:
	mov r0, #7
	pop {r4, pc}
	nop
_022382E4: .word 0x000008E6
_022382E8: .word gSystem
_022382EC: .word 0x000005EA
_022382F0: .word 0x00000682
	thumb_func_end ov59_02238218

	thumb_func_start ov59_022382F4
ov59_022382F4: ; 0x022382F4
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02238308
	cmp r1, #1
	beq _02238316
	cmp r1, #2
	beq _02238328
	b _02238346
_02238308:
	mov r1, #2
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238346
_02238316:
	mov r1, #1
	bl ov59_022390A8
	cmp r0, #0
	beq _02238346
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238346
_02238328:
	bl ov59_02239F38
	cmp r0, #0
	beq _02238336
	cmp r0, #1
	beq _0223833E
	b _02238346
_02238336:
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #9
	pop {r4, pc}
_0223833E:
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #0xa
	pop {r4, pc}
_02238346:
	mov r0, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_022382F4

	thumb_func_start ov59_0223834C
ov59_0223834C: ; 0x0223834C
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _02238360
	cmp r1, #1
	beq _02238386
	cmp r1, #2
	beq _02238394
	b _0223839E
_02238360:
	mov r1, #0
	mov r2, #1
	bl ov59_0223919C
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov59_0223919C
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x14
	bl Set2dSpriteAnimSeqNo
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022383AE
_02238386:
	add r0, #0x50
	ldrb r0, [r0]
	cmp r0, #0
	bne _022383AE
	add r0, r1, #1
	strh r0, [r4, #0x3c]
	b _022383AE
_02238394:
	mov r1, #0
	bl ov59_022390A8
	cmp r0, #0
	beq _022383AE
_0223839E:
	add r0, r4, #0
	mov r1, #0
	bl ov59_02238FF4
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #4
	pop {r4, pc}
_022383AE:
	mov r0, #9
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223834C

	thumb_func_start ov59_022383B4
ov59_022383B4: ; 0x022383B4
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #4
	bls _022383C0
	b _022384DA
_022383C0:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022383CC: ; jump table
	.short _022383D6 - _022383CC - 2 ; case 0
	.short _02238404 - _022383CC - 2 ; case 1
	.short _0223841A - _022383CC - 2 ; case 2
	.short _0223845A - _022383CC - 2 ; case 3
	.short _022384A0 - _022383CC - 2 ; case 4
_022383D6:
	ldrb r1, [r4, #0x18]
	cmp r1, #5
	blo _022383F2
	mov r1, #7
	bl ov59_02238C40
	add r0, r4, #0
	mov r1, #0x1a
	mov r2, #0xff
	bl ov59_02238CFC
	mov r0, #1
	strh r0, [r4, #0x3c]
	b _022384DA
_022383F2:
	mov r2, #2
	add r0, #0x49
	strb r2, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4a
	strb r1, [r0]
	strh r2, [r4, #0x3c]
	b _022384DA
_02238404:
	bl ov59_022385AC
	cmp r0, #0
	beq _022384DA
	add r0, r4, #0
	bl ov59_02238D74
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #9
	pop {r4, pc}
_0223841A:
	mov r1, #0
	bl ov59_022390A8
	cmp r0, #0
	beq _022384DA
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x16
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024964
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022384DA
_0223845A:
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	bne _022384DA
	ldr r0, _022384E0 ; =0x000008E6
	bl PlaySE
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x14
	bl Set2dSpriteAnimSeqNo
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x38]
	bl sub_02031C30
	add r0, r4, #0
	bl ov59_02238768
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov59_0223919C
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _022384DA
_022384A0:
	add r1, r4, #0
	add r1, #0x50
	ldrb r1, [r1]
	cmp r1, #0
	bne _022384DA
	ldrb r1, [r4, #0x18]
	cmp r1, #5
	blo _022384B8
	mov r1, #7
	bl ov59_02238C40
	b _022384BE
_022384B8:
	mov r1, #6
	bl ov59_02238C40
_022384BE:
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	add r0, r4, #0
	bl ov59_0223892C
	add r0, r4, #0
	mov r1, #0
	bl ov59_02238FF4
	mov r0, #0
	strh r0, [r4, #0x3c]
	mov r0, #4
	pop {r4, pc}
_022384DA:
	mov r0, #0xa
	pop {r4, pc}
	nop
_022384E0: .word 0x000008E6
	thumb_func_end ov59_022383B4

	thumb_func_start ov59_022384E4
ov59_022384E4: ; 0x022384E4
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #0x3c]
	cmp r1, #0
	beq _022384F4
	cmp r1, #1
	beq _02238510
	b _02238574
_022384F4:
	bl ov59_02238E98
	add r0, r4, #0
	mov r1, #8
	bl ov59_02238C40
	add r0, r4, #0
	mov r1, #1
	bl ov59_02238FF4
	ldrh r0, [r4, #0x3c]
	add r0, r0, #1
	strh r0, [r4, #0x3c]
	b _02238574
_02238510:
	bl ov59_02238F24
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02238574
	mov r2, #0
	strh r2, [r4, #0x3c]
	cmp r0, #2
	bhs _0223852A
	sub r1, r2, #2
	cmp r0, r1
	bne _02238534
_0223852A:
	add r0, r4, #0
	bl ov59_02238C24
	mov r0, #4
	pop {r4, pc}
_02238534:
	cmp r0, #1
	bne _02238552
	add r0, r4, #0
	mov r1, #9
	bl ov59_02238C40
	add r0, r4, #0
	bl ov59_02238D90
	add r0, r4, #0
	mov r1, #1
	bl ov59_02238FF4
	mov r0, #0xf
	pop {r4, pc}
_02238552:
	ldr r0, [r4, #4]
	mov r1, #3
	strb r1, [r0, #0x18]
	ldr r0, [r4, #4]
	strb r2, [r0, #0x1c]
	add r0, r4, #0
	add r0, #0x4b
	ldrb r1, [r0]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x1a]
	add r0, r4, #0
	add r0, #0x4c
	ldrb r1, [r0]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x1b]
	mov r0, #1
	pop {r4, pc}
_02238574:
	mov r0, #0xb
	pop {r4, pc}
	thumb_func_end ov59_022384E4

	thumb_func_start ov59_02238578
ov59_02238578: ; 0x02238578
	push {r3, lr}
	bl ov59_022385AC
	cmp r0, #0
	beq _02238586
	mov r0, #4
	pop {r3, pc}
_02238586:
	mov r0, #0xe
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov59_02238578

	thumb_func_start ov59_0223858C
ov59_0223858C: ; 0x0223858C
	push {r4, lr}
	add r4, r0, #0
	bl ov59_022385AC
	cmp r0, #0
	beq _022385A8
	add r0, r4, #0
	bl ov59_02238D74
	add r0, r4, #0
	bl ov59_02238C24
	mov r0, #4
	pop {r4, pc}
_022385A8:
	mov r0, #0xf
	pop {r4, pc}
	thumb_func_end ov59_0223858C

	thumb_func_start ov59_022385AC
ov59_022385AC: ; 0x022385AC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _022385C4
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _022385C4
	mov r0, #0
	pop {r4, pc}
_022385C4:
	bl System_GetTouchNew
	cmp r0, #0
	beq _022385E6
	ldr r0, _02238618 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	str r0, [r4, #0x40]
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0xff
	add r4, #0x47
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_022385E6:
	ldr r0, _0223861C ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _02238620 ; =0x00000CF3
	tst r0, r1
	beq _022385F4
	mov r0, #0
	str r0, [r4, #0x40]
_022385F4:
	ldr r0, _0223861C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _02238614
	ldr r0, _02238618 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0xff
	add r4, #0x47
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_02238614:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02238618: .word 0x000005DC
_0223861C: .word gSystem
_02238620: .word 0x00000CF3
	thumb_func_end ov59_022385AC

	thumb_func_start ov59_02238624
ov59_02238624: ; 0x02238624
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
	ldr r0, _0223866C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _02238670 ; =0x04001000
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
_0223866C: .word 0xFFFFE0FF
_02238670: .word 0x04001000
	thumb_func_end ov59_02238624

	thumb_func_start ov59_02238674
ov59_02238674: ; 0x02238674
	push {r4, lr}
	add r4, r0, #0
	bl ov59_02239428
	add r0, r4, #0
	bl ov59_02239604
	add r0, r4, #0
	bl ov59_02239704
	add r0, r4, #0
	bl ov59_022397E4
	add r0, r4, #0
	bl ov59_022398CC
	add r0, r4, #0
	bl ov59_022399F0
	ldr r0, _022386A4 ; =ov59_022393D4
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	.balign 4, 0
_022386A4: .word ov59_022393D4
	thumb_func_end ov59_02238674

	thumb_func_start ov59_022386A8
ov59_022386A8: ; 0x022386A8
	push {r4, lr}
	add r4, r0, #0
	bl ov59_02239A08
	add r0, r4, #0
	bl ov59_02239918
	add r0, r4, #0
	bl ov59_022398A0
	add r0, r4, #0
	bl ov59_0223978C
	add r0, r4, #0
	bl ov59_022396E4
	add r0, r4, #0
	bl ov59_022395B8
	pop {r4, pc}
	thumb_func_end ov59_022386A8

	thumb_func_start ov59_022386D0
ov59_022386D0: ; 0x022386D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r1, #0
	bl ov59_022387D0
	add r0, r4, #0
	bl ov59_022388C4
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x64]
	mov r1, #0
	bl ReadMsgDataIntoString
	mov r0, #0
	ldr r1, [r4, #0x64]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	mov r1, #0
	lsr r3, r0, #0x18
	str r1, [sp]
	mov r5, #0x50
	sub r5, r5, r3
	lsr r3, r5, #0x1f
	add r3, r5, r3
	ldr r0, _02238764 ; =0x000F0200
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r2, [r4, #0x64]
	add r0, r4, r0
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	mov r5, #0
_0223871E:
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov59_0223892C
	add r5, r5, #1
	cmp r5, #7
	blt _0223871E
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02238758
	cmp r0, #1
	beq _02238742
	cmp r0, #2
	beq _0223874C
	b _02238758
_02238742:
	add r0, r4, #0
	bl ov59_02238C24
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0223874C:
	add r0, r4, #0
	mov r1, #0xa
	bl ov59_02238C40
	add sp, #0x10
	pop {r3, r4, r5, pc}
_02238758:
	add r0, r4, #0
	mov r1, #0
	bl ov59_02238C40
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238764: .word 0x000F0200
	thumb_func_end ov59_022386D0

	thumb_func_start ov59_02238768
ov59_02238768: ; 0x02238768
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl sub_02031C08
	strb r0, [r5, #0x18]
	ldr r0, [r5, #0x10]
	bl sub_02031CE8
	strb r0, [r5, #0x14]
	add r2, r5, #0
	ldr r0, [r5, #0x10]
	mov r1, #8
	add r2, #0x22
	bl sub_02031CEC
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	strb r0, [r5, #0x16]
	add r0, r5, #0
	add r0, #0x22
	bl sub_02031FE8
	strb r0, [r5, #0x17]
	add r0, r5, #0
	add r0, #0x22
	bl sub_02031D80
	strb r0, [r5, #0x15]
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x22
	add r1, #0x2a
	bl sub_02031DA0
	ldr r0, [r5, #0x10]
	bl sub_02031CA0
	strb r0, [r5, #0x19]
	mov r4, #0
_022387BA:
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl ApricornBox_CountApricorn
	add r1, r5, r4
	add r4, r4, #1
	strb r0, [r1, #0x1a]
	cmp r4, #7
	blt _022387BA
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov59_02238768

	thumb_func_start ov59_022387D0
ov59_022387D0: ; 0x022387D0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024964
	mov r0, #0x52
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [r4, #0x6c]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	mov r2, #0
	add r3, r0, #0
	mov r5, #0x30
	sub r3, r5, r3
	str r2, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r0, _02238830 ; =0x00010200
	add r1, #0x49
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	add r0, r4, r1
	ldr r2, [r4, #0x6c]
	mov r1, #4
	lsr r3, r3, #1
	bl AddTextPrinterParameterized2
	mov r0, #0x52
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238830: .word 0x00010200
	thumb_func_end ov59_022387D0

	thumb_func_start ov59_02238834
ov59_02238834: ; 0x02238834
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r0, #0
	mov r0, #0x4a
	add r6, r1, #0
	lsl r0, r0, #2
	add r7, r4, r0
	add r0, r6, #6
	lsl r0, r0, #4
	str r0, [sp, #0x18]
	add r0, r7, r0
	mov r1, #0
	str r2, [sp, #0x10]
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x68]
	add r1, r6, #5
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0x68]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp]
	mov r1, #0xff
	str r1, [sp, #4]
	ldr r1, _022388C0 ; =_0223CB80
	lsl r2, r6, #2
	ldr r1, [r1, r2]
	ldr r3, [sp, #0x14]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	mov r5, #0x30
	sub r5, r5, r3
	ldr r0, [sp, #0x18]
	lsr r3, r5, #0x1f
	add r3, r5, r3
	ldr r2, [r4, #0x68]
	add r0, r7, r0
	mov r1, #4
	asr r3, r3, #1
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x18]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x95
	lsl r0, r0, #2
	add r4, r4, r0
	add r0, r6, #0
	add r0, #9
	lsl r5, r0, #2
	lsl r2, r6, #1
	ldr r1, [sp, #0x10]
	add r2, #0x1c
	ldr r0, [r4, r5]
	add r1, r1, r2
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, r5]
	bl sub_02024964
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022388C0: .word _0223CB80
	thumb_func_end ov59_02238834

	thumb_func_start ov59_022388C4
ov59_022388C4: ; 0x022388C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov59_02239EA8
	cmp r0, #7
	beq _022388D6
	cmp r0, #8
	beq _022388E2
	b _022388E8
_022388D6:
	add r0, r5, #0
	mov r6, #0xc8
	mov r4, #0x5c
	bl ov59_02238C24
	b _022388FE
_022388E2:
	mov r6, #0xf0
	mov r4, #0xa8
	b _022388FE
_022388E8:
	ldr r1, _02238914 ; =ov59_0223C6C4
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	add r1, r1, #4
	lsl r1, r1, #0x10
	asr r6, r1, #0x10
	ldr r1, _02238918 ; =ov59_0223C6C6
	ldrh r0, [r1, r0]
	sub r0, #0x10
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_022388FE:
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	add r2, r4, #0
	bl sub_0200DD88
	add r0, r5, #0
	bl ov59_02238C7C
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02238914: .word ov59_0223C6C4
_02238918: .word ov59_0223C6C6
	thumb_func_end ov59_022388C4

	thumb_func_start ov59_0223891C
ov59_0223891C: ; 0x0223891C
	mov r2, #0x96
	lsl r2, r2, #2
	ldr r3, _02238928 ; =sub_0202484C
	ldr r0, [r0, r2]
	bx r3
	nop
_02238928: .word Set2dSpriteAnimActiveFlag
	thumb_func_end ov59_0223891C

	thumb_func_start ov59_0223892C
ov59_0223892C: ; 0x0223892C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	add r5, r1, #0
	add r6, r4, r0
	add r0, r5, #0
	add r0, #0xb
	lsl r7, r0, #4
	add r0, r4, #0
	str r0, [sp, #0x14]
	add r0, #0x1a
	str r0, [sp, #0x14]
	ldrb r0, [r0, r5]
	cmp r0, #0
	bne _0223896C
	mov r0, #0x95
	lsl r0, r0, #2
	add r2, r4, r0
	add r0, r5, #2
	lsl r1, r0, #2
	add r0, r2, r1
	str r0, [sp, #0x10]
	ldr r0, [r2, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r6, r7
	bl ClearWindowTilemapAndScheduleTransfer
	b _022389E0
_0223896C:
	mov r0, #0x95
	lsl r0, r0, #2
	add r1, r5, #2
	add r0, r4, r0
	lsl r2, r1, #2
	add r1, r0, r2
	str r1, [sp, #0x10]
	ldr r0, [r0, r2]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r6, r7
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x14]
	ldr r0, [r4, #0x60]
	ldrb r2, [r2, r5]
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x64]
	ldr r2, [r4, #0x74]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r4, #0x64]
	add r2, r0, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _022389F8 ; =0x00010200
	mov r3, ip
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r4, #0x64]
	mov r4, #0x10
	sub r3, r4, r3
	lsr r4, r3, #0x1f
	add r4, r3, r4
	add r0, r6, r7
	asr r3, r4, #1
	bl AddTextPrinterParameterized2
	add r0, r6, r7
	bl ScheduleWindowCopyToVram
_022389E0:
	ldr r1, _022389FC ; =ov59_0223C6C4
	lsl r3, r5, #2
	ldr r2, _02238A00 ; =ov59_0223C6C6
	ldr r0, [sp, #0x10]
	ldrsh r1, [r1, r3]
	ldrsh r2, [r2, r3]
	ldr r0, [r0]
	bl sub_0200DD88
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022389F8: .word 0x00010200
_022389FC: .word ov59_0223C6C4
_02238A00: .word ov59_0223C6C6
	thumb_func_end ov59_0223892C

	thumb_func_start ov59_02238A04
ov59_02238A04: ; 0x02238A04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r0, sp, #0x18
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r1, sp, #0x18
	strb r0, [r1, #1]
	mov r0, #0
	str r0, [sp, #0x10]
	mov r0, #0x4a
	lsl r0, r0, #2
	ldr r6, _02238AA8 ; =ov59_0223C624
	add r7, sp, #0x18
	add r4, r5, r0
_02238A32:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r2, [r7]
	ldr r0, [r5, #0x60]
	mov r1, #0
	mov r3, #1
	bl BufferIntegerAsString
	ldr r0, [r5, #0x60]
	ldr r1, [r5, #0x64]
	ldr r2, [r5, #0x74]
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x10]
	mov r1, #0
	add r0, #8
	lsl r0, r0, #4
	str r0, [sp, #0x14]
	add r0, r4, r0
	bl FillWindowPixelBuffer
	mov r0, #3
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02238AAC ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	ldrb r3, [r6]
	ldr r2, [r5, #0x64]
	add r0, r4, r0
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x14]
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r0, r5, r0
	ldrb r0, [r0, #0x1a]
	cmp r0, #0xa
	blo _02238AA2
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	add r0, r0, #1
	add r6, r6, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	blt _02238A32
_02238AA2:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02238AA8: .word ov59_0223C624
_02238AAC: .word 0x00010200
	thumb_func_end ov59_02238A04

	thumb_func_start ov59_02238AB0
ov59_02238AB0: ; 0x02238AB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r7, r1, #0
	beq _02238B6E
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #6
	str r0, [sp, #0xc]
	mov r0, #0x29
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x54]
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r1, r5, #0
	add r1, #0x4e
	ldrb r1, [r1]
	add r0, r5, #0
	bl ov59_02238A04
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl ov59_02238834
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov59_02238834
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02238C20 ; =0x00010200
	add r2, #0x79
	str r0, [sp, #8]
	add r0, r5, r2
	add r2, r5, #0
	str r1, [sp, #0xc]
	add r2, #0x4d
	ldrb r2, [r2]
	add r3, r1, #0
	lsl r2, r2, #2
	add r2, r5, r2
	add r2, #0xd0
	ldr r2, [r2]
	bl AddTextPrinterParameterized2
	mov r0, #0x5e
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	mov r1, #0x1a
	bl ReadMsgDataIntoString
	mov r0, #0x72
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _02238C20 ; =0x00010200
	add r2, #0xc9
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, r2
	ldr r2, [r5, #0x68]
	mov r3, #2
	bl AddTextPrinterParameterized2
	mov r0, #0x72
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	b _02238BB2
_02238B6E:
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x54]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x18
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x54]
	add r2, r1, #0
	add r3, r1, #0
	bl FillBgTilemapRect
	ldr r0, [r5, #0x54]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0x54]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
_02238BB2:
	add r4, r5, #0
	mov r6, #9
	add r4, #0x24
_02238BB8:
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0xe
	ble _02238BB8
	add r0, r5, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r0, r5, r0
	ldrb r0, [r0, #0x1a]
	cmp r0, #0xa
	bhs _02238C02
	mov r0, #0xa2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x19
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1b
	bl Set2dSpriteAnimSeqNo
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02238C02:
	mov r0, #0xa2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x18
	bl Set2dSpriteAnimSeqNo
	mov r0, #0xa3
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x1a
	bl Set2dSpriteAnimSeqNo
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238C20: .word 0x00010200
	thumb_func_end ov59_02238AB0

	thumb_func_start ov59_02238C24
ov59_02238C24: ; 0x02238C24
	push {r3, lr}
	ldrb r1, [r0, #0x18]
	cmp r1, #0
	bne _02238C34
	mov r1, #1
	bl ov59_02238C40
	pop {r3, pc}
_02238C34:
	ldrb r1, [r0, #0x19]
	add r1, r1, #1
	bl ov59_02238C40
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov59_02238C24

	thumb_func_start ov59_02238C40
ov59_02238C40: ; 0x02238C40
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	mov r6, #0x4e
	add r5, r0, #0
	lsl r6, r6, #2
	add r4, r1, #0
	add r0, r5, r6
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r1, r4, #0
	bl ov59_02239D08
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r5, #0x68]
	add r0, r5, r6
	add r3, r1, #0
	bl AddTextPrinterParameterized
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_02238C40

	thumb_func_start ov59_02238C7C
ov59_02238C7C: ; 0x02238C7C
	push {r4, r5, lr}
	sub sp, #0xc
	mov r5, #0x5a
	add r4, r0, #0
	lsl r5, r5, #2
	add r0, r4, r5
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ov59_02239EA8
	add r1, r0, #0
	cmp r1, #8
	bne _02238CA4
	add r0, r4, r5
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
_02238CA4:
	cmp r1, #6
	bhi _02238CC4
	add r0, r4, r1
	ldrb r0, [r0, #0x1a]
	cmp r0, #0
	bne _02238CBA
	add r0, r4, r5
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
_02238CBA:
	add r0, r4, #0
	add r1, #0xd
	bl ov59_02239D08
	b _02238CDC
_02238CC4:
	ldrb r0, [r4, #0x14]
	cmp r0, #0
	beq _02238CD4
	add r0, r4, #0
	mov r1, #0x15
	bl ov59_02239D08
	b _02238CDC
_02238CD4:
	add r0, r4, #0
	mov r1, #0x14
	bl ov59_02239D08
_02238CDC:
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r4, #0x68]
	add r0, r4, r5
	add r3, r1, #0
	bl AddTextPrinterParameterized
	add r0, r4, r5
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov59_02238C7C

	thumb_func_start ov59_02238CFC
ov59_02238CFC: ; 0x02238CFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r6, #0x4a
	add r5, r0, #0
	lsl r6, r6, #2
	add r7, r1, #0
	add r0, r5, r6
	mov r1, #0xf
	add r4, r2, #0
	bl FillWindowPixelBuffer
	mov r1, #1
	add r0, r5, r6
	add r2, r1, #0
	mov r3, #0xd
	bl DrawFrameAndWindow2
	add r0, r5, #0
	add r1, r7, #0
	bl ov59_02239D08
	cmp r4, #0xff
	beq _02238D4E
	cmp r4, #0
	beq _02238D4E
	mov r0, #1
	bl sub_02002B8C
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	add r0, r5, r6
	mov r1, #1
	bl AddTextPrinterParameterized
	add r1, r5, #0
	add r1, #0x47
	strb r0, [r1]
	b _02238D68
_02238D4E:
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	add r0, r5, r6
	mov r1, #1
	bl AddTextPrinterParameterized
	add r0, r5, #0
	mov r1, #0xff
	add r0, #0x47
	strb r1, [r0]
_02238D68:
	add r0, r5, r6
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov59_02238CFC

	thumb_func_start ov59_02238D74
ov59_02238D74: ; 0x02238D74
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r4, pc}
	thumb_func_end ov59_02238D74

	thumb_func_start ov59_02238D90
ov59_02238D90: ; 0x02238D90
	push {r4, r5, lr}
	sub sp, #0xc
	mov r4, #0x4a
	add r5, r0, #0
	lsl r4, r4, #2
	add r0, r5, r4
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r1, #1
	add r0, r5, r4
	add r2, r1, #0
	mov r3, #0xd
	bl DrawFrameAndWindow2
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x2a
	mov r2, #0
	bl ov59_02239E0C
	add r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	add r0, r5, r4
	mov r1, #1
	bl AddTextPrinterParameterized
	ldrh r0, [r5, #0x2a]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #5
	bne _02238DEC
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
_02238DEC:
	add r0, r5, #0
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #1
	bls _02238E22
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x2c
	mov r2, #1
	bl ov59_02239E0C
	add r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	bl ReadMsgDataIntoString
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	add r0, r5, r4
	mov r1, #1
	bl AddTextPrinterParameterized
_02238E22:
	add r0, r5, #0
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #2
	bls _02238E5A
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x2e
	mov r2, #2
	bl ov59_02239E0C
	add r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	bl ReadMsgDataIntoString
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	add r0, r5, r4
	mov r1, #1
	bl AddTextPrinterParameterized
	b _02238E8E
_02238E5A:
	add r0, #0xff
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02238E8E
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	mov r1, #0x7a
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0x36
	ldrb r0, [r0]
	mov r3, #0
	mov r1, #1
	sub r0, r0, #1
	lsl r0, r0, #4
	add r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r3, [sp, #8]
	ldr r2, [r5, #0x68]
	add r0, r5, r4
	bl AddTextPrinterParameterized
_02238E8E:
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov59_02238D90

	thumb_func_start ov59_02238E98
ov59_02238E98: ; 0x02238E98
	push {r4, r5, lr}
	sub sp, #0x24
	add r4, r0, #0
	add r0, sp, #0xc
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r0, _02238F14 ; =ov59_0223C630
	add r2, sp, #0xc
	ldrh r3, [r0, #0xc]
	ldr r5, _02238F18 ; =ov59_0223C66A
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
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x54]
	str r0, [sp, #0x1c]
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	sub r0, r0, #1
	lsl r3, r0, #3
	ldr r0, _02238F1C ; =ov59_0223C668
	ldrh r0, [r0, r3]
	strb r0, [r2, #0x14]
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	sub r0, r0, #1
	lsl r3, r0, #3
	ldr r0, _02238F20 ; =ov59_0223C66B
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, [r4, #0x40]
	ldr r0, [r4, #0x58]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_020185FC
	mov r1, #0xa6
	lsl r1, r1, #2
	str r0, [r4, r1]
	add sp, #0x24
	pop {r4, r5, pc}
	.balign 4, 0
_02238F14: .word ov59_0223C630
_02238F18: .word ov59_0223C66A
_02238F1C: .word ov59_0223C668
_02238F20: .word ov59_0223C66B
	thumb_func_end ov59_02238E98

	thumb_func_start ov59_02238F24
ov59_02238F24: ; 0x02238F24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020186A4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _02238F54
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02018674
	str r0, [r5, #0x40]
	mov r0, #0xa6
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02018680
	add r0, r4, #0
_02238F54:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov59_02238F24

	thumb_func_start ov59_02238F58
ov59_02238F58: ; 0x02238F58
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #0x54]
	mov r1, #0x19
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x6a
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	mov r1, #5
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	mov r2, #0xf
	bic r1, r2
	ldr r2, [r4, #0x40]
	lsl r2, r2, #0x18
	lsr r3, r2, #0x18
	mov r2, #0xf
	and r2, r3
	orr r1, r2
	strb r1, [r0, #0x12]
	ldrb r2, [r0, #0x12]
	mov r1, #0xf0
	bic r2, r1
	mov r1, #0x10
	orr r1, r2
	strb r1, [r0, #0x12]
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0
	bl sub_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov59_02238F58

	thumb_func_start ov59_02238FB4
ov59_02238FB4: ; 0x02238FB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _02238FCC
	cmp r0, #2
	beq _02238FD0
	b _02238FD4
_02238FCC:
	mov r4, #1
	b _02238FDA
_02238FD0:
	mov r4, #0
	b _02238FDA
_02238FD4:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02238FDA:
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020169C0
	str r0, [r5, #0x40]
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020169CC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_02238FB4

	thumb_func_start ov59_02238FF4
ov59_02238FF4: ; 0x02238FF4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	sub r0, r7, #1
	cmp r0, #1
	bhi _02239062
	mov r4, #0
	add r5, r6, #0
_02239004:
	add r0, r6, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r4, r0
	bne _02239020
	cmp r7, #2
	bne _02239020
	mov r0, #0x97
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_02024B78
	b _0223902C
_02239020:
	mov r0, #0x97
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024B78
_0223902C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _02239004
	add r0, r6, #0
	mov r1, #0
	bl ov59_0223891C
	add r0, r6, #0
	mov r1, #2
	bl ov59_022387D0
	add r0, r6, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #7
	bhs _022390A6
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r6, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	bl sub_02024ADC
	pop {r3, r4, r5, r6, r7, pc}
_02239062:
	mov r7, #0x97
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_0223906A:
	ldr r0, [r4, r7]
	mov r1, #0
	bl sub_02024B78
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #7
	blt _0223906A
	add r0, r6, #0
	mov r1, #1
	bl ov59_0223891C
	add r0, r6, #0
	mov r1, #0
	bl ov59_022387D0
	add r0, r6, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #7
	bhs _022390A6
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r6, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #3
	bl sub_02024ADC
_022390A6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov59_02238FF4

	thumb_func_start ov59_022390A8
ov59_022390A8: ; 0x022390A8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	ldrh r0, [r4, #0x3e]
	beq _02239132
	cmp r0, #0
	beq _022390BC
	cmp r0, #1
	beq _022390D8
	b _02239198
_022390BC:
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	add r0, #0x51
	strb r1, [r0]
	ldrh r0, [r4, #0x3e]
	add r0, r0, #1
	strh r0, [r4, #0x3e]
	b _02239198
_022390D8:
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	mov r2, #2
	bl sub_0200DEA0
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	sub r2, r1, #1
	bl sub_0200DEA0
	add r0, r4, #0
	add r0, #0x51
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x51
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x51
	strb r1, [r0]
	cmp r2, #2
	blo _02239198
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	add r0, #0x51
	strb r1, [r0]
	strh r1, [r4, #0x3e]
	mov r0, #1
	pop {r4, pc}
_02239132:
	cmp r0, #0
	beq _0223913C
	cmp r0, #1
	beq _02239158
	b _02239198
_0223913C:
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	add r0, #0x51
	strb r1, [r0]
	ldrh r0, [r4, #0x3e]
	add r0, r0, #1
	strh r0, [r4, #0x3e]
	b _02239198
_02239158:
	mov r0, #0x96
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r4, r0]
	sub r2, r1, #2
	bl sub_0200DEA0
	add r0, r4, #0
	add r0, #0x51
	ldrb r2, [r0]
	add r0, r4, #0
	add r0, #0x51
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x51
	strb r1, [r0]
	cmp r2, #3
	blo _02239198
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl Set2dSpriteAnimSeqNo
	add r0, r4, #0
	mov r1, #0
	add r0, #0x51
	strb r1, [r0]
	strh r1, [r4, #0x3e]
	mov r0, #1
	pop {r4, pc}
_02239198:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov59_022390A8

	thumb_func_start ov59_0223919C
ov59_0223919C: ; 0x0223919C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, [r7]
	add r5, r1, #0
	mov r1, #0x20
	add r6, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r7, #0
	add r0, #0x4d
	str r7, [r4]
	ldrb r0, [r0]
	cmp r5, #0
	strb r0, [r4, #7]
	bne _022391DA
	add r0, r7, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r7, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	b _022391E0
_022391DA:
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r7, r0]
_022391E0:
	str r0, [r4, #0x1c]
	add r1, sp, #8
	ldr r0, [r4, #0x1c]
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE00
	cmp r6, #0
	bne _02239202
	lsl r0, r5, #2
	add r0, #0xc0
	strh r0, [r4, #8]
	mov r0, #9
	mvn r0, r0
	mul r0, r5
	add r0, #0x60
	b _02239220
_02239202:
	ldrb r0, [r4, #7]
	lsl r1, r0, #2
	ldr r0, _022393C8 ; =ov59_0223C6C4
	ldrh r1, [r0, r1]
	lsl r0, r5, #2
	add r0, r1, r0
	strh r0, [r4, #8]
	ldrb r0, [r4, #7]
	lsl r1, r0, #2
	ldr r0, _022393CC ; =ov59_0223C6C6
	ldrh r1, [r0, r1]
	mov r0, #9
	mvn r0, r0
	mul r0, r5
	add r0, r1, r0
_02239220:
	strh r0, [r4, #0xa]
	mov r0, #8
	ldrsh r2, [r4, r0]
	add r0, sp, #8
	mov r1, #2
	ldrsh r1, [r0, r1]
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r5, r1, #0x10
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	mov r1, #0
	ldrsh r0, [r0, r1]
	sub r0, r2, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	bpl _02239246
	neg r0, r6
	b _02239248
_02239246:
	add r0, r6, #0
_02239248:
	cmp r5, #0
	bge _02239250
	neg r1, r5
	b _02239252
_02239250:
	add r1, r5, #0
_02239252:
	cmp r1, r0
	blt _0223926C
	cmp r5, #0
	bge _0223925E
	neg r1, r5
	b _02239260
_0223925E:
	add r1, r5, #0
_02239260:
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	strb r0, [r4, #5]
	b _02239280
_0223926C:
	cmp r6, #0
	bge _02239274
	neg r1, r6
	b _02239276
_02239274:
	add r1, r6, #0
_02239276:
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	strb r0, [r4, #5]
_02239280:
	add r1, sp, #8
	mov r0, #2
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ble _0223929C
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022392AA
_0223929C:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022392AA:
	bl _ffix
	str r0, [r4, #0x14]
	add r1, sp, #8
	mov r0, #0
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ble _022392CC
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022392DA
_022392CC:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022392DA:
	bl _ffix
	str r0, [r4, #0x18]
	mov r0, #0
	strb r0, [r4, #6]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _022392FE
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #4]
	b _0223930E
_022392FE:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #4]
_0223930E:
	cmp r5, #0
	ble _02239324
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02239332
_02239324:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02239332:
	bl _ffix
	add r5, r0, #0
	ldr r0, [sp, #4]
	bl _ffix
	add r1, r0, #0
	add r0, r5, #0
	bl FX_Div
	str r0, [r4, #0xc]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _02239362
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp]
	b _02239372
_02239362:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp]
_02239372:
	cmp r6, #0
	ble _02239388
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02239396
_02239388:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02239396:
	bl _ffix
	add r5, r0, #0
	ldr r0, [sp]
	bl _ffix
	add r1, r0, #0
	add r0, r5, #0
	bl FX_Div
	str r0, [r4, #0x10]
	ldr r0, _022393D0 ; =ov59_02239C90
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add r0, r7, #0
	add r0, #0x50
	ldrb r0, [r0]
	add r7, #0x50
	add r0, r0, #1
	strb r0, [r7]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022393C8: .word ov59_0223C6C4
_022393CC: .word ov59_0223C6C6
_022393D0: .word ov59_02239C90
	thumb_func_end ov59_0223919C

	thumb_func_start ov59_022393D4
ov59_022393D4: ; 0x022393D4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022393E6
	bl sub_0200D034
_022393E6:
	bl NNS_GfdDoVramTransfer
	ldr r0, [r4, #0x54]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02239400 ; =0x027E0000
	ldr r1, _02239404 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02239400: .word 0x027E0000
_02239404: .word 0x00003FF8
	thumb_func_end ov59_022393D4

	thumb_func_start ov59_02239408
ov59_02239408: ; 0x02239408
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _02239424 ; =ov59_0223C770
	add r3, sp, #0
	mov r2, #5
_02239412:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02239412
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_02239424: .word ov59_0223C770
	thumb_func_end ov59_02239408

	thumb_func_start ov59_02239428
ov59_02239428: ; 0x02239428
	push {r3, r4, r5, lr}
	sub sp, #0xb8
	add r4, r0, #0
	bl ov59_02239408
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0xa8
	ldr r5, _02239594 ; =ov59_0223C658
	str r0, [r4, #0x54]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r2, _02239598 ; =0x04000304
	ldr r0, _0223959C ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _022395A0 ; =ov59_0223C718
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
	mov r1, #4
	str r0, [r3]
	ldr r0, [r4, #0x54]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022395A4 ; =ov59_0223C68C
	add r3, sp, #0x70
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
	ldr r0, [r4, #0x54]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022395A8 ; =ov59_0223C6A8
	add r3, sp, #0x54
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
	ldr r0, [r4, #0x54]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022395AC ; =ov59_0223C6FC
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
	ldr r0, [r4, #0x54]
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022395B0 ; =ov59_0223C734
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
	ldr r0, [r4, #0x54]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _022395B4 ; =ov59_0223C6E0
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
	ldr r0, [r4, #0x54]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
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
	mov r1, #0x40
	mov r2, #0
	bl BG_ClearCharDataRange
	add sp, #0xb8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239594: .word ov59_0223C658
_02239598: .word 0x04000304
_0223959C: .word 0xFFFF7FFF
_022395A0: .word ov59_0223C718
_022395A4: .word ov59_0223C68C
_022395A8: .word ov59_0223C6A8
_022395AC: .word ov59_0223C6FC
_022395B0: .word ov59_0223C734
_022395B4: .word ov59_0223C6E0
	thumb_func_end ov59_02239428

	thumb_func_start ov59_022395B8
ov59_022395B8: ; 0x022395B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	bl FreeToHeap
	ldr r2, _02239600 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_02239600: .word 0x04000304
	thumb_func_end ov59_022395B8

	thumb_func_start ov59_02239604
ov59_02239604: ; 0x02239604
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xdc
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
	mov r1, #4
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	add r0, r4, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #5
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	add r0, r4, #0
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
	mov r1, #1
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	add r0, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #2
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x54]
	add r0, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x29
	lsl r0, r0, #4
	str r4, [r5, r0]
	add r0, r5, #0
	add r0, #0x46
	ldrb r0, [r0]
	mov r1, #0
	mov r2, #1
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #0xd
	str r0, [sp, #4]
	ldr r0, [r5, #0x54]
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
	mov r0, #0x1a
	str r0, [sp]
	ldr r0, _022396E0 ; =0x04000050
	mov r1, #0
	mov r2, #8
	mov r3, #6
	bl G2x_SetBlendAlpha_
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022396E0: .word 0x04000050
	thumb_func_end ov59_02239604

	thumb_func_start ov59_022396E4
ov59_022396E4: ; 0x022396E4
	push {r3, lr}
	mov r1, #0x29
	lsl r1, r1, #4
	ldr r0, [r0, r1]
	bl NARC_dtor
	mov r1, #0
	ldr r0, _02239700 ; =0x04000050
	add r2, r1, #0
	mov r3, #0x1f
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_02239700: .word 0x04000050
	thumb_func_end ov59_022396E4

	thumb_func_start ov59_02239704
ov59_02239704: ; 0x02239704
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x15
	bl NewMsgDataFromNarc
	str r0, [r5, #0x5c]
	ldr r2, [r5]
	mov r0, #0x10
	mov r1, #0x20
	bl ScrStrBufs_new_custom
	str r0, [r5, #0x60]
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r5, #0x64]
	mov r0, #1
	ldr r1, [r5]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r5, #0x68]
	ldr r0, [r5, #0x5c]
	mov r1, #1
	bl NewString_ReadMsgData
	str r0, [r5, #0x6c]
	ldr r0, [r5, #0x5c]
	mov r1, #0x19
	bl NewString_ReadMsgData
	str r0, [r5, #0x74]
	mov r6, #0
	add r4, r5, #0
_0223975A:
	add r1, r6, #0
	ldr r0, [r5, #0x5c]
	add r1, #0x1b
	bl NewString_ReadMsgData
	str r0, [r4, #0x78]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x16
	blt _0223975A
	mov r4, #0
	add r6, r5, #0
_02239772:
	ldr r0, [r5, #0x5c]
	add r1, r4, #7
	bl NewString_ReadMsgData
	add r1, r6, #0
	add r1, #0xd0
	add r4, r4, #1
	add r6, r6, #4
	str r0, [r1]
	cmp r4, #7
	blt _02239772
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_02239704

	thumb_func_start ov59_0223978C
ov59_0223978C: ; 0x0223978C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02239794:
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _02239794
	mov r5, #0
	add r4, r6, #0
_022397AA:
	ldr r0, [r4, #0x78]
	bl String_dtor
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x16
	blt _022397AA
	ldr r0, [r6, #0x74]
	bl String_dtor
	ldr r0, [r6, #0x6c]
	bl String_dtor
	ldr r0, [r6, #0x68]
	bl String_dtor
	ldr r0, [r6, #0x64]
	bl String_dtor
	ldr r0, [r6, #0x60]
	bl ScrStrBufs_delete
	ldr r0, [r6, #0x5c]
	bl DestroyMsgData
	mov r0, #4
	bl FontID_Release
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223978C

	thumb_func_start ov59_022397E4
ov59_022397E4: ; 0x022397E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov r1, #0x4a
	mov r6, #0
	lsl r1, r1, #2
	ldr r4, _0223989C ; =ov59_0223C798
	str r0, [sp, #0x14]
	add r5, r0, r1
	add r7, r6, #0
_022397F6:
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	ldr r0, [r0, #0x54]
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #0xb
	blt _022397F6
	mov r7, #0x6f
	lsl r7, r7, #2
	add r1, r7, #0
	ldr r0, [sp, #0x14]
	sub r1, #0x94
	add r0, r0, r1
	mov r4, #0
	mov r6, #6
	str r0, [sp, #0x18]
_02239826:
	add r0, r4, #0
	add r0, #0xb
	lsl r0, r0, #4
	str r0, [sp, #0x1c]
	lsr r3, r4, #0x1f
	str r3, [sp, #0x20]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r5, [sp, #0x20]
	lsl r3, r4, #0x1f
	sub r3, r3, r5
	mov r5, #0x1f
	ror r3, r5
	ldr r5, [sp, #0x20]
	ldr r2, [sp, #0x18]
	add r5, r5, r3
	mov r3, #6
	mul r3, r5
	ldr r1, [sp, #0x1c]
	add r3, r3, #5
	lsl r3, r3, #0x18
	add r1, r2, r1
	ldr r0, [r0, #0x54]
	mov r2, #2
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	add r0, r1, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r4, r4, #1
	add r7, r7, #4
	add r6, r6, #2
	cmp r4, #7
	blt _02239826
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl sub_0201660C
	mov r2, #0x92
	ldr r1, [sp, #0x14]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0223989C: .word ov59_0223C798
	thumb_func_end ov59_022397E4

	thumb_func_start ov59_022398A0
ov59_022398A0: ; 0x022398A0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x4a
	lsl r0, r0, #2
	mov r4, #0
	add r5, r6, r0
_022398AC:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x12
	blt _022398AC
	mov r0, #0x92
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_02016624
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_022398A0

	thumb_func_start ov59_022398CC
ov59_022398CC: ; 0x022398CC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02239910
	sub r0, r0, #1
	lsl r7, r0, #3
	ldr r0, _02239914 ; =ov59_0223C668
	ldr r1, [r6]
	add r5, r0, r7
	ldrh r0, [r0, r7]
	bl ListMenuItems_ctor
	mov r1, #0xa5
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, _02239914 ; =ov59_0223C668
	mov r4, #0
	ldrh r0, [r0, r7]
	cmp r0, #0
	ble _02239910
	add r7, r1, #0
_022398FA:
	ldr r2, [r5, #4]
	ldr r0, [r6, r7]
	ldrb r2, [r2, r4]
	ldr r1, [r6, #0x5c]
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	ldrh r0, [r5]
	add r4, r4, #1
	cmp r4, r0
	blt _022398FA
_02239910:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239914: .word ov59_0223C668
	thumb_func_end ov59_022398CC

	thumb_func_start ov59_02239918
ov59_02239918: ; 0x02239918
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	beq _02239936
	mov r0, #0xa5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ListMenuItems_dtor
	mov r0, #0xa5
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_02239936:
	pop {r4, pc}
	thumb_func_end ov59_02239918

	thumb_func_start ov59_02239938
ov59_02239938: ; 0x02239938
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r4]
	bl sub_0200CF18
	mov r1, #0x93
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _022399A8 ; =ov59_0223C750
	ldr r2, _022399AC ; =ov59_0223C678
	mov r3, #3
	bl sub_0200CF70
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	mov r0, #0x93
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200CF38
	mov r1, #0x25
	lsl r1, r1, #4
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xf
	bl sub_0200CFF4
	mov r3, #0
	mov r1, #0x93
	str r3, [sp]
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _022399B0 ; =ov59_0223C648
	bl sub_0200D2A4
	ldr r0, [r4]
	mov r1, #0
	bl sub_02018424
	str r0, [r4, #0x58]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_022399A8: .word ov59_0223C750
_022399AC: .word ov59_0223C678
_022399B0: .word ov59_0223C648
	thumb_func_end ov59_02239938

	thumb_func_start ov59_022399B4
ov59_022399B4: ; 0x022399B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x58]
	bl sub_02018474
	mov r1, #0x93
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D0E4
	mov r0, #0x25
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D108
	mov r0, #0x93
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	pop {r4, pc}
	thumb_func_end ov59_022399B4

	thumb_func_start ov59_022399F0
ov59_022399F0: ; 0x022399F0
	push {r4, lr}
	add r4, r0, #0
	bl ov59_02239938
	add r0, r4, #0
	bl ov59_02239A24
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	thumb_func_end ov59_022399F0

	thumb_func_start ov59_02239A08
ov59_02239A08: ; 0x02239A08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov59_02239C70
	add r0, r4, #0
	bl ov59_022399B4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_02239A08

	thumb_func_start ov59_02239A24
ov59_02239A24: ; 0x02239A24
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r6, _02239C5C ; =ov59_0223C7F0
	mov r7, #0
	add r4, r5, #0
_02239A2E:
	mov r0, #0x93
	mov r1, #0x25
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200D2B4
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r7, r7, #1
	add r6, #0x28
	add r4, r4, #4
	cmp r7, #1
	ble _02239A2E
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_02024A04
	ldr r6, _02239C60 ; =ov59_0223C6C4
	mov r7, #0
_02239A76:
	add r0, r7, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r4, r5, r0
	mov r0, #0x93
	mov r1, #0x25
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _02239C64 ; =ov59_0223C840
	bl sub_0200D2B4
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r4, r0]
	bl sub_0200DD88
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x95
	lsl r0, r0, #2
	add r1, r7, #0
	ldr r0, [r4, r0]
	add r1, #9
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_02024A04
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #7
	blt _02239A76
	add r0, r5, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #1
	beq _02239AF0
	cmp r0, #2
	beq _02239B56
	pop {r3, r4, r5, r6, r7, pc}
_02239AF0:
	ldr r7, _02239C5C ; =ov59_0223C7F0
	mov r4, #0
_02239AF4:
	add r0, r4, #0
	add r0, #9
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r6, r5, r0
	mov r0, #0x93
	mov r1, #0x25
	lsl r0, r0, #2
	lsl r1, r1, #4
	add r3, r4, #3
	mov r2, #0x28
	mul r2, r3
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r7, r2
	bl sub_0200D2B4
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r1, #0
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	add r4, r4, #1
	cmp r4, #2
	blt _02239AF4
	mov r0, #0x9e
	ldrb r1, [r5, #0x14]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, #0x10
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x9e
	ldrb r1, [r5, #0x17]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r1, #5
	bl sub_02024A14
	pop {r3, r4, r5, r6, r7, pc}
_02239B56:
	mov r0, #0x1c
	mov r7, #0
	mov r6, #0x70
	str r0, [sp]
_02239B5E:
	add r0, r7, #0
	add r0, #9
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r4, r5, r0
	mov r0, #0x93
	mov r1, #0x25
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _02239C68 ; =ov59_0223C8B8
	bl sub_0200D2B4
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	lsl r2, r6, #0x10
	ldr r0, [r4, r0]
	mov r1, #0xa0
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, [sp]
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024A04
	ldr r0, [sp]
	add r7, r7, #1
	add r0, r0, #2
	add r6, #0x18
	str r0, [sp]
	cmp r7, #2
	blt _02239B5E
	mov r6, #0
_02239BCE:
	add r0, r6, #0
	add r0, #0xb
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r4, r5, r0
	mov r0, #0x93
	mov r1, #0x25
	lsl r0, r0, #2
	lsl r1, r1, #4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r2, _02239C6C ; =ov59_0223C8E0
	bl sub_0200D2B4
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r4, r1]
	lsr r1, r6, #0x1f
	lsl r2, r6, #0x1f
	sub r2, r2, r1
	mov r0, #0x1f
	ror r2, r0
	add r7, r1, r2
	add r1, r6, r1
	asr r2, r1, #1
	mov r1, #0x15
	mvn r1, r1
	mul r1, r2
	mov r2, #0x28
	mov r0, #0x95
	mul r2, r7
	lsl r0, r0, #2
	add r1, #0x67
	add r2, #0x60
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4, r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x95
	lsl r0, r0, #2
	lsl r1, r7, #1
	ldr r0, [r4, r0]
	add r1, #0x18
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024A04
	add r6, r6, #1
	cmp r6, #4
	blt _02239BCE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239C5C: .word ov59_0223C7F0
_02239C60: .word ov59_0223C6C4
_02239C64: .word ov59_0223C840
_02239C68: .word ov59_0223C8B8
_02239C6C: .word ov59_0223C8E0
	thumb_func_end ov59_02239A24

	thumb_func_start ov59_02239C70
ov59_02239C70: ; 0x02239C70
	push {r4, r5, r6, lr}
	mov r6, #0x95
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_02239C7A:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _02239C84
	bl sub_02024758
_02239C84:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xf
	blt _02239C7A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_02239C70

	thumb_func_start ov59_02239C90
ov59_02239C90: ; 0x02239C90
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5, #4]
	ldr r4, [r5]
	cmp r0, #0
	beq _02239CA4
	cmp r0, #1
	b _02239CDE
_02239CA4:
	ldr r0, [r5, #0x14]
	add r1, sp, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	bl sub_020247D4
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x10]
	add r0, r1, r0
	str r0, [r5, #0x18]
	ldrb r1, [r5, #6]
	add r0, r1, #1
	strb r0, [r5, #6]
	ldrb r0, [r5, #5]
	cmp r1, r0
	blo _02239D04
	ldrb r0, [r5, #4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r5, #4]
	pop {r3, r4, r5, r6, pc}
_02239CDE:
	mov r1, #8
	mov r2, #0xa
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x1c]
	bl sub_0200DD88
	add r0, r4, #0
	add r0, #0x50
	ldrb r0, [r0]
	add r4, #0x50
	sub r0, r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_02239D04:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov59_02239C90

	thumb_func_start ov59_02239D08
ov59_02239D08: ; 0x02239D08
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	beq _02239D1E
	cmp r4, #0xc
	beq _02239D3A
	cmp r4, #0x15
	beq _02239D7E
	b _02239DDE
_02239D1E:
	ldr r0, [r5, #0x10]
	bl sub_02031C08
	mov r1, #0
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	add r6, r0, #0
	mov r2, #5
	ldr r0, [r5, #0x60]
	sub r2, r2, r6
	bl BufferIntegerAsString
	b _02239DEE
_02239D3A:
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #1
	ldr r0, [r5, #0x60]
	bls _02239D56
	add r2, r5, #0
	add r2, #0x4d
	ldrb r3, [r2]
	ldr r2, _02239E08 ; =0x000001E5
	mov r1, #0
	add r2, r3, r2
	bl BufferItemNamePlural
	b _02239D66
_02239D56:
	add r2, r5, #0
	add r2, #0x4d
	ldrb r3, [r2]
	ldr r2, _02239E08 ; =0x000001E5
	mov r1, #0
	add r2, r3, r2
	bl BufferItemName
_02239D66:
	mov r0, #0
	add r2, r5, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	add r2, #0x4e
	ldrb r2, [r2]
	ldr r0, [r5, #0x60]
	mov r3, #2
	bl BufferIntegerAsString
	b _02239DEE
_02239D7E:
	add r0, #0x22
	bl sub_02032004
	add r1, r0, #0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x64]
	add r1, #0x13
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x60]
	ldr r2, [r5, #0x64]
	bl BufferString
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldrb r2, [r5, #0x15]
	ldr r0, [r5, #0x60]
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r2, [r5, #0x16]
	ldr r0, [r5, #0x60]
	mov r1, #2
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldrb r6, [r5, #0x18]
	mov r2, #5
	ldr r0, [r5, #0x60]
	mov r1, #3
	sub r2, r2, r6
	bl BufferIntegerAsString
	b _02239DEE
_02239DDE:
	add r4, #0x1b
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	add sp, #8
	pop {r4, r5, r6, pc}
_02239DEE:
	add r4, #0x1b
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x64]
	add r1, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x60]
	ldr r1, [r5, #0x68]
	ldr r2, [r5, #0x64]
	bl StringExpandPlaceholders
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02239E08: .word 0x000001E5
	thumb_func_end ov59_02239D08

	thumb_func_start ov59_02239E0C
ov59_02239E0C: ; 0x02239E0C
	push {r3, r4}
	ldrh r4, [r1]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x1c
	sub r3, r0, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	cmp r2, #0
	beq _02239E78
	cmp r2, #1
	beq _02239E5C
	cmp r2, #2
	bne _02239E78
	lsl r1, r4, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #6
	bne _02239E34
	mov r0, #0x7a
	pop {r3, r4}
	bx lr
_02239E34:
	cmp r1, #5
	bne _02239E3E
	mov r0, #0x79
	pop {r3, r4}
	bx lr
_02239E3E:
	cmp r0, #0
	bne _02239E4C
	add r1, #0x7b
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E4C:
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r3, r0
	add r0, #0x6a
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E5C:
	lsl r0, r4, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #6
	bne _02239E6A
	mov r0, #0x7a
	pop {r3, r4}
	bx lr
_02239E6A:
	lsl r0, r0, #2
	add r0, r3, r0
	add r0, #0x56
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E78:
	ldrh r0, [r1]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	cmp r1, #6
	bne _02239E88
	mov r0, #0x83
	pop {r3, r4}
	bx lr
_02239E88:
	cmp r1, #5
	bne _02239E96
	add r3, #0x80
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
_02239E96:
	mov r0, #6
	mul r0, r1
	add r0, r3, r0
	add r0, #0x38
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov59_02239E0C

	thumb_func_start ov59_02239EA8
ov59_02239EA8: ; 0x02239EA8
	add r1, r0, #0
	add r1, #0x49
	ldrb r1, [r1]
	cmp r1, #3
	bhi _02239EF2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02239EBE: ; jump table
	.short _02239EC6 - _02239EBE - 2 ; case 0
	.short _02239ED0 - _02239EBE - 2 ; case 1
	.short _02239EDE - _02239EBE - 2 ; case 2
	.short _02239EEE - _02239EBE - 2 ; case 3
_02239EC6:
	add r0, #0x4a
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	bx lr
_02239ED0:
	add r0, #0x4a
	ldrb r0, [r0]
	lsl r0, r0, #1
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_02239EDE:
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #1
	bne _02239EEA
	mov r0, #7
	bx lr
_02239EEA:
	mov r0, #8
	bx lr
_02239EEE:
	mov r0, #8
	bx lr
_02239EF2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov59_02239EA8

	thumb_func_start ov59_02239EF8
ov59_02239EF8: ; 0x02239EF8
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov59_0223A120
	ldr r1, [sp]
	cmp r1, #0
	bne _02239F14
	add r0, r4, #0
	bl ov59_0223A0B8
_02239F14:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_02239EF8

	thumb_func_start ov59_02239F18
ov59_02239F18: ; 0x02239F18
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov59_0223A2D0
	ldr r1, [sp]
	cmp r1, #0
	bne _02239F34
	add r0, r4, #0
	bl ov59_0223A268
_02239F34:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_02239F18

	thumb_func_start ov59_02239F38
ov59_02239F38: ; 0x02239F38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r2, sp, #0
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r1, #2
	bl sub_0200DE00
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, _0223A028 ; =ov59_0223C940
	bl sub_020253F0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	bl System_GetTouchHeld
	cmp r0, #0
	beq _0223A00A
	ldr r0, _0223A02C ; =gSystem + 0x40
	add r2, sp, #0
	ldrh r1, [r0, #0x20]
	mov r3, #0
	strh r1, [r2, #2]
	ldrh r0, [r0, #0x22]
	strh r0, [r2]
	add r0, r5, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	bl sub_0200DD88
	mov r0, #0x96
	lsl r0, r0, #2
	add r3, sp, #0
	mov r2, #0
	ldrsh r2, [r3, r2]
	mov r1, #2
	ldrsh r1, [r3, r1]
	sub r2, r2, #6
	lsl r2, r2, #0x10
	ldr r0, [r5, r0]
	asr r2, r2, #0x10
	bl sub_0200DD88
	cmp r4, #0
	beq _02239FE0
	add r0, r5, #0
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	bne _0223A004
	add r0, r5, #0
	mov r1, #1
	add r0, #0x53
	strb r1, [r0]
	ldr r0, _0223A030 ; =0x000008E6
	bl PlaySE
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x15
	bl Set2dSpriteAnimSeqNo
	b _0223A004
_02239FE0:
	add r0, r5, #0
	add r0, #0x53
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223A004
	add r0, r5, #0
	mov r1, #0
	add r0, #0x53
	strb r1, [r0]
	ldr r0, _0223A030 ; =0x000008E6
	bl PlaySE
	mov r0, #0x9f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x14
	bl Set2dSpriteAnimSeqNo
_0223A004:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0223A00A:
	mov r0, #0
	add r5, #0x53
	strb r0, [r5]
	cmp r4, #0
	beq _0223A01E
	ldr r0, _0223A034 ; =0x000005EA
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223A01E:
	ldr r0, _0223A038 ; =0x00000682
	bl PlaySE
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A028: .word ov59_0223C940
_0223A02C: .word gSystem + 0x40
_0223A030: .word 0x000008E6
_0223A034: .word 0x000005EA
_0223A038: .word 0x00000682
	thumb_func_end ov59_02239F38

	thumb_func_start ov59_0223A03C
ov59_0223A03C: ; 0x0223A03C
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov59_0223A418
	ldr r1, [sp]
	cmp r1, #0
	bne _0223A058
	add r0, r4, #0
	bl ov59_0223A3B0
_0223A058:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_0223A03C

	thumb_func_start ov59_0223A05C
ov59_0223A05C: ; 0x0223A05C
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov59_0223A614
	ldr r1, [sp]
	cmp r1, #0
	bne _0223A078
	add r0, r4, #0
	bl ov59_0223A58C
_0223A078:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_0223A05C

	thumb_func_start ov59_0223A07C
ov59_0223A07C: ; 0x0223A07C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	bhi _0223A09A
	ldr r0, _0223A0B4 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl ov59_022388C4
	add r5, #0x4d
	strb r4, [r5]
	mov r0, #3
	pop {r3, r4, r5, pc}
_0223A09A:
	cmp r4, #8
	bne _0223A0B0
	ldr r0, _0223A0B4 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov59_022387D0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223A0B0:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A0B4: .word 0x000005DC
	thumb_func_end ov59_0223A07C

	thumb_func_start ov59_0223A0B8
ov59_0223A0B8: ; 0x0223A0B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A114 ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _0223A118 ; =0x00000CF3
	tst r0, r1
	beq _0223A0CA
	mov r0, #0
	str r0, [r4, #0x40]
_0223A0CA:
	ldr r0, _0223A114 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0223A0DE
	add r0, r4, #0
	mov r1, #8
	bl ov59_0223A07C
	pop {r4, pc}
_0223A0DE:
	mov r0, #1
	tst r0, r1
	beq _0223A0F4
	add r0, r4, #0
	bl ov59_02239EA8
	add r1, r0, #0
	add r0, r4, #0
	bl ov59_0223A07C
	pop {r4, pc}
_0223A0F4:
	add r0, r4, #0
	bl ov59_0223A678
	cmp r0, #0
	beq _0223A10E
	ldr r0, _0223A11C ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov59_022388C4
	mov r0, #3
	pop {r4, pc}
_0223A10E:
	mov r0, #3
	pop {r4, pc}
	nop
_0223A114: .word gSystem
_0223A118: .word 0x00000CF3
_0223A11C: .word 0x000005DC
	thumb_func_end ov59_0223A0B8

	thumb_func_start ov59_0223A120
ov59_0223A120: ; 0x0223A120
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0223A190 ; =ov59_0223C924
	add r5, r1, #0
	bl sub_0202529C
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0223A13A
	cmp r1, #7
	bne _0223A13E
_0223A13A:
	mov r0, #3
	pop {r3, r4, r5, pc}
_0223A13E:
	mov r0, #1
	str r0, [r5]
	add r2, r4, #0
	str r0, [r4, #0x40]
	mov r0, #0
	add r2, #0x4c
	strb r0, [r2]
	add r2, r4, #0
	add r2, #0x4c
	ldrb r3, [r2]
	add r2, r4, #0
	add r2, #0x4b
	strb r3, [r2]
	add r2, r4, #0
	add r2, #0x4a
	strb r0, [r2]
	cmp r1, #8
	bne _0223A16A
	add r0, r4, #0
	mov r2, #2
	add r0, #0x49
	b _0223A184
_0223A16A:
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1f
	sub r2, r2, r3
	mov r0, #0x1f
	ror r2, r0
	add r0, r4, #0
	add r2, r3, r2
	add r0, #0x49
	strb r2, [r0]
	add r3, r1, r3
	add r0, r4, #0
	asr r2, r3, #1
	add r0, #0x4a
_0223A184:
	strb r2, [r0]
	add r0, r4, #0
	bl ov59_0223A07C
	pop {r3, r4, r5, pc}
	nop
_0223A190: .word ov59_0223C924
	thumb_func_end ov59_0223A120

	thumb_func_start ov59_0223A194
ov59_0223A194: ; 0x0223A194
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	bhi _0223A1C8
	bl ov59_022388C4
	add r0, r5, r4
	ldrb r0, [r0, #0x1a]
	cmp r0, #0
	bne _0223A1AE
	mov r0, #4
	pop {r3, r4, r5, pc}
_0223A1AE:
	ldr r0, _0223A260 ; =0x000005EB
	bl PlaySE
	add r0, r5, #0
	add r0, #0x4d
	strb r4, [r0]
	ldr r0, [r5, #0x40]
	cmp r0, #0
	bne _0223A1C4
	mov r0, #7
	pop {r3, r4, r5, pc}
_0223A1C4:
	mov r0, #8
	pop {r3, r4, r5, pc}
_0223A1C8:
	cmp r4, #8
	bne _0223A1DE
	ldr r0, _0223A264 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov59_022387D0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223A1DE:
	cmp r4, #7
	bne _0223A25A
	ldr r0, _0223A264 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl ov59_022388C4
	add r0, r5, #0
	add r0, #0x4d
	strb r4, [r0]
	ldrb r1, [r5, #0x14]
	cmp r1, #0
	bne _0223A216
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0223A216
	add r0, r5, #0
	mov r1, #0x19
	mov r2, #0xff
	bl ov59_02238CFC
	add r0, r5, #0
	mov r1, #1
	bl ov59_02238FF4
	mov r0, #0xf
	pop {r3, r4, r5, pc}
_0223A216:
	cmp r1, #0
	bne _0223A236
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _0223A236
	add r0, r5, #0
	mov r1, #0x1b
	mov r2, #0xff
	bl ov59_02238CFC
	add r0, r5, #0
	mov r1, #1
	bl ov59_02238FF4
	mov r0, #0xf
	pop {r3, r4, r5, pc}
_0223A236:
	cmp r1, #0
	beq _0223A256
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _0223A256
	add r0, r5, #0
	mov r1, #0x1c
	mov r2, #0xff
	bl ov59_02238CFC
	add r0, r5, #0
	mov r1, #1
	bl ov59_02238FF4
	mov r0, #0xf
	pop {r3, r4, r5, pc}
_0223A256:
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_0223A25A:
	mov r0, #4
	pop {r3, r4, r5, pc}
	nop
_0223A260: .word 0x000005EB
_0223A264: .word 0x000005DC
	thumb_func_end ov59_0223A194

	thumb_func_start ov59_0223A268
ov59_0223A268: ; 0x0223A268
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A2C4 ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _0223A2C8 ; =0x00000CF3
	tst r0, r1
	beq _0223A27A
	mov r0, #0
	str r0, [r4, #0x40]
_0223A27A:
	ldr r0, _0223A2C4 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0223A28E
	add r0, r4, #0
	mov r1, #8
	bl ov59_0223A194
	pop {r4, pc}
_0223A28E:
	mov r0, #1
	tst r0, r1
	beq _0223A2A4
	add r0, r4, #0
	bl ov59_02239EA8
	add r1, r0, #0
	add r0, r4, #0
	bl ov59_0223A194
	pop {r4, pc}
_0223A2A4:
	add r0, r4, #0
	bl ov59_0223A678
	cmp r0, #0
	beq _0223A2BE
	ldr r0, _0223A2CC ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov59_022388C4
	mov r0, #4
	pop {r4, pc}
_0223A2BE:
	mov r0, #4
	pop {r4, pc}
	nop
_0223A2C4: .word gSystem
_0223A2C8: .word 0x00000CF3
_0223A2CC: .word 0x000005DC
	thumb_func_end ov59_0223A268

	thumb_func_start ov59_0223A2D0
ov59_0223A2D0: ; 0x0223A2D0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0223A34C ; =ov59_0223C924
	add r5, r1, #0
	bl sub_0202529C
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0223A2EA
	mov r0, #4
	pop {r3, r4, r5, pc}
_0223A2EA:
	mov r0, #1
	str r0, [r5]
	add r2, r4, #0
	str r0, [r4, #0x40]
	mov r0, #0
	add r2, #0x4c
	strb r0, [r2]
	add r2, r4, #0
	add r2, #0x4c
	ldrb r3, [r2]
	add r2, r4, #0
	add r2, #0x4b
	strb r3, [r2]
	add r2, r4, #0
	add r2, #0x4a
	strb r0, [r2]
	cmp r1, #7
	beq _0223A314
	cmp r1, #8
	beq _0223A31E
	b _0223A328
_0223A314:
	add r0, r4, #0
	mov r2, #2
	add r0, #0x49
	strb r2, [r0]
	b _0223A344
_0223A31E:
	add r0, r4, #0
	mov r2, #3
	add r0, #0x49
	strb r2, [r0]
	b _0223A344
_0223A328:
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1f
	sub r2, r2, r3
	mov r0, #0x1f
	ror r2, r0
	add r0, r4, #0
	add r2, r3, r2
	add r0, #0x49
	strb r2, [r0]
	add r3, r1, r3
	add r0, r4, #0
	asr r2, r3, #1
	add r0, #0x4a
	strb r2, [r0]
_0223A344:
	add r0, r4, #0
	bl ov59_0223A194
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A34C: .word ov59_0223C924
	thumb_func_end ov59_0223A2D0

	thumb_func_start ov59_0223A350
ov59_0223A350: ; 0x0223A350
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #6
	bhi _0223A392
	ldr r0, _0223A3AC ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	bl ov59_022388C4
	add r0, r5, r4
	ldrb r0, [r0, #0x1a]
	cmp r0, #0
	bne _0223A372
	mov r0, #5
	pop {r3, r4, r5, pc}
_0223A372:
	add r0, r5, #0
	add r0, #0x4d
	strb r4, [r0]
	add r0, r5, #0
	mov r1, #1
	add r0, #0x4e
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x4d
	ldrb r0, [r0]
	add r0, r5, r0
	ldrb r0, [r0, #0x1a]
	add r5, #0x4f
	strb r0, [r5]
	mov r0, #6
	pop {r3, r4, r5, pc}
_0223A392:
	cmp r4, #8
	bne _0223A3A8
	ldr r0, _0223A3AC ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov59_022387D0
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223A3A8:
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223A3AC: .word 0x000005DC
	thumb_func_end ov59_0223A350

	thumb_func_start ov59_0223A3B0
ov59_0223A3B0: ; 0x0223A3B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0223A40C ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _0223A410 ; =0x00000CF3
	tst r0, r1
	beq _0223A3C2
	mov r0, #0
	str r0, [r4, #0x40]
_0223A3C2:
	ldr r0, _0223A40C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _0223A3D6
	add r0, r4, #0
	mov r1, #8
	bl ov59_0223A350
	pop {r4, pc}
_0223A3D6:
	mov r0, #1
	tst r0, r1
	beq _0223A3EC
	add r0, r4, #0
	bl ov59_02239EA8
	add r1, r0, #0
	add r0, r4, #0
	bl ov59_0223A350
	pop {r4, pc}
_0223A3EC:
	add r0, r4, #0
	bl ov59_0223A678
	cmp r0, #0
	beq _0223A406
	ldr r0, _0223A414 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl ov59_022388C4
	mov r0, #5
	pop {r4, pc}
_0223A406:
	mov r0, #5
	pop {r4, pc}
	nop
_0223A40C: .word gSystem
_0223A410: .word 0x00000CF3
_0223A414: .word 0x000005DC
	thumb_func_end ov59_0223A3B0

	thumb_func_start ov59_0223A418
ov59_0223A418: ; 0x0223A418
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0223A488 ; =ov59_0223C924
	add r5, r1, #0
	bl sub_0202529C
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _0223A432
	cmp r1, #7
	bne _0223A436
_0223A432:
	mov r0, #5
	pop {r3, r4, r5, pc}
_0223A436:
	mov r0, #1
	str r0, [r5]
	add r2, r4, #0
	str r0, [r4, #0x40]
	mov r0, #0
	add r2, #0x4c
	strb r0, [r2]
	add r2, r4, #0
	add r2, #0x4c
	ldrb r3, [r2]
	add r2, r4, #0
	add r2, #0x4b
	strb r3, [r2]
	add r2, r4, #0
	add r2, #0x4a
	strb r0, [r2]
	cmp r1, #8
	bne _0223A462
	add r0, r4, #0
	mov r2, #2
	add r0, #0x49
	b _0223A47C
_0223A462:
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1f
	sub r2, r2, r3
	mov r0, #0x1f
	ror r2, r0
	add r0, r4, #0
	add r2, r3, r2
	add r0, #0x49
	strb r2, [r0]
	add r3, r1, r3
	add r0, r4, #0
	asr r2, r3, #1
	add r0, #0x4a
_0223A47C:
	strb r2, [r0]
	add r0, r4, #0
	bl ov59_0223A350
	pop {r3, r4, r5, pc}
	nop
_0223A488: .word ov59_0223C924
	thumb_func_end ov59_0223A418

	thumb_func_start ov59_0223A48C
ov59_0223A48C: ; 0x0223A48C
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	bne _0223A4A8
	ldr r0, _0223A560 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov59_02238834
	mov r0, #0
	pop {r4, pc}
_0223A4A8:
	cmp r1, #1
	bne _0223A4C0
	ldr r0, _0223A560 ; =0x000005DC
	bl PlaySE
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	bl ov59_02238834
	mov r0, #1
	pop {r4, pc}
_0223A4C0:
	cmp r1, #5
	bhi _0223A548
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223A4D0: ; jump table
	.short _0223A548 - _0223A4D0 - 2 ; case 0
	.short _0223A548 - _0223A4D0 - 2 ; case 1
	.short _0223A4DC - _0223A4D0 - 2 ; case 2
	.short _0223A510 - _0223A4D0 - 2 ; case 3
	.short _0223A4F6 - _0223A4D0 - 2 ; case 4
	.short _0223A52C - _0223A4D0 - 2 ; case 5
_0223A4DC:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4e
	add r1, #0x4f
	ldrb r0, [r0]
	ldrb r1, [r1]
	mov r2, #1
	bl ov59_0223A564
	add r1, r4, #0
	add r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A4F6:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4e
	add r1, #0x4f
	ldrb r0, [r0]
	ldrb r1, [r1]
	mov r2, #0xa
	bl ov59_0223A564
	add r1, r4, #0
	add r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A510:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4e
	add r1, #0x4f
	mov r2, #0
	ldrb r0, [r0]
	ldrb r1, [r1]
	mvn r2, r2
	bl ov59_0223A564
	add r1, r4, #0
	add r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A52C:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x4e
	add r1, #0x4f
	mov r2, #9
	ldrb r0, [r0]
	ldrb r1, [r1]
	mvn r2, r2
	bl ov59_0223A564
	add r1, r4, #0
	add r1, #0x4e
	strb r0, [r1]
	b _0223A54C
_0223A548:
	mov r0, #6
	pop {r4, pc}
_0223A54C:
	ldr r0, _0223A560 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	add r4, #0x4e
	ldrb r1, [r4]
	bl ov59_02238A04
	mov r0, #6
	pop {r4, pc}
	.balign 4, 0
_0223A560: .word 0x000005DC
	thumb_func_end ov59_0223A48C

	thumb_func_start ov59_0223A564
ov59_0223A564: ; 0x0223A564
	cmp r2, #0
	ble _0223A57A
	cmp r0, r1
	bne _0223A570
	mov r0, #1
	bx lr
_0223A570:
	add r0, r0, r2
	cmp r0, r1
	ble _0223A58A
	add r0, r1, #0
	bx lr
_0223A57A:
	cmp r0, #1
	bne _0223A582
	add r0, r1, #0
	bx lr
_0223A582:
	add r0, r0, r2
	cmp r0, #0
	bgt _0223A58A
	mov r0, #1
_0223A58A:
	bx lr
	thumb_func_end ov59_0223A564

	thumb_func_start ov59_0223A58C
ov59_0223A58C: ; 0x0223A58C
	push {r3, lr}
	ldr r1, _0223A608 ; =gSystem
	ldr r2, [r1, #0x48]
	ldr r1, _0223A60C ; =0x00000CF3
	tst r1, r2
	beq _0223A59C
	mov r1, #0
	str r1, [r0, #0x40]
_0223A59C:
	ldr r1, _0223A608 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #2
	add r3, r2, #0
	tst r3, r1
	beq _0223A5B0
	mov r1, #1
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5B0:
	mov r3, #1
	tst r3, r2
	beq _0223A5BE
	mov r1, #0
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5BE:
	mov r3, #0x40
	tst r3, r2
	beq _0223A5CA
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5CA:
	mov r1, #0x80
	add r3, r2, #0
	and r3, r1
	beq _0223A5DA
	mov r1, #3
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5DA:
	mov r1, #0x10
	tst r1, r2
	beq _0223A5E8
	mov r1, #4
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5E8:
	mov r1, #0x20
	tst r1, r2
	beq _0223A5F6
	mov r1, #5
	bl ov59_0223A48C
	pop {r3, pc}
_0223A5F6:
	cmp r3, #0
	beq _0223A604
	ldr r0, _0223A610 ; =0x000005DC
	bl PlaySE
	mov r0, #6
	pop {r3, pc}
_0223A604:
	mov r0, #6
	pop {r3, pc}
	.balign 4, 0
_0223A608: .word gSystem
_0223A60C: .word 0x00000CF3
_0223A610: .word 0x000005DC
	thumb_func_end ov59_0223A58C

	thumb_func_start ov59_0223A614
ov59_0223A614: ; 0x0223A614
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0223A674 ; =ov59_0223C908
	str r1, [sp]
	bl sub_0202529C
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0223A62E
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0223A62E:
	sub r0, r4, #4
	cmp r0, #1
	bhi _0223A642
	add r0, r5, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0xa
	bhs _0223A642
	mov r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_0223A642:
	cmp r4, #2
	blt _0223A660
	mov r0, #0x95
	lsl r0, r0, #2
	add r6, r5, r0
	add r0, r4, #0
	add r0, #9
	lsl r7, r0, #2
	ldr r0, [r6, r7]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [r6, r7]
	bl sub_02024964
_0223A660:
	ldr r0, [sp]
	mov r1, #1
	str r1, [r0]
	str r1, [r5, #0x40]
	add r0, r5, #0
	add r1, r4, #0
	bl ov59_0223A48C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A674: .word ov59_0223C908
	thumb_func_end ov59_0223A614

	thumb_func_start ov59_0223A678
ov59_0223A678: ; 0x0223A678
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x49
	ldrb r1, [r1]
	cmp r1, #3
	bhi _0223A6E4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223A690: ; jump table
	.short _0223A698 - _0223A690 - 2 ; case 0
	.short _0223A6FE - _0223A690 - 2 ; case 1
	.short _0223A78C - _0223A690 - 2 ; case 2
	.short _0223A7DA - _0223A690 - 2 ; case 3
_0223A698:
	ldr r1, _0223A7F8 ; =gSystem
	mov r2, #0x10
	ldr r1, [r1, #0x48]
	tst r2, r1
	beq _0223A6AC
	mov r1, #0
	bl ov59_0223A7FC
	mov r0, #1
	pop {r3, pc}
_0223A6AC:
	mov r2, #0x40
	tst r2, r1
	beq _0223A6D4
	add r2, r0, #0
	add r2, #0x4a
	ldrb r2, [r2]
	cmp r2, #0
	beq _0223A6D4
	add r1, r0, #0
	mov r2, #0
	add r1, #0x4c
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	add r0, #0x4a
	sub r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A6D4:
	mov r2, #0x80
	tst r1, r2
	beq _0223A6E4
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #3
	blo _0223A6E6
_0223A6E4:
	b _0223A7F4
_0223A6E6:
	add r1, r0, #0
	mov r2, #0
	add r1, #0x4c
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	add r0, #0x4a
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A6FE:
	ldr r1, _0223A7F8 ; =gSystem
	mov r2, #0x20
	ldr r1, [r1, #0x48]
	tst r2, r1
	beq _0223A712
	mov r1, #1
	bl ov59_0223A7FC
	mov r0, #1
	pop {r3, pc}
_0223A712:
	mov r2, #0x10
	tst r2, r1
	beq _0223A73C
	add r1, r0, #0
	add r1, #0x4a
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0x4c
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x4a
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x49
	ldrb r1, [r1]
	add r0, #0x49
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A73C:
	mov r2, #0x40
	tst r2, r1
	beq _0223A764
	add r2, r0, #0
	add r2, #0x4a
	ldrb r2, [r2]
	cmp r2, #0
	beq _0223A764
	add r1, r0, #0
	mov r2, #0
	add r1, #0x4b
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	add r0, #0x4a
	sub r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A764:
	mov r2, #0x80
	tst r1, r2
	beq _0223A7F4
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #2
	bhs _0223A7F4
	add r1, r0, #0
	mov r2, #0
	add r1, #0x4b
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	add r0, #0x4a
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A78C:
	ldr r1, _0223A7F8 ; =gSystem
	ldr r3, [r1, #0x48]
	mov r1, #0x20
	tst r1, r3
	beq _0223A7B2
	add r1, r0, #0
	add r1, #0x4c
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0x4a
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x49
	ldrb r1, [r1]
	add r0, #0x49
	sub r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A7B2:
	add r1, r0, #0
	add r1, #0x44
	ldrb r2, [r1]
	cmp r2, #2
	bne _0223A7C0
	mov r0, #0
	pop {r3, pc}
_0223A7C0:
	mov r1, #0x90
	tst r1, r3
	beq _0223A7F4
	cmp r2, #0
	beq _0223A7F4
	add r1, r0, #0
	add r1, #0x49
	ldrb r1, [r1]
	add r0, #0x49
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A7DA:
	ldr r1, _0223A7F8 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #0x60
	tst r1, r2
	beq _0223A7F4
	add r1, r0, #0
	add r1, #0x49
	ldrb r1, [r1]
	add r0, #0x49
	sub r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_0223A7F4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0223A7F8: .word gSystem
	thumb_func_end ov59_0223A678

	thumb_func_start ov59_0223A7FC
ov59_0223A7FC: ; 0x0223A7FC
	cmp r1, #0
	bne _0223A85E
	add r1, r0, #0
	add r1, #0x4a
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0x4b
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #1
	add r1, #0x49
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #3
	bhi _0223A856
	add r3, r1, r1
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0223A82A: ; jump table
	.short _0223A856 - _0223A82A - 2 ; case 0
	.short _0223A832 - _0223A82A - 2 ; case 1
	.short _0223A832 - _0223A82A - 2 ; case 2
	.short _0223A84E - _0223A82A - 2 ; case 3
_0223A832:
	add r3, r0, #0
	add r3, #0x4c
	ldrb r3, [r3]
	cmp r1, r3
	beq _0223A848
	sub r1, r1, #1
	cmp r1, r3
	beq _0223A848
	add r0, #0x4a
	strb r2, [r0]
	bx lr
_0223A848:
	add r0, #0x4a
	strb r3, [r0]
	bx lr
_0223A84E:
	mov r1, #2
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A856:
	mov r1, #0
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A85E:
	add r1, r0, #0
	add r1, #0x4a
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0x4c
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x49
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x4a
	ldrb r1, [r1]
	cmp r1, #0
	beq _0223A886
	cmp r1, #1
	beq _0223A89E
	cmp r1, #2
	beq _0223A8C2
	b _0223A8DA
_0223A886:
	add r1, r0, #0
	add r1, #0x4b
	ldrb r1, [r1]
	cmp r1, #1
	bls _0223A898
	mov r1, #1
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A898:
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A89E:
	add r1, r0, #0
	add r1, #0x4b
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223A8B0
	mov r1, #1
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8B0:
	cmp r1, #3
	bne _0223A8BC
	mov r1, #2
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8BC:
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8C2:
	add r1, r0, #0
	add r1, #0x4b
	ldrb r1, [r1]
	cmp r1, #2
	bhs _0223A8D4
	mov r1, #2
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8D4:
	add r0, #0x4a
	strb r1, [r0]
	bx lr
_0223A8DA:
	add r0, #0x4a
	strb r2, [r0]
	bx lr
	thumb_func_end ov59_0223A7FC

	thumb_func_start ov59_0223A8E0
ov59_0223A8E0: ; 0x0223A8E0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5]
	add r6, r0, #0
	cmp r1, #0
	beq _0223A8F2
	cmp r1, #1
	beq _0223A934
	b _0223A944
_0223A8F2:
	bl ov59_0223ACD0
	mov r2, #9
	mov r0, #3
	mov r1, #0x86
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r1, #0xbd
	add r0, r6, #0
	lsl r1, r1, #2
	mov r2, #0x86
	bl OverlayManager_CreateAndGetData
	mov r2, #0xbd
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x86
	str r0, [r4]
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov59_0223A9E4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0223A944
_0223A934:
	bl OverlayManager_GetData
	bl ov59_0223AABC
	cmp r0, #0
	beq _0223A944
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223A944:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223A8E0

	thumb_func_start ov59_0223A948
ov59_0223A948: ; 0x0223A948
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	add r5, r0, #0
	cmp r1, #8
	bhi _0223A9A2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223A964: ; jump table
	.short _0223A976 - _0223A964 - 2 ; case 0
	.short _0223A97E - _0223A964 - 2 ; case 1
	.short _0223A986 - _0223A964 - 2 ; case 2
	.short _0223A9A2 - _0223A964 - 2 ; case 3
	.short _0223A98E - _0223A964 - 2 ; case 4
	.short _0223A996 - _0223A964 - 2 ; case 5
	.short _0223A9A2 - _0223A964 - 2 ; case 6
	.short _0223A9A2 - _0223A964 - 2 ; case 7
	.short _0223A99E - _0223A964 - 2 ; case 8
_0223A976:
	bl ov59_0223AB3C
	str r0, [r4]
	b _0223A9A2
_0223A97E:
	bl ov59_0223AB90
	str r0, [r4]
	b _0223A9A2
_0223A986:
	bl ov59_0223ABE4
	str r0, [r4]
	b _0223A9A2
_0223A98E:
	bl ov59_0223ABEC
	str r0, [r4]
	b _0223A9A2
_0223A996:
	bl ov59_0223AC48
	str r0, [r4]
	b _0223A9A2
_0223A99E:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223A9A2:
	mov r0, #0x97
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D020
	ldr r0, [r5, #0x78]
	bl ov59_0223C304
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov59_0223A948

	thumb_func_start ov59_0223A9B8
ov59_0223A9B8: ; 0x0223A9B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	bl ov59_0223AB00
	cmp r0, #0
	bne _0223A9CE
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223A9CE:
	add r0, r4, #0
	bl ov59_0223AA6C
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0x86
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov59_0223A9B8

	thumb_func_start ov59_0223A9E4
ov59_0223A9E4: ; 0x0223A9E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	bl sub_020183F0
	str r0, [r5, #0x44]
	ldr r0, [r5, #4]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x18]
	str r0, [r5, #8]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	bl Options_GetTextFrameDelay
	add r1, r5, #0
	add r1, #0x4b
	strb r0, [r1]
	add r0, r4, #0
	bl Options_GetFrame
	add r1, r5, #0
	add r1, #0x4c
	strb r0, [r1]
	ldr r0, [r5, #8]
	bl Save_ApricornBox_get
	str r0, [r5, #0x14]
	ldr r1, [r5, #4]
	add r2, r5, #0
	ldr r1, [r1, #0x14]
	add r2, #0x18
	bl sub_02031CEC
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0x18
	add r1, #0x20
	bl sub_02031DA0
	add r0, r5, #0
	bl ov59_0223AE20
	add r0, r5, #0
	add r0, #0x49
	ldrb r4, [r0]
	mov r1, #0
	cmp r4, #0
	ble _0223AA68
	ldr r0, [r5, #4]
	add r2, r5, #0
	ldrb r3, [r0, #0x1c]
_0223AA50:
	add r0, r2, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r3, r0
	bne _0223AA60
	add r5, #0x4a
	strb r1, [r5]
	pop {r3, r4, r5, pc}
_0223AA60:
	add r1, r1, #1
	add r2, #0x34
	cmp r1, r4
	blt _0223AA50
_0223AA68:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov59_0223A9E4

	thumb_func_start ov59_0223AA6C
ov59_0223AA6C: ; 0x0223AA6C
	push {r4, lr}
	add r4, r0, #0
	bl ov59_0223AE88
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x44]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x14]
	bl sub_02018410
	add r0, r4, #0
	add r0, #0x4a
	ldrb r1, [r0]
	mov r0, #0x34
	mul r0, r1
	add r0, r4, r0
	add r0, #0x84
	ldrb r1, [r0]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x1c]
	add r0, r4, #0
	add r0, #0x48
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223AAA2
	mov r1, #1
	b _0223AAA4
_0223AAA2:
	mov r1, #3
_0223AAA4:
	ldr r0, [r4, #4]
	strb r1, [r0, #0x18]
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0223AAB8
	add r4, #0x48
	ldrb r0, [r4]
	strh r0, [r1]
_0223AAB8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223AA6C

	thumb_func_start ov59_0223AABC
ov59_0223AABC: ; 0x0223AABC
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x40
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223AAD0
	cmp r1, #1
	beq _0223AAE2
	b _0223AAFA
_0223AAD0:
	bl ov59_0223AD20
	add r0, r4, #0
	add r0, #0x40
	ldrh r0, [r0]
	add r4, #0x40
	add r0, r0, #1
	strh r0, [r4]
	b _0223AAFA
_0223AAE2:
	bl ov59_0223AD84
	bl sub_020210BC
	mov r0, #1
	bl sub_02021148
	mov r0, #0
	add r4, #0x40
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_0223AAFA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223AABC

	thumb_func_start ov59_0223AB00
ov59_0223AB00: ; 0x0223AB00
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223AB10
	cmp r0, #1
	b _0223AB28
_0223AB10:
	bl sub_02021238
	add r0, r4, #0
	bl ov59_0223AD58
	add r0, r4, #0
	add r0, #0x40
	ldrh r0, [r0]
	add r4, #0x40
	add r0, r0, #1
	strh r0, [r4]
	b _0223AB36
_0223AB28:
	bl ov59_0223ACD0
	mov r0, #0
	add r4, #0x40
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_0223AB36:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223AB00

	thumb_func_start ov59_0223AB3C
ov59_0223AB3C: ; 0x0223AB3C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223AB50
	cmp r0, #1
	beq _0223AB74
	b _0223AB88
_0223AB50:
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
	add r0, #0x40
	ldrh r0, [r0]
	add r4, #0x40
	add r0, r0, #1
	strh r0, [r4]
	b _0223AB88
_0223AB74:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223AB88
	mov r0, #0
	add r4, #0x40
	strh r0, [r4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, pc}
_0223AB88:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223AB3C

	thumb_func_start ov59_0223AB90
ov59_0223AB90: ; 0x0223AB90
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223ABA4
	cmp r0, #1
	beq _0223ABCA
	b _0223ABDE
_0223ABA4:
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
	add r0, #0x40
	ldrh r0, [r0]
	add r4, #0x40
	add r0, r0, #1
	strh r0, [r4]
	b _0223ABDE
_0223ABCA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223ABDE
	mov r0, #0
	add r4, #0x40
	strh r0, [r4]
	add sp, #0xc
	mov r0, #8
	pop {r3, r4, pc}
_0223ABDE:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov59_0223AB90

	thumb_func_start ov59_0223ABE4
ov59_0223ABE4: ; 0x0223ABE4
	ldr r3, _0223ABE8 ; =ov59_0223AF7C
	bx r3
	.balign 4, 0
_0223ABE8: .word ov59_0223AF7C
	thumb_func_end ov59_0223ABE4

	thumb_func_start ov59_0223ABEC
ov59_0223ABEC: ; 0x0223ABEC
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x40
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223AC00
	cmp r1, #1
	beq _0223AC30
	b _0223AC42
_0223AC00:
	bl ov59_0223AF9C
	cmp r0, #0
	beq _0223AC42
	add r0, r4, #0
	add r0, #0x3e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223AC22
	add r0, r4, #0
	mov r1, #0
	add r0, #0x40
	strh r1, [r0]
	add r4, #0x36
	strb r1, [r4]
	mov r0, #5
	pop {r4, pc}
_0223AC22:
	add r0, r4, #0
	add r0, #0x40
	ldrh r0, [r0]
	add r4, #0x40
	add r0, r0, #1
	strh r0, [r4]
	b _0223AC42
_0223AC30:
	bl ov59_0223B11C
	cmp r0, #0
	beq _0223AC42
	mov r0, #0
	add r4, #0x40
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_0223AC42:
	mov r0, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223ABEC

	thumb_func_start ov59_0223AC48
ov59_0223AC48: ; 0x0223AC48
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x40
	ldrh r0, [r0]
	cmp r0, #0
	beq _0223AC5A
	cmp r0, #1
	beq _0223AC90
	b _0223ACCA
_0223AC5A:
	add r0, r4, #0
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #5
	bhs _0223AC82
	add r2, r4, #0
	add r2, #0x36
	mov r1, #0x39
_0223AC6A:
	add r0, r4, r0
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0223AC82
	ldrb r0, [r2]
	add r0, r0, #1
	strb r0, [r2]
	add r0, r4, #0
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #5
	blo _0223AC6A
_0223AC82:
	add r0, r4, #0
	add r0, #0x40
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x40
	strh r1, [r0]
_0223AC90:
	add r0, r4, #0
	bl ov59_0223B164
	cmp r0, #0
	beq _0223ACCA
	add r0, r4, #0
	mov r1, #0
	add r0, #0x40
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x3e
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x3e
	add r4, #0x3e
	strb r1, [r0]
	ldrb r0, [r4]
	cmp r0, #0
	bne _0223ACCA
	mov r0, #1
	pop {r4, pc}
_0223ACCA:
	mov r0, #5
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223AC48

	thumb_func_start ov59_0223ACD0
ov59_0223ACD0: ; 0x0223ACD0
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
	ldr r0, _0223AD18 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0223AD1C ; =0x04001000
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
_0223AD18: .word 0xFFFFE0FF
_0223AD1C: .word 0x04001000
	thumb_func_end ov59_0223ACD0

	thumb_func_start ov59_0223AD20
ov59_0223AD20: ; 0x0223AD20
	push {r4, lr}
	add r4, r0, #0
	bl ov59_0223B434
	add r0, r4, #0
	bl ov59_0223B590
	add r0, r4, #0
	bl ov59_0223B68C
	add r0, r4, #0
	bl ov59_0223B740
	add r0, r4, #0
	bl ov59_0223B8B0
	ldr r0, [r4]
	bl ov59_0223C298
	str r0, [r4, #0x78]
	ldr r0, _0223AD54 ; =ov59_0223B3DC
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	pop {r4, pc}
	nop
_0223AD54: .word ov59_0223B3DC
	thumb_func_end ov59_0223AD20

	thumb_func_start ov59_0223AD58
ov59_0223AD58: ; 0x0223AD58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x78]
	bl ov59_0223C350
	add r0, r4, #0
	bl ov59_0223B8C8
	add r0, r4, #0
	bl ov59_0223B7D8
	add r0, r4, #0
	bl ov59_0223B6FC
	add r0, r4, #0
	bl ov59_0223B66C
	add r0, r4, #0
	bl ov59_0223B554
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223AD58

	thumb_func_start ov59_0223AD84
ov59_0223AD84: ; 0x0223AD84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r1, #2
	bl ov59_0223AEB0
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	mov r1, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0223AE18 ; =0x00010200
	add r2, #0xe5
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, r2
	ldr r2, [r5, #0x68]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x79
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r4, _0223AE1C ; =ov59_0223C99C
	mov r6, #0
	add r7, r5, r0
_0223ADC8:
	ldr r1, [r4]
	ldr r0, [r5, #0x5c]
	ldr r2, [r5, #0x68]
	add r1, r1, #5
	bl ReadMsgDataIntoString
	add r0, r6, #5
	lsl r0, r0, #4
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0223AE18 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r2, [r5, #0x68]
	add r0, r7, r0
	mov r3, #4
	bl AddTextPrinterParameterized2
	ldr r0, [sp, #0x10]
	add r0, r7, r0
	bl ScheduleWindowCopyToVram
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _0223ADC8
	add r0, r5, #0
	add r5, #0x4a
	ldrb r1, [r5]
	bl ov59_0223BC88
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223AE18: .word 0x00010200
_0223AE1C: .word ov59_0223C99C
	thumb_func_end ov59_0223AD84

	thumb_func_start ov59_0223AE20
ov59_0223AE20: ; 0x0223AE20
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl SavArray_PlayerParty_get
	str r0, [r5, #0x10]
	bl GetPartyCount
	mov r6, #0
	add r4, r6, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0223AE7E
	add r0, r5, #0
	str r0, [sp, #8]
	add r0, #0x7c
	str r0, [sp, #8]
_0223AE44:
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0223AE76
	ldr r0, [r5]
	add r1, r6, #0
	str r0, [sp]
	mov r0, #0x34
	mul r1, r0
	ldr r0, [sp, #8]
	lsl r3, r4, #0x18
	add r0, r0, r1
	ldr r1, [r5, #0x10]
	add r2, r7, #0
	lsr r3, r3, #0x18
	add r6, r6, #1
	bl ov59_0223BA64
_0223AE76:
	ldr r0, [sp, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _0223AE44
_0223AE7E:
	add r5, #0x49
	strb r6, [r5]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov59_0223AE20

	thumb_func_start ov59_0223AE88
ov59_0223AE88: ; 0x0223AE88
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r0, #0x49
	ldrb r0, [r0]
	mov r4, #0
	cmp r0, #0
	ble _0223AEAE
	add r5, r6, #0
	add r5, #0x7c
_0223AE9A:
	add r0, r5, #0
	bl ov59_0223BADC
	add r0, r6, #0
	add r0, #0x49
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, #0x34
	cmp r4, r0
	blt _0223AE9A
_0223AEAE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223AE88

	thumb_func_start ov59_0223AEB0
ov59_0223AEB0: ; 0x0223AEB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r0, #0
	cmp r1, #3
	bhi _0223AF74
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223AEC6: ; jump table
	.short _0223AF5C - _0223AEC6 - 2 ; case 0
	.short _0223AF5C - _0223AEC6 - 2 ; case 1
	.short _0223AEF4 - _0223AEC6 - 2 ; case 2
	.short _0223AECE - _0223AEC6 - 2 ; case 3
_0223AECE:
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0223AEF4:
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r6, _0223AF78 ; =ov59_0223C954
	mov r7, #0
	mov r5, #4
	str r4, [sp, #0x10]
_0223AF08:
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x68]
	add r1, r7, #1
	bl ReadMsgDataIntoString
	str r5, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x71
	lsl r0, r0, #2
	ldr r2, [r4, #0x68]
	add r0, r4, r0
	mov r3, #0
	bl AddTextPrinterParameterized2
	mov r0, #0x26
	ldr r1, [sp, #0x10]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	add r0, r0, #4
	add r6, r6, #4
	add r5, #0x18
	str r0, [sp, #0x10]
	cmp r7, #2
	blt _0223AF08
	mov r0, #0x71
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0223AF5C:
	mov r0, #0x26
	lsl r0, r0, #4
	add r5, r4, r0
	lsl r4, r1, #2
	lsl r1, r1, #1
	ldr r0, [r5, r4]
	add r1, r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, r4]
	bl sub_02024964
_0223AF74:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223AF78: .word ov59_0223C954
	thumb_func_end ov59_0223AEB0

	thumb_func_start ov59_0223AF7C
ov59_0223AF7C: ; 0x0223AF7C
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0
	str r1, [sp]
	add r1, sp, #0
	add r4, r0, #0
	bl ov59_0223B3B0
	ldr r1, [sp]
	cmp r1, #0
	bne _0223AF98
	add r0, r4, #0
	bl ov59_0223B358
_0223AF98:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov59_0223AF7C

	thumb_func_start ov59_0223AF9C
ov59_0223AF9C: ; 0x0223AF9C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x42
	ldrh r0, [r0]
	cmp r0, #5
	bls _0223AFAC
	b _0223B0FA
_0223AFAC:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223AFB8: ; jump table
	.short _0223AFC4 - _0223AFB8 - 2 ; case 0
	.short _0223B024 - _0223AFB8 - 2 ; case 1
	.short _0223B05C - _0223AFB8 - 2 ; case 2
	.short _0223B084 - _0223AFB8 - 2 ; case 3
	.short _0223B0B4 - _0223AFB8 - 2 ; case 4
	.short _0223B0CC - _0223AFB8 - 2 ; case 5
_0223AFC4:
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	beq _0223AFD8
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0223AFD8:
	add r0, r4, #0
	mov r1, #3
	bl ov59_0223AEB0
	add r0, r4, #0
	bl ov59_0223BBB0
	add r0, r4, #0
	mov r1, #0
	bl ov59_0223BBD4
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xa
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024964
	ldr r0, _0223B114 ; =0x00000921
	bl PlaySE
	add r0, r4, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r4, #0x42
	add r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B024:
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	beq _0223B038
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0223B038:
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xb
	bl Set2dSpriteAnimSeqNo
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024964
	add r0, r4, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r4, #0x42
	add r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B05C:
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024B68
	cmp r0, #0
	beq _0223B070
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0223B070:
	add r0, r4, #0
	bl ov59_0223C054
	add r0, r4, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r4, #0x42
	add r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B084:
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223B094
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0223B094:
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	bl ov59_0223C138
	add r0, r4, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r4, #0x42
	add r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B0B4:
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0223B0C4
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0223B0C4:
	mov r0, #6
	add r4, #0x42
	strh r0, [r4]
	b _0223B10E
_0223B0CC:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223B10E
	mov r0, #6
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r1, #1
	str r0, [sp, #8]
	ldr r3, _0223B118 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	add r0, r4, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r4, #0x42
	add r0, r0, #1
	strh r0, [r4]
	b _0223B10E
_0223B0FA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223B10E
	mov r0, #0
	add r4, #0x42
	strh r0, [r4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0223B10E:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0223B114: .word 0x00000921
_0223B118: .word 0x00007FFF
	thumb_func_end ov59_0223AF9C

	thumb_func_start ov59_0223B11C
ov59_0223B11C: ; 0x0223B11C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223B130
	cmp r1, #1
	beq _0223B14A
	b _0223B160
_0223B130:
	bl ov59_0223BBB0
	add r0, r4, #0
	mov r1, #1
	bl ov59_0223BBD4
	add r0, r4, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r4, #0x42
	add r0, r0, #1
	strh r0, [r4]
	b _0223B160
_0223B14A:
	add r0, #0x4d
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223B160
	mov r0, #0
	add r4, #0x42
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_0223B160:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov59_0223B11C

	thumb_func_start ov59_0223B164
ov59_0223B164: ; 0x0223B164
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r2, r1, #2
	ldr r1, _0223B2A8 ; =ov59_0223C99C
	ldr r4, [r1, r2]
	add r1, r5, #0
	add r1, #0x42
	ldrh r1, [r1]
	cmp r1, #0
	beq _0223B188
	cmp r1, #1
	beq _0223B1CE
	cmp r1, #2
	beq _0223B236
	b _0223B28E
_0223B188:
	mov r1, #0
	add r0, #0x51
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x38
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x36
	ldrb r0, [r0]
	add r1, r5, r0
	mov r0, #0x39
	ldrsb r1, [r1, r0]
	cmp r1, #0
	bge _0223B1B4
	add r0, r5, #0
	neg r1, r1
	add r0, #0x37
	strb r1, [r0]
	ldr r0, _0223B2AC ; =0x00000926
	bl PlaySE
	b _0223B1C0
_0223B1B4:
	add r0, r5, #0
	add r0, #0x37
	strb r1, [r0]
	ldr r0, _0223B2B0 ; =0x00000925
	bl PlaySE
_0223B1C0:
	add r0, r5, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x42
	strh r1, [r0]
_0223B1CE:
	add r0, r5, #0
	add r0, #0x51
	ldrb r2, [r0]
	add r0, r5, #0
	add r0, #0x51
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x51
	strb r1, [r0]
	cmp r2, #0
	bne _0223B2A4
	add r0, r5, #0
	add r0, #0x36
	ldrb r0, [r0]
	add r1, r5, r0
	mov r0, #0x39
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0223B204
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov59_0223BE70
	b _0223B210
_0223B204:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0
	bl ov59_0223BE70
_0223B210:
	add r0, r5, #0
	add r0, #0x38
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x37
	ldrb r0, [r0]
	cmp r1, r0
	blo _0223B22E
	add r0, r5, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r5, #0x42
	add r0, r0, #1
	strh r0, [r5]
	b _0223B2A4
_0223B22E:
	mov r0, #0xf
	add r5, #0x51
	strb r0, [r5]
	b _0223B2A4
_0223B236:
	add r1, r5, #0
	add r1, #0x4f
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223B2A4
	add r2, r5, #0
	add r2, #0x4a
	ldrb r3, [r2]
	add r1, r5, #0
	mov r2, #0x34
	add r1, #0x7c
	mul r2, r3
	add r1, r1, r2
	lsl r2, r4, #0x18
	lsr r2, r2, #0x18
	bl ov59_0223BD4C
	add r0, r5, #0
	bl ov59_0223BBB0
	add r0, r5, #0
	add r0, #0x36
	ldrb r0, [r0]
	add r1, r5, r0
	mov r0, #0x39
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0223B278
	add r0, r5, #0
	add r1, r4, #7
	bl ov59_0223BBD4
	b _0223B280
_0223B278:
	add r0, r5, #0
	add r1, r4, #2
	bl ov59_0223BBD4
_0223B280:
	add r0, r5, #0
	add r0, #0x42
	ldrh r0, [r0]
	add r5, #0x42
	add r0, r0, #1
	strh r0, [r5]
	b _0223B2A4
_0223B28E:
	add r0, #0x4d
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0223B2A4
	mov r0, #0
	add r5, #0x42
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223B2A4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B2A8: .word ov59_0223C99C
_0223B2AC: .word 0x00000926
_0223B2B0: .word 0x00000925
	thumb_func_end ov59_0223B164

	thumb_func_start ov59_0223B2B4
ov59_0223B2B4: ; 0x0223B2B4
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #3
	bhi _0223B34E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223B2C8: ; jump table
	.short _0223B2D0 - _0223B2C8 - 2 ; case 0
	.short _0223B2E6 - _0223B2C8 - 2 ; case 1
	.short _0223B2F8 - _0223B2C8 - 2 ; case 2
	.short _0223B324 - _0223B2C8 - 2 ; case 3
_0223B2D0:
	bl ov59_0223BAE8
	ldr r0, _0223B354 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #0
	bl ov59_0223AEB0
	mov r0, #4
	pop {r4, pc}
_0223B2E6:
	ldr r0, _0223B354 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	mov r1, #1
	bl ov59_0223AEB0
	mov r0, #1
	pop {r4, pc}
_0223B2F8:
	add r0, #0x49
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	sub r0, r0, #1
	add r0, r0, r1
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0x4a
	strb r1, [r0]
	ldr r0, _0223B354 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	add r4, #0x4a
	ldrb r1, [r4]
	bl ov59_0223BC88
	mov r0, #2
	pop {r4, pc}
_0223B324:
	add r0, #0x4a
	add r1, r4, #0
	ldrb r0, [r0]
	add r1, #0x49
	ldrb r1, [r1]
	add r0, r0, #1
	bl _s32_div_f
	add r0, r4, #0
	add r0, #0x4a
	strb r1, [r0]
	ldr r0, _0223B354 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	add r4, #0x4a
	ldrb r1, [r4]
	bl ov59_0223BC88
	mov r0, #2
	pop {r4, pc}
_0223B34E:
	mov r0, #2
	pop {r4, pc}
	nop
_0223B354: .word 0x000005DC
	thumb_func_end ov59_0223B2B4

	thumb_func_start ov59_0223B358
ov59_0223B358: ; 0x0223B358
	push {r3, lr}
	ldr r1, _0223B3A8 ; =gSystem
	ldr r2, [r1, #0x48]
	ldr r1, _0223B3AC ; =0x00000CF3
	tst r1, r2
	beq _0223B368
	mov r1, #0
	str r1, [r0, #0x44]
_0223B368:
	ldr r1, _0223B3A8 ; =gSystem
	ldr r2, [r1, #0x48]
	mov r1, #2
	add r3, r2, #0
	tst r3, r1
	beq _0223B37C
	mov r1, #1
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B37C:
	mov r3, #1
	tst r3, r2
	beq _0223B38A
	mov r1, #0
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B38A:
	mov r3, #0x40
	tst r3, r2
	beq _0223B396
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B396:
	mov r3, #0x80
	tst r2, r3
	beq _0223B3A4
	mov r1, #3
	bl ov59_0223B2B4
	pop {r3, pc}
_0223B3A4:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
_0223B3A8: .word gSystem
_0223B3AC: .word 0x00000CF3
	thumb_func_end ov59_0223B358

	thumb_func_start ov59_0223B3B0
ov59_0223B3B0: ; 0x0223B3B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0223B3D8 ; =ov59_0223C95C
	add r4, r1, #0
	bl sub_0202529C
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0223B3CA
	mov r0, #2
	pop {r3, r4, r5, pc}
_0223B3CA:
	mov r0, #1
	str r0, [r4]
	str r0, [r5, #0x44]
	add r0, r5, #0
	bl ov59_0223B2B4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B3D8: .word ov59_0223C95C
	thumb_func_end ov59_0223B3B0

	thumb_func_start ov59_0223B3DC
ov59_0223B3DC: ; 0x0223B3DC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0223B3EE
	bl sub_0200D034
_0223B3EE:
	ldr r0, [r4, #0x78]
	bl ov59_0223C374
	bl GF_RunVramTransferTasks
	ldr r0, [r4, #0x54]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _0223B40C ; =0x027E0000
	ldr r1, _0223B410 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	.balign 4, 0
_0223B40C: .word 0x027E0000
_0223B410: .word 0x00003FF8
	thumb_func_end ov59_0223B3DC

	thumb_func_start ov59_0223B414
ov59_0223B414: ; 0x0223B414
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0223B430 ; =ov59_0223CA68
	add r3, sp, #0
	mov r2, #5
_0223B41E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0223B41E
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_0223B430: .word ov59_0223CA68
	thumb_func_end ov59_0223B414

	thumb_func_start ov59_0223B434
ov59_0223B434: ; 0x0223B434
	push {r3, r4, r5, lr}
	sub sp, #0x80
	add r4, r0, #0
	bl ov59_0223B414
	ldr r0, [r4]
	bl BgConfig_Alloc
	add r3, sp, #0x70
	ldr r5, _0223B538 ; =ov59_0223C978
	str r0, [r4, #0x54]
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r2, _0223B53C ; =0x04000304
	ldr r0, _0223B540 ; =0xFFFF7FFF
	ldrh r1, [r2]
	ldr r5, _0223B544 ; =ov59_0223C9B0
	add r3, sp, #0x54
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
	mov r1, #7
	str r0, [r3]
	ldr r0, [r4, #0x54]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #7
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223B548 ; =ov59_0223C9CC
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r4, #0x54]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223B54C ; =ov59_0223C9E8
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
	ldr r0, [r4, #0x54]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0223B550 ; =ov59_0223CA04
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, [r4, #0x54]
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x54]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
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
	add sp, #0x80
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B538: .word ov59_0223C978
_0223B53C: .word 0x04000304
_0223B540: .word 0xFFFF7FFF
_0223B544: .word ov59_0223C9B0
_0223B548: .word ov59_0223C9CC
_0223B54C: .word ov59_0223C9E8
_0223B550: .word ov59_0223CA04
	thumb_func_end ov59_0223B434

	thumb_func_start ov59_0223B554
ov59_0223B554: ; 0x0223B554
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x54]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	mov r1, #7
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x54]
	bl FreeToHeap
	ldr r2, _0223B58C ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	pop {r4, pc}
	nop
_0223B58C: .word 0x04000304
	thumb_func_end ov59_0223B554

	thumb_func_start ov59_0223B590
ov59_0223B590: ; 0x0223B590
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0xf4
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
	ldr r2, [r5, #0x54]
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
	ldr r2, [r5, #0x54]
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
	ldr r2, [r5, #0x54]
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
	ldr r2, [r5, #0x54]
	add r0, r4, #0
	mov r3, #7
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0xba
	lsl r0, r0, #2
	str r4, [r5, r0]
	add r0, r5, #0
	add r0, #0x4c
	ldrb r0, [r0]
	mov r1, #1
	add r2, r1, #0
	str r0, [sp]
	ldr r0, [r5]
	mov r3, #0xd
	str r0, [sp, #4]
	ldr r0, [r5, #0x54]
	bl LoadUserFrameGfx2
	mov r1, #6
	ldr r2, [r5]
	mov r0, #0
	lsl r1, r1, #6
	bl LoadFontPal1
	mov r0, #0x1a
	str r0, [sp]
	ldr r0, _0223B668 ; =0x04000050
	mov r1, #1
	mov r2, #0xe
	mov r3, #6
	bl G2x_SetBlendAlpha_
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B668: .word 0x04000050
	thumb_func_end ov59_0223B590

	thumb_func_start ov59_0223B66C
ov59_0223B66C: ; 0x0223B66C
	push {r3, lr}
	mov r1, #0xba
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl NARC_dtor
	mov r1, #0
	ldr r0, _0223B688 ; =0x04000050
	add r2, r1, #0
	mov r3, #0x1f
	str r1, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	.balign 4, 0
_0223B688: .word 0x04000050
	thumb_func_end ov59_0223B66C

	thumb_func_start ov59_0223B68C
ov59_0223B68C: ; 0x0223B68C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r1, [r6]
	mov r0, #4
	bl FontID_Alloc
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #1
	bl sub_02002B8C
	ldr r3, [r6]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x16
	bl NewMsgDataFromNarc
	str r0, [r6, #0x5c]
	mov r0, #0x10
	ldr r2, [r6]
	add r1, r0, #0
	bl ScrStrBufs_new_custom
	str r0, [r6, #0x60]
	mov r0, #1
	ldr r1, [r6]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r6, #0x64]
	mov r0, #1
	ldr r1, [r6]
	lsl r0, r0, #8
	bl String_ctor
	str r0, [r6, #0x68]
	ldr r0, [r6, #0x5c]
	mov r1, #4
	bl NewString_ReadMsgData
	str r0, [r6, #0x6c]
	mov r4, #0
	add r5, r6, #0
_0223B6E4:
	add r1, r4, #0
	ldr r0, [r6, #0x5c]
	add r1, #0xa
	bl NewString_ReadMsgData
	str r0, [r5, #0x70]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0223B6E4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_0223B68C

	thumb_func_start ov59_0223B6FC
ov59_0223B6FC: ; 0x0223B6FC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x74]
	bl String_dtor
	ldr r0, [r4, #0x70]
	bl String_dtor
	ldr r0, [r4, #0x6c]
	bl String_dtor
	ldr r0, [r4, #0x68]
	bl String_dtor
	ldr r0, [r4, #0x64]
	bl String_dtor
	ldr r0, [r4, #0x60]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x5c]
	bl DestroyMsgData
	mov r0, #0
	bl sub_02002B8C
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #4
	bl FontID_Release
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223B6FC

	thumb_func_start ov59_0223B740
ov59_0223B740: ; 0x0223B740
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r1, #0x6d
	mov r6, #0
	lsl r1, r1, #2
	ldr r4, _0223B7D4 ; =ov59_0223CA40
	str r0, [sp, #0x14]
	add r5, r0, r1
	add r7, r6, #0
_0223B752:
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	ldr r0, [r0, #0x54]
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	add r1, r7, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #4
	ble _0223B752
	mov r6, #0xc1
	add r1, r6, #0
	ldr r0, [sp, #0x14]
	add r1, #0xf3
	add r0, r0, r1
	mov r5, #0
	mov r4, #4
	str r0, [sp, #0x18]
_0223B780:
	add r0, r5, #5
	lsl r7, r0, #4
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r0, #0x54]
	add r1, r1, r7
	mov r2, #2
	mov r3, #1
	bl AddWindowParameterized
	ldr r0, [sp, #0x18]
	mov r1, #0
	add r0, r0, r7
	bl FillWindowPixelBuffer
	add r5, r5, #1
	add r6, #0x20
	add r4, r4, #4
	cmp r5, #5
	blt _0223B780
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl sub_0201660C
	mov r2, #0x95
	ldr r1, [sp, #0x14]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B7D4: .word ov59_0223CA40
	thumb_func_end ov59_0223B740

	thumb_func_start ov59_0223B7D8
ov59_0223B7D8: ; 0x0223B7D8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x6d
	lsl r0, r0, #2
	mov r4, #0
	add r5, r6, r0
_0223B7E4:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0xa
	blt _0223B7E4
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_02016624
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223B7D8

	thumb_func_start ov59_0223B804
ov59_0223B804: ; 0x0223B804
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #0x20
	bl GF_CreateVramTransferManager
	ldr r0, [r4]
	bl sub_0200CF18
	mov r1, #0x96
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	ldr r1, _0223B86C ; =ov59_0223CA20
	ldr r2, _0223B870 ; =ov59_0223C988
	mov r3, #3
	bl sub_0200CF70
	ldr r0, [r4]
	bl sub_0200B2E0
	ldr r0, [r4]
	bl sub_0200B2E8
	mov r0, #0x96
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200CF38
	mov r1, #0x97
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x22
	bl sub_0200CFF4
	mov r3, #0
	mov r1, #0x96
	str r3, [sp]
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r2, _0223B874 ; =ov59_0223C968
	bl sub_0200D2A4
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223B86C: .word ov59_0223CA20
_0223B870: .word ov59_0223C988
_0223B874: .word ov59_0223C968
	thumb_func_end ov59_0223B804

	thumb_func_start ov59_0223B878
ov59_0223B878: ; 0x0223B878
	push {r4, lr}
	mov r1, #0x96
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D0E4
	mov r0, #0x97
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200D108
	mov r0, #0x96
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	bl GF_DestroyVramTransferManager
	ldr r0, [r4]
	bl sub_0200B2E0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223B878

	thumb_func_start ov59_0223B8B0
ov59_0223B8B0: ; 0x0223B8B0
	push {r4, lr}
	add r4, r0, #0
	bl ov59_0223B804
	add r0, r4, #0
	bl ov59_0223B8E4
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	thumb_func_end ov59_0223B8B0

	thumb_func_start ov59_0223B8C8
ov59_0223B8C8: ; 0x0223B8C8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x10
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r4, #0
	bl ov59_0223BA44
	add r0, r4, #0
	bl ov59_0223B878
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223B8C8

	thumb_func_start ov59_0223B8E4
ov59_0223B8E4: ; 0x0223B8E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r6, _0223BA34 ; =ov59_0223CA90
	mov r7, #0
	add r4, r5, #0
_0223B8F0:
	mov r0, #0x96
	mov r1, #0x97
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl sub_0200D2B4
	mov r1, #0x26
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_02024A04
	add r7, r7, #1
	add r6, #0x28
	add r4, r4, #4
	cmp r7, #2
	ble _0223B8F0
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x9a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_0202487C
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223BA38 ; =ov59_0223C99C
	str r0, [sp, #0xc]
	mov r0, #0x28
	str r0, [sp, #8]
	mov r0, #0x38
	str r0, [sp, #4]
_0223B95C:
	ldr r0, [sp, #0xc]
	mov r1, #0x96
	ldr r0, [r0]
	lsl r1, r1, #2
	add r0, r0, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r4, r5, r0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, _0223BA3C ; =ov59_0223CB08
	bl sub_0200D2B4
	mov r1, #0x26
	ldr r2, [sp, #8]
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	lsl r2, r2, #0x10
	mov r1, #0x50
	asr r2, r2, #0x10
	bl sub_0200DD88
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #4]
	mov r7, #0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mov r6, #0x40
	str r0, [sp, #0x10]
_0223B9B0:
	ldr r0, [sp, #0xc]
	ldr r2, _0223BA40 ; =ov59_0223CB30
	ldr r1, [r0]
	lsl r0, r1, #2
	add r0, r1, r0
	add r0, #8
	add r0, r7, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r4, r5, r0
	mov r0, #0x96
	mov r1, #0x97
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl sub_0200D2B4
	mov r1, #0x26
	lsl r1, r1, #4
	str r0, [r4, r1]
	add r0, r1, #0
	lsl r1, r6, #0x10
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	asr r1, r1, #0x10
	bl sub_0200DD88
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_0202487C
	add r7, r7, #1
	add r6, #0x10
	cmp r7, #5
	blt _0223B9B0
	ldr r0, [sp, #0xc]
	add r0, r0, #4
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, #0x20
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, #0x20
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _0223B95C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223BA34: .word ov59_0223CA90
_0223BA38: .word ov59_0223C99C
_0223BA3C: .word ov59_0223CB08
_0223BA40: .word ov59_0223CB30
	thumb_func_end ov59_0223B8E4

	thumb_func_start ov59_0223BA44
ov59_0223BA44: ; 0x0223BA44
	push {r4, r5, r6, lr}
	mov r6, #0x26
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #4
_0223BA4E:
	ldr r0, [r5, r6]
	cmp r0, #0
	beq _0223BA58
	bl sub_02024758
_0223BA58:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x22
	blt _0223BA4E
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_0223BA44

	thumb_func_start ov59_0223BA64
ov59_0223BA64: ; 0x0223BA64
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	str r4, [r5]
	add r6, r1, #0
	strb r3, [r5, #8]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #4]
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #7]
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #6]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldrh r0, [r5, #4]
	mov r2, #0x1c
	bl GetMonBaseStat_HandleAlternateForme
	mov r1, #1
	eor r0, r1
	strb r0, [r5, #9]
	ldr r1, [sp, #0x10]
	mov r0, #0xc
	bl String_ctor
	str r0, [r5, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	mov r1, #0x77
	bl GetMonData
	add r1, r5, #0
	ldr r0, [r5]
	add r1, #0x1e
	bl CalcMonPokeathlonPerformance
	add r1, r5, #0
	ldrb r2, [r5, #8]
	add r0, r6, #0
	add r1, #0x10
	bl Party_GetUnkSubSlot
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_0223BA64

	thumb_func_start ov59_0223BADC
ov59_0223BADC: ; 0x0223BADC
	ldr r3, _0223BAE4 ; =String_dtor
	ldr r0, [r0, #0xc]
	bx r3
	nop
_0223BAE4: .word String_dtor
	thumb_func_end ov59_0223BADC

	thumb_func_start ov59_0223BAE8
ov59_0223BAE8: ; 0x0223BAE8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x4a
	ldrb r1, [r0]
	add r2, r4, #0
	mov r0, #0x34
	mul r0, r1
	add r2, #0x7c
	add r0, r2, r0
	str r0, [sp]
	ldr r2, [sp]
	add r0, r4, #0
	ldrb r2, [r2, #8]
	ldr r1, [r4, #0x10]
	add r0, #0x18
	bl ov58_022379C0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x14]
	cmp r0, #8
	bne _0223BB18
	ldr r0, [r4, #0x14]
	bl sub_02032024
_0223BB18:
	ldr r2, [sp]
	ldr r1, [sp]
	ldrb r2, [r2, #8]
	ldr r0, [r4, #0x10]
	add r1, #0x10
	bl Party_GetUnkSubSlot
	ldr r0, [sp]
	ldr r2, [sp]
	ldrh r0, [r0, #0x16]
	ldr r1, [sp]
	add r2, #0x10
	strh r0, [r4, #0x2e]
	ldr r0, [sp]
	ldrh r0, [r0, #0x18]
	strh r0, [r4, #0x30]
	ldr r0, [sp]
	ldrh r0, [r0, #0x1a]
	strh r0, [r4, #0x32]
	ldr r0, [sp]
	ldrh r0, [r0, #0x1c]
	strh r0, [r4, #0x34]
	ldr r0, [sp]
	ldr r1, [r1]
	ldr r3, [r4]
	add r0, #0x16
	bl CalcMonPokeathlonStars
	add r0, r4, #0
	add r7, r4, #0
	mov r3, #0
	add r0, #0x3e
	ldr r5, _0223BBAC ; =ov59_0223C99C
	strb r3, [r0]
	add r7, #0x3e
_0223BB5E:
	ldr r1, [r5]
	lsl r0, r1, #1
	add r2, r1, r0
	ldr r0, [sp]
	add r1, r4, r3
	ldrh r0, [r0, #0x16]
	add r6, r0, #0
	asr r6, r2
	mov r0, #7
	and r0, r6
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	ldrh r0, [r4, #0x2e]
	asr r0, r2
	mov r2, #7
	and r0, r2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, ip
	sub r2, r2, r0
	add r0, r1, #0
	add r0, #0x39
	strb r2, [r0]
	mov r0, #0x39
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0223BB9C
	ldrb r0, [r7]
	add r0, r0, #1
	strb r0, [r7]
_0223BB9C:
	add r3, r3, #1
	add r5, r5, #4
	cmp r3, #5
	blt _0223BB5E
	mov r0, #1
	add r4, #0x48
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223BBAC: .word ov59_0223C99C
	thumb_func_end ov59_0223BAE8

	thumb_func_start ov59_0223BBB0
ov59_0223BBB0: ; 0x0223BBB0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x6d
	lsl r0, r0, #2
	mov r1, #1
	add r0, r4, r0
	add r2, r1, #0
	mov r3, #0xd
	bl DrawFrameAndWindow2
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223BBB0

	thumb_func_start ov59_0223BBD4
ov59_0223BBD4: ; 0x0223BBD4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r0, #0
	cmp r1, #0xb
	bhi _0223BC42
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223BBEA: ; jump table
	.short _0223BC02 - _0223BBEA - 2 ; case 0
	.short _0223BC24 - _0223BBEA - 2 ; case 1
	.short _0223BC2E - _0223BBEA - 2 ; case 2
	.short _0223BC2E - _0223BBEA - 2 ; case 3
	.short _0223BC2E - _0223BBEA - 2 ; case 4
	.short _0223BC2E - _0223BBEA - 2 ; case 5
	.short _0223BC2E - _0223BBEA - 2 ; case 6
	.short _0223BC38 - _0223BBEA - 2 ; case 7
	.short _0223BC38 - _0223BBEA - 2 ; case 8
	.short _0223BC38 - _0223BBEA - 2 ; case 9
	.short _0223BC38 - _0223BBEA - 2 ; case 10
	.short _0223BC38 - _0223BBEA - 2 ; case 11
_0223BC02:
	ldrh r0, [r4, #0x20]
	lsl r0, r0, #0x1c
	lsr r1, r0, #0x1c
	cmp r1, #6
	bne _0223BC10
	mov r1, #0xc
	b _0223BC20
_0223BC10:
	cmp r1, #5
	bne _0223BC1E
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	add r1, #0xd
	b _0223BC20
_0223BC1E:
	add r1, #0xd
_0223BC20:
	mov r5, #0
	b _0223BC48
_0223BC24:
	add r0, r4, #0
	add r0, #0x4b
	mov r1, #0x12
	ldrb r5, [r0]
	b _0223BC48
_0223BC2E:
	add r0, r4, #0
	add r0, #0x4b
	add r1, #0x11
	ldrb r5, [r0]
	b _0223BC48
_0223BC38:
	add r0, r4, #0
	add r0, #0x4b
	add r1, #0x11
	ldrb r5, [r0]
	b _0223BC48
_0223BC42:
	add r0, r4, #0
	add r0, #0x4b
	ldrb r5, [r0]
_0223BC48:
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x68]
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	ldr r0, _0223BC84 ; =0x0001020F
	str r5, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r2, [r4, #0x68]
	add r0, r4, r0
	mov r1, #1
	bl AddTextPrinterParameterized2
	add r1, r4, #0
	add r1, #0x4d
	strb r0, [r1]
	cmp r5, #0
	bne _0223BC7E
	mov r0, #0x6d
	lsl r0, r0, #2
	add r0, r4, r0
	bl ScheduleWindowCopyToVram
_0223BC7E:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223BC84: .word 0x0001020F
	thumb_func_end ov59_0223BBD4

	thumb_func_start ov59_0223BC88
ov59_0223BC88: ; 0x0223BC88
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r2, r5, #0
	mov r0, #0x34
	mul r0, r1
	add r2, #0x7c
	add r4, r2, r0
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0223BD40 ; =0x000F0200
	add r2, #0xf5
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, r2
	ldr r2, [r4, #0xc]
	add r3, r1, #0
	bl AddTextPrinterParameterized2
	ldrb r0, [r4, #7]
	cmp r0, #2
	beq _0223BCE4
	lsl r2, r0, #2
	ldr r0, _0223BD44 ; =ov59_0223C94C
	mov r1, #0
	ldr r0, [r0, r2]
	str r1, [sp]
	mov r3, #0xff
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r3, #0xf5
	add r0, r5, r3
	str r1, [sp, #0xc]
	add r2, r5, r2
	ldr r2, [r2, #0x70]
	mov r3, #0x40
	bl AddTextPrinterParameterized2
_0223BCE4:
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r2, [r4, #6]
	ldr r0, [r5, #0x60]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r0, [r5, #0x60]
	ldr r1, [r5, #0x68]
	ldr r2, [r5, #0x6c]
	bl StringExpandPlaceholders
	mov r3, #0x10
	str r3, [sp]
	mov r2, #0xff
	str r2, [sp, #4]
	ldr r0, _0223BD48 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r2, #0xf5
	str r1, [sp, #0xc]
	add r0, r5, r2
	ldr r2, [r5, #0x68]
	bl AddTextPrinterParameterized2
	mov r0, #0x7d
	lsl r0, r0, #2
	add r0, r5, r0
	bl ScheduleWindowCopyToVram
	ldr r0, [r5, #0x78]
	bl ov59_0223C3AC
	ldr r0, [r5, #0x78]
	add r1, r4, #0
	bl ov59_0223C380
	add r0, r5, #0
	add r1, r4, #0
	bl ov59_0223BE18
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0223BD40: .word 0x000F0200
_0223BD44: .word ov59_0223C94C
_0223BD48: .word 0x00010200
	thumb_func_end ov59_0223BC88

	thumb_func_start ov59_0223BD4C
ov59_0223BD4C: ; 0x0223BD4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	add r7, r2, #0
	add r1, #0x10
	add r6, r0, #0
	add r0, r1, r7
	str r0, [sp, #4]
	ldrsb r0, [r1, r7]
	cmp r0, #0
	bne _0223BD76
	add r0, r7, #3
	lsl r0, r0, #2
	add r1, r6, r0
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	b _0223BDA2
_0223BD76:
	mov r0, #0x26
	lsl r0, r0, #4
	add r4, r6, r0
	add r0, r7, #3
	lsl r5, r0, #2
	ldr r0, [r4, r5]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #4]
	mov r1, #0
	ldrsb r0, [r0, r1]
	cmp r0, #0
	ldr r0, [r4, r5]
	ble _0223BD9C
	mov r1, #8
	bl Set2dSpriteAnimSeqNo
	b _0223BDA2
_0223BD9C:
	mov r1, #9
	bl Set2dSpriteAnimSeqNo
_0223BDA2:
	lsl r0, r7, #2
	str r0, [sp, #0x10]
	add r5, r7, r0
	ldr r0, [sp]
	mov r4, #0
	str r0, [sp, #0xc]
	add r0, #0x1e
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrh r1, [r0, #0x16]
	lsl r0, r7, #1
	add r0, r7, r0
	asr r1, r0
	mov r0, #7
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp]
	add r7, r0, r7
_0223BDCA:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1d
	cmp r4, r0
	ble _0223BDE6
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0xff
	mov r3, #0
	bl ov59_0223BE44
	b _0223BE0C
_0223BDE6:
	ldr r0, [sp, #8]
	cmp r4, r0
	ble _0223BDFA
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #7
	mov r3, #1
	bl ov59_0223BE44
	b _0223BE0C
_0223BDFA:
	ldrb r2, [r7, #0x18]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r2, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #1
	bl ov59_0223BE44
_0223BE0C:
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #5
	blt _0223BDCA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov59_0223BD4C

	thumb_func_start ov59_0223BE18
ov59_0223BE18: ; 0x0223BE18
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	add r2, r6, #0
	ldr r1, [r6]
	ldr r3, [r5]
	add r0, #0x16
	add r2, #0x10
	bl CalcMonPokeathlonStars
	mov r4, #0
_0223BE30:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov59_0223BD4C
	add r4, r4, #1
	cmp r4, #5
	blt _0223BE30
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223BE18

	thumb_func_start ov59_0223BE44
ov59_0223BE44: ; 0x0223BE44
	push {r4, r5, r6, lr}
	add r1, #8
	lsl r5, r1, #2
	mov r1, #0x26
	lsl r1, r1, #4
	add r4, r0, r1
	ldr r0, [r4, r5]
	add r1, r3, #0
	add r6, r2, #0
	bl Set2dSpriteVisibleFlag
	cmp r6, #0xff
	beq _0223BE6C
	ldr r0, [r4, r5]
	add r1, r6, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, r5]
	bl sub_02024964
_0223BE6C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_0223BE44

	thumb_func_start ov59_0223BE70
ov59_0223BE70: ; 0x0223BE70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	mov r1, #0x20
	add r7, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	str r5, [r4]
	strb r7, [r4, #4]
	mov r0, #0x1e
	strb r0, [r4, #6]
	lsl r0, r6, #1
	ldrh r1, [r5, #0x2e]
	add r0, r6, r0
	asr r1, r0
	mov r0, #7
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r7, #0
	bne _0223BEFE
	add r1, r5, #0
	add r1, #0x38
	ldrb r1, [r1]
	add r0, r0, r1
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, _0223BFBC ; =0x0000019A
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x18]
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0223BED6
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0223BEE4
_0223BED6:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0223BEE4:
	bl _ffix
	add r1, r0, #0
	mov r0, #1
	lsl r0, r0, #0xc
	bl FX_Div
	str r0, [r4, #8]
	mov r0, #0xc
	strh r0, [r4, #0xe]
	mov r0, #0
	strh r0, [r4, #0xc]
	b _0223BF5C
_0223BEFE:
	add r1, r5, #0
	add r1, #0x38
	ldrb r1, [r1]
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, _0223BFC0 ; =0x0000119A
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r4, #0x18]
	ldrb r0, [r4, #6]
	cmp r0, #0
	beq _0223BF2E
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0223BF3C
_0223BF2E:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0223BF3C:
	bl _ffix
	add r1, r0, #0
	mov r0, #1
	lsl r0, r0, #0xc
	bl FX_Div
	neg r0, r0
	str r0, [r4, #8]
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	sub r0, #0xc
	strh r0, [r4, #0xe]
	mov r0, #0x5a
	lsl r0, r0, #2
	strh r0, [r4, #0xc]
_0223BF5C:
	lsl r0, r6, #2
	add r0, r6, r0
	add r0, r7, r0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r7, #0
	add r0, #8
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, r4, #0
	add r1, #0x10
	str r0, [r4, #0x1c]
	bl sub_020247F4
	add r2, r5, r6
	add r2, #0x30
	ldrb r2, [r2]
	add r0, r5, #0
	add r1, r7, #0
	add r2, r2, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #1
	bl ov59_0223BE44
	ldr r0, _0223BFC4 ; =ov59_0223BFC8
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add r0, r5, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x4f
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x38
	ldrb r0, [r0]
	add r5, #0x38
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223BFBC: .word 0x0000019A
_0223BFC0: .word 0x0000119A
_0223BFC4: .word ov59_0223BFC8
	thumb_func_end ov59_0223BE70

	thumb_func_start ov59_0223BFC8
ov59_0223BFC8: ; 0x0223BFC8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	mov r0, #0xe
	ldrh r1, [r5, #0xc]
	ldrsh r0, [r5, r0]
	ldr r4, [r5]
	add r0, r1, r0
	strh r0, [r5, #0xc]
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #8]
	add r0, r1, r0
	str r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #8]
	add r0, r1, r0
	str r0, [r5, #0x14]
	ldrb r0, [r5, #6]
	sub r0, r0, #1
	strb r0, [r5, #6]
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _0223C010
	ldrh r0, [r5, #0xc]
	bl GF_DegreeToSinCosIdx
	add r1, r0, #0
	ldr r0, [r5, #0x1c]
	bl sub_02024818
	ldr r0, [r5, #0x1c]
	add r5, #0x10
	add r1, r5, #0
	bl sub_020247F4
	pop {r4, r5, r6, pc}
_0223C010:
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl sub_02024818
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r5, #0x10]
	str r0, [r5, #0x14]
	str r0, [r5, #0x18]
	add r1, r5, #0
	ldr r0, [r5, #0x1c]
	add r1, #0x10
	bl sub_020247F4
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _0223C03A
	ldr r0, [r5, #0x1c]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0223C03A:
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r4, #0x4f
	sub r0, r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	pop {r4, r5, r6, pc}
	thumb_func_end ov59_0223BFC8

	thumb_func_start ov59_0223C054
ov59_0223C054: ; 0x0223C054
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	str r5, [r4]
	mov r0, #0x1e
	strb r0, [r4, #4]
	mov r0, #0xc
	strb r0, [r4, #6]
	ldr r0, _0223C094 ; =0x00000922
	bl PlaySE
	ldr r0, _0223C098 ; =ov59_0223C09C
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	add r0, r5, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r5, #0x4f
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_0223C094: .word 0x00000922
_0223C098: .word ov59_0223C09C
	thumb_func_end ov59_0223C054

	thumb_func_start ov59_0223C09C
ov59_0223C09C: ; 0x0223C09C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldr r4, [r5]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	ldr r0, [r4, #0x78]
	bne _0223C0D0
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	mov r1, #0xc
	bl sub_02008C2C
	ldr r0, [r4, #0x78]
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	mov r1, #0xd
	neg r2, r2
	bl sub_02008C2C
	b _0223C0E8
_0223C0D0:
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	mov r1, #0xc
	neg r2, r2
	bl sub_02008C2C
	ldr r0, [r4, #0x78]
	ldrb r2, [r5, #6]
	ldr r0, [r0, #0x20]
	mov r1, #0xd
	bl sub_02008C2C
_0223C0E8:
	ldrb r1, [r5, #4]
	add r0, r1, #1
	strb r0, [r5, #4]
	cmp r1, #8
	blo _0223C134
	mov r0, #0
	strb r0, [r5, #4]
	ldrb r1, [r5, #5]
	add r0, r1, #1
	strb r0, [r5, #5]
	cmp r1, #4
	blo _0223C134
	ldr r0, [r4, #0x78]
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf4
	bl sub_020087A4
	ldr r0, [r4, #0x78]
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r0, #0x20]
	add r2, #0xf3
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r4, #0x4f
	sub r0, r0, #1
	strb r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0223C134:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov59_0223C09C

	thumb_func_start ov59_0223C138
ov59_0223C138: ; 0x0223C138
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r0, _0223C168 ; =ov59_0223C16C
	add r1, r5, #0
	mov r2, #0
	str r4, [r5]
	bl CreateSysTask
	add r0, r4, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r4, #0x4f
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223C168: .word ov59_0223C16C
	thumb_func_end ov59_0223C138

	thumb_func_start ov59_0223C16C
ov59_0223C16C: ; 0x0223C16C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r6, r0, #0
	ldrb r0, [r4, #5]
	ldr r5, [r4]
	cmp r0, #4
	bhi _0223C25C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223C188: ; jump table
	.short _0223C192 - _0223C188 - 2 ; case 0
	.short _0223C1AE - _0223C188 - 2 ; case 1
	.short _0223C1E8 - _0223C188 - 2 ; case 2
	.short _0223C202 - _0223C188 - 2 ; case 3
	.short _0223C22A - _0223C188 - 2 ; case 4
_0223C192:
	ldr r0, [r5, #0x78]
	mov r1, #2
	bl ov59_0223C3C0
	ldr r0, _0223C28C ; =0x00000923
	bl PlaySE
	mov r0, #0x14
	strb r0, [r4, #4]
	ldrb r0, [r4, #5]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C1AE:
	ldrb r1, [r4, #4]
	sub r0, r1, #1
	strb r0, [r4, #4]
	cmp r1, #0
	bne _0223C288
	ldr r0, _0223C290 ; =0x00007FFF
	mov r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x78]
	mov r2, #0x10
	ldr r0, [r0, #0x20]
	mov r3, #4
	bl sub_020090B4
	ldr r0, [r5, #0x78]
	mov r1, #1
	bl ov59_0223C3C0
	ldr r0, [r5, #0x78]
	mov r1, #0
	bl ov59_0223C3C0
	mov r0, #0x19
	strb r0, [r4, #4]
	ldrb r0, [r4, #5]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C1E8:
	ldrb r1, [r4, #4]
	sub r0, r1, #1
	strb r0, [r4, #4]
	cmp r1, #0
	bne _0223C288
	ldr r0, _0223C294 ; =0x00000924
	bl PlaySE
	ldrb r0, [r4, #5]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C202:
	ldr r0, [r5, #0x78]
	ldr r0, [r0, #0x20]
	bl sub_02009138
	cmp r0, #0
	bne _0223C288
	ldr r0, [r5, #0x78]
	bl ov59_0223C3DC
	cmp r0, #0
	bne _0223C288
	ldr r0, [r5, #0x78]
	ldr r0, [r0, #0x24]
	bl sub_020154B8
	ldrb r0, [r4, #5]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C22A:
	mov r0, #6
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r1, #1
	str r0, [sp, #8]
	ldr r3, _0223C290 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, _0223C290 ; =0x00007FFF
	mov r1, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x78]
	mov r2, #0
	ldr r0, [r0, #0x20]
	mov r3, #4
	bl sub_020090B4
	ldrb r0, [r4, #5]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #5]
	pop {r3, r4, r5, r6, pc}
_0223C25C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223C288
	ldr r0, [r5, #0x78]
	ldr r0, [r0, #0x20]
	bl sub_02009138
	cmp r0, #0
	bne _0223C288
	add r0, r5, #0
	add r0, #0x4f
	ldrb r0, [r0]
	add r5, #0x4f
	sub r0, r0, #1
	strb r0, [r5]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
_0223C288:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223C28C: .word 0x00000923
_0223C290: .word 0x00007FFF
_0223C294: .word 0x00000924
	thumb_func_end ov59_0223C16C

	thumb_func_start ov59_0223C298
ov59_0223C298: ; 0x0223C298
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x28
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x28
	bl MI_CpuFill8
	mov r1, #0
	str r5, [r4]
	mov r0, #1
	str r0, [sp]
	ldr r0, _0223C2FC ; =ov59_0223C3F0
	mov r2, #2
	str r0, [sp, #4]
	add r0, r5, #0
	add r3, r1, #0
	bl GF_3DVramMan_Create
	str r0, [r4, #4]
	bl ov59_0223C474
	add r0, r4, #0
	add r1, r5, #0
	bl ov59_0223C5C4
	add r0, r4, #0
	bl ov59_0223C584
	add r0, r5, #0
	bl sub_02007FD4
	str r0, [r4, #0xc]
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r1, _0223C300 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	strh r0, [r1]
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223C2FC: .word ov59_0223C3F0
_0223C300: .word 0x04000008
	thumb_func_end ov59_0223C298

	thumb_func_start ov59_0223C304
ov59_0223C304: ; 0x0223C304
	push {r4, lr}
	add r4, r0, #0
	bl sub_02026E48
	bl sub_0201543C
	bl sub_02026E48
	bl NNS_G2dSetupSoftwareSpriteCamera
	bl sub_02023154
	ldr r2, _0223C348 ; =0x04000440
	mov r3, #0
	add r1, r2, #0
	str r3, [r2]
	add r1, #0x14
	str r3, [r1]
	mov r0, #2
	str r0, [r2]
	str r3, [r1]
	bl NNS_G3dGlbFlushP
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r0, [r4, #0xc]
	bl sub_02008120
	bl sub_02015460
	ldr r0, _0223C34C ; =0x04000540
	mov r1, #1
	str r1, [r0]
	pop {r4, pc}
	.balign 4, 0
_0223C348: .word 0x04000440
_0223C34C: .word 0x04000540
	thumb_func_end ov59_0223C304

	thumb_func_start ov59_0223C350
ov59_0223C350: ; 0x0223C350
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02023120
	ldr r0, [r4, #0xc]
	bl sub_02008524
	add r0, r4, #0
	bl ov59_0223C5B0
	ldr r0, [r4, #4]
	bl GF_3DVramMan_Delete
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov59_0223C350

	thumb_func_start ov59_0223C374
ov59_0223C374: ; 0x0223C374
	ldr r3, _0223C37C ; =sub_02009418
	ldr r0, [r0, #0xc]
	bx r3
	nop
_0223C37C: .word sub_02009418
	thumb_func_end ov59_0223C374

	thumb_func_start ov59_0223C380
ov59_0223C380: ; 0x0223C380
	push {r4, lr}
	sub sp, #0x20
	ldr r1, [r1]
	add r4, r0, #0
	add r0, sp, #0x10
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0xc]
	add r1, sp, #0x10
	mov r2, #0xcc
	mov r3, #0x70
	bl sub_020085EC
	str r0, [r4, #0x20]
	add sp, #0x20
	pop {r4, pc}
	thumb_func_end ov59_0223C380

	thumb_func_start ov59_0223C3AC
ov59_0223C3AC: ; 0x0223C3AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _0223C3BE
	bl sub_02008780
	mov r0, #0
	str r0, [r4, #0x20]
_0223C3BE:
	pop {r4, pc}
	thumb_func_end ov59_0223C3AC

	thumb_func_start ov59_0223C3C0
ov59_0223C3C0: ; 0x0223C3C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	ldr r2, _0223C3D8 ; =ov59_0223C4EC
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_02015528
	pop {r4, pc}
	.balign 4, 0
_0223C3D8: .word ov59_0223C4EC
	thumb_func_end ov59_0223C3C0

	thumb_func_start ov59_0223C3DC
ov59_0223C3DC: ; 0x0223C3DC
	push {r3, lr}
	ldr r0, [r0, #0x24]
	bl sub_020154B0
	cmp r0, #0
	beq _0223C3EC
	mov r0, #1
	pop {r3, pc}
_0223C3EC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov59_0223C3DC

	thumb_func_start ov59_0223C3F0
ov59_0223C3F0: ; 0x0223C3F0
	push {r3, r4, lr}
	sub sp, #4
	bl NNS_G3dInit
	bl G3X_Init
	bl G3X_InitMtxStack
	ldr r0, _0223C45C ; =0x04000060
	ldr r1, _0223C460 ; =0xFFFFCFFD
	ldrh r2, [r0]
	ldr r3, _0223C464 ; =0x0000CFFB
	and r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r3
	strh r2, [r0]
	add r2, r1, #2
	ldrh r4, [r0]
	add r1, r1, #2
	sub r3, #0x1c
	and r4, r2
	mov r2, #8
	orr r2, r4
	strh r2, [r0]
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x10
	orr r1, r2
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r3
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _0223C468 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _0223C46C ; =0x04000540
	mov r0, #2
	str r0, [r1]
	ldr r0, _0223C470 ; =0xBFFF0000
	str r0, [r1, #0x40]
	add sp, #4
	pop {r3, r4, pc}
	nop
_0223C45C: .word 0x04000060
_0223C460: .word 0xFFFFCFFD
_0223C464: .word 0x0000CFFB
_0223C468: .word 0x00007FFF
_0223C46C: .word 0x04000540
_0223C470: .word 0xBFFF0000
	thumb_func_end ov59_0223C3F0

	thumb_func_start ov59_0223C474
ov59_0223C474: ; 0x0223C474
	push {r3, r4, r5, lr}
	ldr r3, _0223C4AC ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, #2
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #0xe
	add r2, r1, #0
	blx r3
	ldr r3, _0223C4B0 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #0
	add r4, r0, #0
	ldr r3, [r3]
	mov r0, #0xa0
	add r2, r1, #0
	blx r3
	add r5, r0, #0
	cmp r4, #0
	bne _0223C49C
	bl GF_AssertFail
_0223C49C:
	cmp r5, #0
	bne _0223C4A4
	bl GF_AssertFail
_0223C4A4:
	bl sub_02014DA0
	pop {r3, r4, r5, pc}
	nop
_0223C4AC: .word NNS_GfdDefaultFuncAllocTexVram
_0223C4B0: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov59_0223C474

	thumb_func_start ov59_0223C4B4
ov59_0223C4B4: ; 0x0223C4B4
	push {r4, lr}
	ldr r3, _0223C4CC ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015354
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_0223C4CC: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov59_0223C4B4

	thumb_func_start ov59_0223C4D0
ov59_0223C4D0: ; 0x0223C4D0
	push {r4, lr}
	ldr r3, _0223C4E8 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_0223C4E8: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov59_0223C4D0

	thumb_func_start ov59_0223C4EC
ov59_0223C4EC: ; 0x0223C4EC
	push {r3}
	sub sp, #0xc
	add r2, sp, #0
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	str r1, [r2, #8]
	ldr r1, _0223C530 ; =0xFFFFEFE0
	ldr r2, _0223C534 ; =0x00003310
	str r1, [sp, #4]
	ldr r1, _0223C538 ; =0xFFFFE520
	str r2, [sp]
	str r1, [sp, #8]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #8]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	add r1, r2, r1
	str r1, [r0, #0x30]
	add sp, #0xc
	pop {r3}
	bx lr
	nop
_0223C530: .word 0xFFFFEFE0
_0223C534: .word 0x00003310
_0223C538: .word 0xFFFFE520
	thumb_func_end ov59_0223C4EC

	thumb_func_start ov59_0223C53C
ov59_0223C53C: ; 0x0223C53C
	push {r4, lr}
	sub sp, #8
	mov r1, #0x12
	lsl r1, r1, #0xa
	add r4, r0, #0
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #0x12
	ldr r0, _0223C57C ; =ov59_0223C4B4
	ldr r1, _0223C580 ; =ov59_0223C4D0
	lsl r3, r3, #0xa
	str r4, [sp, #4]
	bl sub_02014DB4
	add r4, r0, #0
	bl sub_02015524
	add r2, r0, #0
	beq _0223C574
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
_0223C574:
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	nop
_0223C57C: .word ov59_0223C4B4
_0223C580: .word ov59_0223C4D0
	thumb_func_end ov59_0223C53C

	thumb_func_start ov59_0223C584
ov59_0223C584: ; 0x0223C584
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov59_0223C53C
	str r0, [r4, #0x24]
	mov r1, #1
	bl sub_02015528
	ldr r2, [r4]
	mov r0, #0xf4
	mov r1, #0xa
	bl sub_02015264
	add r1, r0, #0
	ldr r0, [r4, #0x24]
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223C584

	thumb_func_start ov59_0223C5B0
ov59_0223C5B0: ; 0x0223C5B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl sub_02014EBC
	ldr r0, [r4, #0x24]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov59_0223C5B0

	thumb_func_start ov59_0223C5C4
ov59_0223C5C4: ; 0x0223C5C4
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r5, _0223C61C ; =ov59_0223CB58
	add r4, r0, #0
	add r2, r1, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x10
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, sp, #8
	str r0, [r3]
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	add r0, r2, #0
	bl GF_Camera_Create
	str r0, [r4, #8]
	mov r1, #1
	str r1, [sp]
	ldr r0, [r4, #8]
	ldr r3, _0223C620 ; =0x000005C1
	str r0, [sp, #4]
	add r0, sp, #0x10
	lsl r1, r1, #0x10
	add r2, sp, #8
	bl sub_020232BC
	mov r1, #0x19
	ldr r2, [r4, #8]
	mov r0, #0
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	ldr r0, [r4, #8]
	bl sub_02023234
	ldr r0, [r4, #8]
	bl GF_Camera_RegisterToStaticPtr
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
_0223C61C: .word ov59_0223CB58
_0223C620: .word 0x000005C1
	thumb_func_end ov59_0223C5C4

	.rodata

ov59_0223C624:
	.byte 0x02, 0x08, 0x00, 0x00

ov59_0223C628:
	.byte 0x05, 0x06, 0x00, 0x00

ov59_0223C62C:
	.byte 0x02, 0x03, 0x04, 0x00

ov59_0223C630: ; 0x0223C630
	.byte 0x00, 0x02, 0x01, 0x00, 0x00, 0x04, 0x03, 0x00, 0x00, 0x06, 0x05, 0x00, 0x03, 0x04, 0x00, 0x0B
	.byte 0x00, 0x00, 0x3A, 0x00, 0x1F, 0x00, 0x30, 0x00

ov59_0223C648: ; 0x0223C648
	.byte 0x12, 0x00, 0x13, 0x00, 0x11, 0x00, 0x10, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4C, 0x00, 0x00, 0x00

ov59_0223C658: ; 0x0223C658
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C668: ; 0x0223C668
	.byte 0x03, 0x00

ov59_0223C66A: ; 0x0223C66A
	.byte 0x16

ov59_0223C66B: ; 0x0223C66B
	.byte 0x0E
	.word ov59_0223C62C
	.byte 0x02, 0x00, 0x11, 0x0C
	.word ov59_0223C628

ov59_0223C678: ; 0x0223C678
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov59_0223C68C: ; 0x0223C68C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C6A8: ; 0x0223C6A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov59_0223C6C4: ; 0x0223C6C4
	.byte 0x1B, 0x00

ov59_0223C6C6: ; 0x0223C6C6
	.byte 0x31, 0x00, 0x4B, 0x00, 0x41, 0x00, 0x1B, 0x00, 0x51, 0x00
	.byte 0x4B, 0x00, 0x61, 0x00, 0x1B, 0x00, 0x71, 0x00, 0x4B, 0x00, 0x81, 0x00, 0x1B, 0x00, 0x91, 0x00

ov59_0223C6E0: ; 0x0223C6E0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1C, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C6FC: ; 0x0223C6FC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C718: ; 0x0223C718
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov59_0223C734: ; 0x0223C734
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C750: ; 0x0223C750
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov59_0223C770: ; 0x0223C770
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C798: ; 0x0223C798
	.byte 0x00, 0x05, 0x09, 0x16, 0x06, 0x0C, 0xA6, 0x00
	.byte 0x02, 0x03, 0x01, 0x1C, 0x02, 0x0C, 0x2A, 0x01, 0x02, 0x19, 0x15, 0x06, 0x02, 0x09, 0x62, 0x01
	.byte 0x02, 0x02, 0x15, 0x0A, 0x02, 0x0C, 0x6E, 0x01, 0x07, 0x02, 0x11, 0x1C, 0x06, 0x0C, 0x58, 0x03
	.byte 0x00, 0x09, 0x07, 0x09, 0x02, 0x0C, 0x82, 0x01, 0x00, 0x11, 0x0D, 0x06, 0x02, 0x0C, 0x94, 0x01
	.byte 0x00, 0x11, 0x10, 0x06, 0x02, 0x0C, 0xA0, 0x01, 0x00, 0x0C, 0x0D, 0x02, 0x03, 0x0C, 0xAC, 0x01
	.byte 0x00, 0x09, 0x0D, 0x02, 0x03, 0x0C, 0xB2, 0x01, 0x00, 0x0E, 0x0E, 0x02, 0x02, 0x0C, 0xB8, 0x01

ov59_0223C7F0: ; 0x0223C7F0
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x60, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C840: ; 0x0223C840
	.byte 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x31, 0x00, 0x00, 0x00, 0x09, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x10, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x60, 0x00, 0x00, 0x00, 0x14, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C8B8: ; 0x0223C8B8
	.byte 0x00, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x70, 0x00
	.byte 0x00, 0x00, 0x1C, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C8E0: ; 0x0223C8E0
	.byte 0x00, 0x00, 0x00, 0x00, 0x67, 0x00, 0x60, 0x00, 0x00, 0x00, 0x18, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C908: ; 0x0223C908
	.byte 0x68, 0x78, 0x88, 0xB8, 0x80, 0x90, 0x88, 0xB8
	.byte 0x58, 0x68, 0x5E, 0x6C, 0x80, 0x90, 0x5E, 0x6C, 0x58, 0x68, 0x4A, 0x58, 0x80, 0x90, 0x4A, 0x58
	.byte 0xFF, 0x00, 0x00, 0x00

ov59_0223C924: ; 0x0223C924
	.byte 0xFE, 0x1A, 0x30, 0x18, 0xFE, 0x4A, 0x40, 0x18, 0xFE, 0x1A, 0x50, 0x18
	.byte 0xFE, 0x4A, 0x60, 0x18, 0xFE, 0x1A, 0x70, 0x18, 0xFE, 0x4A, 0x80, 0x18, 0xFE, 0x1A, 0x90, 0x18

ov59_0223C940: ; 0x0223C940
	.byte 0x48, 0xA0, 0x98, 0xE8, 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov59_0223C94C: ; 0x0223C94C
	.byte 0x00, 0x06, 0x05, 0x00
	.byte 0x00, 0x04, 0x03, 0x00

ov59_0223C954: ; 0x0223C954
	.byte 0x00, 0x0F, 0x03, 0x00, 0x00, 0x0F, 0x07, 0x00

ov59_0223C95C: ; 0x0223C95C
	.byte 0x90, 0xA8, 0xC0, 0x00
	.byte 0xA8, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov59_0223C968: ; 0x0223C968
	.byte 0x0E, 0x00, 0x0F, 0x00, 0x0D, 0x00, 0x0C, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x4B, 0x00, 0x00, 0x00

ov59_0223C978: ; 0x0223C978
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov59_0223C988: ; 0x0223C988
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov59_0223C99C: ; 0x0223C99C
	.byte 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov59_0223C9B0: ; 0x0223C9B0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C9CC: ; 0x0223C9CC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223C9E8: ; 0x0223C9E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov59_0223CA04: ; 0x0223CA04
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223CA20: ; 0x0223CA20
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov59_0223CA40: ; 0x0223CA40
	.byte 0x01, 0x02, 0x01, 0x1B, 0x02, 0x0C, 0x1F, 0x00, 0x01, 0x19, 0x12, 0x06, 0x06, 0x0C, 0x55, 0x00
	.byte 0x01, 0x19, 0x15, 0x06, 0x02, 0x0C, 0x79, 0x00, 0x02, 0x14, 0x01, 0x0A, 0x02, 0x0C, 0x85, 0x00
	.byte 0x02, 0x14, 0x04, 0x0A, 0x04, 0x0C, 0x99, 0x00

ov59_0223CA68: ; 0x0223CA68
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov59_0223CA90: ; 0x0223CA90
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB8, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x58, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223CB08: ; 0x0223CB08
	.byte 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x28, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223CB30: ; 0x0223CB30
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x38, 0x00, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov59_0223CB58: ; 0x0223CB58
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00

	.data

_0223CB80:
	.byte 0x00, 0x03, 0x0F, 0x00, 0x00, 0x05, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	; 0x0223CBA0
