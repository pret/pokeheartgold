#include "constants/pokemon.h"
#include "constants/pokewalker_courses.h"
#include "constants/species.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202ECC0
sub_0202ECC0: ; 0x0202ECC0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #MON_DATA_IS_EGG
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0202ED12
	add r0, r6, #0
	mov r1, #MON_DATA_SPECIES
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	bl Sav2_Pokedex_get
	add r7, r0, #0
	add r0, r5, #0
	bl Sav2_GameStats_get
	add r1, r7, #0
	add r2, r4, #0
	bl GameStats_IncSpeciesCaught
	add r0, r7, #0
	add r1, r6, #0
	bl Pokedex_SetMonCaughtFlag
	ldr r0, _0202ED14 ; =SPECIES_JIRACHI
	cmp r4, r0
	bne _0202ED12
	add r0, r5, #0
	bl Sav2_Pokewalker_get
	mov r1, #WALKER_COURSE_NIGHT_SKY_S_EDGE
	bl Pokewalker_UnlockCourse
_0202ED12:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202ED14: .word SPECIES_JIRACHI
	thumb_func_end sub_0202ECC0
