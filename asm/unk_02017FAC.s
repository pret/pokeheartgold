#include "constants/map_sections.h"
	.include "asm/macros.inc"
	.include "unk_02017FAC.inc"
	.include "global.inc"

	.rodata

_020F6280:
	.short MAPSEC_MYSTERY_ZONE
	.short METLOC_DAY_CARE_COUPLE
	.short METLOC_LOVELY_PLACE

	.text

	thumb_func_start sub_02017FAC
sub_02017FAC: ; 0x02017FAC
	ldr r3, _02017FC8 ; =_020F6280
	mov r2, #0
_02017FB0:
	ldrh r1, [r3, #2]
	cmp r0, r1
	bhs _02017FBA
	add r0, r2, #0
	bx lr
_02017FBA:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #2
	blt _02017FB0
	add r0, r2, #0
	bx lr
	nop
_02017FC8: .word _020F6280
	thumb_func_end sub_02017FAC

	thumb_func_start sub_02017FCC
sub_02017FCC: ; 0x02017FCC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02017FAC
	lsl r1, r0, #1
	ldr r0, _02017FE0 ; =_020F6280
	ldrh r0, [r0, r1]
	sub r0, r4, r0
	pop {r4, pc}
	nop
_02017FE0: .word _020F6280
	thumb_func_end sub_02017FCC

	thumb_func_start sub_02017FE4
sub_02017FE4: ; 0x02017FE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #3
	blt _02017FF2
	bl GF_AssertFail
_02017FF2:
	ldr r0, _02017FFC ; =_020F6280
	lsl r1, r5, #1
	ldrh r0, [r0, r1]
	add r0, r4, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02017FFC: .word _020F6280
	thumb_func_end sub_02017FE4

	thumb_func_start LocationIsDiamondPearlCompatible
LocationIsDiamondPearlCompatible: ; 0x02018000
	cmp r0, #MAPSEC_TWINLEAF_TOWN
	blo _02018008
	cmp r0, #MAPSEC_BATTLE_PARK
	bls _02018022
_02018008:
	mov r1, #METLOC_DAY_CARE_COUPLE>>4
	lsl r1, r1, #4
	cmp r0, r1
	blo _02018016
	add r1, #METLOC_RILEY-METLOC_DAY_CARE_COUPLE
	cmp r0, r1
	bls _02018022
_02018016:
	ldr r1, _0201802C ; =METLOC_LOVELY_PLACE
	cmp r0, r1
	blo _02018026
	add r1, #METLOC_CONCERT_EVENT-METLOC_LOVELY_PLACE
	cmp r0, r1
	bhi _02018026
_02018022:
	mov r0, #1
	bx lr
_02018026:
	mov r0, #0
	bx lr
	nop
_0201802C: .word METLOC_LOVELY_PLACE
	thumb_func_end LocationIsDiamondPearlCompatible
