	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC790:
	.word ov45_02229EE0, ov45_02229F70, ov45_02229F94, FS_OVERLAY_ID(OVY_45)

	.text

	thumb_func_start sub_02056680
sub_02056680: ; 0x02056680
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _020566A2
	cmp r0, #1
	beq _020566C8
	cmp r0, #2
	beq _020566F0
	b _020566F4
_020566A2:
	bl ov01_021E90C0
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r1, r0, #0
	ldr r2, [r4, #0x18]
	add r0, r6, #0
	bl ov01_021E90DC
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020566F4
_020566C8:
	ldr r0, [r5, #0x40]
	ldr r6, [r4, #0x18]
	bl PlayerAvatar_GetFacingDirection
	add r2, r0, #0
	lsl r2, r2, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov01_021E971C
	cmp r0, #0
	beq _020566F4
	ldr r0, [r4, #0x18]
	bl ov01_021E90D4
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020566F4
_020566F0:
	mov r0, #1
	pop {r4, r5, r6, pc}
_020566F4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02056680

	thumb_func_start sub_020566F8
sub_020566F8: ; 0x020566F8
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #3
	bhi _020567AE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205671C: ; jump table
	.short _02056724 - _0205671C - 2 ; case 0
	.short _02056760 - _0205671C - 2 ; case 1
	.short _0205679A - _0205671C - 2 ; case 2
	.short _020567AA - _0205671C - 2 ; case 3
_02056724:
	mov r0, #1
	bl ov01_021E636C
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #2
	bne _02056746
	add r0, r6, #0
	mov r1, #0xa
	bl MapObject_SetHeldMovement
	b _02056758
_02056746:
	cmp r0, #3
	bne _02056754
	add r0, r6, #0
	mov r1, #0xb
	bl MapObject_SetHeldMovement
	b _02056758
_02056754:
	bl GF_AssertFail
_02056758:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020567AE
_02056760:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r6, r0, #0
	bl MapObject_IsMovementPaused
	cmp r0, #1
	bne _020567AE
	add r0, r6, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02056792
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov01_02205790
_02056792:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020567AE
_0205679A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _020567AE
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _020567AE
_020567AA:
	mov r0, #1
	pop {r4, r5, r6, pc}
_020567AE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020566F8

	thumb_func_start sub_020567B4
sub_020567B4: ; 0x020567B4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _020567D8
	cmp r0, #1
	beq _0205680A
	b _02056814
_020567D8:
	bl ov01_021E90C0
	str r0, [r4, #0x18]
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	str r0, [sp]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r1, r0, #0
	ldr r0, [sp]
	add r2, r7, #0
	bl ov01_021E90DC
	ldr r1, _02056818 ; =ov01_021E9C40
	add r0, r6, #0
	add r2, r7, #0
	bl TaskManager_Call
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056814
_0205680A:
	ldr r0, [r4, #0x18]
	bl ov01_021E90D4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02056814:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02056818: .word ov01_021E9C40
	thumb_func_end sub_020567B4

	thumb_func_start sub_0205681C
sub_0205681C: ; 0x0205681C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #5
	bhi _02056932
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02056842: ; jump table
	.short _0205684E - _02056842 - 2 ; case 0
	.short _0205686A - _02056842 - 2 ; case 1
	.short _020568A8 - _02056842 - 2 ; case 2
	.short _020568BE - _02056842 - 2 ; case 3
	.short _020568DE - _02056842 - 2 ; case 4
	.short _02056926 - _02056842 - 2 ; case 5
_0205684E:
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	str r0, [r4, #0x18]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bl ov01_021E636C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056932
_0205686A:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r6, [r4, #0x18]
	add r7, r0, #0
	ldr r1, [r6]
	add r1, r1, #1
	str r1, [r6]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r6]
	cmp r0, #0x10
	blt _02056932
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl sub_0205C874
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056932
_020568A8:
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056932
_020568BE:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02056932
	add r0, r5, #0
	mov r1, #0xc
	bl MapObject_SetHeldMovement
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056932
_020568DE:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02056932
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02056932
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _0205691E
	add r0, r5, #0
	mov r1, #0
	bl ov01_02205790
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #0x30
	bl sub_0205FC94
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
_0205691E:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056932
_02056926:
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02056932:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0205681C

	thumb_func_start sub_02056938
sub_02056938: ; 0x02056938
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #5
	bhi _02056A4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205695E: ; jump table
	.short _0205696A - _0205695E - 2 ; case 0
	.short _02056986 - _0205695E - 2 ; case 1
	.short _020569C4 - _0205695E - 2 ; case 2
	.short _020569DA - _0205695E - 2 ; case 3
	.short _020569FA - _0205695E - 2 ; case 4
	.short _02056A42 - _0205695E - 2 ; case 5
_0205696A:
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	str r0, [r4, #0x18]
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bl ov01_021E636C
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056A4E
_02056986:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	ldr r6, [r4, #0x18]
	add r7, r0, #0
	ldr r1, [r6]
	add r1, r1, #1
	str r1, [r6]
	add r1, sp, #0
	bl MapObject_GetPositionVec
	mov r0, #2
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	ldr r0, [r6]
	cmp r0, #0x10
	blt _02056A4E
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl sub_0205C874
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056A4E
_020569C4:
	ldr r0, [r5, #0x40]
	mov r1, #1
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r5, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056A4E
_020569DA:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02056A4E
	add r0, r5, #0
	mov r1, #0xd
	bl MapObject_SetHeldMovement
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056A4E
_020569FA:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #0
	beq _02056A4E
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02056A4E
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02056A3A
	add r0, r5, #0
	mov r1, #1
	bl ov01_02205790
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #0x30
	bl sub_0205FC94
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
_02056A3A:
	ldrh r0, [r4, #2]
	add r0, r0, #1
	strh r0, [r4, #2]
	b _02056A4E
_02056A42:
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02056A4E:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02056938

	thumb_func_start sub_02056A54
sub_02056A54: ; 0x02056A54
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetBindTarget
	add r5, r0, #0
	ldr r1, [r4, #0x24]
	add r0, sp, #4
	bl GF_Camera_GetTarget
	add r6, sp, #4
	add r3, sp, #0x10
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r5, #0
	str r0, [r3]
	add r0, r2, #0
	add r2, sp, #0x1c
	bl VEC_Subtract
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	add r1, sp, #0x28
	bl PlayerAvatar_GetPositionVec
	cmp r5, #3
	bne _02056AA2
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp, #0x28]
	b _02056AAC
_02056AA2:
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x28]
_02056AAC:
	mov r0, #0
	str r0, [sp]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x30]
	add r0, r4, #0
	bl sub_02054940
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0x40]
	add r1, sp, #0x28
	add r2, r5, #0
	bl sub_0205C810
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r4, #0x24]
	bl sub_020235E0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r4, #0x24]
	bl sub_02023214
	ldr r1, [r4, #0x24]
	add r0, sp, #0x1c
	bl GF_Camera_ShiftBy
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02056A54

	thumb_func_start sub_02056AEC
sub_02056AEC: ; 0x02056AEC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	bl GF_Camera_GetBindTarget
	add r4, r0, #0
	ldr r1, [r5, #0x24]
	add r0, sp, #4
	bl GF_Camera_GetTarget
	add r6, sp, #4
	add r3, sp, #0x10
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r4, #0
	str r0, [r3]
	add r0, r2, #0
	add r2, sp, #0x1c
	bl VEC_Subtract
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r4, r0, #0
	ldr r0, [r5, #0x40]
	add r1, sp, #0x28
	bl PlayerAvatar_GetPositionVec
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl GetMetatileBehaviorAt
	add r6, r0, #0
	bl sub_0205B810
	cmp r0, #0
	beq _02056B5A
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x28]
	mov r4, #2
	b _02056B70
_02056B5A:
	add r0, r6, #0
	bl sub_0205B81C
	cmp r0, #0
	beq _02056B70
	mov r0, #1
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp, #0x28]
	mov r4, #3
_02056B70:
	mov r0, #0
	str r0, [sp]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x30]
	add r0, r5, #0
	bl sub_02054940
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x40]
	add r1, sp, #0x28
	add r2, r4, #0
	bl sub_0205C810
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r5, #0x24]
	bl sub_020235E0
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r5, #0x24]
	bl sub_02023214
	ldr r1, [r5, #0x24]
	add r0, sp, #0x1c
	bl GF_Camera_ShiftBy
	add r0, r5, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02056BC2
	add r0, r5, #0
	bl FollowingPokemon_GetMapObject
	add r1, r4, #0
	bl MapObject_ForceSetFacingDirection
_02056BC2:
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02056AEC

	thumb_func_start sub_02056BC8
sub_02056BC8: ; 0x02056BC8
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetBindTarget
	add r5, r0, #0
	ldr r1, [r4, #0x24]
	add r0, sp, #0
	bl GF_Camera_GetTarget
	add r6, sp, #0
	add r3, sp, #0xc
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r5, #0
	str r0, [r3]
	add r0, r2, #0
	add r2, sp, #0x18
	bl VEC_Subtract
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	add r1, sp, #0x24
	bl PlayerAvatar_GetPositionVec
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0205C858
	mov r0, #2
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	sub r0, r1, r0
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x40]
	add r1, sp, #0x24
	mov r2, #0
	bl sub_0205C810
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r4, #0x24]
	bl sub_020235E0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r4, #0x24]
	bl sub_02023214
	ldr r1, [r4, #0x24]
	add r0, sp, #0x18
	bl GF_Camera_ShiftBy
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	mov r1, #2
	ldr r0, [r4, #0x40]
	lsl r1, r1, #8
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r4, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add sp, #0x30
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02056BC8

	thumb_func_start sub_02056C64
sub_02056C64: ; 0x02056C64
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	bl GF_Camera_GetBindTarget
	add r5, r0, #0
	ldr r1, [r4, #0x24]
	add r0, sp, #0
	bl GF_Camera_GetTarget
	add r6, sp, #0
	add r3, sp, #0xc
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r5, #0
	str r0, [r3]
	add r0, r2, #0
	add r2, sp, #0x18
	bl VEC_Subtract
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	add r5, r0, #0
	ldr r0, [r4, #0x40]
	add r1, sp, #0x24
	bl PlayerAvatar_GetPositionVec
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0205C858
	mov r0, #2
	ldr r1, [sp, #0x28]
	lsl r0, r0, #0x10
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x40]
	add r1, sp, #0x24
	mov r2, #0
	bl sub_0205C810
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r4, #0x24]
	bl sub_020235E0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetPositionVecConst
	ldr r1, [r4, #0x24]
	bl sub_02023214
	ldr r1, [r4, #0x24]
	add r0, sp, #0x18
	bl GF_Camera_ShiftBy
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	mov r1, #2
	ldr r0, [r4, #0x40]
	lsl r1, r1, #8
	bl ov01_PlayerAvatar_OrrTransitionFlags
	ldr r0, [r4, #0x40]
	bl ov01_PlayerAvatar_ApplyTransitionFlags
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add sp, #0x30
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02056C64

	thumb_func_start sub_02056D00
sub_02056D00: ; 0x02056D00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #0x10
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	add r3, r2, #0
	mov r1, #0x10
	mov r0, #0
_02056D16:
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _02056D16
	ldr r1, _02056D2C ; =sub_02056D30
	add r0, r5, #0
	strh r4, [r2, #2]
	bl TaskManager_Call
	pop {r3, r4, r5, pc}
	nop
_02056D2C: .word sub_02056D30
	thumb_func_end sub_02056D00

	thumb_func_start sub_02056D30
sub_02056D30: ; 0x02056D30
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r1, [r4]
	cmp r1, #0
	beq _02056D4E
	cmp r1, #1
	beq _02056D6C
	b _02056D74
_02056D4E:
	ldr r0, [r5, #0xc]
	add r5, #0xb4
	str r0, [r4, #8]
	ldrh r0, [r4, #2]
	ldr r1, _02056D78 ; =_020FC790
	add r2, r4, #4
	str r0, [r4, #0xc]
	str r5, [r4, #4]
	add r0, r6, #0
	bl CallApplicationAsTask
	ldrh r0, [r4]
	add r0, r0, #1
	strh r0, [r4]
	b _02056D74
_02056D6C:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02056D74:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02056D78: .word _020FC790
	thumb_func_end sub_02056D30
