	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202CC54
sub_0202CC54: ; 0x0202CC54
	mov r1, #0x12
	lsl r1, r1, #4
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0202CC54

	thumb_func_start sub_0202CC5C
sub_0202CC5C: ; 0x0202CC5C
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end sub_0202CC5C

	thumb_func_start sub_0202CC60
sub_0202CC60: ; 0x0202CC60
	mov r3, #0
	add r2, r1, #1
_0202CC64:
	ldrb r1, [r0]
	cmp r2, r1
	bne _0202CC6E
	mov r0, #1
	bx lr
_0202CC6E:
	add r3, r3, #1
	add r0, r0, #3
	cmp r3, #8
	blt _0202CC64
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CC60

	thumb_func_start sub_0202CC7C
sub_0202CC7C: ; 0x0202CC7C
	push {r4, r5, r6, r7}
	mov r6, #0
	add r4, r6, #0
	add r2, r1, #1
	add r3, r6, #0
_0202CC86:
	add r5, r3, #0
	add r7, r0, #0
_0202CC8A:
	ldrb r1, [r7]
	cmp r2, r1
	bne _0202CC92
	add r6, r6, #1
_0202CC92:
	add r5, r5, #1
	add r7, r7, #3
	cmp r5, #8
	blt _0202CC8A
	add r4, r4, #1
	add r0, #0x18
	cmp r4, #0xc
	blt _0202CC86
	add r0, r6, #0
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_0202CC7C

	thumb_func_start sub_0202CCA8
sub_0202CCA8: ; 0x0202CCA8
	strb r2, [r0, r1]
	bx lr
	thumb_func_end sub_0202CCA8

	thumb_func_start sub_0202CCAC
sub_0202CCAC: ; 0x0202CCAC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0202CC7C
	mov r1, #0x12
	lsl r1, r1, #4
	add r2, r6, r1
	sub r1, r5, #1
	ldrb r3, [r2, r1]
	add r0, r0, r3
	cmp r4, #0
	bge _0202CCD6
	add r0, r4, r3
	bmi _0202CCD2
	strb r0, [r2, r1]
	b _0202CCE6
_0202CCD2:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CCD6:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CCE2
	add r0, r3, r4
	strb r0, [r2, r1]
	b _0202CCE6
_0202CCE2:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CCE6:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202CCAC

	thumb_func_start sub_0202CCEC
sub_0202CCEC: ; 0x0202CCEC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0202CC7C
	cmp r4, #0
	bge _0202CD14
	mov r0, #0x12
	lsl r0, r0, #4
	add r2, r6, r0
	sub r1, r5, #1
	ldrb r0, [r2, r1]
	add r0, r4, r0
	bmi _0202CD10
	strb r0, [r2, r1]
	b _0202CD38
_0202CD10:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD14:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CD34
	mov r0, #0x12
	lsl r0, r0, #4
	add r2, r6, r0
	sub r1, r5, #1
	ldrb r0, [r2, r1]
	add r0, r0, r4
	strb r0, [r2, r1]
	ldrb r0, [r2, r1]
	cmp r0, #0x63
	blo _0202CD38
	mov r0, #0x63
	strb r0, [r2, r1]
	b _0202CD38
_0202CD34:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD38:
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CCEC

	thumb_func_start sub_0202CD3C
sub_0202CD3C: ; 0x0202CD3C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0202CC7C
	sub r1, r5, #1
	add r2, r6, r1
	mov r1, #0x12
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r0, r0, r1
	cmp r4, #0
	bge _0202CD66
	add r0, r4, r1
	bmi _0202CD62
	mov r0, #1
	pop {r4, r5, r6, pc}
_0202CD62:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD66:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CD70
	mov r0, #1
	pop {r4, r5, r6, pc}
_0202CD70:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CD3C

	thumb_func_start sub_0202CD74
sub_0202CD74: ; 0x0202CD74
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #0
	mov r4, #1
_0202CD7C:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202CD94
	cmp r0, #0
	beq _0202CD8A
	add r5, r5, #1
_0202CD8A:
	add r4, r4, #1
	cmp r4, #0x51
	blt _0202CD7C
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0202CD74

	thumb_func_start sub_0202CD94
sub_0202CD94: ; 0x0202CD94
	push {r3, r4, r5, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r4, r0, #0
	bl sub_0202CC7C
	sub r1, r5, #1
	add r2, r4, r1
	mov r1, #0x12
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r0, r0, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202CD94
