	.include "macros.inc"
	.include "overlay_57.inc"
	.include "global.inc"

	.text

	.extern ov57_022394AC
	.extern ov57_0223AEA8

	thumb_func_start ov57_0223BB84
ov57_0223BB84: ; 0x0223BB84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	add r1, sp, #0x10
	mov r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	mov r7, #0x1f
	lsl r7, r7, #4
	strb r0, [r1, #3]
	ldr r1, _0223BC40 ; =ov57_0223BEF4
	ldr r2, [sp, #4]
	add r3, r7, #1
	add r4, r7, #2
	add r5, r7, #3
_0223BBA4:
	ldrb r6, [r1]
	add r0, r0, #1
	strb r6, [r2, r7]
	ldrb r6, [r1, #1]
	strb r6, [r2, r3]
	ldrb r6, [r1, #2]
	strb r6, [r2, r4]
	ldrb r6, [r1, #3]
	add r1, r1, #4
	strb r6, [r2, r5]
	add r2, r2, #4
	cmp r0, #0xd
	blt _0223BBA4
	cmp r0, #0x15
	bge _0223BC1E
	mov r3, #0x1f
	ldr r2, [sp, #4]
	lsl r3, r3, #4
	add r2, r2, r3
	lsl r4, r0, #2
	ldr r1, [sp, #4]
	ldr r3, [sp, #4]
	add r1, r1, r4
	add r2, r2, r4
	lsl r4, r0, #4
	add r5, sp, #0xc
	add r3, r3, r4
	ldrb r4, [r5, #4]
	strb r4, [r5]
	ldrb r4, [r5, #5]
	strb r4, [r5, #1]
	ldrb r4, [r5, #6]
	strb r4, [r5, #2]
	ldrb r4, [r5, #7]
	strb r4, [r5, #3]
	ldrb r4, [r5, #2]
	ldrb r6, [r5]
	ldrb r7, [r5, #1]
	str r4, [sp, #8]
	ldrb r4, [r5, #3]
	mov ip, r4
_0223BBF6:
	mov r4, #0x1f
	lsl r4, r4, #4
	strb r6, [r1, r4]
	add r4, r4, #1
	strb r7, [r1, r4]
	ldr r5, _0223BC44 ; =0x000001F2
	ldr r4, [sp, #8]
	add r0, r0, #1
	strb r4, [r1, r5]
	add r5, r5, #1
	mov r4, ip
	strb r4, [r1, r5]
	mov r4, #0xa2
	lsl r4, r4, #2
	str r2, [r3, r4]
	add r1, r1, #4
	add r2, r2, #4
	add r3, #0x10
	cmp r0, #0x15
	blt _0223BBF6
_0223BC1E:
	mov r0, #0x34
	str r0, [sp]
	mov r1, #0x1f
	ldr r0, [sp, #4]
	lsl r1, r1, #4
	add r0, r0, r1
	ldr r2, _0223BC48 ; =ov57_0223AEA8
	ldr r3, [sp, #4]
	mov r1, #0x15
	bl TouchHitboxController_Create
	mov r2, #0x7b
	ldr r1, [sp, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223BC40: .word ov57_0223BEF4
_0223BC44: .word 0x000001F2
_0223BC48: .word ov57_0223AEA8
	thumb_func_end ov57_0223BB84

	thumb_func_start ov57_0223BC4C
ov57_0223BC4C: ; 0x0223BC4C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0
	add r4, r5, #4
	lsl r6, r1, #3
	str r0, [sp]
	ldr r0, [r4, r6]
	cmp r0, #0xff
	beq _0223BC70
	ldr r1, [r5]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r0, [r0, #4]
	mov r1, #0xa2
	add r2, sp, #0
	bl SetMonData
_0223BC70:
	mov r0, #0xff
	str r0, [r4, r6]
	add r0, r5, #0
	bl ov57_022394AC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov57_0223BC4C

	.rodata

	.global ov57_0223BEF4
ov57_0223BEF4: ; 0x0223BEF4
	.byte 0x10, 0x20, 0x08, 0x18
	.byte 0x10, 0x20, 0x40, 0x50
	.byte 0x28, 0x38, 0x08, 0x18
	.byte 0x28, 0x38, 0x40, 0x50
	.byte 0x40, 0x50, 0x08, 0x18
	.byte 0x40, 0x50, 0x40, 0x50
	.byte 0x58, 0x68, 0x08, 0x18
	.byte 0x58, 0x68, 0x40, 0x50
	.byte 0x68, 0x80, 0x08, 0x30
	.byte 0x68, 0x80, 0x38, 0x60
	.byte 0xA8, 0xBC, 0x12, 0x4D
	.byte 0xA8, 0xBC, 0x61, 0x9C
	.byte 0xA8, 0xBC, 0xB2, 0xED
	.size ov57_0223BEF4,.-ov57_0223BEF4
