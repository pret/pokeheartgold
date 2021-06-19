
	thumb_func_start MOD06_0221BA00
MOD06_0221BA00: @ 0x0221BA00
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0221BA10
	lsls r1, r0, #2
	ldr r0, _0221BA14 @ =0x0221BDD0
	ldr r0, [r0, r1]
	bx lr
_0221BA10:
	ldr r0, _0221BA18 @ =0x0221BB6C
	bx lr
	.align 2, 0
_0221BA14: .4byte 0x0221BDD0
_0221BA18: .4byte 0x0221BB6C
	thumb_func_end MOD06_0221BA00
