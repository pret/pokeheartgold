    .include "asm/macros.inc"
	.include "overlay_80_02236B78.inc"
	.include "global.inc"

    .text

    thumb_func_start ov80_02236B78
ov80_02236B78: ; 0x02236B78
	push {r3, r4, r5, lr}
	cmp r1, #8
	blo _02236B80
	mov r1, #7
_02236B80:
	cmp r0, #0
	bne _02236B9C
	mov r0, #7
	add r3, r2, #1
	mul r0, r1
	add r0, r3, r0
	cmp r0, #0x15
	bne _02236B94
	ldr r0, _02236BCC ; =0x00000135
	pop {r3, r4, r5, pc}
_02236B94:
	cmp r0, #0x31
	bne _02236B9C
	ldr r0, _02236BD0 ; =0x00000136
	pop {r3, r4, r5, pc}
_02236B9C:
	cmp r2, #6
	beq _02236BA4
	cmp r2, #0xd
	bne _02236BB2
_02236BA4:
	ldr r0, _02236BD4 ; =ov80_0223C47C
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02236BD8 ; =ov80_0223C47E
	ldrh r0, [r0, r1]
	sub r5, r0, r4
	b _02236BBE
_02236BB2:
	ldr r0, _02236BDC ; =ov80_0223C478
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02236BE0 ; =ov80_0223C47A
	ldrh r0, [r0, r1]
	sub r5, r0, r4
_02236BBE:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	add r0, r4, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236BCC: .word 0x00000135
_02236BD0: .word 0x00000136
_02236BD4: .word ov80_0223C47C
_02236BD8: .word ov80_0223C47E
_02236BDC: .word ov80_0223C478
_02236BE0: .word ov80_0223C47A
	thumb_func_end ov80_02236B78

	thumb_func_start ov80_02236BE4
ov80_02236BE4: ; 0x02236BE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r3, #0
	mov r4, #0
	add r5, r6, #0
_02236BF4:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl ov80_02236B78
	mov r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _02236C1A
	lsl r0, r4, #1
	ldrh r3, [r6, r0]
	add r2, r6, #0
_02236C0C:
	ldrh r0, [r2]
	cmp r0, r3
	beq _02236C1A
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, r4
	blt _02236C0C
_02236C1A:
	cmp r1, r4
	bne _02236C22
	add r5, r5, #2
	add r4, r4, #1
_02236C22:
	cmp r4, r7
	blt _02236BF4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02236BE4

	thumb_func_start ov80_02236C2C
ov80_02236C2C: ; 0x02236C2C
	push {r4, lr}
	cmp r1, #0
	bne _02236C38
	ldr r2, _02236C6C ; =ov80_0223C508
	ldr r1, _02236C70 ; =ov80_0223DD38
	b _02236C3C
_02236C38:
	ldr r2, _02236C74 ; =ov80_0223C558
	ldr r1, _02236C70 ; =ov80_0223DD38
_02236C3C:
	mov r4, #0xa
	str r2, [r1]
	mov r2, #0
	cmp r4, #0
	ble _02236C58
	ldr r1, _02236C70 ; =ov80_0223DD38
	ldr r3, [r1]
_02236C4A:
	ldrh r1, [r3]
	cmp r0, r1
	blt _02236C58
	add r2, r2, #1
	add r3, #8
	cmp r2, r4
	blt _02236C4A
_02236C58:
	cmp r2, r4
	blt _02236C62
	bl GF_AssertFail
	sub r2, r4, #1
_02236C62:
	ldr r0, _02236C70 ; =ov80_0223DD38
	ldr r1, [r0]
	lsl r0, r2, #3
	add r0, r1, r0
	pop {r4, pc}
	.balign 4, 0
_02236C6C: .word ov80_0223C508
_02236C70: .word ov80_0223DD38
_02236C74: .word ov80_0223C558
	thumb_func_end ov80_02236C2C

	thumb_func_start ov80_02236C78
ov80_02236C78: ; 0x02236C78
	cmp r0, #8
	blt _02236C7E
	mov r0, #7
_02236C7E:
	cmp r1, #0
	bne _02236C8A
	ldr r1, _02236C94 ; =ov80_0223C508
	lsl r0, r0, #3
	add r0, r1, r0
	bx lr
_02236C8A:
	ldr r1, _02236C98 ; =ov80_0223C4B8
	lsl r0, r0, #3
	add r0, r1, r0
	bx lr
	nop
_02236C94: .word ov80_0223C508
_02236C98: .word ov80_0223C4B8
	thumb_func_end ov80_02236C78

	thumb_func_start ov80_02236C9C
ov80_02236C9C: ; 0x02236C9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	str r0, [sp]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #4]
	str r0, [sp, #0xa0]
	ldr r0, [sp, #0xa8]
	add r7, r2, #0
	str r0, [sp, #0xa8]
	add r0, r3, #0
	str r3, [sp, #8]
	cmp r0, #6
	ble _02236CBA
	bl GF_AssertFail
_02236CBA:
	ldr r0, [sp, #0xa0]
	mov r4, #0
	ldrh r1, [r0, #4]
	ldrh r0, [r0, #2]
	sub r0, r1, r0
	add r1, sp, #0x88
	ldrh r5, [r1, #0x1c]
	str r0, [sp, #0x1c]
	add r0, r4, #0
	cmp r5, #0
	beq _02236CE8
	ldr r3, _02236DD0 ; =ov80_0223C464
	mov r0, #5
	add r2, r4, #0
_02236CD6:
	ldr r1, [r3]
	cmp r5, r1
	bgt _02236CE0
	add r0, r2, #0
	b _02236CE8
_02236CE0:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #5
	blo _02236CD6
_02236CE8:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _02236DC8
	add r1, sp, #0x24
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x98]
	str r1, [sp, #0x10]
	ldr r1, [sp, #8]
	sub r0, r1, r0
	str r0, [sp, #0xc]
_02236CFC:
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blt _02236D30
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #7]
	cmp r0, #1
	bne _02236D30
	ldr r0, [sp, #0xa0]
	ldrh r1, [r0, #0xc]
	ldrh r0, [r0, #0xa]
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	bl LCRandom
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	bl _s32_div_f
	ldr r0, [sp, #0xa0]
	ldrh r0, [r0, #0xc]
	sub r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #0xe]
	str r0, [sp, #0x20]
	b _02236D4A
_02236D30:
	bl LCRandom
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	bl _s32_div_f
	ldr r0, [sp, #0xa0]
	ldrh r0, [r0, #4]
	sub r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #6]
	str r0, [sp, #0x20]
_02236D4A:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, #0xcd
	bl ov80_02229EF4
	mov r2, #0
	cmp r4, #0
	ble _02236D78
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x14]
	ldrh r1, [r1]
	ldrh r3, [r3, #0xc]
	add r0, sp, #0x24
_02236D64:
	ldrh r5, [r0]
	cmp r5, r1
	beq _02236D78
	ldrh r5, [r0, #0xc]
	cmp r5, r3
	beq _02236D78
	add r2, r2, #1
	add r0, #0x10
	cmp r2, r4
	blt _02236D64
_02236D78:
	cmp r2, r4
	bne _02236DC2
	mov r3, #0
	cmp r7, #0
	ble _02236DA4
	ldr r2, [sp, #0x14]
	ldr r5, [sp, #0x14]
	ldrh r2, [r2]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp]
	ldr r1, [sp, #4]
_02236D8E:
	ldrh r5, [r0]
	cmp r2, r5
	beq _02236DA4
	ldrh r5, [r1]
	cmp r6, r5
	beq _02236DA4
	add r3, r3, #1
	add r0, r0, #2
	add r1, r1, #2
	cmp r3, r7
	blt _02236D8E
_02236DA4:
	cmp r3, r7
	bne _02236DC2
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	strh r1, [r0]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0xa8]
	strb r1, [r0, r4]
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	add r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, r0, #2
	str r0, [sp, #0x10]
_02236DC2:
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02236CFC
_02236DC8:
	mov r0, #0
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_02236DD0: .word ov80_0223C464
	thumb_func_end ov80_02236C9C

	thumb_func_start ov80_02236DD4
ov80_02236DD4: ; 0x02236DD4
	cmp r0, #3
	bhi _02236DF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236DE4: ; jump table
	.short _02236DEC - _02236DE4 - 2 ; case 0
	.short _02236DEC - _02236DE4 - 2 ; case 1
	.short _02236DF0 - _02236DE4 - 2 ; case 2
	.short _02236DF0 - _02236DE4 - 2 ; case 3
_02236DEC:
	mov r0, #3
	bx lr
_02236DF0:
	mov r0, #2
	bx lr
_02236DF4:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02236DD4

	thumb_func_start ov80_02236DF8
ov80_02236DF8: ; 0x02236DF8
	cmp r0, #3
	bhi _02236E20
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236E08: ; jump table
	.short _02236E10 - _02236E08 - 2 ; case 0
	.short _02236E10 - _02236E08 - 2 ; case 1
	.short _02236E14 - _02236E08 - 2 ; case 2
	.short _02236E14 - _02236E08 - 2 ; case 3
_02236E10:
	mov r0, #3
	bx lr
_02236E14:
	cmp r1, #0
	bne _02236E1C
	mov r0, #2
	bx lr
_02236E1C:
	mov r0, #4
	bx lr
_02236E20:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02236DF8

	thumb_func_start ov80_02236E24
ov80_02236E24: ; 0x02236E24
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r2, #0
	add r4, r3, #0
	bl ov80_02236C78
	ldr r1, [sp, #0x2c]
	str r5, [sp]
	cmp r1, #0
	bne _02236E56
	mov r1, #0xb
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x18]
	mov r3, #6
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl ov80_02236C9C
	b _02236E70
_02236E56:
	mov r2, #0xb
	str r2, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x18]
	mov r2, #6
	add r3, r2, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	add r0, r1, #0
	bl ov80_02236C9C
_02236E70:
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #0
	bl ov80_0222A52C
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_02236E24

	thumb_func_start ov80_02236E90
ov80_02236E90: ; 0x02236E90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xa8]
	add r7, r3, #0
	str r0, [sp, #0xa8]
	add r0, r1, #0
	add r1, r2, #0
	bl ov80_02236C2C
	str r0, [sp, #0x18]
	mov r0, #0
	mov ip, r0
	ldr r0, [sp, #0xa8]
	cmp r0, #0
	ble _02236EE4
	add r4, sp, #0x34
	add r5, sp, #0x1c
_02236EB4:
	add r6, r7, #0
	add r3, sp, #0x4c
	mov r2, #7
_02236EBA:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02236EBA
	add r0, sp, #0x1c
	ldrh r0, [r0, #0x30]
	add r7, #0x38
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	strh r0, [r4]
	add r0, sp, #0x1c
	ldrh r0, [r0, #0x32]
	add r4, r4, #2
	strh r0, [r5]
	mov r0, ip
	add r1, r0, #1
	ldr r0, [sp, #0xa8]
	add r5, r5, #2
	mov ip, r1
	cmp r1, r0
	blt _02236EB4
_02236EE4:
	ldr r0, [sp, #0x98]
	ldr r2, [sp, #0xa8]
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r1, sp, #0x1c
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xa0]
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, sp, #0x34
	bl ov80_02236C9C
	ldr r0, [sp, #0xa4]
	ldr r1, [sp, #0x98]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0xa0]
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x9c]
	mov r3, #0
	bl ov80_0222A52C
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02236E90

	thumb_func_start ov80_02236F24
ov80_02236F24: ; 0x02236F24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	ldrb r0, [r5, #4]
	add r6, r1, #0
	bl ov80_02236DD4
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	mov r1, #0
	bl ov80_02236DF8
	str r0, [sp, #0xc]
	ldr r0, _022370EC ; =0x000004D4
	ldr r0, [r5, r0]
	bl HealParty
	ldr r0, _022370F0 ; =0x000004D8
	ldr r0, [r5, r0]
	bl HealParty
	ldrb r0, [r5, #4]
	bl ov80_022370F4
	add r1, r0, #0
	mov r0, #0xb
	bl BattleSetup_New
	ldr r1, [r6, #0xc]
	add r4, r0, #0
	str r1, [sp]
	ldr r1, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0x18]
	mov r1, #0
	bl sub_02051D18
	mov r0, #0x53
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl Party_InitWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _02236FB6
_02236F94:
	ldr r0, _022370EC ; =0x000004D4
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl Party_GetMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #0
	bl BattleSetup_AddMonToParty
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	cmp r6, r0
	blt _02236F94
_02236FB6:
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl BattleSetup_SetAllySideBattlersToPlayer
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	mov r2, #0xb
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x18]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x14
	mov r3, #1
	bl ov80_0222A480
	ldrb r0, [r5, #4]
	mov r1, #0
	bl ov80_02236DF8
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl Party_InitWithMaxSize
	mov r7, #0
	add r6, r4, #0
_02236FFC:
	add r0, r5, #0
	bl ov80_02237264
	str r0, [r6, #0x34]
	add r7, r7, #1
	add r6, #0x34
	cmp r7, #4
	blt _02236FFC
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _0223703E
_0223701C:
	ldr r0, _022370F0 ; =0x000004D8
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl Party_GetMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #1
	bl BattleSetup_AddMonToParty
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	cmp r6, r0
	blt _0223701C
_0223703E:
	add r0, r7, #0
	bl FreeToHeap
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _0223704E
	cmp r0, #3
	bne _022370E4
_0223704E:
	add r0, r4, #0
	bl BattleSetup_SetAllySideBattlersToPlayer
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02034818
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r4, r1]
	bl PlayerProfile_Copy
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	mov r2, #0xb
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x18]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x14
	mov r3, #3
	bl ov80_0222A480
	ldrb r0, [r5, #4]
	mov r1, #0
	bl ov80_02236DF8
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl Party_InitWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _022370DE
	add r6, r0, #0
_022370B6:
	ldr r0, _022370F0 ; =0x000004D8
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl Party_GetMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #3
	bl BattleSetup_AddMonToParty
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _022370B6
_022370DE:
	add r0, r7, #0
	bl FreeToHeap
_022370E4:
	add r0, r4, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_022370EC: .word 0x000004D4
_022370F0: .word 0x000004D8
	thumb_func_end ov80_02236F24

	thumb_func_start ov80_022370F4
ov80_022370F4: ; 0x022370F4
	cmp r0, #3
	bhi _0223711C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237104: ; jump table
	.short _0223710C - _02237104 - 2 ; case 0
	.short _02237110 - _02237104 - 2 ; case 1
	.short _02237114 - _02237104 - 2 ; case 2
	.short _02237118 - _02237104 - 2 ; case 3
_0223710C:
	mov r0, #0x81
	bx lr
_02237110:
	mov r0, #0x83
	bx lr
_02237114:
	mov r0, #0x8f
	bx lr
_02237118:
	mov r0, #0x8f
	bx lr
_0223711C:
	mov r0, #0x81
	bx lr
	thumb_func_end ov80_022370F4

	thumb_func_start ov80_02237120
ov80_02237120: ; 0x02237120
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0223712A
	mov r0, #0x32
	bx lr
_0223712A:
	mov r0, #0x64
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02237120

	thumb_func_start ov80_02237130
ov80_02237130: ; 0x02237130
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	mov r3, #0xa
	lsl r3, r3, #6
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp, #0xc]
	add r0, r5, r3
	sub r1, #0x2c
	sub r2, #0x20
	sub r3, #0x18
	add r1, r5, r1
	add r2, r5, r2
	add r3, r5, r3
	bl ov80_0222A52C
	ldr r0, _022371A8 ; =0x000004D4
	ldr r0, [r5, r0]
	bl SaveArray_Party_Init
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	mov r7, #0
	add r4, r5, r0
_02237178:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022371AC ; =0x000004F8
	ldr r1, _022371A8 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #6
	blt _02237178
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022371A8: .word 0x000004D4
_022371AC: .word 0x000004F8
	thumb_func_end ov80_02237130

	thumb_func_start ov80_022371B0
ov80_022371B0: ; 0x022371B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	add r5, r0, #0
	ldr r0, _02237248 ; =0x000004D4
	ldr r0, [r5, r0]
	bl Party_GetCount
	add r4, r0, #0
	cmp r4, #2
	ble _022371D4
	ldr r6, _02237248 ; =0x000004D4
_022371C6:
	ldr r0, [r5, r6]
	sub r1, r4, #1
	bl Party_RemoveMon
	sub r4, r4, #1
	cmp r4, #2
	bgt _022371C6
_022371D4:
	ldr r3, _0223724C ; =0x00000584
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xb
	add r2, r3, #0
	str r0, [sp, #8]
	mov r0, #0xcd
	add r1, r5, r3
	add r2, #0xc
	add r3, #0x14
	str r0, [sp, #0xc]
	add r0, sp, #0x14
	add r2, r5, r2
	add r3, r5, r3
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	add r6, sp, #0x14
	add r4, r5, #0
_02237208:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov80_0222A140
	ldr r0, _02237250 ; =0x000004F8
	ldr r1, _02237248 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl ov80_0222A3BC
	ldr r0, _0223724C ; =0x00000584
	add r6, #0x38
	ldrh r1, [r4, r0]
	sub r0, #0x98
	strh r1, [r4, r0]
	ldr r0, [sp, #0x10]
	add r4, r4, #2
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	blt _02237208
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_02237248: .word 0x000004D4
_0223724C: .word 0x00000584
_02237250: .word 0x000004F8
	thumb_func_end ov80_022371B0

	thumb_func_start ov80_02237254
ov80_02237254: ; 0x02237254
	cmp r0, #2
	beq _0223725C
	cmp r0, #3
	bne _02237260
_0223725C:
	mov r0, #1
	bx lr
_02237260:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02237254

	thumb_func_start ov80_02237264
ov80_02237264: ; 0x02237264
	push {r3, lr}
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _02237284
	ldrb r1, [r0, #6]
	lsl r1, r1, #1
	add r1, r0, r1
	ldrh r2, [r1, #0x18]
	ldr r1, _022372B0 ; =0x0000FECB
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _02237284
	mov r0, #7
	pop {r3, pc}
_02237284:
	bl ov80_022372B4
	add r0, r0, #1
	mov r1, #7
	cmp r0, #4
	bhi _022372AC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223729C: ; jump table
	.short _022372AC - _0223729C - 2 ; case 0
	.short _022372A6 - _0223729C - 2 ; case 1
	.short _022372A6 - _0223729C - 2 ; case 2
	.short _022372AA - _0223729C - 2 ; case 3
	.short _022372AA - _0223729C - 2 ; case 4
_022372A6:
	mov r1, #0
	b _022372AC
_022372AA:
	mov r1, #1
_022372AC:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
_022372B0: .word 0x0000FECB
	thumb_func_end ov80_02237264

	thumb_func_start ov80_022372B4
ov80_022372B4: ; 0x022372B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #4]
	ldrh r4, [r5, #0xe]
	bl ov80_02237254
	cmp r0, #1
	bne _022372D0
	ldr r0, _022372D4 ; =0x0000057E
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0xe]
	cmp r1, r0
	bls _022372D0
	add r4, r1, #0
_022372D0:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022372D4: .word 0x0000057E
	thumb_func_end ov80_022372B4

    .data

ov80_0223DD38: ; 0x0223DD38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
