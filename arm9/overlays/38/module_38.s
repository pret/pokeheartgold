
	thumb_func_start MOD38_0221BA00
MOD38_0221BA00: @ 0x0221BA00
	lsls r1, r0, #0x10
	orrs r1, r0
	ldr r0, _0221BA0C @ =0x02226020
	str r1, [r0]
	bx lr
	nop
_0221BA0C: .4byte 0x02226020
	thumb_func_end MOD38_0221BA00
