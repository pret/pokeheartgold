#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "macros.inc"
	.include "overlay_12_battle_controller_opponent.inc"
	.include "global.inc"

	.text

	.public BattleDisplayTask_PlayerSetCommandSelection
	.public BattleDisplayTask_TrainerSetCommandSelection
	.public BattleDisplayTask_LinkSetCommandSelection
	.public BattleDisplayTask_SafariPokemonSetCommandSelection
	.public BattleDisplayTask_PalParkPokemonSetCommandSelection
	.public BattleDisplayTask_RecordingSetCommandSelection
	.public BattleDisplayTask_PlayerShowMoveSelectMenu
	.public BattleDisplayTask_TrainerShowMoveSelectMenu
	.public BattleDisplayTask_LinkShowMoveSelectMenu
	.public BattleDisplayTask_RecordingShowMoveSelectMenu
	.public BattleDisplayTask_PlayerShowTargetSelectMenu
	.public BattleDisplayTask_TrainerShowTargetSelectMenu
	.public BattleDisplayTask_LinkShowTargetSelectMenu
	.public BattleDisplayTask_RecordingShowTargetSelectMenu
	.public BattleDisplayTask_PlayerShowBagMenu
	.public BattleDisplayTask_TrainerShowBagMenu
	.public BattleDisplayTask_LinkShowBagMenu
	.public BattleDisplayTask_RecordingShowBagMenu
	.public BattleDisplayTask_PlayerShowPartyMenu
	.public BattleDisplayTask_TrainerShowPartyMenu
	.public BattleDisplayTask_LinkShowPartyMenu
	.public BattleDisplayTask_RecordingShowPartyMenu
	.public BattleDisplayTask_PlayerShowYesNoMenu
	.public BattleDisplayTask_TrainerShowYesNoMenu
	.public BattleDisplayTask_LinkShowYesNoMenu

	thumb_func_start ov12_0225FCC0
ov12_0225FCC0: ; 0x0225FCC0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #0xd]
	add r5, r0, #0
	ldr r0, [r4]
	add r2, sp, #0
	bl BattleSystem_ReadNextRecordedInput
	cmp r0, #1
	bne _0225FCDA
	ldr r0, [r4]
	bl BattleDisplay_StopPlaybackAlt
_0225FCDA:
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FCEA
	cmp r0, #0xff
	beq _0225FCF0
	cmp r0, #1
	beq _0225FCF0
_0225FCEA:
	ldr r0, [r4]
	bl BattleDisplay_StopPlayback
_0225FCF0:
	add r2, sp, #0
	ldrb r1, [r4, #0xd]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl BattleController_EmitSelectedCommand
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225FCC0

	thumb_func_start ov12_0225FD14
ov12_0225FD14: ; 0x0225FD14
	push {r3, r4, r5, lr}
	sub sp, #0x1fc
	sub sp, #0x14
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	cmp r0, #0xa
	bls _0225FD2A
	b _0225FF78
_0225FD2A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FD36: ; jump table
	.short _0225FD4C - _0225FD36 - 2 ; case 0
	.short _0225FF56 - _0225FD36 - 2 ; case 1
	.short _0225FDA6 - _0225FD36 - 2 ; case 2
	.short _0225FF56 - _0225FD36 - 2 ; case 3
	.short _0225FE02 - _0225FD36 - 2 ; case 4
	.short _0225FF56 - _0225FD36 - 2 ; case 5
	.short _0225FE50 - _0225FD36 - 2 ; case 6
	.short _0225FF56 - _0225FD36 - 2 ; case 7
	.short _0225FED8 - _0225FD36 - 2 ; case 8
	.short _0225FF56 - _0225FD36 - 2 ; case 9
	.short _0225FF34 - _0225FD36 - 2 ; case 10
_0225FD4C:
	ldrh r0, [r4, #0x1e]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225FD9A
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	bne _0225FD9A
	ldr r0, [r4, #8]
	mov r1, #6
	bl Pokepic_GetAttr
	cmp r0, #0
	bne _0225FD9A
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0x1b8
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x1b8
	bl BattleDisplay_PlayMoveAnimation
	add sp, #0x1fc
	mov r0, #1
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FD9A:
	add sp, #0x1fc
	mov r0, #4
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FDA6:
	add r3, r4, #0
	add r3, #0x69
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #0x10
	add r2, sp, #0x168
	bl BattleDisplay_PopulateBattlerContext
	add r0, sp, #0x168
	mov r1, #5
	bl ov07_0223494C
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x110
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x110
	bl BattleDisplay_PlayMoveAnimation
	mov r0, #0x1a
	add sp, #0x1fc
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add r4, #0x6a
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FE02:
	ldr r0, [r4]
	mov r1, #2
	bl BattleSystem_SetCriticalHpMusicFlag
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE1A
	ldr r0, [r4]
	bl BattleSystem_SetHpBarDisabled
_0225FE1A:
	add r0, r4, #0
	add r0, #0x6c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE30
	ldr r0, [r4]
	bl BattleSystem_GetPokepicManager
	mov r1, #1
	bl PokepicManager_SetG3UpdateFlagsMask
_0225FE30:
	add r3, r4, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, #0x10
	bl BattleDisplay_PlayMoveAnimation
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add sp, #0x1fc
	add r4, #0x6a
	add r0, r0, #1
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FE50:
	ldr r0, [r4]
	mov r1, #0
	bl BattleSystem_SetCriticalHpMusicFlag
	add r0, r4, #0
	add r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE68
	ldr r0, [r4]
	bl BattleSystem_SetHpBarEnabled
_0225FE68:
	add r0, r4, #0
	add r0, #0x6c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0225FE7E
	ldr r0, [r4]
	bl BattleSystem_GetPokepicManager
	mov r1, #1
	bl PokepicManager_ResetG3UpdateFlagsMask
_0225FE7E:
	ldrh r0, [r4, #0x1e]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225FECC
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	bne _0225FECC
	ldr r0, [r4, #8]
	mov r1, #6
	bl Pokepic_GetAttr
	cmp r0, #0
	bne _0225FECC
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0xb8
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0xb8
	bl BattleDisplay_PlayMoveAnimation
	add sp, #0x1fc
	mov r0, #7
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FECC:
	add sp, #0x1fc
	mov r0, #0xa
	add r4, #0x6a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FED8:
	add r3, r4, #0
	add r3, #0x69
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #0x10
	add r2, sp, #0x68
	bl BattleDisplay_PopulateBattlerContext
	add r0, sp, #0x68
	mov r1, #5
	bl ov07_02234A20
	add r0, r4, #0
	add r0, #0x69
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x10
	bl BattleDisplay_PlayMoveAnimation
	mov r0, #0x1a
	add sp, #0x1fc
	ldr r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add r4, #0x6a
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_0225FF34:
	add r2, r4, #0
	add r1, #0x69
	add r2, #0x68
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, pc}
_0225FF56:
	ldr r0, [r4, #0xc]
	bl ov07_0221C394
	ldr r0, [r4, #0xc]
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0225FF78
	ldr r0, [r4, #0xc]
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x6a
	ldrb r0, [r0]
	add r4, #0x6a
	add r0, r0, #1
	strb r0, [r4]
_0225FF78:
	add sp, #0x1fc
	add sp, #0x14
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225FD14

	thumb_func_start ov12_0225FF80
ov12_0225FF80: ; 0x0225FF80
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #9]
	cmp r0, #6
	bhs _0225FFBA
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0225FFB4
	mov r0, #2
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #9]
	mov r1, #6
	add r0, r0, #1
	strb r0, [r4, #9]
	ldr r0, [r4, #4]
	bl Pokepic_GetAttr
	add r3, r0, #0
	mov r2, #1
	ldr r0, [r4, #4]
	mov r1, #6
	eor r2, r3
	bl Pokepic_SetAttr
	pop {r3, r4, r5, pc}
_0225FFB4:
	sub r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, pc}
_0225FFBA:
	ldr r0, [r4, #4]
	mov r1, #6
	mov r2, #0
	bl Pokepic_SetAttr
	ldrb r1, [r4, #8]
	ldr r0, [r4]
	mov r2, #0x17
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_0225FF80

	thumb_func_start ov12_0225FFDC
ov12_0225FFDC: ; 0x0225FFDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0225FFEE
	cmp r0, #1
	beq _0225FFFC
	b _02260012
_0225FFEE:
	ldr r1, [r4, #0x30]
	add r0, r4, #0
	bl ov12_02264DCC
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_0225FFFC:
	add r0, r4, #0
	bl ov12_02264E00
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0226002C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02260012:
	add r2, r4, #0
	add r1, #0x24
	add r2, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #0xc]
	bl BattleController_EmitClearCommand
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl SysTask_Destroy
_0226002C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225FFDC

	thumb_func_start ov12_02260030
ov12_02260030: ; 0x02260030
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02260046
	cmp r0, #1
	beq _02260062
	cmp r0, #2
	beq _022600A8
	b _022600CE
_02260046:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4e
	strb r1, [r0]
	ldr r0, _022600EC ; =0x0000070B
	bl PlaySE
	ldr r1, [r4, #0x40]
	add r0, r4, #0
	bl ov12_02264E34
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02260062:
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #8
	bhs _0226007A
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4e
	strb r1, [r0]
_0226007A:
	add r0, r4, #0
	bl ov12_02264E68
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022600E8
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #8
	blo _022600A0
	ldr r0, _022600EC ; =0x0000070B
	mov r1, #0
	bl StopSE
	mov r0, #0x64
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_022600A0:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_022600A8:
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4e
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #8
	blo _022600E8
	ldr r0, _022600EC ; =0x0000070B
	mov r1, #0
	bl StopSE
	mov r0, #0x64
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_022600CE:
	add r2, r4, #0
	add r1, #0x24
	add r2, #0x4c
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #0xc]
	bl BattleController_EmitClearCommand
	mov r0, #0
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl SysTask_Destroy
_022600E8:
	pop {r3, r4, r5, pc}
	nop
_022600EC: .word 0x0000070B
	thumb_func_end ov12_02260030

	thumb_func_start ov12_022600F0
ov12_022600F0: ; 0x022600F0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x114
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x66
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #0xa
	bls _0226010C
	b _02260374
_0226010C:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02260118: ; jump table
	.short _0226012E - _02260118 - 2 ; case 0
	.short _022601D6 - _02260118 - 2 ; case 1
	.short _0226017A - _02260118 - 2 ; case 2
	.short _022601D6 - _02260118 - 2 ; case 3
	.short _022601FA - _02260118 - 2 ; case 4
	.short _0226024C - _02260118 - 2 ; case 5
	.short _02260266 - _02260118 - 2 ; case 6
	.short _022602A2 - _02260118 - 2 ; case 7
	.short _022602CE - _02260118 - 2 ; case 8
	.short _0226030E - _02260118 - 2 ; case 9
	.short _02260356 - _02260118 - 2 ; case 10
_0226012E:
	add r0, r4, #0
	add r0, #0x70
	ldrh r0, [r0]
	cmp r0, #0
	beq _02260170
	add r0, r4, #0
	add r0, #0x65
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0xbc
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0xbc
	bl BattleDisplay_PlayMoveAnimation
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260170:
	mov r0, #4
	add r4, #0x66
	add sp, #0x114
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0226017A:
	add r3, r4, #0
	add r3, #0x65
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0xc
	add r2, sp, #0x6c
	bl BattleDisplay_PopulateBattlerContext
	add r0, sp, #0x6c
	mov r1, #5
	bl ov07_0223494C
	add r0, r4, #0
	add r0, #0x65
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x14
	bl BattleDisplay_PlayMoveAnimation
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #0
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022601D6:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _02260254
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022601FA:
	add r0, r4, #0
	add r0, #0x67
	ldrb r0, [r0]
	cmp r0, #2
	bne _02260208
	mov r5, #0x75
	b _0226020C
_02260208:
	mov r5, #0x74
	mvn r5, r5
_0226020C:
	add r1, r4, #0
	add r1, #0x65
	ldrb r1, [r1]
	ldr r0, [r4]
	bl BattleSystem_GetChatotVoice
	str r5, [sp]
	mov r1, #0x7f
	str r1, [sp, #4]
	add r1, r4, #0
	add r1, #0x72
	ldrh r1, [r1]
	add r3, r4, #0
	mov r2, #0
	str r1, [sp, #8]
	mov r1, #5
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	add r2, r4, #0
	add r2, #0x68
	add r3, #0x6b
	ldrh r2, [r2]
	ldrb r3, [r3]
	bl sub_0207204C
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
_0226024C:
	bl IsCryFinished
	cmp r0, #0
	beq _02260256
_02260254:
	b _02260374
_02260256:
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260266:
	add r0, r4, #0
	add r0, #0x67
	ldrb r0, [r0]
	cmp r0, #2
	ldr r0, _02260378 ; =0x00000703
	bne _0226027A
	mov r1, #0x75
	bl sub_0200602C
	b _02260282
_0226027A:
	mov r1, #0x74
	mvn r1, r1
	bl sub_0200602C
_02260282:
	ldr r0, [r4, #8]
	mov r1, #0x29
	bl Pokepic_GetAttr
	cmp r0, #0
	ble _02260298
	mov r0, #7
	add r4, #0x66
	add sp, #0x114
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260298:
	mov r0, #8
	add r4, #0x66
	add sp, #0x114
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022602A2:
	ldr r0, [r4, #8]
	mov r1, #0x29
	bl Pokepic_GetAttr
	add r5, r0, #0
	sub r5, #8
	bpl _022602B2
	mov r5, #0
_022602B2:
	ldr r0, [r4, #8]
	mov r1, #0x29
	add r2, r5, #0
	bl Pokepic_SetAttr
	cmp r5, #0
	bne _02260374
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x66
	strb r1, [r0]
_022602CE:
	ldr r0, [r4, #0x6c]
	add r1, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r2, r4, #0
	add r3, r4, #0
	add r0, #0x68
	add r1, #0x6a
	add r2, #0x67
	add r3, #0x6b
	ldrh r0, [r0]
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldrb r3, [r3]
	bl GetMonPicHeightBySpeciesGenderForm
	mov r3, #0x50
	sub r0, r3, r0
	str r0, [sp]
	mov r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	bl Pokepic_SetVisible
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0226030E:
	ldr r0, [r4, #8]
	mov r1, #1
	bl Pokepic_GetAttr
	add r2, r0, #0
	ldr r0, [r4, #8]
	mov r1, #1
	add r2, #8
	bl Pokepic_SetAttr
	ldr r0, [r4, #8]
	mov r1, #0x12
	bl Pokepic_GetAttr
	add r5, r0, #0
	sub r5, #8
	bpl _02260332
	mov r5, #0
_02260332:
	ldr r0, [r4, #8]
	mov r1, #0x12
	add r2, r5, #0
	bl Pokepic_SetAttr
	cmp r5, #0
	bne _02260374
	ldr r0, [r4, #8]
	bl Pokepic_Delete
	add r0, r4, #0
	add r0, #0x66
	ldrb r0, [r0]
	add r4, #0x66
	add sp, #0x114
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02260356:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x65
	add r2, #0x64
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r6, #0
	bl SysTask_Destroy
_02260374:
	add sp, #0x114
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02260378: .word 0x00000703
	thumb_func_end ov12_022600F0

	thumb_func_start ov12_0226037C
ov12_0226037C: ; 0x0226037C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetPaletteData
	add r4, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetPokepicManager
	add r7, r0, #0
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _022603A6
	cmp r0, #1
	beq _022603E4
	cmp r0, #2
	beq _022603F8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_022603A6:
	ldr r0, [r5]
	bl BattleSystem_GetMessageIcon
	mov r1, #1
	bl sub_0201649C
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _02260414 ; =0x0000FFFF
	add r0, r4, #0
	mov r1, #0xf
	mov r3, #1
	bl PaletteData_BeginPaletteFade
	mov r1, #0
	add r0, r7, #0
	mov r2, #0x10
	add r3, r1, #0
	str r1, [sp]
	bl Pokepic_StartPaletteFadeAll
	mov r0, #0
	mov r1, #0x10
	bl GF_SndStartFadeOutBGM
	ldrb r0, [r5, #6]
	add r0, r0, #1
	strb r0, [r5, #6]
_022603E4:
	add r0, r4, #0
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _0226040E
	ldrb r0, [r5, #6]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r5, #6]
	pop {r4, r5, r6, r7, pc}
_022603F8:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl BattleController_EmitClearCommand
	add r0, r5, #0
	bl Heap_Free
	add r0, r6, #0
	bl SysTask_Destroy
_0226040E:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02260414: .word 0x0000FFFF
	thumb_func_end ov12_0226037C

	thumb_func_start ov12_02260418
ov12_02260418: ; 0x02260418
	push {r4, r5, r6, lr}
	sub sp, #0x110
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl ov12_0223A8DC
	add r1, r4, #0
	add r1, #0x62
	ldrb r1, [r1]
	add r5, r0, #0
	cmp r1, #4
	bls _02260434
	b _02260560
_02260434:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02260440: ; jump table
	.short _0226044A - _02260440 - 2 ; case 0
	.short _0226048C - _02260440 - 2 ; case 1
	.short _0226053C - _02260440 - 2 ; case 2
	.short _022604E0 - _02260440 - 2 ; case 3
	.short _0226053C - _02260440 - 2 ; case 4
_0226044A:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _02260482
	add r2, r4, #0
	add r2, #0x63
	ldrb r2, [r2]
	mov r1, #6
	bl Pokepic_SetAttr
	add r0, r4, #0
	add r0, #0x63
	ldrb r0, [r0]
	cmp r0, #1
	bne _02260472
	mov r0, #0xff
	add r4, #0x62
	add sp, #0x110
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_02260472:
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_02260482:
	mov r0, #0xff
	add r4, #0x62
	add sp, #0x110
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0226048C:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _022604D6
	mov r0, #0x1a
	ldr r1, [r4, #4]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _022604D6
	add r0, r4, #0
	add r0, #0x61
	ldrb r1, [r0]
	mov r0, #0xf
	add r2, sp, #0xb8
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0xb8
	bl BattleDisplay_PlayMoveAnimation
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_022604D6:
	mov r0, #0xff
	add r4, #0x62
	add sp, #0x110
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_022604E0:
	add r3, r4, #0
	add r3, #0x61
	ldrb r3, [r3]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #8
	add r2, sp, #0x68
	bl BattleDisplay_PopulateBattlerContext
	add r0, sp, #0x68
	mov r1, #5
	bl ov07_02234A20
	add r0, r4, #0
	add r0, #0x61
	ldrb r1, [r0]
	mov r0, #0x10
	add r2, sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4]
	mov r3, #1
	bl BattleController_SetMoveAnimation
	ldr r0, [r4]
	ldr r1, [r4, #4]
	add r2, r5, #0
	add r3, sp, #0x10
	bl BattleDisplay_PlayMoveAnimation
	mov r0, #0x1a
	ldr r1, [r4, #4]
	mov r2, #1
	lsl r0, r0, #4
	str r2, [r1, r0]
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_0226053C:
	bl ov07_0221C394
	add r0, r5, #0
	bl ov07_0221C3B0
	cmp r0, #0
	bne _0226057E
	add r0, r5, #0
	bl ov07_0221C3C0
	add r0, r4, #0
	add r0, #0x62
	ldrb r0, [r0]
	add r4, #0x62
	add sp, #0x110
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_02260560:
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0x61
	add r2, #0x60
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r6, #0
	bl SysTask_Destroy
_0226057E:
	add sp, #0x110
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_02260418

	thumb_func_start ov12_02260584
ov12_02260584: ; 0x02260584
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	beq _02260596
	cmp r0, #1
	beq _022605AC
	pop {r3, r4, r5, pc}
_02260596:
	ldr r0, [r4, #4]
	add r1, #0xb
	bl BattleHpBar_BeginExpBarFullFlashEffect
	ldr r0, _022605CC ; =0x0000070C
	bl PlaySE
	ldrb r0, [r4, #0xa]
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, pc}
_022605AC:
	ldrb r0, [r4, #0xb]
	cmp r0, #1
	bne _022605C8
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
_022605C8:
	pop {r3, r4, r5, pc}
	nop
_022605CC: .word 0x0000070C
	thumb_func_end ov12_02260584

	thumb_func_start ov12_022605D0
ov12_022605D0: ; 0x022605D0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BB78
	cmp r0, #0
	beq _022605F2
	ldr r0, [r4]
	bl ov12_0223BB78
	bl sub_0200F450
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223BB80
_022605F2:
	ldrb r0, [r4, #6]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02260612
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #4]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
_02260612:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_022605D0

	thumb_func_start ov12_02260614
ov12_02260614: ; 0x02260614
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _02260626
	cmp r0, #1
	beq _0226063C
	pop {r3, r4, r5, pc}
_02260626:
	ldrb r0, [r4, #6]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02260666
	ldrb r0, [r4, #7]
	add r0, r0, #1
	strb r0, [r4, #7]
	mov r0, #0
	strb r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0226063C:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #8]
	cmp r0, #0x28
	bne _02260666
	ldrb r1, [r4, #5]
	ldr r0, [r4]
	bl BattleController_EmitAlertMessageAck
	ldrb r1, [r4, #5]
	ldrb r2, [r4, #4]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
_02260666:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02260614

	thumb_func_start ov12_02260668
ov12_02260668: ; 0x02260668
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetBgConfig
	ldr r0, [r4]
	bl BattleSystem_GetPaletteData
	add r7, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetTerrainId
	add r5, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetBackgroundId
	lsl r1, r0, #2
	ldr r0, _022609DC ; =ov12_0226D18C
	ldr r0, [r0, r1]
	str r0, [sp, #0xc]
	ldrb r0, [r4, #0x15]
	add r0, r0, #1
	strb r0, [r4, #0x15]
	ldrb r0, [r4, #0x14]
	cmp r0, #5
	bls _022606A2
	b _022609D8
_022606A2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022606AE: ; jump table
	.short _022606BA - _022606AE - 2 ; case 0
	.short _022606FA - _022606AE - 2 ; case 1
	.short _022608B0 - _022606AE - 2 ; case 2
	.short _022608CC - _022606AE - 2 ; case 3
	.short _022608E8 - _022606AE - 2 ; case 4
	.short _022608FA - _022606AE - 2 ; case 5
_022606BA:
	mov r0, #5
	mov r1, #0
	bl ov07_0223458C
	str r0, [r4, #4]
	ldr r0, _022609E0 ; =ov12_0226D350
	add r1, sp, #0x10
	ldrb r5, [r0, r5]
	mov r0, #1
	str r0, [sp, #0x14]
	str r5, [sp, #0x10]
	ldr r0, [r4, #4]
	bl ov07_022345C8
	str r0, [r4, #8]
	add r0, r5, #1
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	bl ov07_022345C8
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	bl ov07_02234694
	ldr r0, _022609E4 ; =0x0000084F
	bl PlaySE
	mov r0, #1
	strb r0, [r4, #0x14]
_022606FA:
	ldrb r0, [r4, #0x15]
	cmp r0, #0xa
	bne _02260734
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r2, _022609E8 ; =0x0000F3FF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	bl PaletteData_BeginPaletteFade
	mov r3, #0
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r2, _022609EC ; =0x00003FFF
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r7, #0
	mov r1, #4
	bl PaletteData_BeginPaletteFade
_02260734:
	ldrb r0, [r4, #0x15]
	cmp r0, #0xa
	blo _0226077E
	ldrb r0, [r4, #0x16]
	cmp r0, #0x10
	bhs _0226077E
	add r0, r0, #1
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x16]
	cmp r0, #0x10
	bls _0226074E
	mov r0, #0x10
	strb r0, [r4, #0x16]
_0226074E:
	add r0, r7, #0
	mov r1, #1
	bl PaletteData_GetFadedBuf
	add r6, r0, #0
	mov r0, #1
	mov r5, #0
	lsl r0, r0, #8
_0226075E:
	ldrb r2, [r4, #0x16]
	mov r1, #0x1f
	mul r1, r2
	lsl r1, r1, #0xc
	lsr r3, r1, #0x10
	lsl r1, r3, #5
	lsl r2, r3, #0xa
	orr r1, r3
	orr r2, r1
	lsl r1, r5, #1
	strh r2, [r6, r1]
	add r1, r5, #1
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
	cmp r5, r0
	blo _0226075E
_0226077E:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x14
	bne _0226078A
	ldr r0, [r4, #0xc]
	bl ov07_02234694
_0226078A:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x17
	bne _02260798
	mov r0, #0x85
	lsl r0, r0, #4
	bl PlaySE
_02260798:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x1c
	bne _0226088A
	add r0, r7, #0
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAE0
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	cmp r0, #0x4a
	bne _022607DA
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _0226083C
_022607DA:
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	beq _022607FE
	add r0, r7, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	b _0226083C
_022607FE:
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	mov r1, #1
	tst r0, r1
	beq _02260824
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _0226083C
_02260824:
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0x80
	bl MIi_CpuCopy16
_0226083C:
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r3, #0
	lsl r0, r0, #0x10
	str r3, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, _022609E8 ; =0x0000F3FF
	add r0, r7, #0
	mov r1, #1
	bl PaletteData_BeginPaletteFade
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r3, #0
	lsl r0, r0, #0x10
	str r3, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, _022609EC ; =0x00003FFF
	add r0, r7, #0
	mov r1, #4
	bl PaletteData_BeginPaletteFade
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0xc]
	mov r3, #0
	lsl r0, r0, #0x10
	str r3, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, _022609F0 ; =0x0000FFFF
	add r0, r7, #0
	mov r1, #0xa
	bl PaletteData_BeginPaletteFade
_0226088A:
	ldrb r0, [r4, #0x15]
	cmp r0, #0x32
	blo _022608BA
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	str r3, [sp, #4]
	mov r2, #3
	str r3, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	lsl r2, r2, #0xa
	bl PaletteData_BeginPaletteFade
	ldrb r0, [r4, #0x14]
	add sp, #0x18
	add r0, r0, #1
	strb r0, [r4, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
_022608B0:
	ldr r0, [r4, #0xc]
	bl ov07_022346BC
	cmp r0, #0
	beq _022608BC
_022608BA:
	b _022609D8
_022608BC:
	ldr r0, [r4, #4]
	bl ov07_02234604
	ldrb r0, [r4, #0x14]
	add sp, #0x18
	add r0, r0, #1
	strb r0, [r4, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
_022608CC:
	ldr r0, [r4]
	bl BattleSystem_GetMessageIcon
	mov r1, #0
	bl sub_0201649C
	add r0, r4, #0
	bl Heap_Free
	add r0, r6, #0
	bl SysTask_Destroy
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_022608E8:
	ldr r0, [r4, #4]
	bl ov07_02234628
	ldr r0, [r4, #4]
	bl ov07_02234604
	ldrb r0, [r4, #0x14]
	add r0, r0, #1
	strb r0, [r4, #0x14]
_022608FA:
	add r0, r7, #0
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAE0
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	cmp r0, #0x4a
	bne _02260936
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _02260998
_02260936:
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	beq _0226095A
	add r0, r7, #0
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xe0
	bl MIi_CpuCopy16
	b _02260998
_0226095A:
	ldr r0, [r4]
	bl BattleSystem_GetBattleType
	mov r1, #1
	tst r0, r1
	beq _02260980
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0xa0
	bl MIi_CpuCopy16
	b _02260998
_02260980:
	add r0, r7, #0
	mov r1, #2
	bl PaletteData_GetUnfadedBuf
	add r5, r0, #0
	ldr r0, [r4]
	bl ov12_0223BAEC
	add r1, r5, #0
	mov r2, #0x80
	bl MIi_CpuCopy16
_02260998:
	mov r3, #0
	str r3, [sp]
	ldr r0, _022609F4 ; =0x00007FFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _022609F0 ; =0x0000FFFF
	add r0, r7, #0
	mov r1, #1
	bl PaletteData_BeginPaletteFade
	mov r3, #0
	str r3, [sp]
	ldr r2, _022609F0 ; =0x0000FFFF
	str r3, [sp, #4]
	str r2, [sp, #8]
	add r0, r7, #0
	mov r1, #4
	lsr r2, r2, #2
	bl PaletteData_BeginPaletteFade
	mov r3, #0
	str r3, [sp]
	ldr r0, _022609F4 ; =0x00007FFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r2, _022609F0 ; =0x0000FFFF
	add r0, r7, #0
	mov r1, #0xa
	bl PaletteData_BeginPaletteFade
	mov r0, #3
	strb r0, [r4, #0x14]
_022609D8:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022609DC: .word ov12_0226D18C
_022609E0: .word ov12_0226D350
_022609E4: .word 0x0000084F
_022609E8: .word 0x0000F3FF
_022609EC: .word 0x00003FFF
_022609F0: .word 0x0000FFFF
_022609F4: .word 0x00007FFF
	thumb_func_end ov12_02260668

	thumb_func_start ov12_022609F8
ov12_022609F8: ; 0x022609F8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	bl BattleSystem_GetPaletteData
	ldrb r1, [r4, #0xa]
	add r6, r0, #0
	cmp r1, #3
	bls _02260A10
	b _02260B28
_02260A10:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02260A1C: ; jump table
	.short _02260A24 - _02260A1C - 2 ; case 0
	.short _02260A44 - _02260A1C - 2 ; case 1
	.short _02260AB4 - _02260A1C - 2 ; case 2
	.short _02260AE6 - _02260A1C - 2 ; case 3
_02260A24:
	mov r2, #0
	str r2, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	mov r1, #0xa
	str r2, [sp, #8]
	add r3, r1, #0
	ldr r2, _02260B2C ; =0x0000FFFF
	sub r3, #0x12
	bl PaletteData_BeginPaletteFade
	ldrb r0, [r4, #0xa]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, pc}
_02260A44:
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _02260B28
	ldr r0, [r4]
	bl ov12_02237B0C
	mov r0, #5
	mov r1, #0x38
	bl Heap_Alloc
	str r0, [r4, #4]
	ldrb r1, [r4, #9]
	ldr r0, [r4]
	bl BattleSystem_GetParty
	ldr r1, [r4, #4]
	mov r2, #3
	str r0, [r1]
	ldr r1, [r4]
	ldr r0, [r4, #4]
	str r1, [r0, #8]
	ldr r0, [r4, #4]
	mov r1, #5
	str r1, [r0, #0xc]
	ldrb r1, [r4, #0xe]
	ldr r0, [r4, #4]
	strb r1, [r0, #0x11]
	ldrh r1, [r4, #0xc]
	ldr r0, [r4, #4]
	strh r1, [r0, #0x24]
	ldr r1, [r4, #4]
	mov r0, #0
	add r1, #0x36
	strb r0, [r1]
	ldr r1, [r4, #4]
	strb r0, [r1, #0x12]
	ldr r1, [r4, #4]
	add r1, #0x35
	strb r2, [r1]
	ldr r1, [r4, #4]
	strh r0, [r1, #0x22]
	ldrb r2, [r4, #9]
	ldr r1, [r4, #4]
	str r2, [r1, #0x28]
	ldr r1, [r4, #4]
	add r1, #0x32
	strb r0, [r1]
	ldr r0, [r4, #4]
	bl ov10_0221BE20
	ldrb r0, [r4, #0xa]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, pc}
_02260AB4:
	ldr r0, [r4, #4]
	add r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260B28
	ldr r0, [r4]
	bl ov12_02237BB8
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	mov r1, #0xa
	str r0, [sp, #4]
	add r3, r1, #0
	str r0, [sp, #8]
	ldr r2, _02260B2C ; =0x0000FFFF
	add r0, r6, #0
	sub r3, #0x12
	bl PaletteData_BeginPaletteFade
	ldrb r0, [r4, #0xa]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #0xa]
	pop {r3, r4, r5, r6, pc}
_02260AE6:
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _02260B28
	ldr r0, [r4, #4]
	add r0, #0x34
	ldrb r2, [r0]
	ldr r0, [r4]
	cmp r2, #4
	bne _02260B04
	ldrb r1, [r4, #9]
	mov r2, #0xff
	bl BattleController_EmitPartyMenuResult
	b _02260B0C
_02260B04:
	ldrb r1, [r4, #9]
	add r2, r2, #1
	bl BattleController_EmitPartyMenuResult
_02260B0C:
	ldrb r1, [r4, #9]
	ldrb r2, [r4, #8]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	ldr r0, [r4, #4]
	bl Heap_Free
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
_02260B28:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02260B2C: .word 0x0000FFFF
	thumb_func_end ov12_022609F8

	thumb_func_start ov12_02260B30
ov12_02260B30: ; 0x02260B30
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5, #0xa]
	cmp r0, #0
	beq _02260B42
	cmp r0, #1
	beq _02260B86
	pop {r3, r4, r5, pc}
_02260B42:
	ldrb r1, [r5, #0xc]
	ldrb r0, [r5, #0xd]
	cmp r1, r0
	bne _02260B80
	mov r0, #0
	strb r0, [r5, #0xc]
	ldr r0, [r5, #4]
	mov r1, #0x28
	bl Pokepic_GetAttr
	add r4, r0, #0
	ldrb r0, [r5, #0xb]
	cmp r4, r0
	ble _02260B62
	sub r4, r4, #1
	b _02260B68
_02260B62:
	cmp r4, r0
	bge _02260B68
	add r4, r4, #1
_02260B68:
	ldr r0, [r5, #4]
	mov r1, #0x28
	add r2, r4, #0
	bl Pokepic_SetAttr
	ldrb r0, [r5, #0xb]
	cmp r4, r0
	bne _02260B9C
	ldrb r0, [r5, #0xa]
	add r0, r0, #1
	strb r0, [r5, #0xa]
	pop {r3, r4, r5, pc}
_02260B80:
	add r0, r1, #1
	strb r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
_02260B86:
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #8]
	ldr r0, [r5]
	bl BattleController_EmitClearCommand
	add r0, r5, #0
	bl Heap_Free
	add r0, r4, #0
	bl SysTask_Destroy
_02260B9C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02260B30

	thumb_func_start ov12_02260BA0
ov12_02260BA0: ; 0x02260BA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldrb r1, [r5, #5]
	add r4, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _02260BB8
	mov r6, #0
	b _02260BBA
_02260BB8:
	mov r6, #1
_02260BBA:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _02260BC6
	cmp r0, #1
	beq _02260C22
	b _02260C3C
_02260BC6:
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _02260BD4
	mov r0, #0
	str r0, [sp, #8]
	mov r7, #1
	b _02260BEE
_02260BD4:
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #6]
	cmp r0, #3
	beq _02260BE4
	cmp r0, #5
	beq _02260BE8
	b _02260BEC
_02260BE4:
	mov r7, #0
	b _02260BEE
_02260BE8:
	mov r7, #2
	b _02260BEE
_02260BEC:
	ldr r7, [sp, #8]
_02260BEE:
	ldr r0, [r5]
	bl BattleSystem_GetSpriteSystem
	add r4, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetSpriteManager
	str r4, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	ldr r2, [sp, #8]
	add r0, #8
	add r1, r6, #0
	add r3, r7, #0
	bl PartyGauge_NewAndShow
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r6, #0
	bl ov12_0223A914
	ldrb r0, [r5, #7]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r4, r5, r6, r7, pc}
_02260C22:
	ldr r0, [r5]
	add r1, r6, #0
	bl ov12_0223A908
	bl PartyGauge_IsArrowTaskFinished
	cmp r0, #1
	bne _02260C52
	ldrb r0, [r5, #7]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r4, r5, r6, r7, pc}
_02260C3C:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl BattleController_EmitClearCommand
	add r0, r5, #0
	bl Heap_Free
	add r0, r4, #0
	bl SysTask_Destroy
_02260C52:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02260BA0

	thumb_func_start ov12_02260C58
ov12_02260C58: ; 0x02260C58
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldrb r1, [r5, #5]
	add r7, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	bne _02260C6E
	mov r4, #0
	b _02260C70
_02260C6E:
	mov r4, #1
_02260C70:
	ldr r0, [r5]
	add r1, r4, #0
	bl ov12_0223A908
	ldrb r1, [r5, #7]
	add r6, r0, #0
	cmp r1, #0
	beq _02260C86
	cmp r1, #1
	beq _02260CA2
	b _02260CC2
_02260C86:
	ldrb r0, [r5, #0xe]
	cmp r0, #0
	bne _02260C90
	mov r1, #0
	b _02260C92
_02260C90:
	mov r1, #1
_02260C92:
	add r0, r6, #0
	add r2, r1, #0
	bl PartyGauge_StartHideTask
	ldrb r0, [r5, #7]
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r3, r4, r5, r6, r7, pc}
_02260CA2:
	bl PartyGauge_IsHideTaskFinished
	cmp r0, #1
	bne _02260CD8
	add r0, r6, #0
	bl PartyGauge_DeleteAndFreeResources
	ldr r0, [r5]
	add r1, r4, #0
	mov r2, #0
	bl ov12_0223A914
	ldrb r0, [r5, #7]
	add r0, r0, #1
	strb r0, [r5, #7]
	pop {r3, r4, r5, r6, r7, pc}
_02260CC2:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl BattleController_EmitClearCommand
	add r0, r5, #0
	bl Heap_Free
	add r0, r7, #0
	bl SysTask_Destroy
_02260CD8:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02260C58

	thumb_func_start ov12_02260CDC
ov12_02260CDC: ; 0x02260CDC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xe]
	cmp r0, #0
	bne _02260D0E
	ldr r0, [r4, #4]
	add r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _02260CF6
	bl GF_AssertFail
_02260CF6:
	ldrb r2, [r4, #0xd]
	ldr r0, [r4]
	mov r1, #5
	bl ov07_0221FB90
	ldr r1, [r4, #4]
	add r1, #0x8c
	str r0, [r1]
	ldrb r0, [r4, #0xe]
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, pc}
_02260D0E:
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02260CDC

	thumb_func_start ov12_02260D28
ov12_02260D28: ; 0x02260D28
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	add r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	bne _02260D3C
	bl GF_AssertFail
_02260D3C:
	ldr r0, [r4, #4]
	add r0, #0x8c
	ldr r0, [r0]
	bl ov07_0221FE70
	cmp r0, #3
	bne _02260D56
	ldrb r0, [r4, #0xe]
	cmp r0, #5
	bhs _02260D56
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r3, r4, r5, pc}
_02260D56:
	ldr r0, [r4, #4]
	ldrb r1, [r4, #0xd]
	add r0, #0x8c
	ldr r0, [r0]
	bl ov07_0221FE3C
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, #0x8c
	str r1, [r0]
	ldrb r1, [r4, #0xd]
	ldrb r2, [r4, #0xc]
	ldr r0, [r4]
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02260D28

	thumb_func_start ov12_02260D84
ov12_02260D84: ; 0x02260D84
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetPaletteData
	add r4, r0, #0
	ldr r0, [r5]
	bl BattleSystem_GetPokepicManager
	add r7, r0, #0
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _02260DAE
	cmp r0, #1
	beq _02260DE0
	cmp r0, #2
	beq _02260E84
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02260DAE:
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _02260DD2
	ldr r0, [r5]
	bl BattleSystem_GetMessageIcon
	mov r1, #1
	bl sub_0201649C
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp]
	add r0, r7, #0
	mov r2, #0x10
	add r3, r1, #0
	bl Pokepic_StartPaletteFadeAll
	b _02260DDA
_02260DD2:
	mov r0, #0
	mov r1, #0x10
	bl GF_SndStartFadeOutBGM
_02260DDA:
	ldrb r0, [r5, #6]
	add r0, r0, #1
	strb r0, [r5, #6]
_02260DE0:
	ldrb r0, [r5, #7]
	cmp r0, #0
	ldrb r0, [r5, #8]
	bne _02260E24
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xa0
	bl PaletteData_BlendPalette
	ldrb r0, [r5, #8]
	mov r1, #0
	mov r2, #0xc0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r3, #0x40
	str r0, [sp, #4]
	add r0, r4, #0
	bl PaletteData_BlendPalette
	ldrb r0, [r5, #8]
	mov r1, #2
	mov r2, #0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r3, #0xe0
	str r0, [sp, #4]
	add r0, r4, #0
	bl PaletteData_BlendPalette
	b _02260E62
_02260E24:
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r1, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0xa0
	mov r3, #0x20
	bl PaletteData_BlendPalette
	ldrb r0, [r5, #8]
	mov r1, #1
	add r3, r1, #0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, #0xff
	bl PaletteData_BlendPalette
	ldrb r0, [r5, #8]
	mov r1, #3
	add r3, r1, #0
	str r0, [sp]
	ldr r0, _02260EA0 ; =0x0000FFFF
	mov r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, #0xfd
	bl PaletteData_BlendPalette
_02260E62:
	ldrb r1, [r5, #8]
	add r0, r1, #1
	strb r0, [r5, #8]
	cmp r1, #0x10
	bne _02260E9A
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _02260E7A
	mov r0, #0
	add r1, r0, #0
	bl ToggleBgLayer
_02260E7A:
	ldrb r0, [r5, #6]
	add sp, #8
	add r0, r0, #1
	strb r0, [r5, #6]
	pop {r3, r4, r5, r6, r7, pc}
_02260E84:
	ldrb r1, [r5, #5]
	ldrb r2, [r5, #4]
	ldr r0, [r5]
	bl BattleController_EmitClearCommand
	add r0, r5, #0
	bl Heap_Free
	add r0, r6, #0
	bl SysTask_Destroy
_02260E9A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02260EA0: .word 0x0000FFFF
	thumb_func_end ov12_02260D84

	thumb_func_start ov12_02260EA4
ov12_02260EA4: ; 0x02260EA4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl BattleSystem_GetBattleType
	add r4, r0, #0
	add r0, r6, #0
	bl BattleSystem_GetBattleSpecial
	mov r1, #0x40
	tst r1, r4
	beq _02260F2C
	mov r2, #0x65
	lsl r2, r2, #2
	ldrb r1, [r5, r2]
	cmp r1, #0
	beq _02260EE6
	ldr r0, _022611E8 ; =BattleDisplayTask_TrainerSetCommandSelection
	mov r1, #1
	str r0, [r5]
	ldr r0, _022611EC ; =BattleDisplayTask_TrainerShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _022611F0 ; =BattleDisplayTask_TrainerShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _022611F4 ; =BattleDisplayTask_TrainerShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _022611F8 ; =BattleDisplayTask_TrainerShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _022611FC ; =BattleDisplayTask_TrainerShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r2, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260EE6:
	mov r1, #0x10
	tst r0, r1
	beq _02260F0C
	ldr r0, _02261200 ; =BattleDisplayTask_RecordingSetCommandSelection
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =BattleDisplayTask_RecordingShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261208 ; =BattleDisplayTask_RecordingShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _0226120C ; =BattleDisplayTask_RecordingShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =BattleDisplayTask_RecordingShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	add r0, r2, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F0C:
	ldr r0, _02261218 ; =BattleDisplayTask_PlayerSetCommandSelection
	mov r1, #0
	str r0, [r5]
	ldr r0, _0226121C ; =BattleDisplayTask_PlayerShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261220 ; =BattleDisplayTask_PlayerShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _02261224 ; =BattleDisplayTask_PlayerShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =BattleDisplayTask_PlayerShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =BattleDisplayTask_PlayerShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r2, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F2C:
	mov r1, #0x88
	and r1, r4
	cmp r1, #0x88
	bne _02261006
	ldr r2, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r3, [r5, r2]
	tst r1, r3
	beq _02260F88
	add r0, r6, #0
	bl BattleSystem_IsInitialized
	cmp r0, #0
	beq _02260F68
	ldr r0, _022611E8 ; =BattleDisplayTask_TrainerSetCommandSelection
	mov r1, #1
	str r0, [r5]
	ldr r0, _022611EC ; =BattleDisplayTask_TrainerShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _022611F0 ; =BattleDisplayTask_TrainerShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _022611F4 ; =BattleDisplayTask_TrainerShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _022611F8 ; =BattleDisplayTask_TrainerShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _022611FC ; =BattleDisplayTask_TrainerShowYesNoMenu
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F68:
	ldr r0, _02261238 ; =BattleDisplayTask_LinkSetCommandSelection
	mov r1, #2
	str r0, [r5]
	ldr r0, _0226123C ; =BattleDisplayTask_LinkShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261240 ; =BattleDisplayTask_LinkShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _02261244 ; =BattleDisplayTask_LinkShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261248 ; =BattleDisplayTask_LinkShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _0226124C ; =BattleDisplayTask_LinkShowYesNoMenu
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260F88:
	mov r1, #0x10
	tst r0, r1
	beq _02260FAE
	ldr r0, _02261200 ; =BattleDisplayTask_RecordingSetCommandSelection
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =BattleDisplayTask_RecordingShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261208 ; =BattleDisplayTask_RecordingShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _0226120C ; =BattleDisplayTask_RecordingShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =BattleDisplayTask_RecordingShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02260FAE:
	add r0, r6, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r6, #0
	lsl r1, r1, #1
	bl ov12_0223AB0C
	ldr r1, _02261230 ; =0x00000195
	ldrb r2, [r5, r1]
	cmp r2, r0
	beq _02260FE6
	ldr r0, _02261238 ; =BattleDisplayTask_LinkSetCommandSelection
	mov r2, #2
	str r0, [r5]
	ldr r0, _0226123C ; =BattleDisplayTask_LinkShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261240 ; =BattleDisplayTask_LinkShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _02261244 ; =BattleDisplayTask_LinkShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261248 ; =BattleDisplayTask_LinkShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _0226124C ; =BattleDisplayTask_LinkShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02260FE6:
	ldr r0, _02261218 ; =BattleDisplayTask_PlayerSetCommandSelection
	mov r2, #0
	str r0, [r5]
	ldr r0, _0226121C ; =BattleDisplayTask_PlayerShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261220 ; =BattleDisplayTask_PlayerShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _02261224 ; =BattleDisplayTask_PlayerShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =BattleDisplayTask_PlayerShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =BattleDisplayTask_PlayerShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02261006:
	mov r1, #8
	tst r1, r4
	beq _02261088
	mov r1, #0x10
	tst r0, r1
	beq _02261032
	ldr r0, _02261200 ; =BattleDisplayTask_RecordingSetCommandSelection
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =BattleDisplayTask_RecordingShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261208 ; =BattleDisplayTask_RecordingShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _0226120C ; =BattleDisplayTask_RecordingShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =BattleDisplayTask_RecordingShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261032:
	add r0, r6, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r6, #0
	bl ov12_0223AB0C
	ldr r1, _02261230 ; =0x00000195
	ldrb r2, [r5, r1]
	cmp r2, r0
	beq _02261068
	ldr r0, _02261238 ; =BattleDisplayTask_LinkSetCommandSelection
	mov r2, #2
	str r0, [r5]
	ldr r0, _0226123C ; =BattleDisplayTask_LinkShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261240 ; =BattleDisplayTask_LinkShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _02261244 ; =BattleDisplayTask_LinkShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261248 ; =BattleDisplayTask_LinkShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _0226124C ; =BattleDisplayTask_LinkShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02261068:
	ldr r0, _02261218 ; =BattleDisplayTask_PlayerSetCommandSelection
	mov r2, #0
	str r0, [r5]
	ldr r0, _0226121C ; =BattleDisplayTask_PlayerShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261220 ; =BattleDisplayTask_PlayerShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _02261224 ; =BattleDisplayTask_PlayerShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =BattleDisplayTask_PlayerShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =BattleDisplayTask_PlayerShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r1, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_02261088:
	mov r1, #4
	add r2, r4, #0
	tst r2, r1
	beq _02261100
	mov r1, #0x10
	tst r0, r1
	beq _022610B6
	ldr r0, _02261200 ; =BattleDisplayTask_RecordingSetCommandSelection
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =BattleDisplayTask_RecordingShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261208 ; =BattleDisplayTask_RecordingShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _0226120C ; =BattleDisplayTask_RecordingShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =BattleDisplayTask_RecordingShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	ldr r0, _02261234 ; =0x00000196
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022610B6:
	ldr r0, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r2, [r5, r0]
	tst r1, r2
	beq _022610E0
	ldr r1, _02261238 ; =BattleDisplayTask_LinkSetCommandSelection
	add r0, r0, #1
	str r1, [r5]
	ldr r1, _0226123C ; =BattleDisplayTask_LinkShowMoveSelectMenu
	str r1, [r5, #4]
	ldr r1, _02261240 ; =BattleDisplayTask_LinkShowTargetSelectMenu
	str r1, [r5, #8]
	ldr r1, _02261244 ; =BattleDisplayTask_LinkShowBagMenu
	str r1, [r5, #0xc]
	ldr r1, _02261248 ; =BattleDisplayTask_LinkShowPartyMenu
	str r1, [r5, #0x10]
	ldr r1, _0226124C ; =BattleDisplayTask_LinkShowYesNoMenu
	str r1, [r5, #0x14]
	mov r1, #2
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022610E0:
	ldr r1, _02261218 ; =BattleDisplayTask_PlayerSetCommandSelection
	add r0, r0, #1
	str r1, [r5]
	ldr r1, _0226121C ; =BattleDisplayTask_PlayerShowMoveSelectMenu
	str r1, [r5, #4]
	ldr r1, _02261220 ; =BattleDisplayTask_PlayerShowTargetSelectMenu
	str r1, [r5, #8]
	ldr r1, _02261224 ; =BattleDisplayTask_PlayerShowBagMenu
	str r1, [r5, #0xc]
	ldr r1, _02261228 ; =BattleDisplayTask_PlayerShowPartyMenu
	str r1, [r5, #0x10]
	ldr r1, _0226122C ; =BattleDisplayTask_PlayerShowYesNoMenu
	str r1, [r5, #0x14]
	mov r1, #0
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261100:
	lsl r1, r1, #7
	tst r1, r4
	beq _0226113C
	ldr r0, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r2, [r5, r0]
	tst r2, r1
	beq _02261126
	ldr r2, _02261250 ; =BattleDisplayTask_PalParkPokemonSetCommandSelection
	add r0, r0, #1
	str r2, [r5]
	mov r2, #0
	str r2, [r5, #4]
	str r2, [r5, #8]
	str r2, [r5, #0xc]
	str r2, [r5, #0x10]
	str r2, [r5, #0x14]
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261126:
	ldr r1, _02261218 ; =BattleDisplayTask_PlayerSetCommandSelection
	add r0, r0, #1
	str r1, [r5]
	mov r1, #0
	str r1, [r5, #4]
	str r1, [r5, #8]
	str r1, [r5, #0xc]
	str r1, [r5, #0x10]
	str r1, [r5, #0x14]
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0226113C:
	mov r1, #0x20
	tst r1, r4
	beq _0226117A
	ldr r0, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r2, [r5, r0]
	tst r2, r1
	beq _02261162
	ldr r2, _02261254 ; =BattleDisplayTask_SafariPokemonSetCommandSelection
	add r0, r0, #1
	str r2, [r5]
	mov r2, #0
	str r2, [r5, #4]
	str r2, [r5, #8]
	str r2, [r5, #0xc]
	str r2, [r5, #0x10]
	str r2, [r5, #0x14]
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_02261162:
	ldr r1, _02261218 ; =BattleDisplayTask_PlayerSetCommandSelection
	mov r2, #0
	str r1, [r5]
	str r2, [r5, #4]
	str r2, [r5, #8]
	str r2, [r5, #0xc]
	ldr r1, _0226122C ; =BattleDisplayTask_PlayerShowYesNoMenu
	str r2, [r5, #0x10]
	str r1, [r5, #0x14]
	add r0, r0, #1
	strb r2, [r5, r0]
	pop {r4, r5, r6, pc}
_0226117A:
	ldr r2, _02261230 ; =0x00000195
	mov r1, #1
	ldrb r3, [r5, r2]
	tst r3, r1
	beq _022611A2
	ldr r0, _022611E8 ; =BattleDisplayTask_TrainerSetCommandSelection
	str r0, [r5]
	ldr r0, _022611EC ; =BattleDisplayTask_TrainerShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _022611F0 ; =BattleDisplayTask_TrainerShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _022611F4 ; =BattleDisplayTask_TrainerShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _022611F8 ; =BattleDisplayTask_TrainerShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _022611FC ; =BattleDisplayTask_TrainerShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022611A2:
	mov r1, #0x10
	tst r0, r1
	beq _022611C8
	ldr r0, _02261200 ; =BattleDisplayTask_RecordingSetCommandSelection
	mov r1, #0
	str r0, [r5]
	ldr r0, _02261204 ; =BattleDisplayTask_RecordingShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261208 ; =BattleDisplayTask_RecordingShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _0226120C ; =BattleDisplayTask_RecordingShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261210 ; =BattleDisplayTask_RecordingShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _02261214 ; =ov12_0225FCC0
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_022611C8:
	ldr r0, _02261218 ; =BattleDisplayTask_PlayerSetCommandSelection
	mov r1, #0
	str r0, [r5]
	ldr r0, _0226121C ; =BattleDisplayTask_PlayerShowMoveSelectMenu
	str r0, [r5, #4]
	ldr r0, _02261220 ; =BattleDisplayTask_PlayerShowTargetSelectMenu
	str r0, [r5, #8]
	ldr r0, _02261224 ; =BattleDisplayTask_PlayerShowBagMenu
	str r0, [r5, #0xc]
	ldr r0, _02261228 ; =BattleDisplayTask_PlayerShowPartyMenu
	str r0, [r5, #0x10]
	ldr r0, _0226122C ; =BattleDisplayTask_PlayerShowYesNoMenu
	str r0, [r5, #0x14]
	add r0, r2, #1
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022611E8: .word BattleDisplayTask_TrainerSetCommandSelection
_022611EC: .word BattleDisplayTask_TrainerShowMoveSelectMenu
_022611F0: .word BattleDisplayTask_TrainerShowTargetSelectMenu
_022611F4: .word BattleDisplayTask_TrainerShowBagMenu
_022611F8: .word BattleDisplayTask_TrainerShowPartyMenu
_022611FC: .word BattleDisplayTask_TrainerShowYesNoMenu
_02261200: .word BattleDisplayTask_RecordingSetCommandSelection
_02261204: .word BattleDisplayTask_RecordingShowMoveSelectMenu
_02261208: .word BattleDisplayTask_RecordingShowTargetSelectMenu
_0226120C: .word BattleDisplayTask_RecordingShowBagMenu
_02261210: .word BattleDisplayTask_RecordingShowPartyMenu
_02261214: .word ov12_0225FCC0
_02261218: .word BattleDisplayTask_PlayerSetCommandSelection
_0226121C: .word BattleDisplayTask_PlayerShowMoveSelectMenu
_02261220: .word BattleDisplayTask_PlayerShowTargetSelectMenu
_02261224: .word BattleDisplayTask_PlayerShowBagMenu
_02261228: .word BattleDisplayTask_PlayerShowPartyMenu
_0226122C: .word BattleDisplayTask_PlayerShowYesNoMenu
_02261230: .word 0x00000195
_02261234: .word 0x00000196
_02261238: .word BattleDisplayTask_LinkSetCommandSelection
_0226123C: .word BattleDisplayTask_LinkShowMoveSelectMenu
_02261240: .word BattleDisplayTask_LinkShowTargetSelectMenu
_02261244: .word BattleDisplayTask_LinkShowBagMenu
_02261248: .word BattleDisplayTask_LinkShowPartyMenu
_0226124C: .word BattleDisplayTask_LinkShowYesNoMenu
_02261250: .word BattleDisplayTask_PalParkPokemonSetCommandSelection
_02261254: .word BattleDisplayTask_SafariPokemonSetCommandSelection
	thumb_func_end ov12_02260EA4

	thumb_func_start ov12_02261258
ov12_02261258: ; 0x02261258
	ldr r1, _02261260 ; =0x00000195
	ldrb r0, [r0, r1]
	bx lr
	nop
_02261260: .word 0x00000195
	thumb_func_end ov12_02261258

	thumb_func_start ov12_02261264
ov12_02261264: ; 0x02261264
	ldr r1, _0226126C ; =0x00000196
	ldrb r0, [r0, r1]
	bx lr
	nop
_0226126C: .word 0x00000196
	thumb_func_end ov12_02261264

	thumb_func_start ov12_02261270
ov12_02261270: ; 0x02261270
	ldr r1, [r0, #0x20]
	cmp r1, #0
	bne _02261278
	ldr r1, [r0, #0x1c]
_02261278:
	add r0, r1, #0
	bx lr
	thumb_func_end ov12_02261270

	thumb_func_start OpponentData_GetHpBar
OpponentData_GetHpBar: ; 0x0226127C
	add r0, #0x28
	bx lr
	thumb_func_end OpponentData_GetHpBar

	thumb_func_start ov12_02261280
ov12_02261280: ; 0x02261280
	add r0, #0x80
	bx lr
	thumb_func_end ov12_02261280

	thumb_func_start OpponentData_ClearSavedCursorPosition
OpponentData_ClearSavedCursorPosition: ; 0x02261284
	ldr r3, _02261290 ; =MI_CpuFill8
	add r0, #0x80
	mov r1, #0
	mov r2, #8
	bx r3
	nop
_02261290: .word MI_CpuFill8
	thumb_func_end OpponentData_ClearSavedCursorPosition

	thumb_func_start ov12_02261294
ov12_02261294: ; 0x02261294
	push {r3, lr}
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _022612A0
	bl ManagedSprite_SetDrawFlag
_022612A0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov12_02261294

	thumb_func_start BattleDisplay_NewPokepic
BattleDisplay_NewPokepic: ; 0x022612A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r4, [sp, #0x50]
	add r7, r0, #0
	str r1, [sp, #0x14]
	add r5, r2, #0
	str r3, [sp, #0x18]
	bl ov12_0223A99C
	add r1, r4, #0
	bl ov12_0223BB94
	str r0, [sp, #0x20]
	add r0, r7, #0
	add r1, r4, #0
	bl ov12_0223AB0C
	add r6, r0, #0
	mov r0, #1
	and r0, r6
	str r0, [sp, #0x1c]
	beq _022612D4
	mov r1, #2
	b _022612D6
_022612D4:
	mov r1, #0
_022612D6:
	ldr r0, [r5, #0xc]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldrh r0, [r5, #6]
	mov r2, #5
	str r0, [sp, #0xc]
	ldrh r0, [r5]
	ldrh r1, [r5, #2]
	bl sub_02014540
	add r0, r7, #0
	bl ov12_0223A99C
	ldrh r2, [r5]
	add r1, r4, #0
	bl ov12_0223BBA8
	add r0, r7, #0
	bl ov12_0223A99C
	ldrh r2, [r5, #4]
	add r1, r4, #0
	bl ov12_0223BBC0
	add r0, r7, #0
	bl ov12_0223A99C
	ldr r2, [sp, #0x40]
	add r1, r4, #0
	bl ov12_0223BBD8
	ldr r0, [sp, #0x3c]
	ldr r3, [sp, #0x40]
	str r0, [sp]
	str r4, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [sp, #0x54]
	ldr r4, [sp, #0x38]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x58]
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	add r3, r4, r3
	bl PokepicManager_CreatePokepicAt
	add r4, r0, #0
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0226138A
	cmp r6, #1
	ble _02261348
	asr r6, r6, #1
_02261348:
	add r0, r4, #0
	mov r1, #0x2a
	add r2, r6, #0
	bl Pokepic_SetAttr
	ldr r2, [sp, #0x4c]
	add r0, r4, #0
	mov r1, #0x2e
	bl Pokepic_SetAttr
	ldr r2, [sp, #0x38]
	add r0, r4, #0
	mov r1, #0x14
	add r2, #0x24
	bl Pokepic_SetAttr
	ldr r2, [sp, #0x48]
	add r0, r4, #0
	mov r1, #0x15
	bl Pokepic_SetAttr
	ldr r3, [sp, #0x40]
	mov r2, #0x24
	add r0, r4, #0
	mov r1, #0x16
	sub r2, r2, r3
	bl Pokepic_SetAttr
	ldr r2, [sp, #0x44]
	add r0, r4, #0
	mov r1, #0x29
	bl Pokepic_SetAttr
_0226138A:
	add r0, r4, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end BattleDisplay_NewPokepic

	thumb_func_start ov12_02261390
ov12_02261390: ; 0x02261390
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _0226144C ; =0x00000195
	add r6, r2, #0
	ldrb r2, [r5, r1]
	mov r1, #1
	add r7, r0, #0
	add r4, r3, #0
	tst r1, r2
	beq _022613EA
	bl BattleSystem_GetBattleType
	mov r1, #4
	tst r0, r1
	beq _022613CA
	ldr r0, _02261450 ; =0x000003DE
	strh r0, [r4, #2]
	mov r0, #0x1b
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022613CA:
	ldr r0, _02261454 ; =0x000003DD
	strh r0, [r4, #2]
	mov r0, #0x32
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	str r1, [r4, #8]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_022613EA:
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	bne _02261434
	add r0, r7, #0
	bl BattleSystem_GetBattleType
	mov r1, #4
	tst r0, r1
	bne _02261434
	ldrh r0, [r6, #2]
	cmp r0, #0
	bne _0226140E
	mov r0, #0xf6
	lsl r0, r0, #2
	strh r0, [r4, #2]
	b _02261438
_0226140E:
	cmp r0, #0x19
	bhs _02261418
	ldr r0, _02261458 ; =0x000003D9
	strh r0, [r4, #2]
	b _02261438
_02261418:
	cmp r0, #0x32
	bhs _02261424
	mov r0, #0xf7
	lsl r0, r0, #2
	strh r0, [r4, #2]
	b _02261438
_02261424:
	cmp r0, #0x4b
	bhs _0226142E
	ldr r0, _0226145C ; =0x000003DA
	strh r0, [r4, #2]
	b _02261438
_0226142E:
	ldr r0, _02261460 ; =0x000003DB
	strh r0, [r4, #2]
	b _02261438
_02261434:
	ldr r0, _02261458 ; =0x000003D9
	strh r0, [r4, #2]
_02261438:
	mov r0, #2
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0226144C: .word 0x00000195
_02261450: .word 0x000003DE
_02261454: .word 0x000003DD
_02261458: .word 0x000003D9
_0226145C: .word 0x000003DA
_02261460: .word 0x000003DB
	thumb_func_end ov12_02261390

	thumb_func_start ov12_02261464
ov12_02261464: ; 0x02261464
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldr r1, _02261524 ; =0x00000195
	add r6, r2, #0
	ldrb r2, [r5, r1]
	mov r1, #1
	add r7, r0, #0
	add r4, r3, #0
	tst r1, r2
	beq _022614C0
	bl BattleSystem_GetBattleType
	mov r1, #4
	tst r0, r1
	bne _022614A4
	mov r0, #0xf3
	lsl r0, r0, #2
	strh r0, [r4, #2]
	mov r0, #0x32
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	str r1, [r4, #8]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_022614A4:
	ldr r0, _02261528 ; =0x000003CE
	strh r0, [r4, #2]
	mov r0, #0x1b
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	str r1, [r4, #4]
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022614C0:
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	bne _0226150C
	add r0, r7, #0
	bl BattleSystem_GetBattleType
	mov r1, #4
	tst r0, r1
	bne _0226150C
	ldrh r1, [r6, #2]
	cmp r1, #0x64
	bhs _022614E2
	ldr r0, _0226152C ; =0x000003D6
	strh r0, [r4, #2]
	b _02261510
_022614E2:
	ldr r0, _02261530 ; =0x00000145
	cmp r1, r0
	bhs _022614EE
	ldr r0, _02261534 ; =0x000003D7
	strh r0, [r4, #2]
	b _02261510
_022614EE:
	add r0, #0xe1
	cmp r1, r0
	bhs _022614FA
	ldr r0, _02261538 ; =0x000003D5
	strh r0, [r4, #2]
	b _02261510
_022614FA:
	ldr r0, _0226153C ; =0x00000307
	cmp r1, r0
	bhs _02261506
	add r0, #0xcd
	strh r0, [r4, #2]
	b _02261510
_02261506:
	add r0, #0xcc
	strh r0, [r4, #2]
	b _02261510
_0226150C:
	ldr r0, _02261540 ; =0x000003D3
	strh r0, [r4, #2]
_02261510:
	mov r0, #2
	strb r0, [r4, #1]
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	ldrb r0, [r6, #1]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02261524: .word 0x00000195
_02261528: .word 0x000003CE
_0226152C: .word 0x000003D6
_02261530: .word 0x00000145
_02261534: .word 0x000003D7
_02261538: .word 0x000003D5
_0226153C: .word 0x00000307
_02261540: .word 0x000003D3
	thumb_func_end ov12_02261464

	thumb_func_start ov12_02261544
ov12_02261544: ; 0x02261544
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r2, #0
	bl BattleSystem_GetBattleType
	add r4, r0, #0
	mov r0, #2
	tst r0, r4
	beq _0226156A
	add r0, r7, #0
	mov r1, #3
	bl BattleSystem_GetBattlerFromBattlerType
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #5
	bl BattleSystem_GetBattlerFromBattlerType
	b _02261574
_0226156A:
	add r0, r7, #0
	mov r1, #1
	bl BattleSystem_GetBattlerFromBattlerType
	add r6, r0, #0
_02261574:
	mov r1, #4
	tst r1, r4
	beq _022615B4
	mov r1, #0x80
	tst r1, r4
	beq _02261594
	mov r1, #0x3e
	lsl r1, r1, #4
	strh r1, [r5, #2]
	mov r1, #0x3b
	strb r1, [r5, #1]
	str r6, [r5, #4]
	str r6, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_02261594:
	mov r1, #8
	add r2, r4, #0
	tst r2, r1
	beq _022615AA
	ldr r1, _022615E4 ; =0x000003CB
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r6, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022615AA:
	ldr r0, _022615E8 ; =0x000003CA
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r6, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_022615B4:
	mov r1, #0x10
	tst r1, r4
	bne _022615C0
	mov r1, #8
	tst r1, r4
	beq _022615D4
_022615C0:
	mov r1, #0x3e
	lsl r1, r1, #4
	strh r1, [r5, #2]
	mov r1, #0x3b
	strb r1, [r5, #1]
	str r6, [r5, #4]
	str r6, [r5, #8]
	str r0, [r5, #0xc]
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_022615D4:
	ldr r0, _022615EC ; =0x000003C9
	strh r0, [r5, #2]
	mov r0, #0x1e
	strb r0, [r5, #1]
	str r6, [r5, #4]
	str r6, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022615E4: .word 0x000003CB
_022615E8: .word 0x000003CA
_022615EC: .word 0x000003C9
	thumb_func_end ov12_02261544

	thumb_func_start ov12_022615F0
ov12_022615F0: ; 0x022615F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #4]
	str r0, [sp]
	add r6, r2, #0
	add r4, r3, #0
	bl BattleSystem_GetBattleType
	str r0, [sp, #0x14]
	ldr r2, _02261904 ; =0x00000195
	ldr r0, [sp, #4]
	ldrb r1, [r0, r2]
	mov r0, #1
	tst r0, r1
	bne _02261610
	b _02261758
_02261610:
	ldr r0, [sp, #0x14]
	mov r1, #2
	and r0, r1
	str r0, [sp, #0x10]
	beq _0226162C
	ldr r0, [sp, #4]
	sub r1, r2, #1
	ldrb r5, [r0, r1]
	ldr r0, [sp]
	add r1, r5, #0
	bl BattleSystem_GetBattlerIdPartner
	add r7, r0, #0
	b _02261634
_0226162C:
	ldr r0, [sp, #4]
	sub r1, r2, #1
	ldrb r5, [r0, r1]
	add r7, r5, #0
_02261634:
	ldr r0, [sp, #0x14]
	mov r1, #4
	tst r0, r1
	beq _022616DA
	ldr r0, [sp, #0x14]
	mov r1, #0x80
	tst r0, r1
	beq _0226166C
	ldr r0, _02261908 ; =0x000003DF
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x3c
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
_0226166C:
	ldr r0, [sp, #0x14]
	mov r1, #8
	tst r0, r1
	beq _0226169A
	mov r0, #0x3d
	lsl r0, r0, #4
	strh r0, [r4, #2]
	mov r0, #0x38
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	add sp, #0x18
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	str r7, [r4, #0xc]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_0226169A:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _022616C2
	ldr r0, _0226190C ; =0x000003CF
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x31
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_022616C2:
	ldr r0, _02261910 ; =0x000003CE
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x1b
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022616DA:
	ldr r0, [sp, #0x14]
	mov r1, #0x10
	tst r0, r1
	bne _022616EA
	ldr r0, [sp, #0x14]
	mov r1, #8
	tst r0, r1
	beq _02261712
_022616EA:
	ldr r0, _02261908 ; =0x000003DF
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x3c
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	str r7, [r4, #0x10]
	str r7, [r4, #0x14]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x18]
	pop {r3, r4, r5, r6, r7, pc}
_02261712:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0226173C
	ldr r0, _02261914 ; =0x000003CD
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x39
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_0226173C:
	mov r0, #0xf3
	lsl r0, r0, #2
	strh r0, [r4, #2]
	mov r0, #0x32
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	add sp, #0x18
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02261758:
	ldr r0, [sp, #0x14]
	mov r1, #4
	and r0, r1
	str r0, [sp, #0xc]
	beq _022617EC
	ldr r0, [sp]
	bl ov12_0223BFC0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #0x14]
	mov r1, #8
	and r0, r1
	str r0, [sp, #8]
	beq _022617C2
	ldr r0, [sp]
	add r1, r2, #0
	bl ov12_0223BFCC
	cmp r0, #3
	bhi _02261832
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0226178E: ; jump table
	.short _02261796 - _0226178E - 2 ; case 0
	.short _022617AC - _0226178E - 2 ; case 1
	.short _022617AC - _0226178E - 2 ; case 2
	.short _02261796 - _0226178E - 2 ; case 3
_02261796:
	ldr r0, [sp]
	mov r1, #4
	bl BattleSystem_GetBattlerFromBattlerType
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #2
	bl BattleSystem_GetBattlerFromBattlerType
	add r7, r0, #0
	b _02261832
_022617AC:
	ldr r0, [sp]
	mov r1, #2
	bl BattleSystem_GetBattlerFromBattlerType
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #4
	bl BattleSystem_GetBattlerFromBattlerType
	add r7, r0, #0
	b _02261832
_022617C2:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _022617DE
	ldr r0, [sp]
	bl BattleSystem_GetBattlerFromBattlerType
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #4
	bl BattleSystem_GetBattlerFromBattlerType
	add r7, r0, #0
	b _02261832
_022617DE:
	ldr r0, [sp]
	mov r1, #0
	bl BattleSystem_GetBattlerFromBattlerType
	add r5, r0, #0
	add r7, r5, #0
	b _02261832
_022617EC:
	ldr r0, [sp, #0x14]
	mov r1, #8
	and r0, r1
	str r0, [sp, #8]
	beq _0226180E
	ldr r1, [sp, #4]
	sub r2, r2, #1
	ldrb r1, [r1, r2]
	ldr r0, [sp]
	bl BattleSystem_GetBattlerIdPartner
	add r5, r0, #0
	mov r1, #0x65
	ldr r0, [sp, #4]
	lsl r1, r1, #2
	ldrb r7, [r0, r1]
	b _02261832
_0226180E:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _0226182A
	ldr r0, [sp]
	bl BattleSystem_GetBattlerFromBattlerType
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #4
	bl BattleSystem_GetBattlerFromBattlerType
	add r7, r0, #0
	b _02261832
_0226182A:
	ldr r0, [sp, #4]
	sub r1, r2, #1
	ldrb r5, [r0, r1]
	add r7, r5, #0
_02261832:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0226189C
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02261860
	ldr r0, _02261918 ; =0x000003D1
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x31
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #8]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02261860:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _02261888
	ldr r0, _0226191C ; =0x000003D2
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #9
	strb r0, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02261888:
	ldr r0, _02261920 ; =0x000003D3
	add sp, #0x18
	strh r0, [r4, #2]
	strb r1, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226189C:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022618C6
	ldr r0, _02261924 ; =0x000003E1
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #0x39
	strb r0, [r4, #1]
	str r5, [r4, #4]
	str r5, [r4, #8]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #0xc]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
_022618C6:
	ldr r0, [sp, #0x14]
	mov r1, #2
	tst r0, r1
	beq _022618EE
	ldr r0, _0226191C ; =0x000003D2
	add sp, #0x18
	strh r0, [r4, #2]
	mov r0, #9
	strb r0, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	add r0, r6, r7
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r7
	str r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022618EE:
	ldr r0, _02261920 ; =0x000003D3
	strh r0, [r4, #2]
	strb r1, [r4, #1]
	add r0, r6, r5
	ldrb r0, [r0, #4]
	lsl r0, r0, #8
	orr r0, r5
	str r0, [r4, #4]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261904: .word 0x00000195
_02261908: .word 0x000003DF
_0226190C: .word 0x000003CF
_02261910: .word 0x000003CE
_02261914: .word 0x000003CD
_02261918: .word 0x000003D1
_0226191C: .word 0x000003D2
_02261920: .word 0x000003D3
_02261924: .word 0x000003E1
	thumb_func_end ov12_022615F0

	thumb_func_start ov12_02261928
ov12_02261928: ; 0x02261928
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r2, #0
	bl BattleSystem_GetBattleType
	add r6, r0, #0
	ldr r0, [sp]
	bl BattleSystem_GetBattleOutcomeFlags
	add r7, r0, #0
	mov r0, #2
	tst r0, r6
	beq _02261956
	ldr r0, [sp]
	mov r1, #3
	bl BattleSystem_GetBattlerFromBattlerType
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #5
	bl BattleSystem_GetBattlerFromBattlerType
	b _02261960
_02261956:
	ldr r0, [sp]
	mov r1, #1
	bl BattleSystem_GetBattlerFromBattlerType
	add r4, r0, #0
_02261960:
	cmp r7, #1
	beq _0226196E
	cmp r7, #2
	beq _0226198E
	cmp r7, #3
	beq _022619B0
	pop {r3, r4, r5, r6, r7, pc}
_0226196E:
	mov r1, #8
	add r2, r6, #0
	tst r2, r1
	beq _02261984
	ldr r1, _022619D0 ; =0x00000312
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r4, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02261984:
	ldr r0, _022619D4 ; =0x00000311
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226198E:
	mov r1, #8
	add r2, r6, #0
	tst r2, r1
	beq _022619A6
	mov r1, #0xc5
	lsl r1, r1, #2
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r4, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022619A6:
	ldr r0, _022619D8 ; =0x00000313
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_022619B0:
	mov r1, #8
	add r2, r6, #0
	tst r2, r1
	beq _022619C6
	ldr r1, _022619DC ; =0x00000316
	strh r1, [r5, #2]
	mov r1, #0x1a
	strb r1, [r5, #1]
	str r4, [r5, #4]
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
_022619C6:
	ldr r0, _022619E0 ; =0x00000315
	strh r0, [r5, #2]
	strb r1, [r5, #1]
	str r4, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022619D0: .word 0x00000312
_022619D4: .word 0x00000311
_022619D8: .word 0x00000313
_022619DC: .word 0x00000316
_022619E0: .word 0x00000315
	thumb_func_end ov12_02261928

	thumb_func_start ov12_022619E4
ov12_022619E4: ; 0x022619E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r6, #0
	add r5, r0, #0
	str r2, [sp]
	add r7, r3, #0
	str r6, [sp, #4]
	add r4, r6, #0
	bl BattleSystem_GetMaxBattlers
	cmp r0, #0
	ble _02261A2C
_022619FC:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldr r1, [sp]
	ldrb r1, [r1, #1]
	tst r0, r1
	beq _02261A20
	add r0, r5, #0
	add r1, r4, #0
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _02261A1E
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	b _02261A20
_02261A1E:
	add r6, r6, #1
_02261A20:
	add r0, r5, #0
	add r4, r4, #1
	bl BattleSystem_GetMaxBattlers
	cmp r4, r0
	blt _022619FC
_02261A2C:
	cmp r6, #0
	beq _02261A4A
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02261A4A
	ldr r0, _02261ACC ; =0x0000030D
	mov r1, #0xc3
	strh r0, [r7, #2]
	mov r0, #0
	strb r0, [r7, #1]
	add r0, r5, #0
	bl BattleSystem_SetBattleOutcomeFlags
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02261A4A:
	cmp r6, #0
	beq _02261A62
	ldr r0, _02261ACC ; =0x0000030D
	mov r1, #0xc2
	strh r0, [r7, #2]
	mov r0, #0
	strb r0, [r7, #1]
	add r0, r5, #0
	bl BattleSystem_SetBattleOutcomeFlags
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_02261A62:
	add r0, r5, #0
	bl BattleSystem_GetBattleType
	mov r1, #8
	tst r0, r1
	beq _02261A8E
	mov r0, #0xc6
	lsl r0, r0, #2
	strh r0, [r7, #2]
	mov r0, #0x1a
	strb r0, [r7, #1]
	add r0, r5, #0
	mov r1, #3
	bl BattleSystem_GetBattlerFromBattlerType
	str r0, [r7, #4]
	add r0, r5, #0
	mov r1, #5
	bl BattleSystem_GetBattlerFromBattlerType
	str r0, [r7, #8]
	b _02261ABE
_02261A8E:
	add r0, r5, #0
	bl BattleSystem_GetBattleType
	mov r1, #2
	tst r0, r1
	ldr r0, _02261AD0 ; =0x00000317
	beq _02261AAE
	strh r0, [r7, #2]
	mov r0, #8
	strb r0, [r7, #1]
	add r0, r5, #0
	mov r1, #3
	bl BattleSystem_GetBattlerFromBattlerType
	str r0, [r7, #4]
	b _02261ABE
_02261AAE:
	strh r0, [r7, #2]
	mov r0, #8
	strb r0, [r7, #1]
	add r0, r5, #0
	mov r1, #1
	bl BattleSystem_GetBattlerFromBattlerType
	str r0, [r7, #4]
_02261ABE:
	add r0, r5, #0
	mov r1, #0xc1
	bl BattleSystem_SetBattleOutcomeFlags
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02261ACC: .word 0x0000030D
_02261AD0: .word 0x00000317
	thumb_func_end ov12_022619E4

	thumb_func_start ov12_02261AD4
ov12_02261AD4: ; 0x02261AD4
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0xef
	add r4, r2, #0
	lsl r1, r1, #2
	strh r1, [r4, #2]
	mov r1, #8
	add r5, r0, #0
	strb r1, [r4, #1]
	bl BattleSystem_GetBattleType
	mov r1, #4
	tst r0, r1
	beq _02261B1A
	add r0, r5, #0
	bl ov12_0223BFC0
	add r1, r0, #0
	add r0, r5, #0
	bl ov12_0223BFCC
	cmp r0, #0
	beq _02261B0E
	add r0, r5, #0
	mov r1, #4
	bl BattleSystem_GetBattlerFromBattlerType
	str r0, [r4, #4]
	b _02261B22
_02261B0E:
	add r0, r5, #0
	mov r1, #2
	bl BattleSystem_GetBattlerFromBattlerType
	str r0, [r4, #4]
	b _02261B22
_02261B1A:
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r6, r0]
	str r0, [r4, #4]
_02261B22:
	add r0, r5, #0
	mov r1, #0xc2
	bl BattleSystem_SetBattleOutcomeFlags
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_02261AD4

	thumb_func_start BattleDisplay_NewManagedSpriteTrainer
BattleDisplay_NewManagedSpriteTrainer: ; 0x02261B2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl BattleSystem_GetSpriteSystem
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl BattleSystem_GetSpriteManager
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl BattleSystem_GetPaletteData
	add r2, r0, #0
	mov r0, #1
	tst r0, r4
	beq _02261B58
	mov r1, #2
	b _02261B5A
_02261B58:
	mov r1, #0
_02261B5A:
	add r3, sp, #0x28
	mov r0, #0x18
	ldrsh r0, [r3, r0]
	mov r4, #0x14
	str r0, [sp]
	str r6, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x18]
	str r0, [sp, #0xc]
	str r7, [sp, #0x10]
	mov r0, #5
	str r0, [sp, #0x14]
	ldrsh r3, [r3, r4]
	ldr r0, [sp, #0x1c]
	bl sub_02070C24
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end BattleDisplay_NewManagedSpriteTrainer

	thumb_func_start BattleDisplay_PlayMoveAnimation
BattleDisplay_PlayMoveAnimation: ; 0x02261B80
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	str r0, [sp]
	ldr r0, [r3, #0x4c]
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r0, #0
	bne _02261B9E
	mov r0, #0xa
	str r0, [sp, #0x84]
	add r0, r3, #0
	ldrh r0, [r0, #2]
	str r0, [sp, #0x18]
	b _02261BA8
_02261B9E:
	mov r0, #0x3d
	str r0, [sp, #0x84]
	add r0, r3, #0
	ldr r0, [r0, #0x50]
	str r0, [sp, #0x18]
_02261BA8:
	ldr r0, [sp]
	bl BattleSystem_GetBgConfig
	str r0, [sp, #0x20]
	ldr r0, [sp]
	bl BattleSystem_GetPaletteData
	str r0, [sp, #0x24]
	ldr r0, [sp]
	bl BattleSystem_GetSpriteSystem
	add r5, sp, #0x1c
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0xc]
	mov r4, #0
	str r0, [sp, #0x14]
	str r5, [sp, #0x10]
	add r6, r5, #0
	add r7, r0, #0
_02261BCE:
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223BB88
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x14]
	ldrh r1, [r0, #0x18]
	ldr r0, [sp, #0x10]
	strh r1, [r0, #0x34]
	ldr r0, [sp, #0xc]
	add r0, r0, r4
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x3c
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r0, r4
	add r0, #0x24
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x40
	strb r1, [r0]
	ldr r0, [sp, #0xc]
	add r0, r0, r4
	add r0, #0x28
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0x44
	strb r1, [r0]
	ldr r0, [r7, #0x2c]
	add r4, r4, #1
	str r0, [r5, #0x48]
	ldr r0, [r7, #0x3c]
	add r6, r6, #1
	str r0, [r5, #0x58]
	ldr r0, [sp, #0x14]
	add r5, r5, #4
	add r0, r0, #2
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r7, r7, #4
	add r0, r0, #2
	str r0, [sp, #0x10]
	cmp r4, #4
	blt _02261BCE
	ldr r0, [sp]
	add r1, sp, #0x38
	bl ov12_0223C1C4
	ldr r0, [sp]
	add r1, sp, #0x3c
	bl ov12_0223C1F4
	ldr r0, [sp]
	bl BattleSystem_GetBattleType
	mov r2, #0x65
	str r0, [sp, #0x4c]
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldr r0, [sp]
	bl BattleSystem_GetChatotVoice
	str r0, [sp, #0xa0]
	ldr r0, [sp]
	bl ov12_0223BAD0
	str r0, [sp, #0xa4]
	ldr r0, [sp]
	bl ov12_0223BAD8
	str r0, [sp, #0xa8]
	mov r0, #7
	str r0, [sp, #0x88]
	ldr r0, [sp]
	bl BattleSystem_GetBackgroundId
	add r0, r0, #3
	str r0, [sp, #0x8c]
	ldr r0, [sp]
	bl ov12_0223B52C
	add r4, r0, #0
	ldr r0, [sp]
	bl BattleSystem_GetBackgroundId
	lsl r1, r0, #1
	add r0, r0, r1
	add r0, #0xb0
	add r0, r4, r0
	str r0, [sp, #0x90]
	mov r0, #2
	str r0, [sp, #0x94]
	mov r0, #0
	ldr r2, [sp, #0x18]
	str r0, [sp, #0x98]
	mov r0, #8
	str r0, [sp, #0x9c]
	lsl r2, r2, #0x10
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	lsr r2, r2, #0x10
	add r3, sp, #0x1c
	bl ov07_0221C01C
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	thumb_func_end BattleDisplay_PlayMoveAnimation

	thumb_func_start BattleDisplay_PopulateBattlerContext
BattleDisplay_PopulateBattlerContext: ; 0x02261CA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r2, #0
	add r7, r1, #0
	str r3, [r6]
	str r0, [sp]
	str r3, [r6, #4]
	mov r4, #0
	add r5, r6, #0
	str r7, [sp, #0xc]
	str r6, [sp, #8]
	str r7, [sp, #4]
_02261CC0:
	ldr r0, [sp]
	add r1, r4, #0
	bl ov12_0223BB88
	str r0, [r5, #8]
	ldr r0, [sp, #0xc]
	ldrh r1, [r0, #0x18]
	ldr r0, [sp, #8]
	strh r1, [r0, #0x28]
	add r0, r7, r4
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r6, r4
	add r0, #0x30
	strb r1, [r0]
	add r0, r7, r4
	add r0, #0x24
	ldrb r1, [r0]
	add r0, r6, r4
	add r0, #0x34
	strb r1, [r0]
	add r0, r7, r4
	add r0, #0x28
	ldrb r1, [r0]
	add r0, r6, r4
	add r0, #0x38
	strb r1, [r0]
	ldr r0, [sp, #4]
	add r4, r4, #1
	ldr r0, [r0, #0x2c]
	str r0, [r5, #0x3c]
	ldr r0, [sp, #0xc]
	add r5, r5, #4
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r0, r0, #2
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r0, r0, #4
	str r0, [sp, #4]
	cmp r4, #4
	blt _02261CC0
	add r1, r6, #0
	ldr r0, [sp]
	add r1, #0x4c
	bl ov12_0223C1C4
	add r6, #0x18
	ldr r0, [sp]
	add r1, r6, #0
	bl ov12_0223C1F4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BattleDisplay_PopulateBattlerContext

	thumb_func_start BattleDisplay_GetAnimHideFlags
BattleDisplay_GetAnimHideFlags: ; 0x02261D30
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r2, #0
	bne _02261D6E
	add r0, sp, #0
	ldrh r6, [r0, #0x10]
	mov r1, #9
	add r0, r6, #0
	bl GetMoveAttr
	mov r1, #0x40
	tst r0, r1
	bne _02261D50
	mov r0, #1
	b _02261D52
_02261D50:
	mov r0, #0
_02261D52:
	strb r0, [r4]
	add r0, r6, #0
	mov r1, #9
	bl GetMoveAttr
	mov r1, #0x80
	tst r0, r1
	beq _02261D68
	mov r0, #1
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261D68:
	mov r0, #0
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261D6E:
	sub r3, #0x12
	cmp r3, #0x15
	bhi _02261DBE
	add r0, r3, r3
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02261D80: ; jump table
	.short _02261DAC - _02261D80 - 2 ; case 0
	.short _02261DAC - _02261D80 - 2 ; case 1
	.short _02261DAC - _02261D80 - 2 ; case 2
	.short _02261DAC - _02261D80 - 2 ; case 3
	.short _02261DAC - _02261D80 - 2 ; case 4
	.short _02261DBE - _02261D80 - 2 ; case 5
	.short _02261DBE - _02261D80 - 2 ; case 6
	.short _02261DBE - _02261D80 - 2 ; case 7
	.short _02261DBE - _02261D80 - 2 ; case 8
	.short _02261DBE - _02261D80 - 2 ; case 9
	.short _02261DBE - _02261D80 - 2 ; case 10
	.short _02261DBE - _02261D80 - 2 ; case 11
	.short _02261DBE - _02261D80 - 2 ; case 12
	.short _02261DAC - _02261D80 - 2 ; case 13
	.short _02261DAC - _02261D80 - 2 ; case 14
	.short _02261DBE - _02261D80 - 2 ; case 15
	.short _02261DAC - _02261D80 - 2 ; case 16
	.short _02261DAC - _02261D80 - 2 ; case 17
	.short _02261DB6 - _02261D80 - 2 ; case 18
	.short _02261DAC - _02261D80 - 2 ; case 19
	.short _02261DB6 - _02261D80 - 2 ; case 20
	.short _02261DAC - _02261D80 - 2 ; case 21
_02261DAC:
	mov r0, #1
	strb r0, [r4]
	mov r0, #0
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261DB6:
	mov r0, #1
	strb r0, [r4]
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_02261DBE:
	mov r0, #0
	strb r0, [r4]
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BattleDisplay_GetAnimHideFlags

	thumb_func_start ov12_02261DC8
ov12_02261DC8: ; 0x02261DC8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r4, #0
	bl ManagedSprite_GetUserAttrForCurrentAnimFrame
	cmp r0, #1
	beq _02261DE0
	ldr r1, _02261E38 ; =0x00000FFF
	cmp r0, r1
	beq _02261E0A
	b _02261E0E
_02261DE0:
	ldrh r1, [r5, #0x16]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	bne _02261E34
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r5, #0x16]
	mov r0, #5
	mov r1, #8
	bl Heap_Alloc
	add r1, r0, #0
	add r2, r4, #0
	str r2, [r1]
	ldr r0, _02261E3C ; =ov12_02261E40
	str r2, [r1, #4]
	bl SysTask_CreateOnMainQueue
	b _02261E34
_02261E0A:
	mov r4, #1
	b _02261E34
_02261E0E:
	sub r1, #0xff
	add r2, r0, #0
	and r2, r1
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	bne _02261E34
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	beq _02261E34
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl ManagedSprite_SetAnimationFrame
	ldr r0, [r5, #0xc]
	sub r1, r6, #1
	bl ManagedSprite_SetAnim
	mov r4, #1
_02261E34:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02261E38: .word 0x00000FFF
_02261E3C: .word ov12_02261E40
	thumb_func_end ov12_02261DC8

	thumb_func_start ov12_02261E40
ov12_02261E40: ; 0x02261E40
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02261E56
	cmp r0, #1
	beq _02261E7E
	cmp r0, #2
	beq _02261EA0
	pop {r3, r4, r5, pc}
_02261E56:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #0
	bne _02261E66
	mov r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261E66:
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #0x10
	mov r2, #0
	mov r3, #0x3d
	bl StartBrightnessTransition
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261E7E:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #1
	bne _02261EB6
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	mov r1, #0
	mov r2, #0x10
	mov r3, #0x3d
	bl StartBrightnessTransition
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02261EA0:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #1
	bne _02261EB6
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl SysTask_Destroy
_02261EB6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02261E40

	thumb_func_start BattleDisplay_StopPlayback
BattleDisplay_StopPlayback: ; 0x02261EB8
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	bl ov12_0223BFFC
	add r0, r4, #0
	bl BattleSystem_GetBattleContext
	add r1, r0, #0
	add r0, r4, #0
	bl BattleController_TryEmitExitRecording
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BattleDisplay_StopPlayback

	thumb_func_start BattleDisplay_StopPlaybackAlt
BattleDisplay_StopPlaybackAlt: ; 0x02261ED4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #2
	bl ov12_0223BFFC
	add r0, r4, #0
	bl BattleSystem_GetBattleContext
	add r1, r0, #0
	add r0, r4, #0
	bl BattleController_TryEmitExitRecording
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BattleDisplay_StopPlaybackAlt

	thumb_func_start BattleDisplay_GetLinkTrainerClass
BattleDisplay_GetLinkTrainerClass: ; 0x02261EF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl BattleSystem_GetBattleType
	mov r1, #4
	tst r0, r1
	beq _02261F0A
	cmp r4, #0
	beq _02261F0E
	cmp r4, #1
	beq _02261F0E
_02261F0A:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_02261F0E:
	add r0, r5, #0
	add r1, r6, #0
	bl BattleSystem_GetPlayerProfile
	bl PlayerProfile_GetVersion
	cmp r0, #0
	beq _02261F24
	cmp r0, #0xc
	beq _02261F2C
	b _02261F32
_02261F24:
	add r4, #0x7d
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
	b _02261F32
_02261F2C:
	add r4, #0x7f
	lsl r0, r4, #0x18
	lsr r4, r0, #0x18
_02261F32:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end BattleDisplay_GetLinkTrainerClass

	thumb_func_start ov12_02261F38
ov12_02261F38: ; 0x02261F38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r4, r2, #0
	mov r2, #0
	add r1, sp, #0x14
	add r7, r0, #0
	add r6, r3, #0
	strb r2, [r1]
	bl BattleSystem_AreBattleAnimationsOn
	cmp r0, #1
	bne _02261F8C
	add r0, r6, #0
	mov r1, #1
	bl Pokepic_StartAnim
	add r0, r7, #0
	bl ov12_0223B750
	add r1, r0, #0
	ldr r0, [sp, #0x3c]
	ldr r3, [sp, #0x34]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	lsl r3, r3, #0x10
	ldr r0, [sp, #0x30]
	add r2, r6, #0
	lsr r3, r3, #0x10
	str r5, [sp, #8]
	bl sub_0207294C
	ldr r2, [sp, #0x34]
	lsl r3, r4, #0x10
	lsl r2, r2, #0x10
	ldr r0, [sp, #0x30]
	add r1, sp, #0x14
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl sub_020729A4
_02261F8C:
	ldr r0, [sp, #0x3c]
	cmp r0, #2
	bne _02261F96
	mov r4, #0x75
	b _02261F9A
_02261F96:
	mov r4, #0x74
	mvn r4, r4
_02261F9A:
	add r0, sp, #0x14
	ldrb r1, [r0]
	cmp r1, #0
	bne _02261FA6
	mov r1, #8
	strb r1, [r0]
_02261FA6:
	add r0, r7, #0
	add r1, r5, #0
	bl BattleSystem_GetChatotVoice
	ldr r2, [sp, #0x34]
	str r4, [sp]
	mov r1, #0x7f
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #5
	str r1, [sp, #0xc]
	add r1, sp, #0x14
	ldrb r1, [r1]
	lsl r2, r2, #0x10
	ldr r3, [sp, #0x38]
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x40]
	lsr r2, r2, #0x10
	bl sub_0207204C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov12_02261F38

    .rodata

.public sBallThrowTypes
sBallThrowTypes: ; 0x0226D120
	.byte 0x06, 0x01, 0x08, 0x03, 0x07, 0x05, 0x00, 0x00

.public ov12_0226D128
ov12_0226D128: ; 0x0226D128
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00

.public ov12_0226D140
ov12_0226D140: ; 0x0226D140
	.byte 0x0A

ov12_0226D141: ; 0x0226D141
	.byte 0x28, 0x0A, 0x23, 0x0A, 0x1E, 0x0A, 0x19, 0x0A, 0x14, 0x0A, 0x0F, 0x0A, 0x0A, 0x0F, 0x0A
	.byte 0x14, 0x0A, 0x19, 0x0A, 0x1E, 0x0A, 0x23, 0x0A, 0x28, 0x0A

.public ov12_0226D15A
ov12_0226D15A: ; 0x0226D15A
	.byte 0x00, 0x00, 0x97, 0x72, 0xFF, 0x3F
	.byte 0xF0, 0x7A, 0xDF, 0x7A, 0xD7, 0x53, 0xF5, 0x67, 0x2C, 0x7B, 0x7E, 0x2B, 0x1F, 0x43, 0xDD, 0x7B
	.byte 0x3F, 0x2A, 0x3F, 0x29, 0xCE, 0x45, 0x1F, 0x73, 0x51, 0x7F, 0x1E, 0x15, 0xDF, 0x7A, 0xDF, 0x7A
	.byte 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A, 0xDF, 0x7A

ov12_0226D18C: ; 0x0226D18C
	.byte 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00
	.byte 0xFF, 0x7F, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00

.public ov12_0226D1E8
ov12_0226D1E8: ; 0x0226D1E8
	.byte 0x00, 0x00

ov12_0226D1EA: ; 0x0226D1EA
	.byte 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDF, 0xFF, 0xFA, 0xFF
	.byte 0xE4, 0xFF, 0xEE, 0xFF, 0x32, 0x00, 0xDC, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x80, 0x00, 0xDF, 0xFF, 0xFE, 0xFF, 0xE4, 0xFF, 0xEE, 0xFF, 0x32, 0x00, 0xE4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE9, 0xFF, 0xFF, 0xFF, 0x32, 0x00, 0xFE, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F
	.byte 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00, 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF
	.byte 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x00, 0x80, 0x00, 0xDE, 0xFF, 0x04, 0x00
	.byte 0xE4, 0xFF, 0xF5, 0xFF, 0x32, 0x00, 0xF4, 0xFF, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F, 0xFF, 0x7F

ov12_0226D350: ; 0x0226D350
	.byte 0x09, 0x17, 0x05, 0x13, 0x0D, 0x11, 0x0F, 0x07, 0x15, 0x0B, 0x19, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B
	.byte 0x0B, 0x15, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B, 0x0B

