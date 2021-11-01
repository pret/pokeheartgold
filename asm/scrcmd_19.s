	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_394
ScrCmd_394: ; 0x0204EBE8
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
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r1, r5, #0
	add r1, #0x80
	lsl r2, r4, #0x18
	add r6, r0, #0
	ldr r1, [r1]
	mov r0, #0x20
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_0203E7F4
	str r0, [r6]
	ldr r1, _0204EC2C ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0204EC2C: .word sub_020429F8
	thumb_func_end ScrCmd_394

	thumb_func_start ScrCmd_395
ScrCmd_395: ; 0x0204EC30
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _0204EC5C
	bl GF_AssertFail
_0204EC5C:
	ldr r0, [r4]
	bl sub_0203E864
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #4
	bne _0204EC6E
	mov r0, #0xff
	strh r0, [r5]
_0204EC6E:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_395

	thumb_func_start ScrCmd_466
ScrCmd_466: ; 0x0204EC7C
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
	mov r1, #0x20
	bl GetEligibleLevelUpMoves
	add r5, r0, #0
	bl sub_0209186C
	strh r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_466

	thumb_func_start sub_0204ECD0
sub_0204ECD0: ; 0x0204ECD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x80
	add r7, r1, #0
	ldr r0, [r0]
	mov r1, #0x14
	str r2, [sp]
	add r6, r3, #0
	bl FieldSysGetAttrAddr
	str r0, [sp, #4]
	mov r0, #0x20
	bl sub_0209174C
	add r4, r0, #0
	ldr r0, [sp, #4]
	str r4, [r0]
	ldr r0, [sp]
	str r0, [r4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #8]
	str r6, [r4, #0x10]
	add r0, r5, #0
	strb r7, [r4, #0x19]
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_0203F9C4
	ldr r1, _0204ED38 ; =sub_020429F8
	add r0, r5, #0
	bl SetupNativeScript
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204ED38: .word sub_020429F8
	thumb_func_end sub_0204ECD0

	thumb_func_start ScrCmd_467
ScrCmd_467: ; 0x0204ED3C
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
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #0x20
	bl GetEligibleLevelUpMoves
	add r3, r0, #0
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl sub_0204ECD0
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_467

	thumb_func_start ScrCmd_468
ScrCmd_468: ; 0x0204ED7C
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
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0x20
	mov r1, #4
	bl AllocFromHeap
	add r3, r0, #0
	ldr r0, _0204EDD8 ; =0x0000FFFF
	strh r4, [r3]
	strh r0, [r3, #2]
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	bl sub_0204ECD0
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0204EDD8: .word 0x0000FFFF
	thumb_func_end ScrCmd_468

	thumb_func_start ScrCmd_469
ScrCmd_469: ; 0x0204EDDC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	ldr r4, [r0]
	cmp r4, #0
	bne _0204EE06
	bl GF_AssertFail
_0204EE06:
	ldrb r0, [r4, #0x1a]
	cmp r0, #0
	bne _0204EE10
	mov r0, #0
	b _0204EE12
_0204EE10:
	mov r0, #0xff
_0204EE12:
	strh r0, [r5]
	add r0, r4, #0
	bl sub_02091764
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_469
