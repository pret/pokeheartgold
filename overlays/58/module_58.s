
	thumb_func_start MOD58_022378C0
MOD58_022378C0: @ 0x022378C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _022378E0
	bl FUN_020072A8
	cmp r0, #0
	beq _022378E0
	ldr r0, [r4]
	bl FUN_02007278
	movs r0, #0
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_022378E0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end MOD58_022378C0
