	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_137
ScrCmd_137: ; 0x0204D088
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r5, [r0]
	ldr r0, [r5, #0xc]
	bl Sav2_Pokedex_get
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x14]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x18]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	ldr r0, [sp, #0x1c]
	lsl r3, r7, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	lsr r3, r3, #0x18
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	mov r0, #0x18
	str r0, [sp, #0x10]
	ldr r1, [r5, #0xc]
	mov r0, #0xb
	bl GiveMon
	strh r0, [r4]
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_137

	thumb_func_start ScrCmd_364
ScrCmd_364: ; 0x0204D154
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	bl RemoveMonFromParty
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_364

	thumb_func_start ScrCmd_354
ScrCmd_354: ; 0x0204D180
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204D1D4
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	b _0204D1D6
_0204D1D4:
	mov r0, #0
_0204D1D6:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_354

	thumb_func_start ScrCmd_355
ScrCmd_355: ; 0x0204D1DC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	ldrh r1, [r6]
	bl GetPartyMonByIndex
	mov r1, #7
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r7, #0
	bl PlayerProfile_GetTrainerID
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r5, r0
	bne _0204D240
	mov r0, #0
	b _0204D242
_0204D240:
	mov r0, #1
_0204D242:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_355

	thumb_func_start ScrCmd_138
ScrCmd_138: ; 0x0204D248
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, #0x80
	ldr r4, [r0]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #6
	bhs _0204D2C8
	mov r0, #0xb
	bl AllocMonZeroed
	add r4, r0, #0
	bl ZeroMonData
	mov r0, #1
	add r1, r5, #0
	bl sub_02017FE4
	mov r1, #3
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	add r0, r4, #0
	mov r2, #1
	add r3, r7, #0
	bl SetEggStats
	add r0, r6, #0
	add r1, r4, #0
	bl AddMonToParty
	add r0, r4, #0
	bl FreeToHeap
_0204D2C8:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_138

	thumb_func_start ScrCmd_139
ScrCmd_139: ; 0x0204D2D0
	push {r3, r4, r5, r6, r7, lr}
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
	bl VarGet
	add r5, #0x80
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl PartyMonSetMoveInSlot
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_139

	thumb_func_start ScrCmd_140
ScrCmd_140: ; 0x0204D328
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r7, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
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
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r2, #0
	mov r1, #0x4c
	add r4, r0, #0
	strh r2, [r6]
	bl GetMonData
	cmp r0, #0
	beq _0204D38A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204D38A:
	add r0, r4, #0
	mov r1, #0x36
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0204D3C2
	add r0, r4, #0
	mov r1, #0x37
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0204D3C2
	add r0, r4, #0
	mov r1, #0x38
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0204D3C2
	add r0, r4, #0
	mov r1, #0x39
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	bne _0204D3C6
_0204D3C2:
	mov r0, #1
	strh r0, [r6]
_0204D3C6:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_140

	thumb_func_start ScrCmd_141
ScrCmd_141: ; 0x0204D3CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp, #4]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r5, r0, #0
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r1, _0204D484 ; =0x00000006
	ldr r0, [sp]
	ldr r6, _0204D488 ; =0x00000000
	strh r1, [r0]
	beq _0204D47C
_0204D418:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204D472
	add r0, r4, #0
	mov r1, #0x36
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0204D46C
	add r0, r4, #0
	mov r1, #0x37
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0204D46C
	add r0, r4, #0
	mov r1, #0x38
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	beq _0204D46C
	add r0, r4, #0
	mov r1, #0x39
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	bne _0204D472
_0204D46C:
	ldr r0, [sp]
	strh r6, [r0]
	b _0204D47C
_0204D472:
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, r7
	blo _0204D418
_0204D47C:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204D484: .word 0x00000006
_0204D488: .word 0x00000000
	thumb_func_end ScrCmd_141

	thumb_func_start ScrCmd_435
ScrCmd_435: ; 0x0204D48C
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
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	bl SurvivePoisoning
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_435

	thumb_func_start ScrCmd_434
ScrCmd_434: ; 0x0204D4D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r7, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r4, #0
	ldr r0, [sp, #4]
	add r5, r4, #0
	strh r4, [r0]
	ldr r0, [sp, #8]
	cmp r0, #0
	bls _0204D55A
_0204D51E:
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204D54E
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r1, [sp]
	cmp r0, r1
	bhi _0204D54E
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0204D54E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp, #8]
	cmp r4, r0
	blo _0204D51E
_0204D55A:
	ldr r0, [sp, #4]
	strh r5, [r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_434

	thumb_func_start ScrCmd_535
ScrCmd_535: ; 0x0204D564
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r2, #0
	mov r1, #0x4c
	add r5, r0, #0
	strh r2, [r4]
	bl GetMonData
	cmp r0, #0
	bne _0204D5BA
	add r0, r5, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
_0204D5BA:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_535

	thumb_func_start ScrCmd_457
ScrCmd_457: ; 0x0204D5C0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r1, r6, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r6, #0
	bl ScriptReadHalfword
	add r6, #0x80
	add r1, r0, #0
	ldr r0, [r6]
	bl VarGet
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r6, r0
	blt _0204D606
	mov r0, #0
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_0204D606:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0204D626
	mov r0, #0
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_0204D626:
	add r0, r5, #0
	bl GetMonNature
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_457

	thumb_func_start ScrCmd_458
ScrCmd_458: ; 0x0204D634
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r7, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r1, _0204D6B8 ; =0x000000FF
	ldr r0, [sp, #4]
	ldr r5, _0204D6BC ; =0x00000000
	strh r1, [r0]
	beq _0204D6B2
_0204D67C:
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204D6A8
	add r0, r4, #0
	bl GetMonNature
	ldr r1, [sp]
	cmp r1, r0
	bne _0204D6A8
	ldr r0, [sp, #4]
	strh r5, [r0]
	b _0204D6B2
_0204D6A8:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r6
	blo _0204D67C
_0204D6B2:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204D6B8: .word 0x000000FF
_0204D6BC: .word 0x00000000
	thumb_func_end ScrCmd_458

	thumb_func_start ScrCmd_382
ScrCmd_382: ; 0x0204D6C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #9
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_382

	thumb_func_start ScrCmd_383
ScrCmd_383: ; 0x0204D708
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
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
	add r5, #0x80
	str r0, [sp]
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	add r7, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	ldr r1, [sp]
	bl GetPartyMonByIndex
	mov r1, #9
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	add r1, sp, #4
	strh r0, [r1]
	cmp r4, #0
	beq _0204D7B6
	add r0, r5, #0
	mov r1, #0x9b
	mov r2, #0
	bl GetMonData
	cmp r0, #0xb
	bne _0204D77A
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0204D77A:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	bne _0204D78E
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0204D78E:
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #1
	mov r2, #0xb
	bl GetItemAttr
	cmp r0, #0x35
	bne _0204D7B6
	mov r0, #0x96
	mul r0, r4
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
_0204D7B6:
	add r0, sp, #4
	ldrh r1, [r0]
	add r1, r1, r4
	strh r1, [r0]
	ldrh r1, [r0]
	cmp r1, #0xff
	bls _0204D7C8
	mov r1, #0xff
	strh r1, [r0]
_0204D7C8:
	add r0, r5, #0
	mov r1, #9
	add r2, sp, #4
	bl SetMonData
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_383

	thumb_func_start ScrCmd_384
ScrCmd_384: ; 0x0204D7D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #9
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	add r1, sp, #0
	strh r0, [r1]
	ldrh r0, [r1]
	cmp r4, r0
	bls _0204D82C
	mov r0, #0
	b _0204D82E
_0204D82C:
	sub r0, r0, r4
_0204D82E:
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #9
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ScrCmd_384

	thumb_func_start ScrCmd_542
ScrCmd_542: ; 0x0204D840
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
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
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r4, #0x13
	add r1, r4, #0
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_542

	thumb_func_start ScrCmd_496
ScrCmd_496: ; 0x0204D8A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0205BD20
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_496

	thumb_func_start ScrCmd_529
ScrCmd_529: ; 0x0204D8C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_0205BD64
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_529

	thumb_func_start ScrCmd_497
ScrCmd_497: ; 0x0204D8F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	add r0, r4, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	strh r0, [r7]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_497

	thumb_func_start ScrCmd_332
ScrCmd_332: ; 0x0204D95C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_332

	thumb_func_start ScrCmd_356
ScrCmd_356: ; 0x0204D988
	push {r3, r4, r5, r6, r7, lr}
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
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	mov r5, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r7, #0
	ble _0204D9D6
_0204D9B6:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0204D9D0
	add r4, r4, #1
_0204D9D0:
	add r5, r5, #1
	cmp r5, r7
	blt _0204D9B6
_0204D9D6:
	ldr r0, [sp]
	strh r4, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_356

	thumb_func_start ScrCmd_357
ScrCmd_357: ; 0x0204D9E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r7, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	mov r5, #0
	add r4, r5, #0
	str r0, [sp, #8]
	cmp r0, #0
	ble _0204DA5C
_0204DA24:
	ldr r0, [sp]
	cmp r5, r0
	beq _0204DA54
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204DA54
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DA54
	add r4, r4, #1
_0204DA54:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _0204DA24
_0204DA5C:
	ldr r0, [sp, #4]
	strh r4, [r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_357

	thumb_func_start ScrCmd_358
ScrCmd_358: ; 0x0204DA68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r7, [r1]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	str r0, [sp]
	ldr r0, [r7, #0xc]
	bl GetStoragePCPointer
	str r0, [sp, #4]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	mov r5, #0
	add r4, r5, #0
	str r0, [sp, #8]
	cmp r0, #0
	ble _0204DAD2
_0204DAA0:
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204DACA
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DACA
	add r4, r4, #1
_0204DACA:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _0204DAA0
_0204DAD2:
	ldr r0, [sp, #4]
	bl PCStorage_CountMonsInAllBoxes
	add r1, r4, r0
	ldr r0, [sp]
	strh r1, [r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_358

	thumb_func_start ScrCmd_359
ScrCmd_359: ; 0x0204DAE4
	push {r3, r4, r5, r6, r7, lr}
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
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	mov r5, #0
	add r7, r0, #0
	add r4, r5, #0
	cmp r7, #0
	ble _0204DB32
_0204DB12:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DB2C
	add r4, r4, #1
_0204DB2C:
	add r5, r5, #1
	cmp r5, r7
	blt _0204DB12
_0204DB32:
	ldr r0, [sp]
	strh r4, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_359

	thumb_func_start ScrCmd_238
ScrCmd_238: ; 0x0204DB3C
	push {r3, r4, r5, r6, r7, lr}
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
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r4, _0204DB9C ; =0x00000000
	ldr r0, [sp]
	strh r4, [r0]
	beq _0204DB98
	mov r7, #0x9a
_0204DB6E:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DB8E
	ldr r0, [sp]
	mov r1, #1
	strh r1, [r0]
	b _0204DB98
_0204DB8E:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r6
	blo _0204DB6E
_0204DB98:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204DB9C: .word 0x00000000
	thumb_func_end ScrCmd_238

	thumb_func_start ScrCmd_239
ScrCmd_239: ; 0x0204DBA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
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
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_239

	thumb_func_start ScrCmd_396
ScrCmd_396: ; 0x0204DBE8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DC36
	mov r0, #0
	strh r0, [r5]
	pop {r4, r5, r6, pc}
_0204DC36:
	mov r4, #0
	add r0, r6, #0
	mov r1, #0x36
	add r2, r4, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DC4C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0204DC4C:
	add r0, r6, #0
	mov r1, #0x37
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DC60
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0204DC60:
	add r0, r6, #0
	mov r1, #0x38
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DC74
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0204DC74:
	add r0, r6, #0
	mov r1, #0x39
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204DC88
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0204DC88:
	strh r4, [r5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_396

	thumb_func_start ScrCmd_397
ScrCmd_397: ; 0x0204DC90
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r4, #0
	bl MonDeleteMoveSlot
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_397

	thumb_func_start ScrCmd_398
ScrCmd_398: ; 0x0204DCD4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r4, #0x36
	add r1, r4, #0
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_398

	thumb_func_start ScrCmd_426
ScrCmd_426: ; 0x0204DD34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r1, [r5, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldr r0, [r6, #0xc]
	ldrb r5, [r1]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ItemIdIsMail
	cmp r0, #0
	bne _0204DD94
	mov r0, #0
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0204DD94:
	cmp r5, #0
	bne _0204DDA0
	mov r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204DDA0:
	ldr r0, _0204DDE0 ; =SDK_OVERLAY_OVY_23_ID
	mov r1, #2
	bl HandleLoadOverlay
	bl ov23_02259A24
	add r6, r0, #0
	mov r0, #0xb
	bl Mail_new
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #0xaa
	add r2, r5, #0
	bl GetMonData
	add r0, r6, #0
	add r1, r5, #0
	bl Mail_compare
	strh r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, _0204DDE0 ; =SDK_OVERLAY_OVY_23_ID
	bl UnloadOverlayByID
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204DDE0: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end ScrCmd_426

	thumb_func_start ScrCmd_781
ScrCmd_781: ; 0x0204DDE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp, #4]
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r1, #0
	str r0, [sp]
	strh r1, [r0]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	ldr r4, _0204DEE0 ; =SDK_OVERLAY_OVY_23_ID
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl HandleLoadOverlay
	bl ov23_02259A24
	add r7, r0, #0
	mov r0, #0xb
	bl Mail_new
	add r5, r0, #0
	add r0, r4, #0
	bl UnloadOverlayByID
	add r0, r6, #0
	mov r4, #0
	bl GetPartyCount
	cmp r0, #0
	ble _0204DE92
_0204DE3A:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ItemIdIsMail
	cmp r0, #0
	beq _0204DE86
	ldr r0, [sp, #8]
	mov r1, #0xaa
	add r2, r5, #0
	bl GetMonData
	add r0, r7, #0
	add r1, r5, #0
	bl Mail_compare
	cmp r0, #0
	beq _0204DE86
	ldr r0, [sp]
	mov r1, #1
	strh r1, [r0]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0204DE86:
	add r0, r6, #0
	add r4, r4, #1
	bl GetPartyCount
	cmp r4, r0
	blt _0204DE3A
_0204DE92:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_Mailbox_get
	add r6, r0, #0
	mov r4, #0
_0204DE9E:
	add r0, r6, #0
	mov r1, #0
	add r2, r4, #0
	add r3, r5, #0
	bl Mailbox_FetchMailToBuffer
	add r0, r5, #0
	bl Mail_TypeIsValid
	cmp r0, #0
	beq _0204DEC8
	add r0, r7, #0
	add r1, r5, #0
	bl Mail_compare
	cmp r0, #0
	beq _0204DEC8
	ldr r0, [sp]
	mov r1, #1
	strh r1, [r0]
	b _0204DECE
_0204DEC8:
	add r4, r4, #1
	cmp r4, #0x14
	blt _0204DE9E
_0204DECE:
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0204DEE0: .word SDK_OVERLAY_OVY_23_ID
	thumb_func_end ScrCmd_781

	thumb_func_start ScrCmd_428
ScrCmd_428: ; 0x0204DEE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r4, [r1]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ItemIdIsMail
	cmp r0, #0
	bne _0204DF24
	mov r0, #0
	pop {r3, r4, r5, pc}
_0204DF24:
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0]
	mov r0, #0xb
	bl Mail_new
	add r5, r0, #0
	bl Mail_init
	add r0, r4, #0
	mov r1, #0xaa
	add r2, r5, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_428

	thumb_func_start ScrCmd_389
ScrCmd_389: ; 0x0204DF54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r7, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r5, _0204DFE0 ; =0x00000000
	ldr r0, [sp, #4]
	strh r5, [r0]
	beq _0204DFDA
_0204DF9A:
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204DFD0
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [sp]
	cmp r0, r1
	bne _0204DFD0
	ldr r0, [sp, #4]
	mov r1, #1
	strh r1, [r0]
	b _0204DFDA
_0204DFD0:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r6
	blo _0204DF9A
_0204DFDA:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204DFE0: .word 0x00000000
	thumb_func_end ScrCmd_389

	thumb_func_start ScrCmd_632
ScrCmd_632: ; 0x0204DFE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r1, [r1]
	str r1, [sp, #4]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	mov r3, #0
	add r7, r0, #0
	add r2, r3, #0
	add r1, sp, #0xc
_0204E01C:
	lsl r0, r3, #1
	strh r2, [r1, r0]
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #6
	blo _0204E01C
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r5, #0
	strh r5, [r6]
	ldr r0, [sp]
	cmp r0, #0
	bls _0204E0B6
	add r4, sp, #0xc
_0204E048:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	cmp r0, #0
	bne _0204E0AA
	ldr r0, [sp, #8]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r7, #0
	bne _0204E0A0
	lsl r1, r5, #1
	strh r0, [r4, r1]
	mov r0, #0
	cmp r5, #0
	bls _0204E0AA
	ldrh r1, [r4, r1]
_0204E082:
	lsl r2, r0, #1
	ldrh r2, [r4, r2]
	cmp r2, r1
	bne _0204E094
	mov r0, #1
	strh r0, [r6]
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204E094:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r5
	blo _0204E082
	b _0204E0AA
_0204E0A0:
	cmp r7, r0
	bne _0204E0AA
	ldrh r0, [r6]
	add r0, r0, #1
	strh r0, [r6]
_0204E0AA:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp]
	cmp r5, r0
	blo _0204E048
_0204E0B6:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_632

	thumb_func_start ScrCmd_647
ScrCmd_647: ; 0x0204E0BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r7, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r1, _0204E148 ; =0x000000FF
	ldr r0, [sp, #4]
	ldr r5, _0204E14C ; =0x00000000
	strh r1, [r0]
	beq _0204E142
_0204E104:
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204E138
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [sp]
	cmp r0, r1
	bne _0204E138
	ldr r0, [sp, #4]
	strh r5, [r0]
	b _0204E142
_0204E138:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r6
	blo _0204E104
_0204E142:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204E148: .word 0x000000FF
_0204E14C: .word 0x00000000
	thumb_func_end ScrCmd_647

	thumb_func_start ScrCmd_478
ScrCmd_478: ; 0x0204E150
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r4, #0
	add r6, r0, #0
	add r5, r4, #0
	add r7, r4, #0
_0204E192:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add r1, r7, #0
	bl sub_0208E55C
	add r1, r0, #0
	add r0, r6, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204E1B0
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_0204E1B0:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x50
	blo _0204E192
	ldr r0, [sp]
	strh r5, [r0]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_478

	thumb_func_start ScrCmd_479
ScrCmd_479: ; 0x0204E1C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x10
	add r4, #0x80
	lsr r6, r0, #0x10
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #4]
_0204E202:
	mov r5, #0
	cmp r6, #0
	bls _0204E250
	ldr r0, [sp, #8]
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_0204E20E:
	ldr r0, [sp, #0xc]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204E246
	add r0, r7, #0
	mov r1, #0
	bl sub_0208E55C
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204E246
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	b _0204E250
_0204E246:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blo _0204E20E
_0204E250:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	cmp r0, #0x50
	blo _0204E202
	ldr r1, [sp, #4]
	ldr r0, [sp]
	strh r1, [r0]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_479

	thumb_func_start ScrCmd_480
ScrCmd_480: ; 0x0204E26C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl sub_0208E55C
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_480

	thumb_func_start ScrCmd_481
ScrCmd_481: ; 0x0204E2D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
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
	bl VarGet
	add r4, r0, #0
	mov r1, #1
	add r0, sp, #0
	add r5, #0x80
	strb r1, [r0]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r5, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl sub_0208E55C
	add r1, r0, #0
	add r0, r5, #0
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_481

	thumb_func_start ScrCmd_584
ScrCmd_584: ; 0x0204E338
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x10
	add r4, #0x80
	lsr r6, r0, #0x10
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #4]
_0204E374:
	mov r5, #0
	cmp r6, #0
	bls _0204E3B4
_0204E37A:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0204E3AA
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204E3AA
	ldr r0, [sp]
	mov r1, #1
	strh r1, [r0]
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204E3AA:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blo _0204E37A
_0204E3B4:
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	cmp r0, #0x50
	blo _0204E374
	ldr r1, [sp]
	mov r0, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_584

	thumb_func_start ScrCmd_688
ScrCmd_688: ; 0x0204E3CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r6, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r1, _0204E468 ; =0x000000FF
	ldr r0, [sp, #4]
	ldr r5, _0204E46C ; =0x00000000
	strh r1, [r0]
	beq _0204E460
_0204E414:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0204E456
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [sp]
	cmp r0, r1
	bne _0204E456
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0204E456
	ldr r0, [sp, #4]
	strh r5, [r0]
	b _0204E460
_0204E456:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r7
	blo _0204E414
_0204E460:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204E468: .word 0x000000FF
_0204E46C: .word 0x00000000
	thumb_func_end ScrCmd_688

	thumb_func_start ScrCmd_701
ScrCmd_701: ; 0x0204E470
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	str r0, [sp]
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	ldr r0, [sp]
	cmp r6, #0
	strh r4, [r0]
	ble _0204E4DA
_0204E4B4:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	bne _0204E4D4
	ldr r0, [sp]
	mov r1, #1
	strh r1, [r0]
	b _0204E4DA
_0204E4D4:
	add r4, r4, #1
	cmp r4, r6
	blt _0204E4B4
_0204E4DA:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_701

	thumb_func_start ScrCmd_827
ScrCmd_827: ; 0x0204E4E0
	push {r4, r5, r6, lr}
	add r5, r0, #0
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
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_827

	thumb_func_start ScrCmd_828
ScrCmd_828: ; 0x0204E528
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r2, #0
	add r1, sp, #0
	strb r2, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	ldr r1, [r4, #8]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r4, #8]
	add r0, r4, #0
	ldrb r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	cmp r5, #6
	blo _0204E568
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204E568:
	add r4, #0x80
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #0x18
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0xff
	bne _0204E58A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204E58A:
	add r5, #0x13
	lsl r0, r5, #0x18
	lsr r5, r0, #0x18
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	ldrb r0, [r1]
	add r0, r6, r0
	cmp r0, #0xff
	ble _0204E5AA
	mov r0, #0xff
	b _0204E5AA
_0204E5AA:
	strb r0, [r1]
	add r0, r4, #0
	add r1, r5, #0
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_828
