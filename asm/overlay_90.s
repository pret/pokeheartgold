	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov90_02258800
ov90_02258800: ; 0x02258800
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r2, r6, #0
	mov r1, #0x10
	mov r0, #0
_02258812:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02258812
	bl sub_020347A0
	strb r0, [r6, #8]
	bl sub_0203769C
	mov r5, #0
	add r7, r0, #0
	add r4, r5, #0
_0225882A:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _02258840
	cmp r7, r4
	bne _0225883A
	strb r5, [r6, #9]
_0225883A:
	add r0, r6, r5
	strb r4, [r0, #4]
	add r5, r5, #1
_02258840:
	add r4, r4, #1
	cmp r4, #4
	blt _0225882A
	ldrb r0, [r6, #8]
	cmp r5, r0
	beq _02258850
	bl GF_AssertFail
_02258850:
	ldr r0, [sp]
	cmp r0, #0
	bne _0225885A
	mov r0, #1
	strb r0, [r6, #0xb]
_0225885A:
	ldr r0, [sp, #4]
	str r0, [r6]
	ldr r0, [sp, #8]
	strb r0, [r6, #0xa]
	ldr r0, [sp, #0x20]
	str r0, [r6, #0xc]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_02258800

	thumb_func_start ov90_0225886C
ov90_0225886C: ; 0x0225886C
	ldrb r2, [r0, #8]
	mov r3, #0
	cmp r2, #0
	ble _02258888
_02258874:
	add r2, r0, r3
	ldrb r2, [r2, #4]
	cmp r1, r2
	bne _02258880
	add r0, r3, #0
	bx lr
_02258880:
	ldrb r2, [r0, #8]
	add r3, r3, #1
	cmp r3, r2
	blt _02258874
_02258888:
	mov r0, #4
	bx lr
	thumb_func_end ov90_0225886C

	thumb_func_start ov90_0225888C
ov90_0225888C: ; 0x0225888C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #8]
	add r4, r1, #0
	cmp r4, r0
	blo _0225889C
	bl GF_AssertFail
_0225889C:
	add r0, r5, r4
	ldrb r0, [r0, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov90_0225888C

	thumb_func_start ov90_022588A4
ov90_022588A4: ; 0x022588A4
	push {r3, lr}
	cmp r1, #4
	blo _022588B4
	blo _022588B0
	bl GF_AssertFail
_022588B0:
	mov r0, #0
	pop {r3, pc}
_022588B4:
	ldr r2, [r0, #0xc]
	add r0, r2, r1
	ldrb r1, [r0, #4]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _022588C6
	mov r0, #0
	pop {r3, pc}
_022588C6:
	add r0, r2, r1
	ldrb r0, [r0, #8]
	pop {r3, pc}
	thumb_func_end ov90_022588A4

	thumb_func_start ov90_022588CC
ov90_022588CC: ; 0x022588CC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _022588E0
	blo _022588DC
	bl GF_AssertFail
_022588DC:
	mov r0, #0
	pop {r3, r4, r5, pc}
_022588E0:
	ldrb r2, [r5, #0xb]
	cmp r2, #1
	bne _02258900
	bl ov90_0225886C
	ldrb r1, [r5, #9]
	cmp r0, r1
	bne _022588F8
	ldr r0, [r5]
	bl Sav2_PlayerData_GetProfileAddr
	pop {r3, r4, r5, pc}
_022588F8:
	add r0, r4, #0
	bl sub_02034818
	pop {r3, r4, r5, pc}
_02258900:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0225890A
	bl GF_AssertFail
_0225890A:
	ldr r1, [r5, #0xc]
	lsl r0, r4, #2
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_022588CC

	thumb_func_start ov90_02258914
ov90_02258914: ; 0x02258914
	ldr r3, _0225891C ; =ov90_02259588
	add r2, r1, #0
	mov r1, #0
	bx r3
	.balign 4, 0
_0225891C: .word ov90_02259588
	thumb_func_end ov90_02258914

	thumb_func_start ov90_02258920
ov90_02258920: ; 0x02258920
	ldr r3, _02258928 ; =ov90_02259588
	add r2, r1, #0
	mov r1, #1
	bx r3
	.balign 4, 0
_02258928: .word ov90_02259588
	thumb_func_end ov90_02258920

	thumb_func_start ov90_0225892C
ov90_0225892C: ; 0x0225892C
	ldr r3, _02258934 ; =ov90_02259588
	add r2, r1, #0
	mov r1, #2
	bx r3
	.balign 4, 0
_02258934: .word ov90_02259588
	thumb_func_end ov90_0225892C

	thumb_func_start ov90_02258938
ov90_02258938: ; 0x02258938
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _022589B8 ; =0x000005EC
	ldr r0, [r5, r0]
	bl DestroySysTask
	mov r0, #0x5f
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl DestroySysTask
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov90_0225A108
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov90_0225A340
	ldrb r0, [r5, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _02258980
	mov r0, #0x81
	lsl r0, r0, #2
	add r4, r5, r0
_02258970:
	add r0, r4, #0
	bl ov90_02259EAC
	ldrb r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x38
	cmp r6, r0
	blt _02258970
_02258980:
	add r0, r5, #0
	add r0, #0x4c
	bl ov90_02259434
	add r0, r5, #0
	bl ov90_02259784
	add r0, r5, #0
	add r0, #0x3c
	bl ov90_022591D4
	mov r0, #0x1b
	lsl r0, r0, #4
	add r0, r5, r0
	bl ov90_02258E10
	add r0, r5, #0
	add r0, #0x84
	bl ov90_02259158
	add r0, r5, #0
	add r0, #0x30
	bl ov90_02259084
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022589B8: .word 0x000005EC
	thumb_func_end ov90_02258938

	thumb_func_start ov90_022589BC
ov90_022589BC: ; 0x022589BC
	ldrb r0, [r0]
	cmp r0, #0x10
	blo _022589C6
	mov r0, #1
	bx lr
_022589C6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov90_022589BC

	thumb_func_start ov90_022589CC
ov90_022589CC: ; 0x022589CC
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #7]
	cmp r0, #1
	beq _022589DA
	bl GF_AssertFail
_022589DA:
	ldrb r0, [r4, #6]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov90_022589CC

	thumb_func_start ov90_022589E0
ov90_022589E0: ; 0x022589E0
	push {r3, lr}
	add r3, r2, #0
	mov r2, #0
	bl ov90_0225A6B4
	pop {r3, pc}
	thumb_func_end ov90_022589E0

	thumb_func_start ov90_022589EC
ov90_022589EC: ; 0x022589EC
	push {r3, lr}
	add r3, r2, #0
	mov r2, #1
	bl ov90_0225A6B4
	pop {r3, pc}
	thumb_func_end ov90_022589EC

	thumb_func_start ov90_022589F8
ov90_022589F8: ; 0x022589F8
	push {r3, lr}
	add r3, r2, #0
	mov r2, #2
	bl ov90_0225A6B4
	pop {r3, pc}
	thumb_func_end ov90_022589F8

	thumb_func_start ov90_02258A04
ov90_02258A04: ; 0x02258A04
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02258A90 ; =0x00000644
	ldr r0, [r5, r0]
	bl DestroySysTask
	ldr r0, _02258A94 ; =0x00000648
	ldr r0, [r5, r0]
	bl DestroySysTask
	mov r0, #0xcf
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov90_0225A108
	ldrb r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	ble _02258A40
	mov r0, #0x97
	lsl r0, r0, #2
	add r4, r5, r0
_02258A30:
	add r0, r4, #0
	bl ov90_02259EAC
	ldrb r0, [r5, #0x14]
	add r6, r6, #1
	add r4, #0x38
	cmp r6, r0
	blt _02258A30
_02258A40:
	mov r0, #0x7a
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov90_0225B380
	add r0, r5, #0
	bl ov90_0225A960
	add r0, r5, #0
	add r0, #0x68
	bl ov90_02259434
	add r0, r5, #0
	add r0, #0x58
	bl ov90_022591D4
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov90_02258E10
	add r0, r5, #0
	add r0, #0xa0
	bl ov90_02259158
	add r0, r5, #0
	add r0, #0x4c
	bl ov90_02259084
	ldr r0, _02258A98 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _02258A9C ; =0x04001050
	strh r1, [r0]
	bl GF_DestroyVramTransferManager
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02258A90: .word 0x00000644
_02258A94: .word 0x00000648
_02258A98: .word 0x04000050
_02258A9C: .word 0x04001050
	thumb_func_end ov90_02258A04

	thumb_func_start ov90_02258AA0
ov90_02258AA0: ; 0x02258AA0
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end ov90_02258AA0

	thumb_func_start ov90_02258AA4
ov90_02258AA4: ; 0x02258AA4
	ldrb r0, [r0, #8]
	bx lr
	thumb_func_end ov90_02258AA4

	thumb_func_start ov90_02258AA8
ov90_02258AA8: ; 0x02258AA8
	push {r3, r4, r5, r6, r7}
	sub sp, #4
	add r5, r0, #0
	mov r7, #0
	mov ip, r1
	add r0, r1, #0
	beq _02258AE8
	add r3, r5, #0
_02258AB8:
	add r2, r7, #0
	cmp r7, #0
	ble _02258ADA
	add r0, sp, #0
	add r4, r0, r7
_02258AC2:
	sub r0, r4, #1
	ldrb r1, [r0]
	ldr r0, [r3]
	lsl r6, r1, #2
	ldr r6, [r5, r6]
	cmp r0, r6
	bls _02258ADA
	sub r2, r2, #1
	strb r1, [r4]
	sub r4, r4, #1
	cmp r2, #0
	bgt _02258AC2
_02258ADA:
	add r0, sp, #0
	strb r7, [r0, r2]
	add r7, r7, #1
	mov r0, ip
	add r3, r3, #4
	cmp r7, r0
	blo _02258AB8
_02258AE8:
	mov r0, ip
	mov r4, #0
	cmp r0, #0
	bls _02258B1E
	add r3, sp, #0
_02258AF2:
	add r2, r4, #0
	cmp r4, #0
	ble _02258B0E
	sub r0, r3, #1
	ldrb r1, [r0]
	ldrb r0, [r3]
	lsl r6, r1, #2
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r6, [r5, r6]
	cmp r0, r6
	bne _02258B0E
	add r0, r5, r1
	ldrb r2, [r0, #0x10]
_02258B0E:
	ldrb r0, [r3]
	add r4, r4, #1
	add r3, r3, #1
	add r0, r5, r0
	strb r2, [r0, #0x10]
	mov r0, ip
	cmp r4, r0
	blo _02258AF2
_02258B1E:
	add sp, #4
	pop {r3, r4, r5, r6, r7}
	bx lr
	thumb_func_end ov90_02258AA8

	thumb_func_start ov90_02258B24
ov90_02258B24: ; 0x02258B24
	strb r1, [r0, #6]
	mov r1, #1
	strb r1, [r0, #7]
	bx lr
	thumb_func_end ov90_02258B24

	thumb_func_start ov90_02258B2C
ov90_02258B2C: ; 0x02258B2C
	push {r3, lr}
	add r3, r0, #0
	ldrb r0, [r3, #0x15]
	cmp r0, #0
	bne _02258B42
	mov r0, #0x7a
	lsl r0, r0, #2
	add r0, r3, r0
	ldrb r3, [r3, #0x14]
	bl ov90_0225B53C
_02258B42:
	pop {r3, pc}
	thumb_func_end ov90_02258B2C

	thumb_func_start ov90_02258B44
ov90_02258B44: ; 0x02258B44
	mov r2, #0x7a
	lsl r2, r2, #2
	ldr r3, _02258B50 ; =ov90_0225B594
	add r0, r0, r2
	bx r3
	nop
_02258B50: .word ov90_0225B594
	thumb_func_end ov90_02258B44

	thumb_func_start ov90_02258B54
ov90_02258B54: ; 0x02258B54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r4, #0
	cmp r0, #0
	beq _02258B94
	bl sub_02037454
	ldrb r1, [r5, #8]
	cmp r1, r0
	beq _02258B6C
	mov r4, #1
_02258B6C:
	bl sub_02039264
	cmp r0, #1
	bne _02258B76
	mov r4, #1
_02258B76:
	bl sub_020390C4
	cmp r0, #2
	blt _02258B80
	mov r4, #1
_02258B80:
	cmp r4, #1
	bne _02258B8A
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0x1c]
_02258B8A:
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	bne _02258B94
	mov r4, #1
_02258B94:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02258B54

	thumb_func_start ov90_02258B98
ov90_02258B98: ; 0x02258B98
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02258BA6
	bl GF_AssertFail
_02258BA6:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	beq _02258BB2
	bl GF_AssertFail
_02258BB2:
	bl sub_02034420
	cmp r0, #1
	bne _02258BC4
	bl sub_020343E4
	bl sub_0203986C
	b _02258BD0
_02258BC4:
	bl sub_020392A0
	cmp r0, #1
	bne _02258BD0
	mov r0, #1
	pop {r4, pc}
_02258BD0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov90_02258B98

	thumb_func_start ov90_02258BD4
ov90_02258BD4: ; 0x02258BD4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r1, #0
	mov r1, #0x73
	add r6, r0, #0
	add r0, r5, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x73
	add r4, r0, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	str r6, [r4, #8]
	mov r0, #0xc8
	add r1, r5, #0
	bl NARC_ctor
	str r0, [r4, #0xc]
	add r0, r4, #0
	add r0, #0x10
	mov r1, #1
	add r2, r5, #0
	bl ov90_02258DD0
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _02258C34 ; =0x00001388
	mov r2, #3
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	add r3, r2, #0
	bl ov90_02258E54
	str r0, [r4, #0x28]
	add r0, r4, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02258C34: .word 0x00001388
	thumb_func_end ov90_02258BD4

	thumb_func_start ov90_02258C38
ov90_02258C38: ; 0x02258C38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02258C4A
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x2c]
_02258C4A:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _02258C54
	bl sub_02024758
_02258C54:
	add r0, r4, #0
	add r0, #0x34
	bl ov90_0225BD08
	add r0, r4, #0
	add r0, #0x10
	bl ov90_02258E10
	ldr r0, [r4, #0xc]
	bl NARC_dtor
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov90_02258C38

	thumb_func_start ov90_02258C74
ov90_02258C74: ; 0x02258C74
	push {r3, lr}
	ldr r0, [r0, #0x14]
	ldr r1, _02258C88 ; =0x00001388
	bl Get2DGfxResObjById
	mov r1, #1
	bl sub_0200B12C
	pop {r3, pc}
	nop
_02258C88: .word 0x00001388
	thumb_func_end ov90_02258C74

	thumb_func_start ov90_02258C8C
ov90_02258C8C: ; 0x02258C8C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02258C9A
	bl GF_AssertFail
_02258C9A:
	ldr r0, _02258CAC ; =ov90_0225BEE0
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #0x2c]
	mov r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
_02258CAC: .word ov90_0225BEE0
	thumb_func_end ov90_02258C8C

	thumb_func_start ov90_02258CB0
ov90_02258CB0: ; 0x02258CB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02258CBE
	bl GF_AssertFail
_02258CBE:
	ldr r0, _02258CD8 ; =ov90_0225C06C
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #0x2c]
	mov r0, #1
	strh r0, [r4, #4]
	ldr r0, _02258CDC ; =0x000005F1
	bl PlaySE
	pop {r4, pc}
	nop
_02258CD8: .word ov90_0225C06C
_02258CDC: .word 0x000005F1
	thumb_func_end ov90_02258CB0

	thumb_func_start ov90_02258CE0
ov90_02258CE0: ; 0x02258CE0
	ldrh r0, [r0, #4]
	cmp r0, #0
	bne _02258CEA
	mov r0, #1
	bx lr
_02258CEA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov90_02258CE0

	thumb_func_start ov90_02258CF0
ov90_02258CF0: ; 0x02258CF0
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [sp, #0x18]
	add r5, r0, #0
	add r7, r2, #0
	add r0, r3, #0
	add r6, r1, #0
	lsl r2, r4, #0xc
	str r3, [sp]
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r2, r0, #0
	sub r0, r7, r6
	mov r7, #2
	mov r3, #0
	lsl r7, r7, #0xa
	add r2, r2, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	sub r2, r0, r2
	asr r1, r2, #0x1f
	lsr r0, r2, #0x13
	lsl r1, r1, #0xd
	orr r1, r0
	lsl r0, r2, #0xd
	add r0, r0, r7
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	add r1, r4, #0
	mul r1, r4
	lsl r1, r1, #0xc
	bl FX_Div
	str r6, [r5]
	ldr r1, [sp]
	str r6, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	str r4, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_02258CF0

	thumb_func_start ov90_02258D4C
ov90_02258D4C: ; 0x02258D4C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	cmp r4, r0
	blt _02258D5E
	add r4, r0, #0
	mov r7, #1
	b _02258D60
_02258D5E:
	mov r7, #0
_02258D60:
	ldr r0, [r5, #8]
	lsl r2, r4, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsr r6, r2, #0xc
	lsl r0, r1, #0x14
	add r2, r4, #0
	orr r6, r0
	ldr r0, [r5, #0xc]
	mul r2, r4
	lsl r2, r2, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	lsl r1, r2, #2
	bl FX_Div
	ldr r1, [r5, #4]
	add r0, r6, r0
	add r0, r1, r0
	str r0, [r5]
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_02258D4C

	thumb_func_start ov90_02258DB0
ov90_02258DB0: ; 0x02258DB0
	push {r3, r4}
	ldr r2, [r0, #8]
	add r0, #0xc
	lsr r4, r2, #1
	mov r3, #0
	cmp r4, #0
	ble _02258DCC
_02258DBE:
	ldrh r2, [r0]
	add r3, r3, #1
	add r2, r2, r1
	strh r2, [r0]
	add r0, r0, #2
	cmp r3, r4
	blt _02258DBE
_02258DCC:
	pop {r3, r4}
	bx lr
	thumb_func_end ov90_02258DB0

	thumb_func_start ov90_02258DD0
ov90_02258DD0: ; 0x02258DD0
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #0
	add r5, r0, #0
_02258DDC:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl Create2DGfxResObjMan
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, #4
	blt _02258DDC
	mov r0, #0x38
	add r4, r6, #0
	mul r4, r0
	add r0, r7, #0
	add r1, r4, #0
	bl AllocFromHeap
	ldr r1, [sp]
	add r2, r4, #0
	str r0, [r1, #0x10]
	mov r1, #0
	bl memset
	ldr r0, [sp]
	str r6, [r0, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_02258DD0

	thumb_func_start ov90_02258E10
ov90_02258E10: ; 0x02258E10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	bls _02258E38
	add r4, r6, #0
_02258E1E:
	ldr r1, [r5, #0x10]
	ldr r0, [r1, r4]
	cmp r0, #1
	bne _02258E2E
	add r0, r5, #0
	add r1, r1, r4
	bl ov90_02258FB8
_02258E2E:
	ldr r0, [r5, #0x14]
	add r6, r6, #1
	add r4, #0x38
	cmp r6, r0
	blo _02258E1E
_02258E38:
	mov r6, #0
	add r4, r5, #0
_02258E3C:
	ldr r0, [r4]
	bl Destroy2DGfxResObjMan
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02258E3C
	ldr r0, [r5, #0x10]
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov90_02258E10

	thumb_func_start ov90_02258E54
ov90_02258E54: ; 0x02258E54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r6, [r5, #0x14]
	mov r4, #0
	str r1, [sp, #0x18]
	str r2, [sp, #0x1c]
	add r7, r3, #0
	add r1, r4, #0
	cmp r6, #0
	bls _02258E84
	ldr r3, [r5, #0x10]
	add r2, r3, #0
_02258E6E:
	ldr r0, [r2]
	cmp r0, #0
	bne _02258E7C
	mov r0, #0x38
	mul r0, r1
	add r4, r3, r0
	b _02258E84
_02258E7C:
	add r1, r1, #1
	add r2, #0x38
	cmp r1, r6
	blo _02258E6E
_02258E84:
	cmp r4, #0
	bne _02258E8C
	bl GF_AssertFail
_02258E8C:
	ldr r0, [sp, #0x38]
	str r7, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	add r1, r4, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl ov90_02258EE0
	add r0, r4, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov90_02258E54

	thumb_func_start ov90_02258EB4
ov90_02258EB4: ; 0x02258EB4
	push {r3, lr}
	sub sp, #0x20
	add r0, #0x14
	str r0, [sp, #4]
	lsl r0, r2, #0xc
	str r0, [sp, #8]
	lsl r0, r3, #0xc
	str r0, [sp, #0xc]
	str r1, [sp]
	add r0, sp, #0x18
	ldrh r0, [r0, #0x10]
	str r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x1c]
	add r0, sp, #0
	bl sub_02024714
	add sp, #0x20
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov90_02258EB4

	thumb_func_start ov90_02258EE0
ov90_02258EE0: ; 0x02258EE0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	cmp r0, #0
	beq _02258EF6
	bl GF_AssertFail
_02258EF6:
	mov r0, #1
	ldr r7, [sp, #0x58]
	str r0, [r4]
	str r7, [sp]
	ldr r6, [sp, #0x5c]
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x4c]
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r4, #4]
	str r7, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x2c]
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r5, #4]
	ldr r2, [sp, #0x30]
	mov r3, #0
	bl AddPlttResObjFromOpenNarc
	str r0, [r4, #8]
	str r7, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x50]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r4, #0xc]
	str r7, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #0xc]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x54]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl sub_0200ADA4
	cmp r0, #0
	bne _02258F66
	bl GF_AssertFail
_02258F66:
	ldr r0, [r4, #4]
	bl sub_0200A740
	ldr r0, [r4, #8]
	bl sub_0200B00C
	cmp r0, #0
	bne _02258F7A
	bl GF_AssertFail
_02258F7A:
	ldr r0, [r4, #8]
	bl sub_0200A740
	mov r0, #0
	str r7, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r1, #1
	str r1, [sp, #0x10]
	ldr r1, [r5]
	add r4, #0x14
	str r1, [sp, #0x14]
	ldr r1, [r5, #4]
	add r2, r7, #0
	str r1, [sp, #0x18]
	ldr r1, [r5, #8]
	add r3, r7, #0
	str r1, [sp, #0x1c]
	ldr r1, [r5, #0xc]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r4, #0
	add r1, r7, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov90_02258EE0

	thumb_func_start ov90_02258FB8
ov90_02258FB8: ; 0x02258FB8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	beq _02258FC8
	bl GF_AssertFail
_02258FC8:
	mov r0, #0
	str r0, [r4]
	ldr r0, [r4, #4]
	bl sub_0200AEB0
	ldr r0, [r4, #8]
	bl sub_0200B0A8
	mov r6, #0
_02258FDA:
	ldr r0, [r5]
	ldr r1, [r4, #4]
	bl DestroySingle2DGfxResObj
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #4
	blt _02258FDA
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov90_02258FB8

	thumb_func_start ov90_02258FF0
ov90_02258FF0: ; 0x02258FF0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [sp, #0x18]
	add r6, r2, #0
	str r0, [sp, #0x18]
	add r0, r1, #0
	str r3, [sp]
	bl SetBothScreensModesAndDisable
	ldr r0, [sp, #0x18]
	bl BgConfig_Alloc
	str r0, [r5]
	ldr r0, [sp]
	str r6, [r5, #4]
	str r0, [r5, #8]
	ldr r0, _02259080 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	bls _0225907C
	add r4, r6, #0
_02259024:
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r6, #4
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4]
	ldr r3, [sp, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r1, [r4]
	mov r2, #0
	lsl r1, r1, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r1, [r4]
	ldr r0, [r5]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [sp]
	add r7, r7, #1
	add r6, #0x20
	add r4, #0x20
	cmp r7, r0
	blo _02259024
_0225907C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259080: .word gSystem + 0x60
	thumb_func_end ov90_02258FF0

	thumb_func_start ov90_02259084
ov90_02259084: ; 0x02259084
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r1, #3
	ldr r0, [r5]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #8]
	mov r6, #0
	cmp r0, #0
	bls _022590B6
	add r4, r6, #0
_0225909E:
	ldr r1, [r5, #4]
	ldr r0, [r5]
	ldr r1, [r1, r4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #8]
	add r6, r6, #1
	add r4, #0x20
	cmp r6, r0
	blo _0225909E
_022590B6:
	ldr r0, [r5]
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov90_02259084

	thumb_func_start ov90_022590C0
ov90_022590C0: ; 0x022590C0
	ldr r3, _022590C8 ; =BgConfig_HandleScheduledScrollAndTransferOps
	ldr r0, [r0]
	bx r3
	nop
_022590C8: .word BgConfig_HandleScheduledScrollAndTransferOps
	thumb_func_end ov90_022590C0

	thumb_func_start ov90_022590CC
ov90_022590CC: ; 0x022590CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	str r1, [sp, #0x14]
	add r6, r2, #0
	str r3, [sp, #0x18]
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7e
	str r1, [sp, #4]
	ldr r4, [sp, #0x40]
	str r0, [sp, #8]
	mov r3, #0x1f
	str r3, [sp, #0xc]
	add r2, r0, #0
	str r4, [sp, #0x10]
	bl OamManager_Create
	ldr r3, _02259154 ; =ov90_0225C294
	add r2, sp, #0x1c
	add r7, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r1, #0x10
	add r0, r7, #0
	add r2, r1, #0
	str r6, [sp, #0x1c]
	str r4, [sp, #0x28]
	bl sub_020215C0
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	mov r0, #1
	mov r1, #0x10
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	ldr r0, [sp, #0x14]
	add r1, r5, #4
	add r2, r4, #0
	bl G2dRenderer_Init
	str r0, [r5]
	bl sub_0203A880
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02259154: .word ov90_0225C294
	thumb_func_end ov90_022590CC

	thumb_func_start ov90_02259158
ov90_02259158: ; 0x02259158
	push {r3, lr}
	ldr r0, [r0]
	bl sub_02024504
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov90_02259158

	thumb_func_start ov90_02259170
ov90_02259170: ; 0x02259170
	ldr r3, _02259178 ; =sub_0202457C
	ldr r0, [r0]
	bx r3
	nop
_02259178: .word sub_0202457C
	thumb_func_end ov90_02259170

	thumb_func_start ov90_0225917C
ov90_0225917C: ; 0x0225917C
	ldr r3, _02259180 ; =OamManager_ApplyAndResetBuffers
	bx r3
	.balign 4, 0
_02259180: .word OamManager_ApplyAndResetBuffers
	thumb_func_end ov90_0225917C

	thumb_func_start ov90_02259184
ov90_02259184: ; 0x02259184
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xec
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [r5]
	mov r0, #8
	mov r1, #0x40
	add r2, r4, #0
	bl ScrStrBufs_new_custom
	str r0, [r5, #4]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	str r0, [r5, #8]
	mov r0, #0x80
	add r1, r4, #0
	bl String_ctor
	mov r1, #6
	str r0, [r5, #0xc]
	mov r0, #0
	lsl r1, r1, #6
	add r2, r4, #0
	bl LoadFontPal1
	mov r1, #6
	mov r0, #4
	lsl r1, r1, #6
	add r2, r4, #0
	bl LoadFontPal1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov90_02259184

	thumb_func_start ov90_022591D4
ov90_022591D4: ; 0x022591D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl String_dtor
	ldr r0, [r4, #8]
	bl String_dtor
	ldr r0, [r4, #4]
	bl ScrStrBufs_delete
	ldr r0, [r4]
	bl DestroyMsgData
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov90_022591D4

	thumb_func_start ov90_022591F4
ov90_022591F4: ; 0x022591F4
	ldr r3, _022591FC ; =ScrStrBufs_ResetBuffers
	ldr r0, [r0, #4]
	bx r3
	nop
_022591FC: .word ScrStrBufs_ResetBuffers
	thumb_func_end ov90_022591F4

	thumb_func_start ov90_02259200
ov90_02259200: ; 0x02259200
	ldr r3, _0225920C ; =BufferPlayersName
	add r2, r1, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bx r3
	nop
_0225920C: .word BufferPlayersName
	thumb_func_end ov90_02259200

	thumb_func_start ov90_02259210
ov90_02259210: ; 0x02259210
	ldr r3, _0225921C ; =BufferCountryName
	add r2, r1, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bx r3
	nop
_0225921C: .word BufferCountryName
	thumb_func_end ov90_02259210

	thumb_func_start ov90_02259220
ov90_02259220: ; 0x02259220
	push {r4, lr}
	add r4, r1, #0
	add r3, r2, #0
	ldr r0, [r0, #4]
	mov r1, #0
	add r2, r4, #0
	bl BufferCityName
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov90_02259220

	thumb_func_start ov90_02259234
ov90_02259234: ; 0x02259234
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	mov r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	add r3, r2, #0
	ldr r0, [r0, #4]
	mov r1, #0
	add r2, r4, #0
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov90_02259234

	thumb_func_start ov90_02259250
ov90_02259250: ; 0x02259250
	push {r3, lr}
	sub sp, #8
	add r2, r1, #0
	mov r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r0, #4]
	mov r1, #0
	mov r3, #2
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov90_02259250

	thumb_func_start ov90_0225926C
ov90_0225926C: ; 0x0225926C
	ldr r3, _02259278 ; =BufferWiFiPlazaInstrumentName
	add r2, r1, #0
	ldr r0, [r0, #4]
	mov r1, #1
	bx r3
	nop
_02259278: .word BufferWiFiPlazaInstrumentName
	thumb_func_end ov90_0225926C

	thumb_func_start ov90_0225927C
ov90_0225927C: ; 0x0225927C
	ldr r3, _02259288 ; =BufferWiFiPlazaActivityName
	add r2, r1, #0
	ldr r0, [r0, #4]
	mov r1, #0
	bx r3
	nop
_02259288: .word BufferWiFiPlazaActivityName
	thumb_func_end ov90_0225927C

	thumb_func_start ov90_0225928C
ov90_0225928C: ; 0x0225928C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	ldr r2, [r5, #0xc]
	add r1, r4, #0
	bl StringExpandPlaceholders
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225928C

	thumb_func_start ov90_022592A8
ov90_022592A8: ; 0x022592A8
	push {r4, lr}
	sub sp, #8
	add r4, sp, #0
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, _022592C0 ; =0x000F0E00
	str r4, [sp, #4]
	bl ov90_02259350
	add sp, #8
	pop {r4, pc}
	nop
_022592C0: .word 0x000F0E00
	thumb_func_end ov90_022592A8

	thumb_func_start ov90_022592C4
ov90_022592C4: ; 0x022592C4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	add r4, r3, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl StringExpandPlaceholders
	mov r0, #0
	ldr r1, [r5, #8]
	add r2, r0, #0
	bl FontID_String_GetWidth
	sub r3, r4, r0
	bpl _022592F0
	mov r3, #0
_022592F0:
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259310 ; =0x000F0E00
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #8]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02259310: .word 0x000F0E00
	thumb_func_end ov90_022592C4

	thumb_func_start ov90_02259314
ov90_02259314: ; 0x02259314
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	add r4, r3, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	ldr r2, [r5, #0xc]
	add r1, r4, #0
	bl StringExpandPlaceholders
	mov r3, #0
	ldr r0, [sp, #0x20]
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, _0225934C ; =0x0001020F
	mov r1, #1
	str r0, [sp, #8]
	add r0, r6, #0
	add r2, r4, #0
	str r3, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0225934C: .word 0x0001020F
	thumb_func_end ov90_02259314

	thumb_func_start ov90_02259350
ov90_02259350: ; 0x02259350
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r2, #0
	ldr r0, [r5]
	ldr r2, [r5, #0xc]
	add r6, r3, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	bl StringExpandPlaceholders
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	mov r1, #0
	add r3, r6, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #8]
	add r0, r4, #0
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov90_02259350

	thumb_func_start ov90_0225938C
ov90_0225938C: ; 0x0225938C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	str r0, [sp, #0x30]
	add r0, r2, #0
	str r3, [sp, #0x18]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	add r4, r0, #0
	mov r0, #1
	bl sub_02002C60
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	mov r1, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	mov r2, #1
	mov r3, #0xd
	bl LoadUserFrameGfx2
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	mov r1, #4
	str r0, [sp, #4]
	ldr r0, [r7]
	mov r2, #1
	mov r3, #0xd
	bl LoadUserFrameGfx2
	ldr r4, [sp, #0x14]
	mov r6, #0
	add r5, r4, #0
_022593DE:
	cmp r6, #0
	bne _022593E8
	mov r2, #2
	mov r0, #0x13
	b _022593EC
_022593E8:
	mov r2, #4
	mov r0, #1
_022593EC:
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0x1f
	str r0, [sp, #0x10]
	lsl r2, r2, #0x18
	ldr r0, [r7]
	add r1, r4, #0
	lsr r2, r2, #0x18
	mov r3, #2
	bl AddWindowParameterized
	add r0, r4, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [sp, #0x30]
	mov r0, #0x80
	bl String_ctor
	str r0, [r5, #0x24]
	add r6, r6, #1
	add r4, #0x10
	add r5, r5, #4
	cmp r6, #2
	blt _022593DE
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x14]
	str r1, [r0, #0x34]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_0225938C

	thumb_func_start ov90_02259434
ov90_02259434: ; 0x02259434
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #0
	add r5, r7, #0
	add r6, r7, #0
_0225943E:
	add r0, r7, #0
	add r1, r4, #0
	bl ov90_022594FC
	ldr r0, [r5, #0x24]
	bl String_dtor
	add r0, r6, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, r5, #4
	add r6, #0x10
	cmp r4, #2
	blt _0225943E
	bl sub_02002C90
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_02259434

	thumb_func_start ov90_02259464
ov90_02259464: ; 0x02259464
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	str r1, [sp, #4]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #1
	bne _0225948A
	ldr r2, _022594F8 ; =ov90_0225C34C
	mov r1, #0
_0225947A:
	ldrh r0, [r2]
	cmp r4, r0
	bne _02259482
	ldrh r4, [r2, #2]
_02259482:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x14
	blo _0225947A
_0225948A:
	add r0, r5, #0
	str r0, [sp, #8]
	add r0, #0x20
	str r0, [sp, #8]
	lsl r0, r6, #1
	ldr r1, [sp, #8]
	str r0, [sp, #0xc]
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _022594B4
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_022594B4:
	add r0, r5, #0
	add r1, r6, #0
	bl ov90_02259570
	lsl r7, r6, #4
	add r0, r5, r7
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #1
	lsl r3, r6, #2
	str r0, [sp]
	add r3, r5, r3
	ldr r0, [sp, #4]
	ldr r3, [r3, #0x24]
	add r1, r4, #0
	add r2, r5, r7
	bl ov90_02259314
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r3, #0xd
	strh r0, [r2, r1]
	mov r1, #1
	add r0, r5, r7
	add r2, r1, #0
	bl DrawFrameAndWindow2
	add r0, r5, r7
	bl ScheduleWindowCopyToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022594F8: .word ov90_0225C34C
	thumb_func_end ov90_02259464

	thumb_func_start ov90_022594FC
ov90_022594FC: ; 0x022594FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov90_02259570
	add r6, r5, #0
	add r6, #0x20
	lsl r7, r4, #1
	ldrh r0, [r6, r7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _02259524
	ldrh r0, [r6, r7]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_020200A0
_02259524:
	lsl r4, r4, #4
	add r0, r5, r4
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, r4
	bl ClearWindowTilemapAndScheduleTransfer
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_022594FC

	thumb_func_start ov90_02259538
ov90_02259538: ; 0x02259538
	push {r3, lr}
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x20]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02259550
	mov r0, #1
	pop {r3, pc}
_02259550:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov90_02259538

	thumb_func_start ov90_02259554
ov90_02259554: ; 0x02259554
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r5, #0x2c
	lsl r4, r1, #2
	ldr r2, [r5, r4]
	cmp r2, #0
	bne _0225956E
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #1
	bl sub_0200F0AC
	str r0, [r5, r4]
_0225956E:
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02259554

	thumb_func_start ov90_02259570
ov90_02259570: ; 0x02259570
	push {r3, r4, r5, lr}
	add r4, r0, #0
	lsl r5, r1, #2
	add r4, #0x2c
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _02259586
	bl sub_0200F478
	mov r0, #0
	str r0, [r4, r5]
_02259586:
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02259570

	thumb_func_start ov90_02259588
ov90_02259588: ; 0x02259588
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x12
	add r6, r0, #0
	add r5, r2, #0
	mov r0, #0x13
	lsl r1, r1, #6
	mov r2, #0
	bl sub_02004EC4
	ldr r1, _022596A0 ; =0x000005F4
	add r0, r5, #0
	bl AllocFromHeap
	ldr r2, _022596A0 ; =0x000005F4
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r2, r4, #0
	add r2, #8
	mov r1, #0x10
_022595B4:
	ldrb r0, [r6]
	add r6, r6, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _022595B4
	ldr r3, _022596A4 ; =0x04000050
	strh r7, [r4, #4]
	mov r1, #0
	strh r1, [r3]
	ldr r0, _022596A8 ; =0x04001050
	sub r3, #0x50
	strh r1, [r0]
	ldr r2, [r3]
	ldr r1, _022596AC ; =0xFFFF1FFF
	sub r0, #0x50
	and r2, r1
	str r2, [r3]
	ldr r2, [r0]
	and r1, r2
	str r1, [r0]
	ldr r0, _022596B0 ; =ov90_0225C2CC
	bl GX_SetBanks
	add r0, r4, #0
	strh r5, [r4, #2]
	bl ov90_0225C178
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x18
	add r1, #8
	bl ov90_0225A204
	add r0, r4, #0
	ldr r1, _022596B4 ; =ov90_0225C2A4
	ldr r2, _022596B8 ; =ov90_0225C39C
	add r0, #0x30
	mov r3, #5
	str r5, [sp]
	bl ov90_02258FF0
	add r0, r4, #0
	mov r2, #1
	add r0, #0x84
	mov r1, #0x10
	add r3, r2, #0
	str r5, [sp]
	bl ov90_022590CC
	mov r0, #0x1b
	lsl r0, r0, #4
	add r0, r4, r0
	mov r1, #1
	add r2, r5, #0
	bl ov90_02258DD0
	add r0, r4, #0
	add r0, #0x3c
	add r1, r5, #0
	bl ov90_02259184
	add r0, r4, #0
	add r1, r5, #0
	bl ov90_022596C8
	add r0, r4, #0
	ldrb r1, [r4, #0x11]
	add r0, #8
	bl ov90_0225888C
	add r1, r0, #0
	add r0, r4, #0
	add r0, #8
	bl ov90_022588A4
	str r5, [sp]
	add r3, r0, #0
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #8]
	add r0, #0x4c
	add r1, #0x30
	bl ov90_0225938C
	ldr r0, _022596BC ; =ov90_02259794
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r1, _022596C0 ; =0x000005EC
	mov r2, #0
	str r0, [r4, r1]
	ldr r0, _022596C4 ; =ov90_02259B18
	add r1, r4, #0
	bl sub_0200E374
	mov r1, #0x5f
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _02259688
	add r0, r5, #0
	bl ov00_021E69A8
_02259688:
	ldr r0, [r4, #8]
	bl Sav2_GameStats_get
	ldrb r1, [r4, #0x13]
	cmp r1, #0
	beq _0225969A
	mov r1, #0x27
	bl GameStats_AddSpecial
_0225969A:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022596A0: .word 0x000005F4
_022596A4: .word 0x04000050
_022596A8: .word 0x04001050
_022596AC: .word 0xFFFF1FFF
_022596B0: .word ov90_0225C2CC
_022596B4: .word ov90_0225C2A4
_022596B8: .word ov90_0225C39C
_022596BC: .word ov90_02259794
_022596C0: .word 0x000005EC
_022596C4: .word ov90_02259B18
	thumb_func_end ov90_02259588

	thumb_func_start ov90_022596C8
ov90_022596C8: ; 0x022596C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0xc8
	add r4, r1, #0
	bl NARC_ctor
	mov r1, #0x12
	lsl r1, r1, #4
	str r1, [sp]
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r6, r0, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x30]
	add r0, r6, #0
	mov r1, #6
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #2
	lsl r3, r3, #8
	add r0, r6, #0
	mov r1, #9
	mov r2, #0
	add r3, r5, r3
	str r4, [sp]
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0x7f
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x30]
	add r0, r6, #0
	mov r1, #8
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldrh r1, [r5, #4]
	add r0, r6, #0
	add r2, r4, #0
	bl ov90_0225A65C
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0xd
	str r0, [sp, #4]
	mov r0, #0xe
	str r0, [sp, #8]
	ldr r0, _02259780 ; =0x00001388
	add r1, r6, #0
	str r0, [sp, #0xc]
	mov r0, #0x1b
	lsl r0, r0, #4
	add r0, r5, r0
	mov r2, #0xb
	mov r3, #5
	str r4, [sp, #0x10]
	bl ov90_02258E54
	mov r1, #0x72
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r1, #4
	str r6, [sp]
	str r4, [sp, #4]
	add r1, r5, #0
	add r2, r5, #0
	ldrh r3, [r5, #4]
	add r0, r5, r0
	add r1, #0x30
	add r2, #0x3c
	bl ov90_0225A2B0
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02259780: .word 0x00001388
	thumb_func_end ov90_022596C8

	thumb_func_start ov90_02259784
ov90_02259784: ; 0x02259784
	mov r1, #0x7f
	lsl r1, r1, #2
	ldr r3, _02259790 ; =FreeToHeap
	ldr r0, [r0, r1]
	bx r3
	nop
_02259790: .word FreeToHeap
	thumb_func_end ov90_02259784

	thumb_func_start ov90_02259794
ov90_02259794: ; 0x02259794
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r4, r1, #0
	ldrb r0, [r4]
	cmp r0, #0x10
	bls _022597A2
	b _02259AF2
_022597A2:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022597AE: ; jump table
	.short _022597D0 - _022597AE - 2 ; case 0
	.short _022597FE - _022597AE - 2 ; case 1
	.short _0225981C - _022597AE - 2 ; case 2
	.short _02259836 - _022597AE - 2 ; case 3
	.short _0225984E - _022597AE - 2 ; case 4
	.short _02259868 - _022597AE - 2 ; case 5
	.short _02259898 - _022597AE - 2 ; case 6
	.short _022598B4 - _022597AE - 2 ; case 7
	.short _022599BA - _022597AE - 2 ; case 8
	.short _022599CC - _022597AE - 2 ; case 9
	.short _022599F2 - _022597AE - 2 ; case 10
	.short _02259A04 - _022597AE - 2 ; case 11
	.short _02259A36 - _022597AE - 2 ; case 12
	.short _02259A50 - _022597AE - 2 ; case 13
	.short _02259AB6 - _022597AE - 2 ; case 14
	.short _02259AE8 - _022597AE - 2 ; case 15
	.short _02259AF2 - _022597AE - 2 ; case 16
_022597D0:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrh r0, [r4, #2]
	ldr r3, _02259AD8 ; =0x0000FFFF
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	bl BeginNormalPaletteFade
	mov r0, #0x73
	lsl r0, r0, #2
	add r1, r4, #0
	ldrh r2, [r4, #2]
	add r0, r4, r0
	add r1, #0x30
	bl ov90_0225A350
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022597FE:
	mov r0, #0x73
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x30
	bl ov90_0225A428
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _022598AA
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_0225981C:
	mov r0, #0x73
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x30
	bl ov90_0225A428
	cmp r0, #1
	bne _022598AA
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259836:
	add r0, r4, #0
	add r1, r4, #0
	mov r2, #0
	add r0, #0x4c
	add r1, #0x3c
	add r3, r2, #0
	bl ov90_02259464
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_0225984E:
	add r0, r4, #0
	add r0, #0x4c
	mov r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _022598AA
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0x40
	strb r0, [r4, #1]
	b _02259AF2
_02259868:
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _022598AA
	sub r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _022598AA
	add r0, r4, #0
	add r0, #0x4c
	mov r1, #0
	bl ov90_022594FC
	mov r0, #0x73
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x30
	bl ov90_0225A3E0
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259898:
	mov r0, #0x73
	lsl r0, r0, #2
	add r1, r4, #0
	add r0, r4, r0
	add r1, #0x30
	bl ov90_0225A544
	cmp r0, #1
	beq _022598AC
_022598AA:
	b _02259AF2
_022598AC:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022598B4:
	mov r0, #0xb9
	lsl r0, r0, #2
	add r1, r4, #0
	ldrh r2, [r4, #2]
	add r0, r4, r0
	add r1, #0x30
	bl ov90_0225A088
	add r0, r4, #0
	add r1, r4, #0
	add r0, #8
	add r1, #0x18
	bl ov90_0225A258
	ldrb r1, [r4, #0x10]
	mov r6, #0
	str r0, [sp, #0x1c]
	cmp r1, #0
	ble _02259986
	mov r0, #0x81
	lsl r0, r0, #2
	add r5, r4, r0
	add r0, r4, #0
	str r0, [sp, #0x20]
	add r0, #0x30
	str r0, [sp, #0x20]
	add r0, r4, #0
	str r0, [sp, #0x24]
	add r0, #0x84
	str r0, [sp, #0x24]
	add r0, r4, #0
	str r0, [sp, #0x28]
	add r0, #8
	str r0, [sp, #0x28]
	add r0, r4, #0
	str r0, [sp, #0x2c]
	add r0, #0x3c
	str r4, [sp, #0x18]
	add r7, r6, #0
	str r0, [sp, #0x2c]
_02259904:
	ldr r0, [sp, #0x20]
	mov r3, #2
	str r0, [sp]
	str r6, [sp, #4]
	ldrb r0, [r4, #0x11]
	lsl r3, r3, #8
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	str r0, [sp, #0xc]
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp, #0x10]
	ldrh r0, [r4, #2]
	str r0, [sp, #0x14]
	ldrh r2, [r4, #4]
	ldr r3, [r4, r3]
	add r0, r5, #0
	bl ov90_02259BCC
	ldr r0, [sp, #0x28]
	add r1, r6, #0
	bl ov90_0225888C
	add r1, r0, #0
	ldr r0, [sp, #0x28]
	bl ov90_022588A4
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x2c]
	ldr r2, [r2, #0x20]
	add r0, r5, #0
	mov r3, #8
	bl ov90_02259D50
	add r3, r4, r6
	ldrb r0, [r3, #0x1c]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	ldrb r3, [r3, #0x18]
	add r0, r5, #0
	bl ov90_02259DAC
	mov r1, #7
	lsl r2, r7, #0x10
	add r0, r5, #0
	mvn r1, r1
	asr r2, r2, #0x10
	bl ov90_02259EE0
	ldr r0, [sp, #0x18]
	ldrb r1, [r4, #0x10]
	add r0, r0, #4
	add r6, r6, #1
	add r5, #0x38
	str r0, [sp, #0x18]
	add r7, r7, #3
	cmp r6, r1
	blt _02259904
_02259986:
	mov r6, #0
	cmp r1, #0
	ble _022599AE
	mov r0, #0x81
	lsl r0, r0, #2
	add r7, r4, #0
	add r5, r4, r0
	add r7, #0x30
_02259996:
	add r0, r5, #0
	add r1, r7, #0
	bl ov90_02259E8C
	add r0, r5, #0
	bl ov90_02259EA0
	ldrb r0, [r4, #0x10]
	add r6, r6, #1
	add r5, #0x38
	cmp r6, r0
	blt _02259996
_022599AE:
	mov r0, #0x5c
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022599BA:
	add r0, r4, #0
	bl ov90_02259B68
	cmp r0, #1
	bne _022599EA
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_022599CC:
	ldrb r0, [r4, #1]
	sub r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _022599EA
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0x81
	bl sub_02037AC0
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	bne _022599EC
_022599EA:
	b _02259AF2
_022599EC:
	bl ov00_021E6A4C
	b _02259AF2
_022599F2:
	mov r0, #0x81
	bl sub_02037B38
	cmp r0, #0
	beq _02259AF2
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259A04:
	ldrb r0, [r4, #0x10]
	mov r7, #0
	cmp r0, #0
	ble _02259A2A
	mov r0, #0x81
	lsl r0, r0, #2
	add r6, r7, #0
	add r5, r4, r0
_02259A14:
	lsl r1, r6, #0x10
	add r0, r5, #0
	asr r1, r1, #0x10
	bl ov90_02259F44
	ldrb r0, [r4, #0x10]
	add r7, r7, #1
	add r6, r6, #3
	add r5, #0x38
	cmp r7, r0
	blt _02259A14
_02259A2A:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #8
	strb r0, [r4, #1]
	b _02259AF2
_02259A36:
	ldrb r0, [r4, #1]
	sub r0, r0, #1
	strb r0, [r4, #1]
	add r0, r4, #0
	bl ov90_02259B68
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _02259AF2
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259A50:
	mov r0, #6
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	ldrh r0, [r4, #2]
	mov r1, #0
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	bl BeginNormalPaletteFade
	add r0, r4, #0
	bl ov90_02259B68
	ldrb r0, [r4, #0x11]
	cmp r0, #0
	bne _02259AAE
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02259A82
	cmp r0, #1
	beq _02259A8E
	cmp r0, #2
	beq _02259A9A
	b _02259AA4
_02259A82:
	ldr r0, _02259ADC ; =ov90_0225C1E8
	mov r1, #3
	bl ov90_02259B38
	str r0, [sp, #0x30]
	b _02259AA4
_02259A8E:
	ldr r0, _02259AE0 ; =_0225C1E0
	mov r1, #2
	bl ov90_02259B38
	str r0, [sp, #0x30]
	b _02259AA4
_02259A9A:
	ldr r0, _02259AE4 ; =ov90_0225C1E4
	mov r1, #3
	bl ov90_02259B38
	str r0, [sp, #0x30]
_02259AA4:
	mov r0, #0x1a
	add r1, sp, #0x30
	mov r2, #4
	bl sub_02037030
_02259AAE:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
_02259AB6:
	add r0, r4, #0
	bl ov90_02259B68
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _02259AF2
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225A108
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02259AF2
	nop
_02259AD8: .word 0x0000FFFF
_02259ADC: .word ov90_0225C1E8
_02259AE0: .word _0225C1E0
_02259AE4: .word ov90_0225C1E4
_02259AE8:
	ldrb r1, [r4, #7]
	cmp r1, #1
	bne _02259AF2
	add r0, r0, #1
	strb r0, [r4]
_02259AF2:
	add r0, r4, #0
	add r0, #0x84
	bl ov90_02259170
	ldr r0, [r4, #0x30]
	mov r1, #3
	mov r2, #4
	mov r3, #2
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x30]
	mov r1, #5
	mov r2, #4
	mov r3, #2
	bl ScheduleSetBgPosText
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_02259794

	thumb_func_start ov90_02259B18
ov90_02259B18: ; 0x02259B18
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0x30
	bl ov90_022590C0
	add r0, r4, #0
	add r0, #0x84
	bl ov90_0225917C
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225A198
	pop {r4, pc}
	thumb_func_end ov90_02259B18

	thumb_func_start ov90_02259B38
ov90_02259B38: ; 0x02259B38
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MTRandom
	mov r1, #0x64
	bl _u32_div_f
	mov r3, #0
	add r0, r3, #0
	cmp r4, #0
	bls _02259B5E
_02259B50:
	ldrb r2, [r5, r0]
	add r3, r3, r2
	cmp r3, r1
	bhi _02259B64
	add r0, r0, #1
	cmp r0, r4
	blo _02259B50
_02259B5E:
	bl GF_AssertFail
	sub r0, r4, #1
_02259B64:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov90_02259B38

	thumb_func_start ov90_02259B68
ov90_02259B68: ; 0x02259B68
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r0, [r7, #0x10]
	cmp r0, #0
	ble _02259BC6
	mov r0, #0x81
	lsl r0, r0, #2
	add r6, r7, r0
	add r4, r7, #0
	add r5, r6, #0
_02259B86:
	mov r0, #0x85
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02259BB0
	add r0, r6, #0
	bl ov90_02259F7C
	str r0, [sp, #8]
	mov r0, #0xb9
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r5, #0
	bl ov90_0225A134
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _02259BB4
	mov r0, #0
	str r0, [sp]
	b _02259BB4
_02259BB0:
	mov r0, #0
	str r0, [sp]
_02259BB4:
	ldr r0, [sp, #4]
	ldrb r1, [r7, #0x10]
	add r0, r0, #1
	add r4, #0x38
	add r6, #0x38
	add r5, #0x38
	str r0, [sp, #4]
	cmp r0, r1
	blt _02259B86
_02259BC6:
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov90_02259B68

	thumb_func_start ov90_02259BCC
ov90_02259BCC: ; 0x02259BCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, [sp, #0x48]
	add r6, r3, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x54]
	str r1, [sp, #0x1c]
	ldr r4, [sp, #0x4c]
	str r0, [sp, #0x54]
	cmp r2, #0
	beq _02259BEC
	cmp r2, #1
	beq _02259BFA
	cmp r2, #2
	bne _02259C10
_02259BEC:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x50]
	add r1, r4, #0
	bl ov90_0225A050
	add r7, r0, #0
	b _02259C12
_02259BFA:
	ldr r0, [sp, #0x50]
	cmp r0, r4
	bls _02259C04
	add r7, r4, #1
	b _02259C12
_02259C04:
	cmp r0, r4
	bne _02259C0C
	mov r7, #0
	b _02259C12
_02259C0C:
	add r7, r4, #0
	b _02259C12
_02259C10:
	add r7, r4, #0
_02259C12:
	mov r0, #1
	mov r1, #2
	bl SetBgPriority
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	ldr r1, [sp, #0x1c]
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	str r2, [sp, #0x2c]
	ldr r2, _02259D38 ; =ov90_0225C310
	ldr r1, [sp, #0x2c]
	mov r3, #5
	add r1, r2, r1
	ldrb r1, [r7, r1]
	mov r2, #0
	str r1, [sp, #0x28]
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #0x1a
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, #0x68
	add r1, r4, #0
	mul r1, r0
	ldr r0, _02259D3C ; =0x00000201
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x48]
	add r1, r5, #0
	ldr r0, [r0]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0x20
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r6, #0
	add r0, #0xc
	str r0, [sp, #8]
	mov r2, #0
	ldr r1, _02259D40 ; =ov90_0225C314
	ldr r0, [sp, #0x2c]
	str r2, [sp, #0xc]
	add r0, r1, r0
	ldrb r0, [r4, r0]
	ldr r3, [sp, #0x28]
	mov r1, #1
	str r0, [sp, #0x10]
	ldrh r0, [r6]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldrh r0, [r6, #2]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x48]
	ldr r0, [r0]
	bl CopyToBgTilemapRect
	ldr r0, [sp, #0x28]
	ldr r1, _02259D44 ; =ov90_0225C318
	lsl r0, r0, #3
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x2c]
	ldr r2, _02259D48 ; =ov90_0225C274
	add r0, r1, r0
	ldrb r0, [r7, r0]
	ldr r3, _02259D4C ; =ov90_0225C276
	ldr r1, [sp, #0x54]
	lsl r6, r0, #2
	ldrsh r2, [r2, r6]
	str r0, [sp, #0x24]
	mov r0, #0
	ldrsh r6, [r3, r6]
	str r0, [sp]
	ldr r0, [sp, #0x5c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	add r3, r6, r3
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x58]
	ldr r1, [r1]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov90_02258EB4
	ldr r1, [sp, #0x24]
	str r0, [r5, #0x10]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	bl sub_02024A74
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x5c]
	ldr r3, [sp, #0x20]
	str r0, [sp, #4]
	ldr r1, [sp, #0x54]
	add r3, #0x15
	str r3, [sp, #0x20]
	lsl r3, r3, #0x18
	ldr r0, [sp, #0x58]
	ldr r1, [r1]
	mov r2, #0x18
	lsr r3, r3, #0x18
	bl ov90_02258EB4
	str r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	strb r4, [r5, #0x1a]
	ldr r0, [sp, #0x1c]
	strb r7, [r5, #0x1b]
	strh r0, [r5, #0x18]
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259D38: .word ov90_0225C310
_02259D3C: .word 0x00000201
_02259D40: .word ov90_0225C314
_02259D44: .word ov90_0225C318
_02259D48: .word ov90_0225C274
_02259D4C: .word ov90_0225C276
	thumb_func_end ov90_02259BCC

	thumb_func_start ov90_02259D50
ov90_02259D50: ; 0x02259D50
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r1, r2, #0
	add r4, r3, #0
	bl ov90_02259200
	ldr r0, [sp, #0x1c]
	add r1, sp, #8
	cmp r0, #1
	bne _02259D8A
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	lsl r3, r4, #0x18
	mov r1, #0xa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, _02259DA8 ; =0x00050600
	add r2, r6, #0
	str r0, [sp, #4]
	add r0, r5, #0
	lsr r3, r3, #0x18
	bl ov90_02259350
	add sp, #8
	pop {r4, r5, r6, pc}
_02259D8A:
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	lsl r3, r4, #0x18
	mov r1, #0xa
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	lsr r3, r3, #0x18
	bl ov90_022592A8
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02259DA8: .word 0x00050600
	thumb_func_end ov90_02259D50

	thumb_func_start ov90_02259DAC
ov90_02259DAC: ; 0x02259DAC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r1, #0
	add r4, r3, #0
	cmp r2, #0
	beq _02259DE8
	cmp r4, #0
	beq _02259E14
	add r0, r5, #0
	bl ov90_022591F4
	add r0, r5, #0
	add r1, r4, #0
	bl ov90_02259210
	mov r0, #0x10
	str r0, [sp]
	add r4, sp, #8
	mov r3, #0x14
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	mov r1, #0xb
	lsl r3, r3, #0x18
	add r2, r6, #0
	lsr r3, r3, #0x18
	bl ov90_022592A8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02259DE8:
	cmp r4, #0
	beq _02259E14
	add r0, r5, #0
	bl ov90_022591F4
	ldr r2, [sp, #0x18]
	add r0, r5, #0
	add r1, r4, #0
	bl ov90_02259220
	mov r0, #0x10
	str r0, [sp]
	add r4, sp, #8
	mov r3, #0x14
	ldrsh r3, [r4, r3]
	add r0, r5, #0
	mov r1, #0xc
	lsl r3, r3, #0x18
	add r2, r6, #0
	lsr r3, r3, #0x18
	bl ov90_022592A8
_02259E14:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov90_02259DAC

	thumb_func_start ov90_02259E18
ov90_02259E18: ; 0x02259E18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r1, #0
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #0x14]
	add r1, r4, #4
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_02259E18

	thumb_func_start ov90_02259E38
ov90_02259E38: ; 0x02259E38
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	add r1, r2, #0
	add r6, r0, #0
	ldr r2, [sp, #0x1c]
	add r0, r5, #0
	add r4, r3, #0
	bl ov90_02259234
	ldr r0, [sp, #0x1c]
	add r1, sp, #8
	cmp r0, #5
	bne _02259E70
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	lsl r3, r4, #0x18
	mov r1, #0xe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	lsr r3, r3, #0x18
	bl ov90_022592C4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02259E70:
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	lsl r3, r4, #0x18
	mov r1, #0xd
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	lsr r3, r3, #0x18
	bl ov90_022592C4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov90_02259E38

	thumb_func_start ov90_02259E8C
ov90_02259E8C: ; 0x02259E8C
	push {r4, lr}
	add r4, r1, #0
	bl ScheduleWindowCopyToVram
	ldr r0, [r4]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov90_02259E8C

	thumb_func_start ov90_02259EA0
ov90_02259EA0: ; 0x02259EA0
	ldr r3, _02259EA8 ; =Set2dSpriteVisibleFlag
	ldr r0, [r0, #0x10]
	mov r1, #1
	bx r3
	.balign 4, 0
_02259EA8: .word Set2dSpriteVisibleFlag
	thumb_func_end ov90_02259EA0

	thumb_func_start ov90_02259EAC
ov90_02259EAC: ; 0x02259EAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02259EBE
	bl sub_02024758
	mov r0, #0
	str r0, [r4, #0x10]
_02259EBE:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02259ECC
	bl sub_02024758
	mov r0, #0
	str r0, [r4, #0x14]
_02259ECC:
	add r0, r4, #0
	bl WindowIsInUse
	cmp r0, #1
	bne _02259EDC
	add r0, r4, #0
	bl RemoveWindow
_02259EDC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov90_02259EAC

	thumb_func_start ov90_02259EE0
ov90_02259EE0: ; 0x02259EE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	ble _02259EFC
	lsl r0, r1, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02259F0A
_02259EFC:
	lsl r0, r1, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02259F0A:
	bl _ffix
	add r2, r0, #0
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	mov r3, #7
	ldr r1, _02259F3C ; =0xFFF01000
	add r0, #0x1c
	lsl r3, r3, #0xe
	bl ov90_02258CF0
	mov r0, #0
	strh r0, [r5, #0x30]
	ldr r0, _02259F40 ; =0x0000057E
	strh r4, [r5, #0x32]
	str r0, [r5, #0x34]
	ldr r1, [r5, #0x1c]
	add r0, r5, #0
	asr r1, r1, #0xc
	neg r1, r1
	bl ov90_02259FC8
	pop {r3, r4, r5, pc}
	nop
_02259F3C: .word 0xFFF01000
_02259F40: .word 0x0000057E
	thumb_func_end ov90_02259EE0

	thumb_func_start ov90_02259F44
ov90_02259F44: ; 0x02259F44
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #8
	str r0, [sp]
	add r4, r1, #0
	add r0, r5, #0
	ldr r1, [r5, #0x1c]
	ldr r2, _02259F74 ; =0xFFF01000
	add r0, #0x1c
	mov r3, #0
	bl ov90_02258CF0
	mov r0, #0
	strh r0, [r5, #0x30]
	ldr r0, _02259F78 ; =0x0000057F
	strh r4, [r5, #0x32]
	str r0, [r5, #0x34]
	ldr r1, [r5, #0x1c]
	add r0, r5, #0
	asr r1, r1, #0xc
	neg r1, r1
	bl ov90_02259FC8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02259F74: .word 0xFFF01000
_02259F78: .word 0x0000057F
	thumb_func_end ov90_02259F44

	thumb_func_start ov90_02259F7C
ov90_02259F7C: ; 0x02259F7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x32
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _02259FBE
	mov r0, #0x30
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bne _02259F9A
	ldr r0, [r5, #0x34]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_02259F9A:
	mov r1, #0x30
	ldrsh r0, [r5, r1]
	add r0, r0, #1
	strh r0, [r5, #0x30]
	ldrsh r1, [r5, r1]
	add r0, r5, #0
	add r0, #0x1c
	bl ov90_02258D4C
	ldr r1, [r5, #0x1c]
	add r4, r0, #0
	asr r1, r1, #0xc
	add r0, r5, #0
	neg r1, r1
	bl ov90_02259FC8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02259FBE:
	sub r0, r0, #1
	strh r0, [r5, #0x32]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov90_02259F7C

	thumb_func_start ov90_02259FC8
ov90_02259FC8: ; 0x02259FC8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrh r0, [r5, #0x18]
	add r4, r1, #0
	ldrb r2, [r5, #0x1b]
	sub r1, r0, #1
	mov r0, #0xc
	add r3, r1, #0
	mul r3, r0
	ldr r0, _0225A040 ; =ov90_0225C324
	ldr r6, _0225A044 ; =ov90_0225C31C
	add r0, r0, r3
	ldrb r0, [r2, r0]
	add r3, r6, r3
	ldrb r2, [r2, r3]
	lsl r1, r0, #2
	ldr r0, _0225A048 ; =ov90_0225C276
	lsl r2, r2, #3
	ldrsh r0, [r0, r1]
	add r0, r0, r2
	ldr r2, _0225A04C ; =ov90_0225C274
	lsl r0, r0, #0x18
	ldrsh r1, [r2, r1]
	lsr r0, r0, #0x18
	lsl r0, r0, #0xc
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r1, r1, r4
	lsl r1, r1, #0xc
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl sub_020247D4
	ldrh r0, [r5, #0x18]
	add r4, #0x18
	sub r1, r0, #1
	add r2, r1, #0
	mov r0, #0xc
	mul r2, r0
	add r0, r6, #0
	ldrb r1, [r5, #0x1b]
	add r0, r0, r2
	ldrb r0, [r1, r0]
	lsl r0, r0, #3
	add r0, #0x15
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	lsl r0, r4, #0xc
	str r0, [sp]
	lsl r0, r1, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0225A040: .word ov90_0225C324
_0225A044: .word ov90_0225C31C
_0225A048: .word ov90_0225C276
_0225A04C: .word ov90_0225C274
	thumb_func_end ov90_02259FC8

	thumb_func_start ov90_0225A050
ov90_0225A050: ; 0x0225A050
	push {r4, r5, r6, r7}
	add r5, r0, #0
	ldr r4, _0225A080 ; =0x00000000
	beq _0225A076
	ldr r7, _0225A084 ; =ov90_0225C284
	lsl r6, r5, #2
	add r7, r7, r6
_0225A05E:
	sub r6, r7, #4
	ldrb r6, [r6]
	cmp r1, r6
	bne _0225A068
	add r3, r4, #0
_0225A068:
	cmp r2, r6
	bne _0225A06E
	add r0, r4, #0
_0225A06E:
	add r4, r4, #1
	add r7, r7, #1
	cmp r4, r5
	blo _0225A05E
_0225A076:
	sub r0, r3, r0
	bpl _0225A07C
	add r0, r0, r5
_0225A07C:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_0225A080: .word 0x00000000
_0225A084: .word ov90_0225C284
	thumb_func_end ov90_0225A050

	thumb_func_start ov90_0225A088
ov90_0225A088: ; 0x0225A088
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	add r4, r1, #0
	str r2, [sp]
	cmp r0, #0
	beq _0225A09E
	bl GF_AssertFail
_0225A09E:
	mov r1, #0
	str r4, [r6]
	add r3, r1, #0
	ldr r0, [r4]
	add r2, r1, #0
	sub r3, #0xff
	bl BgSetPosTextAndCommit
	ldr r0, [r6]
	mov r2, #0
	add r3, r2, #0
	ldr r0, [r0]
	mov r1, #1
	sub r3, #0xff
	bl BgSetPosTextAndCommit
	mov r7, #6
	mov r4, #0
	add r5, r6, #4
	lsl r7, r7, #6
_0225A0C6:
	mov r2, #6
	ldr r0, _0225A100 ; =0x0000FF01
	add r1, r5, #0
	lsl r2, r2, #6
	bl MIi_CpuClear16
	add r4, r4, #1
	add r5, r5, r7
	cmp r4, #2
	blt _0225A0C6
	mov r2, #0x61
	lsl r2, r2, #2
	ldr r0, [sp]
	add r1, r6, #4
	add r2, r6, r2
	bl sub_02014A08
	mov r1, #0xc1
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	mov r1, #0
	bl sub_02014A78
	ldr r0, _0225A104 ; =ov90_0225A1B8
	add r1, r6, #0
	bl Main_SetHBlankIntrCB
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A100: .word 0x0000FF01
_0225A104: .word ov90_0225A1B8
	thumb_func_end ov90_0225A088

	thumb_func_start ov90_0225A108
ov90_0225A108: ; 0x0225A108
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225A130
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02014A38
	mov r0, #0xc1
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
_0225A130:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov90_0225A108

	thumb_func_start ov90_0225A134
ov90_0225A134: ; 0x0225A134
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0xc1
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0
	bne _0225A148
	bl GF_AssertFail
_0225A148:
	mov r1, #0xc1
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_02014A4C
	ldr r1, _0225A194 ; =ov90_0225C31C
	add r5, r0, #0
	mov r6, #0
	mov r7, #0xc
_0225A15C:
	ldrh r0, [r4, #0x18]
	sub r3, r6, #1
	add r2, r0, #0
	mul r2, r7
	ldrb r0, [r4, #0x1b]
	add r2, r1, r2
	add r0, r0, r2
	sub r0, #0xc
	ldrb r0, [r0]
	lsl r0, r0, #3
	add r2, r3, r0
	bpl _0225A176
	add r2, #0xc0
_0225A176:
	ldr r0, [r4, #0x1c]
	lsl r2, r2, #1
	asr r0, r0, #0xc
	add r6, r6, #1
	strh r0, [r5, r2]
	cmp r6, #0x30
	blt _0225A15C
	mov r1, #0xc1
	ldr r0, [sp]
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	mov r1, #1
	bl sub_02014A78
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A194: .word ov90_0225C31C
	thumb_func_end ov90_0225A134

	thumb_func_start ov90_0225A198
ov90_0225A198: ; 0x0225A198
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225A1B6
	bl sub_02014A8C
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_02014A78
_0225A1B6:
	pop {r4, pc}
	thumb_func_end ov90_0225A198

	thumb_func_start ov90_0225A1B8
ov90_0225A1B8: ; 0x0225A1B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0225A1FC ; =0x04000006
	ldrh r4, [r0]
	cmp r4, #0xc0
	bge _0225A1F8
	mov r0, #0xc1
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02014A60
	add r6, r0, #0
	ldr r0, _0225A200 ; =0x04000004
	ldrh r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _0225A1F8
	lsl r4, r4, #1
	ldr r0, [r5]
	mov r1, #0
	ldrsh r3, [r6, r4]
	ldr r0, [r0]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	ldrsh r3, [r6, r4]
	ldr r0, [r0]
	mov r1, #1
	mov r2, #0
	bl BgSetPosTextAndCommit
_0225A1F8:
	pop {r4, r5, r6, pc}
	nop
_0225A1FC: .word 0x04000006
_0225A200: .word 0x04000004
	thumb_func_end ov90_0225A1B8

	thumb_func_start ov90_0225A204
ov90_0225A204: ; 0x0225A204
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	str r0, [sp]
	ldrb r0, [r5, #8]
	mov r4, #0
	cmp r0, #0
	ble _0225A252
	ldr r6, [sp]
_0225A216:
	add r1, r5, r4
	ldrb r1, [r1, #4]
	add r0, r5, #0
	bl ov90_022588CC
	str r0, [r6, #8]
	cmp r0, #0
	bne _0225A22A
	bl GF_AssertFail
_0225A22A:
	add r0, r5, r4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r7, r0, r4
	ldr r0, [sp, #4]
	ldrb r0, [r0, #4]
	bl sub_020348A8
	ldr r1, [sp]
	strb r0, [r1, r4]
	ldr r0, [sp, #4]
	ldrb r0, [r0, #4]
	bl sub_020348CC
	strb r0, [r7, #4]
	ldrb r0, [r5, #8]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, r0
	blt _0225A216
_0225A252:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_0225A204

	thumb_func_start ov90_0225A258
ov90_0225A258: ; 0x0225A258
	push {r3, r4, r5, r6}
	ldrb r4, [r0, #8]
	mov r3, #0
	add r2, r3, #0
	sub r4, r4, #1
	cmp r4, #0
	ble _0225A286
	mov r5, #1
_0225A268:
	add r4, r1, r2
	ldrb r6, [r4, #1]
	ldrb r4, [r1, r2]
	cmp r4, r6
	bne _0225A27A
	cmp r4, #0
	beq _0225A27A
	cmp r6, #0
	bne _0225A27C
_0225A27A:
	add r3, r5, #0
_0225A27C:
	ldrb r4, [r0, #8]
	add r2, r2, #1
	sub r4, r4, #1
	cmp r2, r4
	blt _0225A268
_0225A286:
	add r0, r3, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov90_0225A258

	thumb_func_start ov90_0225A28C
ov90_0225A28C: ; 0x0225A28C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #3
	bl _u32_div_f
	add r4, r1, #0
	add r0, r5, #0
	mov r1, #3
	bl _u32_div_f
	add r1, r4, #1
	cmp r1, #3
	bhs _0225A2A8
	add r4, r1, #0
_0225A2A8:
	lsl r1, r0, #1
	add r0, r0, r1
	add r0, r0, r4
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225A28C

	thumb_func_start ov90_0225A2B0
ov90_0225A2B0: ; 0x0225A2B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0xb
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r0, _0225A33C ; =0x00000201
	add r4, r1, #0
	str r0, [sp, #0x10]
	add r7, r2, #0
	add r6, r3, #0
	ldr r0, [r4]
	add r1, r5, #0
	mov r2, #1
	mov r3, #6
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, [sp, #0x2c]
	mov r0, #0x80
	bl String_ctor
	str r0, [r5, #0x14]
	add r0, r7, #0
	add r1, r6, #0
	bl ov90_0225927C
	ldr r1, [r5, #0x14]
	add r0, r7, #0
	mov r2, #0x10
	bl ov90_0225928C
	mov r0, #1
	mov r1, #0
	str r6, [r5, #0x10]
	bl GX_EngineAToggleLayers
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [r4]
	mov r1, #7
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	ldr r0, [sp, #0x2c]
	str r3, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	ldr r2, [r4]
	mov r1, #0xa
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225A33C: .word 0x00000201
	thumb_func_end ov90_0225A2B0

	thumb_func_start ov90_0225A340
ov90_0225A340: ; 0x0225A340
	push {r4, lr}
	add r4, r0, #0
	bl RemoveWindow
	ldr r0, [r4, #0x14]
	bl String_dtor
	pop {r4, pc}
	thumb_func_end ov90_0225A340

	thumb_func_start ov90_0225A350
ov90_0225A350: ; 0x0225A350
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	add r7, r2, #0
	lsl r6, r0, #2
	ldr r1, _0225A3D0 ; =ov90_0225C258
	ldr r2, _0225A3D4 ; =ov90_0225C228
	ldr r3, _0225A3D8 ; =ov90_0225C21C
	mov r0, #0x10
	str r0, [sp]
	add r0, r5, #0
	ldr r1, [r1, r6]
	ldr r2, [r2, r6]
	ldr r3, [r3, r6]
	add r0, #0x18
	bl ov90_02258CF0
	ldr r2, [r5, #0x18]
	add r0, r5, #0
	add r1, r4, #0
	asr r2, r2, #0xc
	bl ov90_0225A5BC
	mov r0, #2
	add r1, r7, #0
	bl FontID_Alloc
	ldr r1, [r5, #0x14]
	mov r0, #2
	mov r2, #0
	bl FontID_String_GetWidth
	mov r2, #0
	str r2, [sp]
	add r3, r0, #0
	str r2, [sp, #4]
	ldr r0, [r5, #0x10]
	lsr r4, r3, #1
	lsl r1, r0, #2
	ldr r0, _0225A3DC ; =ov90_0225C210
	mov r3, #0x50
	ldr r0, [r0, r1]
	mov r1, #2
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r5, #0
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	mov r0, #2
	bl FontID_Release
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A3D0: .word ov90_0225C258
_0225A3D4: .word ov90_0225C228
_0225A3D8: .word ov90_0225C21C
_0225A3DC: .word ov90_0225C210
	thumb_func_end ov90_0225A350

	thumb_func_start ov90_0225A3E0
ov90_0225A3E0: ; 0x0225A3E0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0
	strh r0, [r5, #0x2c]
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	lsl r3, r0, #2
	ldr r1, _0225A41C ; =ov90_0225C228
	ldr r2, _0225A420 ; =ov90_0225C1F8
	mov r0, #8
	str r0, [sp]
	add r0, r5, #0
	ldr r6, _0225A424 ; =ov90_0225C204
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r6, r3]
	add r0, #0x18
	bl ov90_02258CF0
	ldr r2, [r5, #0x18]
	add r0, r5, #0
	add r1, r4, #0
	asr r2, r2, #0xc
	bl ov90_0225A60C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225A41C: .word ov90_0225C228
_0225A420: .word ov90_0225C1F8
_0225A424: .word ov90_0225C204
	thumb_func_end ov90_0225A3E0

	thumb_func_start ov90_0225A428
ov90_0225A428: ; 0x0225A428
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x2e
	ldrsh r0, [r4, r0]
	add r5, r1, #0
	cmp r0, #3
	bhi _0225A528
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225A444: ; jump table
	.short _0225A44C - _0225A444 - 2 ; case 0
	.short _0225A4A2 - _0225A444 - 2 ; case 1
	.short _0225A4F2 - _0225A444 - 2 ; case 2
	.short _0225A522 - _0225A444 - 2 ; case 3
_0225A44C:
	mov r1, #0x2c
	ldrsh r1, [r4, r1]
	add r0, r4, #0
	add r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r4, #0x18]
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	asr r2, r2, #0xc
	bl ov90_0225A60C
	mov r0, #0x2c
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x2c]
	cmp r6, #1
	bne _0225A528
	ldr r0, _0225A530 ; =0x00000581
	bl PlaySE
	ldr r0, [r4, #0x10]
	ldr r1, _0225A534 ; =ov90_0225C228
	lsl r3, r0, #2
	ldr r2, _0225A538 ; =ov90_0225C234
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	ldr r5, _0225A53C ; =ov90_0225C240
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	add r0, #0x18
	bl ov90_02258CF0
	mov r0, #0x2e
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x2e]
	mov r0, #0
	strh r0, [r4, #0x2c]
	b _0225A528
_0225A4A2:
	mov r1, #0x2c
	ldrsh r1, [r4, r1]
	add r0, r4, #0
	add r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r4, #0x18]
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	asr r2, r2, #0xc
	bl ov90_0225A60C
	mov r0, #0x2c
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x2c]
	cmp r6, #1
	bne _0225A528
	ldr r0, [r4, #0x10]
	ldr r1, _0225A538 ; =ov90_0225C234
	lsl r3, r0, #2
	ldr r2, _0225A534 ; =ov90_0225C228
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	ldr r5, _0225A540 ; =ov90_0225C24C
	ldr r1, [r1, r3]
	ldr r2, [r2, r3]
	ldr r3, [r5, r3]
	add r0, #0x18
	bl ov90_02258CF0
	mov r0, #0x2e
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x2e]
	mov r0, #0
	strh r0, [r4, #0x2c]
	b _0225A528
_0225A4F2:
	mov r1, #0x2c
	ldrsh r1, [r4, r1]
	add r0, r4, #0
	add r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r4, #0x18]
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	asr r2, r2, #0xc
	bl ov90_0225A60C
	mov r0, #0x2c
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x2c]
	cmp r6, #1
	bne _0225A528
	mov r0, #0x2e
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x2e]
	b _0225A528
_0225A522:
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0225A528:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0225A530: .word 0x00000581
_0225A534: .word ov90_0225C228
_0225A538: .word ov90_0225C234
_0225A53C: .word ov90_0225C240
_0225A540: .word ov90_0225C24C
	thumb_func_end ov90_0225A428

	thumb_func_start ov90_0225A544
ov90_0225A544: ; 0x0225A544
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0x2e
	ldrsh r1, [r5, r1]
	cmp r1, #0
	beq _0225A558
	cmp r1, #1
	beq _0225A586
	b _0225A5B8
_0225A558:
	mov r1, #0x2c
	ldrsh r1, [r5, r1]
	add r0, #0x18
	bl ov90_02258D4C
	ldr r2, [r5, #0x18]
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	asr r2, r2, #0xc
	bl ov90_0225A60C
	mov r0, #0x2c
	ldrsh r0, [r5, r0]
	add r0, r0, #1
	strh r0, [r5, #0x2c]
	cmp r6, #1
	bne _0225A5B8
	mov r0, #0x2e
	ldrsh r0, [r5, r0]
	add r0, r0, #1
	strh r0, [r5, #0x2e]
	b _0225A5B8
_0225A586:
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov90_0225A5BC
	ldr r0, [r4]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225A5B8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov90_0225A544

	thumb_func_start ov90_0225A5BC
ov90_0225A5BC: ; 0x0225A5BC
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #0
	beq _0225A5D2
	cmp r0, #1
	beq _0225A5D2
	cmp r0, #2
	beq _0225A5EC
	b _0225A606
_0225A5D2:
	mov r1, #0
	ldr r0, [r5]
	add r2, r1, #0
	add r3, r4, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0
	add r3, r4, #0
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, pc}
_0225A5EC:
	ldr r0, [r5]
	mov r1, #0
	mov r2, #3
	add r3, r4, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	mov r1, #1
	mov r2, #3
	add r3, r4, #0
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, pc}
_0225A606:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225A5BC

	thumb_func_start ov90_0225A60C
ov90_0225A60C: ; 0x0225A60C
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	cmp r0, #0
	beq _0225A622
	cmp r0, #1
	beq _0225A622
	cmp r0, #2
	beq _0225A63C
	b _0225A656
_0225A622:
	mov r1, #0
	ldr r0, [r5]
	add r2, r1, #0
	add r3, r4, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5]
	mov r1, #1
	mov r2, #0
	add r3, r4, #0
	bl ScheduleSetBgPosText
	pop {r3, r4, r5, pc}
_0225A63C:
	ldr r0, [r5]
	mov r1, #0
	mov r2, #3
	add r3, r4, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5]
	mov r1, #1
	mov r2, #3
	add r3, r4, #0
	bl ScheduleSetBgPosText
	pop {r3, r4, r5, pc}
_0225A656:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	thumb_func_end ov90_0225A60C

	thumb_func_start ov90_0225A65C
ov90_0225A65C: ; 0x0225A65C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r5, r2, #0
	cmp r1, #0
	beq _0225A672
	cmp r1, #1
	beq _0225A676
	cmp r1, #2
	beq _0225A67A
	b _0225A67E
_0225A672:
	mov r0, #1
	b _0225A680
_0225A676:
	mov r0, #2
	b _0225A680
_0225A67A:
	mov r0, #0
	b _0225A680
_0225A67E:
	mov r0, #1
_0225A680:
	lsl r4, r0, #5
	mov r0, #0xa0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	add r3, r4, #0
	str r5, [sp, #8]
	bl GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc
	mov r0, #0xa0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #5
	mov r2, #4
	add r3, r4, #0
	str r5, [sp, #8]
	bl GfGfxLoader_GXLoadPalWithSrcOffsetFromOpenNarc
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov90_0225A65C

	thumb_func_start ov90_0225A6B4
ov90_0225A6B4: ; 0x0225A6B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r3, #0
	add r6, r0, #0
	ldr r1, _0225A820 ; =0x00000664
	add r0, r5, #0
	str r2, [sp, #4]
	bl AllocFromHeap
	ldr r2, _0225A820 ; =0x00000664
	mov r1, #0
	add r4, r0, #0
	bl memset
	add r2, r4, #0
	add r2, #0x1c
	mov r1, #0x18
_0225A6D8:
	ldrb r0, [r7]
	add r7, r7, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0225A6D8
	add r2, r4, #0
	add r2, #0xc
	mov r1, #0x10
_0225A6EA:
	ldrb r0, [r6]
	add r6, r6, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0225A6EA
	ldr r0, [sp, #4]
	strb r0, [r4, #7]
	add r0, r4, #0
	bl ov90_0225C15C
	ldr r3, _0225A824 ; =0x04000050
	mov r1, #0
	strh r1, [r3]
	ldr r0, _0225A828 ; =0x04001050
	sub r3, #0x50
	strh r1, [r0]
	ldr r2, [r3]
	ldr r1, _0225A82C ; =0xFFFF1FFF
	sub r0, #0x50
	and r2, r1
	str r2, [r3]
	ldr r2, [r0]
	and r1, r2
	str r1, [r0]
	ldr r0, _0225A830 ; =ov90_0225C2F4
	bl GX_SetBanks
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x34
	add r1, #0xc
	strh r5, [r4, #2]
	bl ov90_0225A204
	mov r0, #0x10
	add r1, r5, #0
	bl GF_CreateVramTransferManager
	add r0, r4, #0
	ldr r1, _0225A834 ; =ov90_0225C264
	ldr r2, _0225A838 ; =ov90_0225C43C
	add r0, #0x4c
	mov r3, #6
	str r5, [sp]
	bl ov90_02258FF0
	add r0, r4, #0
	mov r2, #2
	add r0, #0xa0
	mov r1, #0x20
	add r3, r2, #0
	str r5, [sp]
	bl ov90_022590CC
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #2
	add r2, r5, #0
	bl ov90_02258DD0
	add r0, r4, #0
	add r0, #0x58
	add r1, r5, #0
	bl ov90_02259184
	add r0, r4, #0
	add r1, r5, #0
	bl ov90_0225A850
	add r0, r4, #0
	ldrb r1, [r4, #0x15]
	add r0, #0xc
	bl ov90_0225888C
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xc
	bl ov90_022588A4
	str r5, [sp]
	add r3, r0, #0
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #0xc]
	add r0, #0x68
	add r1, #0x4c
	bl ov90_0225938C
	mov r0, #0x7a
	lsl r0, r0, #2
	add r1, r4, #0
	ldrb r2, [r4, #0x16]
	add r0, r4, r0
	add r1, #0x4c
	add r3, r5, #0
	bl ov90_0225B340
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xc
	add r1, #0x34
	bl ov90_0225A258
	strb r0, [r4, #5]
	ldrb r0, [r4, #7]
	cmp r0, #0
	beq _0225A7CE
	cmp r0, #1
	beq _0225A7CE
	cmp r0, #2
	beq _0225A7DE
	b _0225A7EE
_0225A7CE:
	ldr r0, _0225A83C ; =ov90_0225A980
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r1, _0225A840 ; =0x00000644
	str r0, [r4, r1]
	b _0225A800
_0225A7DE:
	ldr r0, _0225A844 ; =ov90_0225AE4C
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r1, _0225A840 ; =0x00000644
	str r0, [r4, r1]
	b _0225A800
_0225A7EE:
	bl GF_AssertFail
	ldr r0, _0225A83C ; =ov90_0225A980
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	ldr r1, _0225A840 ; =0x00000644
	str r0, [r4, r1]
_0225A800:
	ldr r0, _0225A848 ; =ov90_0225B230
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	ldr r1, _0225A84C ; =0x00000648
	str r0, [r4, r1]
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _0225A81A
	add r0, r5, #0
	bl ov00_021E69A8
_0225A81A:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225A820: .word 0x00000664
_0225A824: .word 0x04000050
_0225A828: .word 0x04001050
_0225A82C: .word 0xFFFF1FFF
_0225A830: .word ov90_0225C2F4
_0225A834: .word ov90_0225C264
_0225A838: .word ov90_0225C43C
_0225A83C: .word ov90_0225A980
_0225A840: .word 0x00000644
_0225A844: .word ov90_0225AE4C
_0225A848: .word ov90_0225B230
_0225A84C: .word 0x00000648
	thumb_func_end ov90_0225A6B4

	thumb_func_start ov90_0225A850
ov90_0225A850: ; 0x0225A850
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0xc8
	add r4, r1, #0
	bl NARC_ctor
	mov r1, #0x12
	lsl r1, r1, #4
	str r1, [sp]
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r6, r0, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp]
	mov r1, #4
	add r0, r6, #0
	add r2, r1, #0
	mov r3, #0
	str r4, [sp, #4]
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	add r0, r6, #0
	mov r1, #6
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r1, #0
	mov r0, #1
	str r1, [sp]
	lsl r0, r0, #0xe
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	add r0, r6, #0
	mov r1, #6
	mov r3, #5
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0x96
	lsl r3, r3, #2
	add r0, r6, #0
	mov r1, #9
	mov r2, #0
	add r3, r5, r3
	str r4, [sp]
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	mov r1, #0x95
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	add r0, r6, #0
	mov r1, #8
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r5, #0x4c]
	add r0, r6, #0
	mov r1, #8
	mov r3, #5
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldrb r1, [r5, #7]
	add r0, r6, #0
	add r2, r4, #0
	bl ov90_0225A65C
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0xd
	str r0, [sp, #4]
	mov r0, #0xe
	str r0, [sp, #8]
	ldr r0, _0225A95C ; =0x00001388
	add r1, r6, #0
	str r0, [sp, #0xc]
	mov r0, #0x73
	lsl r0, r0, #2
	add r0, r5, r0
	mov r2, #0xb
	mov r3, #5
	str r4, [sp, #0x10]
	bl ov90_02258E54
	mov r1, #0x79
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov90_0225B254
	mov r3, #0x82
	lsl r3, r3, #2
	add r0, r5, r3
	add r1, r5, #0
	add r2, r5, #0
	sub r3, #0x3c
	str r6, [sp]
	add r1, #0x4c
	add r2, #0xa0
	add r3, r5, r3
	str r4, [sp, #4]
	bl ov90_0225B59C
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0225A95C: .word 0x00001388
	thumb_func_end ov90_0225A850

	thumb_func_start ov90_0225A960
ov90_0225A960: ; 0x0225A960
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x82
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225B690
	mov r0, #0x95
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl ov90_0225B330
	pop {r4, pc}
	thumb_func_end ov90_0225A960

	thumb_func_start ov90_0225A980
ov90_0225A980: ; 0x0225A980
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldrb r1, [r4, #4]
	cmp r1, #0x17
	bhi _0225AA8A
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225A998: ; jump table
	.short _0225A9C8 - _0225A998 - 2 ; case 0
	.short _0225AA38 - _0225A998 - 2 ; case 1
	.short _0225AA48 - _0225A998 - 2 ; case 2
	.short _0225AA60 - _0225A998 - 2 ; case 3
	.short _0225AA7A - _0225A998 - 2 ; case 4
	.short _0225AAEC - _0225A998 - 2 ; case 5
	.short _0225AB5E - _0225A998 - 2 ; case 6
	.short _0225ABCA - _0225A998 - 2 ; case 7
	.short _0225ABDC - _0225A998 - 2 ; case 8
	.short _0225ABEC - _0225A998 - 2 ; case 9
	.short _0225AC08 - _0225A998 - 2 ; case 10
	.short _0225AC40 - _0225A998 - 2 ; case 11
	.short _0225AC74 - _0225A998 - 2 ; case 12
	.short _0225ACDC - _0225A998 - 2 ; case 13
	.short _0225ACF6 - _0225A998 - 2 ; case 14
	.short _0225AD1E - _0225A998 - 2 ; case 15
	.short _0225AD42 - _0225A998 - 2 ; case 16
	.short _0225AD60 - _0225A998 - 2 ; case 17
	.short _0225AD80 - _0225A998 - 2 ; case 18
	.short _0225AD8E - _0225A998 - 2 ; case 19
	.short _0225AD9C - _0225A998 - 2 ; case 20
	.short _0225ADCC - _0225A998 - 2 ; case 21
	.short _0225ADDC - _0225A998 - 2 ; case 22
	.short _0225ADF2 - _0225A998 - 2 ; case 23
_0225A9C8:
	ldr r0, [r4, #0x18]
	ldr r1, [r0]
	ldr r0, _0225ACA8 ; =0x0000064C
	str r1, [r4, r0]
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225A9DC
	mov r0, #0
	strb r0, [r4, #9]
	b _0225AA1A
_0225A9DC:
	add r0, r4, #0
	bl ov90_0225BA14
	ldrb r2, [r4, #0x15]
	add r1, r4, r2
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #0
	bne _0225AA0A
	lsl r1, r2, #2
	add r1, r4, r1
	ldr r1, [r1, #0x1c]
	cmp r1, r0
	bls _0225AA0A
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl ov90_0225A28C
	ldr r1, [r4, #0x18]
	str r0, [r1]
	mov r0, #1
	strb r0, [r4, #9]
	b _0225AA0E
_0225AA0A:
	mov r0, #0
	strb r0, [r4, #9]
_0225AA0E:
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0225AA1A
	add r0, r4, #0
	bl ov90_0225BA38
_0225AA1A:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrh r0, [r4, #2]
	ldr r3, _0225ACAC ; =0x0000FFFF
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA38:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225AA8A
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA48:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x58
	mov r2, #1
	mov r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA60:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AA8A
	mov r0, #0x40
	strh r0, [r4]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AA7A:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AA8A
	sub r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AA8C
_0225AA8A:
	b _0225AE1C
_0225AA8C:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	mov r5, #1
	bl ov90_022594FC
	mov r0, #0xcf
	lsl r0, r0, #2
	add r1, r4, #0
	ldrh r2, [r4, #2]
	add r0, r4, r0
	add r1, #0x4c
	bl ov90_0225A088
	add r0, r4, #0
	bl ov90_0225BA14
	ldrb r6, [r4, #0x14]
	add r2, r0, #0
	mov r1, #0
	cmp r6, #0
	ble _0225AACC
	add r3, r4, #0
	add r7, r1, #0
_0225AABC:
	ldr r0, [r3, #0x1c]
	cmp r0, r2
	bls _0225AAC4
	add r5, r7, #0
_0225AAC4:
	add r1, r1, #1
	add r3, r3, #4
	cmp r1, r6
	blt _0225AABC
_0225AACC:
	cmp r5, #1
	bne _0225AADC
	ldr r0, _0225ACB0 ; =0x00000652
	mov r1, #0x10
	strh r1, [r4, r0]
	mov r0, #0x16
	strb r0, [r4, #4]
	b _0225AE1C
_0225AADC:
	ldrb r0, [r4, #4]
	mov r1, #4
	add r0, r0, #1
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #4
	strh r1, [r4, r0]
	b _0225AE1C
_0225AAEC:
	mov r7, #0x65
	mov r1, #0
	mov r6, #1
	lsl r7, r7, #4
_0225AAF4:
	ldrh r0, [r4, r7]
	sub r0, r0, #1
	strh r0, [r4, r7]
	ldrb r3, [r4, #0x14]
	mov r0, #0
	cmp r3, #0
	ble _0225AB1A
	mov r2, #0x65
	lsl r2, r2, #4
	ldrh r2, [r4, r2]
_0225AB08:
	add r5, r4, r0
	add r5, #0x2c
	ldrb r5, [r5]
	cmp r2, r5
	bne _0225AB14
	add r1, r6, #0
_0225AB14:
	add r0, r0, #1
	cmp r0, r3
	blt _0225AB08
_0225AB1A:
	cmp r1, #0
	beq _0225AAF4
	mov r1, #0x65
	lsl r1, r1, #4
	ldrh r0, [r4, r1]
	cmp r0, #3
	bhi _0225AB4C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225AB34: ; jump table
	.short _0225AB44 - _0225AB34 - 2 ; case 0
	.short _0225AB44 - _0225AB34 - 2 ; case 1
	.short _0225AB3C - _0225AB34 - 2 ; case 2
	.short _0225AB3C - _0225AB34 - 2 ; case 3
_0225AB3C:
	mov r2, #0x10
	add r0, r1, #2
	strh r2, [r4, r0]
	b _0225AB50
_0225AB44:
	mov r2, #0x20
	add r0, r1, #2
	strh r2, [r4, r0]
	b _0225AB50
_0225AB4C:
	bl GF_AssertFail
_0225AB50:
	add r0, r4, #0
	bl ov90_0225B8F0
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AB5E:
	ldr r0, _0225ACB0 ; =0x00000652
	ldrh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, r0]
	add r0, r4, #0
	bl ov90_0225B8F0
	ldr r0, _0225ACB0 ; =0x00000652
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _0225ABFC
	ldrb r0, [r4, #0x14]
	mov r5, #0
	cmp r0, #0
	ble _0225ABB2
	mov r6, #0x65
	add r7, r5, #0
	lsl r6, r6, #4
_0225AB82:
	add r1, r4, r5
	add r1, #0x2c
	ldrb r2, [r1]
	ldrh r1, [r4, r6]
	add r0, r7, #0
	cmp r1, r2
	bne _0225AB94
	mov r0, #1
	b _0225AB9E
_0225AB94:
	cmp r1, #1
	bne _0225AB9E
	cmp r2, #0
	bne _0225AB9E
	mov r0, #1
_0225AB9E:
	cmp r0, #0
	beq _0225ABAA
	add r0, r4, #0
	add r1, r5, #0
	bl ov90_0225B7FC
_0225ABAA:
	ldrb r0, [r4, #0x14]
	add r5, r5, #1
	cmp r5, r0
	blt _0225AB82
_0225ABB2:
	mov r0, #0x65
	lsl r0, r0, #4
	ldrh r0, [r4, r0]
	cmp r0, #1
	bls _0225ABC2
	mov r0, #5
	strb r0, [r4, #4]
	b _0225AE1C
_0225ABC2:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ABCA:
	add r0, r4, #0
	bl ov90_0225B8F0
	cmp r0, #0
	beq _0225ABFC
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ABDC:
	add r0, r1, #1
	strb r0, [r4, #4]
	add r0, r4, #0
	bl ov90_0225B274
	mov r0, #0x1e
	strh r0, [r4]
	b _0225AE1C
_0225ABEC:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225ABF6
	sub r0, r0, #1
	strh r0, [r4]
_0225ABF6:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225ABFE
_0225ABFC:
	b _0225AE1C
_0225ABFE:
	mov r0, #0xa
	strb r0, [r4, #4]
	mov r0, #0
	strh r0, [r4]
	b _0225AE1C
_0225AC08:
	ldrb r1, [r4, #0x15]
	add r0, r4, r1
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225AC18
	mov r5, #0x11
	b _0225AC1A
_0225AC18:
	mov r5, #0x12
_0225AC1A:
	lsl r1, r1, #2
	add r1, r4, r1
	add r0, r4, #0
	ldr r1, [r1, #0x3c]
	add r0, #0x58
	bl ov90_02259200
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x58
	add r2, r5, #0
	mov r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AC40:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AD06
	add r0, r4, #0
	bl ov90_0225B978
	cmp r0, #1
	bne _0225AD06
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225AC68
	mov r0, #0x66
	strh r0, [r4]
	mov r0, #0xe
	strb r0, [r4, #4]
	b _0225AE1C
_0225AC68:
	mov r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AC74:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AC80
	sub r0, r0, #1
	strh r0, [r4]
	b _0225AE1C
_0225AC80:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0225ACB4
	ldr r1, [r4, #0x18]
	add r0, r4, #0
	ldr r1, [r1]
	add r0, #0x58
	bl ov90_0225926C
	ldr r0, _0225ACA8 ; =0x0000064C
	ldr r1, [r4, r0]
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	cmp r1, r0
	bne _0225ACA2
	mov r5, #0x13
	b _0225ACB6
_0225ACA2:
	mov r5, #2
	b _0225ACB6
	nop
_0225ACA8: .word 0x0000064C
_0225ACAC: .word 0x0000FFFF
_0225ACB0: .word 0x00000652
_0225ACB4:
	mov r5, #9
_0225ACB6:
	ldrb r1, [r4, #0x15]
	add r0, r4, #0
	add r0, #0x58
	lsl r1, r1, #2
	add r1, r4, r1
	ldr r1, [r1, #0x3c]
	bl ov90_02259200
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x58
	add r2, r5, #0
	mov r3, #0
	bl ov90_02259464
	mov r0, #0xd
	strb r0, [r4, #4]
	b _0225AE1C
_0225ACDC:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AD06
	mov r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ACF6:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AD06
	sub r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AD08
_0225AD06:
	b _0225AE1C
_0225AD08:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_022594FC
	mov r0, #0x1e
	strh r0, [r4]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD1E:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AD2A
	sub r0, r0, #1
	strh r0, [r4]
	b _0225AE1C
_0225AD2A:
	mov r0, #0x82
	bl sub_02037AC0
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _0225AD3A
	bl ov00_021E6A4C
_0225AD3A:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD42:
	mov r0, #0x82
	bl sub_02037B38
	cmp r0, #0
	beq _0225AE1C
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0225AD58
	mov r0, #0x13
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD58:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD60:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #0
	ldrh r0, [r4, #2]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD80:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225AE1C
	mov r0, #0x15
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD8E:
	add r0, r4, #0
	bl ov90_0225B9A8
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225AD9C:
	ldrh r0, [r4, #2]
	add r1, r4, #0
	add r2, r4, #0
	str r0, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldrb r3, [r4, #7]
	add r0, r4, r0
	add r1, #0x68
	add r2, #0x58
	bl ov90_0225B38C
	cmp r0, #0
	beq _0225AE1C
	mov r0, #0x7a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225B538
	strb r0, [r4, #8]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ADCC:
	mov r0, #0xcf
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225A108
	mov r0, #1
	strb r0, [r4, #6]
	b _0225AE1C
_0225ADDC:
	ldr r0, _0225AE48 ; =0x00000652
	ldrh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, r0]
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _0225AE1C
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225AE1C
_0225ADF2:
	ldrb r0, [r4, #0x14]
	mov r5, #0
	cmp r0, #0
	ble _0225AE18
_0225ADFA:
	sub r1, r0, #1
	add r0, r4, r5
	add r0, #0x2c
	strb r1, [r0]
	add r2, r4, r5
	add r2, #0x2c
	ldrb r2, [r2]
	add r0, r4, #0
	add r1, r5, #0
	bl ov90_0225B7FC
	ldrb r0, [r4, #0x14]
	add r5, r5, #1
	cmp r5, r0
	blt _0225ADFA
_0225AE18:
	mov r0, #7
	strb r0, [r4, #4]
_0225AE1C:
	add r0, r4, #0
	bl ov90_0225B2A8
	add r0, r4, #0
	add r0, #0xa0
	bl ov90_02259170
	ldr r0, [r4, #0x4c]
	mov r1, #3
	mov r2, #4
	mov r3, #2
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x4c]
	mov r1, #5
	mov r2, #4
	mov r3, #2
	bl ScheduleSetBgPosText
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0225AE48: .word 0x00000652
	thumb_func_end ov90_0225A980

	thumb_func_start ov90_0225AE4C
ov90_0225AE4C: ; 0x0225AE4C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r1, #0
	ldrb r0, [r4, #4]
	cmp r0, #0x14
	bhi _0225AF36
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225AE64: ; jump table
	.short _0225AE8E - _0225AE64 - 2 ; case 0
	.short _0225AEDE - _0225AE64 - 2 ; case 1
	.short _0225AEF6 - _0225AE64 - 2 ; case 2
	.short _0225AF0C - _0225AE64 - 2 ; case 3
	.short _0225AF26 - _0225AE64 - 2 ; case 4
	.short _0225AF4A - _0225AE64 - 2 ; case 5
	.short _0225B02C - _0225AE64 - 2 ; case 6
	.short _0225B056 - _0225AE64 - 2 ; case 7
	.short _0225B07A - _0225AE64 - 2 ; case 8
	.short _0225B0A0 - _0225AE64 - 2 ; case 9
	.short _0225B0DE - _0225AE64 - 2 ; case 10
	.short _0225B100 - _0225AE64 - 2 ; case 11
	.short _0225B126 - _0225AE64 - 2 ; case 12
	.short _0225B13C - _0225AE64 - 2 ; case 13
	.short _0225B152 - _0225AE64 - 2 ; case 14
	.short _0225B16A - _0225AE64 - 2 ; case 15
	.short _0225B188 - _0225AE64 - 2 ; case 16
	.short _0225B1A8 - _0225AE64 - 2 ; case 17
	.short _0225B1B6 - _0225AE64 - 2 ; case 18
	.short _0225B1C8 - _0225AE64 - 2 ; case 19
	.short _0225B1F6 - _0225AE64 - 2 ; case 20
_0225AE8E:
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225AE9A
	mov r0, #0
	strb r0, [r4, #9]
	b _0225AEC0
_0225AE9A:
	ldr r0, [r4, #0x30]
	cmp r0, #0xa
	blo _0225AEB0
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl ov90_0225A28C
	ldr r1, [r4, #0x18]
	str r0, [r1]
	mov r0, #1
	b _0225AEB2
_0225AEB0:
	mov r0, #0
_0225AEB2:
	strb r0, [r4, #9]
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0225AEC0
	add r0, r4, #0
	bl ov90_0225BAA0
_0225AEC0:
	mov r0, #6
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldrh r0, [r4, #2]
	ldr r3, _0225B1C4 ; =0x0000FFFF
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AEDE:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225AF36
	ldrb r0, [r4, #4]
	mov r1, #4
	add r0, r0, #1
	strb r0, [r4, #4]
	mov r0, #0x65
	lsl r0, r0, #4
	strh r1, [r4, r0]
	b _0225B204
_0225AEF6:
	add r0, r4, #0
	add r0, #0x68
	add r1, #0x58
	mov r2, #1
	mov r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AF0C:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225AF36
	mov r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AF26:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AF36
	sub r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225AF38
_0225AF36:
	b _0225B204
_0225AF38:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_022594FC
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225AF4A:
	mov r0, #0xcf
	lsl r0, r0, #2
	ldrh r2, [r4, #2]
	add r0, r4, r0
	add r1, #0x4c
	bl ov90_0225A088
	ldrb r1, [r4, #0x14]
	mov r6, #0
	cmp r1, #0
	ble _0225B020
	mov r0, #0x97
	lsl r0, r0, #2
	add r5, r4, r0
	add r0, r4, #0
	str r0, [sp, #0x1c]
	add r0, #0x4c
	str r0, [sp, #0x1c]
	add r0, r4, #0
	str r0, [sp, #0x20]
	add r0, #0xa0
	str r0, [sp, #0x20]
	add r0, r4, #0
	str r0, [sp, #0x24]
	add r0, #0xc
	str r0, [sp, #0x24]
	add r0, r4, #0
	str r0, [sp, #0x28]
	add r0, #0x58
	str r4, [sp, #0x18]
	add r7, r6, #0
	str r0, [sp, #0x28]
_0225AF8A:
	ldr r0, [sp, #0x1c]
	mov r3, #0x96
	str r0, [sp]
	str r6, [sp, #4]
	ldrb r0, [r4, #0x15]
	lsl r3, r3, #2
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0xc]
	mov r0, #0x79
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [sp, #0x10]
	ldrh r0, [r4, #2]
	str r0, [sp, #0x14]
	ldrb r2, [r4, #7]
	ldr r3, [r4, r3]
	add r0, r5, #0
	bl ov90_02259BCC
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	bl ov90_0225888C
	add r1, r0, #0
	ldr r0, [sp, #0x24]
	bl ov90_022588A4
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x28]
	ldr r2, [r2, #0x3c]
	add r0, r5, #0
	mov r3, #8
	bl ov90_02259D50
	add r0, r4, r6
	add r0, #0x38
	ldrb r0, [r0]
	add r3, r4, r6
	add r3, #0x34
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	ldrb r2, [r4, #5]
	ldrb r3, [r3]
	ldr r1, [sp, #0x28]
	add r0, r5, #0
	bl ov90_02259DAC
	ldr r1, [sp, #0x1c]
	add r0, r5, #0
	bl ov90_02259E8C
	add r0, r5, #0
	bl ov90_02259EA0
	mov r1, #7
	lsl r2, r7, #0x10
	add r0, r5, #0
	mvn r1, r1
	asr r2, r2, #0x10
	bl ov90_02259EE0
	ldr r0, [sp, #0x18]
	ldrb r1, [r4, #0x14]
	add r0, r0, #4
	add r6, r6, #1
	add r5, #0x38
	str r0, [sp, #0x18]
	add r7, r7, #3
	cmp r6, r1
	blt _0225AF8A
_0225B020:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	mov r0, #0x10
	strh r0, [r4]
	b _0225B204
_0225B02C:
	add r0, r4, #0
	bl ov90_0225B8F0
	cmp r0, #1
	bne _0225B0BE
	ldrh r0, [r4]
	sub r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B0BE
	mov r0, #0x82
	lsl r0, r0, #2
	ldr r1, [r4, #0x30]
	add r0, r4, r0
	bl ov90_0225B6B0
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B056:
	mov r0, #0x82
	lsl r0, r0, #2
	add r0, r4, r0
	add r1, #0x4c
	bl ov90_0225B6C4
	cmp r0, #1
	bne _0225B0BE
	ldrb r0, [r4, #9]
	cmp r0, #1
	bne _0225B072
	add r0, r4, #0
	bl ov90_0225B954
_0225B072:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B07A:
	add r0, r4, #0
	ldr r1, [r4, #0x30]
	add r0, #0x58
	bl ov90_02259250
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x58
	mov r2, #7
	mov r3, #0
	bl ov90_02259464
	mov r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B0A0:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_02259538
	cmp r0, #1
	bne _0225B0BE
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B0D8
	add r0, r4, #0
	bl ov90_0225B978
	cmp r0, #1
	beq _0225B0C0
_0225B0BE:
	b _0225B204
_0225B0C0:
	ldrb r0, [r4, #0x17]
	cmp r0, #1
	bne _0225B0D0
	mov r0, #0x66
	strh r0, [r4]
	mov r0, #0xc
	strb r0, [r4, #4]
	b _0225B204
_0225B0D0:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B0D8:
	sub r0, r0, #1
	strh r0, [r4]
	b _0225B204
_0225B0DE:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0225B0E8
	mov r2, #8
	b _0225B0EA
_0225B0E8:
	mov r2, #9
_0225B0EA:
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x68
	add r1, #0x58
	mov r3, #0
	bl ov90_02259464
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B100:
	add r0, r4, #0
	add r0, #0x68
	mov r1, #0
	bl ov90_02259538
	cmp r0, #0
	beq _0225B204
	mov r0, #0x66
	strh r0, [r4]
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0225B11E
	mov r0, #0xd
	strb r0, [r4, #4]
	b _0225B204
_0225B11E:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B126:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225B204
	sub r0, r0, #1
	strh r0, [r4]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B204
	mov r0, #0xe
	strb r0, [r4, #4]
	b _0225B204
_0225B13C:
	ldrh r0, [r4]
	cmp r0, #0
	beq _0225B146
	sub r0, r0, #1
	strh r0, [r4]
_0225B146:
	ldrh r0, [r4]
	cmp r0, #0
	bne _0225B204
	mov r0, #0xe
	strb r0, [r4, #4]
	b _0225B204
_0225B152:
	ldrb r0, [r4, #0x16]
	cmp r0, #0
	beq _0225B15C
	bl ov00_021E6A4C
_0225B15C:
	mov r0, #0x82
	bl sub_02037AC0
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B16A:
	mov r0, #0x82
	bl sub_02037B38
	cmp r0, #0
	beq _0225B204
	ldrb r0, [r4, #0x17]
	cmp r0, #0
	beq _0225B180
	mov r0, #0x12
	strb r0, [r4, #4]
	b _0225B204
_0225B180:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B188:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #0
	ldrh r0, [r4, #2]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #8]
	mov r0, #3
	bl BeginNormalPaletteFade
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B1A8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225B204
	mov r0, #0x14
	strb r0, [r4, #4]
	b _0225B204
_0225B1B6:
	add r0, r4, #0
	bl ov90_0225B9A8
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
	.balign 4, 0
_0225B1C4: .word 0x0000FFFF
_0225B1C8:
	ldrh r0, [r4, #2]
	add r2, r4, #0
	add r1, #0x68
	str r0, [sp]
	mov r0, #0x7a
	lsl r0, r0, #2
	ldrb r3, [r4, #7]
	add r0, r4, r0
	add r2, #0x58
	bl ov90_0225B38C
	cmp r0, #0
	beq _0225B204
	mov r0, #0x7a
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225B538
	strb r0, [r4, #8]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0225B204
_0225B1F6:
	mov r0, #0xcf
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225A108
	mov r0, #1
	strb r0, [r4, #6]
_0225B204:
	add r0, r4, #0
	bl ov90_0225B2A8
	add r0, r4, #0
	add r0, #0xa0
	bl ov90_02259170
	ldr r0, [r4, #0x4c]
	mov r1, #3
	mov r2, #4
	mov r3, #2
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x4c]
	mov r1, #5
	mov r2, #4
	mov r3, #2
	bl ScheduleSetBgPosText
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_0225AE4C

	thumb_func_start ov90_0225B230
ov90_0225B230: ; 0x0225B230
	push {r4, lr}
	add r4, r1, #0
	bl GF_RunVramTransferTasks
	add r0, r4, #0
	add r0, #0x4c
	bl ov90_022590C0
	add r0, r4, #0
	add r0, #0xa0
	bl ov90_0225917C
	mov r0, #0xcf
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov90_0225A198
	pop {r4, pc}
	thumb_func_end ov90_0225B230

	thumb_func_start ov90_0225B254
ov90_0225B254: ; 0x0225B254
	push {r4, lr}
	add r3, r2, #0
	add r4, r0, #0
	ldr r2, _0225B26C ; =0x00000658
	add r0, r1, #0
	mov r1, #5
	add r2, r4, r2
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, _0225B270 ; =0x00000654
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_0225B26C: .word 0x00000658
_0225B270: .word 0x00000654
	thumb_func_end ov90_0225B254

	thumb_func_start ov90_0225B274
ov90_0225B274: ; 0x0225B274
	push {r3, lr}
	ldr r1, _0225B2A4 ; =0x0000065E
	mov r2, #1
	strh r2, [r0, r1]
	ldrb r3, [r0, #0x14]
	mov r2, #0
	cmp r3, #0
	ble _0225B2A0
_0225B284:
	add r1, r0, r2
	add r1, #0x2c
	ldrb r1, [r1]
	cmp r1, #0
	bne _0225B29A
	ldrb r1, [r0, #0x15]
	cmp r1, r2
	bne _0225B29A
	bl ov90_0225B954
	pop {r3, pc}
_0225B29A:
	add r2, r2, #1
	cmp r2, r3
	blt _0225B284
_0225B2A0:
	pop {r3, pc}
	nop
_0225B2A4: .word 0x0000065E
	thumb_func_end ov90_0225B274

	thumb_func_start ov90_0225B2A8
ov90_0225B2A8: ; 0x0225B2A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0225B320 ; =0x0000065E
	ldrh r1, [r5, r0]
	cmp r1, #0
	beq _0225B31E
	sub r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0225B2C0
	cmp r0, #8
	bne _0225B30A
_0225B2C0:
	ldrb r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	ble _0225B30A
	ldr r4, _0225B324 ; =ov90_0225C1EC
	ldr r7, _0225B328 ; =0x0000065C
_0225B2CC:
	add r0, r5, r6
	add r0, #0x2c
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225B300
	ldr r0, _0225B32C ; =0x00000658
	ldrb r3, [r4]
	ldr r0, [r5, r0]
	ldr r2, [r0, #0xc]
	ldrh r0, [r5, r7]
	lsl r1, r3, #5
	cmp r0, #0
	bne _0225B2EA
	add r0, r3, #3
	b _0225B2EC
_0225B2EA:
	add r0, r3, #7
_0225B2EC:
	lsl r0, r0, #5
	add r2, r2, r0
	mov r0, #0xf
	mov r3, #0x20
	bl GF_CreateNewVramTransferTask
	cmp r0, #0
	bne _0225B300
	bl GF_AssertFail
_0225B300:
	ldrb r0, [r5, #0x14]
	add r6, r6, #1
	add r4, r4, #1
	cmp r6, r0
	blt _0225B2CC
_0225B30A:
	ldr r3, _0225B328 ; =0x0000065C
	ldrh r0, [r5, r3]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1c
	sub r1, r1, r2
	mov r0, #0x1c
	ror r1, r0
	add r0, r2, r1
	strh r0, [r5, r3]
_0225B31E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B320: .word 0x0000065E
_0225B324: .word ov90_0225C1EC
_0225B328: .word 0x0000065C
_0225B32C: .word 0x00000658
	thumb_func_end ov90_0225B2A8

	thumb_func_start ov90_0225B330
ov90_0225B330: ; 0x0225B330
	ldr r1, _0225B338 ; =0x00000654
	ldr r3, _0225B33C ; =FreeToHeap
	ldr r0, [r0, r1]
	bx r3
	.balign 4, 0
_0225B338: .word 0x00000654
_0225B33C: .word FreeToHeap
	thumb_func_end ov90_0225B330

	thumb_func_start ov90_0225B340
ov90_0225B340: ; 0x0225B340
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #0
	mov r2, #0x20
	add r5, r0, #0
	add r7, r3, #0
	bl memset
	ldr r0, [r4]
	str r0, [r5, #8]
	mov r0, #4
	str r0, [r5, #0xc]
	mov r0, #0x8b
	str r0, [r5, #0x10]
	mov r0, #2
	str r0, [r5, #0x14]
	mov r0, #0x18
	strb r0, [r5, #0x18]
	mov r0, #8
	strb r0, [r5, #0x19]
	mov r0, #0
	strb r0, [r5, #0x1b]
	add r0, r7, #0
	bl sub_0201660C
	str r0, [r5, #4]
	strb r6, [r5, #1]
	mov r0, #1
	strb r0, [r5, #0x1d]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov90_0225B340

	thumb_func_start ov90_0225B380
ov90_0225B380: ; 0x0225B380
	ldr r3, _0225B388 ; =sub_02016624
	ldr r0, [r0, #4]
	bx r3
	nop
_0225B388: .word sub_02016624
	thumb_func_end ov90_0225B380

	thumb_func_start ov90_0225B38C
ov90_0225B38C: ; 0x0225B38C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldrb r0, [r4]
	add r5, r1, #0
	add r6, r2, #0
	cmp r0, #0xc
	bhi _0225B42C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0225B3A8: ; jump table
	.short _0225B3C2 - _0225B3A8 - 2 ; case 0
	.short _0225B3F4 - _0225B3A8 - 2 ; case 1
	.short _0225B404 - _0225B3A8 - 2 ; case 2
	.short _0225B420 - _0225B3A8 - 2 ; case 3
	.short _0225B436 - _0225B3A8 - 2 ; case 4
	.short _0225B448 - _0225B3A8 - 2 ; case 5
	.short _0225B494 - _0225B3A8 - 2 ; case 6
	.short _0225B4AC - _0225B3A8 - 2 ; case 7
	.short _0225B4C0 - _0225B3A8 - 2 ; case 8
	.short _0225B4D8 - _0225B3A8 - 2 ; case 9
	.short _0225B4EC - _0225B3A8 - 2 ; case 10
	.short _0225B50C - _0225B3A8 - 2 ; case 11
	.short _0225B52A - _0225B3A8 - 2 ; case 12
_0225B3C2:
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	mov r2, #1
	ldr r5, [sp, #0x20]
	str r2, [sp, #4]
	add r1, r0, #0
	add r3, r0, #0
	str r5, [sp, #8]
	bl BeginNormalPaletteFade
	ldr r1, [sp, #0x20]
	mov r0, #0
	bl sub_0203A948
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0225B3EC
	add r0, r5, #0
	bl ov00_021E69A8
_0225B3EC:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B3F4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225B42C
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B404:
	add r0, r6, #0
	add r1, r3, #0
	bl ov90_0225927C
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #3
	mov r3, #1
	bl ov90_02259464
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B420:
	add r0, r5, #0
	mov r1, #1
	bl ov90_02259538
	cmp r0, #1
	beq _0225B42E
_0225B42C:
	b _0225B530
_0225B42E:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B436:
	add r1, r4, #0
	ldr r0, [r4, #4]
	add r1, #8
	bl sub_020166FC
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B448:
	ldr r0, [r4, #4]
	bl sub_020168F4
	sub r1, r0, #1
	cmp r1, #1
	bhi _0225B530
	cmp r0, #1
	bne _0225B464
	mov r1, #0
	mov r0, #0x16
	add r2, r1, #0
	bl sub_02037030
	b _0225B472
_0225B464:
	cmp r0, #2
	bne _0225B472
	mov r1, #0
	mov r0, #0x17
	add r2, r1, #0
	bl sub_02037030
_0225B472:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0xf
	mov r3, #1
	bl ov90_02259464
	add r0, r5, #0
	mov r1, #1
	bl ov90_02259554
	ldr r0, [r4, #4]
	bl sub_020169CC
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B494:
	ldrb r1, [r4, #0x1e]
	cmp r1, #0
	beq _0225B530
	ldrb r1, [r4, #0x1f]
	cmp r1, #0
	beq _0225B4A6
	mov r0, #0xa
	strb r0, [r4]
	b _0225B530
_0225B4A6:
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B4AC:
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #6
	mov r3, #1
	bl ov90_02259464
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B4C0:
	add r0, r5, #0
	mov r1, #1
	bl ov90_02259538
	cmp r0, #1
	bne _0225B530
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0x66
	strh r0, [r4, #2]
	b _0225B530
_0225B4D8:
	ldrh r0, [r4, #2]
	sub r0, r0, #1
	strh r0, [r4, #2]
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _0225B530
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B4EC:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	mov r1, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	add r2, r1, #0
	str r0, [sp, #8]
	mov r0, #4
	add r3, r1, #0
	bl BeginNormalPaletteFade
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B50C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225B530
	bl sub_0203A914
	ldrb r0, [r4, #1]
	cmp r0, #0
	beq _0225B522
	bl ov00_021E6A4C
_0225B522:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0225B530
_0225B52A:
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_0225B530:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov90_0225B38C

	thumb_func_start ov90_0225B538
ov90_0225B538: ; 0x0225B538
	ldrb r0, [r0, #0x1f]
	bx lr
	thumb_func_end ov90_0225B538

	thumb_func_start ov90_0225B53C
ov90_0225B53C: ; 0x0225B53C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, r3, #0
	mov r3, #1
	lsl r3, r1
	ldrb r1, [r4, #0x1c]
	tst r1, r3
	bne _0225B55A
	cmp r2, #0
	bne _0225B554
	mov r1, #0
	strb r1, [r4, #0x1d]
_0225B554:
	ldrb r1, [r4, #0x1c]
	orr r1, r3
	strb r1, [r4, #0x1c]
_0225B55A:
	ldrb r3, [r4, #0x1c]
	mov r2, #0
	add r1, r2, #0
	mov r5, #1
_0225B562:
	add r6, r5, #0
	lsl r6, r1
	tst r6, r3
	beq _0225B56C
	add r2, r2, #1
_0225B56C:
	add r1, r1, #1
	cmp r1, #4
	blt _0225B562
	cmp r2, r0
	bne _0225B592
	ldrb r0, [r4, #0x1d]
	cmp r0, #0
	beq _0225B588
	mov r1, #0
	mov r0, #0x18
	add r2, r1, #0
	bl sub_02037030
	pop {r4, r5, r6, pc}
_0225B588:
	mov r1, #0
	mov r0, #0x19
	add r2, r1, #0
	bl sub_02037030
_0225B592:
	pop {r4, r5, r6, pc}
	thumb_func_end ov90_0225B53C

	thumb_func_start ov90_0225B594
ov90_0225B594: ; 0x0225B594
	mov r2, #1
	strb r2, [r0, #0x1e]
	strb r1, [r0, #0x1f]
	bx lr
	thumb_func_end ov90_0225B594

	thumb_func_start ov90_0225B59C
ov90_0225B59C: ; 0x0225B59C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r1, #0
	ldr r1, [sp, #0x44]
	str r2, [sp, #0x14]
	str r1, [sp, #0x44]
	mov r1, #0
	mov r2, #0x4c
	add r7, r0, #0
	add r6, r3, #0
	ldr r4, [sp, #0x40]
	bl memset
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x44]
	mov r3, #7
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	lsl r3, r3, #6
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x8b
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	mov r1, #0x19
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	ldr r0, [sp, #0x44]
	mov r1, #0x1a
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r3, r7, #4
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	str r0, [r7]
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	mov r0, #0x12
	str r0, [sp, #8]
	ldr r0, _0225B68C ; =0x00001389
	add r1, r4, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	mov r2, #0xf
	str r0, [sp, #0x10]
	add r0, r6, #0
	mov r3, #1
	bl ov90_02258E54
	str r0, [r7, #0x44]
	mov r0, #0x28
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
_0225B624:
	ldr r0, [sp, #0x20]
	mov r4, #0x4a
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mov r6, #0
	str r0, [sp, #0x24]
_0225B630:
	ldr r0, [sp, #0x1c]
	lsl r2, r4, #0x10
	add r0, r6, r0
	lsl r0, r0, #2
	add r5, r7, r0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [r7, #0x44]
	ldr r1, [r1]
	ldr r3, [sp, #0x24]
	asr r2, r2, #0x10
	bl ov90_02258EB4
	str r0, [r5, #8]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x18]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_02024A04
	add r6, r6, #1
	add r4, #0x18
	cmp r6, #5
	blt _0225B630
	ldr r0, [sp, #0x20]
	add r0, #0x24
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	add r0, r0, #5
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #3
	blt _0225B624
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B68C: .word 0x00001389
	thumb_func_end ov90_0225B59C

	thumb_func_start ov90_0225B690
ov90_0225B690: ; 0x0225B690
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0225B698:
	ldr r0, [r5, #8]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xf
	blt _0225B698
	ldr r0, [r6]
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov90_0225B690

	thumb_func_start ov90_0225B6B0
ov90_0225B6B0: ; 0x0225B6B0
	add r2, r0, #0
	add r2, #0x4b
	strb r1, [r2]
	add r1, r0, #0
	mov r2, #0
	add r1, #0x48
	strb r2, [r1]
	add r0, #0x4a
	strb r2, [r0]
	bx lr
	thumb_func_end ov90_0225B6B0

	thumb_func_start ov90_0225B6C4
ov90_0225B6C4: ; 0x0225B6C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, #0x48
	ldrb r0, [r0]
	add r5, r1, #0
	cmp r0, #3
	bls _0225B6D6
	b _0225B7F2
_0225B6D6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225B6E2: ; jump table
	.short _0225B6EA - _0225B6E2 - 2 ; case 0
	.short _0225B738 - _0225B6E2 - 2 ; case 1
	.short _0225B784 - _0225B6E2 - 2 ; case 2
	.short _0225B7EC - _0225B6E2 - 2 ; case 3
_0225B6EA:
	ldr r0, [r4, #4]
	mov r1, #0x8b
	bl ov90_02258DB0
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x14
	str r0, [sp, #8]
	ldr r2, [r4, #4]
	ldr r0, [r5]
	mov r1, #2
	add r2, #0xc
	bl LoadRectToBgTilemapRect
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0xe
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5]
	mov r1, #2
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	add r0, #0x48
	ldrb r0, [r0]
	add r4, #0x48
	add r0, r0, #1
	strb r0, [r4]
	b _0225B7F2
_0225B738:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x4b
	ldrb r0, [r0]
	cmp r1, r0
	bne _0225B750
	mov r0, #3
	add r4, #0x48
	strb r0, [r4]
	b _0225B7F2
_0225B750:
	ldr r0, _0225B7F8 ; =0x00000594
	bl PlaySE
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	mov r1, #0xf
	bl _s32_div_f
	lsl r0, r1, #2
	add r0, r4, r0
	ldr r0, [r0, #8]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	add r0, r4, #0
	mov r1, #8
	add r0, #0x49
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x48
	ldrb r0, [r0]
	add r4, #0x48
	add r0, r0, #1
	strb r0, [r4]
	b _0225B7F2
_0225B784:
	add r0, r4, #0
	add r0, #0x49
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x49
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x49
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225B7F2
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x4a
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x4a
	ldrb r5, [r0]
	mov r1, #0xf
	add r0, r5, #0
	bl _s32_div_f
	cmp r1, #0
	bne _0225B7E4
	add r0, r4, #0
	add r0, #0x4b
	ldrb r0, [r0]
	cmp r5, r0
	beq _0225B7E4
	mov r6, #0
	add r5, r4, #0
	add r7, r6, #0
_0225B7CC:
	ldr r0, [r5, #8]
	add r1, r7, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #8]
	mov r1, #2
	bl Set2dSpriteAnimSeqNo
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #0xf
	blt _0225B7CC
_0225B7E4:
	mov r0, #1
	add r4, #0x48
	strb r0, [r4]
	b _0225B7F2
_0225B7EC:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0225B7F2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225B7F8: .word 0x00000594
	thumb_func_end ov90_0225B6C4

	thumb_func_start ov90_0225B7FC
ov90_0225B7FC: ; 0x0225B7FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r1, #0
	add r5, r0, #0
	mov r0, #0x38
	add r4, r6, #0
	mul r4, r0
	add r0, r5, #0
	add r0, #0x4c
	str r0, [sp]
	str r6, [sp, #4]
	ldrb r0, [r5, #0x15]
	mov r3, #0x97
	lsl r3, r3, #2
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xa0
	str r0, [sp, #0xc]
	add r0, r3, #0
	sub r0, #0x78
	ldr r0, [r5, r0]
	add r7, r5, r3
	str r0, [sp, #0x10]
	ldrh r0, [r5, #2]
	str r2, [sp, #0x18]
	sub r3, r3, #4
	str r0, [sp, #0x14]
	ldrb r1, [r5, #0x14]
	ldrb r2, [r5, #7]
	ldr r3, [r5, r3]
	add r0, r7, r4
	bl ov90_02259BCC
	add r0, r5, #0
	add r0, #0xc
	add r1, r6, #0
	bl ov90_0225888C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0xc
	bl ov90_022588A4
	lsl r1, r6, #2
	str r1, [sp, #0x1c]
	mov r1, #0
	str r1, [sp]
	ldr r2, [sp, #0x1c]
	str r0, [sp, #4]
	add r2, r5, r2
	add r1, r5, #0
	ldr r2, [r2, #0x3c]
	add r0, r7, r4
	add r1, #0x58
	mov r3, #8
	bl ov90_02259D50
	add r0, r5, r6
	add r0, #0x38
	ldrb r0, [r0]
	add r3, r5, r6
	add r1, r5, #0
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r3, #0x34
	ldrb r2, [r5, #5]
	ldrb r3, [r3]
	add r0, r7, r4
	add r1, #0x58
	bl ov90_02259DAC
	ldrb r0, [r5, #7]
	cmp r0, #0
	bne _0225B896
	mov r1, #5
	b _0225B898
_0225B896:
	mov r1, #6
_0225B898:
	ldr r3, [sp, #0x18]
	mov r0, #0
	add r6, r3, #1
	mov r3, #4
	sub r3, r3, r6
	lsl r6, r3, #1
	ldr r3, _0225B8EC ; =ov90_0225C1F0
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	ldrsh r6, [r3, r6]
	mov r3, #0xb0
	str r1, [sp, #4]
	add r2, r5, r2
	sub r3, r3, r6
	add r1, r5, #0
	lsl r3, r3, #0x10
	ldr r2, [r2, #0x1c]
	add r0, r7, r4
	add r1, #0x58
	asr r3, r3, #0x10
	bl ov90_02259E38
	add r5, #0x4c
	add r0, r7, r4
	add r1, r5, #0
	bl ov90_02259E8C
	ldr r1, [sp, #0x18]
	add r0, r7, r4
	bl ov90_02259E18
	ldr r1, [sp, #0x18]
	add r0, r7, r4
	lsl r2, r1, #1
	ldr r1, _0225B8EC ; =ov90_0225C1F0
	ldrsh r1, [r1, r2]
	mov r2, #0
	bl ov90_02259EE0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225B8EC: .word ov90_0225C1F0
	thumb_func_end ov90_0225B7FC

	thumb_func_start ov90_0225B8F0
ov90_0225B8F0: ; 0x0225B8F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r0, [r7, #0x14]
	cmp r0, #0
	ble _0225B94E
	mov r0, #0x97
	lsl r0, r0, #2
	add r6, r7, r0
	add r4, r7, #0
	add r5, r6, #0
_0225B90E:
	mov r0, #0x9b
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0225B938
	add r0, r6, #0
	bl ov90_02259F7C
	str r0, [sp, #8]
	mov r0, #0xcf
	lsl r0, r0, #2
	add r0, r7, r0
	add r1, r5, #0
	bl ov90_0225A134
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0225B93C
	mov r0, #0
	str r0, [sp]
	b _0225B93C
_0225B938:
	mov r0, #0
	str r0, [sp]
_0225B93C:
	ldr r0, [sp, #4]
	ldrb r1, [r7, #0x14]
	add r0, r0, #1
	add r4, #0x38
	add r6, #0x38
	add r5, #0x38
	str r0, [sp, #4]
	cmp r0, r1
	blt _0225B90E
_0225B94E:
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov90_0225B8F0

	thumb_func_start ov90_0225B954
ov90_0225B954: ; 0x0225B954
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225B970
	ldr r0, _0225B974 ; =0x000004BF
	bl PlayFanfare
	mov r0, #0x66
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
_0225B970:
	pop {r4, pc}
	nop
_0225B974: .word 0x000004BF
	thumb_func_end ov90_0225B954

	thumb_func_start ov90_0225B978
ov90_0225B978: ; 0x0225B978
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0225B996
	bl IsFanfarePlaying
	cmp r0, #0
	bne _0225B996
	mov r0, #0x66
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
_0225B996:
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _0225B9A4
	mov r0, #1
	pop {r4, pc}
_0225B9A4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov90_0225B978

	thumb_func_start ov90_0225B9A8
ov90_0225B9A8: ; 0x0225B9A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0202C6F4
	add r4, r0, #0
	ldrb r0, [r5, #0x14]
	mov r6, #0
	cmp r0, #0
	ble _0225BA12
	add r7, sp, #0
_0225B9BE:
	add r0, r5, r6
	ldrb r0, [r0, #0x10]
	bl sub_0203484C
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	add r2, r7, #0
	bl sub_0203A084
	cmp r0, #0
	beq _0225B9D8
	cmp r0, #1
	bne _0225BA0A
_0225B9D8:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _0225B9E8
	cmp r0, #1
	beq _0225B9F4
	cmp r0, #2
	beq _0225BA00
	b _0225BA0A
_0225B9E8:
	ldr r1, [sp]
	add r0, r4, #0
	mov r2, #1
	bl sub_0202C554
	b _0225BA0A
_0225B9F4:
	ldr r1, [sp]
	add r0, r4, #0
	mov r2, #1
	bl sub_0202C584
	b _0225BA0A
_0225BA00:
	ldr r1, [sp]
	add r0, r4, #0
	mov r2, #1
	bl sub_0202C5B4
_0225BA0A:
	ldrb r0, [r5, #0x14]
	add r6, r6, #1
	cmp r6, r0
	blt _0225B9BE
_0225BA12:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov90_0225B9A8

	thumb_func_start ov90_0225BA14
ov90_0225BA14: ; 0x0225BA14
	push {r3, lr}
	ldrb r1, [r0, #7]
	cmp r1, #0
	beq _0225BA26
	cmp r1, #1
	beq _0225BA2A
	cmp r1, #2
	beq _0225BA2E
	pop {r3, pc}
_0225BA26:
	mov r0, #0
	pop {r3, pc}
_0225BA2A:
	mov r0, #0
	pop {r3, pc}
_0225BA2E:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov90_0225BA14

	thumb_func_start ov90_0225BA38
ov90_0225BA38: ; 0x0225BA38
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r1, sp, #0xc
	mov r4, #0
	str r4, [r1]
	str r4, [r1, #4]
	str r4, [r1, #8]
	add r5, r0, #0
	str r4, [r1, #0xc]
	bl ov90_0225BA14
	ldrb r2, [r5, #0x14]
	add r1, r4, #0
	cmp r2, #0
	ble _0225BA7E
	add r2, r5, #0
	add r3, sp, #0xc
_0225BA5A:
	add r6, r5, r1
	add r6, #0x2c
	ldrb r6, [r6]
	cmp r6, #0
	bne _0225BA74
	ldr r6, [r2, #0x1c]
	cmp r0, r6
	beq _0225BA74
	ldr r6, [r5, #0x18]
	add r4, r4, #1
	add r6, r6, r1
	ldrb r6, [r6, #4]
	stmia r3!, {r6}
_0225BA74:
	ldrb r6, [r5, #0x14]
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, r6
	blt _0225BA5A
_0225BA7E:
	cmp r4, #0
	beq _0225BA9C
	ldr r0, [sp, #0x10]
	add r2, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	ldrb r1, [r5, #7]
	ldr r0, [r0, #0x30]
	ldr r3, [sp, #0xc]
	bl ov45_0222ACB8
_0225BA9C:
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov90_0225BA38

	thumb_func_start ov90_0225BAA0
ov90_0225BAA0: ; 0x0225BAA0
	push {lr}
	sub sp, #0xc
	add r1, r0, #0
	ldrb r2, [r1, #0x14]
	cmp r2, #0
	beq _0225BACA
	ldr r0, [r1, #0x30]
	cmp r0, #0xa
	blo _0225BACA
	ldr r3, [r1, #0x18]
	ldrb r0, [r3, #5]
	str r0, [sp]
	ldrb r0, [r3, #6]
	str r0, [sp, #4]
	ldrb r0, [r3, #7]
	str r0, [sp, #8]
	ldr r0, [r3, #0x30]
	ldrb r1, [r1, #7]
	ldrb r3, [r3, #4]
	bl ov45_0222ACB8
_0225BACA:
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov90_0225BAA0

	thumb_func_start ov90_0225BAD0
ov90_0225BAD0: ; 0x0225BAD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	add r0, #0xc
	mov r1, #0
	mov r2, #0xc0
	str r3, [sp, #0x10]
	bl memset
	add r0, r7, #0
	add r0, #0xcc
	mov r1, #0
	mov r2, #0xc0
	bl memset
	mov r6, #0
	strh r6, [r7, #8]
	mov r0, #0x63
	strh r6, [r7, #0xa]
	lsl r0, r0, #2
	ldr r4, _0225BBC4 ; =ov90_0225C2B4
	str r6, [r7, r0]
	add r5, r7, #0
_0225BB02:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	str r0, [sp, #4]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	lsl r2, r2, #4
	lsl r3, r3, #4
	ldr r0, [sp, #8]
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov90_02258EB4
	str r0, [r5]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r5]
	mov r1, #0
	bl sub_02024A04
	add r6, r6, #1
	add r4, #0xc
	add r5, r5, #4
	cmp r6, #2
	blt _0225BB02
	mov r3, #1
	lsl r3, r3, #0x1a
	ldr r1, [r3]
	mov r0, #0xe
	lsl r0, r0, #0xc
	and r1, r0
	ldr r4, [r3]
	ldr r2, _0225BBC8 ; =0xFFFF1FFF
	lsr r1, r1, #0xd
	and r4, r2
	mov r2, #1
	bic r1, r2
	lsl r1, r1, #0xd
	orr r1, r4
	add r2, r3, #0
	str r1, [r3]
	add r2, #0x48
	ldrh r4, [r2]
	mov r1, #0x3f
	bic r4, r1
	mov r1, #0x1f
	orr r4, r1
	mov r1, #0x20
	orr r4, r1
	strh r4, [r2]
	add r2, r3, #0
	mov r4, #0
	add r2, #0x40
	strh r4, [r2]
	add r2, r3, #0
	add r2, #0x44
	strh r4, [r2]
	add r2, r3, #0
	add r2, #0x4a
	ldrb r4, [r2]
	mov r2, #0x19
	lsl r2, r2, #4
	strb r4, [r7, r2]
	ldr r3, [r3]
	and r0, r3
	lsr r3, r0, #0xd
	mov r0, #2
	and r3, r0
	add r0, r2, #4
	str r3, [r7, r0]
	add r0, r2, #1
	ldrb r3, [r7, r0]
	mov r0, #0x1f
	bic r3, r0
	mov r0, #0xf
	orr r3, r0
	add r0, r2, #1
	strb r3, [r7, r0]
	ldrb r0, [r7, r0]
	orr r1, r0
	add r0, r2, #1
	strb r1, [r7, r0]
	ldr r0, _0225BBCC ; =ov90_0225BE08
	add r1, r7, #0
	bl Main_SetHBlankIntrCB
	ldr r0, [r7, #4]
	mov r1, #2
	bl sub_02024890
	add r0, r7, #0
	bl ov90_0225BD84
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0225BBC4: .word ov90_0225C2B4
_0225BBC8: .word 0xFFFF1FFF
_0225BBCC: .word ov90_0225BE08
	thumb_func_end ov90_0225BAD0

	thumb_func_start ov90_0225BBD0
ov90_0225BBD0: ; 0x0225BBD0
	push {r4, lr}
	mov r1, #8
	ldrsh r2, [r0, r1]
	mov r4, #0
	add r2, r2, #1
	strh r2, [r0, #8]
	ldrsh r2, [r0, r1]
	cmp r2, #8
	blt _0225BBE6
	strh r1, [r0, #8]
	mov r4, #1
_0225BBE6:
	mov r1, #1
	bl ov90_0225BC28
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov90_0225BBD0

	thumb_func_start ov90_0225BBF0
ov90_0225BBF0: ; 0x0225BBF0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #8
	ldrsh r2, [r5, r0]
	mov r1, #0
	add r4, r1, #0
	sub r2, r2, #1
	strh r2, [r5, #8]
	ldrsh r0, [r5, r0]
	cmp r0, #0
	bgt _0225BC18
	mov r4, #1
	strh r4, [r5, #8]
	ldr r0, [r5]
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #4]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0225BC18:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	bl ov90_0225BC28
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov90_0225BBF0

	thumb_func_start ov90_0225BC28
ov90_0225BC28: ; 0x0225BC28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	ldr r2, [sp]
	mov r0, #8
	ldrsh r2, [r2, r0]
	mov r3, #0x17
	add r4, r2, #0
	mul r4, r3
	asr r2, r4, #2
	lsr r2, r2, #0x1d
	add r2, r4, r2
	asr r4, r2, #3
	ldr r2, [sp]
	strh r4, [r2, #0xa]
	ldrsh r0, [r2, r0]
	add r0, r0, r1
	cmp r0, #8
	bgt _0225BC62
	cmp r0, #0
	blt _0225BC62
	add r1, r0, #0
	mul r1, r3
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	str r0, [sp, #4]
	b _0225BC6A
_0225BC62:
	ldr r0, [sp]
	mov r1, #0xa
	ldrsh r0, [r0, r1]
	str r0, [sp, #4]
_0225BC6A:
	ldr r0, [sp, #4]
	ldr r7, _0225BD04 ; =ov90_0225C2B4
	ldr r4, [sp]
	mov r6, #0
	lsl r5, r0, #0xc
_0225BC74:
	add r3, r7, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #8
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	cmp r6, #0
	str r0, [r2]
	bne _0225BCB6
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0225BC9C
	add r0, r5, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225BCAA
_0225BC9C:
	add r0, r5, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225BCAA:
	bl _ffix
	ldr r1, [sp, #0xc]
	sub r0, r1, r0
	str r0, [sp, #0xc]
	b _0225BCE6
_0225BCB6:
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _0225BCCE
	add r0, r5, #0
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0225BCDC
_0225BCCE:
	add r0, r5, #0
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0225BCDC:
	bl _ffix
	ldr r1, [sp, #0xc]
	add r0, r1, r0
	str r0, [sp, #0xc]
_0225BCE6:
	ldr r0, [r4]
	add r1, sp, #8
	bl sub_020247D4
	add r6, r6, #1
	add r7, #0xc
	add r4, r4, #4
	cmp r6, #2
	blt _0225BC74
	ldr r0, [sp]
	bl ov90_0225BD84
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0225BD04: .word ov90_0225C2B4
	thumb_func_end ov90_0225BC28

	thumb_func_start ov90_0225BD08
ov90_0225BD08: ; 0x0225BD08
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	cmp r0, #0
	beq _0225BD22
	bl DestroySysTask
	mov r0, #0x63
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r6, r0]
_0225BD22:
	mov r4, #0
	add r5, r6, #0
	add r7, r4, #0
_0225BD28:
	ldr r0, [r5]
	cmp r0, #0
	beq _0225BD34
	bl sub_02024758
	str r7, [r5]
_0225BD34:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0225BD28
	bl HBlankInterruptDisable
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0225BD7C ; =0xFFFF1FFF
	add r3, r1, #0
	and r3, r0
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r1, [r6, r0]
	sub r0, r0, #4
	lsl r1, r1, #0xd
	orr r1, r3
	str r1, [r2]
	add r2, #0x4a
	ldrh r2, [r2]
	mov r1, #0x3f
	ldrb r0, [r6, r0]
	bic r2, r1
	lsl r1, r0, #0x1b
	lsr r1, r1, #0x1b
	lsl r0, r0, #0x1a
	orr r1, r2
	lsr r0, r0, #0x1f
	beq _0225BD74
	mov r0, #0x20
	orr r1, r0
_0225BD74:
	ldr r0, _0225BD80 ; =0x0400004A
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225BD7C: .word 0xFFFF1FFF
_0225BD80: .word 0x0400004A
	thumb_func_end ov90_0225BD08

	thumb_func_start ov90_0225BD84
ov90_0225BD84: ; 0x0225BD84
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0xcc
	mov r1, #0
	mov r2, #0xc0
	bl memset
	mov r0, #0xa
	ldrsh r2, [r4, r0]
	mov r0, #0x17
	mov r1, #0
	sub r0, r0, r2
	cmp r0, #0
	ble _0225BDC0
	ldr r7, _0225BDDC ; =0x00000115
	mov r0, #1
	mov r2, #0x79
	mov r5, #0xa
	mov r6, #0x17
_0225BDAA:
	add r3, r4, r1
	strb r0, [r3, r7]
	sub r3, r2, r1
	add r3, r4, r3
	add r3, #0xcc
	strb r0, [r3]
	ldrsh r3, [r4, r5]
	add r1, r1, #1
	sub r3, r6, r3
	cmp r1, r3
	blt _0225BDAA
_0225BDC0:
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0225BDDA
	ldr r0, _0225BDE0 ; =ov90_0225BDE4
	add r1, r4, #0
	mov r2, #0
	bl sub_0200E374
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r4, r1]
_0225BDDA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225BDDC: .word 0x00000115
_0225BDE0: .word ov90_0225BDE4
	thumb_func_end ov90_0225BD84

	thumb_func_start ov90_0225BDE4
ov90_0225BDE4: ; 0x0225BDE4
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0xc
	add r1, #0xcc
	mov r2, #0xc0
	bl memcpy
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl DestroySysTask
	mov r0, #0x63
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov90_0225BDE4

	thumb_func_start ov90_0225BE08
ov90_0225BE08: ; 0x0225BE08
	push {r4, r5}
	ldr r1, _0225BED0 ; =0x04000006
	ldrh r2, [r1]
	add r2, r2, #1
	lsr r4, r2, #0x1f
	lsl r3, r2, #0x18
	sub r3, r3, r4
	mov r2, #0x18
	ror r3, r2
	add r2, r4, r3
	cmp r2, #0xc0
	bge _0225BECA
	sub r3, r1, #6
	ldr r4, [r3]
	mov r3, #0xe
	lsl r3, r3, #0xc
	and r3, r4
	sub r4, r1, #2
	ldrh r5, [r4]
	mov r4, #2
	lsr r3, r3, #0xd
	tst r4, r5
	beq _0225BECA
	cmp r2, #0x49
	blt _0225BE3E
	cmp r2, #0x79
	ble _0225BE6A
_0225BE3E:
	ldr r1, _0225BED4 ; =0x0400004A
	mov r4, #0x3f
	ldrh r1, [r1]
	bic r1, r4
	mov r4, #0x19
	lsl r4, r4, #4
	ldrb r4, [r0, r4]
	lsl r5, r4, #0x1b
	lsr r5, r5, #0x1b
	lsl r4, r4, #0x1a
	orr r1, r5
	lsr r4, r4, #0x1f
	beq _0225BE5C
	mov r4, #0x20
	orr r1, r4
_0225BE5C:
	ldr r4, _0225BED4 ; =0x0400004A
	strh r1, [r4]
	mov r1, #0x65
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	orr r3, r1
	b _0225BE98
_0225BE6A:
	add r1, #0x44
	ldrh r1, [r1]
	mov r4, #0x3f
	bic r1, r4
	ldr r4, _0225BED8 ; =0x00000191
	ldrb r4, [r0, r4]
	lsl r5, r4, #0x1b
	lsr r5, r5, #0x1b
	lsl r4, r4, #0x1a
	orr r1, r5
	lsr r4, r4, #0x1f
	beq _0225BE86
	mov r4, #0x20
	orr r1, r4
_0225BE86:
	ldr r4, _0225BED4 ; =0x0400004A
	strh r1, [r4]
	mov r1, #0x65
	lsl r1, r1, #2
	ldr r4, [r0, r1]
	mov r1, #2
	orr r1, r4
	mvn r1, r1
	and r3, r1
_0225BE98:
	add r0, r0, r2
	ldrb r0, [r0, #0xc]
	cmp r0, #1
	ldr r0, _0225BEDC ; =0xFFFF1FFF
	bne _0225BEB8
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	and r1, r0
	mov r0, #1
	orr r0, r3
	lsl r0, r0, #0xd
	orr r0, r1
	str r0, [r2]
	pop {r4, r5}
	bx lr
_0225BEB8:
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	and r1, r0
	mov r0, #1
	bic r3, r0
	lsl r0, r3, #0xd
	orr r0, r1
	str r0, [r2]
_0225BECA:
	pop {r4, r5}
	bx lr
	nop
_0225BED0: .word 0x04000006
_0225BED4: .word 0x0400004A
_0225BED8: .word 0x00000191
_0225BEDC: .word 0xFFFF1FFF
	thumb_func_end ov90_0225BE08

	thumb_func_start ov90_0225BEE0
ov90_0225BEE0: ; 0x0225BEE0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	ldrh r0, [r4, #4]
	cmp r0, #5
	bhi _0225BF44
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225BEF8: ; jump table
	.short _0225C05E - _0225BEF8 - 2 ; case 0
	.short _0225BF04 - _0225BEF8 - 2 ; case 1
	.short _0225BF38 - _0225BEF8 - 2 ; case 2
	.short _0225BF54 - _0225BEF8 - 2 ; case 3
	.short _0225C018 - _0225BEF8 - 2 ; case 4
	.short _0225C03A - _0225BEF8 - 2 ; case 5
_0225BF04:
	add r0, r4, #0
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #8]
	ldr r3, [r4]
	add r0, #0x34
	bl ov90_0225BAD0
	mov r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #0x80
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #8]
	mov r3, #0x61
	bl ov90_02258EB4
	str r0, [r4, #0x30]
	mov r1, #0
	bl sub_02024A04
	ldrh r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0225BF38:
	add r0, r4, #0
	add r0, #0x34
	bl ov90_0225BBD0
	cmp r0, #1
	beq _0225BF46
_0225BF44:
	b _0225C05E
_0225BF46:
	ldrh r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	pop {r4, r5, r6, pc}
_0225BF54:
	ldr r0, [r4, #0x30]
	bl sub_020249F8
	add r6, r0, #0
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl sub_020249B0
	ldr r0, [r4, #0x30]
	bl sub_020249F8
	add r5, r0, #0
	cmp r6, r5
	beq _0225BFC8
	cmp r5, #0xf
	bhi _0225BFC8
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225BF82: ; jump table
	.short _0225BFC8 - _0225BF82 - 2 ; case 0
	.short _0225BFC8 - _0225BF82 - 2 ; case 1
	.short _0225BFC8 - _0225BF82 - 2 ; case 2
	.short _0225BFC8 - _0225BF82 - 2 ; case 3
	.short _0225BFC8 - _0225BF82 - 2 ; case 4
	.short _0225BFC8 - _0225BF82 - 2 ; case 5
	.short _0225BFC8 - _0225BF82 - 2 ; case 6
	.short _0225BFA2 - _0225BF82 - 2 ; case 7
	.short _0225BFC8 - _0225BF82 - 2 ; case 8
	.short _0225BFAA - _0225BF82 - 2 ; case 9
	.short _0225BFC8 - _0225BF82 - 2 ; case 10
	.short _0225BFB2 - _0225BF82 - 2 ; case 11
	.short _0225BFC8 - _0225BF82 - 2 ; case 12
	.short _0225BFBA - _0225BF82 - 2 ; case 13
	.short _0225BFC8 - _0225BF82 - 2 ; case 14
	.short _0225BFC2 - _0225BF82 - 2 ; case 15
_0225BFA2:
	ldr r0, _0225C064 ; =0x000005DD
	bl PlaySE
	b _0225BFC8
_0225BFAA:
	ldr r0, _0225C064 ; =0x000005DD
	bl PlaySE
	b _0225BFC8
_0225BFB2:
	ldr r0, _0225C064 ; =0x000005DD
	bl PlaySE
	b _0225BFC8
_0225BFBA:
	ldr r0, _0225C064 ; =0x000005DD
	bl PlaySE
	b _0225BFC8
_0225BFC2:
	ldr r0, _0225C068 ; =0x00000642
	bl PlaySE
_0225BFC8:
	cmp r5, #0xf
	bne _0225BFFC
	mov r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _0225BFDE
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_02024AA8
	b _0225BFEA
_0225BFDE:
	cmp r0, #4
	bne _0225BFEA
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_02024AA8
_0225BFEA:
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #8
	blt _0225BFFC
	mov r0, #0
	strh r0, [r4, #6]
_0225BFFC:
	ldr r0, [r4, #0x30]
	bl sub_02024B68
	cmp r0, #0
	bne _0225C05E
	ldrh r0, [r4, #4]
	mov r1, #0
	add r0, r0, #1
	strh r0, [r4, #4]
	ldr r0, [r4, #0x30]
	bl sub_02024AA8
	add sp, #8
	pop {r4, r5, r6, pc}
_0225C018:
	add r0, r4, #0
	add r0, #0x34
	bl ov90_0225BBF0
	cmp r0, #1
	bne _0225C05E
	ldr r0, [r4, #0x30]
	bl sub_02024758
	mov r1, #0
	str r1, [r4, #0x30]
	ldrh r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	strh r1, [r4, #6]
	pop {r4, r5, r6, pc}
_0225C03A:
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #2
	blt _0225C05E
	mov r0, #0
	strh r0, [r4, #4]
	add r0, r4, #0
	add r0, #0x34
	bl ov90_0225BD08
	ldr r0, [r4, #0x2c]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x2c]
_0225C05E:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0225C064: .word 0x000005DD
_0225C068: .word 0x00000642
	thumb_func_end ov90_0225BEE0

	thumb_func_start ov90_0225C06C
ov90_0225C06C: ; 0x0225C06C
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	ldrh r0, [r4, #4]
	cmp r0, #5
	bhi _0225C14C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225C084: ; jump table
	.short _0225C14C - _0225C084 - 2 ; case 0
	.short _0225C090 - _0225C084 - 2 ; case 1
	.short _0225C0CC - _0225C084 - 2 ; case 2
	.short _0225C0EE - _0225C084 - 2 ; case 3
	.short _0225C106 - _0225C084 - 2 ; case 4
	.short _0225C128 - _0225C084 - 2 ; case 5
_0225C090:
	add r0, r4, #0
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #8]
	ldr r3, [r4]
	add r0, #0x34
	bl ov90_0225BAD0
	mov r0, #0x40
	str r0, [sp]
	ldr r0, [r4]
	mov r2, #0x80
	str r0, [sp, #4]
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #8]
	mov r3, #0x61
	bl ov90_02258EB4
	str r0, [r4, #0x30]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_02024A04
	ldrh r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
_0225C0CC:
	add r0, r4, #0
	add r0, #0x34
	bl ov90_0225BBD0
	cmp r0, #1
	bne _0225C14C
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl Set2dSpriteAnimActiveFlag
	ldrh r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	mov r0, #0
	strh r0, [r4, #6]
	pop {r4, pc}
_0225C0EE:
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #0x32
	blt _0225C14C
	ldrh r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
_0225C106:
	add r0, r4, #0
	add r0, #0x34
	bl ov90_0225BBF0
	cmp r0, #1
	bne _0225C14C
	ldr r0, [r4, #0x30]
	bl sub_02024758
	mov r0, #0
	str r0, [r4, #0x30]
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	pop {r4, pc}
_0225C128:
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #2
	blt _0225C14C
	mov r0, #0
	strh r0, [r4, #4]
	add r0, r4, #0
	add r0, #0x34
	bl ov90_0225BD08
	ldr r0, [r4, #0x2c]
	bl DestroySysTask
	mov r0, #0
	str r0, [r4, #0x2c]
_0225C14C:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov90_0225C06C

	thumb_func_start ov90_0225C150
ov90_0225C150: ; 0x0225C150
	ldr r0, _0225C154 ; =ov90_0225C4FC
	bx lr
	.balign 4, 0
_0225C154: .word ov90_0225C4FC
	thumb_func_end ov90_0225C150

	thumb_func_start ov90_0225C158
ov90_0225C158: ; 0x0225C158
	mov r0, #5
	bx lr
	thumb_func_end ov90_0225C158

	thumb_func_start ov90_0225C15C
ov90_0225C15C: ; 0x0225C15C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov90_0225C150
	add r4, r0, #0
	bl ov90_0225C158
	add r1, r0, #0
	add r0, r4, #0
	add r2, r5, #0
	bl sub_0203410C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov90_0225C15C

	thumb_func_start ov90_0225C178
ov90_0225C178: ; 0x0225C178
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov90_0225C150
	add r4, r0, #0
	bl ov90_0225C158
	add r1, r0, #0
	add r0, r4, #0
	add r2, r5, #0
	bl sub_0203410C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov90_0225C178

	thumb_func_start ov90_0225C194
ov90_0225C194: ; 0x0225C194
	mov r0, #0
	bx lr
	thumb_func_end ov90_0225C194

	thumb_func_start ov90_0225C198
ov90_0225C198: ; 0x0225C198
	mov r0, #4
	bx lr
	thumb_func_end ov90_0225C198

	thumb_func_start ov90_0225C19C
ov90_0225C19C: ; 0x0225C19C
	add r0, r3, #0
	ldr r3, _0225C1A4 ; =ov90_02258B24
	ldr r1, [r2]
	bx r3
	.balign 4, 0
_0225C1A4: .word ov90_02258B24
	thumb_func_end ov90_0225C19C

	thumb_func_start ov90_0225C1A8
ov90_0225C1A8: ; 0x0225C1A8
	add r1, r0, #0
	add r0, r3, #0
	ldr r3, _0225C1B4 ; =ov90_02258B2C
	mov r2, #1
	bx r3
	nop
_0225C1B4: .word ov90_02258B2C
	thumb_func_end ov90_0225C1A8

	thumb_func_start ov90_0225C1B8
ov90_0225C1B8: ; 0x0225C1B8
	add r1, r0, #0
	add r0, r3, #0
	ldr r3, _0225C1C4 ; =ov90_02258B2C
	mov r2, #0
	bx r3
	nop
_0225C1C4: .word ov90_02258B2C
	thumb_func_end ov90_0225C1B8

	thumb_func_start ov90_0225C1C8
ov90_0225C1C8: ; 0x0225C1C8
	add r0, r3, #0
	ldr r3, _0225C1D0 ; =ov90_02258B44
	mov r1, #1
	bx r3
	.balign 4, 0
_0225C1D0: .word ov90_02258B44
	thumb_func_end ov90_0225C1C8

	thumb_func_start ov90_0225C1D4
ov90_0225C1D4: ; 0x0225C1D4
	add r0, r3, #0
	ldr r3, _0225C1DC ; =ov90_02258B44
	mov r1, #0
	bx r3
	.balign 4, 0
_0225C1DC: .word ov90_02258B44
	thumb_func_end ov90_0225C1D4

	.rodata

_0225C1E0:
	.byte 0x55, 0x0F, 0x00, 0x00

ov90_0225C1E4: ; 0x0225C1E4
	.byte 0x55, 0x0F, 0x00, 0x00

ov90_0225C1E8: ; 0x0225C1E8
	.byte 0x4B, 0x0F, 0x0A, 0x00

ov90_0225C1EC: ; 0x0225C1EC
	.byte 0x00, 0x01, 0x03, 0x02

ov90_0225C1F0: ; 0x0225C1F0
	.byte 0x00, 0x00, 0xF6, 0xFF, 0xF0, 0xFF, 0xE8, 0xFF

ov90_0225C1F8: ; 0x0225C1F8
	.byte 0x00, 0x80, 0x0C, 0x00, 0x00, 0x80, 0xF3, 0xFF
	.byte 0x00, 0x00, 0xF6, 0xFF

ov90_0225C204: ; 0x0225C204
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov90_0225C210: ; 0x0225C210
	.byte 0x09, 0x08, 0x07, 0x00, 0x06, 0x05, 0x04, 0x00, 0x03, 0x02, 0x01, 0x00

ov90_0225C21C: ; 0x0225C21C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov90_0225C228: ; 0x0225C228
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C234: ; 0x0225C234
	.byte 0x00, 0xE0, 0xFE, 0xFF, 0x00, 0x20, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00

ov90_0225C240: ; 0x0225C240
	.byte 0x00, 0x70, 0xFF, 0xFF, 0x00, 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00

ov90_0225C24C: ; 0x0225C24C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov90_0225C258: ; 0x0225C258
	.byte 0x00, 0x80, 0xF3, 0xFF, 0x00, 0x80, 0x0C, 0x00
	.byte 0x00, 0x00, 0x0A, 0x00

ov90_0225C264: ; 0x0225C264
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C274: ; 0x0225C274
	.byte 0x80, 0x00

ov90_0225C276: ; 0x0225C276
	.byte 0x2C, 0x00, 0xEC, 0x00, 0x18, 0x00, 0x04, 0x00, 0x18, 0x00
	.byte 0x80, 0x00, 0x04, 0x00

ov90_0225C284: ; 0x0225C284
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x01, 0x00
	.byte 0x00, 0x03, 0x01, 0x02

ov90_0225C294: ; 0x0225C294
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C2A4: ; 0x0225C2A4
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C2B4: ; 0x0225C2B4
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00

ov90_0225C2CC: ; 0x0225C2CC
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C2F4: ; 0x0225C2F4
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00

ov90_0225C310: ; 0x0225C310
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C314: ; 0x0225C314
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C318: ; 0x0225C318
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C31C: ; 0x0225C31C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov90_0225C324: ; 0x0225C324
	.byte 0x00, 0x00, 0x00, 0x00, 0x0E, 0x04, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x0E, 0x08, 0x02, 0x00, 0x12, 0x00, 0x06, 0x00, 0x00, 0x02, 0x01, 0x00
	.byte 0x12, 0x0C, 0x00, 0x06, 0x12, 0x00, 0x06, 0x0C, 0x00, 0x02, 0x03, 0x01

ov90_0225C34C: ; 0x0225C34C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x14, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x06, 0x00, 0x06, 0x00, 0x07, 0x00, 0x07, 0x00, 0x08, 0x00, 0x08, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x15, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00
	.byte 0x0D, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x10, 0x00
	.byte 0x11, 0x00, 0x16, 0x00, 0x12, 0x00, 0x17, 0x00, 0x13, 0x00, 0x13, 0x00

ov90_0225C39C: ; 0x0225C39C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x19, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x18, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x14, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov90_0225C43C: ; 0x0225C43C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x1B, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1A, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x18, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov90_0225C4FC: ; 0x0225C4FC
	.word ov90_0225C1A8
	.word ov90_0225C194
	.word 0
	.word ov90_0225C1B8
	.word ov90_0225C194
	.word 0
	.word ov90_0225C1C8
	.word ov90_0225C194
	.word 0
	.word ov90_0225C1D4
	.word ov90_0225C194
	.word 0
	.word ov90_0225C19C
	.word ov90_0225C198
	.word 0
	; 0x0225C538
