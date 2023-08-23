	.include "asm/macros.inc"
	.include "battle_setup.inc"
	.include "global.inc"

	.rodata

	.extern BattleSetup_SetParty
	.extern BattleSetup_SetProfile
	.extern BattleSetup_SetChatotVoiceClip
	.extern sub_0205230C

_020FC4C0:
	.word 0x00000000
	.word 0x00000007
	.word 0x00000009
	.word 0x00000002
	.word 0x00000004
	.word 0x00000006
	.word 0x00000009
	.word 0x00000009
	.word 0x00000009
	.word 0x00000005
	.word 0x00000005
	.word 0x00000005
	.word 0x0000000C
	.word 0x0000000D
	.word 0x0000000E
	.word 0x0000000F
	.word 0x00000010
	.word 0x00000011
	.word 0x00000012
	.word 0x00000013
	.word 0x00000014
	.word 0x00000015
	.word 0x00000016

	.text

	thumb_func_start sub_0205239C
sub_0205239C: ; 0x0205239C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl SaveArray_Party_Get
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_Bag_Get
	str r0, [sp]
	ldr r0, [r4, #0xc]
	bl Save_Pokedex_Get
	add r2, r5, #0
	add r2, #0xf8
	str r0, [sp, #4]
	ldr r2, [r2]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0205230C
	add r0, r5, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r6, #0
	bl PlayerProfile_Copy
	ldr r0, [r5, #4]
	add r1, r7, #0
	bl Party_Copy
	mov r0, #0x42
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp]
	bl Save_Bag_Copy
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	ldr r1, [sp, #4]
	bl Pokedex_Copy
	ldr r0, [r4, #0xc]
	mov r6, #0
	bl Save_VarsFlags_Get
	add r7, r0, #0
	bl Save_VarsFlags_CheckSafariSysFlag
	cmp r0, #0
	beq _0205241E
	ldr r0, [r4, #0xc]
	bl Save_LocalFieldData_Get
	bl LocalFieldData_GetSafariBallsCounter
	add r6, r0, #0
	b _02052434
_0205241E:
	add r0, r7, #0
	bl CheckFlag996
	cmp r0, #0
	beq _02052434
	add r0, r4, #0
	bl FieldSystem_BugContest_Get
	bl BugContest_GetSportBallsAddr
	add r6, r0, #0
_02052434:
	cmp r6, #0
	beq _02052440
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	strh r0, [r6]
_02052440:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205239C

	thumb_func_start sub_02052444
sub_02052444: ; 0x02052444
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetProfileAddr
	ldr r0, [r5, #0xc]
	bl SaveArray_Party_Get
	ldr r0, [r5, #0xc]
	bl Save_Bag_Get
	ldr r0, [r5, #0xc]
	bl Save_Pokedex_Get
	add r1, r0, #0
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Pokedex_Copy
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02052444

	thumb_func_start sub_02052470
sub_02052470: ; 0x02052470
	push {r3, r4, r5, lr}
	ldr r2, [r0, #0x20]
	add r4, r1, #0
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl GetMetatileBehaviorAt
	add r5, r0, #0
	bl sub_0205B828
	cmp r0, #0
	beq _0205248C
	mov r0, #8
	pop {r3, r4, r5, pc}
_0205248C:
	add r0, r5, #0
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #0
	bne _020524A0
	add r0, r5, #0
	bl sub_0205B6F4
	cmp r0, #0
	beq _020524A4
_020524A0:
	mov r0, #2
	pop {r3, r4, r5, pc}
_020524A4:
	add r0, r5, #0
	bl sub_0205B798
	cmp r0, #0
	beq _020524B2
	mov r0, #1
	pop {r3, r4, r5, pc}
_020524B2:
	add r0, r5, #0
	bl sub_0205B8B8
	cmp r0, #0
	beq _020524C0
	mov r0, #6
	pop {r3, r4, r5, pc}
_020524C0:
	add r0, r5, #0
	bl sub_0205B8AC
	cmp r0, #0
	beq _020524CE
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_020524CE:
	add r0, r5, #0
	bl sub_0205B8D0
	cmp r0, #0
	beq _020524DC
	mov r0, #5
	pop {r3, r4, r5, pc}
_020524DC:
	add r0, r5, #0
	bl MetatileBehavior_IsSurfableWater
	cmp r0, #0
	beq _020524EA
	mov r0, #7
	pop {r3, r4, r5, pc}
_020524EA:
	cmp r4, #0x17
	bhs _020524F6
	ldr r0, _02052500 ; =_020FC4C0
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r3, r4, r5, pc}
_020524F6:
	bl GF_AssertFail
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_02052500: .word _020FC4C0
	thumb_func_end sub_02052470

	thumb_func_start sub_02052504
sub_02052504: ; 0x02052504
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_LocalFieldData_Get
	bl LocalFieldData_GetPlayer
	add r6, r0, #0
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetBattleBg
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r6, #4]
	cmp r0, #2
	bne _0205252E
	mov r0, #1
	str r0, [r5, r1]
_0205252E:
	mov r1, #0x53
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	add r0, r4, #0
	bl sub_02052470
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02052504

	thumb_func_start sub_02052544
sub_02052544: ; 0x02052544
	mov r1, #0x15
	mov r2, #7
	lsl r1, r1, #4
	str r2, [r0, r1]
	mov r2, #1
	add r1, #0x80
	str r2, [r0, r1]
	bx lr
	thumb_func_end sub_02052544

	thumb_func_start IsBattleResultWin
IsBattleResultWin: ; 0x02052554
	cmp r0, #2
	beq _0205255C
	cmp r0, #3
	bne _02052560
_0205255C:
	mov r0, #0
	bx lr
_02052560:
	mov r0, #1
	bx lr
	thumb_func_end IsBattleResultWin

	thumb_func_start sub_02052564
sub_02052564: ; 0x02052564
	cmp r0, #1
	beq _0205256C
	cmp r0, #4
	bne _02052570
_0205256C:
	mov r0, #0
	bx lr
_02052570:
	mov r0, #1
	bx lr
	thumb_func_end sub_02052564

	thumb_func_start sub_02052574
sub_02052574: ; 0x02052574
	cmp r0, #4
	bne _0205257C
	mov r0, #0
	bx lr
_0205257C:
	mov r0, #1
	bx lr
	thumb_func_end sub_02052574

	thumb_func_start sub_02052580
sub_02052580: ; 0x02052580
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetTrainerGender
	add r1, r4, #0
	add r1, #0x29
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x3c
	bl CopyU16StringArray
	add r3, r4, #0
	add r3, #0x28
	add r4, #0x90
	mov r2, #6
_020525AE:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _020525AE
	ldr r0, [r3]
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02052580
