#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start SavArray_IsNatDexEnabled
SavArray_IsNatDexEnabled: ; 0x02074910
	push {r3, lr}
	bl Sav2_Pokedex_get
	bl Pokedex_IsNatDexEnabled
	pop {r3, pc}
	thumb_func_end SavArray_IsNatDexEnabled

	thumb_func_start Pokedex_IsNatDexEnabled
Pokedex_IsNatDexEnabled: ; 0x0207491C
	push {r3, lr}
	bl Pokedex_GetNatDexFlag
	cmp r0, #1
	bne _0207492A
	mov r0, #1
	pop {r3, pc}
_0207492A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Pokedex_IsNatDexEnabled

	thumb_func_start sub_02074930
sub_02074930: ; 0x02074930
	push {r3, lr}
	cmp r0, #0
	bne _02074940
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl SpeciesToJohtoDexNo
	add r1, r0, #0
_02074940:
	add r0, r1, #0
	pop {r3, pc}
	thumb_func_end sub_02074930
