
	thumb_func_start MOD95_021E5900
MOD95_021E5900: @ 0x021E5900
	push {r3, lr}
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r2, #1
	lsls r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E5920 @ =0xFFFFE0FF
	ands r1, r0
	str r1, [r2]
	ldr r2, _021E5924 @ =0x04001000
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	pop {r3, pc}
	.align 2, 0
_021E5920: .4byte 0xFFFFE0FF
_021E5924: .4byte 0x04001000
	thumb_func_end MOD95_021E5900
