	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F60EC:
	.short 0x04C0, 0x04F0
_020F60F0:
	.short 0x024E, 0x03D2
_020F60F4:
	.short 0x04BB, 0x0500
_020F60F8:
	.short 0x0441, 0x0599
_020F60FC:
	.short 0x042C, 0x059D
_020F6100:
	.short 0x047A, 0x048D
_020F6104:
	.short 0x04B6, 0x0505
_020F6108:
	.short 0x04FC, 0x0596
_020F610C:
	.short 0x048F, 0x0497
_020F6110:
	.short 0x04B0, 0x04FF
_020F6114:
	.short 0x04A7, 0x04E1
_020F6118:
	.short 0x0479, 0x0498, 0x049B, 0x049C
_020F6120:
	.byte 0x01, 0x00
	.byte 0x02, 0x01
	.byte 0x03, 0x02
	.byte 0x04, 0x03
	.byte 0x05, 0x04
	.byte 0x07, 0x05
	.public _020F612C
_020F612C:
	.short 0x00ED
	.short 0x02EF
	.short 0x02DF
	.short 0x02D1
	.short 0x011D
	.short 0x011E
	.short 0x011F
	.short 0x0120
	.short 0x0121
	.short 0x0122
	.short 0x0123
	.public _020F6142
_020F6142:
	.short 0x01F0
	.short 0x01D4
	.short 0x0012
	.short 0x007C
	.short 0x0026
	.short 0x0026
	.short 0x006B
	.short 0x0068
	.short 0x002F
	.short 0x0020
	.short 0x0017
_020F6158:
	.word _020F60F8, 0x00000002
	.word _020F60EC, 0x00000002
	.word _020F6114, 0x00000002
	.word _020F6118, 0x00000004
	.word _020F610C, 0x00000002
	.word _020F6108, 0x00000002
	.word _020F60F4, 0x00000002
	.word _020F60F0, 0x00000002
	.word _020F60FC, 0x00000002
	.word _020F6110, 0x00000002
	.word _020F6104, 0x00000002
	.word _020F6100, 0x00000002

	.text

	thumb_func_start sub_02015BF0
sub_02015BF0: ; 0x02015BF0
	mov r0, #8
	bx lr
	thumb_func_end sub_02015BF0

	thumb_func_start sub_02015BF4
sub_02015BF4: ; 0x02015BF4
	push {r3, lr}
	mov r2, #0
	str r2, [r0]
	ldr r3, _02015C20 ; =_020F6120
	str r2, [r0, #4]
_02015BFE:
	ldrb r1, [r3]
	cmp r1, #2
	bne _02015C10
	ldr r1, _02015C24 ; =_020F6120 + 1
	lsl r2, r2, #1
	ldrb r1, [r1, r2]
	bl sub_02015CFC
	b _02015C18
_02015C10:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #6
	blo _02015BFE
_02015C18:
	mov r0, #0x1e
	bl sub_0202893C
	pop {r3, pc}
	.balign 4, 0
_02015C20: .word _020F6120
_02015C24: .word _020F6120 + 1
	thumb_func_end sub_02015BF4

	thumb_func_start sub_02015C28
sub_02015C28: ; 0x02015C28
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1e
	bl sub_02028900
	add r0, r4, #0
	mov r1, #0x1e
	bl SavArray_get
	pop {r4, pc}
	thumb_func_end sub_02015C28

	thumb_func_start sub_02015C3C
sub_02015C3C: ; 0x02015C3C
	ldr r0, [r0, #4]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_02015C3C

	thumb_func_start sub_02015C48
sub_02015C48: ; 0x02015C48
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r2, #0
	ldr r3, [r4, #4]
	add r5, r2, #0
	mov r0, #1
_02015C54:
	add r1, r3, #0
	lsr r1, r2
	tst r1, r0
	bne _02015C5E
	add r5, r5, #1
_02015C5E:
	add r2, r2, #1
	cmp r2, #0x20
	blo _02015C54
	cmp r5, #0
	beq _02015CA0
	bl LCRandom
	add r1, r5, #0
	bl _u32_div_f
	ldr r3, [r4, #4]
	mov r5, #0
	mov r0, #1
_02015C78:
	add r2, r3, #0
	lsr r2, r5
	tst r2, r0
	bne _02015C9A
	cmp r1, #0
	bne _02015C98
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r5
	orr r0, r1
	str r0, [r4, #4]
	mov r0, #0x1e
	bl sub_0202893C
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_02015C98:
	sub r1, r1, #1
_02015C9A:
	add r5, r5, #1
	cmp r5, #0x20
	blo _02015C78
_02015CA0:
	mov r0, #0x1e
	bl sub_0202893C
	mov r0, #0x20
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02015C48

	thumb_func_start sub_02015CAC
sub_02015CAC: ; 0x02015CAC
	ldr r3, [r0, #4]
	mov r2, #0
	mov r0, #1
_02015CB2:
	add r1, r3, #0
	lsr r1, r2
	tst r1, r0
	bne _02015CBE
	mov r0, #0
	bx lr
_02015CBE:
	add r2, r2, #1
	cmp r2, #0x20
	blo _02015CB2
	mov r0, #1
	bx lr
	thumb_func_end sub_02015CAC

	thumb_func_start sub_02015CC8
sub_02015CC8: ; 0x02015CC8
	push {r3, r4}
	mov r3, #0
	ldr r4, _02015CEC ; =_020F6142
	add r2, r3, #0
_02015CD0:
	ldrh r1, [r4]
	add r2, r2, #1
	add r4, r4, #2
	add r1, r3, r1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r2, #9
	blt _02015CD0
	add r0, r3, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	nop
_02015CEC: .word _020F6142
	thumb_func_end sub_02015CC8

	thumb_func_start sub_02015CF0
sub_02015CF0: ; 0x02015CF0
	ldr r0, [r0]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_02015CF0

	thumb_func_start sub_02015CFC
sub_02015CFC: ; 0x02015CFC
	mov r2, #1
	ldr r3, [r0]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	str r1, [r0]
	ldr r3, _02015D10 ; =sub_0202893C
	mov r0, #0x1e
	bx r3
	nop
_02015D10: .word sub_0202893C
	thumb_func_end sub_02015CFC

	thumb_func_start sub_02015D14
sub_02015D14: ; 0x02015D14
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #8
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	str r1, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	mov r0, #0xd6
	add r2, r1, #0
	add r3, r5, #0
	bl GfGfxLoader_LoadFromNarc_GetSizeOut
	str r0, [r4, #4]
	ldr r0, [sp, #8]
	lsr r0, r0, #2
	str r0, [r4]
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02015D14

	thumb_func_start sub_02015D54
sub_02015D54: ; 0x02015D54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02015D54

	thumb_func_start sub_02015D68
sub_02015D68: ; 0x02015D68
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_02015D68

	thumb_func_start sub_02015D6C
sub_02015D6C: ; 0x02015D6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02015D7A
	bl GF_AssertFail
_02015D7A:
	ldr r0, [r5]
	cmp r0, r4
	bhi _02015D84
	ldr r0, _02015D90 ; =0x0000FFFF
	pop {r3, r4, r5, pc}
_02015D84:
	ldr r1, [r5, #4]
	lsl r0, r4, #2
	ldr r0, [r1, r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02015D90: .word 0x0000FFFF
	thumb_func_end sub_02015D6C

	thumb_func_start sub_02015D94
sub_02015D94: ; 0x02015D94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02015DA2
	bl GF_AssertFail
_02015DA2:
	ldr r3, [r5]
	mov r1, #0
	cmp r3, #0
	bls _02015DC0
	ldr r2, [r5, #4]
_02015DAC:
	ldr r0, [r2]
	cmp r4, r0
	bne _02015DB8
	lsl r0, r1, #0x10
	asr r0, r0, #0x10
	pop {r3, r4, r5, pc}
_02015DB8:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, r3
	blo _02015DAC
_02015DC0:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02015D94

	thumb_func_start sub_02015DC8
sub_02015DC8: ; 0x02015DC8
	cmp r0, #0xb
	blt _02015DCE
	mov r0, #0
_02015DCE:
	lsl r1, r0, #1
	ldr r0, _02015DD8 ; =_020F612C
	ldrh r0, [r0, r1]
	bx lr
	nop
_02015DD8: .word _020F612C
	thumb_func_end sub_02015DC8
