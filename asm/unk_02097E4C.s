#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start MonAdjustMood
MonAdjustMood: ; 0x02097E4C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #MON_DATA_MOOD
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	add r2, sp, #0
	mov r1, #0
	strb r0, [r2]
	ldrsb r0, [r2, r1]
	add r2, r0, r4
	cmp r2, #0x7f
	ble _02097E6C
	mov r2, #0x7f
	b _02097E78
_02097E6C:
	add r0, r1, #0
	sub r0, #0x7f
	cmp r2, r0
	bge _02097E78
	add r2, r1, #0
	sub r2, #0x7f
_02097E78:
	add r0, sp, #0
	strb r2, [r0]
	add r0, r5, #0
	mov r1, #MON_DATA_MOOD
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, pc}
	thumb_func_end MonAdjustMood

	thumb_func_start ItemIdGetMoodEffect
ItemIdGetMoodEffect: ; 0x02097E88
	sub r0, #0x22
	mov r1, #0
	cmp r0, #0x1c
	bhi _02097EF0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02097E9C: ; jump table
	.short _02097EDA - _02097E9C - 2 ; case ITEM_ENERGYPOWDER
	.short _02097EDE - _02097E9C - 2 ; case ITEM_ENERGY_ROOT
	.short _02097EE2 - _02097E9C - 2 ; case ITEM_HEAL_POWDER
	.short _02097EE6 - _02097E9C - 2 ; case ITEM_REVIVAL_HERB
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_ETHER
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_MAX_ETHER
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_ELIXIR
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_MAX_ELIXIR
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_LAVA_COOKIE
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_BERRY_JUICE
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_SACRED_ASH
	.short _02097EEA - _02097E9C - 2 ; case ITEM_HP_UP
	.short _02097EEA - _02097E9C - 2 ; case ITEM_PROTEIN
	.short _02097EEA - _02097E9C - 2 ; case ITEM_IRON
	.short _02097EEA - _02097E9C - 2 ; case ITEM_CARBOS
	.short _02097EEA - _02097E9C - 2 ; case ITEM_CALCIUM
	.short _02097ED6 - _02097E9C - 2 ; case ITEM_RARE_CANDY
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_PP_UP
	.short _02097EEA - _02097E9C - 2 ; case ITEM_ZINC
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_PP_MAX
	.short _02097EF0 - _02097E9C - 2 ; case ITEM_OLD_GATEAU
	.short _02097EEE - _02097E9C - 2 ; case ITEM_GUARD_SPEC_
	.short _02097EEE - _02097E9C - 2 ; case ITEM_DIRE_HIT
	.short _02097EEE - _02097E9C - 2 ; case ITEM_X_ATTACK
	.short _02097EEE - _02097E9C - 2 ; case ITEM_X_DEFENSE
	.short _02097EEE - _02097E9C - 2 ; case ITEM_X_SPEED
	.short _02097EEE - _02097E9C - 2 ; case ITEM_X_ACCURACY
	.short _02097EEE - _02097E9C - 2 ; case ITEM_X_SPECIAL
	.short _02097EEE - _02097E9C - 2 ; case ITEM_X_SP__DEF
_02097ED6:
	mov r1, #0x28
	b _02097EF0
_02097EDA:
	sub r1, #0x14
	b _02097EF0
_02097EDE:
	sub r1, #0x1e
	b _02097EF0
_02097EE2:
	sub r1, #0x14
	b _02097EF0
_02097EE6:
	sub r1, #0x28
	b _02097EF0
_02097EEA:
	mov r1, #8
	b _02097EF0
_02097EEE:
	mov r1, #0xa
_02097EF0:
	add r0, r1, #0
	bx lr
	thumb_func_end ItemIdGetMoodEffect

	thumb_func_start ApplyItemEffectOnMonMood
ApplyItemEffectOnMonMood: ; 0x02097EF4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ItemIdGetMoodEffect
	add r1, r0, #0
	beq _02097F08
	add r0, r4, #0
	bl MonAdjustMood
_02097F08:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ApplyItemEffectOnMonMood

	thumb_func_start ApplyMonMoodModifier
ApplyMonMoodModifier: ; 0x02097F0C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #MON_DATA_SPECIES2
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	beq _02097F60
	ldr r0, _02097F64 ; =SPECIES_EGG
	cmp r1, r0
	beq _02097F60
	add r0, r5, #0
	mov r1, #MON_DATA_MOOD
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strb r0, [r1]
	mov r0, #0
	ldrsb r2, [r1, r0]
	ldr r1, _02097F68 ; =_02108F44
	ldrsb r1, [r1, r4]
	add r2, r2, r1
	add r1, r0, #0
	sub r1, #0x7f
	cmp r2, r1
	bge _02097F4C
	add r2, r0, #0
	sub r2, #0x7f
	b _02097F52
_02097F4C:
	cmp r2, #0x7f
	ble _02097F52
	mov r2, #0x7f
_02097F52:
	add r0, sp, #0
	strb r2, [r0]
	add r0, r5, #0
	mov r1, #MON_DATA_MOOD
	add r2, sp, #0
	bl SetMonData
_02097F60:
	pop {r3, r4, r5, pc}
	nop
_02097F64: .word SPECIES_EGG
_02097F68: .word _02108F44
	thumb_func_end ApplyMonMoodModifier

	.rodata

_02108F44:
	.byte   40
	.byte    8
	.byte   50
	.byte   40
	.byte  -80
	.byte  -50
	.byte -100
	.byte   30
