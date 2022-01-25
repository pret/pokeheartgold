#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D4218:
	.space 4

	.text

	thumb_func_start Daycare_GetBoxMonI
Daycare_GetBoxMonI: ; 0x0206BDB0
	push {r3, lr}
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	pop {r3, pc}
	thumb_func_end Daycare_GetBoxMonI

	thumb_func_start Sav2_DayCare_CountMonsInDayCare
Sav2_DayCare_CountMonsInDayCare: ; 0x0206BDBC
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r6, r0, #0
	add r5, r4, #0
	mov r7, #5
_0206BDC6:
	add r0, r6, #0
	add r1, r5, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r1, r7, #0
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206BDE4
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_0206BDE4:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #2
	blo _0206BDC6
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_CountMonsInDayCare

	thumb_func_start Sav2_DayCare_GetAvailableSlot
Sav2_DayCare_GetAvailableSlot: ; 0x0206BDF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0206BE30 ; =_021D4218
	mov r4, #0
	str r5, [r0]
	mov r6, #5
	add r7, r4, #0
_0206BE02:
	add r0, r5, #0
	add r1, r4, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	add r1, r6, #0
	add r2, r7, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0206BE1E
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206BE1E:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #2
	blo _0206BE02
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206BE30: .word _021D4218
	thumb_func_end Sav2_DayCare_GetAvailableSlot

	thumb_func_start DayCareMon_CopyFromPartySlot
DayCareMon_CopyFromPartySlot: ; 0x0206BE34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r2, #0
	add r6, r0, #0
	str r1, [sp]
	add r7, r3, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	add r0, r5, #0
	bl DayCareMon_GetExtras
	str r0, [sp, #8]
	add r0, r5, #0
	bl DayCareMon_GetBoxMon
	str r0, [sp, #4]
	add r0, r7, #0
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetNamePtr
	add r2, sp, #0xc
	add r0, r4, #0
	mov r1, #0x75
	add r2, #2
	bl GetMonData
	add r0, r4, #0
	bl Mon_GetBoxMon
	bl BoxMonIsHoldingMail
	cmp r0, #0
	beq _0206BE8A
	ldr r0, [sp, #8]
	bl DayCareMail_GetCapsule
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0xaa
	bl GetMonData
_0206BE8A:
	mov r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xbb
	add r2, sp, #0xc
	bl SetMonData
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl CopyBoxPokemonToBoxPokemon
	ldr r0, [sp, #4]
	mov r1, #0
	bl BoxMon_UpdateShayminForme
	add r0, r5, #0
	mov r1, #0
	bl DayCareMon_SetSteps
	ldr r1, [sp]
	add r0, r6, #0
	bl RemoveMonFromParty
	ldr r1, _0206BED4 ; =0x000001B9
	add r0, r6, #0
	bl PartyHasMon
	cmp r0, #0
	bne _0206BED0
	add r0, r7, #0
	bl Sav2_Chatot_get
	bl Chatot_invalidate
_0206BED0:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0206BED4: .word 0x000001B9
	thumb_func_end DayCareMon_CopyFromPartySlot

	thumb_func_start Sav2_DayCare_PutMonIn
Sav2_DayCare_PutMonIn: ; 0x0206BED8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r3, #0
	add r5, r0, #0
	add r0, r7, #0
	add r6, r1, #0
	add r4, r2, #0
	bl Sav2_GameStats_get
	mov r1, #0x29
	bl GameStats_Inc
	add r0, r4, #0
	bl Sav2_DayCare_GetAvailableSlot
	add r1, r0, #0
	add r0, r4, #0
	bl Sav2_DayCare_GetMonX
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl DayCareMon_CopyFromPartySlot
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_PutMonIn

	thumb_func_start Sav2_DayCare_Compaction
Sav2_DayCare_Compaction: ; 0x0206BF0C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r1, #0
	bl Sav2_DayCare_GetMonX
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl Sav2_DayCare_GetMonX
	add r4, r0, #0
	add r0, r5, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	add r0, r4, #0
	bl DayCareMon_GetBoxMon
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0206BF5C
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206BF5C
	add r0, r5, #0
	add r1, r4, #0
	bl DayCareMon_Copy
	add r0, r4, #0
	bl DayCareMon_init
_0206BF5C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end Sav2_DayCare_Compaction

	thumb_func_start sub_0206BF60
sub_0206BF60: ; 0x0206BF60
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #8]
	add r4, sp, #8
	add r6, sp, #4
	add r7, sp, #4
_0206BF72:
	add r0, r5, #0
	bl sub_02070DB4
	cmp r0, #0
	beq _0206BFB4
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	beq _0206BFAA
_0206BF8E:
	ldr r1, _0206BFC0 ; =0x0000FFFF
	cmp r0, r1
	bne _0206BF9C
	ldrh r1, [r7]
	add r0, r5, #0
	bl DeleteMonFirstMoveAndAppend
_0206BF9C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	bne _0206BF8E
_0206BFAA:
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #0x64
	blt _0206BF72
_0206BFB4:
	add r0, r5, #0
	bl CalcMonLevelAndStats
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0206BFC0: .word 0x0000FFFF
	thumb_func_end sub_0206BF60

	thumb_func_start Sav2_DayCare_MoveMonToParty
Sav2_DayCare_MoveMonToParty: ; 0x0206BFC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r6, r1, #0
	mov r0, #4
	add r7, r2, #0
	bl AllocMonZeroed
	add r4, r0, #0
	add r0, r6, #0
	bl DayCareMon_GetBoxMon
	add r5, r0, #0
	add r0, r6, #0
	bl DayCareMon_GetExtras
	str r0, [sp, #4]
	add r0, r7, #0
	mov r1, #0
	add r2, r5, #0
	bl BufferBoxMonNickname
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r5, #0
	add r1, r4, #0
	bl CopyBoxPokemonToPokemon
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x64
	beq _0206C03C
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r6, #0
	bl DayCareMon_GetSteps
	ldr r1, [sp, #8]
	add r2, sp, #8
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #8
	bl SetMonData
	add r0, r4, #0
	bl sub_0206BF60
_0206C03C:
	add r0, r5, #0
	bl BoxMonIsHoldingMail
	cmp r0, #0
	beq _0206C056
	ldr r0, [sp, #4]
	bl DayCareMail_GetCapsule
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0xaa
	bl SetMonData
_0206C056:
	ldr r0, [sp]
	add r1, r4, #0
	bl AddMonToParty
	add r0, r5, #0
	bl ZeroBoxMonData
	add r0, r6, #0
	mov r1, #0
	bl DayCareMon_SetSteps
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end Sav2_DayCare_MoveMonToParty

	thumb_func_start Sav2_DayCare_RetrieveMon
Sav2_DayCare_RetrieveMon: ; 0x0206C078
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	add r1, r3, #0
	bl Sav2_DayCare_GetMonX
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl Sav2_DayCare_MoveMonToParty
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #0
	bl Sav2_DayCare_Compaction
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end Sav2_DayCare_RetrieveMon

	thumb_func_start GetDayCareUpdatedLevel
GetDayCareUpdatedLevel: ; 0x0206C0A0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0xb
	add r5, r1, #0
	bl AllocMonZeroed
	add r7, r0, #0
	bl Mon_GetBoxMon
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CopyPokemonToBoxPokemon
	add r0, r4, #0
	mov r1, #8
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp]
	add r0, r0, r5
	str r0, [sp]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0
	bl SetBoxMonData
	add r0, r4, #0
	bl CalcBoxMonLevel
	add r4, r0, #0
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GetDayCareUpdatedLevel

	thumb_func_start DayCareMon_CalcLevelGrowth
DayCareMon_CalcLevelGrowth: ; 0x0206C0E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	bl CalcBoxMonLevel
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl DayCareMon_GetSteps
	add r1, r0, #0
	add r0, r6, #0
	bl GetDayCareUpdatedLevel
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	sub r0, r0, r4
	pop {r4, r5, r6, pc}
	thumb_func_end DayCareMon_CalcLevelGrowth

	thumb_func_start DayCareMon_BufferLevelGrowthAndNick
DayCareMon_BufferLevelGrowthAndNick: ; 0x0206C110
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	add r0, r4, #0
	bl DayCareMon_CalcLevelGrowth
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #3
	str r1, [sp, #4]
	bl BufferIntegerAsString
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	bl BufferBoxMonNickname
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end DayCareMon_BufferLevelGrowthAndNick

	thumb_func_start DayCareMon_BufferNickAndRetrievalPrice
DayCareMon_BufferNickAndRetrievalPrice: ; 0x0206C14C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r1, #0
	bl DayCareMon_GetBoxMon
	add r6, r0, #0
	add r0, r4, #0
	bl DayCareMon_CalcLevelGrowth
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	bl BufferBoxMonNickname
	add r1, r4, #1
	mov r0, #0x64
	mul r0, r1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #5
	str r1, [sp, #4]
	bl BufferIntegerAsString
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end DayCareMon_BufferNickAndRetrievalPrice

	thumb_func_start Sav2_DayCare_BufferMonNickAndRetrievalPrice
Sav2_DayCare_BufferMonNickAndRetrievalPrice: ; 0x0206C190
	push {r4, lr}
	add r4, r2, #0
	bl Sav2_DayCare_GetMonX
	add r1, r4, #0
	bl DayCareMon_BufferNickAndRetrievalPrice
	pop {r4, pc}
	thumb_func_end Sav2_DayCare_BufferMonNickAndRetrievalPrice

	thumb_func_start Sav2_DayCare_BufferGrowthAndNick
Sav2_DayCare_BufferGrowthAndNick: ; 0x0206C1A0
	push {r3, r4, r5, lr}
	add r5, r2, #0
	bl Sav2_DayCare_GetMonX
	add r4, r0, #0
	bl DayCareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0206C1C4
	add r0, r4, #0
	add r1, r5, #0
	bl DayCareMon_BufferLevelGrowthAndNick
	pop {r3, r4, r5, pc}
_0206C1C4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end Sav2_DayCare_BufferGrowthAndNick

	thumb_func_start Daycare_GetBothBoxMonsPtr
Daycare_GetBothBoxMonsPtr: ; 0x0206C1C8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	bl Daycare_GetBoxMonI
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl Daycare_GetBoxMonI
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Daycare_GetBothBoxMonsPtr

	thumb_func_start sub_0206C1E4
sub_0206C1E4: ; 0x0206C1E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r1, sp, #0
	bl Daycare_GetBothBoxMonsPtr
	mov r6, #0
	add r7, r6, #0
	add r4, r6, #0
	add r5, sp, #0
_0206C1F6:
	ldr r0, [r5]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0xe5
	bne _0206C20E
	lsl r0, r4, #0x18
	lsr r7, r0, #0x18
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
_0206C20E:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0206C1F6
	cmp r6, #2
	bne _0206C24E
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	bne _0206C230
	mov r0, #1
	b _0206C232
_0206C230:
	mov r0, #0
_0206C232:
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	bl LCRandom
	ldr r1, _0206C270 ; =0x00007FFF
	cmp r0, r1
	blo _0206C248
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0206C248:
	add sp, #8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206C24E:
	cmp r6, #1
	bne _0206C266
	bl LCRandom
	ldr r1, _0206C270 ; =0x00007FFF
	cmp r0, r1
	blo _0206C260
	mov r7, #0
	mvn r7, r7
_0206C260:
	add sp, #8
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206C266:
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206C270: .word 0x00007FFF
	thumb_func_end sub_0206C1E4

	thumb_func_start sub_0206C274
sub_0206C274: ; 0x0206C274
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	mov r5, #0
	bl sub_0206C1E4
	add r1, r0, #0
	bpl _0206C290
	bl MTRandom
	add r1, r0, #0
	ldr r0, [sp]
	bl Sav2_DayCare_SetEggPID
	pop {r3, r4, r5, r6, r7, pc}
_0206C290:
	ldr r0, [sp]
	bl Daycare_GetBoxMonI
	add r1, r5, #0
	add r2, r1, #0
	bl GetBoxMonData
	bl GetNatureFromPersonality
	mov r7, #0x96
	add r6, r0, #0
	lsl r7, r7, #4
_0206C2A8:
	bl MTRandom
	add r4, r0, #0
	bl GetNatureFromPersonality
	cmp r6, r0
	bne _0206C2BA
	cmp r4, #0
	bne _0206C2C0
_0206C2BA:
	add r5, r5, #1
	cmp r5, r7
	ble _0206C2A8
_0206C2C0:
	ldr r0, [sp]
	add r1, r4, #0
	bl Sav2_DayCare_SetEggPID
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206C274

	thumb_func_start _IVList_Remove
_IVList_Remove: ; 0x0206C2CC
	push {r3, r4}
	sub sp, #8
	mov r2, #0xff
	strb r2, [r0, r1]
	mov r2, #0
	add r3, sp, #0
_0206C2D8:
	ldrb r1, [r0, r2]
	add r2, r2, #1
	strb r1, [r3]
	add r3, r3, #1
	cmp r2, #6
	blt _0206C2D8
	mov r2, #0
	add r4, r2, #0
	add r3, sp, #0
_0206C2EA:
	ldrb r1, [r3]
	cmp r1, #0xff
	beq _0206C2F4
	strb r1, [r0, r2]
	add r2, r2, #1
_0206C2F4:
	add r4, r4, #1
	add r3, r3, #1
	cmp r4, #6
	blt _0206C2EA
	add sp, #8
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end _IVList_Remove

	thumb_func_start InheritIVs
InheritIVs: ; 0x0206C304
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp]
	add r1, sp, #8
	add r4, r0, #0
	mov r0, #0
	add r1, #2
_0206C312:
	strb r0, [r1, r0]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #6
	blo _0206C312
	add r1, sp, #4
	ldr r0, [sp]
	add r1, #1
	add r2, sp, #4
	bl _IVList_Sample
	cmp r0, #0
	beq _0206C346
	add r0, sp, #4
	ldrb r1, [r0, #1]
	mov r6, #1
	strb r1, [r0, #0xc]
	add r0, sp, #8
	add r0, #2
	bl _IVList_Remove
	add r0, sp, #4
	ldrb r1, [r0]
	strb r1, [r0, #3]
	b _0206C348
_0206C346:
	mov r6, #0
_0206C348:
	add r5, r6, #0
	cmp r6, #3
	bhs _0206C378
	add r7, sp, #8
	add r7, #2
_0206C352:
	bl LCRandom
	mov r1, #6
	sub r1, r1, r5
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldrb r2, [r7, r1]
	add r0, sp, #0x10
	strb r2, [r0, r5]
	add r0, r7, #0
	bl _IVList_Remove
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _0206C352
_0206C378:
	add r0, sp, #4
	ldrb r5, [r0, #0xd]
	ldrb r0, [r0, #0xc]
	cmp r0, r5
	bne _0206C386
	bl GF_AssertFail
_0206C386:
	add r0, sp, #4
	ldrb r7, [r0, #0xe]
	cmp r5, r7
	bne _0206C392
	bl GF_AssertFail
_0206C392:
	add r0, sp, #4
	ldrb r0, [r0, #0xc]
	cmp r7, r0
	bne _0206C39E
	bl GF_AssertFail
_0206C39E:
	cmp r6, #3
	bhs _0206C3C2
	add r5, sp, #4
	add r5, #3
	mov r7, #0x1f
_0206C3A8:
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1f
	sub r0, r0, r1
	ror r0, r7
	add r0, r1, r0
	strb r0, [r5, r6]
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r6, #3
	blo _0206C3A8
_0206C3C2:
	add r7, sp, #4
	mov r5, #0
	add r7, #2
	add r6, sp, #4
_0206C3CA:
	add r1, sp, #4
	add r1, #3
	ldrb r1, [r1, r5]
	ldr r0, [sp]
	bl Daycare_GetBoxMonI
	add r1, sp, #0x10
	ldrb r1, [r1, r5]
	cmp r1, #5
	bhi _0206C478
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0206C3EA: ; jump table
	.short _0206C3F6 - _0206C3EA - 2 ; case 0
	.short _0206C40C - _0206C3EA - 2 ; case 1
	.short _0206C422 - _0206C3EA - 2 ; case 2
	.short _0206C438 - _0206C3EA - 2 ; case 3
	.short _0206C44E - _0206C3EA - 2 ; case 4
	.short _0206C464 - _0206C3EA - 2 ; case 5
_0206C3F6:
	mov r1, #0x46
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x46
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C40C:
	mov r1, #0x47
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x47
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C422:
	mov r1, #0x48
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x48
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C438:
	mov r1, #0x49
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x49
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C44E:
	mov r1, #0x4a
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x4a
	add r2, r7, #0
	bl SetMonData
	b _0206C478
_0206C464:
	mov r1, #0x4b
	mov r2, #0
	bl GetBoxMonData
	strb r0, [r6, #2]
	add r0, r4, #0
	mov r1, #0x4b
	add r2, r7, #0
	bl SetMonData
_0206C478:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #3
	blo _0206C3CA
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end InheritIVs

	thumb_func_start sub_0206C488
sub_0206C488: ; 0x0206C488
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	add r6, r1, #0
	mov r0, #1
	mov r1, #0
	str r0, [sp]
	mov r0, #0xe7
	add r2, r1, #0
	mov r3, #4
	bl GfGfxLoader_LoadFromNarc
	mov r4, #0
	add r5, r0, #0
	ldr r0, [sp, #4]
	mov r1, #5
	add r2, r4, #0
	add r7, r4, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r1, _0206C508 ; =0x00004E20
	add r0, r4, #0
	add r1, r2, r1
	ldr r2, _0206C50C ; =0x000007FD
_0206C4BC:
	lsl r3, r0, #1
	ldrh r3, [r5, r3]
	cmp r1, r3
	bne _0206C4CC
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	b _0206C4D6
_0206C4CC:
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r2
	blo _0206C4BC
_0206C4D6:
	lsl r0, r7, #1
	ldr r7, _0206C508 ; =0x00004E20
	mov r3, #0
	add r2, r5, r0
_0206C4DE:
	lsl r1, r3, #1
	ldrh r0, [r2, r1]
	cmp r0, r7
	bhi _0206C4F8
	strh r0, [r6, r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #0x10
	blo _0206C4DE
_0206C4F8:
	add r0, r5, #0
	bl FreeToHeap
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206C508: .word 0x00004E20
_0206C50C: .word 0x000007FD
	thumb_func_end sub_0206C488

	thumb_func_start InheritMoves
InheritMoves: ; 0x0206C510
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r7, r0, #0
	str r1, [sp]
	mov r0, #4
	mov r1, #0xb4
	str r2, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0xb4
	str r0, [sp, #0x1c]
	bl MIi_CpuClearFast
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x18]
	add r0, r7, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	add r2, r4, #0
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	add r2, #0x30
	bl Species_LoadLearnsetTable
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r6, #0
_0206C564:
	lsl r0, r6, #2
	add r5, r6, #0
	str r0, [sp, #0x20]
	add r0, r4, r0
	add r5, #0x36
	str r0, [sp, #0x10]
	ldr r0, [sp]
	add r1, r5, #0
	mov r2, #0
	bl GetBoxMonData
	ldr r1, [sp, #0x20]
	mov r2, #0
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetBoxMonData
	ldr r1, [sp, #0x10]
	str r0, [r1, #0x20]
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C564
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x94
	bl sub_0206C488
	add r5, r0, #0
	mov r6, #0
_0206C5A4:
	lsl r0, r6, #2
	ldr r1, [r4, r0]
	str r0, [sp, #0x24]
	cmp r1, #0
	beq _0206C5F4
	mov r0, #0
	cmp r5, #0
	bls _0206C5EA
_0206C5B4:
	lsl r2, r0, #1
	add r2, r4, r2
	add r2, #0x94
	ldrh r2, [r2]
	cmp r1, r2
	bne _0206C5E0
	lsl r1, r1, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl TryAppendMonMove
	ldr r1, _0206C704 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C5EA
	ldr r1, [sp, #0x24]
	add r0, r7, #0
	ldr r1, [r4, r1]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl DeleteMonFirstMoveAndAppend
	b _0206C5EA
_0206C5E0:
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r5
	blo _0206C5B4
_0206C5EA:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C5A4
_0206C5F4:
	mov r0, #0
	str r0, [sp, #8]
_0206C5F8:
	ldr r0, [sp, #8]
	lsl r6, r0, #2
	ldr r0, [r4, r6]
	cmp r0, #0
	beq _0206C650
	mov r5, #0
_0206C604:
	mov r0, #0x52
	lsl r0, r0, #2
	add r0, r5, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl TMHMGetMove
	ldr r1, [r4, r6]
	cmp r1, r0
	bne _0206C646
	lsl r2, r5, #0x18
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0xc]
	lsr r2, r2, #0x18
	bl GetTMHMCompatBySpeciesAndForme
	cmp r0, #0
	beq _0206C646
	ldr r1, [r4, r6]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl TryAppendMonMove
	ldr r1, _0206C704 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C646
	ldr r1, [r4, r6]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl DeleteMonFirstMoveAndAppend
_0206C646:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x64
	blo _0206C604
_0206C650:
	ldr r0, [sp, #8]
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	cmp r0, #4
	blo _0206C5F8
	mov r6, #0
_0206C660:
	lsl r1, r6, #2
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _0206C6A0
	mov r3, #0
_0206C66A:
	lsl r2, r3, #2
	add r2, r4, r2
	ldr r0, [r4, r1]
	ldr r2, [r2, #0x20]
	cmp r0, r2
	bne _0206C68C
	cmp r0, #0
	beq _0206C68C
	ldr r2, [sp, #0x1c]
	add r5, r2, #0
	add r5, r5, #1
	lsl r5, r5, #0x10
	lsr r5, r5, #0x10
	lsl r2, r2, #2
	str r5, [sp, #0x1c]
	add r2, r4, r2
	str r0, [r2, #0x10]
_0206C68C:
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #4
	blo _0206C66A
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C660
_0206C6A0:
	mov r6, #0
_0206C6A2:
	lsl r0, r6, #2
	add r5, r4, r0
	ldr r3, [r5, #0x10]
	cmp r3, #0
	beq _0206C6F8
	ldr r0, [sp, #0x14]
	mov r2, #0
	cmp r0, #0
	bls _0206C6EE
_0206C6B4:
	lsl r0, r2, #1
	add r0, r4, r0
	ldrh r1, [r0, #0x30]
	cmp r1, #0
	beq _0206C6E2
	ldr r0, [r5, #0x10]
	cmp r0, r1
	bne _0206C6E2
	lsl r1, r3, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl TryAppendMonMove
	ldr r1, _0206C704 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C6EE
	ldr r1, [r5, #0x10]
	add r0, r7, #0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl DeleteMonFirstMoveAndAppend
	b _0206C6EE
_0206C6E2:
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r0, [sp, #0x14]
	cmp r2, r0
	blo _0206C6B4
_0206C6EE:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #4
	blo _0206C6A2
_0206C6F8:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206C704: .word 0x0000FFFF
	thumb_func_end InheritMoves

	thumb_func_start Sav2_DayCare_ResetEggStats
Sav2_DayCare_ResetEggStats: ; 0x0206C708
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	bl Sav2_DayCare_SetEggPID
	add r0, r4, #0
	mov r1, #0
	bl Sav2_DayCare_SetEggCycleCounter
	pop {r4, pc}
	thumb_func_end Sav2_DayCare_ResetEggStats

	thumb_func_start Daycare_BreedingIncenseCheck
Daycare_BreedingIncenseCheck: ; 0x0206C71C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	add r1, sp, #0
	bl Daycare_GetBothBoxMonsPtr
	ldr r2, _0206C78C ; =_020FF4AE
	mov r3, #0
	mov r1, #6
_0206C730:
	add r0, r3, #0
	mul r0, r1
	ldrh r0, [r2, r0]
	cmp r5, r0
	bne _0206C73E
	add r6, r3, #0
	b _0206C748
_0206C73E:
	add r0, r3, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	cmp r3, #9
	blo _0206C730
_0206C748:
	cmp r3, #9
	bne _0206C752
	add sp, #8
	add r0, r5, #0
	pop {r4, r5, r6, pc}
_0206C752:
	ldr r0, [sp]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #4]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #6
	add r1, r6, #0
	mul r1, r0
	ldr r0, _0206C790 ; =_020FF4AE + 2
	ldrh r0, [r0, r1]
	cmp r4, r0
	beq _0206C784
	cmp r2, r0
	beq _0206C784
	ldr r0, _0206C794 ; =_020FF4AE + 4
	ldrh r5, [r0, r1]
_0206C784:
	add r0, r5, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0206C78C: .word _020FF4AE
_0206C790: .word _020FF4AE + 2
_0206C794: .word _020FF4AE + 4
	thumb_func_end Daycare_BreedingIncenseCheck

	thumb_func_start Daycare_LightBallCheck
Daycare_LightBallCheck: ; 0x0206C798
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r1, #0
	add r1, sp, #0
	bl Daycare_GetBothBoxMonsPtr
	ldr r0, [sp]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	add r5, r0, #0
	ldr r0, [sp, #4]
	mov r1, #6
	mov r2, #0
	bl GetBoxMonData
	cmp r5, #ITEM_LIGHT_BALL
	beq _0206C7C4
	cmp r0, #ITEM_LIGHT_BALL
	bne _0206C7DE
_0206C7C4:
	mov r1, #MOVE_VOLT_TACKLE>>2
	add r0, r4, #0
	lsl r1, r1, #2
	bl TryAppendMonMove
	ldr r1, _0206C7E4 ; =0x0000FFFF
	cmp r0, r1
	bne _0206C7DE
	mov r1, #MOVE_VOLT_TACKLE>>2
	add r0, r4, #0
	lsl r1, r1, #2
	bl DeleteMonFirstMoveAndAppend
_0206C7DE:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0206C7E4: .word 0x0000FFFF
	thumb_func_end Daycare_LightBallCheck

	thumb_func_start Daycare_GetEggSpecies
Daycare_GetEggSpecies: ; 0x0206C7E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r1, sp, #4
	str r0, [sp]
	bl Daycare_GetBothBoxMonsPtr
	mov r4, #0
	add r7, sp, #4
_0206C7FA:
	lsl r6, r4, #2
	ldr r0, [r7, r6]
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r1, r4, #1
	add r2, sp, #0xc
	strh r0, [r2, r1]
	add r0, r2, #0
	ldrh r0, [r0, r1]
	cmp r0, #0x84
	bne _0206C81E
	mov r0, #1
	eor r0, r4
	strb r0, [r5]
	strb r4, [r5, #1]
	b _0206C830
_0206C81E:
	ldr r0, [r7, r6]
	bl GetBoxMonGender
	cmp r0, #1
	bne _0206C830
	mov r0, #1
	strb r4, [r5]
	eor r0, r4
	strb r0, [r5, #1]
_0206C830:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #2
	blo _0206C7FA
	ldrb r0, [r5]
	lsl r1, r0, #1
	add r0, sp, #0xc
	ldrh r0, [r0, r1]
	bl ReadFromPersonalPmsNarc
	add r4, r0, #0
	cmp r4, #0x1d
	bne _0206C860
	ldr r0, [sp]
	bl Sav2_DayCare_GetEggPID
	mov r1, #2
	lsl r1, r1, #0xe
	tst r0, r1
	beq _0206C85E
	mov r4, #SPECIES_NIDORAN_M
	b _0206C860
_0206C85E:
	mov r4, #SPECIES_NIDORAN_F
_0206C860:
	ldr r0, _0206C8AC ; =SPECIES_ILLUMISE
	cmp r4, r0
	bne _0206C87A
	ldr r0, [sp]
	bl Sav2_DayCare_GetEggPID
	mov r1, #2
	lsl r1, r1, #0xe
	tst r0, r1
	beq _0206C878
	ldr r4, _0206C8B0 ; =SPECIES_VOLBEAT
	b _0206C87A
_0206C878:
	ldr r4, _0206C8AC ; =SPECIES_ILLUMISE
_0206C87A:
	ldr r0, _0206C8B4 ; =SPECIES_MANAPHY
	cmp r4, r0
	bne _0206C882
	sub r4, r0, #SPECIES_MANAPHY-SPECIES_PHIONE
_0206C882:
	ldrb r0, [r5, #1]
	lsl r1, r0, #1
	add r0, sp, #0xc
	ldrh r0, [r0, r1]
	cmp r0, #0x84
	bne _0206C8A6
	ldrb r0, [r5]
	lsl r1, r0, #2
	add r0, sp, #4
	ldr r0, [r0, r1]
	bl GetBoxMonGender
	cmp r0, #1
	beq _0206C8A6
	ldrb r1, [r5, #1]
	ldrb r0, [r5]
	strb r0, [r5, #1]
	strb r1, [r5]
_0206C8A6:
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206C8AC: .word SPECIES_ILLUMISE
_0206C8B0: .word SPECIES_VOLBEAT
_0206C8B4: .word SPECIES_MANAPHY
	thumb_func_end Daycare_GetEggSpecies

	thumb_func_start SetEggStats
SetEggStats: ; 0x0206C8B8
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x13
	add r4, r3, #0
	bl GetMonBaseStat
	add r1, sp, #0x10
	strb r0, [r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	mov r3, #0x20
	bl CreateMon
	mov r1, #0
	add r0, sp, #0x10
	strb r1, [r0, #2]
	mov r1, #4
	strh r1, [r0, #4]
	add r0, r5, #0
	mov r1, #0x9b
	add r2, sp, #0x14
	bl SetMonData
	add r0, r5, #0
	mov r1, #9
	add r2, sp, #0x10
	bl SetMonData
	add r2, sp, #0x10
	add r0, r5, #0
	mov r1, #0x9c
	add r2, #2
	bl SetMonData
	add r0, sp, #0x30
	ldrb r0, [r0, #8]
	cmp r0, #0
	beq _0206C922
	add r0, r5, #0
	mov r1, #0x98
	add r2, sp, #0x38
	bl SetMonData
_0206C922:
	add r2, sp, #0x10
	mov r1, #1
	add r0, sp, #0x10
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0x4c
	add r2, #1
	bl SetMonData
	ldr r0, _0206C9AC ; =SPECIES_EGG
	mov r1, #4
	bl GetSpeciesName
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x77
	add r2, r6, #0
	bl SetMonData
	add r0, r6, #0
	bl String_dtor
	ldr r0, [sp, #0x40]
	cmp r0, #4
	bne _0206C992
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #0x20
	bl PlayerProfile_GetPlayerName_NewString
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x91
	add r2, r6, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #7
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r5, #0
	mov r1, #0x9d
	add r2, sp, #0x18
	bl SetMonData
	add r0, r6, #0
	bl String_dtor
_0206C992:
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0208F260
	add sp, #0x20
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0206C9AC: .word SPECIES_EGG
	thumb_func_end SetEggStats

	thumb_func_start SetBreedEggStats
SetBreedEggStats: ; 0x0206C9B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #0x13
	add r5, r2, #0
	add r6, r3, #0
	bl GetMonBaseStat
	add r1, sp, #0x14
	strb r0, [r1]
	add r0, r5, #0
	bl Sav2_DayCare_GetEggPID
	add r4, r0, #0
	add r0, r5, #0
	bl Sav2_DayCare_MasudaCheck
	cmp r0, #0
	beq _0206CA02
	add r0, r6, #0
	add r1, r4, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	bne _0206CA02
	mov r5, #0
_0206C9E8:
	add r0, r4, #0
	bl PRandom
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #0
	bne _0206CA02
	add r5, r5, #1
	cmp r5, #4
	blt _0206C9E8
_0206CA02:
	mov r2, #1
	str r2, [sp]
	str r4, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	mov r3, #0x20
	bl CreateMon
	add r2, sp, #0x14
	mov r1, #0
	add r0, sp, #0x14
	strb r1, [r0, #1]
	mov r1, #4
	strh r1, [r0, #2]
	add r0, r7, #0
	mov r1, #0x9b
	add r2, #2
	bl SetMonData
	add r0, r7, #0
	mov r1, #9
	add r2, sp, #0x14
	bl SetMonData
	add r2, sp, #0x14
	add r0, r7, #0
	mov r1, #0x9c
	add r2, #1
	bl SetMonData
	add r0, r7, #0
	mov r1, #0x70
	add r2, sp, #0x30
	bl SetMonData
	ldr r0, _0206CA6C ; =SPECIES_EGG
	mov r1, #4
	bl GetSpeciesName
	add r4, r0, #0
	add r0, r7, #0
	mov r1, #0x77
	add r2, r4, #0
	bl SetMonData
	add r0, r4, #0
	bl String_dtor
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206CA6C: .word SPECIES_EGG
	thumb_func_end SetBreedEggStats

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
	bl sub_0208F260
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
