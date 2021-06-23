
	thumb_func_start MOD98_0221E5C0
MOD98_0221E5C0: @ 0x0221E5C0
	push {r4, lr}
	adds r4, r0, #0
	bne _0221E5CA
	bl GF_AssertFail
_0221E5CA:
	ldr r0, [r4, #4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end MOD98_0221E5C0
