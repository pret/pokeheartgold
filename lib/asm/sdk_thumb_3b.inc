
	thumb_func_start FUN_020CB800
FUN_020CB800: ; 0x020CB800
	str r1, [r0, #0x14]
	neg r1, r1
	str r1, [r0, #0x1c]
	mov r1, #1
	lsl r1, r1, #0xc
	stmia r0!, {r1}
	mov r3, #0
	mov r1, #0
	stmia r0!, {r1, r3}
	stmia r0!, {r1, r2}
	str r1, [r0, #4]
	add r0, #0xc
	stmia r0!, {r2, r3}
	stmia r0!, {r1, r3}
	bx lr
	.align 2, 0
	thumb_func_end FUN_020CB800

	thumb_func_start FUN_020CB820
FUN_020CB820: ; 0x020CB820
	str r1, [r0, #0x18]
	mov r3, #0
	stmia r0!, {r2, r3}
	neg r1, r1
	stmia r0!, {r1, r3}
	mov r1, #1
	lsl r1, r1, #0xc
	stmia r0!, {r1, r3}
	add r0, #4
	mov r1, #0
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r3}
	bx lr
	.align 2, 0
	thumb_func_end FUN_020CB820
