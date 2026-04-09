	.include "asm/macros.inc"
	.include "unk_02031904.inc"
	.include "global.inc"

	.text

	.extern Save_Pokeathlon_sizeof
	.extern Save_Pokeathlon_Init
	.extern Save_Pokeathlon_Get
	.extern Save_Pokeathlon_dummy1
	.extern Save_Pokeathlon_GetUnkDC
	.extern Save_Pokeathlon_GetUnk2CC
	.extern Save_Pokeathlon_GetUnk484
	.extern Save_Pokeathlon_GetUnkAEC
	.extern Save_Pokeathlon_GetUnkB00
	.extern Save_Pokeathlon_dummy2
	.extern SavePokeathlon_GetUnkDC_AtIndex
	.extern Save_Pokeathlon_GetAgainUnk2CC
	.extern Save_Pokeathlon_GetAgainUnk484
	.extern Save_Pokeathlon_GetAgainUnkB00
	.extern SavePokeathlon_SetUnkDC_AtIndex
	.extern SavePokeathlon_AddAthletePoints
	.extern SavePokeathlon_SubAthletePoints
	.extern SavePokeathlon_GetAthletePoints
	.extern SavePokeathlon_GetUnkB78_AtIndex
	.extern SavePokeathlon_SetUnkB78_AtIndex

	thumb_func_start sub_02031AB8
sub_02031AB8: ; 0x02031AB8
	ldr r2, _02031AC8 ; =0x00000B7C
	ldrh r0, [r0, r2]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	nop
_02031AC8: .word 0x00000B7C
	thumb_func_end sub_02031AB8

	thumb_func_start sub_02031ACC
sub_02031ACC: ; 0x02031ACC
	push {r3, r4}
	ldr r2, _02031AE0 ; =0x00000B7C
	mov r3, #1
	ldrh r4, [r0, r2]
	lsl r3, r1
	add r1, r4, #0
	orr r1, r3
	strh r1, [r0, r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02031AE0: .word 0x00000B7C
	thumb_func_end sub_02031ACC

	thumb_func_start sub_02031AE4
sub_02031AE4: ; 0x02031AE4
	ldr r1, _02031AEC ; =0x00000B7C
	mov r2, #0
	strh r2, [r0, r1]
	bx lr
	.balign 4, 0
_02031AEC: .word 0x00000B7C
	thumb_func_end sub_02031AE4
