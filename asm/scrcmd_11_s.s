#include "constants/species.h"
#include "constants/items.h"
#include "constants/ribbon.h"
	.include "asm/macros.inc"
	.include "scrcmd_11.inc"
	.include "global.inc"

	.text

	.extern FieldSystem_InitGetMysteryGiftGmmState
	.extern FieldSystem_GetTagOfNextMG
	.extern FieldSystem_GetDataOfNextMG
	.extern FieldSystem_SetQueuedMGReceived
	.extern MGGive_Mon

	thumb_func_start MGMessageSuccess_GiveMon
MGMessageSuccess_GiveMon: ; 0x0204C330
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #7
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	add r0, r7, #4
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #1
	bl BufferBoxMonSpeciesNameWithArticle
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end MGMessageSuccess_GiveMon

	thumb_func_start MGMessageFailure_GiveMon
MGMessageFailure_GiveMon: ; 0x0204C36C
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #4
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_GiveMon

	thumb_func_start MGGive_Egg
MGGive_Egg: ; 0x0204C378
	ldr r3, _0204C37C ; =MGGive_Mon
	bx r3
	.balign 4, 0
_0204C37C: .word MGGive_Mon
	thumb_func_end MGGive_Egg

	thumb_func_start MGMessageSuccess_Egg
MGMessageSuccess_Egg: ; 0x0204C380
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #8
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	add r0, r7, #4
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #1
	bl BufferBoxMonSpeciesName
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end MGMessageSuccess_Egg

	thumb_func_start MGCheck_Item
MGCheck_Item: ; 0x0204C3BC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_Bag_Get
	add r4, r0, #0
	add r0, r5, #0
	bl FieldSystem_GetDataOfNextMG
	add r1, r0, #0
	ldr r1, [r1]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #1
	mov r3, #0x20
	bl Bag_HasSpaceForItem
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end MGCheck_Item

	thumb_func_start MGGive_Item
MGGive_Item: ; 0x0204C3E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_Bag_Get
	add r6, r0, #0
	add r0, r5, #0
	bl FieldSystem_GetDataOfNextMG
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x86
	lsl r0, r0, #2
	cmp r4, r0
	bne _0204C410
	ldr r0, [r5, #0xc]
	bl Save_VarsFlags_Get
	mov r1, #0
	bl sub_02066B9C
_0204C410:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #1
	mov r3, #0x20
	bl Bag_AddItem
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MGGive_Item

	thumb_func_start MGMessageSuccess_Item
MGMessageSuccess_Item: ; 0x0204C420
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #9
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r5, #4]
	mov r1, #1
	add r2, r7, #0
	bl BufferItemName
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MGMessageSuccess_Item

	thumb_func_start MGMessageFailure_Item
MGMessageFailure_Item: ; 0x0204C45C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0, #0xc]
	add r6, r2, #0
	bl Save_Bag_Get
	ldr r0, [r5]
	bl FieldSystem_GetDataOfNextMG
	ldr r0, [r0]
	mov r1, #0
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #5
	strh r0, [r6]
	ldr r0, [r5, #4]
	bl BufferItemName
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MGMessageFailure_Item

	thumb_func_start MGCheck_BattleRules
MGCheck_BattleRules: ; 0x0204C48C
	mov r0, #1
	bx lr
	thumb_func_end MGCheck_BattleRules

	thumb_func_start MGGive_BattleRules
MGGive_BattleRules: ; 0x0204C490
	push {r4, lr}
	add r4, r0, #0
	bl FieldSystem_GetDataOfNextMG
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_020291D4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end MGGive_BattleRules

	thumb_func_start MGMessageSuccess_BattleRules
MGMessageSuccess_BattleRules: ; 0x0204C4A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0xa
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	add r0, r7, #0
	mov r1, #0x20
	bl sub_020290E4
	add r4, r0, #0
	mov r1, #1
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	add r2, r4, #0
	mov r3, #0
	bl BufferString
	add r0, r4, #0
	bl String_Delete
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MGMessageSuccess_BattleRules

	thumb_func_start MGMessageFailure_BattleRules
MGMessageFailure_BattleRules: ; 0x0204C4F8
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #6
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_BattleRules

	thumb_func_start MGCheck_Decoration
MGCheck_Decoration: ; 0x0204C504
	mov r0, #0
	bx lr
	thumb_func_end MGCheck_Decoration

	thumb_func_start MGGive_Decoration
MGGive_Decoration: ; 0x0204C508
	bx lr
	.balign 4, 0
	thumb_func_end MGGive_Decoration

	thumb_func_start MGMessageSuccess_Decoration
MGMessageSuccess_Decoration: ; 0x0204C50C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	ldr r7, [r0]
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0xb
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r5, #4]
	mov r1, #1
	add r2, r7, #0
	bl BufferDecorationName
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MGMessageSuccess_Decoration

	thumb_func_start MGMessageFailure_Decoration
MGMessageFailure_Decoration: ; 0x0204C544
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #0x1f
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_Decoration

	thumb_func_start MGCheck_MonDeco
MGCheck_MonDeco: ; 0x0204C550
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl FieldSystem_GetDataOfNextMG
	ldr r4, [r0, #4]
	ldr r0, [r0]
	cmp r0, #1
	beq _0204C56A
	cmp r0, #2
	beq _0204C57A
	cmp r0, #3
	beq _0204C57E
	b _0204C582
_0204C56A:
	ldr r0, [r5, #0xc]
	bl Save_SealCase_Get
	add r1, r4, #0
	mov r2, #1
	bl SealCase_CheckSealQuantity
	pop {r3, r4, r5, pc}
_0204C57A:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0204C57E:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0204C582:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end MGCheck_MonDeco

	thumb_func_start MGGive_MonDeco
MGGive_MonDeco: ; 0x0204C588
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl FieldSystem_GetDataOfNextMG
	ldr r4, [r0, #4]
	ldr r0, [r0]
	cmp r0, #1
	beq _0204C5A2
	cmp r0, #2
	beq _0204C5B2
	cmp r0, #3
	beq _0204C5C6
	pop {r3, r4, r5, pc}
_0204C5A2:
	ldr r0, [r5, #0xc]
	bl Save_SealCase_Get
	add r1, r4, #0
	mov r2, #1
	bl GiveOrTakeSeal
	pop {r3, r4, r5, pc}
_0204C5B2:
	ldr r0, [r5, #0xc]
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	add r1, r4, #0
	mov r2, #1
	bl sub_0202BB08
	pop {r3, r4, r5, pc}
_0204C5C6:
	ldr r0, [r5, #0xc]
	bl Save_FashionData_Get
	bl Save_FashionData_GetFashionCase
	add r1, r4, #0
	bl sub_0202BBD8
	pop {r3, r4, r5, pc}
	thumb_func_end MGGive_MonDeco

	thumb_func_start MGMessageSuccess_MonDeco
MGMessageSuccess_MonDeco: ; 0x0204C5D8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	ldr r2, [r0, #4]
	ldr r0, [r0]
	cmp r0, #1
	beq _0204C5F8
	cmp r0, #2
	beq _0204C602
	cmp r0, #3
	beq _0204C60C
	b _0204C614
_0204C5F8:
	ldr r0, [r5, #4]
	mov r1, #1
	bl BufferSealName
	b _0204C614
_0204C602:
	ldr r0, [r5, #4]
	mov r1, #1
	bl BufferFashionName
	b _0204C614
_0204C60C:
	ldr r0, [r5, #4]
	mov r1, #1
	bl BufferContestBackgroundName
_0204C614:
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0xc
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	pop {r4, r5, r6, pc}
	thumb_func_end MGMessageSuccess_MonDeco

	thumb_func_start MGMessageFailure_MonDeco
MGMessageFailure_MonDeco: ; 0x0204C630
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #6
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_MonDeco

	thumb_func_start MGCheck_MemberCard
MGCheck_MemberCard: ; 0x0204C63C
	mov r0, #0
	bx lr
	thumb_func_end MGCheck_MemberCard

	thumb_func_start MGGive_MemberCard
MGGive_MemberCard: ; 0x0204C640
	bx lr
	.balign 4, 0
	thumb_func_end MGGive_MemberCard

	thumb_func_start MGMessageSuccess_MemberCard
MGMessageSuccess_MemberCard: ; 0x0204C644
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageSuccess_MemberCard

	thumb_func_start MGMessageFailure_MemberCard
MGMessageFailure_MemberCard: ; 0x0204C648
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #0x1f
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_MemberCard

	thumb_func_start MGCheck_OaksLetter
MGCheck_OaksLetter: ; 0x0204C654
	mov r0, #0
	bx lr
	thumb_func_end MGCheck_OaksLetter

	thumb_func_start MGGive_OaksLetter
MGGive_OaksLetter: ; 0x0204C658
	bx lr
	.balign 4, 0
	thumb_func_end MGGive_OaksLetter

	thumb_func_start MGMessageSuccess_OaksLetter
MGMessageSuccess_OaksLetter: ; 0x0204C65C
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageSuccess_OaksLetter

	thumb_func_start MGMessageFailure_OaksLetter
MGMessageFailure_OaksLetter: ; 0x0204C660
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #0x1f
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_OaksLetter

	thumb_func_start MGCheck_SecretKey
MGCheck_SecretKey: ; 0x0204C66C
	mov r0, #0
	bx lr
	thumb_func_end MGCheck_SecretKey

	thumb_func_start MGGive_SecretKey
MGGive_SecretKey: ; 0x0204C670
	bx lr
	.balign 4, 0
	thumb_func_end MGGive_SecretKey

	thumb_func_start MGMessageSuccess_SecretKey
MGMessageSuccess_SecretKey: ; 0x0204C674
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageSuccess_SecretKey

	thumb_func_start MGMessageFailure_SecretKey
MGMessageFailure_SecretKey: ; 0x0204C678
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #0x1f
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_SecretKey

	thumb_func_start MGCheck_AzureFlute
MGCheck_AzureFlute: ; 0x0204C684
	mov r0, #0
	bx lr
	thumb_func_end MGCheck_AzureFlute

	thumb_func_start MGGive_AzureFlute
MGGive_AzureFlute: ; 0x0204C688
	bx lr
	.balign 4, 0
	thumb_func_end MGGive_AzureFlute

	thumb_func_start MGMessageSuccess_AzureFlute
MGMessageSuccess_AzureFlute: ; 0x0204C68C
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageSuccess_AzureFlute

	thumb_func_start MGMessageFailure_AzureFlute
MGMessageFailure_AzureFlute: ; 0x0204C690
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #0x1f
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_AzureFlute

	thumb_func_start MGCheck_PoketchApp
MGCheck_PoketchApp: ; 0x0204C69C
	mov r0, #0
	bx lr
	thumb_func_end MGCheck_PoketchApp

	thumb_func_start MGGive_PoketchApp
MGGive_PoketchApp: ; 0x0204C6A0
	bx lr
	.balign 4, 0
	thumb_func_end MGGive_PoketchApp

	thumb_func_start MGMessageSuccess_PoketchApp
MGMessageSuccess_PoketchApp: ; 0x0204C6A4
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageSuccess_PoketchApp

	thumb_func_start MGMessageFailure_PoketchApp
MGMessageFailure_PoketchApp: ; 0x0204C6A8
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #0x1f
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end MGMessageFailure_PoketchApp

	thumb_func_start MGCheck_PokewalkerCourse
MGCheck_PokewalkerCourse: ; 0x0204C6B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl FieldSystem_GetDataOfNextMG
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_Pokewalker_Get
	ldrb r2, [r4]
	mov r1, #0
	cmp r2, #0x1b
	bhs _0204C6CE
	add r1, r2, #0
_0204C6CE:
	bl Pokewalker_CourseIsUnlocked
	cmp r0, #0
	bne _0204C6DA
	mov r0, #1
	pop {r3, r4, r5, pc}
_0204C6DA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end MGCheck_PokewalkerCourse

	thumb_func_start MGGive_PokewalkerCourse
MGGive_PokewalkerCourse: ; 0x0204C6E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_Pokewalker_Get
	add r4, r0, #0
	add r0, r5, #0
	bl FieldSystem_GetDataOfNextMG
	ldrb r1, [r0]
	cmp r1, #0x1b
	bhs _0204C6FE
	add r0, r4, #0
	bl Pokewalker_UnlockCourse
_0204C6FE:
	pop {r3, r4, r5, pc}
	thumb_func_end MGGive_PokewalkerCourse

	thumb_func_start MGMesageSuccess_PokewalkerCourse
MGMesageSuccess_PokewalkerCourse: ; 0x0204C700
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0x13
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	ldrb r2, [r7]
	ldr r0, [r5, #4]
	mov r1, #1
	bl BufferPokewalkerCourseName
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MGMesageSuccess_PokewalkerCourse

	thumb_func_start MGMesageFailure_PokewalkerCourse
MGMesageFailure_PokewalkerCourse: ; 0x0204C738
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_Pokewalker_Get
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0x1a
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	ldrb r2, [r7]
	ldr r0, [r5, #4]
	mov r1, #1
	bl BufferPokewalkerCourseName
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MGMesageFailure_PokewalkerCourse

	thumb_func_start MGCheck_MemorialPhoto
MGCheck_MemorialPhoto: ; 0x0204C778
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_Bag_Get
	ldr r0, [r4, #0xc]
	bl Save_PhotoAlbum_Get
	bl PhotoAlbum_GetNumSaved
	cmp r0, #0x24
	bhs _0204C794
	mov r0, #1
	pop {r4, pc}
_0204C794:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end MGCheck_MemorialPhoto

	thumb_func_start MGGive_MemorialPhoto
MGGive_MemorialPhoto: ; 0x0204C798
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl FieldSystem_GetDataOfNextMG
	add r5, r0, #0
	add r0, r4, #0
	bl FieldSystem_GetSaveData
	bl Save_PhotoAlbum_Get
	add r4, r0, #0
	bl PhotoAlbum_GetIndexOfFirstEmptySlot
	add r2, r0, #0
	cmp r2, #0xff
	bne _0204C7BE
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0204C7BE:
	add r0, r4, #0
	add r1, r5, #0
	bl PhotoAlbum_SetPhotoAtIndex
	pop {r3, r4, r5, pc}
	thumb_func_end MGGive_MemorialPhoto

	thumb_func_start MGMessageSuccess_MemorialPhoto
MGMessageSuccess_MemorialPhoto: ; 0x0204C7C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSystem_GetDataOfNextMG
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0x12
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MGMessageSuccess_MemorialPhoto

	thumb_func_start MGMessageFailure_MemorialPhoto
MGMessageFailure_MemorialPhoto: ; 0x0204C7F4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r4, r2, #0
	bl FieldSystem_GetDataOfNextMG
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_Bag_Get
	mov r1, #0xd1
	strh r1, [r6]
	ldr r1, _0204C838 ; =0x000001F5
	mov r2, #1
	mov r3, #0xb
	bl Bag_HasItem
	cmp r0, #0
	bne _0204C820
	mov r0, #0x18
	b _0204C822
_0204C820:
	mov r0, #0x19
_0204C822:
	strh r0, [r4]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0204C838: .word 0x000001F5
	thumb_func_end MGMessageFailure_MemorialPhoto
