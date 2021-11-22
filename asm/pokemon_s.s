#include "constants/species.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

	.text

	.public GenPersonalityByGenderAndNature
	.public LoadGrowthTable
	.public GetExpByGrowthRateAndLevel
	.public sub_02070560
	.public Mon_ForceSetGiratinaOriginForme
	.public sub_0207213C
	.public sub_02073058
	.public _u32_getDigitN
	.public sItemOdds
    .public _020FF4EC
    .public _020FF4F8
    .public _020FF50C
    .public sFriendshipModTable
    .public _020FF544
    .public sLegendaryMonsList
    .public _020FF588
    .public sFlavorPreferencesByNature
    .public sNatureStatMods
    .public _020FF6B6
    .public _020FF733
    .public _020FF7B4

	thumb_func_start CalcMonPokeathlonPerformance
CalcMonPokeathlonPerformance: ; 0x02073238
	push {r4, lr}
	add r4, r1, #0
	bl Mon_GetBoxMon
	add r1, r4, #0
	bl CalcBoxMonPokeathlonPerformance
	pop {r4, pc}
	thumb_func_end CalcMonPokeathlonPerformance

	thumb_func_start sub_02073248
sub_02073248: ; 0x02073248
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	str r2, [sp]
	mov r1, #0
	mov r2, #8
	add r5, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	add r1, sp, #4
	bl CalcBoxMonPokeathlonPerformance
	mov r4, #0
	add r6, sp, #4
	add r7, r4, #0
_02073268:
	ldr r0, [sp]
	cmp r0, #0
	beq _02073282
	mov r0, #2
	ldrsh r1, [r6, r0]
	ldr r0, [sp]
	ldrsb r0, [r0, r4]
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	bl sub_02073058
	b _0207328A
_02073282:
	mov r0, #2
	ldrsh r0, [r6, r0]
	bl sub_02073058
_0207328A:
	ldrh r1, [r6]
	lsl r2, r1, #0x1d
	lsr r2, r2, #0x1d
	add r0, r0, r2
	lsl r0, r0, #0x10
	lsl r3, r1, #0x17
	asr r0, r0, #0x10
	lsr r3, r3, #0x1d
	cmp r0, r3
	bge _020732A4
	lsl r0, r3, #0x10
	asr r0, r0, #0x10
	b _020732B0
_020732A4:
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1d
	cmp r0, r1
	ble _020732B0
	lsl r0, r1, #0x10
	asr r0, r0, #0x10
_020732B0:
	cmp r0, r2
	bne _020732BC
	add r2, r5, r4
	mov r1, #0
	strb r1, [r2, #2]
	b _020732CE
_020732BC:
	cmp r0, r2
	bge _020732C8
	add r2, r5, r4
	mov r1, #2
	strb r1, [r2, #2]
	b _020732CE
_020732C8:
	add r2, r5, r4
	mov r1, #1
	strb r1, [r2, #2]
_020732CE:
	ldrh r1, [r5]
	lsl r0, r7
	orr r0, r1
	add r4, r4, #1
	strh r0, [r5]
	add r6, r6, #4
	add r7, r7, #3
	cmp r4, #5
	blo _02073268
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02073248

	thumb_func_start sub_020732E4
sub_020732E4: ; 0x020732E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r6, r3, #0
	add r0, r1, #0
	bl Mon_GetBoxMon
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02073248
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020732E4
