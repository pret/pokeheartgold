	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start GF_AssertFail
GF_AssertFail: ; 0x0202551C
	push {r3, lr}
	bl sub_02037D78
	cmp r0, #0
	beq _02025532
	bl sub_020D3A9C
	cmp r0, #0x12
	beq _02025532
	bl sub_02096338
_02025532:
	pop {r3, pc}
	thumb_func_end GF_AssertFail
