#include "config.h"
#include "constants/species.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/easy_chat.h"
#include "msgdata/msg/msg_0285.h"
#include "msgdata/msg/msg_0287.h"
#include "msgdata/msg/msg_0292.h"
#include "msgdata/msg/msg_0294.h"
#include "msgdata/msg/msg_0296.h"
#include "msgdata/msg/msg_0726.h"
	.include "asm/macros.inc"
	.include "overlay_25.inc"
	.include "global.inc"

	.text

	thumb_func_start ov25_022598C0
ov25_022598C0: ; 0x022598C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x184
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r1, #0
	bl Save_TrainerHouse_Get
	add r2, r0, #0
	cmp r4, #0xa
	bne _022598FE
	add r0, sp, #4
	bl ov25_02259948
	add r0, r5, #0
	add r1, sp, #4
	bl ov25_02259AAC
	add r6, r0, #0
	add r4, r6, #0
	add r4, #0x5c
	add r0, r4, #0
	ldr r1, _02259940 ; =ov25_02259D8C
	add r0, #0x24
	bl MailMsg_Init_FromTemplate
	add r4, #0x2c
	ldr r1, _02259944 ; =ov25_02259D94
	add r0, r4, #0
	bl MailMsg_Init_FromTemplate
	b _0225990E
_022598FE:
	mov r1, #6
	lsl r1, r1, #6
	mul r1, r4
	add r0, r5, #0
	add r1, r2, r1
	bl ov25_02259AAC
	add r6, r0, #0
_0225990E:
	add r0, r5, #0
	mov r1, #0
	add r0, #0xa0
	str r1, [r0]
	add r0, r6, #0
	bl sub_020517E8
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020517FC
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x18
	bl FieldSysGetAttrAddr
	str r0, [sp]
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl sub_02050AAC
	add sp, #0x184
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02259940: .word ov25_02259D8C
_02259944: .word ov25_02259D94
	thumb_func_end ov25_022598C0

	thumb_func_start ov25_02259948
ov25_02259948: ; 0x02259948
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r2, #6
	ldr r0, _02259A24 ; =ov25_02259D9C
	add r1, r5, #0
	lsl r2, r2, #6
	bl MIi_CpuCopy16
	ldr r2, _02259A28 ; =0x000002D6
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r6, r0, #0
	bne _0225996C
	bl GF_AssertFail
_0225996C:
	cmp r6, #0
	beq _022599C4
	add r0, r6, #0
	mov r1, #msg_0726_00003 ; Cal
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r6, #0
	bl DestroyMsgData
	cmp r4, #0
	bne _02259988
	bl GF_AssertFail
_02259988:
	cmp r4, #0
	beq _022599C4
	add r0, r4, #0
	bl String_GetLength
	add r6, r0, #0
	cmp r6, #7
	bls _0225999C
	bl GF_AssertFail
_0225999C:
	cmp r6, #7
	bls _022599A2
	mov r6, #7
_022599A2:
	add r1, r5, #0
	ldr r0, _02259A2C ; =0x0000FFFF
	add r1, #8
	mov r2, #0x10
	bl MIi_CpuClear16
	add r0, r4, #0
	bl String_cstr
	add r1, r5, #0
	add r1, #8
	lsl r2, r6, #1
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl String_Delete
_022599C4:
	mov r7, #0
	add r5, #0x30
_022599C8:
	ldrh r0, [r5]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	beq _02259A1A
	mov r1, #0xb
	bl GetSpeciesName
	add r4, r0, #0
	bne _022599DE
	bl GF_AssertFail
_022599DE:
	cmp r4, #0
	beq _02259A1A
	add r0, r4, #0
	bl String_GetLength
	add r6, r0, #0
	cmp r6, #0xa
	bls _022599F2
	bl GF_AssertFail
_022599F2:
	cmp r6, #0xa
	bls _022599F8
	mov r6, #0xa
_022599F8:
	add r1, r5, #0
	ldr r0, _02259A2C ; =0x0000FFFF
	add r1, #0x24
	mov r2, #0x14
	bl MIi_CpuClear16
	add r0, r4, #0
	bl String_cstr
	add r1, r5, #0
	add r1, #0x24
	lsl r2, r6, #1
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl String_Delete
_02259A1A:
	add r7, r7, #1
	add r5, #0x38
	cmp r7, #6
	blt _022599C8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259A24: .word ov25_02259D9C
_02259A28: .word 0x000002D6
_02259A2C: .word 0x0000FFFF
	thumb_func_end ov25_02259948

	thumb_func_start ScrCmd_809
ScrCmd_809: ; 0x02259A30
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_TrainerHouse_Get
	cmp r4, #0xa
	bne _02259A6C
	ldr r1, _02259AA4 ; =ov25_02259D84
	add r0, sp, #8
	bl MailMsg_Init_FromTemplate
	add r0, sp, #8
	add r1, sp, #0x10
	mov r2, #8
	bl MIi_CpuCopy16
	b _02259A7E
_02259A6C:
	mov r1, #6
	lsl r1, r1, #6
	mul r1, r4
	add r0, r0, r1
	add r0, #0x18
	add r1, sp, #0x10
	mov r2, #8
	bl MIi_CpuCopy16
_02259A7E:
	add r3, sp, #8
	mov r0, #0xe
	ldrsh r0, [r3, r0]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrh r1, [r3, #8]
	ldrh r2, [r3, #0xa]
	ldrh r3, [r3, #0xc]
	add r0, r5, #0
	bl ov01_021EF564
	ldr r1, _02259AA8 ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02259AA4: .word ov25_02259D84
_02259AA8: .word ov01_021EF348
	thumb_func_end ScrCmd_809

	thumb_func_start ov25_02259AAC
ov25_02259AAC: ; 0x02259AAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #8]
	add r4, r0, #0
	ldr r1, _02259B8C ; =0x00002081
	mov r0, #0xb
	bl BattleSetup_New
	ldr r5, [r4, #0xc]
	add r6, r0, #0
	add r0, r5, #0
	bl SaveArray_Party_Get
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	add r2, r5, #0
	str r0, [sp, #4]
	ldr r3, [r4, #0x20]
	add r0, r6, #0
	ldr r3, [r3]
	bl sub_02051D18
	mov r0, #0x53
	mov r1, #6
	lsl r0, r0, #2
	str r1, [r6, r0]
	mov r1, #9
	add r0, r0, #4
	str r1, [r6, r0]
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	ldr r0, [sp, #0xc]
	bl Party_GetCount
	add r7, r0, #0
	ldr r0, [r6, #4]
	mov r1, #6
	bl Party_InitWithMaxSize
	mov r4, #0
	cmp r7, #0
	ble _02259B60
_02259B12:
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	bl Party_GetMonByIndex
	add r1, r5, #0
	bl CopyPokemonToPokemon
	add r0, r5, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x32
	bls _02259B50
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0x10]
	add r0, r5, #0
	mov r1, #8
	add r2, sp, #0x10
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
_02259B50:
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0
	bl BattleSetup_AddMonToParty
	add r4, r4, #1
	cmp r4, r7
	blt _02259B12
_02259B60:
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl BattleSetup_SetAllySideBattlersToPlayer
	ldr r1, [sp, #8]
	add r0, r6, #0
	mov r2, #1
	bl ov25_02259D14
	mov r2, #0
	add r1, r6, #0
	mov r0, #7
_02259B7C:
	add r2, r2, #1
	str r0, [r1, #0x34]
	add r1, #0x34
	cmp r2, #4
	blt _02259B7C
	add r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02259B8C: .word 0x00002081
	thumb_func_end ov25_02259AAC

	thumb_func_start ov25_02259B90
ov25_02259B90: ; 0x02259B90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r1, #0
	add r6, r0, #0
	add r0, r4, #0
	bl ZeroMonData
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	cmp r0, #0x32
	bls _02259BAA
	mov r0, #0x32
_02259BAA:
	add r2, sp, #8
	strb r0, [r2, #1]
	ldr r0, [r6, #0x10]
	ldr r3, _02259CC0 ; =0x3FFFFFFF
	str r0, [sp]
	ldrh r1, [r6]
	ldr r5, [r6, #0x14]
	ldrb r2, [r2, #1]
	lsl r1, r1, #0x15
	add r0, r4, #0
	lsr r1, r1, #0x15
	and r3, r5
	bl CreateMonWithFixedIVs
	ldrh r0, [r6]
	add r2, sp, #8
	add r2, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x1b
	add r0, sp, #8
	strb r1, [r0, #1]
	add r0, r4, #0
	mov r1, #0x70
	bl SetMonData
	add r0, r4, #0
	mov r1, #6
	add r2, r6, #2
	bl SetMonData
	mov r5, #0
	str r6, [sp, #4]
	add r7, r5, #0
_02259BEC:
	ldr r0, [sp, #4]
	add r2, sp, #8
	ldrh r1, [r0, #4]
	add r0, sp, #8
	add r2, #2
	strh r1, [r0, #2]
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x36
	bl SetMonData
	ldrb r0, [r6, #0x1e]
	add r2, sp, #8
	add r2, #1
	add r1, r0, #0
	asr r1, r7
	mov r0, #3
	and r1, r0
	add r0, sp, #8
	strb r1, [r0, #1]
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x3e
	bl SetMonData
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x42
	mov r2, #0
	bl GetMonData
	add r1, sp, #8
	strb r0, [r1]
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x3a
	add r2, sp, #8
	bl SetMonData
	ldr r0, [sp, #4]
	add r5, r5, #1
	add r0, r0, #2
	add r7, r7, #2
	str r0, [sp, #4]
	cmp r5, #4
	blt _02259BEC
	ldr r0, [r6, #0xc]
	mov r1, #7
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r2, sp, #0xc
	bl SetMonData
	mov r5, #0
	add r7, sp, #8
_02259C5A:
	add r0, r6, r5
	ldrb r0, [r0, #0x18]
	add r1, r5, #0
	add r2, sp, #8
	strb r0, [r7, #1]
	add r0, r4, #0
	add r1, #0xd
	add r2, #1
	bl SetMonData
	add r5, r5, #1
	cmp r5, #6
	blt _02259C5A
	add r2, r6, #0
	add r0, r4, #0
	mov r1, #0xa
	add r2, #0x20
	bl SetMonData
	add r2, r6, #0
	add r0, r4, #0
	mov r1, #9
	add r2, #0x21
	bl SetMonData
	add r0, sp, #0x10
	mov r1, #0xb
	bl StringFillEOS
	add r1, r6, #0
	add r0, sp, #0x10
	add r1, #0x24
	mov r2, #0xa
	bl CopyU16StringArrayN
	add r0, r4, #0
	mov r1, #0x75
	add r2, sp, #0x10
	bl SetMonData
	add r6, #0x1f
	add r0, r4, #0
	mov r1, #0xc
	add r2, r6, #0
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259CC0: .word 0x3FFFFFFF
	thumb_func_end ov25_02259B90

	thumb_func_start ov25_02259CC4
ov25_02259CC4: ; 0x02259CC4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #4]
	mov r2, #1
	bl GetUnionRoomAvatarAttrBySprite
	strb r0, [r4, #1]
	mov r0, #0
	strb r0, [r4, #2]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x14
	add r1, #8
	bl CopyU16StringArray
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x24
	add r1, #0x20
	bl MailMsg_Copy
	add r0, r4, #0
	add r5, #0x28
	add r0, #0x2c
	add r1, r5, #0
	bl MailMsg_Copy
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov25_02259CC4

	thumb_func_start ov25_02259D14
ov25_02259D14: ; 0x02259D14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	str r2, [sp, #4]
	add r5, r1, #0
	ldr r3, [sp]
	ldr r1, [sp, #4]
	mov r2, #0x34
	add r3, #0x28
	mul r2, r1
	add r0, r5, #0
	add r1, r3, r2
	bl ov25_02259CC4
	ldr r0, [sp, #4]
	ldr r1, [r5]
	lsl r4, r0, #2
	ldr r0, [sp]
	add r0, r0, r4
	str r1, [r0, #0x18]
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp]
	mov r1, #6
	add r0, r0, r4
	ldr r0, [r0, #4]
	bl Party_InitWithMaxSize
	add r5, #0x30
	mov r7, #0
	add r4, r5, #0
_02259D56:
	ldrh r0, [r5]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	beq _02259D7A
	add r0, r4, #0
	add r1, r6, #0
	bl ov25_02259B90
	ldr r0, [sp]
	ldr r2, [sp, #4]
	add r1, r6, #0
	bl BattleSetup_AddMonToParty
	add r7, r7, #1
	add r5, #0x38
	add r4, #0x38
	cmp r7, #6
	blt _02259D56
_02259D7A:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov25_02259D14

	.rodata

; It's MATCH!
ov25_02259D84:
	.byte 0x00, msg_0294_00003, EC_GROUP_TRAINER, 0xFF
	.short msg_0285_match, 0x0000

; VICTORY! Thank you!
ov25_02259D8C: ; 0x02259D8C
	.byte 0x01, msg_0296_00007, EC_GROUP_TRAINER, 0xFF
	.short msg_0285_victory, 0x0000

; You win... THANKS!
ov25_02259D94: ; 0x02259D94
	.byte 0x02, msg_0292_00000, EC_GROUP_GREETINGS, 0xFF
	.short msg_0287_thanks, 0x0000

ov25_02259D9C: ; 0x02259D9C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x0B, GAME_LANGUAGE, GAME_VERSION, 0x00

	.short 0x0033, 0x000C, 0x004C, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.short SPECIES_MEGANIUM
	.short ITEM_SITRUS_BERRY
	.short MOVE_LEECH_SEED, MOVE_PROTECT, MOVE_ENERGY_BALL, MOVE_TOXIC
	.word 0x11111111
	.word 0x00000101
	.word (20 << 0) | (20 << 5) | (20 << 10) | (20 << 15) | (20 << 20) | (20 << 25)
	.byte 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFF
	.byte 0x00, 0x02, 0x41, 0x00, 0x32, 0x00

	.short 0x0092, 0x005D, 0x007C, 0x0057, 0x0091, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	.short SPECIES_TYPHLOSION
	.short ITEM_SALAC_BERRY
	.short MOVE_ERUPTION, MOVE_SUBSTITUTE, MOVE_FLAMETHROWER, MOVE_FOCUS_BLAST
	.word 0x11111111
	.word 0x00001010
	.word (20 << 0) | (20 << 5) | (20 << 10) | (20 << 15) | (20 << 20) | (20 << 25)
	.byte 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00
	.byte 0x00, 0x02, 0x42, 0x00, 0x32, 0x00

	.short 0x0081, 0x0060, 0x0086, 0x00F1, 0x00A1, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	.short SPECIES_FERALIGATR
	.short ITEM_LUM_BERRY
	.short MOVE_DRAGON_DANCE, MOVE_WATERFALL, MOVE_ICE_PUNCH, MOVE_CRUNCH
	.word 0x11111111
	.word 0x00000011
	.word (20 << 0) | (20 << 5) | (20 << 10) | (20 << 15) | (20 << 20) | (20 << 25)
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x43, 0x00, 0x32, 0x00

	.short 0x005B, 0x00F1, 0x0071, 0x0055, 0x009C, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	.short SPECIES_NONE
	.short ITEM_NONE
	.short MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.word 0x00000000
	.word 0x00000000
	.word (0 << 0) | (0 << 5) | (0 << 10) | (0 << 15) | (0 << 20) | (0 << 25)
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00

	.short 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	.short SPECIES_NONE
	.short ITEM_NONE
	.short MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.word 0x00000000
	.word 0x00000000
	.word (0 << 0) | (0 << 5) | (0 << 10) | (0 << 15) | (0 << 20) | (0 << 25)
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00

	.short 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF

	.short SPECIES_NONE
	.short ITEM_NONE
	.short MOVE_NONE, MOVE_NONE, MOVE_NONE, MOVE_NONE
	.word 0x00000000
	.word 0x00000000
	.word (0 << 0) | (0 << 5) | (0 << 10) | (0 << 15) | (0 << 20) | (0 << 25)
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00

	.short 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF
	; 0x02259F20
