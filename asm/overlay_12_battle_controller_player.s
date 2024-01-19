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
    .public BattleControllerPlayer_CalcExecutionOrder
    .public BattleControllerPlayer_BeforeTurn
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
    .public BattleControllerPlayer_HpCalc
    .public ov12_0224CAA4
    .public ov12_0224CC84
    .public ov12_0224CC88
    .public ov12_0224CF10
    .public ov12_0224CF14
    .public ov12_0224D014
    .public ov12_0224D03C
    .public ov12_0224D1DC
    .public ov12_0224D224
    .public ov12_0224D238
    .public ov12_0224D23C
    .public ov12_0224D368
    .public ov12_0224D448
    .public ov12_0224D464
    .public ov12_0224D4F0
    .public ov12_0224D504
    .public ov12_0224D53C
    .public ov12_0224D540   
    .public ov12_0224DC74

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
