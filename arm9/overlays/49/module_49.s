
	thumb_func_start MOD49_02258800
MOD49_02258800: @ 0x02258800
	movs r3, #0
	ldrsh r2, [r0, r3]
	lsls r2, r2, #0xc
	str r2, [r1]
	movs r2, #2
	ldrsh r0, [r0, r2]
	lsls r0, r0, #0xc
	str r0, [r1, #8]
	str r3, [r1, #4]
	bx lr
	thumb_func_end MOD49_02258800
