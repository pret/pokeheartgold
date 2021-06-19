
	thumb_func_start MOD115_0225F020
MOD115_0225F020: @ 0x0225F020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	movs r6, #0
	strh r6, [r5]
	adds r4, r5, #0
	ldr r7, [sp, #0x28]
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	strh r6, [r5, #2]
	adds r4, #0x14
_0225F038:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	adds r3, r7, #0
	bl FUN_021F0718
	str r0, [r5, #4]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_0202484C
	cmp r6, #3
	beq _0225F07E
	ldr r0, [r5, #4]
	movs r1, #2
	bl FUN_0202487C
	ldr r0, [r5, #4]
	movs r1, #1
	bl FUN_020248F0
	movs r1, #2
	lsls r1, r1, #0xc
	adds r0, r4, #0
	lsrs r2, r1, #1
	movs r3, #6
	bl FUN_021EFE70
	b _0225F08C
_0225F07E:
	movs r1, #1
	lsls r1, r1, #0xc
	adds r0, r4, #0
	adds r2, r1, #0
	movs r3, #6
	bl FUN_021EFE70
_0225F08C:
	adds r6, r6, #1
	adds r5, r5, #4
	adds r4, #0x14
	cmp r6, #4
	blt _0225F038
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end MOD115_0225F020
