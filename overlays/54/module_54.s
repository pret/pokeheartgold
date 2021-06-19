
	thumb_func_start MOD54_021E5900
MOD54_021E5900: @ 0x021E5900
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_020072A4
	adds r5, r0, #0
	movs r0, #3
	movs r1, #0x26
	lsls r2, r0, #0x10
	bl FUN_0201A910
	movs r1, #0xcb
	adds r0, r4, #0
	lsls r1, r1, #2
	movs r2, #0x26
	bl FUN_02007280
	movs r2, #0xcb
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, [r5, #4]
	bl FUN_0202AD20
	ldrh r1, [r4, #0x18]
	movs r2, #0xf
	lsls r0, r0, #0x10
	bics r1, r2
	lsrs r2, r0, #0x10
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202AD74
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1f
	ldrh r1, [r4, #0x18]
	movs r2, #0x40
	lsrs r0, r0, #0x19
	bics r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202AD90
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1f
	ldrh r1, [r4, #0x18]
	movs r2, #0x80
	lsrs r0, r0, #0x18
	bics r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202AD58
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1e
	ldrh r1, [r4, #0x18]
	movs r2, #0x30
	lsrs r0, r0, #0x1a
	bics r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202ADAC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1e
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5A08 @ =0xFFFFFCFF
	lsrs r0, r0, #0x16
	ands r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #4]
	bl FUN_0202ADCC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r0, r0, #0x1b
	ldrh r2, [r4, #0x18]
	ldr r1, _021E5A0C @ =0xFFFF83FF
	lsrs r0, r0, #0x11
	ands r1, r2
	orrs r0, r1
	strh r0, [r4, #0x18]
	ldr r0, [r5, #8]
	str r0, [r4, #0x20]
	ldr r0, [r5, #4]
	str r0, [r4, #0x1c]
	movs r0, #0x26
	str r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	bl FUN_020183F0
	movs r1, #0x32
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r1, [r4]
	movs r0, #0x28
	bl FUN_02026354
	movs r1, #0xc9
	lsls r1, r1, #2
	str r0, [r4, r1]
	movs r0, #0
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B8C
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0200FBF4
	movs r0, #1
	movs r1, #0
	bl FUN_0200FBF4
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5A08: .4byte 0xFFFFFCFF
_021E5A0C: .4byte 0xFFFF83FF
	thumb_func_end MOD54_021E5900
