#include "constants/abilities.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/items.h"
#include "constants/pokemon.h"
#include "constants/std_script.h"
	.include "asm/macros.inc"
	.include "overlay_02.inc"
	.include "global.inc"

	.text

    .extern EncounterSlot_WildMonSlotRoll_Land
    .extern EncounterSlot_WildMonSlotRoll_Surfing
    .extern EncounterSlot_WildMonSlotRoll_Fishing
    .extern EncounterSlot_WildMonSlotRoll_RockSmash
    .extern EncounterSlot_WildMonSlotRoll_Headbutt
    .extern ov02_02247854
    .extern EncounterSlot_WildMonLevelRoll
    .extern ov02_02247910
    .extern ov02_02247A18

	thumb_func_start ov02_02247DA0
ov02_02247DA0: ; 0x02247DA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	ldr r0, [r7, #0xc]
	add r6, r1, #0
	str r2, [sp, #0xc]
	add r5, r3, #0
	bl Save_SafariZone_Get
	mov r1, #3
	bl SafariZone_GetAreaSet
	str r0, [sp, #0x14]
	add r0, r7, #0
	bl ov02_0224E340
	add r7, r0, #0
	bl GF_RTC_GetTimeOfDayWildParam
	add r3, r0, #0
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	beq _02247DDA
	cmp r0, #1
	beq _02247DEC
	cmp r0, #2
	beq _02247DFE
	b _02247E12
_02247DDA:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	mov r2, #0
	bl sub_020974C4
	add r4, r0, #0
	b _02247E16
_02247DEC:
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	mov r2, #1
	bl sub_020974C4
	add r4, r0, #0
	b _02247E16
_02247DFE:
	mov r0, #4
	ldr r2, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	add r2, r2, #2
	bl sub_020974C4
	add r4, r0, #0
	b _02247E16
_02247E12:
	bl GF_AssertFail
_02247E16:
	mov r1, #0
	add r0, sp, #0x18
	strb r1, [r0]
	mov r0, #8
	str r0, [sp]
	mov r0, #0x2a
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0xa
	bl EncounterSlot_AbilityInfluenceOnSlotChoiceCheck
	cmp r0, #0
	bne _02247E50
	mov r0, #0xd
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, sp, #0x18
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0xa
	bl EncounterSlot_AbilityInfluenceOnSlotChoiceCheck
_02247E50:
	cmp r0, #0
	bne _02247E62
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r0, sp, #0x18
	strb r1, [r0]
_02247E62:
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	cmp r0, #0
	bne _02247E7C
	add r3, sp, #0x18
	ldrb r3, [r3]
	add r0, r4, #0
	mov r1, #0xa
	add r2, r5, #0
	bl ov02_022485B0
	add r1, sp, #0x18
	strb r0, [r1]
_02247E7C:
	add r0, sp, #0x18
	ldrb r0, [r0]
	lsl r1, r0, #3
	ldr r0, [r4, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r4, r1
	ldrh r0, [r0, #4]
	add r1, r6, #0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r5, #0
	add r2, r7, #0
	bl ov02_022481EC
	cmp r0, #0
	bne _02247EAC
	add r0, r7, #0
	add r1, r5, #0
	bl ov02_02248290
	cmp r0, #1
	bne _02247EB8
_02247EAC:
	add r0, r4, #0
	bl Heap_Free
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02247EB8:
	str r5, [sp]
	ldr r0, [sp, #0x38]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x34]
	add r1, r7, #0
	mov r3, #1
	bl ov02_02247A18
	add r0, r4, #0
	bl Heap_Free
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_02247DA0

	thumb_func_start ov02_02247ED8
ov02_02247ED8: ; 0x02247ED8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r3, #0
	bl FieldSystem_BugContest_Get
	mov r1, #4
	bl BugContest_GetEncounterSlot
	add r4, r0, #0
	ldrh r0, [r4, #4]
	add r1, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov02_02248290
	cmp r0, #1
	bne _02247F08
	add r0, r4, #0
	bl Heap_Free
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02247F08:
	str r5, [sp]
	ldr r0, [sp, #0x28]
	str r6, [sp, #4]
	str r0, [sp, #8]
	ldrh r1, [r4, #4]
	ldr r0, [r4]
	ldr r2, [sp, #0x24]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	mov r3, #1
	bl ov02_02247A18
	add r0, r4, #0
	bl Heap_Free
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov02_02247ED8

	thumb_func_start ov02_02247F30
ov02_02247F30: ; 0x02247F30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #0xc]
	bl SaveArray_Party_Get
	mov r1, #0
	bl Party_GetMonByIndex
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	add r3, sp, #0x10
	bl ov02_02248618
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02247F80
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetProfile
	bl PlayerProfile_GetTrainerID
	add r3, r0, #0
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r4, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #1
	bl ov02_02247910
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02247F80:
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r4, [sp, #4]
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #1
	mov r3, #0
	bl ov02_02247A18
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02247F30

	thumb_func_start ov02_02247F9C
ov02_02247F9C: ; 0x02247F9C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r4, #0
	bl sub_0205B994
	cmp r0, #0
	beq _02247FCA
	add r0, r6, #0
	bl MetatileBehavior_IsSurfableWater
	cmp r0, #0
	beq _02247FC2
	add r0, r5, #0
	bl ov02_02248020
	add r4, r0, #0
	b _02247FCA
_02247FC2:
	add r0, r5, #0
	bl ov02_02248014
	add r4, r0, #0
_02247FCA:
	cmp r4, #0
	beq _0224800C
	ldr r0, [r5, #0x20]
	ldr r1, [r0]
	ldr r0, _02248010 ; =0x0000013B
	cmp r1, r0
	beq _02247FE0
	add r0, #0xaf
	sub r0, r1, r0
	cmp r0, #2
	bhi _02248008
_02247FE0:
	ldr r0, [r5, #0xc]
	bl Save_VarsFlags_Get
	add r4, r0, #0
	mov r5, #0
_02247FEA:
	add r0, r4, #0
	add r1, r5, #0
	bl Save_VarsFlags_CheckAlphPuzzleFlag
	cmp r0, #0
	beq _02247FFA
	mov r0, #1
	pop {r4, r5, r6, pc}
_02247FFA:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _02247FEA
	mov r0, #0
	pop {r4, r5, r6, pc}
_02248008:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0224800C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02248010: .word 0x0000013B
	thumb_func_end ov02_02247F9C

	thumb_func_start ov02_02248014
ov02_02248014: ; 0x02248014
	push {r3, lr}
	bl MapEvents_GetLoadedEncTable
	ldrb r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02248014

	thumb_func_start ov02_02248020
ov02_02248020: ; 0x02248020
	push {r3, lr}
	bl MapEvents_GetLoadedEncTable
	ldrb r0, [r0, #1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_02248020

	thumb_func_start ov02_0224802C
ov02_0224802C: ; 0x0224802C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapEvents_GetLoadedEncTable
	cmp r4, #0
	beq _02248044
	cmp r4, #1
	beq _02248048
	cmp r4, #2
	beq _0224804C
	b _02248050
_02248044:
	ldrb r4, [r0, #3]
	b _02248058
_02248048:
	ldrb r4, [r0, #4]
	b _02248058
_0224804C:
	ldrb r4, [r0, #5]
	b _02248058
_02248050:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_02248058:
	cmp r4, #0
	bne _02248060
	mov r0, #0
	pop {r3, r4, r5, pc}
_02248060:
	add r0, r5, #0
	bl FollowMon_IsActive
	cmp r0, #0
	beq _0224808A
	ldr r0, [r5, #0xc]
	bl SaveArray_Party_Get
	bl GetFirstAliveMonInParty_CrashIfNone
	mov r1, #9
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov02_02248090
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0224808A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov02_0224802C

	thumb_func_start ov02_02248090
ov02_02248090: ; 0x02248090
	cmp r0, #0x63
	bhi _02248098
	mov r0, #0
	bx lr
_02248098:
	cmp r0, #0x95
	bhi _022480A0
	mov r0, #0x14
	bx lr
_022480A0:
	cmp r0, #0xc7
	bhi _022480A8
	mov r0, #0x1e
	bx lr
_022480A8:
	cmp r0, #0xf9
	bhi _022480B0
	mov r0, #0x28
	bx lr
_022480B0:
	mov r0, #0x32
	bx lr
	thumb_func_end ov02_02248090

	thumb_func_start ov02_022480B4
ov02_022480B4: ; 0x022480B4
	push {r3, lr}
	bl MapEvents_GetLoadedEncTable
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov02_022480B4

	thumb_func_start ov02_022480C0
ov02_022480C0: ; 0x022480C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	mov r0, #0
	str r1, [sp]
	add r7, r2, #0
	str r3, [sp, #4]
	add r4, r0, #0
	add r1, sp, #0x10
_022480D2:
	strb r4, [r1, r0]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xc
	blo _022480D2
	ldr r0, [sp]
	add r5, r4, #0
	cmp r0, #0
	bls _02248128
_022480E6:
	lsl r0, r5, #3
	str r0, [sp, #0xc]
	ldr r0, [r6, r0]
	mov r1, #6
	bl GetMonBaseStat
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	mov r1, #7
	ldr r0, [r6, r0]
	bl GetMonBaseStat
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #8]
	cmp r0, r7
	beq _02248110
	cmp r1, r7
	bne _0224811C
_02248110:
	add r1, r4, #1
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r4, r1, #0x18
	add r1, sp, #0x10
	strb r5, [r1, r0]
_0224811C:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [sp]
	cmp r5, r0
	blo _022480E6
_02248128:
	cmp r4, #0
	beq _02248132
	ldr r0, [sp]
	cmp r4, r0
	bne _02248138
_02248132:
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02248138:
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	add r0, sp, #0x10
	ldrb r1, [r0, r1]
	ldr r0, [sp, #4]
	strb r1, [r0]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov02_022480C0

	thumb_func_start EncounterSlot_AbilityInfluenceOnSlotChoiceCheck
EncounterSlot_AbilityInfluenceOnSlotChoiceCheck: ; 0x02248150
	push {r3, r4, r5, lr}
	ldrb r0, [r1, #0xd]
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #0
	bne _0224818C
	add r0, sp, #0
	ldrb r1, [r1, #0xe]
	ldrb r0, [r0, #0x14]
	cmp r1, r0
	bne _0224818C
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _0224818C
	add r2, sp, #0
	ldrb r2, [r2, #0x10]
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r4, #0
	bl ov02_022480C0
	pop {r3, r4, r5, pc}
_0224818C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end EncounterSlot_AbilityInfluenceOnSlotChoiceCheck

	thumb_func_start ov02_02248190
ov02_02248190: ; 0x02248190
	push {r3, r4}
	ldrb r4, [r2, #0xd]
	cmp r4, #0
	bne _022481E2
	cmp r0, #0
	ldrb r0, [r2, #0xe]
	beq _022481AA
	cmp r0, #0x3c
	beq _022481A6
	cmp r0, #0x15
	bne _022481DC
_022481A6:
	lsl r1, r1, #1
	b _022481DC
_022481AA:
	cmp r0, #0x47
	beq _022481B6
	cmp r0, #0x63
	beq _022481B6
	cmp r0, #0x23
	bne _022481BA
_022481B6:
	lsl r1, r1, #1
	b _022481DC
_022481BA:
	cmp r0, #0x51
	bne _022481CA
	cmp r3, #5
	bne _022481DC
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	b _022481DC
_022481CA:
	cmp r0, #0x49
	beq _022481D6
	cmp r0, #0x5f
	beq _022481D6
	cmp r0, #1
	bne _022481DC
_022481D6:
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
_022481DC:
	cmp r1, #0x64
	ble _022481E2
	mov r1, #0x64
_022481E2:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov02_02248190

	thumb_func_start ov02_022481EC
ov02_022481EC: ; 0x022481EC
	push {r4, lr}
	add r4, r2, #0
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _022481FA
	mov r0, #0
	pop {r4, pc}
_022481FA:
	ldrb r2, [r0, #0xd]
	cmp r2, #0
	bne _02248240
	ldrb r0, [r0, #0xe]
	cmp r0, #0x33
	beq _0224820A
	cmp r0, #0x16
	bne _02248240
_0224820A:
	add r0, r1, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #5
	bhi _02248220
	mov r0, #0
	pop {r4, pc}
_02248220:
	sub r0, r0, #5
	cmp r4, r0
	bgt _02248240
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _02248240
	mov r0, #1
	pop {r4, pc}
_02248240:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov02_022481EC

	thumb_func_start ov02_02248244
ov02_02248244: ; 0x02248244
	push {r3, r4, r5, lr}
	add r5, r2, #0
	cmp r1, #1
	beq _02248252
	cmp r1, #2
	beq _0224826A
	b _02248284
_02248252:
	ldr r0, [r0, #0xc]
	bl Save_LocalFieldData_Get
	bl LocalFieldData_GetSafariBallsCounter
	add r1, r0, #0
	ldrh r1, [r1]
	mov r0, #0xb
	bl BattleSetup_New_SafariZone
	str r0, [r5]
	pop {r3, r4, r5, pc}
_0224826A:
	bl FieldSystem_BugContest_Get
	add r4, r0, #0
	bl BugContest_GetSportBallsAddr
	add r1, r0, #0
	ldrh r1, [r1]
	ldr r2, [r4, #0x10]
	mov r0, #0xb
	bl BattleSetup_New_BugContest
	str r0, [r5]
	pop {r3, r4, r5, pc}
_02248284:
	mov r0, #0xb
	mov r1, #0
	bl BattleSetup_New
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov02_02248244

	thumb_func_start ov02_02248290
ov02_02248290: ; 0x02248290
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _022482A0
	ldrb r1, [r1, #0xc]
	cmp r1, r0
	bls _022482A0
	mov r0, #1
	bx lr
_022482A0:
	mov r0, #0
	bx lr
	thumb_func_end ov02_02248290

	thumb_func_start ov02_022482A4
ov02_022482A4: ; 0x022482A4
	mov r2, #0
_022482A6:
	add r1, r0, r2
	ldrb r1, [r1, #0x12]
	cmp r1, #0
	beq _022482B2
	mov r0, #1
	bx lr
_022482B2:
	add r2, r2, #1
	cmp r2, #4
	blt _022482A6
	mov r0, #0
	bx lr
	thumb_func_end ov02_022482A4

	thumb_func_start ov02_022482BC
ov02_022482BC: ; 0x022482BC
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	mov r0, #4
	add r6, r2, #0
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #4
	bl GetRoamerData
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #6
	bl GetRoamerData
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r5, #0
	mov r1, #2
	bl GetRoamerData
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #3
	bl GetRoamerData
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #7
	bl GetRoamerData
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r1, #5
	bl GetRoamerData
	add r1, sp, #0x10
	strh r0, [r1]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	lsl r1, r1, #0x10
	str r0, [sp]
	ldr r3, [sp, #8]
	add r0, r4, #0
	lsr r1, r1, #0x10
	add r2, r7, #0
	bl CreateMonWithFixedIVs
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #0x30
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0x14
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa3
	add r2, sp, #0x10
	bl SetMonData
	ldr r0, [r6, #8]
	add r1, r4, #0
	bl Party_AddMon
	cmp r0, #0
	bne _02248350
	bl GF_AssertFail
_02248350:
	add r0, r4, #0
	bl Heap_Free
	add sp, #0x18
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov02_022482BC

; BOOL ov02_GetRandomActiveRoamerInCurrMap(FieldSystem *fieldSystem, Roamer **out);
	thumb_func_start ov02_GetRandomActiveRoamerInCurrMap
ov02_GetRandomActiveRoamerInCurrMap: ; 0x02248360
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	ldr r0, [r0, #0xc]
	str r1, [sp, #4]
	mov r5, #0
	bl Save_Roamers_Get
	add r6, r0, #0
	add r4, r5, #0
_02248374:
	add r0, r6, #0
	add r1, r4, #0
	bl Roamer_GetLocation
	bl GetRoamMapByLocationIdx
	add r7, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl GetRoamerIsActiveByIndex
	cmp r0, #0
	beq _022483AC
	ldr r0, [sp]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	cmp r7, r0
	bne _022483AC
	add r0, r6, #0
	add r1, r4, #0
	bl Roamers_GetRoamMonStats
	lsl r2, r5, #2
	add r1, sp, #8
	str r0, [r1, r2]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022483AC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02248374
	cmp r5, #0
	bne _022483C0
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022483C0:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _022483DC
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022483DC:
	cmp r5, #1
	bls _0224840A
	cmp r5, #0
	bne _022483E8
	bl GF_AssertFail
_022483E8:
	cmp r5, #1
	bhi _022483F0
	mov r0, #0
	b _022483FE
_022483F0:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
_022483FE:
	lsl r1, r0, #2
	add r0, sp, #8
	ldr r1, [r0, r1]
	ldr r0, [sp, #4]
	str r1, [r0]
	b _02248410
_0224840A:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	str r1, [r0]
_02248410:
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_GetRandomActiveRoamerInCurrMap

	thumb_func_start ov02_02248418
ov02_02248418: ; 0x02248418
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r6, r2, #0
	mov r4, #0
	cmp r5, #0
	ble _0224843E
_02248426:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #1
	bl Pokedex_GetSeenFormByIdx_Unown
	cmp r6, r0
	bne _02248438
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02248438:
	add r4, r4, #1
	cmp r4, r5
	blt _02248426
_0224843E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov02_02248418

	thumb_func_start ov02_02248444
ov02_02248444: ; 0x02248444
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _02248470
	bl LCRandom
	ldr r1, _02248554 ; =ov02_022532B4 + 0x24 - 0x48
	lsr r2, r0, #0x1f
	ldr r3, [r1, #0x48]
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add sp, #0x18
	ldrb r0, [r3, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02248470:
	mov r0, #4
	mov r1, #0x1c
	bl Heap_AllocAtEnd
	str r0, [sp, #8]
	mov r0, #4
	mov r1, #0x1c
	bl Heap_AllocAtEnd
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	ldr r0, [sp, #4]
	mov r1, #0
	mov r2, #0x1c
	bl MI_CpuFill8
	bl GetRadioMusicPlayingSeq
	cmp r0, #6
	bne _022484A4
	mov r0, #1
	str r0, [sp, #0xc]
_022484A4:
	ldr r0, [sp]
	mov r6, #0
	ldr r0, [r0, #0x18]
	mov r1, #1
	add r7, r6, #0
	bl Pokedex_GetSeenFormNum_Unown
	lsl r0, r0, #0x18
	add r1, r6, #0
	lsr r0, r0, #0x18
	ldr r4, _02248558 ; =ov02_022532B4
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
_022484BE:
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _02248500
	ldr r0, [r4]
	mov r5, #0
	cmp r0, #0
	ble _02248500
_022484D2:
	ldr r2, [r4, #4]
	ldr r0, [sp]
	ldrb r2, [r2, r5]
	ldr r0, [r0, #0x18]
	ldr r1, [sp, #0x14]
	bl ov02_02248418
	cmp r0, #0
	bne _022484EE
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #4]
	strb r1, [r0, r6]
	add r6, r6, #1
_022484EE:
	ldr r0, [r4, #4]
	ldrb r1, [r0, r5]
	ldr r0, [sp, #8]
	add r5, r5, #1
	strb r1, [r0, r7]
	ldr r0, [r4]
	add r7, r7, #1
	cmp r5, r0
	blt _022484D2
_02248500:
	ldr r0, [sp, #0x10]
	add r4, #8
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _022484BE
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02248534
	cmp r6, #0
	ble _02248534
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	cmp r1, #0x32
	bge _02248534
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	ldr r0, [sp, #4]
	ldrb r4, [r0, r1]
	b _02248542
_02248534:
	bl LCRandom
	add r1, r7, #0
	bl _s32_div_f
	ldr r0, [sp, #8]
	ldrb r4, [r0, r1]
_02248542:
	ldr r0, [sp, #4]
	bl Heap_Free
	ldr r0, [sp, #8]
	bl Heap_Free
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248554: .word ov02_022532B4 + 0x24 - 0x48
_02248558: .word ov02_022532B4
	thumb_func_end ov02_02248444

	thumb_func_start ov02_0224855C
ov02_0224855C: ; 0x0224855C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldrb r0, [r5, #0xd]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	bne _02248576
	ldrb r0, [r5, #0xe]
	cmp r0, #0xe
	bne _02248576
	mov r2, #1
	b _02248578
_02248576:
	mov r2, #0
_02248578:
	ldr r1, [r6]
	add r0, r4, #0
	bl WildMonSetRandomHeldItem
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	cmp r0, #SPECIES_UNOWN
	bne _022485A2
	add r0, r5, #0
	bl ov02_02248444
	add r1, sp, #0
	strb r0, [r1]
	add r0, r4, #0
	mov r1, #0x70
	add r2, sp, #0
	bl SetMonData
_022485A2:
	lsl r0, r7, #2
	add r0, r6, r0
	ldr r0, [r0, #4]
	add r1, r4, #0
	bl Party_AddMon
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_0224855C

	thumb_func_start ov02_022485B0
ov02_022485B0: ; 0x022485B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r2, #0xd]
	add r6, r1, #0
	add r4, r3, #0
	cmp r0, #0
	bne _02248614
	ldrb r0, [r2, #0xe]
	cmp r0, #0x48
	beq _022485CC
	cmp r0, #0x37
	beq _022485CC
	cmp r0, #0x2e
	bne _02248614
_022485CC:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _022485E6
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_022485E6:
	mov r7, #0
	cmp r6, #0
	ble _02248610
_022485EC:
	lsl r2, r4, #3
	lsl r0, r7, #3
	add r3, r5, r2
	add r1, r5, r0
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	cmp r0, r2
	bne _02248606
	ldrh r1, [r1, #4]
	ldrh r0, [r3, #4]
	cmp r1, r0
	bls _02248606
	add r4, r7, #0
_02248606:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, r6
	blt _022485EC
_02248610:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02248614:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov02_022485B0

	thumb_func_start ov02_02248618
ov02_02248618: ; 0x02248618
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	add r5, r3, #0
	bl GetMonData
	cmp r0, #0
	bne _0224863C
	mov r2, #0
	add r0, r4, #0
	mov r1, #0xa
	strb r2, [r5, #0xd]
	bl GetMonData
	b _02248642
_0224863C:
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r0, #NUM_ABILITIES
_02248642:
	strb r0, [r5, #0xe]
	mov r0, #0
	strb r0, [r5, #0xc]
	str r0, [r5, #4]
	str r0, [r5, #8]
	strb r0, [r5, #0xf]
	strb r0, [r5, #0x10]
	ldr r0, [r7, #0xc]
	bl Save_VarsFlags_Get
	add r6, r0, #0
	ldr r0, [r7, #0x20]
	ldr r1, [r0]
	ldr r0, _02248694 ; =0x000001EB
	cmp r1, r0
	bne _02248666
	mov r0, #1
	b _02248668
_02248666:
	mov r0, #0
_02248668:
	strb r0, [r5, #0x11]
	mov r4, #0
_0224866C:
	add r0, r6, #0
	add r1, r4, #0
	bl Save_VarsFlags_CheckAlphPuzzleFlag
	add r1, r5, r4
	add r4, r4, #1
	strb r0, [r1, #0x12]
	cmp r4, #4
	blt _0224866C
	ldr r0, [r7, #0xc]
	bl Save_Pokedex_Get
	str r0, [r5, #0x18]
	ldr r0, [r7, #0xc]
	bl Save_PlayerData_GetProfile
	bl PlayerProfile_GetTrainerID
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248694: .word 0x000001EB
	thumb_func_end ov02_02248618

	thumb_func_start ov02_02248698
ov02_02248698: ; 0x02248698
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	cmp r0, #3
	bhi _022486F8
	add r2, r0, r0
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022486B8: ; jump table
	.short _022486C0 - _022486B8 - 2 ; case 0
	.short _022486CE - _022486B8 - 2 ; case 1
	.short _022486DC - _022486B8 - 2 ; case 2
	.short _022486EA - _022486B8 - 2 ; case 3
_022486C0:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #1
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486CE:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #0
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486DC:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #3
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486EA:
	add r2, r4, #0
	add r2, #0x7a
	ldrh r2, [r2]
	cmp r2, #2
	bne _022486FE
	mov r1, #1
	b _022486FE
_022486F8:
	bl GF_AssertFail
	pop {r4, pc}
_022486FE:
	cmp r1, #0
	beq _0224871C
	add r1, r4, #0
	add r1, #0x7c
	ldrh r2, [r1]
	ldr r1, _02248724 ; =0x0000FFFF
	cmp r2, r1
	bhs _0224871C
	add r1, r4, #0
	add r1, #0x7c
	ldrh r1, [r1]
	add r2, r1, #1
	add r1, r4, #0
	add r1, #0x7c
	strh r2, [r1]
_0224871C:
	add r4, #0x7a
	strh r0, [r4]
	pop {r4, pc}
	nop
_02248724: .word 0x0000FFFF
	thumb_func_end ov02_02248698

    .rodata

ov02_02253288:
	.byte 0x1A, 0x1B, 0x00, 0x00

ov02_0225328C:
	.byte 0x16, 0x17, 0x18, 0x19

    .global ov02_02253290
ov02_02253290: ; 0x02253290
    .word 2

    .global ov02_02253294
ov02_02253294: ; 0x02253294
    .word 0, 2, 3

    .global ov02_022532A0
ov02_022532A0: ; 0x022532A0
    .word 0, 1, 2, 3, 4

ov02_022532B4: ; 0x022532B4
	.word 0x0A, ov02_022532EC
	.word 0x05, ov02_022532DC
	.word 0x07, ov02_022532E4
	.word 0x04, ov02_0225328C
	.word 0x02, ov02_02253288

ov02_022532DC:
	.byte 0x11, 0x12, 0x13, 0x14, 0x15, 0x00, 0x00, 0x00

ov02_022532E4:
	.byte 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x00

ov02_022532EC:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x00, 0x00
