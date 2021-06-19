
	thumb_func_start MOD100_021E5900
MOD100_021E5900: @ 0x021E5900
	ldr r1, [r0, #0xc]
	str r1, [r0, #0x10]
	ldr r1, _021E591C @ =0x021D110C
	ldr r2, [r1, #0x48]
	ldr r1, _021E5920 @ =0x00000CF3
	tst r1, r2
	beq _021E5916
	movs r1, #0
	str r1, [r0, #0xc]
	movs r0, #1
	bx lr
_021E5916:
	movs r0, #0
	bx lr
	nop
_021E591C: .4byte 0x021D110C
_021E5920: .4byte 0x00000CF3
	thumb_func_end MOD100_021E5900
