#include "constants/easy_chat.h"
#include "constants/items.h"
#include "constants/maps.h"
#include "constants/moves.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start LaunchStarterChoiceScene
LaunchStarterChoiceScene: ; 0x0209600C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	ldr r0, [r4, #0x10]
	ldr r1, _02096028 ; =CreateStarter
	bl TaskManager_Call
	pop {r4, pc}
	.balign 4, 0
_02096028: .word CreateStarter
	thumb_func_end LaunchStarterChoiceScene

	thumb_func_start CreateStarter
CreateStarter: ; 0x0209602C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r0, #0
	bl TaskManager_GetSys
	str r0, [sp, #0x1c]
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r7, r0, #0
	ldr r0, [r7]
	cmp r0, #5
	bhi _02096084
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02096052: ; jump table
	.short _0209605E - _02096052 - 2 ; case 0
	.short _0209607C - _02096052 - 2 ; case 1
	.short _0209612C - _02096052 - 2 ; case 2
	.short _0209613C - _02096052 - 2 ; case 3
	.short _0209618E - _02096052 - 2 ; case 4
	.short _020961B4 - _02096052 - 2 ; case 5
_0209605E:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r7]
	b _020961CE
_0209607C:
	bl IsPaletteFadeActive
	cmp r0, #0
	bne _02096086
_02096084:
	b _020961CE
_02096086:
	ldr r3, _020961D4 ; =_02108514
	add r2, sp, #0x28
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	mov r1, #0xb3
	str r0, [sp, #0x14]
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeapAtEnd
	str r0, [r7, #4]
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	ldr r1, [r7, #4]
	mov r5, #0
	str r0, [r1, #4]
	str r5, [sp, #0x18]
	add r6, sp, #0x28
_020960C0:
	ldr r0, [sp, #0x1c]
	ldr r4, [r7, #4]
	ldr r0, [r0, #0xc]
	add r4, #8
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #0x20]
	add r0, r4, r5
	bl ZeroMonData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [r6]
	add r0, r4, r5
	mov r2, #5
	mov r3, #0x20
	bl CreateMon
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x14]
	add r0, r4, r5
	mov r2, #4
	bl sub_020720FC
	mov r0, #0
	str r0, [sp, #0x24]
	add r0, r4, r5
	mov r1, #6
	add r2, sp, #0x24
	bl SetMonData
	ldr r0, [sp, #0x18]
	add r5, #0xec
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _020960C0
	ldr r0, [sp, #0x1c]
	ldr r1, [r7, #4]
	bl FieldSys_LaunchChooseStarterApplication
	bl sub_0203E30C
	mov r0, #2
	str r0, [r7]
	b _020961CE
_0209612C:
	ldr r0, [sp, #0x1c]
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _020961CE
	mov r0, #3
	str r0, [r7]
	b _020961CE
_0209613C:
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	add r6, r0, #0
	ldr r0, [sp, #0x1c]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	ldr r1, [r7, #4]
	str r0, [sp, #0x10]
	ldr r2, [r1]
	add r4, r1, #0
	mov r1, #0xec
	add r5, r2, #0
	add r4, #8
	mul r5, r1
	add r1, r4, r5
	bl AddMonToParty
	cmp r0, #0
	beq _02096172
	ldr r0, [sp, #0x1c]
	add r1, r4, r5
	ldr r0, [r0, #0xc]
	bl UpdatePokedexWithReceivedSpecies
_02096172:
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	add r0, r6, #0
	bl Pokedex_SetMonCaughtFlag
	mov r0, #4
	str r0, [r7]
	ldr r0, [sp, #0x1c]
	bl sub_020505C0
	b _020961CE
_0209618E:
	ldr r0, [sp, #0x1c]
	bl sub_020505C8
	cmp r0, #0
	beq _020961CE
	mov r0, #6
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	mov r0, #5
	str r0, [r7]
	b _020961CE
_020961B4:
	bl IsPaletteFadeActive
	cmp r0, #0
	beq _020961CE
	ldr r0, [r7, #4]
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020961CE:
	mov r0, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020961D4: .word _02108514
	thumb_func_end CreateStarter

	.rodata

	; File boundary
	.balign 4, 0
_02108514:
	.word SPECIES_CHIKORITA
	.word SPECIES_CYNDAQUIL
	.word SPECIES_TOTODILE
