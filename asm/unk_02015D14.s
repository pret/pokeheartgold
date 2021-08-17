	.include "asm/macros.inc"
	.include "global.inc"

	.text

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
	ldr r0, _02015DD8 ; =0x020F612C
	ldrh r0, [r0, r1]
	bx lr
	nop
_02015DD8: .word 0x020F612C
	thumb_func_end sub_02015DC8
