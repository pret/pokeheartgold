	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0204CA50
sub_0204CA50: ; 0x0204CA50
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadWord
	add r1, r0, #0
	add r0, r5, #0
	bl PlayerProfile_AddMoney
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204CA50

	thumb_func_start sub_0204CA74
sub_0204CA74: ; 0x0204CA74
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadWord
	add r1, r0, #0
	add r0, r5, #0
	bl PlayerProfile_SubMoney
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204CA74

	thumb_func_start sub_0204CA98
sub_0204CA98: ; 0x0204CA98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	add r0, r5, #0
	bl PlayerProfile_SubMoney
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204CA98

	thumb_func_start sub_0204CAC8
sub_0204CAC8: ; 0x0204CAC8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadWord
	add r4, r0, #0
	add r0, r6, #0
	bl PlayerProfile_GetMoney
	cmp r0, r4
	bhs _0204CB04
	mov r0, #0
	b _0204CB06
_0204CB04:
	mov r0, #1
_0204CB06:
	strh r0, [r5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0204CAC8

	thumb_func_start sub_0204CB0C
sub_0204CB0C: ; 0x0204CB0C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r4, #0
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
	add r0, r6, #0
	bl PlayerProfile_GetMoney
	cmp r0, r4
	bhs _0204CB52
	mov r0, #0
	b _0204CB54
_0204CB52:
	mov r0, #1
_0204CB54:
	strh r0, [r5]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0204CB0C
