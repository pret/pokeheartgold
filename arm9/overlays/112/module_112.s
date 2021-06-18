
	thumb_func_start MOD112_021E5900
MOD112_021E5900: @ 0x021E5900
	push {r3, r4, r5, r6}
	movs r5, #2
	movs r6, #0
	cmp r1, #0
	bls _021E5924
	movs r2, #1
_021E590C:
	adds r3, r6, #0
	ldrb r4, [r0]
	adds r0, r0, #1
	tst r3, r2
	beq _021E591A
	adds r5, r5, r4
	b _021E591E
_021E591A:
	lsls r3, r4, #8
	adds r5, r5, r3
_021E591E:
	adds r6, r6, #1
	cmp r6, r1
	blo _021E590C
_021E5924:
	lsls r0, r5, #0x10
	lsrs r1, r5, #0x10
	lsrs r0, r0, #0x10
	adds r1, r1, r0
	lsrs r0, r1, #0x10
	adds r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end MOD112_021E5900
