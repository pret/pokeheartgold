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
	.extern sub_020319A8
	.extern Save_Pokeathlon_GetAgainUnk2CC
	.extern Save_Pokeathlon_GetAgainUnk484
	.extern Save_Pokeathlon_GetAgainUnkB00
	.extern sub_020319F8
	.extern SavePokeathlon_AddAthletePoints
	.extern SavePokeathlon_SubAthletePoints
	.extern SavePokeathlon_GetAthletePoints

	thumb_func_start sub_02031A78
sub_02031A78: ; 0x02031A78
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blt _02031A86
	bl GF_AssertFail
_02031A86:
	ldr r0, _02031A94 ; =0x00000B78
	ldr r0, [r5, r0]
	add r1, r0, #0
	lsr r1, r4
	mov r0, #1
	and r0, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031A94: .word 0x00000B78
	thumb_func_end sub_02031A78

	thumb_func_start sub_02031A98
sub_02031A98: ; 0x02031A98
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x1b
	blt _02031AA6
	bl GF_AssertFail
_02031AA6:
	ldr r0, _02031AB4 ; =0x00000B78
	mov r1, #1
	ldr r2, [r5, r0]
	lsl r1, r4
	orr r1, r2
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031AB4: .word 0x00000B78
	thumb_func_end sub_02031A98

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
