
	thumb_func_start ov36_021E5900
ov36_021E5900: @ 0x021E5900
	push {r3, lr}
	movs r2, #2
	movs r0, #3
	movs r1, #0x4b
	lsls r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020010C8
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E5900

	thumb_func_start ov36_021E5918
ov36_021E5918: @ 0x021E5918
	push {r3, lr}
	bl FUN_020072A4
	ldr r1, [r0, #8]
	movs r0, #0x4b
	bl ov36_021E5BC8
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E5918

	thumb_func_start ov36_021E592C
ov36_021E592C: @ 0x021E592C
	push {r3, lr}
	movs r0, #0x4b
	bl FUN_0201A9C4
	movs r0, #0
	ldr r1, _021E5944 @ =0x02106068
	mvns r0, r0
	bl FUN_02000EF4
	movs r0, #1
	pop {r3, pc}
	nop
_021E5944: .4byte 0x02106068
	thumb_func_end ov36_021E592C

	thumb_func_start ov36_021E5948
ov36_021E5948: @ 0x021E5948
	push {r3, lr}
	movs r2, #2
	movs r0, #3
	movs r1, #0x4b
	lsls r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020010C8
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E5948

	thumb_func_start ov36_021E5960
ov36_021E5960: @ 0x021E5960
	push {r4, lr}
	bl FUN_020072A4
	ldr r4, [r0, #8]
	movs r0, #0x4b
	adds r1, r4, #0
	movs r2, #1
	bl ov36_021E5A38
	adds r0, r4, #0
	bl FUN_02028EC0
	bl FUN_0201838C
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov36_021E5960

	thumb_func_start ov36_021E5980
ov36_021E5980: @ 0x021E5980
	push {r3, lr}
	movs r0, #0x4b
	bl FUN_0201A9C4
	movs r0, #0
	ldr r1, _021E5998 @ =0x020FA15C
	mvns r0, r0
	bl FUN_02000EF4
	movs r0, #1
	pop {r3, pc}
	nop
_021E5998: .4byte 0x020FA15C
	thumb_func_end ov36_021E5980

	thumb_func_start ov36_021E599C
ov36_021E599C: @ 0x021E599C
	push {r3, lr}
	movs r2, #2
	movs r0, #3
	movs r1, #0x4b
	lsls r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020010C8
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E599C

	thumb_func_start ov36_021E59B4
ov36_021E59B4: @ 0x021E59B4
	push {r3, r4, r5, lr}
	bl FUN_020072A4
	ldr r4, [r0, #8]
	adds r0, r4, #0
	bl FUN_02028D30
	adds r5, r0, #0
	movs r0, #0x4b
	adds r1, r4, #0
	bl ov36_021E5BB4
	adds r0, r4, #0
	movs r1, #0
	bl FUN_0202ACF4
	adds r0, r5, #0
	bl FUN_02028D74
	cmp r0, #0
	beq _021E59E8
	adds r0, r5, #0
	bl FUN_02028DA4
	cmp r0, #0
	bne _021E5A0C
_021E59E8:
	adds r0, r4, #0
	bl FUN_02028D3C
	bl FUN_02028E4C
	adds r0, r4, #0
	bl FUN_0202A988
	bl FUN_0202A8A8
	adds r0, r5, #0
	bl FUN_02028D48
	adds r0, r4, #0
	bl FUN_02074904
	bl FUN_02071E2C
_021E5A0C:
	adds r0, r4, #0
	bl FUN_02028EC0
	bl FUN_0201838C
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov36_021E59B4

	thumb_func_start ov36_021E5A1C
ov36_021E5A1C: @ 0x021E5A1C
	push {r3, lr}
	movs r0, #0x4b
	bl FUN_0201A9C4
	movs r0, #0
	ldr r1, _021E5A34 @ =0x020FA16C
	mvns r0, r0
	bl FUN_02000EF4
	movs r0, #1
	pop {r3, pc}
	nop
_021E5A34: .4byte 0x020FA16C
	thumb_func_end ov36_021E5A1C

	thumb_func_start ov36_021E5A38
ov36_021E5A38: @ 0x021E5A38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r1, #0
	adds r0, r6, #0
	adds r5, r2, #0
	bl FUN_02028D30
	bl FUN_02028D48
	adds r0, r6, #0
	bl FUN_02028D3C
	bl FUN_02028DE8
	adds r0, r6, #0
	bl FUN_0202A988
	bl FUN_0202A8A8
	adds r0, r6, #0
	bl FUN_0202C854
	adds r4, r0, #0
	bl FUN_0201FDB8
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0202C7C0
	adds r0, r6, #0
	bl FUN_020674BC
	adds r0, r6, #0
	bl FUN_02028E9C
	adds r7, r0, #0
	bl FUN_0201FDB8
	adds r4, r0, #0
	cmp r5, #0
	beq _021E5A94
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_02028F80
_021E5A94:
	adds r0, r6, #0
	bl FUN_0202F57C
	adds r1, r4, #0
	bl FUN_0202F5B8
	adds r0, r7, #0
	bl FUN_02028F94
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl FUN_0205B418
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r7, #0
	lsrs r1, r1, #0x18
	bl FUN_02029040
	adds r0, r6, #0
	bl FUN_0202A96C
	bl FUN_0202AE0C
	adds r0, r6, #0
	bl FUN_020325EC
	bl FUN_02032728
	adds r5, r0, #0
	movs r4, #0
_021E5AD4:
	bl FUN_0201FDB8
	adds r4, r4, #1
	stm r5!, {r0}
	cmp r4, #0xa
	blt _021E5AD4
	ldr r2, _021E5BAC @ =0x000001BD
	movs r0, #1
	movs r1, #0x1b
	movs r3, #3
	bl FUN_0200BAF8
	str r0, [sp, #0x1c]
	adds r0, r6, #0
	bl FUN_0202B50C
	str r0, [sp, #0x14]
	movs r0, #3
	bl FUN_0206DD2C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r1, #0xb7
	movs r2, #1
	str r0, [sp, #0x10]
	str r3, [sp, #0xc]
	bl FUN_0206DE38
	adds r0, r7, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _021E5B36
	ldr r0, [sp, #0x1c]
	movs r1, #1
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	movs r1, #9
	movs r2, #1
	bl FUN_0202B2D4
	b _021E5B4E
_021E5B36:
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	movs r2, #0
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	movs r1, #9
	str r2, [sp]
	bl FUN_0202B2D4
_021E5B4E:
	ldr r4, _021E5BB0 @ =0x021E5C34
	adds r6, r0, #0
	movs r5, #0
	add r7, sp, #0x20
_021E5B56:
	adds r0, r7, #0
	adds r1, r4, #0
	bl FUN_0201585C
	lsls r2, r5, #0x18
	adds r0, r6, #0
	adds r1, r7, #0
	lsrs r2, r2, #0x18
	bl FUN_0202B4F8
	adds r5, r5, #1
	adds r4, #8
	cmp r5, #2
	blt _021E5B56
	add r0, sp, #0x20
	bl FUN_0201581C
	adds r0, r6, #0
	add r1, sp, #0x20
	movs r2, #2
	bl FUN_0202B4F8
	movs r1, #0
	ldr r0, [sp, #0x14]
	adds r2, r1, #0
	adds r3, r6, #0
	bl FUN_0202B554
	ldr r0, [sp, #0x10]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0201AB0C
	ldr r0, [sp, #0x1c]
	bl FUN_0200BB44
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5BAC: .4byte 0x000001BD
_021E5BB0: .4byte 0x021E5C34
	thumb_func_end ov36_021E5A38

	thumb_func_start ov36_021E5BB4
ov36_021E5BB4: @ 0x021E5BB4
	push {r3, lr}
	adds r0, r1, #0
	bl FUN_020273B0
	cmp r0, #0
	bne _021E5BC6
	movs r0, #0
	blx FUN_020D3B84
_021E5BC6:
	pop {r3, pc}
	thumb_func_end ov36_021E5BB4

	thumb_func_start ov36_021E5BC8
ov36_021E5BC8: @ 0x021E5BC8
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl FUN_020274A8
	adds r0, r4, #0
	bl FUN_0203E398
	adds r0, r4, #0
	bl FUN_02028E9C
	ldr r1, _021E5BFC @ =0x00000BB8
	bl FUN_02029028
	adds r0, r4, #0
	bl FUN_020503D0
	ldr r1, _021E5C00 @ =0x0000DB56
	bl FUN_02066B60
	adds r0, r4, #0
	bl FUN_020503D0
	bl FUN_020665EC
	pop {r4, pc}
	.align 2, 0
_021E5BFC: .4byte 0x00000BB8
_021E5C00: .4byte 0x0000DB56
	thumb_func_end ov36_021E5BC8

	.rodata

_021E5C04:
	.byte 0x9D, 0x59, 0x1E, 0x02, 0xB5, 0x59, 0x1E, 0x02, 0x1D, 0x5A, 0x1E, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x49, 0x59, 0x1E, 0x02, 0x61, 0x59, 0x1E, 0x02, 0x81, 0x59, 0x1E, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x59, 0x1E, 0x02, 0x19, 0x59, 0x1E, 0x02, 0x2D, 0x59, 0x1E, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x04, 0x07, 0x08, 0x52, 0x00, 0x18, 0x00, 0x03, 0x01, 0x0A, 0xFF
	.byte 0x07, 0x00, 0x00, 0x00
