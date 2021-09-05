	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202ADEC
sub_0202ADEC: ; 0x0202ADEC
	push {r4, lr}
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #8
	add r4, r0, #0
	bl MIi_CpuFill8
	mov r1, #0
	add r0, r1, #0
_0202ADFE:
	add r1, r1, #1
	strb r0, [r4]
	add r4, r4, #4
	cmp r1, #0x80
	blt _0202ADFE
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202ADEC

	thumb_func_start sub_0202AE0C
sub_0202AE0C: ; 0x0202AE0C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #1
	b _0202AE24
_0202AE16:
	add r0, r5, #0
	bl sub_0202AE30
	strb r6, [r5]
	strb r6, [r5, #1]
	add r5, r5, #4
	add r4, r4, #1
_0202AE24:
	cmp r4, #0x80
	blt _0202AE16
	cmp r4, #0x1f
	blt _0202AE16
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202AE0C

	thumb_func_start sub_0202AE30
sub_0202AE30: ; 0x0202AE30
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	bx lr
	thumb_func_end sub_0202AE30

	thumb_func_start sub_0202AE38
sub_0202AE38: ; 0x0202AE38
	lsl r1, r1, #2
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202AE38

	thumb_func_start sub_0202AE40
sub_0202AE40: ; 0x0202AE40
	ldr r0, _0202AE48 ; =0x020F6784
	ldrb r0, [r0, r1]
	bx lr
	nop
_0202AE48: .word 0x020F6784
	thumb_func_end sub_0202AE40

	thumb_func_start sub_0202AE4C
sub_0202AE4C: ; 0x0202AE4C
	push {r3, lr}
	ldr r0, _0202AE64 ; =0x020F6784
	ldrb r0, [r0, r1]
	cmp r0, #0
	bgt _0202AE5E
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0202AE5E:
	sub r0, r0, #1
	pop {r3, pc}
	nop
_0202AE64: .word 0x020F6784
	thumb_func_end sub_0202AE4C

	thumb_func_start sub_0202AE68
sub_0202AE68: ; 0x0202AE68
	ldr r3, _0202AE70 ; =sub_0202AE30
	lsl r1, r1, #2
	add r0, r0, r1
	bx r3
	.balign 4, 0
_0202AE70: .word sub_0202AE30
	thumb_func_end sub_0202AE68

	thumb_func_start sub_0202AE74
sub_0202AE74: ; 0x0202AE74
	mov r3, #0
	mov r1, #1
_0202AE78:
	ldrb r2, [r0]
	cmp r2, #0
	bne _0202AE82
	strb r1, [r0]
	strb r1, [r0, #1]
_0202AE82:
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #0x80
	blt _0202AE78
	bx lr
	thumb_func_end sub_0202AE74
