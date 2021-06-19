
	thumb_func_start MOD74_02227060
MOD74_02227060: @ 0x02227060
	push {r4, lr}
	ldr r1, _02227090 @ =0x021D110C
	adds r4, r0, #0
	ldr r2, [r1, #0x48]
	ldr r0, _02227094 @ =0x00000CF3
	tst r0, r2
	beq _0222707A
	movs r0, #0x6b
	movs r2, #0
	lsls r0, r0, #2
	str r2, [r4, r0]
	ldr r0, [r1, #0x48]
	pop {r4, pc}
_0222707A:
	bl FUN_02025358
	cmp r0, #0
	beq _0222708C
	movs r1, #0x6b
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
_0222708C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02227090: .4byte 0x021D110C
_02227094: .4byte 0x00000CF3
	thumb_func_end MOD74_02227060
