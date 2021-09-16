	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start MonNotFaintedOrEgg
MonNotFaintedOrEgg: ; 0x020541B0
	push {r4, lr}
	mov r1, #0xa3
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _020541C4
	mov r0, #0
	pop {r4, pc}
_020541C4:
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020541D6
	mov r0, #1
	pop {r4, pc}
_020541D6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MonNotFaintedOrEgg

	thumb_func_start GiveMon
GiveMon: ; 0x020541DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x18]
	add r0, r6, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl AllocMonZeroed
	add r4, r0, #0
	bl ZeroMonData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0x20
	bl CreateMon
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r3, [sp, #0x44]
	add r0, r4, #0
	mov r2, #4
	str r5, [sp, #4]
	bl sub_020720FC
	add r0, sp, #0x28
	ldrh r0, [r0, #0x18]
	mov r1, #6
	add r2, sp, #0x1c
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #0x38
	bl SetMonData
	add r0, sp, #0x28
	ldrb r0, [r0, #0x14]
	cmp r0, #0
	beq _02054258
	add r0, r4, #0
	mov r1, #0xa
	add r2, sp, #0x3c
	bl SetMonData
_02054258:
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	bl AddMonToParty
	add r5, r0, #0
	beq _0205426C
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202ECC0
_0205426C:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GiveMon

	thumb_func_start GiveEgg
GiveEgg: ; 0x02054278
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r0, r4, #0
	add r5, r2, #0
	add r7, r3, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #8]
	add r0, r4, #0
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	mov r0, #0x20
	bl AllocMonZeroed
	add r4, r0, #0
	bl ZeroMonData
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	bl sub_02017FE4
	mov r1, #4
	str r1, [sp]
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r7, #0
	bl SetEggStats
	add r0, r6, #0
	add r1, r4, #0
	bl AddMonToParty
	add r5, r0, #0
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end GiveEgg

	thumb_func_start PartyMonSetMoveInSlot
PartyMonSetMoveInSlot: ; 0x020542D0
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	bl GetPartyMonByIndex
	lsl r2, r5, #0x18
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl MonSetMoveInSlot_ResetPpUp
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PartyMonSetMoveInSlot

	thumb_func_start GetIdxOfFirstPartyMonWithMove
GetIdxOfFirstPartyMonWithMove: ; 0x020542E8
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	bl GetPartyCount
	add r7, r0, #0
	mov r6, #0
	cmp r7, #0
	ble _02054352
_020542FA:
	ldr r0, [sp]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0205434C
	add r0, r4, #0
	mov r1, #0x36
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _02054348
	add r0, r4, #0
	mov r1, #0x37
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _02054348
	add r0, r4, #0
	mov r1, #0x38
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _02054348
	add r0, r4, #0
	mov r1, #0x39
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	bne _0205434C
_02054348:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205434C:
	add r6, r6, #1
	cmp r6, r7
	blt _020542FA
_02054352:
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end GetIdxOfFirstPartyMonWithMove

	thumb_func_start CountAlivePokemon
CountAlivePokemon: ; 0x02054358
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl GetPartyCount
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
	cmp r6, #0
	ble _02054382
_0205436A:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	bl MonNotFaintedOrEgg
	cmp r0, #0
	beq _0205437C
	add r5, r5, #1
_0205437C:
	add r4, r4, #1
	cmp r4, r6
	blt _0205436A
_02054382:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end CountAlivePokemon

	thumb_func_start GetFirstAliveMonInParty_CrashIfNone
GetFirstAliveMonInParty_CrashIfNone: ; 0x02054388
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl GetPartyCount
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _020543B4
_02054398:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r7, r0, #0
	bl MonNotFaintedOrEgg
	cmp r0, #0
	beq _020543AE
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_020543AE:
	add r4, r4, #1
	cmp r4, r5
	blt _02054398
_020543B4:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GetFirstAliveMonInParty_CrashIfNone

	thumb_func_start GetIdxOfFirstAliveMonInParty_CrashIfNone
GetIdxOfFirstAliveMonInParty_CrashIfNone: ; 0x020543BC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl GetPartyCount
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _020543E8
_020543CC:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	bl MonNotFaintedOrEgg
	cmp r0, #0
	beq _020543E2
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
_020543E2:
	add r4, r4, #1
	cmp r4, r5
	blt _020543CC
_020543E8:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end GetIdxOfFirstAliveMonInParty_CrashIfNone

	thumb_func_start GetFirstNonEggInParty
GetFirstNonEggInParty: ; 0x020543F0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl GetPartyCount
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r4, _02054428 ; =0x00000000
	beq _02054424
_02054400:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0205441A
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205441A:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r5
	blo _02054400
_02054424:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02054428: .word 0x00000000
	thumb_func_end GetFirstNonEggInParty

	thumb_func_start HasEnoughAlivePokemonForDoubleBattle
HasEnoughAlivePokemonForDoubleBattle: ; 0x0205442C
	push {r3, lr}
	bl CountAlivePokemon
	cmp r0, #2
	blt _0205443A
	mov r0, #1
	pop {r3, pc}
_0205443A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end HasEnoughAlivePokemonForDoubleBattle

	thumb_func_start ApplyPoisonStep
ApplyPoisonStep: ; 0x02054440
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r7, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r6, r7, #0
	bl GetPartyCount
	add r4, r7, #0
	str r0, [sp, #8]
	cmp r0, #0
	ble _020544BC
_02054458:
	ldr r0, [sp]
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	bl MonNotFaintedOrEgg
	cmp r0, #0
	beq _020544B4
	add r0, r5, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	mov r1, #0x88
	tst r0, r1
	beq _020544B4
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	cmp r0, #1
	bls _0205448E
	sub r0, r0, #1
	str r0, [sp, #0xc]
_0205448E:
	add r0, r5, #0
	mov r1, #0xa3
	add r2, sp, #0xc
	bl SetMonData
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _020544B2
	ldr r2, [sp, #4]
	add r0, r5, #0
	mov r1, #7
	add r6, r6, #1
	bl MonApplyFriendshipMod
	add r0, r5, #0
	mov r1, #5
	bl sub_02097F0C
_020544B2:
	add r7, r7, #1
_020544B4:
	ldr r0, [sp, #8]
	add r4, r4, #1
	cmp r4, r0
	blt _02054458
_020544BC:
	cmp r6, #0
	beq _020544C6
	add sp, #0x10
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_020544C6:
	cmp r7, #0
	beq _020544D0
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020544D0:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ApplyPoisonStep

	thumb_func_start SurvivePoisoning
SurvivePoisoning: ; 0x020544D8
	push {r3, r4, lr}
	sub sp, #4
	mov r1, #0xa0
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	mov r1, #0x88
	tst r0, r1
	beq _0205450E
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0205450E
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0
	bl SetMonData
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_0205450E:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end SurvivePoisoning
