
	thumb_func_start ov30_0225D520
ov30_0225D520: @ 0x0225D520
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	movs r0, #3
	str r2, [sp]
	movs r1, #8
	lsls r2, r0, #0xf
	bl FUN_0201A910
	movs r0, #0
	blx FUN_020CDA64
	movs r0, #0x80
	blx FUN_020CE650
	movs r0, #1
	lsls r0, r0, #8
	blx FUN_020CE6F8
	ldr r2, _0225D630 @ =0x04001000
	ldr r0, _0225D634 @ =0xFFCFFFEF
	ldr r1, [r2]
	movs r3, #0
	ands r1, r0
	movs r0, #0x10
	orrs r0, r1
	str r0, [r2]
	ldr r2, _0225D638 @ =_0225DC2C
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201B1E4
	ldr r2, _0225D63C @ =0x0225DC48
	adds r0, r5, #0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	ldr r2, _0225D640 @ =0x0225DC64
	adds r0, r5, #0
	movs r1, #6
	movs r3, #0
	bl FUN_0201B1E4
	movs r0, #6
	movs r1, #0x20
	movs r2, #0
	movs r3, #4
	bl FUN_0201C1C4
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0201CAE0
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0201CAE0
	ldr r2, _0225D630 @ =0x04001000
	ldr r0, _0225D644 @ =0xFFFF1FFF
	ldr r1, [r2]
	ands r0, r1
	str r0, [r2]
	movs r0, #1
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #0
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #0
	bl FUN_02022CC8
	ldr r0, _0225D648 @ =ov30_0225D700
	movs r1, #0x6c
	movs r2, #0xa
	movs r3, #8
	bl FUN_02007200
	adds r6, r0, #0
	bl FUN_0201F988
	adds r4, r0, #0
	str r6, [r4, #8]
	movs r1, #0
	str r1, [r4]
	str r5, [r4, #4]
	ldr r0, [sp]
	str r7, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r1, [r4, #0x30]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	str r0, [r4, #0x44]
	movs r0, #0
	str r0, [r4, #0xc]
	adds r0, r4, #0
	bl ov30_0225D784
	ldr r1, [r4, #0x1c]
	adds r0, r4, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	bl ov30_0225D83C
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022CC8
	movs r0, #2
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #4
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	movs r0, #1
	bl FUN_02002B8C
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D630: .4byte 0x04001000
_0225D634: .4byte 0xFFCFFFEF
_0225D638: .4byte _0225DC2C
_0225D63C: .4byte 0x0225DC48
_0225D640: .4byte 0x0225DC64
_0225D644: .4byte 0xFFFF1FFF
_0225D648: .4byte ov30_0225D700
	thumb_func_end ov30_0225D520

	thumb_func_start ov30_0225D64C
ov30_0225D64C: @ 0x0225D64C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_0201F988
	ldr r7, _0225D6EC @ =0x0000007B
	adds r4, r0, #0
	movs r0, #0
	adds r1, r7, #0
	blx FS_LoadOverlay
	ldr r0, _0225D6F0 @ =ov30_0225DC28
	blx FUN_0225F4A8
	cmp r0, #0
	bne _0225D678
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bl FUN_0201AACC
_0225D678:
	ldr r0, [r4, #0x40]
	bl FUN_021F434C
	ldr r0, [r4, #0x40]
	bl FUN_021F43D0
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, _0225D6F4 @ =ov30_0225DC08
	blx FUN_0225F520
	cmp r0, #0
	beq _0225D69E
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bl FUN_0201AACC
_0225D69E:
	adds r0, r4, #0
	bl ov30_0225D830
	adds r0, r4, #0
	bl ov30_0225D86C
	adds r0, r6, #0
	bl FUN_02007234
	adds r0, r5, #0
	movs r1, #6
	bl FUN_0201BB4C
	adds r0, r5, #0
	movs r1, #5
	bl FUN_0201BB4C
	adds r0, r5, #0
	movs r1, #4
	bl FUN_0201BB4C
	movs r0, #8
	bl FUN_0201A9C4
	ldr r0, _0225D6F8 @ =ov30_0225DC18
	blx FUN_0225F610
	cmp r0, #0
	beq _0225D6E2
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bl FUN_0201AACC
_0225D6E2:
	movs r0, #0
	adds r1, r7, #0
	blx FS_UnloadOverlay
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225D6EC: .4byte 0x0000007B
_0225D6F0: .4byte ov30_0225DC28
_0225D6F4: .4byte ov30_0225DC08
_0225D6F8: .4byte ov30_0225DC18
	thumb_func_end ov30_0225D64C

	thumb_func_start ov30_0225D6FC
ov30_0225D6FC: @ 0x0225D6FC
	movs r0, #1
	bx lr
	thumb_func_end ov30_0225D6FC

	thumb_func_start ov30_0225D700
ov30_0225D700: @ 0x0225D700
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x1c]
	bl FUN_02050590
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	bne _0225D73E
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r1, [r1]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	cmp r1, #2
	bne _0225D736
	adds r1, r0, #0
	adds r1, #0xd2
	ldrb r2, [r1]
	movs r1, #0x3f
	adds r0, #0xd2
	bics r2, r1
	movs r1, #3
	orrs r1, r2
	strb r1, [r0]
	ldr r0, [r4, #0x40]
	bl FUN_021F434C
_0225D736:
	ldr r0, _0225D77C @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	pop {r4, pc}
_0225D73E:
	adds r0, #0xd2
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #2
	bne _0225D778
	ldr r1, [r4, #0xc]
	adds r0, r4, #0
	lsls r2, r1, #2
	ldr r1, _0225D780 @ =0x0225DCA0
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #1
	bne _0225D778
	ldr r2, [r4, #0x1c]
	adds r0, r2, #0
	adds r0, #0xd2
	ldrb r1, [r0]
	movs r0, #0x3f
	adds r2, #0xd2
	bics r1, r0
	movs r0, #3
	orrs r0, r1
	strb r0, [r2]
	movs r1, #0
	ldr r0, [r4, #0x1c]
	adds r2, r1, #0
	bl FUN_021F6A9C
_0225D778:
	pop {r4, pc}
	nop
_0225D77C: .4byte 0x04001050
_0225D780: .4byte 0x0225DCA0
	thumb_func_end ov30_0225D700

	thumb_func_start ov30_0225D784
ov30_0225D784: @ 0x0225D784
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _0225D82C @ =0x04001050
	movs r1, #0
	strh r1, [r0]
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0xe
	movs r1, #0x4c
	movs r3, #4
	bl FUN_020078F0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #4]
	movs r0, #0xe
	movs r1, #0x4d
	movs r3, #4
	bl FUN_02007914
	movs r0, #2
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #0xe
	movs r1, #0x4b
	movs r2, #4
	movs r3, #0
	bl FUN_02007938
	movs r0, #4
	movs r1, #0x80
	movs r2, #8
	bl FUN_02003030
	movs r0, #0x13
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	movs r0, #0x80
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0x4c
	movs r2, #5
	movs r3, #2
	bl FUN_0201D40C
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0xff
	bl FUN_0201D978
	ldr r0, [r4, #0x44]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	movs r1, #5
	ldr r0, [r4, #4]
	movs r2, #0xec
	adds r3, r1, #0
	bl FUN_0200E644
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_0225D82C: .4byte 0x04001050
	thumb_func_end ov30_0225D784

	thumb_func_start ov30_0225D830
ov30_0225D830: @ 0x0225D830
	ldr r3, _0225D838 @ =FUN_0201D520
	adds r0, #0x4c
	bx r3
	nop
_0225D838: .4byte FUN_0201D520
	thumb_func_end ov30_0225D830

	thumb_func_start ov30_0225D83C
ov30_0225D83C: @ 0x0225D83C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #8
	bl FUN_0200BD08
	str r0, [r4, #0x3c]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x28
	movs r3, #8
	bl FUN_0200BAF8
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02028E9C
	adds r2, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #0
	bl FUN_0200BE48
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225D83C

	thumb_func_start ov30_0225D86C
ov30_0225D86C: @ 0x0225D86C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	bl FUN_0200BB44
	ldr r0, [r4, #0x3c]
	bl FUN_0200BDA0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225D86C

	thumb_func_start ov30_0225D880
ov30_0225D880: @ 0x0225D880
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	ldr r0, [r4, #4]
	movs r1, #6
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	str r1, [sp, #4]
	movs r0, #0x1a
	add r2, sp, #0
	strb r0, [r2, #0x10]
	movs r0, #0xa
	strb r0, [r2, #0x11]
	ldrb r3, [r2, #0x12]
	movs r0, #0xf
	bics r3, r0
	strb r3, [r2, #0x12]
	ldrb r3, [r2, #0x12]
	movs r0, #0xf0
	bics r3, r0
	strb r3, [r2, #0x12]
	ldr r0, [r4, #4]
	bl FUN_0201CAE0
	movs r0, #4
	bl FUN_0201660C
	add r1, sp, #0
	str r0, [r4, #0x48]
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225D880

	thumb_func_start ov30_0225D8D4
ov30_0225D8D4: @ 0x0225D8D4
	movs r2, #2
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov30_0225D8D4

	thumb_func_start ov30_0225D8DC
ov30_0225D8DC: @ 0x0225D8DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	movs r1, #4
	movs r2, #5
	bl FUN_021F4360
	str r0, [r4, #0x40]
	bl FUN_021F42F8
	movs r0, #1
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov30_0225D8DC

	thumb_func_start ov30_0225D8F8
ov30_0225D8F8: @ 0x0225D8F8
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_02027500
	cmp r0, #0
	bne _0225D948
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #1
	movs r2, #0xec
	movs r3, #5
	bl FUN_0200E998
	ldr r0, [r4, #0x38]
	movs r1, #0x51
	bl FUN_0200BBA0
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x5c]
	adds r0, #0x4c
	movs r1, #1
	bl FUN_020200A8
	str r0, [r4, #0x60]
	adds r0, r4, #0
	movs r1, #3
	bl ov30_0225D8D4
	b _0225D94C
_0225D948:
	movs r0, #8
	str r0, [r4, #0xc]
_0225D94C:
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225D8F8

	thumb_func_start ov30_0225D954
ov30_0225D954: @ 0x0225D954
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x60]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_02020094
	cmp r0, #0
	bne _0225D970
	ldr r0, [r4, #0x5c]
	bl FUN_02026380
	ldr r0, [r4, #0x10]
	str r0, [r4, #0xc]
_0225D970:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov30_0225D954

	thumb_func_start ov30_0225D974
ov30_0225D974: @ 0x0225D974
	push {r4, lr}
	adds r4, r0, #0
	bl ov30_0225D880
	movs r0, #4
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov30_0225D974

	thumb_func_start ov30_0225D984
ov30_0225D984: @ 0x0225D984
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl FUN_02016748
	cmp r0, #1
	beq _0225D998
	cmp r0, #2
	beq _0225D9CA
	b _0225D9E8
_0225D998:
	ldr r0, [r4, #0x48]
	bl FUN_020169C0
	adds r1, r0, #0
	movs r0, #0x43
	ldr r2, [r4, #0x1c]
	lsls r0, r0, #2
	adds r0, r2, r0
	bl ov30_0225DC00
	ldr r0, [r4, #0x48]
	bl FUN_02016624
	ldr r0, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	bl FUN_020274E0
	cmp r0, #1
	bne _0225D9C4
	movs r0, #5
	str r0, [r4, #0xc]
	b _0225D9E8
_0225D9C4:
	movs r0, #0xa
	str r0, [r4, #0xc]
	b _0225D9E8
_0225D9CA:
	ldr r0, [r4, #0x48]
	bl FUN_020169C0
	adds r1, r0, #0
	movs r0, #0x43
	ldr r2, [r4, #0x1c]
	lsls r0, r0, #2
	adds r0, r2, r0
	bl ov30_0225DC00
	ldr r0, [r4, #0x48]
	bl FUN_02016624
	movs r0, #1
	pop {r4, pc}
_0225D9E8:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov30_0225D984

	thumb_func_start ov30_0225D9EC
ov30_0225D9EC: @ 0x0225D9EC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0xff
	bl FUN_0201D978
	ldr r0, [r4, #0x38]
	movs r1, #0x52
	bl FUN_0200BBA0
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x5c]
	adds r0, #0x4c
	movs r1, #1
	bl FUN_020200A8
	str r0, [r4, #0x60]
	adds r0, r4, #0
	movs r1, #6
	bl ov30_0225D8D4
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225D9EC

	thumb_func_start ov30_0225DA30
ov30_0225DA30: @ 0x0225DA30
	push {r4, lr}
	adds r4, r0, #0
	bl ov30_0225D880
	movs r0, #7
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov30_0225DA30

	thumb_func_start ov30_0225DA40
ov30_0225DA40: @ 0x0225DA40
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	bl FUN_02016748
	cmp r0, #1
	beq _0225DA54
	cmp r0, #2
	beq _0225DA74
	b _0225DA92
_0225DA54:
	ldr r0, [r4, #0x48]
	bl FUN_020169C0
	adds r1, r0, #0
	movs r0, #0x43
	ldr r2, [r4, #0x1c]
	lsls r0, r0, #2
	adds r0, r2, r0
	bl ov30_0225DC00
	ldr r0, [r4, #0x48]
	bl FUN_02016624
	movs r0, #0xa
	str r0, [r4, #0xc]
	b _0225DA92
_0225DA74:
	ldr r0, [r4, #0x48]
	bl FUN_020169C0
	adds r1, r0, #0
	movs r0, #0x43
	ldr r2, [r4, #0x1c]
	lsls r0, r0, #2
	adds r0, r2, r0
	bl ov30_0225DC00
	ldr r0, [r4, #0x48]
	bl FUN_02016624
	movs r0, #1
	pop {r4, pc}
_0225DA92:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225DA40

	thumb_func_start ov30_0225DA98
ov30_0225DA98: @ 0x0225DA98
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #1
	movs r2, #0xec
	movs r3, #5
	bl FUN_0200E998
	ldr r0, [r4, #0x38]
	movs r1, #0x14
	bl FUN_0200BBA0
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x5c]
	adds r0, #0x4c
	movs r1, #1
	bl FUN_020200A8
	str r0, [r4, #0x60]
	adds r0, r4, #0
	movs r1, #9
	bl ov30_0225D8D4
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225DA98

	thumb_func_start ov30_0225DAE0
ov30_0225DAE0: @ 0x0225DAE0
	movs r1, #0xf
	str r1, [r0, #0xc]
	movs r1, #0
	str r1, [r0, #0x14]
	adds r0, r1, #0
	bx lr
	thumb_func_end ov30_0225DAE0

	thumb_func_start ov30_0225DAEC
ov30_0225DAEC: @ 0x0225DAEC
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0xff
	bl FUN_0201D978
	ldr r0, [r4, #0x1c]
	bl FUN_021F2F70
	str r0, [r4, #0x68]
	adds r0, r4, #0
	bl ov30_0225DBF4
	cmp r0, #0
	ldr r0, [r4, #0x38]
	beq _0225DB16
	movs r1, #0x15
	bl FUN_0200BBA0
	b _0225DB1C
_0225DB16:
	movs r1, #0xf
	bl FUN_0200BBA0
_0225DB1C:
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x5c]
	adds r0, #0x4c
	movs r1, #1
	bl FUN_020200A8
	str r0, [r4, #0x60]
	adds r0, r4, #0
	movs r1, #0xb
	bl ov30_0225D8D4
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov30_0225DAEC

	thumb_func_start ov30_0225DB48
ov30_0225DB48: @ 0x0225DB48
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0xec
	bl FUN_0200F0AC
	str r0, [r4, #0x64]
	movs r0, #0xc
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225DB48

	thumb_func_start ov30_0225DB60
ov30_0225DB60: @ 0x0225DB60
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl FUN_021F43E8
	movs r0, #0xd
	str r0, [r4, #0xc]
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov30_0225DB60

	thumb_func_start ov30_0225DB74
ov30_0225DB74: @ 0x0225DB74
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x68]
	bl FUN_021F2FF0
	ldr r0, [r4, #0x64]
	bl FUN_0200F450
	adds r0, r4, #0
	adds r0, #0x4c
	movs r1, #0xff
	bl FUN_0201D978
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x38]
	movs r2, #0x10
	movs r3, #8
	bl FUN_0200BC4C
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	bl FUN_0202AD3C
	movs r3, #0
	str r3, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	adds r0, r4, #0
	ldr r2, [r4, #0x5c]
	adds r0, #0x4c
	movs r1, #1
	bl FUN_020200A8
	str r0, [r4, #0x60]
	adds r0, r4, #0
	movs r1, #0xe
	bl ov30_0225D8D4
	movs r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov30_0225DB74

	thumb_func_start ov30_0225DBC8
ov30_0225DBC8: @ 0x0225DBC8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0225DBDC @ =0x0000061A
	bl FUN_0200604C
	movs r0, #0xf
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x14]
	pop {r4, pc}
	.align 2, 0
_0225DBDC: .4byte 0x0000061A
	thumb_func_end ov30_0225DBC8

	thumb_func_start ov30_0225DBE0
ov30_0225DBE0: @ 0x0225DBE0
	ldr r1, [r0, #0x14]
	adds r1, r1, #1
	str r1, [r0, #0x14]
	cmp r1, #0x1e
	ble _0225DBEE
	movs r0, #1
	bx lr
_0225DBEE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov30_0225DBE0

	thumb_func_start ov30_0225DBF4
ov30_0225DBF4: @ 0x0225DBF4
	ldr r0, [r0, #0x1c]
	ldr r3, _0225DBFC @ =FUN_02027520
	ldr r0, [r0, #0xc]
	bx r3
	.align 2, 0
_0225DBFC: .4byte FUN_02027520
	thumb_func_end ov30_0225DBF4

	thumb_func_start ov30_0225DC00
ov30_0225DC00: @ 0x0225DC00
	ldr r3, _0225DC04 @ =FUN_02018410
	bx r3
	.align 2, 0
_0225DC04: .4byte FUN_02018410
	thumb_func_end ov30_0225DC00

	thumb_func_start ov30_0225DC08
ov30_0225DC08: @ 0x0225DC08
	ldr r3, _0225DC14 @ =FUN_0201AACC
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bx r3
	nop
_0225DC14: .4byte FUN_0201AACC
	thumb_func_end ov30_0225DC08

	thumb_func_start ov30_0225DC18
ov30_0225DC18: @ 0x0225DC18
	ldr r3, _0225DC24 @ =FUN_0201AACC
	movs r1, #0xfa
	movs r0, #3
	lsls r1, r1, #2
	bx r3
	nop
_0225DC24: .4byte FUN_0201AACC
	thumb_func_end ov30_0225DC18

	thumb_func_start ov30_0225DC28
ov30_0225DC28: @ 0x0225DC28
	bx lr
	.align 2, 0
	thumb_func_end ov30_0225DC28

	.rodata

_0225DC2C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0D, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0C, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

	.byte 0xDD, 0xD8, 0x25, 0x02, 0xF9, 0xD8, 0x25, 0x02, 0x55, 0xD9, 0x25, 0x02, 0x75, 0xD9, 0x25, 0x02
	.byte 0x85, 0xD9, 0x25, 0x02, 0xED, 0xD9, 0x25, 0x02, 0x31, 0xDA, 0x25, 0x02, 0x41, 0xDA, 0x25, 0x02
	.byte 0x99, 0xDA, 0x25, 0x02, 0xE1, 0xDA, 0x25, 0x02, 0xED, 0xDA, 0x25, 0x02, 0x49, 0xDB, 0x25, 0x02
	.byte 0x61, 0xDB, 0x25, 0x02, 0x75, 0xDB, 0x25, 0x02, 0xC9, 0xDB, 0x25, 0x02, 0xE1, 0xDB, 0x25, 0x02
_0225DCE0:
	@ 0x0225DCE0
