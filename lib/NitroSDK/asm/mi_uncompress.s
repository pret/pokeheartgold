	.include "asm/macros.inc"
	.include "mi_uncompress.inc"
	.include "global.inc"

	.text

	arm_func_start MI_UncompressLZ8
MI_UncompressLZ8: ; 0x020D4BE8
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r5, [r0], #4
	mov r2, r5, lsr #8
	mov r7, #0
	tst r5, #0xf
	bne _020D4C04
	b _020D4C08
_020D4C04:
	mov r7, #1
_020D4C08:
	cmp r2, #0
	ble _020D4CE0
	ldrb lr, [r0], #1
	mov r4, #8
_020D4C18:
	subs r4, r4, #1
	blt _020D4C08
	tst lr, #0x80
	bne _020D4C3C
	ldrb r6, [r0], #1
	swpb r6, r6, [r1]
	add r1, r1, #1
	sub r2, r2, #1
	b _020D4CC8
_020D4C3C:
	ldrb r5, [r0]
	cmp r7, #0
	beq _020D4C4C
	b _020D4C50
_020D4C4C:
	mov r6, #3
_020D4C50:
	beq _020D4C94
	tst r5, #0xe0
	bne _020D4C60
	b _020D4C64
_020D4C60:
	mov r6, #1
_020D4C64:
	bne _020D4C94
	add r0, r0, #1
	and r6, r5, #0xf
	mov r6, r6, lsl #4
	tst r5, #0x10
	beq _020D4C8C
	mov r6, r6, lsl #8
	ldrb r5, [r0], #1
	add r6, r6, r5, lsl #4
	add r6, r6, #0x100
_020D4C8C:
	add r6, r6, #0x11
	ldrb r5, [r0]
_020D4C94:
	add r3, r6, r5, asr #4
	add r0, r0, #1
	and r5, r5, #0xf
	mov ip, r5, lsl #8
	ldrb r6, [r0], #1
	orr r5, r6, ip
	add ip, r5, #1
	sub r2, r2, r3
_020D4CB4:
	ldrb r5, [r1, -ip]
	swpb r5, r5, [r1]
	add r1, r1, #1
	subs r3, r3, #1
	bgt _020D4CB4
_020D4CC8:
	cmp r2, #0
	bgt _020D4CD4
	b _020D4CD8
_020D4CD4:
	mov lr, lr, lsl #1
_020D4CD8:
	bgt _020D4C18
	b _020D4C08
_020D4CE0:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end MI_UncompressLZ8
