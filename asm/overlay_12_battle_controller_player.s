#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "overlay_12_battle_controller_player.inc"
	.include "global.inc"

	.text
    .public BattleControllerPlayer_GetBattleMon
    .public BattleControllerPlayer_StartEncounter
    .public BattleControllerPlayer_TrainerMessage
    .public BattleControllerPlayer_PokemonAppear
    .public BattleControllerPlayer_SelectionScreenInit
    .public BattleControllerPlayer_SelectionScreenInput
    .public ov12_02249190
    .public ov12_0224930C
    .public ov12_02249460
    .public BattleControllerPlayer_UpdateFieldCondition
    .public BattleControllerPlayer_UpdateMonCondition
    .public BattleControllerPlayer_UpdateFieldConditionExtra
    .public BattleControllerPlayer_TurnEnd
    .public BattleControllerPlayer_FightInput
    .public BattleControllerPlayer_ItemInput
    .public BattleControllerPlayer_PokemonInput
    .public BattleControllerPlayer_RunInput
    .public BattleControllerPlayer_SafariThrowBall
    .public BattleControllerPlayer_SafariThrowMud
    .public BattleControllerPlayer_SafariRun
    .public BattleControllerPlayer_SafariWatching
    .public BattleControllerPlayer_CatchingContestThrowBall
    .public TryDisobedience
    .public ov12_0224B1FC
    .public ov12_0224B398
    .public ov12_0224B498
    .public ov12_0224B528
    .public ov12_0224BC2C
    .public ov12_0224BCA4
    .public BattleSystem_CheckMoveHit
    .public BattleSystem_CheckMoveEffect
    .public ov12_0224C204
    .public BattleControllerPlayer_RunScript
    .public ov12_0224C38C
    .public ov12_0224C4D8
    .public ov12_0224C5C8
    .public ov12_0224C5F8
    .public ov12_0224C678

	thumb_func_start ov12_0224C690
ov12_0224C690: ; 0x0224C690
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r2, _0224C9BC ; =0x0000216C
	add r4, r1, #0
	ldr r1, [r4, r2]
	add r7, r0, #0
	mov r0, #0x20
	tst r0, r1
	beq _0224C6B8
	ldr r0, [r4, #0x6c]
	mov r1, #0xc0
	add r3, r0, #0
	mul r3, r1
	ldr r0, _0224C9C0 ; =0x00002D90
	add r3, r4, r3
	ldr r0, [r3, r0]
	sub r1, #0xc1
	mul r1, r0
	sub r2, #0x28
	str r1, [r4, r2]
_0224C6B8:
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0224C6C2
	b _0224CA90
_0224C6C2:
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	bl GetBattlerHeldItemEffect
	str r0, [sp, #4]
	ldr r1, [r4, #0x6c]
	add r0, r4, #0
	mov r2, #0
	bl GetHeldItemModifier
	str r0, [sp]
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r0, [r4, r0]
	cmp r0, #0
	blt _0224C6E4
	bl GF_AssertFail
_0224C6E4:
	ldr r1, [r4, #0x64]
	add r0, r7, #0
	bl BattleSystem_GetFieldSide
	add r5, r0, #0
	ldr r1, [r4, #0x6c]
	add r0, r7, #0
	bl BattleSystem_GetFieldSide
	cmp r5, r0
	bne _0224C706
	ldr r1, [r4, #0x64]
	add r0, r7, #0
	mov r2, #0
	mov r3, #0x62
	bl BattleController_EmitIncrementGameStat
_0224C706:
	ldr r0, [r4, #0x6c]
	ldr r2, [r4, #0x64]
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, _0224C9C8 ; =0x000030F4
	str r2, [r1, r0]
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	add r6, r1, #0
	mul r6, r0
	mov r2, #1
	ldr r1, _0224C9CC ; =0x00002DB0
	add r5, r4, r6
	ldr r3, [r5, r1]
	lsl r2, r2, #0x18
	tst r2, r3
	beq _0224C7E0
	ldr r2, _0224C9C4 ; =0x00002144
	ldr r2, [r4, r2]
	cmp r2, #0
	bge _0224C7E0
	add r3, r1, #0
	add r3, #0x30
	ldr r3, [r5, r3]
	add r5, r2, r3
	cmp r5, #0
	bgt _0224C782
	mov r2, #0xbb
	lsl r2, r2, #2
	add r6, r4, r2
	ldr r2, [r4, #0x64]
	mov r5, #0x1c
	mul r5, r2
	ldr r2, [r6, r5]
	sub r2, r2, r3
	str r2, [r6, r5]
	ldr r5, [r4, #0x6c]
	add r3, r4, r1
	add r2, r5, #0
	mul r2, r0
	ldr r6, [r3, r2]
	ldr r5, _0224C9D0 ; =0xFEFFFFFF
	and r5, r6
	str r5, [r3, r2]
	ldr r2, [r4, #0x6c]
	add r3, r2, #0
	add r2, r1, #0
	mul r3, r0
	add r3, r4, r3
	add r2, #0x30
	ldr r2, [r3, r2]
	add r1, #0x30
	neg r3, r2
	ldr r2, _0224C9C4 ; =0x00002144
	add r2, r2, #4
	str r3, [r4, r2]
	ldr r2, [r4, #0x6c]
	mov r3, #0
	mul r0, r2
	add r0, r4, r0
	str r3, [r0, r1]
	b _0224C7AE
_0224C782:
	mov r3, #0xbb
	lsl r3, r3, #2
	add r6, r4, r3
	ldr r3, [r4, #0x64]
	mov r5, #0x1c
	mul r5, r3
	ldr r3, [r6, r5]
	add r1, #0x30
	add r2, r3, r2
	str r2, [r6, r5]
	ldr r2, [r4, #0x6c]
	add r1, r4, r1
	mul r0, r2
	ldr r2, _0224C9C4 ; =0x00002144
	ldr r3, [r1, r0]
	ldr r2, [r4, r2]
	add r2, r3, r2
	str r2, [r1, r0]
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
_0224C7AE:
	mov r0, #0xba
	lsl r0, r0, #2
	ldr r2, [r4, #0x6c]
	add r1, r4, r0
	add r0, r2, #0
	mov r3, #0x1c
	mul r0, r3
	ldr r5, [r1, r0]
	mov r2, #8
	orr r2, r5
	str r2, [r1, r0]
	ldr r0, [r4, #0x6c]
	add r3, #0xfc
	str r0, [r4, r3]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x5a
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x1d
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0224C7E0:
	ldr r0, _0224C9D4 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224C9D8 ; =0x000003DE
	ldrh r0, [r1, r0]
	cmp r0, #0x65
	bne _0224C806
	ldr r0, _0224C9DC ; =0x00002D8C
	add r1, r4, r6
	ldr r2, [r1, r0]
	ldr r0, _0224C9C4 ; =0x00002144
	ldr r1, [r4, r0]
	add r1, r1, r2
	cmp r1, #0
	bgt _0224C806
	sub r1, r2, #1
	neg r1, r1
	str r1, [r4, r0]
_0224C806:
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #0x75
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1f
	bne _0224C874
	ldr r0, [sp, #4]
	cmp r0, #0x41
	bne _0224C846
	add r0, r7, #0
	bl BattleSystem_Random
	mov r1, #0x64
	bl _s32_div_f
	ldr r0, [sp]
	cmp r1, r0
	bge _0224C846
	ldr r2, [r4, #0x6c]
	mov r0, #0xb5
	lsl r0, r0, #2
	mov r1, #0x1c
	add r3, r2, #0
	mul r3, r1
	add r0, r4, r0
	ldr r2, [r0, r3]
	mov r1, #0x20
	orr r1, r2
	str r1, [r0, r3]
_0224C846:
	ldr r0, [sp, #4]
	cmp r0, #0x67
	bne _0224C874
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r3, r4, r0
	ldr r0, _0224C9DC ; =0x00002D8C
	ldr r2, [r3, r0]
	add r0, r0, #4
	ldr r0, [r3, r0]
	cmp r2, r0
	bne _0224C874
	mov r0, #0xb5
	lsl r0, r0, #2
	add r3, r1, #0
	mov r2, #0x1c
	add r0, r4, r0
	mul r3, r2
	ldr r2, [r0, r3]
	mov r1, #0x20
	orr r1, r2
	str r1, [r0, r3]
_0224C874:
	ldr r0, [r4, #0x6c]
	lsl r1, r0, #6
	add r2, r4, r1
	mov r1, #0x75
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #0x16
	lsr r1, r1, #0x1f
	bne _0224C898
	mov r1, #0x1c
	mul r1, r0
	add r2, r4, r1
	mov r1, #0xb5
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1f
	beq _0224C8E2
_0224C898:
	mov r1, #0xc0
	mul r1, r0
	ldr r0, _0224C9DC ; =0x00002D8C
	add r1, r4, r1
	ldr r2, _0224C9C4 ; =0x00002144
	ldr r1, [r1, r0]
	ldr r0, [r4, r2]
	add r0, r0, r1
	cmp r0, #0
	bgt _0224C8E2
	sub r0, r1, #1
	neg r0, r0
	str r0, [r4, r2]
	ldr r0, [r4, #0x6c]
	mov r1, #0x75
	lsl r0, r0, #6
	add r0, r4, r0
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1f
	beq _0224C8D4
	add r0, r2, #0
	add r0, #0x28
	ldr r1, [r4, r0]
	mov r0, #0x80
	orr r0, r1
	add r2, #0x28
	str r0, [r4, r2]
	b _0224C8E2
_0224C8D4:
	add r0, r2, #0
	add r0, #0x28
	ldr r0, [r4, r0]
	sub r1, #0xd4
	orr r0, r1
	add r2, #0x28
	str r0, [r4, r2]
_0224C8E2:
	ldr r1, [r4, #0x6c]
	ldr r0, _0224C9E0 ; =0x000030E4
	lsl r3, r1, #2
	ldr r1, _0224C9C4 ; =0x00002144
	add r0, r4, r0
	ldr r2, [r0, r3]
	ldr r1, [r4, r1]
	add r1, r2, r1
	str r1, [r0, r3]
	ldr r0, _0224C9E4 ; =0x00002DBC
	ldr r1, [r4, #0x6c]
	add r3, r4, r0
	mov r0, #0xc0
	add r2, r1, #0
	mul r2, r0
	ldrb r0, [r3, r2]
	cmp r0, #0xff
	bhs _0224C90A
	add r0, r0, #1
	strb r0, [r3, r2]
_0224C90A:
	ldr r0, _0224C9D4 ; =0x00003044
	mov r1, #0x3e
	ldr r0, [r4, r0]
	lsl r1, r1, #4
	lsl r0, r0, #4
	add r0, r4, r0
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0224C978
	ldr r1, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	lsl r1, r1, #6
	add r2, r4, r1
	ldr r1, [r4, #0x64]
	ldr r0, [r4, r0]
	lsl r1, r1, #2
	add r2, r2, r1
	mov r1, #0x76
	lsl r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r4, #0x6c]
	ldr r2, [r4, #0x64]
	lsl r0, r0, #6
	add r0, r4, r0
	add r1, #0x10
	str r2, [r0, r1]
	ldr r0, [r4, #0x64]
	bl MaskOfFlagNo
	mov r1, #0x7b
	ldr r3, [r4, #0x6c]
	lsl r1, r1, #2
	add r2, r4, r1
	lsl r5, r3, #6
	ldr r3, [r2, r5]
	orr r0, r3
	str r0, [r2, r5]
	ldr r2, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	add r5, r2, #0
	add r2, r1, #0
	mov r3, #0x1c
	mul r5, r3
	ldr r0, [r4, r0]
	add r5, r4, r5
	add r2, #0xec
	str r0, [r5, r2]
	ldr r0, [r4, #0x6c]
	ldr r5, [r4, #0x64]
	add r2, r0, #0
	mul r2, r3
	add r0, r4, r2
	add r1, #0xf0
	str r5, [r0, r1]
	b _0224CA06
_0224C978:
	cmp r0, #1
	bne _0224CA06
	ldr r2, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	lsl r2, r2, #6
	add r3, r4, r2
	ldr r2, [r4, #0x64]
	ldr r0, [r4, r0]
	lsl r2, r2, #2
	add r2, r3, r2
	lsr r1, r1, #1
	str r0, [r2, r1]
	ldr r0, [r4, #0x6c]
	ldr r2, [r4, #0x64]
	lsl r0, r0, #6
	add r1, r4, r0
	mov r0, #2
	lsl r0, r0, #8
	str r2, [r1, r0]
	ldr r0, [r4, #0x64]
	bl MaskOfFlagNo
	mov r1, #0x81
	ldr r3, [r4, #0x6c]
	lsl r1, r1, #2
	add r2, r4, r1
	lsl r5, r3, #6
	ldr r3, [r2, r5]
	orr r0, r3
	str r0, [r2, r5]
	ldr r2, [r4, #0x6c]
	ldr r0, _0224C9C4 ; =0x00002144
	b _0224C9E8
	nop
_0224C9BC: .word 0x0000216C
_0224C9C0: .word 0x00002D90
_0224C9C4: .word 0x00002144
_0224C9C8: .word 0x000030F4
_0224C9CC: .word 0x00002DB0
_0224C9D0: .word 0xFEFFFFFF
_0224C9D4: .word 0x00003044
_0224C9D8: .word 0x000003DE
_0224C9DC: .word 0x00002D8C
_0224C9E0: .word 0x000030E4
_0224C9E4: .word 0x00002DBC
_0224C9E8:
	add r5, r2, #0
	add r2, r1, #0
	mov r3, #0x1c
	mul r5, r3
	ldr r0, [r4, r0]
	add r5, r4, r5
	add r2, #0xdc
	str r0, [r5, r2]
	ldr r0, [r4, #0x6c]
	ldr r5, [r4, #0x64]
	add r2, r0, #0
	mul r2, r3
	add r0, r4, r2
	add r1, #0xe0
	str r5, [r0, r1]
_0224CA06:
	ldr r1, [r4, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0224CA98 ; =0x00002D8C
	ldr r2, [r1, r0]
	ldr r0, _0224CA9C ; =0x00002144
	ldr r1, [r4, r0]
	add r0, r1, r2
	cmp r0, #0
	bgt _0224CA32
	mov r0, #0xbb
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r3, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r3
	ldr r3, [r1, r0]
	neg r2, r2
	add r2, r3, r2
	str r2, [r1, r0]
	b _0224CA46
_0224CA32:
	ldr r3, [r4, #0x64]
	mov r0, #0xbb
	lsl r0, r0, #2
	mov r2, #0x1c
	add r5, r3, #0
	add r0, r4, r0
	mul r5, r2
	ldr r2, [r0, r5]
	add r1, r2, r1
	str r1, [r0, r5]
_0224CA46:
	ldr r3, _0224CA9C ; =0x00002144
	ldr r0, [r4, #0x6c]
	mov r2, #0x82
	lsl r0, r0, #6
	ldr r1, [r4, r3]
	add r0, r4, r0
	lsl r2, r2, #2
	str r1, [r0, r2]
	ldr r1, [r4, #0x6c]
	ldr r0, [r4, #0x64]
	lsl r1, r1, #6
	add r5, r4, r1
	add r1, r2, #4
	str r0, [r5, r1]
	ldr r0, [r4, #0x6c]
	sub r2, #0xf0
	str r0, [r4, r2]
	ldr r0, [r4, r3]
	add r3, #0x18
	str r0, [r4, r3]
	add r0, r4, #0
	mov r1, #1
	mov r2, #2
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x1d
	str r0, [r4, #0xc]
	ldr r1, _0224CAA0 ; =0x0000213C
	mov r0, #2
	ldr r2, [r4, r1]
	lsl r0, r0, #0xc
	orr r0, r2
	add sp, #8
	str r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0224CA90:
	mov r0, #0x1d
	str r0, [r4, #8]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224CA98: .word 0x00002D8C
_0224CA9C: .word 0x00002144
_0224CAA0: .word 0x0000213C
	thumb_func_end ov12_0224C690

	thumb_func_start ov12_0224CAA4
ov12_0224CAA4: ; 0x0224CAA4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r2, [r4, #0x38]
	add r5, r0, #0
	cmp r2, #0
	beq _0224CAB8
	cmp r2, #1
	beq _0224CB96
	b _0224CC6C
_0224CAB8:
	ldr r2, [r4, #0x3c]
	cmp r2, #6
	bls _0224CAC0
	b _0224CC6C
_0224CAC0:
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0224CACC: ; jump table
	.short _0224CADA - _0224CACC - 2 ; case 0
	.short _0224CAE6 - _0224CACC - 2 ; case 1
	.short _0224CAF8 - _0224CACC - 2 ; case 2
	.short _0224CB2C - _0224CACC - 2 ; case 3
	.short _0224CB48 - _0224CACC - 2 ; case 4
	.short _0224CB56 - _0224CACC - 2 ; case 5
	.short _0224CB80 - _0224CACC - 2 ; case 6
_0224CADA:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DF7C
	cmp r0, #1
	beq _0224CB54
_0224CAE6:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224DF98
	cmp r0, #1
	beq _0224CB54
_0224CAF8:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #0xc
	bl ov12_02250490
	cmp r0, #1
	bne _0224CB2C
	ldr r0, _0224CC78 ; =0x0000216C
	ldr r1, [r4, r0]
	ldr r0, _0224CC7C ; =0x001FD849
	tst r0, r1
	bne _0224CB2C
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CB2C:
	ldr r0, [r4, #0x3c]
	ldr r2, _0224CC80 ; =0x00000125
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CB48:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DFEC
	cmp r0, #1
	bne _0224CB56
_0224CB54:
	b _0224CC74
_0224CB56:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #8
	bl CheckAbilityEffectOnHit
	cmp r0, #1
	bne _0224CB80
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CB80:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224E078
	cmp r0, #1
	bne _0224CC6C
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0224CB96:
	ldr r2, [r4, #0x3c]
	cmp r2, #6
	bhi _0224CC6C
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0224CBA8: ; jump table
	.short _0224CBB6 - _0224CBA8 - 2 ; case 0
	.short _0224CBC2 - _0224CBA8 - 2 ; case 1
	.short _0224CBF6 - _0224CBA8 - 2 ; case 2
	.short _0224CC12 - _0224CBA8 - 2 ; case 3
	.short _0224CC1E - _0224CBA8 - 2 ; case 4
	.short _0224CC48 - _0224CBA8 - 2 ; case 5
	.short _0224CC5A - _0224CBA8 - 2 ; case 6
_0224CBB6:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DF7C
	cmp r0, #1
	beq _0224CC74
_0224CBC2:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #4
	bl ov12_02250490
	cmp r0, #1
	bne _0224CBF6
	ldr r0, _0224CC78 ; =0x0000216C
	ldr r1, [r4, r0]
	ldr r0, _0224CC7C ; =0x001FD849
	tst r0, r1
	bne _0224CBF6
	ldr r2, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CBF6:
	ldr r0, [r4, #0x3c]
	ldr r2, _0224CC80 ; =0x00000125
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CC12:
	add r2, r2, #1
	str r2, [r4, #0x3c]
	bl ov12_0224DFEC
	cmp r0, #1
	beq _0224CC74
_0224CC1E:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	add r2, sp, #0
	bl CheckAbilityEffectOnHit
	cmp r0, #1
	bne _0224CC48
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224CC48:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224DF98
	cmp r0, #1
	beq _0224CC74
_0224CC5A:
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov12_0224E078
	cmp r0, #1
	beq _0224CC74
_0224CC6C:
	mov r0, #0
	str r0, [r4, #0x3c]
	mov r0, #0x1f
	str r0, [r4, #8]
_0224CC74:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224CC78: .word 0x0000216C
_0224CC7C: .word 0x001FD849
_0224CC80: .word 0x00000125
	thumb_func_end ov12_0224CAA4

	thumb_func_start ov12_0224CC84
ov12_0224CC84: ; 0x0224CC84
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224CC84

	thumb_func_start ov12_0224CC88
ov12_0224CC88: ; 0x0224CC88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r1, [r4, #0x40]
	add r6, r0, #0
	cmp r1, #7
	bls _0224CC98
	b _0224CED2
_0224CC98:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224CCA4: ; jump table
	.short _0224CCB4 - _0224CCA4 - 2 ; case 0
	.short _0224CD2E - _0224CCA4 - 2 ; case 1
	.short _0224CD42 - _0224CCA4 - 2 ; case 2
	.short _0224CD68 - _0224CCA4 - 2 ; case 3
	.short _0224CD7C - _0224CCA4 - 2 ; case 4
	.short _0224CD96 - _0224CCA4 - 2 ; case 5
	.short _0224CDC0 - _0224CCA4 - 2 ; case 6
	.short _0224CE54 - _0224CCA4 - 2 ; case 7
_0224CCB4:
	mov r1, #0
	ldr r7, [r4, #0x44]
	str r1, [sp, #4]
	bl BattleSystem_GetMaxBattlers
	cmp r7, r0
	bge _0224CD24
	add r5, r4, #0
	add r5, #0x44
_0224CCC6:
	mov r0, #0xc0
	mul r0, r7
	mov r1, #0xb7
	add r0, r4, r0
	lsl r1, r1, #6
	ldr r2, [r0, r1]
	ldr r1, _0224CEE0 ; =0x200400C0
	tst r1, r2
	bne _0224CD0C
	ldr r1, _0224CEE4 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224CEE0 ; =0x200400C0
	tst r1, r2
	beq _0224CD0C
	ldr r1, _0224CEE4 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224CEE8 ; =0xDFFBFF3F
	and r2, r1
	ldr r1, _0224CEE4 ; =0x00002DC4
	str r2, [r0, r1]
	ldr r2, _0224CEEC ; =0x0000011F
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x46
	ldr r1, [r4, #0x44]
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp, #4]
_0224CD0C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0224CD94
	ldr r7, [r4, #0x44]
	add r0, r6, #0
	bl BattleSystem_GetMaxBattlers
	cmp r7, r0
	blt _0224CCC6
_0224CD24:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	mov r0, #0
	str r0, [r4, #0x44]
_0224CD2E:
	ldr r0, [r4, #0x40]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl TrySyncronizeStatus
	cmp r0, #1
	beq _0224CD94
_0224CD42:
	add r0, r6, #0
	add r1, r4, #0
	bl TryAbilityOnEntry
	add r2, r0, #0
	beq _0224CD62
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224CD62:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
_0224CD68:
	ldr r0, [r4, #0x40]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r2, [r4, #0x64]
	add r0, r6, #0
	bl TryUseHeldItem
	cmp r0, #1
	beq _0224CD94
_0224CD7C:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r2, [r4, #0x6c]
	cmp r2, #0xff
	beq _0224CD96
	add r0, r6, #0
	add r1, r4, #0
	bl TryUseHeldItem
	cmp r0, #1
	bne _0224CD96
_0224CD94:
	b _0224CEDC
_0224CD96:
	ldr r0, [r4, #0x40]
	add r1, r4, #0
	add r0, r0, #1
	str r0, [r4, #0x40]
	add r0, r6, #0
	add r2, sp, #0xc
	bl CheckItemEffectOnHit
	cmp r0, #1
	bne _0224CDC0
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224CDC0:
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x60
	bne _0224CDD0
	mov r2, #0
	b _0224CDE4
_0224CDD0:
	ldr r0, _0224CEF0 ; =0x00002160
	ldr r2, [r4, r0]
	cmp r2, #0
	bne _0224CDE4
	ldr r0, _0224CEF4 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224CEF8 ; =0x000003E2
	ldrb r2, [r1, r0]
_0224CDE4:
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	ldr r3, [r4, #0x6c]
	cmp r3, #0xff
	beq _0224CE54
	mov r0, #0xc0
	add r5, r3, #0
	mul r5, r0
	ldr r0, _0224CEFC ; =0x00002DAC
	add r1, r4, r5
	ldr r1, [r1, r0]
	mov r0, #0x20
	tst r1, r0
	beq _0224CE54
	ldr r1, _0224CF00 ; =0x0000216C
	lsl r0, r0, #9
	ldr r1, [r4, r1]
	tst r0, r1
	bne _0224CE54
	ldr r0, [r4, #0x64]
	cmp r3, r0
	beq _0224CE54
	mov r0, #0x1c
	mul r0, r3
	add r7, r4, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	cmp r1, #0
	bne _0224CE2A
	add r0, #8
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _0224CE54
_0224CE2A:
	ldr r0, _0224CF04 ; =0x00002D8C
	add r1, r4, r5
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224CE54
	cmp r2, #0xa
	bne _0224CE54
	mov r0, #0x46
	lsl r0, r0, #2
	str r3, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x1d
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	add sp, #0x10
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_0224CE54:
	mov r0, #0
	str r0, [sp]
	ldr r7, [r4, #0x44]
	add r0, r6, #0
	bl BattleSystem_GetMaxBattlers
	cmp r7, r0
	bge _0224CEC2
	add r5, r4, #0
	add r5, #0x44
_0224CE68:
	ldr r0, _0224CF08 ; =0x000021EC
	add r1, r4, r7
	ldrb r7, [r1, r0]
	add r0, r7, #0
	bl MaskOfFlagNo
	ldr r1, _0224CF0C ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	ldr r0, [r5]
	beq _0224CE84
	add r0, r0, #1
	str r0, [r5]
	b _0224CEB6
_0224CE84:
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	add r3, sp, #8
	bl CheckUseHeldItem
	cmp r0, #1
	bne _0224CEB6
	mov r0, #0x46
	lsl r0, r0, #2
	str r7, [r4, r0]
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	str r0, [sp]
	b _0224CEC2
_0224CEB6:
	ldr r7, [r4, #0x44]
	add r0, r6, #0
	bl BattleSystem_GetMaxBattlers
	cmp r7, r0
	blt _0224CE68
_0224CEC2:
	ldr r0, [sp]
	cmp r0, #0
	bne _0224CED2
	ldr r0, [r4, #0x40]
	add r0, r0, #1
	str r0, [r4, #0x40]
	mov r0, #0
	str r0, [r4, #0x44]
_0224CED2:
	mov r0, #0
	str r0, [r4, #0x40]
	str r0, [r4, #0x44]
	mov r0, #0x20
	str r0, [r4, #8]
_0224CEDC:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224CEE0: .word 0x200400C0
_0224CEE4: .word 0x00002DC4
_0224CEE8: .word 0xDFFBFF3F
_0224CEEC: .word 0x0000011F
_0224CEF0: .word 0x00002160
_0224CEF4: .word 0x00003044
_0224CEF8: .word 0x000003E2
_0224CEFC: .word 0x00002DAC
_0224CF00: .word 0x0000216C
_0224CF04: .word 0x00002D8C
_0224CF08: .word 0x000021EC
_0224CF0C: .word 0x00003108
	thumb_func_end ov12_0224CC88

	thumb_func_start ov12_0224CF10
ov12_0224CF10: ; 0x0224CF10
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224CF10

	thumb_func_start ov12_0224CF14
ov12_0224CF14: ; 0x0224CF14
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _0224D000 ; =0x0000217D
	add r4, r1, #0
	ldrb r2, [r4, r6]
	str r0, [sp]
	cmp r2, #0
	beq _0224CFFA
	ldr r3, [r4, #0x74]
	mov ip, r3
	cmp r3, #0xff
	bne _0224CFAC
	ldr r3, [r4, #0x64]
	mov r7, #0xc0
	add r5, r3, #0
	mul r5, r7
	ldr r3, _0224D004 ; =0x00002DAC
	add r5, r4, r5
	ldr r5, [r5, r3]
	mov r3, #7
	tst r3, r5
	bne _0224CFAC
	add r3, r6, #0
	sub r3, #0x11
	ldr r5, [r4, r3]
	mov r3, #1
	lsl r3, r3, #0xe
	tst r3, r5
	bne _0224CFAC
	sub r2, r6, #1
	ldrb r2, [r4, r2]
	sub r3, r2, #1
	sub r2, r6, #1
	strb r3, [r4, r2]
	ldrb r2, [r4, r2]
	cmp r2, #0
	beq _0224CF92
	mov r3, #1
	add r2, r6, #3
	str r3, [r4, r2]
	bl ov12_02252D14
	add r1, r6, #0
	sub r1, #0x41
	ldr r2, [r4, r1]
	ldr r0, _0224D008 ; =0xFFFFBFFF
	and r0, r2
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x4c
	ldr r0, [r4, r0]
	add r1, #0x48
	str r0, [r4, r1]
	ldr r2, _0224D00C ; =0x00003044
	add r0, r4, #0
	ldr r2, [r4, r2]
	mov r1, #0
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x18
	str r0, [r4, #0xc]
	b _0224CFF2
_0224CF92:
	ldrb r0, [r4, r6]
	add r7, #0x70
	mov r1, #1
	str r0, [r4, r7]
	add r0, r4, #0
	mov r2, #0x11
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x22
	str r0, [r4, #0xc]
	b _0224CFF2
_0224CFAC:
	mov r0, ip
	cmp r0, #0xff
	bne _0224CFC6
	ldr r0, [r4, #0x64]
	mov r1, #0xc0
	add r3, r0, #0
	mul r3, r1
	ldr r0, _0224D004 ; =0x00002DAC
	add r3, r4, r3
	ldr r3, [r3, r0]
	mov r0, #7
	tst r0, r3
	beq _0224CFD6
_0224CFC6:
	ldr r0, _0224D010 ; =0x0000217C
	ldrb r0, [r4, r0]
	sub r0, r2, r0
	add r1, r0, #1
	mov r0, #0x13
	lsl r0, r0, #4
	str r1, [r4, r0]
	b _0224CFE0
_0224CFD6:
	ldr r0, _0224D010 ; =0x0000217C
	add r1, #0x70
	ldrb r0, [r4, r0]
	sub r0, r2, r0
	str r0, [r4, r1]
_0224CFE0:
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x11
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x22
	str r0, [r4, #0xc]
_0224CFF2:
	ldr r0, [sp]
	bl ov12_022642F0
	pop {r3, r4, r5, r6, r7, pc}
_0224CFFA:
	mov r0, #0x22
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D000: .word 0x0000217D
_0224D004: .word 0x00002DAC
_0224D008: .word 0xFFFFBFFF
_0224D00C: .word 0x00003044
_0224D010: .word 0x0000217C
	thumb_func_end ov12_0224CF14

	thumb_func_start ov12_0224D014
ov12_0224D014: ; 0x0224D014
	push {r3, lr}
	ldr r0, _0224D038 ; =0x0000213C
	ldr r2, [r1, r0]
	mov r0, #0xf
	lsl r0, r0, #0x18
	tst r0, r2
	beq _0224D030
	add r0, r1, #0
	mov r1, #0x22
	add r2, r1, #0
	mov r3, #0
	bl ov12_0224DC74
	pop {r3, pc}
_0224D030:
	mov r0, #0x23
	str r0, [r1, #8]
	pop {r3, pc}
	nop
_0224D038: .word 0x0000213C
	thumb_func_end ov12_0224D014

	thumb_func_start ov12_0224D03C
ov12_0224D03C: ; 0x0224D03C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0x85
	lsl r1, r1, #6
	add r5, r0, #0
	ldr r2, [r4, r1]
	mov r0, #8
	tst r0, r2
	beq _0224D060
	mov r0, #8
	bic r2, r0
	str r2, [r4, r1]
	ldr r0, [r4, #0x64]
	str r0, [r4, #0x6c]
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	str r0, [r4, #0x64]
_0224D060:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224DD74
	ldr r0, _0224D1C0 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224D1C4 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #4
	bne _0224D12C
	ldr r0, _0224D1C8 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	tst r0, r1
	bne _0224D12C
	add r0, r5, #0
	bl BattleSystem_GetMaxBattlers
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r2, [r4, r1]
	cmp r2, r0
	bge _0224D12C
	mov r2, #0xd
	add r0, r1, #6
	str r2, [r4, r0]
	add r0, r5, #0
	bl BattleSystem_GetMaxBattlers
	ldr r1, [r4, #0x64]
	add r0, r5, #0
	bl BattleSystem_GetOpponentData
	bl ov12_02261258
	mov r1, #1
	add r7, r0, #0
	and r7, r1
_0224D0AE:
	ldr r1, _0224D1CC ; =0x0000217E
	ldr r0, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	add r2, r1, #1
	ldr r1, _0224D1CC ; =0x0000217E
	strb r2, [r4, r1]
	add r1, r4, r0
	ldr r0, _0224D1D0 ; =0x000021EC
	ldrb r6, [r1, r0]
	add r0, r6, #0
	bl MaskOfFlagNo
	ldr r1, _0224D1D4 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	bne _0224D116
	mov r0, #0xc0
	mul r0, r6
	add r1, r4, r0
	ldr r0, _0224D1D8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224D116
	add r0, r5, #0
	add r1, r6, #0
	bl BattleSystem_GetOpponentData
	str r0, [sp]
	cmp r7, #0
	beq _0224D0F6
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224D106
_0224D0F6:
	cmp r7, #0
	bne _0224D116
	ldr r0, [sp]
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224D116
_0224D106:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252D14
	str r6, [r4, #0x6c]
	mov r0, #0x17
	str r0, [r4, #8]
	b _0224D124
_0224D116:
	add r0, r5, #0
	bl BattleSystem_GetMaxBattlers
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r1]
	cmp r1, r0
	blt _0224D0AE
_0224D124:
	add r0, r5, #0
	bl ov12_022642F0
	pop {r3, r4, r5, r6, r7, pc}
_0224D12C:
	ldr r0, _0224D1C0 ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	ldr r0, _0224D1C4 ; =0x000003E6
	ldrh r0, [r1, r0]
	cmp r0, #8
	bne _0224D1BA
	ldr r0, _0224D1C8 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	tst r0, r1
	bne _0224D1BA
	add r0, r5, #0
	bl BattleSystem_GetMaxBattlers
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r2, [r4, r1]
	cmp r2, r0
	bge _0224D1BA
	mov r2, #0xd
	add r0, r1, #6
	str r2, [r4, r0]
	add r0, r5, #0
	bl BattleSystem_GetMaxBattlers
	ldr r7, _0224D1CC ; =0x0000217E
_0224D162:
	ldr r0, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r0]
	ldrb r0, [r4, r7]
	add r1, r4, r1
	add r0, r0, #1
	strb r0, [r4, r7]
	ldr r0, _0224D1D0 ; =0x000021EC
	ldrb r6, [r1, r0]
	add r0, r6, #0
	bl MaskOfFlagNo
	ldr r1, _0224D1D4 ; =0x00003108
	ldrb r1, [r4, r1]
	tst r0, r1
	bne _0224D1A4
	mov r0, #0xc0
	mul r0, r6
	add r1, r4, r0
	ldr r0, _0224D1D8 ; =0x00002D8C
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0224D1A4
	ldr r0, [r4, #0x64]
	cmp r6, r0
	beq _0224D1A4
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02252D14
	str r6, [r4, #0x6c]
	mov r0, #0x17
	str r0, [r4, #8]
	b _0224D1B2
_0224D1A4:
	add r0, r5, #0
	bl BattleSystem_GetMaxBattlers
	ldr r1, _0224D1CC ; =0x0000217E
	ldrb r1, [r4, r1]
	cmp r1, r0
	blt _0224D162
_0224D1B2:
	add r0, r5, #0
	bl ov12_022642F0
	pop {r3, r4, r5, r6, r7, pc}
_0224D1BA:
	mov r0, #0x24
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D1C0: .word 0x00003044
_0224D1C4: .word 0x000003E6
_0224D1C8: .word 0x0000213C
_0224D1CC: .word 0x0000217E
_0224D1D0: .word 0x000021EC
_0224D1D4: .word 0x00003108
_0224D1D8: .word 0x00002D8C
	thumb_func_end ov12_0224D03C

	thumb_func_start ov12_0224D1DC
ov12_0224D1DC: ; 0x0224D1DC
	push {r4, lr}
	ldr r0, _0224D218 ; =0x0000213C
	add r4, r1, #0
	ldr r1, [r4, r0]
	mov r0, #0xf
	lsl r0, r0, #0x1c
	and r0, r1
	beq _0224D212
	lsr r0, r0, #0x1c
	bl LowestFlagNo
	str r0, [r4, #0x74]
	ldr r1, _0224D218 ; =0x0000213C
	ldr r0, _0224D21C ; =0x0FFFFFFF
	ldr r2, [r4, r1]
	and r0, r2
	str r0, [r4, r1]
	ldr r2, _0224D220 ; =0x00000115
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x25
	str r0, [r4, #0xc]
	pop {r4, pc}
_0224D212:
	mov r0, #0x25
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
_0224D218: .word 0x0000213C
_0224D21C: .word 0x0FFFFFFF
_0224D220: .word 0x00000115
	thumb_func_end ov12_0224D1DC

	thumb_func_start ov12_0224D224
ov12_0224D224: ; 0x0224D224
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0224E1BC
	cmp r0, #1
	beq _0224D234
	mov r0, #0x27
	str r0, [r4, #8]
_0224D234:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D224

	thumb_func_start ov12_0224D238
ov12_0224D238: ; 0x0224D238
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224D238

	thumb_func_start ov12_0224D23C
ov12_0224D23C: ; 0x0224D23C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x64]
	add r5, r0, #0
	add r0, r4, #0
	bl GetBattlerHeldItemEffect
	ldr r1, _0224D350 ; =0x0000213C
	lsl r0, r0, #0x18
	ldr r3, [r4, r1]
	mov r2, #0x20
	lsr r0, r0, #0x18
	tst r2, r3
	bne _0224D262
	add r1, r1, #4
	ldr r2, [r4, r1]
	mov r1, #4
	tst r1, r2
	beq _0224D2B6
_0224D262:
	cmp r0, #0x37
	beq _0224D26E
	cmp r0, #0x73
	beq _0224D26E
	cmp r0, #0x7d
	bne _0224D2A8
_0224D26E:
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0xa5
	beq _0224D2B6
	ldr r1, _0224D354 ; =0x00000171
	cmp r0, r1
	bne _0224D28A
	mov r1, #0x85
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	mov r1, #0x10
	tst r1, r2
	bne _0224D2B6
_0224D28A:
	cmp r0, #0xe2
	bne _0224D29A
	mov r1, #0x85
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	mov r1, #0x40
	tst r1, r2
	bne _0224D2B6
_0224D29A:
	ldr r2, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _0224D358 ; =0x00002DF8
	strh r0, [r2, r1]
	b _0224D2B6
_0224D2A8:
	ldr r2, [r4, #0x64]
	mov r1, #0xc0
	mul r1, r2
	add r2, r4, r1
	ldr r1, _0224D358 ; =0x00002DF8
	mov r0, #0
	strh r0, [r2, r1]
_0224D2B6:
	ldr r0, _0224D350 ; =0x0000213C
	mov r1, #1
	ldr r2, [r4, r0]
	lsl r1, r1, #0x14
	tst r1, r2
	bne _0224D31E
	add r0, r0, #4
	ldr r1, [r4, r0]
	mov r0, #4
	tst r0, r1
	beq _0224D2E4
	ldr r2, [r4, #0x64]
	ldr r1, _0224D35C ; =0x00003044
	lsl r2, r2, #1
	add r3, r4, r2
	add r2, r1, #0
	ldr r0, [r4, r1]
	add r2, #0x18
	strh r0, [r3, r2]
	sub r0, r1, #4
	ldr r2, [r4, r0]
	add r0, r1, #4
	b _0224D2F2
_0224D2E4:
	ldr r0, [r4, #0x64]
	mov r2, #0
	lsl r0, r0, #1
	add r1, r4, r0
	ldr r0, _0224D360 ; =0x0000305C
	strh r2, [r1, r0]
	sub r0, #0x14
_0224D2F2:
	str r2, [r4, r0]
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x40
	tst r0, r1
	beq _0224D312
	mov r0, #0xc1
	ldr r1, [r4, #0x64]
	lsl r0, r0, #6
	ldr r2, [r4, r0]
	lsl r1, r1, #1
	add r1, r4, r1
	add r0, #0x3c
	strh r2, [r1, r0]
	b _0224D31E
_0224D312:
	ldr r0, [r4, #0x64]
	mov r2, #0
	lsl r0, r0, #1
	add r1, r4, r0
	ldr r0, _0224D364 ; =0x0000307C
	strh r2, [r1, r0]
_0224D31E:
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #4
	tst r0, r1
	beq _0224D33A
	mov r0, #0xc1
	ldr r1, [r4, #0x64]
	lsl r0, r0, #6
	ldr r2, [r4, r0]
	lsl r1, r1, #1
	add r1, r4, r1
	add r0, #0x6c
	strh r2, [r1, r0]
_0224D33A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224DD74
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02256694
	mov r0, #0x28
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224D350: .word 0x0000213C
_0224D354: .word 0x00000171
_0224D358: .word 0x00002DF8
_0224D35C: .word 0x00003044
_0224D360: .word 0x0000305C
_0224D364: .word 0x0000307C
	thumb_func_end ov12_0224D23C

	thumb_func_start ov12_0224D368
ov12_0224D368: ; 0x0224D368
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl BattleSystem_GetBattleType
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	bne _0224D3EA
	ldr r2, [r4, #0x64]
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl CheckStatusHealAbility
	cmp r0, #1
	beq _0224D440
	ldr r2, [r4, #0x6c]
	cmp r2, #0xff
	beq _0224D39E
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl CheckStatusHealAbility
	cmp r0, #1
	beq _0224D440
_0224D39E:
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r2, r1, #0
	bl ov12_0224DD18
	cmp r0, #1
	beq _0224D440
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224D7EC
	cmp r0, #1
	beq _0224D440
	add r0, r5, #0
	add r1, r4, #0
	bl TryAbilityOnEntry
	add r2, r0, #0
	beq _0224D3D6
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0224D3D6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224E130
	cmp r0, #1
	beq _0224D440
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0224DC0C
_0224D3EA:
	add r1, r4, #0
	add r1, #0xec
	ldr r1, [r1]
	mov r0, #0x28
	add r2, r4, r1
	ldr r1, _0224D444 ; =0x000021E8
	ldrb r2, [r2, r1]
	sub r1, #0x40
	lsl r2, r2, #4
	add r2, r4, r2
	str r0, [r2, r1]
	ldr r1, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r1
	add r1, r4, r0
	mov r0, #0xb5
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _0224D428
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02257EC0
	add r0, r5, #0
	add r1, r4, #0
	bl SortMonsBySpeed
	mov r1, #0
	b _0224D430
_0224D428:
	add r0, r4, #0
	add r0, #0xec
	ldr r0, [r0]
	add r1, r0, #1
_0224D430:
	add r0, r4, #0
	add r0, #0xec
	str r1, [r0]
	add r0, r4, #0
	bl BattleContext_Init
	mov r0, #8
	str r0, [r4, #8]
_0224D440:
	pop {r3, r4, r5, pc}
	nop
_0224D444: .word 0x000021E8
	thumb_func_end ov12_0224D368

	thumb_func_start ov12_0224D448
ov12_0224D448: ; 0x0224D448
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #8]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov12_0224DC74
	cmp r0, #1
	beq _0224D460
	mov r0, #0x28
	str r0, [r4, #8]
_0224D460:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D448

	thumb_func_start ov12_0224D464
ov12_0224D464: ; 0x0224D464
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl BattleSystem_GetBattleOutcomeFlags
	mov r1, #0x80
	tst r0, r1
	beq _0224D47A
	mov r0, #0x2c
	str r0, [r4, #8]
	b _0224D4E2
_0224D47A:
	add r0, r5, #0
	bl BattleSystem_GetBattleOutcomeFlags
	cmp r0, #2
	beq _0224D48E
	add r0, r5, #0
	bl BattleSystem_GetBattleOutcomeFlags
	cmp r0, #3
	bne _0224D4A2
_0224D48E:
	add r0, r4, #0
	mov r1, #1
	mov r2, #5
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	b _0224D4E2
_0224D4A2:
	add r0, r5, #0
	bl BattleSystem_GetBattleOutcomeFlags
	cmp r0, #1
	bne _0224D4C0
	add r0, r4, #0
	mov r1, #1
	mov r2, #4
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	b _0224D4E2
_0224D4C0:
	add r0, r5, #0
	bl BattleSystem_GetBattleOutcomeFlags
	cmp r0, #4
	bne _0224D4D4
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #0x2c
	str r0, [r4, #0xc]
	b _0224D4E2
_0224D4D4:
	add r0, r5, #0
	bl BattleSystem_GetBattleOutcomeFlags
	cmp r0, #5
	bne _0224D4E2
	mov r0, #0x2c
	str r0, [r4, #8]
_0224D4E2:
	ldr r0, _0224D4EC ; =0x0000311F
	mov r1, #1
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
	nop
_0224D4EC: .word 0x0000311F
	thumb_func_end ov12_0224D464

	thumb_func_start ov12_0224D4F0
ov12_0224D4F0: ; 0x0224D4F0
	push {r4, lr}
	add r4, r1, #0
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0224D500
	mov r0, #0x2c
	str r0, [r4, #8]
_0224D500:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D4F0

	thumb_func_start ov12_0224D504
ov12_0224D504: ; 0x0224D504
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl BattleSystem_GetBattleType
	mov r1, #4
	add r4, r0, #0
	and r4, r1
	bne _0224D52A
	add r0, r6, #0
	mov r1, #0
	bl BattleSystem_GetParty
	add r6, r0, #0
	bl Party_GivePokerusAtRandom
	add r0, r6, #0
	bl Party_SpreadPokerus
_0224D52A:
	cmp r4, #0
	beq _0224D534
	mov r0, #0x16
	bl sub_020376EC
_0224D534:
	mov r0, #0x2d
	str r0, [r5, #8]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0224D504

	thumb_func_start ov12_0224D53C
ov12_0224D53C: ; 0x0224D53C
	bx lr
	.balign 4, 0
	thumb_func_end ov12_0224D53C

	thumb_func_start ov12_0224D540
ov12_0224D540: ; 0x0224D540
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r1, [sp, #4]
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #0x30]
	bl BattleSystem_GetMaxBattlers
	str r0, [sp, #0x28]
	ldr r0, [sp]
	bl BattleSystem_GetBattleType
	str r0, [sp, #0x24]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bgt _0224D56C
	b _0224D75E
_0224D56C:
	ldr r0, [sp, #4]
	mov r1, #2
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x24]
	and r0, r1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x24]
	mov r1, #0x18
	and r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	mov r1, #0x10
	and r0, r1
	str r0, [sp, #0xc]
_0224D58A:
	mov r1, #0x4f
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r0, #1
	bic r2, r0
	ldr r0, [sp, #0x1c]
	str r2, [r0, r1]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0224D5A6
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0224D5B8
_0224D5A6:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0224D69E
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _0224D69E
_0224D5B8:
	ldr r3, _0224D7DC ; =0x00002D8C
	ldr r0, [sp, #0x18]
	ldr r0, [r0, r3]
	cmp r0, #0
	bne _0224D5E0
	ldr r1, [sp, #0x2c]
	mov r2, #2
	add r4, r1, #0
	eor r4, r2
	mov r1, #0xc0
	add r5, r4, #0
	mul r5, r1
	ldr r1, [sp, #4]
	add r1, r1, r5
	ldr r1, [r1, r3]
	cmp r1, #0
	bne _0224D5E0
	ldr r1, [sp, #0x2c]
	tst r1, r2
	bne _0224D5E4
_0224D5E0:
	cmp r0, #0
	beq _0224D5E6
_0224D5E4:
	b _0224D744
_0224D5E6:
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	mov r7, #0
	bl BattleSystem_GetParty
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	bl BattleSystem_GetOpponentData
	add r0, r6, #0
	add r5, r7, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0224D65E
	ldr r0, [sp, #0x2c]
	mov r1, #2
	eor r1, r0
	ldr r0, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #8]
_0224D612:
	add r0, r6, #0
	add r1, r5, #0
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D652
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224D7E0 ; =0x000001EE
	cmp r0, r1
	beq _0224D652
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D652
	ldr r2, [sp, #8]
	ldr r1, _0224D7E4 ; =0x0000219C
	ldrb r1, [r2, r1]
	cmp r5, r1
	beq _0224D652
	add r7, r7, r0
_0224D652:
	add r0, r6, #0
	add r5, r5, #1
	bl Party_GetCount
	cmp r5, r0
	blt _0224D612
_0224D65E:
	cmp r7, #0
	bne _0224D682
	ldr r0, [sp, #0x2c]
	bl MaskOfFlagNo
	ldr r2, _0224D7E8 ; =0x00003108
	ldr r1, [sp, #4]
	ldrb r1, [r1, r2]
	orr r1, r0
	ldr r0, [sp, #4]
	strb r1, [r0, r2]
	add r1, r0, #0
	ldr r0, [sp, #0x2c]
	mov r2, #6
	add r1, r1, r0
	ldr r0, _0224D7E4 ; =0x0000219C
	strb r2, [r1, r0]
	b _0224D744
_0224D682:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #4]
	str r1, [r0, #0xc]
	mov r1, #0x16
	str r1, [r0, #8]
	mov r1, #0x4f
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r0, #1
	orr r2, r0
	ldr r0, [sp, #0x1c]
	str r2, [r0, r1]
	b _0224D744
_0224D69E:
	ldr r1, _0224D7DC ; =0x00002D8C
	ldr r0, [sp, #0x18]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0224D744
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	mov r7, #0
	bl BattleSystem_GetParty
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x2c]
	bl BattleSystem_GetOpponentData
	add r0, r6, #0
	add r5, r7, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0224D706
_0224D6C8:
	add r0, r6, #0
	add r1, r5, #0
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D6FA
	add r0, r4, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224D7E0 ; =0x000001EE
	cmp r0, r1
	beq _0224D6FA
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_0224D6FA:
	add r0, r6, #0
	add r5, r5, #1
	bl Party_GetCount
	cmp r5, r0
	blt _0224D6C8
_0224D706:
	cmp r7, #0
	bne _0224D72A
	ldr r0, [sp, #0x2c]
	bl MaskOfFlagNo
	ldr r2, _0224D7E8 ; =0x00003108
	ldr r1, [sp, #4]
	ldrb r1, [r1, r2]
	orr r1, r0
	ldr r0, [sp, #4]
	strb r1, [r0, r2]
	add r1, r0, #0
	ldr r0, [sp, #0x2c]
	mov r2, #6
	add r1, r1, r0
	ldr r0, _0224D7E4 ; =0x0000219C
	strb r2, [r1, r0]
	b _0224D744
_0224D72A:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #4]
	str r1, [r0, #0xc]
	mov r1, #0x16
	str r1, [r0, #8]
	mov r1, #0x4f
	ldr r0, [sp, #0x1c]
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r0, #1
	orr r2, r0
	ldr r0, [sp, #0x1c]
	str r2, [r0, r1]
_0224D744:
	ldr r0, [sp, #0x1c]
	add r0, r0, #4
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r0, #0xc0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x2c]
	add r1, r0, #1
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	cmp r1, r0
	bge _0224D75E
	b _0224D58A
_0224D75E:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	cmp r0, #0x16
	bne _0224D7D4
	ldr r0, [sp, #0x24]
	mov r1, #0x86
	tst r0, r1
	bne _0224D7C6
	ldr r0, [sp]
	bl BattleSystem_GetBattleStyle
	cmp r0, #0
	bne _0224D7C6
	mov r1, #0x4f
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r2, #1
	tst r0, r2
	beq _0224D790
	ldr r0, [sp, #4]
	add r1, r1, #4
	ldr r0, [r0, r1]
	tst r0, r2
	bne _0224D7C6
_0224D790:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	mov r2, #0
	bl CanSwitchMon
	cmp r0, #0
	beq _0224D7C6
	mov r1, #0x4f
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r2, #1
	tst r0, r2
	beq _0224D7B4
	mov r2, #0
	sub r1, r1, #4
	ldr r0, [sp, #4]
	b _0224D7B8
_0224D7B4:
	ldr r0, [sp, #4]
	sub r1, r1, #4
_0224D7B8:
	str r2, [r0, r1]
	ldr r0, [sp, #4]
	mov r1, #1
	mov r2, #0xe7
	bl ReadBattleScriptFromNarc
	b _0224D7D0
_0224D7C6:
	ldr r0, [sp, #4]
	mov r1, #1
	mov r2, #0xa
	bl ReadBattleScriptFromNarc
_0224D7D0:
	mov r0, #1
	str r0, [sp, #0x30]
_0224D7D4:
	ldr r0, [sp, #0x30]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0224D7DC: .word 0x00002D8C
_0224D7E0: .word 0x000001EE
_0224D7E4: .word 0x0000219C
_0224D7E8: .word 0x00003108
	thumb_func_end ov12_0224D540

	thumb_func_start ov12_0224D7EC
ov12_0224D7EC: ; 0x0224D7EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp]
	str r1, [sp, #4]
	bl BattleSystem_GetMaxBattlers
	str r0, [sp, #0x24]
	ldr r0, [sp]
	bl BattleSystem_GetBattleType
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bgt _0224D810
	b _0224DA6A
_0224D810:
	ldr r0, [sp, #0x20]
	mov r1, #8
	and r0, r1
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	mov r1, #0x10
	and r0, r1
	str r0, [sp, #8]
_0224D820:
	ldr r0, [sp, #0x20]
	sub r0, #0x4a
	cmp r0, #1
	bhi _0224D8BA
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _0224D8BA
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl ov12_0223AB0C
	cmp r0, #2
	bne _0224D8DC
	ldr r1, _0224DB24 ; =0x00002D8C
	ldr r0, [sp, #4]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0224D8DC
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	mov r7, #0
	bl BattleSystem_GetParty
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl BattleSystem_GetOpponentData
	add r0, r6, #0
	add r4, r7, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0224D8A8
_0224D86A:
	add r0, r6, #0
	add r1, r4, #0
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D89C
	add r0, r5, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224DB28 ; =0x000001EE
	cmp r0, r1
	beq _0224D89C
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_0224D89C:
	add r0, r6, #0
	add r4, r4, #1
	bl Party_GetCount
	cmp r4, r0
	blt _0224D86A
_0224D8A8:
	cmp r7, #0
	bne _0224D8DC
	ldr r0, [sp, #0x1c]
	mov r1, #2
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224D8BA:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0224D8D2
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _0224D9C4
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _0224D9C4
_0224D8D2:
	ldr r1, _0224DB24 ; =0x00002D8C
	ldr r0, [sp, #4]
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _0224D8DE
_0224D8DC:
	b _0224DA56
_0224D8DE:
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	mov r4, #0
	bl BattleSystem_GetParty
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	ldr r0, [sp]
	bl BattleSystem_GetParty
	str r0, [sp, #0x18]
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl BattleSystem_GetOpponentData
	str r0, [sp, #0x14]
	add r0, r7, #0
	add r5, r4, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0224D950
_0224D912:
	add r0, r7, #0
	add r1, r5, #0
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D944
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224DB28 ; =0x000001EE
	cmp r0, r1
	beq _0224D944
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_0224D944:
	add r0, r7, #0
	add r5, r5, #1
	bl Party_GetCount
	cmp r5, r0
	blt _0224D912
_0224D950:
	ldr r0, [sp, #0x18]
	mov r5, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0224D99A
	ldr r7, _0224DB28 ; =0x000001EE
_0224D95E:
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224D98E
	add r0, r6, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	cmp r0, r7
	beq _0224D98E
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_0224D98E:
	ldr r0, [sp, #0x18]
	add r5, r5, #1
	bl Party_GetCount
	cmp r5, r0
	blt _0224D95E
_0224D99A:
	cmp r4, #0
	bne _0224DA56
	ldr r0, [sp, #0x14]
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224D9B6
	ldr r0, [sp, #0x1c]
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224D9B6:
	ldr r0, [sp, #0x1c]
	mov r1, #2
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224D9C4:
	ldr r1, _0224DB24 ; =0x00002D8C
	ldr r0, [sp, #4]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0224DA56
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	mov r7, #0
	bl BattleSystem_GetParty
	add r6, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #0x28]
	bl BattleSystem_GetOpponentData
	str r0, [sp, #0x10]
	add r0, r6, #0
	add r4, r7, #0
	bl Party_GetCount
	cmp r0, #0
	ble _0224DA2E
_0224D9F0:
	add r0, r6, #0
	add r1, r4, #0
	bl Party_GetMonByIndex
	mov r1, #0xae
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0224DA22
	add r0, r5, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	ldr r1, _0224DB28 ; =0x000001EE
	cmp r0, r1
	beq _0224DA22
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_0224DA22:
	add r0, r6, #0
	add r4, r4, #1
	bl Party_GetCount
	cmp r4, r0
	blt _0224D9F0
_0224DA2E:
	cmp r7, #0
	bne _0224DA56
	ldr r0, [sp, #0x10]
	bl ov12_02261258
	mov r1, #1
	tst r0, r1
	beq _0224DA4A
	ldr r0, [sp, #0x1c]
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	b _0224DA56
_0224DA4A:
	ldr r0, [sp, #0x1c]
	mov r1, #2
	orr r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
_0224DA56:
	ldr r0, [sp, #4]
	add r0, #0xc0
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x28]
	cmp r1, r0
	bge _0224DA6A
	b _0224D820
_0224DA6A:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0224DA80
	ldr r0, [sp, #0x20]
	mov r1, #1
	tst r0, r1
	beq _0224DA80
	ldr r0, [sp, #0x20]
	mov r1, #4
	tst r0, r1
	beq _0224DA96
_0224DA80:
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0224DB44
	ldr r0, [sp, #0x20]
	mov r1, #0x80
	tst r0, r1
	beq _0224DB44
	ldr r0, [sp, #0x20]
	mov r1, #4
	tst r0, r1
	bne _0224DB44
_0224DA96:
	ldr r0, [sp]
	mov r1, #1
	bl BattleSystem_GetTrainer
	ldrb r0, [r0, #1]
	sub r0, #0x42
	cmp r0, #0x2e
	bhi _0224DB20
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224DAB2: ; jump table
	.short _0224DB10 - _0224DAB2 - 2 ; case 0
	.short _0224DB10 - _0224DAB2 - 2 ; case 1
	.short _0224DB20 - _0224DAB2 - 2 ; case 2
	.short _0224DB20 - _0224DAB2 - 2 ; case 3
	.short _0224DB10 - _0224DAB2 - 2 ; case 4
	.short _0224DB20 - _0224DAB2 - 2 ; case 5
	.short _0224DB10 - _0224DAB2 - 2 ; case 6
	.short _0224DB10 - _0224DAB2 - 2 ; case 7
	.short _0224DB10 - _0224DAB2 - 2 ; case 8
	.short _0224DB10 - _0224DAB2 - 2 ; case 9
	.short _0224DB10 - _0224DAB2 - 2 ; case 10
	.short _0224DB20 - _0224DAB2 - 2 ; case 11
	.short _0224DB20 - _0224DAB2 - 2 ; case 12
	.short _0224DB20 - _0224DAB2 - 2 ; case 13
	.short _0224DB20 - _0224DAB2 - 2 ; case 14
	.short _0224DB20 - _0224DAB2 - 2 ; case 15
	.short _0224DB20 - _0224DAB2 - 2 ; case 16
	.short _0224DB20 - _0224DAB2 - 2 ; case 17
	.short _0224DB20 - _0224DAB2 - 2 ; case 18
	.short _0224DB20 - _0224DAB2 - 2 ; case 19
	.short _0224DB10 - _0224DAB2 - 2 ; case 20
	.short _0224DB10 - _0224DAB2 - 2 ; case 21
	.short _0224DB10 - _0224DAB2 - 2 ; case 22
	.short _0224DB10 - _0224DAB2 - 2 ; case 23
	.short _0224DB20 - _0224DAB2 - 2 ; case 24
	.short _0224DB20 - _0224DAB2 - 2 ; case 25
	.short _0224DB20 - _0224DAB2 - 2 ; case 26
	.short _0224DB20 - _0224DAB2 - 2 ; case 27
	.short _0224DB20 - _0224DAB2 - 2 ; case 28
	.short _0224DB20 - _0224DAB2 - 2 ; case 29
	.short _0224DB20 - _0224DAB2 - 2 ; case 30
	.short _0224DB18 - _0224DAB2 - 2 ; case 31
	.short _0224DB10 - _0224DAB2 - 2 ; case 32
	.short _0224DB18 - _0224DAB2 - 2 ; case 33
	.short _0224DB18 - _0224DAB2 - 2 ; case 34
	.short _0224DB18 - _0224DAB2 - 2 ; case 35
	.short _0224DB18 - _0224DAB2 - 2 ; case 36
	.short _0224DB10 - _0224DAB2 - 2 ; case 37
	.short _0224DB10 - _0224DAB2 - 2 ; case 38
	.short _0224DB10 - _0224DAB2 - 2 ; case 39
	.short _0224DB10 - _0224DAB2 - 2 ; case 40
	.short _0224DB10 - _0224DAB2 - 2 ; case 41
	.short _0224DB10 - _0224DAB2 - 2 ; case 42
	.short _0224DB20 - _0224DAB2 - 2 ; case 43
	.short _0224DB10 - _0224DAB2 - 2 ; case 44
	.short _0224DB20 - _0224DAB2 - 2 ; case 45
	.short _0224DB10 - _0224DAB2 - 2 ; case 46
_0224DB10:
	ldr r0, _0224DB2C ; =SEQ_GS_WIN3
	bl PlayBGM
	b _0224DB3C
_0224DB18:
	ldr r0, _0224DB30 ; =SEQ_GS_WINBRAIN
	bl PlayBGM
	b _0224DB3C
_0224DB20:
	ldr r0, _0224DB34 ; =SEQ_GS_WIN1
	b _0224DB38
	.balign 4, 0
_0224DB24: .word 0x00002D8C
_0224DB28: .word 0x000001EE
_0224DB2C: .word SEQ_GS_WIN3
_0224DB30: .word SEQ_GS_WINBRAIN
_0224DB34: .word SEQ_GS_WIN1
_0224DB38:
	bl PlayBGM
_0224DB3C:
	ldr r0, [sp]
	mov r1, #2
	bl BattleSystem_SetCriticalHpMusicFlag
_0224DB44:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0224DB52
	ldr r0, [sp]
	ldr r1, [sp, #0x1c]
	bl BattleSystem_SetBattleOutcomeFlags
_0224DB52:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0224DB5E
	add sp, #0x2c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0224DB5E:
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_0224D7EC

	thumb_func_start ov12_0224DB64
ov12_0224DB64: ; 0x0224DB64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r5, r1, #0
	ldr r0, _0224DBFC ; =0x00002D4C
	add r6, r2, #0
	mov r1, #0xc0
	add r0, r5, r0
	mul r1, r6
	add r0, r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #8]
	lsl r0, r0, #1
	ldrh r1, [r1, r0]
	str r3, [sp, #4]
	ldr r4, [sp, #0x28]
	ldr r7, [sp, #0x30]
	str r0, [sp, #0xc]
	cmp r1, #0xae
	bne _0224DB9E
	add r0, r5, #0
	bl CurseUserIsGhost
	cmp r0, #0
	bne _0224DB9E
	mov r0, #0x10
	str r0, [r4]
	b _0224DBAE
_0224DB9E:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldrh r0, [r1, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224DC00 ; =0x000003E6
	ldrh r0, [r1, r0]
	str r0, [r4]
_0224DBAE:
	ldr r0, [sp, #4]
	mov r1, #2
	tst r0, r1
	beq _0224DBE4
	ldr r0, [r4]
	add r1, #0xfe
	cmp r0, r1
	bne _0224DBDE
	ldr r0, [sp]
	add r1, r6, #0
	bl BattleSystem_GetBattlerIdPartner
	bl MaskOfFlagNo
	ldr r1, _0224DC04 ; =0x00003108
	ldrb r1, [r5, r1]
	tst r0, r1
	bne _0224DBD8
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224DBD8:
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224DBDE:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224DBE4:
	ldr r1, [r4]
	ldr r0, _0224DC08 ; =0x00000251
	tst r0, r1
	beq _0224DBF0
	str r6, [r7]
	b _0224DBF6
_0224DBF0:
	mov r0, #1
	eor r0, r6
	str r0, [r7]
_0224DBF6:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224DBFC: .word 0x00002D4C
_0224DC00: .word 0x000003E6
_0224DC04: .word 0x00003108
_0224DC08: .word 0x00000251
	thumb_func_end ov12_0224DB64

	thumb_func_start ov12_0224DC0C
ov12_0224DC0C: ; 0x0224DC0C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	bl BattleSystem_GetMaxBattlers
	add r4, r0, #0
	mov r3, #0
	cmp r4, #0
	ble _0224DC46
	ldr r5, [sp]
	add r7, r3, #0
	add r6, r5, #0
_0224DC22:
	ldr r0, _0224DC68 ; =0x00002DB0
	add r3, r3, #1
	ldr r2, [r6, r0]
	ldr r0, _0224DC6C ; =0x0000218C
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	eor r0, r1
	add r1, r2, #0
	and r1, r0
	ldr r0, _0224DC68 ; =0x00002DB0
	str r1, [r6, r0]
	ldr r0, _0224DC6C ; =0x0000218C
	add r6, #0xc0
	str r7, [r5, r0]
	add r5, r5, #4
	cmp r3, r4
	blt _0224DC22
_0224DC46:
	ldr r1, [sp]
	mov r0, #0
	ldr r1, [r1, #0x64]
	lsl r2, r1, #1
	ldr r1, [sp]
	add r1, r1, r2
	ldr r2, _0224DC70 ; =0x00003064
	strh r0, [r1, r2]
	ldr r1, [sp]
	add r2, #0x60
	ldr r1, [r1, #0x64]
	lsl r3, r1, #1
	ldr r1, [sp]
	add r1, r1, r3
	strh r0, [r1, r2]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DC68: .word 0x00002DB0
_0224DC6C: .word 0x0000218C
_0224DC70: .word 0x00003064
	thumb_func_end ov12_0224DC0C

	thumb_func_start ov12_0224DC74
ov12_0224DC74: ; 0x0224DC74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0224DD0C ; =0x000021EC
	str r1, [sp]
	ldrb r0, [r5, r0]
	add r6, r2, #0
	str r3, [sp, #4]
	mov r4, #0
	bl MaskOfFlagNo
	ldr r1, _0224DD10 ; =0x0000213C
	lsl r0, r0, #0x18
	ldr r2, [r5, r1]
	mov r1, #0xf
	lsl r1, r1, #0x18
	tst r1, r2
	beq _0224DD02
	add r1, r2, #0
	tst r1, r0
	bne _0224DCB6
	ldr r7, _0224DD0C ; =0x000021EC
	add r6, r7, #0
	sub r6, #0xb0
_0224DCA4:
	add r4, r4, #1
	add r0, r5, r4
	ldrb r0, [r0, r7]
	bl MaskOfFlagNo
	ldr r1, [r5, r6]
	lsl r0, r0, #0x18
	tst r1, r0
	beq _0224DCA4
_0224DCB6:
	ldr r2, _0224DD10 ; =0x0000213C
	mov r1, #0
	mvn r1, r1
	eor r1, r0
	ldr r3, [r5, r2]
	asr r0, r0, #0x18
	and r1, r3
	str r1, [r5, r2]
	bl LowestFlagNo
	str r0, [r5, #0x74]
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _0224DCDE
	add r0, r5, #0
	mov r1, #1
	mov r2, #6
	bl ReadBattleScriptFromNarc
	b _0224DCE8
_0224DCDE:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x53
	bl ReadBattleScriptFromNarc
_0224DCE8:
	mov r0, #0x16
	str r0, [r5, #8]
	ldr r0, [sp]
	mov r2, #0x28
	str r0, [r5, #0xc]
	ldr r0, [r5, #0x74]
	add sp, #8
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224DD14 ; =0x000021A8
	str r2, [r1, r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224DD02:
	str r6, [r5, #8]
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224DD0C: .word 0x000021EC
_0224DD10: .word 0x0000213C
_0224DD14: .word 0x000021A8
	thumb_func_end ov12_0224DC74

	thumb_func_start ov12_0224DD18
ov12_0224DD18: ; 0x0224DD18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x85
	lsl r0, r0, #6
	add r4, r1, #0
	ldr r1, [r5, r0]
	mov r0, #0xf
	lsl r0, r0, #0x1c
	tst r0, r1
	beq _0224DD6C
	mov r0, #1
	lsl r0, r0, #0x1c
	add r2, r1, #0
	tst r2, r0
	bne _0224DD3E
_0224DD36:
	lsl r0, r0, #1
	add r2, r1, #0
	tst r2, r0
	beq _0224DD36
_0224DD3E:
	mov r2, #0x85
	lsl r2, r2, #6
	mov r1, #0
	mvn r1, r1
	eor r1, r0
	ldr r3, [r5, r2]
	asr r0, r0, #0x1c
	and r1, r3
	str r1, [r5, r2]
	bl LowestFlagNo
	mov r2, #0x45
	str r0, [r5, #0x74]
	add r0, r5, #0
	mov r1, #1
	lsl r2, r2, #2
	bl ReadBattleScriptFromNarc
	mov r0, #0x16
	str r0, [r5, #8]
	str r4, [r5, #0xc]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224DD6C:
	str r2, [r5, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0224DD18

	thumb_func_start ov12_0224DD74
ov12_0224DD74: ; 0x0224DD74
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	bl GetBattlerAbility
	cmp r0, #0x60
	bne _0224DD88
	mov r4, #0
	b _0224DD9C
_0224DD88:
	ldr r0, _0224DF54 ; =0x00002160
	ldr r4, [r5, r0]
	cmp r4, #0
	bne _0224DD9C
	ldr r0, _0224DF58 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224DF5C ; =0x000003E2
	ldrb r4, [r1, r0]
_0224DD9C:
	mov r0, #0xc1
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	mov r6, #0x10
	lsl r1, r2, #4
	add r3, r5, r1
	ldr r1, _0224DF60 ; =0x000003E9
	ldrb r1, [r3, r1]
	tst r1, r6
	beq _0224DDE6
	ldr r3, _0224DF64 ; =0x0000213C
	lsl r6, r6, #0x10
	ldr r1, [r5, r3]
	tst r1, r6
	bne _0224DDE6
	ldr r1, [r5, #0x6c]
	cmp r1, #0xff
	beq _0224DDE6
	add r3, r3, #4
	ldr r6, [r5, r3]
	mov r3, #4
	tst r3, r6
	beq _0224DDE6
	lsl r1, r1, #1
	add r3, r5, r1
	add r1, r0, #0
	add r1, #0x44
	strh r2, [r3, r1]
	ldr r2, [r5, #0x6c]
	ldr r1, [r5, r0]
	lsl r2, r2, #3
	add r3, r5, r2
	ldr r2, [r5, #0x64]
	add r0, #0x4c
	lsl r2, r2, #1
	add r2, r3, r2
	strh r1, [r2, r0]
_0224DDE6:
	ldr r1, [r5, #0x6c]
	cmp r1, #0xff
	beq _0224DE30
	add r0, r5, #0
	bl GetBattlerHeldItemEffect
	ldr r1, _0224DF64 ; =0x0000213C
	lsl r0, r0, #0x18
	ldr r3, [r5, r1]
	mov r2, #0x20
	lsr r0, r0, #0x18
	tst r2, r3
	bne _0224DE0A
	add r1, r1, #4
	ldr r2, [r5, r1]
	mov r1, #4
	tst r1, r2
	beq _0224DE24
_0224DE0A:
	cmp r0, #0x37
	beq _0224DE24
	cmp r0, #0x73
	beq _0224DE24
	cmp r0, #0x7d
	beq _0224DE24
	ldr r1, [r5, #0x6c]
	mov r0, #0xc0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0224DF68 ; =0x00002DF8
	mov r2, #0
	strh r2, [r1, r0]
_0224DE24:
	ldr r0, _0224DF64 ; =0x0000213C
	mov r1, #1
	ldr r2, [r5, r0]
	lsl r1, r1, #0x14
	tst r1, r2
	beq _0224DE32
_0224DE30:
	b _0224DF52
_0224DE32:
	add r0, r0, #4
	ldr r1, [r5, r0]
	mov r0, #4
	tst r0, r1
	beq _0224DE70
	ldr r1, [r5, #0x6c]
	ldr r0, _0224DF58 ; =0x00003044
	lsl r1, r1, #1
	add r2, r5, r1
	add r1, r0, #0
	ldr r3, [r5, r0]
	add r1, #0x20
	strh r3, [r2, r1]
	ldr r1, [r5, #0x6c]
	ldr r3, [r5, #0x64]
	lsl r1, r1, #1
	add r2, r5, r1
	add r1, r0, #0
	add r1, #0x28
	strh r3, [r2, r1]
	ldr r1, [r5, #0x6c]
	lsl r1, r1, #1
	add r2, r5, r1
	add r1, r0, #0
	add r1, #0x30
	strh r4, [r2, r1]
	sub r1, r0, #4
	ldr r1, [r5, r1]
	add r0, r0, #4
	str r1, [r5, r0]
	b _0224DE9A
_0224DE70:
	ldr r0, [r5, #0x6c]
	ldr r3, _0224DF6C ; =0x00003064
	lsl r0, r0, #1
	mov r1, #0
	add r0, r5, r0
	strh r1, [r0, r3]
	ldr r2, [r5, #0x6c]
	mov r0, #0xff
	lsl r2, r2, #1
	add r6, r5, r2
	add r2, r3, #0
	add r2, #8
	strh r0, [r6, r2]
	ldr r0, [r5, #0x6c]
	lsl r0, r0, #1
	add r2, r5, r0
	add r0, r3, #0
	add r0, #0x10
	strh r1, [r2, r0]
	sub r3, #0x1c
	str r1, [r5, r3]
_0224DE9A:
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r2, [r5, r0]
	mov r1, #0x40
	tst r1, r2
	beq _0224DF2E
	add r0, #0x2c
	ldr r0, [r5, r0]
	ldr r2, _0224DF70 ; =0x801FDA49
	tst r0, r2
	bne _0224DF2E
	ldr r0, _0224DF58 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r1, r0, #4
	add r3, r5, r1
	ldr r1, _0224DF74 ; =0x000003E6
	ldrh r3, [r3, r1]
	cmp r3, #0x40
	bgt _0224DED0
	bge _0224DEE4
	cmp r3, #0x10
	bgt _0224DECA
	beq _0224DEE4
	b _0224DF0A
_0224DECA:
	cmp r3, #0x20
	beq _0224DEE4
	b _0224DF0A
_0224DED0:
	lsr r1, r2, #0x17
	cmp r3, r1
	bgt _0224DEDE
	bge _0224DEE4
	cmp r3, #0x80
	beq _0224DEE4
	b _0224DF0A
_0224DEDE:
	lsr r1, r2, #0x16
	cmp r3, r1
	bne _0224DF0A
_0224DEE4:
	ldr r1, [r5, #0x6c]
	ldr r2, _0224DF78 ; =0x000030C4
	lsl r1, r1, #1
	mov r0, #0
	add r1, r5, r1
	strh r0, [r1, r2]
	ldr r1, [r5, #0x6c]
	mov r4, #0xff
	lsl r1, r1, #1
	add r3, r5, r1
	add r1, r2, #0
	add r1, #8
	strh r4, [r3, r1]
	ldr r1, [r5, #0x6c]
	add r2, #0x10
	lsl r1, r1, #1
	add r1, r5, r1
	strh r0, [r1, r2]
	pop {r4, r5, r6, pc}
_0224DF0A:
	ldr r1, [r5, #0x6c]
	lsl r1, r1, #1
	add r2, r5, r1
	ldr r1, _0224DF78 ; =0x000030C4
	strh r0, [r2, r1]
	ldr r0, [r5, #0x6c]
	ldr r3, [r5, #0x64]
	lsl r0, r0, #1
	add r2, r5, r0
	add r0, r1, #0
	add r0, #8
	strh r3, [r2, r0]
	ldr r0, [r5, #0x6c]
	add r1, #0x10
	lsl r0, r0, #1
	add r0, r5, r0
	strh r4, [r0, r1]
	pop {r4, r5, r6, pc}
_0224DF2E:
	ldr r1, [r5, #0x6c]
	ldr r2, _0224DF78 ; =0x000030C4
	lsl r1, r1, #1
	mov r0, #0
	add r1, r5, r1
	strh r0, [r1, r2]
	ldr r1, [r5, #0x6c]
	mov r4, #0xff
	lsl r1, r1, #1
	add r3, r5, r1
	add r1, r2, #0
	add r1, #8
	strh r4, [r3, r1]
	ldr r1, [r5, #0x6c]
	add r2, #0x10
	lsl r1, r1, #1
	add r1, r5, r1
	strh r0, [r1, r2]
_0224DF52:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0224DF54: .word 0x00002160
_0224DF58: .word 0x00003044
_0224DF5C: .word 0x000003E2
_0224DF60: .word 0x000003E9
_0224DF64: .word 0x0000213C
_0224DF68: .word 0x00002DF8
_0224DF6C: .word 0x00003064
_0224DF70: .word 0x801FDA49
_0224DF74: .word 0x000003E6
_0224DF78: .word 0x000030C4
	thumb_func_end ov12_0224DD74

	thumb_func_start ov12_0224DF7C
ov12_0224DF7C: ; 0x0224DF7C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x10
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_0224DF7C

	thumb_func_start ov12_0224DF98
ov12_0224DF98: ; 0x0224DF98
	push {r3, r4, r5, lr}
	ldr r2, _0224DFE8 ; =0x0000216C
	add r5, r1, #0
	ldr r0, [r5, r2]
	mov r4, #0
	cmp r0, #0
	beq _0224DFCC
	add r1, r2, #0
	add r1, #0x11
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _0224DFCA
	ldr r1, [r5, #0x74]
	cmp r1, #0xff
	bne _0224DFC6
	add r2, #0x10
	ldrb r1, [r5, r2]
	cmp r1, #1
	beq _0224DFC6
	mov r1, #1
	lsl r1, r1, #0xe
	tst r0, r1
	beq _0224DFCC
_0224DFC6:
	mov r4, #1
	b _0224DFCC
_0224DFCA:
	mov r4, #1
_0224DFCC:
	cmp r4, #1
	bne _0224DFE2
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x15
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_0224DFE2:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0224DFE8: .word 0x0000216C
	thumb_func_end ov12_0224DF98

	thumb_func_start ov12_0224DFEC
ov12_0224DFEC: ; 0x0224DFEC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r2, [r4, #0x6c]
	mov r3, #0
	cmp r2, #0xff
	bne _0224DFFC
	add r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224DFFC:
	mov r0, #0xc0
	add r5, r2, #0
	mul r5, r0
	mov r1, #2
	ldr r0, _0224E06C ; =0x00002DB0
	add r7, r4, r5
	ldr r6, [r7, r0]
	lsl r1, r1, #0x16
	tst r1, r6
	beq _0224E066
	ldr r1, _0224E070 ; =0x0000216C
	mov r6, #2
	lsl r6, r6, #0x16
	ldr r1, [r4, r1]
	lsr r6, r6, #9
	tst r1, r6
	bne _0224E066
	ldr r1, [r4, #0x64]
	cmp r2, r1
	beq _0224E066
	sub r0, #0x24
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _0224E066
	mov r0, #0x1c
	mul r0, r2
	add r2, r4, r0
	mov r0, #0xb6
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224E044
	add r0, #8
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0224E066
_0224E044:
	ldr r0, _0224E074 ; =0x00002D59
	add r1, r4, r0
	ldrsb r0, [r1, r5]
	cmp r0, #0xc
	bge _0224E066
	add r0, r0, #1
	strb r0, [r1, r5]
	add r0, r4, #0
	mov r1, #1
	mov r2, #0xf5
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r3, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224E066:
	add r0, r3, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E06C: .word 0x00002DB0
_0224E070: .word 0x0000216C
_0224E074: .word 0x00002D59
	thumb_func_end ov12_0224DFEC

	thumb_func_start ov12_0224E078
ov12_0224E078: ; 0x0224E078
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, [r5, #0x64]
	str r0, [sp]
	add r0, r5, #0
	mov r4, #0
	bl GetBattlerHeldItemEffect
	add r7, r0, #0
	ldr r1, [r5, #0x64]
	add r0, r5, #0
	add r2, r4, #0
	bl GetHeldItemModifier
	add r6, r0, #0
	ldr r0, [r5, #0x6c]
	cmp r0, #0xff
	beq _0224E116
	cmp r7, #0x38
	bne _0224E116
	ldr r1, _0224E11C ; =0x0000216C
	ldr r2, [r5, r1]
	ldr r1, _0224E120 ; =0x801FDA49
	tst r1, r2
	bne _0224E116
	mov r1, #0x1c
	mul r1, r0
	mov r0, #0xb6
	add r2, r5, r1
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _0224E0C2
	add r0, #8
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0224E116
_0224E0C2:
	ldr r0, [sp]
	bl BattleSystem_Random
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, r6
	bge _0224E116
	ldr r0, _0224E124 ; =0x00003044
	ldr r0, [r5, r0]
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, _0224E128 ; =0x000003E9
	ldrb r1, [r1, r0]
	mov r0, #0x20
	tst r0, r1
	beq _0224E116
	ldr r0, [r5, #0x6c]
	mov r1, #0xc0
	mul r1, r0
	add r2, r5, r1
	ldr r1, _0224E12C ; =0x00002D8C
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _0224E116
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r5, #0
	mov r1, #2
	add r0, #0x88
	str r1, [r0]
	add r0, r5, #0
	mov r1, #1
	mov r2, #0xe
	bl ReadBattleScriptFromNarc
	ldr r0, [r5, #8]
	mov r4, #1
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_0224E116:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E11C: .word 0x0000216C
_0224E120: .word 0x801FDA49
_0224E124: .word 0x00003044
_0224E128: .word 0x000003E9
_0224E12C: .word 0x00002D8C
	thumb_func_end ov12_0224E078

	thumb_func_start ov12_0224E130
ov12_0224E130: ; 0x0224E130
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r7, [r5, #0x5c]
	str r0, [sp]
	mov r6, #0
	bl BattleSystem_GetMaxBattlers
	cmp r7, r0
	bge _0224E1A0
	add r4, r5, #0
	add r4, #0x5c
_0224E146:
	mov r0, #0xc0
	mul r0, r7
	mov r1, #0xb7
	add r0, r5, r0
	lsl r1, r1, #6
	ldr r2, [r0, r1]
	ldr r1, _0224E1AC ; =0x200400C0
	tst r1, r2
	bne _0224E18A
	ldr r1, _0224E1B0 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224E1AC ; =0x200400C0
	tst r1, r2
	beq _0224E18A
	ldr r1, _0224E1B0 ; =0x00002DC4
	ldr r2, [r0, r1]
	ldr r1, _0224E1B4 ; =0xDFFBFF3F
	and r2, r1
	ldr r1, _0224E1B0 ; =0x00002DC4
	str r2, [r0, r1]
	ldr r2, _0224E1B8 ; =0x0000011F
	add r0, r5, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	mov r0, #0x46
	ldr r1, [r5, #0x5c]
	lsl r0, r0, #2
	str r1, [r5, r0]
	ldr r0, [r5, #8]
	mov r6, #1
	str r0, [r5, #0xc]
	mov r0, #0x16
	str r0, [r5, #8]
_0224E18A:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	cmp r6, #1
	beq _0224E1A0
	ldr r0, [sp]
	ldr r7, [r5, #0x5c]
	bl BattleSystem_GetMaxBattlers
	cmp r7, r0
	blt _0224E146
_0224E1A0:
	cmp r6, #0
	bne _0224E1A8
	mov r0, #0
	str r0, [r5, #0x5c]
_0224E1A8:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E1AC: .word 0x200400C0
_0224E1B0: .word 0x00002DC4
_0224E1B4: .word 0xDFFBFF3F
_0224E1B8: .word 0x0000011F
	thumb_func_end ov12_0224E130

	thumb_func_start ov12_0224E1BC
ov12_0224E1BC: ; 0x0224E1BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	mov r6, #0
	bl BattleSystem_GetMaxBattlers
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl GetBattlerHeldItemEffect
	str r0, [sp, #4]
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	add r2, r6, #0
	bl GetHeldItemModifier
	ldr r1, [r4, #8]
	str r0, [sp]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #1
	bl ov12_0224DC74
	cmp r0, #1
	bne _0224E1F4
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224E1F4:
	add r5, r4, #0
	add r5, #0x30
_0224E1F8:
	ldr r0, [r4, #0x30]
	cmp r0, #3
	bls _0224E200
	b _0224E350
_0224E200:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E20C: ; jump table
	.short _0224E214 - _0224E20C - 2 ; case 0
	.short _0224E244 - _0224E20C - 2 ; case 1
	.short _0224E2C4 - _0224E20C - 2 ; case 2
	.short _0224E348 - _0224E20C - 2 ; case 3
_0224E214:
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _0224E368 ; =0x00002DB0
	add r0, r4, r0
	ldr r2, [r0, r1]
	mov r1, #2
	lsl r1, r1, #0x16
	tst r1, r2
	beq _0224E23C
	ldr r1, _0224E36C ; =0x00003044
	ldr r1, [r4, r1]
	cmp r1, #0x63
	beq _0224E23C
	ldr r1, _0224E368 ; =0x00002DB0
	ldr r2, [r0, r1]
	ldr r1, _0224E370 ; =0xFF7FFFFF
	and r2, r1
	ldr r1, _0224E368 ; =0x00002DB0
	str r2, [r0, r1]
_0224E23C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224E350
_0224E244:
	ldr r3, [r4, #0x6c]
	cmp r3, #0xff
	beq _0224E2BC
	ldr r0, [sp, #4]
	cmp r0, #0x58
	bne _0224E2BC
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	bne _0224E2BC
	ldr r0, _0224E374 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0224E2BC
	ldr r2, [r4, #0x64]
	mov r0, #0x1c
	mul r0, r2
	add r1, r4, r0
	mov r0, #0xbb
	lsl r0, r0, #2
	ldr r7, [r1, r0]
	cmp r7, #0
	beq _0224E2BC
	cmp r2, r3
	beq _0224E2BC
	mov r0, #0xc0
	mul r0, r2
	add r2, r4, r0
	ldr r0, _0224E378 ; =0x00002D8C
	ldr r1, [r2, r0]
	add r0, r0, #4
	ldr r0, [r2, r0]
	cmp r1, r0
	bhs _0224E2BC
	cmp r1, #0
	beq _0224E2BC
	ldr r1, [sp]
	neg r0, r7
	bl DamageDivide
	ldr r1, _0224E37C ; =0x0000215C
	mov r2, #0xd5
	str r0, [r4, r1]
	mov r0, #0x46
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r6, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224E2BC:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224E350
_0224E2C4:
	ldr r0, [sp, #4]
	cmp r0, #0x62
	bne _0224E340
	ldr r1, [r4, #0x64]
	add r0, r4, #0
	bl GetBattlerAbility
	cmp r0, #0x62
	beq _0224E340
	mov r0, #0x85
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	bne _0224E340
	ldr r0, _0224E374 ; =0x0000213C
	ldr r1, [r4, r0]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _0224E340
	ldr r0, _0224E36C ; =0x00003044
	ldr r0, [r4, r0]
	lsl r0, r0, #4
	add r1, r4, r0
	mov r0, #0x3e
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #2
	beq _0224E340
	ldr r1, [r4, #0x64]
	mov r0, #0xc0
	mul r0, r1
	ldr r1, _0224E378 ; =0x00002D8C
	add r0, r4, r0
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _0224E340
	ldr r1, _0224E380 ; =0x00002D90
	ldr r1, [r0, r1]
	mov r0, #0
	mvn r0, r0
	mul r0, r1
	mov r1, #0xa
	bl DamageDivide
	ldr r1, _0224E37C ; =0x0000215C
	mov r2, #0xd6
	str r0, [r4, r1]
	mov r0, #0x46
	ldr r1, [r4, #0x64]
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #1
	bl ReadBattleScriptFromNarc
	ldr r0, [r4, #8]
	mov r6, #1
	str r0, [r4, #0xc]
	mov r0, #0x16
	str r0, [r4, #8]
_0224E340:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224E350
_0224E348:
	mov r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	mov r6, #2
_0224E350:
	cmp r6, #0
	bne _0224E356
	b _0224E1F8
_0224E356:
	cmp r6, #1
	bne _0224E360
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0224E360:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224E368: .word 0x00002DB0
_0224E36C: .word 0x00003044
_0224E370: .word 0xFF7FFFFF
_0224E374: .word 0x0000213C
_0224E378: .word 0x00002D8C
_0224E37C: .word 0x0000215C
_0224E380: .word 0x00002D90
	thumb_func_end ov12_0224E1BC

	thumb_func_start ov12_0224E384
ov12_0224E384: ; 0x0224E384
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp, #4]
	str r0, [sp]
	bl BattleSystem_GetBattleType
	mov r2, #0xd5
	add r4, r0, #0
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	add r1, r1, r2
	ldr r2, _0224E404 ; =0x00001DE0
	mov r0, #0
	bl MIi_CpuClear32
	mov r0, #1
	tst r0, r4
	beq _0224E3F8
	mov r0, #0xb9
	lsl r0, r0, #2
	tst r0, r4
	bne _0224E3F8
	mov r6, #0
_0224E3B2:
	mov r0, #1
	tst r0, r6
	beq _0224E3F2
	asr r2, r6, #1
	ldr r0, [sp, #4]
	lsl r1, r2, #3
	mov r4, #0
	add r7, r0, r1
	add r5, r0, r2
_0224E3C4:
	ldr r0, [sp]
	add r1, r6, #0
	add r2, r4, #0
	bl BattleSystem_GetTrainerItem
	cmp r0, #0
	beq _0224E3EC
	ldr r1, _0224E408 ; =0x000003CD
	ldrb r1, [r5, r1]
	lsl r1, r1, #1
	add r2, r7, r1
	mov r1, #0xe7
	lsl r1, r1, #2
	strh r0, [r2, r1]
	add r0, r1, #0
	add r0, #0x31
	ldrb r0, [r5, r0]
	add r1, r0, #1
	ldr r0, _0224E408 ; =0x000003CD
	strb r1, [r5, r0]
_0224E3EC:
	add r4, r4, #1
	cmp r4, #4
	blt _0224E3C4
_0224E3F2:
	add r6, r6, #1
	cmp r6, #4
	blt _0224E3B2
_0224E3F8:
	ldr r2, _0224E40C ; =ov10_02220AAC
	ldr r1, _0224E410 ; =0x00002134
	ldr r0, [sp, #4]
	str r2, [r0, r1]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E404: .word 0x00001DE0
_0224E408: .word 0x000003CD
_0224E40C: .word ov10_02220AAC
_0224E410: .word 0x00002134
	thumb_func_end ov12_0224E384

	thumb_func_start ov12_0224E414
ov12_0224E414: ; 0x0224E414
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r1, [sp]
	bl BattleSystem_GetMaxBattlers
	mov r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _0224E4E8
	ldr r5, [sp]
_0224E42A:
	ldr r0, _0224E4EC ; =0x000021A8
	ldr r2, [r5, r0]
	cmp r2, #0x28
	beq _0224E4DE
	ldr r0, [sp]
	add r7, r0, r4
	ldr r0, _0224E4F0 ; =0x0000314C
	ldrb r1, [r7, r0]
	mov r0, #1
	tst r0, r1
	beq _0224E44E
	sub r2, #0xc
	lsl r2, r2, #0x18
	add r0, r6, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
_0224E44E:
	ldr r0, _0224E4EC ; =0x000021A8
	ldr r0, [r5, r0]
	sub r0, #0xd
	cmp r0, #3
	bhi _0224E4DE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224E464: ; jump table
	.short _0224E46C - _0224E464 - 2 ; case 0
	.short _0224E4A4 - _0224E464 - 2 ; case 1
	.short _0224E4C0 - _0224E464 - 2 ; case 2
	.short _0224E4D4 - _0224E464 - 2 ; case 3
_0224E46C:
	ldr r0, _0224E4F0 ; =0x0000314C
	ldrb r1, [r7, r0]
	mov r0, #2
	tst r0, r1
	beq _0224E486
	ldr r2, _0224E4F4 ; =0x000021B0
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
_0224E486:
	ldr r0, _0224E4F0 ; =0x0000314C
	ldrb r1, [r7, r0]
	mov r0, #4
	tst r0, r1
	beq _0224E4DE
	ldr r2, _0224E4F8 ; =0x000021AC
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
	b _0224E4DE
_0224E4A4:
	ldr r2, _0224E4F4 ; =0x000021B0
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl ov12_0223BDDC
	b _0224E4DE
_0224E4C0:
	ldr r2, _0224E4F4 ; =0x000021B0
	add r0, r6, #0
	ldr r2, [r5, r2]
	add r1, r4, #0
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov12_0223BDDC
	b _0224E4DE
_0224E4D4:
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #1
	bl ov12_0223BDDC
_0224E4DE:
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r5, #0x10
	cmp r4, r0
	blt _0224E42A
_0224E4E8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E4EC: .word 0x000021A8
_0224E4F0: .word 0x0000314C
_0224E4F4: .word 0x000021B0
_0224E4F8: .word 0x000021AC
	thumb_func_end ov12_0224E414

    .rodata

.public sHitChanceTable

sHitChanceTable: ; 0x0226CA74
	.byte 0x21

; also part of the hit chance table

ov12_0226CA75: ; 0x0226CA75
	.byte 0x64, 0x24, 0x64, 0x2B, 0x64, 0x32, 0x64, 0x3C, 0x64, 0x4B, 0x64
	.byte 0x01, 0x01, 0x85, 0x64, 0xA6, 0x64, 0x02, 0x01, 0xE9, 0x64, 0x85, 0x32, 0x03, 0x01, 0x00, 0x00

.public sPlayerBattleCommands
sPlayerBattleCommands: ; 0x0226CA90
	.word BattleControllerPlayer_GetBattleMon
	.word BattleControllerPlayer_StartEncounter
	.word BattleControllerPlayer_TrainerMessage
	.word BattleControllerPlayer_PokemonAppear
	.word BattleControllerPlayer_SelectionScreenInit
	.word BattleControllerPlayer_SelectionScreenInput
	.word ov12_02249190
	.word ov12_0224930C
	.word ov12_02249460
	.word BattleControllerPlayer_UpdateFieldCondition
	.word BattleControllerPlayer_UpdateMonCondition
	.word BattleControllerPlayer_UpdateFieldConditionExtra
	.word BattleControllerPlayer_TurnEnd
	.word BattleControllerPlayer_FightInput
	.word BattleControllerPlayer_ItemInput
	.word BattleControllerPlayer_PokemonInput
	.word BattleControllerPlayer_RunInput
	.word BattleControllerPlayer_SafariThrowBall
	.word BattleControllerPlayer_SafariThrowMud
	.word BattleControllerPlayer_SafariRun
	.word BattleControllerPlayer_SafariWatching
	.word BattleControllerPlayer_CatchingContestThrowBall
	.word BattleControllerPlayer_RunScript
	.word ov12_0224C38C
	.word ov12_0224C4D8
	.word ov12_0224C5C8
	.word ov12_0224C5F8
	.word ov12_0224C678
	.word ov12_0224C690
	.word ov12_0224CAA4
	.word ov12_0224CC84
	.word ov12_0224CC88
	.word ov12_0224CF14
	.word ov12_0224CF10
	.word ov12_0224D014
	.word ov12_0224D03C
	.word ov12_0224D1DC
	.word ov12_0224D224
	.word ov12_0224D238
	.word ov12_0224D23C
	.word ov12_0224D368
	.word ov12_0224D448
	.word ov12_0224D464
	.word ov12_0224D4F0
	.word ov12_0224D504
	.word ov12_0224D53C
    