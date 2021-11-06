	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_110
ScrCmd_110: ; 0x0204CA50
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
	thumb_func_end ScrCmd_110

	thumb_func_start ScrCmd_111
ScrCmd_111: ; 0x0204CA74
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
	thumb_func_end ScrCmd_111

	thumb_func_start ScrCmd_360
ScrCmd_360: ; 0x0204CA98
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
	thumb_func_end ScrCmd_360

	thumb_func_start ScrCmd_112
ScrCmd_112: ; 0x0204CAC8
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
	thumb_func_end ScrCmd_112

	thumb_func_start ScrCmd_368
ScrCmd_368: ; 0x0204CB0C
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
	thumb_func_end ScrCmd_368
