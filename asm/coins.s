	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202C948
sub_0202C948: ; 0x0202C948
	mov r1, #0
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C948

	thumb_func_start sub_0202C950
sub_0202C950: ; 0x0202C950
	ldrh r0, [r0]
	bx lr
	thumb_func_end sub_0202C950

	thumb_func_start sub_0202C954
sub_0202C954: ; 0x0202C954
	ldrh r3, [r0]
	ldr r2, _0202C970 ; =0x0000C350
	cmp r3, r2
	blo _0202C960
	mov r0, #0
	bx lr
_0202C960:
	add r1, r3, r1
	strh r1, [r0]
	ldrh r1, [r0]
	cmp r1, r2
	bls _0202C96C
	strh r2, [r0]
_0202C96C:
	mov r0, #1
	bx lr
	.balign 4, 0
_0202C970: .word 0x0000C350
	thumb_func_end sub_0202C954

	thumb_func_start sub_0202C974
sub_0202C974: ; 0x0202C974
	ldrh r0, [r0]
	add r1, r1, r0
	ldr r0, _0202C988 ; =0x0000C350
	cmp r1, r0
	bhi _0202C982
	mov r0, #1
	bx lr
_0202C982:
	mov r0, #0
	bx lr
	nop
_0202C988: .word 0x0000C350
	thumb_func_end sub_0202C974

	thumb_func_start sub_0202C98C
sub_0202C98C: ; 0x0202C98C
	ldrh r2, [r0]
	cmp r2, r1
	bhs _0202C996
	mov r0, #0
	bx lr
_0202C996:
	sub r1, r2, r1
	strh r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202C98C
