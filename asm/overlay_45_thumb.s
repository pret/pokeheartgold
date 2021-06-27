	.include "asm/macros.inc"
	.include "global.h"

	.text

	thumb_func_start ov45_02229EE0
ov45_02229EE0: @ 0x02229EE0
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _02229F68 @ =0x0000002A
	movs r1, #2
	bl FUN_02006FF8
	bl FUN_020915B0
	bl FUN_02091614
	movs r0, #3
	bl FUN_02039FD8
	movs r2, #5
	movs r0, #3
	movs r1, #0x6f
	lsls r2, r2, #0xc
	bl FUN_0201A910
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0x6f
	bl FUN_02007280
	adds r5, r0, #0
	adds r2, r5, #0
	movs r1, #0x10
	movs r0, #0
_02229F18:
	strb r0, [r2]
	adds r2, r2, #1
	subs r1, r1, #1
	bne _02229F18
	adds r0, r4, #0
	bl FUN_020072A4
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #0x6f
	str r0, [r5]
	bl ov45_02229FF4
	str r0, [r5, #4]
	movs r0, #0x6f
	str r0, [sp]
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	ldr r2, [r4]
	ldr r3, [r5, #4]
	bl ov45_0222CD1C
	str r0, [r5, #8]
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	ldr r0, _02229F6C @ =ov45_02229FE0
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E374
	str r0, [r5, #0xc]
	ldr r0, [r5, #8]
	bl ov45_0222CD84
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02229F68: .4byte 0x0000002A
_02229F6C: .4byte ov45_02229FE0
	thumb_func_end ov45_02229EE0

	thumb_func_start ov45_02229F70
ov45_02229F70: @ 0x02229F70
	push {r3, r4, r5, lr}
	bl FUN_02007290
	adds r5, r0, #0
	ldr r0, [r5, #8]
	bl ov45_0222CD90
	adds r4, r0, #0
	ldr r0, [r5, #4]
	bl ov45_0222A15C
	cmp r4, #1
	bne _02229F8E
	movs r0, #1
	pop {r3, r4, r5, pc}
_02229F8E:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_02229F70

	thumb_func_start ov45_02229F94
ov45_02229F94: @ 0x02229F94
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_0200E390
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	ldr r0, [r4, #8]
	bl ov45_0222CD68
	ldr r0, [r4, #4]
	bl ov45_0222A0F0
	adds r0, r5, #0
	bl FUN_02007294
	movs r0, #0x6f
	bl FUN_0201A9C4
	ldr r0, _02229FDC @ =0x0000002A
	bl FUN_02006F7C
	bl FUN_02091624
	bl FUN_020915C0
	movs r0, #1
	pop {r3, r4, r5, pc}
	nop
_02229FDC: .4byte 0x0000002A
	thumb_func_end ov45_02229F94

	thumb_func_start ov45_02229FE0
ov45_02229FE0: @ 0x02229FE0
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #8]
	bl ov45_0222CDC0
	ldr r0, [r4, #4]
	bl ov45_0222A1F8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02229FE0

	thumb_func_start ov45_02229FF4
ov45_02229FF4: @ 0x02229FF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r7, r1, #0
	movs r1, #0x53
	adds r5, r0, #0
	adds r0, r7, #0
	lsls r1, r1, #4
	bl FUN_0201AA8C
	movs r2, #0x53
	movs r1, #0
	lsls r2, r2, #4
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, _0222A0CC @ =0x00000528
	str r5, [r4]
	str r7, [r4, r0]
	ldr r0, _0222A0D0 @ =ov45_0222B2B4
	movs r2, #0x94
	str r0, [sp, #4]
	ldr r0, _0222A0D4 @ =ov45_0222B470
	add r3, sp, #4
	str r0, [sp, #8]
	ldr r0, _0222A0D8 @ =ov45_0222B530
	str r0, [sp, #0xc]
	ldr r0, _0222A0DC @ =ov45_0222B5A0
	str r0, [sp, #0x10]
	ldr r0, _0222A0E0 @ =ov45_0222B75C
	str r0, [sp, #0x14]
	str r4, [sp]
	ldr r1, [r4]
	adds r0, r7, #0
	bl ov45_0222E5D4
	adds r0, r7, #0
	bl ov45_0222D860
	str r0, [r4, #4]
	movs r6, #0
	adds r5, r4, #0
_0222A046:
	adds r0, r7, #0
	bl FUN_02028ED0
	adds r1, r5, #0
	adds r1, #0xe8
	adds r6, r6, #1
	adds r5, r5, #4
	str r0, [r1]
	cmp r6, #4
	blt _0222A046
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r0, r4, r0
	adds r2, r7, #0
	bl ov45_0222B8A0
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl ov45_0222BD40
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222BD30
	ldr r0, _0222A0E4 @ =0x02254AC4
	movs r1, #8
	adds r2, r4, #0
	bl ov45_0222EE20
	movs r0, #0x7f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222BC3C
	movs r0, #0x83
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222C388
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222C8AC
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r7, #0
	bl ov45_0222C978
	ldr r0, _0222A0E8 @ =0x000004BC
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222CB44
	ldr r0, _0222A0EC @ =0x00000508
	adds r1, r7, #0
	adds r0, r4, r0
	bl ov45_0222BCC8
	adds r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A0CC: .4byte 0x00000528
_0222A0D0: .4byte ov45_0222B2B4
_0222A0D4: .4byte ov45_0222B470
_0222A0D8: .4byte ov45_0222B530
_0222A0DC: .4byte ov45_0222B5A0
_0222A0E0: .4byte ov45_0222B75C
_0222A0E4: .4byte 0x02254AC4
_0222A0E8: .4byte 0x000004BC
_0222A0EC: .4byte 0x00000508
	thumb_func_end ov45_02229FF4

	thumb_func_start ov45_0222A0F0
ov45_0222A0F0: @ 0x0222A0F0
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r6, r0
	add r1, sp, #0
	bl ov45_0222AB0C
	ldr r0, [r6]
	bl FUN_020318E8
	ldr r1, [sp]
	adds r4, r0, #0
	bl FUN_020318FC
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl FUN_02031900
	ldr r0, _0222A158 @ =0x00000508
	adds r0, r6, r0
	bl ov45_0222BCD8
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r0, r6, r0
	bl ov45_0222C994
	bl ov45_0222EE80
	ldr r0, [r6, #4]
	bl ov45_0222D890
	movs r4, #0
	adds r5, r6, #0
_0222A138:
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	bl FUN_0201AB0C
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222A138
	bl ov45_0222E688
	adds r0, r6, #0
	bl FUN_0201AB0C
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A158: .4byte 0x00000508
	thumb_func_end ov45_0222A0F0

	thumb_func_start ov45_0222A15C
ov45_0222A15C: @ 0x0222A15C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov45_0222D8A4
	add r0, sp, #0
	bl ov45_0222ECB8
	add r1, sp, #0
	adds r0, r1, #0
	ldm r0!, {r2, r3}
	adds r0, r4, #0
	adds r0, #0xd8
	stm r0!, {r2, r3}
	adds r0, r4, #0
	adds r0, #0xd4
	bl ov45_0222D500
	adds r0, r4, #0
	bl ov45_0222B840
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl ov45_0222BE5C
	movs r0, #0x7a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222BD30
	adds r0, r4, #0
	adds r0, #0xf8
	bl ov45_0222BB58
	movs r2, #0x7f
	lsls r2, r2, #2
	ldr r3, _0222A1EC @ =0x0000049C
	adds r0, r4, r2
	adds r1, r4, #0
	adds r2, #0x10
	adds r1, #0xf8
	adds r2, r4, r2
	adds r3, r4, r3
	bl ov45_0222BB60
	movs r0, #0x3a
	lsls r0, r0, #4
	adds r0, r4, r0
	bl ov45_0222BCB8
	movs r0, #0x83
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222C3B0
	ldr r0, _0222A1EC @ =0x0000049C
	adds r0, r4, r0
	bl ov45_0222CAA0
	ldr r0, _0222A1F0 @ =0x000004BC
	adds r0, r4, r0
	bl ov45_0222CCDC
	cmp r0, #1
	bne _0222A1E8
	ldr r0, _0222A1F4 @ =0x0000052C
	movs r1, #1
	str r1, [r4, r0]
_0222A1E8:
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_0222A1EC: .4byte 0x0000049C
_0222A1F0: .4byte 0x000004BC
_0222A1F4: .4byte 0x0000052C
	thumb_func_end ov45_0222A15C

	thumb_func_start ov45_0222A1F8
ov45_0222A1F8: @ 0x0222A1F8
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222A1F8

	thumb_func_start ov45_0222A1FC
ov45_0222A1FC: @ 0x0222A1FC
	ldr r1, _0222A204 @ =0x0000052C
	ldr r0, [r0, r1]
	bx lr
	nop
_0222A204: .4byte 0x0000052C
	thumb_func_end ov45_0222A1FC

	thumb_func_start ov45_0222A208
ov45_0222A208: @ 0x0222A208
	ldr r3, _0222A20C @ =ov45_0222E9BC
	bx r3
	.align 2, 0
_0222A20C: .4byte ov45_0222E9BC
	thumb_func_end ov45_0222A208

	thumb_func_start ov45_0222A210
ov45_0222A210: @ 0x0222A210
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov45_0222A210

	thumb_func_start ov45_0222A214
ov45_0222A214: @ 0x0222A214
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x42
	lsls r0, r0, #2
	adds r1, r4, #0
	adds r0, r4, r0
	adds r1, #0xc
	bl ov45_0222B79C
	adds r4, #0xc
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov45_0222A214

	thumb_func_start ov45_0222A22C
ov45_0222A22C: @ 0x0222A22C
	adds r0, #0xd4
	bx lr
	thumb_func_end ov45_0222A22C

	thumb_func_start ov45_0222A230
ov45_0222A230: @ 0x0222A230
	push {r3, r4}
	movs r2, #1
	adds r3, r2, #0
	lsls r3, r1
	adds r1, r0, #0
	adds r1, #0xf8
	ldr r1, [r1]
	tst r1, r3
	beq _0222A256
	adds r1, r0, #0
	adds r1, #0xf8
	ldr r4, [r1]
	mvns r1, r3
	ands r1, r4
	adds r0, #0xf8
	str r1, [r0]
	adds r0, r2, #0
	pop {r3, r4}
	bx lr
_0222A256:
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_0222A230

	thumb_func_start ov45_0222A25C
ov45_0222A25C: @ 0x0222A25C
	push {r3, r4}
	movs r2, #1
	adds r3, r2, #0
	lsls r3, r1
	adds r1, r0, #0
	adds r1, #0xfc
	ldr r1, [r1]
	tst r1, r3
	beq _0222A282
	adds r1, r0, #0
	adds r1, #0xfc
	ldr r4, [r1]
	mvns r1, r3
	ands r1, r4
	adds r0, #0xfc
	str r1, [r0]
	adds r0, r2, #0
	pop {r3, r4}
	bx lr
_0222A282:
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_0222A25C

	thumb_func_start ov45_0222A288
ov45_0222A288: @ 0x0222A288
	movs r2, #1
	lsls r2, r2, #8
	ldr r3, [r0, r2]
	movs r0, #1
	adds r2, r0, #0
	lsls r2, r1
	adds r1, r3, #0
	tst r1, r2
	bne _0222A29C
	movs r0, #0
_0222A29C:
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222A288

	thumb_func_start ov45_0222A2A0
ov45_0222A2A0: @ 0x0222A2A0
	push {r4, r5}
	movs r4, #1
	adds r5, r4, #0
	lsls r5, r1
	movs r1, #0x41
	lsls r1, r1, #2
	ldr r3, [r0, r1]
	adds r2, r3, #0
	tst r2, r5
	beq _0222A2C0
	mvns r2, r5
	ands r2, r3
	str r2, [r0, r1]
	adds r0, r4, #0
	pop {r4, r5}
	bx lr
_0222A2C0:
	movs r0, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222A2A0

	thumb_func_start ov45_0222A2C8
ov45_0222A2C8: @ 0x0222A2C8
	ldr r0, [r0]
	bx lr
	thumb_func_end ov45_0222A2C8

	thumb_func_start ov45_0222A2CC
ov45_0222A2CC: @ 0x0222A2CC
	push {r3, lr}
	cmp r0, #0
	bne _0222A2D6
	bl GF_AssertFail
_0222A2D6:
	movs r0, #4
	bl ov45_0222ECDC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222A2CC

	thumb_func_start ov45_0222A2E0
ov45_0222A2E0: @ 0x0222A2E0
	push {r4, lr}
	adds r4, r0, #0
	bne _0222A2EA
	bl GF_AssertFail
_0222A2EA:
	ldr r0, _0222A2F4 @ =0x0000020B
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	pop {r4, pc}
	.align 2, 0
_0222A2F4: .4byte 0x0000020B
	thumb_func_end ov45_0222A2E0

	thumb_func_start ov45_0222A2F8
ov45_0222A2F8: @ 0x0222A2F8
	push {r4, lr}
	adds r4, r0, #0
	bne _0222A302
	bl GF_AssertFail
_0222A302:
	ldr r0, _0222A30C @ =0x0000020B
	ldrb r0, [r4, r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	pop {r4, pc}
	.align 2, 0
_0222A30C: .4byte 0x0000020B
	thumb_func_end ov45_0222A2F8

	thumb_func_start ov45_0222A310
ov45_0222A310: @ 0x0222A310
	ldr r2, _0222A320 @ =0x0000020B
	movs r1, #0xf0
	ldrb r3, [r0, r2]
	bics r3, r1
	movs r1, #0x10
	orrs r1, r3
	strb r1, [r0, r2]
	bx lr
	.align 2, 0
_0222A320: .4byte 0x0000020B
	thumb_func_end ov45_0222A310

	thumb_func_start ov45_0222A324
ov45_0222A324: @ 0x0222A324
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	thumb_func_end ov45_0222A324

	thumb_func_start ov45_0222A330
ov45_0222A330: @ 0x0222A330
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bx lr
	thumb_func_end ov45_0222A330

	thumb_func_start ov45_0222A33C
ov45_0222A33C: @ 0x0222A33C
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r2, [r0, r1]
	lsls r2, r2, #0x1e
	lsrs r2, r2, #0x1f
	cmp r2, #1
	bne _0222A356
	adds r1, r1, #4
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A356
	movs r0, #1
	bx lr
_0222A356:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222A33C

	thumb_func_start ov45_0222A35C
ov45_0222A35C: @ 0x0222A35C
	movs r1, #0x81
	lsls r1, r1, #2
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A370
	subs r1, #8
	ldrb r0, [r0, r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bx lr
_0222A370:
	movs r0, #0
	bx lr
	thumb_func_end ov45_0222A35C

	thumb_func_start ov45_0222A374
ov45_0222A374: @ 0x0222A374
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r2, [r0, r1]
	lsls r2, r2, #0x1b
	lsrs r2, r2, #0x1f
	cmp r2, #1
	bne _0222A38E
	adds r1, #0xa
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A38E
	movs r0, #1
	bx lr
_0222A38E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222A374

	thumb_func_start ov45_0222A394
ov45_0222A394: @ 0x0222A394
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	bx lr
	thumb_func_end ov45_0222A394

	thumb_func_start ov45_0222A3A0
ov45_0222A3A0: @ 0x0222A3A0
	ldr r1, [r0, #8]
	cmp r1, #1
	bne _0222A3B2
	ldr r1, _0222A3B8 @ =0x00000202
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A3B2
	movs r0, #1
	bx lr
_0222A3B2:
	movs r0, #0
	bx lr
	nop
_0222A3B8: .4byte 0x00000202
	thumb_func_end ov45_0222A3A0

	thumb_func_start ov45_0222A3BC
ov45_0222A3BC: @ 0x0222A3BC
	ldr r1, _0222A3D0 @ =0x00000202
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A3CA
	subs r1, r1, #5
	ldrb r0, [r0, r1]
	bx lr
_0222A3CA:
	movs r0, #1
	bx lr
	nop
_0222A3D0: .4byte 0x00000202
	thumb_func_end ov45_0222A3BC

	thumb_func_start ov45_0222A3D4
ov45_0222A3D4: @ 0x0222A3D4
	ldr r1, _0222A3E8 @ =0x00000202
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A3E2
	subs r1, r1, #4
	ldrb r0, [r0, r1]
	bx lr
_0222A3E2:
	movs r0, #7
	bx lr
	nop
_0222A3E8: .4byte 0x00000202
	thumb_func_end ov45_0222A3D4

	thumb_func_start ov45_0222A3EC
ov45_0222A3EC: @ 0x0222A3EC
	ldr r1, _0222A400 @ =0x00000202
	ldrsh r2, [r0, r1]
	cmp r2, #0
	bgt _0222A3FA
	subs r1, r1, #3
	ldrb r0, [r0, r1]
	bx lr
_0222A3FA:
	movs r0, #0xb
	bx lr
	nop
_0222A400: .4byte 0x00000202
	thumb_func_end ov45_0222A3EC

	thumb_func_start ov45_0222A404
ov45_0222A404: @ 0x0222A404
	movs r1, #0x3a
	lsls r1, r1, #4
	ldr r3, _0222A410 @ =ov45_0222BCA0
	adds r0, r0, r1
	bx r3
	nop
_0222A410: .4byte ov45_0222BCA0
	thumb_func_end ov45_0222A404

	thumb_func_start ov45_0222A414
ov45_0222A414: @ 0x0222A414
	movs r1, #0x3a
	lsls r1, r1, #4
	ldr r3, _0222A420 @ =ov45_0222BCA8
	adds r0, r0, r1
	bx r3
	nop
_0222A420: .4byte ov45_0222BCA8
	thumb_func_end ov45_0222A414

	thumb_func_start ov45_0222A424
ov45_0222A424: @ 0x0222A424
	ldr r1, _0222A42C @ =0x0000050C
	ldr r0, [r0, r1]
	bx lr
	nop
_0222A42C: .4byte 0x0000050C
	thumb_func_end ov45_0222A424

	thumb_func_start ov45_0222A430
ov45_0222A430: @ 0x0222A430
	ldr r2, _0222A438 @ =0x0000050C
	str r1, [r0, r2]
	bx lr
	nop
_0222A438: .4byte 0x0000050C
	thumb_func_end ov45_0222A430

	thumb_func_start ov45_0222A43C
ov45_0222A43C: @ 0x0222A43C
	movs r1, #0x3e
	adds r2, r0, #0
	lsls r1, r1, #4
	adds r1, r2, r1
	ldr r3, _0222A44C @ =FUN_020D47EC
	movs r0, #0
	movs r2, #4
	bx r3
	.align 2, 0
_0222A44C: .4byte FUN_020D47EC
	thumb_func_end ov45_0222A43C

	thumb_func_start ov45_0222A450
ov45_0222A450: @ 0x0222A450
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r4, #4
	blo _0222A460
	bl GF_AssertFail
_0222A460:
	adds r0, r6, #0
	bl ov45_0222EC68
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _0222A474
	bl GF_AssertFail
_0222A474:
	movs r0, #0x3e
	adds r1, r5, r4
	lsls r0, r0, #4
	strb r6, [r1, r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222A450

	thumb_func_start ov45_0222A480
ov45_0222A480: @ 0x0222A480
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov45_0222E9E0
	adds r1, r0, #0
	adds r0, r5, #0
	adds r2, r4, #0
	bl ov45_0222A450
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222A480

	thumb_func_start ov45_0222A498
ov45_0222A498: @ 0x0222A498
	movs r2, #0x3e
	lsls r2, r2, #4
	adds r0, r0, r2
	ldr r3, _0222A4A4 @ =FUN_020D4A50
	movs r2, #4
	bx r3
	.align 2, 0
_0222A4A4: .4byte FUN_020D4A50
	thumb_func_end ov45_0222A498

	thumb_func_start ov45_0222A4A8
ov45_0222A4A8: @ 0x0222A4A8
	movs r1, #0x3a
	lsls r1, r1, #4
	ldr r3, _0222A4B4 @ =ov45_0222BD24
	adds r0, r0, r1
	bx r3
	nop
_0222A4B4: .4byte ov45_0222BD24
	thumb_func_end ov45_0222A4A8

	thumb_func_start ov45_0222A4B8
ov45_0222A4B8: @ 0x0222A4B8
	movs r1, #0x3a
	lsls r1, r1, #4
	ldr r3, _0222A4C4 @ =ov45_0222BD2C
	adds r0, r0, r1
	bx r3
	nop
_0222A4C4: .4byte ov45_0222BD2C
	thumb_func_end ov45_0222A4B8

	thumb_func_start ov45_0222A4C8
ov45_0222A4C8: @ 0x0222A4C8
	movs r2, #0x82
	lsls r2, r2, #2
	strb r1, [r0, r2]
	bx lr
	thumb_func_end ov45_0222A4C8

	thumb_func_start ov45_0222A4D0
ov45_0222A4D0: @ 0x0222A4D0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x7f
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	lsls r1, r1, #0x1b
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _0222A500
	adds r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _0222A500
	ldr r1, _0222A518 @ =0x00000481
	movs r0, #0x15
	movs r2, #0
	bl FUN_02004EC4
	movs r0, #0x7f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222BC84
	pop {r4, pc}
_0222A500:
	ldr r1, _0222A51C @ =0x0000047F
	movs r0, #0x15
	movs r2, #0
	bl FUN_02004EC4
	movs r0, #0x7f
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222BC84
	pop {r4, pc}
	nop
_0222A518: .4byte 0x00000481
_0222A51C: .4byte 0x0000047F
	thumb_func_end ov45_0222A4D0

	thumb_func_start ov45_0222A520
ov45_0222A520: @ 0x0222A520
	push {r3, lr}
	ldr r2, _0222A538 @ =0x00000209
	ldrb r3, [r0, r2]
	cmp r1, r3
	beq _0222A534
	strb r1, [r0, r2]
	subs r2, #0xd
	adds r0, r0, r2
	bl ov45_0222BC84
_0222A534:
	pop {r3, pc}
	nop
_0222A538: .4byte 0x00000209
	thumb_func_end ov45_0222A520

	thumb_func_start ov45_0222A53C
ov45_0222A53C: @ 0x0222A53C
	push {r3, lr}
	bl ov45_0222E9E0
	bl ov45_0222EC68
	pop {r3, pc}
	thumb_func_end ov45_0222A53C

	thumb_func_start ov45_0222A548
ov45_0222A548: @ 0x0222A548
	ldr r3, _0222A54C @ =ov45_0222E9E0
	bx r3
	.align 2, 0
_0222A54C: .4byte ov45_0222E9E0
	thumb_func_end ov45_0222A548

	thumb_func_start ov45_0222A550
ov45_0222A550: @ 0x0222A550
	push {r4, lr}
	sub sp, #8
	add r0, sp, #0
	adds r4, r1, #0
	bl ov45_0222EC10
	ldr r1, [sp, #4]
	lsls r0, r4, #2
	ldr r1, [r1, r0]
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222A570
	add sp, #8
	movs r0, #1
	pop {r4, pc}
_0222A570:
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222A550

	thumb_func_start ov45_0222A578
ov45_0222A578: @ 0x0222A578
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x14
	blo _0222A588
	bl GF_AssertFail
_0222A588:
	add r0, sp, #0
	bl ov45_0222EC10
	ldr r1, [sp, #4]
	lsls r0, r5, #2
	ldr r5, [r1, r0]
	movs r0, #0
	mvns r0, r0
	cmp r5, r0
	bne _0222A5A2
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222A5A2:
	bl ov45_0222E9E0
	cmp r5, r0
	bne _0222A5B4
	movs r0, #0x4a
	lsls r0, r0, #2
	add sp, #8
	adds r0, r4, r0
	pop {r3, r4, r5, pc}
_0222A5B4:
	adds r0, r5, #0
	bl ov45_0222EA2C
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222A578

	thumb_func_start ov45_0222A5C0
ov45_0222A5C0: @ 0x0222A5C0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A5DA
	ldr r0, _0222A5E4 @ =0x0000052C
	movs r1, #1
	str r1, [r4, r0]
_0222A5DA:
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	pop {r4, pc}
	nop
_0222A5E4: .4byte 0x0000052C
	thumb_func_end ov45_0222A5C0

	thumb_func_start ov45_0222A5E8
ov45_0222A5E8: @ 0x0222A5E8
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0xf
	blt _0222A5F6
	bl GF_AssertFail
_0222A5F6:
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A60E
	ldr r0, _0222A6F8 @ =0x0000052C
	movs r1, #1
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0222A60E:
	ldr r0, _0222A6FC @ =0x0000016B
	ldrb r0, [r4, r0]
	cmp r0, r5
	beq _0222A6F6
	cmp r5, #9
	beq _0222A64E
	adds r0, r4, #0
	bl ov45_0222AFF8
	cmp r0, #1
	bne _0222A64E
	adds r0, r4, #0
	bl ov45_0222B00C
	cmp r0, #0
	bne _0222A644
	movs r0, #0x71
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	movs r1, #0x71
	lsls r1, r1, #2
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl ov45_0222BE28
_0222A644:
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl ov45_0222BD5C
_0222A64E:
	ldr r0, _0222A6FC @ =0x0000016B
	ldrb r0, [r4, r0]
	cmp r0, #8
	bhi _0222A6E2
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222A662: @ jump table
	.2byte _0222A6E2 - _0222A662 - 2 @ case 0
	.2byte _0222A6E2 - _0222A662 - 2 @ case 1
	.2byte _0222A674 - _0222A662 - 2 @ case 2
	.2byte _0222A684 - _0222A662 - 2 @ case 3
	.2byte _0222A694 - _0222A662 - 2 @ case 4
	.2byte _0222A6A4 - _0222A662 - 2 @ case 5
	.2byte _0222A6B4 - _0222A662 - 2 @ case 6
	.2byte _0222A6C4 - _0222A662 - 2 @ case 7
	.2byte _0222A6D4 - _0222A662 - 2 @ case 8
_0222A674:
	ldr r0, _0222A700 @ =0x000004BC
	movs r1, #0x10
	adds r2, r1, #0
	adds r0, r4, r0
	subs r2, #0x11
	bl ov45_0222CB74
	b _0222A6E2
_0222A684:
	ldr r0, _0222A700 @ =0x000004BC
	movs r1, #0x11
	adds r2, r1, #0
	adds r0, r4, r0
	subs r2, #0x12
	bl ov45_0222CB74
	b _0222A6E2
_0222A694:
	ldr r0, _0222A700 @ =0x000004BC
	movs r1, #0x12
	adds r2, r1, #0
	adds r0, r4, r0
	subs r2, #0x13
	bl ov45_0222CB74
	b _0222A6E2
_0222A6A4:
	ldr r0, _0222A700 @ =0x000004BC
	movs r1, #0x13
	adds r2, r1, #0
	adds r0, r4, r0
	subs r2, #0x14
	bl ov45_0222CB74
	b _0222A6E2
_0222A6B4:
	ldr r0, _0222A700 @ =0x000004BC
	movs r1, #0x14
	adds r2, r1, #0
	adds r0, r4, r0
	subs r2, #0x15
	bl ov45_0222CB74
	b _0222A6E2
_0222A6C4:
	ldr r0, _0222A700 @ =0x000004BC
	movs r1, #0x15
	adds r2, r1, #0
	adds r0, r4, r0
	subs r2, #0x16
	bl ov45_0222CB74
	b _0222A6E2
_0222A6D4:
	ldr r0, _0222A700 @ =0x000004BC
	movs r1, #0x16
	adds r2, r1, #0
	adds r0, r4, r0
	subs r2, #0x17
	bl ov45_0222CB74
_0222A6E2:
	ldr r0, _0222A6FC @ =0x0000016B
	strb r5, [r4, r0]
	subs r0, #0x63
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222BAC4
	adds r0, r4, #0
	bl ov45_0222BA3C
_0222A6F6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A6F8: .4byte 0x0000052C
_0222A6FC: .4byte 0x0000016B
_0222A700: .4byte 0x000004BC
	thumb_func_end ov45_0222A5E8

	thumb_func_start ov45_0222A704
ov45_0222A704: @ 0x0222A704
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x18
	blt _0222A714
	bl GF_AssertFail
_0222A714:
	ldr r0, _0222A728 @ =0x000004BC
	adds r1, r4, #0
	adds r0, r5, r0
	adds r2, r6, #0
	bl ov45_0222CB74
	adds r0, r5, #0
	bl ov45_0222BA3C
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A728: .4byte 0x000004BC
	thumb_func_end ov45_0222A704

	thumb_func_start ov45_0222A72C
ov45_0222A72C: @ 0x0222A72C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x1b
	blo _0222A73A
	bl GF_AssertFail
_0222A73A:
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A752
	ldr r0, _0222A768 @ =0x0000052C
	movs r1, #1
	str r1, [r5, r0]
	pop {r3, r4, r5, pc}
_0222A752:
	ldr r0, _0222A76C @ =0x00000169
	strb r4, [r5, r0]
	subs r0, #0x61
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BAC4
	adds r0, r5, #0
	bl ov45_0222BA3C
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222A768: .4byte 0x0000052C
_0222A76C: .4byte 0x00000169
	thumb_func_end ov45_0222A72C

	thumb_func_start ov45_0222A770
ov45_0222A770: @ 0x0222A770
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x12
	blt _0222A780
	bl GF_AssertFail
_0222A780:
	cmp r6, #0x12
	blt _0222A788
	bl GF_AssertFail
_0222A788:
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A7A0
	ldr r0, _0222A7D8 @ =0x0000052C
	movs r1, #1
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0222A7A0:
	cmp r4, #0x12
	bge _0222A7D6
	cmp r6, #0x12
	bge _0222A7D6
	cmp r4, #0
	bne _0222A7BA
	movs r0, #0x1b
	lsls r0, r0, #4
	strh r6, [r5, r0]
	movs r1, #0
	adds r0, r0, #2
	strh r1, [r5, r0]
	b _0222A7C4
_0222A7BA:
	movs r0, #0x1b
	lsls r0, r0, #4
	strh r4, [r5, r0]
	adds r0, r0, #2
	strh r6, [r5, r0]
_0222A7C4:
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BAC4
	adds r0, r5, #0
	bl ov45_0222BA3C
_0222A7D6:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A7D8: .4byte 0x0000052C
	thumb_func_end ov45_0222A770

	thumb_func_start ov45_0222A7DC
ov45_0222A7DC: @ 0x0222A7DC
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r4, #3
	blo _0222A7EC
	bl GF_AssertFail
_0222A7EC:
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222A804
	ldr r0, _0222A840 @ =0x0000052C
	movs r1, #1
	str r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0222A804:
	cmp r4, #3
	bhs _0222A83E
	movs r0, #0x6d
	lsls r0, r0, #2
	str r6, [r5, r0]
	adds r1, r0, #4
	str r4, [r5, r1]
	adds r1, r0, #0
	adds r1, #0x57
	ldrb r2, [r5, r1]
	movs r1, #0xf
	adds r0, #0x57
	bics r2, r1
	movs r1, #1
	orrs r1, r2
	strb r1, [r5, r0]
	adds r0, r5, #0
	movs r1, #6
	bl ov45_0222B118
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BAC4
	adds r0, r5, #0
	bl ov45_0222BA3C
_0222A83E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222A840: .4byte 0x0000052C
	thumb_func_end ov45_0222A7DC

	thumb_func_start ov45_0222A844
ov45_0222A844: @ 0x0222A844
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #8
	movs r1, #8
	adds r7, r2, #0
	bl ov45_0222B28C
	movs r6, #0
	cmp r0, #1
	bne _0222A8A0
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #8
	bl FUN_02028F24
	movs r0, #0x20
	adds r1, r7, #0
	bl FUN_02026354
	str r0, [sp]
	movs r0, #0x20
	adds r1, r7, #0
	bl FUN_02026354
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	adds r0, r4, #0
	bl FUN_02028F58
	ldr r1, [sp, #4]
	ldr r2, [sp]
	adds r0, r6, #0
	bl FUN_02002F68
	cmp r0, #0
	bne _0222A892
	movs r6, #1
_0222A892:
	ldr r0, [sp]
	bl FUN_02026380
	ldr r0, [sp, #4]
	bl FUN_02026380
	b _0222A8A2
_0222A8A0:
	movs r6, #1
_0222A8A2:
	cmp r6, #0
	beq _0222A8D0
	ldr r2, _0222A91C @ =0x00000309
	movs r0, #1
	movs r1, #0x1b
	adds r3, r7, #0
	bl FUN_0200BAF8
	movs r1, #0x40
	adds r6, r0, #0
	bl FUN_0200BBA0
	adds r7, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02028F44
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BB44
_0222A8D0:
	adds r0, r5, #0
	bl ov45_0222A9A0
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02028F80
	adds r0, r5, #0
	bl ov45_0222A9CC
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_02028F90
	adds r0, r5, #0
	bl ov45_0222AA5C
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl FUN_02029040
	adds r0, r5, #0
	bl ov45_0222AA10
	adds r1, r0, #0
	lsls r1, r1, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl FUN_0202908C
	adds r0, r4, #0
	bl FUN_02029090
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A91C: .4byte 0x00000309
	thumb_func_end ov45_0222A844

	thumb_func_start ov45_0222A920
ov45_0222A920: @ 0x0222A920
	adds r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0xe
	blo _0222A92A
	movs r0, #0xe
_0222A92A:
	bx lr
	thumb_func_end ov45_0222A920

	thumb_func_start ov45_0222A92C
ov45_0222A92C: @ 0x0222A92C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xc
	blo _0222A93A
	bl GF_AssertFail
_0222A93A:
	movs r1, #0
	adds r2, r1, #0
_0222A93E:
	adds r0, r5, r2
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0x18
	bhs _0222A94A
	adds r1, r1, #1
_0222A94A:
	subs r0, r1, #1
	cmp r0, r4
	bne _0222A958
	adds r0, r5, r2
	adds r0, #0x4c
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
_0222A958:
	adds r2, r2, #1
	cmp r2, #0xc
	blt _0222A93E
	movs r0, #0x18
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222A92C

	thumb_func_start ov45_0222A964
ov45_0222A964: @ 0x0222A964
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xc
	blo _0222A972
	bl GF_AssertFail
_0222A972:
	movs r1, #0
	adds r2, r1, #0
_0222A976:
	adds r0, r5, r2
	adds r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0x18
	bhs _0222A982
	adds r1, r1, #1
_0222A982:
	subs r0, r1, #1
	cmp r0, r4
	bne _0222A990
	lsls r0, r2, #2
	adds r0, r5, r0
	ldr r0, [r0, #0x58]
	pop {r3, r4, r5, pc}
_0222A990:
	adds r2, r2, #1
	cmp r2, #0xc
	blt _0222A976
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222A964

	thumb_func_start ov45_0222A99C
ov45_0222A99C: @ 0x0222A99C
	ldr r0, [r0]
	bx lr
	thumb_func_end ov45_0222A99C

	thumb_func_start ov45_0222A9A0
ov45_0222A9A0: @ 0x0222A9A0
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov45_0222A9A0

	thumb_func_start ov45_0222A9A4
ov45_0222A9A4: @ 0x0222A9A4
	push {r3, lr}
	bl ov45_0222AA5C
	ldr r3, _0222A9C4 @ =0x02254A84
	movs r2, #0
_0222A9AE:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0222A9B8
	adds r0, r2, #0
	pop {r3, pc}
_0222A9B8:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #0x10
	blt _0222A9AE
	movs r0, #0x18
	pop {r3, pc}
	.align 2, 0
_0222A9C4: .4byte 0x02254A84
	thumb_func_end ov45_0222A9A4

	thumb_func_start ov45_0222A9C8
ov45_0222A9C8: @ 0x0222A9C8
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end ov45_0222A9C8

	thumb_func_start ov45_0222A9CC
ov45_0222A9CC: @ 0x0222A9CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x38
	ldrb r0, [r0]
	cmp r0, #2
	blo _0222AA00
	ldrh r0, [r5, #0x3a]
	bl ov45_0222CD04
	ldr r1, _0222AA08 @ =0x0000FFFF
	cmp r0, r1
	beq _0222A9FC
	ldrh r3, [r5, #0x3a]
	ldr r2, _0222AA0C @ =0x02254A84
	movs r1, #0
_0222A9EA:
	ldrh r0, [r2]
	cmp r3, r0
	bne _0222A9F2
	adds r4, r0, #0
_0222A9F2:
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #0x10
	blo _0222A9EA
	b _0222AA02
_0222A9FC:
	movs r4, #1
	b _0222AA02
_0222AA00:
	adds r4, r0, #0
_0222AA02:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_0222AA08: .4byte 0x0000FFFF
_0222AA0C: .4byte 0x02254A84
	thumb_func_end ov45_0222A9CC

	thumb_func_start ov45_0222AA10
ov45_0222AA10: @ 0x0222AA10
	push {r4, lr}
	adds r4, r0, #0
	bl ov45_0222AA28
	cmp r0, #1
	bne _0222AA22
	adds r4, #0x39
	ldrb r0, [r4]
	pop {r4, pc}
_0222AA22:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222AA10

	thumb_func_start ov45_0222AA28
ov45_0222AA28: @ 0x0222AA28
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #7
	bhi _0222AA50
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222AA3C: @ jump table
	.2byte _0222AA50 - _0222AA3C - 2 @ case 0
	.2byte _0222AA4C - _0222AA3C - 2 @ case 1
	.2byte _0222AA4C - _0222AA3C - 2 @ case 2
	.2byte _0222AA4C - _0222AA3C - 2 @ case 3
	.2byte _0222AA4C - _0222AA3C - 2 @ case 4
	.2byte _0222AA4C - _0222AA3C - 2 @ case 5
	.2byte _0222AA50 - _0222AA3C - 2 @ case 6
	.2byte _0222AA4C - _0222AA3C - 2 @ case 7
_0222AA4C:
	movs r0, #1
	bx lr
_0222AA50:
	movs r0, #0
	bx lr
	thumb_func_end ov45_0222AA28

	thumb_func_start ov45_0222AA54
ov45_0222AA54: @ 0x0222AA54
	adds r0, #0x39
	ldrb r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222AA54

	thumb_func_start ov45_0222AA5C
ov45_0222AA5C: @ 0x0222AA5C
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3a]
	bl ov45_0222CD04
	ldr r1, _0222AA80 @ =0x0000FFFF
	cmp r0, r1
	bne _0222AA7C
	adds r0, r4, #0
	bl ov45_0222A9CC
	cmp r0, #0
	bne _0222AA7A
	movs r0, #3
	pop {r4, pc}
_0222AA7A:
	movs r0, #6
_0222AA7C:
	pop {r4, pc}
	nop
_0222AA80: .4byte 0x0000FFFF
	thumb_func_end ov45_0222AA5C

	thumb_func_start ov45_0222AA84
ov45_0222AA84: @ 0x0222AA84
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	cmp r0, #0xea
	blo _0222AA92
	movs r0, #0
	pop {r4, pc}
_0222AA92:
	adds r1, r4, #0
	adds r1, #0x3e
	ldrb r1, [r1]
	bl ov45_0222D79C
	cmp r0, #0
	bne _0222AAA4
	movs r0, #0
	pop {r4, pc}
_0222AAA4:
	ldrh r0, [r4, #0x3c]
	pop {r4, pc}
	thumb_func_end ov45_0222AA84

	thumb_func_start ov45_0222AAA8
ov45_0222AAA8: @ 0x0222AAA8
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x3e
	ldrh r0, [r4, #0x3c]
	ldrb r1, [r1]
	bl ov45_0222D79C
	cmp r0, #0
	bne _0222AAC0
	movs r0, #0
	pop {r4, pc}
_0222AAC0:
	adds r4, #0x3e
	ldrb r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222AAA8

	thumb_func_start ov45_0222AAC8
ov45_0222AAC8: @ 0x0222AAC8
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0222AAD4
	movs r0, #0
	bx lr
_0222AAD4:
	cmp r0, #0x1b
	blo _0222AADA
	movs r0, #0
_0222AADA:
	bx lr
	thumb_func_end ov45_0222AAC8

	thumb_func_start ov45_0222AADC
ov45_0222AADC: @ 0x0222AADC
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0222AAE8
	movs r0, #1
	bx lr
_0222AAE8:
	movs r0, #0
	bx lr
	thumb_func_end ov45_0222AADC

	thumb_func_start ov45_0222AAEC
ov45_0222AAEC: @ 0x0222AAEC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #2
	blo _0222AAFA
	bl GF_AssertFail
_0222AAFA:
	lsls r0, r5, #1
	adds r0, r4, r0
	adds r0, #0x88
	ldrh r0, [r0]
	cmp r0, #0x12
	blo _0222AB08
	movs r0, #0
_0222AB08:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222AAEC

	thumb_func_start ov45_0222AB0C
ov45_0222AB0C: @ 0x0222AB0C
	adds r2, r0, #0
	adds r2, #0x8c
	adds r0, #0x90
	ldr r2, [r2]
	ldr r0, [r0]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	thumb_func_end ov45_0222AB0C

	thumb_func_start ov45_0222AB1C
ov45_0222AB1C: @ 0x0222AB1C
	ldr r1, _0222AB24 @ =0x00000508
	ldr r0, [r0, r1]
	bx lr
	nop
_0222AB24: .4byte 0x00000508
	thumb_func_end ov45_0222AB1C

	thumb_func_start ov45_0222AB28
ov45_0222AB28: @ 0x0222AB28
	movs r2, #0xf3
	lsls r2, r2, #2
	ldr r3, _0222AB34 @ =ov45_0222C95C
	adds r0, r0, r2
	bx r3
	nop
_0222AB34: .4byte ov45_0222C95C
	thumb_func_end ov45_0222AB28

	thumb_func_start ov45_0222AB38
ov45_0222AB38: @ 0x0222AB38
	movs r2, #0xf3
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r3, _0222AB44 @ =FUN_020D4A50
	movs r2, #0x14
	bx r3
	.align 2, 0
_0222AB44: .4byte FUN_020D4A50
	thumb_func_end ov45_0222AB38

	thumb_func_start ov45_0222AB48
ov45_0222AB48: @ 0x0222AB48
	movs r2, #0xf9
	lsls r2, r2, #2
	ldr r3, _0222AB54 @ =ov45_0222C9D0
	adds r0, r0, r2
	bx r3
	nop
_0222AB54: .4byte ov45_0222C9D0
	thumb_func_end ov45_0222AB48

	thumb_func_start ov45_0222AB58
ov45_0222AB58: @ 0x0222AB58
	movs r2, #0xf9
	lsls r2, r2, #2
	ldr r3, _0222AB64 @ =ov45_0222C9EC
	adds r0, r0, r2
	bx r3
	nop
_0222AB64: .4byte ov45_0222C9EC
	thumb_func_end ov45_0222AB58

	thumb_func_start ov45_0222AB68
ov45_0222AB68: @ 0x0222AB68
	push {r3, lr}
	sub sp, #8
	add r0, sp, #0
	bl ov45_0222EC3C
	ldr r0, [sp]
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov45_0222AB68

	thumb_func_start ov45_0222AB78
ov45_0222AB78: @ 0x0222AB78
	push {r3, lr}
	adds r0, r1, #0
	bl ov45_0222ECA4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222AB8E
	bl ov45_0222EC68
	adds r1, r0, #0
_0222AB8E:
	adds r0, r1, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222AB78

	thumb_func_start ov45_0222AB94
ov45_0222AB94: @ 0x0222AB94
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r2, #0
	add r0, sp, #0
	movs r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	str r2, [r0, #8]
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	add r0, sp, #0
	strb r2, [r0, #0x11]
	adds r0, r1, #0
	bl ov45_0222EC90
	str r0, [sp]
	adds r0, r4, #0
	bl ov45_0222EC90
	str r0, [sp, #4]
	movs r1, #2
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r0, #4
	add r1, sp, #0
	movs r2, #0x14
	bl ov45_0222EEF0
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov45_0222AB94

	thumb_func_start ov45_0222ABD0
ov45_0222ABD0: @ 0x0222ABD0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r1, #0
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	movs r1, #1
	add r0, sp, #0
	strb r1, [r0, #0x11]
	adds r0, r2, #0
	adds r4, r3, #0
	bl ov45_0222EC90
	str r0, [sp]
	adds r0, r5, #0
	bl ov45_0222EC90
	str r0, [sp, #4]
	movs r1, #2
	add r0, sp, #0
	strb r1, [r0, #0x10]
	strb r4, [r0, #0x12]
	movs r0, #4
	add r1, sp, #0
	movs r2, #0x14
	bl ov45_0222EEF0
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222ABD0

	thumb_func_start ov45_0222AC14
ov45_0222AC14: @ 0x0222AC14
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r1, #0
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	adds r5, r2, #0
	str r0, [r1, #0x10]
	cmp r4, #6
	bhi _0222ACB4
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222AC3A: @ jump table
	.2byte _0222AC48 - _0222AC3A - 2 @ case 0
	.2byte _0222AC48 - _0222AC3A - 2 @ case 1
	.2byte _0222AC48 - _0222AC3A - 2 @ case 2
	.2byte _0222AC4C - _0222AC3A - 2 @ case 3
	.2byte _0222AC4C - _0222AC3A - 2 @ case 4
	.2byte _0222AC50 - _0222AC3A - 2 @ case 5
	.2byte _0222AC54 - _0222AC3A - 2 @ case 6
_0222AC48:
	movs r1, #2
	b _0222AC5C
_0222AC4C:
	movs r1, #3
	b _0222AC5C
_0222AC50:
	movs r1, #4
	b _0222AC5C
_0222AC54:
	movs r1, #5
	b _0222AC5C
	thumb_func_end ov45_0222AC14

	thumb_func_start ov45_0222AC58
ov45_0222AC58: @ 0x0222AC58
	add sp, #0x14
	pop {r4, r5, pc}
_0222AC5C:
	add r0, sp, #0
	strb r1, [r0, #0x11]
	adds r0, r3, #0
	bl ov45_0222EC90
	str r0, [sp]
	ldr r0, [sp, #0x20]
	bl ov45_0222EC90
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	bl ov45_0222EC90
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	bl ov45_0222EC90
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r5, [r0, #0x10]
	ldrb r1, [r0, #0x13]
	movs r2, #0x7f
	bics r1, r2
	lsls r2, r4, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0x7f
	ands r2, r3
	orrs r1, r2
	strb r1, [r0, #0x13]
	ldrb r1, [r0, #0x13]
	movs r2, #0x80
	bics r1, r2
	ldr r2, [sp, #0x2c]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	lsls r2, r2, #0x1f
	lsrs r2, r2, #0x18
	orrs r1, r2
	strb r1, [r0, #0x13]
	movs r0, #4
	add r1, sp, #0
	movs r2, #0x14
	bl ov45_0222EEF0
_0222ACB4:
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov45_0222AC58

	thumb_func_start ov45_0222ACB8
ov45_0222ACB8: @ 0x0222ACB8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r1, #0
	add r1, sp, #0
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	adds r4, r2, #0
	str r0, [r1, #0x10]
	cmp r5, #0
	beq _0222ACDA
	cmp r5, #1
	beq _0222ACDA
	cmp r5, #2
	bne _0222AD28
_0222ACDA:
	movs r1, #8
	add r0, sp, #0
	strb r1, [r0, #0x11]
	adds r0, r3, #0
	bl ov45_0222EC90
	str r0, [sp]
	ldr r0, [sp, #0x20]
	bl ov45_0222EC90
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	bl ov45_0222EC90
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	bl ov45_0222EC90
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r4, [r0, #0x10]
	ldrb r1, [r0, #0x13]
	movs r2, #0x7f
	bics r1, r2
	lsls r2, r5, #0x18
	lsrs r3, r2, #0x18
	movs r2, #0x7f
	ands r2, r3
	orrs r1, r2
	strb r1, [r0, #0x13]
	ldrb r2, [r0, #0x13]
	movs r1, #0x80
	bics r2, r1
	strb r2, [r0, #0x13]
	movs r0, #4
	add r1, sp, #0
	movs r2, #0x14
	bl ov45_0222EEF0
_0222AD28:
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov45_0222ACB8

	thumb_func_start ov45_0222AD2C
ov45_0222AD2C: @ 0x0222AD2C
	push {r3, lr}
	movs r0, #3
	bl ov45_0222ECDC
	cmp r0, #5
	blo _0222AD3A
	movs r0, #0
_0222AD3A:
	pop {r3, pc}
	thumb_func_end ov45_0222AD2C

	thumb_func_start ov45_0222AD3C
ov45_0222AD3C: @ 0x0222AD3C
	push {r3, lr}
	movs r0, #2
	bl ov45_0222ECDC
	cmp r0, #5
	blo _0222AD4A
	movs r0, #0
_0222AD4A:
	pop {r3, pc}
	thumb_func_end ov45_0222AD3C

	thumb_func_start ov45_0222AD4C
ov45_0222AD4C: @ 0x0222AD4C
	push {r3, lr}
	movs r0, #5
	bl ov45_0222ECDC
	adds r0, #0x1e
	pop {r3, pc}
	thumb_func_end ov45_0222AD4C

	thumb_func_start ov45_0222AD58
ov45_0222AD58: @ 0x0222AD58
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222AD66
	bl GF_AssertFail
_0222AD66:
	movs r0, #0x7a
	adds r1, r5, r4
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222AD58

	thumb_func_start ov45_0222AD70
ov45_0222AD70: @ 0x0222AD70
	push {r3, lr}
	str r1, [sp]
	movs r0, #5
	add r1, sp, #0
	movs r2, #4
	bl ov45_0222EEF0
	pop {r3, pc}
	thumb_func_end ov45_0222AD70

	thumb_func_start ov45_0222AD80
ov45_0222AD80: @ 0x0222AD80
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222AD8C @ =ov45_0222C4E4
	adds r0, r0, r2
	bx r3
	nop
_0222AD8C: .4byte ov45_0222C4E4
	thumb_func_end ov45_0222AD80

	thumb_func_start ov45_0222AD90
ov45_0222AD90: @ 0x0222AD90
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222AD9C @ =ov45_0222C4FC
	adds r0, r0, r2
	bx r3
	nop
_0222AD9C: .4byte ov45_0222C4FC
	thumb_func_end ov45_0222AD90

	thumb_func_start ov45_0222ADA0
ov45_0222ADA0: @ 0x0222ADA0
	movs r0, #0x4b
	lsls r0, r0, #4
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222ADA0

	thumb_func_start ov45_0222ADA8
ov45_0222ADA8: @ 0x0222ADA8
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222ADB4 @ =ov45_0222C5B4
	adds r0, r0, r2
	bx r3
	nop
_0222ADB4: .4byte ov45_0222C5B4
	thumb_func_end ov45_0222ADA8

	thumb_func_start ov45_0222ADB8
ov45_0222ADB8: @ 0x0222ADB8
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0222ADC4 @ =ov45_0222C408
	bx r3
	nop
_0222ADC4: .4byte ov45_0222C408
	thumb_func_end ov45_0222ADB8

	thumb_func_start ov45_0222ADC8
ov45_0222ADC8: @ 0x0222ADC8
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222ADD4 @ =ov45_0222C480
	adds r0, r0, r2
	bx r3
	nop
_0222ADD4: .4byte ov45_0222C480
	thumb_func_end ov45_0222ADC8

	thumb_func_start ov45_0222ADD8
ov45_0222ADD8: @ 0x0222ADD8
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222ADE4 @ =ov45_0222C514
	adds r0, r0, r2
	bx r3
	nop
_0222ADE4: .4byte ov45_0222C514
	thumb_func_end ov45_0222ADD8

	thumb_func_start ov45_0222ADE8
ov45_0222ADE8: @ 0x0222ADE8
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222ADF4 @ =ov45_0222C54C
	adds r0, r0, r2
	bx r3
	nop
_0222ADF4: .4byte ov45_0222C54C
	thumb_func_end ov45_0222ADE8

	thumb_func_start ov45_0222ADF8
ov45_0222ADF8: @ 0x0222ADF8
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222AE04 @ =ov45_0222C580
	adds r0, r0, r2
	bx r3
	nop
_0222AE04: .4byte ov45_0222C580
	thumb_func_end ov45_0222ADF8

	thumb_func_start ov45_0222AE08
ov45_0222AE08: @ 0x0222AE08
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	movs r1, #3
	adds r4, r2, #0
	blx FUN_020F2BA4
	str r0, [r5]
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2BA4
	str r1, [r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222AE08

	thumb_func_start ov45_0222AE24
ov45_0222AE24: @ 0x0222AE24
	movs r3, #0x83
	lsls r3, r3, #2
	adds r0, r0, r3
	ldr r3, _0222AE30 @ =ov45_0222C5E8
	bx r3
	nop
_0222AE30: .4byte ov45_0222C5E8
	thumb_func_end ov45_0222AE24

	thumb_func_start ov45_0222AE34
ov45_0222AE34: @ 0x0222AE34
	movs r2, #0x83
	lsls r2, r2, #2
	ldr r3, _0222AE40 @ =ov45_0222C658
	adds r0, r0, r2
	bx r3
	nop
_0222AE40: .4byte ov45_0222C658
	thumb_func_end ov45_0222AE34

	thumb_func_start ov45_0222AE44
ov45_0222AE44: @ 0x0222AE44
	push {r3, lr}
	movs r0, #6
	add r1, sp, #0
	movs r2, #4
	bl ov45_0222EEF0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222AE44

	thumb_func_start ov45_0222AE54
ov45_0222AE54: @ 0x0222AE54
	push {r3, lr}
	movs r0, #7
	add r1, sp, #0
	movs r2, #4
	bl ov45_0222EEF0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222AE54

	thumb_func_start ov45_0222AE64
ov45_0222AE64: @ 0x0222AE64
	movs r1, #7
	lsls r1, r1, #6
	ldr r3, _0222AE70 @ =ov45_0222BD4C
	adds r0, r0, r1
	bx r3
	nop
_0222AE70: .4byte ov45_0222BD4C
	thumb_func_end ov45_0222AE64

	thumb_func_start ov45_0222AE74
ov45_0222AE74: @ 0x0222AE74
	push {r3, r4, r5, lr}
	ldr r2, _0222AED4 @ =0x000001CA
	adds r5, r0, #0
	ldrb r2, [r5, r2]
	adds r4, r1, #0
	cmp r2, #0
	beq _0222AE86
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222AE86:
	bl ov45_0222A578
	bl ov45_0222A920
	cmp r0, #1
	beq _0222AE96
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222AE96:
	movs r0, #0x71
	lsls r0, r0, #2
	strh r4, [r5, r0]
	movs r2, #1
	adds r1, r0, #2
	strb r2, [r5, r1]
	adds r1, r0, #6
	subs r0, r0, #4
	strb r2, [r5, r1]
	adds r0, r5, r0
	movs r1, #0
	bl ov45_0222BE00
	adds r0, r4, #0
	bl ov45_0222EC90
	movs r2, #0x1e
	lsls r2, r2, #4
	adds r1, r0, #0
	movs r0, #0
	adds r2, r5, r2
	movs r3, #4
	bl ov45_0222EF4C
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	bl ov45_0222BE48
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222AED4: .4byte 0x000001CA
	thumb_func_end ov45_0222AE74

	thumb_func_start ov45_0222AED8
ov45_0222AED8: @ 0x0222AED8
	push {r4, lr}
	ldr r3, _0222AF78 @ =0x000001CA
	adds r4, r0, #0
	ldrb r2, [r4, r3]
	movs r0, #0
	cmp r2, #1
	bne _0222AEF2
	subs r3, r3, #4
	ldrb r3, [r4, r3]
	cmp r3, #2
	beq _0222AF00
	movs r0, #1
	b _0222AF00
_0222AEF2:
	cmp r2, #2
	bne _0222AF00
	subs r3, r3, #4
	ldrb r3, [r4, r3]
	cmp r3, #3
	beq _0222AF00
	movs r0, #1
_0222AF00:
	cmp r0, #0
	beq _0222AF18
	movs r0, #0x71
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov45_0222BE28
	pop {r4, pc}
_0222AF18:
	cmp r2, #1
	beq _0222AF22
	cmp r2, #2
	beq _0222AF2A
	b _0222AF32
_0222AF22:
	ldr r0, _0222AF7C @ =0x000001C6
	movs r2, #3
	strb r2, [r4, r0]
	b _0222AF46
_0222AF2A:
	ldr r0, _0222AF7C @ =0x000001C6
	movs r2, #2
	strb r2, [r4, r0]
	b _0222AF46
_0222AF32:
	movs r0, #0x71
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov45_0222BE28
	pop {r4, pc}
_0222AF46:
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl ov45_0222BE00
	movs r0, #0x71
	lsls r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	movs r2, #0x1e
	lsls r2, r2, #4
	adds r1, r0, #0
	movs r0, #2
	adds r2, r4, r2
	movs r3, #4
	bl ov45_0222EF4C
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl ov45_0222BE48
	pop {r4, pc}
	nop
_0222AF78: .4byte 0x000001CA
_0222AF7C: .4byte 0x000001C6
	thumb_func_end ov45_0222AED8

	thumb_func_start ov45_0222AF80
ov45_0222AF80: @ 0x0222AF80
	push {r4, lr}
	ldr r1, _0222AFC0 @ =0x000001C6
	adds r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0222AFBE
	adds r0, r1, #4
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0222AFBE
	adds r0, r1, #0
	movs r2, #0
	adds r0, #0x1c
	strh r2, [r4, r0]
	subs r0, r1, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	movs r2, #0x1e
	lsls r2, r2, #4
	adds r1, r0, #0
	movs r0, #3
	adds r2, r4, r2
	movs r3, #4
	bl ov45_0222EF4C
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl ov45_0222BD4C
_0222AFBE:
	pop {r4, pc}
	.align 2, 0
_0222AFC0: .4byte 0x000001C6
	thumb_func_end ov45_0222AF80

	thumb_func_start ov45_0222AFC4
ov45_0222AFC4: @ 0x0222AFC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222AFF4 @ =0x000001C6
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0222AFF0
	subs r0, r0, #2
	ldrh r0, [r4, r0]
	bl ov45_0222EC90
	ldr r2, _0222AFF4 @ =0x000001C6
	adds r1, r0, #0
	movs r3, #4
	adds r0, r2, #0
	strb r3, [r4, r2]
	adds r0, #0x1c
	adds r2, #0x1a
	strh r3, [r4, r0]
	movs r0, #2
	adds r2, r4, r2
	bl ov45_0222EF4C
_0222AFF0:
	pop {r4, pc}
	nop
_0222AFF4: .4byte 0x000001C6
	thumb_func_end ov45_0222AFC4

	thumb_func_start ov45_0222AFF8
ov45_0222AFF8: @ 0x0222AFF8
	ldr r1, _0222B008 @ =0x000001CA
	ldrb r0, [r0, r1]
	cmp r0, #0
	beq _0222B004
	movs r0, #1
	bx lr
_0222B004:
	movs r0, #0
	bx lr
	.align 2, 0
_0222B008: .4byte 0x000001CA
	thumb_func_end ov45_0222AFF8

	thumb_func_start ov45_0222B00C
ov45_0222B00C: @ 0x0222B00C
	ldr r1, _0222B01C @ =0x000001CA
	ldrb r0, [r0, r1]
	cmp r0, #2
	bne _0222B018
	movs r0, #1
	bx lr
_0222B018:
	movs r0, #0
	bx lr
	.align 2, 0
_0222B01C: .4byte 0x000001CA
	thumb_func_end ov45_0222B00C

	thumb_func_start ov45_0222B020
ov45_0222B020: @ 0x0222B020
	movs r1, #0x71
	lsls r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov45_0222B020

	thumb_func_start ov45_0222B028
ov45_0222B028: @ 0x0222B028
	ldr r1, _0222B030 @ =0x000001CB
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222B030: .4byte 0x000001CB
	thumb_func_end ov45_0222B028

	thumb_func_start ov45_0222B034
ov45_0222B034: @ 0x0222B034
	ldr r1, _0222B03C @ =0x000001C6
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222B03C: .4byte 0x000001C6
	thumb_func_end ov45_0222B034

	thumb_func_start ov45_0222B040
ov45_0222B040: @ 0x0222B040
	movs r1, #0x72
	lsls r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov45_0222B040

	thumb_func_start ov45_0222B048
ov45_0222B048: @ 0x0222B048
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222B056
	bl GF_AssertFail
_0222B056:
	movs r0, #0x73
	adds r1, r5, r4
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #6
	blo _0222B066
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222B066:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222B048

	thumb_func_start ov45_0222B06C
ov45_0222B06C: @ 0x0222B06C
	push {r3, lr}
	ldr r1, _0222B090 @ =0x000001C6
	ldrb r2, [r0, r1]
	cmp r2, #4
	bne _0222B07A
	movs r0, #1
	pop {r3, pc}
_0222B07A:
	subs r1, r1, #6
	adds r0, r0, r1
	bl ov45_0222BE74
	cmp r0, #0
	bne _0222B08A
	movs r0, #1
	pop {r3, pc}
_0222B08A:
	movs r0, #0
	pop {r3, pc}
	nop
_0222B090: .4byte 0x000001C6
	thumb_func_end ov45_0222B06C

	thumb_func_start ov45_0222B094
ov45_0222B094: @ 0x0222B094
	movs r1, #7
	lsls r1, r1, #6
	ldr r3, _0222B0A0 @ =ov45_0222BE94
	adds r0, r0, r1
	bx r3
	nop
_0222B0A0: .4byte ov45_0222BE94
	thumb_func_end ov45_0222B094

	thumb_func_start ov45_0222B0A4
ov45_0222B0A4: @ 0x0222B0A4
	ldr r1, _0222B0AC @ =0x000001C7
	movs r2, #1
	strb r2, [r0, r1]
	bx lr
	.align 2, 0
_0222B0AC: .4byte 0x000001C7
	thumb_func_end ov45_0222B0A4

	thumb_func_start ov45_0222B0B0
ov45_0222B0B0: @ 0x0222B0B0
	ldr r1, _0222B0B8 @ =0x000001C7
	ldrb r0, [r0, r1]
	bx lr
	nop
_0222B0B8: .4byte 0x000001C7
	thumb_func_end ov45_0222B0B0

	thumb_func_start ov45_0222B0BC
ov45_0222B0BC: @ 0x0222B0BC
	push {r4, lr}
	adds r4, r0, #0
	bl ov45_0222AFF8
	cmp r0, #1
	bne _0222B0D6
	movs r1, #7
	lsls r1, r1, #6
	adds r0, r4, r1
	adds r1, r1, #4
	ldrh r1, [r4, r1]
	bl ov45_0222BDCC
_0222B0D6:
	pop {r4, pc}
	thumb_func_end ov45_0222B0BC

	thumb_func_start ov45_0222B0D8
ov45_0222B0D8: @ 0x0222B0D8
	movs r2, #7
	lsls r2, r2, #6
	ldr r3, _0222B0E4 @ =ov45_0222BDCC
	adds r0, r0, r2
	bx r3
	nop
_0222B0E4: .4byte ov45_0222BDCC
	thumb_func_end ov45_0222B0D8

	thumb_func_start ov45_0222B0E8
ov45_0222B0E8: @ 0x0222B0E8
	movs r2, #7
	lsls r2, r2, #6
	ldr r3, _0222B0F4 @ =ov45_0222BD94
	adds r0, r0, r2
	bx r3
	nop
_0222B0F4: .4byte ov45_0222BD94
	thumb_func_end ov45_0222B0E8

	thumb_func_start ov45_0222B0F8
ov45_0222B0F8: @ 0x0222B0F8
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0202CF54
	movs r1, #0x2f
	bl FUN_0202D0FC
	pop {r3, pc}
	thumb_func_end ov45_0222B0F8

	thumb_func_start ov45_0222B108
ov45_0222B108: @ 0x0222B108
	push {r3, lr}
	ldr r0, [r0]
	bl FUN_0202CF54
	movs r1, #0x77
	bl FUN_0202D0FC
	pop {r3, pc}
	thumb_func_end ov45_0222B108

	thumb_func_start ov45_0222B118
ov45_0222B118: @ 0x0222B118
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #8
	blt _0222B126
	bl GF_AssertFail
_0222B126:
	movs r0, #0xe9
	movs r2, #1
	adds r1, r5, r4
	lsls r0, r0, #2
	strb r2, [r1, r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222B118

	thumb_func_start ov45_0222B134
ov45_0222B134: @ 0x0222B134
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r6, #0xe9
	adds r5, r0, #0
	adds r7, r4, #0
	lsls r6, r6, #2
_0222B140:
	adds r0, r5, r4
	ldrb r0, [r0, r6]
	cmp r0, #0
	bne _0222B1A8
	cmp r4, #7
	bhi _0222B19E
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222B158: @ jump table
	.2byte _0222B168 - _0222B158 - 2 @ case 0
	.2byte _0222B168 - _0222B158 - 2 @ case 1
	.2byte _0222B168 - _0222B158 - 2 @ case 2
	.2byte _0222B17A - _0222B158 - 2 @ case 3
	.2byte _0222B17A - _0222B158 - 2 @ case 4
	.2byte _0222B17A - _0222B158 - 2 @ case 5
	.2byte _0222B18C - _0222B158 - 2 @ case 6
	.2byte _0222B19E - _0222B158 - 2 @ case 7
_0222B168:
	adds r0, r5, #0
	bl ov45_0222A394
	cmp r0, #1
	bne _0222B176
	adds r0, r7, #0
	b _0222B1A0
_0222B176:
	movs r0, #1
	b _0222B1A0
_0222B17A:
	adds r0, r5, #0
	bl ov45_0222A330
	cmp r0, #1
	bne _0222B188
	movs r0, #0
	b _0222B1A0
_0222B188:
	movs r0, #1
	b _0222B1A0
_0222B18C:
	adds r0, r5, #0
	bl ov45_0222A3A0
	cmp r0, #1
	bne _0222B19A
	movs r0, #0
	b _0222B1A0
_0222B19A:
	movs r0, #1
	b _0222B1A0
_0222B19E:
	movs r0, #1
_0222B1A0:
	cmp r0, #1
	bne _0222B1A8
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222B1A8:
	adds r4, r4, #1
	cmp r4, #8
	blt _0222B140
	movs r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222B134

	thumb_func_start ov45_0222B1B4
ov45_0222B1B4: @ 0x0222B1B4
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222C900
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov45_0222A53C
	adds r1, r0, #0
	adds r0, r4, #0
	bl ov45_0222AB28
	cmp r0, #1
	bne _0222B1D8
	adds r5, r5, #2
_0222B1D8:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222B1B4

	thumb_func_start ov45_0222B1DC
ov45_0222B1DC: @ 0x0222B1DC
	ldr r1, _0222B1E4 @ =0x0000049C
	ldr r3, _0222B1E8 @ =ov45_0222CB40
	adds r0, r0, r1
	bx r3
	.align 2, 0
_0222B1E4: .4byte 0x0000049C
_0222B1E8: .4byte ov45_0222CB40
	thumb_func_end ov45_0222B1DC

	thumb_func_start ov45_0222B1EC
ov45_0222B1EC: @ 0x0222B1EC
	ldr r1, _0222B1F4 @ =0x0000049C
	ldr r3, _0222B1F8 @ =ov45_0222CB3C
	adds r0, r0, r1
	bx r3
	.align 2, 0
_0222B1F4: .4byte 0x0000049C
_0222B1F8: .4byte ov45_0222CB3C
	thumb_func_end ov45_0222B1EC

	thumb_func_start ov45_0222B1FC
ov45_0222B1FC: @ 0x0222B1FC
	adds r3, r1, #0
	ldr r1, _0222B218 @ =0x00000524
	movs r2, #1
	str r2, [r0, r1]
	subs r1, #0x14
	adds r2, r0, r1
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	nop
_0222B218: .4byte 0x00000524
	thumb_func_end ov45_0222B1FC

	thumb_func_start ov45_0222B21C
ov45_0222B21C: @ 0x0222B21C
	adds r3, r1, #0
	ldr r1, _0222B240 @ =0x00000524
	ldr r2, [r0, r1]
	cmp r2, #1
	bne _0222B23A
	subs r1, #0x14
	adds r2, r0, r1
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r2!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	movs r0, #1
	bx lr
_0222B23A:
	movs r0, #0
	bx lr
	nop
_0222B240: .4byte 0x00000524
	thumb_func_end ov45_0222B21C

	thumb_func_start ov45_0222B244
ov45_0222B244: @ 0x0222B244
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222B268 @ =0x000004B8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B254
	bl GF_AssertFail
_0222B254:
	ldr r0, [r4]
	bl FUN_02028E9C
	ldr r1, _0222B26C @ =0x00000528
	ldr r1, [r4, r1]
	bl FUN_02078DD8
	ldr r1, _0222B268 @ =0x000004B8
	str r0, [r4, r1]
	pop {r4, pc}
	.align 2, 0
_0222B268: .4byte 0x000004B8
_0222B26C: .4byte 0x00000528
	thumb_func_end ov45_0222B244

	thumb_func_start ov45_0222B270
ov45_0222B270: @ 0x0222B270
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222B288 @ =0x000004B8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222B286
	bl FUN_02078E28
	ldr r0, _0222B288 @ =0x000004B8
	movs r1, #0
	str r1, [r4, r0]
_0222B286:
	pop {r4, pc}
	.align 2, 0
_0222B288: .4byte 0x000004B8
	thumb_func_end ov45_0222B270

	thumb_func_start ov45_0222B28C
ov45_0222B28C: @ 0x0222B28C
	push {r3, r4}
	movs r4, #0
	cmp r1, #0
	bls _0222B2AA
	ldr r2, _0222B2B0 @ =0x0000FFFF
_0222B296:
	ldrh r3, [r0]
	cmp r3, r2
	bne _0222B2A2
	movs r0, #1
	pop {r3, r4}
	bx lr
_0222B2A2:
	adds r4, r4, #1
	adds r0, r0, #2
	cmp r4, r1
	blo _0222B296
_0222B2AA:
	movs r0, #0
	pop {r3, r4}
	bx lr
	.align 2, 0
_0222B2B0: .4byte 0x0000FFFF
	thumb_func_end ov45_0222B28C

	thumb_func_start ov45_0222B2B4
ov45_0222B2B4: @ 0x0222B2B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r4, r2, #0
	str r1, [sp]
	cmp r3, #0
	beq _0222B38A
	ldr r2, _0222B460 @ =0x00000508
	movs r1, #0x42
	adds r0, r4, r2
	adds r2, #0x20
	lsls r1, r1, #2
	ldr r2, [r4, r2]
	adds r1, r4, r1
	bl ov45_0222BCE4
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222B2EA
	ldr r0, _0222B464 @ =0x0000052C
	movs r1, #1
	str r1, [r4, r0]
_0222B2EA:
	adds r0, r5, #0
	bl ov45_0222EC68
	movs r2, #0x16
	lsls r2, r2, #4
	adds r1, r0, #0
	ldrb r2, [r4, r2]
	ldr r0, [r4, #4]
	movs r3, #3
	bl ov45_0222D8C8
	movs r0, #0x4a
	lsls r0, r0, #2
	str r5, [r4, r0]
	adds r0, r5, #0
	add r1, sp, #0xc
	bl ov45_0222EA4C
	movs r0, #5
	lsls r0, r0, #6
	adds r0, r4, r0
	add r1, sp, #0xc
	bl ov45_0222D500
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222AA84
	adds r6, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222AAA8
	adds r7, r0, #0
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222AA28
	cmp r6, #0
	beq _0222B364
	cmp r0, #1
	bne _0222B364
	movs r2, #5
	ldr r3, _0222B468 @ =0x00000528
	lsls r2, r2, #6
	lsls r0, r6, #0x10
	lsls r1, r7, #0x18
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	lsrs r0, r0, #0x10
	lsrs r1, r1, #0x18
	bl ov45_02230F94
	movs r1, #0x51
	lsls r1, r1, #2
	str r0, [sp, #4]
	str r0, [r4, r1]
	b _0222B376
_0222B364:
	movs r0, #0x51
	movs r1, #0xc
	lsls r0, r0, #2
	strb r1, [r4, r0]
	adds r1, r0, #1
	movs r2, #0
	strb r2, [r4, r1]
	adds r0, r0, #2
	strb r2, [r4, r0]
_0222B376:
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222BAC4
	adds r0, r4, #0
	bl ov45_0222BA3C
	b _0222B3CE
_0222B38A:
	bl ov45_0222EA78
	adds r6, r0, #0
	adds r0, r5, #0
	bl ov45_0222EC68
	adds r7, r0, #0
	ldr r0, [sp]
	bl ov45_0222A9CC
	adds r2, r0, #0
	ldr r0, [r4, #4]
	adds r1, r7, #0
	movs r3, #0
	bl ov45_0222D8C8
	cmp r6, r5
	bne _0222B3B6
	ldr r0, [r4, #4]
	adds r1, r7, #0
	bl ov45_0222D8F0
_0222B3B6:
	ldr r0, _0222B46C @ =0x000004BC
	movs r2, #0
	adds r0, r4, r0
	adds r1, r5, #0
	mvns r2, r2
	bl ov45_0222CBD0
	cmp r0, #0
	beq _0222B3CE
	adds r0, r4, #0
	bl ov45_0222BA3C
_0222B3CE:
	adds r0, r5, #0
	bl ov45_0222EC68
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0xf8
	ldr r1, [r0]
	movs r0, #1
	lsls r0, r6
	orrs r1, r0
	adds r0, r4, #0
	adds r0, #0xf8
	str r1, [r0]
	adds r0, r5, #0
	bl ov45_0222F484
	cmp r0, #1
	bne _0222B43E
	movs r0, #0xf3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r6, #0
	movs r2, #1
	bl ov45_0222C944
	str r6, [sp, #8]
	movs r2, #0xf3
	lsls r2, r2, #2
	ldr r0, [r4, #4]
	add r1, sp, #8
	adds r2, r4, r2
	bl ov45_0222DC08
	adds r0, r5, #0
	bl ov45_0222F4AC
	adds r3, r0, #0
	beq _0222B42C
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r6, #0
	movs r2, #1
	bl ov45_0222C9A0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0222B42C:
	movs r0, #0xf9
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r6, #0
	movs r2, #0
	bl ov45_0222C9A0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0222B43E:
	movs r0, #0xf3
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r6, #0
	movs r2, #0
	bl ov45_0222C944
	movs r0, #0xf9
	lsls r0, r0, #2
	movs r2, #0
	adds r0, r4, r0
	adds r1, r6, #0
	adds r3, r2, #0
	bl ov45_0222C9A0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222B460: .4byte 0x00000508
_0222B464: .4byte 0x0000052C
_0222B468: .4byte 0x00000528
_0222B46C: .4byte 0x000004BC
	thumb_func_end ov45_0222B2B4

	thumb_func_start ov45_0222B470
ov45_0222B470: @ 0x0222B470
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	bl ov45_0222E9E0
	cmp r6, r0
	beq _0222B528
	adds r0, r6, #0
	bl ov45_0222EC68
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov45_0222AFF8
	cmp r0, #1
	bne _0222B4A4
	adds r0, r5, #0
	bl ov45_0222B020
	cmp r4, r0
	bne _0222B4A4
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	bl ov45_0222BD5C
_0222B4A4:
	ldr r0, [r5, #4]
	adds r1, r4, #0
	bl ov45_0222D8D4
	cmp r0, #0
	beq _0222B4C2
	adds r0, r6, #0
	bl ov45_0222EAD4
	bl ov45_0222EC68
	adds r1, r0, #0
	ldr r0, [r5, #4]
	bl ov45_0222D8F0
_0222B4C2:
	movs r0, #0xf3
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r1, r4, #0
	movs r2, #0
	bl ov45_0222C944
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r1, r4, #0
	bl ov45_0222BDE8
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r1, r4, #0
	bl ov45_0222BDB0
	ldr r0, _0222B52C @ =0x000004BC
	movs r2, #0
	adds r0, r5, r0
	adds r1, r6, #0
	mvns r2, r2
	bl ov45_0222CBD0
	cmp r0, #0
	beq _0222B500
	adds r0, r5, #0
	bl ov45_0222BA3C
_0222B500:
	movs r0, #0xf9
	lsls r0, r0, #2
	movs r2, #0
	adds r0, r5, r0
	adds r1, r4, #0
	adds r3, r2, #0
	bl ov45_0222C9A0
	adds r0, r6, #0
	bl ov45_0222EC68
	adds r1, r5, #0
	adds r1, #0xfc
	ldr r2, [r1]
	movs r1, #1
	lsls r1, r0
	adds r0, r2, #0
	orrs r0, r1
	adds r5, #0xfc
	str r0, [r5]
_0222B528:
	pop {r4, r5, r6, pc}
	nop
_0222B52C: .4byte 0x000004BC
	thumb_func_end ov45_0222B470

	thumb_func_start ov45_0222B530
ov45_0222B530: @ 0x0222B530
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl ov45_0222EC68
	movs r1, #0x41
	adds r6, r0, #0
	lsls r1, r1, #2
	movs r2, #1
	ldr r0, [r4, r1]
	lsls r2, r6
	orrs r0, r2
	str r0, [r4, r1]
	adds r0, r5, #0
	bl ov45_0222A920
	cmp r0, #8
	bhi _0222B57E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222B560: @ jump table
	.2byte _0222B57E - _0222B560 - 2 @ case 0
	.2byte _0222B57E - _0222B560 - 2 @ case 1
	.2byte _0222B572 - _0222B560 - 2 @ case 2
	.2byte _0222B572 - _0222B560 - 2 @ case 3
	.2byte _0222B572 - _0222B560 - 2 @ case 4
	.2byte _0222B572 - _0222B560 - 2 @ case 5
	.2byte _0222B572 - _0222B560 - 2 @ case 6
	.2byte _0222B572 - _0222B560 - 2 @ case 7
	.2byte _0222B572 - _0222B560 - 2 @ case 8
_0222B572:
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	adds r1, r6, #0
	bl ov45_0222BDE8
_0222B57E:
	adds r0, r5, #0
	bl ov45_0222AADC
	cmp r0, #1
	bne _0222B59C
	adds r0, r5, #0
	bl ov45_0222AAC8
	adds r1, r0, #0
	movs r0, #0xeb
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r2, r6, #0
	bl ov45_0222C8C8
_0222B59C:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222B530

	thumb_func_start ov45_0222B5A0
ov45_0222B5A0: @ 0x0222B5A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r1, #0
	add r0, sp, #0
	movs r6, #0
	blx ov45_022320C4
	adds r0, r4, #0
	adds r0, #0xd4
	add r1, sp, #0
	bl ov45_0222D500
	add r0, sp, #0
	ldm r0!, {r2, r3}
	adds r0, r4, #0
	adds r0, #0xd8
	stm r0!, {r2, r3}
	cmp r5, #0x13
	bls _0222B5CA
	b _0222B73A
_0222B5CA:
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222B5D6: @ jump table
	.2byte _0222B5FE - _0222B5D6 - 2 @ case 0
	.2byte _0222B64A - _0222B5D6 - 2 @ case 1
	.2byte _0222B634 - _0222B5D6 - 2 @ case 2
	.2byte _0222B634 - _0222B5D6 - 2 @ case 3
	.2byte _0222B634 - _0222B5D6 - 2 @ case 4
	.2byte _0222B634 - _0222B5D6 - 2 @ case 5
	.2byte _0222B634 - _0222B5D6 - 2 @ case 6
	.2byte _0222B672 - _0222B5D6 - 2 @ case 7
	.2byte _0222B65C - _0222B5D6 - 2 @ case 8
	.2byte _0222B65C - _0222B5D6 - 2 @ case 9
	.2byte _0222B65C - _0222B5D6 - 2 @ case 10
	.2byte _0222B69A - _0222B5D6 - 2 @ case 11
	.2byte _0222B684 - _0222B5D6 - 2 @ case 12
	.2byte _0222B684 - _0222B5D6 - 2 @ case 13
	.2byte _0222B684 - _0222B5D6 - 2 @ case 14
	.2byte _0222B71E - _0222B5D6 - 2 @ case 15
	.2byte _0222B6AC - _0222B5D6 - 2 @ case 16
	.2byte _0222B6D6 - _0222B5D6 - 2 @ case 17
	.2byte _0222B6F4 - _0222B5D6 - 2 @ case 18
	.2byte _0222B704 - _0222B5D6 - 2 @ case 19
_0222B5FE:
	adds r1, r4, #0
	ldr r0, [r4, #4]
	adds r1, #0xd4
	bl ov45_0222D8BC
	adds r0, r4, #0
	adds r0, #0xd8
	ldm r0!, {r2, r3}
	adds r0, r4, #0
	movs r1, #0x7f
	adds r0, #0xe0
	stm r0!, {r2, r3}
	lsls r1, r1, #2
	ldrb r3, [r4, r1]
	movs r0, #1
	movs r2, #1
	bics r3, r0
	adds r0, r3, #0
	orrs r0, r2
	strb r0, [r4, r1]
	adds r0, r2, #0
	adds r0, #0xff
	ldr r0, [r4, r0]
	orrs r0, r2
	adds r2, #0xff
	str r0, [r4, r2]
	b _0222B73A
_0222B634:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0222B64A
	movs r1, #0x4b
	lsls r1, r1, #2
	movs r6, #1
	adds r0, r1, #0
	str r6, [r4, #8]
	adds r0, #0xd6
	movs r7, #0
	strh r1, [r4, r0]
_0222B64A:
	ldr r0, _0222B74C @ =0x000001FD
	strb r5, [r4, r0]
	subs r0, #0xfd
	ldr r1, [r4, r0]
	movs r0, #2
	orrs r1, r0
	adds r0, #0xfe
	str r1, [r4, r0]
	b _0222B73A
_0222B65C:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0222B672
	movs r1, #0x4b
	lsls r1, r1, #2
	movs r6, #1
	adds r0, r1, #0
	str r6, [r4, #8]
	adds r0, #0xd6
	movs r7, #0
	strh r1, [r4, r0]
_0222B672:
	ldr r0, _0222B750 @ =0x000001FE
	strb r5, [r4, r0]
	subs r0, #0xfe
	ldr r1, [r4, r0]
	movs r0, #4
	orrs r1, r0
	adds r0, #0xfc
	str r1, [r4, r0]
	b _0222B73A
_0222B684:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0222B69A
	movs r1, #0x4b
	lsls r1, r1, #2
	movs r6, #1
	adds r0, r1, #0
	str r6, [r4, #8]
	adds r0, #0xd6
	movs r7, #0
	strh r1, [r4, r0]
_0222B69A:
	ldr r0, _0222B754 @ =0x000001FF
	strb r5, [r4, r0]
	subs r0, #0xff
	ldr r1, [r4, r0]
	movs r0, #8
	orrs r1, r0
	adds r0, #0xf8
	str r1, [r4, r0]
	b _0222B73A
_0222B6AC:
	movs r6, #1
	movs r0, #6
	adds r7, r6, #0
	bl ov45_0222ECDC
	adds r5, r0, #0
	movs r0, #7
	bl ov45_0222ECDC
	adds r2, r0, #0
	ldr r0, _0222B758 @ =0x0000049C
	adds r1, r5, #0
	adds r0, r4, r0
	bl ov45_0222CA7C
	movs r1, #0x4b
	lsls r1, r1, #2
	adds r0, r1, #0
	adds r0, #0xd8
	strh r1, [r4, r0]
	b _0222B73A
_0222B6D6:
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0xc
	bics r2, r0
	movs r0, #8
	orrs r2, r0
	adds r0, #0xf8
	strb r2, [r4, r1]
	ldr r1, [r4, r0]
	movs r0, #0x20
	orrs r1, r0
	adds r0, #0xe0
	str r1, [r4, r0]
	b _0222B73A
_0222B6F4:
	movs r1, #0x4b
	lsls r1, r1, #2
	adds r0, r1, #0
	adds r0, #0xda
	movs r6, #1
	movs r7, #2
	strh r1, [r4, r0]
	b _0222B73A
_0222B704:
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x80
	movs r6, #1
	orrs r2, r0
	strb r2, [r4, r1]
	movs r1, #0xe1
	lsls r1, r1, #2
	lsls r0, r0, #2
	movs r7, #4
	strh r1, [r4, r0]
	b _0222B73A
_0222B71E:
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x60
	bics r2, r0
	movs r0, #0x20
	orrs r2, r0
	adds r0, #0xe0
	strb r2, [r4, r1]
	ldr r1, [r4, r0]
	movs r0, #0x10
	orrs r1, r0
	adds r0, #0xf0
	str r1, [r4, r0]
_0222B73A:
	cmp r6, #0
	beq _0222B746
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov45_0222C370
_0222B746:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B74C: .4byte 0x000001FD
_0222B750: .4byte 0x000001FE
_0222B754: .4byte 0x000001FF
_0222B758: .4byte 0x0000049C
	thumb_func_end ov45_0222B5A0

	thumb_func_start ov45_0222B75C
ov45_0222B75C: @ 0x0222B75C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r0, #0x42
	adds r4, r2, #0
	adds r6, r1, #0
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222B77C
	ldr r0, _0222B798 @ =0x0000052C
	movs r1, #1
	str r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0222B77C:
	movs r0, #0x42
	lsls r0, r0, #2
	adds r0, r4, r0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov45_0222BB00
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r4]
	adds r0, r4, r0
	bl ov45_0222BAC4
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222B798: .4byte 0x0000052C
	thumb_func_end ov45_0222B75C

	thumb_func_start ov45_0222B79C
ov45_0222B79C: @ 0x0222B79C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xc8
	blx FUN_020E5B44
	add r0, sp, #4
	bl ov45_0222EC10
	adds r4, #0x20
	adds r0, r4, #0
	bl ov45_0222AA84
	adds r6, r0, #0
	adds r0, r4, #0
	bl ov45_0222AAA8
	adds r2, r0, #0
	lsls r1, r6, #0x10
	lsls r2, r2, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x18
	movs r3, #0
	bl ov45_0222D638
	movs r6, #0
	adds r4, r6, #0
_0222B7DA:
	ldr r0, [sp, #8]
	movs r1, #0
	ldr r0, [r0, r4]
	mvns r1, r1
	cmp r0, r1
	beq _0222B80A
	bl ov45_0222EA2C
	str r0, [sp]
	bl ov45_0222AA84
	adds r7, r0, #0
	ldr r0, [sp]
	bl ov45_0222AAA8
	adds r2, r0, #0
	lsls r1, r7, #0x10
	lsls r2, r2, #0x18
	adds r0, r5, #0
	lsrs r1, r1, #0x10
	lsrs r2, r2, #0x18
	movs r3, #0
	bl ov45_0222D638
_0222B80A:
	adds r6, r6, #1
	adds r4, r4, #4
	cmp r6, #0x14
	blt _0222B7DA
	movs r4, #0
	movs r7, #1
_0222B816:
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ov45_0222EDC4
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl ov45_0222EDF0
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	adds r3, r7, #0
	bl ov45_0222D638
	adds r4, r4, #1
	cmp r4, #0x14
	blt _0222B816
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222B79C

	thumb_func_start ov45_0222B840
ov45_0222B840: @ 0x0222B840
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0x7f
	lsls r0, r0, #2
	ldrb r0, [r4, r0]
	lsls r1, r0, #0x1f
	lsrs r1, r1, #0x1f
	cmp r1, #1
	bne _0222B89E
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	bne _0222B89E
	bl ov45_0222E96C
	cmp r0, #2
	bne _0222B89E
	adds r0, r4, #0
	bl ov45_0222AD4C
	adds r2, r4, #0
	adds r2, #0xe0
	ldr r3, [r2]
	adds r2, r4, #0
	adds r2, #0xe4
	movs r1, #0
	ldr r2, [r2]
	adds r5, r0, r3
	adcs r1, r2
	adds r0, r4, #0
	adds r0, #0xd8
	ldr r3, [r0]
	adds r0, r4, #0
	adds r0, #0xdc
	ldr r2, [r0]
	subs r0, r5, r3
	sbcs r1, r2
	bge _0222B89E
	movs r1, #0x7f
	lsls r1, r1, #2
	ldrb r2, [r4, r1]
	movs r0, #0x80
	orrs r2, r0
	strb r2, [r4, r1]
	movs r1, #0xe1
	lsls r1, r1, #2
	lsls r0, r0, #2
	strh r1, [r4, r0]
_0222B89E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222B840

	thumb_func_start ov45_0222B8A0
ov45_0222B8A0: @ 0x0222B8A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	str r1, [sp]
	adds r0, r1, #0
	adds r4, r2, #0
	bl FUN_02028E9C
	str r0, [sp, #0x18]
	ldr r0, [sp]
	bl FUN_02074904
	str r0, [sp, #0x14]
	ldr r0, [sp]
	bl FUN_0202A634
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl FUN_0202CA44
	str r0, [sp, #0x10]
	ldr r0, [sp]
	bl FUN_02028D3C
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	adds r1, r4, #0
	bl FUN_02028F68
	adds r1, r5, #0
	adds r4, r0, #0
	adds r1, #0x28
	movs r2, #8
	bl FUN_02026A68
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #8
	bl FUN_02026A68
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #0
	mvns r0, r0
	str r0, [r5, #0x20]
	ldr r0, [sp, #0x18]
	bl FUN_02028F84
	str r0, [r5, #0x24]
	ldr r0, [sp, #0x14]
	bl FUN_02074640
	str r0, [sp, #4]
	movs r4, #0
	adds r6, r5, #0
_0222B910:
	ldr r0, [sp, #4]
	cmp r4, r0
	bge _0222B950
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #5
	movs r2, #0
	adds r7, r0, #0
	bl FUN_0206E540
	adds r1, r6, #0
	adds r1, #0x40
	strh r0, [r1]
	adds r0, r7, #0
	movs r1, #0x70
	movs r2, #0
	bl FUN_0206E540
	adds r1, r5, r4
	adds r1, #0x4c
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	adds r1, r5, r4
	adds r1, #0x52
	strb r0, [r1]
	b _0222B958
_0222B950:
	adds r1, r6, #0
	ldr r0, _0222BA38 @ =0x000001EF
	adds r1, #0x40
	strh r0, [r1]
_0222B958:
	adds r4, r4, #1
	adds r6, r6, #2
	cmp r4, #6
	blt _0222B910
	ldr r0, [sp, #0x18]
	bl FUN_02028F94
	adds r1, r5, #0
	adds r1, #0x58
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	bl FUN_02029088
	adds r1, r5, #0
	adds r1, #0x59
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	bl FUN_0202903C
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	bl ov45_0222CCE4
	adds r1, r5, #0
	adds r1, #0x5a
	strh r0, [r1]
	ldr r0, [sp, #0x10]
	bl FUN_0202CA8C
	adds r1, r5, #0
	adds r1, #0x5c
	strh r0, [r1]
	ldr r0, [sp, #0x10]
	bl FUN_0202CA90
	adds r1, r5, #0
	adds r1, #0x5e
	strb r0, [r1]
	ldr r0, [sp, #0xc]
	bl FUN_0202A55C
	adds r1, r5, #0
	adds r1, #0x5f
	strb r0, [r1]
	ldr r0, [sp, #0x18]
	bl FUN_020290A0
	adds r1, r5, #0
	adds r1, #0x60
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #0xff
	adds r0, #0x61
	strb r1, [r0]
	adds r1, r5, #0
	movs r0, #0
	adds r1, #0x63
	strb r0, [r1]
	adds r1, r5, #0
	movs r2, #7
	adds r1, #0x62
	strb r2, [r1]
	ldr r1, [sp, #8]
	adds r4, r5, #0
	adds r1, #0x24
	str r1, [sp, #8]
	ldm r1!, {r2, r3}
	str r1, [sp, #8]
	adds r1, r5, #0
	adds r1, #0x64
	stm r1!, {r2, r3}
	movs r3, #0x18
	adds r2, r3, #0
	subs r2, #0x19
_0222B9F4:
	adds r1, r5, r0
	adds r1, #0x6c
	strb r3, [r1]
	str r2, [r4, #0x78]
	adds r0, r0, #1
	adds r4, r4, #4
	cmp r0, #0xc
	blt _0222B9F4
	movs r2, #0
	adds r3, r5, #0
	adds r1, r2, #0
_0222BA0A:
	adds r0, r3, #0
	adds r0, #0xa8
	adds r2, r2, #1
	adds r3, r3, #2
	strh r1, [r0]
	cmp r2, #2
	blt _0222BA0A
	movs r1, #0
	adds r0, r5, #0
	mvns r1, r1
	adds r0, #0xac
	str r1, [r0]
	adds r0, r5, #0
	movs r1, #3
	adds r0, #0xb0
	str r1, [r0]
	ldr r1, [sp]
	adds r0, r5, #0
	bl ov45_0222BAC4
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0222BA38: .4byte 0x000001EF
	thumb_func_end ov45_0222B8A0

	thumb_func_start ov45_0222BA3C
ov45_0222BA3C: @ 0x0222BA3C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222BA58
	ldr r0, _0222BABC @ =0x0000052C
	movs r1, #1
	str r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0222BA58:
	ldr r7, _0222BAC0 @ =0x000004BC
	movs r4, #0
	adds r6, r5, #0
_0222BA5E:
	adds r0, r5, r7
	adds r1, r4, #0
	bl ov45_0222CC50
	movs r1, #0x5d
	adds r2, r5, r4
	lsls r1, r1, #2
	strb r0, [r2, r1]
	adds r0, r5, r7
	adds r1, r4, #0
	bl ov45_0222CC7C
	movs r1, #6
	lsls r1, r1, #6
	str r0, [r6, r1]
	adds r4, r4, #1
	adds r6, r6, #4
	cmp r4, #0xc
	blt _0222BA5E
	subs r1, #0x68
	adds r0, r5, r1
	adds r1, #0x18
	adds r1, r5, r1
	movs r2, #0x10
	blx FUN_020D4A50
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov45_0222E9F8
	movs r1, #0x42
	lsls r1, r1, #2
	adds r0, r5, r1
	adds r1, #0x28
	adds r1, r5, r1
	movs r2, #0x10
	blx FUN_020D4A50
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BAC4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222BABC: .4byte 0x0000052C
_0222BAC0: .4byte 0x000004BC
	thumb_func_end ov45_0222BA3C

	thumb_func_start ov45_0222BAC4
ov45_0222BAC4: @ 0x0222BAC4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r4, #0
	adds r1, #0x20
	movs r2, #0x94
	bl FUN_020275C4
	adds r4, #0xb4
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222BAC4

	thumb_func_start ov45_0222BADC
ov45_0222BADC: @ 0x0222BADC
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r1, r4, #0
	adds r1, #0x20
	movs r2, #0x94
	bl FUN_020275C4
	adds r4, #0xb4
	ldr r1, [r4]
	cmp r0, r1
	beq _0222BAFC
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
_0222BAFC:
	movs r0, #1
	pop {r4, pc}
	thumb_func_end ov45_0222BADC

	thumb_func_start ov45_0222BB00
ov45_0222BB00: @ 0x0222BB00
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r3, r5, #0
	adds r7, r2, #0
	adds r6, r4, #0
	adds r3, #0x20
	movs r2, #0x12
_0222BB10:
	ldm r6!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _0222BB10
	ldr r0, [r6]
	cmp r7, #0x94
	str r0, [r3]
	bhi _0222BB2E
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x20
	adds r2, r7, #0
	blx FUN_020D4A50
	b _0222BB3A
_0222BB2E:
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x20
	movs r2, #0x94
	blx FUN_020D4A50
_0222BB3A:
	adds r4, #8
	adds r1, r5, #0
	adds r0, r4, #0
	adds r1, #0x10
	movs r2, #0x10
	blx FUN_020D4A50
	adds r0, r5, #0
	adds r5, #0x28
	adds r1, r5, #0
	movs r2, #0x10
	blx FUN_020D4A50
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222BB00

	thumb_func_start ov45_0222BB58
ov45_0222BB58: @ 0x0222BB58
	movs r1, #0
	str r1, [r0, #8]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BB58

	thumb_func_start ov45_0222BB60
ov45_0222BB60: @ 0x0222BB60
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #4
	adds r6, r2, #0
	ldrsh r2, [r5, r1]
	adds r7, r3, #0
	subs r0, r2, #1
	bmi _0222BB8C
	strh r0, [r5, #4]
	ldrsh r1, [r5, r1]
	movs r0, #0xd2
	lsls r0, r0, #2
	cmp r1, r0
	bne _0222BBA6
	movs r0, #0
	movs r1, #0x7f
	bl FUN_02005F50
	movs r0, #1
	strb r0, [r5, #0xe]
	b _0222BBA6
_0222BB8C:
	cmp r2, #0
	bne _0222BBA6
	ldrb r2, [r5]
	movs r0, #2
	orrs r0, r2
	strb r0, [r5]
	ldr r2, [r4, #8]
	movs r0, #0x80
	orrs r0, r2
	str r0, [r4, #8]
	ldrsh r0, [r5, r1]
	subs r0, r0, #1
	strh r0, [r5, #4]
_0222BBA6:
	movs r0, #6
	ldrsh r2, [r5, r0]
	subs r1, r2, #1
	bmi _0222BBB2
	strh r1, [r5, #6]
	b _0222BBCC
_0222BBB2:
	cmp r2, #0
	bne _0222BBCC
	ldr r2, [r4, #8]
	movs r1, #4
	orrs r2, r1
	movs r1, #8
	orrs r2, r1
	movs r1, #2
	orrs r1, r2
	str r1, [r4, #8]
	ldrsh r0, [r5, r0]
	subs r0, r0, #1
	strh r0, [r5, #6]
_0222BBCC:
	movs r0, #8
	ldrsh r2, [r5, r0]
	subs r1, r2, #1
	bmi _0222BBD8
	strh r1, [r5, #8]
	b _0222BBFC
_0222BBD8:
	cmp r2, #0
	bne _0222BBFC
	ldrb r1, [r5]
	movs r2, #0xc
	bics r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r5]
	ldr r2, [r4, #8]
	movs r1, #0x20
	orrs r1, r2
	str r1, [r4, #8]
	ldrsh r0, [r5, r0]
	subs r0, r0, #1
	strh r0, [r5, #8]
	adds r0, r7, #0
	bl ov45_0222CA8C
_0222BBFC:
	movs r0, #0xa
	ldrsh r1, [r5, r0]
	subs r0, r1, #1
	bmi _0222BC08
	strh r0, [r5, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
_0222BC08:
	cmp r1, #0
	bne _0222BC36
	adds r0, r6, #0
	bl ov45_0222C3A8
	ldrb r0, [r5, #0xc]
	cmp r0, #0
	bne _0222BC1E
	ldr r0, _0222BC38 @ =0x00000481
	bl FUN_02005D48
_0222BC1E:
	ldrb r1, [r5]
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r5]
	ldr r1, [r4, #8]
	movs r0, #0x40
	orrs r0, r1
	str r0, [r4, #8]
	movs r0, #0xa
	ldrsh r0, [r5, r0]
	subs r0, r0, #1
	strh r0, [r5, #0xa]
_0222BC36:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222BC38: .4byte 0x00000481
	thumb_func_end ov45_0222BB60

	thumb_func_start ov45_0222BC3C
ov45_0222BC3C: @ 0x0222BC3C
	ldrb r2, [r0]
	movs r1, #1
	bics r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	movs r1, #2
	bics r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	movs r1, #0xc
	bics r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	movs r1, #0x10
	bics r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	movs r1, #0x60
	bics r2, r1
	strb r2, [r0]
	ldrb r2, [r0]
	movs r1, #0x80
	bics r2, r1
	strb r2, [r0]
	movs r1, #1
	strb r1, [r0, #1]
	movs r1, #7
	strb r1, [r0, #2]
	movs r1, #0xb
	strb r1, [r0, #3]
	subs r1, #0xc
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	thumb_func_end ov45_0222BC3C

	thumb_func_start ov45_0222BC84
ov45_0222BC84: @ 0x0222BC84
	push {r3, lr}
	ldrb r0, [r0, #0xd]
	cmp r0, #1
	bne _0222BC96
	movs r0, #7
	movs r1, #0x2a
	bl FUN_02005B50
	pop {r3, pc}
_0222BC96:
	movs r0, #7
	movs r1, #0x7f
	bl FUN_02005B50
	pop {r3, pc}
	thumb_func_end ov45_0222BC84

	thumb_func_start ov45_0222BCA0
ov45_0222BCA0: @ 0x0222BCA0
	movs r1, #0xe1
	lsls r1, r1, #2
	strh r1, [r0]
	bx lr
	thumb_func_end ov45_0222BCA0

	thumb_func_start ov45_0222BCA8
ov45_0222BCA8: @ 0x0222BCA8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _0222BCB2
	movs r1, #1
_0222BCB2:
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BCA8

	thumb_func_start ov45_0222BCB8
ov45_0222BCB8: @ 0x0222BCB8
	movs r1, #0
	ldrsh r1, [r0, r1]
	cmp r1, #0
	ble _0222BCC4
	subs r1, r1, #1
	strh r1, [r0]
_0222BCC4:
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BCB8

	thumb_func_start ov45_0222BCC8
ov45_0222BCC8: @ 0x0222BCC8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	bl FUN_02028ED0
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222BCC8

	thumb_func_start ov45_0222BCD8
ov45_0222BCD8: @ 0x0222BCD8
	ldr r3, _0222BCE0 @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_0222BCE0: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222BCD8

	thumb_func_start ov45_0222BCE4
ov45_0222BCE4: @ 0x0222BCE4
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r7, #0
	movs r1, #0x94
	bl FUN_0201AA8C
	adds r6, r0, #0
	adds r0, r4, #0
	adds r0, #0x20
	adds r1, r6, #0
	movs r2, #0x94
	blx FUN_020D48B4
	adds r4, #0x10
	adds r1, r6, #0
	adds r0, r4, #0
	adds r1, #8
	movs r2, #0x10
	blx FUN_020D4A50
	ldr r1, [r5]
	adds r0, r6, #0
	adds r2, r7, #0
	bl ov45_0222A844
	adds r0, r6, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222BCE4

	thumb_func_start ov45_0222BD24
ov45_0222BD24: @ 0x0222BD24
	movs r1, #1
	strb r1, [r0, #2]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BD24

	thumb_func_start ov45_0222BD2C
ov45_0222BD2C: @ 0x0222BD2C
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end ov45_0222BD2C

	thumb_func_start ov45_0222BD30
ov45_0222BD30: @ 0x0222BD30
	movs r2, #0x14
	movs r1, #0
_0222BD34:
	strb r1, [r0]
	adds r0, r0, #1
	subs r2, r2, #1
	bne _0222BD34
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BD30

	thumb_func_start ov45_0222BD40
ov45_0222BD40: @ 0x0222BD40
	ldr r3, _0222BD48 @ =FUN_020E5B44
	movs r1, #0
	movs r2, #0x28
	bx r3
	.align 2, 0
_0222BD48: .4byte FUN_020E5B44
	thumb_func_end ov45_0222BD40

	thumb_func_start ov45_0222BD4C
ov45_0222BD4C: @ 0x0222BD4C
	movs r1, #0
	strh r1, [r0, #4]
	strb r1, [r0, #6]
	ldr r3, _0222BD58 @ =ov45_0222BE54
	strb r1, [r0, #0xa]
	bx r3
	.align 2, 0
_0222BD58: .4byte ov45_0222BE54
	thumb_func_end ov45_0222BD4C

	thumb_func_start ov45_0222BD5C
ov45_0222BD5C: @ 0x0222BD5C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	strh r1, [r4, #4]
	movs r1, #4
	strb r1, [r4, #6]
	bl ov45_0222BE54
	movs r0, #0
	strb r0, [r4, #0xa]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222BD5C

	thumb_func_start ov45_0222BD74
ov45_0222BD74: @ 0x0222BD74
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222BD82
	bl GF_AssertFail
_0222BD82:
	movs r0, #1
	adds r1, r0, #0
	ldr r2, [r5]
	lsls r1, r4
	tst r1, r2
	bne _0222BD90
	movs r0, #0
_0222BD90:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222BD74

	thumb_func_start ov45_0222BD94
ov45_0222BD94: @ 0x0222BD94
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222BDA2
	bl GF_AssertFail
_0222BDA2:
	movs r0, #1
	ldr r1, [r5]
	lsls r0, r4
	orrs r0, r1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222BD94

	thumb_func_start ov45_0222BDB0
ov45_0222BDB0: @ 0x0222BDB0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222BDBE
	bl GF_AssertFail
_0222BDBE:
	movs r0, #1
	lsls r0, r4
	ldr r1, [r5]
	mvns r0, r0
	ands r0, r1
	str r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222BDB0

	thumb_func_start ov45_0222BDCC
ov45_0222BDCC: @ 0x0222BDCC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222BDDA
	bl GF_AssertFail
_0222BDDA:
	adds r5, #0xc
	ldrb r0, [r5, r4]
	adds r0, r0, #1
	cmp r0, #6
	bgt _0222BDE6
	strb r0, [r5, r4]
_0222BDE6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222BDCC

	thumb_func_start ov45_0222BDE8
ov45_0222BDE8: @ 0x0222BDE8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222BDF6
	bl GF_AssertFail
_0222BDF6:
	movs r1, #0
	adds r0, r5, r4
	strb r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222BDE8

	thumb_func_start ov45_0222BE00
ov45_0222BE00: @ 0x0222BE00
	ldrb r2, [r0, #6]
	strh r2, [r0, #0x22]
	strh r1, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222BE00

	thumb_func_start ov45_0222BE08
ov45_0222BE08: @ 0x0222BE08
	push {r4, lr}
	ldr r4, _0222BE24 @ =0x000001E2
	adds r3, r0, #0
	movs r0, #2
	strh r0, [r3, r4]
	subs r0, r4, #2
	strh r2, [r3, r0]
	subs r2, r4, #2
	adds r2, r3, r2
	movs r0, #1
	movs r3, #4
	bl ov45_0222EF4C
	pop {r4, pc}
	.align 2, 0
_0222BE24: .4byte 0x000001E2
	thumb_func_end ov45_0222BE08

	thumb_func_start ov45_0222BE28
ov45_0222BE28: @ 0x0222BE28
	push {r4, lr}
	ldr r2, _0222BE44 @ =0x000001C6
	adds r4, r0, #0
	movs r3, #4
	adds r0, r2, #0
	strb r3, [r4, r2]
	adds r0, #0x1c
	adds r2, #0x1a
	strh r3, [r4, r0]
	movs r0, #2
	adds r2, r4, r2
	bl ov45_0222EF4C
	pop {r4, pc}
	.align 2, 0
_0222BE44: .4byte 0x000001C6
	thumb_func_end ov45_0222BE28

	thumb_func_start ov45_0222BE48
ov45_0222BE48: @ 0x0222BE48
	movs r1, #1
	strh r1, [r0, #0x24]
	movs r1, #0
	strh r1, [r0, #0x26]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BE48

	thumb_func_start ov45_0222BE54
ov45_0222BE54: @ 0x0222BE54
	movs r1, #0
	strh r1, [r0, #0x24]
	strh r1, [r0, #0x26]
	bx lr
	thumb_func_end ov45_0222BE54

	thumb_func_start ov45_0222BE5C
ov45_0222BE5C: @ 0x0222BE5C
	ldrh r1, [r0, #0x24]
	cmp r1, #1
	bne _0222BE72
	movs r1, #0x26
	ldrsh r1, [r0, r1]
	adds r2, r1, #1
	movs r1, #0xe1
	lsls r1, r1, #2
	cmp r2, r1
	bgt _0222BE72
	strh r2, [r0, #0x26]
_0222BE72:
	bx lr
	thumb_func_end ov45_0222BE5C

	thumb_func_start ov45_0222BE74
ov45_0222BE74: @ 0x0222BE74
	ldrh r1, [r0, #0x24]
	cmp r1, #0
	bne _0222BE7E
	movs r0, #1
	bx lr
_0222BE7E:
	movs r1, #0x26
	ldrsh r1, [r0, r1]
	movs r0, #0xe1
	lsls r0, r0, #2
	cmp r1, r0
	bge _0222BE8E
	movs r0, #1
	bx lr
_0222BE8E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BE74

	thumb_func_start ov45_0222BE94
ov45_0222BE94: @ 0x0222BE94
	movs r1, #0x26
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222BE94

	thumb_func_start ov45_0222BE9C
ov45_0222BE9C: @ 0x0222BE9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldrb r0, [r1, #0x10]
	str r1, [sp]
	cmp r0, #2
	bne _0222BF0E
	movs r7, #0
	adds r4, r1, #0
	adds r5, r6, #0
_0222BEB0:
	ldr r0, [r4]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222BF0E
	adds r0, r6, #0
	bl ov45_0222A578
	adds r1, r5, #0
	ldr r2, _0222BF14 @ =0x00000528
	adds r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #2
	blt _0222BEB0
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r0, #0xec
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #0xa]
	ldr r0, [r6, #4]
	add r1, sp, #4
	bl ov45_0222D940
_0222BF0E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222BF14: .4byte 0x00000528
	thumb_func_end ov45_0222BE9C

	thumb_func_start ov45_0222BF18
ov45_0222BF18: @ 0x0222BF18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	ldrb r0, [r1, #0x10]
	str r1, [sp]
	cmp r0, #2
	bne _0222BF90
	movs r7, #0
	adds r4, r1, #0
	adds r5, r6, #0
_0222BF2C:
	ldr r0, [r4]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222BF90
	adds r0, r6, #0
	bl ov45_0222A578
	adds r1, r5, #0
	ldr r2, _0222BF94 @ =0x00000528
	adds r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	adds r7, r7, #1
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #2
	blt _0222BF2C
	adds r0, r6, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r0, #0xec
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #8]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #4
	strh r0, [r1, #0xa]
	ldr r0, [sp]
	add r1, sp, #4
	ldrb r0, [r0, #0x12]
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	bl ov45_0222D990
_0222BF90:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222BF94: .4byte 0x00000528
	thumb_func_end ov45_0222BF18

	thumb_func_start ov45_0222BF98
ov45_0222BF98: @ 0x0222BF98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	adds r6, r0, #0
	ldrb r0, [r1, #0x10]
	str r1, [sp]
	cmp r0, #4
	bhi _0222BFAA
	cmp r0, #0
	bne _0222BFAC
_0222BFAA:
	b _0222C0C2
_0222BFAC:
	adds r0, r1, #0
	ldrb r0, [r0, #0x13]
	add r5, sp, #0x30
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _0222C010
	adds r0, r1, #0
	movs r7, #0
	str r0, [sp, #4]
	adds r4, r6, #0
_0222BFC2:
	ldr r0, [sp]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222BFFA
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C0C2
	adds r0, r6, #0
	bl ov45_0222A578
	adds r1, r4, #0
	ldr r2, _0222C0C8 @ =0x00000528
	adds r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222BFFE
_0222BFFA:
	movs r0, #0
	str r0, [r5]
_0222BFFE:
	ldr r0, [sp, #4]
	adds r7, r7, #1
	adds r0, r0, #4
	str r0, [sp, #4]
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #4
	blt _0222BFC2
	b _0222C060
_0222C010:
	adds r0, r1, #0
	movs r7, #0
	str r0, [sp, #8]
	adds r4, r6, #0
_0222C018:
	cmp r7, #0
	bne _0222C04C
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C0C2
	adds r0, r6, #0
	bl ov45_0222A578
	adds r1, r4, #0
	ldr r2, _0222C0C8 @ =0x00000528
	adds r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r6, r2]
	bl ov45_0222A844
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C050
_0222C04C:
	movs r0, #0
	str r0, [r5]
_0222C050:
	ldr r0, [sp, #8]
	adds r7, r7, #1
	adds r0, r0, #4
	str r0, [sp, #8]
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #4
	blt _0222C018
_0222C060:
	ldr r0, [sp]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x20]
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x18]
	ldr r0, [sp]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x1a]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x1c]
	ldr r0, [sp]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #0xc
	strh r0, [r1, #0x1e]
	ldr r0, [sp]
	add r1, sp, #0xc
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x2c]
	ldr r0, [r6, #4]
	bl ov45_0222D9EC
_0222C0C2:
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C0C8: .4byte 0x00000528
	thumb_func_end ov45_0222BF98

	thumb_func_start ov45_0222C0CC
ov45_0222C0CC: @ 0x0222C0CC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	ldrb r0, [r4, #0x10]
	cmp r0, #8
	bhi _0222C128
	cmp r0, #0
	beq _0222C128
	ldr r0, [r4]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C128
	adds r0, r5, #0
	bl ov45_0222A578
	adds r1, r5, #0
	ldr r2, _0222C12C @ =0x00000528
	adds r1, #0xe8
	ldr r1, [r1]
	ldr r2, [r5, r2]
	bl ov45_0222A844
	ldrb r0, [r4, #0x13]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	str r0, [sp]
	ldrb r0, [r4, #0x10]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [r4]
	bl ov45_0222EC68
	add r1, sp, #0
	strh r0, [r1, #0xc]
	ldr r0, [r5, #4]
	add r1, sp, #0
	bl ov45_0222DA80
_0222C128:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222C12C: .4byte 0x00000528
	thumb_func_end ov45_0222C0CC

	thumb_func_start ov45_0222C130
ov45_0222C130: @ 0x0222C130
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp]
	ldrb r0, [r1, #0x10]
	str r1, [sp, #4]
	cmp r0, #4
	bhi _0222C1E2
	cmp r0, #0
	beq _0222C1E2
	ldr r4, [sp]
	movs r7, #0
	adds r6, r1, #0
	add r5, sp, #0x24
_0222C14A:
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222C182
	ldr r0, [r6]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C1E2
	ldr r0, [sp]
	bl ov45_0222A578
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r3, [sp]
	ldr r2, _0222C1E8 @ =0x00000528
	ldr r1, [r1]
	ldr r2, [r3, r2]
	bl ov45_0222A844
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C186
_0222C182:
	movs r0, #0
	str r0, [r5]
_0222C186:
	adds r7, r7, #1
	adds r6, r6, #4
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #4
	blt _0222C14A
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x16]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1a]
	ldr r0, [sp]
	add r1, sp, #8
	ldr r0, [r0, #4]
	bl ov45_0222DAE0
_0222C1E2:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222C1E8: .4byte 0x00000528
	thumb_func_end ov45_0222C130

	thumb_func_start ov45_0222C1EC
ov45_0222C1EC: @ 0x0222C1EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp]
	ldrb r0, [r1, #0x10]
	str r1, [sp, #4]
	cmp r0, #4
	bhi _0222C29E
	cmp r0, #0
	beq _0222C29E
	ldr r4, [sp]
	movs r7, #0
	adds r6, r1, #0
	add r5, sp, #0x24
_0222C206:
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222C23E
	ldr r0, [r6]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C29E
	ldr r0, [sp]
	bl ov45_0222A578
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r3, [sp]
	ldr r2, _0222C2A4 @ =0x00000528
	ldr r1, [r1]
	ldr r2, [r3, r2]
	bl ov45_0222A844
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C242
_0222C23E:
	movs r0, #0
	str r0, [r5]
_0222C242:
	adds r7, r7, #1
	adds r6, r6, #4
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #4
	blt _0222C206
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x16]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1a]
	ldr r0, [sp]
	add r1, sp, #8
	ldr r0, [r0, #4]
	bl ov45_0222DB3C
_0222C29E:
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222C2A4: .4byte 0x00000528
	thumb_func_end ov45_0222C1EC

	thumb_func_start ov45_0222C2A8
ov45_0222C2A8: @ 0x0222C2A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp]
	ldrb r0, [r1, #0x10]
	str r1, [sp, #4]
	cmp r0, #4
	bhi _0222C364
	cmp r0, #0
	beq _0222C364
	ldr r4, [sp]
	movs r7, #0
	adds r6, r1, #0
	add r5, sp, #0x28
_0222C2C2:
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	cmp r7, r0
	bge _0222C2FA
	ldr r0, [r6]
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C364
	ldr r0, [sp]
	bl ov45_0222A578
	adds r1, r4, #0
	adds r1, #0xe8
	ldr r3, [sp]
	ldr r2, _0222C368 @ =0x00000528
	ldr r1, [r1]
	ldr r2, [r3, r2]
	bl ov45_0222A844
	adds r0, r4, #0
	adds r0, #0xe8
	ldr r0, [r0]
	str r0, [r5]
	b _0222C2FE
_0222C2FA:
	movs r0, #0
	str r0, [r5]
_0222C2FE:
	adds r7, r7, #1
	adds r6, r6, #4
	adds r4, r4, #4
	adds r5, r5, #4
	cmp r7, #4
	blt _0222C2C2
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x18]
	ldr r0, [sp, #4]
	ldr r0, [r0, #4]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1a]
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1c]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl ov45_0222EC68
	add r1, sp, #8
	strh r0, [r1, #0x1e]
	ldr r0, [sp]
	add r1, sp, #8
	ldr r0, [r0, #4]
	bl ov45_0222DC64
_0222C364:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222C368: .4byte 0x00000528
	thumb_func_end ov45_0222C2A8

	thumb_func_start ov45_0222C36C
ov45_0222C36C: @ 0x0222C36C
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222C36C

	thumb_func_start ov45_0222C370
ov45_0222C370: @ 0x0222C370
	push {r3, lr}
	sub sp, #8
	adds r2, r0, #0
	adds r2, #0xd4
	str r1, [sp, #4]
	str r2, [sp]
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl ov45_0222DB98
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov45_0222C370

	thumb_func_start ov45_0222C388
ov45_0222C388: @ 0x0222C388
	push {r4, lr}
	movs r2, #0x65
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	movs r0, #0
	adds r4, #0x50
	mvns r0, r0
	adds r1, r4, #0
	movs r2, #0x6c
	blx FUN_020D47EC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222C388

	thumb_func_start ov45_0222C3A8
ov45_0222C3A8: @ 0x0222C3A8
	movs r1, #1
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222C3A8

	thumb_func_start ov45_0222C3B0
ov45_0222C3B0: @ 0x0222C3B0
	push {r4, r5, r6, r7}
	ldr r1, [r0]
	cmp r1, #0
	beq _0222C3FA
	ldr r3, _0222C400 @ =0x02254A3C
	movs r2, #0
	adds r4, r0, #0
	movs r1, #1
	movs r6, #2
_0222C3C2:
	ldr r7, [r0, #4]
	ldr r5, [r3]
	cmp r7, r5
	bne _0222C3CC
	str r1, [r4, #0x2c]
_0222C3CC:
	ldr r5, [r4, #0x2c]
	cmp r5, #1
	bne _0222C3E4
	ldr r5, [r4, #8]
	adds r7, r5, #1
	movs r5, #0x4b
	lsls r5, r5, #4
	cmp r7, r5
	bgt _0222C3E2
	str r7, [r4, #8]
	b _0222C3E4
_0222C3E2:
	str r6, [r4, #0x2c]
_0222C3E4:
	adds r2, r2, #1
	adds r3, r3, #4
	adds r4, r4, #4
	cmp r2, #9
	blt _0222C3C2
	ldr r1, [r0, #4]
	adds r2, r1, #1
	ldr r1, _0222C404 @ =0x000010E0
	cmp r2, r1
	bgt _0222C3FA
	str r2, [r0, #4]
_0222C3FA:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0222C400: .4byte 0x02254A3C
_0222C404: .4byte 0x000010E0
	thumb_func_end ov45_0222C3B0

	thumb_func_start ov45_0222C408
ov45_0222C408: @ 0x0222C408
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp]
	adds r7, r2, #0
	bl ov45_0222C5B4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222C476
	movs r5, #0
	str r5, [sp, #4]
_0222C422:
	ldr r1, [sp, #4]
	adds r0, r6, #0
	bl ov45_0222C4E4
	cmp r0, #2
	beq _0222C46A
	movs r4, #0
_0222C430:
	adds r0, r6, #0
	adds r1, r4, r5
	adds r2, r7, #0
	bl ov45_0222C61C
	cmp r0, #0
	bne _0222C464
	adds r0, r6, #0
	adds r1, r4, r5
	bl ov45_0222C4B4
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222C464
	ldr r0, [sp, #4]
	movs r1, #0xc
	muls r1, r0, r1
	adds r1, r6, r1
	lsls r0, r4, #2
	adds r1, r1, r0
	ldr r0, [sp]
	add sp, #8
	str r0, [r1, #0x50]
	adds r0, r4, r5
	pop {r3, r4, r5, r6, r7, pc}
_0222C464:
	adds r4, r4, #1
	cmp r4, #3
	blt _0222C430
_0222C46A:
	ldr r0, [sp, #4]
	adds r5, r5, #3
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #9
	blt _0222C422
_0222C476:
	movs r0, #0
	mvns r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222C408

	thumb_func_start ov45_0222C480
ov45_0222C480: @ 0x0222C480
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov45_0222C5B4
	movs r1, #0
	adds r6, r0, #0
	mvns r1, r1
	cmp r6, r1
	beq _0222C4B2
	movs r1, #3
	blx FUN_020F2BA4
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r2, #0xc
	muls r2, r4, r2
	movs r0, #0
	adds r2, r5, r2
	lsls r1, r1, #2
	mvns r0, r0
	adds r1, r2, r1
	str r0, [r1, #0x50]
_0222C4B2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C480

	thumb_func_start ov45_0222C4B4
ov45_0222C4B4: @ 0x0222C4B4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x1b
	blo _0222C4C2
	bl GF_AssertFail
_0222C4C2:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r0, #0xc
	muls r0, r6, r0
	adds r2, r5, r0
	lsls r0, r1, #2
	adds r0, r2, r0
	ldr r0, [r0, #0x50]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222C4B4

	thumb_func_start ov45_0222C4E4
ov45_0222C4E4: @ 0x0222C4E4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #9
	blo _0222C4F2
	bl GF_AssertFail
_0222C4F2:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldr r0, [r0, #0x2c]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222C4E4

	thumb_func_start ov45_0222C4FC
ov45_0222C4FC: @ 0x0222C4FC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #9
	blo _0222C50A
	bl GF_AssertFail
_0222C50A:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldr r0, [r0, #8]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222C4FC

	thumb_func_start ov45_0222C514
ov45_0222C514: @ 0x0222C514
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ov45_0222C5B4
	movs r1, #0
	adds r6, r0, #0
	mvns r1, r1
	cmp r6, r1
	beq _0222C548
	movs r1, #3
	blx FUN_020F2BA4
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r2, #0xc
	muls r2, r4, r2
	adds r2, r5, r2
	lsls r1, r1, #2
	adds r2, r2, r1
	movs r1, #0x4a
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r2, r1]
_0222C548:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222C514

	thumb_func_start ov45_0222C54C
ov45_0222C54C: @ 0x0222C54C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x1b
	blo _0222C55A
	bl GF_AssertFail
_0222C55A:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r0, #0xc
	muls r0, r6, r0
	adds r2, r5, r0
	lsls r0, r1, #2
	adds r1, r2, r0
	movs r0, #0x4a
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222C54C

	thumb_func_start ov45_0222C580
ov45_0222C580: @ 0x0222C580
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x1b
	blo _0222C58E
	bl GF_AssertFail
_0222C58E:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r2, #0xc
	muls r2, r6, r2
	adds r2, r5, r2
	lsls r1, r1, #2
	adds r2, r2, r1
	movs r1, #0x4a
	movs r0, #0
	lsls r1, r1, #2
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C580

	thumb_func_start ov45_0222C5B4
ov45_0222C5B4: @ 0x0222C5B4
	push {r3, r4, r5, r6}
	movs r4, #0
	adds r3, r4, #0
_0222C5BA:
	adds r5, r3, #0
	adds r6, r0, #0
_0222C5BE:
	ldr r2, [r6, #0x50]
	cmp r1, r2
	bne _0222C5CE
	lsls r0, r4, #1
	adds r0, r4, r0
	adds r0, r5, r0
	pop {r3, r4, r5, r6}
	bx lr
_0222C5CE:
	adds r5, r5, #1
	adds r6, r6, #4
	cmp r5, #3
	blt _0222C5BE
	adds r4, r4, #1
	adds r0, #0xc
	cmp r4, #9
	blt _0222C5BA
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222C5B4

	thumb_func_start ov45_0222C5E8
ov45_0222C5E8: @ 0x0222C5E8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x1b
	blo _0222C5F8
	bl GF_AssertFail
_0222C5F8:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r2, #0xc
	muls r2, r7, r2
	adds r2, r5, r2
	lsls r1, r1, #2
	adds r1, r2, r1
	adds r0, r6, #1
	adds r1, #0xbc
	str r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222C5E8

	thumb_func_start ov45_0222C61C
ov45_0222C61C: @ 0x0222C61C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x1b
	blo _0222C62C
	bl GF_AssertFail
_0222C62C:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r7, r0, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r0, #0xc
	muls r0, r7, r0
	adds r2, r5, r0
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, #0xbc
	ldr r0, [r0]
	cmp r0, r6
	bhi _0222C654
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222C654:
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222C61C

	thumb_func_start ov45_0222C658
ov45_0222C658: @ 0x0222C658
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x1b
	blo _0222C666
	bl GF_AssertFail
_0222C666:
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	adds r6, r0, #0
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r0, #0xc
	muls r0, r6, r0
	adds r2, r5, r0
	lsls r0, r1, #2
	adds r0, r2, r0
	adds r0, #0xbc
	ldr r0, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C658

	thumb_func_start ov45_0222C688
ov45_0222C688: @ 0x0222C688
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	str r1, [sp]
	adds r5, r3, #0
	bl ov45_0222EC68
	adds r6, r0, #0
	movs r0, #0x42
	lsls r0, r0, #2
	ldr r1, [r5]
	adds r0, r5, r0
	bl ov45_0222BADC
	cmp r0, #0
	bne _0222C6AC
	ldr r0, _0222C734 @ =0x0000052C
	movs r1, #1
	str r1, [r5, r0]
_0222C6AC:
	movs r0, #0x4a
	lsls r0, r0, #2
	adds r0, r5, r0
	bl ov45_0222A920
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov45_0222AFF8
	cmp r4, #1
	bne _0222C6E2
	movs r1, #0
	mvns r1, r1
	cmp r6, r1
	beq _0222C6E2
	ldr r1, [sp]
	ldrh r1, [r1, #2]
	cmp r1, #1
	bne _0222C6E2
	cmp r0, #1
	beq _0222C6E2
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222B048
	cmp r0, #0
	bne _0222C6EE
_0222C6E2:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #0
	bl ov45_0222BE08
	pop {r3, r4, r5, r6, r7, pc}
_0222C6EE:
	adds r0, r5, #0
	adds r1, r7, #0
	movs r2, #1
	bl ov45_0222BE08
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r5, r0
	adds r1, r6, #0
	bl ov45_0222BD74
	cmp r0, #0
	bne _0222C70C
	movs r1, #1
	b _0222C70E
_0222C70C:
	movs r1, #0
_0222C70E:
	ldr r0, _0222C738 @ =0x000001CB
	movs r2, #2
	strb r1, [r5, r0]
	movs r0, #0x71
	lsls r0, r0, #2
	strh r6, [r5, r0]
	adds r1, r0, #2
	strb r2, [r5, r1]
	adds r1, r0, #6
	strb r2, [r5, r1]
	adds r1, r0, #3
	subs r0, r0, #4
	movs r2, #0
	adds r0, r5, r0
	strb r2, [r5, r1]
	bl ov45_0222BE48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C734: .4byte 0x0000052C
_0222C738: .4byte 0x000001CB
	thumb_func_end ov45_0222C688

	thumb_func_start ov45_0222C73C
ov45_0222C73C: @ 0x0222C73C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r3, #0
	bl ov45_0222EC68
	ldr r2, _0222C790 @ =0x000001CA
	adds r1, r0, #0
	ldrb r0, [r4, r2]
	cmp r0, #0
	beq _0222C78E
	subs r0, r2, #6
	ldrh r0, [r4, r0]
	cmp r0, r1
	bne _0222C78E
	ldrh r0, [r5]
	cmp r0, #1
	bne _0222C77C
	subs r2, #0xa
	adds r0, r4, r2
	bl ov45_0222BD74
	cmp r0, #0
	bne _0222C76E
	movs r1, #1
	b _0222C770
_0222C76E:
	movs r1, #0
_0222C770:
	ldr r0, _0222C794 @ =0x000001CB
	strb r1, [r4, r0]
	ldr r0, _0222C798 @ =0x000001C6
	movs r1, #2
	strb r1, [r4, r0]
	b _0222C784
_0222C77C:
	subs r2, #0xa
	adds r0, r4, r2
	bl ov45_0222BD4C
_0222C784:
	movs r0, #7
	lsls r0, r0, #6
	adds r0, r4, r0
	bl ov45_0222BE54
_0222C78E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222C790: .4byte 0x000001CA
_0222C794: .4byte 0x000001CB
_0222C798: .4byte 0x000001C6
	thumb_func_end ov45_0222C73C

	thumb_func_start ov45_0222C79C
ov45_0222C79C: @ 0x0222C79C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r1, _0222C7F8 @ =0x000001CA
	adds r4, r3, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0222C7F4
	bl ov45_0222EC68
	movs r1, #0x71
	lsls r1, r1, #2
	ldrh r2, [r4, r1]
	cmp r2, r0
	bne _0222C7E4
	ldrh r0, [r5, #2]
	ldr r2, _0222C7FC @ =0x0000FFFE
	adds r2, r0, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r2, #1
	bhi _0222C7DA
	adds r2, r1, #2
	strb r0, [r4, r2]
	ldrh r2, [r5]
	adds r0, r1, #4
	strh r2, [r4, r0]
	subs r0, r1, #4
	adds r0, r4, r0
	bl ov45_0222BE54
	pop {r3, r4, r5, pc}
_0222C7DA:
	subs r0, r1, #4
	adds r0, r4, r0
	bl ov45_0222BD5C
	pop {r3, r4, r5, pc}
_0222C7E4:
	movs r2, #0
	mvns r2, r2
	cmp r0, r2
	bne _0222C7F4
	subs r0, r1, #4
	adds r0, r4, r0
	bl ov45_0222BD5C
_0222C7F4:
	pop {r3, r4, r5, pc}
	nop
_0222C7F8: .4byte 0x000001CA
_0222C7FC: .4byte 0x0000FFFE
	thumb_func_end ov45_0222C79C

	thumb_func_start ov45_0222C800
ov45_0222C800: @ 0x0222C800
	push {r4, lr}
	ldr r1, _0222C824 @ =0x000001C6
	adds r4, r3, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0222C822
	bl ov45_0222EC68
	movs r1, #0x71
	lsls r1, r1, #2
	ldrh r2, [r4, r1]
	cmp r2, r0
	bne _0222C822
	subs r0, r1, #4
	adds r0, r4, r0
	bl ov45_0222BD4C
_0222C822:
	pop {r4, pc}
	.align 2, 0
_0222C824: .4byte 0x000001C6
	thumb_func_end ov45_0222C800

	thumb_func_start ov45_0222C828
ov45_0222C828: @ 0x0222C828
	push {r3, lr}
	ldrb r2, [r1, #0x11]
	adds r0, r3, #0
	lsls r3, r2, #2
	ldr r2, _0222C838 @ =0x02254A60
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	.align 2, 0
_0222C838: .4byte 0x02254A60
	thumb_func_end ov45_0222C828

	thumb_func_start ov45_0222C83C
ov45_0222C83C: @ 0x0222C83C
	push {r4, lr}
	adds r4, r3, #0
	bl ov45_0222EC68
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222C856
	adds r1, r4, r0
	movs r0, #0x7a
	movs r2, #1
	lsls r0, r0, #2
	strb r2, [r1, r0]
_0222C856:
	pop {r4, pc}
	thumb_func_end ov45_0222C83C

	thumb_func_start ov45_0222C858
ov45_0222C858: @ 0x0222C858
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r3, #0
	bl ov45_0222EC68
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	beq _0222C888
	movs r7, #0x83
	movs r4, #0
	lsls r7, r7, #2
_0222C870:
	adds r0, r5, r7
	adds r1, r6, #0
	adds r2, r4, #0
	bl ov45_0222C408
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222C888
	adds r4, r4, #1
	cmp r4, #3
	blt _0222C870
_0222C888:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222C858

	thumb_func_start ov45_0222C88C
ov45_0222C88C: @ 0x0222C88C
	push {r4, lr}
	adds r4, r3, #0
	bl ov45_0222EC68
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222C8A8
	movs r0, #0x83
	lsls r0, r0, #2
	adds r0, r4, r0
	bl ov45_0222C514
_0222C8A8:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222C88C

	thumb_func_start ov45_0222C8AC
ov45_0222C8AC: @ 0x0222C8AC
	push {r4, lr}
	movs r1, #0
	movs r2, #0x20
	adds r4, r0, #0
	blx FUN_020E5B44
	movs r1, #0
	movs r0, #0x64
_0222C8BC:
	strb r0, [r4, r1]
	adds r1, r1, #1
	cmp r1, #9
	blt _0222C8BC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222C8AC

	thumb_func_start ov45_0222C8C8
ov45_0222C8C8: @ 0x0222C8C8
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r2, #0
	adds r5, r0, #0
	adds r6, r1, #0
	cmp r4, #0x14
	blo _0222C8D8
	bl GF_AssertFail
_0222C8D8:
	cmp r6, #0x1b
	blo _0222C8E0
	bl GF_AssertFail
_0222C8E0:
	adds r7, r5, #0
	adds r7, #0xc
	ldrb r0, [r7, r4]
	cmp r0, #0
	bne _0222C8FC
	adds r0, r6, #0
	movs r1, #3
	blx FUN_020F2BA4
	ldrb r1, [r5, r0]
	asrs r1, r1, #1
	strb r1, [r5, r0]
	movs r0, #1
	strb r0, [r7, r4]
_0222C8FC:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222C8C8

	thumb_func_start ov45_0222C900
ov45_0222C900: @ 0x0222C900
	push {r3, r4, r5, lr}
	movs r5, #0
	adds r4, r0, #0
	adds r1, r5, #0
_0222C908:
	ldrb r0, [r4, r1]
	adds r1, r1, #1
	adds r5, r5, r0
	cmp r1, #9
	blt _0222C908
	bl FUN_0201FDB8
	adds r1, r5, #0
	blx FUN_020F2BA4
	movs r3, #0
	adds r0, r3, #0
_0222C920:
	cmp r3, r1
	bhi _0222C932
	ldrb r2, [r4, r0]
	adds r2, r3, r2
	cmp r2, r1
	bls _0222C932
	lsls r1, r0, #1
	adds r0, r0, r1
	pop {r3, r4, r5, pc}
_0222C932:
	ldrb r2, [r4, r0]
	adds r0, r0, #1
	adds r3, r3, r2
	cmp r0, #9
	blt _0222C920
	bl GF_AssertFail
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222C900

	thumb_func_start ov45_0222C944
ov45_0222C944: @ 0x0222C944
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x14
	blo _0222C954
	bl GF_AssertFail
_0222C954:
	cmp r4, #0x14
	bhs _0222C95A
	strb r6, [r5, r4]
_0222C95A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222C944

	thumb_func_start ov45_0222C95C
ov45_0222C95C: @ 0x0222C95C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222C96A
	bl GF_AssertFail
_0222C96A:
	cmp r4, #0x14
	bhs _0222C972
	ldrb r0, [r5, r4]
	pop {r3, r4, r5, pc}
_0222C972:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222C95C

	thumb_func_start ov45_0222C978
ov45_0222C978: @ 0x0222C978
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	movs r1, #0
	movs r2, #0xb8
	adds r5, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	bl FUN_02015D14
	adds r5, #0xb4
	str r0, [r5]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222C978

	thumb_func_start ov45_0222C994
ov45_0222C994: @ 0x0222C994
	ldr r3, _0222C99C @ =FUN_02015D54
	adds r0, #0xb4
	ldr r0, [r0]
	bx r3
	.align 2, 0
_0222C99C: .4byte FUN_02015D54
	thumb_func_end ov45_0222C994

	thumb_func_start ov45_0222C9A0
ov45_0222C9A0: @ 0x0222C9A0
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0x14
	blo _0222C9B2
	bl GF_AssertFail
_0222C9B2:
	cmp r4, #0x14
	bhs _0222C9CE
	strb r6, [r5, r4]
	cmp r6, #1
	bne _0222C9CE
	adds r0, r5, #0
	adds r0, #0xb4
	ldr r0, [r0]
	adds r5, #0x14
	lsls r2, r4, #3
	adds r1, r7, #0
	adds r2, r5, r2
	bl ov45_0222CA10
_0222C9CE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222C9A0

	thumb_func_start ov45_0222C9D0
ov45_0222C9D0: @ 0x0222C9D0
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222C9DE
	bl GF_AssertFail
_0222C9DE:
	cmp r4, #0x14
	bhs _0222C9E6
	ldrb r0, [r5, r4]
	pop {r3, r4, r5, pc}
_0222C9E6:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222C9D0

	thumb_func_start ov45_0222C9EC
ov45_0222C9EC: @ 0x0222C9EC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222C9FA
	bl GF_AssertFail
_0222C9FA:
	cmp r4, #0x14
	bhs _0222CA0C
	ldrb r0, [r5, r4]
	cmp r0, #0
	beq _0222CA0C
	adds r5, #0x14
	lsls r0, r4, #3
	adds r0, r5, r0
	pop {r3, r4, r5, pc}
_0222CA0C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222C9EC

	thumb_func_start ov45_0222CA10
ov45_0222CA10: @ 0x0222CA10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r1, #0
	adds r6, r0, #0
	adds r5, r2, #0
	bl FUN_02015D68
	adds r7, r0, #0
	str r4, [sp, #8]
	add r0, sp, #8
	ldrb r4, [r0]
	ldrb r0, [r0, #3]
	adds r1, r7, #0
	str r0, [sp]
	adds r0, r0, r4
	blx FUN_020F2BA4
	adds r0, r6, #0
	bl FUN_02015D6C
	strh r0, [r5]
	add r0, sp, #8
	ldrb r0, [r0, #1]
	adds r1, r7, #0
	str r0, [sp, #4]
	adds r0, r4, r0
	blx FUN_020F2BA4
	adds r0, r6, #0
	bl FUN_02015D6C
	strh r0, [r5, #2]
	add r0, sp, #8
	ldrb r4, [r0, #2]
	ldr r0, [sp, #4]
	adds r1, r7, #0
	adds r0, r0, r4
	blx FUN_020F2BA4
	adds r0, r6, #0
	bl FUN_02015D6C
	strh r0, [r5, #4]
	ldr r0, [sp]
	adds r1, r7, #0
	adds r0, r4, r0
	blx FUN_020F2BA4
	adds r0, r6, #0
	bl FUN_02015D6C
	strh r0, [r5, #6]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222CA10

	thumb_func_start ov45_0222CA7C
ov45_0222CA7C: @ 0x0222CA7C
	movs r3, #0
	str r3, [r0]
	subs r2, r2, r1
	movs r1, #0x1e
	str r3, [r0, #0xc]
	muls r1, r2, r1
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov45_0222CA7C

	thumb_func_start ov45_0222CA8C
ov45_0222CA8C: @ 0x0222CA8C
	movs r1, #1
	str r1, [r0]
	movs r1, #0
	str r1, [r0, #0xc]
	ldr r3, _0222CA9C @ =ov45_0222ECB8
	adds r0, r0, #4
	bx r3
	nop
_0222CA9C: .4byte ov45_0222ECB8
	thumb_func_end ov45_0222CA8C

	thumb_func_start ov45_0222CAA0
ov45_0222CAA0: @ 0x0222CAA0
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222CB32
	add r0, sp, #0
	bl ov45_0222ECB8
	ldr r3, [sp]
	ldr r0, [r4, #4]
	ldr r1, [sp, #4]
	ldr r2, [r4, #8]
	subs r0, r3, r0
	sbcs r1, r2
	movs r2, #0x1e
	movs r3, #0
	blx FUN_020F2948
	ldr r2, [r4, #0xc]
	asrs r3, r2, #0x1f
	subs r2, r2, r0
	sbcs r3, r1
	bge _0222CAD2
	str r0, [r4, #0xc]
_0222CAD2:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bge _0222CB12
	adds r0, r1, #1
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	lsls r0, r0, #8
	blx FUN_020F2998
	movs r2, #0
	ldr r5, _0222CB38 @ =_02254A28
	adds r3, r2, #0
_0222CAEC:
	ldrh r1, [r5, #2]
	adds r2, r2, r1
	cmp r2, r0
	blo _0222CB08
	ldr r0, _0222CB38 @ =_02254A28
	lsls r1, r3, #2
	ldrh r1, [r0, r1]
	ldr r0, [r4, #0x14]
	cmp r0, r1
	beq _0222CB2C
	str r1, [r4, #0x14]
	movs r0, #0
	str r0, [r4, #0x18]
	b _0222CB2C
_0222CB08:
	adds r3, r3, #1
	adds r5, r5, #4
	cmp r3, #5
	blo _0222CAEC
	b _0222CB2C
_0222CB12:
	ldr r0, [r4, #0x14]
	cmp r0, #5
	beq _0222CB20
	movs r0, #5
	str r0, [r4, #0x14]
	movs r0, #0
	str r0, [r4, #0x18]
_0222CB20:
	ldr r0, [r4, #0x18]
	cmp r0, #0x78
	blo _0222CB2C
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4]
_0222CB2C:
	ldr r0, [r4, #0x18]
	adds r0, r0, #1
	str r0, [r4, #0x18]
_0222CB32:
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222CB38: .4byte _02254A28
	thumb_func_end ov45_0222CAA0

	thumb_func_start ov45_0222CB3C
ov45_0222CB3C: @ 0x0222CB3C
	ldr r0, [r0, #0x18]
	bx lr
	thumb_func_end ov45_0222CB3C

	thumb_func_start ov45_0222CB40
ov45_0222CB40: @ 0x0222CB40
	ldr r0, [r0, #0x14]
	bx lr
	thumb_func_end ov45_0222CB40

	thumb_func_start ov45_0222CB44
ov45_0222CB44: @ 0x0222CB44
	push {r4, r5, r6, lr}
	movs r4, #0x18
	adds r3, r4, #0
	movs r5, #0
	adds r6, r0, #0
	subs r3, #0x19
_0222CB50:
	adds r2, r0, r5
	adds r2, #0x34
	strb r4, [r2]
	adds r5, r5, #1
	stm r6!, {r3}
	cmp r5, #0xd
	blt _0222CB50
	adds r2, r0, #0
	movs r3, #0
	adds r2, #0x41
	strb r3, [r2]
	adds r2, r0, #0
	adds r2, #0x42
	strb r3, [r2]
	str r1, [r0, #0x44]
	bl ov45_0222CCA4
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222CB44

	thumb_func_start ov45_0222CB74
ov45_0222CB74: @ 0x0222CB74
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov45_0222CCB8
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	movs r1, #0xd
	adds r0, r0, #1
	blx FUN_020F2998
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r1, r0
	bne _0222CB9E
	adds r0, r5, #0
	bl ov45_0222CC00
_0222CB9E:
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	movs r1, #0xd
	adds r0, r5, r0
	adds r0, #0x34
	strb r4, [r0]
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #2
	str r6, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	adds r0, r0, #1
	blx FUN_020F2998
	adds r0, r5, #0
	adds r0, #0x42
	strb r1, [r0]
	adds r0, r5, #0
	bl ov45_0222CCA4
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222CB74

	thumb_func_start ov45_0222CBD0
ov45_0222CBD0: @ 0x0222CBD0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	movs r6, #0
	bl ov45_0222CCB8
	adds r2, r6, #0
	adds r3, r7, #0
	movs r0, #1
_0222CBE4:
	ldr r1, [r3]
	cmp r5, r1
	bne _0222CBEE
	str r4, [r3]
	adds r6, r0, #0
_0222CBEE:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #0xd
	blt _0222CBE4
	adds r0, r7, #0
	bl ov45_0222CCA4
	adds r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222CBD0

	thumb_func_start ov45_0222CC00
ov45_0222CC00: @ 0x0222CC00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl ov45_0222CCB8
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, r2
	bne _0222CC1C
	movs r0, #0x18
	pop {r3, r4, r5, pc}
_0222CC1C:
	adds r0, r5, #0
	adds r0, #0x34
	ldrb r4, [r0, r2]
	movs r1, #0x18
	strb r1, [r0, r2]
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r0, [r0]
	subs r1, #0x19
	lsls r0, r0, #2
	str r1, [r5, r0]
	adds r0, r5, #0
	adds r0, #0x41
	ldrb r0, [r0]
	movs r1, #0xd
	adds r0, r0, #1
	blx FUN_020F2998
	adds r0, r5, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, r5, #0
	bl ov45_0222CCA4
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CC00

	thumb_func_start ov45_0222CC50
ov45_0222CC50: @ 0x0222CC50
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xc
	blo _0222CC5E
	bl GF_AssertFail
_0222CC5E:
	adds r0, r5, #0
	bl ov45_0222CCB8
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r1, [r0]
	adds r0, r4, #1
	subs r0, r1, r0
	bpl _0222CC72
	adds r0, #0xd
_0222CC72:
	adds r0, r5, r0
	adds r0, #0x34
	ldrb r0, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222CC50

	thumb_func_start ov45_0222CC7C
ov45_0222CC7C: @ 0x0222CC7C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xc
	blo _0222CC8A
	bl GF_AssertFail
_0222CC8A:
	adds r0, r5, #0
	bl ov45_0222CCB8
	adds r0, r5, #0
	adds r0, #0x42
	ldrb r1, [r0]
	adds r0, r4, #1
	subs r0, r1, r0
	bpl _0222CC9E
	adds r0, #0xd
_0222CC9E:
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CC7C

	thumb_func_start ov45_0222CCA4
ov45_0222CCA4: @ 0x0222CCA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	adds r1, r4, #0
	movs r2, #0x44
	bl FUN_020275C4
	adds r4, #0x48
	strh r0, [r4]
	pop {r4, pc}
	thumb_func_end ov45_0222CCA4

	thumb_func_start ov45_0222CCB8
ov45_0222CCB8: @ 0x0222CCB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x44]
	adds r1, r4, #0
	movs r2, #0x44
	bl FUN_020275C4
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r1, [r1]
	cmp r0, r1
	beq _0222CCDA
	bl GF_AssertFail
	movs r0, #1
	adds r4, #0x4a
	strh r0, [r4]
_0222CCDA:
	pop {r4, pc}
	thumb_func_end ov45_0222CCB8

	thumb_func_start ov45_0222CCDC
ov45_0222CCDC: @ 0x0222CCDC
	adds r0, #0x4a
	ldrh r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222CCDC

	thumb_func_start ov45_0222CCE4
ov45_0222CCE4: @ 0x0222CCE4
	ldr r3, _0222CD00 @ =0x02254A84
	movs r2, #0
_0222CCE8:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0222CCF2
	adds r0, r2, #0
	bx lr
_0222CCF2:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #0x10
	blt _0222CCE8
	movs r0, #0x10
	bx lr
	nop
_0222CD00: .4byte 0x02254A84
	thumb_func_end ov45_0222CCE4

	thumb_func_start ov45_0222CD04
ov45_0222CD04: @ 0x0222CD04
	cmp r0, #0x10
	bhs _0222CD10
	lsls r1, r0, #2
	ldr r0, _0222CD14 @ =0x02254A84
	ldrh r0, [r0, r1]
	bx lr
_0222CD10:
	ldr r0, _0222CD18 @ =0x0000FFFF
	bx lr
	.align 2, 0
_0222CD14: .4byte 0x02254A84
_0222CD18: .4byte 0x0000FFFF
	thumb_func_end ov45_0222CD04

	thumb_func_start ov45_0222CD1C
ov45_0222CD1C: @ 0x0222CD1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r6, [sp, #0x20]
	adds r5, r0, #0
	adds r7, r1, #0
	adds r0, r6, #0
	movs r1, #0x48
	str r2, [sp]
	str r3, [sp, #4]
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x48
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, [sp, #4]
	str r0, [r4, #0x3c]
	ldr r0, [sp]
	str r7, [r4, #0x40]
	str r0, [r4, #0x44]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
	strh r6, [r4, #0x3a]
	movs r5, #0
_0222CD50:
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl ov45_0222CDE4
	adds r5, r5, #1
	cmp r5, #0xd
	blt _0222CD50
	adds r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222CD1C

	thumb_func_start ov45_0222CD68
ov45_0222CD68: @ 0x0222CD68
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0222CD6E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov45_0222CE0C
	adds r4, r4, #1
	cmp r4, #0xd
	blt _0222CD6E
	adds r0, r5, #0
	bl FUN_0201AB0C
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CD68

	thumb_func_start ov45_0222CD84
ov45_0222CD84: @ 0x0222CD84
	ldr r3, _0222CD8C @ =ov45_0222CE2C
	movs r1, #5
	bx r3
	nop
_0222CD8C: .4byte ov45_0222CE2C
	thumb_func_end ov45_0222CD84

	thumb_func_start ov45_0222CD90
ov45_0222CD90: @ 0x0222CD90
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	movs r5, #0
	cmp r0, #0
	beq _0222CDBA
	bl FUN_020072A8
	cmp r0, #0
	beq _0222CDBA
	ldr r0, [r4]
	bl FUN_02007278
	adds r0, r5, #0
	str r0, [r4]
	adds r0, r4, #0
	adds r4, #0x38
	ldrb r1, [r4]
	bl ov45_0222CE54
	adds r5, r0, #0
_0222CDBA:
	adds r0, r5, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222CD90

	thumb_func_start ov45_0222CDC0
ov45_0222CDC0: @ 0x0222CDC0
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222CDC0

	thumb_func_start ov45_0222CDC4
ov45_0222CDC4: @ 0x0222CDC4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r0, #0
	beq _0222CDD6
	bl GF_AssertFail
_0222CDD6:
	ldrh r2, [r5, #0x3a]
	ldr r1, [r4]
	adds r0, r6, #0
	bl FUN_0200724C
	str r0, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222CDC4

	thumb_func_start ov45_0222CDE4
ov45_0222CDE4: @ 0x0222CDE4
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0xd
	blo _0222CDF4
	bl GF_AssertFail
_0222CDF4:
	lsls r3, r4, #2
	adds r1, r5, #4
	ldr r4, _0222CE08 @ =0x02254E88
	adds r1, r1, r3
	ldr r3, [r4, r3]
	adds r0, r5, #0
	adds r2, r6, #0
	blx r3
	pop {r4, r5, r6, pc}
	nop
_0222CE08: .4byte 0x02254E88
	thumb_func_end ov45_0222CDE4

	thumb_func_start ov45_0222CE0C
ov45_0222CE0C: @ 0x0222CE0C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0xd
	blo _0222CE1A
	bl GF_AssertFail
_0222CE1A:
	ldr r1, _0222CE28 @ =0x02254E20
	lsls r2, r5, #2
	adds r0, r4, #4
	ldr r1, [r1, r2]
	adds r0, r0, r2
	blx r1
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222CE28: .4byte 0x02254E20
	thumb_func_end ov45_0222CE0C

	thumb_func_start ov45_0222CE2C
ov45_0222CE2C: @ 0x0222CE2C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0xd
	blo _0222CE3A
	bl GF_AssertFail
_0222CE3A:
	ldr r2, _0222CE50 @ =0x02254E54
	lsls r3, r4, #2
	adds r1, r5, #4
	ldr r2, [r2, r3]
	adds r0, r5, #0
	adds r1, r1, r3
	blx r2
	adds r5, #0x38
	strb r4, [r5]
	pop {r3, r4, r5, pc}
	nop
_0222CE50: .4byte 0x02254E54
	thumb_func_end ov45_0222CE2C

	thumb_func_start ov45_0222CE54
ov45_0222CE54: @ 0x0222CE54
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0xd
	blo _0222CE62
	bl GF_AssertFail
_0222CE62:
	ldr r2, _0222CE74 @ =0x02254EBC
	lsls r3, r5, #2
	adds r1, r4, #4
	ldr r2, [r2, r3]
	adds r0, r4, #0
	adds r1, r1, r3
	blx r2
	pop {r3, r4, r5, pc}
	nop
_0222CE74: .4byte 0x02254EBC
	thumb_func_end ov45_0222CE54

	thumb_func_start ov45_0222CE78
ov45_0222CE78: @ 0x0222CE78
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_0222CE80:
	adds r0, r6, #0
	bl FUN_02028ED0
	str r0, [r5, #0x20]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222CE80
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222CE78

	thumb_func_start ov45_0222CE94
ov45_0222CE94: @ 0x0222CE94
	push {r4, r5, r6, lr}
	movs r4, #0
	adds r5, r0, #0
	adds r6, r4, #0
_0222CE9C:
	ldr r0, [r5, #0x20]
	bl FUN_0201AB0C
	str r6, [r5, #0x20]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222CE9C
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222CE94

	thumb_func_start ov45_0222CEB0
ov45_0222CEB0: @ 0x0222CEB0
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r7, #0
	str r2, [sp]
	bl ov45_0222A5C0
	bl ov45_0222AAC8
	adds r1, r6, #0
	str r0, [r6]
	adds r0, r7, #0
	adds r1, #8
	bl ov45_0222AB38
	adds r0, r7, #0
	adds r1, r6, #4
	bl ov45_0222A498
	str r7, [r6, #0x30]
	movs r4, #0
	str r4, [r6, #0x1c]
	adds r5, r6, #0
_0222CEDE:
	adds r1, r6, r4
	ldrb r1, [r1, #4]
	adds r0, r7, #0
	bl ov45_0222A578
	cmp r0, #0
	beq _0222CEF4
	ldr r1, [r5, #0x20]
	ldr r2, [sp]
	bl ov45_0222A844
_0222CEF4:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222CEDE
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222CEB0

	thumb_func_start ov45_0222CF00
ov45_0222CF00: @ 0x0222CF00
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	movs r1, #0x20
	bl FUN_0201AA8C
	str r0, [r5]
	movs r1, #0
	movs r2, #0x20
	blx FUN_020E5B44
	ldr r1, [r5]
	ldr r0, [r4, #0x40]
	str r0, [r1]
	ldr r0, [r4, #0x3c]
	str r0, [r1, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CF00

	thumb_func_start ov45_0222CF24
ov45_0222CF24: @ 0x0222CF24
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _0222CF32
	bl GF_AssertFail
_0222CF32:
	ldr r0, [r4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222CF24

	thumb_func_start ov45_0222CF40
ov45_0222CF40: @ 0x0222CF40
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, [r6]
	ldr r0, [r5, #0x3c]
	bl ov45_0222AD2C
	str r0, [r4, #4]
	ldr r0, [r5, #0x3c]
	bl ov45_0222AD3C
	str r0, [r4, #8]
	ldr r2, _0222CF64 @ =0x02254B94
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222CDC4
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222CF64: .4byte 0x02254B94
	thumb_func_end ov45_0222CF40

	thumb_func_start ov45_0222CF68
ov45_0222CF68: @ 0x0222CF68
	push {r3, lr}
	ldr r1, [r1]
	ldr r1, [r1, #0x18]
	cmp r1, #0xa
	bhi _0222CFEC
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222CF7E: @ jump table
	.2byte _0222CF94 - _0222CF7E - 2 @ case 0
	.2byte _0222CF9C - _0222CF7E - 2 @ case 1
	.2byte _0222CFA4 - _0222CF7E - 2 @ case 2
	.2byte _0222CFBC - _0222CF7E - 2 @ case 3
	.2byte _0222CFC4 - _0222CF7E - 2 @ case 4
	.2byte _0222CFCC - _0222CF7E - 2 @ case 5
	.2byte _0222CFAC - _0222CF7E - 2 @ case 6
	.2byte _0222CFB4 - _0222CF7E - 2 @ case 7
	.2byte _0222CFD4 - _0222CF7E - 2 @ case 8
	.2byte _0222CFDC - _0222CF7E - 2 @ case 9
	.2byte _0222CFE4 - _0222CF7E - 2 @ case 10
_0222CF94:
	movs r1, #9
	bl ov45_0222CE2C
	b _0222CFF0
_0222CF9C:
	movs r1, #1
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFA4:
	movs r1, #2
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFAC:
	movs r1, #3
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFB4:
	movs r1, #4
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFBC:
	movs r1, #6
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFC4:
	movs r1, #7
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFCC:
	movs r1, #8
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFD4:
	movs r1, #0xa
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFDC:
	movs r1, #0xb
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFE4:
	movs r1, #0xc
	bl ov45_0222CE2C
	b _0222CFF0
_0222CFEC:
	bl GF_AssertFail
_0222CFF0:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov45_0222CF68

	thumb_func_start ov45_0222CFF4
ov45_0222CFF4: @ 0x0222CFF4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	movs r1, #0x10
	bl FUN_0201AA8C
	str r0, [r4]
	movs r2, #0x10
	movs r1, #0
_0222D008:
	strb r1, [r0]
	adds r0, r0, #1
	subs r2, r2, #1
	bne _0222D008
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1, #4]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222CFF4

	thumb_func_start ov45_0222D01C
ov45_0222D01C: @ 0x0222D01C
	ldr r3, _0222D024 @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_0222D024: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222D01C

	thumb_func_start ov45_0222D028
ov45_0222D028: @ 0x0222D028
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, [r6]
	ldr r0, [r5, #0x3c]
	bl ov45_0222A214
	str r0, [r4]
	ldr r0, [r5, #0x3c]
	bl ov45_0222A22C
	ldr r0, [r0]
	ldr r2, _0222D050 @ =0x02254B84
	str r0, [r4, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222CDC4
	pop {r4, r5, r6, pc}
	nop
_0222D050: .4byte 0x02254B84
	thumb_func_end ov45_0222D028

	thumb_func_start ov45_0222D054
ov45_0222D054: @ 0x0222D054
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D06C
	adds r0, r4, #0
	movs r1, #0xa
	bl ov45_0222CE2C
	b _0222D074
_0222D06C:
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222CE2C
_0222D074:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D054

	thumb_func_start ov45_0222D078
ov45_0222D078: @ 0x0222D078
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	str r0, [r5]
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	bl ov45_0222A210
	str r0, [r5]
	ldr r0, [r4, #0x3c]
	bl ov45_0222A22C
	str r0, [r5, #4]
	ldr r0, [r4, #0x3c]
	str r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D078

	thumb_func_start ov45_0222D0BC
ov45_0222D0BC: @ 0x0222D0BC
	ldr r3, _0222D0C4 @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_0222D0C4: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222D0BC

	thumb_func_start ov45_0222D0C8
ov45_0222D0C8: @ 0x0222D0C8
	ldr r3, _0222D0D0 @ =ov45_0222CDC4
	ldr r2, _0222D0D4 @ =0x02254B74
	bx r3
	nop
_0222D0D0: .4byte ov45_0222CDC4
_0222D0D4: .4byte 0x02254B74
	thumb_func_end ov45_0222D0C8

	thumb_func_start ov45_0222D0D8
ov45_0222D0D8: @ 0x0222D0D8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D0F0
	adds r0, r4, #0
	movs r1, #0xa
	bl ov45_0222CE2C
	b _0222D0F8
_0222D0F0:
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222CE2C
_0222D0F8:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D0D8

	thumb_func_start ov45_0222D0FC
ov45_0222D0FC: @ 0x0222D0FC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	movs r1, #0x14
	bl FUN_0201AA8C
	str r0, [r4]
	movs r2, #0x14
	movs r1, #0
_0222D110:
	strb r1, [r0]
	adds r0, r0, #1
	subs r2, r2, #1
	bne _0222D110
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	adds r0, r5, #0
	adds r0, #0x39
	ldrb r0, [r0]
	str r0, [r1, #8]
	ldr r0, [r5, #0x44]
	str r0, [r1, #0xc]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D0FC

	thumb_func_start ov45_0222D130
ov45_0222D130: @ 0x0222D130
	ldr r3, _0222D138 @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_0222D138: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222D130

	thumb_func_start ov45_0222D13C
ov45_0222D13C: @ 0x0222D13C
	ldr r3, _0222D144 @ =ov45_0222CDC4
	ldr r2, _0222D148 @ =0x02254B64
	bx r3
	nop
_0222D144: .4byte ov45_0222CDC4
_0222D148: .4byte 0x02254B64
	thumb_func_end ov45_0222D13C

	thumb_func_start ov45_0222D14C
ov45_0222D14C: @ 0x0222D14C
	push {r3, lr}
	ldr r1, [r1]
	ldr r1, [r1, #0x10]
	cmp r1, #0
	bne _0222D15A
	movs r0, #1
	pop {r3, pc}
_0222D15A:
	movs r1, #0
	bl ov45_0222CE2C
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov45_0222D14C

	thumb_func_start ov45_0222D164
ov45_0222D164: @ 0x0222D164
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r6, #0
	movs r1, #0x3c
	bl FUN_0201AA8C
	str r0, [r4]
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020E5B44
	ldr r0, [r4]
	movs r2, #0
	adds r1, r0, #0
	adds r1, #0x38
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #1
	adds r1, #0x39
	strb r2, [r1]
	ldr r1, [r5, #0x40]
	str r1, [r0, #0x34]
	adds r1, r6, #0
	bl ov45_0222CE78
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D164

	thumb_func_start ov45_0222D19C
ov45_0222D19C: @ 0x0222D19C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov45_0222CE94
	ldr r0, [r4]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D19C

	thumb_func_start ov45_0222D1B0
ov45_0222D1B0: @ 0x0222D1B0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0222D1D4 @ =0x0000005A
	movs r1, #2
	bl FUN_02006FF8
	ldrh r2, [r5, #0x3a]
	ldr r0, [r4]
	ldr r1, [r5, #0x3c]
	bl ov45_0222CEB0
	ldr r2, _0222D1D8 @ =0x02254B54
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov45_0222CDC4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D1D4: .4byte 0x0000005A
_0222D1D8: .4byte 0x02254B54
	thumb_func_end ov45_0222D1B0

	thumb_func_start ov45_0222D1DC
ov45_0222D1DC: @ 0x0222D1DC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0222D208 @ =0x0000005A
	adds r5, r1, #0
	bl FUN_02006F7C
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	ldr r1, [r5, #0x1c]
	bl ov45_0222A430
	ldr r0, [r4, #0x3c]
	ldr r1, [r5]
	bl ov45_0222A72C
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222CE2C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222D208: .4byte 0x0000005A
	thumb_func_end ov45_0222D1DC

	thumb_func_start ov45_0222D20C
ov45_0222D20C: @ 0x0222D20C
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r6, #0
	movs r1, #0x40
	bl FUN_0201AA8C
	str r0, [r4]
	movs r1, #0
	movs r2, #0x40
	blx FUN_020E5B44
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #0x3c]
	movs r1, #1
	str r1, [r0, #0x38]
	ldr r1, [r5, #0x40]
	str r1, [r0, #0x34]
	adds r1, r6, #0
	bl ov45_0222CE78
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D20C

	thumb_func_start ov45_0222D23C
ov45_0222D23C: @ 0x0222D23C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov45_0222CE94
	ldr r0, [r4]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D23C

	thumb_func_start ov45_0222D250
ov45_0222D250: @ 0x0222D250
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0222D274 @ =0x0000005A
	movs r1, #2
	bl FUN_02006FF8
	ldrh r2, [r5, #0x3a]
	ldr r0, [r4]
	ldr r1, [r5, #0x3c]
	bl ov45_0222CEB0
	ldr r2, _0222D278 @ =0x02254BA4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov45_0222CDC4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D274: .4byte 0x0000005A
_0222D278: .4byte 0x02254BA4
	thumb_func_end ov45_0222D250

	thumb_func_start ov45_0222D27C
ov45_0222D27C: @ 0x0222D27C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0222D2A8 @ =0x0000005A
	adds r5, r1, #0
	bl FUN_02006F7C
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	ldr r1, [r5, #0x1c]
	bl ov45_0222A430
	ldr r0, [r4, #0x3c]
	ldr r1, [r5]
	bl ov45_0222A72C
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222CE2C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222D2A8: .4byte 0x0000005A
	thumb_func_end ov45_0222D27C

	thumb_func_start ov45_0222D2AC
ov45_0222D2AC: @ 0x0222D2AC
	push {r4, r5, r6, lr}
	adds r6, r2, #0
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r6, #0
	movs r1, #0x3c
	bl FUN_0201AA8C
	str r0, [r4]
	movs r1, #0
	movs r2, #0x3c
	blx FUN_020E5B44
	ldr r0, [r4]
	movs r2, #0
	adds r1, r0, #0
	adds r1, #0x38
	strb r2, [r1]
	adds r1, r0, #0
	movs r2, #1
	adds r1, #0x39
	strb r2, [r1]
	ldr r1, [r5, #0x40]
	str r1, [r0, #0x34]
	adds r1, r6, #0
	bl ov45_0222CE78
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D2AC

	thumb_func_start ov45_0222D2E4
ov45_0222D2E4: @ 0x0222D2E4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov45_0222CE94
	ldr r0, [r4]
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D2E4

	thumb_func_start ov45_0222D2F8
ov45_0222D2F8: @ 0x0222D2F8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0222D31C @ =0x0000005A
	movs r1, #2
	bl FUN_02006FF8
	ldrh r2, [r5, #0x3a]
	ldr r0, [r4]
	ldr r1, [r5, #0x3c]
	bl ov45_0222CEB0
	ldr r2, _0222D320 @ =0x02254B34
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov45_0222CDC4
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222D31C: .4byte 0x0000005A
_0222D320: .4byte 0x02254B34
	thumb_func_end ov45_0222D2F8

	thumb_func_start ov45_0222D324
ov45_0222D324: @ 0x0222D324
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0222D350 @ =0x0000005A
	adds r5, r1, #0
	bl FUN_02006F7C
	ldr r5, [r5]
	ldr r0, [r4, #0x3c]
	ldr r1, [r5, #0x1c]
	bl ov45_0222A430
	ldr r0, [r4, #0x3c]
	ldr r1, [r5]
	bl ov45_0222A72C
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222CE2C
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222D350: .4byte 0x0000005A
	thumb_func_end ov45_0222D324

	thumb_func_start ov45_0222D354
ov45_0222D354: @ 0x0222D354
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	movs r1, #8
	bl FUN_0201AA8C
	str r0, [r4]
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	ldr r1, [r5, #0x3c]
	ldr r0, [r4]
	str r1, [r0]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D354

	thumb_func_start ov45_0222D380
ov45_0222D380: @ 0x0222D380
	ldr r3, _0222D388 @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_0222D388: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222D380

	thumb_func_start ov45_0222D38C
ov45_0222D38C: @ 0x0222D38C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D3A4
	adds r0, r4, #0
	movs r1, #0xa
	bl ov45_0222CE2C
	b _0222D3AC
_0222D3A4:
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222CE2C
_0222D3AC:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D38C

	thumb_func_start ov45_0222D3B0
ov45_0222D3B0: @ 0x0222D3B0
	ldr r2, [r1]
	movs r3, #0
	strb r3, [r2, #4]
	ldr r3, _0222D3BC @ =ov45_0222CDC4
	ldr r2, _0222D3C0 @ =0x02254B24
	bx r3
	.align 2, 0
_0222D3BC: .4byte ov45_0222CDC4
_0222D3C0: .4byte 0x02254B24
	thumb_func_end ov45_0222D3B0

	thumb_func_start ov45_0222D3C4
ov45_0222D3C4: @ 0x0222D3C4
	ldr r2, [r1]
	movs r3, #1
	strb r3, [r2, #4]
	ldr r3, _0222D3D0 @ =ov45_0222CDC4
	ldr r2, _0222D3D4 @ =0x02254B14
	bx r3
	.align 2, 0
_0222D3D0: .4byte ov45_0222CDC4
_0222D3D4: .4byte 0x02254B14
	thumb_func_end ov45_0222D3C4

	thumb_func_start ov45_0222D3D8
ov45_0222D3D8: @ 0x0222D3D8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	str r0, [r4]
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D3D8

	thumb_func_start ov45_0222D410
ov45_0222D410: @ 0x0222D410
	ldr r3, _0222D418 @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_0222D418: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222D410

	thumb_func_start ov45_0222D41C
ov45_0222D41C: @ 0x0222D41C
	ldr r3, _0222D424 @ =ov45_0222D434
	movs r2, #0
	bx r3
	nop
_0222D424: .4byte ov45_0222D434
	thumb_func_end ov45_0222D41C

	thumb_func_start ov45_0222D428
ov45_0222D428: @ 0x0222D428
	ldr r3, _0222D430 @ =ov45_0222D434
	movs r2, #1
	bx r3
	nop
_0222D430: .4byte ov45_0222D434
	thumb_func_end ov45_0222D428

	thumb_func_start ov45_0222D434
ov45_0222D434: @ 0x0222D434
	ldr r3, [r1]
	str r2, [r3, #8]
	ldr r3, _0222D440 @ =ov45_0222CDC4
	ldr r2, _0222D444 @ =0x02254B04
	bx r3
	nop
_0222D440: .4byte ov45_0222CDC4
_0222D444: .4byte 0x02254B04
	thumb_func_end ov45_0222D434

	thumb_func_start ov45_0222D448
ov45_0222D448: @ 0x0222D448
	movs r0, #1
	bx lr
	thumb_func_end ov45_0222D448

	thumb_func_start ov45_0222D44C
ov45_0222D44C: @ 0x0222D44C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	str r0, [r4]
	movs r2, #0
	strb r2, [r0]
	strb r2, [r0, #1]
	strb r2, [r0, #2]
	strb r2, [r0, #3]
	strb r2, [r0, #4]
	strb r2, [r0, #5]
	strb r2, [r0, #6]
	strb r2, [r0, #7]
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	str r2, [r1, #8]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D44C

	thumb_func_start ov45_0222D484
ov45_0222D484: @ 0x0222D484
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r2, #0
	movs r1, #0xc
	bl FUN_0201AA8C
	str r0, [r4]
	movs r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	strb r1, [r0, #8]
	strb r1, [r0, #9]
	strb r1, [r0, #0xa]
	strb r1, [r0, #0xb]
	ldr r1, [r4]
	ldr r0, [r5, #0x40]
	str r0, [r1]
	ldr r0, [r5, #0x3c]
	str r0, [r1, #4]
	movs r0, #1
	str r0, [r1, #8]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D484

	thumb_func_start ov45_0222D4C0
ov45_0222D4C0: @ 0x0222D4C0
	ldr r3, _0222D4C8 @ =FUN_0201AB0C
	ldr r0, [r0]
	bx r3
	nop
_0222D4C8: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222D4C0

	thumb_func_start ov45_0222D4CC
ov45_0222D4CC: @ 0x0222D4CC
	ldr r3, _0222D4D4 @ =ov45_0222CDC4
	ldr r2, _0222D4D8 @ =0x02254B44
	bx r3
	nop
_0222D4D4: .4byte ov45_0222CDC4
_0222D4D8: .4byte 0x02254B44
	thumb_func_end ov45_0222D4CC

	thumb_func_start ov45_0222D4DC
ov45_0222D4DC: @ 0x0222D4DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl ov45_0222A33C
	cmp r0, #0
	beq _0222D4F4
	adds r0, r4, #0
	movs r1, #0xa
	bl ov45_0222CE2C
	b _0222D4FC
_0222D4F4:
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222CE2C
_0222D4FC:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D4DC

	thumb_func_start ov45_0222D500
ov45_0222D500: @ 0x0222D500
	push {r3, r4, lr}
	sub sp, #0x1c
	adds r3, r1, #0
	ldm r3, {r2, r3}
	adds r4, r0, #0
	add r0, sp, #0xc
	add r1, sp, #0
	blx FUN_020DC514
	ldr r0, [sp]
	strb r0, [r4]
	ldr r0, [sp, #4]
	strb r0, [r4, #1]
	ldr r0, [sp, #8]
	strb r0, [r4, #2]
	add sp, #0x1c
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D500

	thumb_func_start ov45_0222D524
ov45_0222D524: @ 0x0222D524
	push {r4, lr}
	sub sp, #8
	ldr r0, [r0]
	adds r4, r2, #0
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp]
	add r0, sp, #0
	ldrb r2, [r0, #6]
	ldrb r1, [r0, #2]
	adds r1, r2, r1
	strb r1, [r0, #6]
	ldrb r0, [r0, #6]
	movs r1, #0x3c
	blx FUN_020F2998
	add r1, sp, #0
	ldrb r2, [r1, #5]
	adds r0, r2, r0
	strb r0, [r1, #5]
	ldrb r0, [r1, #6]
	movs r1, #0x3c
	blx FUN_020F2998
	strb r1, [r4, #2]
	add r0, sp, #0
	ldrb r2, [r0, #5]
	ldrb r1, [r0, #1]
	adds r1, r2, r1
	strb r1, [r0, #5]
	ldrb r0, [r0, #5]
	movs r1, #0x3c
	blx FUN_020F2998
	add r1, sp, #0
	ldrb r2, [r1, #4]
	adds r0, r2, r0
	strb r0, [r1, #4]
	ldrb r0, [r1, #5]
	movs r1, #0x3c
	blx FUN_020F2998
	strb r1, [r4, #1]
	add r0, sp, #0
	ldrb r2, [r0, #4]
	ldrb r1, [r0]
	adds r1, r2, r1
	strb r1, [r0, #4]
	ldrb r0, [r0, #4]
	movs r1, #0x18
	blx FUN_020F2998
	strb r1, [r4]
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D524

	thumb_func_start ov45_0222D594
ov45_0222D594: @ 0x0222D594
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0]
	adds r4, r2, #0
	str r0, [sp, #4]
	ldr r0, [r1]
	add r1, sp, #0
	str r0, [sp]
	ldrb r5, [r1, #2]
	movs r0, #6
	ldrsb r1, [r1, r0]
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	subs r0, r1, r0
	bpl _0222D5CE
	rsbs r0, r0, #0
	movs r1, #0x3c
	blx FUN_020F2998
	add r2, sp, #0
	ldrb r3, [r2, #6]
	adds r0, r0, #1
	movs r1, #0x3c
	muls r1, r0, r1
	adds r1, r3, r1
	strb r1, [r2, #6]
	ldrb r1, [r2, #5]
	subs r0, r1, r0
	strb r0, [r2, #5]
_0222D5CE:
	add r1, sp, #0
	ldrb r0, [r1, #6]
	subs r0, r0, r5
	strb r0, [r4, #2]
	ldrb r5, [r1, #1]
	movs r0, #5
	ldrsb r1, [r1, r0]
	lsls r0, r5, #0x18
	asrs r0, r0, #0x18
	subs r0, r1, r0
	bpl _0222D600
	rsbs r0, r0, #0
	movs r1, #0x3c
	blx FUN_020F2998
	add r2, sp, #0
	ldrb r3, [r2, #5]
	adds r0, r0, #1
	movs r1, #0x3c
	muls r1, r0, r1
	adds r1, r3, r1
	strb r1, [r2, #5]
	ldrb r1, [r2, #4]
	subs r0, r1, r0
	strb r0, [r2, #4]
_0222D600:
	add r1, sp, #0
	ldrb r0, [r1, #5]
	subs r0, r0, r5
	strb r0, [r4, #1]
	movs r0, #4
	ldrsb r2, [r1, r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r0, r2, r0
	bpl _0222D62A
	rsbs r0, r0, #0
	movs r1, #0x18
	blx FUN_020F2998
	add r1, sp, #0
	adds r2, r0, #1
	movs r0, #0x18
	ldrb r3, [r1, #4]
	muls r0, r2, r0
	adds r0, r3, r0
	strb r0, [r1, #4]
_0222D62A:
	add r0, sp, #0
	ldrb r1, [r0, #4]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D594

	thumb_func_start ov45_0222D638
ov45_0222D638: @ 0x0222D638
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	str r0, [sp]
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r5, #0
	beq _0222D6AE
	adds r0, r5, #0
	bl FUN_02091688
	cmp r4, r0
	bhi _0222D6AE
	movs r1, #0
	ldr r2, [sp]
	adds r0, r1, #0
	movs r7, #1
_0222D658:
	ldrb r3, [r2, #3]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x1c
	bne _0222D664
	adds r1, r7, #0
	b _0222D676
_0222D664:
	ldrh r3, [r2]
	cmp r5, r3
	bne _0222D676
	ldrb r3, [r2, #2]
	cmp r4, r3
	bne _0222D676
	cmp r6, #1
	beq _0222D6AE
	movs r1, #1
_0222D676:
	cmp r1, #0
	beq _0222D6A6
	lsls r2, r0, #2
	ldr r0, [sp]
	ldr r1, [sp]
	adds r0, r0, r2
	strh r5, [r1, r2]
	strb r4, [r0, #2]
	ldrb r3, [r0, #3]
	movs r1, #0xf
	bics r3, r1
	lsls r1, r6, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0xf
	ands r1, r2
	orrs r1, r3
	strb r1, [r0, #3]
	ldrb r2, [r0, #3]
	movs r1, #0xf0
	bics r2, r1
	movs r1, #0x10
	orrs r1, r2
	strb r1, [r0, #3]
	pop {r3, r4, r5, r6, r7, pc}
_0222D6A6:
	adds r0, r0, #1
	adds r2, r2, #4
	cmp r0, #0x32
	blt _0222D658
_0222D6AE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222D638

	thumb_func_start ov45_0222D6B0
ov45_0222D6B0: @ 0x0222D6B0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x32
	blo _0222D6BE
	bl GF_AssertFail
_0222D6BE:
	lsls r0, r5, #2
	adds r4, r4, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _0222D6D0
	bl GF_AssertFail
_0222D6D0:
	ldrh r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D6B0

	thumb_func_start ov45_0222D6D4
ov45_0222D6D4: @ 0x0222D6D4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x32
	blo _0222D6E2
	bl GF_AssertFail
_0222D6E2:
	lsls r4, r4, #2
	adds r0, r5, r4
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _0222D6F4
	bl GF_AssertFail
_0222D6F4:
	adds r0, r5, r4
	ldrb r0, [r0, #2]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D6D4

	thumb_func_start ov45_0222D6FC
ov45_0222D6FC: @ 0x0222D6FC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x32
	blo _0222D70A
	bl GF_AssertFail
_0222D70A:
	lsls r0, r5, #2
	adds r4, r4, r0
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	cmp r0, #1
	beq _0222D71C
	bl GF_AssertFail
_0222D71C:
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222D6FC

	thumb_func_start ov45_0222D724
ov45_0222D724: @ 0x0222D724
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x32
	blo _0222D732
	bl GF_AssertFail
_0222D732:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1c
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D724

	thumb_func_start ov45_0222D740
ov45_0222D740: @ 0x0222D740
	push {r4, lr}
	blx FUN_020C3B40
	cmp r0, #0
	beq _0222D76A
	adds r2, r0, #0
	adds r2, #8
	beq _0222D75E
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _0222D75E
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _0222D760
_0222D75E:
	movs r1, #0
_0222D760:
	cmp r1, #0
	beq _0222D76A
	ldr r1, [r1]
	adds r4, r0, r1
	b _0222D76C
_0222D76A:
	movs r4, #0
_0222D76C:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x40
	blx FUN_020C2BAC
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x80
	blx FUN_020C2BAC
	movs r2, #2
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #8
	blx FUN_020C2BAC
	movs r2, #1
	adds r0, r4, #0
	movs r1, #0
	lsls r2, r2, #0xa
	blx FUN_020C2BAC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D740

	thumb_func_start ov45_0222D79C
ov45_0222D79C: @ 0x0222D79C
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02091688
	cmp r0, #0
	bne _0222D7B0
	cmp r4, #0
	bne _0222D7B0
	movs r0, #1
	pop {r4, pc}
_0222D7B0:
	cmp r4, #1
	blo _0222D7BC
	cmp r4, r0
	bhi _0222D7BC
	movs r0, #1
	pop {r4, pc}
_0222D7BC:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov45_0222D79C

	thumb_func_start ov45_0222D7C0
ov45_0222D7C0: @ 0x0222D7C0
	ldr r1, _0222D7C8 @ =0x02254BB4
	ldrb r0, [r1, r0]
	bx lr
	nop
_0222D7C8: .4byte 0x02254BB4
	thumb_func_end ov45_0222D7C0

	thumb_func_start ov45_0222D7CC
ov45_0222D7CC: @ 0x0222D7CC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_021E6A70
	cmp r0, #0xb
	beq _0222D7DE
	cmp r5, #0x19
	bne _0222D7EA
_0222D7DE:
	cmp r4, #2
	beq _0222D7E6
	movs r0, #0xe
	pop {r3, r4, r5, pc}
_0222D7E6:
	movs r0, #0xb
	pop {r3, r4, r5, pc}
_0222D7EA:
	cmp r5, #0x1a
	bne _0222D7F2
	movs r0, #0xd
	pop {r3, r4, r5, pc}
_0222D7F2:
	cmp r0, #0
	bge _0222D7F8
	movs r0, #0xb
_0222D7F8:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D7CC

	thumb_func_start ov45_0222D7FC
ov45_0222D7FC: @ 0x0222D7FC
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_021E6A70
	cmp r4, #0x19
	bne _0222D80C
	movs r0, #0xb
	b _0222D812
_0222D80C:
	cmp r4, #0x1a
	bne _0222D812
	movs r0, #0xc
_0222D812:
	cmp r0, #0xb
	bhi _0222D83E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222D822: @ jump table
	.2byte _0222D83E - _0222D822 - 2 @ case 0
	.2byte _0222D83A - _0222D822 - 2 @ case 1
	.2byte _0222D83E - _0222D822 - 2 @ case 2
	.2byte _0222D83E - _0222D822 - 2 @ case 3
	.2byte _0222D83A - _0222D822 - 2 @ case 4
	.2byte _0222D83A - _0222D822 - 2 @ case 5
	.2byte _0222D83A - _0222D822 - 2 @ case 6
	.2byte _0222D83A - _0222D822 - 2 @ case 7
	.2byte _0222D83A - _0222D822 - 2 @ case 8
	.2byte _0222D83A - _0222D822 - 2 @ case 9
	.2byte _0222D83A - _0222D822 - 2 @ case 10
	.2byte _0222D83A - _0222D822 - 2 @ case 11
_0222D83A:
	movs r0, #0
	pop {r4, pc}
_0222D83E:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D7FC

	thumb_func_start ov45_0222D844
ov45_0222D844: @ 0x0222D844
	push {r3, lr}
	bl FUN_020393C8
	cmp r0, #0
	bne _0222D856
	bl FUN_020397FC
	cmp r0, #0
	beq _0222D85A
_0222D856:
	movs r0, #1
	pop {r3, pc}
_0222D85A:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222D844

	thumb_func_start ov45_0222D860
ov45_0222D860: @ 0x0222D860
	push {r3, r4, r5, lr}
	movs r1, #0x23
	lsls r1, r1, #4
	adds r5, r0, #0
	bl FUN_0201AA8C
	movs r2, #0x23
	adds r4, r0, #0
	movs r1, #0
	lsls r2, r2, #4
	blx FUN_020E5B44
	adds r0, r4, #0
	adds r0, #8
	bl ov45_0222DE1C
	adds r0, r4, #0
	adds r0, #0x5c
	adds r1, r5, #0
	bl ov45_0222DF78
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222D860

	thumb_func_start ov45_0222D890
ov45_0222D890: @ 0x0222D890
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	bl ov45_0222DFD0
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D890

	thumb_func_start ov45_0222D8A4
ov45_0222D8A4: @ 0x0222D8A4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x5c
	bl ov45_0222E000
	adds r4, #8
	adds r0, r4, #0
	movs r1, #0
	bl ov45_0222DEA4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222D8A4

	thumb_func_start ov45_0222D8BC
ov45_0222D8BC: @ 0x0222D8BC
	ldr r1, [r1]
	str r1, [r0]
	movs r1, #1
	str r1, [r0, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222D8BC

	thumb_func_start ov45_0222D8C8
ov45_0222D8C8: @ 0x0222D8C8
	push {r3, lr}
	adds r0, #8
	bl ov45_0222DE58
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222D8C8

	thumb_func_start ov45_0222D8D4
ov45_0222D8D4: @ 0x0222D8D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #8
	adds r4, r1, #0
	bl ov45_0222DF14
	adds r5, #8
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov45_0222DE74
	adds r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222D8D4

	thumb_func_start ov45_0222D8F0
ov45_0222D8F0: @ 0x0222D8F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	str r0, [sp]
	str r1, [sp, #4]
	movs r5, #0
	adds r4, #8
	movs r6, #2
	movs r7, #2
_0222D902:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov45_0222DF38
	adds r2, r0, #0
	tst r0, r7
	beq _0222D91A
	adds r0, r4, #0
	adds r1, r5, #0
	bics r2, r6
	bl ov45_0222DE8C
_0222D91A:
	adds r5, r5, #1
	cmp r5, #0x14
	blt _0222D902
	ldr r0, [sp]
	ldr r1, [sp, #4]
	adds r0, #8
	bl ov45_0222DF38
	adds r3, r0, #0
	ldr r0, [sp]
	movs r2, #2
	adds r0, #8
	ldr r1, [sp, #4]
	orrs r2, r3
	str r0, [sp]
	bl ov45_0222DE8C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222D8F0

	thumb_func_start ov45_0222D940
ov45_0222D940: @ 0x0222D940
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x5c
	movs r1, #8
	bl ov45_0222E04C
	adds r6, r0, #0
	beq _0222D98C
	ldr r1, [r4]
	str r1, [sp]
	ldr r1, [r4, #4]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldrh r2, [r4, #8]
	adds r3, r1, #0
	str r2, [sp, #0x10]
	ldrh r2, [r4, #0xa]
	str r2, [sp, #0x14]
	str r1, [sp, #0x18]
	movs r2, #0x96
	str r1, [sp, #0x1c]
	lsls r2, r2, #2
	str r2, [sp, #0x20]
	movs r2, #8
	str r2, [sp, #0x24]
	adds r2, r1, #0
	str r1, [sp, #0x28]
	bl ov45_0222E0E0
	adds r5, #0x5c
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222E0A4
_0222D98C:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov45_0222D940

	thumb_func_start ov45_0222D990
ov45_0222D990: @ 0x0222D990
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0x1b
	bhs _0222D9E6
	adds r0, r5, #0
	adds r0, #0x5c
	movs r1, #7
	bl ov45_0222E04C
	adds r6, r0, #0
	beq _0222D9E6
	ldr r1, [r4]
	movs r2, #0
	str r1, [sp]
	ldr r1, [r4, #4]
	adds r3, r2, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	ldrh r1, [r4, #8]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0xa]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	movs r1, #0x96
	str r2, [sp, #0x1c]
	lsls r1, r1, #2
	str r1, [sp, #0x20]
	movs r1, #7
	str r1, [sp, #0x24]
	movs r1, #1
	str r1, [sp, #0x28]
	ldr r1, [r4, #0xc]
	bl ov45_0222E0E0
	adds r5, #0x5c
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222E0A4
_0222D9E6:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222D990

	thumb_func_start ov45_0222D9EC
ov45_0222D9EC: @ 0x0222D9EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r5, r1, #0
	ldr r4, [r5]
	adds r6, r0, #0
	cmp r4, #0
	beq _0222DA02
	cmp r4, #1
	beq _0222DA02
	cmp r4, #2
	bne _0222DA76
_0222DA02:
	ldr r0, [r5, #0x20]
	cmp r0, #1
	ldr r0, [r5, #4]
	bne _0222DA16
	cmp r0, #2
	blo _0222DA76
	cmp r0, #4
	bls _0222DA1E
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
_0222DA16:
	cmp r0, #1
	blo _0222DA76
	cmp r0, #4
	bhi _0222DA76
_0222DA1E:
	ldr r0, _0222DA7C @ =0x02254BDC
	lsls r1, r4, #2
	ldr r7, [r0, r1]
	adds r0, r6, #0
	lsls r1, r7, #0x10
	adds r0, #0x5c
	lsrs r1, r1, #0x10
	bl ov45_0222E04C
	str r0, [sp, #0x2c]
	cmp r0, #0
	beq _0222DA76
	ldr r1, [r5, #8]
	str r1, [sp]
	ldr r1, [r5, #0xc]
	str r1, [sp, #4]
	ldr r1, [r5, #0x10]
	str r1, [sp, #8]
	ldr r1, [r5, #0x14]
	str r1, [sp, #0xc]
	ldrh r1, [r5, #0x18]
	str r1, [sp, #0x10]
	ldrh r1, [r5, #0x1a]
	str r1, [sp, #0x14]
	ldrh r1, [r5, #0x1c]
	str r1, [sp, #0x18]
	ldrh r1, [r5, #0x1e]
	str r1, [sp, #0x1c]
	movs r1, #0xe1
	lsls r1, r1, #2
	str r1, [sp, #0x20]
	str r7, [sp, #0x24]
	movs r1, #2
	str r1, [sp, #0x28]
	ldr r2, [r5, #4]
	ldr r3, [r5, #0x20]
	adds r1, r4, #0
	bl ov45_0222E0E0
	adds r6, #0x5c
	ldr r1, [sp, #0x2c]
	adds r0, r6, #0
	bl ov45_0222E0A4
_0222DA76:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DA7C: .4byte 0x02254BDC
	thumb_func_end ov45_0222D9EC

	thumb_func_start ov45_0222DA80
ov45_0222DA80: @ 0x0222DA80
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #3
	beq _0222DA92
	cmp r1, #4
	bne _0222DADA
_0222DA92:
	adds r1, r1, #5
	adds r0, r5, #0
	lsls r1, r1, #0x10
	adds r0, #0x5c
	lsrs r1, r1, #0x10
	bl ov45_0222E04C
	adds r6, r0, #0
	beq _0222DADA
	ldr r1, [r4]
	ldr r2, [r4, #8]
	movs r3, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	ldrh r2, [r4, #0xc]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	movs r2, #0xe1
	str r3, [sp, #0x1c]
	lsls r2, r2, #2
	str r2, [sp, #0x20]
	adds r2, r1, #5
	str r2, [sp, #0x24]
	movs r2, #3
	str r2, [sp, #0x28]
	ldr r2, [r4, #4]
	bl ov45_0222E0E0
	adds r5, #0x5c
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222E0A4
_0222DADA:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222DA80

	thumb_func_start ov45_0222DAE0
ov45_0222DAE0: @ 0x0222DAE0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x5c
	movs r1, #0xc
	bl ov45_0222E04C
	adds r6, r0, #0
	beq _0222DB34
	ldr r1, [r4, #4]
	movs r2, #0
	str r1, [sp]
	ldr r1, [r4, #8]
	adds r3, r2, #0
	str r1, [sp, #4]
	ldr r1, [r4, #0xc]
	str r1, [sp, #8]
	ldr r1, [r4, #0x10]
	str r1, [sp, #0xc]
	ldrh r1, [r4, #0x14]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0x16]
	str r1, [sp, #0x14]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #0x18]
	ldrh r1, [r4, #0x1a]
	str r1, [sp, #0x1c]
	ldr r1, _0222DB38 @ =0x000001C2
	str r1, [sp, #0x20]
	movs r1, #0xc
	str r1, [sp, #0x24]
	movs r1, #4
	str r1, [sp, #0x28]
	ldr r1, [r4]
	bl ov45_0222E0E0
	adds r5, #0x5c
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222E0A4
_0222DB34:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222DB38: .4byte 0x000001C2
	thumb_func_end ov45_0222DAE0

	thumb_func_start ov45_0222DB3C
ov45_0222DB3C: @ 0x0222DB3C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, #0x5c
	movs r1, #0xd
	bl ov45_0222E04C
	adds r6, r0, #0
	beq _0222DB90
	ldr r1, [r4, #4]
	movs r2, #0
	str r1, [sp]
	ldr r1, [r4, #8]
	adds r3, r2, #0
	str r1, [sp, #4]
	ldr r1, [r4, #0xc]
	str r1, [sp, #8]
	ldr r1, [r4, #0x10]
	str r1, [sp, #0xc]
	ldrh r1, [r4, #0x14]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0x16]
	str r1, [sp, #0x14]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #0x18]
	ldrh r1, [r4, #0x1a]
	str r1, [sp, #0x1c]
	ldr r1, _0222DB94 @ =0x000001C2
	str r1, [sp, #0x20]
	movs r1, #0xd
	str r1, [sp, #0x24]
	movs r1, #5
	str r1, [sp, #0x28]
	ldr r1, [r4]
	bl ov45_0222E0E0
	adds r5, #0x5c
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222E0A4
_0222DB90:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_0222DB94: .4byte 0x000001C2
	thumb_func_end ov45_0222DB3C

	thumb_func_start ov45_0222DB98
ov45_0222DB98: @ 0x0222DB98
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _0222DC02
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222DBB2: @ jump table
	.2byte _0222DBC0 - _0222DBB2 - 2 @ case 0
	.2byte _0222DBC0 - _0222DBB2 - 2 @ case 1
	.2byte _0222DBC0 - _0222DBB2 - 2 @ case 2
	.2byte _0222DBBC - _0222DBB2 - 2 @ case 3
	.2byte _0222DBC0 - _0222DBB2 - 2 @ case 4
_0222DBBC:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
_0222DBC0:
	adds r0, r5, #0
	adds r0, #0x5c
	movs r1, #0xe
	bl ov45_0222E04C
	adds r6, r0, #0
	beq _0222DC02
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	movs r1, #0xe1
	str r3, [sp, #0x1c]
	lsls r1, r1, #2
	str r1, [sp, #0x20]
	movs r1, #0xe
	str r1, [sp, #0x24]
	movs r1, #6
	str r1, [sp, #0x28]
	ldr r1, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r1]
	bl ov45_0222E0E0
	adds r5, #0x5c
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222E0A4
_0222DC02:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_0222DB98

	thumb_func_start ov45_0222DC08
ov45_0222DC08: @ 0x0222DC08
	push {r3, r4, r5, r6, lr}
	sub sp, #0x2c
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0x14
	bhs _0222DC5A
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0222DC5A
	adds r0, r5, #0
	adds r0, #0x5c
	movs r1, #1
	bl ov45_0222E04C
	adds r6, r0, #0
	beq _0222DC5A
	movs r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r1, _0222DC60 @ =0x00000708
	str r2, [sp, #0x1c]
	str r1, [sp, #0x20]
	movs r1, #1
	str r1, [sp, #0x24]
	movs r1, #7
	str r1, [sp, #0x28]
	ldr r1, [r4]
	adds r3, r2, #0
	bl ov45_0222E0E0
	adds r5, #0x5c
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0222E0A4
_0222DC5A:
	add sp, #0x2c
	pop {r3, r4, r5, r6, pc}
	nop
_0222DC60: .4byte 0x00000708
	thumb_func_end ov45_0222DC08

	thumb_func_start ov45_0222DC64
ov45_0222DC64: @ 0x0222DC64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222DC7A
	cmp r0, #1
	beq _0222DC7A
	cmp r0, #2
	bne _0222DCDA
_0222DC7A:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov45_0222E5B4
	cmp r0, #0
	beq _0222DCDA
	ldr r7, [r4]
	ldr r0, _0222DCE0 @ =0x02254BC8
	ldrb r6, [r0, r7]
	adds r0, r5, #0
	adds r0, #0x5c
	adds r1, r6, #0
	bl ov45_0222E04C
	str r0, [sp, #0x2c]
	cmp r0, #0
	beq _0222DCDA
	ldr r1, [r4, #8]
	movs r3, #0
	str r1, [sp]
	ldr r1, [r4, #0xc]
	str r1, [sp, #4]
	ldr r1, [r4, #0x10]
	str r1, [sp, #8]
	ldr r1, [r4, #0x14]
	str r1, [sp, #0xc]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #0x10]
	ldrh r1, [r4, #0x1a]
	str r1, [sp, #0x14]
	ldrh r1, [r4, #0x1c]
	str r1, [sp, #0x18]
	ldrh r1, [r4, #0x1e]
	str r1, [sp, #0x1c]
	ldr r1, _0222DCE4 @ =0x000001C2
	str r1, [sp, #0x20]
	str r6, [sp, #0x24]
	movs r1, #8
	str r1, [sp, #0x28]
	ldr r2, [r4, #4]
	adds r1, r7, #0
	bl ov45_0222E0E0
	adds r5, #0x5c
	ldr r1, [sp, #0x2c]
	adds r0, r5, #0
	bl ov45_0222E0A4
_0222DCDA:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DCE0: .4byte 0x02254BC8
_0222DCE4: .4byte 0x000001C2
	thumb_func_end ov45_0222DC64

	thumb_func_start ov45_0222DCE8
ov45_0222DCE8: @ 0x0222DCE8
	ldr r3, _0222DCF0 @ =ov45_0222E03C
	adds r0, #0x5c
	bx r3
	nop
_0222DCF0: .4byte ov45_0222E03C
	thumb_func_end ov45_0222DCE8

	thumb_func_start ov45_0222DCF4
ov45_0222DCF4: @ 0x0222DCF4
	ldr r2, [r0]
	str r2, [r1]
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov45_0222DCF4

	thumb_func_start ov45_0222DCFC
ov45_0222DCFC: @ 0x0222DCFC
	ldr r3, _0222DD04 @ =ov45_0222DECC
	adds r0, #8
	bx r3
	nop
_0222DD04: .4byte ov45_0222DECC
	thumb_func_end ov45_0222DCFC

	thumb_func_start ov45_0222DD08
ov45_0222DD08: @ 0x0222DD08
	ldr r3, _0222DD10 @ =ov45_0222DEE0
	adds r0, #8
	bx r3
	nop
_0222DD10: .4byte ov45_0222DEE0
	thumb_func_end ov45_0222DD08

	thumb_func_start ov45_0222DD14
ov45_0222DD14: @ 0x0222DD14
	ldr r3, _0222DD1C @ =ov45_0222DEF4
	adds r0, #8
	bx r3
	nop
_0222DD1C: .4byte ov45_0222DEF4
	thumb_func_end ov45_0222DD14

	thumb_func_start ov45_0222DD20
ov45_0222DD20: @ 0x0222DD20
	ldr r3, _0222DD28 @ =ov45_0222DF14
	adds r0, #8
	bx r3
	nop
_0222DD28: .4byte ov45_0222DF14
	thumb_func_end ov45_0222DD20

	thumb_func_start ov45_0222DD2C
ov45_0222DD2C: @ 0x0222DD2C
	ldr r3, _0222DD34 @ =ov45_0222DF58
	adds r0, #8
	bx r3
	nop
_0222DD34: .4byte ov45_0222DF58
	thumb_func_end ov45_0222DD2C

	thumb_func_start ov45_0222DD38
ov45_0222DD38: @ 0x0222DD38
	ldr r3, _0222DD40 @ =ov45_0222DF50
	adds r0, #8
	bx r3
	nop
_0222DD40: .4byte ov45_0222DF50
	thumb_func_end ov45_0222DD38

	thumb_func_start ov45_0222DD44
ov45_0222DD44: @ 0x0222DD44
	movs r1, #0x8a
	lsls r1, r1, #2
	ldr r2, [r0, r1]
	subs r1, #0x2c
	adds r0, r0, r1
	cmp r2, r0
	beq _0222DD56
	movs r0, #1
	bx lr
_0222DD56:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222DD44

	thumb_func_start ov45_0222DD5C
ov45_0222DD5C: @ 0x0222DD5C
	push {r4, lr}
	adds r4, r0, #0
	bl ov45_0222DD44
	cmp r0, #0
	bne _0222DD6C
	bl GF_AssertFail
_0222DD6C:
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	ldrb r0, [r0]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222DD5C

	thumb_func_start ov45_0222DD78
ov45_0222DD78: @ 0x0222DD78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r4, r0, #0
	str r1, [sp, #8]
	adds r5, r3, #0
	bl ov45_0222DD44
	cmp r0, #0
	bne _0222DD8E
	bl GF_AssertFail
_0222DD8E:
	movs r2, #0x8a
	lsls r2, r2, #2
	ldr r4, [r4, r2]
	ldr r3, [sp, #0x28]
	movs r0, #1
	movs r1, #0x1b
	adds r2, #0xcd
	bl FUN_0200BAF8
	adds r7, r0, #0
	ldr r0, [sp, #0x28]
	bl FUN_0200BD08
	ldrb r6, [r4]
	str r0, [sp, #0xc]
	cmp r6, #9
	bhs _0222DDCA
	ldr r0, [sp, #0x28]
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	ldr r4, _0222DDE0 @ =0x02254C0C
	lsls r5, r6, #2
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r4, [r4, r5]
	adds r3, r7, #0
	blx r4
	adds r4, r0, #0
	b _0222DDCC
_0222DDCA:
	movs r4, #0
_0222DDCC:
	adds r0, r7, #0
	bl FUN_0200BB44
	ldr r0, [sp, #0xc]
	bl FUN_0200BDA0
	adds r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DDE0: .4byte 0x02254C0C
	thumb_func_end ov45_0222DD78

	thumb_func_start ov45_0222DDE4
ov45_0222DDE4: @ 0x0222DDE4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov45_0222DD44
	cmp r0, #0
	bne _0222DDF6
	bl GF_AssertFail
_0222DDF6:
	movs r0, #0x8a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	ldrb r2, [r0]
	cmp r2, #9
	bhs _0222DE0E
	lsls r3, r2, #2
	ldr r2, _0222DE18 @ =0x02254BE8
	adds r1, r4, #0
	ldr r2, [r2, r3]
	blx r2
	pop {r3, r4, r5, pc}
_0222DE0E:
	bl GF_AssertFail
	movs r0, #0x14
	pop {r3, r4, r5, pc}
	nop
_0222DE18: .4byte 0x02254BE8
	thumb_func_end ov45_0222DDE4

	thumb_func_start ov45_0222DE1C
ov45_0222DE1C: @ 0x0222DE1C
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	adds r5, r0, #0
	movs r6, #2
	adds r7, r4, #0
_0222DE26:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	adds r3, r7, #0
	bl ov45_0222DE3C
	adds r4, r4, #1
	cmp r4, #0x14
	blt _0222DE26
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222DE1C

	thumb_func_start ov45_0222DE3C
ov45_0222DE3C: @ 0x0222DE3C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r4, #0x14
	blo _0222DE4E
	bl GF_AssertFail
_0222DE4E:
	lsls r0, r4, #2
	strh r6, [r5, r0]
	adds r0, r5, r0
	strh r7, [r0, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222DE3C

	thumb_func_start ov45_0222DE58
ov45_0222DE58: @ 0x0222DE58
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov45_0222DE3C
	adds r0, r5, #0
	movs r1, #1
	bl ov45_0222DEA4
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov45_0222DEB8
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DE58

	thumb_func_start ov45_0222DE74
ov45_0222DE74: @ 0x0222DE74
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #2
	movs r3, #0
	bl ov45_0222DE3C
	adds r0, r4, #0
	movs r1, #2
	bl ov45_0222DEA4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222DE74

	thumb_func_start ov45_0222DE8C
ov45_0222DE8C: @ 0x0222DE8C
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #0x14
	blo _0222DE9C
	bl GF_AssertFail
_0222DE9C:
	lsls r0, r4, #2
	adds r0, r5, r0
	strh r6, [r0, #2]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222DE8C

	thumb_func_start ov45_0222DEA4
ov45_0222DEA4: @ 0x0222DEA4
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #2
	ble _0222DEB2
	bl GF_AssertFail
_0222DEB2:
	adds r5, #0x50
	strh r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DEA4

	thumb_func_start ov45_0222DEB8
ov45_0222DEB8: @ 0x0222DEB8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222DEC6
	bl GF_AssertFail
_0222DEC6:
	adds r5, #0x52
	strh r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DEB8

	thumb_func_start ov45_0222DECC
ov45_0222DECC: @ 0x0222DECC
	push {r3, lr}
	bl ov45_0222DEE0
	cmp r0, #2
	beq _0222DEDA
	movs r0, #1
	pop {r3, pc}
_0222DEDA:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222DECC

	thumb_func_start ov45_0222DEE0
ov45_0222DEE0: @ 0x0222DEE0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x14
	blo _0222DEEE
	bl GF_AssertFail
_0222DEEE:
	lsls r0, r5, #2
	ldrh r0, [r4, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222DEE0

	thumb_func_start ov45_0222DEF4
ov45_0222DEF4: @ 0x0222DEF4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x14
	blo _0222DF02
	bl GF_AssertFail
_0222DF02:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldrh r1, [r0, #2]
	movs r0, #1
	tst r1, r0
	bne _0222DF10
	movs r0, #0
_0222DF10:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222DEF4

	thumb_func_start ov45_0222DF14
ov45_0222DF14: @ 0x0222DF14
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x14
	blo _0222DF22
	bl GF_AssertFail
_0222DF22:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldrh r1, [r0, #2]
	movs r0, #2
	tst r0, r1
	beq _0222DF32
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222DF32:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222DF14

	thumb_func_start ov45_0222DF38
ov45_0222DF38: @ 0x0222DF38
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, #0x14
	blo _0222DF46
	bl GF_AssertFail
_0222DF46:
	lsls r0, r5, #2
	adds r0, r4, r0
	ldrh r0, [r0, #2]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222DF38

	thumb_func_start ov45_0222DF50
ov45_0222DF50: @ 0x0222DF50
	adds r0, #0x50
	ldrh r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222DF50

	thumb_func_start ov45_0222DF58
ov45_0222DF58: @ 0x0222DF58
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #0x14
	blo _0222DF66
	bl GF_AssertFail
_0222DF66:
	adds r5, #0x52
	ldrh r0, [r5]
	cmp r0, r4
	bne _0222DF72
	movs r0, #1
	pop {r3, r4, r5, pc}
_0222DF72:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222DF58

	thumb_func_start ov45_0222DF78
ov45_0222DF78: @ 0x0222DF78
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r2, #0x75
	adds r6, r1, #0
	movs r1, #0
	lsls r2, r2, #2
	str r0, [sp]
	blx FUN_020E5B44
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	movs r7, #8
	str r0, [sp, #4]
_0222DF94:
	ldr r5, [sp, #4]
	movs r4, #0
_0222DF98:
	adds r0, r7, #0
	adds r1, r6, #0
	bl FUN_02026354
	str r0, [r5, #0x10]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222DF98
	ldr r0, [sp, #4]
	adds r0, #0x34
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #8
	blt _0222DF94
	movs r2, #0x1a
	lsls r2, r2, #4
	ldr r0, [sp]
	adds r1, r2, #0
	adds r3, r0, r2
	adds r1, #0x2c
	str r3, [r0, r1]
	adds r2, #0x30
	str r3, [r0, r2]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222DF78

	thumb_func_start ov45_0222DFD0
ov45_0222DFD0: @ 0x0222DFD0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	movs r7, #0
	adds r6, r0, #0
_0222DFD8:
	movs r4, #0
	adds r5, r6, #0
_0222DFDC:
	ldr r0, [r5, #0x10]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _0222DFDC
	adds r7, r7, #1
	adds r6, #0x34
	cmp r7, #8
	blt _0222DFD8
	movs r2, #0x75
	ldr r0, [sp]
	movs r1, #0
	lsls r2, r2, #2
	blx FUN_020E5B44
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222DFD0

	thumb_func_start ov45_0222E000
ov45_0222E000: @ 0x0222E000
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #0x73
	lsls r0, r0, #2
	ldr r1, [r6, r0]
	subs r0, #0x2c
	adds r4, r6, r0
	cmp r1, r4
	beq _0222E038
	movs r7, #0
_0222E014:
	ldr r5, [r1, #0x2c]
	movs r0, #0x2a
	strh r7, [r1, #0x28]
	ldrsh r0, [r1, r0]
	subs r0, r0, #1
	cmp r0, #0
	ble _0222E02C
	movs r0, #0x2a
	ldrsh r0, [r1, r0]
	subs r0, r0, #1
	strh r0, [r1, #0x2a]
	b _0222E032
_0222E02C:
	adds r0, r6, #0
	bl ov45_0222E0CC
_0222E032:
	adds r1, r5, #0
	cmp r5, r4
	bne _0222E014
_0222E038:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222E000

	thumb_func_start ov45_0222E03C
ov45_0222E03C: @ 0x0222E03C
	movs r1, #0x73
	lsls r1, r1, #2
	ldr r3, _0222E048 @ =ov45_0222E0CC
	ldr r1, [r0, r1]
	bx r3
	nop
_0222E048: .4byte ov45_0222E0CC
	thumb_func_end ov45_0222E03C

	thumb_func_start ov45_0222E04C
ov45_0222E04C: @ 0x0222E04C
	push {r3, r4, r5, lr}
	movs r4, #0
	adds r3, r4, #0
	adds r5, r0, #0
_0222E054:
	ldr r2, [r5, #0x2c]
	cmp r2, #0
	bne _0222E062
	movs r2, #0x34
	muls r2, r3, r2
	adds r4, r0, r2
	b _0222E06A
_0222E062:
	adds r3, r3, #1
	adds r5, #0x34
	cmp r3, #8
	blt _0222E054
_0222E06A:
	cmp r4, #0
	bne _0222E08E
	movs r2, #0
	adds r5, r0, #0
_0222E072:
	ldrh r3, [r5, #0x28]
	cmp r3, r1
	blo _0222E086
	movs r1, #0x34
	muls r1, r2, r1
	adds r4, r0, r1
	adds r1, r4, #0
	bl ov45_0222E0CC
	b _0222E08E
_0222E086:
	adds r2, r2, #1
	adds r5, #0x34
	cmp r2, #8
	blt _0222E072
_0222E08E:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222E04C

	thumb_func_start ov45_0222E094
ov45_0222E094: @ 0x0222E094
	ldr r2, [r0, #0x2c]
	str r2, [r1, #0x2c]
	str r0, [r1, #0x30]
	str r1, [r0, #0x2c]
	ldr r0, [r1, #0x2c]
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222E094

	thumb_func_start ov45_0222E0A4
ov45_0222E0A4: @ 0x0222E0A4
	push {r4, lr}
	movs r2, #0x1d
	lsls r2, r2, #4
	ldr r3, [r0, r2]
	subs r2, #0x30
	adds r2, r0, r2
	cmp r3, r2
	beq _0222E0C2
	ldrh r4, [r1, #0x28]
_0222E0B6:
	ldrh r0, [r3, #0x28]
	cmp r0, r4
	blo _0222E0C2
	ldr r3, [r3, #0x30]
	cmp r3, r2
	bne _0222E0B6
_0222E0C2:
	adds r0, r3, #0
	bl ov45_0222E094
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_0222E0A4

	thumb_func_start ov45_0222E0CC
ov45_0222E0CC: @ 0x0222E0CC
	ldr r2, [r1, #0x2c]
	ldr r0, [r1, #0x30]
	str r2, [r0, #0x2c]
	ldr r2, [r1, #0x30]
	ldr r0, [r1, #0x2c]
	str r2, [r0, #0x30]
	movs r0, #0
	str r0, [r1, #0x30]
	str r0, [r1, #0x2c]
	bx lr
	thumb_func_end ov45_0222E0CC

	thumb_func_start ov45_0222E0E0
ov45_0222E0E0: @ 0x0222E0E0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [sp, #0x40]
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	cmp r0, #9
	blo _0222E0F4
	bl GF_AssertFail
_0222E0F4:
	ldr r0, [sp, #0x40]
	strb r0, [r5]
	ldr r0, [sp, #0x38]
	strh r0, [r5, #0x2a]
	ldr r0, [sp, #0x3c]
	strh r0, [r5, #0x28]
	str r4, [r5, #4]
	str r6, [r5, #8]
	str r7, [r5, #0xc]
	add r0, sp, #8
	ldrh r1, [r0, #0x20]
	strh r1, [r5, #0x20]
	ldrh r1, [r0, #0x24]
	strh r1, [r5, #0x22]
	ldrh r1, [r0, #0x28]
	strh r1, [r5, #0x24]
	ldrh r0, [r0, #0x2c]
	strh r0, [r5, #0x26]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0222E124
	ldr r1, [r5, #0x10]
	bl FUN_02028F58
_0222E124:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	beq _0222E130
	ldr r1, [r5, #0x14]
	bl FUN_02028F58
_0222E130:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _0222E13C
	ldr r1, [r5, #0x18]
	bl FUN_02028F58
_0222E13C:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	beq _0222E148
	ldr r1, [r5, #0x1c]
	bl FUN_02028F58
_0222E148:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222E0E0

	thumb_func_start ov45_0222E14C
ov45_0222E14C: @ 0x0222E14C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0222E19C @ =0x020F5670
	adds r6, r2, #0
	ldrb r4, [r0]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	movs r1, #0
	adds r7, r3, #0
	ldr r2, [r5, #0x10]
	adds r0, r6, #0
	adds r3, r1, #0
	bl FUN_0200BE3C
	movs r1, #1
	str r1, [sp]
	str r4, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	movs r3, #0
	bl FUN_0200BE3C
	adds r0, r7, #0
	movs r1, #7
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r1, [sp, #0x20]
	adds r0, r6, #0
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E19C: .4byte 0x020F5670
	thumb_func_end ov45_0222E14C

	thumb_func_start ov45_0222E1A0
ov45_0222E1A0: @ 0x0222E1A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0222E1FC @ =0x020F5670
	adds r6, r2, #0
	ldrb r4, [r0]
	movs r0, #1
	str r0, [sp]
	str r4, [sp, #4]
	movs r1, #0
	adds r7, r3, #0
	ldr r2, [r5, #0x10]
	adds r0, r6, #0
	adds r3, r1, #0
	bl FUN_0200BE3C
	movs r1, #1
	str r1, [sp]
	str r4, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r6, #0
	movs r3, #0
	bl FUN_0200BE3C
	ldr r2, [r5, #4]
	adds r0, r6, #0
	movs r1, #2
	bl FUN_0200C7BC
	adds r0, r7, #0
	movs r1, #8
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r1, [sp, #0x20]
	adds r0, r6, #0
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E1FC: .4byte 0x020F5670
	thumb_func_end ov45_0222E1A0

	thumb_func_start ov45_0222E200
ov45_0222E200: @ 0x0222E200
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r2, [r5, #4]
	adds r0, r4, #0
	movs r1, #0
	adds r7, r3, #0
	bl FUN_0200C74C
	ldr r0, [r5, #0xc]
	cmp r0, #1
	bne _0222E2EE
	ldr r0, [r5, #8]
	cmp r0, #2
	beq _0222E266
	cmp r0, #3
	beq _0222E22A
	cmp r0, #4
	beq _0222E290
	b _0222E2DE
_0222E22A:
	ldr r0, _0222E338 @ =0x020F5670
	movs r1, #1
	ldrb r6, [r0]
	str r1, [sp]
	adds r0, r4, #0
	str r6, [sp, #4]
	ldr r2, [r5, #0x10]
	movs r3, #0
	bl FUN_0200BE3C
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl FUN_0200BE3C
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #3
	movs r3, #0
	bl FUN_0200BE3C
	movs r1, #0x12
	b _0222E2E4
_0222E266:
	ldr r0, _0222E338 @ =0x020F5670
	movs r1, #1
	ldrb r6, [r0]
	str r1, [sp]
	adds r0, r4, #0
	str r6, [sp, #4]
	ldr r2, [r5, #0x10]
	movs r3, #0
	bl FUN_0200BE3C
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl FUN_0200BE3C
	movs r1, #0x13
	b _0222E2E4
_0222E290:
	ldr r0, _0222E338 @ =0x020F5670
	movs r1, #1
	ldrb r6, [r0]
	str r1, [sp]
	adds r0, r4, #0
	str r6, [sp, #4]
	ldr r2, [r5, #0x10]
	movs r3, #0
	bl FUN_0200BE3C
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x14]
	adds r0, r4, #0
	movs r1, #2
	movs r3, #0
	bl FUN_0200BE3C
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #3
	movs r3, #0
	bl FUN_0200BE3C
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	ldr r2, [r5, #0x1c]
	adds r0, r4, #0
	movs r1, #4
	movs r3, #0
	bl FUN_0200BE3C
	movs r1, #6
	b _0222E2E4
_0222E2DE:
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E2E4:
	adds r0, r7, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	b _0222E320
_0222E2EE:
	ldr r0, _0222E338 @ =0x020F5670
	movs r1, #1
	ldrb r0, [r0]
	str r1, [sp]
	movs r3, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	adds r0, r4, #0
	bl FUN_0200BE3C
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r5, [r5, #8]
	movs r2, #4
	adds r0, r4, #0
	movs r1, #2
	subs r2, r2, r5
	bl FUN_0200BFCC
	adds r0, r7, #0
	movs r1, #5
	bl FUN_0200BBA0
	adds r5, r0, #0
_0222E320:
	ldr r1, [sp, #0x20]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E338: .4byte 0x020F5670
	thumb_func_end ov45_0222E200

	thumb_func_start ov45_0222E33C
ov45_0222E33C: @ 0x0222E33C
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r2, [r5, #4]
	adds r0, r4, #0
	movs r1, #0
	adds r6, r3, #0
	bl FUN_0200C74C
	ldr r0, _0222E398 @ =0x020F5670
	movs r1, #1
	ldrb r0, [r0]
	str r1, [sp]
	movs r3, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	adds r0, r4, #0
	bl FUN_0200BE3C
	movs r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r5, [r5, #8]
	movs r2, #8
	adds r0, r4, #0
	movs r1, #2
	subs r2, r2, r5
	bl FUN_0200BFCC
	adds r0, r6, #0
	movs r1, #9
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r1, [sp, #0x18]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222E398: .4byte 0x020F5670
	thumb_func_end ov45_0222E33C

	thumb_func_start ov45_0222E39C
ov45_0222E39C: @ 0x0222E39C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r1, [r6, #4]
	adds r7, r2, #0
	movs r4, #0
	str r3, [sp, #8]
	cmp r1, #0
	bls _0222E3D4
	ldr r0, _0222E410 @ =0x020F5670
	adds r5, r6, #0
	ldrb r0, [r0]
	str r0, [sp, #0xc]
_0222E3B6:
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r1, r4, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	adds r0, r7, #0
	movs r3, #0
	bl FUN_0200BE3C
	ldr r1, [r6, #4]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r1
	blo _0222E3B6
_0222E3D4:
	ldrb r0, [r6]
	cmp r0, #4
	bne _0222E3E4
	adds r0, r7, #0
	movs r2, #5
	bl FUN_0200C74C
	b _0222E3EC
_0222E3E4:
	adds r0, r7, #0
	movs r2, #6
	bl FUN_0200C74C
_0222E3EC:
	ldr r2, [r6, #4]
	movs r1, #0xe
	ldr r0, [sp, #8]
	subs r1, r1, r2
	bl FUN_0200BBA0
	adds r4, r0, #0
	ldr r1, [sp, #0x28]
	adds r0, r7, #0
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E410: .4byte 0x020F5670
	thumb_func_end ov45_0222E39C

	thumb_func_start ov45_0222E414
ov45_0222E414: @ 0x0222E414
	push {r3, r4, r5, lr}
	ldr r0, [r0, #8]
	adds r4, r2, #0
	adds r5, r3, #0
	cmp r0, #4
	bhi _0222E464
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E42C: @ jump table
	.2byte _0222E436 - _0222E42C - 2 @ case 0
	.2byte _0222E444 - _0222E42C - 2 @ case 1
	.2byte _0222E452 - _0222E42C - 2 @ case 2
	.2byte _0222E464 - _0222E42C - 2 @ case 3
	.2byte _0222E460 - _0222E42C - 2 @ case 4
_0222E436:
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl FUN_0200C784
	movs r1, #0xf
	b _0222E468
_0222E444:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #1
	bl FUN_0200C784
	movs r1, #0x14
	b _0222E468
_0222E452:
	adds r0, r4, #0
	movs r1, #0
	movs r2, #2
	bl FUN_0200C784
	movs r1, #0x10
	b _0222E468
_0222E460:
	movs r1, #0x11
	b _0222E468
_0222E464:
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222E468:
	adds r0, r5, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r1, [sp, #0x10]
	adds r0, r4, #0
	adds r2, r5, #0
	bl FUN_0200CBBC
	adds r0, r5, #0
	bl FUN_02026380
	movs r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222E414

	thumb_func_start ov45_0222E484
ov45_0222E484: @ 0x0222E484
	push {r3, lr}
	ldr r0, [r0, #4]
	cmp r0, #0x14
	blo _0222E490
	movs r0, #0
	pop {r3, pc}
_0222E490:
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222E49A
	movs r0, #0
	pop {r3, pc}
_0222E49A:
	ldr r2, [sp, #8]
	adds r0, r3, #0
	movs r1, #0x15
	bl FUN_0200BB6C
	movs r0, #1
	pop {r3, pc}
	thumb_func_end ov45_0222E484

	thumb_func_start ov45_0222E4A8
ov45_0222E4A8: @ 0x0222E4A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	adds r7, r2, #0
	str r3, [sp, #8]
	bl ov45_0222E5B4
	cmp r0, #0
	bne _0222E4C4
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E4C4:
	ldr r2, [r6, #4]
	adds r0, r7, #0
	movs r1, #0
	bl FUN_0200C74C
	ldr r1, [r6, #8]
	movs r4, #0
	cmp r1, #0
	bls _0222E4FC
	ldr r0, _0222E534 @ =0x020F5670
	adds r5, r6, #0
	ldrb r0, [r0]
	str r0, [sp, #0xc]
_0222E4DE:
	movs r0, #1
	str r0, [sp]
	ldr r0, [sp, #0xc]
	adds r1, r4, #1
	str r0, [sp, #4]
	ldr r2, [r5, #0x10]
	adds r0, r7, #0
	movs r3, #0
	bl FUN_0200BE3C
	ldr r1, [r6, #8]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r1
	blo _0222E4DE
_0222E4FC:
	ldr r0, [r6, #4]
	cmp r0, #1
	bhi _0222E510
	lsls r2, r1, #1
	ldr r1, _0222E538 @ =0x02254BCA
	ldr r0, [sp, #8]
	ldrh r1, [r1, r2]
	bl FUN_0200BBA0
	b _0222E51C
_0222E510:
	lsls r2, r1, #1
	ldr r1, _0222E53C @ =0x02254BD2
	ldr r0, [sp, #8]
	ldrh r1, [r1, r2]
	bl FUN_0200BBA0
_0222E51C:
	adds r4, r0, #0
	ldr r1, [sp, #0x28]
	adds r0, r7, #0
	adds r2, r4, #0
	bl FUN_0200CBBC
	adds r0, r4, #0
	bl FUN_02026380
	movs r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E534: .4byte 0x020F5670
_0222E538: .4byte 0x02254BCA
_0222E53C: .4byte 0x02254BD2
	thumb_func_end ov45_0222E4A8

	thumb_func_start ov45_0222E540
ov45_0222E540: @ 0x0222E540
	cmp r1, #2
	blo _0222E548
	movs r0, #0x14
	bx lr
_0222E548:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222E540

	thumb_func_start ov45_0222E550
ov45_0222E550: @ 0x0222E550
	cmp r1, #2
	blo _0222E558
	movs r0, #0x14
	bx lr
_0222E558:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222E550

	thumb_func_start ov45_0222E560
ov45_0222E560: @ 0x0222E560
	ldr r2, [r0, #8]
	cmp r2, r1
	bhi _0222E56A
	movs r0, #0x14
	bx lr
_0222E56A:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222E560

	thumb_func_start ov45_0222E574
ov45_0222E574: @ 0x0222E574
	cmp r1, #1
	blo _0222E57C
	movs r0, #0x14
	bx lr
_0222E57C:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	thumb_func_end ov45_0222E574

	thumb_func_start ov45_0222E584
ov45_0222E584: @ 0x0222E584
	ldr r2, [r0, #4]
	cmp r2, r1
	bhi _0222E58E
	movs r0, #0x14
	bx lr
_0222E58E:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222E584

	thumb_func_start ov45_0222E598
ov45_0222E598: @ 0x0222E598
	movs r0, #0x14
	bx lr
	thumb_func_end ov45_0222E598

	thumb_func_start ov45_0222E59C
ov45_0222E59C: @ 0x0222E59C
	movs r0, #0x14
	bx lr
	thumb_func_end ov45_0222E59C

	thumb_func_start ov45_0222E5A0
ov45_0222E5A0: @ 0x0222E5A0
	ldr r2, [r0, #8]
	cmp r2, r1
	bhi _0222E5AA
	movs r0, #0x14
	bx lr
_0222E5AA:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x20]
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222E5A0

	thumb_func_start ov45_0222E5B4
ov45_0222E5B4: @ 0x0222E5B4
	cmp r0, #1
	bhi _0222E5C4
	cmp r1, #1
	blo _0222E5C0
	cmp r1, #4
	bls _0222E5D0
_0222E5C0:
	movs r0, #0
	bx lr
_0222E5C4:
	cmp r1, #2
	blo _0222E5CC
	cmp r1, #4
	bls _0222E5D0
_0222E5CC:
	movs r0, #0
	bx lr
_0222E5D0:
	movs r0, #1
	bx lr
	thumb_func_end ov45_0222E5B4

	thumb_func_start ov45_0222E5D4
ov45_0222E5D4: @ 0x0222E5D4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222E67C @ =0x022577C0
	adds r6, r1, #0
	ldr r0, [r0]
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r0, #0
	beq _0222E5EA
	bl GF_AssertFail
_0222E5EA:
	movs r0, #0x4b
	lsls r0, r0, #2
	cmp r7, r0
	blo _0222E5F6
	bl GF_AssertFail
_0222E5F6:
	ldr r1, _0222E680 @ =0x00000988
	adds r0, r5, #0
	bl FUN_0201AA8C
	ldr r1, _0222E67C @ =0x022577C0
	ldr r2, _0222E680 @ =0x00000988
	str r0, [r1]
	movs r1, #0
	blx FUN_020E5B44
	ldr r0, _0222E67C @ =0x022577C0
	ldr r0, [r0]
	str r6, [r0]
	adds r0, r6, #0
	bl FUN_0202C6F4
	ldr r1, _0222E67C @ =0x022577C0
	ldr r1, [r1]
	str r0, [r1, #4]
	adds r0, r6, #0
	bl FUN_0202CA44
	ldr r6, _0222E67C @ =0x022577C0
	ldr r1, [r6]
	str r0, [r1, #8]
	ldr r3, [r6]
	ldm r4!, {r0, r1}
	adds r2, r3, #0
	adds r2, #0xc
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r2!, {r0, r1}
	ldr r0, [r4]
	adds r1, r7, #0
	str r0, [r2]
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	str r0, [r3, #0x20]
	ldr r0, [r6]
	bl ov45_0222F848
	adds r0, r6, #0
	ldr r0, [r0]
	movs r1, #0x14
	movs r2, #8
	adds r3, r5, #0
	bl ov45_0222F9B8
	adds r0, r6, #0
	ldr r0, [r0]
	bl ov45_02230144
	adds r0, r6, #0
	ldr r1, [r0]
	movs r0, #0x6a
	lsls r0, r0, #4
	adds r0, r1, r0
	movs r1, #0x80
	adds r2, r5, #0
	bl ov45_022303E4
	adds r0, r6, #0
	ldr r1, [r0]
	ldr r0, _0222E684 @ =0x00000984
	movs r2, #0
	str r2, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222E67C: .4byte 0x022577C0
_0222E680: .4byte 0x00000988
_0222E684: .4byte 0x00000984
	thumb_func_end ov45_0222E5D4

	thumb_func_start ov45_0222E688
ov45_0222E688: @ 0x0222E688
	push {r3, lr}
	ldr r0, _0222E6C4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E696
	bl GF_AssertFail
_0222E696:
	ldr r0, _0222E6C4 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x6a
	lsls r0, r0, #4
	adds r0, r1, r0
	bl ov45_022303FC
	ldr r0, _0222E6C4 @ =0x022577C0
	ldr r0, [r0]
	bl ov45_0222FA10
	ldr r0, _0222E6C4 @ =0x022577C0
	ldr r0, [r0]
	bl ov45_0222F878
	ldr r0, _0222E6C4 @ =0x022577C0
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, _0222E6C4 @ =0x022577C0
	movs r1, #0
	str r1, [r0]
	pop {r3, pc}
	.align 2, 0
_0222E6C4: .4byte 0x022577C0
	thumb_func_end ov45_0222E688

	thumb_func_start ov45_0222E6C8
ov45_0222E6C8: @ 0x0222E6C8
	push {r3, lr}
	ldr r0, _0222E7C4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E6D6
	movs r0, #0
	pop {r3, pc}
_0222E6D6:
	blx ov45_02231514
	cmp r0, #0xa
	bhi _0222E744
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E6EA: @ jump table
	.2byte _0222E700 - _0222E6EA - 2 @ case 0
	.2byte _0222E70E - _0222E6EA - 2 @ case 1
	.2byte _0222E70E - _0222E6EA - 2 @ case 2
	.2byte _0222E70E - _0222E6EA - 2 @ case 3
	.2byte _0222E70E - _0222E6EA - 2 @ case 4
	.2byte _0222E70E - _0222E6EA - 2 @ case 5
	.2byte _0222E70E - _0222E6EA - 2 @ case 6
	.2byte _0222E70E - _0222E6EA - 2 @ case 7
	.2byte _0222E71C - _0222E6EA - 2 @ case 8
	.2byte _0222E72A - _0222E6EA - 2 @ case 9
	.2byte _0222E738 - _0222E6EA - 2 @ case 10
_0222E700:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r2, #0
	ldr r1, [r0]
	movs r0, #0x4b
	lsls r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E70E:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	movs r0, #0x4b
	lsls r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E71C:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r2, #2
	ldr r1, [r0]
	movs r0, #0x4b
	lsls r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E72A:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r2, #3
	ldr r1, [r0]
	movs r0, #0x4b
	lsls r0, r0, #2
	strb r2, [r1, r0]
	b _0222E744
_0222E738:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r2, #4
	ldr r1, [r0]
	movs r0, #0x4b
	lsls r0, r0, #2
	strb r2, [r1, r0]
_0222E744:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r1, #0x4b
	ldr r0, [r0]
	lsls r1, r1, #2
	ldrb r1, [r0, r1]
	cmp r1, #2
	bne _0222E7BC
	bl ov45_022302E4
	ldr r0, _0222E7C4 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r1, r0
	blx ov45_022320C4
	blx ov45_022321E0
	cmp r0, #3
	bhi _0222E7BC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222E778: @ jump table
	.2byte _0222E780 - _0222E778 - 2 @ case 0
	.2byte _0222E794 - _0222E778 - 2 @ case 1
	.2byte _0222E7A0 - _0222E778 - 2 @ case 2
	.2byte _0222E7B2 - _0222E778 - 2 @ case 3
_0222E780:
	ldr r1, _0222E7C4 @ =0x022577C0
	ldr r0, _0222E7C8 @ =0x0000012E
	ldr r2, [r1]
	movs r3, #0
	strb r3, [r2, r0]
	ldr r1, [r1]
	movs r2, #4
	subs r0, r0, #1
	strb r2, [r1, r0]
	b _0222E7BC
_0222E794:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _0222E7C8 @ =0x0000012E
	strb r2, [r1, r0]
	b _0222E7BC
_0222E7A0:
	ldr r0, _0222E7C4 @ =0x022577C0
	ldr r2, [r0]
	ldr r0, _0222E7C8 @ =0x0000012E
	ldrb r1, [r2, r0]
	cmp r1, #3
	beq _0222E7BC
	movs r1, #2
	strb r1, [r2, r0]
	b _0222E7BC
_0222E7B2:
	ldr r0, _0222E7C4 @ =0x022577C0
	movs r2, #4
	ldr r1, [r0]
	ldr r0, _0222E7C8 @ =0x0000012E
	strb r2, [r1, r0]
_0222E7BC:
	bl ov45_0222E96C
	pop {r3, pc}
	nop
_0222E7C4: .4byte 0x022577C0
_0222E7C8: .4byte 0x0000012E
	thumb_func_end ov45_0222E6C8

	thumb_func_start ov45_0222E7CC
ov45_0222E7CC: @ 0x0222E7CC
	push {r3, lr}
	ldr r0, _0222E7F4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E7DA
	bl GF_AssertFail
_0222E7DA:
	ldr r0, _0222E7F4 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222E7F8 @ =0x00000984
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222E7EC
	blx ov45_02233220
	pop {r3, pc}
_0222E7EC:
	blx ov45_022331E8
	pop {r3, pc}
	nop
_0222E7F4: .4byte 0x022577C0
_0222E7F8: .4byte 0x00000984
	thumb_func_end ov45_0222E7CC

	thumb_func_start ov45_0222E7FC
ov45_0222E7FC: @ 0x0222E7FC
	ldr r3, _0222E800 @ =ov45_02233204
	bx r3
	.align 2, 0
_0222E800: .4byte ov45_02233204
	thumb_func_end ov45_0222E7FC

	thumb_func_start ov45_0222E804
ov45_0222E804: @ 0x0222E804
	ldr r3, _0222E80C @ =ov45_0222E810
	movs r1, #0
	bx r3
	nop
_0222E80C: .4byte ov45_0222E810
	thumb_func_end ov45_0222E804

	thumb_func_start ov45_0222E810
ov45_0222E810: @ 0x0222E810
	push {r3, r4, r5, lr}
	sub sp, #0x50
	adds r5, r0, #0
	ldr r0, _0222E8A0 @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E824
	bl GF_AssertFail
_0222E824:
	ldr r0, _0222E8A4 @ =ov45_0222FC44
	str r0, [sp, #0xc]
	ldr r0, _0222E8A8 @ =ov45_0222FCE0
	str r0, [sp, #0x10]
	ldr r0, _0222E8AC @ =ov45_0222FD50
	str r0, [sp, #0x14]
	ldr r0, _0222E8B0 @ =ov45_0222FDD4
	str r0, [sp, #0x18]
	ldr r0, _0222E8B4 @ =ov45_0222FDD8
	str r0, [sp, #0x1c]
	ldr r0, _0222E8B8 @ =ov45_0222FE84
	str r0, [sp, #0x20]
	ldr r0, _0222E8BC @ =ov45_0222FEC4
	str r0, [sp, #0x24]
	ldr r0, _0222E8C0 @ =ov45_0222FF40
	str r0, [sp, #0x28]
	ldr r0, _0222E8C4 @ =ov45_0222FF7C
	str r0, [sp, #0x2c]
	ldr r0, _0222E8C8 @ =ov45_02230008
	str r0, [sp, #0x30]
	ldr r0, _0222E8CC @ =ov45_02230050
	str r0, [sp, #0x34]
	ldr r0, _0222E8D0 @ =ov45_02230064
	str r0, [sp, #0x38]
	ldr r0, _0222E8D4 @ =ov45_02230090
	str r0, [sp, #0x3c]
	ldr r0, _0222E8D8 @ =ov45_022300B0
	str r0, [sp, #0x40]
	ldr r0, _0222E8DC @ =ov45_022300DC
	str r0, [sp, #0x44]
	ldr r0, _0222E8E0 @ =ov45_02230108
	str r0, [sp, #0x48]
	ldr r0, _0222E8E4 @ =ov45_02230130
	str r0, [sp, #0x4c]
	ldr r0, _0222E8A0 @ =0x022577C0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl FUN_0202C08C
	str r0, [sp]
	ldr r0, _0222E8A0 @ =0x022577C0
	str r5, [sp, #4]
	ldr r0, [r0]
	ldr r1, _0222E8E8 @ =0x02254F14
	ldr r0, [r0, #0x28]
	adds r2, r4, #0
	str r0, [sp, #8]
	ldr r0, _0222E8EC @ =0x02254F04
	add r3, sp, #0xc
	blx ov45_022310C0
	ldr r2, _0222E8A0 @ =0x022577C0
	ldr r1, _0222E8F0 @ =0x00000984
	ldr r3, [r2]
	str r0, [r3, r1]
	ldr r0, [r2]
	ldr r0, [r0, r1]
	bl ov45_0222F74C
	add sp, #0x50
	pop {r3, r4, r5, pc}
	nop
_0222E8A0: .4byte 0x022577C0
_0222E8A4: .4byte ov45_0222FC44
_0222E8A8: .4byte ov45_0222FCE0
_0222E8AC: .4byte ov45_0222FD50
_0222E8B0: .4byte ov45_0222FDD4
_0222E8B4: .4byte ov45_0222FDD8
_0222E8B8: .4byte ov45_0222FE84
_0222E8BC: .4byte ov45_0222FEC4
_0222E8C0: .4byte ov45_0222FF40
_0222E8C4: .4byte ov45_0222FF7C
_0222E8C8: .4byte ov45_02230008
_0222E8CC: .4byte ov45_02230050
_0222E8D0: .4byte ov45_02230064
_0222E8D4: .4byte ov45_02230090
_0222E8D8: .4byte ov45_022300B0
_0222E8DC: .4byte ov45_022300DC
_0222E8E0: .4byte ov45_02230108
_0222E8E4: .4byte ov45_02230130
_0222E8E8: .4byte 0x02254F14
_0222E8EC: .4byte 0x02254F04
_0222E8F0: .4byte 0x00000984
	thumb_func_end ov45_0222E810

	thumb_func_start ov45_0222E8F4
ov45_0222E8F4: @ 0x0222E8F4
	push {r3, lr}
	ldr r0, _0222E918 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E902
	bl GF_AssertFail
_0222E902:
	ldr r0, _0222E918 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x4b
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _0222E914
	movs r0, #1
	pop {r3, pc}
_0222E914:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0222E918: .4byte 0x022577C0
	thumb_func_end ov45_0222E8F4

	thumb_func_start ov45_0222E91C
ov45_0222E91C: @ 0x0222E91C
	push {r3, lr}
	ldr r0, _0222E940 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E92A
	bl GF_AssertFail
_0222E92A:
	bl ov45_0222F78C
	blx ov45_02231490
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222E93E
	bl GF_AssertFail
_0222E93E:
	pop {r3, pc}
	.align 2, 0
_0222E940: .4byte 0x022577C0
	thumb_func_end ov45_0222E91C

	thumb_func_start ov45_0222E944
ov45_0222E944: @ 0x0222E944
	push {r3, lr}
	ldr r0, _0222E968 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E952
	bl GF_AssertFail
_0222E952:
	ldr r0, _0222E968 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x4b
	lsls r0, r0, #2
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222E964
	movs r0, #1
	pop {r3, pc}
_0222E964:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0222E968: .4byte 0x022577C0
	thumb_func_end ov45_0222E944

	thumb_func_start ov45_0222E96C
ov45_0222E96C: @ 0x0222E96C
	push {r3, lr}
	ldr r0, _0222E9B0 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E97A
	bl GF_AssertFail
_0222E97A:
	ldr r0, _0222E9B0 @ =0x022577C0
	ldr r1, _0222E9B4 @ =0x0000012D
	ldr r0, [r0]
	ldrb r2, [r0, r1]
	cmp r2, #4
	beq _0222E992
	adds r1, r1, #1
	ldrb r1, [r0, r1]
	cmp r1, #4
	bne _0222E992
	movs r0, #4
	pop {r3, pc}
_0222E992:
	ldr r2, _0222E9B8 @ =0x00000133
	ldrb r1, [r0, r2]
	cmp r1, #0
	beq _0222E99E
	movs r0, #4
	pop {r3, pc}
_0222E99E:
	subs r1, r2, #1
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _0222E9AA
	movs r0, #4
	pop {r3, pc}
_0222E9AA:
	subs r1, r2, #7
	ldrb r0, [r0, r1]
	pop {r3, pc}
	.align 2, 0
_0222E9B0: .4byte 0x022577C0
_0222E9B4: .4byte 0x0000012D
_0222E9B8: .4byte 0x00000133
	thumb_func_end ov45_0222E96C

	thumb_func_start ov45_0222E9BC
ov45_0222E9BC: @ 0x0222E9BC
	push {r3, lr}
	ldr r0, _0222E9D8 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E9CA
	bl GF_AssertFail
_0222E9CA:
	ldr r0, _0222E9D8 @ =0x022577C0
	ldr r1, _0222E9DC @ =0x00000131
	ldr r3, [r0]
	movs r2, #0
	ldrb r0, [r3, r1]
	strb r2, [r3, r1]
	pop {r3, pc}
	.align 2, 0
_0222E9D8: .4byte 0x022577C0
_0222E9DC: .4byte 0x00000131
	thumb_func_end ov45_0222E9BC

	thumb_func_start ov45_0222E9E0
ov45_0222E9E0: @ 0x0222E9E0
	push {r3, lr}
	ldr r0, _0222E9F4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222E9EE
	bl GF_AssertFail
_0222E9EE:
	blx ov45_02232580
	pop {r3, pc}
	.align 2, 0
_0222E9F4: .4byte 0x022577C0
	thumb_func_end ov45_0222E9E0

	thumb_func_start ov45_0222E9F8
ov45_0222E9F8: @ 0x0222E9F8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EA28 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA08
	bl GF_AssertFail
_0222EA08:
	blx ov45_02232580
	adds r1, r0, #0
	ldr r0, _0222EA28 @ =0x022577C0
	adds r2, r4, #0
	ldr r0, [r0]
	bl ov45_0222F88C
	ldr r1, _0222EA28 @ =0x022577C0
	adds r0, r4, #0
	ldr r1, [r1]
	movs r2, #0
	ldr r1, [r1, #0x28]
	blx ov45_022325B0
	pop {r4, pc}
	.align 2, 0
_0222EA28: .4byte 0x022577C0
	thumb_func_end ov45_0222E9F8

	thumb_func_start ov45_0222EA2C
ov45_0222EA2C: @ 0x0222EA2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EA48 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA3C
	bl GF_AssertFail
_0222EA3C:
	ldr r0, _0222EA48 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_0222F8D8
	pop {r4, pc}
	.align 2, 0
_0222EA48: .4byte 0x022577C0
	thumb_func_end ov45_0222EA2C

	thumb_func_start ov45_0222EA4C
ov45_0222EA4C: @ 0x0222EA4C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222EA74 @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA5E
	bl GF_AssertFail
_0222EA5E:
	ldr r0, _0222EA74 @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	bl ov45_0222F954
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r4]
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	nop
_0222EA74: .4byte 0x022577C0
	thumb_func_end ov45_0222EA4C

	thumb_func_start ov45_0222EA78
ov45_0222EA78: @ 0x0222EA78
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r0, #0
	mvns r0, r0
	str r0, [sp]
	lsrs r6, r0, #4
	adds r5, r0, #0
	ldr r0, _0222EAD0 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EA92
	bl GF_AssertFail
_0222EA92:
	movs r4, #0
_0222EA94:
	ldr r0, _0222EAD0 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	movs r2, #0
	bl ov45_0222FB5C
	movs r1, #0
	adds r7, r0, #0
	mvns r1, r1
	cmp r7, r1
	beq _0222EAC4
	add r1, sp, #4
	bl ov45_0222EA4C
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	subs r0, r2, r5
	mov ip, r1
	mov r0, ip
	sbcs r0, r6
	bge _0222EAC4
	adds r5, r2, #0
	adds r6, r1, #0
	str r7, [sp]
_0222EAC4:
	adds r4, r4, #1
	cmp r4, #0x14
	blt _0222EA94
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222EAD0: .4byte 0x022577C0
	thumb_func_end ov45_0222EA78

	thumb_func_start ov45_0222EAD4
ov45_0222EAD4: @ 0x0222EAD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	movs r0, #0
	mvns r0, r0
	str r0, [sp, #4]
	lsrs r7, r0, #4
	adds r6, r0, #0
	ldr r0, _0222EB34 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EAF0
	bl GF_AssertFail
_0222EAF0:
	movs r4, #0
_0222EAF2:
	ldr r0, _0222EB34 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	movs r2, #0
	bl ov45_0222FB5C
	movs r1, #0
	adds r5, r0, #0
	mvns r1, r1
	cmp r5, r1
	beq _0222EB28
	ldr r1, [sp]
	cmp r5, r1
	beq _0222EB28
	add r1, sp, #8
	bl ov45_0222EA4C
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	subs r0, r2, r6
	mov ip, r1
	mov r0, ip
	sbcs r0, r7
	bge _0222EB28
	adds r6, r2, #0
	adds r7, r1, #0
	str r5, [sp, #4]
_0222EB28:
	adds r4, r4, #1
	cmp r4, #0x14
	blt _0222EAF2
	ldr r0, [sp, #4]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222EB34: .4byte 0x022577C0
	thumb_func_end ov45_0222EAD4

	thumb_func_start ov45_0222EB38
ov45_0222EB38: @ 0x0222EB38
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EB6C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EB48
	bl GF_AssertFail
_0222EB48:
	adds r0, r4, #0
	bl ov45_0222F7B0
	blx ov45_02231C8C
	bl ov45_0222F74C
	cmp r0, #1
	bne _0222EB6A
	ldr r2, _0222EB6C @ =0x022577C0
	ldr r1, _0222EB70 @ =0x0000012D
	ldr r3, [r2]
	strb r4, [r3, r1]
	ldr r2, [r2]
	movs r3, #0
	adds r1, r1, #2
	strb r3, [r2, r1]
_0222EB6A:
	pop {r4, pc}
	.align 2, 0
_0222EB6C: .4byte 0x022577C0
_0222EB70: .4byte 0x0000012D
	thumb_func_end ov45_0222EB38

	thumb_func_start ov45_0222EB74
ov45_0222EB74: @ 0x0222EB74
	push {r3, lr}
	ldr r0, _0222EB8C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EB82
	bl GF_AssertFail
_0222EB82:
	ldr r0, _0222EB8C @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222EB90 @ =0x0000012F
	ldrb r0, [r1, r0]
	pop {r3, pc}
	.align 2, 0
_0222EB8C: .4byte 0x022577C0
_0222EB90: .4byte 0x0000012F
	thumb_func_end ov45_0222EB74

	thumb_func_start ov45_0222EB94
ov45_0222EB94: @ 0x0222EB94
	push {r3, lr}
	ldr r0, _0222EBBC @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EBA2
	bl GF_AssertFail
_0222EBA2:
	blx ov45_02231EC0
	bl ov45_0222F74C
	cmp r0, #1
	bne _0222EBB8
	ldr r1, _0222EBBC @ =0x022577C0
	movs r3, #3
	ldr r2, [r1]
	ldr r1, _0222EBC0 @ =0x0000012E
	strb r3, [r2, r1]
_0222EBB8:
	pop {r3, pc}
	nop
_0222EBBC: .4byte 0x022577C0
_0222EBC0: .4byte 0x0000012E
	thumb_func_end ov45_0222EB94

	thumb_func_start ov45_0222EBC4
ov45_0222EBC4: @ 0x0222EBC4
	push {r3, lr}
	ldr r0, _0222EBE8 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EBD2
	bl GF_AssertFail
_0222EBD2:
	ldr r0, _0222EBE8 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222EBEC @ =0x0000012E
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222EBE2
	movs r0, #1
	pop {r3, pc}
_0222EBE2:
	movs r0, #0
	pop {r3, pc}
	nop
_0222EBE8: .4byte 0x022577C0
_0222EBEC: .4byte 0x0000012E
	thumb_func_end ov45_0222EBC4

	thumb_func_start ov45_0222EBF0
ov45_0222EBF0: @ 0x0222EBF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EC0C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EC00
	bl GF_AssertFail
_0222EC00:
	ldr r0, _0222EC0C @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_0222FBD8
	pop {r4, pc}
	.align 2, 0
_0222EC0C: .4byte 0x022577C0
	thumb_func_end ov45_0222EBF0

	thumb_func_start ov45_0222EC10
ov45_0222EC10: @ 0x0222EC10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EC38 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EC20
	bl GF_AssertFail
_0222EC20:
	ldr r1, _0222EC38 @ =0x022577C0
	movs r0, #0x47
	ldr r2, [r1]
	lsls r0, r0, #2
	ldrsh r2, [r2, r0]
	adds r0, r0, #4
	str r2, [r4]
	ldr r1, [r1]
	ldr r0, [r1, r0]
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_0222EC38: .4byte 0x022577C0
	thumb_func_end ov45_0222EC10

	thumb_func_start ov45_0222EC3C
ov45_0222EC3C: @ 0x0222EC3C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EC64 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EC4C
	bl GF_AssertFail
_0222EC4C:
	ldr r1, _0222EC64 @ =0x022577C0
	movs r0, #0x49
	ldr r2, [r1]
	lsls r0, r0, #2
	ldrsh r2, [r2, r0]
	adds r0, r0, #4
	str r2, [r4]
	ldr r1, [r1]
	ldr r0, [r1, r0]
	str r0, [r4, #4]
	pop {r4, pc}
	nop
_0222EC64: .4byte 0x022577C0
	thumb_func_end ov45_0222EC3C

	thumb_func_start ov45_0222EC68
ov45_0222EC68: @ 0x0222EC68
	adds r1, r0, #0
	ldr r0, _0222EC74 @ =0x022577C0
	ldr r3, _0222EC78 @ =ov45_0222FB24
	ldr r0, [r0]
	movs r2, #0
	bx r3
	.align 2, 0
_0222EC74: .4byte 0x022577C0
_0222EC78: .4byte ov45_0222FB24
	thumb_func_end ov45_0222EC68

	thumb_func_start ov45_0222EC7C
ov45_0222EC7C: @ 0x0222EC7C
	adds r1, r0, #0
	ldr r0, _0222EC88 @ =0x022577C0
	ldr r3, _0222EC8C @ =ov45_0222FB24
	ldr r0, [r0]
	movs r2, #1
	bx r3
	.align 2, 0
_0222EC88: .4byte 0x022577C0
_0222EC8C: .4byte ov45_0222FB24
	thumb_func_end ov45_0222EC7C

	thumb_func_start ov45_0222EC90
ov45_0222EC90: @ 0x0222EC90
	adds r1, r0, #0
	ldr r0, _0222EC9C @ =0x022577C0
	ldr r3, _0222ECA0 @ =ov45_0222FB5C
	ldr r0, [r0]
	movs r2, #0
	bx r3
	.align 2, 0
_0222EC9C: .4byte 0x022577C0
_0222ECA0: .4byte ov45_0222FB5C
	thumb_func_end ov45_0222EC90

	thumb_func_start ov45_0222ECA4
ov45_0222ECA4: @ 0x0222ECA4
	adds r1, r0, #0
	ldr r0, _0222ECB0 @ =0x022577C0
	ldr r3, _0222ECB4 @ =ov45_0222FB5C
	ldr r0, [r0]
	movs r2, #1
	bx r3
	.align 2, 0
_0222ECB0: .4byte 0x022577C0
_0222ECB4: .4byte ov45_0222FB5C
	thumb_func_end ov45_0222ECA4

	thumb_func_start ov45_0222ECB8
ov45_0222ECB8: @ 0x0222ECB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222ECD8 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222ECC8
	bl GF_AssertFail
_0222ECC8:
	ldr r0, _0222ECD8 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r1, r0
	ldm r0!, {r2, r3}
	stm r4!, {r2, r3}
	pop {r4, pc}
	.align 2, 0
_0222ECD8: .4byte 0x022577C0
	thumb_func_end ov45_0222ECB8

	thumb_func_start ov45_0222ECDC
ov45_0222ECDC: @ 0x0222ECDC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222ED78 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222ECEC
	bl GF_AssertFail
_0222ECEC:
	ldr r1, _0222ED78 @ =0x022577C0
	movs r0, #1
	ldr r2, [r1]
	movs r1, #0x4b
	lsls r1, r1, #2
	ldrb r1, [r2, r1]
	cmp r1, #2
	beq _0222ED02
	cmp r1, #4
	beq _0222ED02
	movs r0, #0
_0222ED02:
	cmp r0, #0
	bne _0222ED0A
	bl GF_AssertFail
_0222ED0A:
	cmp r5, #8
	blt _0222ED12
	bl GF_AssertFail
_0222ED12:
	ldr r0, _0222ED78 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r0, r1, r0
	cmp r5, #7
	bhi _0222ED74
	adds r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_0222ED2C: @ jump table
	.2byte _0222ED3C - _0222ED2C - 2 @ case 0
	.2byte _0222ED40 - _0222ED2C - 2 @ case 1
	.2byte _0222ED44 - _0222ED2C - 2 @ case 2
	.2byte _0222ED48 - _0222ED2C - 2 @ case 3
	.2byte _0222ED4C - _0222ED2C - 2 @ case 4
	.2byte _0222ED58 - _0222ED2C - 2 @ case 5
	.2byte _0222ED62 - _0222ED2C - 2 @ case 6
	.2byte _0222ED6C - _0222ED2C - 2 @ case 7
_0222ED3C:
	ldr r4, [r0]
	b _0222ED74
_0222ED40:
	ldr r4, [r0, #4]
	b _0222ED74
_0222ED44:
	ldrb r4, [r0, #0xc]
	b _0222ED74
_0222ED48:
	ldrb r4, [r0, #0xd]
	b _0222ED74
_0222ED4C:
	ldr r0, [r0, #8]
	movs r4, #1
	tst r0, r4
	bne _0222ED74
	movs r4, #0
	b _0222ED74
_0222ED58:
	movs r1, #0x13
	bl ov45_022303BC
	adds r4, r0, #0
	b _0222ED74
_0222ED62:
	movs r1, #0x10
	bl ov45_022303BC
	adds r4, r0, #0
	b _0222ED74
_0222ED6C:
	movs r1, #0x11
	bl ov45_022303BC
	adds r4, r0, #0
_0222ED74:
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222ED78: .4byte 0x022577C0
	thumb_func_end ov45_0222ECDC

	thumb_func_start ov45_0222ED7C
ov45_0222ED7C: @ 0x0222ED7C
	push {r3, lr}
	ldr r0, _0222EDA4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222ED8A
	bl GF_AssertFail
_0222ED8A:
	ldr r0, _0222EDA4 @ =0x022577C0
	ldr r0, [r0]
	bl ov45_0222F7B4
	cmp r0, #0
	beq _0222EDA2
	ldr r1, _0222EDA4 @ =0x022577C0
	movs r3, #1
	ldr r2, [r1]
	movs r1, #0x13
	lsls r1, r1, #4
	strb r3, [r2, r1]
_0222EDA2:
	pop {r3, pc}
	.align 2, 0
_0222EDA4: .4byte 0x022577C0
	thumb_func_end ov45_0222ED7C

	thumb_func_start ov45_0222EDA8
ov45_0222EDA8: @ 0x0222EDA8
	ldr r0, _0222EDC0 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x13
	lsls r0, r0, #4
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _0222EDBA
	movs r0, #1
	bx lr
_0222EDBA:
	movs r0, #0
	bx lr
	nop
_0222EDC0: .4byte 0x022577C0
	thumb_func_end ov45_0222EDA8

	thumb_func_start ov45_0222EDC4
ov45_0222EDC4: @ 0x0222EDC4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EDEC @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EDD4
	bl GF_AssertFail
_0222EDD4:
	cmp r4, #0x14
	blo _0222EDDC
	bl GF_AssertFail
_0222EDDC:
	ldr r0, _0222EDEC @ =0x022577C0
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r1, r1, r0
	movs r0, #0x4d
	lsls r0, r0, #2
	ldrh r0, [r1, r0]
	pop {r4, pc}
	.align 2, 0
_0222EDEC: .4byte 0x022577C0
	thumb_func_end ov45_0222EDC4

	thumb_func_start ov45_0222EDF0
ov45_0222EDF0: @ 0x0222EDF0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222EE18 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EE00
	bl GF_AssertFail
_0222EE00:
	cmp r4, #0x14
	blo _0222EE08
	bl GF_AssertFail
_0222EE08:
	ldr r0, _0222EE18 @ =0x022577C0
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r1, r1, r0
	ldr r0, _0222EE1C @ =0x00000136
	ldrb r0, [r1, r0]
	pop {r4, pc}
	nop
_0222EE18: .4byte 0x022577C0
_0222EE1C: .4byte 0x00000136
	thumb_func_end ov45_0222EDF0

	thumb_func_start ov45_0222EE20
ov45_0222EE20: @ 0x0222EE20
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222EE4C @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r6, r2, #0
	cmp r0, #0
	bne _0222EE34
	bl GF_AssertFail
_0222EE34:
	ldr r2, _0222EE4C @ =0x022577C0
	movs r1, #0x61
	ldr r0, [r2]
	lsls r1, r1, #2
	str r5, [r0, r1]
	ldr r3, [r2]
	adds r0, r1, #4
	str r4, [r3, r0]
	ldr r0, [r2]
	adds r1, #8
	str r6, [r0, r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222EE4C: .4byte 0x022577C0
	thumb_func_end ov45_0222EE20

	thumb_func_start ov45_0222EE50
ov45_0222EE50: @ 0x0222EE50
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222EE7C @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r6, r2, #0
	cmp r0, #0
	bne _0222EE64
	bl GF_AssertFail
_0222EE64:
	ldr r2, _0222EE7C @ =0x022577C0
	movs r1, #0x19
	ldr r0, [r2]
	lsls r1, r1, #4
	str r5, [r0, r1]
	ldr r3, [r2]
	adds r0, r1, #4
	str r4, [r3, r0]
	ldr r0, [r2]
	adds r1, #8
	str r6, [r0, r1]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222EE7C: .4byte 0x022577C0
	thumb_func_end ov45_0222EE50

	thumb_func_start ov45_0222EE80
ov45_0222EE80: @ 0x0222EE80
	push {r3, lr}
	ldr r0, _0222EEB4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EE8E
	bl GF_AssertFail
_0222EE8E:
	ldr r0, _0222EEB4 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x61
	lsls r0, r0, #2
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	strb r0, [r1, #0xb]
	pop {r3, pc}
	.align 2, 0
_0222EEB4: .4byte 0x022577C0
	thumb_func_end ov45_0222EE80

	thumb_func_start ov45_0222EEB8
ov45_0222EEB8: @ 0x0222EEB8
	push {r3, lr}
	ldr r0, _0222EEEC @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222EEC6
	bl GF_AssertFail
_0222EEC6:
	ldr r0, _0222EEEC @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x19
	lsls r0, r0, #4
	adds r1, r1, r0
	movs r0, #0
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	strb r0, [r1, #4]
	strb r0, [r1, #5]
	strb r0, [r1, #6]
	strb r0, [r1, #7]
	strb r0, [r1, #8]
	strb r0, [r1, #9]
	strb r0, [r1, #0xa]
	strb r0, [r1, #0xb]
	pop {r3, pc}
	.align 2, 0
_0222EEEC: .4byte 0x022577C0
	thumb_func_end ov45_0222EEB8

	thumb_func_start ov45_0222EEF0
ov45_0222EEF0: @ 0x0222EEF0
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222EF48 @ =0x022577C0
	adds r6, r1, #0
	ldr r0, [r0]
	adds r4, r2, #0
	cmp r0, #0
	bne _0222EF04
	bl GF_AssertFail
_0222EF04:
	ldr r0, _0222EF48 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, r5
	bhi _0222EF16
	bl GF_AssertFail
_0222EF16:
	ldr r0, _0222EF48 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	lsls r0, r5, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	cmp r4, r0
	beq _0222EF2E
	bl GF_AssertFail
_0222EF2E:
	movs r0, #0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	blx ov45_0223247C
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222EF46
	bl GF_AssertFail
_0222EF46:
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222EF48: .4byte 0x022577C0
	thumb_func_end ov45_0222EEF0

	thumb_func_start ov45_0222EF4C
ov45_0222EF4C: @ 0x0222EF4C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222EFA8 @ =0x022577C0
	adds r6, r1, #0
	ldr r0, [r0]
	adds r7, r2, #0
	adds r4, r3, #0
	cmp r0, #0
	bne _0222EF62
	bl GF_AssertFail
_0222EF62:
	ldr r0, _0222EFA8 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x62
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, r5
	bhi _0222EF74
	bl GF_AssertFail
_0222EF74:
	ldr r0, _0222EFA8 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x61
	lsls r0, r0, #2
	ldr r1, [r1, r0]
	lsls r0, r5, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	cmp r4, r0
	beq _0222EF8C
	bl GF_AssertFail
_0222EF8C:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r7, #0
	adds r3, r4, #0
	blx ov45_02232500
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222EFA4
	bl GF_AssertFail
_0222EFA4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EFA8: .4byte 0x022577C0
	thumb_func_end ov45_0222EF4C

	thumb_func_start ov45_0222EFAC
ov45_0222EFAC: @ 0x0222EFAC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222F020 @ =0x022577C0
	adds r6, r1, #0
	ldr r0, [r0]
	adds r4, r2, #0
	cmp r0, #0
	bne _0222EFC0
	bl GF_AssertFail
_0222EFC0:
	ldr r0, _0222F020 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x65
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	cmp r0, r5
	bhi _0222EFD2
	bl GF_AssertFail
_0222EFD2:
	ldr r0, _0222F020 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x19
	lsls r0, r0, #4
	ldr r1, [r1, r0]
	lsls r0, r5, #3
	adds r0, r1, r0
	ldr r0, [r0, #4]
	cmp r4, r0
	beq _0222EFEA
	bl GF_AssertFail
_0222EFEA:
	ldr r0, _0222F020 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F024 @ =0x0000012D
	ldrb r0, [r1, r0]
	cmp r0, #4
	bne _0222EFFA
	bl GF_AssertFail
_0222EFFA:
	ldr r0, _0222F020 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F024 @ =0x0000012D
	ldrb r0, [r1, r0]
	bl ov45_0222F7B0
	adds r1, r5, #0
	adds r2, r6, #0
	adds r3, r4, #0
	blx ov45_0223247C
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222F01C
	bl GF_AssertFail
_0222F01C:
	pop {r4, r5, r6, pc}
	nop
_0222F020: .4byte 0x022577C0
_0222F024: .4byte 0x0000012D
	thumb_func_end ov45_0222EFAC

	thumb_func_start ov45_0222F028
ov45_0222F028: @ 0x0222F028
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _0222F138 @ =0x022577C0
	adds r6, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F03A
	bl GF_AssertFail
_0222F03A:
	ldr r0, _0222F138 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #1
	bne _0222F04C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F04C:
	ldr r2, _0222F138 @ =0x022577C0
	ldr r1, _0222F13C @ =0x0000069C
	ldr r0, [r2]
	ldrh r3, [r0, r1]
	cmp r3, #3
	beq _0222F05C
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F05C:
	movs r3, #0x4c
	adds r5, r4, #0
	muls r5, r3, r5
	adds r3, r0, r5
	adds r0, r1, #0
	subs r0, #0xe4
	str r4, [r3, r0]
	ldr r0, [r2]
	movs r7, #1
	adds r3, r0, r5
	adds r0, r1, #0
	subs r0, #0xe0
	str r6, [r3, r0]
	ldr r0, [r2]
	adds r3, r0, r5
	adds r0, r1, #0
	subs r0, #0xdc
	str r7, [r3, r0]
	ldr r0, [r2]
	movs r7, #0
	adds r3, r0, r5
	adds r0, r1, #0
	subs r0, #0xd8
	str r7, [r3, r0]
	ldr r2, [r2]
	subs r1, #0xe4
	adds r0, r2, r1
	movs r1, #0x67
	lsls r1, r1, #2
	adds r0, r0, r5
	adds r1, r2, r1
	bl ov45_02230378
	ldr r0, _0222F138 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F140 @ =0x000005B8
	adds r0, r1, r0
	adds r0, r0, r5
	blx ov45_0223285C
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222F0B8
	bl GF_AssertFail
_0222F0B8:
	ldr r1, _0222F138 @ =0x022577C0
	movs r0, #0x4c
	adds r5, r4, #0
	muls r5, r0, r5
	ldr r1, [r1]
	movs r0, #1
	adds r2, r1, r5
	ldr r1, _0222F144 @ =0x000005FC
	strh r0, [r2, r1]
	blx ov45_02232580
	ldr r1, _0222F138 @ =0x022577C0
	movs r7, #6
	ldr r2, [r1]
	lsls r7, r7, #8
	adds r2, r2, r5
	str r0, [r2, r7]
	ldr r2, [r1]
	ldr r0, _0222F148 @ =0x00000708
	adds r3, r2, r5
	subs r2, r7, #2
	strh r0, [r3, r2]
	adds r2, r0, #0
	ldr r3, [r1]
	subs r2, #0x6c
	strh r4, [r3, r2]
	adds r2, r0, #0
	ldr r3, [r1]
	movs r4, #1
	subs r2, #0x6a
	strb r4, [r3, r2]
	ldr r2, [r1]
	movs r3, #0
	subs r0, #0x69
	strb r3, [r2, r0]
	ldr r4, [r1]
	subs r0, r7, #2
	adds r1, r4, r5
	ldrh r0, [r1, r0]
	movs r1, #0x1e
	blx FUN_020F2998
	adds r3, r0, #0
	adds r0, r7, #0
	subs r0, #0x18
	adds r0, r4, r0
	adds r0, r0, r5
	adds r1, r6, #0
	movs r2, #1
	bl FUN_021E5CEC
	ldr r1, _0222F138 @ =0x022577C0
	ldr r0, _0222F14C @ =ov45_02230390
	ldr r1, [r1]
	bl FUN_021E5CD0
	ldr r1, _0222F138 @ =0x022577C0
	ldr r0, _0222F150 @ =ov45_02230394
	ldr r1, [r1]
	bl FUN_021E5CA0
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F138: .4byte 0x022577C0
_0222F13C: .4byte 0x0000069C
_0222F140: .4byte 0x000005B8
_0222F144: .4byte 0x000005FC
_0222F148: .4byte 0x00000708
_0222F14C: .4byte ov45_02230390
_0222F150: .4byte ov45_02230394
	thumb_func_end ov45_0222F028

	thumb_func_start ov45_0222F154
ov45_0222F154: @ 0x0222F154
	push {r4, lr}
	ldr r0, _0222F1B0 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F162
	bl GF_AssertFail
_0222F162:
	ldr r0, _0222F1B0 @ =0x022577C0
	ldr r2, [r0]
	ldr r0, _0222F1B4 @ =0x0000069C
	ldrh r1, [r2, r0]
	cmp r1, #3
	beq _0222F1AC
	adds r0, r0, #2
	ldrb r0, [r2, r0]
	cmp r0, #0
	beq _0222F1AC
	blx ov45_02232CA4
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222F186
	bl GF_AssertFail
_0222F186:
	ldr r0, _0222F1B0 @ =0x022577C0
	ldr r4, [r0]
	blx ov45_02232580
	ldr r1, _0222F1B4 @ =0x0000069C
	adds r2, r0, #0
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl ov45_022301E0
	cmp r0, #0
	bne _0222F1A2
	bl GF_AssertFail
_0222F1A2:
	ldr r0, _0222F1B0 @ =0x022577C0
	movs r2, #0
	ldr r1, [r0]
	ldr r0, _0222F1B8 @ =0x0000069E
	strb r2, [r1, r0]
_0222F1AC:
	pop {r4, pc}
	nop
_0222F1B0: .4byte 0x022577C0
_0222F1B4: .4byte 0x0000069C
_0222F1B8: .4byte 0x0000069E
	thumb_func_end ov45_0222F154

	thumb_func_start ov45_0222F1BC
ov45_0222F1BC: @ 0x0222F1BC
	push {r4, r5, r6, lr}
	ldr r0, _0222F210 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F1CA
	bl GF_AssertFail
_0222F1CA:
	ldr r4, _0222F210 @ =0x022577C0
	ldr r3, _0222F214 @ =0x0000069E
	ldr r1, [r4]
	ldrb r0, [r1, r3]
	cmp r0, #0
	beq _0222F20C
	subs r2, r3, #2
	ldrh r5, [r1, r2]
	movs r2, #0x4c
	movs r0, #1
	adds r6, r5, #0
	muls r6, r2, r6
	adds r5, r1, r6
	adds r1, r3, #0
	subs r1, #0xda
	str r0, [r5, r1]
	adds r0, r3, #0
	ldr r1, [r4]
	subs r0, #0xe6
	adds r4, r1, r0
	subs r0, r3, #2
	ldrh r0, [r1, r0]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	blx ov45_02232BB0
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222F20C
	bl GF_AssertFail
_0222F20C:
	pop {r4, r5, r6, pc}
	nop
_0222F210: .4byte 0x022577C0
_0222F214: .4byte 0x0000069E
	thumb_func_end ov45_0222F1BC

	thumb_func_start ov45_0222F218
ov45_0222F218: @ 0x0222F218
	push {r3, lr}
	ldr r0, _0222F24C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F226
	bl GF_AssertFail
_0222F226:
	ldr r0, _0222F24C @ =0x022577C0
	ldr r1, _0222F250 @ =0x0000069C
	ldr r3, [r0]
	ldrh r2, [r3, r1]
	cmp r2, #3
	bne _0222F236
	movs r0, #0
	pop {r3, pc}
_0222F236:
	movs r0, #0x4c
	muls r0, r2, r0
	adds r0, r3, r0
	subs r1, #0xd8
	ldr r0, [r0, r1]
	cmp r0, #1
	bne _0222F248
	movs r0, #1
	pop {r3, pc}
_0222F248:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_0222F24C: .4byte 0x022577C0
_0222F250: .4byte 0x0000069C
	thumb_func_end ov45_0222F218

	thumb_func_start ov45_0222F254
ov45_0222F254: @ 0x0222F254
	push {r3, lr}
	ldr r0, _0222F26C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F262
	bl GF_AssertFail
_0222F262:
	ldr r0, _0222F26C @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F270 @ =0x0000069F
	ldrb r0, [r1, r0]
	pop {r3, pc}
	.align 2, 0
_0222F26C: .4byte 0x022577C0
_0222F270: .4byte 0x0000069F
	thumb_func_end ov45_0222F254

	thumb_func_start ov45_0222F274
ov45_0222F274: @ 0x0222F274
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F290 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F284
	bl GF_AssertFail
_0222F284:
	ldr r0, _0222F290 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	pop {r4, pc}
	.align 2, 0
_0222F290: .4byte 0x022577C0
	thumb_func_end ov45_0222F274

	thumb_func_start ov45_0222F294
ov45_0222F294: @ 0x0222F294
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F2CC @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F2A4
	bl GF_AssertFail
_0222F2A4:
	adds r0, r4, #0
	bl ov45_0222F274
	cmp r0, #0
	bne _0222F2B2
	movs r0, #0
	pop {r4, pc}
_0222F2B2:
	ldr r0, _0222F2CC @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x4c
	muls r0, r4, r0
	adds r1, r1, r0
	ldr r0, _0222F2D0 @ =0x000005C4
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0222F2C8
	movs r0, #1
	pop {r4, pc}
_0222F2C8:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222F2CC: .4byte 0x022577C0
_0222F2D0: .4byte 0x000005C4
	thumb_func_end ov45_0222F294

	thumb_func_start ov45_0222F2D4
ov45_0222F2D4: @ 0x0222F2D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F310 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F2E4
	bl GF_AssertFail
_0222F2E4:
	cmp r4, #3
	blt _0222F2EC
	bl GF_AssertFail
_0222F2EC:
	ldr r0, _0222F310 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F2FE
	movs r0, #0
	pop {r4, pc}
_0222F2FE:
	ldr r0, _0222F310 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_022302B0
	ldr r1, [r0, #4]
	ldr r0, [r0, #8]
	subs r0, r1, r0
	pop {r4, pc}
	.align 2, 0
_0222F310: .4byte 0x022577C0
	thumb_func_end ov45_0222F2D4

	thumb_func_start ov45_0222F314
ov45_0222F314: @ 0x0222F314
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F34C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F324
	bl GF_AssertFail
_0222F324:
	cmp r4, #3
	blt _0222F32C
	bl GF_AssertFail
_0222F32C:
	ldr r0, _0222F34C @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F33E
	movs r0, #0
	pop {r4, pc}
_0222F33E:
	ldr r0, _0222F34C @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_022302B0
	ldr r0, [r0, #8]
	pop {r4, pc}
	.align 2, 0
_0222F34C: .4byte 0x022577C0
	thumb_func_end ov45_0222F314

	thumb_func_start ov45_0222F350
ov45_0222F350: @ 0x0222F350
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0222F3D4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F360
	bl GF_AssertFail
_0222F360:
	ldr r0, _0222F3D4 @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F372
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222F372:
	ldr r3, _0222F3D4 @ =0x022577C0
	ldr r2, _0222F3D8 @ =0x0000069C
	ldr r0, [r3]
	ldrh r1, [r0, r2]
	cmp r1, #3
	beq _0222F382
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222F382:
	movs r1, #0x4c
	adds r4, r5, #0
	muls r4, r1, r4
	adds r1, r2, #0
	adds r6, r0, r4
	subs r1, #0xd8
	ldr r1, [r6, r1]
	cmp r1, #1
	bne _0222F398
	movs r0, #0
	pop {r4, r5, r6, pc}
_0222F398:
	strh r5, [r0, r2]
	ldr r5, [r3]
	subs r2, #0x9e
	adds r0, r5, r4
	ldrh r0, [r0, r2]
	movs r1, #0x1e
	blx FUN_020F2998
	ldr r1, _0222F3DC @ =0x000005E8
	adds r3, r0, #0
	adds r0, r5, r1
	adds r2, r5, r4
	subs r1, #0x2c
	ldr r1, [r2, r1]
	adds r0, r0, r4
	movs r2, #0
	bl FUN_021E5CEC
	ldr r1, _0222F3D4 @ =0x022577C0
	ldr r0, _0222F3E0 @ =ov45_02230390
	ldr r1, [r1]
	bl FUN_021E5CD0
	ldr r1, _0222F3D4 @ =0x022577C0
	ldr r0, _0222F3E4 @ =ov45_02230394
	ldr r1, [r1]
	bl FUN_021E5CA0
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222F3D4: .4byte 0x022577C0
_0222F3D8: .4byte 0x0000069C
_0222F3DC: .4byte 0x000005E8
_0222F3E0: .4byte ov45_02230390
_0222F3E4: .4byte ov45_02230394
	thumb_func_end ov45_0222F350

	thumb_func_start ov45_0222F3E8
ov45_0222F3E8: @ 0x0222F3E8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F424 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F3F8
	bl GF_AssertFail
_0222F3F8:
	cmp r4, #3
	blt _0222F400
	bl GF_AssertFail
_0222F400:
	ldr r0, _0222F424 @ =0x022577C0
	adds r1, r4, #0
	ldr r0, [r0]
	bl ov45_0223021C
	cmp r0, #0
	bne _0222F412
	ldr r0, _0222F428 @ =0x00000708
	pop {r4, pc}
_0222F412:
	ldr r0, _0222F424 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x4c
	muls r0, r4, r0
	adds r1, r1, r0
	ldr r0, _0222F42C @ =0x000005FE
	ldrh r0, [r1, r0]
	pop {r4, pc}
	nop
_0222F424: .4byte 0x022577C0
_0222F428: .4byte 0x00000708
_0222F42C: .4byte 0x000005FE
	thumb_func_end ov45_0222F3E8

	thumb_func_start ov45_0222F430
ov45_0222F430: @ 0x0222F430
	push {r3, lr}
	ldr r0, _0222F45C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F43E
	bl GF_AssertFail
_0222F43E:
	ldr r0, _0222F45C @ =0x022577C0
	ldr r1, _0222F460 @ =0x0000069C
	ldr r3, [r0]
	ldrh r2, [r3, r1]
	cmp r2, #3
	bne _0222F450
	movs r0, #0
	mvns r0, r0
	pop {r3, pc}
_0222F450:
	movs r0, #0x4c
	muls r0, r2, r0
	adds r0, r3, r0
	subs r1, #0x9c
	ldr r0, [r0, r1]
	pop {r3, pc}
	.align 2, 0
_0222F45C: .4byte 0x022577C0
_0222F460: .4byte 0x0000069C
	thumb_func_end ov45_0222F430

	thumb_func_start ov45_0222F464
ov45_0222F464: @ 0x0222F464
	push {r3, lr}
	ldr r0, _0222F47C @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F472
	bl GF_AssertFail
_0222F472:
	ldr r0, _0222F47C @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F480 @ =0x0000069E
	ldrb r0, [r1, r0]
	pop {r3, pc}
	.align 2, 0
_0222F47C: .4byte 0x022577C0
_0222F480: .4byte 0x0000069E
	thumb_func_end ov45_0222F464

	thumb_func_start ov45_0222F484
ov45_0222F484: @ 0x0222F484
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F4A8 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F494
	bl GF_AssertFail
_0222F494:
	ldr r0, _0222F4A8 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x6a
	lsls r0, r0, #4
	adds r0, r1, r0
	adds r1, r4, #0
	bl ov45_02230434
	pop {r4, pc}
	nop
_0222F4A8: .4byte 0x022577C0
	thumb_func_end ov45_0222F484

	thumb_func_start ov45_0222F4AC
ov45_0222F4AC: @ 0x0222F4AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F4D0 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F4BC
	bl GF_AssertFail
_0222F4BC:
	ldr r0, _0222F4D0 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x6a
	lsls r0, r0, #4
	adds r0, r1, r0
	adds r1, r4, #0
	bl ov45_0223045C
	pop {r4, pc}
	nop
_0222F4D0: .4byte 0x022577C0
	thumb_func_end ov45_0222F4AC

	thumb_func_start ov45_0222F4D4
ov45_0222F4D4: @ 0x0222F4D4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F520 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F4E4
	bl GF_AssertFail
_0222F4E4:
	cmp r4, #3
	blt _0222F4EC
	bl GF_AssertFail
_0222F4EC:
	ldr r0, _0222F520 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x26
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _0222F4FE
	bl GF_AssertFail
_0222F4FE:
	adds r0, r4, #0
	blx ov45_02232E60
	bl ov45_0222F74C
	cmp r0, #1
	beq _0222F510
	bl GF_AssertFail
_0222F510:
	ldr r0, _0222F520 @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	movs r0, #0x26
	lsls r0, r0, #6
	str r2, [r1, r0]
	pop {r4, pc}
	nop
_0222F520: .4byte 0x022577C0
	thumb_func_end ov45_0222F4D4

	thumb_func_start ov45_0222F524
ov45_0222F524: @ 0x0222F524
	push {r3, lr}
	ldr r0, _0222F540 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F532
	bl GF_AssertFail
_0222F532:
	ldr r0, _0222F540 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x26
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	pop {r3, pc}
	nop
_0222F540: .4byte 0x022577C0
	thumb_func_end ov45_0222F524

	thumb_func_start ov45_0222F544
ov45_0222F544: @ 0x0222F544
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F608 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F554
	bl GF_AssertFail
_0222F554:
	cmp r4, #0xb
	blt _0222F55C
	bl GF_AssertFail
_0222F55C:
	cmp r4, #0xa
	bhi _0222F5FE
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222F56C: @ jump table
	.2byte _0222F582 - _0222F56C - 2 @ case 0
	.2byte _0222F58C - _0222F56C - 2 @ case 1
	.2byte _0222F596 - _0222F56C - 2 @ case 2
	.2byte _0222F5A0 - _0222F56C - 2 @ case 3
	.2byte _0222F5B8 - _0222F56C - 2 @ case 4
	.2byte _0222F5C2 - _0222F56C - 2 @ case 5
	.2byte _0222F5CC - _0222F56C - 2 @ case 6
	.2byte _0222F5D6 - _0222F56C - 2 @ case 7
	.2byte _0222F5EE - _0222F56C - 2 @ case 8
	.2byte _0222F5EE - _0222F56C - 2 @ case 9
	.2byte _0222F5EE - _0222F56C - 2 @ case 10
_0222F582:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F60C @ =0x000006A8
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F58C:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F610 @ =0x000006AC
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F596:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F614 @ =0x00000804
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5A0:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F610 @ =0x000006AC
	ldr r1, [r1, r0]
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r1, r0
	blt _0222F5B4
	movs r0, #1
	pop {r4, pc}
_0222F5B4:
	movs r0, #0
	pop {r4, pc}
_0222F5B8:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F618 @ =0x00000808
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5C2:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F61C @ =0x0000080C
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5CC:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F620 @ =0x00000964
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5D6:
	ldr r0, _0222F608 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F61C @ =0x0000080C
	ldr r1, [r1, r0]
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r1, r0
	blt _0222F5EA
	movs r0, #1
	pop {r4, pc}
_0222F5EA:
	movs r0, #0
	pop {r4, pc}
_0222F5EE:
	ldr r0, _0222F608 @ =0x022577C0
	subs r4, #8
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r1, r1, r0
	ldr r0, _0222F624 @ =0x00000974
	ldr r0, [r1, r0]
	pop {r4, pc}
_0222F5FE:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
	nop
_0222F608: .4byte 0x022577C0
_0222F60C: .4byte 0x000006A8
_0222F610: .4byte 0x000006AC
_0222F614: .4byte 0x00000804
_0222F618: .4byte 0x00000808
_0222F61C: .4byte 0x0000080C
_0222F620: .4byte 0x00000964
_0222F624: .4byte 0x00000974
	thumb_func_end ov45_0222F544

	thumb_func_start ov45_0222F628
ov45_0222F628: @ 0x0222F628
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0222F6A4 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F638
	bl GF_AssertFail
_0222F638:
	cmp r4, #8
	blt _0222F640
	bl GF_AssertFail
_0222F640:
	cmp r4, #7
	bhi _0222F69C
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222F650: @ jump table
	.2byte _0222F660 - _0222F650 - 2 @ case 0
	.2byte _0222F66C - _0222F650 - 2 @ case 1
	.2byte _0222F66C - _0222F650 - 2 @ case 2
	.2byte _0222F66C - _0222F650 - 2 @ case 3
	.2byte _0222F67E - _0222F650 - 2 @ case 4
	.2byte _0222F68A - _0222F650 - 2 @ case 5
	.2byte _0222F68A - _0222F650 - 2 @ case 6
	.2byte _0222F68A - _0222F650 - 2 @ case 7
_0222F660:
	ldr r0, _0222F6A4 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x6b
	lsls r0, r0, #4
	adds r0, r1, r0
	pop {r4, pc}
_0222F66C:
	ldr r0, _0222F6A4 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F6A8 @ =0x0000078C
	adds r2, r1, r0
	subs r1, r4, #1
	movs r0, #0x24
	muls r0, r1, r0
	adds r0, r2, r0
	pop {r4, pc}
_0222F67E:
	ldr r0, _0222F6A4 @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #4
	adds r0, r1, r0
	pop {r4, pc}
_0222F68A:
	ldr r0, _0222F6A4 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0222F6AC @ =0x000008EC
	adds r2, r1, r0
	subs r1, r4, #5
	movs r0, #0x24
	muls r0, r1, r0
	adds r0, r2, r0
	pop {r4, pc}
_0222F69C:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_0222F6A4: .4byte 0x022577C0
_0222F6A8: .4byte 0x0000078C
_0222F6AC: .4byte 0x000008EC
	thumb_func_end ov45_0222F628

	thumb_func_start ov45_0222F6B0
ov45_0222F6B0: @ 0x0222F6B0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222F700 @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F6C2
	bl GF_AssertFail
_0222F6C2:
	cmp r5, #2
	blt _0222F6CA
	bl GF_AssertFail
_0222F6CA:
	cmp r4, #0xc
	blo _0222F6D2
	bl GF_AssertFail
_0222F6D2:
	cmp r5, #2
	blt _0222F6DA
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222F6DA:
	cmp r4, #0xc
	blo _0222F6E2
	movs r0, #0
	pop {r3, r4, r5, pc}
_0222F6E2:
	cmp r5, #0
	bne _0222F6F2
	ldr r0, _0222F700 @ =0x022577C0
	ldr r0, [r0]
	adds r1, r0, r4
	ldr r0, _0222F704 @ =0x000007F8
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
_0222F6F2:
	ldr r0, _0222F700 @ =0x022577C0
	ldr r0, [r0]
	adds r1, r0, r4
	ldr r0, _0222F708 @ =0x00000958
	ldrb r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_0222F700: .4byte 0x022577C0
_0222F704: .4byte 0x000007F8
_0222F708: .4byte 0x00000958
	thumb_func_end ov45_0222F6B0

	thumb_func_start ov45_0222F70C
ov45_0222F70C: @ 0x0222F70C
	push {r4, lr}
	ldr r0, _0222F744 @ =0x022577C0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222F71A
	bl GF_AssertFail
_0222F71A:
	movs r0, #0
	adds r1, r0, #0
	bl FUN_021E5CD0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_021E5CA0
	ldr r2, _0222F744 @ =0x022577C0
	ldr r0, _0222F748 @ =0x0000069C
	ldr r1, [r2]
	movs r3, #3
	strh r3, [r1, r0]
	adds r1, r0, #2
	ldr r3, [r2]
	movs r4, #0
	strb r4, [r3, r1]
	ldr r1, [r2]
	adds r0, r0, #3
	strb r4, [r1, r0]
	pop {r4, pc}
	.align 2, 0
_0222F744: .4byte 0x022577C0
_0222F748: .4byte 0x0000069C
	thumb_func_end ov45_0222F70C

	thumb_func_start ov45_0222F74C
ov45_0222F74C: @ 0x0222F74C
	push {r3, lr}
	movs r1, #1
	cmp r0, #7
	bhi _0222F780
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222F760: @ jump table
	.2byte _0222F786 - _0222F760 - 2 @ case 0
	.2byte _0222F770 - _0222F760 - 2 @ case 1
	.2byte _0222F770 - _0222F760 - 2 @ case 2
	.2byte _0222F774 - _0222F760 - 2 @ case 3
	.2byte _0222F770 - _0222F760 - 2 @ case 4
	.2byte _0222F770 - _0222F760 - 2 @ case 5
	.2byte _0222F774 - _0222F760 - 2 @ case 6
	.2byte _0222F77C - _0222F760 - 2 @ case 7
_0222F770:
	movs r1, #0
	b _0222F786
_0222F774:
	bl GF_AssertFail
	movs r1, #0
	b _0222F786
_0222F77C:
	movs r1, #0
	b _0222F786
_0222F780:
	bl GF_AssertFail
	movs r1, #0
_0222F786:
	adds r0, r1, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222F74C

	thumb_func_start ov45_0222F78C
ov45_0222F78C: @ 0x0222F78C
	ldr r1, _0222F7A0 @ =0x022577C0
	ldr r0, _0222F7A4 @ =0x00000133
	ldr r2, [r1]
	movs r3, #0
	strb r3, [r2, r0]
	ldr r1, [r1]
	subs r0, r0, #1
	strb r3, [r1, r0]
	bx lr
	nop
_0222F7A0: .4byte 0x022577C0
_0222F7A4: .4byte 0x00000133
	thumb_func_end ov45_0222F78C

	thumb_func_start ov45_0222F7A8
ov45_0222F7A8: @ 0x0222F7A8
	subs r0, r0, #1
	bpl _0222F7AE
	movs r0, #4
_0222F7AE:
	bx lr
	thumb_func_end ov45_0222F7A8

	thumb_func_start ov45_0222F7B0
ov45_0222F7B0: @ 0x0222F7B0
	adds r0, r0, #1
	bx lr
	thumb_func_end ov45_0222F7B0

	thumb_func_start ov45_0222F7B4
ov45_0222F7B4: @ 0x0222F7B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	ldr r0, [r0, #8]
	bl FUN_0202CA8C
	adds r4, r0, #0
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl FUN_0202CA90
	cmp r4, #0
	bne _0222F7D4
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F7D4:
	ldr r7, _0222F840 @ =0x00000136
	ldr r2, [sp, #4]
	movs r1, #0
	subs r3, r7, #2
	adds r5, r7, #1
_0222F7DE:
	ldrb r6, [r2, r5]
	cmp r6, #0
	beq _0222F7FE
	ldrh r6, [r2, r3]
	cmp r4, r6
	bne _0222F7F6
	ldrb r6, [r2, r7]
	cmp r0, r6
	bne _0222F7F6
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F7F6:
	adds r1, r1, #1
	adds r2, r2, #4
	cmp r1, #0x14
	blt _0222F7DE
_0222F7FE:
	cmp r1, #0x14
	blt _0222F80C
	bl GF_AssertFail
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222F80C:
	lsls r2, r1, #2
	ldr r1, [sp, #4]
	movs r3, #0x4d
	adds r2, r1, r2
	lsls r3, r3, #2
	strh r4, [r2, r3]
	adds r1, r3, #2
	strb r0, [r2, r1]
	movs r1, #1
	adds r0, r3, #3
	strb r1, [r2, r0]
	movs r0, #0x50
	str r0, [sp]
	ldr r2, _0222F844 @ =0x02254EF0
	ldr r4, [sp, #4]
	ldr r2, [r2]
	subs r0, #0x51
	movs r1, #0
	adds r3, r4, r3
	blx ov45_022322A4
	bl ov45_0222F74C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F840: .4byte 0x00000136
_0222F844: .4byte 0x02254EF0
	thumb_func_end ov45_0222F7B4

	thumb_func_start ov45_0222F848
ov45_0222F848: @ 0x0222F848
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r0, #0x14
	adds r4, r5, #0
	muls r4, r0, r4
	adds r0, r2, #0
	adds r1, r4, #0
	bl FUN_0201AA8C
	ldr r1, _0222F874 @ =0x022577C0
	ldr r2, [r1]
	str r0, [r2, #0x24]
	ldr r0, [r1]
	movs r1, #0
	ldr r0, [r0, #0x24]
	adds r2, r4, #0
	blx FUN_020E5B44
	ldr r0, _0222F874 @ =0x022577C0
	ldr r0, [r0]
	str r5, [r0, #0x28]
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222F874: .4byte 0x022577C0
	thumb_func_end ov45_0222F848

	thumb_func_start ov45_0222F878
ov45_0222F878: @ 0x0222F878
	ldr r0, _0222F884 @ =0x022577C0
	ldr r3, _0222F888 @ =FUN_0201AB0C
	ldr r0, [r0]
	ldr r0, [r0, #0x24]
	bx r3
	nop
_0222F884: .4byte 0x022577C0
_0222F888: .4byte FUN_0201AB0C
	thumb_func_end ov45_0222F878

	thumb_func_start ov45_0222F88C
ov45_0222F88C: @ 0x0222F88C
	push {r3, lr}
	ldr r3, [r0, #0x28]
	bl ov45_0222F898
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov45_0222F88C

	thumb_func_start ov45_0222F898
ov45_0222F898: @ 0x0222F898
	push {r3, r4, r5, r6, r7, lr}
	str r2, [sp]
	movs r2, #0
	adds r4, r0, #0
	adds r6, r3, #0
	bl ov45_0222FB24
	adds r7, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r7, r0
	bne _0222F8B4
	bl GF_AssertFail
_0222F8B4:
	ldr r2, [r4, #0x28]
	ldr r5, [r4, #0x24]
	adds r4, r2, #0
	muls r4, r7, r4
	cmp r2, r6
	bls _0222F8CA
	adds r0, r5, r4
	movs r1, #0
	blx FUN_020E5B44
	b _0222F8CC
_0222F8CA:
	adds r6, r2, #0
_0222F8CC:
	ldr r1, [sp]
	adds r0, r5, r4
	adds r2, r6, #0
	blx FUN_020E5AD8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222F898

	thumb_func_start ov45_0222F8D8
ov45_0222F8D8: @ 0x0222F8D8
	push {r3, r4, r5, lr}
	movs r2, #0
	adds r5, r0, #0
	bl ov45_0222FB24
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222F8F0
	bl GF_AssertFail
_0222F8F0:
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x24]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r2, r1
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222F8D8

	thumb_func_start ov45_0222F8FC
ov45_0222F8FC: @ 0x0222F8FC
	push {r3, r4, r5, lr}
	movs r2, #0
	adds r5, r0, #0
	bl ov45_0222FB24
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222F914
	bl GF_AssertFail
_0222F914:
	ldr r2, [r5, #0x28]
	ldr r1, [r5, #0x24]
	adds r0, r2, #0
	muls r0, r4, r0
	adds r0, r1, r0
	movs r1, #0
	blx FUN_020E5B44
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222F8FC

	thumb_func_start ov45_0222F928
ov45_0222F928: @ 0x0222F928
	push {r4, r5, r6, lr}
	adds r4, r2, #0
	movs r2, #0
	adds r5, r0, #0
	bl ov45_0222FB24
	adds r6, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r6, r0
	bne _0222F942
	bl GF_AssertFail
_0222F942:
	movs r0, #0xc
	muls r0, r6, r0
	adds r2, r5, r0
	ldm r4!, {r0, r1}
	adds r2, #0x2c
	stm r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0222F928

	thumb_func_start ov45_0222F954
ov45_0222F954: @ 0x0222F954
	push {r3, r4, r5, lr}
	movs r2, #0
	adds r5, r0, #0
	bl ov45_0222FB24
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222F96C
	bl GF_AssertFail
_0222F96C:
	movs r0, #0xc
	adds r5, #0x2c
	muls r0, r4, r0
	adds r0, r5, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222F954

	thumb_func_start ov45_0222F978
ov45_0222F978: @ 0x0222F978
	push {r3, r4, r5, lr}
	movs r2, #0
	adds r5, r0, #0
	bl ov45_0222FB24
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _0222F990
	bl GF_AssertFail
_0222F990:
	movs r0, #0xc
	adds r1, r4, #0
	muls r1, r0, r1
	adds r5, #0x2c
	movs r0, #0
	adds r2, r5, r1
	strb r0, [r5, r1]
	strb r0, [r2, #1]
	strb r0, [r2, #2]
	strb r0, [r2, #3]
	strb r0, [r2, #4]
	strb r0, [r2, #5]
	strb r0, [r2, #6]
	strb r0, [r2, #7]
	strb r0, [r2, #8]
	strb r0, [r2, #9]
	strb r0, [r2, #0xa]
	strb r0, [r2, #0xb]
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0222F978

	thumb_func_start ov45_0222F9B8
ov45_0222F9B8: @ 0x0222F9B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	movs r4, #0
	adds r5, r7, #0
_0222F9C8:
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0222F9D6
	bl GF_AssertFail
_0222F9D6:
	cmp r4, #0
	bne _0222F9DE
	ldr r6, [sp]
	b _0222F9E0
_0222F9DE:
	ldr r6, [sp, #4]
_0222F9E0:
	movs r0, #0x47
	movs r1, #0
	lsls r0, r0, #2
	strh r1, [r5, r0]
	ldr r0, [sp, #8]
	lsls r1, r6, #2
	bl FUN_0201AA8C
	movs r1, #0x12
	lsls r1, r1, #4
	str r0, [r5, r1]
	subs r0, r1, #2
	strh r6, [r5, r0]
	adds r0, r7, #0
	adds r1, r4, #0
	bl ov45_0222FA40
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #2
	blt _0222F9C8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov45_0222F9B8

	thumb_func_start ov45_0222FA10
ov45_0222FA10: @ 0x0222FA10
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r7, #0x12
	adds r5, r0, #0
	adds r6, r4, #0
	lsls r7, r7, #4
_0222FA1C:
	ldr r0, [r5, r7]
	cmp r0, #0
	bne _0222FA26
	bl GF_AssertFail
_0222FA26:
	movs r0, #0x12
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	bl FUN_0201AB0C
	movs r0, #0x12
	lsls r0, r0, #4
	str r6, [r5, r0]
	adds r4, r4, #1
	adds r5, #8
	cmp r4, #2
	blt _0222FA1C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov45_0222FA10

	thumb_func_start ov45_0222FA40
ov45_0222FA40: @ 0x0222FA40
	push {r3, r4, r5, r6}
	lsls r2, r1, #3
	adds r0, r0, r2
	movs r2, #0x47
	movs r1, #0
	lsls r2, r2, #2
	strh r1, [r0, r2]
	adds r2, r2, #2
	ldrh r2, [r0, r2]
	cmp r2, #0
	ble _0222FA6E
	movs r2, #0x12
	lsls r2, r2, #4
	adds r6, r1, #0
	subs r5, r1, #1
	subs r3, r2, #2
_0222FA60:
	ldr r4, [r0, r2]
	adds r1, r1, #1
	str r5, [r4, r6]
	ldrh r4, [r0, r3]
	adds r6, r6, #4
	cmp r1, r4
	blt _0222FA60
_0222FA6E:
	pop {r3, r4, r5, r6}
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222FA40

	thumb_func_start ov45_0222FA74
ov45_0222FA74: @ 0x0222FA74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r7, r0, #0
	str r1, [sp]
	adds r4, r2, #0
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _0222FAF0
	ldr r0, _0222FAF4 @ =0x0000011E
	lsls r4, r4, #3
	adds r5, r7, r0
	subs r0, r0, #2
	adds r1, r7, r0
	adds r0, r1, r4
	str r0, [sp, #4]
	ldrsh r1, [r1, r4]
	ldrh r0, [r5, r4]
	cmp r1, r0
	blt _0222FAA4
	bl GF_AssertFail
_0222FAA4:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrh r2, [r5, r4]
	ldrsh r1, [r1, r0]
	cmp r1, r2
	bge _0222FAF0
	cmp r2, #0
	ble _0222FAD4
	movs r1, #0x12
	adds r2, r7, r4
	lsls r1, r1, #4
	ldr r1, [r2, r1]
	ldr r3, _0222FAF4 @ =0x0000011E
	subs r5, r0, #1
_0222FAC0:
	ldr r6, [r1]
	cmp r6, r5
	bne _0222FACA
	str r0, [sp, #8]
	b _0222FAD4
_0222FACA:
	ldrh r6, [r2, r3]
	adds r0, r0, #1
	adds r1, r1, #4
	cmp r0, r6
	blt _0222FAC0
_0222FAD4:
	movs r0, #0x12
	adds r1, r7, r4
	lsls r0, r0, #4
	ldr r2, [r1, r0]
	ldr r0, [sp, #8]
	lsls r1, r0, #2
	ldr r0, [sp]
	str r0, [r2, r1]
	ldr r0, [sp, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	adds r1, r0, #1
	ldr r0, [sp, #4]
	strh r1, [r0]
_0222FAF0:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0222FAF4: .4byte 0x0000011E
	thumb_func_end ov45_0222FA74

	thumb_func_start ov45_0222FAF8
ov45_0222FAF8: @ 0x0222FAF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222FB22
	lsls r2, r4, #3
	movs r3, #0x12
	adds r4, r5, r2
	lsls r3, r3, #4
	ldr r4, [r4, r3]
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, r3, #4
	adds r1, r5, r0
	ldrsh r0, [r1, r2]
	subs r0, r0, #1
	strh r0, [r1, r2]
_0222FB22:
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_0222FAF8

	thumb_func_start ov45_0222FB24
ov45_0222FB24: @ 0x0222FB24
	push {r4, r5}
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r2, _0222FB58 @ =0x0000011E
	movs r3, #0
	ldrh r4, [r0, r2]
	cmp r4, #0
	ble _0222FB50
	adds r2, r2, #2
	ldr r5, [r0, r2]
	ldr r2, _0222FB58 @ =0x0000011E
_0222FB3A:
	ldr r4, [r5]
	cmp r1, r4
	bne _0222FB46
	adds r0, r3, #0
	pop {r4, r5}
	bx lr
_0222FB46:
	ldrh r4, [r0, r2]
	adds r3, r3, #1
	adds r5, r5, #4
	cmp r3, r4
	blt _0222FB3A
_0222FB50:
	movs r0, #0
	mvns r0, r0
	pop {r4, r5}
	bx lr
	.align 2, 0
_0222FB58: .4byte 0x0000011E
	thumb_func_end ov45_0222FB24

	thumb_func_start ov45_0222FB5C
ov45_0222FB5C: @ 0x0222FB5C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	lsls r6, r2, #3
	adds r4, r1, #0
	ldr r0, _0222FB80 @ =0x0000011E
	adds r1, r5, r6
	ldrh r0, [r1, r0]
	cmp r4, r0
	blt _0222FB72
	bl GF_AssertFail
_0222FB72:
	movs r0, #0x12
	adds r1, r5, r6
	lsls r0, r0, #4
	ldr r1, [r1, r0]
	lsls r0, r4, #2
	ldr r0, [r1, r0]
	pop {r4, r5, r6, pc}
	.align 2, 0
_0222FB80: .4byte 0x0000011E
	thumb_func_end ov45_0222FB5C

	thumb_func_start ov45_0222FB84
ov45_0222FB84: @ 0x0222FB84
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r0, r1, #0
	bl ov45_0222F7B0
	adds r7, r0, #0
	adds r0, r5, #0
	movs r1, #1
	bl ov45_0222FA40
	ldr r0, _0222FBD4 @ =0x0000011E
	movs r4, #0
	ldrh r0, [r5, r0]
	cmp r0, #0
	ble _0222FBD2
	adds r6, r5, #0
_0222FBA4:
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov45_0222FB5C
	adds r1, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	beq _0222FBC6
	ldr r0, [r6, #0x34]
	cmp r7, r0
	bne _0222FBC6
	adds r0, r5, #0
	movs r2, #1
	bl ov45_0222FA74
_0222FBC6:
	ldr r0, _0222FBD4 @ =0x0000011E
	adds r4, r4, #1
	ldrh r0, [r5, r0]
	adds r6, #0xc
	cmp r4, r0
	blt _0222FBA4
_0222FBD2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222FBD4: .4byte 0x0000011E
	thumb_func_end ov45_0222FB84

	thumb_func_start ov45_0222FBD8
ov45_0222FBD8: @ 0x0222FBD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	str r1, [sp]
	cmp r1, #4
	blt _0222FBE8
	bl GF_AssertFail
_0222FBE8:
	ldr r0, [sp]
	bl ov45_0222F7B0
	str r0, [sp, #4]
	ldr r0, _0222FC3C @ =0x0000011E
	movs r7, #0
	ldrh r0, [r6, r0]
	adds r4, r7, #0
	cmp r0, #0
	ble _0222FC26
	adds r5, r6, #0
_0222FBFE:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl ov45_0222FB5C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222FC1A
	ldr r1, [r5, #0x34]
	ldr r0, [sp, #4]
	cmp r0, r1
	bne _0222FC1A
	adds r7, r7, #1
_0222FC1A:
	ldr r0, _0222FC3C @ =0x0000011E
	adds r4, r4, #1
	ldrh r0, [r6, r0]
	adds r5, #0xc
	cmp r4, r0
	blt _0222FBFE
_0222FC26:
	ldr r1, _0222FC40 @ =0x02254C30
	ldr r0, [sp]
	ldrb r0, [r1, r0]
	cmp r0, r7
	ble _0222FC36
	add sp, #8
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222FC36:
	movs r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222FC3C: .4byte 0x0000011E
_0222FC40: .4byte 0x02254C30
	thumb_func_end ov45_0222FBD8

	thumb_func_start ov45_0222FC44
ov45_0222FC44: @ 0x0222FC44
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	cmp r1, #0
	bne _0222FC84
	ldr r0, _0222FCD0 @ =0x022577C0
	movs r3, #1
	ldr r2, [r0]
	ldr r1, _0222FCD4 @ =0x000005B4
	lsls r3, r3, #0xa
	str r3, [r2, r1]
	ldr r2, [r0]
	movs r0, #0x6d
	lsls r0, r0, #2
	adds r0, r2, r0
	adds r1, r2, r1
	blx ov45_02232170
	bl ov45_0222F74C
	cmp r0, #0
	bne _0222FC72
	bl GF_AssertFail
_0222FC72:
	ldr r2, _0222FCD8 @ =0x02254EF0
	movs r0, #0
	movs r1, #0
	ldr r2, [r2]
	mvns r0, r0
	adds r3, r1, #0
	blx ov45_02232304
	pop {r3, r4, r5, pc}
_0222FC84:
	ldr r0, _0222FCD0 @ =0x022577C0
	ldr r4, [r0]
	adds r0, r1, #0
	bl ov45_0222F7A8
	ldr r1, _0222FCDC @ =0x0000012D
	ldrb r2, [r4, r1]
	cmp r2, r0
	bne _0222FCC4
	cmp r5, #1
	bne _0222FCBC
	movs r2, #1
	adds r0, r1, #2
	strb r2, [r4, r0]
	ldr r0, _0222FCD0 @ =0x022577C0
	ldr r0, [r0]
	ldrb r1, [r0, r1]
	bl ov45_0222FB84
	blx ov45_02232580
	adds r1, r0, #0
	ldr r0, _0222FCD0 @ =0x022577C0
	movs r2, #1
	ldr r0, [r0]
	bl ov45_0222FA74
	pop {r3, r4, r5, pc}
_0222FCBC:
	movs r2, #2
	adds r0, r1, #2
	strb r2, [r4, r0]
	pop {r3, r4, r5, pc}
_0222FCC4:
	bl GF_AssertFail
	bl ov45_0222EB94
	pop {r3, r4, r5, pc}
	nop
_0222FCD0: .4byte 0x022577C0
_0222FCD4: .4byte 0x000005B4
_0222FCD8: .4byte 0x02254EF0
_0222FCDC: .4byte 0x0000012D
	thumb_func_end ov45_0222FC44

	thumb_func_start ov45_0222FCE0
ov45_0222FCE0: @ 0x0222FCE0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	str r3, [sp]
	blx ov45_02232580
	cmp r5, r0
	bne _0222FD04
	ldr r0, _0222FD4C @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x67
	lsls r0, r0, #2
	adds r0, r1, r0
	blx ov45_022320C4
	movs r4, #1
	b _0222FD06
_0222FD04:
	movs r4, #0
_0222FD06:
	ldr r0, _0222FD4C @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	movs r2, #0
	bl ov45_0222FA74
	ldr r0, _0222FD4C @ =0x022577C0
	ldr r3, [sp]
	ldr r0, [r0]
	adds r1, r5, #0
	adds r2, r7, #0
	bl ov45_0222F898
	ldr r0, _0222FD4C @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	adds r2, r6, #0
	bl ov45_0222F928
	ldr r0, _0222FD4C @ =0x022577C0
	adds r1, r5, #0
	ldr r6, [r0]
	adds r0, r6, #0
	bl ov45_0222F8D8
	adds r3, r4, #0
	ldr r4, _0222FD4C @ =0x022577C0
	adds r1, r0, #0
	ldr r4, [r4]
	ldr r2, [r6, #0x20]
	ldr r4, [r4, #0xc]
	adds r0, r5, #0
	blx r4
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FD4C: .4byte 0x022577C0
	thumb_func_end ov45_0222FCE0

	thumb_func_start ov45_0222FD50
ov45_0222FD50: @ 0x0222FD50
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222FDCC @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	movs r2, #0
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222FDC8
	movs r6, #0
	ldr r7, _0222FDCC @ =0x022577C0
	adds r4, r6, #0
_0222FD6E:
	ldr r1, [r7]
	movs r0, #6
	adds r2, r1, r4
	lsls r0, r0, #8
	ldr r0, [r2, r0]
	cmp r5, r0
	bne _0222FD88
	ldr r2, _0222FDD0 @ =0x000005B8
	adds r0, r5, #0
	adds r1, r1, r2
	adds r1, r1, r4
	bl ov45_02230008
_0222FD88:
	adds r6, r6, #1
	adds r4, #0x4c
	cmp r6, #3
	blt _0222FD6E
	ldr r0, _0222FDCC @ =0x022577C0
	ldr r2, [r0]
	adds r0, r5, #0
	ldr r1, [r2, #0x20]
	ldr r2, [r2, #0x10]
	blx r2
	ldr r0, _0222FDCC @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	bl ov45_0222F978
	ldr r0, _0222FDCC @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	bl ov45_0222F8FC
	ldr r0, _0222FDCC @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	movs r2, #0
	bl ov45_0222FAF8
	ldr r0, _0222FDCC @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	movs r2, #1
	bl ov45_0222FAF8
_0222FDC8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FDCC: .4byte 0x022577C0
_0222FDD0: .4byte 0x000005B8
	thumb_func_end ov45_0222FD50

	thumb_func_start ov45_0222FDD4
ov45_0222FDD4: @ 0x0222FDD4
	bx lr
	.align 2, 0
	thumb_func_end ov45_0222FDD4

	thumb_func_start ov45_0222FDD8
ov45_0222FDD8: @ 0x0222FDD8
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, _0222FE7C @ =0x022577C0
	adds r4, r1, #0
	adds r5, r2, #0
	ldr r0, [r0]
	adds r1, r7, #0
	movs r2, #0
	str r3, [sp]
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222FE78
	cmp r4, #5
	bhi _0222FE78
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0222FE06: @ jump table
	.2byte _0222FE12 - _0222FE06 - 2 @ case 0
	.2byte _0222FE16 - _0222FE06 - 2 @ case 1
	.2byte _0222FE16 - _0222FE06 - 2 @ case 2
	.2byte _0222FE16 - _0222FE06 - 2 @ case 3
	.2byte _0222FE16 - _0222FE06 - 2 @ case 4
	.2byte _0222FE2C - _0222FE06 - 2 @ case 5
_0222FE12:
	movs r1, #0
	b _0222FE32
_0222FE16:
	adds r0, r4, #0
	bl ov45_0222F7A8
	ldr r1, _0222FE7C @ =0x022577C0
	ldr r2, [r1]
	ldr r1, _0222FE80 @ =0x0000012D
	ldrb r1, [r2, r1]
	cmp r1, r0
	bne _0222FE78
	movs r1, #1
	b _0222FE32
_0222FE2C:
	movs r1, #0
	b _0222FE32
	thumb_func_end ov45_0222FDD8

	thumb_func_start ov45_0222FE30
ov45_0222FE30: @ 0x0222FE30
	pop {r3, r4, r5, r6, r7, pc}
_0222FE32:
	adds r4, r1, #0
	movs r0, #0xc
	muls r4, r0, r4
	ldr r0, _0222FE7C @ =0x022577C0
	movs r1, #0x62
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r0, r0, r4
	ldr r2, [r0, r1]
	cmp r2, r5
	bls _0222FE78
	subs r1, r1, #4
	ldr r0, [r0, r1]
	lsls r5, r5, #3
	adds r0, r0, r5
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	cmp r1, r0
	bls _0222FE5C
	bl GF_AssertFail
_0222FE5C:
	ldr r0, _0222FE7C @ =0x022577C0
	movs r3, #0x61
	ldr r0, [r0]
	lsls r3, r3, #2
	adds r6, r0, r4
	ldr r4, [r6, r3]
	adds r3, #8
	adds r2, r4, r5
	ldr r1, [sp]
	ldr r2, [r2, #4]
	ldr r3, [r6, r3]
	ldr r4, [r4, r5]
	adds r0, r7, #0
	blx r4
_0222FE78:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FE7C: .4byte 0x022577C0
_0222FE80: .4byte 0x0000012D
	thumb_func_end ov45_0222FE30

	thumb_func_start ov45_0222FE84
ov45_0222FE84: @ 0x0222FE84
	push {r3, lr}
	ldr r1, _0222FEBC @ =0x02254EF0
	ldr r0, [sp, #8]
	ldr r1, [r1]
	blx FUN_020E9734
	cmp r0, #0
	bne _0222FEB8
	ldr r0, _0222FEC0 @ =0x022577C0
	movs r2, #0x50
	ldr r1, [r0]
	movs r0, #0x4d
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r1, [sp, #0xc]
	blx FUN_020E5AD8
	ldr r0, _0222FEC0 @ =0x022577C0
	ldr r2, [r0]
	movs r0, #0x13
	lsls r0, r0, #4
	ldrb r1, [r2, r0]
	cmp r1, #0
	beq _0222FEB8
	movs r1, #0
	strb r1, [r2, r0]
_0222FEB8:
	pop {r3, pc}
	nop
_0222FEBC: .4byte 0x02254EF0
_0222FEC0: .4byte 0x022577C0
	thumb_func_end ov45_0222FE84

	thumb_func_start ov45_0222FEC4
ov45_0222FEC4: @ 0x0222FEC4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0222FF38 @ =0x022577C0
	adds r7, r1, #0
	ldr r0, [r0]
	adds r1, r5, #0
	movs r2, #0
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222FF36
	ldr r0, _0222FF38 @ =0x022577C0
	ldr r1, _0222FF3C @ =0x0000012D
	ldr r0, [r0]
	ldrb r1, [r0, r1]
	cmp r1, #4
	beq _0222FF2A
	adds r1, r5, #0
	bl ov45_0222F954
	ldr r4, [r0, #8]
	ldr r0, _0222FF38 @ =0x022577C0
	ldr r6, [r7, #8]
	ldr r1, [r0]
	ldr r0, _0222FF3C @ =0x0000012D
	ldrb r0, [r1, r0]
	bl ov45_0222F7B0
	cmp r4, #5
	bne _0222FF16
	cmp r6, r0
	bne _0222FF16
	ldr r0, _0222FF38 @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	movs r2, #1
	bl ov45_0222FA74
	b _0222FF2A
_0222FF16:
	cmp r4, r0
	bne _0222FF2A
	cmp r6, r0
	beq _0222FF2A
	ldr r0, _0222FF38 @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	movs r2, #1
	bl ov45_0222FAF8
_0222FF2A:
	ldr r0, _0222FF38 @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	adds r2, r7, #0
	bl ov45_0222F928
_0222FF36:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0222FF38: .4byte 0x022577C0
_0222FF3C: .4byte 0x0000012D
	thumb_func_end ov45_0222FEC4

	thumb_func_start ov45_0222FF40
ov45_0222FF40: @ 0x0222FF40
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0222FF78 @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r1, r5, #0
	movs r2, #0
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222FF74
	ldr r0, _0222FF78 @ =0x022577C0
	adds r1, r5, #0
	ldr r0, [r0]
	adds r2, r4, #0
	bl ov45_0222F88C
	ldr r0, _0222FF78 @ =0x022577C0
	adds r1, r4, #0
	ldr r3, [r0]
	adds r0, r5, #0
	ldr r2, [r3, #0x20]
	ldr r3, [r3, #0x14]
	blx r3
_0222FF74:
	pop {r3, r4, r5, pc}
	nop
_0222FF78: .4byte 0x022577C0
	thumb_func_end ov45_0222FF40

	thumb_func_start ov45_0222FF7C
ov45_0222FF7C: @ 0x0222FF7C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, _0222FFFC @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r1, r5, #0
	movs r2, #0
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _0222FFF8
	bl ov45_0222E9E0
	cmp r0, r5
	beq _0222FFEA
	ldr r0, _0222FFFC @ =0x022577C0
	ldr r2, _02230000 @ =0x0000069E
	ldr r1, [r0]
	ldrb r0, [r1, r2]
	cmp r0, #0
	beq _0222FFEA
	subs r0, r2, #2
	ldrh r0, [r1, r0]
	ldr r3, [r4]
	cmp r0, r3
	bne _0222FFEA
	subs r2, #0xe6
	adds r2, r1, r2
	movs r1, #0x4c
	muls r1, r0, r1
	adds r0, r2, r1
	add r1, sp, #8
	bl ov45_02230384
	adds r0, r4, #0
	add r1, sp, #0
	bl ov45_02230384
	ldr r3, [sp, #8]
	ldr r2, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [sp, #4]
	subs r0, r3, r0
	sbcs r2, r1
	blt _0222FFF8
	ldr r0, _0222FFFC @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _02230004 @ =0x0000069F
	strb r2, [r1, r0]
	bl ov45_0222F154
_0222FFEA:
	ldr r0, _0222FFFC @ =0x022577C0
	ldr r1, [r4]
	ldr r0, [r0]
	adds r2, r5, #0
	adds r3, r4, #0
	bl ov45_02230164
_0222FFF8:
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_0222FFFC: .4byte 0x022577C0
_02230000: .4byte 0x0000069E
_02230004: .4byte 0x0000069F
	thumb_func_end ov45_0222FF7C

	thumb_func_start ov45_02230008
ov45_02230008: @ 0x02230008
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02230048 @ =0x022577C0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r1, r5, #0
	movs r2, #0
	bl ov45_0222FB24
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02230046
	ldr r0, _02230048 @ =0x022577C0
	ldr r1, [r4]
	ldr r0, [r0]
	adds r2, r5, #0
	bl ov45_022301E0
	ldr r1, _02230048 @ =0x022577C0
	ldr r2, [r4]
	ldr r5, [r1]
	ldr r1, _0223004C @ =0x0000069C
	ldrh r3, [r5, r1]
	cmp r3, r2
	bne _02230046
	cmp r0, #1
	bne _02230046
	movs r2, #1
	adds r0, r1, #3
	strb r2, [r5, r0]
_02230046:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02230048: .4byte 0x022577C0
_0223004C: .4byte 0x0000069C
	thumb_func_end ov45_02230008

	thumb_func_start ov45_02230050
ov45_02230050: @ 0x02230050
	push {r3, lr}
	ldr r1, _02230060 @ =0x022577C0
	ldr r2, [r1]
	ldr r1, [r2, #0x20]
	ldr r2, [r2, #0x18]
	blx r2
	pop {r3, pc}
	nop
_02230060: .4byte 0x022577C0
	thumb_func_end ov45_02230050

	thumb_func_start ov45_02230064
ov45_02230064: @ 0x02230064
	push {r3, lr}
	cmp r0, #0
	beq _02230076
	ldr r0, _02230088 @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _0223008C @ =0x00000133
	strb r2, [r1, r0]
	pop {r3, pc}
_02230076:
	ldr r0, _02230088 @ =0x022577C0
	ldr r3, [r0]
	adds r0, r1, #0
	adds r1, r2, #0
	ldr r2, [r3, #0x20]
	ldr r3, [r3, #0x1c]
	blx r3
	pop {r3, pc}
	nop
_02230088: .4byte 0x022577C0
_0223008C: .4byte 0x00000133
	thumb_func_end ov45_02230064

	thumb_func_start ov45_02230090
ov45_02230090: @ 0x02230090
	cmp r0, #0
	bne _02230098
	movs r0, #1
	bx lr
_02230098:
	ldr r0, _022300A8 @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _022300AC @ =0x00000132
	strb r2, [r1, r0]
	movs r0, #0
	bx lr
	nop
_022300A8: .4byte 0x022577C0
_022300AC: .4byte 0x00000132
	thumb_func_end ov45_02230090

	thumb_func_start ov45_022300B0
ov45_022300B0: @ 0x022300B0
	push {r3, lr}
	cmp r0, #0
	bne _022300C6
	ldr r0, _022300D4 @ =0x022577C0
	ldr r3, [r0]
	movs r0, #0x6a
	lsls r0, r0, #4
	adds r0, r3, r0
	bl ov45_0223040C
	pop {r3, pc}
_022300C6:
	ldr r0, _022300D4 @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _022300D8 @ =0x00000132
	strb r2, [r1, r0]
	pop {r3, pc}
	nop
_022300D4: .4byte 0x022577C0
_022300D8: .4byte 0x00000132
	thumb_func_end ov45_022300B0

	thumb_func_start ov45_022300DC
ov45_022300DC: @ 0x022300DC
	push {r3, lr}
	cmp r0, #0
	bne _022300F0
	ldr r0, _022300FC @ =0x022577C0
	ldr r2, [r0]
	ldr r0, _02230100 @ =0x000006A8
	adds r0, r2, r0
	bl ov45_0223048C
	pop {r3, pc}
_022300F0:
	ldr r0, _022300FC @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _02230104 @ =0x00000132
	strb r2, [r1, r0]
	pop {r3, pc}
	.align 2, 0
_022300FC: .4byte 0x022577C0
_02230100: .4byte 0x000006A8
_02230104: .4byte 0x00000132
	thumb_func_end ov45_022300DC

	thumb_func_start ov45_02230108
ov45_02230108: @ 0x02230108
	push {r3, lr}
	ldr r0, _0223012C @ =0x022577C0
	ldr r1, [r0]
	movs r0, #0x26
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #1
	beq _0223011C
	bl GF_AssertFail
_0223011C:
	ldr r0, _0223012C @ =0x022577C0
	movs r2, #2
	ldr r1, [r0]
	movs r0, #0x26
	lsls r0, r0, #6
	str r2, [r1, r0]
	pop {r3, pc}
	nop
_0223012C: .4byte 0x022577C0
	thumb_func_end ov45_02230108

	thumb_func_start ov45_02230130
ov45_02230130: @ 0x02230130
	ldr r0, _0223013C @ =0x022577C0
	movs r2, #1
	ldr r1, [r0]
	ldr r0, _02230140 @ =0x00000131
	strb r2, [r1, r0]
	bx lr
	.align 2, 0
_0223013C: .4byte 0x022577C0
_02230140: .4byte 0x00000131
	thumb_func_end ov45_02230130

	thumb_func_start ov45_02230144
ov45_02230144: @ 0x02230144
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0223015C @ =0x000005B8
	movs r1, #0
	adds r0, r4, r0
	movs r2, #0xe4
	blx FUN_020E5B44
	ldr r0, _02230160 @ =0x0000069C
	movs r1, #3
	strh r1, [r4, r0]
	pop {r4, pc}
	.align 2, 0
_0223015C: .4byte 0x000005B8
_02230160: .4byte 0x0000069C
	thumb_func_end ov45_02230144

	thumb_func_start ov45_02230164
ov45_02230164: @ 0x02230164
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	adds r7, r3, #0
	str r2, [sp]
	cmp r6, #3
	blt _02230176
	bl GF_AssertFail
_02230176:
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0223021C
	cmp r0, #1
	bne _02230194
	movs r0, #0x4c
	muls r0, r6, r0
	adds r1, r5, r0
	movs r0, #6
	lsls r0, r0, #8
	ldr r1, [r1, r0]
	ldr r0, [sp]
	cmp r0, r1
	bne _022301D2
_02230194:
	movs r0, #0x4c
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _022301D4 @ =0x000005B8
	adds r1, r5, r4
	adds r3, r1, r0
	movs r2, #8
_022301A2:
	ldm r7!, {r0, r1}
	stm r3!, {r0, r1}
	subs r2, r2, #1
	bne _022301A2
	ldr r0, [r7]
	str r0, [r3]
	ldr r0, _022301D8 @ =0x000005FC
	adds r2, r5, r0
	ldrh r1, [r2, r4]
	cmp r1, #0
	bne _022301D2
	movs r1, #1
	strh r1, [r2, r4]
	adds r1, r0, #4
	ldr r0, [sp]
	adds r2, r5, r4
	str r0, [r2, r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov45_0223023C
	ldr r1, _022301DC @ =0x000005FE
	adds r2, r5, r4
	strh r0, [r2, r1]
_022301D2:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_022301D4: .4byte 0x000005B8
_022301D8: .4byte 0x000005FC
_022301DC: .4byte 0x000005FE
	thumb_func_end ov45_02230164

	thumb_func_start ov45_022301E0
ov45_022301E0: @ 0x022301E0
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r6, r2, #0
	cmp r4, #3
	blt _022301F0
	bl GF_AssertFail
_022301F0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov45_0223021C
	cmp r0, #1
	bne _02230216
	movs r0, #0x4c
	muls r0, r4, r0
	adds r2, r5, r0
	movs r0, #6
	lsls r0, r0, #8
	ldr r1, [r2, r0]
	cmp r6, r1
	bne _02230216
	movs r1, #0
	subs r0, r0, #4
	strh r1, [r2, r0]
	movs r0, #1
	pop {r4, r5, r6, pc}
_02230216:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_022301E0

	thumb_func_start ov45_0223021C
ov45_0223021C: @ 0x0223021C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	cmp r4, #3
	blt _0223022A
	bl GF_AssertFail
_0223022A:
	movs r0, #0x4c
	muls r0, r4, r0
	adds r1, r5, r0
	ldr r0, _02230238 @ =0x000005FC
	ldrh r0, [r1, r0]
	pop {r3, r4, r5, pc}
	nop
_02230238: .4byte 0x000005FC
	thumb_func_end ov45_0223021C

	thumb_func_start ov45_0223023C
ov45_0223023C: @ 0x0223023C
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov45_0223021C
	cmp r0, #0
	bne _02230252
	add sp, #8
	movs r0, #0
	pop {r3, r4, r5, pc}
_02230252:
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov45_022302B0
	add r1, sp, #0
	bl ov45_02230384
	movs r1, #0x67
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, r1, #4
	ldr r2, [r4, r1]
	ldr r3, [sp]
	ldr r1, [sp, #4]
	subs r0, r0, r3
	sbcs r2, r1
	movs r3, #0
	movs r1, #0x1e
	subs r1, r1, r0
	sbcs r3, r2
	bge _02230282
	movs r0, #0x1e
	movs r2, #0
	b _02230294
_02230282:
	movs r1, #0
	movs r3, #0
	subs r1, r0, r1
	mov ip, r2
	mov r1, ip
	sbcs r1, r3
	bge _02230294
	movs r0, #0
	adds r2, r0, #0
_02230294:
	movs r1, #0x3c
	movs r3, #0
	subs r0, r1, r0
	mov ip, r3
	mov r1, ip
	sbcs r1, r2
	movs r2, #0x1e
	blx FUN_020F2948
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_0223023C

	thumb_func_start ov45_022302B0
ov45_022302B0: @ 0x022302B0
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r6, #3
	blt _022302BE
	bl GF_AssertFail
_022302BE:
	movs r0, #0x4c
	adds r4, r6, #0
	muls r4, r0, r4
	ldr r0, _022302DC @ =0x000005FC
	adds r1, r5, r4
	ldrh r0, [r1, r0]
	cmp r0, #1
	beq _022302D2
	bl GF_AssertFail
_022302D2:
	ldr r0, _022302E0 @ =0x000005B8
	adds r0, r5, r0
	adds r0, r0, r4
	pop {r4, r5, r6, pc}
	nop
_022302DC: .4byte 0x000005FC
_022302E0: .4byte 0x000005B8
	thumb_func_end ov45_022302B0

	thumb_func_start ov45_022302E4
ov45_022302E4: @ 0x022302E4
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02230364 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _02230368 @ =0x0000069E
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _0223031E
	bl FUN_021E7144
	adds r4, r0, #0
	cmp r4, #4
	bls _02230300
	bl GF_AssertFail
_02230300:
	ldr r0, _02230364 @ =0x022577C0
	ldr r1, [r0]
	ldr r0, _0223036C @ =0x000005B8
	adds r2, r1, r0
	adds r0, #0xe4
	ldrh r1, [r1, r0]
	movs r0, #0x4c
	muls r0, r1, r0
	adds r0, r2, r0
	ldr r1, [r0, #8]
	cmp r1, r4
	beq _0223031E
	str r4, [r0, #8]
	blx ov45_02232BB0
_0223031E:
	movs r4, #0
	ldr r6, _02230364 @ =0x022577C0
	ldr r7, _02230370 @ =0x000005FC
	adds r5, r4, #0
_02230326:
	ldr r0, [r6]
	adds r0, r0, r5
	ldrh r1, [r0, r7]
	cmp r1, #1
	bne _0223035A
	ldr r1, _02230374 @ =0x000005FE
	ldrh r1, [r0, r1]
	cmp r1, #0
	beq _02230342
	ldr r1, _02230374 @ =0x000005FE
	ldrh r1, [r0, r1]
	subs r2, r1, #1
	ldr r1, _02230374 @ =0x000005FE
	strh r2, [r0, r1]
_02230342:
	ldr r0, [r6]
	adds r1, r4, #0
	bl ov45_0223023C
	ldr r1, [r6]
	ldr r2, _02230374 @ =0x000005FE
	adds r1, r1, r5
	ldrh r2, [r1, r2]
	cmp r0, r2
	bhs _0223035A
	ldr r2, _02230374 @ =0x000005FE
	strh r0, [r1, r2]
_0223035A:
	adds r4, r4, #1
	adds r5, #0x4c
	cmp r4, #3
	blt _02230326
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230364: .4byte 0x022577C0
_02230368: .4byte 0x0000069E
_0223036C: .4byte 0x000005B8
_02230370: .4byte 0x000005FC
_02230374: .4byte 0x000005FE
	thumb_func_end ov45_022302E4

	thumb_func_start ov45_02230378
ov45_02230378: @ 0x02230378
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
	thumb_func_end ov45_02230378

	thumb_func_start ov45_02230384
ov45_02230384: @ 0x02230384
	ldr r2, [r0, #0x10]
	ldr r0, [r0, #0x14]
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
	thumb_func_end ov45_02230384

	thumb_func_start ov45_02230390
ov45_02230390: @ 0x02230390
	bx lr
	.align 2, 0
	thumb_func_end ov45_02230390

	thumb_func_start ov45_02230394
ov45_02230394: @ 0x02230394
	push {r3, lr}
	ldr r2, _022303B4 @ =0x0000069E
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _022303A4
	bl ov45_0222F154
	pop {r3, pc}
_022303A4:
	cmp r0, #0
	bne _022303B2
	ldr r0, _022303B8 @ =0x022577C0
	movs r3, #1
	ldr r1, [r0]
	adds r0, r2, #1
	strb r3, [r1, r0]
_022303B2:
	pop {r3, pc}
	.align 2, 0
_022303B4: .4byte 0x0000069E
_022303B8: .4byte 0x022577C0
	thumb_func_end ov45_02230394

	thumb_func_start ov45_022303BC
ov45_022303BC: @ 0x022303BC
	push {r4, r5}
	ldrh r2, [r0, #0xe]
	movs r3, #0
	adds r4, r3, #0
	cmp r2, #0
	ble _022303DC
	adds r5, r0, #0
_022303CA:
	ldr r2, [r5, #0x14]
	cmp r1, r2
	bne _022303D2
	ldr r3, [r5, #0x10]
_022303D2:
	ldrh r2, [r0, #0xe]
	adds r4, r4, #1
	adds r5, #8
	cmp r4, r2
	blt _022303CA
_022303DC:
	adds r0, r3, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov45_022303BC

	thumb_func_start ov45_022303E4
ov45_022303E4: @ 0x022303E4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r2, #0
	lsls r1, r5, #3
	bl FUN_0201AA8C
	str r0, [r4]
	strh r5, [r4, #4]
	movs r0, #0
	strh r0, [r4, #6]
	pop {r3, r4, r5, pc}
	thumb_func_end ov45_022303E4

	thumb_func_start ov45_022303FC
ov45_022303FC: @ 0x022303FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl FUN_0201AB0C
	movs r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov45_022303FC

	thumb_func_start ov45_0223040C
ov45_0223040C: @ 0x0223040C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #4]
	adds r4, r2, #0
	adds r6, r1, #0
	cmp r4, r0
	blo _0223041E
	bl GF_AssertFail
_0223041E:
	ldrh r0, [r5, #4]
	cmp r4, r0
	blo _02230426
	adds r4, r0, #0
_02230426:
	ldr r1, [r5]
	adds r0, r6, #0
	lsls r2, r4, #3
	blx FUN_020D4808
	strh r4, [r5, #6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_0223040C

	thumb_func_start ov45_02230434
ov45_02230434: @ 0x02230434
	push {r3, r4}
	ldrh r2, [r0, #6]
	movs r3, #0
	cmp r2, #0
	ble _02230456
	ldr r4, [r0]
_02230440:
	ldr r2, [r4]
	cmp r1, r2
	bne _0223044C
	movs r0, #1
	pop {r3, r4}
	bx lr
_0223044C:
	ldrh r2, [r0, #6]
	adds r3, r3, #1
	adds r4, #8
	cmp r3, r2
	blt _02230440
_02230456:
	movs r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_02230434

	thumb_func_start ov45_0223045C
ov45_0223045C: @ 0x0223045C
	push {r4, r5}
	ldrh r2, [r0, #6]
	movs r3, #0
	cmp r2, #0
	ble _02230484
	ldr r5, [r0]
	adds r4, r5, #0
_0223046A:
	ldr r2, [r4]
	cmp r1, r2
	bne _0223047A
	lsls r0, r3, #3
	adds r0, r5, r0
	ldr r0, [r0, #4]
	pop {r4, r5}
	bx lr
_0223047A:
	ldrh r2, [r0, #6]
	adds r3, r3, #1
	adds r4, #8
	cmp r3, r2
	blt _0223046A
_02230484:
	movs r0, #0
	pop {r4, r5}
	bx lr
	.align 2, 0
	thumb_func_end ov45_0223045C

	thumb_func_start ov45_0223048C
ov45_0223048C: @ 0x0223048C
	ldr r3, _02230494 @ =FUN_020E5AD8
	movs r2, #0xb6
	lsls r2, r2, #2
	bx r3
	.align 2, 0
_02230494: .4byte FUN_020E5AD8
	thumb_func_end ov45_0223048C

	thumb_func_start ov45_02230498
ov45_02230498: @ 0x02230498
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r7, r2, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r7, #0
	movs r1, #0x30
	str r3, [sp, #0xc]
	bl FUN_0201AA8C
	movs r1, #0
	movs r2, #0x30
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r2, [sp, #4]
	movs r1, #0x90
	adds r0, r7, #0
	muls r1, r2, r1
	bl FUN_0201AA8C
	str r0, [r4, #0x10]
	ldr r0, [sp, #4]
	movs r6, #0
	str r0, [r4, #0x14]
	cmp r0, #0
	bls _022304E2
	adds r5, r6, #0
_022304D0:
	ldr r0, [r4, #0x10]
	adds r0, r0, r5
	bl ov45_02230AB4
	ldr r0, [r4, #0x14]
	adds r6, r6, #1
	adds r5, #0x90
	cmp r6, r0
	blo _022304D0
_022304E2:
	movs r0, #1
	adds r1, r7, #0
	bl FUN_02025534
	str r0, [r4]
	movs r0, #2
	adds r1, r7, #0
	bl FUN_02025534
	str r0, [r4, #4]
	movs r0, #0x14
	adds r1, r7, #0
	bl FUN_02025780
	str r0, [r4, #8]
	movs r0, #1
	adds r1, r7, #0
	bl FUN_02023738
	ldr r0, [sp, #4]
	str r7, [sp, #0x24]
	str r0, [sp, #0x20]
	add r0, sp, #0x20
	bl FUN_020237EC
	str r0, [r4, #0xc]
	movs r0, #0x51
	adds r1, r7, #0
	bl FUN_02007688
	str r0, [sp, #0x18]
	movs r0, #0xd1
	adds r1, r7, #0
	bl FUN_02007688
	movs r2, #0
	ldr r3, [sp, #0xc]
	str r2, [sp]
	movs r1, #0x7f
	str r0, [sp, #0x14]
	bl FUN_02007C98
	adds r5, r0, #0
	ldr r0, [r4]
	adds r1, r5, #0
	movs r2, #0x7f
	bl FUN_020255C4
	adds r0, r5, #0
	bl ov45_0222D740
	adds r0, r5, #0
	blx FUN_020C3B40
	cmp r0, #0
	beq _02230572
	adds r2, r0, #0
	adds r2, #8
	beq _02230566
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _02230566
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _02230568
_02230566:
	movs r1, #0
_02230568:
	cmp r1, #0
	beq _02230572
	ldr r1, [r1]
	adds r0, r0, r1
	b _02230574
_02230572:
	movs r0, #0
_02230574:
	movs r1, #0
	blx FUN_020C33C0
	movs r6, #0
	ldr r5, _02230630 @ =0x02254C38
	str r0, [r4, #0x2c]
	adds r7, r6, #0
_02230582:
	str r7, [sp]
	ldrh r1, [r5]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0xc]
	adds r2, r7, #0
	bl FUN_02007C98
	adds r1, r0, #0
	ldrh r2, [r5]
	ldr r0, [r4, #4]
	bl FUN_020255C4
	adds r6, r6, #1
	adds r5, r5, #2
	cmp r6, #2
	blt _02230582
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022305AE
	movs r0, #1
	str r0, [sp, #0x10]
	b _022305B2
_022305AE:
	movs r0, #0
	str r0, [sp, #0x10]
_022305B2:
	ldr r5, _02230634 @ =0x02254C48
	movs r7, #0
_022305B6:
	ldr r0, [sp, #0x10]
	cmp r0, r7
	beq _02230608
	ldrh r0, [r5, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
	bne _022305C8
	movs r6, #1
	b _022305CA
_022305C8:
	movs r6, #0
_022305CA:
	movs r0, #0
	str r0, [sp]
	ldrh r1, [r5, #2]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0xc]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x11
	movs r2, #0
	bl FUN_02007C98
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	adds r3, r6, #0
	str r0, [sp]
	ldrh r2, [r5, #2]
	ldr r0, [r4, #8]
	lsls r2, r2, #0x11
	lsrs r2, r2, #0x11
	bl FUN_02025800
	str r0, [sp, #0x1c]
	cmp r6, #1
	bne _02230608
	bl FUN_02025A64
	ldr r0, [sp, #0x1c]
	bl FUN_020259B0
	ldr r0, [sp, #0x1c]
	bl FUN_020259FC
_02230608:
	adds r7, r7, #1
	adds r5, r5, #4
	cmp r7, #0x14
	blt _022305B6
	adds r0, r4, #0
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0xc]
	adds r0, #0x18
	movs r2, #0x80
	bl ov45_022309E8
	ldr r0, [sp, #0x18]
	bl FUN_0200770C
	ldr r0, [sp, #0x14]
	bl FUN_0200770C
	adds r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230630: .4byte 0x02254C38
_02230634: .4byte 0x02254C48
	thumb_func_end ov45_02230498

	thumb_func_start ov45_02230638
ov45_02230638: @ 0x02230638
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x18
	bl ov45_02230A44
	ldr r0, [r4, #8]
	bl FUN_02025900
	ldr r0, [r4]
	bl FUN_0202568C
	ldr r0, [r4, #4]
	bl FUN_0202568C
	ldr r0, [r4, #0xc]
	bl FUN_02023874
	bl FUN_02023778
	ldr r0, [r4, #8]
	bl FUN_020257C4
	ldr r0, [r4]
	bl FUN_02025580
	ldr r0, [r4, #4]
	bl FUN_02025580
	ldr r0, [r4, #0x10]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02230638

	thumb_func_start ov45_02230680
ov45_02230680: @ 0x02230680
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	movs r6, #0
	cmp r0, #0
	bls _022306B0
	adds r4, r6, #0
_0223068E:
	ldr r0, [r5, #0x10]
	adds r0, r0, r4
	bl ov45_02230ACC
	ldr r0, [r5, #0x10]
	adds r0, r0, r4
	bl ov45_02230CB0
	ldr r0, [r5, #0x10]
	adds r0, r0, r4
	bl ov45_02230DF4
	ldr r0, [r5, #0x14]
	adds r6, r6, #1
	adds r4, #0x90
	cmp r6, r0
	blo _0223068E
_022306B0:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_02230680

	thumb_func_start ov45_022306B4
ov45_022306B4: @ 0x022306B4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl FUN_020237B0
	adds r0, r5, #0
	adds r0, #0x18
	bl ov45_02230A58
	cmp r0, #0
	beq _022306F0
	ldr r0, [r5, #0x14]
	movs r6, #0
	cmp r0, #0
	bls _022306F0
	adds r4, r6, #0
_022306D2:
	ldr r0, [r5, #0x10]
	adds r0, r0, r4
	bl ov45_02230AA4
	cmp r0, #1
	bne _022306E6
	ldr r0, [r5, #0x10]
	adds r0, r0, r4
	bl ov45_02230AC0
_022306E6:
	ldr r0, [r5, #0x14]
	adds r6, r6, #1
	adds r4, #0x90
	cmp r6, r0
	blo _022306D2
_022306F0:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_022306B4

	thumb_func_start ov45_022306F4
ov45_022306F4: @ 0x022306F4
	ldr r3, _022306FC @ =FUN_02023910
	ldr r0, [r0, #0xc]
	bx r3
	nop
_022306FC: .4byte FUN_02023910
	thumb_func_end ov45_022306F4

	thumb_func_start ov45_02230700
ov45_02230700: @ 0x02230700
	ldr r3, _02230708 @ =ov45_02230A4C
	adds r0, #0x18
	bx r3
	nop
_02230708: .4byte ov45_02230A4C
	thumb_func_end ov45_02230700

	thumb_func_start ov45_0223070C
ov45_0223070C: @ 0x0223070C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	adds r5, r0, #0
	adds r7, r1, #0
	bl ov45_02230A6C
	adds r4, r0, #0
	str r7, [r4, #4]
	add r1, sp, #0x34
	movs r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	ldr r3, _02230874 @ =0x02254C3C
	str r0, [r1, #8]
	ldm r3!, {r0, r1}
	add r2, sp, #0x28
	stm r2!, {r0, r1}
	ldr r0, [r3]
	movs r1, #7
	str r0, [r2]
	adds r0, r7, #0
	bl FUN_02228188
	bl ov45_0223099C
	adds r6, r0, #0
	ldr r0, [r5]
	movs r1, #0x7f
	bl FUN_020256C8
	bl FUN_020256FC
	ldrh r1, [r6, #2]
	str r0, [sp, #0x14]
	ldr r0, [r5, #8]
	lsls r1, r1, #0x11
	lsrs r1, r1, #0x11
	bl FUN_02025940
	str r0, [sp, #0x18]
	bl FUN_0202599C
	str r0, [sp, #0x10]
	ldrh r0, [r6, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _02230770
	ldr r1, _02230878 @ =0x00000119
	b _02230774
_02230770:
	movs r1, #0x46
	lsls r1, r1, #2
_02230774:
	ldr r0, [r5, #4]
	bl FUN_020256C8
	bl FUN_020256FC
	add r1, sp, #0x40
	bl FUN_02026E18
	ldrh r0, [r6, #2]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x1f
	cmp r0, #1
	bne _022307A0
	add r0, sp, #0x40
	str r0, [sp]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, _0223087C @ =0x02254C98
	add r0, sp, #0x70
	bl FUN_02023E2C
	b _022307CE
_022307A0:
	ldr r0, [sp, #0x18]
	bl FUN_02025A9C
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	bl FUN_02025AAC
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	bl FUN_02025ABC
	add r1, sp, #0x40
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	str r6, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, _0223087C @ =0x02254C98
	add r0, sp, #0x70
	bl FUN_02023E04
_022307CE:
	adds r0, r7, #0
	bl FUN_022282DC
	add r1, sp, #0x20
	strh r0, [r1]
	lsrs r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1]
	add r0, sp, #0x24
	strh r2, [r1, #4]
	ldrh r2, [r1, #2]
	strh r2, [r1, #6]
	add r1, sp, #0x34
	bl FUN_02258800
	movs r0, #1
	ldr r1, [sp, #0x3c]
	lsls r0, r0, #0x10
	adds r0, r1, r0
	str r0, [sp, #0x3c]
	ldr r0, [r5, #0xc]
	add r3, sp, #0x34
	str r0, [sp, #0x50]
	add r0, sp, #0x70
	str r0, [sp, #0x54]
	ldm r3!, {r0, r1}
	add r2, sp, #0x58
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r3, sp, #0x28
	str r0, [r2]
	ldm r3!, {r0, r1}
	add r2, sp, #0x64
	stm r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, sp, #0x50
	bl FUN_02023D44
	ldr r1, _02230880 @ =ov45_02230E64
	adds r2, r4, #0
	str r0, [r4, #8]
	bl FUN_02023FE4
	adds r0, r5, #0
	adds r1, r4, #0
	adds r0, #0x18
	adds r1, #0xc
	bl ov45_02230A5C
	movs r2, #2
	lsls r2, r2, #0xc
	adds r0, r4, #0
	ldr r6, [sp, #0x3c]
	lsls r3, r2, #2
	ldr r1, [sp, #0x34]
	adds r0, #0xc
	subs r3, r6, r3
	bl FUN_020182A8
	ldrb r1, [r4]
	movs r0, #0xf
	bics r1, r0
	movs r0, #1
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0xc0
	bics r1, r0
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x30
	bics r1, r0
	strb r1, [r4]
	adds r0, r4, #0
	ldr r1, [r5, #0x2c]
	adds r0, #0x8c
	str r1, [r0]
	adds r0, r4, #0
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02230874: .4byte 0x02254C3C
_02230878: .4byte 0x00000119
_0223087C: .4byte 0x02254C98
_02230880: .4byte ov45_02230E64
	thumb_func_end ov45_0223070C

	thumb_func_start ov45_02230884
ov45_02230884: @ 0x02230884
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023DA4
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x90
	blx FUN_020E5B44
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02230884

	thumb_func_start ov45_0223089C
ov45_0223089C: @ 0x0223089C
	ldrb r3, [r0]
	movs r2, #0xf
	lsls r1, r1, #0x18
	bics r3, r2
	lsrs r2, r1, #0x18
	movs r1, #0xf
	ands r1, r2
	orrs r1, r3
	strb r1, [r0]
	bx lr
	thumb_func_end ov45_0223089C

	thumb_func_start ov45_022308B0
ov45_022308B0: @ 0x022308B0
	adds r0, #0x8c
	str r1, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov45_022308B0

	thumb_func_start ov45_022308B8
ov45_022308B8: @ 0x022308B8
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1e
	bx lr
	thumb_func_end ov45_022308B8

	thumb_func_start ov45_022308C0
ov45_022308C0: @ 0x022308C0
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r1, #0
	add r1, sp, #0
	bl FUN_02258800
	movs r0, #1
	ldr r1, [sp, #8]
	lsls r0, r0, #0x10
	adds r0, r1, r0
	str r0, [sp, #8]
	adds r0, r4, #0
	add r1, sp, #0
	bl ov45_022308E4
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov45_022308C0

	thumb_func_start ov45_022308E4
ov45_022308E4: @ 0x022308E4
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #8]
	adds r4, r1, #0
	bl FUN_02023E50
	movs r2, #2
	ldr r1, [r4]
	lsls r2, r2, #0xc
	adds r5, #0xc
	ldr r4, [r4, #8]
	lsls r3, r2, #2
	adds r0, r5, #0
	subs r3, r4, r3
	bl FUN_020182A8
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov45_022308E4

	thumb_func_start ov45_02230908
ov45_02230908: @ 0x02230908
	push {r4, lr}
	ldr r0, [r0, #8]
	adds r4, r1, #0
	bl FUN_02023E68
	adds r2, r0, #0
	ldm r2!, {r0, r1}
	stm r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02230908

	thumb_func_start ov45_02230920
ov45_02230920: @ 0x02230920
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl ov45_022309C4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023EE0
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02023F40
	pop {r4, pc}
	thumb_func_end ov45_02230920

	thumb_func_start ov45_0223093C
ov45_0223093C: @ 0x0223093C
	push {r3, r4}
	ldrb r3, [r0, #1]
	movs r2, #1
	lsls r1, r1, #0x18
	bics r3, r2
	adds r2, r3, #0
	movs r4, #1
	orrs r2, r4
	strb r2, [r0, #1]
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x19
	ldrb r2, [r0, #1]
	movs r3, #0xfe
	lsrs r1, r1, #0x18
	bics r2, r3
	orrs r1, r2
	strb r1, [r0, #1]
	movs r1, #0
	strb r1, [r0, #2]
	strb r4, [r0, #3]
	pop {r3, r4}
	bx lr
	thumb_func_end ov45_0223093C

	thumb_func_start ov45_02230968
ov45_02230968: @ 0x02230968
	ldrb r2, [r0, #1]
	movs r1, #1
	bics r2, r1
	strb r2, [r0, #1]
	bx lr
	.align 2, 0
	thumb_func_end ov45_02230968

	thumb_func_start ov45_02230974
ov45_02230974: @ 0x02230974
	strb r1, [r0, #3]
	bx lr
	thumb_func_end ov45_02230974

	thumb_func_start ov45_02230978
ov45_02230978: @ 0x02230978
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r1, r1, #0x1e
	ldrb r2, [r0]
	movs r3, #0xc0
	lsrs r1, r1, #0x18
	bics r2, r3
	orrs r1, r2
	ldr r3, _02230990 @ =ov45_02230E28
	strb r1, [r0]
	bx r3
	nop
_02230990: .4byte ov45_02230E28
	thumb_func_end ov45_02230978

	thumb_func_start ov45_02230994
ov45_02230994: @ 0x02230994
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	bx lr
	thumb_func_end ov45_02230994

	thumb_func_start ov45_0223099C
ov45_0223099C: @ 0x0223099C
	push {r3, lr}
	ldr r3, _022309C0 @ =0x02254C48
	movs r2, #0
_022309A2:
	ldrh r1, [r3]
	cmp r0, r1
	bne _022309B0
	ldr r1, _022309C0 @ =0x02254C48
	lsls r0, r2, #2
	adds r0, r1, r0
	pop {r3, pc}
_022309B0:
	adds r2, r2, #1
	adds r3, r3, #4
	cmp r2, #0x14
	blt _022309A2
	bl GF_AssertFail
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_022309C0: .4byte 0x02254C48
	thumb_func_end ov45_0223099C

	thumb_func_start ov45_022309C4
ov45_022309C4: @ 0x022309C4
	cmp r0, #0
	bne _022309CA
	adds r1, r1, #4
_022309CA:
	adds r0, r1, #0
	bx lr
	.align 2, 0
	thumb_func_end ov45_022309C4

	thumb_func_start ov45_022309D0
ov45_022309D0: @ 0x022309D0
	push {r3, lr}
	adds r3, r0, #0
	adds r0, r1, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	muls r0, r2, r0
	adds r1, r3, #0
	blx FUN_020F2BA4
	lsls r0, r0, #0xc
	pop {r3, pc}
	thumb_func_end ov45_022309D0

	thumb_func_start ov45_022309E8
ov45_022309E8: @ 0x022309E8
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	add r0, sp, #0
	bl FUN_02258830
	ldr r0, [sp]
	str r0, [r4]
	blx FUN_020C3B40
	str r0, [r4, #4]
	cmp r0, #0
	beq _02230A22
	adds r2, r0, #0
	adds r2, #8
	beq _02230A16
	ldrb r1, [r0, #9]
	cmp r1, #0
	bls _02230A16
	ldrh r1, [r0, #0xe]
	adds r1, r2, r1
	adds r1, r1, #4
	b _02230A18
_02230A16:
	movs r1, #0
_02230A18:
	cmp r1, #0
	beq _02230A22
	ldr r1, [r1]
	adds r0, r0, r1
	b _02230A24
_02230A22:
	movs r0, #0
_02230A24:
	str r0, [r4, #8]
	ldr r0, [r4]
	blx FUN_020C3B50
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl FUN_0201F64C
	ldr r0, [r4, #8]
	movs r1, #0x14
	blx FUN_020C3658
	add sp, #4
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov45_022309E8

	thumb_func_start ov45_02230A44
ov45_02230A44: @ 0x02230A44
	ldr r3, _02230A48 @ =FUN_02018068
	bx r3
	.align 2, 0
_02230A48: .4byte FUN_02018068
	thumb_func_end ov45_02230A44

	thumb_func_start ov45_02230A4C
ov45_02230A4C: @ 0x02230A4C
	ldr r3, _02230A54 @ =FUN_020C3698
	str r1, [r0, #0x10]
	ldr r0, [r0, #8]
	bx r3
	.align 2, 0
_02230A54: .4byte FUN_020C3698
	thumb_func_end ov45_02230A4C

	thumb_func_start ov45_02230A58
ov45_02230A58: @ 0x02230A58
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end ov45_02230A58

	thumb_func_start ov45_02230A5C
ov45_02230A5C: @ 0x02230A5C
	ldr r3, _02230A68 @ =FUN_020181B0
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r2, #0
	bx r3
	nop
_02230A68: .4byte FUN_020181B0
	thumb_func_end ov45_02230A5C

	thumb_func_start ov45_02230A6C
ov45_02230A6C: @ 0x02230A6C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	movs r6, #0
	cmp r0, #0
	bls _02230A9A
	adds r4, r6, #0
_02230A7A:
	ldr r0, [r5, #0x10]
	adds r0, r0, r4
	bl ov45_02230AA4
	cmp r0, #0
	bne _02230A90
	movs r0, #0x90
	ldr r1, [r5, #0x10]
	muls r0, r6, r0
	adds r0, r1, r0
	pop {r4, r5, r6, pc}
_02230A90:
	ldr r0, [r5, #0x14]
	adds r6, r6, #1
	adds r4, #0x90
	cmp r6, r0
	blo _02230A7A
_02230A9A:
	bl GF_AssertFail
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov45_02230A6C

	thumb_func_start ov45_02230AA4
ov45_02230AA4: @ 0x02230AA4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02230AAE
	movs r0, #1
	bx lr
_02230AAE:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov45_02230AA4

	thumb_func_start ov45_02230AB4
ov45_02230AB4: @ 0x02230AB4
	ldr r3, _02230ABC @ =FUN_020E5B44
	movs r1, #0
	movs r2, #0x90
	bx r3
	.align 2, 0
_02230ABC: .4byte FUN_020E5B44
	thumb_func_end ov45_02230AB4

	thumb_func_start ov45_02230AC0
ov45_02230AC0: @ 0x02230AC0
	ldr r3, _02230AC8 @ =FUN_020181EC
	adds r0, #0xc
	bx r3
	nop
_02230AC8: .4byte FUN_020181EC
	thumb_func_end ov45_02230AC0

	thumb_func_start ov45_02230ACC
ov45_02230ACC: @ 0x02230ACC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	ldrb r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	beq _02230B5C
	ldr r0, [r5, #4]
	movs r1, #5
	bl FUN_02228188
	adds r4, r0, #0
	ldr r0, [r5, #4]
	movs r1, #8
	bl FUN_02228188
	adds r6, r0, #0
	adds r0, r5, #0
	adds r0, #0x86
	ldrh r0, [r0]
	cmp r0, r6
	bhi _02230B02
	adds r0, r5, #0
	adds r0, #0x84
	ldrb r0, [r0]
	cmp r0, r4
	beq _02230B2E
_02230B02:
	adds r0, r5, #0
	adds r0, #0x84
	ldrb r0, [r0]
	bl ov45_02230DC4
	cmp r0, #1
	bne _02230B28
	ldr r0, [r5, #8]
	bl FUN_02023EF4
	adds r1, r5, #0
	adds r1, #0x85
	strb r0, [r1]
	ldr r0, [r5, #8]
	bl FUN_02023F70
	adds r1, r5, #0
	adds r1, #0x88
	str r0, [r1]
_02230B28:
	adds r0, r5, #0
	adds r0, #0x84
	strb r4, [r0]
_02230B2E:
	ldr r1, _02230B60 @ =0x02254F28
	adds r0, r5, #0
	lsls r2, r4, #2
	adds r0, #0x86
	strh r6, [r0]
	ldr r1, [r1, r2]
	adds r0, r5, #0
	blx r1
	ldr r0, [r5, #4]
	bl FUN_022282F4
	add r2, sp, #0
	strh r0, [r2]
	lsrs r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	add r1, sp, #4
	strh r0, [r2, #4]
	ldrh r0, [r2, #2]
	strh r0, [r2, #6]
	adds r0, r5, #0
	bl ov45_022308C0
_02230B5C:
	add sp, #8
	pop {r4, r5, r6, pc}
	.align 2, 0
_02230B60: .4byte 0x02254F28
	thumb_func_end ov45_02230ACC

	thumb_func_start ov45_02230B64
ov45_02230B64: @ 0x02230B64
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_02228188
	adds r1, r0, #0
	movs r0, #1
	bl ov45_022309C4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023EE0
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02023F40
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02230B64

	thumb_func_start ov45_02230B8C
ov45_02230B8C: @ 0x02230B8C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	movs r1, #6
	bl FUN_02228188
	adds r1, r0, #0
	movs r0, #1
	bl ov45_022309C4
	adds r4, r0, #0
	ldr r0, [r5, #4]
	movs r1, #9
	bl FUN_02228188
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r5, #4]
	movs r1, #8
	bl FUN_02228188
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r6, #0
	movs r2, #8
	bl ov45_022309D0
	adds r6, r0, #0
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02023EE0
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r0, r4
	ldr r0, [r5, #8]
	bne _02230BEC
	movs r1, #0
	bl FUN_02023F40
	ldr r0, [r5, #8]
	adds r5, #0x88
	ldr r1, [r5]
	adds r1, r6, r1
	bl FUN_02023F04
	pop {r4, r5, r6, pc}
_02230BEC:
	movs r1, #0
	bl FUN_02023F40
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_02023F04
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_02230B8C

	thumb_func_start ov45_02230BFC
ov45_02230BFC: @ 0x02230BFC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	movs r1, #8
	bl FUN_02228188
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #4
	bhs _02230C1C
	movs r1, #1
	ldr r0, [r4, #8]
	lsls r1, r1, #0xe
	bl FUN_02023F40
	pop {r4, pc}
_02230C1C:
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_02228188
	adds r1, r0, #0
	movs r0, #1
	bl ov45_022309C4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023EE0
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02023F40
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02230BFC

	thumb_func_start ov45_02230C40
ov45_02230C40: @ 0x02230C40
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	movs r1, #6
	bl FUN_02228188
	adds r1, r0, #0
	movs r0, #0
	bl ov45_022309C4
	adds r4, r0, #0
	ldr r0, [r5, #4]
	movs r1, #9
	bl FUN_02228188
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	ldr r0, [r5, #4]
	movs r1, #8
	bl FUN_02228188
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	adds r0, r6, #0
	movs r2, #4
	bl ov45_022309D0
	adds r6, r0, #0
	ldr r0, [r5, #8]
	adds r1, r4, #0
	bl FUN_02023EE0
	adds r0, r5, #0
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r0, r4
	ldr r0, [r5, #8]
	bne _02230CA0
	movs r1, #0
	bl FUN_02023F40
	ldr r0, [r5, #8]
	adds r5, #0x88
	ldr r1, [r5]
	adds r1, r6, r1
	bl FUN_02023F04
	pop {r4, r5, r6, pc}
_02230CA0:
	movs r1, #0
	bl FUN_02023F40
	ldr r0, [r5, #8]
	adds r1, r6, #0
	bl FUN_02023F04
	pop {r4, r5, r6, pc}
	thumb_func_end ov45_02230C40

	thumb_func_start ov45_02230CB0
ov45_02230CB0: @ 0x02230CB0
	push {r3, lr}
	ldrb r1, [r0]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1c
	bne _02230CD0
	ldrb r1, [r0, #1]
	lsls r2, r1, #0x1f
	lsrs r2, r2, #0x1f
	cmp r2, #1
	bne _02230CD0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x19
	lsls r2, r1, #2
	ldr r1, _02230CD4 @ =0x02254F1C
	ldr r1, [r1, r2]
	blx r1
_02230CD0:
	pop {r3, pc}
	nop
_02230CD4: .4byte 0x02254F1C
	thumb_func_end ov45_02230CB0

	thumb_func_start ov45_02230CD8
ov45_02230CD8: @ 0x02230CD8
	push {r4, lr}
	adds r4, r0, #0
	ldrb r3, [r4, #2]
	movs r0, #0x1e
	lsrs r2, r3, #0x1f
	lsls r1, r3, #0x1e
	subs r1, r1, r2
	rors r1, r0
	adds r0, r2, r1
	bne _02230D08
	ldr r1, _02230D1C @ =0x02254C34
	lsrs r2, r3, #2
	ldrb r1, [r1, r2]
	movs r0, #1
	bl ov45_022309C4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023EE0
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02023F40
_02230D08:
	ldrb r1, [r4, #3]
	ldrb r0, [r4, #2]
	adds r0, r0, r1
	cmp r0, #0x10
	bge _02230D16
	strb r0, [r4, #2]
	pop {r4, pc}
_02230D16:
	movs r0, #0
	strb r0, [r4, #2]
	pop {r4, pc}
	.align 2, 0
_02230D1C: .4byte 0x02254C34
	thumb_func_end ov45_02230CD8

	thumb_func_start ov45_02230D20
ov45_02230D20: @ 0x02230D20
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _02230D5A
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_02228188
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_02228188
	adds r1, r0, #0
	movs r0, #1
	bl ov45_022309C4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023EE0
	movs r1, #1
	ldr r0, [r4, #8]
	lsls r1, r1, #0xe
	bl FUN_02023F40
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
_02230D5A:
	pop {r4, pc}
	thumb_func_end ov45_02230D20

	thumb_func_start ov45_02230D5C
ov45_02230D5C: @ 0x02230D5C
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _02230D8A
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_02228188
	adds r1, r0, #0
	movs r0, #1
	bl ov45_022309C4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023EE0
	movs r1, #1
	ldr r0, [r4, #8]
	lsls r1, r1, #0xe
	bl FUN_02023F40
	b _02230DB0
_02230D8A:
	cmp r0, #4
	bne _02230DB0
	ldr r0, [r4, #4]
	movs r1, #6
	bl FUN_02228188
	adds r1, r0, #0
	movs r0, #1
	bl ov45_022309C4
	adds r1, r0, #0
	ldr r0, [r4, #8]
	bl FUN_02023EE0
	movs r1, #3
	ldr r0, [r4, #8]
	lsls r1, r1, #0xe
	bl FUN_02023F40
_02230DB0:
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	lsrs r2, r0, #0x1f
	lsls r1, r0, #0x1d
	subs r1, r1, r2
	movs r0, #0x1d
	rors r1, r0
	adds r0, r2, r1
	strb r0, [r4, #2]
	pop {r4, pc}
	thumb_func_end ov45_02230D5C

	thumb_func_start ov45_02230DC4
ov45_02230DC4: @ 0x02230DC4
	cmp r0, #0xb
	bhi _02230DF0
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02230DD4: @ jump table
	.2byte _02230DF0 - _02230DD4 - 2 @ case 0
	.2byte _02230DF0 - _02230DD4 - 2 @ case 1
	.2byte _02230DEC - _02230DD4 - 2 @ case 2
	.2byte _02230DEC - _02230DD4 - 2 @ case 3
	.2byte _02230DF0 - _02230DD4 - 2 @ case 4
	.2byte _02230DEC - _02230DD4 - 2 @ case 5
	.2byte _02230DEC - _02230DD4 - 2 @ case 6
	.2byte _02230DF0 - _02230DD4 - 2 @ case 7
	.2byte _02230DF0 - _02230DD4 - 2 @ case 8
	.2byte _02230DF0 - _02230DD4 - 2 @ case 9
	.2byte _02230DEC - _02230DD4 - 2 @ case 10
	.2byte _02230DEC - _02230DD4 - 2 @ case 11
_02230DEC:
	movs r0, #1
	bx lr
_02230DF0:
	movs r0, #0
	bx lr
	thumb_func_end ov45_02230DC4

	thumb_func_start ov45_02230DF4
ov45_02230DF4: @ 0x02230DF4
	push {r4, lr}
	adds r4, r0, #0
	bl ov45_02230AA4
	cmp r0, #0
	beq _02230E24
	ldr r0, [r4, #8]
	bl ov45_02230E78
	cmp r0, #0
	ldrb r1, [r4]
	bne _02230E18
	movs r0, #0x30
	bics r1, r0
	movs r0, #0x10
	orrs r0, r1
	strb r0, [r4]
	b _02230E1E
_02230E18:
	movs r0, #0x30
	bics r1, r0
	strb r1, [r4]
_02230E1E:
	adds r0, r4, #0
	bl ov45_02230E28
_02230E24:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02230DF4

	thumb_func_start ov45_02230E28
ov45_02230E28: @ 0x02230E28
	push {r4, lr}
	adds r4, r0, #0
	ldrb r0, [r4]
	lsls r1, r0, #0x1a
	lsrs r1, r1, #0x1e
	bne _02230E50
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x1e
	cmp r0, #1
	bne _02230E50
	ldr r0, [r4, #8]
	movs r1, #1
	bl FUN_02023EA4
	adds r4, #0xc
	adds r0, r4, #0
	movs r1, #1
	bl FUN_020182A0
	pop {r4, pc}
_02230E50:
	ldr r0, [r4, #8]
	movs r1, #0
	bl FUN_02023EA4
	adds r4, #0xc
	adds r0, r4, #0
	movs r1, #0
	bl FUN_020182A0
	pop {r4, pc}
	thumb_func_end ov45_02230E28

	thumb_func_start ov45_02230E64
ov45_02230E64: @ 0x02230E64
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_02023FDC
	adds r4, #0x8c
	ldr r1, [r4]
	blx FUN_020C3598
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov45_02230E64

	thumb_func_start ov45_02230E78
ov45_02230E78: @ 0x02230E78
	push {r3, r4, r5, r6, lr}
	sub sp, #0x44
	adds r5, r0, #0
	bl FUN_02023F90
	cmp r0, #0
	beq _02230E8C
	adds r4, r0, #0
	adds r4, #0x14
	b _02230E8E
_02230E8C:
	movs r4, #0
_02230E8E:
	adds r0, r5, #0
	bl FUN_02023E68
	adds r3, r0, #0
	ldm r3!, {r0, r1}
	add r2, sp, #0x38
	stm r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0
	str r0, [r2]
	movs r0, #0x1e
	ldrsh r0, [r4, r0]
	strh r0, [r1, #0x24]
	movs r0, #0x20
	ldrsh r2, [r4, r0]
	strh r2, [r1, #0x26]
	ldrsh r0, [r4, r0]
	strh r0, [r1, #0x28]
	ldr r0, [r4, #0x24]
	asrs r0, r0, #0xc
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0x24]
	asrs r0, r0, #0xc
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x24]
	asrs r0, r0, #0xc
	str r0, [sp, #0x34]
	movs r0, #0x18
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r3, #2
	movs r6, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r6
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [sp, #0x38]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [sp, #0x38]
	movs r0, #0x1a
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r3, #2
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r6
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [sp, #0x3c]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [sp, #0x3c]
	movs r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r3, #2
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r6
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [sp, #0x40]
	orrs r1, r0
	adds r0, r2, r1
	str r0, [sp, #0x40]
	movs r0, #0x20
	ldrsh r0, [r4, r0]
	ldr r2, [r4, #0x24]
	asrs r1, r0, #0x1f
	asrs r3, r2, #0x1f
	blx FUN_020F2948
	movs r3, #2
	adds r4, r6, #0
	lsls r3, r3, #0xa
	adds r3, r0, r3
	adcs r1, r4
	lsls r0, r1, #0x14
	lsrs r1, r3, #0xc
	ldr r2, [sp, #0x40]
	orrs r1, r0
	subs r0, r2, r1
	str r0, [sp, #0x40]
	add r0, sp, #0
	blx FUN_020CAFEC
	ldr r1, _02230F8C @ =0x021DA558
	add r0, sp, #0
	blx FUN_020D4928
	ldr r1, _02230F90 @ =0x021DA51C
	movs r0, #0xa4
	ldr r2, [r1, #0x7c]
	bics r2, r0
	adds r0, r5, #0
	str r2, [r1, #0x7c]
	bl FUN_02023E94
	blx FUN_020BF004
	add r0, sp, #0x38
	add r1, sp, #0x24
	bl FUN_0201FA34
	cmp r0, #0
	bne _02230F84
	add sp, #0x44
	adds r0, r6, #0
	pop {r3, r4, r5, r6, pc}
_02230F84:
	movs r0, #1
	add sp, #0x44
	pop {r3, r4, r5, r6, pc}
	nop
_02230F8C: .4byte 0x021DA558
_02230F90: .4byte 0x021DA51C
	thumb_func_end ov45_02230E78

	thumb_func_start ov45_02230F94
ov45_02230F94: @ 0x02230F94
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r3, #0
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x62
	adds r1, r7, #0
	bl FUN_02007688
	add r1, sp, #0xc
	str r1, [sp]
	adds r1, r7, #0
	movs r2, #0xdb
	movs r3, #3
	adds r4, r0, #0
	bl ov45_02231018
	add r0, sp, #8
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl ov45_02231018
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	subs r0, r1, r0
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	movs r0, #0x18
	muls r0, r1, r0
	ldr r1, _02231014 @ =0x0000FFFF
	blx FUN_020F2998
	cmp r0, #0
	bge _02230FE2
	adds r0, #0x18
_02230FE2:
	cmp r0, #0x18
	blt _02230FEE
	movs r1, #0x18
	blx FUN_020F2998
	adds r0, r1, #0
_02230FEE:
	add r2, sp, #4
	movs r1, #0
	str r1, [r2]
	add r1, sp, #4
	strb r0, [r1]
	adds r0, r2, #0
	add r1, sp, #0x30
	bl ov45_0222D524
	adds r0, r4, #0
	bl FUN_0200770C
	ldr r0, [sp, #4]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02231014: .4byte 0x0000FFFF
	thumb_func_end ov45_02230F94

	thumb_func_start ov45_02231018
ov45_02231018: @ 0x02231018
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp, #0xc]
	str r3, [sp, #0x10]
	movs r7, #0
	adds r5, r2, #0
	str r7, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	ldr r3, [sp, #0xc]
	movs r1, #0x12
	adds r2, r7, #0
	str r0, [sp, #8]
	ldr r4, [sp, #0x30]
	bl FUN_02007CAC
	adds r6, r0, #0
	ldr r0, [sp, #0x18]
	movs r1, #6
	blx FUN_020F2BA4
	cmp r5, r0
	blt _0223104A
	bl GF_AssertFail
_0223104A:
	movs r0, #6
	adds r1, r5, #0
	muls r1, r0, r1
	ldrh r0, [r6, r1]
	cmp r0, #2
	beq _02231060
	adds r1, r6, r1
	movs r0, #4
	ldrsh r0, [r1, r0]
	movs r7, #1
	str r0, [r4]
_02231060:
	adds r0, r6, #0
	bl FUN_0201AB0C
	cmp r7, #0
	bne _022310AC
	adds r0, r5, #0
	bl FUN_02091668
	bl FUN_020916F8
	movs r2, #0
	adds r1, r0, #0
	str r2, [sp]
	add r0, sp, #0x14
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0xc]
	bl FUN_02007CAC
	adds r5, r0, #0
	ldr r0, [sp, #0x14]
	lsrs r1, r0, #2
	ldr r0, [sp, #0x10]
	cmp r0, r1
	bge _0223109C
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #2
	ldrsh r0, [r1, r0]
	b _022310A4
_0223109C:
	bl GF_AssertFail
	movs r0, #2
	ldrsh r0, [r5, r0]
_022310A4:
	str r0, [r4]
	adds r0, r5, #0
	bl FUN_0201AB0C
_022310AC:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov45_02231018

	.rodata

_02254A28:
	.byte 0x02, 0x00, 0x50, 0x00, 0x01, 0x00, 0x02, 0x00
	.byte 0x03, 0x00, 0x8E, 0x00, 0x01, 0x00, 0x02, 0x00, 0x04, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x68, 0x01, 0x00, 0x00, 0xD0, 0x02, 0x00, 0x00, 0xB0, 0x04, 0x00, 0x00, 0x18, 0x06, 0x00, 0x00
	.byte 0x80, 0x07, 0x00, 0x00, 0x60, 0x09, 0x00, 0x00, 0xC8, 0x0A, 0x00, 0x00, 0x30, 0x0C, 0x00, 0x00
	.byte 0x9D, 0xBE, 0x22, 0x02, 0x19, 0xBF, 0x22, 0x02, 0x99, 0xBF, 0x22, 0x02, 0xCD, 0xC0, 0x22, 0x02
	.byte 0x31, 0xC1, 0x22, 0x02, 0xED, 0xC1, 0x22, 0x02, 0x6D, 0xC3, 0x22, 0x02, 0x6D, 0xC3, 0x22, 0x02
	.byte 0xA9, 0xC2, 0x22, 0x02, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x07, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x01, 0x00
	.byte 0x0E, 0x00, 0x01, 0x00, 0x23, 0x00, 0x01, 0x00, 0x25, 0x00, 0x01, 0x00, 0x2A, 0x00, 0x01, 0x00
	.byte 0x3F, 0x00, 0x01, 0x00, 0x89, 0xC6, 0x22, 0x02, 0x04, 0x00, 0x00, 0x00, 0x3D, 0xC7, 0x22, 0x02
	.byte 0x04, 0x00, 0x00, 0x00, 0x9D, 0xC7, 0x22, 0x02, 0x04, 0x00, 0x00, 0x00, 0x01, 0xC8, 0x22, 0x02
	.byte 0x04, 0x00, 0x00, 0x00, 0x29, 0xC8, 0x22, 0x02, 0x14, 0x00, 0x00, 0x00, 0x3D, 0xC8, 0x22, 0x02
	.byte 0x04, 0x00, 0x00, 0x00, 0x59, 0xC8, 0x22, 0x02, 0x04, 0x00, 0x00, 0x00, 0x8D, 0xC8, 0x22, 0x02
	.byte 0x04, 0x00, 0x00, 0x00, 0xB5, 0x8C, 0x25, 0x02, 0xA9, 0x8D, 0x25, 0x02, 0xFD, 0x8E, 0x25, 0x02
	.byte 0x2E, 0x00, 0x00, 0x00, 0x01, 0x88, 0x25, 0x02, 0x05, 0x8B, 0x25, 0x02, 0x01, 0x8F, 0x25, 0x02
	.byte 0x59, 0x00, 0x00, 0x00, 0x01, 0x88, 0x25, 0x02, 0x05, 0x8B, 0x25, 0x02, 0x01, 0x8F, 0x25, 0x02
	.byte 0x59, 0x00, 0x00, 0x00, 0x41, 0xC5, 0x25, 0x02, 0x75, 0xC5, 0x25, 0x02, 0xC1, 0xC6, 0x25, 0x02
	.byte 0x5D, 0x00, 0x00, 0x00, 0x01, 0x88, 0x25, 0x02, 0x99, 0x88, 0x25, 0x02, 0xA9, 0x89, 0x25, 0x02
	.byte 0x2F, 0x00, 0x00, 0x00, 0x41, 0xC5, 0x25, 0x02, 0x8D, 0xC5, 0x25, 0x02, 0xED, 0xC9, 0x25, 0x02
	.byte 0x5B, 0x00, 0x00, 0x00, 0x01, 0x88, 0x25, 0x02, 0x2D, 0x89, 0x25, 0x02, 0x39, 0x8C, 0x25, 0x02
	.byte 0x2E, 0x00, 0x00, 0x00, 0x01, 0x88, 0x25, 0x02, 0xC5, 0x88, 0x25, 0x02, 0xFD, 0x89, 0x25, 0x02
	.byte 0x58, 0x00, 0x00, 0x00, 0x01, 0x88, 0x25, 0x02, 0x21, 0x89, 0x25, 0x02, 0xFD, 0x89, 0x25, 0x02
	.byte 0x30, 0x00, 0x00, 0x00, 0xA5, 0x9A, 0x25, 0x02, 0x91, 0x9C, 0x25, 0x02, 0xF9, 0x9E, 0x25, 0x02
	.byte 0x31, 0x00, 0x00, 0x00, 0xB5, 0xCA, 0x25, 0x02, 0xF5, 0xCD, 0x25, 0x02, 0x6D, 0xD3, 0x25, 0x02
	.byte 0x5C, 0x00, 0x00, 0x00, 0x09, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x0A, 0x0B
	.byte 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x00, 0x00, 0x0B, 0x0A, 0x09, 0x00, 0x16, 0x00, 0x18, 0x00
	.byte 0x19, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x17, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x41, 0xE5, 0x22, 0x02, 0x51, 0xE5, 0x22, 0x02
	.byte 0x61, 0xE5, 0x22, 0x02, 0x75, 0xE5, 0x22, 0x02, 0x85, 0xE5, 0x22, 0x02, 0x85, 0xE5, 0x22, 0x02
	.byte 0x99, 0xE5, 0x22, 0x02, 0x9D, 0xE5, 0x22, 0x02, 0xA1, 0xE5, 0x22, 0x02, 0x4D, 0xE1, 0x22, 0x02
	.byte 0xA1, 0xE1, 0x22, 0x02, 0x01, 0xE2, 0x22, 0x02, 0x3D, 0xE3, 0x22, 0x02, 0x9D, 0xE3, 0x22, 0x02
	.byte 0x9D, 0xE3, 0x22, 0x02, 0x15, 0xE4, 0x22, 0x02, 0x85, 0xE4, 0x22, 0x02, 0xA9, 0xE4, 0x22, 0x02
	.byte 0x08, 0x08, 0x04, 0x04, 0x01, 0x02, 0x00, 0x03, 0x18, 0x01, 0x19, 0x01, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x45, 0x80, 0x61, 0x00, 0x46, 0x80
	.byte 0x03, 0x00, 0x02, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x1F, 0x00, 0x24, 0x00
	.byte 0x32, 0x00, 0x2F, 0x00, 0x33, 0x00, 0x30, 0x00, 0x3E, 0x00, 0x1B, 0x00, 0x46, 0x00, 0x21, 0x00
	.byte 0x06, 0x00, 0x05, 0x00, 0x07, 0x00, 0x06, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0E, 0x00
	.byte 0x23, 0x00, 0x26, 0x00, 0x25, 0x00, 0x28, 0x00, 0x2A, 0x00, 0x2B, 0x00, 0x3F, 0x00, 0x1C, 0x00
	.byte 0x1E, 0x01, 0x66, 0x00, 0x1D, 0x01, 0x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0x7F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

	.data

_02254E20:
	.byte 0x25, 0xCF, 0x22, 0x02, 0x1D, 0xD0, 0x22, 0x02, 0xBD, 0xD0, 0x22, 0x02, 0x81, 0xD3, 0x22, 0x02
	.byte 0x81, 0xD3, 0x22, 0x02, 0x31, 0xD1, 0x22, 0x02, 0x9D, 0xD1, 0x22, 0x02, 0x3D, 0xD2, 0x22, 0x02
	.byte 0xE5, 0xD2, 0x22, 0x02, 0x11, 0xD4, 0x22, 0x02, 0x11, 0xD4, 0x22, 0x02, 0xC1, 0xD4, 0x22, 0x02
	.byte 0xC1, 0xD4, 0x22, 0x02, 0x41, 0xCF, 0x22, 0x02, 0x29, 0xD0, 0x22, 0x02, 0xC9, 0xD0, 0x22, 0x02
	.byte 0xB1, 0xD3, 0x22, 0x02, 0xC5, 0xD3, 0x22, 0x02, 0x3D, 0xD1, 0x22, 0x02, 0xB1, 0xD1, 0x22, 0x02
	.byte 0x51, 0xD2, 0x22, 0x02, 0xF9, 0xD2, 0x22, 0x02, 0x1D, 0xD4, 0x22, 0x02, 0x29, 0xD4, 0x22, 0x02
	.byte 0xCD, 0xD4, 0x22, 0x02, 0xCD, 0xD4, 0x22, 0x02, 0x01, 0xCF, 0x22, 0x02, 0xF5, 0xCF, 0x22, 0x02
	.byte 0x79, 0xD0, 0x22, 0x02, 0x55, 0xD3, 0x22, 0x02, 0x55, 0xD3, 0x22, 0x02, 0xFD, 0xD0, 0x22, 0x02
	.byte 0x65, 0xD1, 0x22, 0x02, 0x0D, 0xD2, 0x22, 0x02, 0xAD, 0xD2, 0x22, 0x02, 0xD9, 0xD3, 0x22, 0x02
	.byte 0xD9, 0xD3, 0x22, 0x02, 0x4D, 0xD4, 0x22, 0x02, 0x85, 0xD4, 0x22, 0x02, 0x69, 0xCF, 0x22, 0x02
	.byte 0x55, 0xD0, 0x22, 0x02, 0xD9, 0xD0, 0x22, 0x02, 0x8D, 0xD3, 0x22, 0x02, 0x8D, 0xD3, 0x22, 0x02
	.byte 0x4D, 0xD1, 0x22, 0x02, 0xDD, 0xD1, 0x22, 0x02, 0x7D, 0xD2, 0x22, 0x02, 0x25, 0xD3, 0x22, 0x02
	.byte 0x49, 0xD4, 0x22, 0x02, 0x49, 0xD4, 0x22, 0x02, 0xDD, 0xD4, 0x22, 0x02, 0xDD, 0xD4, 0x22, 0x02
	.byte 0xF4, 0x4E, 0x25, 0x02, 0x62, 0x5F, 0x6C, 0x62, 0x79, 0x5F, 0x77, 0x6C, 0x64, 0x64, 0x61, 0x74
	.byte 0x61, 0x00, 0x00, 0x00, 0x70, 0x6F, 0x6B, 0x65, 0x6D, 0x6F, 0x6E, 0x70, 0x6C, 0x61, 0x74, 0x64
	.byte 0x73, 0x00, 0x00, 0x00, 0x49, 0x49, 0x75, 0x70, 0x37, 0x33, 0x00, 0x00, 0xD9, 0x0C, 0x23, 0x02
	.byte 0x21, 0x0D, 0x23, 0x02, 0x5D, 0x0D, 0x23, 0x02, 0x65, 0x0B, 0x23, 0x02, 0xFD, 0x0B, 0x23, 0x02
	.byte 0x8D, 0x0B, 0x23, 0x02, 0x41, 0x0C, 0x23, 0x02, 0x65, 0x0B, 0x23, 0x02, 0x8D, 0x0B, 0x23, 0x02
	.byte 0x8D, 0x0B, 0x23, 0x02, 0x8D, 0x0B, 0x23, 0x02, 0x8D, 0x0B, 0x23, 0x02, 0x8D, 0x0B, 0x23, 0x02
	.byte 0x8D, 0x0B, 0x23, 0x02, 0x00, 0x00, 0x00, 0x00

	.bss

_022577C0:
	.space 0x4
