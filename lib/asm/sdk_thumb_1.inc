
	thumb_func_start FUN_020CAF88
FUN_020CAF88: ; 0x020CAF88
	str r2, [r0]
	str r1, [r0, #4]
	neg r1, r1
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	thumb_func_end FUN_020CAF88
