
	thumb_func_start MOD67_021E5900
MOD67_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	movs r2, #2
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x48
	lsls r2, r2, #0x10
	bl FUN_0201A910
	ldr r1, _021E5964 @ =0x000004AC
	adds r0, r4, #0
	movs r2, #0x48
	bl FUN_02007280
	ldr r2, _021E5964 @ =0x000004AC
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldrh r0, [r5, #4]
	strh r0, [r4, #8]
	ldrh r0, [r5, #6]
	strb r0, [r4, #0xa]
	ldr r0, [r5]
	bl FUN_02028EA8
	str r0, [r4, #0x18]
	ldr r0, [r5]
	bl FUN_0203107C
	str r0, [r4, #0x1c]
	ldr r0, [r5]
	bl FUN_0202D918
	str r0, [r4, #0x20]
	ldr r0, [r5]
	bl FUN_0202D928
	str r0, [r4, #0x24]
	movs r0, #0x48
	str r0, [r4]
	movs r0, #4
	movs r1, #8
	bl FUN_0201A71C
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5964: .4byte 0x000004AC
	thumb_func_end MOD67_021E5900
