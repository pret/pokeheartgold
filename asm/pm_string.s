	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6338:
	.byte 0xA2, 0x00, 0xA3, 0x00, 0xA4, 0x00, 0xA5, 0x00
	.byte 0xA6, 0x00, 0xA7, 0x00, 0xA8, 0x00, 0xA9, 0x00, 0xAA, 0x00, 0xAB, 0x00
_020F634C:
	.byte 0x21, 0x01, 0x22, 0x01
	.byte 0x23, 0x01, 0x24, 0x01, 0x25, 0x01, 0x26, 0x01, 0x27, 0x01, 0x28, 0x01, 0x29, 0x01, 0x2A, 0x01
_020F6360:
	.byte 0x21, 0x01, 0x22, 0x01, 0x23, 0x01, 0x24, 0x01, 0x25, 0x01, 0x26, 0x01, 0x27, 0x01, 0x28, 0x01
	.byte 0x29, 0x01, 0x2A, 0x01
_020F6374:
	.byte 0xA2, 0x00, 0xA3, 0x00, 0xA4, 0x00, 0xA5, 0x00, 0xA6, 0x00, 0xA7, 0x00
	.byte 0xA8, 0x00, 0xA9, 0x00
_020F6384:
	.byte 0xAA, 0x00, 0xAB, 0x00, 0x01, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0x10, 0x27, 0x00, 0x00, 0xA0, 0x86, 0x01, 0x00
	.byte 0x40, 0x42, 0x0F, 0x00, 0x80, 0x96, 0x98, 0x00
_020F63A8:
	.byte 0x00, 0xE1, 0xF5, 0x05, 0x00, 0xCA, 0x9A, 0x3B
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x86, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x42, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x96, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE1, 0xF5, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCA, 0x9A, 0x3B, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE4, 0x0B, 0x54, 0x02, 0x00, 0x00, 0x00, 0x00, 0xE8, 0x76, 0x48, 0x17, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0xA5, 0xD4, 0xE8, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x72, 0x4E, 0x18, 0x09, 0x00, 0x00
	.byte 0x00, 0x40, 0x7A, 0x10, 0xF3, 0x5A, 0x00, 0x00, 0x00, 0x80, 0xC6, 0xA4, 0x7E, 0x8D, 0x03, 0x00
	.byte 0x00, 0x00, 0xC1, 0x6F, 0xF2, 0x86, 0x23, 0x00, 0x00, 0x00, 0x8A, 0x5D, 0x78, 0x45, 0x63, 0x01
	.byte 0x00, 0x00, 0x64, 0xA7, 0xB3, 0xB6, 0xE0, 0x0D, 0x00, 0x00, 0xE8, 0x89, 0x04, 0x23, 0xC7, 0x8A

	.text

	thumb_func_start String_ctor
String_ctor: ; 0x02026354
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	lsl r1, r4, #1
	add r1, #0xa
	bl AllocFromHeap
	cmp r0, #0
	beq _02026374
	ldr r1, _02026378 ; =0xB6F8D2EC
	str r1, [r0, #4]
	strh r4, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	ldr r1, _0202637C ; =0x0000FFFF
	strh r1, [r0, #8]
_02026374:
	pop {r4, pc}
	nop
_02026378: .word 0xB6F8D2EC
_0202637C: .word 0x0000FFFF
	thumb_func_end String_ctor

	thumb_func_start String_dtor
String_dtor: ; 0x02026380
	push {r4, lr}
	add r4, r0, #0
	bne _0202638A
	bl GF_AssertFail
_0202638A:
	ldr r1, [r4, #4]
	ldr r0, _020263A4 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026396
	bl GF_AssertFail
_02026396:
	ldr r0, _020263A8 ; =0xB6F8D2ED
	str r0, [r4, #4]
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	nop
_020263A4: .word 0xB6F8D2EC
_020263A8: .word 0xB6F8D2ED
	thumb_func_end String_dtor

	thumb_func_start StringSetEmpty
StringSetEmpty: ; 0x020263AC
	push {r4, lr}
	add r4, r0, #0
	bne _020263B6
	bl GF_AssertFail
_020263B6:
	ldr r1, [r4, #4]
	ldr r0, _020263CC ; =0xB6F8D2EC
	cmp r1, r0
	beq _020263C2
	bl GF_AssertFail
_020263C2:
	mov r0, #0
	strh r0, [r4, #2]
	ldr r0, _020263D0 ; =0x0000FFFF
	strh r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
_020263CC: .word 0xB6F8D2EC
_020263D0: .word 0x0000FFFF
	thumb_func_end StringSetEmpty

	thumb_func_start StringCopy
StringCopy: ; 0x020263D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020263E2
	bl GF_AssertFail
_020263E2:
	ldr r1, [r5, #4]
	ldr r0, _02026428 ; =0xB6F8D2EC
	cmp r1, r0
	beq _020263EE
	bl GF_AssertFail
_020263EE:
	cmp r4, #0
	bne _020263F6
	bl GF_AssertFail
_020263F6:
	ldr r1, [r4, #4]
	ldr r0, _02026428 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026402
	bl GF_AssertFail
_02026402:
	ldrh r2, [r4, #2]
	ldrh r0, [r5]
	cmp r0, r2
	bls _02026420
	add r0, r5, #0
	add r1, r4, #0
	add r2, r2, #1
	add r0, #8
	add r1, #8
	lsl r2, r2, #1
	bl memcpy
	ldrh r0, [r4, #2]
	strh r0, [r5, #2]
	pop {r3, r4, r5, pc}
_02026420:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_02026428: .word 0xB6F8D2EC
	thumb_func_end StringCopy

	thumb_func_start StringDup
StringDup: ; 0x0202642C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202643A
	bl GF_AssertFail
_0202643A:
	ldr r1, [r5, #4]
	ldr r0, _02026460 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026446
	bl GF_AssertFail
_02026446:
	ldrh r0, [r5, #2]
	add r1, r4, #0
	add r0, r0, #1
	bl String_ctor
	add r4, r0, #0
	beq _0202645A
	add r1, r5, #0
	bl StringCopy
_0202645A:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02026460: .word 0xB6F8D2EC
	thumb_func_end StringDup

	thumb_func_start String16_FormatInteger
String16_FormatInteger: ; 0x02026464
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [sp, #0x20]
	add r6, r1, #0
	add r7, r3, #0
	str r2, [sp]
	str r0, [sp, #0x20]
	cmp r5, #0
	bne _0202647C
	bl GF_AssertFail
_0202647C:
	ldr r1, [r5, #4]
	ldr r0, _0202657C ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026488
	bl GF_AssertFail
_02026488:
	cmp r6, #0
	bge _02026490
	mov r4, #1
	b _02026492
_02026490:
	mov r4, #0
_02026492:
	ldr r0, [sp]
	ldrh r1, [r5]
	add r0, r0, r4
	cmp r1, r0
	bls _02026574
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _020264A8
	ldr r0, _02026580 ; =0x020F6374
	str r0, [sp, #4]
	b _020264AC
_020264A8:
	ldr r0, _02026584 ; =0x020F6360
	str r0, [sp, #4]
_020264AC:
	add r0, r5, #0
	bl StringSetEmpty
	cmp r4, #0
	beq _020264D4
	mov r0, #0
	mvn r0, r0
	mul r6, r0
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _020264C6
	mov r0, #0xf1
	b _020264C8
_020264C6:
	ldr r0, _02026588 ; =0x000001BE
_020264C8:
	ldrh r2, [r5, #2]
	add r1, r2, #1
	strh r1, [r5, #2]
	lsl r1, r2, #1
	add r1, r5, r1
	strh r0, [r1, #8]
_020264D4:
	ldr r0, [sp]
	lsl r1, r0, #2
	ldr r0, _0202658C ; =0x020F6384
	ldr r4, [r0, r1]
	cmp r4, #0
	beq _02026566
_020264E0:
	add r0, r6, #0
	add r1, r4, #0
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	mul r0, r1
	sub r6, r6, r0
	cmp r7, #2
	bne _02026514
	cmp r1, #0xa
	bhs _02026502
	ldr r0, [sp, #4]
	lsl r1, r1, #1
	ldrh r1, [r0, r1]
	b _02026504
_02026502:
	mov r1, #0xe2
_02026504:
	ldrh r0, [r5, #2]
	add r2, r0, #0
	add r2, r2, #1
	lsl r0, r0, #1
	strh r2, [r5, #2]
	add r0, r5, r0
	strh r1, [r0, #8]
	b _0202655A
_02026514:
	cmp r1, #0
	bne _0202651C
	cmp r4, #1
	bne _0202653C
_0202651C:
	mov r7, #2
	cmp r1, #0xa
	bhs _0202652A
	ldr r0, [sp, #4]
	lsl r1, r1, #1
	ldrh r1, [r0, r1]
	b _0202652C
_0202652A:
	mov r1, #0xe2
_0202652C:
	ldrh r0, [r5, #2]
	add r2, r0, #0
	add r2, r2, #1
	lsl r0, r0, #1
	strh r2, [r5, #2]
	add r0, r5, r0
	strh r1, [r0, #8]
	b _0202655A
_0202653C:
	cmp r7, #1
	bne _0202655A
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0202654A
	mov r1, #1
	b _0202654C
_0202654A:
	ldr r1, _02026590 ; =0x000001E2
_0202654C:
	ldrh r0, [r5, #2]
	add r2, r0, #0
	add r2, r2, #1
	lsl r0, r0, #1
	strh r2, [r5, #2]
	add r0, r5, r0
	strh r1, [r0, #8]
_0202655A:
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	bne _020264E0
_02026566:
	ldrh r0, [r5, #2]
	ldr r1, _02026594 ; =0x0000FFFF
	add sp, #8
	lsl r0, r0, #1
	add r0, r5, r0
	strh r1, [r0, #8]
	pop {r3, r4, r5, r6, r7, pc}
_02026574:
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202657C: .word 0xB6F8D2EC
_02026580: .word 0x020F6374
_02026584: .word 0x020F6360
_02026588: .word 0x000001BE
_0202658C: .word 0x020F6384
_02026590: .word 0x000001E2
_02026594: .word 0x0000FFFF
	thumb_func_end String16_FormatInteger

	thumb_func_start String16_FormatUnsignedLongLong
String16_FormatUnsignedLongLong: ; 0x02026598
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [sp, #0x28]
	add r4, r3, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	str r1, [sp]
	str r2, [sp, #4]
	str r0, [sp, #0x2c]
	cmp r5, #0
	bne _020265B4
	bl GF_AssertFail
_020265B4:
	ldr r1, [r5, #4]
	ldr r0, _020266E4 ; =0xB6F8D2EC
	cmp r1, r0
	beq _020265C0
	bl GF_AssertFail
_020265C0:
	ldrh r0, [r5]
	cmp r0, r4
	bhi _020265C8
	b _020266DC
_020265C8:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _020265D4
	ldr r0, _020266E8 ; =0x020F6338
	str r0, [sp, #0x10]
	b _020265D8
_020265D4:
	ldr r0, _020266EC ; =0x020F634C
	str r0, [sp, #0x10]
_020265D8:
	add r0, r5, #0
	bl StringSetEmpty
	ldr r1, _020266F0 ; =0x020F63A8
	lsl r2, r4, #3
	add r0, r1, r2
	ldr r6, [r1, r2]
	ldr r0, [r0, #4]
	mov r1, #0
	str r0, [sp, #0xc]
	eor r1, r0
	mov r2, #0
	add r0, r6, #0
	eor r0, r2
	orr r0, r1
	beq _020266CE
_020265F8:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	ldr r3, [sp, #0xc]
	add r2, r6, #0
	bl _ll_udiv
	add r4, r0, #0
	add r7, r1, #0
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	add r2, r4, #0
	add r3, r7, #0
	bl _ll_mul
	ldr r2, [sp]
	sub r0, r2, r0
	str r0, [sp]
	ldr r0, [sp, #4]
	sbc r0, r1
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	cmp r0, #2
	bne _0202664A
	mov r1, #0
	mov r0, #0xa
	sub r0, r4, r0
	sbc r7, r1
	bhs _02026638
	ldr r0, [sp, #0x10]
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	b _0202663A
_02026638:
	mov r0, #0xe2
_0202663A:
	ldrh r2, [r5, #2]
	add r1, r2, #0
	add r1, r1, #1
	strh r1, [r5, #2]
	lsl r1, r2, #1
	add r1, r5, r1
	strh r0, [r1, #8]
	b _020266AE
_0202664A:
	mov r1, #0
	mov r0, #0
	eor r1, r7
	eor r0, r4
	orr r0, r1
	bne _02026666
	ldr r0, [sp, #0xc]
	mov r1, #0
	eor r1, r0
	mov r2, #1
	add r0, r6, #0
	eor r0, r2
	orr r0, r1
	bne _0202668E
_02026666:
	mov r0, #2
	str r0, [sp, #0x28]
	mov r1, #0
	mov r0, #0xa
	sub r0, r4, r0
	sbc r7, r1
	bhs _0202667C
	ldr r0, [sp, #0x10]
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	b _0202667E
_0202667C:
	mov r0, #0xe2
_0202667E:
	ldrh r2, [r5, #2]
	add r1, r2, #0
	add r1, r1, #1
	strh r1, [r5, #2]
	lsl r1, r2, #1
	add r1, r5, r1
	strh r0, [r1, #8]
	b _020266AE
_0202668E:
	ldr r0, [sp, #0x28]
	cmp r0, #1
	bne _020266AE
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _0202669E
	mov r0, #1
	b _020266A0
_0202669E:
	ldr r0, _020266F4 ; =0x000001DE
_020266A0:
	ldrh r2, [r5, #2]
	add r1, r2, #0
	add r1, r1, #1
	strh r1, [r5, #2]
	lsl r1, r2, #1
	add r1, r5, r1
	strh r0, [r1, #8]
_020266AE:
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	str r1, [sp, #0xc]
	add r6, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, #0
	eor r1, r0
	mov r2, #0
	add r0, r6, #0
	eor r0, r2
	orr r0, r1
	bne _020265F8
_020266CE:
	ldrh r0, [r5, #2]
	ldr r1, _020266F8 ; =0x0000FFFF
	add sp, #0x14
	lsl r0, r0, #1
	add r0, r5, r0
	strh r1, [r0, #8]
	pop {r4, r5, r6, r7, pc}
_020266DC:
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020266E4: .word 0xB6F8D2EC
_020266E8: .word 0x020F6338
_020266EC: .word 0x020F634C
_020266F0: .word 0x020F63A8
_020266F4: .word 0x000001DE
_020266F8: .word 0x0000FFFF
	thumb_func_end String16_FormatUnsignedLongLong

	thumb_func_start String_atoi
String_atoi: ; 0x020266FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	add r5, r1, #0
	ldrh r1, [r0, #2]
	mov r7, #1
	cmp r1, #0x12
	bls _0202671A
	ldr r0, [sp, #8]
	add sp, #0x10
	add r1, r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202671A:
	sub r1, r1, #1
	str r1, [sp, #4]
	bmi _02026790
	lsl r1, r1, #1
	add r4, r0, r1
_02026724:
	ldrh r6, [r4, #8]
	mov r3, #0xa
	mov r0, #0
	add r1, r6, #0
	sub r1, #0xa2
	asr r2, r1, #0x1f
	sub r3, r1, r3
	mov ip, r2
	mov r3, ip
	sbc r3, r0
	blo _0202675C
	ldr r0, _020267A0 ; =0x00000121
	mov r3, #0xa
	sub r1, r6, r0
	asr r2, r1, #0x1f
	mov r0, #0
	sub r3, r1, r3
	mov ip, r2
	mov r3, ip
	sbc r3, r0
	blo _0202675C
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0202675C:
	add r0, r1, #0
	add r1, r2, #0
	add r2, r7, #0
	add r3, r5, #0
	bl _ll_mul
	add r2, r1, #0
	ldr r1, [sp, #8]
	add r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	adc r0, r2
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #0xa
	mov r3, #0
	bl _ll_mul
	add r7, r0, #0
	ldr r0, [sp, #4]
	add r5, r1, #0
	sub r4, r4, #2
	sub r0, r0, #1
	str r0, [sp, #4]
	bpl _02026724
_02026790:
	ldr r0, [sp]
	mov r1, #1
	str r1, [r0]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020267A0: .word 0x00000121
	thumb_func_end String_atoi

	thumb_func_start StringCompare
StringCompare: ; 0x020267A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020267B2
	bl GF_AssertFail
_020267B2:
	ldr r1, [r5, #4]
	ldr r0, _020267F8 ; =0xB6F8D2EC
	cmp r1, r0
	beq _020267BE
	bl GF_AssertFail
_020267BE:
	cmp r4, #0
	bne _020267C6
	bl GF_AssertFail
_020267C6:
	ldr r1, [r4, #4]
	ldr r0, _020267F8 ; =0xB6F8D2EC
	cmp r1, r0
	beq _020267D2
	bl GF_AssertFail
_020267D2:
	ldrh r1, [r5, #8]
	ldrh r0, [r4, #8]
	cmp r1, r0
	bne _020267F2
	ldr r0, _020267FC ; =0x0000FFFF
_020267DC:
	ldrh r1, [r5, #8]
	cmp r1, r0
	bne _020267E6
	mov r0, #0
	pop {r3, r4, r5, pc}
_020267E6:
	add r5, r5, #2
	add r4, r4, #2
	ldrh r2, [r5, #8]
	ldrh r1, [r4, #8]
	cmp r2, r1
	beq _020267DC
_020267F2:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_020267F8: .word 0xB6F8D2EC
_020267FC: .word 0x0000FFFF
	thumb_func_end StringCompare

	thumb_func_start StringGetLength
StringGetLength: ; 0x02026800
	push {r4, lr}
	add r4, r0, #0
	bne _0202680A
	bl GF_AssertFail
_0202680A:
	ldr r1, [r4, #4]
	ldr r0, _0202681C ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026816
	bl GF_AssertFail
_02026816:
	ldrh r0, [r4, #2]
	pop {r4, pc}
	nop
_0202681C: .word 0xB6F8D2EC
	thumb_func_end StringGetLength

	thumb_func_start StringCountLines
StringCountLines: ; 0x02026820
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bne _0202682A
	bl GF_AssertFail
_0202682A:
	ldr r1, [r4, #4]
	ldr r0, _0202685C ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026836
	bl GF_AssertFail
_02026836:
	ldrh r1, [r4, #2]
	mov r3, #0
	mov r0, #1
	cmp r1, #0
	ble _02026858
	mov r1, #0xe
	add r5, r4, #0
	lsl r1, r1, #0xc
_02026846:
	ldrh r2, [r5, #8]
	cmp r2, r1
	bne _0202684E
	add r0, r0, #1
_0202684E:
	ldrh r2, [r4, #2]
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, r2
	blt _02026846
_02026858:
	pop {r3, r4, r5, pc}
	nop
_0202685C: .word 0xB6F8D2EC
	thumb_func_end StringCountLines

	thumb_func_start StringGetLineN
StringGetLineN: ; 0x02026860
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r6, r2, #0
	cmp r5, #0
	bne _02026870
	bl GF_AssertFail
_02026870:
	ldr r1, [r5, #4]
	ldr r0, _020268E8 ; =0xB6F8D2EC
	cmp r1, r0
	beq _0202687C
	bl GF_AssertFail
_0202687C:
	cmp r7, #0
	bne _02026884
	bl GF_AssertFail
_02026884:
	ldr r1, [r7, #4]
	ldr r0, _020268E8 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026890
	bl GF_AssertFail
_02026890:
	mov r4, #0
	cmp r6, #0
	beq _020268BA
	ldrh r0, [r5, #2]
	cmp r0, #0
	ble _020268BA
	mov r1, #0xe
	add r0, r5, #0
	lsl r1, r1, #0xc
_020268A2:
	ldrh r2, [r0, #8]
	cmp r2, r1
	bne _020268B0
	sub r6, r6, #1
	bne _020268B0
	add r4, r4, #1
	b _020268BA
_020268B0:
	ldrh r2, [r5, #2]
	add r4, r4, #1
	add r0, r0, #2
	cmp r4, r2
	blt _020268A2
_020268BA:
	add r0, r7, #0
	bl StringSetEmpty
	ldrh r0, [r5, #2]
	cmp r4, r0
	bge _020268E4
	lsl r0, r4, #1
	add r6, r5, r0
_020268CA:
	ldrh r1, [r6, #8]
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r1, r0
	beq _020268E4
	add r0, r7, #0
	bl StrAddChar
	ldrh r0, [r5, #2]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, r0
	blt _020268CA
_020268E4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020268E8: .word 0xB6F8D2EC
	thumb_func_end StringGetLineN

	thumb_func_start String_RadioAddStatic
String_RadioAddStatic: ; 0x020268EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	add r6, r0, #0
	ldr r1, _02026990 ; =0x000001AF
	mov r0, #0
	bl FontI_GetGlyphWidth
	str r0, [sp, #8]
	ldr r1, _02026994 ; =0x000001EB
	mov r0, #0
	bl FontI_GetGlyphWidth
	mov r1, #0x7b
	str r0, [sp, #4]
	mov r0, #0
	lsl r1, r1, #2
	bl FontI_GetGlyphWidth
	str r0, [sp]
	cmp r6, #0
	bne _0202691C
	bl GF_AssertFail
_0202691C:
	ldr r1, [r6, #4]
	ldr r0, _02026998 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026928
	bl GF_AssertFail
_02026928:
	add r0, r6, #0
	bl StringGetLength
	ldrh r0, [r6, #2]
	mov r4, #0
	sub r0, r0, #1
	cmp r0, #0
	ble _0202698A
	add r5, r6, #0
_0202693A:
	ldrh r1, [r5, #8]
	ldr r0, _0202699C ; =0x000001DE
	cmp r1, r0
	beq _0202697E
	bl MTRandom
	lsr r0, r0, #8
	mov r1, #0x65
	bl _u32_div_f
	cmp r1, r7
	bhs _0202697E
	ldrh r1, [r5, #8]
	mov r0, #0
	bl FontI_GetGlyphWidth
	ldr r1, [sp, #8]
	cmp r0, r1
	blo _02026966
	ldr r0, _02026990 ; =0x000001AF
	strh r0, [r5, #8]
	b _0202697E
_02026966:
	ldr r1, [sp]
	cmp r0, r1
	blo _02026974
	mov r0, #0x7b
	lsl r0, r0, #2
	strh r0, [r5, #8]
	b _0202697E
_02026974:
	ldr r1, [sp, #4]
	cmp r0, r1
	blo _0202697E
	ldr r0, _02026994 ; =0x000001EB
	strh r0, [r5, #8]
_0202697E:
	ldrh r0, [r6, #2]
	add r4, r4, #1
	add r5, r5, #2
	sub r0, r0, #1
	cmp r4, r0
	blt _0202693A
_0202698A:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02026990: .word 0x000001AF
_02026994: .word 0x000001EB
_02026998: .word 0xB6F8D2EC
_0202699C: .word 0x000001DE
	thumb_func_end String_RadioAddStatic

	thumb_func_start CopyU16ArrayToString
CopyU16ArrayToString: ; 0x020269A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _020269AE
	bl GF_AssertFail
_020269AE:
	ldr r1, [r5, #4]
	ldr r0, _020269FC ; =0xB6F8D2EC
	cmp r1, r0
	beq _020269BA
	bl GF_AssertFail
_020269BA:
	mov r0, #0
	strh r0, [r5, #2]
	ldrh r1, [r4]
	ldr r0, _02026A00 ; =0x0000FFFF
	cmp r1, r0
	beq _020269EE
	add r1, r0, #0
_020269C8:
	ldrh r2, [r5]
	ldrh r0, [r5, #2]
	sub r2, r2, #1
	cmp r0, r2
	blt _020269D8
	bl GF_AssertFail
	b _020269EE
_020269D8:
	add r2, r0, #0
	add r2, r2, #1
	strh r2, [r5, #2]
	ldrh r2, [r4]
	lsl r0, r0, #1
	add r0, r5, r0
	add r4, r4, #2
	strh r2, [r0, #8]
	ldrh r0, [r4]
	cmp r0, r1
	bne _020269C8
_020269EE:
	ldrh r0, [r5, #2]
	ldr r1, _02026A00 ; =0x0000FFFF
	lsl r0, r0, #1
	add r0, r5, r0
	strh r1, [r0, #8]
	pop {r3, r4, r5, pc}
	nop
_020269FC: .word 0xB6F8D2EC
_02026A00: .word 0x0000FFFF
	thumb_func_end CopyU16ArrayToString

	thumb_func_start CopyU16ArrayToStringN
CopyU16ArrayToStringN: ; 0x02026A04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02026A14
	bl GF_AssertFail
_02026A14:
	ldr r1, [r5, #4]
	ldr r0, _02026A60 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026A20
	bl GF_AssertFail
_02026A20:
	ldrh r0, [r5]
	cmp r4, r0
	bhi _02026A5A
	lsl r6, r4, #1
	add r0, r5, #0
	add r0, #8
	add r1, r7, #0
	add r2, r6, #0
	bl memcpy
	mov r2, #0
	cmp r4, #0
	bls _02026A4C
	ldr r0, _02026A64 ; =0x0000FFFF
	add r3, r5, #0
_02026A3E:
	ldrh r1, [r3, #8]
	cmp r1, r0
	beq _02026A4C
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, r4
	blo _02026A3E
_02026A4C:
	strh r2, [r5, #2]
	cmp r2, r4
	bne _02026A5E
	ldr r1, _02026A64 ; =0x0000FFFF
	add r0, r5, r6
	strh r1, [r0, #6]
	pop {r3, r4, r5, r6, r7, pc}
_02026A5A:
	bl GF_AssertFail
_02026A5E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02026A60: .word 0xB6F8D2EC
_02026A64: .word 0x0000FFFF
	thumb_func_end CopyU16ArrayToStringN

	thumb_func_start CopyStringToU16Array
CopyStringToU16Array: ; 0x02026A68
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02026A78
	bl GF_AssertFail
_02026A78:
	ldr r1, [r5, #4]
	ldr r0, _02026AA0 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026A84
	bl GF_AssertFail
_02026A84:
	ldrh r0, [r5, #2]
	add r2, r0, #1
	cmp r2, r4
	bhi _02026A9A
	add r5, #8
	add r0, r6, #0
	add r1, r5, #0
	lsl r2, r2, #1
	bl memcpy
	pop {r4, r5, r6, pc}
_02026A9A:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02026AA0: .word 0xB6F8D2EC
	thumb_func_end CopyStringToU16Array

	thumb_func_start String_c_str
String_c_str: ; 0x02026AA4
	push {r4, lr}
	add r4, r0, #0
	bne _02026AAE
	bl GF_AssertFail
_02026AAE:
	ldr r1, [r4, #4]
	ldr r0, _02026AC0 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026ABA
	bl GF_AssertFail
_02026ABA:
	add r4, #8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02026AC0: .word 0xB6F8D2EC
	thumb_func_end String_c_str

	thumb_func_start StringCat
StringCat: ; 0x02026AC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02026AD2
	bl GF_AssertFail
_02026AD2:
	ldr r1, [r5, #4]
	ldr r0, _02026B24 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026ADE
	bl GF_AssertFail
_02026ADE:
	cmp r4, #0
	bne _02026AE6
	bl GF_AssertFail
_02026AE6:
	ldr r1, [r4, #4]
	ldr r0, _02026B24 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026AF2
	bl GF_AssertFail
_02026AF2:
	ldrh r2, [r4, #2]
	ldrh r0, [r5, #2]
	add r1, r0, r2
	add r3, r1, #1
	ldrh r1, [r5]
	cmp r3, r1
	bgt _02026B1E
	add r1, r5, #0
	add r1, #8
	lsl r0, r0, #1
	add r0, r1, r0
	add r1, r4, #0
	add r2, r2, #1
	add r1, #8
	lsl r2, r2, #1
	bl memcpy
	ldrh r1, [r5, #2]
	ldrh r0, [r4, #2]
	add r0, r1, r0
	strh r0, [r5, #2]
	pop {r3, r4, r5, pc}
_02026B1E:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02026B24: .word 0xB6F8D2EC
	thumb_func_end StringCat

	thumb_func_start StrAddChar
StrAddChar: ; 0x02026B28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02026B36
	bl GF_AssertFail
_02026B36:
	ldr r1, [r5, #4]
	ldr r0, _02026B68 ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026B42
	bl GF_AssertFail
_02026B42:
	ldrh r2, [r5, #2]
	ldrh r0, [r5]
	add r1, r2, #1
	cmp r1, r0
	bge _02026B60
	lsl r0, r2, #1
	strh r1, [r5, #2]
	add r0, r5, r0
	strh r4, [r0, #8]
	ldrh r0, [r5, #2]
	ldr r1, _02026B6C ; =0x0000FFFF
	lsl r0, r0, #1
	add r0, r5, r0
	strh r1, [r0, #8]
	pop {r3, r4, r5, pc}
_02026B60:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_02026B68: .word 0xB6F8D2EC
_02026B6C: .word 0x0000FFFF
	thumb_func_end StrAddChar

	thumb_func_start StringIsTrainerName
StringIsTrainerName: ; 0x02026B70
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _02026B84
	ldrh r1, [r0, #8]
	mov r0, #0xf1
	lsl r0, r0, #8
	cmp r1, r0
	bne _02026B84
	mov r0, #1
	bx lr
_02026B84:
	mov r0, #0
	bx lr
	thumb_func_end StringIsTrainerName

	thumb_func_start StringCat_HandleTrainerName
StringCat_HandleTrainerName: ; 0x02026B88
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	str r0, [sp]
	add r0, r4, #0
	bl StringIsTrainerName
	cmp r0, #0
	beq _02026BF2
	ldr r0, [sp]
	ldr r1, [sp]
	ldrh r0, [r0, #2]
	add r1, #8
	ldr r7, _02026BFC ; =0x000001FF
	lsl r0, r0, #1
	add r3, r1, r0
	mov r0, #0
	add r4, #0xa
	add r1, r0, #0
_02026BAC:
	ldrh r2, [r4]
	asr r2, r0
	and r2, r7
	lsl r2, r2, #0x10
	add r0, #9
	lsr r2, r2, #0x10
	cmp r0, #0xf
	blt _02026BD4
	add r4, r4, #2
	sub r0, #0xf
	beq _02026BD4
	ldrh r6, [r4]
	mov r5, #9
	sub r5, r5, r0
	lsl r6, r5
	ldr r5, _02026BFC ; =0x000001FF
	and r5, r6
	orr r2, r5
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
_02026BD4:
	ldr r5, _02026BFC ; =0x000001FF
	cmp r2, r5
	beq _02026BE2
	strh r2, [r3]
	add r3, r3, #2
	add r1, r1, #1
	b _02026BAC
_02026BE2:
	ldr r0, _02026C00 ; =0x0000FFFF
	strh r0, [r3]
	ldr r0, [sp]
	ldrh r0, [r0, #2]
	add r1, r0, r1
	ldr r0, [sp]
	strh r1, [r0, #2]
	pop {r3, r4, r5, r6, r7, pc}
_02026BF2:
	ldr r0, [sp]
	add r1, r4, #0
	bl StringCat
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02026BFC: .word 0x000001FF
_02026C00: .word 0x0000FFFF
	thumb_func_end StringCat_HandleTrainerName

	thumb_func_start StrUpperFirstChar
StrUpperFirstChar: ; 0x02026C04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02026C12
	bl GF_AssertFail
_02026C12:
	ldr r1, [r5, #4]
	ldr r0, _02026C3C ; =0xB6F8D2EC
	cmp r1, r0
	beq _02026C1E
	bl GF_AssertFail
_02026C1E:
	ldrh r0, [r5, #2]
	cmp r0, r4
	ble _02026C3A
	add r5, #8
	lsl r2, r4, #1
	ldrh r1, [r5, r2]
	ldr r0, _02026C40 ; =0x00000145
	cmp r1, r0
	blo _02026C3A
	add r0, #0x19
	cmp r1, r0
	bhi _02026C3A
	sub r1, #0x1a
	strh r1, [r5, r2]
_02026C3A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02026C3C: .word 0xB6F8D2EC
_02026C40: .word 0x00000145
	thumb_func_end StrUpperFirstChar
