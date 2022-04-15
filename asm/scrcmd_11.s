#include "constants/species.h"
#include "constants/items.h"
#include "constants/ribbon.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

sScriptMysteryGiftActionTable:
	.word MGCheck_PartySpace, MGGive_Mon, MGMessageSuccess_GiveMon, MGMessageFailure_GiveMon
	.word MGCheck_PartySpace, MGGive_Egg, MGMessageSuccess_Egg, MGMessageFailure_GiveMon
	.word MGCheck_Item, MGGive_Item, MGMessageSuccess_Item, MGMessageFailure_Item
	.word MGCheck_BattleRules, MGGive_BattleRules, MGMessageSuccess_BattleRules, MGMessageFailure_BattleRules
	.word MGCheck_Decoration, MGGive_Decoration, MGMessageSuccess_Decoration, MGMessageFailure_Decoration
	.word MGCheck_MonDeco, MGGive_MonDeco, MGMessageSuccess_MonDeco, MGMessageFailure_MonDeco
	.word MGCheck_PartySpace, MGGive_ManaphyEgg, MGMessageSuccess_ManaphyEgg, MGMessageFailure_GiveMon
	.word MGCheck_MemberCard, MGGive_MemberCard, MGMessageSuccess_MemberCard, MGMessageFailure_MemberCard
	.word MGCheck_OaksLetter, MGGive_OaksLetter, MGMessageSuccess_OaksLetter, MGMessageFailure_OaksLetter
	.word MGCheck_AzureFlute, MGGive_AzureFlute, MGMessageSuccess_AzureFlute, MGMessageFailure_AzureFlute
	.word MGCheck_PoketchApp, MGGive_PoketchApp, MGMessageSuccess_PoketchApp, MGMessageFailure_PoketchApp
	.word MGCheck_SecretKey, MGGive_SecretKey, MGMessageSuccess_SecretKey, MGMessageFailure_SecretKey
	.word MGCheck_PartySpace, MGGive_Mon, MGMessageSuccess_GiveMon, MGMessageFailure_GiveMon
	.word MGCheck_PokewalkerCourse, MGGive_PokewalkerCourse, MGMesageSuccess_PokewalkerCourse, MGMesageFailure_PokewalkerCourse
	.word MGCheck_MemorialPhoto, MGGive_MemorialPhoto, MGMessageSuccess_MemorialPhoto, MGMessageFailure_MemorialPhoto

	.text

	thumb_func_start FieldSys_InitGetMysteryGiftGmmState
FieldSys_InitGetMysteryGiftGmmState: ; 0x0204BD78
	str r1, [r0]
	str r2, [r0, #4]
	str r3, [r0, #8]
	bx lr
	thumb_func_end FieldSys_InitGetMysteryGiftGmmState

	thumb_func_start FieldSys_GetTagOfNextMG
FieldSys_GetTagOfNextMG: ; 0x0204BD80
	push {r3, lr}
	bl GetFirstQueuedMysteryGiftIdx
	bl GetMysteryGiftTagByIdx
	pop {r3, pc}
	thumb_func_end FieldSys_GetTagOfNextMG

	thumb_func_start FieldSys_GetDataOfNextMG
FieldSys_GetDataOfNextMG: ; 0x0204BD8C
	push {r3, lr}
	bl GetFirstQueuedMysteryGiftIdx
	bl GetMysteryGiftDataByIdx
	pop {r3, pc}
	thumb_func_end FieldSys_GetDataOfNextMG

	thumb_func_start FieldSys_SetQueuedMGReceived
FieldSys_SetQueuedMGReceived: ; 0x0204BD98
	push {r3, lr}
	bl GetFirstQueuedMysteryGiftIdx
	bl SetMysteryGiftReceivedByIdx
	pop {r3, pc}
	thumb_func_end FieldSys_SetQueuedMGReceived

	thumb_func_start ScrCmd_MysteryGift
ScrCmd_MysteryGift: ; 0x0204BDA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r4, r0, #0
	bl ScriptReadHalfword
	cmp r0, #8
	bls _0204BDB4
	b _0204BF8C
_0204BDB4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204BDC0: ; jump table
	.short _0204BDD2 - _0204BDC0 - 2 ; case 0
	.short _0204BDFC - _0204BDC0 - 2 ; case 1
	.short _0204BE28 - _0204BDC0 - 2 ; case 2
	.short _0204BE48 - _0204BDC0 - 2 ; case 3
	.short _0204BE84 - _0204BDC0 - 2 ; case 4
	.short _0204BEB6 - _0204BDC0 - 2 ; case 5
	.short _0204BF22 - _0204BDC0 - 2 ; case 6
	.short _0204BDE0 - _0204BDC0 - 2 ; case 7
	.short _0204BDEE - _0204BDC0 - 2 ; case 8
_0204BDD2:
	; Begin
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #0x20
	ldr r0, [r0, #0xc]
	bl GetStaticPointerToSaveMysteryGift
	b _0204BF8C
_0204BDE0:
	; End
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0xc]
	bl DeleteStaticPointerToMysteryGift
	b _0204BF8C
_0204BDEE:
	; End.2
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0xc]
	bl DeleteStaticPointerToMysteryGift
	b _0204BF8C
_0204BDFC:
	; Check bool
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl FieldSys_GetTagOfNextMG
	cmp r0, #0
	beq _0204BE22
	mov r0, #1
	strh r0, [r5]
	b _0204BF8C
_0204BE22:
	mov r0, #0
	strh r0, [r5]
	b _0204BF8C
_0204BE28:
	; Get tag. Unused
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl FieldSys_GetTagOfNextMG
	strh r0, [r5]
	b _0204BF8C
_0204BE48:
	; Check can give
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetTagOfNextMG
	sub r0, r0, #1
	lsl r5, r0, #4
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r7, _0204BF94 ; =sScriptMysteryGiftActionTable
	bl FieldSys_GetDataOfNextMG
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	ldr r2, [r7, r5]
	blx r2
	strh r0, [r6]
	b _0204BF8C
_0204BE84:
	; Give to player
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetTagOfNextMG
	sub r0, r0, #1
	ldr r1, _0204BF94 ; =sScriptMysteryGiftActionTable
	lsl r0, r0, #4
	add r5, r1, r0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetDataOfNextMG
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r2, [r5, #4]
	blx r2
	add r4, #0x80
	ldr r0, [r4]
	bl FieldSys_SetQueuedMGReceived
	b _0204BF8C
_0204BEB6:
	; Get GMM
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetTagOfNextMG
	sub r0, r0, #1
	ldr r1, _0204BF94 ; =sScriptMysteryGiftActionTable
	lsl r0, r0, #4
	add r5, r1, r0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r4, #0
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
	bl FieldSys_GetDataOfNextMG
	add r4, #0x80
	add r3, r0, #0
	ldr r1, [r4]
	ldr r2, [r6]
	add r0, sp, #0x14
	bl FieldSys_InitGetMysteryGiftGmmState
	ldr r2, [sp]
	ldr r3, [r5, #8]
	add r0, sp, #0x14
	add r1, r7, #0
	blx r3
	b _0204BF8C
_0204BF22:
	; Get another gmm
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetTagOfNextMG
	sub r0, r0, #1
	ldr r1, _0204BF94 ; =sScriptMysteryGiftActionTable
	lsl r0, r0, #4
	add r5, r1, r0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetDataOfNextMG
	add r4, #0x80
	add r3, r0, #0
	ldr r1, [r4]
	ldr r2, [r6]
	add r0, sp, #8
	bl FieldSys_InitGetMysteryGiftGmmState
	ldr r2, [sp, #4]
	ldr r3, [r5, #0xc]
	add r0, sp, #8
	add r1, r7, #0
	blx r3
_0204BF8C:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204BF94: .word sScriptMysteryGiftActionTable
	thumb_func_end ScrCmd_MysteryGift

	thumb_func_start MGCheck_PartySpace
MGCheck_PartySpace: ; 0x0204BF98
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	cmp r0, #6
	bge _0204BFAC
	mov r0, #1
	pop {r3, pc}
_0204BFAC:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end MGCheck_PartySpace

	thumb_func_start MGGive_ManaphyEgg
MGGive_ManaphyEgg: ; 0x0204BFB0
	push {r3, lr}
	sub sp, #8
	add r1, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r3, #1
	str r3, [sp, #4]
	ldr r1, [r1, #0xc]
	ldr r2, _0204BFCC ; =SPECIES_MANAPHY
	mov r0, #0x20
	bl GiveEgg
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
_0204BFCC: .word SPECIES_MANAPHY
	thumb_func_end MGGive_ManaphyEgg

	thumb_func_start MGMessageSuccess_ManaphyEgg
MGMessageSuccess_ManaphyEgg: ; 0x0204BFD0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd1
	strh r0, [r1]
	mov r0, #0xd
	strh r0, [r2]
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r4, #4]
	mov r1, #0
	bl BufferPlayersName
	pop {r4, pc}
	thumb_func_end MGMessageSuccess_ManaphyEgg

	thumb_func_start MGGive_Mon
MGGive_Mon: ; 0x0204BFF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r7, r0, #0
	bl FieldSys_GetDataOfNextMG
	str r0, [sp, #0x14]
	ldr r0, [r7, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x10]
	ldr r0, [r7, #0xc]
	bl SavArray_Flags_get
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #8]
	add r5, r0, #0
	add r4, r0, #4
	add r0, r4, #0
	mov r1, #0x98
	add r5, #0xf0
	bl GetMonData
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	bl OS_GetTick
	bl PRandom
	add r1, r0, #0
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x38]
	cmp r0, #0
	beq _0204C074
	cmp r0, #1
	bne _0204C072
	add r0, r6, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	beq _0204C074
_0204C05C:
	ldr r0, [sp, #0x38]
	bl PRandom
	add r1, r0, #0
	add r0, r6, #0
	str r1, [sp, #0x38]
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	bne _0204C05C
	b _0204C074
_0204C072:
	str r0, [sp, #0x38]
_0204C074:
	ldr r1, [sp, #0x38]
	add r0, r4, #0
	bl SetMonPersonality
	add r0, r4, #0
	bl GetMonGender
	str r0, [sp, #0x34]
	add r0, r4, #0
	mov r1, #0x6f
	add r2, sp, #0x34
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x4b
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0x4a
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x20]
	add r0, r4, #0
	mov r1, #0x49
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x24]
	add r0, r4, #0
	mov r1, #0x48
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x28]
	add r0, r4, #0
	mov r1, #0x46
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	add r1, r6, r0
	ldr r0, [sp, #0x28]
	add r1, r0, r1
	ldr r0, [sp, #0x24]
	add r1, r0, r1
	ldr r0, [sp, #0x20]
	add r1, r0, r1
	ldr r0, [sp, #0x1c]
	add r0, r0, r1
	str r0, [sp, #0x34]
	bne _0204C166
	bl LCRandom
	add r6, r0, #0
	mov r0, #0x1f
	and r0, r6
	str r0, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x46
	add r2, sp, #0x38
	bl SetMonData
	mov r0, #0x3e
	lsl r0, r0, #4
	and r0, r6
	lsr r0, r0, #5
	str r0, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x47
	add r2, sp, #0x38
	bl SetMonData
	mov r0, #0x1f
	lsl r0, r0, #0xa
	and r0, r6
	lsr r0, r0, #0xa
	str r0, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x48
	add r2, sp, #0x38
	bl SetMonData
	bl LCRandom
	add r6, r0, #0
	mov r0, #0x1f
	and r0, r6
	str r0, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x49
	add r2, sp, #0x38
	bl SetMonData
	mov r0, #0x3e
	lsl r0, r0, #4
	and r0, r6
	lsr r0, r0, #5
	str r0, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x4a
	add r2, sp, #0x38
	bl SetMonData
	mov r0, #0x1f
	lsl r0, r0, #0xa
	and r0, r6
	lsr r0, r0, #0xa
	str r0, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x4b
	add r2, sp, #0x38
	bl SetMonData
_0204C166:
	ldr r0, [r7, #0xc]
	bl Save_SpecialRibbons_get
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x2e
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C186
	mov r0, #RIBBON_RED
	bl GetSpecialRibbonNo
	ldrb r1, [r5]
	strb r1, [r6, r0]
_0204C186:
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C19E
	mov r0, #RIBBON_GREEN
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #1]
	strb r1, [r6, r0]
_0204C19E:
	add r0, r4, #0
	mov r1, #0x30
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C1B6
	mov r0, #RIBBON_BLUE
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #2]
	strb r1, [r6, r0]
_0204C1B6:
	add r0, r4, #0
	mov r1, #0x31
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C1CE
	mov r0, #RIBBON_FESTIVAL
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #3]
	strb r1, [r6, r0]
_0204C1CE:
	add r0, r4, #0
	mov r1, #0x32
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C1E6
	mov r0, #RIBBON_CARNIVAL
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #4]
	strb r1, [r6, r0]
_0204C1E6:
	add r0, r4, #0
	mov r1, #0x33
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C1FE
	mov r0, #RIBBON_CLASSIC
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #5]
	strb r1, [r6, r0]
_0204C1FE:
	add r0, r4, #0
	mov r1, #0x34
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C216
	mov r0, #RIBBON_PREMIER
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #6]
	strb r1, [r6, r0]
_0204C216:
	add r0, r4, #0
	mov r1, #0x67
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C22E
	mov r0, #RIBBON_HOENN_MARINE
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #7]
	strb r1, [r6, r0]
_0204C22E:
	add r0, r4, #0
	mov r1, #0x68
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C246
	mov r0, #RIBBON_HOENN_LAND
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #8]
	strb r1, [r6, r0]
_0204C246:
	add r0, r4, #0
	mov r1, #0x69
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0204C25E
	mov r0, #RIBBON_HOENN_SKY
	bl GetSpecialRibbonNo
	ldrb r1, [r5, #9]
	strb r1, [r6, r0]
_0204C25E:
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	cmp r0, #0
	bne _0204C2B6
	ldr r0, [sp, #0x10]
	mov r1, #0x20
	bl PlayerProfile_GetPlayerName_NewString
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	bl PlayerProfile_GetTrainerID
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x10]
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #0x2c]
	mov r0, #0x20
	bl AllocMonZeroed
	str r0, [sp, #8]
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl CopyPokemonToPokemon
	ldr r0, [sp, #8]
	mov r1, #0x91
	add r2, r5, #0
	bl SetMonData
	ldr r0, [sp, #8]
	mov r1, #7
	add r2, sp, #0x30
	bl SetMonData
	ldr r0, [sp, #8]
	mov r1, #0x9d
	add r2, sp, #0x2c
	bl SetMonData
	add r0, r5, #0
	ldr r4, [sp, #8]
	bl String_dtor
_0204C2B6:
	ldr r1, [sp, #4]
	mov r0, #2
	bl sub_02017FE4
	add r3, r0, #0
	mov r0, #0x20
	str r0, [sp]
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	mov r2, #4
	bl MonSetTrainerMemo
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r1, _0204C32C ; =SPECIES_ARCEUS
	cmp r0, r1
	bne _0204C2FE
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	cmp r0, #1
	bne _0204C2FE
	ldr r0, [sp, #0xc]
	bl ScriptState_GetVar404C
	cmp r0, #0
	bne _0204C2FE
	ldr r0, [sp, #0xc]
	mov r1, #1
	bl ScriptState_SetVar404C
_0204C2FE:
	add r0, r4, #0
	bl CalcMonLevelAndStats
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	bl AddMonToParty
	cmp r0, #0
	beq _0204C31C
	ldr r0, [r7, #0xc]
	add r1, r4, #0
	bl UpdatePokedexWithReceivedSpecies
_0204C31C:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0204C326
	bl FreeToHeap
_0204C326:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0204C32C: .word SPECIES_ARCEUS
	thumb_func_end MGGive_Mon

	thumb_func_start MGMessageSuccess_GiveMon
MGMessageSuccess_GiveMon: ; 0x0204C330
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl FieldSys_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #7
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl FieldSys_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #8
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl Sav2_Bag_get
	add r4, r0, #0
	add r0, r5, #0
	bl FieldSys_GetDataOfNextMG
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
	bl Sav2_Bag_get
	add r6, r0, #0
	add r0, r5, #0
	bl FieldSys_GetDataOfNextMG
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x86
	lsl r0, r0, #2
	cmp r4, r0
	bne _0204C410
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
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
	bl FieldSys_GetDataOfNextMG
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #9
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl Sav2_Bag_get
	ldr r0, [r5]
	bl FieldSys_GetDataOfNextMG
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
	bl FieldSys_GetDataOfNextMG
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
	bl FieldSys_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0xa
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl String_dtor
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
	bl FieldSys_GetDataOfNextMG
	ldr r7, [r0]
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0xb
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl FieldSys_GetDataOfNextMG
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
	bl Sav2_SealCase_get
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
	bl FieldSys_GetDataOfNextMG
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
	bl Sav2_SealCase_get
	add r1, r4, #0
	mov r2, #1
	bl GiveOrTakeSeal
	pop {r3, r4, r5, pc}
_0204C5B2:
	ldr r0, [r5, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
	add r1, r4, #0
	mov r2, #1
	bl sub_0202BB08
	pop {r3, r4, r5, pc}
_0204C5C6:
	ldr r0, [r5, #0xc]
	bl Save_DressupData_get
	bl SaveDressupData_GetFashionCase
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
	bl FieldSys_GetDataOfNextMG
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
	bl Sav2_PlayerData_GetProfileAddr
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
	bl FieldSys_GetDataOfNextMG
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_Pokewalker_get
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
	bl Sav2_Pokewalker_get
	add r4, r0, #0
	add r0, r5, #0
	bl FieldSys_GetDataOfNextMG
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
	bl FieldSys_GetDataOfNextMG
	add r7, r0, #0
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0x13
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl FieldSys_GetDataOfNextMG
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokewalker_get
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0x1a
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl Sav2_Bag_get
	ldr r0, [r4, #0xc]
	bl Save_PhotoAlbum_get
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
	bl FieldSys_GetDataOfNextMG
	add r5, r0, #0
	add r0, r4, #0
	bl Fsys_GetSaveDataPtr
	bl Save_PhotoAlbum_get
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
	bl FieldSys_GetDataOfNextMG
	mov r0, #0xd1
	strh r0, [r4]
	mov r0, #0x12
	strh r0, [r6]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
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
	bl FieldSys_GetDataOfNextMG
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
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
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0
	bl BufferPlayersName
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0204C838: .word 0x000001F5
	thumb_func_end MGMessageFailure_MemorialPhoto
