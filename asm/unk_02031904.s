	.include "asm/macros.inc"
	.include "unk_02031904.inc"
	.include "global.inc"

	.text

	thumb_func_start Save_Pokeathlon_sizeof
Save_Pokeathlon_sizeof: ; 0x02031904
	mov r0, #0x2e
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end Save_Pokeathlon_sizeof

	thumb_func_start Save_Pokeathlon_Init
Save_Pokeathlon_Init: ; 0x0203190C
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0x2e
	mov r1, #0
	lsl r2, r2, #6
	str r0, [sp]
	bl MI_CpuFill8
	mov r0, #0
	mov r7, #0xb3
	ldr r1, _02031960 ; =0x0000FFFF
	ldr r6, _02031964 ; =0x00000484
	mov ip, r0
	lsl r7, r7, #2
_02031926:
	mov r0, ip
	mov r2, #0x2c
	mul r2, r0
	ldr r0, [sp]
	mov r3, #0
	add r4, r0, r2
	mov r0, ip
	mov r2, #0xa4
	mul r2, r0
	ldr r0, [sp]
	add r5, r0, r2
_0203193C:
	lsl r2, r3, #3
	add r0, r4, r2
	strh r1, [r0, r7]
	add r0, r5, r2
	strh r1, [r0, r6]
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #5
	blo _0203193C
	mov r0, ip
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov ip, r0
	cmp r0, #0xa
	blo _02031926
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02031960: .word 0x0000FFFF
_02031964: .word 0x00000484
	thumb_func_end Save_Pokeathlon_Init

	thumb_func_start Save_Pokeathlon_Get
Save_Pokeathlon_Get: ; 0x02031968
	ldr r3, _02031970 ; =SaveArray_Get
	mov r1, #0x25
	bx r3
	nop
_02031970: .word SaveArray_Get
	thumb_func_end Save_Pokeathlon_Get

	thumb_func_start sub_02031974
sub_02031974: ; 0x02031974
	bx lr
	.balign 4, 0
	thumb_func_end sub_02031974

	thumb_func_start sub_02031978
sub_02031978: ; 0x02031978
	add r0, #0xdc
	bx lr
	thumb_func_end sub_02031978

	thumb_func_start sub_0203197C
sub_0203197C: ; 0x0203197C
	mov r1, #0xb3
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0203197C

	thumb_func_start sub_02031984
sub_02031984: ; 0x02031984
	ldr r1, _0203198C ; =0x00000484
	add r0, r0, r1
	bx lr
	nop
_0203198C: .word 0x00000484
	thumb_func_end sub_02031984

	thumb_func_start sub_02031990
sub_02031990: ; 0x02031990
	ldr r1, _02031998 ; =0x00000AEC
	add r0, r0, r1
	bx lr
	nop
_02031998: .word 0x00000AEC
	thumb_func_end sub_02031990

	thumb_func_start sub_0203199C
sub_0203199C: ; 0x0203199C
	mov r1, #0xb
	lsl r1, r1, #8
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0203199C

	thumb_func_start sub_020319A4
sub_020319A4: ; 0x020319A4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020319A4

	thumb_func_start sub_020319A8
sub_020319A8: ; 0x020319A8
	push {r3, lr}
	cmp r1, #0
	blt _020319B2
	cmp r1, #4
	ble _020319BA
_020319B2:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_020319BA:
	sub r2, r2, #1
	bpl _020319C6
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_020319C6:
	add r0, r0, r2
	add r0, #0xdc
	ldrb r0, [r0]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	add r1, r2, #0
	tst r1, r0
	bne _020319DA
	mov r0, #0
_020319DA:
	pop {r3, pc}
	thumb_func_end sub_020319A8

	thumb_func_start sub_020319DC
sub_020319DC: ; 0x020319DC
	mov r1, #0xb3
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end sub_020319DC

	thumb_func_start sub_020319E4
sub_020319E4: ; 0x020319E4
	ldr r1, _020319EC ; =0x00000484
	add r0, r0, r1
	bx lr
	nop
_020319EC: .word 0x00000484
	thumb_func_end sub_020319E4

	thumb_func_start sub_020319F0
sub_020319F0: ; 0x020319F0
	mov r1, #0xb
	lsl r1, r1, #8
	add r0, r0, r1
	bx lr
	thumb_func_end sub_020319F0

	thumb_func_start sub_020319F8
sub_020319F8: ; 0x020319F8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	sub r1, r2, #1
	bpl _02031A06
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_02031A06:
	add r2, r0, r1
	mov r0, #1
	mov r3, #0
	add r2, #0xdc
	add r6, r0, #0
_02031A10:
	add r1, r4, #0
	asr r1, r3
	and r1, r6
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	beq _02031A2A
	add r5, r0, #0
	lsl r5, r3
	lsl r5, r5, #0x18
	ldrb r1, [r2]
	lsr r5, r5, #0x18
	orr r1, r5
	strb r1, [r2]
_02031A2A:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #5
	blo _02031A10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020319F8

	thumb_func_start SavePokeathlon_AddAthletePoints
SavePokeathlon_AddAthletePoints: ; 0x02031A38
	ldr r2, _02031A4C ; =0x00000B74
	ldr r3, [r0, r2]
	add r1, r3, r1
	str r1, [r0, r2]
	ldr r3, [r0, r2]
	ldr r1, _02031A50 ; =99999
	cmp r3, r1
	ble _02031A4A
	str r1, [r0, r2]
_02031A4A:
	bx lr
	.balign 4, 0
_02031A4C: .word 0x00000B74
_02031A50: .word 99999
	thumb_func_end SavePokeathlon_AddAthletePoints

	thumb_func_start SavePokeathlon_SubAthletePoints
SavePokeathlon_SubAthletePoints: ; 0x02031A54
	ldr r2, _02031A68 ; =0x00000B74
	ldr r3, [r0, r2]
	sub r1, r3, r1
	str r1, [r0, r2]
	ldr r1, [r0, r2]
	cmp r1, #0
	bge _02031A66
	mov r1, #0
	str r1, [r0, r2]
_02031A66:
	bx lr
	.balign 4, 0
_02031A68: .word 0x00000B74
	thumb_func_end SavePokeathlon_SubAthletePoints

	thumb_func_start SavePokeathlon_GetAthletePoints
SavePokeathlon_GetAthletePoints: ; 0x02031A6C
	ldr r1, _02031A74 ; =0x00000B74
	ldr r0, [r0, r1]
	bx lr
	nop
_02031A74: .word 0x00000B74
	thumb_func_end SavePokeathlon_GetAthletePoints

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
