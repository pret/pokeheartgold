	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_683
ScrCmd_683: ; 0x02049A44
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x18
	bl FieldSysGetAttrAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	ldr r1, [r5]
	strh r1, [r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_683

	thumb_func_start ScrCmd_465
ScrCmd_465: ; 0x02049A6C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0202C854
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r7, [r0, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	cmp r0, #7
	bls _02049AA0
	b _02049CA2
_02049AA0:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02049AAC: ; jump table
	.short _02049ABC - _02049AAC - 2 ; case 0
	.short _02049AF2 - _02049AAC - 2 ; case 1
	.short _02049B28 - _02049AAC - 2 ; case 2
	.short _02049B5E - _02049AAC - 2 ; case 3
	.short _02049B94 - _02049AAC - 2 ; case 4
	.short _02049BCA - _02049AAC - 2 ; case 5
	.short _02049BF4 - _02049AAC - 2 ; case 6
	.short _02049C56 - _02049AAC - 2 ; case 7
_02049ABC:
	add r0, r4, #0
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
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0202C860
	strh r0, [r4]
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02049AF2:
	add r0, r4, #0
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
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0202C878
	strh r0, [r4]
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02049B28:
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
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [r6]
	add r1, r7, #0
	add r2, r5, #0
	bl BufferEasyChatWord
	b _02049CA2
_02049B5E:
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
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	ldr r0, [r6]
	add r1, r7, #0
	add r2, r5, #0
	bl BufferEasyChatWord
	b _02049CA2
_02049B94:
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl sub_0202C7E0
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	mov r2, #0
	str r2, [sp]
	str r5, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x74]
	mov r1, #5
	mov r3, #7
	bl sub_0203F6E0
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02049BCA:
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0202C860
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl sub_0202C738
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02049BF4:
	mov r0, #0x40
	mov r1, #0x20
	bl String_ctor
	add r4, #0x80
	add r6, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r6, #0
	add r4, r0, #0
	bl PlayerName_FlatToString
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	add r3, r6, #0
	bl sub_0202C7F8
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0202C824
	add r0, r5, #0
	mov r1, #0
	mov r2, #2
	bl sub_0202C848
	bl MTRandom
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl sub_0202C7C0
	add r0, r6, #0
	bl String_dtor
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl sub_0202C738
	b _02049CA2
_02049C56:
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r6, #0
	add r7, r0, #0
	add r4, r6, #0
_02049C6C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C860
	cmp r0, #0
	beq _02049C8A
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202C878
	cmp r0, #1
	beq _02049C8A
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
_02049C8A:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _02049C6C
	cmp r6, #4
	blo _02049C9E
	mov r0, #1
	strh r0, [r7]
	b _02049CA2
_02049C9E:
	mov r0, #0
	strh r0, [r7]
_02049CA2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_465
