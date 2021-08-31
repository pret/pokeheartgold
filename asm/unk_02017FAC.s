	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02017FAC
sub_02017FAC: ; 0x02017FAC
	ldr r3, _02017FC8 ; =0x020F6280
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
_02017FC8: .word 0x020F6280
	thumb_func_end sub_02017FAC

	thumb_func_start sub_02017FCC
sub_02017FCC: ; 0x02017FCC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02017FAC
	lsl r1, r0, #1
	ldr r0, _02017FE0 ; =0x020F6280
	ldrh r0, [r0, r1]
	sub r0, r4, r0
	pop {r4, pc}
	nop
_02017FE0: .word 0x020F6280
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
	ldr r0, _02017FFC ; =0x020F6280
	lsl r1, r5, #1
	ldrh r0, [r0, r1]
	add r0, r4, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02017FFC: .word 0x020F6280
	thumb_func_end sub_02017FE4
