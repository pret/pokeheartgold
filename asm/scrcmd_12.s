	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_813
ScrCmd_813: ; 0x0204C83C
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
	bl sub_0202ED88
	mov r1, #0
	add r2, sp, #0
	bl sub_0202F224
	cmp r0, #0
	bne _0204C86C
	mov r0, #0
	b _0204C86E
_0204C86C:
	mov r0, #1
_0204C86E:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_813

	thumb_func_start ScrCmd_508
ScrCmd_508: ; 0x0204C874
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	cmp r0, #2
	bne _0204C8AA
	add r0, r4, #0
	bl sub_02066880
	add r5, #0x80
	ldr r0, [r5]
	bl sub_020557E0
	b _0204C8D0
_0204C8AA:
	cmp r0, #0
	bne _0204C8B8
	add r5, #0x80
	ldr r0, [r5]
	bl sub_020557F8
	b _0204C8D0
_0204C8B8:
	cmp r0, #1
	bne _0204C8CC
	add r0, r4, #0
	bl sub_02066890
	add r5, #0x80
	ldr r0, [r5]
	bl sub_02055828
	b _0204C8D0
_0204C8CC:
	bl GF_AssertFail
_0204C8D0:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_508

	thumb_func_start ScrCmd_509
ScrCmd_509: ; 0x0204C8D4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_020270F8
	add r6, r0, #0
	mov r0, #0x20
	bl AllocMonZeroed
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202EC98
	cmp r0, #6
	bne _0204C90C
	mov r0, #1
	b _0204C90E
_0204C90C:
	mov r0, #0
_0204C90E:
	strh r0, [r4]
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_509

	thumb_func_start ScrCmd_510
ScrCmd_510: ; 0x0204C91C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_020270F8
	add r7, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl GetStoragePCPointer
	str r0, [sp, #8]
	mov r0, #0x20
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #4]
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	mov r5, #0
_0204C960:
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0202EC70
	mov r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #4]
	add r0, r4, #0
	mov r2, #2
	mov r3, #0
	bl sub_0208F260
	add r0, r4, #0
	bl Mon_GetBoxMon
	add r1, r0, #0
	ldr r0, [sp, #8]
	bl PCStorage_PlaceMonInFirstEmptySlotInAnyBox
	cmp r0, #0
	bne _0204C990
	bl GF_AssertFail
_0204C990:
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r4, #0
	ldr r0, [r0, #0xc]
	bl sub_0202ECC0
	add r5, r5, #1
	cmp r5, #6
	blt _0204C960
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	bl sub_0202EB74
	add r6, #0x80
	ldr r0, [r6]
	bl sub_02093070
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_510

	thumb_func_start ScrCmd_511
ScrCmd_511: ; 0x0204C9C0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	cmp r6, #3
	bhi _0204CA4C
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204C9FA: ; jump table
	.short _0204CA02 - _0204C9FA - 2 ; case 0
	.short _0204CA0E - _0204C9FA - 2 ; case 1
	.short _0204CA1A - _0204C9FA - 2 ; case 2
	.short _0204CA26 - _0204C9FA - 2 ; case 3
_0204CA02:
	add r4, #0x80
	ldr r0, [r4]
	bl sub_020558D0
	strh r0, [r5]
	b _0204CA4C
_0204CA0E:
	add r4, #0x80
	ldr r0, [r4]
	bl sub_020558E0
	strh r0, [r5]
	b _0204CA4C
_0204CA1A:
	add r4, #0x80
	ldr r0, [r4]
	bl sub_020558F0
	strh r0, [r5]
	b _0204CA4C
_0204CA26:
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_020558E0
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_020558D0
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	bl sub_020558F0
	add r0, r7, r0
	add r0, r6, r0
	strh r0, [r5]
_0204CA4C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_511
