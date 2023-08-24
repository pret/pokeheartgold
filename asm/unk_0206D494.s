#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "unk_0206D494.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0206D494
sub_0206D494: ; 0x0206D494
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #0x3c]
	bl sub_0205C600
	add r7, r0, #0
	bl sub_0206D590
	add r5, r0, #0
	beq _0206D4D8
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	strb r0, [r4, #8]
	mov r0, #0
	strb r0, [r4, #9]
	ldr r1, _0206D4DC ; =sub_0206D4E4
	add r0, r6, #0
	add r2, r4, #0
	bl FieldSystem_CreateTask
	ldr r0, _0206D4E0 ; =0x00000905
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D4D8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206D4DC: .word sub_0206D4E4
_0206D4E0: .word 0x00000905
	thumb_func_end sub_0206D494

	thumb_func_start sub_0206D4E4
sub_0206D4E4: ; 0x0206D4E4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #3
	bhi _0206D586
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206D510: ; jump table
	.short _0206D518 - _0206D510 - 2 ; case 0
	.short _0206D534 - _0206D510 - 2 ; case 1
	.short _0206D54E - _0206D510 - 2 ; case 2
	.short _0206D576 - _0206D510 - 2 ; case 3
_0206D518:
	ldr r0, [r6, #0x3c]
	bl sub_0205C600
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _0206D586
	ldr r0, _0206D58C ; =0x00000906
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D534:
	add r0, r5, #0
	bl sub_0206D688
	cmp r0, #0
	beq _0206D586
	ldr r0, _0206D58C ; =0x00000906
	mov r1, #0
	bl StopSE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D54E:
	ldr r0, [r5]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _0206D586
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0206D566
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D566:
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _0206D586
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206D586
_0206D576:
	ldr r0, [r6, #0x40]
	bl sub_0206D850
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_0206D586:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0206D58C: .word 0x00000906
	thumb_func_end sub_0206D4E4

	thumb_func_start sub_0206D590
sub_0206D590: ; 0x0206D590
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl MapObject_GetManager
	str r0, [sp]
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r5, #0
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentHeight
	str r0, [sp, #4]
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r4, r0, #0
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
	add r3, r0, #0
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r6, r7
	add r3, r4, r3
	bl sub_0206D614
	add r4, r0, #0
	beq _0206D60A
	bl MapObject_GetGfxID
	ldr r1, _0206D610 ; =0x00000196
	cmp r0, r1
	beq _0206D5EC
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D5EC:
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	cmp r0, #1
	beq _0206D604
	cmp r0, #0
	beq _0206D5FE
	bl GF_AssertFail
_0206D5FE:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D604:
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D60A:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206D610: .word 0x00000196
	thumb_func_end sub_0206D590

	thumb_func_start sub_0206D614
sub_0206D614: ; 0x0206D614
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl MapObjectManager_GetObjects
	str r0, [sp, #4]
	add r0, r4, #0
	bl MapObjectManager_GetCount
	add r5, r0, #0
_0206D62E:
	ldr r0, [sp, #4]
	mov r1, #1
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _0206D676
	mov r1, #1
	ldr r0, [sp, #4]
	lsl r1, r1, #0x12
	bl MapObject_GetFlagsMask
	cmp r0, #0
	bne _0206D676
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentX
	add r4, r0, #0
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentY
	cmp r4, r6
	bne _0206D676
	ldr r1, [sp]
	cmp r0, r1
	bne _0206D676
	ldr r0, [sp, #4]
	bl MapObject_GetCurrentHeight
	sub r0, r0, r7
	bpl _0206D66C
	neg r0, r0
_0206D66C:
	cmp r0, #2
	bge _0206D676
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0206D676:
	add r0, sp, #4
	bl sub_0205F1D0
	sub r5, r5, #1
	bne _0206D62E
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206D614

	thumb_func_start sub_0206D688
sub_0206D688: ; 0x0206D688
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #9]
	cmp r0, #0
	beq _0206D69E
	cmp r0, #1
	beq _0206D750
	cmp r0, #2
	beq _0206D77E
	b _0206D7A8
_0206D69E:
	ldr r0, [r5]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _0206D7A8
	ldr r0, [r5]
	bl MapObject_GetCurrentX
	add r4, r0, #0
	ldrb r0, [r5, #8]
	bl GetDeltaXByFacingDirection
	add r6, r0, #0
	ldr r0, [r5]
	bl MapObject_GetCurrentHeight
	str r0, [sp]
	ldr r0, [r5]
	bl MapObject_GetCurrentY
	add r7, r0, #0
	ldrb r0, [r5, #8]
	bl GetDeltaYByFacingDirection
	str r0, [sp, #4]
	ldr r3, [sp, #4]
	ldr r0, [r5]
	ldr r2, [sp]
	add r1, r4, r6
	add r3, r7, r3
	bl sub_0206D7B8
	mov r1, #2
	tst r1, r0
	beq _0206D730
	ldr r0, [r5]
	bl MapObject_GetManager
	ldr r3, [sp, #4]
	ldr r2, [sp]
	add r1, r4, r6
	add r3, r7, r3
	bl sub_0206D614
	add r4, r0, #0
	bne _0206D704
	bl GF_AssertFail
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D704:
	bl MapObject_GetGfxID
	ldr r1, _0206D7B0 ; =0x00000196
	cmp r0, r1
	bne _0206D71E
	str r4, [r5, #4]
	ldr r0, [r5]
	mov r1, #0x48
	bl MapObject_SetHeldMovement
	mov r0, #2
	strb r0, [r5, #9]
	b _0206D7A8
_0206D71E:
	mov r0, #0
	str r0, [r5, #4]
	ldr r0, [r5]
	mov r1, #0x48
	bl MapObject_SetHeldMovement
	mov r0, #2
	strb r0, [r5, #9]
	b _0206D7A8
_0206D730:
	mov r1, #1
	tst r1, r0
	bne _0206D73C
	mov r1, #4
	tst r0, r1
	beq _0206D742
_0206D73C:
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D742:
	ldr r0, [r5]
	mov r1, #0x47
	bl MapObject_SetHeldMovement
	mov r0, #1
	strb r0, [r5, #9]
	b _0206D7A8
_0206D750:
	ldr r0, [r5]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _0206D7A8
	ldrb r0, [r5, #8]
	bl sub_0206D81C
	add r1, r0, #0
	cmp r1, #0xff
	beq _0206D76E
	ldr r0, [r5]
	bl MapObject_SetHeldMovement
	b _0206D778
_0206D76E:
	bl GF_AssertFail
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D778:
	mov r0, #0
	strb r0, [r5, #9]
	b _0206D7A8
_0206D77E:
	ldr r0, [r5]
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _0206D7A8
	ldr r0, _0206D7B4 ; =0x00000907
	bl PlaySE
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0206D79A
	mov r1, #0
	bl MapObject_SetHeldMovement
_0206D79A:
	ldr r0, [r5]
	mov r1, #0
	bl MapObject_SetHeldMovement
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206D7A8:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206D7B0: .word 0x00000196
_0206D7B4: .word 0x00000907
	thumb_func_end sub_0206D688

	thumb_func_start sub_0206D7B8
sub_0206D7B8: ; 0x0206D7B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r1, #0
	add r5, r0, #0
	add r1, sp, #0xc
	str r2, [sp, #4]
	add r7, r3, #0
	bl MapObject_GetPositionVec
	add r0, r5, #0
	mov r4, #0
	bl MapObject_GetFieldSysPtr
	add r1, sp, #8
	str r1, [sp]
	add r1, sp, #0xc
	add r2, r6, #0
	add r3, r7, #0
	bl sub_020549F4
	cmp r0, #1
	bne _0206D7E8
	mov r0, #1
	orr r4, r0
_0206D7E8:
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	add r1, r6, #0
	add r2, r7, #0
	bl GetMetatileBehaviorAt
	bl sub_0205B828
	cmp r0, #0
	bne _0206D802
	mov r0, #4
	orr r4, r0
_0206D802:
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl sub_02060BFC
	cmp r0, #1
	bne _0206D816
	mov r0, #2
	orr r4, r0
_0206D816:
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206D7B8

	thumb_func_start sub_0206D81C
sub_0206D81C: ; 0x0206D81C
	push {r4, lr}
	mov r4, #0xff
	cmp r0, #3
	bhi _0206D848
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206D830: ; jump table
	.short _0206D838 - _0206D830 - 2 ; case 0
	.short _0206D83C - _0206D830 - 2 ; case 1
	.short _0206D840 - _0206D830 - 2 ; case 2
	.short _0206D844 - _0206D830 - 2 ; case 3
_0206D838:
	mov r4, #0xc
	b _0206D84C
_0206D83C:
	mov r4, #0xd
	b _0206D84C
_0206D840:
	mov r4, #0xe
	b _0206D84C
_0206D844:
	mov r4, #0xf
	b _0206D84C
_0206D848:
	bl GF_AssertFail
_0206D84C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0206D81C

	thumb_func_start sub_0206D850
sub_0206D850: ; 0x0206D850
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205CA38
	cmp r0, #1
	bne _0206D892
	add r0, r4, #0
	bl PlayerAvatar_GetMapObject
	mov r1, #6
	lsl r1, r1, #6
	bl MapObject_ClearFlagsBits
	add r0, r4, #0
	bl sub_0205CB2C
	cmp r0, #0
	bne _0206D87A
	add r0, r4, #0
	bl sub_0205C74C
_0206D87A:
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CA20
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CB14
	add r0, r4, #0
	mov r1, #0
	bl sub_0205CAD0
_0206D892:
	pop {r4, pc}
	thumb_func_end sub_0206D850

	thumb_func_start MonIsInGameTradePoke
MonIsInGameTradePoke: ; 0x0206D894
	; BOOL MonIsInGameTradePoke(Pokemon *poke, int tradeno);
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x70
	mov r2, #0
	mov r3, #0xb
	add r6, r1, #0
	bl GfGfxLoader_LoadFromNarc
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MonIsInGameTradePokeEx
	add r5, r0, #0
	add r0, r4, #0
	bl FreeToHeap
	cmp r5, #0
	beq _0206D8C8
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0206D8C8:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MonIsInGameTradePoke

	thumb_func_start sub_0206D8D0
sub_0206D8D0: ; 0x0206D8D0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl Save_PlayerData_GetProfileAddr
	add r4, r0, #0
	add r0, r6, #0
	bl Save_Misc_Get
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #0xaf
	beq _0206D90C
	cmp r1, #0xb0
	beq _0206D90C
	mov r0, #0x75
	lsl r0, r0, #2
	cmp r1, r0
	beq _0206D90C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D90C:
	add r0, r5, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _0206D92A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D92A:
	add r0, r5, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r1, sp, #0
	ldrb r1, [r1]
	cmp r1, r0
	beq _0206D94C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D94C:
	add r0, r5, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _0206D9C8 ; =gGameLanguage
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0206D96A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D96A:
	add r0, r5, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	ldr r0, _0206D9CC ; =gGameVersion
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _0206D988
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D988:
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0
	bl SaveMisc_GetTogepiPersonalityGender
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, [sp, #4]
	cmp r1, r0
	beq _0206D9A8
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0206D9A8:
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	ldrb r1, [r1]
	cmp r1, r0
	bne _0206D9C0
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0206D9C0:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0206D9C8: .word gGameLanguage
_0206D9CC: .word gGameVersion
	thumb_func_end sub_0206D8D0

	thumb_func_start MonIsInGameTradePokeEx
MonIsInGameTradePokeEx: ; 0x0206D9D0
	; BOOL MonIsInGameTradePokeEx(Pokemon *poke, struct InGameTrade *trade, int tradeno);
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r2, #0
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r6, #7
	bne _0206D9F8
	cmp r1, #SPECIES_SPEAROW
	beq _0206DA04
	cmp r1, #SPECIES_FEAROW
	beq _0206DA04
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206D9F8:
	ldr r0, [r5]
	cmp r1, r0
	beq _0206DA04
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA04:
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	ldr r1, [r5, #0x20]
	cmp r0, r1
	beq _0206DA1A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA1A:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	ldr r1, [r5, #0x38]
	cmp r0, r1
	beq _0206DA30
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA30:
	add r0, r4, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [r5, #0x40]
	cmp r1, r0
	beq _0206DA4A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA4A:
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [r5, #0x48]
	cmp r1, r0
	beq _0206DA64
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA64:
	add r0, r4, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _0206DB24 ; =gGameVersion
	ldrb r0, [r0]
	cmp r1, r0
	beq _0206DA80
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DA80:
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc8
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r5, r0, #0
	mov r0, #0xc
	mov r1, #0xb
	bl String_New
	str r0, [sp]
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0x77
	bl GetMonData
	add r0, r5, #0
	add r1, r6, #0
	bl NewString_ReadMsgData
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl String_Compare
	add r7, r0, #0
	ldr r0, [sp, #4]
	bl String_Delete
	ldr r0, [sp]
	bl String_Delete
	cmp r7, #0
	beq _0206DAD2
	add r0, r5, #0
	bl DestroyMsgData
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DAD2:
	mov r0, #8
	mov r1, #0xb
	bl String_New
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x91
	add r2, r7, #0
	bl GetMonData
	add r6, #0xd
	add r0, r5, #0
	add r1, r6, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl String_Compare
	add r4, r0, #0
	add r0, r6, #0
	bl String_Delete
	add r0, r7, #0
	bl String_Delete
	cmp r4, #0
	beq _0206DB18
	add r0, r5, #0
	bl DestroyMsgData
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206DB18:
	add r0, r5, #0
	bl DestroyMsgData
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206DB24: .word gGameVersion
	thumb_func_end MonIsInGameTradePokeEx

	thumb_func_start FieldSystem_BugContest_Get
FieldSystem_BugContest_Get: ; 0x0206DB28
	mov r1, #0x46
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end FieldSystem_BugContest_Get

	thumb_func_start BugContest_GetSportBallsAddr
BugContest_GetSportBallsAddr: ; 0x0206DB30
	add r0, #0x18
	bx lr
	thumb_func_end BugContest_GetSportBallsAddr

	thumb_func_start FieldSystem_IncrementBugContestTimer
FieldSystem_IncrementBugContestTimer: ; 0x0206DB34
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl FieldSystem_BugContest_Get
	add r4, r0, #0
	beq _0206DB56
	ldr r0, [r5, #0xc]
	bl Save_VarsFlags_Get
	bl CheckFlag996
	cmp r0, #0
	beq _0206DB56
	ldr r0, [r4, #0x1c]
	add r0, r0, r6
	str r0, [r4, #0x1c]
_0206DB56:
	pop {r4, r5, r6, pc}
	thumb_func_end FieldSystem_IncrementBugContestTimer

	thumb_func_start sub_0206DB58
sub_0206DB58: ; 0x0206DB58
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r1, #0xc]
	bl Save_LocalFieldData_Get
	mov r1, #0x60
	str r1, [sp]
	sub r1, #0x61
	str r1, [sp, #4]
	mov r1, #0x2e
	str r1, [sp, #8]
	mov r1, #0x32
	str r1, [sp, #0xc]
	mov r1, #0
	str r1, [sp, #0x10]
	add r4, r0, #0
	add r1, sp, #0
	bl LocalFieldData_SetDynamicWarp
	add r0, r4, #0
	bl LocalFieldData_GetDynamicWarp
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020537A8
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206DB58

	thumb_func_start sub_0206DB94
sub_0206DB94: ; 0x0206DB94
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #3
	mov r1, #0xc
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r1, _0206DBBC ; =sub_0206DBC0
	add r0, r6, #0
	add r2, r4, #0
	str r5, [r4, #4]
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_0206DBBC: .word sub_0206DBC0
	thumb_func_end sub_0206DB94

	thumb_func_start sub_0206DBC0
sub_0206DBC0: ; 0x0206DBC0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl TaskManager_GetFieldSystem
	add r7, r0, #0
	add r0, r6, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r7, #0
	bl FieldSystem_BugContest_Get
	add r5, r0, #0
	add r0, r6, #0
	bl TaskManager_GetStatePtr
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _0206DBEE
	cmp r0, #1
	beq _0206DC10
	b _0206DC4C
_0206DBEE:
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _0206DBFA
	mov r3, #1
	b _0206DBFC
_0206DBFA:
	mov r3, #0
_0206DBFC:
	ldr r1, [r4, #4]
	ldr r2, [r5, #0x10]
	add r0, r7, #0
	bl sub_0203EDDC
	str r0, [r4, #8]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _0206DC4C
_0206DC10:
	add r0, r7, #0
	bl FieldSystem_ApplicationIsRunning
	cmp r0, #0
	bne _0206DC4C
	ldr r0, [r4, #8]
	ldr r1, [r5, #0x10]
	ldr r0, [r0, #0x10]
	cmp r0, r1
	beq _0206DC2A
	ldr r0, [r4, #4]
	bl CopyPokemonToPokemon
_0206DC2A:
	ldrb r1, [r5, #0x17]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _0206DC3C
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strb r0, [r5, #0x17]
_0206DC3C:
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206DC4C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206DBC0

	thumb_func_start ScrCmd_807
ScrCmd_807: ; 0x0206DC50
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	ldr r1, _0206DCC0 ; =0x00004021
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	add r1, r5, r1
	lsl r1, r1, #0x10
	ldr r0, [r0]
	lsr r1, r1, #0x10
	bl GetVarPointer
	add r4, #0x80
	add r7, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Save_TrainerHouse_Get
	add r4, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	mul r0, r5
	str r0, [sp]
	add r0, r4, r0
	bl TrainerHouseSet_CheckHasData
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #0
	beq _0206DCB8
	ldr r0, [sp]
	add r0, r4, r0
	ldrb r0, [r0, #4]
	b _0206DCBA
_0206DCB8:
	mov r0, #0
_0206DCBA:
	strh r0, [r7]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206DCC0: .word 0x00004021
	thumb_func_end ScrCmd_807

	thumb_func_start FieldSystem_InitMystriStageGymmick
FieldSystem_InitMystriStageGymmick: ; 0x0206DCC4
	push {r4, lr}
	bl FieldSystem_GetSaveData
	bl Save_GetGymmickPtr
	add r4, r0, #0
	mov r1, #9
	bl Save_Gymmick_Init
	add r0, r4, #0
	mov r1, #9
	bl Save_Gymmick_AssertMagic_GetData
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	thumb_func_end FieldSystem_InitMystriStageGymmick
