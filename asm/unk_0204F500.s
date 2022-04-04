	.include "asm/macros.inc"
	.include "global.inc"

	.rodata


_020FC22C:
	.word 0x0000000A, 0x00000001
	.word 0x0000001E, 0x00000003
	.word 0x00000032, 0x00000005
	.word 0x00000064, 0x00000005
	.word 0x00000096, 0x00000005
	.word 0x000000C8, 0x00000005
	.word 0x000000FA, 0x00000005
	.word 0x0000012C, 0x00000005
	.word 0x0000015E, 0x00000005
	.word 0x00000190, 0x00000005
	.word 0x000001C2, 0x00000005
	.word 0x000001F4, 0x0000000A
	.word 0x00000258, 0x0000000A
	.word 0x000002BC, 0x0000000A
	.word 0x00000320, 0x0000000A
	.word 0x00000384, 0x0000000A
	.word 0x000003E8, 0x0000000A
	.word 0x000004B0, 0x0000001E
	.word 0x00000578, 0x0000001E
	.word 0x00000640, 0x0000001E
	.word 0x00000708, 0x0000001E
	.word 0x000007D0, 0x00000032
	.word 0x000009C4, 0x00000032
	.word 0x00000BB8, 0x00000032
	.word 0x00000DAC, 0x00000032
	.word 0x00000FA0, 0x00000032
	.word 0x00001194, 0x00000032
	.word 0x00001388, 0x00000032
	.word 0x0000157C, 0x00000032
	.word 0x00001770, 0x00000032
	.word 0x00001964, 0x00000032
	.word 0x00001B58, 0x00000032
	.word 0x00001D4C, 0x00000032
	.word 0x00001F40, 0x00000032
	.word 0x00002134, 0x00000032
	.word 0x00002328, 0x00000032
	.word 0x0000251C, 0x00000032
	.word 0x00002710, 0x00000064
	.word 0x00004E20, 0x000000C8
	.word 0x00007530, 0x0000012C
	.word 0x00009C40, 0x00000190
	.word 0x0000C350, 0x000001F4
	.word 0x0000EA60, 0x00000258
	.word 0x00011170, 0x000002BC
	.word 0x00013880, 0x00000320
	.word 0x00015F90, 0x00000384
	.word 0x000186A0, 0x000003E8
_020FC3A4:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
_020FC3AC:
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x00, 0x00, 0x00

	.text

	thumb_func_start ScrCmd_BufferBattleHallStreak
ScrCmd_BufferBattleHallStreak: ; 0x0204F500
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #8]
	add r0, #0x80
	ldr r7, [r0]
	mov r1, #0x10
	add r0, r7, #0
	bl FieldSysGetAttrAddr
	str r0, [sp, #0x24]
	ldr r0, [sp, #8]
	ldr r1, [r0, #8]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrb r0, [r1]
	add r1, r2, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #8]
	str r1, [r0, #8]
	ldrb r0, [r2]
	add r2, r1, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #8]
	str r2, [r0, #8]
	ldrb r0, [r1]
	add r1, r2, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #8]
	str r1, [r0, #8]
	ldrb r0, [r2]
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [sp, #8]
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [sp, #8]
	bl ScriptReadHalfword
	add r1, r0, #0
	ldr r0, [sp, #8]
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x2c]
	ldr r0, [r7, #0xc]
	mov r4, #0
	bl Save_CheckExtraChunksExist
	cmp r0, #0
	bne _0204F580
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	strh r0, [r1]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_0204F580:
	ldr r0, [r7, #0xc]
	mov r1, #0x20
	add r2, sp, #0x2c
	bl sub_020312C4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	cmp r0, #1
	bne _0204F5AA
	add r6, r4, #0
_0204F594:
	ldr r0, [r7, #0xc]
	ldr r1, [sp, #0x28]
	mov r2, #0
	add r3, r6, #0
	bl sub_020312E0
	add r4, r4, r0
	ldr r0, _0204F6C8 ; =0x000001ED
	add r6, r6, #1
	cmp r6, r0
	blo _0204F594
_0204F5AA:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _0204F5B4
	bl FreeToHeap
_0204F5B4:
	add r0, r4, #0
	bl sub_0205BB1C
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	add r2, r4, #0
	bl BufferIntegerAsString
	ldrh r1, [r5]
	mov r6, #0
	add r7, r6, #0
	str r1, [sp, #0xc]
	ldr r0, [sp, #0xc]
	cmp r0, #0x2f
	bhs _0204F602
	ldr r2, [sp, #0xc]
	ldr r0, _0204F6CC ; =_020FC22C
	lsl r2, r2, #3
	add r0, r0, r2
_0204F5E4:
	ldr r2, [r0]
	cmp r2, r4
	bhi _0204F5FA
	ldr r2, [r0, #4]
	add r7, r1, #0
	add r2, r6, r2
	lsl r2, r2, #0x10
	lsr r6, r2, #0x10
	ldrh r2, [r5]
	add r2, r2, #1
	strh r2, [r5]
_0204F5FA:
	add r1, r1, #1
	add r0, #8
	cmp r1, #0x2f
	blo _0204F5E4
_0204F602:
	ldr r0, [sp, #8]
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x45
	add r2, r6, #0
	bl GameStats_Add
	cmp r6, #0
	beq _0204F630
	ldr r0, [sp, #8]
	add r0, #0x80
	str r0, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_FrontierData_get
	add r1, r6, #0
	mov r2, #5
	bl FrontierData_BattlePointAction
_0204F630:
	cmp r4, #0
	bne _0204F63C
	ldr r0, [sp, #0x10]
	mov r1, #0
	strh r1, [r0]
	b _0204F662
_0204F63C:
	ldrh r1, [r5]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	beq _0204F64A
	mov r1, #1
	ldr r0, [sp, #0x10]
	b _0204F64E
_0204F64A:
	ldr r0, [sp, #0x10]
	mov r1, #2
_0204F64E:
	strh r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0x2f
	blo _0204F662
	ldr r0, [sp, #0x10]
	mov r1, #3
	strh r1, [r0]
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204F662:
	ldr r0, _0204F6CC ; =_020FC22C
	lsl r1, r7, #3
	ldr r4, [r0, r1]
	add r0, r4, #0
	bl sub_0205BB1C
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	add r2, r4, #0
	bl BufferIntegerAsString
	ldrh r0, [r5]
	lsl r1, r0, #3
	ldr r0, _0204F6CC ; =_020FC22C
	ldr r0, [r0, r1]
	bl sub_0205BB1C
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldrh r2, [r5]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x18]
	lsl r4, r2, #3
	ldr r2, _0204F6CC ; =_020FC22C
	ldr r0, [r0]
	ldr r2, [r2, r4]
	bl BufferIntegerAsString
	add r0, r6, #0
	bl sub_0205BB1C
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	add r2, r6, #0
	bl BufferIntegerAsString
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204F6C8: .word 0x000001ED
_0204F6CC: .word _020FC22C
	thumb_func_end ScrCmd_BufferBattleHallStreak

	thumb_func_start ScrCmd_BattleHallCountUsedSpecies
ScrCmd_BattleHallCountUsedSpecies: ; 0x0204F6D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0xc]
	bl Save_CheckExtraChunksExist
	cmp r0, #0
	bne _0204F708
	ldr r1, [sp]
	mov r0, #0
	strh r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0204F708:
	ldr r0, [r5, #0xc]
	mov r1, #0x20
	add r2, sp, #8
	bl sub_020312C4
	add r7, r0, #0
	ldr r0, [sp, #8]
	cmp r0, #1
	beq _0204F720
	mov r0, #0
	str r0, [sp, #4]
	b _0204F75E
_0204F720:
	mov r4, #0
_0204F722:
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	mov r2, #0
	add r3, r4, #0
	bl sub_020312E0
	mov r1, #0
	add r6, r1, r0
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	mov r2, #1
	add r3, r4, #0
	bl sub_020312E0
	add r6, r6, r0
	ldr r0, [r5, #0xc]
	add r1, r7, #0
	mov r2, #2
	add r3, r4, #0
	bl sub_020312E0
	add r0, r6, r0
	beq _0204F756
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
_0204F756:
	ldr r0, _0204F774 ; =0x000001ED
	add r4, r4, #1
	cmp r4, r0
	blo _0204F722
_0204F75E:
	cmp r7, #0
	beq _0204F768
	add r0, r7, #0
	bl FreeToHeap
_0204F768:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strh r1, [r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0204F774: .word 0x000001ED
	thumb_func_end ScrCmd_BattleHallCountUsedSpecies

	thumb_func_start ScrCmd_BattleHallGetTotalStreak
ScrCmd_BattleHallGetTotalStreak: ; 0x0204F778
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r6, #0xc]
	mov r4, #0
	bl Save_CheckExtraChunksExist
	cmp r0, #0
	bne _0204F7AE
	ldr r1, [sp]
	add r0, r4, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0204F7AE:
	ldr r0, [r6, #0xc]
	mov r1, #0x20
	add r2, sp, #4
	bl sub_020312C4
	add r7, r0, #0
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0204F7D8
	add r5, r4, #0
_0204F7C2:
	ldr r0, [r6, #0xc]
	add r1, r7, #0
	mov r2, #0
	add r3, r5, #0
	bl sub_020312E0
	add r4, r4, r0
	ldr r0, _0204F7F4 ; =0x000001ED
	add r5, r5, #1
	cmp r5, r0
	blo _0204F7C2
_0204F7D8:
	cmp r7, #0
	beq _0204F7E2
	add r0, r7, #0
	bl FreeToHeap
_0204F7E2:
	ldr r0, _0204F7F8 ; =0x00002710
	cmp r4, r0
	bls _0204F7EA
	add r4, r0, #0
_0204F7EA:
	ldr r0, [sp]
	strh r4, [r0]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204F7F4: .word 0x000001ED
_0204F7F8: .word 0x00002710
	thumb_func_end ScrCmd_BattleHallGetTotalStreak

	thumb_func_start ScrCmd_697
ScrCmd_697: ; 0x0204F7FC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r6, r0, #0
	mov r0, #0
	bl sub_0205C11C
	add r1, r0, #0
	add r0, r6, #0
	mov r2, #0xff
	bl sub_020310BC
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r5, r0, #0
	mov r0, #0
	bl sub_0205C0CC
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0xff
	bl sub_020310BC
	mov r1, #0
	strh r1, [r4]
	cmp r0, #0x32
	bne _0204F858
	mov r0, #1
	strh r0, [r4]
_0204F858:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_697

	thumb_func_start sub_0204F85C
sub_0204F85C: ; 0x0204F85C
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r5, r0, #0
	ldrb r0, [r4, #1]
	add r6, r2, #0
	add r0, r0, #1
	strb r0, [r4, #1]
	bl sub_0203769C
	cmp r5, r0
	beq _0204F876
	ldrh r0, [r6, #4]
	strh r0, [r4, #6]
_0204F876:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0204F85C

	thumb_func_start sub_0204F878
sub_0204F878: ; 0x0204F878
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r3, #0
	add r0, sp, #4
	strb r3, [r0]
	add r0, sp, #4
	str r0, [sp]
	add r0, r1, #0
	mov r1, #5
	add r4, r2, #0
	bl sub_02030C6C
	cmp r4, #3
	bne _0204F8B0
	add r0, r5, #0
	bl sub_0203107C
	add r6, r0, #0
	mov r0, #0x6a
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0x6a
	mov r3, #0
	bl sub_02031108
_0204F8B0:
	add r0, r5, #0
	bl sub_0203107C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205C0CC
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C0CC
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204F878

	thumb_func_start ScrCmd_637
ScrCmd_637: ; 0x0204F8DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030CC8
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030E08
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	cmp r7, #4
	bhi _0204F9CC
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204F948: ; jump table
	.short _0204F952 - _0204F948 - 2 ; case 0
	.short _0204F964 - _0204F948 - 2 ; case 1
	.short _0204F9CC - _0204F948 - 2 ; case 2
	.short _0204F99C - _0204F948 - 2 ; case 3
	.short _0204F9AE - _0204F948 - 2 ; case 4
_0204F952:
	add r4, #0x80
	ldr r1, [r4]
	add r0, r5, #0
	ldr r1, [r1, #0xc]
	mov r2, #0
	bl sub_0204A5B0
	strh r0, [r6]
	b _0204F9D4
_0204F964:
	cmp r5, #3
	bne _0204F988
	add r4, #0x80
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6c
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x6c
	bl sub_020310BC
	strh r0, [r6]
	b _0204F9D4
_0204F988:
	lsl r2, r5, #0x18
	mov r3, #0
	ldr r0, [sp, #4]
	mov r1, #9
	lsr r2, r2, #0x18
	str r3, [sp]
	bl sub_02030E58
	strh r0, [r6]
	b _0204F9D4
_0204F99C:
	add r4, #0x80
	ldr r0, [r4]
	lsl r2, r5, #0x18
	ldr r0, [r0, #0xc]
	ldr r1, [sp, #4]
	lsr r2, r2, #0x18
	bl sub_0204FA14
	b _0204F9D4
_0204F9AE:
	cmp r5, #0
	bne _0204F9B6
	mov r2, #0
	b _0204F9C0
_0204F9B6:
	cmp r5, #1
	bne _0204F9BE
	mov r2, #1
	b _0204F9C0
_0204F9BE:
	mov r2, #2
_0204F9C0:
	ldr r0, [r4, #0x74]
	bl sub_0204FBDC
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204F9CC:
	bl GF_AssertFail
	mov r0, #0
	strh r0, [r6]
_0204F9D4:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_637

	thumb_func_start ScrCmd_640
ScrCmd_640: ; 0x0204F9DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030E08
	lsl r2, r4, #0x18
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	lsr r2, r2, #0x18
	ldr r0, [r0, #0xc]
	bl sub_0204FA14
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_640

	thumb_func_start sub_0204FA14
sub_0204FA14: ; 0x0204FA14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	mov r3, #0
	add r0, sp, #8
	strb r3, [r0]
	add r0, sp, #8
	str r0, [sp]
	add r0, r1, #0
	mov r1, #9
	add r5, r2, #0
	bl sub_02030E18
	cmp r5, #3
	bne _0204FA4C
	ldr r0, [sp, #4]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6c
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x6c
	mov r3, #0
	bl sub_02031108
_0204FA4C:
	ldr r0, [sp, #4]
	bl sub_0203107C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205C1A0
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205C1A0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
	ldr r0, [sp, #4]
	bl sub_0203107C
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
	mov r4, #0
_0204FA9A:
	ldr r0, [sp, #4]
	bl sub_0203107C
	lsl r1, r4, #0x18
	add r6, r0, #0
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0205C174
	lsl r1, r4, #0x18
	add r7, r0, #0
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0205C174
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r3, #1
	bl sub_02031108
	add r4, r4, #1
	cmp r4, #3
	blt _0204FA9A
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204FA14

	thumb_func_start ScrCmd_638
ScrCmd_638: ; 0x0204FAD4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r3, r0, #0
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0204FB20
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_638

	thumb_func_start sub_0204FB20
sub_0204FB20: ; 0x0204FB20
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x10
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_0204FB3A:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0204FB3A
	strh r5, [r4, #4]
	strh r6, [r4, #6]
	add r0, r4, #0
	str r7, [r4, #0xc]
	bl sub_02091574
	ldr r0, [sp]
	ldr r1, _0204FB5C ; =sub_0204FB60
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204FB5C: .word sub_0204FB60
	thumb_func_end sub_0204FB20

	thumb_func_start sub_0204FB60
sub_0204FB60: ; 0x0204FB60
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #0
	beq _0204FB78
	cmp r1, #1
	beq _0204FB8E
	cmp r1, #2
	beq _0204FBCE
	b _0204FBD6
_0204FB78:
	mov r0, #0x85
	add r1, r4, #0
	mov r2, #0x10
	bl sub_02037030
	cmp r0, #1
	bne _0204FBD6
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0204FBD6
_0204FB8E:
	ldrb r0, [r4, #1]
	cmp r0, #2
	blo _0204FBD6
	ldr r0, [r4, #0xc]
	mov r1, #0
	strh r1, [r0]
	ldrh r1, [r4, #4]
	ldrh r0, [r4, #8]
	cmp r1, r0
	beq _0204FBA8
	ldrh r0, [r4, #0xa]
	cmp r1, r0
	bne _0204FBB0
_0204FBA8:
	ldr r1, [r4, #0xc]
	ldrh r0, [r1]
	add r0, r0, #1
	strh r0, [r1]
_0204FBB0:
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #8]
	cmp r1, r0
	beq _0204FBBE
	ldrh r0, [r4, #0xa]
	cmp r1, r0
	bne _0204FBC6
_0204FBBE:
	ldr r1, [r4, #0xc]
	ldrh r0, [r1]
	add r0, r0, #2
	strh r0, [r1]
_0204FBC6:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0204FBD6
_0204FBCE:
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_0204FBD6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0204FB60

	thumb_func_start sub_0204FBDC
sub_0204FBDC: ; 0x0204FBDC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	strb r6, [r4, #4]
	str r5, [r4, #0xc]
	ldr r0, [r7, #0x10]
	ldr r1, _0204FC0C ; =sub_0204FC10
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204FC0C: .word sub_0204FC10
	thumb_func_end sub_0204FBDC

	thumb_func_start sub_0204FC10
sub_0204FC10: ; 0x0204FC10
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #4
	bhi _0204FC72
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0204FC34: ; jump table
	.short _0204FC3E - _0204FC34 - 2 ; case 0
	.short _0204FC4A - _0204FC34 - 2 ; case 1
	.short _0204FC54 - _0204FC34 - 2 ; case 2
	.short _0204FC60 - _0204FC34 - 2 ; case 3
	.short _0204FC6A - _0204FC34 - 2 ; case 4
_0204FC3E:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_0204FC78
	str r0, [r4]
	b _0204FC72
_0204FC4A:
	add r1, r5, #0
	bl sub_0204FD50
	str r0, [r4]
	b _0204FC72
_0204FC54:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_0204FDA0
	str r0, [r4]
	b _0204FC72
_0204FC60:
	add r1, r5, #0
	bl sub_0204FE30
	str r0, [r4]
	b _0204FC72
_0204FC6A:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0204FC72:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204FC10

	thumb_func_start sub_0204FC78
sub_0204FC78: ; 0x0204FC78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x44
	bl MIi_CpuClearFast
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r6, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r6, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0
	add r1, #0x25
	strb r0, [r1]
	add r1, r4, #0
	mov r2, #0x17
	add r1, #0x24
	strb r2, [r1]
	str r6, [r4, #0x1c]
	add r1, r4, #0
	ldrb r2, [r5, #5]
	add r1, #0x26
	strb r2, [r1]
_0204FCCC:
	add r1, r5, r0
	ldrb r2, [r1, #6]
	add r1, r4, r0
	add r0, r0, #1
	lsl r0, r0, #0x18
	add r1, #0x30
	lsr r0, r0, #0x18
	strb r2, [r1]
	cmp r0, #3
	blo _0204FCCC
	add r0, r4, #0
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	mov r1, #0xf
	ldrb r0, [r0]
	mov ip, r1
	add r2, r4, #0
	bic r0, r1
	mov r1, #3
	orr r1, r0
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r0, [r0]
	mov r7, #0xf0
	mov r3, #0x30
	bic r0, r7
	add r1, r0, #0
	add r0, r4, #0
	orr r1, r3
	add r0, #0x36
	add r3, #0xdc
	strb r1, [r0]
	add r0, r6, r3
	str r0, [r4, #0x20]
	ldrb r0, [r5, #4]
	add r2, #0x36
	cmp r0, #2
	bne _0204FD3A
	ldrb r0, [r2]
	mov r1, ip
	bic r0, r1
	mov r1, #2
	orr r0, r1
	strb r0, [r2]
	ldrb r1, [r2]
	mov r0, #0x20
	bic r1, r7
	orr r0, r1
	strb r0, [r2]
_0204FD3A:
	ldr r1, _0204FD4C ; =_0210159C
	add r0, r6, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r5, #0xc]
	str r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204FD4C: .word _0210159C
	thumb_func_end sub_0204FC78

	thumb_func_start sub_0204FD50
sub_0204FD50: ; 0x0204FD50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _0204FD62
	mov r0, #1
	pop {r3, r4, r5, pc}
_0204FD62:
	ldr r0, [r5, #0xc]
	ldr r4, [r0]
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _0204FD78
	cmp r0, #7
	bne _0204FD7C
	mov r0, #4
	pop {r3, r4, r5, pc}
_0204FD78:
	mov r0, #4
	pop {r3, r4, r5, pc}
_0204FD7C:
	add r0, r4, #0
	add r0, #0x30
	add r1, r5, #6
	mov r2, #3
	bl MI_CpuCopy8
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r5, #5]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #0xc]
	mov r1, #0
	str r1, [r0]
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204FD50

	thumb_func_start sub_0204FDA0
sub_0204FDA0: ; 0x0204FDA0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	ldr r5, [r7, #0xc]
	add r0, r2, #0
	mov r1, #0x3c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r5, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	add r0, r5, #0
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	mov r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r6, #5]
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl Save_SpecialRibbons_get
	str r0, [r4, #0x20]
	add r0, r5, #0
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _0204FE28 ; =_020FC3A4
	add r0, r4, #0
	bl sub_02089D40
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	ldr r1, _0204FE2C ; =_02103A1C
	add r0, r7, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r6, #0xc]
	str r4, [r0]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204FE28: .word _020FC3A4
_0204FE2C: .word _02103A1C
	thumb_func_end sub_0204FDA0

	thumb_func_start sub_0204FE30
sub_0204FE30: ; 0x0204FE30
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _0204FE42
	mov r0, #3
	pop {r4, pc}
_0204FE42:
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	strb r1, [r4, #5]
	bl FreeToHeap
	ldr r1, [r4, #0xc]
	mov r0, #0
	str r0, [r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0204FE30

	thumb_func_start sub_0204FE58
sub_0204FE58: ; 0x0204FE58
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	ldrb r0, [r4, #1]
	add r5, r2, #0
	add r0, r0, #1
	strb r0, [r4, #1]
	bl sub_0203769C
	cmp r6, r0
	beq _0204FE76
	ldrh r0, [r5, #4]
	strh r0, [r4, #8]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0xa]
_0204FE76:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0204FE58

	thumb_func_start ScrCmd_643
ScrCmd_643: ; 0x0204FE78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030E88
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030FA0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	cmp r7, #4
	bhi _0204FF68
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204FEE4: ; jump table
	.short _0204FEEE - _0204FEE4 - 2 ; case 0
	.short _0204FF00 - _0204FEE4 - 2 ; case 1
	.short _0204FF68 - _0204FEE4 - 2 ; case 2
	.short _0204FF38 - _0204FEE4 - 2 ; case 3
	.short _0204FF4A - _0204FEE4 - 2 ; case 4
_0204FEEE:
	add r4, #0x80
	ldr r1, [r4]
	add r0, r5, #0
	ldr r1, [r1, #0xc]
	mov r2, #0
	bl sub_0204A5B0
	strh r0, [r6]
	b _0204FF70
_0204FF00:
	cmp r5, #3
	bne _0204FF24
	add r4, #0x80
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6e
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x6e
	bl sub_020310BC
	strh r0, [r6]
	b _0204FF70
_0204FF24:
	lsl r2, r5, #0x18
	mov r3, #0
	ldr r0, [sp, #4]
	mov r1, #8
	lsr r2, r2, #0x18
	str r3, [sp]
	bl sub_02030FE4
	strh r0, [r6]
	b _0204FF70
_0204FF38:
	add r4, #0x80
	ldr r0, [r4]
	lsl r2, r5, #0x18
	ldr r0, [r0, #0xc]
	ldr r1, [sp, #4]
	lsr r2, r2, #0x18
	bl sub_0204FFB0
	b _0204FF70
_0204FF4A:
	cmp r5, #0
	bne _0204FF52
	mov r2, #0
	b _0204FF5C
_0204FF52:
	cmp r5, #1
	bne _0204FF5A
	mov r2, #1
	b _0204FF5C
_0204FF5A:
	mov r2, #2
_0204FF5C:
	ldr r0, [r4, #0x74]
	bl sub_0205011C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204FF68:
	bl GF_AssertFail
	mov r0, #0
	strh r0, [r6]
_0204FF70:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_643

	thumb_func_start ScrCmd_646
ScrCmd_646: ; 0x0204FF78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030FA0
	lsl r2, r4, #0x18
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	lsr r2, r2, #0x18
	ldr r0, [r0, #0xc]
	bl sub_0204FFB0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_646

	thumb_func_start sub_0204FFB0
sub_0204FFB0: ; 0x0204FFB0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r3, #0
	add r0, sp, #4
	strb r3, [r0]
	add r0, sp, #4
	str r0, [sp]
	add r0, r1, #0
	mov r1, #8
	add r4, r2, #0
	bl sub_02030FB0
	cmp r4, #3
	bne _0204FFE8
	add r0, r5, #0
	bl sub_0203107C
	add r6, r0, #0
	mov r0, #0x6e
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0x6e
	mov r3, #0
	bl sub_02031108
_0204FFE8:
	add r0, r5, #0
	bl sub_0203107C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0205C2C0
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C2C0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204FFB0

	thumb_func_start ScrCmd_644
ScrCmd_644: ; 0x02050014
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r3, r0, #0
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02050060
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_644

	thumb_func_start sub_02050060
sub_02050060: ; 0x02050060
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x10
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x10
	mov r0, #0
_0205007A:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0205007A
	strh r5, [r4, #4]
	strh r6, [r4, #6]
	add r0, r4, #0
	str r7, [r4, #0xc]
	bl sub_02091574
	ldr r0, [sp]
	ldr r1, _0205009C ; =sub_020500A0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0205009C: .word sub_020500A0
	thumb_func_end sub_02050060

	thumb_func_start sub_020500A0
sub_020500A0: ; 0x020500A0
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #0
	beq _020500B8
	cmp r1, #1
	beq _020500CE
	cmp r1, #2
	beq _0205010E
	b _02050116
_020500B8:
	mov r0, #0x86
	add r1, r4, #0
	mov r2, #0x10
	bl sub_02037030
	cmp r0, #1
	bne _02050116
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02050116
_020500CE:
	ldrb r0, [r4, #1]
	cmp r0, #2
	blo _02050116
	ldr r0, [r4, #0xc]
	mov r1, #0
	strh r1, [r0]
	ldrh r1, [r4, #4]
	ldrh r0, [r4, #8]
	cmp r1, r0
	beq _020500E8
	ldrh r0, [r4, #0xa]
	cmp r1, r0
	bne _020500F0
_020500E8:
	ldr r1, [r4, #0xc]
	ldrh r0, [r1]
	add r0, r0, #1
	strh r0, [r1]
_020500F0:
	ldrh r1, [r4, #6]
	ldrh r0, [r4, #8]
	cmp r1, r0
	beq _020500FE
	ldrh r0, [r4, #0xa]
	cmp r1, r0
	bne _02050106
_020500FE:
	ldr r1, [r4, #0xc]
	ldrh r0, [r1]
	add r0, r0, #2
	strh r0, [r1]
_02050106:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02050116
_0205010E:
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_02050116:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020500A0

	thumb_func_start sub_0205011C
sub_0205011C: ; 0x0205011C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	strb r6, [r4, #4]
	str r5, [r4, #0xc]
	ldr r0, [r7, #0x10]
	ldr r1, _0205014C ; =sub_02050150
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0205014C: .word sub_02050150
	thumb_func_end sub_0205011C

	thumb_func_start sub_02050150
sub_02050150: ; 0x02050150
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #4
	bhi _020501B2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02050174: ; jump table
	.short _0205017E - _02050174 - 2 ; case 0
	.short _0205018A - _02050174 - 2 ; case 1
	.short _02050194 - _02050174 - 2 ; case 2
	.short _020501A0 - _02050174 - 2 ; case 3
	.short _020501AA - _02050174 - 2 ; case 4
_0205017E:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_020501B8
	str r0, [r4]
	b _020501B2
_0205018A:
	add r1, r5, #0
	bl sub_02050290
	str r0, [r4]
	b _020501B2
_02050194:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_020502E0
	str r0, [r4]
	b _020501B2
_020501A0:
	add r1, r5, #0
	bl sub_02050370
	str r0, [r4]
	b _020501B2
_020501AA:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_020501B2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02050150

	thumb_func_start sub_020501B8
sub_020501B8: ; 0x020501B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x44
	bl MIi_CpuClearFast
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r6, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r6, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0
	add r1, #0x25
	strb r0, [r1]
	add r1, r4, #0
	mov r2, #0x17
	add r1, #0x24
	strb r2, [r1]
	str r6, [r4, #0x1c]
	add r1, r4, #0
	ldrb r2, [r5, #5]
	add r1, #0x26
	strb r2, [r1]
_0205020C:
	add r1, r5, r0
	ldrb r2, [r1, #6]
	add r1, r4, r0
	add r0, r0, #1
	lsl r0, r0, #0x18
	add r1, #0x30
	lsr r0, r0, #0x18
	strb r2, [r1]
	cmp r0, #3
	blo _0205020C
	add r0, r4, #0
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	mov r1, #0xf
	ldrb r0, [r0]
	mov ip, r1
	add r2, r4, #0
	bic r0, r1
	mov r1, #3
	orr r1, r0
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r0, [r0]
	mov r7, #0xf0
	mov r3, #0x30
	bic r0, r7
	add r1, r0, #0
	add r0, r4, #0
	orr r1, r3
	add r0, #0x36
	add r3, #0xdc
	strb r1, [r0]
	add r0, r6, r3
	str r0, [r4, #0x20]
	ldrb r0, [r5, #4]
	add r2, #0x36
	cmp r0, #2
	bne _0205027A
	ldrb r0, [r2]
	mov r1, ip
	bic r0, r1
	mov r1, #2
	orr r0, r1
	strb r0, [r2]
	ldrb r1, [r2]
	mov r0, #0x20
	bic r1, r7
	orr r0, r1
	strb r0, [r2]
_0205027A:
	ldr r1, _0205028C ; =_0210159C
	add r0, r6, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r5, #0xc]
	str r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205028C: .word _0210159C
	thumb_func_end sub_020501B8

	thumb_func_start sub_02050290
sub_02050290: ; 0x02050290
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _020502A2
	mov r0, #1
	pop {r3, r4, r5, pc}
_020502A2:
	ldr r0, [r5, #0xc]
	ldr r4, [r0]
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _020502B8
	cmp r0, #7
	bne _020502BC
	mov r0, #4
	pop {r3, r4, r5, pc}
_020502B8:
	mov r0, #4
	pop {r3, r4, r5, pc}
_020502BC:
	add r0, r4, #0
	add r0, #0x30
	add r1, r5, #6
	mov r2, #3
	bl MI_CpuCopy8
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r5, #5]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #0xc]
	mov r1, #0
	str r1, [r0]
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02050290

	thumb_func_start sub_020502E0
sub_020502E0: ; 0x020502E0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	ldr r5, [r7, #0xc]
	add r0, r2, #0
	mov r1, #0x3c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r5, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	add r0, r5, #0
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	mov r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r6, #5]
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl Save_SpecialRibbons_get
	str r0, [r4, #0x20]
	add r0, r5, #0
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _02050368 ; =_020FC3AC
	add r0, r4, #0
	bl sub_02089D40
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	ldr r1, _0205036C ; =_02103A1C
	add r0, r7, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r6, #0xc]
	str r4, [r0]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02050368: .word _020FC3AC
_0205036C: .word _02103A1C
	thumb_func_end sub_020502E0

	thumb_func_start sub_02050370
sub_02050370: ; 0x02050370
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _02050382
	mov r0, #3
	pop {r4, pc}
_02050382:
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	strb r1, [r4, #5]
	bl FreeToHeap
	ldr r1, [r4, #0xc]
	mov r0, #0
	str r0, [r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02050370

	thumb_func_start sub_02050398
sub_02050398: ; 0x02050398
	push {r4, r5, r6, lr}
	add r4, r3, #0
	add r6, r0, #0
	ldrb r0, [r4, #1]
	add r5, r2, #0
	add r0, r0, #1
	strb r0, [r4, #1]
	bl sub_0203769C
	cmp r6, r0
	beq _020503B6
	ldrh r0, [r5, #4]
	strh r0, [r4, #8]
	ldrh r0, [r5, #6]
	strh r0, [r4, #0xa]
_020503B6:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02050398
