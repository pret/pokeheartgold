
	thumb_func_start ov102_021E7740
ov102_021E7740: @ 0x021E7740
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #0
	beq _021E7752
	cmp r1, #1
	beq _021E778A
	b _021E77B2
_021E7752:
	movs r1, #0
	movs r0, #0x3e
	adds r2, r1, #0
	bl FUN_02004EC4
	movs r2, #2
	movs r0, #3
	movs r1, #0x22
	lsls r2, r2, #0xe
	bl FUN_0201A910
	movs r2, #0xa
	movs r0, #3
	movs r1, #0x23
	lsls r2, r2, #0xe
	bl FUN_0201A910
	adds r0, r5, #0
	bl ov102_021E7888
	ldr r0, [r0, #0x14]
	movs r1, #0
	bl ov102_021E940C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E77B2
_021E778A:
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E77B2
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E77A8
	ldr r0, [r4, #0x14]
	bl ov102_021EA238
	b _021E77AA
_021E77A8:
	movs r0, #0
_021E77AA:
	adds r4, #0x6a
	strb r0, [r4]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E77B2:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E7740

	thumb_func_start ov102_021E77B8
ov102_021E77B8: @ 0x021E77B8
	push {r4, lr}
	bl FUN_02007290
	adds r4, r0, #0
	ldr r0, _021E77F4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	strh r1, [r4, #0x30]
	ldr r1, [r0, #0x44]
	strh r1, [r4, #0x32]
	ldr r0, [r0, #0x4c]
	strh r0, [r4, #0x34]
	ldr r0, [r4, #0x40]
	bl FUN_02026CC4
	ldr r2, [r4, #0x2c]
	cmp r2, #0
	beq _021E77E6
	adds r0, r4, #0
	adds r4, #0x28
	adds r1, r4, #0
	blx r2
	movs r0, #0
	pop {r4, pc}
_021E77E6:
	adds r1, r4, #0
	ldr r2, [r4, #0x20]
	adds r0, r4, #0
	adds r1, #0x1c
	blx r2
	pop {r4, pc}
	nop
_021E77F4: .4byte 0x021D110C
	thumb_func_end ov102_021E77B8

	thumb_func_start ov102_021E77F8
ov102_021E77F8: @ 0x021E77F8
	push {r4, lr}
	adds r4, r2, #0
	cmp r1, #3
	bhi _021E7860
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E780C: @ jump table
	.2byte _021E7814 - _021E780C - 2 @ case 0
	.2byte _021E7834 - _021E780C - 2 @ case 1
	.2byte _021E7856 - _021E780C - 2 @ case 2
	.2byte _021E7834 - _021E780C - 2 @ case 3
_021E7814:
	str r0, [r4, #0x38]
	cmp r0, #2
	beq _021E7820
	cmp r0, #3
	beq _021E782A
	pop {r4, pc}
_021E7820:
	ldr r0, [r4, #0x14]
	movs r1, #0x1c
	bl ov102_021E940C
	pop {r4, pc}
_021E782A:
	ldr r0, [r4, #0x14]
	movs r1, #0x1d
	bl ov102_021E940C
	pop {r4, pc}
_021E7834:
	cmp r0, #2
	beq _021E783E
	cmp r0, #3
	beq _021E7848
	b _021E7850
_021E783E:
	ldr r0, [r4, #0x14]
	movs r1, #0x1e
	bl ov102_021E940C
	b _021E7850
_021E7848:
	ldr r0, [r4, #0x14]
	movs r1, #0x1f
	bl ov102_021E940C
_021E7850:
	movs r0, #4
	str r0, [r4, #0x38]
	pop {r4, pc}
_021E7856:
	subs r1, r0, #2
	cmp r1, #1
	bhi _021E7864
	str r0, [r4, #0x38]
	pop {r4, pc}
_021E7860:
	movs r0, #4
	str r0, [r4, #0x38]
_021E7864:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021E77F8

	thumb_func_start ov102_021E7868
ov102_021E7868: @ 0x021E7868
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02007290
	adds r1, r4, #0
	bl ov102_021E7A24
	movs r0, #0x22
	bl FUN_0201A9C4
	movs r0, #0x23
	bl FUN_0201A9C4
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021E7868

	thumb_func_start ov102_021E7888
ov102_021E7888: @ 0x021E7888
	push {r3, r4, r5, lr}
	movs r1, #0x7c
	movs r2, #0x22
	adds r5, r0, #0
	bl FUN_02007280
	movs r1, #0
	movs r2, #0x7c
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r5, #0
	bl FUN_020072A4
	str r0, [r4]
	bl FUN_02090D70
	str r0, [r4, #4]
	ldr r0, [r4]
	bl FUN_02090E44
	str r0, [r4, #0x74]
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4]
	adds r1, #0x10
	adds r2, #8
	bl FUN_02090D8C
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E78D4
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x64
	adds r1, #8
	bl ov102_021E7934
_021E78D4:
	ldr r1, [r4]
	movs r0, #0x22
	bl FUN_02091880
	str r0, [r4, #0x18]
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl ov102_021E909C
	str r0, [r4, #0x14]
	movs r0, #0x22
	str r0, [sp]
	ldr r0, _021E7924 @ =0x021EC648
	ldr r2, _021E7928 @ =ov102_021E77F8
	movs r1, #5
	adds r3, r4, #0
	bl FUN_02026C44
	str r0, [r4, #0x40]
	movs r1, #0
	str r1, [r4, #0x44]
	adds r0, r4, #0
	str r1, [r4, #0x48]
	adds r0, #0x6b
	strb r1, [r0]
	str r1, [r4, #0x2c]
	adds r0, r4, #0
	str r1, [r4, #0x28]
	adds r0, #0x4e
	strh r1, [r0]
	ldr r1, _021E792C @ =ov102_021E7AA4
	adds r0, r4, #0
	bl ov102_021E7A4C
	ldr r1, _021E7930 @ =ov102_021E8D60
	adds r0, r4, #0
	bl ov102_021E8D50
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7924: .4byte 0x021EC648
_021E7928: .4byte ov102_021E77F8
_021E792C: .4byte ov102_021E7AA4
_021E7930: .4byte ov102_021E8D60
	thumb_func_end ov102_021E7888

	thumb_func_start ov102_021E7934
ov102_021E7934: @ 0x021E7934
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_020159E4
	strh r0, [r5]
	movs r0, #0x14
	strb r0, [r5, #3]
	adds r0, r4, #0
	bl FUN_020159E8
	movs r6, #0
	strb r0, [r5, #2]
	adds r4, r5, #4
	adds r0, r6, #0
	movs r1, #3
_021E7956:
	ldrsb r3, [r4, r0]
	ldrsb r2, [r5, r1]
	adds r6, r6, #1
	adds r2, r3, r2
	strb r2, [r4]
	cmp r6, #5
	blt _021E7956
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov102_021E7934

	thumb_func_start ov102_021E7968
ov102_021E7968: @ 0x021E7968
	adds r2, r0, #0
	movs r0, #2
	ldrsb r3, [r2, r0]
	adds r3, r3, #1
	strb r3, [r2, #2]
	ldrsb r3, [r2, r0]
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r3, r0
	blt _021E798E
	movs r3, #0
	strb r3, [r2, #2]
	ldrsh r0, [r2, r3]
	adds r0, r0, #1
	strh r0, [r2]
	ldrsh r0, [r2, r3]
	cmp r0, #5
	blt _021E798E
	strh r3, [r2]
_021E798E:
	adds r0, r1, #0
	movs r1, #0
	movs r3, #2
	ldrsh r1, [r2, r1]
	ldrsb r2, [r2, r3]
	ldr r3, _021E799C @ =FUN_02015A44
	bx r3
	.align 2, 0
_021E799C: .4byte FUN_02015A44
	thumb_func_end ov102_021E7968

	thumb_func_start ov102_021E79A0
ov102_021E79A0: @ 0x021E79A0
	adds r2, r0, #0
	movs r0, #2
	ldrsb r3, [r2, r0]
	subs r3, r3, #1
	strb r3, [r2, #2]
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bge _021E79CA
	movs r0, #0
	ldrsh r3, [r2, r0]
	subs r3, r3, #1
	strh r3, [r2]
	ldrsh r0, [r2, r0]
	cmp r0, #0
	bge _021E79C2
	movs r0, #4
	strh r0, [r2]
_021E79C2:
	movs r0, #3
	ldrsb r0, [r2, r0]
	subs r0, r0, #1
	strb r0, [r2, #2]
_021E79CA:
	adds r0, r1, #0
	movs r1, #0
	movs r3, #2
	ldrsh r1, [r2, r1]
	ldrsb r2, [r2, r3]
	ldr r3, _021E79D8 @ =FUN_02015A44
	bx r3
	.align 2, 0
_021E79D8: .4byte FUN_02015A44
	thumb_func_end ov102_021E79A0

	thumb_func_start ov102_021E79DC
ov102_021E79DC: @ 0x021E79DC
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	movs r1, #3
	adds r6, r2, #0
	ldrsb r1, [r5, r1]
	adds r0, r6, #0
	blx FUN_020F2998
	strb r1, [r5, #2]
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r6, #0
	blx FUN_020F2998
	strh r0, [r5]
	movs r1, #0
	movs r2, #2
	ldrsh r1, [r5, r1]
	ldrsb r2, [r5, r2]
	adds r0, r4, #0
	bl FUN_02015A44
	pop {r4, r5, r6, pc}
	thumb_func_end ov102_021E79DC

	thumb_func_start ov102_021E7A0C
ov102_021E7A0C: @ 0x021E7A0C
	movs r1, #2
	ldrsb r3, [r0, r1]
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r1, #3
	ldrsb r0, [r0, r1]
	muls r0, r2, r0
	adds r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E7A0C

	thumb_func_start ov102_021E7A24
ov102_021E7A24: @ 0x021E7A24
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, [r5]
	ldr r1, [r5, #0x74]
	bl FUN_02090E5C
	ldr r0, [r5, #0x40]
	bl FUN_02026CAC
	ldr r0, [r5, #0x14]
	bl ov102_021E9144
	ldr r0, [r5, #0x18]
	bl FUN_020918C0
	adds r0, r4, #0
	bl FUN_02007294
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E7A24

	thumb_func_start ov102_021E7A4C
ov102_021E7A4C: @ 0x021E7A4C
	str r1, [r0, #0x20]
	movs r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #0x78]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E7A4C

	thumb_func_start ov102_021E7A58
ov102_021E7A58: @ 0x021E7A58
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x74]
	cmp r0, #1
	bne _021E7A80
	bl FUN_0202534C
	cmp r0, #0
	beq _021E7A6E
	movs r0, #0
	pop {r4, pc}
_021E7A6E:
	ldr r0, _021E7AA0 @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E7A9C
	movs r0, #4
	str r0, [r4, #0x38]
	movs r0, #0
	str r0, [r4, #0x74]
	pop {r4, pc}
_021E7A80:
	ldr r0, _021E7AA0 @ =0x021D110C
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _021E7A8C
	movs r0, #0
	pop {r4, pc}
_021E7A8C:
	bl FUN_0202534C
	cmp r0, #0
	beq _021E7A9C
	movs r0, #1
	str r0, [r4, #0x74]
	movs r0, #0
	pop {r4, pc}
_021E7A9C:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E7AA0: .4byte 0x021D110C
	thumb_func_end ov102_021E7A58

	thumb_func_start ov102_021E7AA4
ov102_021E7AA4: @ 0x021E7AA4
	push {r3, lr}
	ldr r2, [r0, #4]
	lsls r3, r2, #2
	ldr r2, _021E7AB4 @ =0x021EC5E8
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	nop
_021E7AB4: .4byte 0x021EC5E8
	thumb_func_end ov102_021E7AA4

	thumb_func_start ov102_021E7AB8
ov102_021E7AB8: @ 0x021E7AB8
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #3
	bhi _021E7B10
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E7ACC: @ jump table
	.2byte _021E7AE8 - _021E7ACC - 2 @ case 0
	.2byte _021E7ADE - _021E7ACC - 2 @ case 1
	.2byte _021E7AD4 - _021E7ACC - 2 @ case 2
	.2byte _021E7B02 - _021E7ACC - 2 @ case 3
_021E7AD4:
	ldr r0, _021E7B14 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #2
	pop {r4, pc}
_021E7ADE:
	ldr r0, _021E7B14 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #1
	pop {r4, pc}
_021E7AE8:
	ldr r0, _021E7B14 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x50
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #9
	bl ov102_021E940C
	movs r0, #4
	pop {r4, pc}
_021E7B02:
	ldr r0, _021E7B14 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
_021E7B10:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E7B14: .4byte 0x000005DC
	thumb_func_end ov102_021E7AB8

	thumb_func_start ov102_021E7B18
ov102_021E7B18: @ 0x021E7B18
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x30]
	movs r1, #2
	adds r3, r2, #0
	tst r3, r1
	beq _021E7B3C
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	adds r0, r4, #0
	movs r1, #2
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7B3C:
	movs r1, #1
	adds r3, r2, #0
	tst r3, r1
	beq _021E7B4E
	adds r4, #0x4c
	ldrh r1, [r4]
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7B4E:
	movs r3, #8
	tst r3, r2
	beq _021E7B60
	adds r4, #0x4c
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7B60:
	movs r3, #0x80
	tst r3, r2
	beq _021E7B88
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	cmp r1, #2
	bne _021E7B74
	movs r0, #0
	pop {r4, pc}
_021E7B74:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	adds r4, #0x4c
	adds r1, r1, #1
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7B88:
	movs r3, #0x40
	tst r3, r2
	beq _021E7BB0
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	cmp r1, #0
	bne _021E7B9C
	movs r0, #0
	pop {r4, pc}
_021E7B9C:
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	adds r4, #0x4c
	subs r1, r1, #1
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7BB0:
	ldr r3, [r4, #4]
	cmp r3, #0
	bne _021E7BBA
	movs r0, #0
	pop {r4, pc}
_021E7BBA:
	movs r3, #0x30
	tst r2, r3
	beq _021E7BD4
	adds r2, r4, #0
	adds r2, #0x4e
	ldrh r2, [r2]
	adds r4, #0x4e
	eors r1, r2
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7BD4:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov102_021E7B18

	thumb_func_start ov102_021E7BD8
ov102_021E7BD8: @ 0x021E7BD8
	ldr r3, _021E7BE0 @ =FUN_02025224
	ldr r0, _021E7BE4 @ =0x021EC610
	bx r3
	nop
_021E7BE0: .4byte FUN_02025224
_021E7BE4: .4byte 0x021EC610
	thumb_func_end ov102_021E7BD8

	thumb_func_start ov102_021E7BE8
ov102_021E7BE8: @ 0x021E7BE8
	ldr r3, _021E7BF0 @ =FUN_02025224
	ldr r0, _021E7BF4 @ =0x021EC620
	bx r3
	nop
_021E7BF0: .4byte FUN_02025224
_021E7BF4: .4byte 0x021EC620
	thumb_func_end ov102_021E7BE8

	thumb_func_start ov102_021E7BF8
ov102_021E7BF8: @ 0x021E7BF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _021E7C08
	bl ov102_021E7BD8
	b _021E7C0C
_021E7C08:
	bl ov102_021E7BE8
_021E7C0C:
	cmp r0, #3
	bhi _021E7C80
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E7C1C: @ jump table
	.2byte _021E7C24 - _021E7C1C - 2 @ case 0
	.2byte _021E7C3E - _021E7C1C - 2 @ case 1
	.2byte _021E7C58 - _021E7C1C - 2 @ case 2
	.2byte _021E7C58 - _021E7C1C - 2 @ case 3
_021E7C24:
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	adds r0, r4, #0
	movs r1, #1
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7C3E:
	adds r0, r4, #0
	movs r1, #2
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	adds r0, r4, #0
	movs r1, #2
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7C58:
	adds r1, r4, #0
	movs r2, #0
	adds r1, #0x50
	strh r2, [r1]
	subs r1, r0, #2
	adds r0, r4, #0
	adds r0, #0x4e
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	strh r2, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	adds r0, r4, #0
	movs r1, #0
	bl ov102_021E7AB8
	pop {r4, pc}
_021E7C80:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov102_021E7BF8

	thumb_func_start ov102_021E7C84
ov102_021E7C84: @ 0x021E7C84
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #4
	bhi _021E7CFA
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E7C9C: @ jump table
	.2byte _021E7CA6 - _021E7C9C - 2 @ case 0
	.2byte _021E7CCA - _021E7C9C - 2 @ case 1
	.2byte _021E7CD6 - _021E7C9C - 2 @ case 2
	.2byte _021E7CE2 - _021E7C9C - 2 @ case 3
	.2byte _021E7CE8 - _021E7C9C - 2 @ case 4
_021E7CA6:
	ldr r0, [r5, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E7CFA
	ldr r0, [r5, #0x74]
	cmp r0, #0
	bne _021E7CC0
	adds r0, r5, #0
	bl ov102_021E7B18
	str r0, [r4]
	b _021E7CFA
_021E7CC0:
	adds r0, r5, #0
	bl ov102_021E7BF8
	str r0, [r4]
	b _021E7CFA
_021E7CCA:
	movs r1, #3
	str r1, [r4]
	ldr r1, _021E7D00 @ =ov102_021E8D94
	bl ov102_021E8D50
	b _021E7CFA
_021E7CD6:
	movs r1, #3
	str r1, [r4]
	ldr r1, _021E7D04 @ =ov102_021E8E84
	bl ov102_021E8D50
	b _021E7CFA
_021E7CE2:
	movs r0, #0
	str r0, [r4]
	b _021E7CFA
_021E7CE8:
	ldr r0, [r5, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E7CFA
	ldr r1, _021E7D08 @ =ov102_021E8240
	adds r0, r5, #0
	bl ov102_021E7A4C
_021E7CFA:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E7D00: .4byte ov102_021E8D94
_021E7D04: .4byte ov102_021E8E84
_021E7D08: .4byte ov102_021E8240
	thumb_func_end ov102_021E7C84

	thumb_func_start ov102_021E7D0C
ov102_021E7D0C: @ 0x021E7D0C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #0
	bne _021E7D24
	bl ov102_021E7A58
	cmp r0, #0
	beq _021E7D24
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7D24:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021E7C84
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E7D0C

	thumb_func_start ov102_021E7D30
ov102_021E7D30: @ 0x021E7D30
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #4
	bhi _021E7DB4
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E7D44: @ jump table
	.2byte _021E7D62 - _021E7D44 - 2 @ case 0
	.2byte _021E7D58 - _021E7D44 - 2 @ case 1
	.2byte _021E7D4E - _021E7D44 - 2 @ case 2
	.2byte _021E7D8A - _021E7D44 - 2 @ case 3
	.2byte _021E7D9A - _021E7D44 - 2 @ case 4
_021E7D4E:
	ldr r0, _021E7DB8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #4
	pop {r4, pc}
_021E7D58:
	ldr r0, _021E7DB8 @ =0x000005DC
	bl FUN_0200604C
	movs r0, #3
	pop {r4, pc}
_021E7D62:
	ldr r0, [r4, #0x14]
	bl ov102_021EA238
	cmp r0, #0
	bne _021E7D70
	movs r0, #1
	pop {r4, pc}
_021E7D70:
	ldr r0, _021E7DB8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x50
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #9
	bl ov102_021E940C
	movs r0, #6
	pop {r4, pc}
_021E7D8A:
	ldr r0, _021E7DB8 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	b _021E7DB4
_021E7D9A:
	ldr r0, _021E7DB8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4e
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #3
	bl ov102_021E940C
	movs r0, #2
	pop {r4, pc}
_021E7DB4:
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
_021E7DB8: .4byte 0x000005DC
	thumb_func_end ov102_021E7D30

	thumb_func_start ov102_021E7DBC
ov102_021E7DBC: @ 0x021E7DBC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #0x30]
	movs r1, #2
	adds r3, r2, #0
	tst r3, r1
	beq _021E7DE0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	adds r0, r4, #0
	movs r1, #2
	bl ov102_021E7D30
	pop {r4, pc}
_021E7DE0:
	movs r1, #1
	adds r3, r2, #0
	tst r3, r1
	beq _021E7DF2
	adds r4, #0x4c
	ldrh r1, [r4]
	bl ov102_021E7D30
	pop {r4, pc}
_021E7DF2:
	movs r3, #0x40
	tst r3, r2
	beq _021E7E42
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	cmp r1, #0
	beq _021E7E16
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	adds r4, #0x4c
	subs r1, r1, #1
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7D30
	pop {r4, pc}
_021E7E16:
	adds r1, r4, #0
	adds r1, #0x6a
	ldrb r1, [r1]
	cmp r1, #0
	beq _021E7E3E
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	cmp r1, #0
	beq _021E7E3E
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	adds r4, #0x4e
	subs r1, r1, #1
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7D30
	pop {r4, pc}
_021E7E3E:
	movs r0, #1
	pop {r4, pc}
_021E7E42:
	movs r3, #0x80
	tst r2, r3
	beq _021E7EAE
	adds r2, r4, #0
	adds r2, #0x4c
	ldrh r2, [r2]
	cmp r2, #0
	bne _021E7E92
	adds r1, r4, #0
	adds r1, #0x6a
	ldrb r1, [r1]
	cmp r1, #2
	bne _021E7E7A
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	cmp r1, #0
	bne _021E7E7A
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	adds r4, #0x4e
	adds r1, r1, #1
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7D30
	pop {r4, pc}
_021E7E7A:
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	adds r1, r0, #1
	adds r0, r4, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #3
	bl ov102_021E7D30
	pop {r4, pc}
_021E7E92:
	cmp r2, #1
	bne _021E7EAA
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r1, [r1]
	adds r4, #0x4c
	adds r1, r1, #1
	strh r1, [r4]
	movs r1, #3
	bl ov102_021E7D30
	pop {r4, pc}
_021E7EAA:
	adds r0, r1, #0
	pop {r4, pc}
_021E7EAE:
	ldrh r2, [r4, #0x34]
	movs r0, #0x20
	tst r0, r2
	beq _021E7ECC
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x64
	adds r1, #8
	bl ov102_021E79A0
	adds r0, r4, #0
	movs r1, #4
	bl ov102_021E7D30
	pop {r4, pc}
_021E7ECC:
	movs r0, #0x10
	tst r0, r2
	beq _021E7EE8
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x64
	adds r1, #8
	bl ov102_021E7968
	adds r0, r4, #0
	movs r1, #4
	bl ov102_021E7D30
	pop {r4, pc}
_021E7EE8:
	adds r0, r1, #0
	pop {r4, pc}
	thumb_func_end ov102_021E7DBC

	thumb_func_start ov102_021E7EEC
ov102_021E7EEC: @ 0x021E7EEC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021E7EFE
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7EFE:
	ldr r0, _021E7F2C @ =0x021D114C
	ldrh r2, [r0, #0x20]
	adds r1, r2, #0
	subs r1, #0xa
	cmp r5, r1
	blt _021E7F10
	adds r2, #0xa
	cmp r5, r2
	ble _021E7F14
_021E7F10:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7F14:
	ldrh r1, [r0, #0x22]
	adds r0, r1, #0
	subs r0, #0xc
	cmp r4, r0
	blt _021E7F24
	adds r1, #0xc
	cmp r4, r1
	ble _021E7F28
_021E7F24:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7F28:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7F2C: .4byte 0x021D114C
	thumb_func_end ov102_021E7EEC

	thumb_func_start ov102_021E7F30
ov102_021E7F30: @ 0x021E7F30
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	adds r4, r2, #0
	bl FUN_0202534C
	cmp r0, #0
	bne _021E7F42
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7F42:
	cmp r5, #0x12
	blt _021E7F4A
	cmp r5, #0xec
	ble _021E7F4E
_021E7F4A:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7F4E:
	ldr r0, _021E7F68 @ =0x021D114C
	ldrh r1, [r0, #0x22]
	adds r0, r1, #0
	subs r0, #0x18
	cmp r4, r0
	blt _021E7F60
	adds r1, #0x18
	cmp r4, r1
	ble _021E7F64
_021E7F60:
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E7F64:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E7F68: .4byte 0x021D114C
	thumb_func_end ov102_021E7F30

	thumb_func_start ov102_021E7F6C
ov102_021E7F6C: @ 0x021E7F6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	bl ov102_021EA228
	add r1, sp, #0
	adds r1, #2
	add r2, sp, #0
	adds r6, r0, #0
	bl FUN_0200DE00
	adds r0, r5, #0
	adds r0, #0x6c
	ldrb r0, [r0]
	cmp r0, #0
	beq _021E8020
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r5, #0
	bl ov102_021E7F30
	cmp r0, #0
	bne _021E7FAE
	movs r0, #0
	adds r5, #0x6c
	strb r0, [r5]
	add sp, #8
	subs r0, r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E7FAE:
	ldr r1, _021E80B0 @ =0x021D114C
	movs r0, #0x20
	ldrsh r4, [r1, r0]
	cmp r4, #0x1c
	bge _021E7FBC
	movs r4, #0x1c
	b _021E7FC2
_021E7FBC:
	cmp r4, #0xe2
	ble _021E7FC2
	movs r4, #0xe2
_021E7FC2:
	movs r0, #0x6e
	ldrsh r0, [r5, r0]
	subs r0, r4, r0
	bpl _021E7FCC
	rsbs r0, r0, #0
_021E7FCC:
	cmp r0, #2
	bge _021E7FD8
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E7FD8:
	add r3, sp, #0
	movs r2, #0
	ldrsh r2, [r3, r2]
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0200DD88
	adds r0, r5, #0
	adds r0, #0x6e
	strh r4, [r0]
	subs r4, #0x1c
	adds r0, r5, #0
	lsrs r2, r4, #0x1f
	adds r2, r4, r2
	lsls r2, r2, #0x17
	movs r1, #0
	adds r0, #0x4e
	strh r1, [r0]
	adds r0, r5, #0
	adds r1, r5, #0
	adds r0, #0x64
	adds r1, #8
	lsrs r2, r2, #0x18
	bl ov102_021E79DC
	ldr r0, _021E80B4 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #3
	bl ov102_021E940C
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E8020:
	bl FUN_02025358
	cmp r0, #0
	bne _021E8030
	movs r0, #0
	add sp, #8
	mvns r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E8030:
	add r3, sp, #0
	movs r1, #2
	movs r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	adds r0, r5, #0
	bl ov102_021E7EEC
	cmp r0, #0
	beq _021E8060
	ldr r0, _021E80B0 @ =0x021D114C
	ldrh r1, [r0, #0x20]
	adds r0, r5, #0
	adds r0, #0x6e
	strh r1, [r0]
	movs r0, #1
	adds r5, #0x6c
	strb r0, [r5]
	ldr r0, _021E80B4 @ =0x000005DC
	bl FUN_0200604C
	add sp, #8
	movs r0, #6
	pop {r3, r4, r5, r6, r7, pc}
_021E8060:
	ldr r0, _021E80B8 @ =0x021EC634
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E80AC
	ldr r0, [r5, #0x14]
	bl ov102_021EA238
	adds r6, r0, #0
	movs r4, #0
	cmp r6, #0
	ble _021E80A8
	add r7, sp, #4
_021E807E:
	lsls r2, r4, #0x18
	ldr r0, [r5, #0x14]
	adds r1, r7, #0
	lsrs r2, r2, #0x18
	bl ov102_021EA248
	ldr r1, _021E80B0 @ =0x021D114C
	ldr r2, _021E80B0 @ =0x021D114C
	ldrh r1, [r1, #0x20]
	ldrh r2, [r2, #0x22]
	adds r0, r7, #0
	bl FUN_020253F0
	cmp r0, #0
	beq _021E80A2
	add sp, #8
	adds r0, r4, #4
	pop {r3, r4, r5, r6, r7, pc}
_021E80A2:
	adds r4, r4, #1
	cmp r4, r6
	blt _021E807E
_021E80A8:
	movs r0, #0
	mvns r0, r0
_021E80AC:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E80B0: .4byte 0x021D114C
_021E80B4: .4byte 0x000005DC
_021E80B8: .4byte 0x021EC634
	thumb_func_end ov102_021E7F6C

	thumb_func_start ov102_021E80BC
ov102_021E80BC: @ 0x021E80BC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl ov102_021E7F6C
	adds r5, r0, #0
	cmp r5, #6
	bhi _021E8170
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E80D6: @ jump table
	.2byte _021E80E4 - _021E80D6 - 2 @ case 0
	.2byte _021E80E4 - _021E80D6 - 2 @ case 1
	.2byte _021E8106 - _021E80D6 - 2 @ case 2
	.2byte _021E8106 - _021E80D6 - 2 @ case 3
	.2byte _021E813E - _021E80D6 - 2 @ case 4
	.2byte _021E813E - _021E80D6 - 2 @ case 5
	.2byte _021E8160 - _021E80D6 - 2 @ case 6
_021E80E4:
	ldr r0, _021E8174 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	adds r1, r5, #1
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	adds r0, r4, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	bl ov102_021E7D30
	pop {r3, r4, r5, pc}
_021E8106:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	cmp r5, #2
	bne _021E8128
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x64
	adds r1, #8
	bl ov102_021E79A0
	b _021E8134
_021E8128:
	adds r0, r4, #0
	adds r1, r4, #0
	adds r0, #0x64
	adds r1, #8
	bl ov102_021E7968
_021E8134:
	adds r0, r4, #0
	movs r1, #4
	bl ov102_021E7D30
	pop {r3, r4, r5, pc}
_021E813E:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4c
	strh r1, [r0]
	adds r0, r4, #0
	subs r1, r5, #4
	adds r0, #0x4e
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
	adds r0, r4, #0
	movs r1, #0
	bl ov102_021E7D30
	pop {r3, r4, r5, pc}
_021E8160:
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x4c
	strh r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xf
	bl ov102_021E940C
_021E8170:
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8174: .4byte 0x000005DC
	thumb_func_end ov102_021E80BC

	thumb_func_start ov102_021E8178
ov102_021E8178: @ 0x021E8178
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	adds r5, r0, #0
	cmp r1, #6
	bhi _021E820A
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E8190: @ jump table
	.2byte _021E819E - _021E8190 - 2 @ case 0
	.2byte _021E81AE - _021E8190 - 2 @ case 1
	.2byte _021E81C8 - _021E8190 - 2 @ case 2
	.2byte _021E81DA - _021E8190 - 2 @ case 3
	.2byte _021E81E6 - _021E8190 - 2 @ case 4
	.2byte _021E81F2 - _021E8190 - 2 @ case 5
	.2byte _021E81F8 - _021E8190 - 2 @ case 6
_021E819E:
	ldr r0, [r5, #0x14]
	bl ov102_021EA238
	adds r1, r5, #0
	adds r1, #0x6a
	strb r0, [r1]
	movs r0, #1
	str r0, [r4]
_021E81AE:
	ldr r0, [r5, #0x74]
	cmp r0, #0
	bne _021E81BE
	adds r0, r5, #0
	bl ov102_021E7DBC
	str r0, [r4]
	b _021E820A
_021E81BE:
	adds r0, r5, #0
	bl ov102_021E80BC
	str r0, [r4]
	b _021E820A
_021E81C8:
	ldr r0, [r5, #0x14]
	movs r1, #3
	bl ov102_021E947C
	cmp r0, #0
	beq _021E820A
	movs r0, #0
	str r0, [r4]
	b _021E820A
_021E81DA:
	movs r1, #5
	str r1, [r4]
	ldr r1, _021E8210 @ =ov102_021E8D94
	bl ov102_021E8D50
	b _021E820A
_021E81E6:
	movs r1, #5
	str r1, [r4]
	ldr r1, _021E8214 @ =ov102_021E8E84
	bl ov102_021E8D50
	b _021E820A
_021E81F2:
	movs r0, #1
	str r0, [r4]
	b _021E820A
_021E81F8:
	ldr r0, [r5, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E820A
	ldr r1, _021E8218 @ =ov102_021E8240
	adds r0, r5, #0
	bl ov102_021E7A4C
_021E820A:
	movs r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E8210: .4byte ov102_021E8D94
_021E8214: .4byte ov102_021E8E84
_021E8218: .4byte ov102_021E8240
	thumb_func_end ov102_021E8178

	thumb_func_start ov102_021E821C
ov102_021E821C: @ 0x021E821C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r2, [r4]
	adds r5, r0, #0
	cmp r2, #1
	bhi _021E8234
	bl ov102_021E7A58
	cmp r0, #0
	beq _021E8234
	movs r0, #0
	pop {r3, r4, r5, pc}
_021E8234:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021E8178
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E821C

	thumb_func_start ov102_021E8240
ov102_021E8240: @ 0x021E8240
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8256
	cmp r0, #1
	beq _021E826C
	cmp r0, #2
	beq _021E8280
	b _021E8290
_021E8256:
	ldr r0, [r5, #0x14]
	movs r1, #0x12
	bl ov102_021E947C
	cmp r0, #0
	beq _021E8290
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021E8580
	b _021E8290
_021E826C:
	ldr r0, [r5, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E8290
	ldr r1, [r5, #0x24]
	adds r0, r5, #0
	bl ov102_021E7A4C
	b _021E8290
_021E8280:
	ldr r0, [r5, #0x14]
	movs r1, #0x1b
	bl ov102_021E947C
	cmp r0, #0
	beq _021E8290
	movs r0, #0
	str r0, [r4]
_021E8290:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E8240

	thumb_func_start ov102_021E8294
ov102_021E8294: @ 0x021E8294
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r1, [r5, #0x38]
	cmp r1, #0
	bne _021E82A8
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E82BE
_021E82A8:
	cmp r1, #1
	bne _021E82B6
	adds r0, r5, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #1
	bne _021E82BE
_021E82B6:
	ldrh r0, [r5, #0x30]
	movs r1, #4
	tst r1, r0
	beq _021E82EE
_021E82BE:
	ldr r0, _021E8388 @ =0x000005E4
	bl FUN_0200604C
	movs r0, #4
	str r0, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x6b
	ldrb r1, [r0]
	movs r0, #1
	eors r1, r0
	adds r0, r5, #0
	adds r0, #0x6b
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x50
	strh r1, [r0]
	ldr r0, [r5, #0x14]
	movs r1, #0x1b
	bl ov102_021E940C
	movs r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E82EE:
	movs r1, #2
	tst r1, r0
	beq _021E830C
	ldr r0, _021E838C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0xa
	bl ov102_021E940C
	ldr r0, _021E8390 @ =ov102_021E7AA4
	str r0, [r5, #0x24]
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E830C:
	movs r1, #1
	tst r0, r1
	beq _021E836E
	adds r0, r5, #0
	adds r0, #0x50
	ldrh r2, [r0]
	cmp r2, #0xfe
	bne _021E8334
	ldr r0, _021E838C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0xa
	bl ov102_021E940C
	ldr r0, _021E8390 @ =ov102_021E7AA4
	str r0, [r5, #0x24]
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8334:
	adds r1, r5, #0
	adds r1, #0x6b
	ldrb r1, [r1]
	ldr r0, [r5, #0x18]
	bl ov102_021E85A8
	cmp r0, #0
	beq _021E8366
	ldr r0, _021E838C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0x54
	adds r1, r5, #0
	bl ov102_021E874C
	ldr r0, _021E8394 @ =ov102_021E87B4
	movs r1, #0xb
	str r0, [r5, #0x24]
	ldr r0, [r5, #0x14]
	bl ov102_021E940C
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8366:
	ldr r0, _021E8398 @ =0x000005F2
	bl FUN_0200604C
	pop {r3, r4, r5, pc}
_021E836E:
	adds r0, r5, #0
	bl ov102_021E85E8
	cmp r0, #0
	beq _021E8386
	ldr r0, _021E838C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0x11
	bl ov102_021E940C
_021E8386:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8388: .4byte 0x000005E4
_021E838C: .4byte 0x000005DC
_021E8390: .4byte ov102_021E7AA4
_021E8394: .4byte ov102_021E87B4
_021E8398: .4byte 0x000005F2
	thumb_func_end ov102_021E8294

	thumb_func_start ov102_021E839C
ov102_021E839C: @ 0x021E839C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _021E83E0 @ =0x021EC600
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _021E83B2
	movs r0, #0
	pop {r4, pc}
_021E83B2:
	cmp r0, #0
	beq _021E83C0
	cmp r0, #1
	beq _021E83C4
	cmp r0, #2
	beq _021E83D0
	b _021E83DC
_021E83C0:
	movs r0, #1
	pop {r4, pc}
_021E83C4:
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #0
	bne _021E83DC
	movs r0, #0
	pop {r4, pc}
_021E83D0:
	adds r4, #0x6b
	ldrb r0, [r4]
	cmp r0, #1
	bne _021E83DC
	movs r0, #0
	pop {r4, pc}
_021E83DC:
	movs r0, #2
	pop {r4, pc}
	.align 2, 0
_021E83E0: .4byte 0x021EC600
	thumb_func_end ov102_021E839C

	thumb_func_start ov102_021E83E4
ov102_021E83E4: @ 0x021E83E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	bl FUN_02025358
	cmp r0, #0
	bne _021E83F8
	movs r0, #0
	add sp, #0xc
	mvns r0, r0
	pop {r4, r5, r6, r7, pc}
_021E83F8:
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #0x38
	ldr r7, _021E8454 @ =0x021D114C
	str r0, [sp]
	add r6, sp, #8
_021E8404:
	ldr r0, [sp]
	movs r4, #0
	strb r0, [r6]
	ldrb r0, [r6]
	movs r5, #0xc
	adds r0, #0x10
	strb r0, [r6, #1]
_021E8412:
	strb r5, [r6, #2]
	ldrb r0, [r6, #2]
	adds r0, #0x48
	strb r0, [r6, #3]
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, sp, #8
	bl FUN_020253F0
	cmp r0, #0
	beq _021E8434
	ldr r0, [sp, #4]
	add sp, #0xc
	lsls r1, r0, #1
	adds r0, r0, r1
	adds r0, r4, r0
	pop {r4, r5, r6, r7, pc}
_021E8434:
	adds r4, r4, #1
	adds r5, #0x50
	cmp r4, #3
	blt _021E8412
	ldr r0, [sp]
	adds r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #4]
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #4
	blt _021E8404
	movs r0, #0
	mvns r0, r0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E8454: .4byte 0x021D114C
	thumb_func_end ov102_021E83E4

	thumb_func_start ov102_021E8458
ov102_021E8458: @ 0x021E8458
	push {r3, lr}
	ldr r0, _021E8484 @ =0x021EC5E0
	bl FUN_02025224
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _021E8480
	ldr r1, _021E8488 @ =0x021D114C
	ldrh r0, [r1, #0x20]
	ldrh r1, [r1, #0x22]
	subs r0, #0x14
	subs r1, #0x40
	lsls r0, r0, #0x10
	lsls r1, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	bl ov102_021EC5A0
	adds r1, r0, #0
_021E8480:
	adds r0, r1, #0
	pop {r3, pc}
	.align 2, 0
_021E8484: .4byte 0x021EC5E0
_021E8488: .4byte 0x021D114C
	thumb_func_end ov102_021E8458

	thumb_func_start ov102_021E848C
ov102_021E848C: @ 0x021E848C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov102_021E839C
	cmp r0, #1
	beq _021E84A0
	cmp r0, #2
	beq _021E84B8
	b _021E84E4
_021E84A0:
	ldr r0, _021E856C @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0xa
	bl ov102_021E940C
	ldr r0, _021E8570 @ =ov102_021E7AA4
	str r0, [r5, #0x24]
	movs r0, #1
	str r0, [r4]
	pop {r4, r5, r6, pc}
_021E84B8:
	ldr r0, _021E8574 @ =0x000005E4
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0x6b
	ldrb r1, [r0]
	movs r0, #1
	eors r1, r0
	adds r0, r5, #0
	adds r0, #0x6b
	strb r1, [r0]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x50
	strh r1, [r0]
	ldr r0, [r5, #0x14]
	movs r1, #0x1b
	bl ov102_021E940C
	movs r0, #2
	str r0, [r4]
	pop {r4, r5, r6, pc}
_021E84E4:
	adds r0, r5, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	bne _021E851C
	adds r0, r5, #0
	bl ov102_021E83E4
	adds r6, r0, #0
	bmi _021E8568
	adds r1, r5, #0
	adds r1, #0x6b
	ldrb r1, [r1]
	lsls r2, r6, #0x10
	ldr r0, [r5, #0x18]
	lsrs r2, r2, #0x10
	bl ov102_021E85A8
	cmp r0, #0
	bne _021E8514
	ldr r0, _021E8578 @ =0x000005F2
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
_021E8514:
	adds r0, r5, #0
	adds r0, #0x50
	strh r6, [r0]
	b _021E8548
_021E851C:
	adds r0, r5, #0
	bl ov102_021E8458
	adds r6, r0, #0
	bmi _021E8568
	adds r1, r5, #0
	adds r1, #0x6b
	ldrb r1, [r1]
	lsls r2, r6, #0x10
	ldr r0, [r5, #0x18]
	lsrs r2, r2, #0x10
	bl ov102_021E85A8
	cmp r0, #0
	bne _021E8542
	ldr r0, _021E8578 @ =0x000005F2
	bl FUN_0200604C
	pop {r4, r5, r6, pc}
_021E8542:
	adds r0, r5, #0
	adds r0, #0x50
	strh r6, [r0]
_021E8548:
	ldr r0, _021E856C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	adds r0, #0x54
	adds r1, r5, #0
	bl ov102_021E874C
	ldr r0, _021E857C @ =ov102_021E87B4
	movs r1, #0xb
	str r0, [r5, #0x24]
	ldr r0, [r5, #0x14]
	bl ov102_021E940C
	movs r0, #1
	str r0, [r4]
_021E8568:
	pop {r4, r5, r6, pc}
	nop
_021E856C: .4byte 0x000005DC
_021E8570: .4byte ov102_021E7AA4
_021E8574: .4byte 0x000005E4
_021E8578: .4byte 0x000005F2
_021E857C: .4byte ov102_021E87B4
	thumb_func_end ov102_021E848C

	thumb_func_start ov102_021E8580
ov102_021E8580: @ 0x021E8580
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov102_021E7A58
	cmp r0, #0
	bne _021E85A6
	ldr r0, [r5, #0x74]
	cmp r0, #0
	bne _021E859E
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021E8294
	pop {r3, r4, r5, pc}
_021E859E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021E848C
_021E85A6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E8580

	thumb_func_start ov102_021E85A8
ov102_021E85A8: @ 0x021E85A8
	push {r3, lr}
	ldr r3, _021E85E4 @ =0x0000FF02
	adds r3, r2, r3
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	cmp r3, #1
	bhi _021E85BA
	movs r0, #0
	pop {r3, pc}
_021E85BA:
	cmp r1, #0
	bne _021E85D0
	adds r1, r2, #0
	bl FUN_02091C38
	cmp r0, #0
	beq _021E85CC
	movs r0, #1
	pop {r3, pc}
_021E85CC:
	movs r0, #0
	pop {r3, pc}
_021E85D0:
	adds r1, r2, #0
	bl FUN_02091C74
	cmp r0, #0
	beq _021E85DE
	movs r0, #1
	pop {r3, pc}
_021E85DE:
	movs r0, #0
	pop {r3, pc}
	nop
_021E85E4: .4byte 0x0000FF02
	thumb_func_end ov102_021E85A8

	thumb_func_start ov102_021E85E8
ov102_021E85E8: @ 0x021E85E8
	push {r3, lr}
	adds r1, r0, #0
	adds r1, #0x6b
	ldrb r1, [r1]
	lsls r2, r1, #2
	ldr r1, _021E85FC @ =_021EC5D8
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_021E85FC: .4byte _021EC5D8
	thumb_func_end ov102_021E85E8

	thumb_func_start ov102_021E8600
ov102_021E8600: @ 0x021E8600
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	ldrh r2, [r0]
	adds r1, r2, #0
	cmp r2, #0xfe
	bne _021E8610
	movs r1, #0xc
_021E8610:
	cmp r2, #0xfe
	beq _021E866C
	adds r0, r4, #0
	adds r0, #0x52
	strh r2, [r0]
	ldrh r0, [r4, #0x34]
	movs r2, #0x40
	tst r2, r0
	beq _021E8630
	ldr r0, _021E86A8 @ =0x021EC65C
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	adds r4, #0x50
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E8630:
	movs r2, #0x80
	tst r2, r0
	beq _021E8644
	ldr r0, _021E86AC @ =0x021EC65D
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	adds r4, #0x50
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E8644:
	movs r2, #0x20
	tst r2, r0
	beq _021E8658
	ldr r0, _021E86B0 @ =0x021EC65E
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	adds r4, #0x50
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E8658:
	movs r2, #0x10
	tst r0, r2
	beq _021E86A4
	ldr r0, _021E86B4 @ =0x021EC65F
	lsls r1, r1, #2
	ldrb r0, [r0, r1]
	adds r4, #0x50
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E866C:
	ldrh r1, [r4, #0x34]
	movs r0, #0x40
	tst r0, r1
	beq _021E868A
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	movs r1, #3
	blx FUN_020F2998
	adds r1, #9
	adds r4, #0x50
	strh r1, [r4]
	movs r0, #1
	pop {r4, pc}
_021E868A:
	movs r0, #0x80
	tst r0, r1
	beq _021E86A4
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	movs r1, #3
	blx FUN_020F2998
	adds r4, #0x50
	strh r1, [r4]
	movs r0, #1
	pop {r4, pc}
_021E86A4:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_021E86A8: .4byte 0x021EC65C
_021E86AC: .4byte 0x021EC65D
_021E86B0: .4byte 0x021EC65E
_021E86B4: .4byte 0x021EC65F
	thumb_func_end ov102_021E8600

	thumb_func_start ov102_021E86B8
ov102_021E86B8: @ 0x021E86B8
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #0xfe
	beq _021E8716
	ldrh r1, [r4, #0x34]
	movs r3, #0x40
	movs r2, #0xff
	tst r3, r1
	beq _021E86D6
	bl ov102_021EC4F8
	adds r2, r0, #0
	b _021E86FE
_021E86D6:
	movs r3, #0x80
	tst r3, r1
	beq _021E86E4
	bl ov102_021EC514
	adds r2, r0, #0
	b _021E86FE
_021E86E4:
	movs r3, #0x10
	tst r3, r1
	beq _021E86F2
	bl ov102_021EC54C
	adds r2, r0, #0
	b _021E86FE
_021E86F2:
	movs r3, #0x20
	tst r1, r3
	beq _021E86FE
	bl ov102_021EC530
	adds r2, r0, #0
_021E86FE:
	cmp r2, #0xff
	beq _021E8748
	adds r0, r4, #0
	adds r0, #0x50
	ldrh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x52
	strh r1, [r0]
	adds r4, #0x50
	strh r2, [r4]
	movs r0, #1
	pop {r4, pc}
_021E8716:
	ldrh r1, [r4, #0x34]
	movs r0, #0x40
	tst r0, r1
	beq _021E8730
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	bl ov102_021EC584
	adds r4, #0x50
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E8730:
	movs r0, #0x80
	tst r0, r1
	beq _021E8748
	adds r0, r4, #0
	adds r0, #0x52
	ldrh r0, [r0]
	bl ov102_021EC568
	adds r4, #0x50
	strh r0, [r4]
	movs r0, #1
	pop {r4, pc}
_021E8748:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov102_021E86B8

	thumb_func_start ov102_021E874C
ov102_021E874C: @ 0x021E874C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	adds r0, r1, #0
	bl ov102_021E8FD8
	strh r0, [r4, #4]
	movs r1, #0
	str r1, [r4, #8]
	ldr r0, _021E8788 @ =0x0000FFFF
	strh r1, [r4, #0xc]
	strh r0, [r4, #0xe]
	ldrh r2, [r4, #4]
	cmp r2, #0xa
	bls _021E8784
	adds r1, r2, #0
	subs r1, #0xa
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r1, r0, #1
	movs r0, #1
	ands r0, r2
	adds r0, r1, r0
	strh r0, [r4, #2]
	pop {r4, pc}
_021E8784:
	strh r1, [r4, #2]
	pop {r4, pc}
	.align 2, 0
_021E8788: .4byte 0x0000FFFF
	thumb_func_end ov102_021E874C

	thumb_func_start ov102_021E878C
ov102_021E878C: @ 0x021E878C
	ldrb r1, [r0, #6]
	ldrb r0, [r0, #7]
	lsls r0, r0, #1
	adds r0, r1, r0
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E878C

	thumb_func_start ov102_021E8798
ov102_021E8798: @ 0x021E8798
	push {r4, lr}
	adds r4, r0, #0
	bl ov102_021E878C
	ldrh r1, [r4]
	lsls r1, r1, #1
	adds r0, r1, r0
	pop {r4, pc}
	thumb_func_end ov102_021E8798

	thumb_func_start ov102_021E87A8
ov102_021E87A8: @ 0x021E87A8
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov102_021E87A8

	thumb_func_start ov102_021E87AC
ov102_021E87AC: @ 0x021E87AC
	ldrh r0, [r0]
	bx lr
	thumb_func_end ov102_021E87AC

	thumb_func_start ov102_021E87B0
ov102_021E87B0: @ 0x021E87B0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end ov102_021E87B0

	thumb_func_start ov102_021E87B4
ov102_021E87B4: @ 0x021E87B4
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r2, [r5]
	adds r4, r0, #0
	cmp r2, #3
	bhi _021E881C
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_021E87CC: @ jump table
	.2byte _021E87D4 - _021E87CC - 2 @ case 0
	.2byte _021E87DA - _021E87CC - 2 @ case 1
	.2byte _021E87EC - _021E87CC - 2 @ case 2
	.2byte _021E8806 - _021E87CC - 2 @ case 3
_021E87D4:
	bl ov102_021E8B18
	b _021E881C
_021E87DA:
	ldr r0, [r4, #0x14]
	movs r1, #0x13
	bl ov102_021E947C
	cmp r0, #0
	beq _021E881C
	movs r0, #0
	str r0, [r5]
	b _021E881C
_021E87EC:
	ldr r0, [r4, #0x14]
	movs r1, #0x13
	bl ov102_021E947C
	cmp r0, #0
	beq _021E881C
	ldr r0, [r4, #0x14]
	movs r1, #0x12
	bl ov102_021E940C
	movs r0, #0
	str r0, [r5]
	b _021E881C
_021E8806:
	ldr r0, [r4, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E881C
	ldr r1, [r4, #0x24]
	adds r0, r4, #0
	bl ov102_021E7A4C
	movs r0, #0
	str r0, [r5]
_021E881C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E87B4

	thumb_func_start ov102_021E8820
ov102_021E8820: @ 0x021E8820
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x38]
	adds r4, r1, #0
	cmp r0, #0
	bne _021E8836
	adds r1, r5, #0
	adds r1, #0x6b
	ldrb r1, [r1]
	cmp r1, #0
	bne _021E884C
_021E8836:
	cmp r0, #1
	bne _021E8844
	adds r1, r5, #0
	adds r1, #0x6b
	ldrb r1, [r1]
	cmp r1, #1
	bne _021E884C
_021E8844:
	ldrh r2, [r5, #0x30]
	movs r1, #4
	tst r1, r2
	beq _021E8880
_021E884C:
	ldr r0, _021E8958 @ =0x000005E4
	bl FUN_0200604C
	movs r0, #4
	str r0, [r5, #0x38]
	adds r0, r5, #0
	movs r1, #0
	adds r0, #0x50
	strh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x6b
	ldrb r1, [r0]
	movs r0, #1
	eors r1, r0
	adds r0, r5, #0
	adds r0, #0x6b
	strb r1, [r0]
	ldr r0, [r5, #0x14]
	movs r1, #0xc
	bl ov102_021E940C
	ldr r0, _021E895C @ =ov102_021E8240
	str r0, [r5, #0x24]
	movs r0, #3
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8880:
	cmp r0, #2
	bne _021E888E
	adds r0, r5, #0
	adds r0, #0x54
	bl ov102_021E8C3C
	b _021E88A6
_021E888E:
	cmp r0, #3
	bne _021E889C
	adds r0, r5, #0
	adds r0, #0x54
	bl ov102_021E8C64
	b _021E88A6
_021E889C:
	ldrh r1, [r5, #0x34]
	adds r0, r5, #0
	adds r0, #0x54
	bl ov102_021E8B40
_021E88A6:
	cmp r0, #1
	beq _021E88B4
	cmp r0, #2
	beq _021E88C4
	cmp r0, #3
	beq _021E88D8
	b _021E88EC
_021E88B4:
	ldr r0, _021E8960 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0x12
	bl ov102_021E940C
	pop {r3, r4, r5, pc}
_021E88C4:
	ldr r0, _021E8960 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0x13
	bl ov102_021E940C
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E88D8:
	ldr r0, _021E8960 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0x13
	bl ov102_021E940C
	movs r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E88EC:
	ldrh r1, [r5, #0x30]
	movs r0, #2
	tst r0, r1
	beq _021E890C
	ldr r0, _021E8960 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0xc
	bl ov102_021E940C
	ldr r0, _021E895C @ =ov102_021E8240
	str r0, [r5, #0x24]
	movs r0, #3
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E890C:
	movs r0, #1
	tst r0, r1
	beq _021E8956
	adds r0, r5, #0
	adds r0, #0x60
	ldrh r0, [r0]
	cmp r0, #0
	ldr r0, _021E8960 @ =0x000005DC
	beq _021E8934
	bl FUN_0200604C
	ldr r0, [r5, #0x14]
	movs r1, #0xc
	bl ov102_021E940C
	ldr r0, _021E895C @ =ov102_021E8240
	str r0, [r5, #0x24]
	movs r0, #3
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8934:
	bl FUN_0200604C
	adds r0, r5, #0
	ldr r1, _021E8964 @ =0x0000FFFF
	adds r0, #0x62
	strh r1, [r0]
	adds r0, r5, #0
	bl ov102_021E8CA4
	ldr r0, _021E8968 @ =ov102_021E7AA4
	movs r1, #0xd
	str r0, [r5, #0x24]
	ldr r0, [r5, #0x14]
	bl ov102_021E940C
	movs r0, #3
	str r0, [r4]
_021E8956:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8958: .4byte 0x000005E4
_021E895C: .4byte ov102_021E8240
_021E8960: .4byte 0x000005DC
_021E8964: .4byte 0x0000FFFF
_021E8968: .4byte ov102_021E7AA4
	thumb_func_end ov102_021E8820

	thumb_func_start ov102_021E896C
ov102_021E896C: @ 0x021E896C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	bl FUN_02025358
	cmp r0, #0
	bne _021E8980
	add sp, #0x10
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E8980:
	ldr r0, _021E8A2C @ =0x021EC5F4
	bl FUN_02025224
	cmp r0, #0
	beq _021E8990
	cmp r0, #1
	beq _021E899C
	b _021E89A8
_021E8990:
	adds r7, #0x54
	adds r0, r7, #0
	bl ov102_021E8C3C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E899C:
	adds r7, #0x54
	adds r0, r7, #0
	bl ov102_021E8C64
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E89A8:
	adds r0, r7, #0
	adds r0, #0x54
	ldrh r0, [r0]
	lsls r0, r0, #0x11
	lsrs r4, r0, #0x10
	movs r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0x30
	str r0, [sp]
_021E89BC:
	ldr r1, [sp]
	add r0, sp, #0xc
	strb r1, [r0]
	ldrb r1, [r0]
	movs r6, #0
	movs r5, #0x20
	adds r1, #0x10
	strb r1, [r0, #1]
_021E89CC:
	add r0, sp, #0xc
	strb r5, [r0, #2]
	ldrb r1, [r0, #2]
	ldr r2, _021E8A30 @ =0x021D114C
	adds r1, #0x48
	strb r1, [r0, #3]
	ldr r1, _021E8A30 @ =0x021D114C
	ldrh r2, [r2, #0x22]
	ldrh r1, [r1, #0x20]
	add r0, sp, #0xc
	bl FUN_020253F0
	cmp r0, #0
	beq _021E89F2
	adds r7, #0x62
	add sp, #0x10
	strh r4, [r7]
	movs r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_021E89F2:
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	adds r0, r7, #0
	adds r0, #0x58
	ldrh r0, [r0]
	cmp r4, r0
	blo _021E8A08
	movs r0, #1
	str r0, [sp, #4]
	b _021E8A10
_021E8A08:
	adds r6, r6, #1
	adds r5, #0x68
	cmp r6, #2
	blt _021E89CC
_021E8A10:
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _021E8A26
	ldr r0, [sp]
	adds r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #8]
	adds r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #5
	blt _021E89BC
_021E8A26:
	movs r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021E8A2C: .4byte 0x021EC5F4
_021E8A30: .4byte 0x021D114C
	thumb_func_end ov102_021E896C

	thumb_func_start ov102_021E8A34
ov102_021E8A34: @ 0x021E8A34
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl ov102_021E839C
	cmp r0, #1
	beq _021E8A48
	cmp r0, #2
	beq _021E8A60
	b _021E8A90
_021E8A48:
	ldr r0, _021E8B08 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x14]
	movs r1, #0xc
	bl ov102_021E940C
	ldr r0, _021E8B0C @ =ov102_021E8240
	str r0, [r4, #0x24]
	movs r0, #3
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8A60:
	ldr r0, _021E8B10 @ =0x000005E4
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0x50
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x6b
	ldrb r1, [r0]
	movs r0, #1
	eors r1, r0
	adds r0, r4, #0
	adds r0, #0x6b
	strb r1, [r0]
	ldr r0, [r4, #0x14]
	movs r1, #0xc
	bl ov102_021E940C
	ldr r0, _021E8B0C @ =ov102_021E8240
	str r0, [r4, #0x24]
	movs r0, #3
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8A90:
	adds r0, r4, #0
	bl ov102_021E896C
	cmp r0, #5
	bhi _021E8B06
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E8AA6: @ jump table
	.2byte _021E8B06 - _021E8AA6 - 2 @ case 0
	.2byte _021E8AD0 - _021E8AA6 - 2 @ case 1
	.2byte _021E8AE0 - _021E8AA6 - 2 @ case 2
	.2byte _021E8AF4 - _021E8AA6 - 2 @ case 3
	.2byte _021E8B06 - _021E8AA6 - 2 @ case 4
	.2byte _021E8AB2 - _021E8AA6 - 2 @ case 5
_021E8AB2:
	ldr r0, _021E8B08 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	bl ov102_021E8CA4
	ldr r0, _021E8B14 @ =ov102_021E7AA4
	movs r1, #0xd
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x14]
	bl ov102_021E940C
	movs r0, #3
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8AD0:
	ldr r0, _021E8B08 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x14]
	movs r1, #0x12
	bl ov102_021E940C
	pop {r3, r4, r5, pc}
_021E8AE0:
	ldr r0, _021E8B08 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x14]
	movs r1, #0x13
	bl ov102_021E940C
	movs r0, #1
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8AF4:
	ldr r0, _021E8B08 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r4, #0x14]
	movs r1, #0x13
	bl ov102_021E940C
	movs r0, #2
	str r0, [r5]
_021E8B06:
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E8B08: .4byte 0x000005DC
_021E8B0C: .4byte ov102_021E8240
_021E8B10: .4byte 0x000005E4
_021E8B14: .4byte ov102_021E7AA4
	thumb_func_end ov102_021E8A34

	thumb_func_start ov102_021E8B18
ov102_021E8B18: @ 0x021E8B18
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl ov102_021E7A58
	cmp r0, #0
	bne _021E8B3E
	ldr r0, [r5, #0x74]
	cmp r0, #0
	bne _021E8B36
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021E8820
	pop {r3, r4, r5, pc}
_021E8B36:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021E8A34
_021E8B3E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E8B18

	thumb_func_start ov102_021E8B40
ov102_021E8B40: @ 0x021E8B40
	push {r3, r4, r5, lr}
	movs r2, #0x80
	adds r4, r0, #0
	tst r2, r1
	beq _021E8BB8
	ldrh r1, [r4, #0xc]
	cmp r1, #0
	beq _021E8B54
	movs r0, #4
	pop {r3, r4, r5, pc}
_021E8B54:
	ldrb r1, [r4, #7]
	cmp r1, #4
	bhs _021E8B8A
	adds r1, r1, #1
	strb r1, [r4, #7]
	bl ov102_021E8798
	ldrh r1, [r4, #4]
	cmp r0, r1
	bhs _021E8B6C
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E8B6C:
	cmp r0, r1
	bne _021E8B7E
	movs r1, #1
	tst r0, r1
	beq _021E8B7E
	movs r0, #0
	strb r0, [r4, #6]
	adds r0, r1, #0
	pop {r3, r4, r5, pc}
_021E8B7E:
	ldrb r0, [r4, #7]
	subs r0, r0, #1
	strb r0, [r4, #7]
	movs r0, #1
	strh r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_021E8B8A:
	ldrh r2, [r4]
	ldrh r1, [r4, #2]
	cmp r2, r1
	bhs _021E8BB2
	movs r1, #1
	str r1, [r4, #8]
	ldrh r1, [r4]
	adds r1, r1, #1
	strh r1, [r4]
	bl ov102_021E8798
	ldrh r1, [r4, #4]
	cmp r0, r1
	bhs _021E8BAA
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E8BAA:
	movs r0, #0
	strb r0, [r4, #6]
	movs r0, #3
	pop {r3, r4, r5, pc}
_021E8BB2:
	movs r0, #1
	strh r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_021E8BB8:
	movs r5, #0x40
	adds r2, r1, #0
	tst r2, r5
	beq _021E8BF4
	ldrh r0, [r4, #0xc]
	cmp r0, #0
	beq _021E8BCE
	movs r0, #0
	strh r0, [r4, #0xc]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E8BCE:
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _021E8BDC
	subs r0, r0, #1
	strb r0, [r4, #7]
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E8BDC:
	ldrh r0, [r4]
	cmp r0, #0
	beq _021E8BF0
	subs r5, #0x41
	str r5, [r4, #8]
	ldrh r0, [r4]
	subs r0, r0, #1
	strh r0, [r4]
	movs r0, #2
	pop {r3, r4, r5, pc}
_021E8BF0:
	movs r0, #4
	pop {r3, r4, r5, pc}
_021E8BF4:
	movs r3, #0x30
	adds r2, r1, #0
	tst r2, r3
	beq _021E8C1E
	ldrb r2, [r4, #6]
	movs r1, #1
	eors r1, r2
	strb r1, [r4, #6]
	bl ov102_021E8798
	ldrh r1, [r4, #4]
	cmp r0, r1
	bhs _021E8C12
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E8C12:
	ldrb r1, [r4, #6]
	movs r0, #1
	eors r0, r1
	strb r0, [r4, #6]
	movs r0, #4
	pop {r3, r4, r5, pc}
_021E8C1E:
	lsls r2, r5, #3
	tst r2, r1
	beq _021E8C2A
	bl ov102_021E8C3C
	pop {r3, r4, r5, pc}
_021E8C2A:
	adds r3, #0xd0
	tst r1, r3
	beq _021E8C36
	bl ov102_021E8C64
	pop {r3, r4, r5, pc}
_021E8C36:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E8B40

	thumb_func_start ov102_021E8C3C
ov102_021E8C3C: @ 0x021E8C3C
	ldrh r1, [r0]
	cmp r1, #0
	beq _021E8C5E
	cmp r1, #5
	blo _021E8C52
	subs r1, r1, #5
	strh r1, [r0]
	movs r1, #4
	mvns r1, r1
	str r1, [r0, #8]
	b _021E8C5A
_021E8C52:
	rsbs r1, r1, #0
	str r1, [r0, #8]
	movs r1, #0
	strh r1, [r0]
_021E8C5A:
	movs r0, #2
	bx lr
_021E8C5E:
	movs r0, #4
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E8C3C

	thumb_func_start ov102_021E8C64
ov102_021E8C64: @ 0x021E8C64
	push {r4, lr}
	adds r4, r0, #0
	ldrh r2, [r4, #2]
	ldrh r1, [r4]
	cmp r1, r2
	bhs _021E8CA0
	adds r0, r1, #5
	cmp r0, r2
	bgt _021E8C80
	movs r0, #5
	str r0, [r4, #8]
	ldrh r0, [r4]
	adds r0, r0, #5
	b _021E8C86
_021E8C80:
	subs r0, r2, r1
	str r0, [r4, #8]
	ldrh r0, [r4, #2]
_021E8C86:
	strh r0, [r4]
	adds r0, r4, #0
	bl ov102_021E8798
	ldrh r1, [r4, #4]
	cmp r0, r1
	bhs _021E8C98
	movs r0, #2
	pop {r4, pc}
_021E8C98:
	movs r0, #0
	strb r0, [r4, #6]
	movs r0, #3
	pop {r4, pc}
_021E8CA0:
	movs r0, #4
	pop {r4, pc}
	thumb_func_end ov102_021E8C64

	thumb_func_start ov102_021E8CA4
ov102_021E8CA4: @ 0x021E8CA4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x62
	ldrh r2, [r0]
	ldr r0, _021E8D18 @ =0x0000FFFF
	cmp r2, r0
	bne _021E8CBC
	adds r0, r4, #0
	adds r0, #0x54
	bl ov102_021E8798
	adds r2, r0, #0
_021E8CBC:
	adds r0, r4, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	ldr r0, [r4, #0x18]
	bne _021E8CD4
	adds r1, r4, #0
	adds r1, #0x50
	ldrh r1, [r1]
	bl FUN_02091C60
	b _021E8CDE
_021E8CD4:
	adds r1, r4, #0
	adds r1, #0x50
	ldrh r1, [r1]
	bl FUN_02091CAC
_021E8CDE:
	adds r2, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021E8CF0
	cmp r0, #1
	beq _021E8CF4
	cmp r0, #2
	beq _021E8D02
	b _021E8D10
_021E8CF0:
	strh r2, [r4, #0x10]
	b _021E8D10
_021E8CF4:
	adds r0, r4, #0
	adds r0, #0x4e
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r4, r0
	strh r2, [r0, #0x10]
	b _021E8D10
_021E8D02:
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	adds r0, r4, #0
	adds r0, #8
	bl FUN_02015A5C
_021E8D10:
	adds r0, r4, #0
	bl ov102_021E8F14
	pop {r4, pc}
	.align 2, 0
_021E8D18: .4byte 0x0000FFFF
	thumb_func_end ov102_021E8CA4

	thumb_func_start ov102_021E8D1C
ov102_021E8D1C: @ 0x021E8D1C
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _021E8D2C
	cmp r1, #1
	beq _021E8D3C
	b _021E8D4A
_021E8D2C:
	ldr r0, [r0, #0x14]
	movs r1, #1
	bl ov102_021E940C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _021E8D4A
_021E8D3C:
	ldr r0, [r0, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E8D4A
	movs r0, #1
	pop {r4, pc}
_021E8D4A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021E8D1C

	thumb_func_start ov102_021E8D50
ov102_021E8D50: @ 0x021E8D50
	str r1, [r0, #0x2c]
	movs r1, #0
	str r1, [r0, #0x28]
	bx lr
	thumb_func_end ov102_021E8D50

	thumb_func_start ov102_021E8D58
ov102_021E8D58: @ 0x021E8D58
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E8D58

	thumb_func_start ov102_021E8D60
ov102_021E8D60: @ 0x021E8D60
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8D72
	cmp r0, #1
	beq _021E8D82
	pop {r3, r4, r5, pc}
_021E8D72:
	ldr r0, [r5, #0x14]
	movs r1, #2
	bl ov102_021E940C
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8D82:
	ldr r0, [r5, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E8D92
	adds r0, r5, #0
	bl ov102_021E8D58
_021E8D92:
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E8D60

	thumb_func_start ov102_021E8D94
ov102_021E8D94: @ 0x021E8D94
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r1, [r5]
	adds r4, r0, #0
	cmp r1, #3
	bhi _021E8E78
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021E8DAC: @ jump table
	.2byte _021E8DB4 - _021E8DAC - 2 @ case 0
	.2byte _021E8E02 - _021E8DAC - 2 @ case 1
	.2byte _021E8E4A - _021E8DAC - 2 @ case 2
	.2byte _021E8E68 - _021E8DAC - 2 @ case 3
_021E8DB4:
	bl ov102_021E8EF8
	cmp r0, #0
	bne _021E8DC6
	ldr r0, [r4]
	bl FUN_02090D88
	cmp r0, #0
	beq _021E8DF8
_021E8DC6:
	adds r0, r4, #0
	bl ov102_021E8F14
	cmp r0, #0
	beq _021E8DEA
	adds r0, r4, #0
	adds r0, #0x70
	movs r1, #1
	movs r2, #0
	bl ov102_021E8F5C
	ldr r0, [r4, #0x14]
	movs r1, #0x15
	bl ov102_021E940C
	movs r0, #1
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8DEA:
	ldr r0, [r4, #0x14]
	movs r1, #0x17
	bl ov102_021E940C
	movs r0, #2
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8DF8:
	ldr r1, _021E8E7C @ =ov102_021E8E84
	adds r0, r4, #0
	bl ov102_021E8D50
	pop {r3, r4, r5, pc}
_021E8E02:
	ldr r0, [r4, #0x14]
	bl ov102_021EA258
	cmp r0, #0
	beq _021E8E12
	cmp r0, #1
	beq _021E8E20
	pop {r3, r4, r5, pc}
_021E8E12:
	ldr r0, [r4, #0x14]
	movs r1, #0x19
	bl ov102_021E940C
	movs r0, #3
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8E20:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _021E8E2E
	adds r0, r4, #0
	adds r0, #8
	bl FUN_02015A74
_021E8E2E:
	adds r1, r4, #0
	adds r2, r4, #0
	ldr r0, [r4]
	adds r1, #0x10
	adds r2, #8
	bl FUN_02090E04
	ldr r1, _021E8E80 @ =ov102_021E8D1C
	adds r0, r4, #0
	bl ov102_021E7A4C
	movs r0, #3
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8E4A:
	ldrh r1, [r4, #0x30]
	movs r0, #0xf3
	tst r0, r1
	bne _021E8E5A
	bl FUN_02025358
	cmp r0, #0
	beq _021E8E78
_021E8E5A:
	ldr r0, [r4, #0x14]
	movs r1, #0x14
	bl ov102_021E940C
	movs r0, #3
	str r0, [r5]
	pop {r3, r4, r5, pc}
_021E8E68:
	ldr r0, [r4, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E8E78
	adds r0, r4, #0
	bl ov102_021E8D58
_021E8E78:
	pop {r3, r4, r5, pc}
	nop
_021E8E7C: .4byte ov102_021E8E84
_021E8E80: .4byte ov102_021E8D1C
	thumb_func_end ov102_021E8D94

	thumb_func_start ov102_021E8E84
ov102_021E8E84: @ 0x021E8E84
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E8E9A
	cmp r0, #1
	beq _021E8EB4
	cmp r0, #2
	beq _021E8EE0
	pop {r3, r4, r5, pc}
_021E8E9A:
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0x70
	adds r2, r1, #0
	bl ov102_021E8F5C
	ldr r0, [r5, #0x14]
	movs r1, #0x16
	bl ov102_021E940C
	movs r0, #1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8EB4:
	ldr r0, [r5, #0x14]
	bl ov102_021EA258
	cmp r0, #0
	beq _021E8EC4
	cmp r0, #1
	beq _021E8ED2
	pop {r3, r4, r5, pc}
_021E8EC4:
	ldr r0, [r5, #0x14]
	movs r1, #0x19
	bl ov102_021E940C
	movs r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8ED2:
	ldr r1, _021E8EF4 @ =ov102_021E8D1C
	adds r0, r5, #0
	bl ov102_021E7A4C
	movs r0, #2
	str r0, [r4]
	pop {r3, r4, r5, pc}
_021E8EE0:
	ldr r0, [r5, #0x14]
	bl ov102_021E9464
	cmp r0, #0
	beq _021E8EF0
	adds r0, r5, #0
	bl ov102_021E8D58
_021E8EF0:
	pop {r3, r4, r5, pc}
	nop
_021E8EF4: .4byte ov102_021E8D1C
	thumb_func_end ov102_021E8E84

	thumb_func_start ov102_021E8EF8
ov102_021E8EF8: @ 0x021E8EF8
	push {r3, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	ldr r0, [r2]
	adds r1, #0x10
	adds r2, #8
	bl FUN_02090DC0
	cmp r0, #0
	bne _021E8F10
	movs r0, #1
	pop {r3, pc}
_021E8F10:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov102_021E8EF8

	thumb_func_start ov102_021E8F14
ov102_021E8F14: @ 0x021E8F14
	push {r3, lr}
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _021E8F26
	cmp r1, #1
	beq _021E8F36
	cmp r1, #2
	beq _021E8F4C
	b _021E8F54
_021E8F26:
	ldrh r1, [r0, #0x10]
	ldr r0, _021E8F58 @ =0x0000FFFF
	cmp r1, r0
	beq _021E8F32
	movs r0, #1
	pop {r3, pc}
_021E8F32:
	movs r0, #0
	pop {r3, pc}
_021E8F36:
	ldrh r2, [r0, #0x10]
	ldr r1, _021E8F58 @ =0x0000FFFF
	cmp r2, r1
	beq _021E8F48
	ldrh r0, [r0, #0x12]
	cmp r0, r1
	beq _021E8F48
	movs r0, #1
	pop {r3, pc}
_021E8F48:
	movs r0, #0
	pop {r3, pc}
_021E8F4C:
	adds r0, #8
	bl FUN_02015934
	pop {r3, pc}
_021E8F54:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
_021E8F58: .4byte 0x0000FFFF
	thumb_func_end ov102_021E8F14

	thumb_func_start ov102_021E8F5C
ov102_021E8F5C: @ 0x021E8F5C
	strb r2, [r0]
	strb r1, [r0, #1]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E8F5C

	thumb_func_start ov102_021E8F64
ov102_021E8F64: @ 0x021E8F64
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov102_021E8F64

	thumb_func_start ov102_021E8F68
ov102_021E8F68: @ 0x021E8F68
	adds r0, #0x74
	bx lr
	thumb_func_end ov102_021E8F68

	thumb_func_start ov102_021E8F6C
ov102_021E8F6C: @ 0x021E8F6C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov102_021E8F6C

	thumb_func_start ov102_021E8F70
ov102_021E8F70: @ 0x021E8F70
	ldr r3, _021E8F78 @ =FUN_02090D74
	ldr r0, [r0]
	bx r3
	nop
_021E8F78: .4byte FUN_02090D74
	thumb_func_end ov102_021E8F70

	thumb_func_start ov102_021E8F7C
ov102_021E8F7C: @ 0x021E8F7C
	adds r0, #0x6b
	ldrb r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E8F7C

	thumb_func_start ov102_021E8F84
ov102_021E8F84: @ 0x021E8F84
	ldr r3, _021E8F8C @ =FUN_020159E4
	adds r0, #8
	bx r3
	nop
_021E8F8C: .4byte FUN_020159E4
	thumb_func_end ov102_021E8F84

	thumb_func_start ov102_021E8F90
ov102_021E8F90: @ 0x021E8F90
	push {r3, lr}
	ldr r2, [r0, #4]
	cmp r2, #2
	bne _021E8FA0
	adds r0, #8
	bl FUN_020159DC
	pop {r3, pc}
_021E8FA0:
	lsls r1, r1, #1
	adds r0, r0, r1
	ldrh r0, [r0, #0x10]
	pop {r3, pc}
	thumb_func_end ov102_021E8F90

	thumb_func_start ov102_021E8FA8
ov102_021E8FA8: @ 0x021E8FA8
	ldr r3, _021E8FB0 @ =FUN_02015904
	adds r0, #8
	bx r3
	nop
_021E8FB0: .4byte FUN_02015904
	thumb_func_end ov102_021E8FA8

	thumb_func_start ov102_021E8FB4
ov102_021E8FB4: @ 0x021E8FB4
	ldr r3, _021E8FBC @ =ov102_021E7A0C
	adds r0, #0x64
	bx r3
	nop
_021E8FBC: .4byte ov102_021E7A0C
	thumb_func_end ov102_021E8FB4

	thumb_func_start ov102_021E8FC0
ov102_021E8FC0: @ 0x021E8FC0
	adds r0, #0x4e
	ldrh r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E8FC0

	thumb_func_start ov102_021E8FC8
ov102_021E8FC8: @ 0x021E8FC8
	adds r0, #0x4c
	ldrh r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E8FC8

	thumb_func_start ov102_021E8FD0
ov102_021E8FD0: @ 0x021E8FD0
	adds r0, #0x50
	ldrh r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E8FD0

	thumb_func_start ov102_021E8FD8
ov102_021E8FD8: @ 0x021E8FD8
	push {r3, lr}
	adds r1, r0, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #0
	ldr r0, [r1, #0x18]
	bne _021E8FF0
	adds r1, #0x50
	ldrh r1, [r1]
	bl FUN_02091C38
	pop {r3, pc}
_021E8FF0:
	adds r1, #0x50
	ldrh r1, [r1]
	bl FUN_02091C74
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021E8FD8

	thumb_func_start ov102_021E8FFC
ov102_021E8FFC: @ 0x021E8FFC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x6b
	ldrb r0, [r0]
	adds r4, r1, #0
	adds r3, r2, #0
	cmp r0, #0
	ldr r0, [r5, #0x18]
	bne _021E901A
	adds r5, #0x50
	ldrh r1, [r5]
	adds r2, r4, #0
	bl FUN_02091C40
	pop {r3, r4, r5, pc}
_021E901A:
	adds r5, #0x50
	ldrh r1, [r5]
	adds r2, r4, #0
	bl FUN_02091C84
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E8FFC

	thumb_func_start ov102_021E9028
ov102_021E9028: @ 0x021E9028
	push {r3, lr}
	adds r1, r0, #0
	adds r1, #0x60
	ldrh r1, [r1]
	cmp r1, #0
	beq _021E903A
	movs r0, #0
	mvns r0, r0
	pop {r3, pc}
_021E903A:
	adds r0, #0x54
	bl ov102_021E878C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021E9028

	thumb_func_start ov102_021E9044
ov102_021E9044: @ 0x021E9044
	ldr r3, _021E904C @ =ov102_021E87A8
	adds r0, #0x54
	bx r3
	nop
_021E904C: .4byte ov102_021E87A8
	thumb_func_end ov102_021E9044

	thumb_func_start ov102_021E9050
ov102_021E9050: @ 0x021E9050
	push {r3, lr}
	adds r0, #0x54
	bl ov102_021E87AC
	cmp r0, #0
	beq _021E9060
	movs r0, #1
	pop {r3, pc}
_021E9060:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov102_021E9050

	thumb_func_start ov102_021E9064
ov102_021E9064: @ 0x021E9064
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x54
	bl ov102_021E87AC
	adds r5, #0x54
	adds r4, r0, #0
	adds r0, r5, #0
	bl ov102_021E87B0
	cmp r4, r0
	bge _021E9080
	movs r0, #1
	pop {r3, r4, r5, pc}
_021E9080:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E9064

	thumb_func_start ov102_021E9084
ov102_021E9084: @ 0x021E9084
	ldr r3, _021E908C @ =FUN_02090D78
	ldr r0, [r0]
	bx r3
	nop
_021E908C: .4byte FUN_02090D78
	thumb_func_end ov102_021E9084

	thumb_func_start ov102_021E9090
ov102_021E9090: @ 0x021E9090
	ldr r3, _021E9098 @ =ov102_021E8F64
	adds r0, #0x70
	bx r3
	nop
_021E9098: .4byte ov102_021E8F64
	thumb_func_end ov102_021E9090

	thumb_func_start ov102_021E909C
ov102_021E909C: @ 0x021E909C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r6, r1, #0
	movs r1, #0x8d
	adds r5, r0, #0
	movs r0, #0x23
	lsls r1, r1, #2
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	bl FUN_0201A108
	str r5, [r4, #0x18]
	adds r0, r5, #0
	str r6, [r4, #0x1c]
	bl ov102_021E8F68
	movs r1, #0x7e
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r4, #0
	bl ov102_021E9198
	blx FUN_020B78D4
	movs r2, #0
	str r2, [sp]
	movs r1, #0x7f
	str r1, [sp, #4]
	str r2, [sp, #8]
	movs r3, #0x20
	str r3, [sp, #0xc]
	movs r0, #0x23
	str r0, [sp, #0x10]
	movs r0, #1
	bl FUN_0200B150
	adds r1, r4, #0
	movs r0, #0x80
	adds r1, #0x28
	movs r2, #0x23
	bl FUN_02009F40
	str r0, [r4, #0x24]
	movs r0, #0x23
	bl FUN_0201AC88
	str r0, [r4, #0x20]
	ldr r0, _021E913C @ =ov102_021E93DC
	adds r1, r4, #0
	movs r2, #2
	bl FUN_0200E320
	str r0, [r4]
	ldr r0, _021E9140 @ =ov102_021E93E0
	adds r1, r4, #0
	movs r2, #1
	bl ov102_021E93D4
	movs r1, #0
	str r0, [r4, #4]
	adds r2, r4, #0
	adds r0, r1, #0
_021E9122:
	adds r1, r1, #1
	str r0, [r2, #8]
	adds r2, r2, #4
	cmp r1, #4
	blt _021E9122
	movs r0, #4
	movs r1, #0x23
	bl FUN_02002CEC
	adds r0, r4, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_021E913C: .4byte ov102_021E93DC
_021E9140: .4byte ov102_021E93E0
	thumb_func_end ov102_021E909C

	thumb_func_start ov102_021E9144
ov102_021E9144: @ 0x021E9144
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	beq _021E9196
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A0FC
	movs r0, #4
	bl FUN_02002DB4
	movs r4, #0
	adds r5, r6, #0
_021E915C:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021E9166
	bl FUN_0200E390
_021E9166:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E915C
	ldr r0, [r6]
	bl FUN_0200E390
	ldr r0, [r6, #4]
	bl FUN_0200E390
	bl FUN_0200B244
	ldr r0, [r6, #0x24]
	bl FUN_02024504
	adds r0, r6, #0
	bl ov102_021E91BC
	ldr r0, [r6, #0x20]
	bl FUN_0201AB0C
	adds r0, r6, #0
	bl FUN_0201AB0C
_021E9196:
	pop {r4, r5, r6, pc}
	thumb_func_end ov102_021E9144

	thumb_func_start ov102_021E9198
ov102_021E9198: @ 0x021E9198
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _021E91B8 @ =0x021EC698
	add r3, sp, #0
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r2, #0
	bl FUN_020215A0
	bl FUN_020216C8
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021E91B8: .4byte 0x021EC698
	thumb_func_end ov102_021E9198

	thumb_func_start ov102_021E91BC
ov102_021E91BC: @ 0x021E91BC
	ldr r3, _021E91C0 @ =FUN_0202168C
	bx r3
	.align 2, 0
_021E91C0: .4byte FUN_0202168C
	thumb_func_end ov102_021E91BC

	thumb_func_start ov102_021E91C4
ov102_021E91C4: @ 0x021E91C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	adds r7, r0, #0
	movs r0, #2
	movs r1, #0x23
	bl FUN_02013534
	movs r1, #0x7f
	lsls r1, r1, #2
	str r0, [r7, r1]
	adds r1, #8
	adds r0, r7, r1
	bl FUN_0201D3C4
	movs r0, #0
	str r0, [sp]
	movs r1, #0x81
	str r0, [sp, #4]
	lsls r1, r1, #2
	ldr r0, [r7, #0x20]
	adds r1, r7, r1
	movs r2, #9
	movs r3, #4
	bl FUN_0201D494
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D9B0
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0x23
	bl FUN_02013910
	movs r1, #2
	lsls r1, r1, #8
	str r0, [r7, r1]
	ldr r0, [r7, r1]
	movs r1, #1
	bl FUN_02013948
	movs r1, #0x7f
	movs r3, #0x23
	adds r2, r3, #0
	lsls r1, r1, #2
	str r0, [sp, #0x28]
	ldr r0, [r7, r1]
	adds r2, #0xf8
	str r0, [sp, #0x30]
	adds r0, r1, #0
	adds r0, #8
	adds r0, r7, r0
	str r0, [sp, #0x34]
	ldr r0, [r7, #0x24]
	subs r1, #0x64
	str r0, [sp, #0x38]
	adds r0, r7, r1
	str r0, [sp, #0x3c]
	movs r0, #3
	movs r1, #1
	str r0, [sp, #0x50]
	movs r0, #0
	str r1, [sp, #0x58]
	movs r1, #0x1b
	str r0, [sp, #0x54]
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	str r3, [sp, #0x5c]
	bl FUN_0200BAF8
	str r0, [sp, #0x20]
	movs r0, #0x15
	movs r1, #0x23
	bl FUN_02026354
	str r0, [sp, #0x24]
	movs r0, #0x15
	movs r1, #0x23
	bl FUN_02026354
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #0x2c]
	movs r0, #0x86
	lsls r0, r0, #2
	adds r0, r7, r0
	str r0, [sp, #0x18]
	movs r0, #0x18
	str r7, [sp, #0x14]
	str r0, [sp, #0x10]
_021E927E:
	movs r1, #1
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x18]
	adds r2, r1, #0
	bl FUN_02021AC8
	movs r1, #0x87
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #0x2c]
	str r0, [sp, #0x44]
	movs r0, #0
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x24]
	adds r1, #0xb
	bl FUN_0200BB6C
	ldr r0, [sp, #0x24]
	bl FUN_02026820
	str r0, [sp, #0x1c]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r7, r0
	movs r1, #0
	bl FUN_0201D9B0
	ldr r0, [sp, #0x1c]
	movs r6, #0
	lsls r1, r0, #4
	movs r0, #0x20
	subs r0, r0, r1
	lsrs r5, r0, #1
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bls _021E9308
_021E92CA:
	ldr r1, [sp, #0x24]
	adds r0, r4, #0
	adds r2, r6, #0
	bl FUN_02026860
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0x48
	bl FUN_020030A0
	adds r3, r0, #0
	str r5, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021E9378 @ =0x000E0F00
	movs r1, #4
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #0x81
	lsls r0, r0, #2
	adds r0, r7, r0
	adds r2, r4, #0
	bl FUN_020200FC
	ldr r0, [sp, #0x1c]
	adds r6, r6, #1
	adds r5, #0x10
	cmp r6, r0
	blo _021E92CA
_021E9308:
	movs r1, #2
	lsls r1, r1, #8
	ldr r1, [r7, r1]
	add r0, sp, #0x30
	bl FUN_02013950
	movs r2, #0x85
	ldr r1, [sp, #0x14]
	lsls r2, r2, #2
	str r0, [r1, r2]
	adds r0, r1, #0
	ldr r0, [r0, r2]
	movs r1, #1
	bl FUN_020137C0
	movs r1, #0x85
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	movs r1, #0
	bl FUN_02013850
	movs r1, #0x85
	ldr r0, [sp, #0x14]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	ldr r1, [sp, #0x10]
	movs r2, #6
	bl FUN_020136B4
	ldr r0, [sp, #0x18]
	adds r0, #0x10
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	adds r0, #0x88
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	adds r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #2
	blt _021E927E
	adds r0, r4, #0
	bl FUN_02026380
	ldr r0, [sp, #0x24]
	bl FUN_02026380
	ldr r0, [sp, #0x20]
	bl FUN_0200BB44
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E9378: .4byte 0x000E0F00
	thumb_func_end ov102_021E91C4

	thumb_func_start ov102_021E937C
ov102_021E937C: @ 0x021E937C
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #0x86
	movs r6, #0
	lsls r1, r1, #2
	str r0, [sp]
	adds r4, r0, #0
	adds r5, r0, r1
	adds r7, r6, #0
_021E938C:
	movs r0, #0x85
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_020139C8
	adds r0, r5, #0
	bl FUN_02021B5C
	movs r0, #0x85
	lsls r0, r0, #2
	str r7, [r4, r0]
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, #0x10
	cmp r6, #2
	blt _021E938C
	adds r1, r0, #0
	ldr r0, [sp]
	subs r1, #0x14
	ldr r0, [r0, r1]
	bl FUN_02013938
	movs r1, #0x81
	ldr r0, [sp]
	lsls r1, r1, #2
	adds r0, r0, r1
	bl FUN_0201D520
	movs r1, #0x7f
	ldr r0, [sp]
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_020135AC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov102_021E937C

	thumb_func_start ov102_021E93D4
ov102_021E93D4: @ 0x021E93D4
	ldr r3, _021E93D8 @ =FUN_0200E33C
	bx r3
	.align 2, 0
_021E93D8: .4byte FUN_0200E33C
	thumb_func_end ov102_021E93D4

	thumb_func_start ov102_021E93DC
ov102_021E93DC: @ 0x021E93DC
	bx lr
	.align 2, 0
	thumb_func_end ov102_021E93DC

	thumb_func_start ov102_021E93E0
ov102_021E93E0: @ 0x021E93E0
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, [r4, #0x20]
	bl FUN_0201EEB4
	ldr r0, [r4, #0x24]
	bl FUN_0202457C
	bl FUN_0200B224
	ldr r3, _021E9404 @ =0x027E0000
	ldr r1, _021E9408 @ =0x00003FF8
	movs r0, #1
	ldr r2, [r3, r1]
	orrs r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E9404: .4byte 0x027E0000
_021E9408: .4byte 0x00003FF8
	thumb_func_end ov102_021E93E0

	thumb_func_start ov102_021E940C
ov102_021E940C: @ 0x021E940C
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	adds r5, r0, #0
	cmp r6, #0x20
	bhs _021E945A
	movs r0, #0x23
	movs r1, #0x18
	bl FUN_0201AA8C
	adds r1, r0, #0
	beq _021E945E
	movs r4, #0
	str r4, [r1, #0x14]
	str r6, [r1, #0xc]
	str r5, [r1]
	ldr r0, [r5, #0x18]
	adds r2, r5, #0
	str r0, [r1, #4]
	ldr r0, [r5, #0x1c]
	str r0, [r1, #8]
_021E9434:
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _021E9450
	ldr r0, _021E9460 @ =0x021EC788
	lsls r2, r6, #2
	ldr r0, [r0, r2]
	movs r2, #1
	str r4, [r1, #0x10]
	bl FUN_0200E320
	lsls r1, r4, #2
	adds r1, r5, r1
	str r0, [r1, #8]
	pop {r4, r5, r6, pc}
_021E9450:
	adds r4, r4, #1
	adds r2, r2, #4
	cmp r4, #4
	blt _021E9434
	pop {r4, r5, r6, pc}
_021E945A:
	bl FUN_0202551C
_021E945E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_021E9460: .4byte 0x021EC788
	thumb_func_end ov102_021E940C

	thumb_func_start ov102_021E9464
ov102_021E9464: @ 0x021E9464
	movs r2, #0
_021E9466:
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _021E9470
	movs r0, #0
	bx lr
_021E9470:
	adds r2, r2, #1
	adds r0, r0, #4
	cmp r2, #4
	blt _021E9466
	movs r0, #1
	bx lr
	thumb_func_end ov102_021E9464

	thumb_func_start ov102_021E947C
ov102_021E947C: @ 0x021E947C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
_021E9484:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _021E9498
	bl FUN_0201F988
	ldr r0, [r0, #0xc]
	cmp r0, r6
	bne _021E9498
	movs r0, #0
	pop {r4, r5, r6, pc}
_021E9498:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #4
	blt _021E9484
	movs r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov102_021E947C

	thumb_func_start ov102_021E94A4
ov102_021E94A4: @ 0x021E94A4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r1, [r4]
	lsls r0, r0, #2
	adds r0, r1, r0
	ldr r0, [r0, #8]
	bl FUN_0200E390
	ldr r0, [r4, #0x10]
	ldr r1, [r4]
	lsls r0, r0, #2
	movs r2, #0
	adds r0, r1, r0
	str r2, [r0, #8]
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021E94A4

	thumb_func_start ov102_021E94CC
ov102_021E94CC: @ 0x021E94CC
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	bl FUN_02022C54
	bl FUN_02022CBC
	movs r1, #1
	lsls r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _021E95D0 @ =0xFFFFE0FF
	ands r0, r2
	str r0, [r1]
	ldr r0, _021E95D4 @ =0x04001000
	ldr r3, [r0]
	ands r2, r3
	str r2, [r0]
	ldr r2, [r1]
	ldr r3, _021E95D8 @ =0xFFCFFFEF
	adds r5, r2, #0
	ldr r2, _021E95DC @ =0x00100010
	ands r5, r3
	orrs r2, r5
	str r2, [r1]
	ldr r1, [r0]
	adds r2, r1, #0
	ands r2, r3
	movs r1, #0x10
	orrs r1, r2
	str r1, [r0]
	movs r0, #0x4c
	movs r1, #0x23
	bl FUN_02007688
	adds r5, r0, #0
	adds r0, r4, #0
	bl ov102_021E978C
	adds r0, r4, #0
	adds r1, r5, #0
	bl ov102_021E95E0
	ldr r0, [r4]
	bl ov102_021E91C4
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	bl ov102_021EA314
	movs r1, #0x1e
	ldr r2, [r4]
	lsls r1, r1, #4
	str r0, [r2, r1]
	ldr r0, [r4]
	ldr r0, [r0, r1]
	adds r1, r5, #0
	bl ov102_021EA41C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	bl ov102_021EB1A4
	movs r1, #0x79
	ldr r2, [r4]
	lsls r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r4]
	ldr r0, [r0, r1]
	adds r1, r5, #0
	bl ov102_021EB1F8
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	bl ov102_021EB694
	movs r1, #0x7a
	ldr r2, [r4]
	lsls r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r4]
	ldr r0, [r0, r1]
	adds r1, r5, #0
	bl ov102_021EB6E0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	bl ov102_021EBC34
	movs r1, #0x7b
	ldr r2, [r4]
	lsls r1, r1, #2
	str r0, [r2, r1]
	ldr r0, [r4]
	ldr r0, [r0, r1]
	bl ov102_021EBD00
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	bl ov102_021EC20C
	movs r1, #0x1f
	ldr r2, [r4]
	lsls r1, r1, #4
	str r0, [r2, r1]
	ldr r0, [r4]
	ldr r0, [r0, r1]
	adds r1, r5, #0
	bl ov102_021EC248
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	blx FUN_020CD9B4
	adds r0, r5, #0
	bl FUN_0200770C
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E95D0: .4byte 0xFFFFE0FF
_021E95D4: .4byte 0x04001000
_021E95D8: .4byte 0xFFCFFFEF
_021E95DC: .4byte 0x00100010
	thumb_func_end ov102_021E94CC

	thumb_func_start ov102_021E95E0
ov102_021E95E0: @ 0x021E95E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r4, [r0]
	movs r0, #0x66
	lsls r0, r0, #2
	adds r5, r1, #0
	adds r1, r4, r0
	str r1, [sp, #0x1c]
	adds r1, r0, #0
	subs r1, #0x48
	adds r7, r4, r1
	adds r1, r0, #0
	adds r1, #0x28
	adds r0, #0x30
	adds r1, r4, r1
	adds r0, r4, r0
	movs r6, #0
	str r1, [sp, #0x18]
	str r0, [sp, #0x14]
_021E9606:
	ldr r0, [sp, #0x1c]
	blx FUN_020B804C
	adds r0, r7, #0
	blx FUN_020B8008
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #1
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r5, #0
	movs r1, #9
	movs r2, #1
	movs r3, #0
	str r7, [sp, #0x10]
	bl FUN_02007BE8
	movs r0, #0x23
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	movs r1, #0xa
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r6, #1
	movs r3, #0
	bl FUN_02007BC8
	movs r0, #0x23
	str r0, [sp]
	ldr r3, [sp, #0x18]
	adds r0, r5, #0
	movs r1, #7
	movs r2, #1
	bl FUN_02007C60
	movs r1, #0x1d
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0x23
	str r0, [sp]
	ldr r3, [sp, #0x14]
	adds r0, r5, #0
	movs r1, #8
	movs r2, #1
	bl FUN_02007C7C
	movs r1, #0x76
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [sp, #0x1c]
	adds r6, r6, #1
	adds r0, #0x14
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r7, #0x24
	adds r0, r0, #4
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	adds r4, r4, #4
	adds r0, r0, #4
	str r0, [sp, #0x14]
	cmp r6, #2
	blt _021E9606
	bl FUN_0203A964
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov102_021E95E0

	thumb_func_start ov102_021E9694
ov102_021E9694: @ 0x021E9694
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r6, r1, #0
	ldr r0, [r6, #0x14]
	ldr r7, [r6]
	cmp r0, #0
	beq _021E96AA
	cmp r0, #1
	beq _021E96CC
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021E96AA:
	movs r0, #5
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0x23
	str r0, [sp, #8]
	movs r0, #0
	adds r1, r0, #0
	adds r2, r0, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r6, #0x14]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r6, #0x14]
	pop {r4, r5, r6, r7, pc}
_021E96CC:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E9784
	movs r0, #0x1e
	ldr r1, [r6]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov102_021EA380
	movs r0, #0x79
	ldr r1, [r6]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl ov102_021EB1E0
	movs r0, #0x7a
	ldr r1, [r6]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl ov102_021EB6C8
	movs r0, #0x7b
	ldr r1, [r6]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	bl ov102_021EBCBC
	movs r0, #0x1f
	ldr r1, [r6]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	bl ov102_021EC240
	ldr r0, [r6]
	bl ov102_021E937C
	movs r4, #0
	adds r5, r7, #0
_021E971A:
	movs r0, #0x1d
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9728
	bl FUN_0201AB0C
_021E9728:
	movs r0, #0x76
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _021E9736
	bl FUN_0201AB0C
_021E9736:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #2
	blt _021E971A
	movs r0, #2
	bl FUN_02002DB4
	ldr r0, [r7, #0x20]
	movs r1, #0
	bl FUN_0201BB4C
	ldr r0, [r7, #0x20]
	movs r1, #1
	bl FUN_0201BB4C
	ldr r0, [r7, #0x20]
	movs r1, #2
	bl FUN_0201BB4C
	ldr r0, [r7, #0x20]
	movs r1, #3
	bl FUN_0201BB4C
	ldr r0, [r7, #0x20]
	movs r1, #4
	bl FUN_0201BB4C
	ldr r0, [r7, #0x20]
	movs r1, #5
	bl FUN_0201BB4C
	ldr r2, _021E9788 @ =0x04000304
	ldrh r1, [r2]
	lsrs r0, r2, #0xb
	orrs r0, r1
	strh r0, [r2]
	adds r0, r6, #0
	bl ov102_021E94A4
_021E9784:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_021E9788: .4byte 0x04000304
	thumb_func_end ov102_021E9694

	thumb_func_start ov102_021E978C
ov102_021E978C: @ 0x021E978C
	push {r3, r4, r5, lr}
	ldr r2, _021E9814 @ =0x04000304
	ldr r5, [r0]
	ldrh r1, [r2]
	ldr r0, _021E9818 @ =0xFFFF7FFF
	ands r0, r1
	strh r0, [r2]
	movs r0, #1
	movs r1, #0
	adds r2, r0, #0
	blx FUN_020CD9FC
	ldr r0, _021E981C @ =0x021EC760
	bl FUN_02022BE8
	ldr r0, _021E9820 @ =0x021EC6A8
	bl FUN_0201ACB0
	movs r1, #0
	ldr r0, [r5, #0x20]
	ldr r2, _021E9824 @ =0x021EC728
	adds r3, r1, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x20]
	ldr r2, _021E9828 @ =0x021EC6D4
	movs r1, #1
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x20]
	ldr r2, _021E982C @ =0x021EC6B8
	movs r1, #2
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x20]
	ldr r2, _021E9830 @ =0x021EC70C
	movs r1, #3
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x20]
	ldr r2, _021E9834 @ =0x021EC744
	movs r1, #4
	movs r3, #0
	bl FUN_0201B1E4
	ldr r0, [r5, #0x20]
	ldr r2, _021E9838 @ =0x021EC6F0
	movs r1, #5
	movs r3, #0
	bl FUN_0201B1E4
	movs r4, #0
_021E97FA:
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x20]
	lsrs r1, r1, #0x18
	bl FUN_0201CAE0
	adds r4, r4, #1
	cmp r4, #6
	blt _021E97FA
	movs r0, #2
	movs r1, #0x23
	bl FUN_02002CEC
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E9814: .4byte 0x04000304
_021E9818: .4byte 0xFFFF7FFF
_021E981C: .4byte 0x021EC760
_021E9820: .4byte 0x021EC6A8
_021E9824: .4byte 0x021EC728
_021E9828: .4byte 0x021EC6D4
_021E982C: .4byte 0x021EC6B8
_021E9830: .4byte 0x021EC70C
_021E9834: .4byte 0x021EC744
_021E9838: .4byte 0x021EC6F0
	thumb_func_end ov102_021E978C

	thumb_func_start ov102_021E983C
ov102_021E983C: @ 0x021E983C
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r1, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021E984E
	cmp r0, #1
	beq _021E986E
	b _021E9880
_021E984E:
	movs r0, #5
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	movs r0, #0x23
	str r0, [sp, #8]
	movs r0, #0
	adds r2, r1, #0
	adds r3, r0, #0
	bl FUN_0200FA24
	ldr r0, [r4, #0x14]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #0x14]
	pop {r3, r4, pc}
_021E986E:
	bl FUN_0200FB5C
	cmp r0, #0
	beq _021E9886
	ldr r0, [r4, #0x14]
	add sp, #0xc
	adds r0, r0, #1
	str r0, [r4, #0x14]
	pop {r3, r4, pc}
_021E9880:
	adds r0, r4, #0
	bl ov102_021E94A4
_021E9886:
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov102_021E983C

	thumb_func_start ov102_021E988C
ov102_021E988C: @ 0x021E988C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r0, #0x1e
	ldr r4, [r5]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAA3C
	ldr r0, [r5, #4]
	bl ov102_021E8FC0
	adds r1, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAFF0
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E988C

	thumb_func_start ov102_021E98B8
ov102_021E98B8: @ 0x021E98B8
	ldr r3, _021E98C0 @ =ov102_021E94A4
	adds r0, r1, #0
	bx r3
	nop
_021E98C0: .4byte ov102_021E94A4
	thumb_func_end ov102_021E98B8

	thumb_func_start ov102_021E98C4
ov102_021E98C4: @ 0x021E98C4
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x7a
	ldr r1, [r4]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov102_021EB98C
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021E98C4

	thumb_func_start ov102_021E98E0
ov102_021E98E0: @ 0x021E98E0
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x7b
	ldr r1, [r4]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov102_021EBEF4
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021E98E0

	thumb_func_start ov102_021E98FC
ov102_021E98FC: @ 0x021E98FC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r0, #0x7d
	ldr r4, [r5]
	movs r1, #1
	lsls r0, r0, #2
	strb r1, [r4, r0]
	subs r0, #0x14
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EAF5C
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAF7C
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EB524
	ldr r0, [r4, #0x18]
	bl ov102_021E8FC8
	adds r1, r0, #0
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB530
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E98FC

	thumb_func_start ov102_021E9944
ov102_021E9944: @ 0x021E9944
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r0, #0x7d
	ldr r4, [r5]
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
	subs r0, #0x10
	ldr r0, [r4, r0]
	bl ov102_021EB524
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAFAC
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EAF5C
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E9944

	thumb_func_start ov102_021E9978
ov102_021E9978: @ 0x021E9978
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #0
	beq _021E998A
	cmp r0, #1
	beq _021E99DE
	pop {r4, r5, r6, pc}
_021E998A:
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAF44
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAF7C
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EADF8
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EAE40
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB664
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBA44
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EA71C
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
_021E99DE:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBA5C
	adds r6, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EA754
	cmp r6, #0
	beq _021E9A20
	cmp r0, #0
	beq _021E9A20
	ldr r0, [r4, #0x18]
	bl ov102_021E8FD0
	adds r1, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB9C0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EB98C
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9A20:
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end ov102_021E9978

	thumb_func_start ov102_021E9A24
ov102_021E9A24: @ 0x021E9A24
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #0
	beq _021E9A3A
	cmp r0, #1
	beq _021E9A4C
	cmp r0, #2
	beq _021E9A5E
	pop {r3, r4, r5, pc}
_021E9A3A:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB624
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9A4C:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBF4
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9A5E:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBC28
	cmp r0, #0
	beq _021E9A8A
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB654
	cmp r0, #0
	beq _021E9A8A
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBD0
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9A8A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E9A24

	thumb_func_start ov102_021E9A8C
ov102_021E9A8C: @ 0x021E9A8C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #3
	bhi _021E9B2E
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E9AA4: @ jump table
	.2byte _021E9AAC - _021E9AA4 - 2 @ case 0
	.2byte _021E9ABE - _021E9AA4 - 2 @ case 1
	.2byte _021E9ADC - _021E9AA4 - 2 @ case 2
	.2byte _021E9AFC - _021E9AA4 - 2 @ case 3
_021E9AAC:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB624
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9ABE:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EB98C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBF4
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9ADC:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBC28
	cmp r0, #0
	beq _021E9B2E
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBD0
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9AFC:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB654
	cmp r0, #0
	beq _021E9B2E
	ldr r0, [r4, #0x18]
	bl ov102_021E8FD0
	adds r1, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB9C0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EB98C
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9B2E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E9A8C

	thumb_func_start ov102_021E9B30
ov102_021E9B30: @ 0x021E9B30
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #0
	beq _021E9B42
	cmp r0, #1
	beq _021E9B8E
	pop {r4, r5, r6, pc}
_021E9B42:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB67C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EB98C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBAAC
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EADF8
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EAE40
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EA71C
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
_021E9B8E:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBAD0
	adds r6, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EA754
	cmp r6, #0
	beq _021E9BCE
	cmp r0, #0
	beq _021E9BCE
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAFAC
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAF50
	movs r0, #0x7d
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9BCE:
	pop {r4, r5, r6, pc}
	thumb_func_end ov102_021E9B30

	thumb_func_start ov102_021E9BD0
ov102_021E9BD0: @ 0x021E9BD0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #0
	beq _021E9BE6
	cmp r0, #1
	beq _021E9C0E
	cmp r0, #2
	beq _021E9C2E
	pop {r3, r4, r5, pc}
_021E9BE6:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBDEC
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EB98C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB50
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9C0E:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB6C
	cmp r0, #0
	beq _021E9C6C
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBE3C
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9C2E:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBE80
	cmp r0, #0
	beq _021E9C6C
	ldr r0, [r4, #0x18]
	bl ov102_021E9028
	adds r1, r0, #0
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBF38
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EBEF4
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EC290
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9C6C:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E9BD0

	thumb_func_start ov102_021E9C70
ov102_021E9C70: @ 0x021E9C70
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #4
	bhi _021E9D40
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E9C88: @ jump table
	.2byte _021E9C92 - _021E9C88 - 2 @ case 0
	.2byte _021E9CA4 - _021E9C88 - 2 @ case 1
	.2byte _021E9CCE - _021E9C88 - 2 @ case 2
	.2byte _021E9CEE - _021E9C88 - 2 @ case 3
	.2byte _021E9D00 - _021E9C88 - 2 @ case 4
_021E9C92:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB624
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9CA4:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EBEF4
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EC290
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBEA4
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9CCE:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBEC8
	cmp r0, #0
	beq _021E9D40
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBD0
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9CEE:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB88
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9D00:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBC4
	cmp r0, #0
	beq _021E9D40
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB654
	cmp r0, #0
	beq _021E9D40
	ldr r0, [r4, #0x18]
	bl ov102_021E8FD0
	adds r1, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB9C0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EB98C
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9D40:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E9C70

	thumb_func_start ov102_021E9D44
ov102_021E9D44: @ 0x021E9D44
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #3
	bls _021E9D52
	b _021E9E5E
_021E9D52:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E9D5E: @ jump table
	.2byte _021E9D66 - _021E9D5E - 2 @ case 0
	.2byte _021E9DBE - _021E9D5E - 2 @ case 1
	.2byte _021E9DF8 - _021E9D5E - 2 @ case 2
	.2byte _021E9E18 - _021E9D5E - 2 @ case 3
_021E9D66:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB67C
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EBEF4
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EC290
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBEA4
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EADF8
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EAE40
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EA71C
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
_021E9DBE:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBEC8
	adds r6, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EA754
	cmp r6, #0
	beq _021E9E5E
	cmp r0, #0
	beq _021E9E5E
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB1C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB88
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
_021E9DF8:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBC4
	cmp r0, #0
	beq _021E9E5E
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB2C
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r4, r5, r6, pc}
_021E9E18:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB44
	cmp r0, #0
	beq _021E9E5E
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAA3C
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EAF5C
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAFAC
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAF50
	movs r0, #0x7d
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9E5E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov102_021E9D44

	thumb_func_start ov102_021E9E60
ov102_021E9E60: @ 0x021E9E60
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #3
	bhi _021E9F34
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021E9E78: @ jump table
	.2byte _021E9E80 - _021E9E78 - 2 @ case 0
	.2byte _021E9EB4 - _021E9E78 - 2 @ case 1
	.2byte _021E9EDE - _021E9E78 - 2 @ case 2
	.2byte _021E9EFE - _021E9E78 - 2 @ case 3
_021E9E80:
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB67C
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EBEF4
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EC290
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBEA4
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9EB4:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBEC8
	cmp r0, #0
	beq _021E9F34
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB1C
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB88
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9EDE:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBBC4
	cmp r0, #0
	beq _021E9F34
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB2C
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021E9EFE:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBB44
	cmp r0, #0
	beq _021E9F34
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAA3C
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EAF5C
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EB524
	adds r0, r5, #0
	bl ov102_021E94A4
_021E9F34:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021E9E60

	thumb_func_start ov102_021E9F38
ov102_021E9F38: @ 0x021E9F38
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	ldr r4, [r6]
	ldr r0, [r4, #0x18]
	bl ov102_021E8FC8
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	bne _021E9F7A
	movs r0, #0x7d
	movs r1, #0
	lsls r0, r0, #2
	strb r1, [r4, r0]
	subs r0, #0x10
	ldr r0, [r4, r0]
	bl ov102_021EB524
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EAF5C
	ldr r0, [r4, #0x18]
	bl ov102_021E8FC0
	adds r1, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAFF0
	b _021E9FA4
_021E9F7A:
	movs r0, #0x7d
	movs r1, #1
	lsls r0, r0, #2
	strb r1, [r4, r0]
	subs r0, #0x14
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EAF5C
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EB524
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	bl ov102_021EB530
_021E9FA4:
	adds r0, r6, #0
	bl ov102_021E94A4
	pop {r4, r5, r6, pc}
	thumb_func_end ov102_021E9F38

	thumb_func_start ov102_021E9FAC
ov102_021E9FAC: @ 0x021E9FAC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5]
	ldr r0, [r4, #0x18]
	bl ov102_021E8FC8
	adds r1, r0, #0
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB530
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E9FAC

	thumb_func_start ov102_021E9FCC
ov102_021E9FCC: @ 0x021E9FCC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5]
	ldr r0, [r4, #0x18]
	bl ov102_021E8FD0
	adds r1, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB9C0
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E9FCC

	thumb_func_start ov102_021E9FEC
ov102_021E9FEC: @ 0x021E9FEC
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r4, [r5]
	ldr r0, [r4, #0x18]
	bl ov102_021E9028
	adds r1, r0, #0
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBF38
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021E9FEC

	thumb_func_start ov102_021EA00C
ov102_021EA00C: @ 0x021EA00C
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #0x14]
	ldr r4, [r5]
	cmp r0, #0
	beq _021EA01E
	cmp r0, #1
	beq _021EA038
	pop {r3, r4, r5, pc}
_021EA01E:
	ldr r0, [r4, #0x18]
	bl ov102_021E9044
	adds r1, r0, #0
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EBFA0
	ldr r0, [r5, #0x14]
	adds r0, r0, #1
	str r0, [r5, #0x14]
	pop {r3, r4, r5, pc}
_021EA038:
	movs r0, #0x7b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EC05C
	cmp r0, #0
	beq _021EA058
	movs r0, #0x1f
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #1
	bl ov102_021EC290
	adds r0, r5, #0
	bl ov102_021E94A4
_021EA058:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EA00C

	thumb_func_start ov102_021EA05C
ov102_021EA05C: @ 0x021EA05C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x1e
	ldr r1, [r4]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	bl ov102_021EAE40
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EA05C

	thumb_func_start ov102_021EA078
ov102_021EA078: @ 0x021EA078
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r0, #0x1e
	ldr r4, [r5]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #2
	bl ov102_021EAE40
	movs r0, #0x79
	ldr r1, [r5]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	adds r2, r1, #0
	bl ov102_021EB2EC
	movs r0, #0x7d
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #1
	bne _021EA0AE
	subs r0, #0x10
	ldr r0, [r4, r0]
	bl ov102_021EB50C
	b _021EA0B6
_021EA0AE:
	subs r0, #0x14
	ldr r0, [r4, r0]
	bl ov102_021EAF44
_021EA0B6:
	ldr r0, [r5, #4]
	bl ov102_021E9090
	adds r1, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EB0C0
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021EA078

	thumb_func_start ov102_021EA0D0
ov102_021EA0D0: @ 0x021EA0D0
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r0, #0x1e
	ldr r4, [r5]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #3
	bl ov102_021EAE40
	movs r0, #0x79
	ldr r1, [r5]
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	adds r2, r1, #0
	bl ov102_021EB2EC
	movs r0, #0x7d
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #1
	bne _021EA106
	subs r0, #0x10
	ldr r0, [r4, r0]
	bl ov102_021EB50C
	b _021EA10E
_021EA106:
	subs r0, #0x14
	ldr r0, [r4, r0]
	bl ov102_021EAF44
_021EA10E:
	ldr r0, [r5, #4]
	bl ov102_021E9090
	adds r1, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EB0C0
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021EA0D0

	thumb_func_start ov102_021EA128
ov102_021EA128: @ 0x021EA128
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x1e
	ldr r1, [r4]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	bl ov102_021EAE40
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EA128

	thumb_func_start ov102_021EA144
ov102_021EA144: @ 0x021EA144
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	ldr r0, [r5, #4]
	ldr r4, [r5]
	bl ov102_021E9090
	adds r1, r0, #0
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EB170
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021EA144

	thumb_func_start ov102_021EA164
ov102_021EA164: @ 0x021EA164
	push {r3, r4, r5, lr}
	adds r5, r1, #0
	movs r0, #0x1e
	ldr r4, [r5]
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl ov102_021EAE40
	movs r0, #0x7d
	lsls r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #1
	bne _021EA198
	subs r0, #0x10
	movs r1, #1
	ldr r0, [r4, r0]
	adds r2, r1, #0
	bl ov102_021EB2EC
	movs r0, #0x79
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl ov102_021EB518
	b _021EA1AE
_021EA198:
	subs r0, #0x10
	ldr r0, [r4, r0]
	movs r1, #1
	movs r2, #0
	bl ov102_021EB2EC
	movs r0, #0x1e
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl ov102_021EAF50
_021EA1AE:
	adds r0, r5, #0
	bl ov102_021E94A4
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EA164

	thumb_func_start ov102_021EA1B8
ov102_021EA1B8: @ 0x021EA1B8
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x1f
	ldr r1, [r4]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	movs r2, #1
	bl ov102_021EC294
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	thumb_func_end ov102_021EA1B8

	thumb_func_start ov102_021EA1D4
ov102_021EA1D4: @ 0x021EA1D4
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x1f
	ldr r1, [r4]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	adds r2, r1, #0
	bl ov102_021EC294
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	thumb_func_end ov102_021EA1D4

	thumb_func_start ov102_021EA1F0
ov102_021EA1F0: @ 0x021EA1F0
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x1f
	ldr r1, [r4]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #0
	adds r2, r1, #0
	bl ov102_021EC294
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	thumb_func_end ov102_021EA1F0

	thumb_func_start ov102_021EA20C
ov102_021EA20C: @ 0x021EA20C
	push {r4, lr}
	adds r4, r1, #0
	movs r0, #0x1f
	ldr r1, [r4]
	lsls r0, r0, #4
	ldr r0, [r1, r0]
	movs r1, #1
	movs r2, #0
	bl ov102_021EC294
	adds r0, r4, #0
	bl ov102_021E94A4
	pop {r4, pc}
	thumb_func_end ov102_021EA20C

	thumb_func_start ov102_021EA228
ov102_021EA228: @ 0x021EA228
	movs r1, #0x1e
	lsls r1, r1, #4
	ldr r3, _021EA234 @ =ov102_021EAFEC
	ldr r0, [r0, r1]
	bx r3
	nop
_021EA234: .4byte ov102_021EAFEC
	thumb_func_end ov102_021EA228

	thumb_func_start ov102_021EA238
ov102_021EA238: @ 0x021EA238
	movs r1, #0x1e
	lsls r1, r1, #4
	ldr r3, _021EA244 @ =ov102_021EADF0
	ldr r0, [r0, r1]
	bx r3
	nop
_021EA244: .4byte ov102_021EADF0
	thumb_func_end ov102_021EA238

	thumb_func_start ov102_021EA248
ov102_021EA248: @ 0x021EA248
	movs r3, #0x1e
	lsls r3, r3, #4
	ldr r0, [r0, r3]
	ldr r3, _021EA254 @ =ov102_021EAB10
	bx r3
	nop
_021EA254: .4byte ov102_021EAB10
	thumb_func_end ov102_021EA248

	thumb_func_start ov102_021EA258
ov102_021EA258: @ 0x021EA258
	movs r1, #0x1e
	lsls r1, r1, #4
	ldr r3, _021EA264 @ =ov102_021EB130
	ldr r0, [r0, r1]
	bx r3
	nop
_021EA264: .4byte ov102_021EB130
	thumb_func_end ov102_021EA258

	thumb_func_start ov102_021EA268
ov102_021EA268: @ 0x021EA268
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov102_021EA268

	thumb_func_start ov102_021EA26C
ov102_021EA26C: @ 0x021EA26C
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end ov102_021EA26C

	thumb_func_start ov102_021EA270
ov102_021EA270: @ 0x021EA270
	push {r3, r4, r5, r6}
	movs r4, #0x15
	lsls r4, r4, #4
	movs r5, #0x24
	adds r6, r0, r4
	muls r5, r2, r5
	adds r5, r6, r5
	str r5, [r1]
	adds r5, r4, #0
	adds r5, #0x48
	adds r6, r0, r5
	movs r5, #0x14
	muls r5, r2, r5
	lsls r2, r2, #2
	adds r5, r6, r5
	adds r2, r0, r2
	adds r0, r4, #0
	str r5, [r1, #8]
	adds r0, #0x70
	ldr r0, [r2, r0]
	adds r4, #0x78
	str r0, [r1, #0xc]
	ldr r0, [r2, r4]
	str r0, [r1, #0x10]
	adds r0, r1, #0
	adds r0, #0x20
	strb r3, [r0]
	movs r0, #0
	str r0, [r1, #4]
	str r0, [r1, #0x14]
	str r0, [r1, #0x18]
	str r0, [r1, #0x1c]
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov102_021EA270

	thumb_func_start ov102_021EA2B4
ov102_021EA2B4: @ 0x021EA2B4
	push {r3, r4, r5, lr}
	sub sp, #0x20
	ldr r0, [r0, #0x24]
	str r0, [sp]
	lsls r0, r2, #0xc
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x30]
	str r1, [sp, #4]
	ldr r1, [sp, #0x34]
	lsls r2, r3, #0xc
	str r0, [sp, #0x14]
	movs r0, #0x23
	str r2, [sp, #0xc]
	str r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	cmp r1, #2
	bne _021EA2E2
	movs r0, #3
	lsls r0, r0, #0x12
	adds r0, r2, r0
	str r0, [sp, #0xc]
_021EA2E2:
	blx FUN_020D3A38
	adds r4, r0, #0
	add r0, sp, #0
	bl FUN_02024714
	adds r5, r0, #0
	adds r0, r4, #0
	blx FUN_020D3A4C
	cmp r5, #0
	beq _021EA30C
	adds r0, r5, #0
	movs r1, #1
	bl FUN_0202484C
	movs r1, #1
	adds r0, r5, #0
	lsls r1, r1, #0xc
	bl FUN_02024868
_021EA30C:
	adds r0, r5, #0
	add sp, #0x20
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EA2B4

	thumb_func_start ov102_021EA314
ov102_021EA314: @ 0x021EA314
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r1, #0
	movs r1, #0x7d
	adds r5, r0, #0
	movs r0, #0x23
	lsls r1, r1, #2
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [r4, #4]
	bl ov102_021E8F68
	movs r1, #0x1f
	lsls r1, r1, #4
	str r0, [r4, r1]
	movs r0, #0
	str r0, [r4, #0x60]
	str r0, [r4, #0x64]
	str r0, [r4, #0x68]
	str r0, [r4, #0x6c]
	str r0, [r4, #0x70]
	str r0, [r4, #0x74]
	movs r0, #0x80
	movs r1, #0x23
	bl FUN_02026354
	str r0, [r4, #0x7c]
	ldr r2, _021EA37C @ =0x0000011B
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0x23
	bl FUN_0200BAF8
	str r0, [r4, #0x78]
	movs r0, #0x23
	bl FUN_02015788
	adds r1, r4, #0
	adds r1, #0x80
	str r0, [r1]
	movs r0, #0x1e
	movs r1, #0
	lsls r0, r0, #4
	strh r1, [r4, r0]
	adds r0, r0, #2
	strh r1, [r4, r0]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EA37C: .4byte 0x0000011B
	thumb_func_end ov102_021EA314

	thumb_func_start ov102_021EA380
ov102_021EA380: @ 0x021EA380
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _021EA390
	bl FUN_020157B8
_021EA390:
	ldr r0, [r4, #0x60]
	cmp r0, #0
	beq _021EA39A
	bl FUN_02024758
_021EA39A:
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _021EA3A4
	bl FUN_02024758
_021EA3A4:
	ldr r0, [r4, #0x68]
	cmp r0, #0
	beq _021EA3AE
	bl FUN_02024758
_021EA3AE:
	ldr r0, [r4, #0x6c]
	cmp r0, #0
	beq _021EA3B8
	bl FUN_02024758
_021EA3B8:
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _021EA3C2
	bl FUN_02024758
_021EA3C2:
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _021EA3CC
	bl FUN_02024758
_021EA3CC:
	ldr r0, [r4, #0x78]
	cmp r0, #0
	beq _021EA3D6
	bl FUN_0200BB44
_021EA3D6:
	ldr r0, [r4, #0x7c]
	cmp r0, #0
	beq _021EA3E0
	bl FUN_02026380
_021EA3E0:
	adds r0, r4, #0
	adds r0, #0xc
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x1c
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x2c
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x3c
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x4c
	bl FUN_0201D520
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02016624
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EA380

	thumb_func_start ov102_021EA41C
ov102_021EA41C: @ 0x021EA41C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	bl ov102_021EA268
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021EA80C
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r2, r6, #0
	adds r3, r1, #0
	bl FUN_02007B68
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #4
	bl FUN_02007B68
	movs r0, #0xbf
	ldr r3, _021EA63C @ =0x000001E2
	mvns r0, r0
	strh r0, [r5, r3]
	ldrsh r3, [r5, r3]
	adds r0, r6, #0
	movs r1, #4
	movs r2, #3
	bl FUN_0201BC8C
	movs r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r2, r6, #0
	bl FUN_02007B44
	adds r7, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #4
	bl FUN_02007B44
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r0, #4
	adds r1, r5, #0
	lsrs r4, r7, #5
	str r0, [sp, #8]
	movs r2, #0
	lsls r0, r4, #0x10
	str r2, [sp, #0xc]
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, #0xc
	movs r3, #3
	bl FUN_0201D40C
	movs r0, #1
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r2, #4
	adds r1, r5, #0
	str r2, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, #0x1c
	movs r3, #3
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x1b
	str r0, [sp, #4]
	movs r3, #2
	adds r1, r5, #0
	str r3, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x6c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, #0x2c
	movs r2, #0
	bl FUN_0201D40C
	movs r0, #0x15
	str r0, [sp]
	movs r0, #0x13
	str r0, [sp, #4]
	movs r3, #2
	adds r1, r5, #0
	str r3, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0x6c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, #0x3c
	movs r2, #0
	bl FUN_0201D40C
	movs r0, #0xc
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	adds r0, r4, #0
	adds r0, #0xa2
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	adds r1, r5, #0
	str r0, [sp, #0x10]
	adds r0, r6, #0
	adds r1, #0x4c
	movs r2, #0
	movs r3, #0x19
	bl FUN_0201D40C
	adds r1, r4, #0
	ldr r0, _021EA640 @ =0x000001EE
	adds r1, #0xa2
	strh r1, [r5, r0]
	movs r0, #0x23
	bl FUN_0201660C
	movs r1, #0x7a
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r0, r4, #0
	adds r0, #0xde
	str r0, [sp]
	movs r1, #0
	str r1, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	movs r0, #0x26
	adds r2, r6, #0
	adds r3, r1, #0
	bl FUN_020078F0
	adds r1, r4, #0
	adds r0, r5, #0
	adds r1, #0xde
	adds r0, #0x90
	str r1, [r0]
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0x23
	movs r3, #7
	str r0, [sp, #4]
	movs r0, #0x26
	movs r1, #0x19
	movs r2, #0
	lsls r3, r3, #6
	bl FUN_02007938
	adds r1, r4, #0
	movs r0, #0x7b
	adds r1, #0xe7
	lsls r0, r0, #2
	strh r1, [r5, r0]
	ldr r0, [r5, #4]
	bl ov102_021E9084
	lsls r0, r0, #0x18
	adds r2, r4, #0
	lsrs r0, r0, #0x18
	adds r2, #0xe7
	str r0, [sp]
	movs r0, #0x23
	lsls r2, r2, #0x10
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	lsrs r2, r2, #0x10
	movs r3, #0xf
	bl FUN_0200E644
	adds r0, r5, #0
	adds r4, #0xe7
	adds r0, #0x2c
	adds r1, r4, #0
	movs r2, #0xf
	str r0, [r5, #0x5c]
	bl FUN_0200E948
	adds r0, r5, #0
	adds r0, #0xc
	bl FUN_0201D618
	adds r0, r5, #0
	adds r0, #0x1c
	bl FUN_0201D618
	adds r0, r5, #0
	adds r0, #0x2c
	bl FUN_0201D618
	adds r0, r5, #0
	adds r0, #0x3c
	bl FUN_0201D618
	adds r0, r5, #0
	bl ov102_021EA8C0
	adds r0, r5, #0
	bl ov102_021EAA3C
	adds r0, r5, #0
	movs r1, #0
	bl ov102_021EAE40
	adds r0, r5, #0
	bl ov102_021EA920
	ldr r0, [r5, #4]
	bl ov102_021E8F6C
	cmp r0, #2
	bne _021EA636
	adds r0, r5, #0
	bl ov102_021EAC20
_021EA636:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_021EA63C: .4byte 0x000001E2
_021EA640: .4byte 0x000001EE
	thumb_func_end ov102_021EA41C

	thumb_func_start ov102_021EA644
ov102_021EA644: @ 0x021EA644
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	bl ov102_021EA268
	ldr r1, _021EA674 @ =0x04000006
	ldrh r1, [r1]
	cmp r1, #0x30
	bge _021EA666
	movs r3, #0x1e
	lsls r3, r3, #4
	ldrsh r3, [r4, r3]
	movs r1, #0
	movs r2, #3
	bl FUN_0201BC8C
	pop {r4, pc}
_021EA666:
	movs r1, #0
	movs r2, #3
	adds r3, r1, #0
	bl FUN_0201BC8C
	pop {r4, pc}
	nop
_021EA674: .4byte 0x04000006
	thumb_func_end ov102_021EA644

	thumb_func_start ov102_021EA678
ov102_021EA678: @ 0x021EA678
	push {r3, r4}
	ldr r2, _021EA70C @ =0x0400004A
	movs r3, #0x3f
	ldrh r0, [r2]
	movs r4, #0x1f
	bics r0, r3
	orrs r0, r4
	strh r0, [r2]
	cmp r1, #0
	beq _021EA6D2
	subs r0, r2, #2
	ldrh r4, [r0]
	movs r1, #0x1a
	bics r4, r3
	orrs r1, r4
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021EA710 @ =0xFFFFC0FF
	ands r3, r1
	movs r1, #0x1b
	lsls r1, r1, #8
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, #0
	movs r3, #0xff
	subs r0, #0xa
	strh r3, [r0]
	movs r0, #0x30
	subs r1, r2, #6
	strh r0, [r1]
	adds r1, r2, #0
	subs r1, #8
	strh r3, [r1]
	subs r1, r2, #4
	ldr r3, _021EA714 @ =0x0000A0C0
	subs r2, #0x4a
	strh r3, [r1]
	ldr r3, [r2]
	ldr r1, _021EA718 @ =0xFFFF1FFF
	lsls r0, r0, #9
	ands r1, r3
	orrs r0, r1
	str r0, [r2]
	pop {r3, r4}
	bx lr
_021EA6D2:
	subs r0, r2, #2
	ldrh r1, [r0]
	bics r1, r3
	orrs r1, r4
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _021EA710 @ =0xFFFFC0FF
	ands r3, r1
	lsls r1, r4, #8
	orrs r1, r3
	strh r1, [r0]
	adds r0, r2, #0
	movs r1, #0
	subs r0, #0xa
	strh r1, [r0]
	subs r0, r2, #6
	strh r1, [r0]
	adds r0, r2, #0
	subs r0, #8
	strh r1, [r0]
	subs r0, r2, #4
	strh r1, [r0]
	subs r2, #0x4a
	ldr r1, [r2]
	ldr r0, _021EA718 @ =0xFFFF1FFF
	ands r0, r1
	str r0, [r2]
	pop {r3, r4}
	bx lr
	.align 2, 0
_021EA70C: .4byte 0x0400004A
_021EA710: .4byte 0xFFFFC0FF
_021EA714: .4byte 0x0000A0C0
_021EA718: .4byte 0xFFFF1FFF
	thumb_func_end ov102_021EA678

	thumb_func_start ov102_021EA71C
ov102_021EA71C: @ 0x021EA71C
	adds r2, r0, #0
	movs r0, #0x79
	movs r3, #0
	lsls r0, r0, #2
	strb r3, [r2, r0]
	adds r3, r0, #1
	strb r1, [r2, r3]
	adds r0, r0, #1
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _021EA740
	ldr r1, _021EA748 @ =0x04000048
	movs r0, #0x3f
	ldrh r3, [r1]
	bics r3, r0
	movs r0, #0x1b
	orrs r0, r3
	strh r0, [r1]
_021EA740:
	ldr r3, _021EA74C @ =FUN_0201A120
	ldr r0, _021EA750 @ =ov102_021EA644
	adds r1, r2, #0
	bx r3
	.align 2, 0
_021EA748: .4byte 0x04000048
_021EA74C: .4byte FUN_0201A120
_021EA750: .4byte ov102_021EA644
	thumb_func_end ov102_021EA71C

	thumb_func_start ov102_021EA754
ov102_021EA754: @ 0x021EA754
	push {r4, r5, r6, lr}
	movs r1, #0x79
	adds r5, r0, #0
	lsls r1, r1, #2
	ldrb r2, [r5, r1]
	cmp r2, #5
	bls _021EA77C
	adds r1, r1, #1
	ldrb r1, [r5, r1]
	cmp r1, #0
	bne _021EA772
	movs r1, #1
	bl ov102_021EA678
	b _021EA778
_021EA772:
	movs r1, #0
	bl ov102_021EA678
_021EA778:
	movs r0, #1
	pop {r4, r5, r6, pc}
_021EA77C:
	ldr r0, [r5]
	bl ov102_021EA268
	adds r6, r0, #0
	ldr r0, _021EA804 @ =0x000001E5
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _021EA792
	movs r4, #7
	mvns r4, r4
	b _021EA794
_021EA792:
	movs r4, #8
_021EA794:
	ldr r3, _021EA808 @ =0x000001E2
	movs r2, #3
	ldrsh r0, [r5, r3]
	adds r0, r0, r4
	strh r0, [r5, r3]
	subs r0, r3, #2
	ldrsh r0, [r5, r0]
	adds r1, r0, r4
	subs r0, r3, #2
	strh r1, [r5, r0]
	subs r3, r3, #2
	ldrsh r3, [r5, r3]
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201BC8C
	ldr r3, _021EA808 @ =0x000001E2
	adds r0, r6, #0
	ldrsh r3, [r5, r3]
	movs r1, #4
	movs r2, #3
	bl FUN_0201BC8C
	rsbs r4, r4, #0
	lsls r2, r4, #0x10
	ldr r0, [r5, #0x60]
	movs r1, #0
	asrs r2, r2, #0x10
	bl FUN_0200DEA0
	lsls r2, r4, #0x10
	ldr r0, [r5, #0x64]
	movs r1, #0
	asrs r2, r2, #0x10
	bl FUN_0200DEA0
	movs r0, #0x79
	lsls r0, r0, #2
	ldrb r1, [r5, r0]
	adds r1, r1, #1
	strb r1, [r5, r0]
	adds r1, r0, #1
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _021EA800
	ldrb r0, [r5, r0]
	cmp r0, #6
	bne _021EA800
	movs r0, #0
	adds r1, r0, #0
	bl FUN_0201A120
	bl FUN_0201A108
_021EA800:
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EA804: .4byte 0x000001E5
_021EA808: .4byte 0x000001E2
	thumb_func_end ov102_021EA754

	thumb_func_start ov102_021EA80C
ov102_021EA80C: @ 0x021EA80C
	push {r4, r5, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #7
	lsls r0, r0, #6
	adds r5, r1, #0
	str r0, [sp]
	movs r0, #0x23
	movs r2, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #6
	adds r3, r2, #0
	bl FUN_02007B8C
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0x23
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #4
	movs r3, #0
	bl FUN_02007B8C
	adds r0, r5, #0
	movs r1, #0x10
	add r2, sp, #8
	movs r3, #0x23
	bl FUN_02007C48
	adds r5, r0, #0
	ldr r0, [sp, #8]
	adds r1, r4, #0
	movs r2, #5
	ldr r0, [r0, #0xc]
	adds r1, #0xa0
	lsls r2, r2, #6
	blx FUN_020D47B8
	adds r4, #0xa0
	movs r1, #5
	adds r0, r4, #0
	lsls r1, r1, #6
	blx FUN_020D2894
	adds r0, r5, #0
	bl FUN_0201AB0C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EA80C

	thumb_func_start ov102_021EA874
ov102_021EA874: @ 0x021EA874
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov102_021E8F6C
	cmp r0, #2
	bne _021EA8A4
	ldr r0, [r4, #4]
	bl ov102_021E8F84
	adds r0, r0, #1
	adds r4, #0xa0
	lsls r5, r0, #5
	adds r0, r4, r5
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFC6C
	adds r0, r4, r5
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFCC0
	pop {r3, r4, r5, pc}
_021EA8A4:
	adds r0, r4, #0
	adds r0, #0xa0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFC6C
	adds r4, #0xa0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	blx FUN_020CFCC0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EA874

	thumb_func_start ov102_021EA8C0
ov102_021EA8C0: @ 0x021EA8C0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov102_021E8F6C
	cmp r0, #0
	beq _021EA8D8
	cmp r0, #1
	beq _021EA8F0
	cmp r0, #2
	beq _021EA916
	pop {r4, pc}
_021EA8D8:
	adds r0, r4, #0
	movs r1, #0x68
	adds r0, #0x84
	strh r1, [r0]
	adds r0, r4, #0
	movs r1, #0x10
	adds r0, #0x86
	strh r1, [r0]
	movs r0, #1
	adds r4, #0x8c
	str r0, [r4]
	pop {r4, pc}
_021EA8F0:
	adds r0, r4, #0
	movs r1, #0x30
	adds r0, #0x84
	strh r1, [r0]
	adds r0, r4, #0
	movs r2, #0x10
	adds r0, #0x86
	strh r2, [r0]
	adds r0, r4, #0
	movs r1, #0xa0
	adds r0, #0x88
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x8a
	strh r2, [r0]
	movs r0, #2
	adds r4, #0x8c
	str r0, [r4]
	pop {r4, pc}
_021EA916:
	movs r0, #0
	adds r4, #0x8c
	str r0, [r4]
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EA8C0

	thumb_func_start ov102_021EA920
ov102_021EA920: @ 0x021EA920
	push {r4, r5, lr}
	sub sp, #0x54
	adds r4, r0, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _021EA93A
	adds r0, r4, #0
	adds r0, #0x84
	add r1, sp, #8
	bl ov102_021EAD5C
	b _021EA944
_021EA93A:
	movs r1, #0x80
	add r0, sp, #8
	strh r1, [r0]
	movs r1, #0x18
	strh r1, [r0, #2]
_021EA944:
	movs r2, #0
	ldr r0, [r4]
	add r1, sp, #0x30
	adds r3, r2, #0
	bl ov102_021EA270
	ldr r0, [r4]
	add r1, sp, #0xc
	movs r2, #1
	movs r3, #0
	bl ov102_021EA270
	movs r2, #0
	str r2, [sp]
	movs r0, #1
	str r0, [sp, #4]
	add r5, sp, #8
	movs r3, #2
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r0, [r4]
	add r1, sp, #0x30
	bl ov102_021EA2B4
	str r0, [r4, #0x60]
	movs r2, #0
	str r2, [sp]
	movs r5, #2
	str r5, [sp, #4]
	add r3, sp, #8
	ldrsh r2, [r3, r2]
	ldrsh r5, [r3, r5]
	ldr r3, _021EAA38 @ =0x000001E2
	ldr r0, [r4]
	ldrsh r3, [r4, r3]
	add r1, sp, #0xc
	subs r3, r5, r3
	bl ov102_021EA2B4
	movs r1, #1
	str r0, [r4, #0x64]
	bl FUN_020248F0
	adds r0, r4, #0
	movs r1, #1
	bl ov102_021EB088
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x30
	movs r2, #8
	movs r3, #0x40
	bl ov102_021EA2B4
	movs r1, #0x13
	str r0, [r4, #0x68]
	bl FUN_020248F0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x30
	movs r2, #0xf8
	movs r3, #0x40
	bl ov102_021EA2B4
	movs r1, #0x15
	str r0, [r4, #0x6c]
	bl FUN_020248F0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x30
	movs r2, #0x1c
	movs r3, #0x40
	bl ov102_021EA2B4
	movs r1, #0x12
	str r0, [r4, #0x74]
	bl FUN_020248F0
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #0x30
	movs r2, #0x80
	movs r3, #0x40
	bl ov102_021EA2B4
	str r0, [r4, #0x70]
	movs r1, #0x17
	bl FUN_020248F0
	ldr r0, [r4, #4]
	bl ov102_021E8F6C
	cmp r0, #2
	beq _021EAA34
	ldr r0, [r4, #0x6c]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x68]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x70]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x74]
	movs r1, #0
	bl FUN_02024830
_021EAA34:
	add sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_021EAA38: .4byte 0x000001E2
	thumb_func_end ov102_021EA920

	thumb_func_start ov102_021EAA3C
ov102_021EAA3C: @ 0x021EAA3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov102_021EA268
	str r0, [sp]
	adds r0, r5, #0
	bl ov102_021EA874
	movs r0, #0
	adds r4, r5, #0
	adds r6, r5, #0
	adds r7, r5, #0
	str r0, [sp, #4]
	adds r4, #0xc
	adds r6, #0x84
	adds r7, #0x88
_021EAA60:
	adds r0, r4, #0
	movs r1, #0xd
	bl FUN_0201D978
	ldr r0, [r5, #4]
	bl ov102_021E8F6C
	cmp r0, #0
	beq _021EAA7C
	cmp r0, #1
	beq _021EAA9A
	cmp r0, #2
	beq _021EAAD4
	b _021EAAE8
_021EAA7C:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov102_021EAD70
	ldr r0, [r5, #4]
	movs r1, #0
	bl ov102_021E8F90
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov102_021EAD98
	b _021EAAE8
_021EAA9A:
	adds r0, r4, #0
	adds r1, r6, #0
	bl ov102_021EAD70
	adds r0, r4, #0
	adds r1, r7, #0
	bl ov102_021EAD70
	ldr r0, [r5, #4]
	movs r1, #0
	bl ov102_021E8F90
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl ov102_021EAD98
	ldr r0, [r5, #4]
	movs r1, #1
	bl ov102_021E8F90
	adds r3, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl ov102_021EAD98
	b _021EAAE8
_021EAAD4:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021EAB30
	adds r1, r5, #0
	adds r1, #0x8c
	str r0, [r1]
	adds r0, r5, #0
	bl ov102_021EAC20
_021EAAE8:
	adds r0, r4, #0
	bl FUN_0201D8A0
	ldr r0, [sp, #4]
	adds r4, #0x10
	adds r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #2
	blt _021EAA60
	ldr r0, [sp]
	movs r1, #0
	bl FUN_0201EFBC
	ldr r0, [sp]
	movs r1, #4
	bl FUN_0201EFBC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov102_021EAA3C

	thumb_func_start ov102_021EAB10
ov102_021EAB10: @ 0x021EAB10
	lsls r2, r2, #2
	adds r2, r0, r2
	movs r0, #0x84
	ldrsh r0, [r2, r0]
	subs r0, #0x18
	strb r0, [r1, #2]
	ldrb r0, [r1, #2]
	adds r0, #0x60
	strb r0, [r1, #3]
	movs r0, #0x86
	ldrsh r0, [r2, r0]
	strb r0, [r1]
	ldrb r0, [r1]
	adds r0, #0x10
	strb r0, [r1, #1]
	bx lr
	thumb_func_end ov102_021EAB10

	thumb_func_start ov102_021EAB30
ov102_021EAB30: @ 0x021EAB30
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r0, #4]
	movs r1, #0x23
	bl ov102_021E8FA8
	movs r4, #0
	str r0, [sp, #0x20]
	movs r0, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	adds r0, #0x94
	str r4, [sp, #0x1c]
	adds r5, r4, #0
	bl ov102_021EAC44
	ldr r7, [sp, #0x10]
	adds r0, r7, #0
	adds r6, r7, #0
	str r0, [sp, #0x24]
	adds r0, #0x94
	adds r6, #0x84
	str r0, [sp, #0x24]
_021EAB64:
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	bl ov102_021EAC7C
	cmp r0, #3
	bhi _021EABFC
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EAB7C: @ jump table
	.2byte _021EAB84 - _021EAB7C - 2 @ case 0
	.2byte _021EABAC - _021EAB7C - 2 @ case 1
	.2byte _021EABF2 - _021EAB7C - 2 @ case 2
	.2byte _021EABF8 - _021EAB7C - 2 @ case 3
_021EAB84:
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EAC18 @ =0x0003040D
	ldr r2, [sp, #0x20]
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	movs r1, #1
	adds r3, r5, #0
	bl FUN_020200FC
	ldr r1, [sp, #0x20]
	movs r0, #1
	movs r2, #0
	bl FUN_02002F30
	adds r5, r5, r0
	b _021EABFC
_021EABAC:
	adds r1, r5, #0
	adds r0, r7, #0
	adds r1, #0x32
	adds r0, #0x84
	strh r1, [r0]
	adds r1, r4, #0
	adds r0, r7, #0
	adds r1, #8
	adds r0, #0x86
	strh r1, [r0]
	ldr r0, [sp, #0x14]
	adds r1, r6, #0
	bl ov102_021EAD70
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0, #4]
	bl ov102_021E8F90
	adds r3, r0, #0
	ldr r0, _021EAC1C @ =0x0000FFFF
	cmp r3, r0
	beq _021EABE4
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	adds r2, r6, #0
	bl ov102_021EAD98
_021EABE4:
	ldr r0, [sp, #0x1c]
	adds r7, r7, #4
	adds r0, r0, #1
	adds r6, r6, #4
	str r0, [sp, #0x1c]
	adds r5, #0x64
	b _021EABFC
_021EABF2:
	adds r4, #0x10
	movs r5, #0
	b _021EABFC
_021EABF8:
	movs r0, #0
	str r0, [sp, #0x18]
_021EABFC:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _021EAB64
	ldr r0, [sp, #0x10]
	adds r0, #0x94
	str r0, [sp, #0x10]
	bl ov102_021EAC70
	ldr r0, [sp, #0x20]
	bl FUN_02026380
	ldr r0, [sp, #0x1c]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EAC18: .4byte 0x0003040D
_021EAC1C: .4byte 0x0000FFFF
	thumb_func_end ov102_021EAB30

	thumb_func_start ov102_021EAC20
ov102_021EAC20: @ 0x021EAC20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov102_021E8FB4
	adds r1, r0, #0
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _021EAC40
	lsls r1, r1, #1
	adds r1, #0x1c
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x40
	bl FUN_0200DD88
_021EAC40:
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EAC20

	thumb_func_start ov102_021EAC44
ov102_021EAC44: @ 0x021EAC44
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r1, #4]
	movs r1, #0x23
	bl ov102_021E8FA8
	str r0, [r4]
	bl FUN_02026AA4
	str r0, [r4, #4]
	ldrh r1, [r0]
	ldr r0, _021EAC6C @ =0x0000FFFE
	cmp r1, r0
	bne _021EAC66
	movs r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
_021EAC66:
	movs r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	.align 2, 0
_021EAC6C: .4byte 0x0000FFFE
	thumb_func_end ov102_021EAC44

	thumb_func_start ov102_021EAC70
ov102_021EAC70: @ 0x021EAC70
	ldr r3, _021EAC78 @ =FUN_02026380
	ldr r0, [r0]
	bx r3
	nop
_021EAC78: .4byte FUN_02026380
	thumb_func_end ov102_021EAC70

	thumb_func_start ov102_021EAC7C
ov102_021EAC7C: @ 0x021EAC7C
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	str r1, [sp]
	mov ip, r0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021EAD0C
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_021EAC98: @ jump table
	.2byte _021EACA0 - _021EAC98 - 2 @ case 0
	.2byte _021EACF6 - _021EAC98 - 2 @ case 1
	.2byte _021EAD02 - _021EAC98 - 2 @ case 2
	.2byte _021EAD0C - _021EAC98 - 2 @ case 3
_021EACA0:
	cmp r0, #0
	bne _021EACDC
	ldr r6, _021EAD44 @ =0x0000FFFE
	movs r3, #0xe
	movs r0, #1
	movs r1, #3
	movs r2, #2
	adds r7, r6, #1
	lsls r3, r3, #0xc
_021EACB2:
	ldr r5, [r4, #4]
	ldrh r5, [r5]
	cmp r5, r3
	beq _021EACC4
	cmp r5, r6
	beq _021EACCC
	cmp r5, r7
	beq _021EACC8
	b _021EACD0
_021EACC4:
	str r2, [r4, #8]
	b _021EACD6
_021EACC8:
	str r1, [r4, #8]
	b _021EACD6
_021EACCC:
	str r0, [r4, #8]
	b _021EACD6
_021EACD0:
	ldr r5, [r4, #4]
	adds r5, r5, #2
	str r5, [r4, #4]
_021EACD6:
	ldr r5, [r4, #8]
	cmp r5, #0
	beq _021EACB2
_021EACDC:
	ldr r3, [r4, #4]
	mov r2, ip
	subs r3, r3, r2
	lsrs r2, r3, #0x1f
	adds r2, r3, r2
	asrs r2, r2, #1
	ldr r0, [sp]
	mov r1, ip
	adds r2, r2, #1
	bl FUN_02026A04
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021EACF6:
	mov r0, ip
	bl FUN_0201FB1C
	str r0, [r4, #4]
	movs r0, #1
	b _021EAD10
_021EAD02:
	mov r0, ip
	adds r0, r0, #2
	str r0, [r4, #4]
	movs r0, #2
	b _021EAD10
_021EAD0C:
	movs r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_021EAD10:
	ldr r1, [r4, #4]
	ldrh r2, [r1]
	movs r1, #0xe
	lsls r1, r1, #0xc
	cmp r2, r1
	beq _021EAD2A
	ldr r1, _021EAD44 @ =0x0000FFFE
	cmp r2, r1
	beq _021EAD36
	adds r1, r1, #1
	cmp r2, r1
	beq _021EAD30
	b _021EAD3C
_021EAD2A:
	movs r1, #2
	str r1, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_021EAD30:
	movs r1, #3
	str r1, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_021EAD36:
	movs r1, #1
	str r1, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
_021EAD3C:
	movs r1, #0
	str r1, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EAD44: .4byte 0x0000FFFE
	thumb_func_end ov102_021EAC7C

	thumb_func_start ov102_021EAD48
ov102_021EAD48: @ 0x021EAD48
	movs r2, #0
	ldrsh r2, [r0, r2]
	subs r2, #0x30
	strh r2, [r1]
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r0, #8
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021EAD48

	thumb_func_start ov102_021EAD5C
ov102_021EAD5C: @ 0x021EAD5C
	movs r2, #0
	ldrsh r2, [r0, r2]
	adds r2, #0x18
	strh r2, [r1]
	movs r2, #2
	ldrsh r0, [r0, r2]
	adds r0, #8
	strh r0, [r1, #2]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021EAD5C

	thumb_func_start ov102_021EAD70
ov102_021EAD70: @ 0x021EAD70
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	adds r0, r1, #0
	add r1, sp, #8
	bl ov102_021EAD48
	movs r0, #0x60
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	add r3, sp, #8
	ldrh r2, [r3]
	ldrh r3, [r3, #2]
	adds r0, r4, #0
	movs r1, #0xe
	bl FUN_0201DA74
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov102_021EAD70

	thumb_func_start ov102_021EAD98
ov102_021EAD98: @ 0x021EAD98
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, _021EADE8 @ =0x0000FFFF
	adds r6, r3, #0
	adds r4, r1, #0
	cmp r6, r0
	beq _021EADE2
	adds r0, r2, #0
	add r1, sp, #0x10
	bl ov102_021EAD48
	ldr r1, [r5, #0x7c]
	adds r0, r6, #0
	bl FUN_02015B1C
	ldr r1, [r5, #0x7c]
	movs r0, #1
	movs r2, #0
	bl FUN_02002F30
	add r3, sp, #0x10
	movs r0, #2
	ldrsh r0, [r3, r0]
	movs r6, #0
	movs r1, #1
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EADEC @ =0x0005060E
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldrsh r3, [r3, r6]
	ldr r2, [r5, #0x7c]
	adds r0, r4, #0
	bl FUN_020200FC
_021EADE2:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_021EADE8: .4byte 0x0000FFFF
_021EADEC: .4byte 0x0005060E
	thumb_func_end ov102_021EAD98

	thumb_func_start ov102_021EADF0
ov102_021EADF0: @ 0x021EADF0
	adds r0, #0x8c
	ldr r0, [r0]
	bx lr
	.align 2, 0
	thumb_func_end ov102_021EADF0

	thumb_func_start ov102_021EADF8
ov102_021EADF8: @ 0x021EADF8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	bl ov102_021EA268
	movs r1, #0x14
	str r1, [sp]
	movs r1, #0x18
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r1, #0x11
	str r1, [sp, #0xc]
	movs r1, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201C8C4
	ldr r0, [r5, #0x5c]
	bl FUN_0201D8C8
	adds r1, r5, #0
	adds r1, #0x2c
	lsls r0, r4, #4
	adds r0, r1, r0
	movs r1, #0x7b
	str r0, [r5, #0x5c]
	lsls r1, r1, #2
	ldrh r1, [r5, r1]
	movs r2, #0xf
	bl FUN_0200E948
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021EADF8

	thumb_func_start ov102_021EAE40
ov102_021EAE40: @ 0x021EAE40
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r5, r1, #0
	movs r1, #9
	bl FUN_0201D978
	cmp r5, #3
	bhi _021EAF34
	adds r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_021EAE60: @ jump table
	.2byte _021EAE68 - _021EAE60 - 2 @ case 0
	.2byte _021EAEEE - _021EAE60 - 2 @ case 1
	.2byte _021EAECA - _021EAE60 - 2 @ case 2
	.2byte _021EAF12 - _021EAE60 - 2 @ case 3
_021EAE68:
	movs r0, #2
	movs r1, #0x3c
	movs r2, #0
	bl FUN_0200BD18
	adds r5, r0, #0
	movs r0, #0x4b
	lsls r0, r0, #2
	movs r1, #0
	bl FUN_02026354
	movs r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	adds r2, r1, #0
	bl FUN_0200C168
	ldr r0, [r4, #4]
	bl ov102_021E8F70
	adds r1, r0, #0
	ldr r0, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	bl FUN_0200BB6C
	ldr r2, [r4, #0x7c]
	adds r0, r5, #0
	adds r1, r6, #0
	bl FUN_0200CBBC
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EAF40 @ =0x00010209
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x5c]
	adds r2, r6, #0
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r5, #0
	bl FUN_0200BDA0
	b _021EAF34
_021EAECA:
	ldr r0, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	movs r1, #6
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EAF40 @ =0x00010209
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x7c]
	bl FUN_020200FC
	b _021EAF34
_021EAEEE:
	ldr r0, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	movs r1, #7
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EAF40 @ =0x00010209
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x7c]
	bl FUN_020200FC
	b _021EAF34
_021EAF12:
	ldr r0, [r4, #0x78]
	ldr r2, [r4, #0x7c]
	movs r1, #8
	bl FUN_0200BB6C
	movs r3, #0
	str r3, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EAF40 @ =0x00010209
	movs r1, #1
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	ldr r0, [r4, #0x5c]
	ldr r2, [r4, #0x7c]
	bl FUN_020200FC
_021EAF34:
	ldr r0, [r4, #0x5c]
	bl FUN_0201D578
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EAF40: .4byte 0x00010209
	thumb_func_end ov102_021EAE40

	thumb_func_start ov102_021EAF44
ov102_021EAF44: @ 0x021EAF44
	ldr r3, _021EAF4C @ =ov102_021EB088
	movs r1, #0
	bx r3
	nop
_021EAF4C: .4byte ov102_021EB088
	thumb_func_end ov102_021EAF44

	thumb_func_start ov102_021EAF50
ov102_021EAF50: @ 0x021EAF50
	ldr r3, _021EAF58 @ =ov102_021EB088
	movs r1, #1
	bx r3
	nop
_021EAF58: .4byte ov102_021EB088
	thumb_func_end ov102_021EAF50

	thumb_func_start ov102_021EAF5C
ov102_021EAF5C: @ 0x021EAF5C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	adds r4, r1, #0
	bl FUN_02024830
	ldr r0, [r5, #0x64]
	adds r1, r4, #0
	bl FUN_02024830
	adds r0, r5, #0
	movs r1, #1
	bl ov102_021EB088
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EAF5C

	thumb_func_start ov102_021EAF7C
ov102_021EAF7C: @ 0x021EAF7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov102_021E8F6C
	cmp r0, #2
	bne _021EAFAA
	ldr r0, [r4, #0x68]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x6c]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x74]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x70]
	movs r1, #0
	bl FUN_02024830
_021EAFAA:
	pop {r4, pc}
	thumb_func_end ov102_021EAF7C

	thumb_func_start ov102_021EAFAC
ov102_021EAFAC: @ 0x021EAFAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov102_021E8F6C
	cmp r0, #2
	bne _021EAFEA
	ldr r0, [r4, #0x68]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x6c]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x74]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x70]
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #0x68]
	movs r1, #0x13
	bl FUN_020248F0
	ldr r0, [r4, #0x6c]
	movs r1, #0x15
	bl FUN_020248F0
_021EAFEA:
	pop {r4, pc}
	thumb_func_end ov102_021EAFAC

	thumb_func_start ov102_021EAFEC
ov102_021EAFEC: @ 0x021EAFEC
	ldr r0, [r0, #0x74]
	bx lr
	thumb_func_end ov102_021EAFEC

	thumb_func_start ov102_021EAFF0
ov102_021EAFF0: @ 0x021EAFF0
	push {r4, lr}
	sub sp, #0x10
	adds r4, r0, #0
	adds r0, #0x8c
	ldr r0, [r0]
	cmp r0, #0
	beq _021EB022
	adds r2, r4, #0
	lsls r0, r1, #2
	adds r2, #0x84
	adds r0, r2, r0
	add r1, sp, #0
	bl ov102_021EAD5C
	add r1, sp, #0
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #2
	ldrsh r0, [r1, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	b _021EB032
_021EB022:
	movs r0, #2
	lsls r0, r0, #0x12
	str r0, [sp, #4]
	movs r0, #6
	lsls r0, r0, #0xe
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
_021EB032:
	ldr r0, [r4, #0x60]
	add r1, sp, #4
	bl FUN_020247D4
	ldr r0, _021EB084 @ =0x000001E2
	ldrsh r1, [r4, r0]
	movs r0, #0xc0
	subs r0, r0, r1
	cmp r0, #0
	ble _021EB058
	lsls r0, r0, #0xc
	blx FUN_020F2178
	adds r1, r0, #0
	movs r0, #0x3f
	lsls r0, r0, #0x18
	blx FUN_020F1520
	b _021EB066
_021EB058:
	lsls r0, r0, #0xc
	blx FUN_020F2178
	movs r1, #0x3f
	lsls r1, r1, #0x18
	blx FUN_020F24C8
_021EB066:
	blx FUN_020F2104
	ldr r1, [sp, #8]
	adds r0, r1, r0
	str r0, [sp, #8]
	ldr r0, [r4, #0x64]
	add r1, sp, #4
	bl FUN_020247D4
	adds r0, r4, #0
	movs r1, #1
	bl ov102_021EB088
	add sp, #0x10
	pop {r4, pc}
	.align 2, 0
_021EB084: .4byte 0x000001E2
	thumb_func_end ov102_021EAFF0

	thumb_func_start ov102_021EB088
ov102_021EB088: @ 0x021EB088
	push {r3, lr}
	adds r2, r0, #0
	adds r2, #0x8c
	ldr r2, [r2]
	cmp r2, #0
	beq _021EB0AA
	cmp r1, #0
	ldr r0, [r0, #0x60]
	beq _021EB0A2
	movs r1, #0
	bl FUN_020248F0
	pop {r3, pc}
_021EB0A2:
	movs r1, #1
	bl FUN_020248F0
	pop {r3, pc}
_021EB0AA:
	cmp r1, #0
	ldr r0, [r0, #0x60]
	beq _021EB0B8
	movs r1, #0xe
	bl FUN_020248F0
	pop {r3, pc}
_021EB0B8:
	movs r1, #0xf
	bl FUN_020248F0
	pop {r3, pc}
	thumb_func_end ov102_021EB088

	thumb_func_start ov102_021EB0C0
ov102_021EB0C0: @ 0x021EB0C0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	bl ov102_021EA268
	adds r6, r0, #0
	add r0, sp, #0
	movs r1, #0
	movs r2, #0x14
	blx FUN_020D4994
	movs r0, #0
	ldr r2, _021EB12C @ =0x000001EE
	str r6, [sp]
	str r0, [sp, #4]
	ldrh r0, [r5, r2]
	movs r1, #0x19
	movs r3, #0xf
	str r0, [sp, #8]
	movs r0, #3
	str r0, [sp, #0xc]
	add r0, sp, #0
	strb r1, [r0, #0x10]
	movs r1, #0xc
	strb r1, [r0, #0x11]
	ldrb r1, [r0, #0x12]
	bics r1, r3
	adds r3, r2, #2
	ldr r3, [r5, r3]
	ldr r3, [r3]
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	movs r3, #0xf
	ands r3, r6
	orrs r1, r3
	strb r1, [r0, #0x12]
	ldrb r1, [r0, #0x12]
	movs r3, #0xf0
	bics r1, r3
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x18
	orrs r1, r3
	strb r1, [r0, #0x12]
	subs r0, r2, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl FUN_020166FC
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021EB12C: .4byte 0x000001EE
	thumb_func_end ov102_021EB0C0

	thumb_func_start ov102_021EB130
ov102_021EB130: @ 0x021EB130
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020168F4
	cmp r0, #1
	beq _021EB148
	cmp r0, #2
	beq _021EB14C
	b _021EB150
_021EB148:
	movs r4, #1
	b _021EB156
_021EB14C:
	movs r4, #0
	b _021EB156
_021EB150:
	movs r0, #0
	mvns r0, r0
	pop {r3, r4, r5, pc}
_021EB156:
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020169C0
	movs r0, #0x7a
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_020169CC
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EB130

	thumb_func_start ov102_021EB170
ov102_021EB170: @ 0x021EB170
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	adds r4, r1, #0
	adds r0, #0x4c
	movs r1, #9
	adds r3, r2, #0
	bl FUN_0201DA74
	adds r0, r5, #0
	adds r0, #0x80
	adds r5, #0x4c
	ldr r0, [r0]
	adds r1, r5, #0
	movs r2, #0
	lsls r3, r4, #4
	bl FUN_020157F0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021EB170

	thumb_func_start ov102_021EB1A4
ov102_021EB1A4: @ 0x021EB1A4
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x23
	movs r1, #0x68
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	movs r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #0x64]
	ldr r0, [r4]
	bl ov102_021EA268
	movs r2, #0x47
	str r0, [r4, #0x10]
	movs r0, #0
	movs r1, #0x1b
	lsls r2, r2, #2
	movs r3, #0x23
	bl FUN_0200BAF8
	str r0, [r4, #0x14]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov102_021EB1A4

	thumb_func_start ov102_021EB1E0
ov102_021EB1E0: @ 0x021EB1E0
	push {r4, lr}
	adds r4, r0, #0
	bl ov102_021EB29C
	ldr r0, [r4, #0x14]
	bl FUN_0200BB44
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EB1E0

	thumb_func_start ov102_021EB1F8
ov102_021EB1F8: @ 0x021EB1F8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	bl ov102_021EA268
	adds r6, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #4
	adds r2, r6, #0
	movs r3, #3
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #5
	adds r2, r6, #0
	movs r3, #3
	bl FUN_02007B44
	movs r0, #0x23
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0
	adds r3, #0x5c
	bl FUN_02007C2C
	str r0, [r5, #0x54]
	movs r0, #0x23
	adds r3, r5, #0
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #0
	adds r3, #0x60
	bl FUN_02007C2C
	str r0, [r5, #0x58]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov102_021EB46C
	adds r0, r5, #0
	bl ov102_021EB4D0
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov102_021EB2EC
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl ov102_021EB570
	adds r0, r5, #0
	movs r1, #1
	movs r2, #0
	bl ov102_021EB570
	adds r0, r6, #0
	movs r1, #3
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov102_021EB1F8

	thumb_func_start ov102_021EB29C
ov102_021EB29C: @ 0x021EB29C
	push {r3, r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7]
	bl ov102_021EA268
	str r0, [sp]
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _021EB2B2
	bl FUN_02024758
_021EB2B2:
	adds r4, r7, #0
	movs r6, #0
	adds r4, #0x24
	adds r5, r7, #0
_021EB2BA:
	adds r0, r4, #0
	bl FUN_0201D8C8
	adds r0, r4, #0
	bl FUN_0201D520
	ldr r0, [r5, #0x18]
	bl FUN_02026380
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, r5, #4
	cmp r6, #3
	blt _021EB2BA
	ldr r0, [r7, #0x58]
	bl FUN_0201AB0C
	ldr r0, [r7, #0x54]
	bl FUN_0201AB0C
	ldr r0, [sp]
	movs r1, #3
	bl FUN_0201BF7C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov102_021EB29C

	thumb_func_start ov102_021EB2EC
ov102_021EB2EC: @ 0x021EB2EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	adds r6, r2, #0
	bl ov102_021EA268
	movs r1, #0xd
	str r1, [sp]
	movs r1, #9
	str r1, [sp, #4]
	movs r1, #7
	str r1, [sp, #8]
	movs r1, #0x11
	str r1, [sp, #0xc]
	movs r1, #0
	adds r2, r1, #0
	movs r3, #0x17
	str r0, [sp, #0x1c]
	bl FUN_0201C8C4
	adds r0, r5, #0
	adds r1, r6, #0
	bl ov102_021EB524
	cmp r4, #0
	bne _021EB330
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl FUN_0201BF7C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_021EB330:
	ldr r0, [r5, #0x5c]
	movs r1, #9
	str r1, [sp]
	movs r1, #7
	str r1, [sp, #4]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrh r2, [r0]
	movs r3, #0xd
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r0, [r0, #2]
	movs r2, #0x17
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	bl FUN_0201C4EC
	adds r4, r5, #0
	movs r6, #0
	adds r4, #0x24
_021EB366:
	adds r0, r4, #0
	movs r1, #0xe
	bl FUN_0201D978
	ldr r1, [r5, #0x18]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0x38
	subs r3, r1, r0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _021EB3B0 @ =0x0003010E
	lsrs r7, r3, #0x1f
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r7, r3, r7
	ldr r2, [r5, #0x18]
	adds r0, r4, #0
	movs r1, #4
	asrs r3, r7, #1
	bl FUN_020200FC
	adds r6, r6, #1
	adds r4, #0x10
	adds r5, r5, #4
	cmp r6, #2
	blt _021EB366
	ldr r0, [sp, #0x1c]
	movs r1, #0
	bl FUN_0201BF7C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EB3B0: .4byte 0x0003010E
	thumb_func_end ov102_021EB2EC

	thumb_func_start ov102_021EB3B4
ov102_021EB3B4: @ 0x021EB3B4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	ldr r0, [r5]
	adds r4, r1, #0
	bl ov102_021EA268
	adds r6, r0, #0
	cmp r4, #0
	bne _021EB3F6
	movs r1, #0x14
	str r1, [sp]
	movs r1, #8
	str r1, [sp, #4]
	movs r1, #4
	str r1, [sp, #8]
	movs r1, #0x11
	str r1, [sp, #0xc]
	movs r1, #0
	adds r2, r1, #0
	movs r3, #0x18
	bl FUN_0201C8C4
	adds r5, #0x44
	adds r0, r5, #0
	bl FUN_0201D8C8
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
_021EB3F6:
	ldr r2, [r5, #0x5c]
	movs r1, #8
	str r1, [sp]
	movs r1, #4
	str r1, [sp, #4]
	adds r1, r2, #0
	adds r1, #0xc
	str r1, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	movs r3, #7
	str r3, [sp, #0x10]
	ldrh r3, [r2]
	lsls r3, r3, #0x15
	lsrs r3, r3, #0x18
	str r3, [sp, #0x14]
	ldrh r2, [r2, #2]
	movs r3, #0x14
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x18]
	movs r2, #0x18
	bl FUN_0201C4EC
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0xe
	bl FUN_0201D978
	ldr r1, [r5, #0x20]
	movs r0, #4
	movs r2, #0
	bl FUN_02002F30
	movs r1, #0x30
	subs r3, r1, r0
	movs r1, #0
	str r1, [sp]
	lsrs r4, r3, #0x1f
	adds r4, r3, r4
	ldr r0, _021EB468 @ =0x0003010E
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x20]
	adds r0, #0x44
	movs r1, #4
	asrs r3, r4, #1
	bl FUN_020200FC
	adds r0, r6, #0
	movs r1, #0
	bl FUN_0201EFBC
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.align 2, 0
_021EB468: .4byte 0x0003010E
	thumb_func_end ov102_021EB3B4

	thumb_func_start ov102_021EB46C
ov102_021EB46C: @ 0x021EB46C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r6, _021EB4CC @ =0x021EC808
	str r0, [sp]
	str r1, [sp, #4]
	movs r7, #0
	adds r4, #0x24
	adds r5, r0, #0
_021EB47E:
	ldr r0, [sp, #4]
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_0201D4F8
	ldr r0, [sp]
	adds r1, r7, #0
	ldr r0, [r0, #0x14]
	bl FUN_0200BBA0
	str r0, [r5, #0x18]
	adds r7, r7, #1
	adds r6, #8
	adds r4, #0x10
	adds r5, r5, #4
	cmp r7, #3
	blo _021EB47E
	ldr r0, [sp]
	adds r0, #0x24
	bl FUN_0201D618
	ldr r0, [sp]
	movs r1, #0xe
	adds r0, #0x24
	bl FUN_0201D978
	ldr r0, [sp]
	adds r0, #0x34
	bl FUN_0201D618
	ldr r0, [sp]
	movs r1, #0xe
	adds r0, #0x34
	str r0, [sp]
	bl FUN_0201D978
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EB4CC: .4byte 0x021EC808
	thumb_func_end ov102_021EB46C

	thumb_func_start ov102_021EB4D0
ov102_021EB4D0: @ 0x021EB4D0
	push {r3, r4, lr}
	sub sp, #0x2c
	adds r4, r0, #0
	movs r2, #0
	ldr r0, [r4]
	add r1, sp, #8
	adds r3, r2, #0
	bl ov102_021EA270
	movs r0, #5
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #8
	movs r2, #0xdc
	movs r3, #0x78
	bl ov102_021EA2B4
	str r0, [r4, #0xc]
	movs r1, #2
	bl FUN_020248F0
	ldr r0, [r4, #0xc]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x2c
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EB4D0

	thumb_func_start ov102_021EB50C
ov102_021EB50C: @ 0x021EB50C
	ldr r3, _021EB514 @ =FUN_020248F0
	ldr r0, [r0, #0xc]
	movs r1, #3
	bx r3
	.align 2, 0
_021EB514: .4byte FUN_020248F0
	thumb_func_end ov102_021EB50C

	thumb_func_start ov102_021EB518
ov102_021EB518: @ 0x021EB518
	ldr r3, _021EB520 @ =FUN_020248F0
	ldr r0, [r0, #0xc]
	movs r1, #2
	bx r3
	.align 2, 0
_021EB520: .4byte FUN_020248F0
	thumb_func_end ov102_021EB518

	thumb_func_start ov102_021EB524
ov102_021EB524: @ 0x021EB524
	ldr r3, _021EB52C @ =FUN_02024830
	ldr r0, [r0, #0xc]
	bx r3
	nop
_021EB52C: .4byte FUN_02024830
	thumb_func_end ov102_021EB524

	thumb_func_start ov102_021EB530
ov102_021EB530: @ 0x021EB530
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp, #8]
	cmp r1, #1
	beq _021EB542
	cmp r1, #2
	beq _021EB550
_021EB542:
	movs r0, #0x37
	lsls r0, r0, #0xe
	str r0, [sp]
	movs r0, #0x1e
	lsls r0, r0, #0xe
	str r0, [sp, #4]
	b _021EB55C
_021EB550:
	movs r0, #0x37
	lsls r0, r0, #0xe
	str r0, [sp]
	movs r0, #9
	lsls r0, r0, #0x10
	str r0, [sp, #4]
_021EB55C:
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r4, #0xc]
	movs r1, #2
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov102_021EB530

	thumb_func_start ov102_021EB570
ov102_021EB570: @ 0x021EB570
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	ldr r1, [r0, #0x60]
	movs r3, #0xb
	str r3, [sp]
	movs r5, #6
	adds r3, r1, #0
	str r5, [sp, #4]
	adds r3, #0xc
	muls r5, r2, r5
	str r3, [sp, #8]
	movs r3, #0
	lsls r2, r5, #0x18
	str r3, [sp, #0xc]
	lsrs r2, r2, #0x18
	str r2, [sp, #0x10]
	ldrh r2, [r1]
	lsls r2, r2, #0x15
	lsrs r2, r2, #0x18
	str r2, [sp, #0x14]
	ldrh r1, [r1, #2]
	lsls r2, r4, #4
	adds r2, r4, r2
	lsls r1, r1, #0x15
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	adds r2, r2, #2
	lsls r2, r2, #0x18
	ldr r0, [r0, #0x10]
	movs r1, #3
	lsrs r2, r2, #0x18
	bl FUN_0201C4EC
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov102_021EB570

	thumb_func_start ov102_021EB5B8
ov102_021EB5B8: @ 0x021EB5B8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _021EB5CA
	cmp r0, #1
	beq _021EB602
	pop {r3, r4, r5, pc}
_021EB5CA:
	ldrh r1, [r4, #0xa]
	ldr r0, [r4]
	movs r2, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	bl ov102_021EB570
	ldrh r2, [r4, #0xa]
	movs r1, #1
	ldr r0, [r4]
	eors r1, r2
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0
	bl ov102_021EB570
	ldr r0, [r4]
	movs r1, #3
	ldr r0, [r0, #0x10]
	bl FUN_0201EFBC
	ldrh r0, [r4, #0xc]
	adds r0, r0, #1
	strh r0, [r4, #0xc]
	ldr r0, [r4, #4]
	adds r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_021EB602:
	ldrh r0, [r4, #8]
	adds r0, r0, #1
	strh r0, [r4, #8]
	ldrh r0, [r4, #8]
	cmp r0, #4
	blo _021EB620
	ldr r0, [r4]
	movs r1, #0
	str r1, [r0, #0x64]
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	bl FUN_0200E390
_021EB620:
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EB5B8

	thumb_func_start ov102_021EB624
ov102_021EB624: @ 0x021EB624
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl ov102_021E8F7C
	adds r4, r0, #0
	movs r0, #0x23
	movs r1, #0x1c
	bl FUN_0201AA8C
	adds r1, r0, #0
	str r5, [r1]
	movs r0, #0
	str r0, [r1, #4]
	strh r0, [r1, #8]
	ldr r0, _021EB650 @ =ov102_021EB5B8
	movs r2, #1
	strh r4, [r1, #0xa]
	bl FUN_0200E320
	str r0, [r5, #0x64]
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EB650: .4byte ov102_021EB5B8
	thumb_func_end ov102_021EB624

	thumb_func_start ov102_021EB654
ov102_021EB654: @ 0x021EB654
	ldr r0, [r0, #0x64]
	cmp r0, #0
	bne _021EB65E
	movs r0, #1
	bx lr
_021EB65E:
	movs r0, #0
	bx lr
	.align 2, 0
	thumb_func_end ov102_021EB654

	thumb_func_start ov102_021EB664
ov102_021EB664: @ 0x021EB664
	push {r4, lr}
	movs r1, #1
	adds r4, r0, #0
	bl ov102_021EB3B4
	movs r1, #0
	adds r0, r4, #0
	adds r2, r1, #0
	bl ov102_021EB2EC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EB664

	thumb_func_start ov102_021EB67C
ov102_021EB67C: @ 0x021EB67C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl ov102_021EB3B4
	adds r0, r4, #0
	movs r1, #1
	movs r2, #0
	bl ov102_021EB2EC
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EB67C

	thumb_func_start ov102_021EB694
ov102_021EB694: @ 0x021EB694
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x23
	movs r1, #0x64
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	adds r0, r5, #0
	bl ov102_021EA268
	str r0, [r4, #0xc]
	movs r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x18]
	str r0, [r4, #0x5c]
	ldr r0, [r4, #4]
	bl ov102_021E8F68
	str r0, [r4, #0x60]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov102_021EB694

	thumb_func_start ov102_021EB6C8
ov102_021EB6C8: @ 0x021EB6C8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	cmp r0, #0
	beq _021EB6D6
	bl FUN_02024758
_021EB6D6:
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EB6C8

	thumb_func_start ov102_021EB6E0
ov102_021EB6E0: @ 0x021EB6E0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	adds r6, r1, #0
	bl ov102_021EA268
	adds r4, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #2
	adds r2, r4, #0
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r3, #1
	str r3, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r0, r6, #0
	movs r1, #3
	adds r2, r4, #0
	bl FUN_02007B44
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	lsrs r2, r2, #5
	bl ov102_021EB77C
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021EB880
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021EB94C
	movs r2, #0
	adds r0, r4, #0
	movs r1, #1
	subs r3, r2, #4
	bl FUN_0201BC8C
	adds r0, r4, #0
	movs r1, #1
	movs r2, #3
	movs r3, #0x10
	bl FUN_0201BC8C
	adds r0, r5, #0
	bl ov102_021EB950
	movs r1, #2
	adds r2, r1, #0
	ldr r0, _021EB778 @ =0x04000050
	subs r2, #0xc
	blx FUN_020CF178
	adds r0, r4, #0
	movs r1, #1
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021EB778: .4byte 0x04000050
	thumb_func_end ov102_021EB6E0

	thumb_func_start ov102_021EB77C
ov102_021EB77C: @ 0x021EB77C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r1, [sp, #0x18]
	movs r1, #0x1b
	adds r6, r2, #0
	adds r2, r1, #0
	str r0, [sp, #0x14]
	movs r0, #1
	adds r2, #0xff
	movs r3, #0x23
	bl FUN_0200BAF8
	str r0, [sp, #0x20]
	movs r0, #9
	movs r7, #1
	str r0, [sp, #0x24]
	movs r4, #0
_021EB79E:
	cmp r4, #0
	beq _021EB7B6
	adds r0, r4, #0
	movs r1, #3
	blx FUN_020F2998
	cmp r1, #0
	bne _021EB7B6
	ldr r0, [sp, #0x24]
	movs r7, #1
	adds r0, r0, #3
	str r0, [sp, #0x24]
_021EB7B6:
	ldr r0, [sp, #0x14]
	adds r1, r4, #0
	ldr r0, [r0, #8]
	bl FUN_02091C38
	cmp r0, #0
	beq _021EB7D4
	ldr r0, [sp, #0x20]
	adds r1, r4, #0
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r0, _021EB874 @ =0x0001020F
	str r0, [sp, #0x1c]
	b _021EB7E2
_021EB7D4:
	ldr r0, [sp, #0x20]
	movs r1, #0xc
	bl FUN_0200BBA0
	adds r5, r0, #0
	ldr r0, _021EB878 @ =0x0003040F
	str r0, [sp, #0x1c]
_021EB7E2:
	ldr r0, _021EB87C @ =0x000003EE
	cmp r6, r0
	blo _021EB7EC
	bl FUN_0202551C
_021EB7EC:
	ldr r0, [sp, #0x24]
	lsls r3, r7, #0x18
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #2
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	add r1, sp, #0x28
	movs r2, #1
	lsrs r3, r3, #0x18
	bl FUN_0201D40C
	add r0, sp, #0x28
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0
	adds r1, r5, #0
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0x48
	subs r0, r1, r0
	lsrs r3, r0, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	movs r1, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	add r0, sp, #0x28
	adds r2, r5, #0
	bl FUN_020200FC
	add r0, sp, #0x28
	bl FUN_0201D618
	add r0, sp, #0x28
	bl FUN_0201D8A0
	adds r0, r5, #0
	bl FUN_02026380
	add r0, sp, #0x28
	bl FUN_0201D520
	adds r4, r4, #1
	adds r6, #0x12
	adds r7, #0xa
	cmp r4, #0xc
	blt _021EB79E
	ldr r0, [sp, #0x20]
	bl FUN_0200BB44
	adds r0, r6, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EB874: .4byte 0x0001020F
_021EB878: .4byte 0x0003040F
_021EB87C: .4byte 0x000003EE
	thumb_func_end ov102_021EB77C

	thumb_func_start ov102_021EB880
ov102_021EB880: @ 0x021EB880
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r1, #0
	movs r1, #0xce
	adds r6, r0, #0
	lsls r1, r1, #2
	adds r0, r2, #0
	str r2, [sp, #0x14]
	cmp r0, r1
	blo _021EB898
	bl FUN_0202551C
_021EB898:
	movs r0, #0xa
	str r0, [sp]
	movs r0, #0x19
	str r0, [sp, #4]
	movs r0, #8
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x14]
	add r1, sp, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x10]
	adds r0, r4, #0
	movs r2, #1
	movs r3, #0x22
	bl FUN_0201D40C
	movs r0, #4
	movs r1, #0x23
	bl FUN_02026354
	adds r4, r0, #0
	add r0, sp, #0x20
	movs r1, #0xf
	bl FUN_0201D978
	bl ov102_021EC4A4
	adds r7, r0, #0
	ldr r5, _021EB940 @ =0x00000000
	beq _021EB91E
_021EB8D8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl ov102_021EC4A8
	adds r0, r5, #0
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl ov102_021EC4CC
	ldr r0, [r6, #8]
	adds r1, r5, #0
	bl FUN_02091C74
	cmp r0, #0
	beq _021EB8FA
	ldr r1, _021EB944 @ =0x0001020F
	b _021EB8FC
_021EB8FA:
	ldr r1, _021EB948 @ =0x0003040F
_021EB8FC:
	ldr r0, [sp, #0x18]
	adds r2, r4, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	add r0, sp, #0x20
	movs r1, #0
	adds r3, r3, #3
	bl FUN_020200FC
	adds r5, r5, #1
	cmp r5, r7
	blo _021EB8D8
_021EB91E:
	add r0, sp, #0x20
	bl FUN_0201D8A0
	add r0, sp, #0x20
	bl FUN_0201D618
	adds r0, r4, #0
	bl FUN_02026380
	add r0, sp, #0x20
	bl FUN_0201D520
	ldr r0, [sp, #0x14]
	adds r0, #0xc8
	str r0, [sp, #0x14]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EB940: .4byte 0x00000000
_021EB944: .4byte 0x0001020F
_021EB948: .4byte 0x0003040F
	thumb_func_end ov102_021EB880

	thumb_func_start ov102_021EB94C
ov102_021EB94C: @ 0x021EB94C
	adds r0, r2, #0
	bx lr
	thumb_func_end ov102_021EB94C

	thumb_func_start ov102_021EB950
ov102_021EB950: @ 0x021EB950
	push {r3, r4, lr}
	sub sp, #0x2c
	adds r4, r0, #0
	movs r2, #0
	ldr r0, [r4]
	add r1, sp, #8
	adds r3, r2, #0
	bl ov102_021EA270
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #8
	movs r2, #0x30
	movs r3, #0x40
	bl ov102_021EA2B4
	str r0, [r4, #0x5c]
	movs r1, #4
	bl FUN_020248F0
	ldr r0, [r4, #0x5c]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x2c
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EB950

	thumb_func_start ov102_021EB98C
ov102_021EB98C: @ 0x021EB98C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	ldr r0, [r4, #0x5c]
	beq _021EB9B8
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #4]
	bl ov102_021E8F7C
	cmp r0, #0
	ldr r0, [r4, #0x5c]
	bne _021EB9B0
	movs r1, #4
	bl FUN_020248F0
	pop {r4, pc}
_021EB9B0:
	movs r1, #6
	bl FUN_020248F0
	pop {r4, pc}
_021EB9B8:
	movs r1, #0
	bl FUN_02024830
	pop {r4, pc}
	thumb_func_end ov102_021EB98C

	thumb_func_start ov102_021EB9C0
ov102_021EB9C0: @ 0x021EB9C0
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #4]
	adds r5, r1, #0
	bl ov102_021E8F7C
	movs r1, #0
	str r1, [sp, #0x10]
	cmp r5, #0xfe
	bne _021EB9E2
	movs r0, #0xe0
	str r0, [sp, #8]
	movs r0, #0xb0
	str r0, [sp, #0xc]
	movs r5, #0x10
	b _021EBA22
_021EB9E2:
	cmp r0, #0
	bne _021EBA0A
	adds r0, r5, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r0, #0x50
	muls r0, r1, r0
	adds r0, #0x30
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #3
	blx FUN_020F2BA4
	movs r1, #0x18
	muls r1, r0, r1
	adds r1, #0x40
	str r1, [sp, #0xc]
	movs r5, #4
	b _021EBA22
_021EBA0A:
	adds r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov102_021EC4CC
	ldr r0, [sp, #4]
	movs r5, #6
	adds r0, #0x1a
	str r0, [sp, #8]
	ldr r0, [sp]
	adds r0, #0x48
	str r0, [sp, #0xc]
_021EBA22:
	ldr r0, [sp, #8]
	add r1, sp, #8
	lsls r0, r0, #0xc
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x5c]
	bl FUN_020247D4
	ldr r0, [r4, #0x5c]
	adds r1, r5, #0
	bl FUN_020248F0
	add sp, #0x14
	pop {r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EB9C0

	thumb_func_start ov102_021EBA44
ov102_021EBA44: @ 0x021EBA44
	push {r3, lr}
	movs r3, #0
	str r3, [r0, #0x14]
	movs r1, #0x10
	str r1, [sp]
	movs r1, #2
	adds r2, r1, #0
	adds r0, #0x1c
	subs r2, #0xc
	bl ov102_021EC410
	pop {r3, pc}
	thumb_func_end ov102_021EBA44

	thumb_func_start ov102_021EBA5C
ov102_021EBA5C: @ 0x021EBA5C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021EBA6E
	cmp r0, #1
	beq _021EBA98
	b _021EBAA4
_021EBA6E:
	adds r0, r4, #0
	adds r0, #0x1c
	bl ov102_021EC450
	cmp r0, #0
	beq _021EBAA4
	movs r0, #0
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #1
	ldr r1, [r4, #0xc]
	adds r0, #0x3c
	adds r3, r2, #0
	bl ov102_021EC298
	ldr r0, [r4, #0x14]
	adds r0, r0, #1
	str r0, [r4, #0x14]
	b _021EBAA4
_021EBA98:
	adds r4, #0x3c
	adds r0, r4, #0
	bl ov102_021EC2EC
	add sp, #8
	pop {r4, pc}
_021EBAA4:
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EBA5C

	thumb_func_start ov102_021EBAAC
ov102_021EBAAC: @ 0x021EBAAC
	push {r3, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r0, #0
	str r0, [r1, #0x14]
	str r0, [sp]
	movs r0, #6
	str r0, [sp, #4]
	adds r0, r1, #0
	movs r2, #1
	ldr r1, [r1, #0xc]
	adds r0, #0x3c
	adds r3, r2, #0
	bl ov102_021EC298
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021EBAAC

	thumb_func_start ov102_021EBAD0
ov102_021EBAD0: @ 0x021EBAD0
	push {r3, r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021EBAE2
	cmp r0, #1
	beq _021EBB0A
	b _021EBB16
_021EBAE2:
	adds r0, r4, #0
	adds r0, #0x3c
	bl ov102_021EC2EC
	cmp r0, #0
	beq _021EBB16
	movs r0, #0x10
	movs r2, #0
	str r0, [sp]
	adds r0, r4, #0
	adds r3, r2, #0
	adds r0, #0x1c
	movs r1, #2
	subs r3, #0xa
	bl ov102_021EC410
	ldr r0, [r4, #0x14]
	adds r0, r0, #1
	str r0, [r4, #0x14]
	b _021EBB16
_021EBB0A:
	adds r4, #0x1c
	adds r0, r4, #0
	bl ov102_021EC450
	add sp, #4
	pop {r3, r4, pc}
_021EBB16:
	movs r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov102_021EBAD0

	thumb_func_start ov102_021EBB1C
ov102_021EBB1C: @ 0x021EBB1C
	push {r3, lr}
	ldr r0, [r0, #0xc]
	movs r1, #1
	movs r2, #3
	movs r3, #0x10
	bl FUN_0201BC8C
	pop {r3, pc}
	thumb_func_end ov102_021EBB1C

	thumb_func_start ov102_021EBB2C
ov102_021EBB2C: @ 0x021EBB2C
	push {r3, lr}
	movs r2, #0
	movs r1, #0x10
	adds r3, r2, #0
	str r1, [sp]
	adds r0, #0x1c
	movs r1, #2
	subs r3, #0xa
	bl ov102_021EC410
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021EBB2C

	thumb_func_start ov102_021EBB44
ov102_021EBB44: @ 0x021EBB44
	ldr r3, _021EBB4C @ =ov102_021EC450
	adds r0, #0x1c
	bx r3
	nop
_021EBB4C: .4byte ov102_021EC450
	thumb_func_end ov102_021EBB44

	thumb_func_start ov102_021EBB50
ov102_021EBB50: @ 0x021EBB50
	push {r3, lr}
	sub sp, #8
	movs r1, #0
	str r1, [sp]
	movs r1, #0xc
	str r1, [sp, #4]
	adds r0, #0x1c
	movs r1, #2
	movs r2, #0x3f
	movs r3, #0x7c
	bl ov102_021EC37C
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov102_021EBB50

	thumb_func_start ov102_021EBB6C
ov102_021EBB6C: @ 0x021EBB6C
	push {r3, lr}
	adds r0, #0x1c
	bl ov102_021EC3AC
	cmp r0, #0
	beq _021EBB84
	movs r0, #1
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #1
	pop {r3, pc}
_021EBB84:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end ov102_021EBB6C

	thumb_func_start ov102_021EBB88
ov102_021EBB88: @ 0x021EBB88
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x10
	str r0, [sp]
	ldr r0, _021EBBC0 @ =0x04000050
	movs r1, #2
	movs r2, #0x3f
	movs r3, #0
	blx FUN_020CF15C
	movs r0, #1
	adds r1, r0, #0
	bl FUN_0201BC28
	movs r0, #0x7c
	str r0, [sp]
	movs r0, #0xc
	adds r4, #0x1c
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0x3f
	movs r3, #0
	bl ov102_021EC37C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
_021EBBC0: .4byte 0x04000050
	thumb_func_end ov102_021EBB88

	thumb_func_start ov102_021EBBC4
ov102_021EBBC4: @ 0x021EBBC4
	ldr r3, _021EBBCC @ =ov102_021EC3AC
	adds r0, #0x1c
	bx r3
	nop
_021EBBCC: .4byte ov102_021EC3AC
	thumb_func_end ov102_021EBBC4

	thumb_func_start ov102_021EBBD0
ov102_021EBBD0: @ 0x021EBBD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov102_021E8F7C
	cmp r0, #0
	bne _021EBBE4
	movs r3, #3
	mvns r3, r3
	b _021EBBE6
_021EBBE4:
	movs r3, #0xfc
_021EBBE6:
	ldr r0, [r4, #0xc]
	movs r1, #1
	movs r2, #0
	bl FUN_0201BC8C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EBBD0

	thumb_func_start ov102_021EBBF4
ov102_021EBBF4: @ 0x021EBBF4
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #4]
	bl ov102_021E8F7C
	cmp r0, #0
	bne _021EBC0A
	movs r0, #0xff
	mvns r0, r0
	b _021EBC0E
_021EBC0A:
	movs r0, #1
	lsls r0, r0, #8
_021EBC0E:
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r4, #0
	ldr r1, [r4, #0xc]
	adds r0, #0x3c
	movs r2, #1
	movs r3, #0
	bl ov102_021EC298
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EBBF4

	thumb_func_start ov102_021EBC28
ov102_021EBC28: @ 0x021EBC28
	ldr r3, _021EBC30 @ =ov102_021EC2EC
	adds r0, #0x3c
	bx r3
	nop
_021EBC30: .4byte ov102_021EC2EC
	thumb_func_end ov102_021EBC28

	thumb_func_start ov102_021EBC34
ov102_021EBC34: @ 0x021EBC34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x23
	movs r1, #0x98
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	adds r0, r5, #0
	bl ov102_021EA268
	str r0, [r4, #0xc]
	movs r0, #0x20
	movs r1, #0x23
	bl FUN_02026354
	str r0, [r4, #0x3c]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x1a
	str r0, [sp, #4]
	movs r0, #0x20
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x10
	movs r2, #2
	movs r3, #4
	bl FUN_0201D40C
	movs r3, #0
	str r3, [sp]
	movs r1, #0xc
	str r1, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x20
	movs r2, #2
	bl FUN_0201D40C
	movs r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
	ldr r0, [r4, #4]
	bl ov102_021E8F68
	adds r1, r4, #0
	adds r1, #0x94
	str r0, [r1]
	adds r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov102_021EBC34

	thumb_func_start ov102_021EBCBC
ov102_021EBCBC: @ 0x021EBCBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _021EBCCA
	bl FUN_02024758
_021EBCCA:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _021EBCD4
	bl FUN_02024758
_021EBCD4:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _021EBCDE
	bl FUN_02024758
_021EBCDE:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _021EBCE8
	bl FUN_02026380
_021EBCE8:
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D520
	adds r0, r4, #0
	bl FUN_0201AB0C
	pop {r4, pc}
	thumb_func_end ov102_021EBCBC

	thumb_func_start ov102_021EBD00
ov102_021EBD00: @ 0x021EBD00
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r0, [r5]
	bl ov102_021EA268
	adds r4, r0, #0
	movs r0, #2
	movs r1, #0x20
	movs r2, #0
	movs r3, #0x23
	bl FUN_0201C1C4
	movs r2, #0
	str r2, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xc
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #2
	adds r3, r2, #0
	bl FUN_0201C8C4
	adds r0, r5, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D618
	adds r0, r5, #0
	adds r0, #0x10
	bl FUN_0201D8A0
	adds r0, r4, #0
	movs r1, #2
	bl FUN_0201BF7C
	adds r0, r5, #0
	bl ov102_021EBD68
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov102_021EBD00

	thumb_func_start ov102_021EBD68
ov102_021EBD68: @ 0x021EBD68
	push {r3, r4, lr}
	sub sp, #0x2c
	adds r4, r0, #0
	movs r2, #0
	ldr r0, [r4]
	add r1, sp, #8
	adds r3, r2, #0
	bl ov102_021EA270
	movs r0, #3
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #8
	movs r2, #0x48
	movs r3, #0x38
	bl ov102_021EA2B4
	str r0, [r4, #0x30]
	movs r1, #8
	bl FUN_020248F0
	ldr r0, [r4, #0x30]
	movs r1, #0
	bl FUN_02024830
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #8
	movs r2, #0xf0
	movs r3, #0x50
	bl ov102_021EA2B4
	str r0, [r4, #0x34]
	movs r1, #0x18
	bl FUN_020248F0
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl FUN_02024830
	movs r0, #4
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	add r1, sp, #8
	movs r2, #0xf0
	movs r3, #0x80
	bl ov102_021EA2B4
	str r0, [r4, #0x38]
	movs r1, #0x1a
	bl FUN_020248F0
	ldr r0, [r4, #0x38]
	movs r1, #0
	bl FUN_02024830
	add sp, #0x2c
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EBD68

	thumb_func_start ov102_021EBDEC
ov102_021EBDEC: @ 0x021EBDEC
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x10
	movs r1, #0
	bl FUN_0201D978
	adds r0, r6, #0
	bl ov102_021EC11C
	ldr r0, [r6, #4]
	bl ov102_021E8FD8
	adds r7, r0, #0
	cmp r7, #0xa
	bls _021EBE0C
	movs r7, #0xa
_021EBE0C:
	adds r0, r6, #0
	adds r0, #0x8c
	movs r5, #0
	ldr r4, [r0]
	cmp r7, #0
	bls _021EBE30
_021EBE18:
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl ov102_021EC13C
	movs r0, #1
	tst r0, r5
	beq _021EBE2A
	adds r4, #0x18
_021EBE2A:
	adds r5, r5, #1
	cmp r5, r7
	blo _021EBE18
_021EBE30:
	adds r6, #0x10
	adds r0, r6, #0
	bl FUN_0201D8A0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov102_021EBDEC

	thumb_func_start ov102_021EBE3C
ov102_021EBE3C: @ 0x021EBE3C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x10
	str r0, [sp]
	ldr r0, _021EBE7C @ =0x04000050
	movs r1, #4
	movs r2, #0x3f
	movs r3, #0
	blx FUN_020CF15C
	movs r0, #2
	movs r1, #1
	bl FUN_0201BC28
	adds r0, r4, #0
	movs r3, #0
	adds r0, #0x80
	str r3, [r0]
	movs r0, #0x7c
	str r0, [sp]
	movs r0, #0xc
	adds r4, #0x40
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x3f
	bl ov102_021EC37C
	add sp, #8
	pop {r4, pc}
	nop
_021EBE7C: .4byte 0x04000050
	thumb_func_end ov102_021EBE3C

	thumb_func_start ov102_021EBE80
ov102_021EBE80: @ 0x021EBE80
	push {r3, lr}
	adds r1, r0, #0
	adds r1, #0x80
	ldr r1, [r1]
	cmp r1, #0
	bne _021EBE9E
	adds r0, #0x40
	bl ov102_021EC3AC
	cmp r0, #0
	beq _021EBE9A
	movs r0, #1
	pop {r3, pc}
_021EBE9A:
	movs r0, #0
	pop {r3, pc}
_021EBE9E:
	movs r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021EBE80

	thumb_func_start ov102_021EBEA4
ov102_021EBEA4: @ 0x021EBEA4
	push {r3, lr}
	sub sp, #8
	adds r1, r0, #0
	movs r2, #0
	adds r1, #0x80
	str r2, [r1]
	str r2, [sp]
	movs r1, #0xc
	str r1, [sp, #4]
	adds r0, #0x40
	movs r1, #4
	movs r2, #0x3f
	movs r3, #0x7c
	bl ov102_021EC37C
	add sp, #8
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021EBEA4

	thumb_func_start ov102_021EBEC8
ov102_021EBEC8: @ 0x021EBEC8
	push {r3, lr}
	adds r1, r0, #0
	adds r1, #0x80
	ldr r1, [r1]
	cmp r1, #0
	bne _021EBEEA
	adds r0, #0x40
	bl ov102_021EC3AC
	cmp r0, #0
	beq _021EBEEE
	movs r0, #2
	movs r1, #0
	bl FUN_0201BC28
	movs r0, #1
	pop {r3, pc}
_021EBEEA:
	movs r0, #1
	pop {r3, pc}
_021EBEEE:
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021EBEC8

	thumb_func_start ov102_021EBEF4
ov102_021EBEF4: @ 0x021EBEF4
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	ldr r0, [r4, #0x30]
	beq _021EBF22
	movs r1, #1
	bl FUN_02024830
	ldr r0, [r4, #4]
	bl ov102_021E9050
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	bl FUN_02024830
	ldr r0, [r4, #4]
	bl ov102_021E9064
	adds r1, r0, #0
	ldr r0, [r4, #0x38]
	bl FUN_02024830
	pop {r4, pc}
_021EBF22:
	bl FUN_02024830
	ldr r0, [r4, #0x34]
	movs r1, #0
	bl FUN_02024830
	ldr r0, [r4, #0x38]
	movs r1, #0
	bl FUN_02024830
	pop {r4, pc}
	thumb_func_end ov102_021EBEF4

	thumb_func_start ov102_021EBF38
ov102_021EBF38: @ 0x021EBF38
	push {r3, r4, lr}
	sub sp, #0xc
	adds r4, r0, #0
	movs r0, #0
	mvns r0, r0
	cmp r1, r0
	bne _021EBF6A
	movs r0, #0xe
	lsls r0, r0, #0x10
	str r0, [sp]
	movs r0, #0xb
	lsls r0, r0, #0x10
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #0x30]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r4, #0x30]
	movs r1, #0x10
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, pc}
_021EBF6A:
	adds r2, r1, #0
	movs r0, #1
	ands r2, r0
	movs r0, #0x70
	muls r0, r2, r0
	adds r0, #0x48
	lsls r0, r0, #0xc
	str r0, [sp]
	lsrs r1, r1, #1
	movs r0, #0x18
	muls r0, r1, r0
	adds r0, #0x38
	lsls r0, r0, #0xc
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #0x30]
	add r1, sp, #0
	bl FUN_020247D4
	ldr r0, [r4, #0x30]
	movs r1, #8
	bl FUN_020248F0
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EBF38

	thumb_func_start ov102_021EBFA0
ov102_021EBFA0: @ 0x021EBFA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r1, #0
	adds r6, r0, #0
	bl ov102_021EC090
	lsls r0, r4, #1
	str r0, [sp, #8]
	adds r0, r6, #0
	adds r0, #0x90
	ldr r7, [r0]
	ldr r0, [sp, #8]
	adds r0, r7, r0
	str r0, [sp, #0x14]
	movs r0, #0x18
	muls r0, r4, r0
	str r0, [sp, #0xc]
	adds r0, r6, #0
	adds r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	adds r1, r0, r1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	str r1, [sp, #0x18]
	cmp r4, #0
	bge _021EBFE4
	ldr r0, [sp, #8]
	adds r5, r1, #0
	rsbs r0, r0, #0
	ldr r7, [sp, #0x14]
	str r0, [sp, #0x10]
	str r0, [sp, #8]
	b _021EC004
_021EBFE4:
	adds r0, #0x78
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, [sp, #8]
	adds r7, #0xa
	str r0, [sp, #0x10]
	ldr r0, [r6, #4]
	bl ov102_021E8FD8
	ldr r1, [sp, #8]
	adds r1, r1, r7
	cmp r1, r0
	bls _021EC004
	ldr r0, [sp, #0x10]
	subs r0, r0, #1
	str r0, [sp, #0x10]
_021EC004:
	ldr r0, [sp, #0x10]
	movs r4, #0
	cmp r0, #0
	ble _021EC02A
_021EC00C:
	adds r0, r6, #0
	adds r1, r7, r4
	adds r2, r5, #0
	bl ov102_021EC13C
	movs r0, #1
	tst r0, r4
	beq _021EC022
	adds r5, #0x18
	lsls r0, r5, #0x18
	lsrs r5, r0, #0x18
_021EC022:
	ldr r0, [sp, #0x10]
	adds r4, r4, #1
	cmp r4, r0
	blt _021EC00C
_021EC02A:
	adds r1, r6, #0
	ldr r0, [sp, #0x18]
	adds r1, #0x8c
	str r0, [r1]
	adds r1, r6, #0
	ldr r0, [sp, #0x14]
	adds r1, #0x90
	str r0, [r1]
	adds r0, r6, #0
	adds r0, #0x10
	bl FUN_0201D8A0
	ldr r0, [sp, #0xc]
	movs r2, #2
	str r0, [sp]
	ldr r0, [sp, #8]
	movs r3, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [r6, #0xc]
	adds r0, #0x60
	bl ov102_021EC298
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov102_021EBFA0

	thumb_func_start ov102_021EC05C
ov102_021EC05C: @ 0x021EC05C
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x60
	bl ov102_021EC2EC
	cmp r0, #0
	beq _021EC08A
	ldr r0, [r4, #4]
	bl ov102_021E9050
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	bl FUN_02024830
	ldr r0, [r4, #4]
	bl ov102_021E9064
	adds r1, r0, #0
	ldr r0, [r4, #0x38]
	bl FUN_02024830
	movs r0, #1
	pop {r4, pc}
_021EC08A:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov102_021EC05C

	thumb_func_start ov102_021EC090
ov102_021EC090: @ 0x021EC090
	push {r3, r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	cmp r1, #0
	ble _021EC0B0
	adds r0, #0x8c
	ldr r0, [r0]
	adds r0, #0x78
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r0, #0x18
	muls r0, r1, r0
	adds r0, r3, r0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	b _021EC0BE
_021EC0B0:
	adds r0, #0x8c
	ldr r4, [r0]
	movs r0, #0x18
	muls r0, r1, r0
	adds r0, r4, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
_021EC0BE:
	cmp r3, r4
	bge _021EC0E2
	movs r0, #0xd0
	str r0, [sp]
	subs r0, r4, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	lsls r3, r3, #0x10
	adds r5, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r1, #0
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	add sp, #8
	pop {r3, r4, r5, pc}
_021EC0E2:
	movs r0, #0xd0
	str r0, [sp]
	adds r0, #0x30
	subs r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	lsls r3, r3, #0x10
	adds r0, #0x10
	adds r2, r1, #0
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	movs r1, #0
	movs r0, #0xd0
	str r0, [sp]
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	adds r5, #0x10
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r1, #0
	adds r3, r1, #0
	bl FUN_0201DA74
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021EC090

	thumb_func_start ov102_021EC11C
ov102_021EC11C: @ 0x021EC11C
	push {r3, lr}
	adds r1, r0, #0
	movs r2, #0x30
	adds r1, #0x8c
	str r2, [r1]
	adds r1, r0, #0
	movs r3, #0
	adds r1, #0x90
	str r3, [r1]
	ldr r0, [r0, #0xc]
	movs r1, #2
	movs r2, #3
	bl FUN_0201BC8C
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov102_021EC11C

	thumb_func_start ov102_021EC13C
ov102_021EC13C: @ 0x021EC13C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	adds r5, r0, #0
	adds r4, r2, #0
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x3c]
	adds r7, r1, #0
	bl ov102_021E8FFC
	cmp r4, #0xf0
	bhi _021EC178
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EC208 @ =0x00010200
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	movs r3, #1
	adds r4, r7, #0
	ands r4, r3
	movs r3, #0x70
	ldr r2, [r5, #0x3c]
	adds r0, #0x10
	muls r3, r4, r3
	bl FUN_020200FC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021EC178:
	movs r0, #1
	lsls r0, r0, #8
	subs r6, r0, r4
	adds r0, r5, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0201D978
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _021EC208 @ =0x00010200
	adds r3, r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x3c]
	adds r0, #0x20
	bl FUN_020200FC
	movs r2, #0
	movs r0, #1
	adds r1, r7, #0
	ands r1, r0
	adds r7, r1, #0
	movs r0, #0x70
	muls r7, r0, r7
	movs r0, #0x60
	str r0, [sp]
	movs r1, #0x10
	str r1, [sp, #4]
	lsls r1, r7, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	lsls r1, r4, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	adds r0, r5, #0
	ldr r1, [r5, #0x2c]
	adds r0, #0x10
	adds r3, r2, #0
	bl FUN_0201D9D8
	movs r1, #0x60
	lsls r2, r7, #0x10
	lsls r3, r6, #0x10
	str r1, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	lsrs r2, r2, #0x10
	str r2, [sp, #8]
	movs r2, #0
	subs r0, r0, r6
	str r2, [sp, #0xc]
	lsls r0, r0, #0x10
	str r1, [sp, #0x10]
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	adds r0, r5, #0
	ldr r1, [r5, #0x2c]
	adds r0, #0x10
	lsrs r3, r3, #0x10
	bl FUN_0201D9D8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EC208: .4byte 0x00010200
	thumb_func_end ov102_021EC13C

	thumb_func_start ov102_021EC20C
ov102_021EC20C: @ 0x021EC20C
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0x23
	movs r1, #0x30
	adds r7, r2, #0
	bl FUN_0201AA8C
	adds r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	adds r0, r5, #0
	bl ov102_021EA268
	str r0, [r4, #0xc]
	adds r0, r5, #0
	bl ov102_021EA26C
	str r0, [r4, #0x10]
	movs r0, #0
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov102_021EC20C

	thumb_func_start ov102_021EC240
ov102_021EC240: @ 0x021EC240
	ldr r3, _021EC244 @ =FUN_0201AB0C
	bx r3
	.align 2, 0
_021EC244: .4byte FUN_0201AB0C
	thumb_func_end ov102_021EC240

	thumb_func_start ov102_021EC248
ov102_021EC248: @ 0x021EC248
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	adds r4, r1, #0
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #0xb
	movs r3, #5
	bl FUN_02007B68
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	movs r0, #1
	str r0, [sp, #8]
	movs r0, #0x23
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	adds r0, r4, #0
	movs r1, #0xc
	movs r3, #5
	bl FUN_02007B44
	ldr r0, [r5, #0xc]
	movs r1, #5
	bl FUN_0201BF7C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov102_021EC248

	thumb_func_start ov102_021EC290
ov102_021EC290: @ 0x021EC290
	bx lr
	.align 2, 0
	thumb_func_end ov102_021EC290

	thumb_func_start ov102_021EC294
ov102_021EC294: @ 0x021EC294
	bx lr
	.align 2, 0
	thumb_func_end ov102_021EC294

	thumb_func_start ov102_021EC298
ov102_021EC298: @ 0x021EC298
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	str r2, [r4, #4]
	cmp r3, #0
	bne _021EC2B2
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_0201BDF4
	str r0, [r4, #0xc]
	movs r0, #0
	b _021EC2BE
_021EC2B2:
	adds r0, r1, #0
	adds r1, r2, #0
	bl FUN_0201BE00
	str r0, [r4, #0xc]
	movs r0, #3
_021EC2BE:
	str r0, [r4, #8]
	ldr r0, [sp, #8]
	ldr r1, [r4, #0xc]
	adds r2, r1, r0
	ldr r1, _021EC2E8 @ =0x000001FF
	lsls r0, r0, #0xc
	ands r1, r2
	str r1, [r4, #0x10]
	ldr r1, [r4, #0xc]
	lsls r1, r1, #0xc
	str r1, [r4, #0xc]
	ldr r1, [sp, #0xc]
	blx FUN_020F2998
	str r0, [r4, #0x14]
	ldr r0, [sp, #0xc]
	strh r0, [r4, #0x18]
	movs r0, #0
	strh r0, [r4, #0x1a]
	pop {r4, pc}
	nop
_021EC2E8: .4byte 0x000001FF
	thumb_func_end ov102_021EC298

	thumb_func_start ov102_021EC2EC
ov102_021EC2EC: @ 0x021EC2EC
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x1a]
	cmp r0, #0
	beq _021EC300
	cmp r0, #1
	beq _021EC314
	cmp r0, #2
	beq _021EC32A
	b _021EC32E
_021EC300:
	ldr r0, _021EC334 @ =ov102_021EC338
	adds r1, r4, #0
	movs r2, #0
	bl ov102_021E93D4
	str r0, [r4, #0x1c]
	ldrh r0, [r4, #0x1a]
	adds r0, r0, #1
	strh r0, [r4, #0x1a]
	b _021EC32E
_021EC314:
	ldrh r0, [r4, #0x18]
	cmp r0, #0
	bne _021EC32E
	ldr r0, [r4, #0x1c]
	bl FUN_0200E390
	ldrh r0, [r4, #0x1a]
	adds r0, r0, #1
	strh r0, [r4, #0x1a]
	movs r0, #1
	pop {r4, pc}
_021EC32A:
	movs r0, #1
	pop {r4, pc}
_021EC32E:
	movs r0, #0
	pop {r4, pc}
	nop
_021EC334: .4byte ov102_021EC338
	thumb_func_end ov102_021EC2EC

	thumb_func_start ov102_021EC338
ov102_021EC338: @ 0x021EC338
	push {r4, lr}
	adds r4, r1, #0
	ldrh r0, [r4, #0x18]
	cmp r0, #0
	beq _021EC366
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x14]
	adds r3, r1, r0
	str r3, [r4, #0xc]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, [r4]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	asrs r3, r3, #0xc
	bl FUN_0201BC8C
	ldrh r0, [r4, #0x18]
	subs r0, r0, #1
	strh r0, [r4, #0x18]
	pop {r4, pc}
_021EC366:
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	lsls r1, r1, #0x18
	lsls r2, r2, #0x18
	ldr r0, [r4]
	ldr r3, [r4, #0x10]
	lsrs r1, r1, #0x18
	lsrs r2, r2, #0x18
	bl FUN_0201BC8C
	pop {r4, pc}
	thumb_func_end ov102_021EC338

	thumb_func_start ov102_021EC37C
ov102_021EC37C: @ 0x021EC37C
	push {r4, lr}
	adds r4, r0, #0
	str r1, [r4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	str r2, [r4, #4]
	str r1, [r4, #0x14]
	str r3, [r4, #8]
	subs r0, r0, r3
	blx FUN_020F2998
	str r0, [r4, #0x10]
	ldr r0, [sp, #8]
	movs r2, #0
	str r0, [r4, #0xc]
	ldr r0, _021EC3A8 @ =ov102_021EC3D4
	adds r1, r4, #0
	str r2, [r4, #0x18]
	bl ov102_021E93D4
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.align 2, 0
_021EC3A8: .4byte ov102_021EC3D4
	thumb_func_end ov102_021EC37C

	thumb_func_start ov102_021EC3AC
ov102_021EC3AC: @ 0x021EC3AC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _021EC3CC
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021EC3D0
	ldr r0, [r4, #0x1c]
	bl FUN_0200E390
	ldr r0, [r4, #0x18]
	adds r0, r0, #1
	str r0, [r4, #0x18]
	movs r0, #1
	pop {r4, pc}
_021EC3CC:
	movs r0, #1
	pop {r4, pc}
_021EC3D0:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov102_021EC3AC

	thumb_func_start ov102_021EC3D4
ov102_021EC3D4: @ 0x021EC3D4
	push {r3, lr}
	adds r2, r1, #0
	ldr r0, [r2, #0x14]
	cmp r0, #0
	beq _021EC3F0
	ldr r1, [r2, #8]
	ldr r0, [r2, #0x10]
	adds r0, r1, r0
	str r0, [r2, #8]
	asrs r3, r0, #3
	ldr r0, [r2, #0x14]
	subs r0, r0, #1
	str r0, [r2, #0x14]
	b _021EC3F4
_021EC3F0:
	ldr r0, [r2, #0xc]
	asrs r3, r0, #3
_021EC3F4:
	cmp r3, #0x10
	ble _021EC3FA
	movs r3, #0x10
_021EC3FA:
	movs r0, #0x10
	subs r0, r0, r3
	str r0, [sp]
	ldr r0, _021EC40C @ =0x04000050
	ldm r2, {r1, r2}
	blx FUN_020CF15C
	pop {r3, pc}
	nop
_021EC40C: .4byte 0x04000050
	thumb_func_end ov102_021EC3D4

	thumb_func_start ov102_021EC410
ov102_021EC410: @ 0x021EC410
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _021EC448 @ =0x04000050
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	blx FUN_020CF178
	ldr r1, [sp, #0x18]
	str r4, [r5]
	str r1, [r5, #0x14]
	lsls r0, r6, #0xc
	str r0, [r5, #8]
	lsls r2, r7, #0xc
	str r2, [r5, #0xc]
	ldr r0, [r5, #8]
	subs r0, r2, r0
	blx FUN_020F2998
	str r0, [r5, #0x10]
	movs r2, #0
	ldr r0, _021EC44C @ =ov102_021EC478
	adds r1, r5, #0
	str r2, [r5, #0x18]
	bl ov102_021E93D4
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_021EC448: .4byte 0x04000050
_021EC44C: .4byte ov102_021EC478
	thumb_func_end ov102_021EC410

	thumb_func_start ov102_021EC450
ov102_021EC450: @ 0x021EC450
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	bne _021EC470
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021EC474
	ldr r0, [r4, #0x1c]
	bl FUN_0200E390
	ldr r0, [r4, #0x18]
	adds r0, r0, #1
	str r0, [r4, #0x18]
	movs r0, #1
	pop {r4, pc}
_021EC470:
	movs r0, #1
	pop {r4, pc}
_021EC474:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end ov102_021EC450

	thumb_func_start ov102_021EC478
ov102_021EC478: @ 0x021EC478
	ldr r0, [r1, #0x14]
	cmp r0, #0
	beq _021EC490
	ldr r2, [r1, #8]
	ldr r0, [r1, #0x10]
	adds r0, r2, r0
	str r0, [r1, #8]
	asrs r2, r0, #0xc
	ldr r0, [r1, #0x14]
	subs r0, r0, #1
	str r0, [r1, #0x14]
	b _021EC494
_021EC490:
	ldr r0, [r1, #0xc]
	asrs r2, r0, #0xc
_021EC494:
	ldr r3, _021EC49C @ =FUN_020CF178
	ldr r0, _021EC4A0 @ =0x04000050
	ldr r1, [r1]
	bx r3
	.align 2, 0
_021EC49C: .4byte FUN_020CF178
_021EC4A0: .4byte 0x04000050
	thumb_func_end ov102_021EC478

	thumb_func_start ov102_021EC4A4
ov102_021EC4A4: @ 0x021EC4A4
	movs r0, #0x1b
	bx lr
	thumb_func_end ov102_021EC4A4

	thumb_func_start ov102_021EC4A8
ov102_021EC4A8: @ 0x021EC4A8
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r4, #0x1b
	blo _021EC4B6
	bl FUN_0202551C
_021EC4B6:
	movs r1, #0xa
	ldr r2, _021EC4C8 @ =0x021EC820
	muls r1, r4, r1
	adds r1, r2, r1
	adds r0, r5, #0
	movs r2, #2
	bl FUN_02026A04
	pop {r3, r4, r5, pc}
	.align 2, 0
_021EC4C8: .4byte 0x021EC820
	thumb_func_end ov102_021EC4A8

	thumb_func_start ov102_021EC4CC
ov102_021EC4CC: @ 0x021EC4CC
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	cmp r5, #0x1b
	blo _021EC4DC
	bl FUN_0202551C
_021EC4DC:
	movs r0, #0xa
	adds r1, r5, #0
	muls r1, r0, r1
	ldr r0, _021EC4F0 @ =0x021EC822
	ldrb r0, [r0, r1]
	str r0, [r4]
	ldr r0, _021EC4F4 @ =0x021EC823
	ldrb r0, [r0, r1]
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.align 2, 0
_021EC4F0: .4byte 0x021EC822
_021EC4F4: .4byte 0x021EC823
	thumb_func_end ov102_021EC4CC

	thumb_func_start ov102_021EC4F8
ov102_021EC4F8: @ 0x021EC4F8
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x1b
	blo _021EC504
	bl FUN_0202551C
_021EC504:
	movs r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _021EC510 @ =0x021EC824
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_021EC510: .4byte 0x021EC824
	thumb_func_end ov102_021EC4F8

	thumb_func_start ov102_021EC514
ov102_021EC514: @ 0x021EC514
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x1b
	blo _021EC520
	bl FUN_0202551C
_021EC520:
	movs r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _021EC52C @ =0x021EC825
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_021EC52C: .4byte 0x021EC825
	thumb_func_end ov102_021EC514

	thumb_func_start ov102_021EC530
ov102_021EC530: @ 0x021EC530
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x1b
	blo _021EC53C
	bl FUN_0202551C
_021EC53C:
	movs r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _021EC548 @ =0x021EC826
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_021EC548: .4byte 0x021EC826
	thumb_func_end ov102_021EC530

	thumb_func_start ov102_021EC54C
ov102_021EC54C: @ 0x021EC54C
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x1b
	blo _021EC558
	bl FUN_0202551C
_021EC558:
	movs r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _021EC564 @ =0x021EC827
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_021EC564: .4byte 0x021EC827
	thumb_func_end ov102_021EC54C

	thumb_func_start ov102_021EC568
ov102_021EC568: @ 0x021EC568
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x1b
	blo _021EC574
	bl FUN_0202551C
_021EC574:
	movs r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _021EC580 @ =0x021EC828
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_021EC580: .4byte 0x021EC828
	thumb_func_end ov102_021EC568

	thumb_func_start ov102_021EC584
ov102_021EC584: @ 0x021EC584
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #0x1b
	blo _021EC590
	bl FUN_0202551C
_021EC590:
	movs r0, #0xa
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _021EC59C @ =0x021EC829
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.align 2, 0
_021EC59C: .4byte 0x021EC829
	thumb_func_end ov102_021EC584

	thumb_func_start ov102_021EC5A0
ov102_021EC5A0: @ 0x021EC5A0
	push {r3, r4}
	ldr r4, _021EC5D4 @ =0x021EC820
	movs r3, #0
_021EC5A6:
	ldrb r2, [r4, #2]
	cmp r2, r0
	bhi _021EC5C4
	adds r2, #0x10
	cmp r0, r2
	bhs _021EC5C4
	ldrb r2, [r4, #3]
	cmp r2, r1
	bhi _021EC5C4
	adds r2, #0x10
	cmp r1, r2
	bhs _021EC5C4
	adds r0, r3, #0
	pop {r3, r4}
	bx lr
_021EC5C4:
	adds r3, r3, #1
	adds r4, #0xa
	cmp r3, #0x1b
	blo _021EC5A6
	movs r0, #0
	mvns r0, r0
	pop {r3, r4}
	bx lr
	.align 2, 0
_021EC5D4: .4byte 0x021EC820
	thumb_func_end ov102_021EC5A0

	.rodata

_021EC5D8:
	.byte 0x01, 0x86, 0x1E, 0x02, 0xB9, 0x86, 0x1E, 0x02
	.byte 0x40, 0x80, 0x14, 0xD7, 0xFF, 0x00, 0x00, 0x00, 0x0D, 0x7D, 0x1E, 0x02, 0x0D, 0x7D, 0x1E, 0x02
	.byte 0x1D, 0x82, 0x1E, 0x02, 0x30, 0x68, 0xE4, 0xFC, 0x68, 0xA0, 0xE4, 0xFC, 0xFF, 0x00, 0x00, 0x00
	.byte 0xA4, 0xBA, 0xC4, 0xFC, 0x00, 0x2A, 0x10, 0x68, 0x00, 0x2A, 0x98, 0xF0, 0xFF, 0x00, 0x00, 0x00
	.byte 0x70, 0x80, 0xC0, 0x00, 0x88, 0x98, 0xC0, 0x00, 0x10, 0x20, 0x50, 0xB0, 0xFF, 0x00, 0x00, 0x00
	.byte 0x70, 0x80, 0xC0, 0x00, 0x88, 0x98, 0xC0, 0x00, 0x10, 0x20, 0x18, 0x78, 0x10, 0x20, 0x88, 0xE8
	.byte 0xFF, 0x00, 0x00, 0x00, 0x70, 0x80, 0xC0, 0x00, 0x88, 0x98, 0xC0, 0x00, 0x34, 0x4C, 0x08, 0x28
	.byte 0x34, 0x4C, 0xD8, 0xF8, 0xFF, 0x00, 0x00, 0x00, 0x18, 0x50, 0x18, 0x70, 0x70, 0xA8, 0x18, 0x70
	.byte 0x28, 0x48, 0xB0, 0xD0, 0x78, 0x98, 0xB0, 0xD0, 0xFF, 0x00, 0x00, 0x00, 0xFE, 0x03, 0x02, 0x01
	.byte 0xFE, 0x04, 0x00, 0x02, 0xFE, 0x05, 0x01, 0x00, 0x00, 0x06, 0x05, 0x04, 0x01, 0x07, 0x03, 0x05
	.byte 0x02, 0x08, 0x04, 0x03, 0x03, 0x09, 0x08, 0x07, 0x04, 0x0A, 0x06, 0x08, 0x05, 0x0B, 0x07, 0x06
	.byte 0x06, 0xFE, 0x0B, 0x0A, 0x07, 0xFE, 0x09, 0x0B, 0x08, 0xFE, 0x0A, 0x09, 0x09, 0x00, 0xFE, 0xFE
	.byte 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x06, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1C, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x02
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCD, 0x94, 0x1E, 0x02, 0x95, 0x96, 0x1E, 0x02
	.byte 0x3D, 0x98, 0x1E, 0x02, 0x8D, 0x98, 0x1E, 0x02, 0xB9, 0x98, 0x1E, 0x02, 0xC5, 0x98, 0x1E, 0x02
	.byte 0xE1, 0x98, 0x1E, 0x02, 0xFD, 0x98, 0x1E, 0x02, 0x45, 0x99, 0x1E, 0x02, 0x79, 0x99, 0x1E, 0x02
	.byte 0x31, 0x9B, 0x1E, 0x02, 0xD1, 0x9B, 0x1E, 0x02, 0x71, 0x9C, 0x1E, 0x02, 0x45, 0x9D, 0x1E, 0x02
	.byte 0x61, 0x9E, 0x1E, 0x02, 0x39, 0x9F, 0x1E, 0x02, 0xAD, 0x9F, 0x1E, 0x02, 0xCD, 0x9F, 0x1E, 0x02
	.byte 0xED, 0x9F, 0x1E, 0x02, 0x0D, 0xA0, 0x1E, 0x02, 0x5D, 0xA0, 0x1E, 0x02, 0x79, 0xA0, 0x1E, 0x02
	.byte 0xD1, 0xA0, 0x1E, 0x02, 0x29, 0xA1, 0x1E, 0x02, 0x45, 0xA1, 0x1E, 0x02, 0x65, 0xA1, 0x1E, 0x02
	.byte 0x25, 0x9A, 0x1E, 0x02, 0x8D, 0x9A, 0x1E, 0x02, 0xB9, 0xA1, 0x1E, 0x02, 0xD5, 0xA1, 0x1E, 0x02
	.byte 0xF1, 0xA1, 0x1E, 0x02, 0x0D, 0xA2, 0x1E, 0x02, 0x00, 0x18, 0x0E, 0x07, 0x02, 0x0D, 0xF1, 0x03
	.byte 0x00, 0x18, 0x11, 0x07, 0x02, 0x0D, 0xE3, 0x03, 0x00, 0x19, 0x15, 0x06, 0x02, 0x0D, 0xD5, 0x03
	.byte 0x2B, 0x01, 0x18, 0x08, 0xFE, 0x0A, 0x09, 0x01, 0x00, 0x14, 0x2C, 0x01, 0x28, 0x08, 0xFE, 0x0B
	.byte 0x00, 0x02, 0x01, 0x15, 0x2D, 0x01, 0x38, 0x08, 0xFE, 0x0C, 0x01, 0x03, 0x02, 0x16, 0x2E, 0x01
	.byte 0x48, 0x08, 0xFE, 0x0D, 0x02, 0x04, 0x03, 0x17, 0x2F, 0x01, 0x58, 0x08, 0xFE, 0x0E, 0x03, 0x05
	.byte 0x04, 0x18, 0x30, 0x01, 0x68, 0x08, 0xFE, 0x0F, 0x04, 0x06, 0x05, 0x19, 0x31, 0x01, 0x78, 0x08
	.byte 0xFE, 0x10, 0x05, 0x07, 0x06, 0x10, 0x32, 0x01, 0x88, 0x08, 0xFE, 0x11, 0x06, 0x08, 0x07, 0x11
	.byte 0x33, 0x01, 0x98, 0x08, 0xFE, 0x12, 0x07, 0x09, 0x08, 0x12, 0x34, 0x01, 0xA8, 0x08, 0xFE, 0x13
	.byte 0x08, 0x00, 0x09, 0x1A, 0x35, 0x01, 0x18, 0x18, 0x00, 0x14, 0x13, 0x0B, 0x00, 0x14, 0x36, 0x01
	.byte 0x28, 0x18, 0x01, 0x15, 0x0A, 0x0C, 0x01, 0x15, 0x37, 0x01, 0x38, 0x18, 0x02, 0x16, 0x0B, 0x0D
	.byte 0x02, 0x16, 0x38, 0x01, 0x48, 0x18, 0x03, 0x17, 0x0C, 0x0E, 0x03, 0x17, 0x39, 0x01, 0x58, 0x18
	.byte 0x04, 0x18, 0x0D, 0x0F, 0x04, 0x18, 0x3A, 0x01, 0x68, 0x18, 0x05, 0x19, 0x0E, 0x10, 0x05, 0x19
	.byte 0x3B, 0x01, 0x78, 0x18, 0x06, 0xFE, 0x0F, 0x11, 0x06, 0x10, 0x3C, 0x01, 0x88, 0x18, 0x07, 0xFE
	.byte 0x10, 0x12, 0x07, 0x11, 0x3D, 0x01, 0x98, 0x18, 0x08, 0xFE, 0x11, 0x13, 0x08, 0x12, 0x3E, 0x01
	.byte 0xA8, 0x18, 0x09, 0x1A, 0x12, 0x0A, 0x09, 0x1A, 0x3F, 0x01, 0x18, 0x28, 0x0A, 0xFE, 0x1A, 0x15
	.byte 0x00, 0x14, 0x40, 0x01, 0x28, 0x28, 0x0B, 0xFE, 0x14, 0x16, 0x01, 0x15, 0x41, 0x01, 0x38, 0x28
	.byte 0x0C, 0xFE, 0x15, 0x17, 0x02, 0x16, 0x42, 0x01, 0x48, 0x28, 0x0D, 0xFE, 0x16, 0x18, 0x03, 0x17
	.byte 0x43, 0x01, 0x58, 0x28, 0x0E, 0xFE, 0x17, 0x19, 0x04, 0x18, 0x44, 0x01, 0x68, 0x28, 0x0F, 0xFE
	.byte 0x18, 0x1A, 0x05, 0x19, 0xAB, 0x01, 0xA8, 0x28, 0x13, 0xFE, 0x19, 0x14, 0x09, 0x1A, 0x00, 0x00
	@ 0x021EC930
