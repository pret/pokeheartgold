#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "macros.inc"
	.include "overlay_12_battle_controller_opponent.inc"
	.include "global.inc"

    .text

	thumb_func_start ov12_02258E54
ov12_02258E54: ; 0x02258E54
	push {r3, lr}
	add r2, r1, #0
	add r2, #0x94
	ldrb r2, [r2]
	cmp r2, #0
	beq _02258E76
	mov r2, #0x6a
	mov r3, #0
	lsl r2, r2, #2
	strb r3, [r1, r2]
	add r2, r1, #0
	add r2, #0x94
	ldrb r2, [r2]
	lsl r3, r2, #2
	ldr r2, _02258E78 ; =ov12_0226D010
	ldr r2, [r2, r3]
	blx r2
_02258E76:
	pop {r3, pc}
	.balign 4, 0
_02258E78: .word ov12_0226D010
	thumb_func_end ov12_02258E54

	thumb_func_start ov12_02258E7C
ov12_02258E7C: ; 0x02258E7C
	push {r4, lr}
	add r4, r1, #0
	cmp r2, #2
	beq _02258E8C
	add r0, r4, #0
	add r0, #0x28
	bl BattleHpBar_FreeResources
_02258E8C:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _02258E96
	bl Sprite_DeleteAndFreeResources
_02258E96:
	add r0, r4, #0
	bl ov12_02262014
	mov r0, #0x69
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl NARC_Delete
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov12_02258E7C

	thumb_func_start ov12_02258EB0
ov12_02258EB0: ; 0x02258EB0
	bx lr
	.balign 4, 0
	thumb_func_end ov12_02258EB0

	thumb_func_start ov12_02258EB4
ov12_02258EB4: ; 0x02258EB4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r1, #0x98
	ldr r1, [r1]
	add r5, r0, #0
	bl BattleSystem_SetRandTemp
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_02259944
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #1
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02258EB4

	thumb_func_start ov12_02258EE0
ov12_02258EE0: ; 0x02258EE0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259968
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258EE0

	thumb_func_start ov12_02258EF4
ov12_02258EF4: ; 0x02258EF4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259BA8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258EF4

	thumb_func_start ov12_02258F08
ov12_02258F08: ; 0x02258F08
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259D48
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F08

	thumb_func_start ov12_02258F1C
ov12_02258F1C: ; 0x02258F1C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_02259F30
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F1C

	thumb_func_start ov12_02258F30
ov12_02258F30: ; 0x02258F30
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A018
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F30

	thumb_func_start ov12_02258F44
ov12_02258F44: ; 0x02258F44
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	bl Pokepic_Delete
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #7
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02258F44

	thumb_func_start ov12_02258F68
ov12_02258F68: ; 0x02258F68
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A07C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F68

	thumb_func_start ov12_02258F7C
ov12_02258F7C: ; 0x02258F7C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A2A0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F7C

	thumb_func_start ov12_02258F90
ov12_02258F90: ; 0x02258F90
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225A334
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258F90

	thumb_func_start ov12_02258FA0
ov12_02258FA0: ; 0x02258FA0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A37C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258FA0

	thumb_func_start ov12_02258FB4
ov12_02258FB4: ; 0x02258FB4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A414
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258FB4

	thumb_func_start ov12_02258FC8
ov12_02258FC8: ; 0x02258FC8
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225A4DC
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02258FC8

	thumb_func_start ov12_02258FD8
ov12_02258FD8: ; 0x02258FD8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r4, #0
	add r6, #0x94
	add r1, r6, #0
	add r1, #0x29
	ldrb r1, [r1]
	add r5, r0, #0
	bl ov12_0223BB6C
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_0225A524
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_02258FD8

	thumb_func_start ov12_02259000
ov12_02259000: ; 0x02259000
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A604
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259000

	thumb_func_start ov12_02259014
ov12_02259014: ; 0x02259014
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A674
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259014

	thumb_func_start ov12_02259028
ov12_02259028: ; 0x02259028
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A700
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259028

	thumb_func_start ov12_0225903C
ov12_0225903C: ; 0x0225903C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A7AC
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_0225903C

	thumb_func_start ov12_02259050
ov12_02259050: ; 0x02259050
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A818
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259050

	thumb_func_start ov12_02259064
ov12_02259064: ; 0x02259064
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A85C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259064

	thumb_func_start ov12_02259078
ov12_02259078: ; 0x02259078
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A8C4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259078

	thumb_func_start ov12_0225908C
ov12_0225908C: ; 0x0225908C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A914
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_0225908C

	thumb_func_start ov12_022590A0
ov12_022590A0: ; 0x022590A0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	mov r1, #6
	bl Pokepic_GetAttr
	cmp r0, #1
	bne _022590C2
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x17
	bl BattleController_EmitClearCommand
	b _022590CA
_022590C2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0225A9B0
_022590CA:
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_022590A0

	thumb_func_start ov12_022590D4
ov12_022590D4: ; 0x022590D4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225A9E0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022590D4

	thumb_func_start ov12_022590E8
ov12_022590E8: ; 0x022590E8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AA6C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022590E8

	thumb_func_start ov12_022590FC
ov12_022590FC: ; 0x022590FC
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AAE0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022590FC

	thumb_func_start ov12_02259110
ov12_02259110: ; 0x02259110
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225ABB8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259110

	thumb_func_start ov12_02259124
ov12_02259124: ; 0x02259124
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225ABE8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259124

	thumb_func_start ov12_02259134
ov12_02259134: ; 0x02259134
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AC1C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259134

	thumb_func_start ov12_02259148
ov12_02259148: ; 0x02259148
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225ACB0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259148

	thumb_func_start ov12_0225915C
ov12_0225915C: ; 0x0225915C
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225ACE8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_0225915C

	thumb_func_start ov12_02259170
ov12_02259170: ; 0x02259170
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AD44
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259170

	thumb_func_start ov12_02259184
ov12_02259184: ; 0x02259184
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AD9C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259184

	thumb_func_start ov12_02259198
ov12_02259198: ; 0x02259198
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225ADF4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259198

	thumb_func_start ov12_022591A8
ov12_022591A8: ; 0x022591A8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AE48
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591A8

	thumb_func_start ov12_022591BC
ov12_022591BC: ; 0x022591BC
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225AEA0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591BC

	thumb_func_start ov12_022591CC
ov12_022591CC: ; 0x022591CC
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AED8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591CC

	thumb_func_start ov12_022591E0
ov12_022591E0: ; 0x022591E0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225AF74
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022591E0

	thumb_func_start ov12_022591F4
ov12_022591F4: ; 0x022591F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	mov r2, #0x65
	add r6, #0x94
	lsl r2, r2, #2
	str r1, [sp, #4]
	ldrb r1, [r1, r2]
	ldrb r2, [r6, #1]
	str r0, [sp]
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	bl BattleSystem_GetPartyMon
	add r7, r0, #0
	mov r0, #2
	ldr r1, [r6, #0x1c]
	lsl r0, r0, #0x14
	tst r0, r1
	bne _0225925C
	add r0, r6, #0
	add r5, r6, #0
	str r0, [sp, #8]
	add r0, #0x16
	mov r4, #0
	add r5, #0xe
	str r0, [sp, #8]
_0225922A:
	add r0, r4, #0
	bl MaskOfFlagNo
	ldrb r1, [r6, #1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	tst r0, r1
	bne _02259254
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x36
	add r2, r5, #0
	bl SetMonData
	ldr r2, [sp, #8]
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x3a
	add r2, r2, r4
	bl SetMonData
_02259254:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _0225922A
_0225925C:
	ldrb r0, [r6, #1]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bl MaskOfFlagNo
	ldr r1, [r6, #8]
	tst r0, r1
	bne _02259278
	add r2, r6, #0
	add r0, r7, #0
	mov r1, #6
	add r2, #0xc
	bl SetMonData
_02259278:
	add r0, r7, #0
	mov r1, #0xa3
	add r2, r6, #2
	bl SetMonData
	add r0, r7, #0
	mov r1, #0xa0
	add r2, r6, #4
	bl SetMonData
	ldrh r0, [r6, #0x2a]
	cmp r0, #0
	beq _0225929E
	add r2, r6, #0
	add r0, r7, #0
	mov r1, #0x70
	add r2, #0x20
	bl SetMonData
_0225929E:
	ldrh r0, [r6, #0x28]
	cmp r0, #0
	beq _022592B6
	add r2, r6, #0
	add r0, r7, #0
	mov r1, #0xa
	add r2, #0x24
	bl SetMonData
	add r0, r7, #0
	bl CalcMonLevelAndStats
_022592B6:
	mov r2, #0x65
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldrb r2, [r6]
	ldr r0, [sp]
	bl BattleController_EmitClearCommand
	ldr r0, [sp, #4]
	bl ov12_02259928
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_022591F4

	thumb_func_start ov12_022592D0
ov12_022592D0: ; 0x022592D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl BattleSystem_GetBattleType
	add r6, r0, #0
	add r0, r5, #0
	bl BattleSystem_GetBattleInput
	ldr r2, _02259320 ; =0x00000196
	ldrb r1, [r4, r2]
	cmp r1, #0
	bne _02259304
	mov r1, #8
	and r1, r6
	bne _022592FC
	cmp r1, #0
	bne _02259304
	sub r1, r2, #1
	ldrb r1, [r4, r1]
	cmp r1, #4
	beq _02259304
_022592FC:
	ldr r1, _02259324 ; =0xFFFFF300
	mov r2, #0
	bl BattleInput_StartMenuScrollHorizontalTask
_02259304:
	mov r1, #0x65
	add r2, r4, #0
	lsl r1, r1, #2
	add r2, #0x94
	ldrb r1, [r4, r1]
	ldrb r2, [r2]
	add r0, r5, #0
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	nop
_02259320: .word 0x00000196
_02259324: .word 0xFFFFF300
	thumb_func_end ov12_022592D0

	thumb_func_start ov12_02259328
ov12_02259328: ; 0x02259328
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x28
	bl ov12_02264EB4
	add r0, r4, #0
	bl ov12_02262014
	mov r1, #0x65
	add r2, r4, #0
	lsl r1, r1, #2
	add r2, #0x94
	ldrb r1, [r4, r1]
	ldrb r2, [r2]
	add r0, r5, #0
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02259328

	thumb_func_start ov12_02259358
ov12_02259358: ; 0x02259358
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	mov r1, #0
	str r1, [sp, #8]
	mov r1, #0x65
	lsl r1, r1, #2
	add r4, r7, #0
	ldrb r1, [r7, r1]
	str r0, [sp]
	add r4, #0x94
	bl BattleSystem_GetPartySize
	mov r5, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _022593BA
_0225937A:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r7, r1]
	ldr r0, [sp]
	add r2, r5, #0
	bl BattleSystem_GetPartyMon
	ldrb r1, [r4, #1]
	add r6, r0, #0
	cmp r1, #0x68
	bne _02259394
	mov r0, #0
	b _0225939C
_02259394:
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
_0225939C:
	ldrh r1, [r4, #2]
	cmp r1, #0xd7
	bne _022593A8
	bne _022593B2
	cmp r0, #0x2b
	beq _022593B2
_022593A8:
	add r0, r6, #0
	mov r1, #0xa0
	add r2, sp, #8
	bl SetMonData
_022593B2:
	ldr r0, [sp, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _0225937A
_022593BA:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r7, r1]
	ldrb r2, [r4]
	ldr r0, [sp]
	bl BattleController_EmitClearCommand
	add r0, r7, #0
	bl ov12_02259928
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02259358

	thumb_func_start ov12_022593D4
ov12_022593D4: ; 0x022593D4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B028
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022593D4

	thumb_func_start ov12_022593E8
ov12_022593E8: ; 0x022593E8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B060
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022593E8

	thumb_func_start ov12_022593FC
ov12_022593FC: ; 0x022593FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x10]
	add r5, r1, #0
	ldr r0, _022594F0 ; =0x00000195
	add r4, r5, #0
	ldrb r1, [r5, r0]
	mov r0, #1
	add r4, #0x94
	tst r0, r1
	beq _02259416
	mov r6, #2
	b _02259418
_02259416:
	mov r6, #0
_02259418:
	ldrb r0, [r4, #5]
	lsl r3, r6, #0x18
	lsr r3, r3, #0x18
	str r0, [sp]
	ldrb r0, [r4, #1]
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	str r0, [sp, #8]
	ldrh r1, [r4, #2]
	ldrb r2, [r4, #4]
	add r0, sp, #0x14
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r5, #0x20]
	bl Pokepic_GetTemplate
	add r7, r0, #0
	add r2, sp, #0x14
	add r3, r7, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5, #0x20]
	bl Pokepic_ScheduleReloadFromNarc
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	bl ov12_0223BB94
	add r3, r0, #0
	ldr r0, [r4, #8]
	mov r2, #5
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrh r0, [r7, #6]
	str r0, [sp, #0xc]
	ldrh r0, [r7]
	ldrh r1, [r7, #2]
	bl sub_02014540
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrh r2, [r7]
	bl ov12_0223BBA8
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrh r2, [r7, #4]
	bl ov12_0223BBC0
	ldr r0, [r4, #8]
	lsl r2, r6, #0x18
	str r0, [sp]
	ldrh r0, [r4, #2]
	ldrb r1, [r4, #4]
	ldrb r3, [r4, #1]
	lsr r2, r2, #0x18
	bl GetMonPicHeightBySpeciesGenderForm
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	bl ov12_0223A99C
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	add r2, r6, #0
	bl ov12_0223BBD8
	ldr r0, _022594F0 ; =0x00000195
	mov r1, #1
	ldrb r0, [r5, r0]
	bl ov07_02234B5C
	add r2, r0, #0
	ldr r0, [r5, #0x20]
	mov r1, #1
	add r2, r6, r2
	bl Pokepic_SetAttr
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	ldr r0, [sp, #0x10]
	bl BattleController_EmitClearCommand
	add r0, r5, #0
	bl ov12_02259928
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022594F0: .word 0x00000195
	thumb_func_end ov12_022593FC

	thumb_func_start ov12_022594F4
ov12_022594F4: ; 0x022594F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl BattleSystem_SetBackground
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x2e
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_022594F4

	thumb_func_start ov12_02259514
ov12_02259514: ; 0x02259514
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _022595B4 ; =0x00000196
	add r4, r1, #0
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0225959A
	mov r0, #7
	mov r1, #5
	bl NARC_New
	add r6, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
	add r7, r0, #0
	add r0, r5, #0
	bl BattleSystem_GetBattleInput
	str r0, [sp, #8]
	mov r3, #0
	str r3, [sp]
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	str r3, [sp, #4]
	bl BattleInput_ChangeMenu
	ldr r0, [sp, #8]
	mov r1, #0
	bl BattleInput_Deadstriped_022698AC
	add r0, r6, #0
	bl NARC_Delete
	add r0, r7, #0
	bl NARC_Delete
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl BattleSystem_GetBattlerIdPartner
	add r1, r0, #0
	mov r0, #0x65
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r1, r0
	beq _02259586
	add r0, r5, #0
	bl BattleSystem_GetHpBar
	bl ov12_02265D74
_02259586:
	add r0, r4, #0
	add r0, #0x28
	bl ov12_02264EB4
	ldr r0, [sp, #8]
	bl BattleInput_DisableBallGauge
	add r0, r4, #0
	bl ov12_02262014
_0225959A:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x2f
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022595B4: .word 0x00000196
	thumb_func_end ov12_02259514

	thumb_func_start ov12_022595B8
ov12_022595B8: ; 0x022595B8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B0A0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022595B8

	thumb_func_start ov12_022595CC
ov12_022595CC: ; 0x022595CC
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B0E8
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022595CC

	thumb_func_start ov12_022595E0
ov12_022595E0: ; 0x022595E0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r6, r4, #0
	add r5, r0, #0
	add r6, #0x94
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _02259604
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_0225B120
	b _02259612
_02259604:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x32
	bl BattleController_EmitClearCommand
_02259612:
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_022595E0

	thumb_func_start ov12_0225961C
ov12_0225961C: ; 0x0225961C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r6, r4, #0
	add r5, r0, #0
	add r6, #0x94
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _02259640
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov12_0225B16C
	b _0225964E
_02259640:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x33
	bl BattleController_EmitClearCommand
_0225964E:
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov12_0225961C

	thumb_func_start ov12_02259658
ov12_02259658: ; 0x02259658
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl BattleSystem_GetSpriteSystem
	add r6, r0, #0
	add r0, r5, #0
	bl BattleSystem_GetSpriteManager
	add r7, r0, #0
	add r0, r5, #0
	bl BattleSystem_GetPaletteData
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl PartyGauge_LoadGraphics
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x34
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov12_02259658

	thumb_func_start ov12_02259694
ov12_02259694: ; 0x02259694
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl BattleSystem_GetSpriteManager
	bl PartyGauge_FreeGraphics
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x35
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02259694

	thumb_func_start ov12_022596B8
ov12_022596B8: ; 0x022596B8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r5, #0
	add r4, #0x94
	ldrb r1, [r4, #1]
	add r6, r0, #0
	cmp r1, #0
	ldr r1, _022596FC ; =0x00000196
	bne _022596D8
	ldrb r1, [r5, r1]
	cmp r1, #0
	bne _022596E4
	ldrh r1, [r4, #2]
	bl BattleSystem_GameStatIncrement
	b _022596E4
_022596D8:
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _022596E4
	ldrh r1, [r4, #2]
	bl BattleSystem_GameStatIncrement
_022596E4:
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	ldrb r2, [r4]
	add r0, r6, #0
	bl BattleController_EmitClearCommand
	add r0, r5, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	nop
_022596FC: .word 0x00000196
	thumb_func_end ov12_022596B8

	thumb_func_start ov12_02259700
ov12_02259700: ; 0x02259700
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	ldrh r1, [r2, #2]
	add r5, r0, #0
	add r2, r2, #4
	bl ov12_0223BF14
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0225B1A8
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_02259700

	thumb_func_start ov12_02259724
ov12_02259724: ; 0x02259724
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B200
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259724

	thumb_func_start ov12_02259738
ov12_02259738: ; 0x02259738
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225B234
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259738

	thumb_func_start ov12_02259748
ov12_02259748: ; 0x02259748
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225B26C
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259748

	thumb_func_start ov12_02259758
ov12_02259758: ; 0x02259758
	push {r4, lr}
	add r4, r1, #0
	bl ov12_0225B2A4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259758

	thumb_func_start ov12_02259768
ov12_02259768: ; 0x02259768
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r6, #0
	add r4, #0x94
	ldrh r1, [r4, #2]
	add r5, r0, #0
	add r2, r4, #4
	bl ov12_0223BF14
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov12_0225B2F8
	add r0, r6, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_02259768

	thumb_func_start ov12_0225978C
ov12_0225978C: ; 0x0225978C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	ldrh r1, [r2, #2]
	add r5, r0, #0
	add r2, r2, #4
	bl ov12_0223BF14
	add r0, r5, #0
	add r1, r4, #0
	bl ov12_0225B34C
	add r0, r4, #0
	bl ov12_02259928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov12_0225978C

	thumb_func_start ov12_022597B0
ov12_022597B0: ; 0x022597B0
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B3A0
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022597B0

	thumb_func_start ov12_022597C4
ov12_022597C4: ; 0x022597C4
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B3D4
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022597C4

	thumb_func_start ov12_022597D8
ov12_022597D8: ; 0x022597D8
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B434
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_022597D8

	thumb_func_start ov12_022597EC
ov12_022597EC: ; 0x022597EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #4]
	str r1, [sp, #0x10]
	add r1, #0x94
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x10]
	mov r7, #0
	ldrh r1, [r1, #2]
	str r0, [sp]
	add r2, #8
	str r7, [sp, #8]
	bl ov12_0223BF14
	ldr r0, [sp]
	bl BattleSystem_GetBattleType
	mov r1, #0x80
	tst r0, r1
	beq _02259824
	ldr r1, [sp, #0x10]
	ldr r0, [sp]
	ldr r1, [r1, #4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BattleSystem_SetBattleOutcomeFlags
	b _022598DC
_02259824:
	add r0, r7, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl BattleSystem_GetMaxBattlers
	cmp r0, #0
	ble _022598B2
_02259832:
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl BattleSystem_GetParty
	add r6, r0, #0
	mov r5, #0
	bl Party_GetCount
	cmp r0, #0
	ble _022598A0
_02259846:
	add r0, r6, #0
	add r1, r5, #0
	bl Party_GetMonByIndex
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02259894
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02259894
	ldr r0, [sp]
	ldr r1, [sp, #0xc]
	bl BattleSystem_GetFieldSide
	cmp r0, #0
	beq _02259888
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #8]
	b _02259894
_02259888:
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r7, r7, r0
_02259894:
	add r0, r6, #0
	add r5, r5, #1
	bl Party_GetCount
	cmp r5, r0
	blt _02259846
_022598A0:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl BattleSystem_GetMaxBattlers
	ldr r1, [sp, #0xc]
	cmp r1, r0
	blt _02259832
_022598B2:
	cmp r7, #0
	bne _022598C6
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022598C6
	ldr r0, [sp]
	mov r1, #3
	bl BattleSystem_SetBattleOutcomeFlags
	b _022598DC
_022598C6:
	cmp r7, #0
	bne _022598D4
	ldr r0, [sp]
	mov r1, #2
	bl BattleSystem_SetBattleOutcomeFlags
	b _022598DC
_022598D4:
	ldr r0, [sp]
	mov r1, #1
	bl BattleSystem_SetBattleOutcomeFlags
_022598DC:
	mov r2, #0x65
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	ldrb r1, [r1, r2]
	ldr r2, [sp, #0x10]
	ldr r0, [sp]
	ldrb r2, [r2]
	bl BattleController_EmitClearCommand
	ldr r0, [sp, #4]
	bl ov12_02259928
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov12_022597EC

	thumb_func_start ov12_022598F8
ov12_022598F8: ; 0x022598F8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	bl BattleSystem_GetWindow
	add r6, r0, #0
	mov r1, #0xff
	bl FillWindowPixelBuffer
	add r0, r6, #0
	bl CopyWindowPixelsToVram_TextMode
	mov r1, #0x65
	lsl r1, r1, #2
	ldrb r1, [r4, r1]
	add r0, r5, #0
	mov r2, #0x42
	bl BattleController_EmitClearCommand
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, r5, r6, pc}
	thumb_func_end ov12_022598F8

	thumb_func_start ov12_02259928
ov12_02259928: ; 0x02259928
	mov r1, #0
	add r0, #0x94
	strb r1, [r0]
	bx lr
	thumb_func_end ov12_02259928

	thumb_func_start ov12_02259930
ov12_02259930: ; 0x02259930
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x94
	bl ov12_0225B454
	add r0, r4, #0
	bl ov12_02259928
	pop {r4, pc}
	thumb_func_end ov12_02259930

    .rodata

ov12_0226D010: ; 0x0226D010
	.word ov12_02258EB0
	.word ov12_02258EB4
	.word ov12_02258EE0
	.word ov12_02258EF4
	.word ov12_02258F08
	.word ov12_02258F1C
	.word ov12_02258F30
	.word ov12_02258F44
	.word ov12_02258F68
	.word ov12_02258F7C
	.word ov12_02258F90
	.word ov12_02258FA0
	.word ov12_02258FB4
	.word ov12_02258FC8
	.word ov12_02258FD8
	.word ov12_02259000
	.word ov12_02259014
	.word ov12_02259028
	.word ov12_0225903C
	.word ov12_02259050
	.word ov12_02259064
	.word ov12_02259078
	.word ov12_0225908C
	.word ov12_022590A0
	.word ov12_022590D4
	.word ov12_022590E8
	.word ov12_022590FC
	.word ov12_02259110
	.word ov12_02259124
	.word ov12_02259134
	.word ov12_02259148
	.word ov12_0225915C
	.word ov12_02259170
	.word ov12_02259184
	.word ov12_02259198
	.word ov12_022591A8
	.word ov12_022591BC
	.word ov12_022591CC
	.word ov12_022591E0
	.word ov12_022591F4
	.word ov12_022592D0
	.word ov12_02259328
	.word ov12_02259358
	.word ov12_022593D4
	.word ov12_022593E8
	.word ov12_022593FC
	.word ov12_022594F4
	.word ov12_02259514
	.word ov12_022595B8
	.word ov12_022595CC
	.word ov12_022595E0
	.word ov12_0225961C
	.word ov12_02259658
	.word ov12_02259694
	.word ov12_022596B8
	.word ov12_02259700
	.word ov12_02259724
	.word ov12_02259738
	.word ov12_02259748
	.word ov12_02259758
	.word ov12_02259768
	.word ov12_0225978C
	.word ov12_022597B0
	.word ov12_022597C4
	.word ov12_022597D8
	.word ov12_022597EC
	.word ov12_022598F8
	.word ov12_02259930