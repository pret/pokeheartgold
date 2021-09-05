	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202AE8C
sub_0202AE8C: ; 0x0202AE8C
	ldr r3, _0202AE94 ; =MIi_CpuFill8
	mov r1, #0
	mov r2, #0x24
	bx r3
	.balign 4, 0
_0202AE94: .word MIi_CpuFill8
	thumb_func_end sub_0202AE8C

	thumb_func_start sub_0202AE98
sub_0202AE98: ; 0x0202AE98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202AE8C
	str r4, [r5]
	add r0, r5, #4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202AE98

	thumb_func_start sub_0202AEA8
sub_0202AEA8: ; 0x0202AEA8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, r1
	beq _0202AEB6
	bl GF_AssertFail
_0202AEB6:
	add r0, r4, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202AEA8

	thumb_func_start sub_0202AEBC
sub_0202AEBC: ; 0x0202AEBC
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0202AEBC
