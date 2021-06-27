
	thumb_func_start FUN_020CC17C
FUN_020CC17C: ; 0x020CC17C
	str r2, [r0, #0x14]
	str r2, [r0, #0x28]
	str r1, [r0, #0x18]
	neg r1, r1
	str r1, [r0, #0x24]
	mov r1, #1
	mov r2, #0
	lsl r1, r1, #0xc
	mov r3, #0
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r2, r3}
	add r0, #8
	stmia r0!, {r2, r3}
	add r0, #8
	stmia r0!, {r2, r3}
	stmia r0!, {r2, r3}
	str r1, [r0]
	bx lr
	thumb_func_end FUN_020CC17C

	thumb_func_start FUN_020CC1A0
FUN_020CC1A0: ; 0x020CC1A0
	str r2, [r0]
	str r2, [r0, #0x28]
	str r1, [r0, #0x20]
	neg r1, r1
	str r1, [r0, #8]
	mov r3, #1
	mov r1, #0
	lsl r3, r3, #0xc
	mov r2, #0
	str r2, [r0, #4]
	add r0, #0xc
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2}
	str r2, [r0, #4]
	add r0, #0xc
	stmia r0!, {r1, r2}
	stmia r0!, {r1, r2, r3}
	bx lr
	thumb_func_end FUN_020CC1A0

	thumb_func_start FUN_020CC1C4
FUN_020CC1C4: ; 0x020CC1C4
	str r2, [r0]
	str r2, [r0, #0x14]
	str r1, [r0, #4]
	neg r1, r1
	str r1, [r0, #0x10]
	mov r3, #1
	mov r1, #0
	lsl r3, r3, #0xc
	mov r2, #0
	add r0, #8
	stmia r0!, {r1, r2}
	add r0, #8
	stmia r0!, {r1, r2}
	stmia r0!, {r1, r2, r3}
	stmia r0!, {r1, r2}
	stmia r0!, {r1, r2, r3}
	bx lr
	.align 2, 0
	thumb_func_end FUN_020CC1C4
