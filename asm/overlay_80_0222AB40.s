	.include "asm/macros.inc"
	.include "overlay_80_0222AB40.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_0222AB40
ov80_0222AB40: ; 0x0222AB40
	push {r3, r4}
	mov r4, #0
	strb r4, [r0, #0x19]
	str r4, [r0, #0x1c]
	add r3, r0, #0
	strb r4, [r0, #0x18]
	add r3, #0x88
	str r4, [r3]
	str r1, [r0, #0x70]
	str r2, [r0, #0x74]
	add r2, r0, #0
	add r3, r4, #0
_0222AB58:
	add r1, r2, #0
	add r1, #0x78
	add r4, r4, #1
	add r2, r2, #2
	strh r3, [r1]
	cmp r4, #4
	blo _0222AB58
	mov r1, #0
_0222AB68:
	add r3, r3, #1
	str r1, [r0, #0x20]
	add r0, r0, #4
	cmp r3, #0x14
	blo _0222AB68
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AB40

	thumb_func_start ov80_0222AB78
ov80_0222AB78: ; 0x0222AB78
	str r1, [r0, #0x1c]
	mov r1, #1
	strb r1, [r0, #0x19]
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AB78

	thumb_func_start ov80_0222AB84
ov80_0222AB84: ; 0x0222AB84
	mov r2, #2
	strb r2, [r0, #0x19]
	add r0, #0x88
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AB84

	thumb_func_start ov80_0222AB90
ov80_0222AB90: ; 0x0222AB90
	mov r1, #0
	strb r1, [r0, #0x19]
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov80_0222AB90

	thumb_func_start ov80_0222AB98
ov80_0222AB98: ; 0x0222AB98
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _0222ABAC
	cmp r1, #1
	beq _0222ABD2
	cmp r1, #2
	beq _0222ABB0
	b _0222AC04
_0222ABAC:
	mov r0, #0
	pop {r4, pc}
_0222ABB0:
	add r1, r4, #0
	add r1, #0x88
	ldr r1, [r1]
	cmp r1, #0
	beq _0222ABCE
	blx r1
	cmp r0, #1
	bne _0222ABCA
	mov r0, #1
	strb r0, [r4, #0x19]
	mov r0, #0
	add r4, #0x88
	str r0, [r4]
_0222ABCA:
	mov r0, #1
	pop {r4, pc}
_0222ABCE:
	mov r0, #1
	strb r0, [r4, #0x19]
_0222ABD2:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0222ABDE
	mov r0, #0
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0222ABDE:
	add r0, r4, #0
	bl ov80_0222AC58
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	cmp r1, r0
	blo _0222ABF6
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0222ABF6:
	ldr r2, [r4, #0x70]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r4, #0
	blx r1
	cmp r0, #1
	bne _0222ABD2
_0222AC04:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0222AB98

	thumb_func_start ov80_0222AC08
ov80_0222AC08: ; 0x0222AC08
	ldrb r3, [r0, #0x18]
	add r2, r3, #1
	cmp r2, #0x14
	blt _0222AC14
	mov r0, #1
	bx lr
_0222AC14:
	lsl r2, r3, #2
	add r2, r0, r2
	str r1, [r2, #0x20]
	ldrb r1, [r0, #0x18]
	add r1, r1, #1
	strb r1, [r0, #0x18]
	mov r0, #0
	bx lr
	thumb_func_end ov80_0222AC08

	thumb_func_start ov80_0222AC24
ov80_0222AC24: ; 0x0222AC24
	ldrb r1, [r0, #0x18]
	cmp r1, #0
	bne _0222AC2E
	mov r0, #0
	bx lr
_0222AC2E:
	sub r1, r1, #1
	strb r1, [r0, #0x18]
	ldrb r1, [r0, #0x18]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov80_0222AC24

	thumb_func_start ov80_0222AC3C
ov80_0222AC3C: ; 0x0222AC3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x1c]
	bl ov80_0222AC08
	str r4, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222AC3C

	thumb_func_start ov80_0222AC4C
ov80_0222AC4C: ; 0x0222AC4C
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC24
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov80_0222AC4C

	thumb_func_start ov80_0222AC58
ov80_0222AC58: ; 0x0222AC58
	ldr r1, [r0, #0x1c]
	add r3, r1, #1
	str r3, [r0, #0x1c]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #0x1c]
	ldrb r0, [r3]
	lsl r0, r0, #8
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov80_0222AC58

	thumb_func_start ov80_0222AC70
ov80_0222AC70: ; 0x0222AC70
	push {r4, r5}
	ldr r1, [r0, #0x1c]
	add r2, r1, #1
	str r2, [r0, #0x1c]
	ldrb r3, [r1]
	add r1, r2, #1
	add r5, r1, #1
	str r1, [r0, #0x1c]
	ldrb r2, [r2]
	add r4, r5, #1
	str r5, [r0, #0x1c]
	ldrb r1, [r1]
	str r4, [r0, #0x1c]
	ldrb r0, [r5]
	mov r4, #0
	add r0, r4, r0
	lsl r0, r0, #8
	add r0, r0, r1
	lsl r0, r0, #8
	add r0, r0, r2
	lsl r0, r0, #8
	add r0, r0, r3
	pop {r4, r5}
	bx lr
	thumb_func_end ov80_0222AC70