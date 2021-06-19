
	thumb_func_start MOD57_022378C0
MOD57_022378C0: @ 0x022378C0
	push {r3, lr}
	ldr r0, _022378D4 @ =0x00000006
	movs r1, #2
	bl FUN_02006FF8
	ldr r0, _022378D8 @ =0x00000007
	movs r1, #2
	bl FUN_02006FF8
	pop {r3, pc}
	.align 2, 0
_022378D4: .4byte 0x00000006
_022378D8: .4byte 0x00000007
	thumb_func_end MOD57_022378C0
