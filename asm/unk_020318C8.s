	.include "asm/macros.inc"
	.include "unk_020318C8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020318C8
sub_020318C8: ; 0x020318C8
	mov r0, #8
	bx lr
	thumb_func_end sub_020318C8

	thumb_func_start sub_020318CC
sub_020318CC: ; 0x020318CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_020318C8
	add r2, r0, #0
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClear32
	mov r0, #0
	mvn r0, r0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020318CC

	thumb_func_start sub_020318E8
sub_020318E8: ; 0x020318E8
	ldr r3, _020318F0 ; =SaveArray_Get
	mov r1, #0x20
	bx r3
	nop
_020318F0: .word SaveArray_Get
	thumb_func_end sub_020318E8

	thumb_func_start sub_020318F4
sub_020318F4: ; 0x020318F4
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_020318F4

	thumb_func_start sub_020318F8
sub_020318F8: ; 0x020318F8
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_020318F8

	thumb_func_start sub_020318FC
sub_020318FC: ; 0x020318FC
	str r1, [r0]
	bx lr
	thumb_func_end sub_020318FC

	thumb_func_start sub_02031900
sub_02031900: ; 0x02031900
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_02031900
