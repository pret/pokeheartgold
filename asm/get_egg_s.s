#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.public Daycare_GetBoxMonI
	.public Sav2_DayCare_CountMonsInDayCare
	.public Sav2_DayCare_GetAvailableSlot
	.public DayCareMon_CopyFromPartySlot
	.public Sav2_DayCare_Compaction
	.public sub_0206BF60
	.public Sav2_DayCare_MoveMonToParty
	.public GetDayCareUpdatedLevel
	.public DayCareMon_CalcLevelGrowth
	.public DayCareMon_BufferLevelGrowthAndNick
	.public DayCareMon_BufferNickAndRetrievalPrice
	.public Daycare_GetBothBoxMonsPtr
	.public sub_0206C1E4
	.public GenerateEggPID
	.public _IVList_Remove
	.public InheritIVs
	.public sub_0206C488
	.public InheritMoves
	.public Daycare_BreedingIncenseCheck
	.public Daycare_LightBallCheck
	.public Daycare_GetEggSpecies
	.public SetBreedEggStats
	.public GetEggCyclesToSubtract
	.public sub_0206CB88
	.public ComputeCompatibilityBetweenBoxMons
	.public Sav2_DayCare_CalcCompatibilityInternal
	.public sub_0206CCD8
	.public sub_0206D038

	thumb_func_start sub_0206D038
sub_0206D038: ; 0x0206D038
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r0, #0
	add r5, r1, #0
	mov r0, #8
	bl String_ctor
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl AllocMonZeroed
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r5, #0
	add r7, sp, #0x34
_0206D064:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r1, r5, #1
	strh r0, [r7, r1]
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x30
	strb r0, [r1, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _0206D064
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	add r7, r0, #0
	mov r5, #0
_0206D09C:
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x46
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x24
	add r1, #2
	strb r0, [r1, r5]
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #6
	blo _0206D09C
	add r0, r4, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #9]
	add r0, r4, #0
	mov r1, #0x7a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #8]
	add r0, r4, #0
	mov r1, #0xb
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #7]
	add r0, r4, #0
	mov r1, #0x9a
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #0xa]
	add r0, r4, #0
	mov r1, #0x6e
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #5]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x91
	bl GetMonData
	add r0, r4, #0
	mov r1, #0x9d
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #3]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x2c]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #4]
	ldr r1, _0206D324 ; =0x000001EA
	ldr r0, [sp, #0x14]
	cmp r0, r1
	bne _0206D170
	add r0, r4, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	mov r0, #2
	mov r1, #1
	bl sub_02017FE4
	cmp r5, r0
	bne _0206D170
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	beq _0206D170
_0206D15C:
	add r0, r7, #0
	bl PRandom
	add r7, r0, #0
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	bne _0206D15C
_0206D170:
	mov r2, #1
	str r2, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	mov r3, #0x20
	bl CreateMon
	mov r5, #0
	add r7, sp, #0x34
_0206D18A:
	add r1, r5, #0
	lsl r2, r5, #1
	add r0, r6, #0
	add r1, #0x36
	add r2, r7, r2
	bl SetMonData
	add r1, r5, #0
	add r2, sp, #0x30
	add r0, r6, #0
	add r1, #0x3a
	add r2, r2, r5
	bl SetMonData
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #4
	blo _0206D18A
	add r7, sp, #0x24
	mov r5, #0
	add r7, #2
_0206D1B6:
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x46
	add r2, r7, r5
	bl SetMonData
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #6
	blo _0206D1B6
	add r2, sp, #0x20
	add r0, r6, #0
	mov r1, #0xc
	add r2, #1
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x7a
	add r2, sp, #0x20
	bl SetMonData
	add r2, sp, #0x1c
	add r0, r6, #0
	mov r1, #0xb
	add r2, #3
	bl SetMonData
	add r2, sp, #0x1c
	mov r1, #0x78
	add r0, sp, #0x18
	strb r1, [r0, #6]
	add r0, r6, #0
	mov r1, #9
	add r2, #2
	bl SetMonData
	add r2, sp, #0x20
	add r0, r6, #0
	mov r1, #0x9a
	add r2, #2
	bl SetMonData
	add r2, sp, #0x1c
	add r0, r6, #0
	mov r1, #0x6e
	add r2, #1
	bl SetMonData
	ldr r2, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0x91
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x9d
	add r2, #3
	bl SetMonData
	add r0, r6, #0
	mov r1, #7
	add r2, sp, #0x2c
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x70
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strh r0, [r1, #0xc]
	add r0, r4, #0
	mov r1, #0x92
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0x93
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #1]
	add r0, r4, #0
	mov r1, #0x94
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1]
	add r0, r6, #0
	mov r1, #0x98
	add r2, sp, #0x24
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x92
	add r2, #2
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x93
	add r2, #1
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x94
	add r2, sp, #0x18
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x99
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strh r0, [r1, #0xc]
	add r0, r4, #0
	mov r1, #0x95
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #2]
	add r0, r4, #0
	mov r1, #0x96
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1, #1]
	add r0, r4, #0
	mov r1, #0x97
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x18
	strb r0, [r1]
	add r0, r6, #0
	mov r1, #0x99
	add r2, sp, #0x24
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x95
	add r2, #2
	bl SetMonData
	add r2, sp, #0x18
	add r0, r6, #0
	mov r1, #0x96
	add r2, #1
	bl SetMonData
	add r0, r6, #0
	mov r1, #0x97
	add r2, sp, #0x18
	bl SetMonData
	add r0, r6, #0
	add r1, r4, #0
	bl CopyPokemonToPokemon
	ldr r0, [sp, #0x10]
	bl String_dtor
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_0206D324: .word 0x000001EA
	thumb_func_end sub_0206D038

	thumb_func_start sub_0206D328
sub_0206D328: ; 0x0206D328
	push {r4, r5, lr}
	sub sp, #0x1c
	mov r3, #0x46
	add r2, sp, #0
	strb r3, [r2, #3]
	mov r5, #0
	strb r5, [r2, #2]
	mov r3, #4
	strb r3, [r2, #1]
	add r4, r0, #0
	strb r5, [r2]
	bl sub_0206D038
	add r2, sp, #0
	add r0, r4, #0
	mov r1, #0x4c
	add r2, #3
	bl SetMonData
	add r0, r4, #0
	mov r1, #5
	add r2, r5, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add r1, r5, #0
	add r2, sp, #4
	bl GetSpeciesNameIntoArray
	add r0, r4, #0
	mov r1, #0x75
	add r2, sp, #4
	bl SetMonData
	add r2, sp, #0
	add r0, r4, #0
	mov r1, #0x4d
	add r2, #2
	bl SetMonData
	add r2, sp, #0
	add r0, r4, #0
	mov r1, #0x9b
	add r2, #1
	bl SetMonData
	add r0, r4, #0
	mov r1, #0x9c
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206D328

	thumb_func_start _IVList_Sample
_IVList_Sample: ; 0x0206D39C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r5, #0
	add r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r7, r5, #0
	add r4, r5, #0
_0206D3AC:
	add r0, r6, #0
	add r1, r4, #0
	bl Daycare_GetBoxMonI
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	add r1, sp, #8
	lsr r0, r0, #0x10
	add r1, r1, r4
	bl sub_0206D43C
	cmp r0, #0
	beq _0206D3D4
	add r0, r5, #1
	lsl r0, r0, #0x18
	add r7, r4, #0
	lsr r5, r0, #0x18
_0206D3D4:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0206D3AC
	cmp r5, #2
	bne _0206D418
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, sp, #8
	beq _0206D408
	ldrb r1, [r0]
	ldr r0, [sp]
	strb r1, [r0]
	ldr r0, [sp, #4]
	mov r1, #0
	strb r1, [r0]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206D408:
	ldrb r1, [r0, #1]
	ldr r0, [sp]
	strb r1, [r0]
	ldr r1, [sp, #4]
	mov r0, #1
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0206D418:
	cmp r5, #1
	bne _0206D42E
	add r0, sp, #8
	ldrb r1, [r0, r7]
	ldr r0, [sp]
	strb r1, [r0]
	ldr r0, [sp, #4]
	add sp, #0xc
	strb r7, [r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206D42E:
	ldr r1, [sp]
	mov r0, #0
	strb r0, [r1]
	ldr r1, [sp, #4]
	strb r0, [r1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end _IVList_Sample

	thumb_func_start sub_0206D43C
sub_0206D43C: ; 0x0206D43C
	ldr r2, _0206D490 ; =ITEM_POWER_BRACER
	sub r0, r0, r2
	cmp r0, #5
	bhi _0206D48A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206D450: ; jump table
	.short _0206D464 - _0206D450 - 2 ; case ITEM_POWER_BRACER
	.short _0206D46A - _0206D450 - 2 ; case ITEM_POWER_BELT
	.short _0206D47A - _0206D450 - 2 ; case ITEM_POWER_LENS
	.short _0206D482 - _0206D450 - 2 ; case ITEM_POWER_BAND
	.short _0206D472 - _0206D450 - 2 ; case ITEM_POWER_ANKLET
	.short _0206D45C - _0206D450 - 2 ; case ITEM_POWER_WEIGHT
_0206D45C:
	mov r0, #0
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D464:
	mov r0, #1
	strb r0, [r1]
	bx lr
_0206D46A:
	mov r0, #2
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D472:
	mov r0, #3
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D47A:
	mov r0, #4
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D482:
	mov r0, #5
	strb r0, [r1]
	mov r0, #1
	bx lr
_0206D48A:
	mov r0, #0
	bx lr
	nop
_0206D490: .word ITEM_POWER_BRACER
	thumb_func_end sub_0206D43C
