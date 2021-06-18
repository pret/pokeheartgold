
	thumb_func_start MOD50_021E5900
MOD50_021E5900: @ 0x021E5900
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E5920
	bl FUN_020072A8
	cmp r0, #0
	beq _021E5920
	ldr r0, [r4]
	bl FUN_02007278
	movs r0, #0
	str r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E5920:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end MOD50_021E5900
