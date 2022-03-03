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
	.public sub_0206C274
	.public _IVList_Remove
	.public InheritIVs
	.public sub_0206C488
	.public InheritMoves
	.public Daycare_BreedingIncenseCheck
	.public Daycare_LightBallCheck
	.public Daycare_GetEggSpecies
	.public SetBreedEggStats

	thumb_func_start GiveEggToPlayer
GiveEggToPlayer: ; 0x0206CA70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #4
	str r1, [sp, #4]
	add r7, r2, #0
	bl AllocMonZeroed
	add r1, sp, #0x10
	add r4, r0, #0
	add r0, r5, #0
	add r1, #1
	bl Daycare_GetEggSpecies
	add r1, r5, #0
	bl Daycare_BreedingIncenseCheck
	add r6, r0, #0
	add r0, r7, #0
	bl PlayerProfile_GetTrainerID
	add r1, sp, #0x10
	str r0, [sp, #8]
	ldrb r1, [r1, #1]
	add r0, r5, #0
	bl Daycare_GetBoxMonI
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r3, [sp, #8]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl SetBreedEggStats
	add r0, r4, #0
	add r1, r5, #0
	bl InheritIVs
	add r1, sp, #0x10
	ldrb r1, [r1, #2]
	add r0, r5, #0
	bl Daycare_GetBoxMonI
	add r1, sp, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r1, #1]
	add r0, r5, #0
	bl Daycare_GetBoxMonI
	add r2, r0, #0
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl InheritMoves
	mov r0, #1
	mov r1, #0
	bl sub_02017FE4
	add r3, r0, #0
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #3
	bl MonSetTrainerMemo
	cmp r6, #SPECIES_PICHU
	bne _0206CB0C
	add r0, r4, #0
	add r1, r5, #0
	bl Daycare_LightBallCheck
_0206CB0C:
	mov r1, #1
	add r0, sp, #0x10
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x4c
	add r2, sp, #0x10
	bl SetMonData
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl AddMonToParty
	add r0, r5, #0
	bl Sav2_DayCare_ResetEggStats
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end GiveEggToPlayer

	thumb_func_start sub_0206CB34
sub_0206CB34: ; 0x0206CB34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _0206CB84
	mov r7, #0xad
_0206CB46:
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CB7A
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0x28
	beq _0206CB76
	cmp r0, #0x31
	bne _0206CB7A
_0206CB76:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_0206CB7A:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, r6
	blt _0206CB46
_0206CB84:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206CB34

	thumb_func_start sub_0206CB88
sub_0206CB88: ; 0x0206CB88
	push {r4, r5, r6, r7}
	mov r4, #0
	add r3, r4, #0
_0206CB8E:
	ldrh r7, [r0]
	add r5, r3, #0
	add r6, r1, #0
_0206CB94:
	ldrh r2, [r6]
	cmp r7, r2
	bne _0206CBA0
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_0206CBA0:
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, #2
	blt _0206CB94
	add r4, r4, #1
	add r0, r0, #2
	cmp r4, #2
	blt _0206CB8E
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206CB88

	thumb_func_start ComputeCompatibilityBetweenBoxMons
ComputeCompatibilityBetweenBoxMons: ; 0x0206CBB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, sp, #0x10
	add r4, sp, #0x18
	str r0, [sp]
	add r7, sp, #8
	add r6, sp, #0x1c
_0206CBCC:
	ldr r0, [r5]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	strh r0, [r4]
	ldr r0, [r5]
	mov r1, #7
	mov r2, #0
	bl GetBoxMonData
	ldr r1, [sp]
	str r0, [r1]
	mov r1, #0
	ldr r0, [r5]
	add r2, r1, #0
	bl GetBoxMonData
	add r1, r0, #0
	ldrh r0, [r4]
	bl GetGenderBySpeciesAndPersonality
	stmia r7!, {r0}
	ldrh r0, [r4]
	mov r1, #0x16
	bl GetMonBaseStat
	strh r0, [r6]
	ldrh r0, [r4]
	mov r1, #0x17
	bl GetMonBaseStat
	strh r0, [r6, #2]
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	add r4, r4, #2
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp, #4]
	cmp r0, #2
	blo _0206CBCC
	add r0, sp, #8
	ldrh r1, [r0, #0x14]
	cmp r1, #0xf
	beq _0206CC32
	ldrh r0, [r0, #0x18]
	cmp r0, #0xf
	bne _0206CC38
_0206CC32:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC38:
	cmp r1, #0xd
	bne _0206CC46
	cmp r0, #0xd
	bne _0206CC46
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC46:
	cmp r1, #0xd
	beq _0206CC4E
	cmp r0, #0xd
	bne _0206CC62
_0206CC4E:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bne _0206CC5C
	add sp, #0x24
	mov r0, #0x14
	pop {r4, r5, r6, r7, pc}
_0206CC5C:
	add sp, #0x24
	mov r0, #0x32
	pop {r4, r5, r6, r7, pc}
_0206CC62:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r0, r1
	bne _0206CC70
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC70:
	cmp r0, #2
	beq _0206CC78
	cmp r1, #2
	bne _0206CC7E
_0206CC78:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC7E:
	add r0, sp, #0x1c
	add r1, sp, #0x20
	bl sub_0206CB88
	cmp r0, #0
	bne _0206CC90
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0206CC90:
	add r0, sp, #8
	ldrh r1, [r0, #0x10]
	ldrh r0, [r0, #0x12]
	cmp r1, r0
	bne _0206CCAE
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	beq _0206CCA8
	add sp, #0x24
	mov r0, #0x46
	pop {r4, r5, r6, r7, pc}
_0206CCA8:
	add sp, #0x24
	mov r0, #0x32
	pop {r4, r5, r6, r7, pc}
_0206CCAE:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	beq _0206CCBC
	add sp, #0x24
	mov r0, #0x32
	pop {r4, r5, r6, r7, pc}
_0206CCBC:
	mov r0, #0x14
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ComputeCompatibilityBetweenBoxMons

	thumb_func_start Sav2_DayCare_CalcCompatibilityInternal
Sav2_DayCare_CalcCompatibilityInternal: ; 0x0206CCC4
	push {r3, lr}
	sub sp, #8
	add r1, sp, #0
	bl Daycare_GetBothBoxMonsPtr
	add r0, sp, #0
	bl ComputeCompatibilityBetweenBoxMons
	add sp, #8
	pop {r3, pc}
	thumb_func_end Sav2_DayCare_CalcCompatibilityInternal

	thumb_func_start sub_0206CCD8
sub_0206CCD8: ; 0x0206CCD8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_0205560C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02055600
	mov r1, #0x64
	mul r1, r0
	add r0, r4, #0
	add r5, r5, r1
	bl sub_02055670
	cmp r0, #0
	beq _0206CCFC
	mov r0, #255
	pop {r3, r4, r5, pc}
_0206CCFC:
	ldr r2, _0206CD18 ; =_020FF490
	mov r1, #0
_0206CD00:
	ldrh r0, [r2]
	cmp r5, r0
	bne _0206CD0A
	mov r0, #230
	pop {r3, r4, r5, pc}
_0206CD0A:
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #0xf
	blo _0206CD00
	mov r0, #255
	pop {r3, r4, r5, pc}
	nop
_0206CD18: .word _020FF490
	thumb_func_end sub_0206CCD8

	thumb_func_start sub_0206CD1C
sub_0206CD1C: ; 0x0206CD1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r1, sp, #8
	str r0, [sp]
	str r2, [sp, #4]
	bl Daycare_GetBothBoxMonsPtr
	mov r6, #0
	add r4, r6, #0
	add r5, sp, #8
_0206CD32:
	ldr r0, [r5]
	mov r1, #0xac
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206CD50
	ldr r0, [sp]
	add r1, r4, #0
	bl Sav2_DayCare_GetMonX
	mov r1, #1
	bl DayCareMon_AddSteps
	add r6, r6, #1
_0206CD50:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blo _0206CD32
	ldr r0, [sp]
	bl Sav2_DayCare_HasEgg
	cmp r0, #0
	bne _0206CDA2
	cmp r6, #2
	bne _0206CDA2
	ldr r0, [sp]
	mov r1, #1
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetSteps
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #0xff
	bne _0206CDA2
	ldr r0, [sp]
	bl Sav2_DayCare_CalcCompatibilityInternal
	add r4, r0, #0
	bl LCRandom
	mov r1, #0x64
	mul r1, r0
	add r0, r1, #0
	ldr r1, _0206CE40 ; =0x0000FFFF
	bl _u32_div_f
	cmp r4, r0
	bls _0206CDA2
	ldr r0, [sp]
	bl sub_0206C274
	ldr r0, [sp, #4]
	bl sub_0209316C
_0206CDA2:
	ldr r0, [sp]
	bl Sav2_DayCare_GetEggCycleCounter
	add r4, r0, #0
	ldr r0, [sp]
	add r1, r4, #1
	bl Sav2_DayCare_SetEggCycleCounter
	ldr r0, [sp, #4]
	bl sub_0206CCD8
	add r1, r4, #1
	cmp r1, r0
	bne _0206CE3A
	ldr r0, [sp]
	mov r1, #0
	bl Sav2_DayCare_SetEggCycleCounter
	add r0, r7, #0
	bl sub_0206CB34
	add r6, r0, #0
	add r0, r7, #0
	mov r5, #0
	bl GetPartyCount
	cmp r0, #0
	bls _0206CE3A
_0206CDDA:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0206CE2E
	add r0, r4, #0
	mov r1, #3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CE2E
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	cmp r0, #0
	beq _0206CE28
	cmp r0, r6
	blo _0206CE18
	sub r0, r0, r6
	str r0, [sp, #0x10]
	b _0206CE1C
_0206CE18:
	sub r0, r0, #1
	str r0, [sp, #0x10]
_0206CE1C:
	add r0, r4, #0
	mov r1, #9
	add r2, sp, #0x10
	bl SetMonData
	b _0206CE2E
_0206CE28:
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206CE2E:
	add r0, r7, #0
	add r5, r5, #1
	bl GetPartyCount
	cmp r5, r0
	blo _0206CDDA
_0206CE3A:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0206CE40: .word 0x0000FFFF
	thumb_func_end sub_0206CD1C

	thumb_func_start sub_0206CE44
sub_0206CE44: ; 0x0206CE44
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _0206CE90
_0206CE54:
	add r0, r7, #0
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #3
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CE8A
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _0206CE8A
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0206CE8A
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206CE8A:
	add r5, r5, #1
	cmp r5, r6
	blt _0206CE54
_0206CE90:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0206CE44

	thumb_func_start Sav2_DayCare_BufferStoredMonNicks
Sav2_DayCare_BufferStoredMonNicks: ; 0x0206CE94
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r1, sp, #0
	bl Daycare_GetBothBoxMonsPtr
	ldr r0, [sp]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206CEC2
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r2, [sp]
	add r0, r4, #0
	mov r1, #2
	bl BufferBoxMonOTName
_0206CEC2:
	ldr r0, [sp, #4]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206CEDA
	ldr r2, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	bl BufferBoxMonNickname
_0206CEDA:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_BufferStoredMonNicks

	thumb_func_start Sav2_DayCare_BufferMonStats
Sav2_DayCare_BufferMonStats: ; 0x0206CEE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r1, sp, #0x18
	ldrb r6, [r1, #0x10]
	add r5, r0, #0
	add r7, r2, #0
	add r1, r6, #0
	str r3, [sp, #8]
	bl Sav2_DayCare_GetMonX
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl Daycare_GetBoxMonI
	add r5, r0, #0
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	add r2, r5, #0
	bl BufferBoxMonNickname
	ldr r0, [sp, #0xc]
	bl DayCareMon_GetSteps
	add r1, r0, #0
	add r0, r5, #0
	bl GetDayCareUpdatedLevel
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	beq _0206CF68
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x1d
	beq _0206CF58
	cmp r0, #0x20
	bne _0206CF68
_0206CF58:
	add r0, r5, #0
	mov r1, #0x4d
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0206CF68
	mov r4, #2
_0206CF68:
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #8]
	add r2, r4, #0
	bl BufferGenderSymbol
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_BufferMonStats

	thumb_func_start Sav2_DayCare_BufferTailMonNick
Sav2_DayCare_BufferTailMonNick: ; 0x0206CF78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	str r0, [sp]
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [sp]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	bne _0206CFC4
	add r0, r5, #0
	mov r1, #0
	add r2, r7, #0
	bl BufferBoxMonNickname
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206CFC4:
	ldr r2, [sp]
	add r0, r5, #0
	mov r1, #0
	bl BufferBoxMonNickname
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_BufferTailMonNick

	thumb_func_start Sav2_DayCare_GetState
Sav2_DayCare_GetState: ; 0x0206CFD4
	push {r4, lr}
	add r4, r0, #0
	bl Sav2_DayCare_HasEgg
	cmp r0, #0
	beq _0206CFE4
	mov r0, #1
	pop {r4, pc}
_0206CFE4:
	add r0, r4, #0
	bl Sav2_DayCare_CountMonsInDayCare
	cmp r0, #0
	beq _0206CFF6
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
_0206CFF6:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_GetState

	thumb_func_start ConvertDayCareCompatibilityScore
ConvertDayCareCompatibilityScore: ; 0x0206CFFC
	cmp r0, #0x14
	bhi _0206D008
	bhs _0206D01A
	cmp r0, #0
	beq _0206D016
	b _0206D026
_0206D008:
	cmp r0, #0x32
	bhi _0206D010
	beq _0206D01E
	b _0206D026
_0206D010:
	cmp r0, #0x46
	beq _0206D022
	b _0206D026
_0206D016:
	mov r0, #3
	bx lr
_0206D01A:
	mov r0, #2
	bx lr
_0206D01E:
	mov r0, #1
	bx lr
_0206D022:
	mov r0, #0
	bx lr
_0206D026:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ConvertDayCareCompatibilityScore

	thumb_func_start Sav2_DayCare_CalcCompatibility
Sav2_DayCare_CalcCompatibility: ; 0x0206D02C
	push {r3, lr}
	bl Sav2_DayCare_CalcCompatibilityInternal
	bl ConvertDayCareCompatibilityScore
	pop {r3, pc}
	thumb_func_end Sav2_DayCare_CalcCompatibility

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

	.rodata

_020FF490:
	.short  112
	.short  214
	.short  303
	.short  401
	.short  501
	.short  611
	.short  707
	.short  821
	.short  907
	.short  928
	.short 1031
	.short 1121
	.short 1214
	.short 1224
	.short 1225
	.public _020FF4AE
_020FF4AE:
	.short SPECIES_WYNAUT,    ITEM_LAX_INCENSE,  SPECIES_WOBBUFFET
	.short SPECIES_AZURILL,   ITEM_SEA_INCENSE,  SPECIES_MARILL
	.short SPECIES_MIME_JR,   ITEM_ODD_INCENSE,  SPECIES_MR_MIME
	.short SPECIES_BONSLY,    ITEM_ROCK_INCENSE, SPECIES_SUDOWOODO
	.short SPECIES_MUNCHLAX,  ITEM_FULL_INCENSE, SPECIES_SNORLAX
	.short SPECIES_MANTYKE,   ITEM_WAVE_INCENSE, SPECIES_MANTINE
	.short SPECIES_BUDEW,     ITEM_ROSE_INCENSE, SPECIES_ROSELIA
	.short SPECIES_HAPPINY,   ITEM_LUCK_INCENSE, SPECIES_CHANSEY
	.short SPECIES_CHINGLING, ITEM_PURE_INCENSE, SPECIES_CHIMECHO
