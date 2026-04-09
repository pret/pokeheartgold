	.include "asm/macros.inc"
	.include "unk_02031904.inc"
	.include "global.inc"

	.text

	.extern PokeathlonSave_sizeof
	.extern PokeathlonSave_Init
	.extern PokeathlonSave_Get
	.extern PokeathlonSave_dummy1
	.extern PokeathlonSave_GetUnkDC
	.extern PokeathlonSave_GetUnk2CC
	.extern PokeathlonSave_GetUnk484
	.extern PokeathlonSave_GetUnkAEC
	.extern PokeathlonSave_GetUnkB00
	.extern PokeathlonSave_dummy2
	.extern PokeathlonSave_GetUnkDC_AtIndex
	.extern PokeathlonSave_GetAgainUnk2CC
	.extern PokeathlonSave_GetAgainUnk484
	.extern PokeathlonSave_GetAgainUnkB00
	.extern PokeathlonSave_SetUnkDC_AtIndex
	.extern PokeathlonSave_AddAthletePoints
	.extern PokeathlonSave_SubAthletePoints
	.extern PokeathlonSave_GetAthletePoints
	.extern PokeathlonSave_GetUnkB78_AtIndex
	.extern PokeathlonSave_SetUnkB78_AtIndex

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
