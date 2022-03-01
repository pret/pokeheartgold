	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_290
ScrCmd_290: ; 0x0204E610
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl Pokedex_IsEnabled
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_290

	thumb_func_start ScrCmd_GivePokedex
ScrCmd_GivePokedex: ; 0x0204E640
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl Pokedex_Enable
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_GivePokedex

	thumb_func_start ScrCmd_292
ScrCmd_292: ; 0x0204E654
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
	bl Save_FlyPoints_get
	bl sub_0203B9B4
	bl sub_0205C7C8
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_292

	thumb_func_start ScrCmd_GiveRunningShoes
ScrCmd_GiveRunningShoes: ; 0x0204E684
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl sub_0203B9B4
	mov r1, #1
	bl sub_0205C7DC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GiveRunningShoes

	thumb_func_start ScrCmd_CheckBadge
ScrCmd_CheckBadge: ; 0x0204E6A0
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
	bl GetVarPointer
	add r6, r0, #0
	cmp r4, #0x10
	blo _0204E6D2
	bl GF_AssertFail
_0204E6D2:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r4, #0
	bl PlayerProfile_TestBadgeFlag
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_CheckBadge

	thumb_func_start ScrCmd_GiveBadge
ScrCmd_GiveBadge: ; 0x0204E6E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	cmp r4, #0x10
	blo _0204E706
	bl GF_AssertFail
_0204E706:
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r4, #0
	bl PlayerProfile_SetBadgeFlag
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GiveBadge

	thumb_func_start ScrCmd_297
ScrCmd_297: ; 0x0204E71C
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
	bl SavArray_Flags_get
	bl CheckFlag960
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_297

	thumb_func_start ScrCmd_CountBadges
ScrCmd_CountBadges: ; 0x0204E748
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
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_CountBadges
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CountBadges

	thumb_func_start ScrCmd_298
ScrCmd_298: ; 0x0204E774
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl SetFlag960
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_298

	thumb_func_start ScrCmd_CheckEscortMode
ScrCmd_CheckEscortMode: ; 0x0204E788
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
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_CheckEscortMode

	thumb_func_start ScrCmd_SetEscortMode
ScrCmd_SetEscortMode: ; 0x0204E7B4
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_SetHaveFollowerFlag
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_SetEscortMode

	thumb_func_start ScrCmd_ClearEscortMode
ScrCmd_ClearEscortMode: ; 0x0204E7C8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_ClearHaveFollowerFlag
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_ClearEscortMode

	thumb_func_start ScrCmd_619
ScrCmd_619: ; 0x0204E7DC
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
	bl SavArray_Flags_get
	bl CheckFlag969
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_619

	thumb_func_start ScrCmd_620
ScrCmd_620: ; 0x0204E808
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E826
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl SetFlag969
	b _0204E834
_0204E826:
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ClearFlag969
_0204E834:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_620

	thumb_func_start ScrCmd_302
ScrCmd_302: ; 0x0204E838
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
	bl SavArray_Flags_get
	bl CheckFlag965
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_302

	thumb_func_start ScrCmd_303
ScrCmd_303: ; 0x0204E864
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl SetFlag965
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_303

	thumb_func_start ScrCmd_304
ScrCmd_304: ; 0x0204E878
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ClearFlag965
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_304

	thumb_func_start ScrCmd_305
ScrCmd_305: ; 0x0204E88C
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
	bl SavArray_Flags_get
	bl CheckGameClearFlag
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_305

	thumb_func_start ScrCmd_306
ScrCmd_306: ; 0x0204E8B8
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl SetGameClearFlag
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_306

	thumb_func_start ScrCmd_StrengthFlagAction
ScrCmd_StrengthFlagAction: ; 0x0204E8CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	ldr r2, [r5, #8]
	add r4, r0, #0
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E8FA
	cmp r1, #1
	beq _0204E8F2
	cmp r1, #2
	beq _0204E902
	b _0204E920
_0204E8F2:
	mov r1, #1
	bl StrengthFlagAction
	b _0204E924
_0204E8FA:
	mov r1, #0
	bl StrengthFlagAction
	b _0204E924
_0204E902:
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl StrengthFlagAction
	strh r0, [r5]
	b _0204E924
_0204E920:
	bl GF_AssertFail
_0204E924:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_StrengthFlagAction

	thumb_func_start ScrCmd_401
ScrCmd_401: ; 0x0204E928
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	ldr r2, [r5, #8]
	add r4, r0, #0
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E954
	cmp r1, #1
	beq _0204E94E
	cmp r1, #2
	beq _0204E95A
	b _0204E976
_0204E94E:
	bl SetFlag973
	b _0204E97A
_0204E954:
	bl ClearFlag973
	b _0204E97A
_0204E95A:
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl CheckFlag973
	strh r0, [r5]
	b _0204E97A
_0204E976:
	bl GF_AssertFail
_0204E97A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_401

	thumb_func_start ScrCmd_402
ScrCmd_402: ; 0x0204E980
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	ldr r2, [r5, #8]
	add r4, r0, #0
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	cmp r1, #0
	beq _0204E9AC
	cmp r1, #1
	beq _0204E9A6
	cmp r1, #2
	beq _0204E9B2
	b _0204E9CE
_0204E9A6:
	bl SetFlag974
	b _0204E9D2
_0204E9AC:
	bl ClearFlag974
	b _0204E9D2
_0204E9B2:
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl CheckFlag974
	strh r0, [r5]
	b _0204E9D2
_0204E9CE:
	bl GF_AssertFail
_0204E9D2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_402
