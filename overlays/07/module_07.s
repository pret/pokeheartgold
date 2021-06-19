
	thumb_func_start MOD07_0221BE20
MOD07_0221BE20: @ 0x0221BE20
	adds r1, r0, #0
	adds r1, #0x8d
	ldrb r1, [r1]
	cmp r1, #0
	bne _0221BE32
	ldr r1, _0221BE40 @ =0x0221BE45
	adds r0, #0xbc
	str r1, [r0]
	bx lr
_0221BE32:
	adds r1, r0, #0
	adds r1, #0x8d
	ldrb r1, [r1]
	adds r0, #0x8d
	subs r1, r1, #1
	strb r1, [r0]
	bx lr
	.align 2, 0
_0221BE40: .4byte 0x0221BE45
	thumb_func_end MOD07_0221BE20
