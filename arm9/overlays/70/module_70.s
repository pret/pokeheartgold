
	thumb_func_start MOD70_022378C0
MOD70_022378C0: @ 0x022378C0
	push {r3, r4}
	ldr r3, _022378D8 @ =0x02246800
	movs r4, #1
	str r4, [r3]
	movs r4, #0
	str r4, [r3, #4]
	str r0, [r3, #8]
	str r1, [r3, #0xc]
	str r2, [r3, #0x10]
	pop {r3, r4}
	bx lr
	nop
_022378D8: .4byte 0x02246800
	thumb_func_end MOD70_022378C0
