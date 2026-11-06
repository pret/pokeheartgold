#include "constants/pokemon.h"
#include "constants/sndseq.h"
	.include "macros.inc"
	.include "overlay_12_battle_controller_opponent.inc"
	.include "global.inc"

    .text

	thumb_func_start ov12_02258D74
ov12_02258D74: ; 0x02258D74
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x6b
	mov r0, #5
	lsl r1, r1, #2
	bl Heap_Alloc
	add r4, r0, #0
	mov r2, #0x6b
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl MIi_CpuClearFast
	mov r0, #0x65
	ldrb r1, [r5]
	lsl r0, r0, #2
	strb r1, [r4, r0]
	ldrb r1, [r5, #1]
	add r0, r0, #1
	strb r1, [r4, r0]
	mov r0, #0xb4
	mov r1, #5
	bl NARC_New
	mov r1, #0x69
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov12_02258D74

	thumb_func_start ov12_02258DB0
ov12_02258DB0: ; 0x02258DB0
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl BattleSystem_GetBattleType
	mov r1, #0x22
	lsl r1, r1, #4
	tst r0, r1
	bne _02258E48
	sub r1, #0x8b
	ldrb r1, [r4, r1]
	mov r0, #1
	tst r0, r1
	beq _02258DDC
	add r0, r5, #0
	bl BattleSystem_GetBattleType
	mov r1, #1
	tst r0, r1
	beq _02258E48
_02258DDC:
	ldr r0, _02258E4C ; =0x00000195
	ldr r1, _02258E50 ; =ov12_0226D120
	ldrb r2, [r4, r0]
	sub r0, r0, #1
	ldrb r1, [r1, r2]
	str r1, [sp]
	mov r1, #5
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldrb r0, [r4, r0]
	str r0, [sp, #0xc]
	add r0, r5, #0
	str r6, [sp, #0x10]
	bl BattleSystem_GetSpriteSystem
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl BattleSystem_GetPaletteData
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x18]
	mov r0, #1
	str r0, [sp, #0x14]
	add r0, sp, #0
	bl ov07_02233DB8
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0x64
	bl ov07_022344C4
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #2
	bl ov07_022344D0
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl ov07_0223449C
	add r4, #0x88
	ldr r0, [r4]
	mov r1, #0
	bl ov07_022344C0
_02258E48:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02258E4C: .word 0x00000195
_02258E50: .word ov12_0226D120
	thumb_func_end ov12_02258DB0
