
	thumb_func_start ov22_022598C0
ov22_022598C0: @ 0x022598C0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r2, [r5, #8]
	adds r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_020403AC
	adds r7, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #0x27
	bl FUN_020402F0
	lsls r2, r6, #0x18
	lsls r3, r7, #0x18
	adds r5, #0x80
	str r0, [sp]
	ldr r0, [r5]
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	lsrs r3, r3, #0x18
	bl FUN_021EEC00
	ldr r1, [sp]
	str r0, [r1]
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov22_022598C0

	thumb_func_start ov22_0225991C
ov22_0225991C: @ 0x0225991C
	push {r3, lr}
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #0x27
	bl FUN_020402F0
	ldr r0, [r0]
	bl FUN_021EEC68
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov22_0225991C

	thumb_func_start ov22_02259934
ov22_02259934: @ 0x02259934
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #8]
	adds r0, r1, #1
	str r0, [r5, #8]
	adds r0, r5, #0
	adds r0, #0x80
	ldrb r4, [r1]
	ldr r0, [r0]
	movs r1, #0x27
	bl FUN_020402F0
	adds r1, r0, #0
	adds r5, #0x80
	ldr r0, [r5]
	ldr r1, [r1]
	adds r2, r4, #0
	bl FUN_021EEC7C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259934

	thumb_func_start ov22_02259960
ov22_02259960: @ 0x02259960
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r5, #0x80
	adds r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl FUN_02028EB4
	bl FUN_0202C950
	strh r0, [r4]
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259960

	thumb_func_start ov22_0225998C
ov22_0225998C: @ 0x0225998C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02028EB4
	adds r1, r5, #0
	bl FUN_0202C954
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_0225998C

	thumb_func_start ov22_022599B8
ov22_022599B8: @ 0x022599B8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02028EB4
	adds r1, r5, #0
	bl FUN_0202C98C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_022599B8

	thumb_func_start ov22_022599E4
ov22_022599E4: @ 0x022599E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_02040374
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02028EB4
	ldrh r1, [r5]
	bl FUN_0202C98C
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_022599E4

	thumb_func_start ov22_02259A10
ov22_02259A10: @ 0x02259A10
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x80
	ldr r5, [r1]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r4, r0, #0
	adds r0, r6, #0
	bl FUN_0203FE44
	adds r6, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_02028EB4
	bl FUN_0202C950
	cmp r0, r6
	bhs _02259A46
	movs r0, #0
	b _02259A48
_02259A46:
	movs r0, #1
_02259A48:
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov22_02259A10

	thumb_func_start ov22_02259A50
ov22_02259A50: @ 0x02259A50
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r6, [r1]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_02040374
	adds r5, r0, #0
	ldr r0, [r6, #0xc]
	bl FUN_02028EB4
	bl FUN_0202C950
	ldrh r1, [r5]
	cmp r0, r1
	bhs _02259A92
	movs r0, #0
	b _02259A94
_02259A92:
	movs r0, #1
_02259A94:
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov22_02259A50

	thumb_func_start ov22_02259A9C
ov22_02259A9C: @ 0x02259A9C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02028EB4
	adds r1, r5, #0
	bl FUN_0202C974
	strh r0, [r6]
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov22_02259A9C

	thumb_func_start ov22_02259ADC
ov22_02259ADC: @ 0x02259ADC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02031968
	adds r1, r5, #0
	bl FUN_02031A38
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259ADC

	thumb_func_start ov22_02259B08
ov22_02259B08: @ 0x02259B08
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r4, [r1]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02031968
	adds r1, r5, #0
	bl FUN_02031A54
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov22_02259B08

	thumb_func_start ov22_02259B34
ov22_02259B34: @ 0x02259B34
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x80
	ldr r6, [r1]
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r5, r0, #0
	ldr r0, [r6, #0xc]
	bl FUN_02031968
	bl FUN_02031A6C
	cmp r0, r5
	bhs _02259B74
	movs r0, #0
	b _02259B76
_02259B74:
	movs r0, #1
_02259B76:
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov22_02259B34
