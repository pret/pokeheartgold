	.include "asm/macros.inc"
	.include "overlay_80_02237A70.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02237A70
ov80_02237A70: ; 0x02237A70
	push {r3, r4, r5, lr}
	cmp r0, #0
	bne _02237A8E
	mov r0, #7
	add r3, r2, #1
	mul r0, r1
	add r0, r3, r0
	cmp r0, #0x15
	bne _02237A86
	ldr r0, _02237AC4 ; =0x00000139
	pop {r3, r4, r5, pc}
_02237A86:
	cmp r0, #0x31
	bne _02237A8E
	ldr r0, _02237AC8 ; =0x0000013A
	pop {r3, r4, r5, pc}
_02237A8E:
	cmp r1, #8
	blo _02237A94
	mov r1, #7
_02237A94:
	cmp r2, #6
	beq _02237A9C
	cmp r2, #0xd
	bne _02237AAA
_02237A9C:
	ldr r0, _02237ACC ; =ov80_0223D4D8
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02237AD0 ; =ov80_0223D4DA
	ldrh r0, [r0, r1]
	sub r5, r0, r4
	b _02237AB6
_02237AAA:
	ldr r0, _02237AD4 ; =ov80_0223D4D4
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02237AD8 ; =ov80_0223D4D6
	ldrh r0, [r0, r1]
	sub r5, r0, r4
_02237AB6:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	add r0, r4, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02237AC4: .word 0x00000139
_02237AC8: .word 0x0000013A
_02237ACC: .word ov80_0223D4D8
_02237AD0: .word ov80_0223D4DA
_02237AD4: .word ov80_0223D4D4
_02237AD8: .word ov80_0223D4D6
	thumb_func_end ov80_02237A70

	thumb_func_start ov80_02237ADC
ov80_02237ADC: ; 0x02237ADC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r3, #0
	mov r4, #0
	add r5, r6, #0
_02237AEC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl ov80_02237A70
	mov r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _02237B12
	lsl r0, r4, #1
	ldrh r3, [r6, r0]
	add r2, r6, #0
_02237B04:
	ldrh r0, [r2]
	cmp r0, r3
	beq _02237B12
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, r4
	blt _02237B04
_02237B12:
	cmp r1, r4
	bne _02237B1A
	add r5, r5, #2
	add r4, r4, #1
_02237B1A:
	cmp r4, r7
	blt _02237AEC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02237ADC

	thumb_func_start ov80_02237B24
ov80_02237B24: ; 0x02237B24
	push {r3, lr}
	cmp r0, #3
	bhi _02237B4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237B36: ; jump table
	.short _02237B3E - _02237B36 - 2 ; case 0
	.short _02237B3E - _02237B36 - 2 ; case 1
	.short _02237B42 - _02237B36 - 2 ; case 2
	.short _02237B42 - _02237B36 - 2 ; case 3
_02237B3E:
	mov r0, #3
	pop {r3, pc}
_02237B42:
	cmp r1, #0
	bne _02237B4A
	mov r0, #2
	pop {r3, pc}
_02237B4A:
	mov r0, #4
	pop {r3, pc}
_02237B4E:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02237B24

	thumb_func_start ov80_02237B58
ov80_02237B58: ; 0x02237B58
	push {r3, lr}
	cmp r0, #3
	bhi _02237B82
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237B6A: ; jump table
	.short _02237B72 - _02237B6A - 2 ; case 0
	.short _02237B72 - _02237B6A - 2 ; case 1
	.short _02237B76 - _02237B6A - 2 ; case 2
	.short _02237B76 - _02237B6A - 2 ; case 3
_02237B72:
	mov r0, #3
	pop {r3, pc}
_02237B76:
	cmp r1, #0
	bne _02237B7E
	mov r0, #2
	pop {r3, pc}
_02237B7E:
	mov r0, #4
	pop {r3, pc}
_02237B82:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02237B58

	thumb_func_start ov80_02237B8C
ov80_02237B8C: ; 0x02237B8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	add r6, r1, #0
	mov r1, #0
	bl ov80_02237B24
	str r0, [sp, #0x10]
	ldrb r0, [r5, #0x10]
	mov r1, #0
	bl ov80_02237B58
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	bl HealParty
	ldrb r0, [r5, #0x10]
	bl ov80_02237D5C
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
	mov r1, #0x15
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl Party_InitWithMaxSize
	bl sub_0203769C
	cmp r0, #0
	bne _02237BF0
	mov r6, #0
	b _02237BF2
_02237BF0:
	mov r6, #2
_02237BF2:
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _02237C2A
_02237C04:
	ldr r0, [r5, #0x28]
	add r1, r6, #0
	bl Party_GetMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #0
	bl BattleSetup_AddMonToParty
	ldr r0, [sp, #0x14]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02237C04
_02237C2A:
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl BattleSetup_SetAllySideBattlersToPlayer
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x18
	mov r2, #0xb
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x30]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x18
	mov r3, #1
	bl ov80_0222A480
	ldrb r0, [r5, #0x10]
	mov r1, #0
	bl ov80_02237B58
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl Party_InitWithMaxSize
	mov r7, #0
	add r6, r4, #0
_02237C70:
	add r0, r5, #0
	bl ov80_02237E88
	str r0, [r6, #0x34]
	add r7, r7, #1
	add r6, #0x34
	cmp r7, #4
	blt _02237C70
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _02237CB0
_02237C90:
	ldr r0, [r5, #0x2c]
	add r1, r6, #0
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
	blt _02237C90
_02237CB0:
	add r0, r7, #0
	bl FreeToHeap
	ldrb r0, [r5, #0x10]
	cmp r0, #2
	beq _02237CC0
	cmp r0, #3
	bne _02237D54
_02237CC0:
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
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x18
	mov r2, #0xb
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x30]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x18
	mov r3, #3
	bl ov80_0222A480
	ldrb r0, [r5, #0x10]
	mov r1, #0
	bl ov80_02237B58
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
	ble _02237D4E
	add r6, r0, #0
_02237D28:
	ldr r0, [r5, #0x2c]
	add r1, r6, #0
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
	blt _02237D28
_02237D4E:
	add r0, r7, #0
	bl FreeToHeap
_02237D54:
	add r0, r4, #0
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02237B8C

	thumb_func_start ov80_02237D5C
ov80_02237D5C: ; 0x02237D5C
	cmp r0, #3
	bhi _02237D84
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237D6C: ; jump table
	.short _02237D74 - _02237D6C - 2 ; case 0
	.short _02237D78 - _02237D6C - 2 ; case 1
	.short _02237D7C - _02237D6C - 2 ; case 2
	.short _02237D80 - _02237D6C - 2 ; case 3
_02237D74:
	mov r0, #0x81
	bx lr
_02237D78:
	mov r0, #0x83
	bx lr
_02237D7C:
	mov r0, #0x8f
	bx lr
_02237D80:
	mov r0, #0x8f
	bx lr
_02237D84:
	mov r0, #0x81
	bx lr
	thumb_func_end ov80_02237D5C

	thumb_func_start ov80_02237D88
ov80_02237D88: ; 0x02237D88
	mov r0, #0x32
	bx lr
	thumb_func_end ov80_02237D88

	thumb_func_start ov80_02237D8C
ov80_02237D8C: ; 0x02237D8C
	cmp r0, #2
	beq _02237D94
	cmp r0, #3
	bne _02237D98
_02237D94:
	mov r0, #1
	bx lr
_02237D98:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02237D8C

	thumb_func_start ov80_02237D9C
ov80_02237D9C: ; 0x02237D9C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl Party_GetCount
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _02237DF2
_02237DAC:
	add r0, r7, #0
	add r1, r4, #0
	bl Party_GetMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02237DEC
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02237DDE
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xa3
	add r2, sp, #0
	bl SetMonData
_02237DDE:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xa0
	add r2, sp, #0
	bl SetMonData
_02237DEC:
	add r4, r4, #1
	cmp r4, r6
	blt _02237DAC
_02237DF2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02237D9C

	thumb_func_start ov80_02237DF4
ov80_02237DF4: ; 0x02237DF4
	push {r4, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	add r4, r1, #0
	bl Save_PlayerData_GetProfileAddr
	mov r3, #0
	add r1, r0, #0
	str r3, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #4
	bl sub_0207217C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02237DF4

	thumb_func_start ov80_02237E18
ov80_02237E18: ; 0x02237E18
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r1, r4, #0
	bl ov80_02237DF4
	add r0, r5, #0
	add r1, r4, #0
	bl Party_AddMon
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02237E18

	thumb_func_start ov80_02237E30
ov80_02237E30: ; 0x02237E30
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl SaveArray_Party_Init
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_02237B58
	str r0, [sp]
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	ble _02237E7E
	mov r0, #0xa2
	lsl r0, r0, #2
	add r4, r5, r0
_02237E5A:
	add r0, r5, #0
	bl ov80_02237D88
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x2c]
	add r0, r5, #0
	add r2, r6, #0
	bl ov80_02237E18
	ldr r0, [sp]
	add r7, r7, #1
	add r4, #0x38
	cmp r7, r0
	blt _02237E5A
_02237E7E:
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02237E30

	thumb_func_start ov80_02237E88
ov80_02237E88: ; 0x02237E88
	push {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _02237EA8
	ldrb r1, [r0, #0x11]
	lsl r1, r1, #1
	add r1, r0, r1
	ldrh r2, [r1, #0x30]
	ldr r1, _02237ED4 ; =0x0000FEC7
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _02237EA8
	mov r0, #7
	pop {r3, pc}
_02237EA8:
	bl ov80_02237ED8
	add r0, r0, #1
	mov r1, #7
	cmp r0, #4
	bhi _02237ED0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237EC0: ; jump table
	.short _02237ED0 - _02237EC0 - 2 ; case 0
	.short _02237ECA - _02237EC0 - 2 ; case 1
	.short _02237ECA - _02237EC0 - 2 ; case 2
	.short _02237ECE - _02237EC0 - 2 ; case 3
	.short _02237ECE - _02237EC0 - 2 ; case 4
_02237ECA:
	mov r1, #0
	b _02237ED0
_02237ECE:
	mov r1, #1
_02237ED0:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
_02237ED4: .word 0x0000FEC7
	thumb_func_end ov80_02237E88

	thumb_func_start ov80_02237ED8
ov80_02237ED8: ; 0x02237ED8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	ldrh r4, [r5, #0x16]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02237EF4
	ldr r0, _02237EF8 ; =0x00000A12
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0x16]
	cmp r1, r0
	bls _02237EF4
	add r4, r1, #0
_02237EF4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02237EF8: .word 0x00000A12
	thumb_func_end ov80_02237ED8

	thumb_func_start ov80_02237EFC
ov80_02237EFC: ; 0x02237EFC
	push {r3, r4, r5, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	bl ov80_02237ED8
	add r1, r0, #0
	add r0, sp, #0xc
	bl ov80_02237F3C
	mov r0, #6
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #3
	lsl r1, r4, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, sp, #0xc
	mov r3, #0xb
	bl LoadRectToBgTilemapRect
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02237EFC

	thumb_func_start ov80_02237F3C
ov80_02237F3C: ; 0x02237F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r0, r1, #0
	bl ov80_02237F9C
	mov r3, #0
	add r4, sp, #4
	mov r1, #4
_02237F4E:
	strb r3, [r4]
	sub r2, r1, r3
	strb r2, [r4, #5]
	add r3, r3, #1
	add r4, r4, #1
	cmp r3, #5
	blo _02237F4E
	mov r1, #0x60
	mov r7, #0
	mul r1, r0
	mov r5, #1
	add r1, #0x10
	add r2, r7, #0
	lsl r5, r5, #0xa
_02237F6A:
	ldr r4, [sp]
	lsl r6, r2, #1
	mov r0, #0
	add r3, sp, #4
	add r4, r4, r6
_02237F74:
	ldrb r6, [r3]
	add r6, r6, r1
	strh r6, [r4]
	cmp r0, #5
	blo _02237F84
	ldrh r6, [r4]
	orr r6, r5
	strh r6, [r4]
_02237F84:
	add r0, r0, #1
	add r3, r3, #1
	add r4, r4, #2
	cmp r0, #0xa
	blo _02237F74
	add r7, r7, #1
	add r1, #0x20
	add r2, #0xa
	cmp r7, #3
	blo _02237F6A
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02237F3C

	thumb_func_start ov80_02237F9C
ov80_02237F9C: ; 0x02237F9C
	cmp r0, #8
	blo _02237FA2
	mov r0, #7
_02237FA2:
	bx lr
	thumb_func_end ov80_02237F9C

	thumb_func_start ov80_02237FA4
ov80_02237FA4: ; 0x02237FA4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl sub_0205C1F0
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r3, r6, #0
	bl sub_02031248
	add r0, r4, #0
	bl sub_0205C218
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_020310BC
	add r1, r0, r6
	ldr r0, _02238030 ; =0x0000270F
	cmp r1, r0
	ble _0223800E
	add r0, r4, #0
	bl sub_0205C218
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	ldr r3, _02238030 ; =0x0000270F
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
_0223800E:
	add r0, r4, #0
	bl sub_0205C218
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r3, r6, #0
	bl sub_02031228
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238030: .word 0x0000270F
	thumb_func_end ov80_02237FA4

    .rodata

ov80_0223D4D4: ; 0x0223D4D4
	.byte 0x00, 0x00

ov80_0223D4D6: ; 0x0223D4D6
	.byte 0x63, 0x00

ov80_0223D4D8: ; 0x0223D4D8
	.byte 0x64, 0x00

ov80_0223D4DA: ; 0x0223D4DA
	.byte 0x77, 0x00, 0x50, 0x00, 0x77, 0x00
	.byte 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00, 0x78, 0x00, 0x9F, 0x00
	.byte 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00, 0xA0, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00, 0xC8, 0x00, 0x2B, 0x01
	.byte 0xC8, 0x00, 0x2B, 0x01
