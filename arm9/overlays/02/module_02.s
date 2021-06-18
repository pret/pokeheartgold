
	thumb_func_start MOD02_02245B80
MOD02_02245B80: @ 0x02245B80
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	bl FUN_02245B9C
	adds r2, r0, #0
	ldr r1, _02245B98 @ =0x02245BC9
	adds r0, r4, #0
	bl FUN_02050530
	pop {r4, pc}
	.align 2, 0
_02245B98: .4byte 0x02245BC9
	thumb_func_end MOD02_02245B80

	thumb_func_start FUN_02245B9C
FUN_02245B9C: @ 0x02245B9C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #4
	movs r1, #0xd0
	bl FUN_0201AA8C
	adds r4, r0, #0
	bne _02245BB4
	bl FUN_0202551C
	movs r0, #0
	pop {r3, r4, r5, pc}
_02245BB4:
	movs r1, #0
	movs r2, #0xd0
	blx FUN_020D4994
	str r5, [r4, #4]
	movs r0, #4
	str r0, [r4]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_02245B9C
