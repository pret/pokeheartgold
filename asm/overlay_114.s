	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov114_0225F020
ov114_0225F020: ; 0x0225F020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #7
	bls _0225F032
	b _0225F260
_0225F032:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225F03E: ; jump table
	.short _0225F04E - _0225F03E - 2 ; case 0
	.short _0225F0DE - _0225F03E - 2 ; case 1
	.short _0225F0F8 - _0225F03E - 2 ; case 2
	.short _0225F104 - _0225F03E - 2 ; case 3
	.short _0225F136 - _0225F03E - 2 ; case 4
	.short _0225F168 - _0225F03E - 2 ; case 5
	.short _0225F1D8 - _0225F03E - 2 ; case 6
	.short _0225F21C - _0225F03E - 2 ; case 7
_0225F04E:
	mov r1, #0x69
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x69
	str r0, [r4, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r5, [r4, #0xc]
	mov r1, #1
	add r0, r5, #0
	add r0, #0x2c
	add r2, r1, #0
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #9
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225F270 ; =0x000927C0
	mov r2, #0x5a
	str r0, [sp, #0x10]
	add r1, r5, #0
	lsl r2, r2, #2
	ldr r0, [r4, #0x20]
	add r1, #0x2c
	add r2, r5, r2
	mov r3, #0
	bl ov01_021F0614
	mov r0, #0
	str r0, [sp]
	mov r1, #0x5a
	str r0, [sp, #4]
	add r0, r5, #0
	lsl r1, r1, #2
	mov r2, #2
	mov r3, #6
	add r0, #0x2c
	add r1, r5, r1
	lsl r2, r2, #0x12
	lsl r3, r3, #0x10
	bl ov01_021F0718
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl sub_02024B78
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F0DE:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, r4, #4
	bl ov01_021EFCF8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F0F8:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0225F14E
	add r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F104:
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x10
	mov r3, #0xc
	bl ov01_021EFE34
	ldr r3, [r5]
	mov r0, #0x10
	sub r0, r0, r3
	str r0, [sp]
	ldr r0, _0225F274 ; =0x04000050
	mov r1, #0
	mov r2, #0xf
	bl G2x_SetBlendAlpha_
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F136:
	add r0, r5, #0
	bl ov01_021EFE44
	ldr r2, [r5]
	mov r1, #0x10
	sub r1, r1, r2
	lsl r1, r1, #8
	orr r1, r2
	ldr r2, _0225F278 ; =0x04000052
	cmp r0, #1
	strh r1, [r2]
	beq _0225F150
_0225F14E:
	b _0225F260
_0225F150:
	mov r1, #0
	sub r0, r2, #2
	strh r1, [r0]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024B78
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F168:
	mov r0, #6
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	ldr r2, _0225F27C ; =0x0000019A
	add r0, #0x14
	lsl r1, r1, #0xc
	mov r3, #1
	bl ov01_021EFEC8
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #2
	bl sub_0202487C
	ldr r1, [r5, #0x14]
	add r0, sp, #0x20
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F074C
	add r6, sp, #0x20
	add r3, sp, #0x38
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020247F4
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB514
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	mov r0, #3
	mov r1, #0x10
	add r3, r2, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F1D8:
	add r0, r5, #0
	add r0, #0x14
	bl ov01_021EFF28
	ldr r1, [r5, #0x14]
	add r6, r0, #0
	add r0, sp, #0x14
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F074C
	add r3, sp, #0x14
	add r2, sp, #0x2c
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r7, #0
	str r0, [r2]
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_020247F4
	cmp r6, #1
	bne _0225F260
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225F260
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0225F260
_0225F21C:
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB4F4
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225F238
	mov r0, #1
	str r0, [r1]
_0225F238:
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02024758
	mov r1, #0x5a
	add r0, r5, #0
	lsl r1, r1, #2
	add r0, #0x2c
	add r1, r5, r1
	bl ov01_021F06EC
	add r0, r5, #0
	add r0, #0x2c
	bl ov01_021F05F4
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_021EFCDC
_0225F260:
	ldr r0, [r4]
	cmp r0, #7
	beq _0225F26C
	ldr r0, [r5, #0x2c]
	bl sub_0202457C
_0225F26C:
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225F270: .word 0x000927C0
_0225F274: .word 0x04000050
_0225F278: .word 0x04000052
_0225F27C: .word 0x0000019A
	thumb_func_end ov114_0225F020

	thumb_func_start ov114_0225F280
ov114_0225F280: ; 0x0225F280
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r1, #0
	str r0, [sp, #0x14]
	ldr r0, [r6]
	ldr r4, [r6, #0xc]
	cmp r0, #7
	bhi _0225F358
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225F29C: ; jump table
	.short _0225F2AC - _0225F29C - 2 ; case 0
	.short _0225F338 - _0225F29C - 2 ; case 1
	.short _0225F352 - _0225F29C - 2 ; case 2
	.short _0225F360 - _0225F29C - 2 ; case 3
	.short _0225F3AA - _0225F29C - 2 ; case 4
	.short _0225F45C - _0225F29C - 2 ; case 5
	.short _0225F486 - _0225F29C - 2 ; case 6
	.short _0225F496 - _0225F29C - 2 ; case 7
_0225F2AC:
	mov r1, #0x1b
	mov r0, #4
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x1b
	str r0, [r6, #0xc]
	mov r1, #0
	lsl r2, r2, #4
	bl memset
	ldr r4, [r6, #0xc]
	mov r1, #4
	add r0, r4, #0
	mov r2, #1
	bl ov01_021F05C4
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	ldr r0, _0225F4F4 ; =0x000927C0
	mov r2, #0x4f
	str r0, [sp, #0x10]
	lsl r2, r2, #2
	ldr r0, [r6, #0x20]
	add r1, r4, #0
	add r2, r4, r2
	mov r3, #0
	bl ov01_021F0614
	mov r7, #0
	add r5, r4, #0
_0225F2F6:
	mov r0, #0
	mov r1, #0x4f
	str r0, [sp]
	lsl r1, r1, #2
	mov r2, #2
	mov r3, #6
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r4, r1
	lsl r2, r2, #0x12
	lsl r3, r3, #0x10
	bl ov01_021F0718
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #4
	blt _0225F2F6
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F338:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, r6, #4
	bl ov01_021EFCF8
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F352:
	ldr r1, [r6, #4]
	cmp r1, #0
	bne _0225F35A
_0225F358:
	b _0225F4E2
_0225F35A:
	add r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F360:
	mov r3, #6
	mov r2, #4
	lsl r3, r3, #6
	str r2, [sp]
	add r0, r4, r3
	mov r1, #0
	lsl r2, r2, #0x11
	add r3, #0x1a
	bl ov01_021EFEC8
	mov r3, #0x66
	mov r0, #4
	mov r2, #0xa
	lsl r3, r3, #2
	str r0, [sp]
	add r0, r4, r3
	mov r1, #0
	lsl r2, r2, #0x10
	add r3, r3, #2
	bl ov01_021EFEC8
	mov r7, #0
	add r5, r4, #0
_0225F38E:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #4
	blt _0225F38E
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F3AA:
	mov r0, #6
	lsl r0, r0, #6
	mov r7, #0
	add r5, r4, r0
_0225F3B2:
	add r0, r5, #0
	bl ov01_021EFF28
	add r7, r7, #1
	add r5, #0x18
	str r0, [sp, #0x18]
	cmp r7, #2
	blt _0225F3B2
	mov r2, #6
	lsl r2, r2, #6
	ldr r3, [r4, r2]
	mov r1, #2
	lsl r2, r2, #0xa
	sub r2, r2, r3
	add r0, sp, #0x1c
	lsl r1, r1, #0x12
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl sub_020247D4
	mov r2, #6
	lsl r2, r2, #6
	ldr r3, [r4, r2]
	mov r1, #2
	lsl r2, r2, #0xa
	add r2, r3, r2
	add r0, sp, #0x1c
	lsl r1, r1, #0x12
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl sub_020247D4
	mov r1, #0x66
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r1, #2
	lsl r1, r1, #0x12
	sub r1, r1, r2
	mov r2, #6
	add r0, sp, #0x1c
	lsl r2, r2, #0x10
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl sub_020247D4
	mov r1, #0x66
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r1, #2
	lsl r1, r1, #0x12
	add r1, r2, r1
	mov r2, #6
	add r0, sp, #0x1c
	lsl r2, r2, #0x10
	mov r3, #0
	bl ov01_021F074C
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, sp, #0x1c
	bl sub_020247D4
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0225F4E2
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F45C:
	ldr r0, [r6, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB514
	mov r0, #8
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
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F486:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0225F4E2
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0225F4E2
_0225F496:
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [r6, #0x10]
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	bl ov01_021FB4F4
	ldr r1, [r6, #0x14]
	cmp r1, #0
	beq _0225F4B2
	mov r0, #1
	str r0, [r1]
_0225F4B2:
	mov r7, #0
	add r5, r4, #0
_0225F4B6:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_02024758
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #4
	blt _0225F4B6
	mov r1, #0x4f
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r4, r1
	bl ov01_021F06EC
	add r0, r4, #0
	bl ov01_021F05F4
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	bl ov01_021EFCDC
_0225F4E2:
	ldr r0, [r6]
	cmp r0, #7
	beq _0225F4EE
	ldr r0, [r4]
	bl sub_0202457C
_0225F4EE:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F4F4: .word 0x000927C0
	thumb_func_end ov114_0225F280
