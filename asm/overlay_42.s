	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov42_02227060
ov42_02227060: ; 0x02227060
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r3, #0
	add r4, r0, #0
	ldr r1, _02227100 ; =0x0000230C
	add r0, r6, #0
	str r2, [sp]
	bl AllocFromHeap
	ldr r2, _02227100 ; =0x0000230C
	add r7, r0, #0
	mov r1, #0
	bl memset
	str r4, [r7]
	mov r0, #0xb3
	add r1, r6, #0
	str r5, [r7, #4]
	bl NARC_ctor
	ldr r1, _02227104 ; =0x00002304
	str r0, [r7, r1]
	mov r0, #0xba
	add r1, r6, #0
	bl NARC_ctor
	ldr r1, _02227108 ; =0x00002308
	mov r4, #0
	str r0, [r7, r1]
	add r5, r7, #0
_0222709C:
	mov r0, #0x9a
	add r1, r4, #0
	add r2, r6, #0
	bl Create2DGfxResObjMan
	ldr r1, _0222710C ; =0x000022F0
	add r4, r4, #1
	str r0, [r5, r1]
	add r5, r5, #4
	cmp r4, #2
	blt _0222709C
	mov r5, #0
	add r4, r7, #0
_022270B6:
	mov r0, #0x17
	add r1, r5, #2
	add r2, r6, #0
	bl Create2DGfxResObjMan
	ldr r1, _02227110 ; =0x000022F8
	add r5, r5, #1
	str r0, [r4, r1]
	add r4, r4, #4
	cmp r5, #2
	blt _022270B6
	mov r4, #0
_022270CE:
	add r0, r7, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov42_02227570
	add r4, r4, #1
	cmp r4, #3
	blt _022270CE
	ldr r0, [sp]
	ldr r2, [sp]
	mov r1, #0x18
	str r0, [r7, #0xc]
	add r0, r6, #0
	mul r1, r2
	bl AllocFromHeap
	str r0, [r7, #8]
	ldr r3, [r7, #0xc]
	mov r2, #0x18
	mov r1, #0
	mul r2, r3
	bl memset
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227100: .word 0x0000230C
_02227104: .word 0x00002304
_02227108: .word 0x00002308
_0222710C: .word 0x000022F0
_02227110: .word 0x000022F8
	thumb_func_end ov42_02227060

	thumb_func_start ov42_02227114
ov42_02227114: ; 0x02227114
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	cmp r0, #0
	bls _02227140
	add r4, r6, #0
_02227122:
	ldr r0, [r5, #8]
	add r0, r0, r4
	bl ov42_02227E68
	cmp r0, #0
	bne _02227136
	ldr r0, [r5, #8]
	add r0, r0, r4
	bl ov42_0222740C
_02227136:
	ldr r0, [r5, #0xc]
	add r6, r6, #1
	add r4, #0x18
	cmp r6, r0
	blo _02227122
_02227140:
	mov r4, #0
_02227142:
	add r0, r5, #0
	add r1, r4, #0
	bl ov42_02227604
	add r4, r4, #1
	cmp r4, #3
	blt _02227142
	add r0, r5, #0
	bl ov42_022271F8
	ldr r0, _02227188 ; =0x00002304
	ldr r0, [r5, r0]
	bl NARC_dtor
	ldr r0, _0222718C ; =0x00002308
	ldr r0, [r5, r0]
	bl NARC_dtor
	ldr r7, _02227190 ; =0x000022F0
	mov r6, #0
	add r4, r5, #0
_0222716C:
	ldr r0, [r4, r7]
	bl Destroy2DGfxResObjMan
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0222716C
	ldr r0, [r5, #8]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227188: .word 0x00002304
_0222718C: .word 0x00002308
_02227190: .word 0x000022F0
	thumb_func_end ov42_02227114

	thumb_func_start ov42_02227194
ov42_02227194: ; 0x02227194
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r7, r3, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	add r6, r2, #0
	bl ov42_02227680
	cmp r0, #0
	bne _022271B0
	bl GF_AssertFail
_022271B0:
	add r0, r4, #0
	bl ov42_02227654
	add r1, r0, #0
	ldr r0, [sp, #0x20]
	add r2, r6, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r3, r7, #0
	bl ov42_022276DC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov42_02227194

	thumb_func_start ov42_022271D0
ov42_022271D0: ; 0x022271D0
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov42_02227654
	add r1, r0, #0
	add r0, r4, #0
	bl ov42_02227948
	pop {r4, pc}
	thumb_func_end ov42_022271D0

	thumb_func_start ov42_022271E4
ov42_022271E4: ; 0x022271E4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov42_02227654
	add r1, r0, #0
	add r0, r4, #0
	bl ov42_022279E8
	pop {r4, pc}
	thumb_func_end ov42_022271E4

	thumb_func_start ov42_022271F8
ov42_022271F8: ; 0x022271F8
	push {r3, r4, r5, lr}
	mov r1, #0x23
	add r4, r0, #0
	lsl r1, r1, #8
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0222720A
	bl ov42_02227274
_0222720A:
	mov r5, #0
_0222720C:
	add r0, r4, #0
	add r1, r5, #0
	bl ov42_022279E8
	cmp r0, #1
	bne _02227220
	add r0, r4, #0
	add r1, r5, #0
	bl ov42_02227948
_02227220:
	add r5, r5, #1
	cmp r5, #0x99
	blt _0222720C
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_022271F8

	thumb_func_start ov42_02227228
ov42_02227228: ; 0x02227228
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	add r6, r3, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	add r0, r2, #0
	bne _0222723C
	bl GF_AssertFail
_0222723C:
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r2, r6, #0
	bl ov42_02227B6C
	add r0, r7, #0
	add r1, r6, #0
	bl ov42_02227C18
	ldr r5, _02227270 ; =ov42_02229B10
	mov r4, #0
_02227252:
	str r6, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldrb r1, [r5]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	add r0, r7, #0
	bl ov42_022276DC
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _02227252
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227270: .word ov42_02229B10
	thumb_func_end ov42_02227228

	thumb_func_start ov42_02227274
ov42_02227274: ; 0x02227274
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov42_02227BE0
	add r0, r6, #0
	bl ov42_02227CA8
	ldr r5, _02227298 ; =ov42_02229B10
	mov r4, #0
_02227286:
	ldrb r1, [r5]
	add r0, r6, #0
	bl ov42_02227948
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x10
	blt _02227286
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02227298: .word ov42_02229B10
	thumb_func_end ov42_02227274

	thumb_func_start ov42_0222729C
ov42_0222729C: ; 0x0222729C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r2, r3, #0
	add r5, r0, #0
	bl ov42_022279FC
	ldr r0, _022272B0 ; =0x000022EC
	str r4, [r5, r0]
	pop {r3, r4, r5, pc}
	nop
_022272B0: .word 0x000022EC
	thumb_func_end ov42_0222729C

	thumb_func_start ov42_022272B4
ov42_022272B4: ; 0x022272B4
	ldr r3, _022272B8 ; =ov42_02227B04
	bx r3
	.balign 4, 0
_022272B8: .word ov42_02227B04
	thumb_func_end ov42_022272B4

	thumb_func_start ov42_022272BC
ov42_022272BC: ; 0x022272BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	str r3, [sp]
	bl ov42_02227CF8
	add r4, r0, #0
	add r0, r7, #0
	bl ov42_02227654
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov42_022279E8
	cmp r0, #1
	beq _022272E6
	bl GF_AssertFail
_022272E6:
	mov r0, #0
	add r2, sp, #0xc
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r1, [r5]
	mov r2, #0x38
	str r1, [sp, #0xc]
	ldr r1, [sp, #4]
	add r7, r1, #0
	add r1, r5, #0
	mul r7, r2
	add r1, #0x24
	add r1, r1, r7
	str r1, [sp, #0x10]
	ldrsh r0, [r6, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	mov r0, #2
	ldrsh r1, [r6, r0]
	lsl r1, r1, #0xc
	str r1, [sp, #0x18]
	lsl r1, r0, #0xb
	str r1, [sp, #0x20]
	str r1, [sp, #0x24]
	str r1, [sp, #0x28]
	mov r1, #4
	ldrsh r1, [r6, r1]
	str r1, [sp, #0x30]
	ldr r1, [sp]
	str r1, [sp, #0x38]
	add r1, r5, #0
	str r1, [sp, #8]
	add r1, #0x1c
	str r1, [sp, #8]
	ldr r1, [r1, r7]
	cmp r1, #3
	beq _0222733E
	cmp r1, #1
	bne _02227344
_0222733E:
	mov r0, #1
	str r0, [sp, #0x34]
	b _02227346
_02227344:
	str r0, [sp, #0x34]
_02227346:
	add r0, sp, #0xc
	bl CreateSprite
	str r0, [r4, #4]
	mov r1, #6
	ldrsh r1, [r6, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02024A04
	add r0, r5, r7
	ldr r0, [r0, #0x20]
	cmp r0, #1
	ldr r0, [r4, #4]
	bne _0222736C
	mov r1, #6
	bl Set2dSpriteAnimSeqNo
	b _02227372
_0222736C:
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
_02227372:
	mov r0, #9
	str r0, [r4, #0xc]
	mov r0, #0
	strh r0, [r4, #0x14]
	mov r0, #1
	str r0, [r4, #0x10]
	add r0, r5, #0
	add r0, #0x10
	add r0, r0, r7
	str r0, [r4]
	ldr r0, _02227404 ; =0x000022B8
	add r0, r5, r0
	bl ov42_02227B5C
	cmp r0, #0
	beq _022273F8
	mov r0, #0
	add r2, sp, #0xc
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r1, [r5]
	str r1, [sp, #0xc]
	ldr r1, _02227408 ; =0x000022C8
	add r2, r5, r1
	str r2, [sp, #0x10]
	ldrsh r0, [r6, r0]
	add r1, #0x24
	lsl r0, r0, #0xc
	str r0, [sp, #0x14]
	mov r0, #2
	ldrsh r2, [r6, r0]
	lsl r2, r2, #0xc
	str r2, [sp, #0x18]
	lsl r2, r0, #0xb
	str r2, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	ldr r1, [r5, r1]
	str r1, [sp, #0x30]
	ldr r1, [sp]
	str r1, [sp, #0x38]
	ldr r1, [sp, #8]
	ldr r1, [r1, r7]
	cmp r1, #3
	beq _022273DA
	cmp r1, #1
	bne _022273E0
_022273DA:
	mov r0, #1
	str r0, [sp, #0x34]
	b _022273E2
_022273E0:
	str r0, [sp, #0x34]
_022273E2:
	add r0, sp, #0xc
	bl CreateSprite
	str r0, [r4, #8]
	mov r1, #6
	ldrsh r1, [r6, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02024A04
	b _022273FC
_022273F8:
	mov r0, #0
	str r0, [r4, #8]
_022273FC:
	add r0, r4, #0
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	nop
_02227404: .word 0x000022B8
_02227408: .word 0x000022C8
	thumb_func_end ov42_022272BC

	thumb_func_start ov42_0222740C
ov42_0222740C: ; 0x0222740C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0222741A
	bl sub_02024758
_0222741A:
	ldr r0, [r4, #4]
	bl sub_02024758
	mov r1, #0x18
	mov r0, #0
_02227424:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _02227424
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_0222740C

	thumb_func_start ov42_02227430
ov42_02227430: ; 0x02227430
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov42_02227430

	thumb_func_start ov42_02227434
ov42_02227434: ; 0x02227434
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	lsl r0, r1, #0xc
	str r0, [sp]
	lsl r0, r2, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	add r1, sp, #0
	bl sub_020247D4
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02227470
	mov r0, #2
	ldr r1, [sp]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp]
	mov r0, #0xe
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl sub_020247D4
_02227470:
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov42_02227434

	thumb_func_start ov42_02227474
ov42_02227474: ; 0x02227474
	ldr r3, _0222747C ; =sub_02024ADC
	ldr r0, [r0, #4]
	bx r3
	nop
_0222747C: .word sub_02024ADC
	thumb_func_end ov42_02227474

	thumb_func_start ov42_02227480
ov42_02227480: ; 0x02227480
	push {r3, lr}
	ldr r0, [r0, #4]
	bl sub_02024AF8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov42_02227480

	thumb_func_start ov42_02227490
ov42_02227490: ; 0x02227490
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _022274A8
	add r1, r4, #0
	bl Set2dSpriteVisibleFlag
_022274A8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov42_02227490

	thumb_func_start ov42_022274AC
ov42_022274AC: ; 0x022274AC
	ldr r3, _022274B4 ; =sub_020248B8
	ldr r0, [r0, #4]
	bx r3
	nop
_022274B4: .word sub_020248B8
	thumb_func_end ov42_022274AC

	thumb_func_start ov42_022274B8
ov42_022274B8: ; 0x022274B8
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov42_022274B8

	thumb_func_start ov42_022274C0
ov42_022274C0: ; 0x022274C0
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov42_022274C0

	thumb_func_start ov42_022274C4
ov42_022274C4: ; 0x022274C4
	ldr r3, _022274CC ; =sub_020249D4
	ldr r0, [r0, #4]
	bx r3
	nop
_022274CC: .word sub_020249D4
	thumb_func_end ov42_022274C4

	thumb_func_start ov42_022274D0
ov42_022274D0: ; 0x022274D0
	ldr r3, _022274D8 ; =sub_020249F8
	ldr r0, [r0, #4]
	bx r3
	nop
_022274D8: .word sub_020249F8
	thumb_func_end ov42_022274D0

	thumb_func_start ov42_022274DC
ov42_022274DC: ; 0x022274DC
	push {lr}
	sub sp, #0xc
	ldr r3, [r0, #8]
	cmp r3, #0
	beq _022274FE
	add r1, #8
	lsl r1, r1, #0xc
	add r2, #0xe
	str r1, [sp]
	lsl r1, r2, #0xc
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, [r0, #8]
	add r1, sp, #0
	bl sub_020247D4
_022274FE:
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov42_022274DC

	thumb_func_start ov42_02227504
ov42_02227504: ; 0x02227504
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0xa
	blt _02227514
	bl GF_AssertFail
_02227514:
	cmp r6, #4
	blt _0222751C
	bl GF_AssertFail
_0222751C:
	str r4, [r5, #0xc]
	mov r0, #0
	strh r0, [r5, #0x14]
	ldr r0, _02227534 ; =ov42_02229B20
	lsl r1, r4, #2
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02227532
	add r0, r5, #0
	add r1, r6, #0
	blx r2
_02227532:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02227534: .word ov42_02229B20
	thumb_func_end ov42_02227504

	thumb_func_start ov42_02227538
ov42_02227538: ; 0x02227538
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r1, _0222756C ; =ov42_02229B04
	mov r0, #0
	ldrb r2, [r1, r2]
	cmp r2, #0xff
	bne _0222754C
	mov r0, #1
	b _02227558
_0222754C:
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	add r1, r1, #1
	cmp r2, r1
	blt _02227558
	mov r0, #1
_02227558:
	cmp r0, #1
	bne _0222756A
	add r0, r4, #0
	bl ov42_02227D30
	mov r0, #0x14
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x14]
_0222756A:
	pop {r4, pc}
	.balign 4, 0
_0222756C: .word ov42_02229B04
	thumb_func_end ov42_02227538

	thumb_func_start ov42_02227570
ov42_02227570: ; 0x02227570
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r0, [sp, #0xc]
	add r0, r1, #0
	lsl r5, r0, #4
	ldr r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r1, r0, r5
	ldr r0, _022275F0 ; =0x00002188
	str r2, [sp, #0x14]
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0222758E
	bl GF_AssertFail
_0222758E:
	ldr r0, _022275F4 ; =ov42_02229B70
	ldr r6, _022275F8 ; =_02229AF8
	add r4, r0, r5
	ldr r0, [sp, #0xc]
	mov r7, #0
	add r5, r0, r5
	ldr r0, [sp, #0x10]
	lsl r1, r0, #1
	mov r0, #1
	lsl r0, r0, #8
	add r0, r1, r0
	str r0, [sp, #0x18]
_022275A6:
	lsr r2, r7, #0x1f
	lsl r1, r7, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	ldrb r2, [r6]
	ldr r1, [sp, #0x18]
	add r0, r0, #2
	add r1, r2, r1
	str r1, [sp]
	ldr r1, [sp, #0x14]
	str r0, [sp, #4]
	str r1, [sp, #8]
	lsl r1, r0, #2
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0xc]
	add r1, r0, r1
	ldr r0, _022275FC ; =0x000022F0
	mov r3, #0
	ldr r0, [r1, r0]
	ldr r1, _02227600 ; =0x00002304
	ldr r1, [r2, r1]
	ldr r2, [r4]
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _022275F0 ; =0x00002188
	add r7, r7, #1
	str r0, [r5, r1]
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #4
	blt _022275A6
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_022275F0: .word 0x00002188
_022275F4: .word ov42_02229B70
_022275F8: .word _02229AF8
_022275FC: .word 0x000022F0
_02227600: .word 0x00002304
	thumb_func_end ov42_02227570

	thumb_func_start ov42_02227604
ov42_02227604: ; 0x02227604
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	lsl r5, r1, #4
	ldr r0, _0222764C ; =0x00002188
	add r1, r6, r5
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _02227618
	bl GF_AssertFail
_02227618:
	mov r4, #0
	add r5, r6, r5
	add r7, r4, #0
_0222761E:
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, r0, #2
	lsl r0, r0, #2
	add r1, r6, r0
	ldr r0, _02227650 ; =0x000022F0
	ldr r0, [r1, r0]
	ldr r1, _0222764C ; =0x00002188
	ldr r1, [r5, r1]
	bl DestroySingle2DGfxResObj
	ldr r0, _0222764C ; =0x00002188
	add r4, r4, #1
	str r7, [r5, r0]
	add r5, r5, #4
	cmp r4, #4
	blt _0222761E
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222764C: .word 0x00002188
_02227650: .word 0x000022F0
	thumb_func_end ov42_02227604

	thumb_func_start ov42_02227654
ov42_02227654: ; 0x02227654
	push {r3, lr}
	ldr r3, _02227678 ; =ov42_02229BA0
	mov r2, #0
_0222765A:
	ldrh r1, [r3]
	cmp r0, r1
	bne _02227668
	ldr r0, _0222767C ; =ov42_02229BA2
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	pop {r3, pc}
_02227668:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x99
	blt _0222765A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02227678: .word ov42_02229BA0
_0222767C: .word ov42_02229BA2
	thumb_func_end ov42_02227654

	thumb_func_start ov42_02227680
ov42_02227680: ; 0x02227680
	cmp r1, #0
	bne _022276A4
	cmp r0, #0
	beq _0222769C
	cmp r0, #0x61
	beq _0222769C
	cmp r0, #0xee
	beq _0222769C
	cmp r0, #0xef
	beq _0222769C
	ldr r1, _022276A8 ; =0x00000127
	sub r0, r0, r1
	cmp r0, #1
	bhi _022276A0
_0222769C:
	mov r0, #1
	bx lr
_022276A0:
	mov r0, #0
	bx lr
_022276A4:
	mov r0, #1
	bx lr
	.balign 4, 0
_022276A8: .word 0x00000127
	thumb_func_end ov42_02227680

	thumb_func_start ov42_022276AC
ov42_022276AC: ; 0x022276AC
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #2
	beq _022276C0
	cmp r4, #3
	beq _022276C0
	bl GF_AssertFail
_022276C0:
	sub r1, r4, #2
	cmp r6, #0
	bne _022276C8
	add r1, r1, #2
_022276C8:
	ldr r0, _022276D8 ; =_02229AF8
	ldrb r2, [r0, r1]
	mov r0, #1
	lsl r1, r5, #1
	lsl r0, r0, #8
	add r0, r1, r0
	add r0, r2, r0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022276D8: .word _02229AF8
	thumb_func_end ov42_022276AC

	thumb_func_start ov42_022276DC
ov42_022276DC: ; 0x022276DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x38
	mul r0, r4
	add r0, r5, r0
	ldr r0, [r0, #0x14]
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _022276F6
	bl GF_AssertFail
_022276F6:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _0222770E
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov42_02227720
	pop {r3, r4, r5, r6, r7, pc}
_0222770E:
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov42_02227874
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_022276DC

	thumb_func_start ov42_02227720
ov42_02227720: ; 0x02227720
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	ldr r0, [sp, #0x58]
	add r6, r5, #0
	str r0, [sp, #0x40]
	mov r0, #2
	lsl r0, r0, #8
	add r0, r1, r0
	str r0, [sp, #0x38]
	lsl r0, r1, #1
	str r0, [sp, #0x3c]
	add r4, r1, #0
	mov r0, #0x38
	mul r4, r0
	ldr r0, [sp, #0x38]
	str r3, [sp, #0x30]
	str r0, [sp]
	add r0, r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r2, [sp, #0x2c]
	ldr r2, [sp, #0x3c]
	ldr r1, _0222786C ; =0x000022F0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, #0x14
	ldr r1, [r5, r1]
	add r6, #0x14
	add r2, #0xe
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r6, r4]
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x3c]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r7, r5, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	add r2, #0xd
	ldr r1, _02227870 ; =0x000022F4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, #0x10
	ldr r1, [r5, r1]
	add r7, #0x18
	mov r3, #0
	str r2, [sp, #0x3c]
	bl AddPlttResObjFromOpenNarc
	str r0, [r7, r4]
	ldr r0, [r6, r4]
	bl sub_0200A810
	mov r1, #6
	ldr r2, [r0, #0x10]
	lsl r1, r1, #0xa
	cmp r2, r1
	beq _022277A4
	mov r1, #1
	str r1, [sp, #0x34]
	b _022277A8
_022277A4:
	mov r1, #0
	str r1, [sp, #0x34]
_022277A8:
	ldr r1, [sp, #0x30]
	cmp r1, #2
	bne _022277B6
	mov r1, #2
	lsl r1, r1, #0xa
	str r1, [r0, #0x10]
	b _022277CE
_022277B6:
	cmp r1, #1
	bne _022277CE
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _022277C8
	mov r1, #5
	lsl r1, r1, #0xa
	str r1, [r0, #0x10]
	b _022277CE
_022277C8:
	mov r1, #6
	lsl r1, r1, #0xa
	str r1, [r0, #0x10]
_022277CE:
	ldr r0, [r6, r4]
	bl sub_0200AE18
	cmp r0, #0
	bne _022277DC
	bl GF_AssertFail
_022277DC:
	ldr r0, [r7, r4]
	bl sub_0200B00C
	cmp r0, #0
	bne _022277EA
	bl GF_AssertFail
_022277EA:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _022277FA
	ldr r1, [r7, r4]
	add r0, r5, #0
	mov r2, #1
	bl ov42_02227E78
_022277FA:
	ldr r0, [r6, r4]
	bl sub_0200A740
	ldr r0, [r7, r4]
	bl sub_0200A740
	ldr r0, [sp, #0x2c]
	add r1, r5, r4
	str r0, [r1, #0x1c]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	str r0, [r1, #0x20]
	mov r0, #0
	str r0, [r1, #0x10]
	ldr r0, [sp, #0x30]
	mov r1, #2
	bl ov42_022276AC
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	mov r1, #3
	bl ov42_022276AC
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, _0222786C ; =0x000022F0
	str r0, [sp, #0x10]
	ldr r1, [r5, r2]
	add r3, r6, #0
	str r1, [sp, #0x14]
	add r1, r2, #4
	ldr r1, [r5, r1]
	str r1, [sp, #0x18]
	add r1, r2, #0
	add r1, #8
	ldr r1, [r5, r1]
	add r2, #0xc
	str r1, [sp, #0x1c]
	ldr r1, [r5, r2]
	add r5, #0x24
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x38]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r5, r4
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0222786C: .word 0x000022F0
_02227870: .word 0x000022F4
	thumb_func_end ov42_02227720

	thumb_func_start ov42_02227874
ov42_02227874: ; 0x02227874
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r7, r1, #0
	add r5, r0, #0
	sub r0, r7, #2
	str r0, [sp, #0x38]
	mov r0, #2
	lsl r0, r0, #8
	add r0, r7, r0
	str r0, [sp, #0x34]
	mov r0, #0x38
	add r4, r7, #0
	mul r4, r0
	ldr r0, [sp, #0x34]
	add r6, r5, #0
	str r0, [sp]
	add r0, r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x50]
	str r2, [sp, #0x2c]
	str r3, [sp, #0x30]
	ldr r1, _02227940 ; =0x000022F0
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, #0x18
	ldr r1, [r5, r1]
	add r6, #0x14
	sub r2, r7, #1
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r6, r4]
	ldr r0, [sp, #0x30]
	cmp r0, #2
	bne _022278C8
	ldr r0, [r6, r4]
	bl sub_0200A810
	mov r1, #2
	lsl r1, r1, #0xa
	str r1, [r0, #0x10]
	b _022278D8
_022278C8:
	cmp r0, #1
	bne _022278D8
	ldr r0, [r6, r4]
	bl sub_0200A810
	mov r1, #5
	lsl r1, r1, #0xa
	str r1, [r0, #0x10]
_022278D8:
	ldr r0, [r6, r4]
	bl sub_0200AE18
	cmp r0, #0
	bne _022278E6
	bl GF_AssertFail
_022278E6:
	ldr r0, [r6, r4]
	bl sub_0200A740
	mov r0, #0
	add r2, r5, r4
	ldr r1, [sp, #0x2c]
	str r0, [r2, #0x18]
	str r1, [r2, #0x1c]
	ldr r1, [sp, #0x30]
	mov r6, #1
	str r1, [r2, #0x20]
	str r6, [r2, #0x10]
	mov r2, #6
	ldr r1, [sp, #0x38]
	lsl r2, r2, #6
	add r3, r1, r2
	str r3, [sp]
	sub r1, r6, #2
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, _02227940 ; =0x000022F0
	str r0, [sp, #0x10]
	ldr r1, [r5, r2]
	str r1, [sp, #0x14]
	add r1, r2, #4
	ldr r1, [r5, r1]
	str r1, [sp, #0x18]
	add r1, r2, #0
	add r1, #8
	ldr r1, [r5, r1]
	add r2, #0xc
	str r1, [sp, #0x1c]
	ldr r1, [r5, r2]
	add r5, #0x24
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x34]
	ldr r2, _02227944 ; =0x00000402
	add r0, r5, r4
	bl CreateSpriteResourcesHeader
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02227940: .word 0x000022F0
_02227944: .word 0x00000402
	thumb_func_end ov42_02227874

	thumb_func_start ov42_02227948
ov42_02227948: ; 0x02227948
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	mov r0, #0x38
	add r4, r6, #0
	mul r4, r0
	add r0, r5, r4
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _02227960
	bl GF_AssertFail
_02227960:
	add r0, r5, r4
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02227972
	add r0, r5, #0
	add r1, r6, #0
	bl ov42_0222797C
	pop {r4, r5, r6, pc}
_02227972:
	add r0, r5, #0
	add r1, r6, #0
	bl ov42_022279C0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02227948

	thumb_func_start ov42_0222797C
ov42_0222797C: ; 0x0222797C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r5, #0
	mov r0, #0x38
	add r4, r1, #0
	mul r4, r0
	add r6, #0x14
	ldr r0, [r6, r4]
	bl sub_0200AEB0
	add r7, r5, #0
	add r7, #0x18
	ldr r0, [r7, r4]
	bl sub_0200B0A8
	ldr r0, _022279B8 ; =0x000022F0
	ldr r1, [r6, r4]
	ldr r0, [r5, r0]
	bl DestroySingle2DGfxResObj
	ldr r0, _022279BC ; =0x000022F4
	ldr r1, [r7, r4]
	ldr r0, [r5, r0]
	bl DestroySingle2DGfxResObj
	mov r0, #0
	str r0, [r6, r4]
	str r0, [r7, r4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022279B8: .word 0x000022F0
_022279BC: .word 0x000022F4
	thumb_func_end ov42_0222797C

	thumb_func_start ov42_022279C0
ov42_022279C0: ; 0x022279C0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r6, #0
	mov r0, #0x38
	add r4, r1, #0
	add r5, #0x14
	mul r4, r0
	ldr r0, [r5, r4]
	bl sub_0200AEB0
	ldr r0, _022279E4 ; =0x000022F0
	ldr r1, [r5, r4]
	ldr r0, [r6, r0]
	bl DestroySingle2DGfxResObj
	mov r0, #0
	str r0, [r5, r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022279E4: .word 0x000022F0
	thumb_func_end ov42_022279C0

	thumb_func_start ov42_022279E8
ov42_022279E8: ; 0x022279E8
	mov r2, #0x38
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022279F8
	mov r0, #1
	bx lr
_022279F8:
	mov r0, #0
	bx lr
	thumb_func_end ov42_022279E8

	thumb_func_start ov42_022279FC
ov42_022279FC: ; 0x022279FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r6, r0, #0
	ldr r0, _02227AF0 ; =0x000022B8
	str r1, [sp, #0x2c]
	ldr r0, [r6, r0]
	add r7, r2, #0
	cmp r0, #0
	beq _02227A12
	bl GF_AssertFail
_02227A12:
	mov r4, #0
	ldr r5, _02227AF4 ; =ov42_02229AFC
	str r4, [sp, #0x34]
_02227A18:
	ldrb r1, [r5]
	add r0, r6, #0
	bl ov42_022279E8
	cmp r0, #1
	bne _02227A30
	ldr r0, _02227AF4 ; =ov42_02229AFC
	ldrb r0, [r0, r4]
	str r0, [sp, #0x30]
	mov r0, #1
	str r0, [sp, #0x34]
	b _02227A38
_02227A30:
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #6
	blt _02227A18
_02227A38:
	ldr r0, [sp, #0x34]
	cmp r0, #1
	beq _02227A42
	bl GF_AssertFail
_02227A42:
	mov r5, #0
	add r4, r6, #0
_02227A46:
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp]
	add r0, r5, #2
	str r0, [sp, #4]
	ldr r0, _02227AF8 ; =0x000022F8
	str r7, [sp, #8]
	ldr r1, _02227AFC ; =0x00002304
	ldr r0, [r4, r0]
	ldr r1, [r6, r1]
	add r2, r5, #0
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	mov r1, #0x8b
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #2
	blt _02227A46
	mov r0, #0x12
	lsl r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r1, #0x30
	str r0, [sp, #4]
	str r7, [sp, #8]
	ldr r0, [r6, r1]
	add r1, #0x14
	ldr r1, [r6, r1]
	mov r2, #2
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	ldr r1, _02227AF0 ; =0x000022B8
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	bl sub_0200AE18
	cmp r0, #0
	bne _02227A9E
	bl GF_AssertFail
_02227A9E:
	ldr r0, _02227AF0 ; =0x000022B8
	ldr r0, [r6, r0]
	bl sub_0200A740
	mov r1, #0x12
	lsl r1, r1, #4
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r3, _02227B00 ; =0x000022F0
	str r0, [sp, #0x10]
	ldr r2, [r6, r3]
	str r2, [sp, #0x14]
	add r2, r3, #4
	ldr r2, [r6, r2]
	str r2, [sp, #0x18]
	add r2, r3, #0
	add r2, #8
	ldr r2, [r6, r2]
	str r2, [sp, #0x1c]
	add r2, r3, #0
	add r2, #0xc
	ldr r2, [r6, r2]
	sub r3, #0x28
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, r6, r3
	add r3, r1, #0
	ldr r2, [sp, #0x30]
	add r3, #0xe0
	add r2, r2, r3
	add r3, r1, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227AF0: .word 0x000022B8
_02227AF4: .word ov42_02229AFC
_02227AF8: .word 0x000022F8
_02227AFC: .word 0x00002304
_02227B00: .word 0x000022F0
	thumb_func_end ov42_022279FC

	thumb_func_start ov42_02227B04
ov42_02227B04: ; 0x02227B04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02227B50 ; =0x000022B8
	add r0, r5, r0
	bl ov42_02227B5C
	cmp r0, #1
	bne _02227B4C
	ldr r0, _02227B50 ; =0x000022B8
	ldr r0, [r5, r0]
	bl sub_0200AEB0
	ldr r1, _02227B54 ; =0x000022F0
	ldr r0, [r5, r1]
	sub r1, #0x38
	ldr r1, [r5, r1]
	bl DestroySingle2DGfxResObj
	ldr r0, _02227B50 ; =0x000022B8
	mov r4, #0
	add r7, r0, #0
	str r4, [r5, r0]
	add r6, r4, #0
	add r7, #8
_02227B34:
	ldr r0, _02227B58 ; =0x000022F8
	mov r1, #0x8b
	lsl r1, r1, #6
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	bl DestroySingle2DGfxResObj
	str r6, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02227B34
_02227B4C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227B50: .word 0x000022B8
_02227B54: .word 0x000022F0
_02227B58: .word 0x000022F8
	thumb_func_end ov42_02227B04

	thumb_func_start ov42_02227B5C
ov42_02227B5C: ; 0x02227B5C
	ldr r0, [r0]
	cmp r0, #0
	beq _02227B66
	mov r0, #1
	bx lr
_02227B66:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov42_02227B5C

	thumb_func_start ov42_02227B6C
ov42_02227B6C: ; 0x02227B6C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x23
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	add r4, r1, #0
	add r6, r2, #0
	cmp r0, #0
	beq _02227B84
	bl GF_AssertFail
_02227B84:
	ldr r0, _02227BD8 ; =0x00000402
	mov r2, #0
	str r0, [sp]
	str r4, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldr r1, _02227BDC ; =0x000022F4
	str r6, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, #0x14
	ldr r1, [r5, r1]
	add r3, r2, #0
	bl AddPlttResObjFromOpenNarc
	mov r1, #0x23
	lsl r1, r1, #8
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl sub_0200B00C
	cmp r0, #0
	bne _02227BB4
	bl GF_AssertFail
_02227BB4:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02227BC8
	mov r1, #0x23
	lsl r1, r1, #8
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #8
	bl ov42_02227E78
_02227BC8:
	mov r0, #0x23
	lsl r0, r0, #8
	ldr r0, [r5, r0]
	bl sub_0200A740
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_02227BD8: .word 0x00000402
_02227BDC: .word 0x000022F4
	thumb_func_end ov42_02227B6C

	thumb_func_start ov42_02227BE0
ov42_02227BE0: ; 0x02227BE0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x23
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _02227BF2
	bl GF_AssertFail
_02227BF2:
	mov r0, #0x23
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	bl sub_0200B0A8
	ldr r1, _02227C14 ; =0x000022F4
	ldr r0, [r4, r1]
	add r1, #0xc
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	mov r0, #0x23
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r4, r0]
	pop {r4, pc}
	nop
_02227C14: .word 0x000022F4
	thumb_func_end ov42_02227BE0

	thumb_func_start ov42_02227C18
ov42_02227C18: ; 0x02227C18
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, _02227C94 ; =0x000021B8
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _02227C2C
	bl GF_AssertFail
_02227C2C:
	mov r0, #0x11
	mov r4, #0
	str r0, [sp, #0x10]
	add r6, r5, #0
	mov r7, #0x12
_02227C36:
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, _02227C98 ; =0x00002308
	str r0, [sp, #8]
	ldr r0, _02227C9C ; =0x000022F8
	ldr r1, [r5, r1]
	ldr r0, [r5, r0]
	ldr r2, [sp, #0x10]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02227C94 ; =0x000021B8
	add r2, r7, #0
	str r0, [r6, r1]
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	ldr r1, _02227C98 ; =0x00002308
	str r0, [sp, #8]
	ldr r0, _02227CA0 ; =0x000022FC
	ldr r1, [r5, r1]
	ldr r0, [r5, r0]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r1, _02227CA4 ; =0x000021BC
	add r4, r4, #1
	str r0, [r6, r1]
	ldr r0, [sp, #0x10]
	add r6, #0x10
	add r0, r0, #2
	add r7, r7, #2
	str r0, [sp, #0x10]
	cmp r4, #0x10
	blt _02227C36
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02227C94: .word 0x000021B8
_02227C98: .word 0x00002308
_02227C9C: .word 0x000022F8
_02227CA0: .word 0x000022FC
_02227CA4: .word 0x000021BC
	thumb_func_end ov42_02227C18

	thumb_func_start ov42_02227CA8
ov42_02227CA8: ; 0x02227CA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02227CE8 ; =0x000021B8
	ldr r0, [r5, r0]
	cmp r0, #0
	bne _02227CB8
	bl GF_AssertFail
_02227CB8:
	mov r6, #0
	add r4, r5, #0
	add r7, r6, #0
_02227CBE:
	ldr r0, _02227CEC ; =0x000022F8
	ldr r1, _02227CE8 ; =0x000021B8
	ldr r0, [r5, r0]
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	ldr r0, _02227CF0 ; =0x000022FC
	ldr r1, _02227CF4 ; =0x000021BC
	ldr r0, [r5, r0]
	ldr r1, [r4, r1]
	bl DestroySingle2DGfxResObj
	ldr r0, _02227CE8 ; =0x000021B8
	add r6, r6, #1
	str r7, [r4, r0]
	add r0, r0, #4
	str r7, [r4, r0]
	add r4, #0x10
	cmp r6, #0x10
	blt _02227CBE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227CE8: .word 0x000021B8
_02227CEC: .word 0x000022F8
_02227CF0: .word 0x000022FC
_02227CF4: .word 0x000021BC
	thumb_func_end ov42_02227CA8

	thumb_func_start ov42_02227CF8
ov42_02227CF8: ; 0x02227CF8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	mov r6, #0
	cmp r0, #0
	bls _02227D26
	add r4, r6, #0
_02227D06:
	ldr r0, [r5, #8]
	add r0, r0, r4
	bl ov42_02227E68
	cmp r0, #1
	bne _02227D1C
	mov r0, #0x18
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	pop {r4, r5, r6, pc}
_02227D1C:
	ldr r0, [r5, #0xc]
	add r6, r6, #1
	add r4, #0x18
	cmp r6, r0
	blo _02227D06
_02227D26:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_02227CF8

	thumb_func_start ov42_02227D30
ov42_02227D30: ; 0x02227D30
	push {r3, lr}
	ldr r1, [r0, #0xc]
	lsl r2, r1, #2
	ldr r1, _02227D44 ; =ov42_02229B48
	ldr r1, [r1, r2]
	cmp r1, #0
	beq _02227D40
	blx r1
_02227D40:
	pop {r3, pc}
	nop
_02227D44: .word ov42_02229B48
	thumb_func_end ov42_02227D30

	thumb_func_start ov42_02227D48
ov42_02227D48: ; 0x02227D48
	ldr r3, _02227D50 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	bx r3
	.balign 4, 0
_02227D50: .word sub_02024950
	thumb_func_end ov42_02227D48

	thumb_func_start ov42_02227D54
ov42_02227D54: ; 0x02227D54
	ldr r3, _02227D60 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	mov r1, #4
	bx r3
	nop
_02227D60: .word sub_02024950
	thumb_func_end ov42_02227D54

	thumb_func_start ov42_02227D64
ov42_02227D64: ; 0x02227D64
	ldr r3, _02227D70 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	add r1, r1, #5
	bx r3
	nop
_02227D70: .word sub_02024950
	thumb_func_end ov42_02227D64

	thumb_func_start ov42_02227D74
ov42_02227D74: ; 0x02227D74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #4]
	add r1, r1, #5
	bl sub_02024950
	str r4, [r5, #0x10]
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02227D74

	thumb_func_start ov42_02227D88
ov42_02227D88: ; 0x02227D88
	ldr r3, _02227D94 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	add r1, #9
	bx r3
	nop
_02227D94: .word sub_02024950
	thumb_func_end ov42_02227D88

	thumb_func_start ov42_02227D98
ov42_02227D98: ; 0x02227D98
	ldr r3, _02227DA4 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	add r1, r1, #5
	bx r3
	nop
_02227DA4: .word sub_02024950
	thumb_func_end ov42_02227D98

	thumb_func_start ov42_02227DA8
ov42_02227DA8: ; 0x02227DA8
	ldr r3, _02227DB4 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	add r1, r1, #5
	bx r3
	nop
_02227DB4: .word sub_02024950
	thumb_func_end ov42_02227DA8

	thumb_func_start ov42_02227DB8
ov42_02227DB8: ; 0x02227DB8
	ldr r3, _02227DC4 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	add r1, r1, #5
	bx r3
	nop
_02227DC4: .word sub_02024950
	thumb_func_end ov42_02227DB8

	thumb_func_start ov42_02227DC8
ov42_02227DC8: ; 0x02227DC8
	ldr r3, _02227DD4 ; =sub_02024950
	str r1, [r0, #0x10]
	ldr r0, [r0, #4]
	add r1, r1, #5
	bx r3
	nop
_02227DD4: .word sub_02024950
	thumb_func_end ov42_02227DC8

	thumb_func_start ov42_02227DD8
ov42_02227DD8: ; 0x02227DD8
	ldr r3, _02227DE4 ; =sub_020249B0
	mov r1, #2
	ldr r0, [r0, #4]
	lsl r1, r1, #0xc
	bx r3
	nop
_02227DE4: .word sub_020249B0
	thumb_func_end ov42_02227DD8

	thumb_func_start ov42_02227DE8
ov42_02227DE8: ; 0x02227DE8
	ldr r3, _02227DF4 ; =sub_020249B0
	mov r1, #2
	ldr r0, [r0, #4]
	lsl r1, r1, #0xc
	bx r3
	nop
_02227DF4: .word sub_020249B0
	thumb_func_end ov42_02227DE8

	thumb_func_start ov42_02227DF8
ov42_02227DF8: ; 0x02227DF8
	push {r3, lr}
	add r1, r0, #0
	mov r0, #0x14
	ldrsh r0, [r1, r0]
	cmp r0, #0
	ldr r0, [r1, #4]
	bne _02227E0E
	mov r1, #1
	bl sub_020249D4
	pop {r3, pc}
_02227E0E:
	ldr r1, [r1, #0x10]
	add r1, r1, #5
	bl Set2dSpriteAnimSeqNo
	pop {r3, pc}
	thumb_func_end ov42_02227DF8

	thumb_func_start ov42_02227E18
ov42_02227E18: ; 0x02227E18
	ldr r3, _02227E24 ; =sub_020249B0
	mov r1, #2
	ldr r0, [r0, #4]
	lsl r1, r1, #0xc
	bx r3
	nop
_02227E24: .word sub_020249B0
	thumb_func_end ov42_02227E18

	thumb_func_start ov42_02227E28
ov42_02227E28: ; 0x02227E28
	ldr r3, _02227E34 ; =sub_020249B0
	mov r1, #1
	ldr r0, [r0, #4]
	lsl r1, r1, #0xc
	bx r3
	nop
_02227E34: .word sub_020249B0
	thumb_func_end ov42_02227E28

	thumb_func_start ov42_02227E38
ov42_02227E38: ; 0x02227E38
	ldr r3, _02227E44 ; =sub_020249B0
	mov r1, #1
	ldr r0, [r0, #4]
	lsl r1, r1, #0xc
	bx r3
	nop
_02227E44: .word sub_020249B0
	thumb_func_end ov42_02227E38

	thumb_func_start ov42_02227E48
ov42_02227E48: ; 0x02227E48
	ldr r3, _02227E54 ; =sub_020249B0
	mov r1, #2
	ldr r0, [r0, #4]
	lsl r1, r1, #0xe
	bx r3
	nop
_02227E54: .word sub_020249B0
	thumb_func_end ov42_02227E48

	thumb_func_start ov42_02227E58
ov42_02227E58: ; 0x02227E58
	ldr r3, _02227E64 ; =sub_020249B0
	mov r1, #6
	ldr r0, [r0, #4]
	lsl r1, r1, #0xc
	bx r3
	nop
_02227E64: .word sub_020249B0
	thumb_func_end ov42_02227E58

	thumb_func_start ov42_02227E68
ov42_02227E68: ; 0x02227E68
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02227E72
	mov r0, #1
	bx lr
_02227E72:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov42_02227E68

	thumb_func_start ov42_02227E78
ov42_02227E78: ; 0x02227E78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	add r4, r2, #0
	bl sub_0200A828
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #1
	bl sub_0200B12C
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl sub_0200B12C
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r7, r0
	beq _02227EBC
	lsl r0, r4, #0x15
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	lsl r3, r7, #0x14
	ldr r0, [r5, #4]
	ldr r1, [r1, #0xc]
	mov r2, #2
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
_02227EBC:
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02227EDA
	lsl r0, r4, #0x15
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	lsl r3, r6, #0x14
	ldr r0, [r5, #4]
	ldr r1, [r1, #0xc]
	mov r2, #3
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
_02227EDA:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov42_02227E78

	thumb_func_start ov42_02227EE0
ov42_02227EE0: ; 0x02227EE0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r7, #0
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	bne _02227EF8
	bl GF_AssertFail
_02227EF8:
	strh r5, [r4]
	strh r6, [r4, #2]
	ldrh r2, [r4]
	ldrh r1, [r4, #2]
	add r0, r7, #0
	mul r1, r2
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r4, #4]
	cmp r0, #0
	bne _02227F14
	bl GF_AssertFail
_02227F14:
	ldrh r3, [r4]
	ldrh r2, [r4, #2]
	ldr r0, [r4, #4]
	mov r1, #0
	mul r2, r3
	lsl r2, r2, #2
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02227EE0

	thumb_func_start ov42_02227F28
ov42_02227F28: ; 0x02227F28
	push {r4, lr}
	add r4, r0, #0
	bne _02227F32
	bl GF_AssertFail
_02227F32:
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov42_02227F28

	thumb_func_start ov42_02227F40
ov42_02227F40: ; 0x02227F40
	ldrh r0, [r0]
	bx lr
	thumb_func_end ov42_02227F40

	thumb_func_start ov42_02227F44
ov42_02227F44: ; 0x02227F44
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end ov42_02227F44

	thumb_func_start ov42_02227F48
ov42_02227F48: ; 0x02227F48
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _02227F56
	bl GF_AssertFail
_02227F56:
	ldrh r3, [r4]
	ldrh r2, [r4, #2]
	ldr r0, [r4, #4]
	add r1, r5, #0
	mul r2, r3
	lsl r2, r2, #2
	bl memcpy
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02227F48

	thumb_func_start ov42_02227F68
ov42_02227F68: ; 0x02227F68
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _02227FA0 ; =ov42_02229E04
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	str r0, [sp]
	cmp r5, #0
	bne _02227F80
	bl GF_AssertFail
_02227F80:
	ldrh r2, [r5]
	cmp r2, r4
	bls _02227F9A
	ldrh r0, [r5, #2]
	cmp r0, r6
	bls _02227F9A
	add r0, r2, #0
	mul r0, r6
	add r0, r4, r0
	ldr r1, [r5, #4]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	str r0, [sp]
_02227F9A:
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02227FA0: .word ov42_02229E04
	thumb_func_end ov42_02227F68

	thumb_func_start ov42_02227FA4
ov42_02227FA4: ; 0x02227FA4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _02227FB6
	bl GF_AssertFail
_02227FB6:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov42_02227F68
	mov r1, #0
	mvn r1, r1
	str r0, [sp]
	str r0, [sp, #4]
	cmp r0, r1
	bne _02227FD2
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02227FD2:
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_02227FA4

	thumb_func_start ov42_02227FDC
ov42_02227FDC: ; 0x02227FDC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	cmp r5, #0
	bne _02227FEE
	bl GF_AssertFail
_02227FEE:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov42_02227F68
	mov r1, #0
	mvn r1, r1
	str r0, [sp]
	str r0, [sp, #4]
	cmp r0, r1
	bne _0222800A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222800A:
	lsr r0, r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02227FDC

	thumb_func_start ov42_02228010
ov42_02228010: ; 0x02228010
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	bne _02228026
	bl GF_AssertFail
_02228026:
	mov r1, #0x18
	add r0, r6, #0
	mul r1, r5
	str r5, [r4, #4]
	bl AllocFromHeap
	str r0, [r4]
	cmp r0, #0
	bne _0222803C
	bl GF_AssertFail
_0222803C:
	ldr r3, [r4, #4]
	mov r2, #0x18
	ldr r0, [r4]
	mov r1, #0
	mul r2, r3
	bl memset
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_02228010

	thumb_func_start ov42_02228050
ov42_02228050: ; 0x02228050
	push {r4, lr}
	add r4, r0, #0
	bne _0222805A
	bl GF_AssertFail
_0222805A:
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov42_02228050

	thumb_func_start ov42_02228068
ov42_02228068: ; 0x02228068
	push {r4, lr}
	add r4, r1, #0
	ldrb r1, [r4, #7]
	bl ov42_02228110
	add r1, r4, #0
	bl ov42_02228548
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_02228068

	thumb_func_start ov42_0222807C
ov42_0222807C: ; 0x0222807C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov42_022280A8
	add r5, r0, #0
	ldr r4, _022280A4 ; =0x00000000
	beq _022280A2
_0222808A:
	lsl r1, r4, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl ov42_02228148
	cmp r0, #0
	beq _0222809C
	bl ov42_02228574
_0222809C:
	add r4, r4, #1
	cmp r4, r5
	blo _0222808A
_022280A2:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022280A4: .word 0x00000000
	thumb_func_end ov42_0222807C

	thumb_func_start ov42_022280A8
ov42_022280A8: ; 0x022280A8
	push {r4, lr}
	add r4, r0, #0
	bne _022280B2
	bl GF_AssertFail
_022280B2:
	ldr r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_022280A8

	thumb_func_start ov42_022280B8
ov42_022280B8: ; 0x022280B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _022280C6
	bl GF_AssertFail
_022280C6:
	cmp r4, #0
	bne _022280CE
	bl GF_AssertFail
_022280CE:
	add r0, r5, #0
	bl ov42_022282B0
	mov r1, #0
	ldrsh r2, [r4, r1]
	strh r2, [r0, #4]
	mov r2, #2
	ldrsh r3, [r4, r2]
	strh r3, [r0, #6]
	ldrsh r1, [r4, r1]
	strh r1, [r0, #8]
	ldrsh r1, [r4, r2]
	strh r1, [r0, #0xa]
	ldrh r1, [r4, #4]
	strh r1, [r0, #0xc]
	ldrh r1, [r4, #6]
	strb r1, [r0, #0x15]
	ldrh r1, [r4, #8]
	strb r1, [r0, #0x14]
	ldrh r1, [r4, #0xa]
	strh r1, [r0, #0xe]
	mov r1, #1
	str r1, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov42_022280B8

	thumb_func_start ov42_02228100
ov42_02228100: ; 0x02228100
	mov r2, #0x18
	mov r1, #0
_02228104:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _02228104
	bx lr
	.balign 4, 0
	thumb_func_end ov42_02228100

	thumb_func_start ov42_02228110
ov42_02228110: ; 0x02228110
	push {r3, r4, r5, r6}
	ldr r5, [r0, #4]
	mov r2, #0
	cmp r5, #0
	bls _02228142
	ldr r4, [r0]
	add r3, r2, #0
	add r0, r4, #0
_02228120:
	ldr r6, [r0]
	cmp r6, #1
	bne _02228138
	add r6, r4, r3
	ldrh r6, [r6, #0xc]
	cmp r1, r6
	bne _02228138
	mov r0, #0x18
	mul r0, r2
	add r0, r4, r0
	pop {r3, r4, r5, r6}
	bx lr
_02228138:
	add r2, r2, #1
	add r0, #0x18
	add r3, #0x18
	cmp r2, r5
	blo _02228120
_02228142:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end ov42_02228110

	thumb_func_start ov42_02228148
ov42_02228148: ; 0x02228148
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02228156
	bl GF_AssertFail
_02228156:
	ldr r0, [r5, #4]
	cmp r4, r0
	blo _02228160
	bl GF_AssertFail
_02228160:
	ldr r2, [r5]
	mov r0, #0x18
	add r1, r4, #0
	mul r1, r0
	ldr r0, [r2, r1]
	cmp r0, #1
	bne _02228172
	add r0, r2, r1
	pop {r3, r4, r5, pc}
_02228172:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov42_02228148

	thumb_func_start ov42_02228178
ov42_02228178: ; 0x02228178
	ldr r3, _0222817C ; =ov42_02228110
	bx r3
	.balign 4, 0
_0222817C: .word ov42_02228110
	thumb_func_end ov42_02228178

	thumb_func_start ov42_02228180
ov42_02228180: ; 0x02228180
	ldr r3, _02228184 ; =ov42_02228148
	bx r3
	.balign 4, 0
_02228184: .word ov42_02228148
	thumb_func_end ov42_02228180

	thumb_func_start ov42_02228188
ov42_02228188: ; 0x02228188
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r6, r1, #0
	cmp r4, #0
	bne _02228196
	bl GF_AssertFail
_02228196:
	cmp r6, #0xa
	bhi _022281F0
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022281A6: ; jump table
	.short _022281BC - _022281A6 - 2 ; case 0
	.short _022281C2 - _022281A6 - 2 ; case 1
	.short _022281C8 - _022281A6 - 2 ; case 2
	.short _022281CE - _022281A6 - 2 ; case 3
	.short _022281D4 - _022281A6 - 2 ; case 4
	.short _022281D8 - _022281A6 - 2 ; case 5
	.short _022281DC - _022281A6 - 2 ; case 6
	.short _022281E0 - _022281A6 - 2 ; case 7
	.short _022281E4 - _022281A6 - 2 ; case 8
	.short _022281E8 - _022281A6 - 2 ; case 9
	.short _022281EC - _022281A6 - 2 ; case 10
_022281BC:
	mov r0, #4
	ldrsh r5, [r4, r0]
	b _022281F4
_022281C2:
	mov r0, #6
	ldrsh r5, [r4, r0]
	b _022281F4
_022281C8:
	mov r0, #8
	ldrsh r5, [r4, r0]
	b _022281F4
_022281CE:
	mov r0, #0xa
	ldrsh r5, [r4, r0]
	b _022281F4
_022281D4:
	ldrh r5, [r4, #0xc]
	b _022281F4
_022281D8:
	ldrb r5, [r4, #0x15]
	b _022281F4
_022281DC:
	ldrb r5, [r4, #0x14]
	b _022281F4
_022281E0:
	ldrh r5, [r4, #0xe]
	b _022281F4
_022281E4:
	ldrh r5, [r4, #0x10]
	b _022281F4
_022281E8:
	ldrh r5, [r4, #0x12]
	b _022281F4
_022281EC:
	ldrh r5, [r4, #0x16]
	b _022281F4
_022281F0:
	bl GF_AssertFail
_022281F4:
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02228188

	thumb_func_start ov42_022281F8
ov42_022281F8: ; 0x022281F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02228208
	bl GF_AssertFail
_02228208:
	cmp r6, #0xa
	bhi _0222826A
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228218: ; jump table
	.short _0222822E - _02228218 - 2 ; case 0
	.short _02228232 - _02228218 - 2 ; case 1
	.short _02228236 - _02228218 - 2 ; case 2
	.short _0222823A - _02228218 - 2 ; case 3
	.short _0222823E - _02228218 - 2 ; case 4
	.short _02228242 - _02228218 - 2 ; case 5
	.short _0222824E - _02228218 - 2 ; case 6
	.short _0222825A - _02228218 - 2 ; case 7
	.short _0222825E - _02228218 - 2 ; case 8
	.short _02228262 - _02228218 - 2 ; case 9
	.short _02228266 - _02228218 - 2 ; case 10
_0222822E:
	strh r4, [r5, #4]
	pop {r4, r5, r6, pc}
_02228232:
	strh r4, [r5, #6]
	pop {r4, r5, r6, pc}
_02228236:
	strh r4, [r5, #8]
	pop {r4, r5, r6, pc}
_0222823A:
	strh r4, [r5, #0xa]
	pop {r4, r5, r6, pc}
_0222823E:
	strh r4, [r5, #0xc]
	pop {r4, r5, r6, pc}
_02228242:
	cmp r4, #0xc
	blt _0222824A
	bl GF_AssertFail
_0222824A:
	strb r4, [r5, #0x15]
	pop {r4, r5, r6, pc}
_0222824E:
	cmp r4, #4
	blt _02228256
	bl GF_AssertFail
_02228256:
	strb r4, [r5, #0x14]
	pop {r4, r5, r6, pc}
_0222825A:
	strh r4, [r5, #0xe]
	pop {r4, r5, r6, pc}
_0222825E:
	strh r4, [r5, #0x10]
	pop {r4, r5, r6, pc}
_02228262:
	strh r4, [r5, #0x12]
	pop {r4, r5, r6, pc}
_02228266:
	strh r4, [r5, #0x16]
	pop {r4, r5, r6, pc}
_0222826A:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_022281F8

	thumb_func_start ov42_02228270
ov42_02228270: ; 0x02228270
	push {r0, r1, r2, r3}
	lsl r0, r1, #1
	add r2, sp, #0
	mov r1, #0
	ldrsh r3, [r2, r1]
	ldr r1, _0222829C ; =ov42_02229E0C
	ldrsb r1, [r1, r0]
	add r1, r3, r1
	strh r1, [r2]
	mov r1, #2
	ldrsh r3, [r2, r1]
	ldr r1, _022282A0 ; =ov42_02229E0D
	ldrsb r0, [r1, r0]
	add r0, r3, r0
	strh r0, [r2, #2]
	ldrh r1, [r2, #2]
	ldrh r0, [r2]
	lsl r1, r1, #0x10
	orr r0, r1
	add sp, #0x10
	bx lr
	nop
_0222829C: .word ov42_02229E0C
_022282A0: .word ov42_02229E0D
	thumb_func_end ov42_02228270

	thumb_func_start ov42_022282A4
ov42_022282A4: ; 0x022282A4
	ldr r1, _022282AC ; =ov42_02229E08
	ldrb r0, [r1, r0]
	bx lr
	nop
_022282AC: .word ov42_02229E08
	thumb_func_end ov42_022282A4

	thumb_func_start ov42_022282B0
ov42_022282B0: ; 0x022282B0
	push {r4, lr}
	ldr r4, [r0, #4]
	mov r1, #0
	cmp r4, #0
	bls _022282D4
	ldr r3, [r0]
	add r2, r3, #0
_022282BE:
	ldr r0, [r2]
	cmp r0, #0
	bne _022282CC
	mov r0, #0x18
	mul r0, r1
	add r0, r3, r0
	pop {r4, pc}
_022282CC:
	add r1, r1, #1
	add r2, #0x18
	cmp r1, r4
	blo _022282BE
_022282D4:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov42_022282B0

	thumb_func_start ov42_022282DC
ov42_022282DC: ; 0x022282DC
	ldrh r1, [r0, #6]
	ldrh r0, [r0, #4]
	lsl r1, r1, #0x10
	orr r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov42_022282DC

	thumb_func_start ov42_022282E8
ov42_022282E8: ; 0x022282E8
	ldrh r1, [r0, #0xa]
	ldrh r0, [r0, #8]
	lsl r1, r1, #0x10
	orr r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov42_022282E8

	thumb_func_start ov42_022282F4
ov42_022282F4: ; 0x022282F4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r1, #8
	bl ov42_02228188
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #9
	bl ov42_02228188
	add r6, r0, #0
	add r0, r5, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	add r0, r5, #0
	bl ov42_022282E8
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r2, #8
	strh r0, [r1, #8]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0xa]
	mov r0, #0xc
	ldrsh r3, [r1, r0]
	ldrsh r2, [r1, r2]
	sub r2, r3, r2
	strh r2, [r1, #0xc]
	mov r2, #0xa
	ldrsh r5, [r1, r2]
	mov r2, #0xe
	ldrsh r2, [r1, r2]
	sub r2, r2, r5
	strh r2, [r1, #0xe]
	cmp r4, #0
	ble _02228372
	ldrsh r0, [r1, r0]
	add r1, r6, #0
	mul r0, r4
	bl _s32_div_f
	add r1, sp, #0
	strh r0, [r1, #0xc]
	mov r0, #0xe
	ldrsh r0, [r1, r0]
	add r1, r6, #0
	mul r0, r4
	bl _s32_div_f
	add r1, sp, #0
	b _02228376
_02228372:
	mov r0, #0
	strh r0, [r1, #0xc]
_02228376:
	strh r0, [r1, #0xe]
	add r1, sp, #0
	mov r0, #0xc
	ldrsh r2, [r1, r0]
	mov r0, #8
	ldrsh r0, [r1, r0]
	add r0, r2, r0
	strh r0, [r1, #0xc]
	mov r0, #0xe
	ldrsh r0, [r1, r0]
	add r0, r0, r5
	strh r0, [r1, #0xe]
	ldrh r2, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	lsl r1, r2, #0x10
	orr r0, r1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_022282F4

	thumb_func_start ov42_0222839C
ov42_0222839C: ; 0x0222839C
	push {r0, r1, r2, r3}
	add r1, sp, #0
	ldrh r2, [r1, #4]
	strh r2, [r0, #4]
	ldrh r1, [r1, #6]
	strh r1, [r0, #6]
	add sp, #0x10
	bx lr
	thumb_func_end ov42_0222839C

	thumb_func_start ov42_022283AC
ov42_022283AC: ; 0x022283AC
	push {r0, r1, r2, r3}
	add r1, sp, #0
	ldrh r2, [r1, #4]
	strh r2, [r0, #8]
	ldrh r1, [r1, #6]
	strh r1, [r0, #0xa]
	add sp, #0x10
	bx lr
	thumb_func_end ov42_022283AC

	thumb_func_start ov42_022283BC
ov42_022283BC: ; 0x022283BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	str r1, [sp]
	add r4, r2, #0
	bl ov42_022282DC
	add r1, sp, #0x10
	strh r0, [r1, #0xc]
	lsr r0, r0, #0x10
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	mov r2, sp
	sub r2, r2, #4
	strh r0, [r1, #0x1c]
	ldrh r0, [r1, #0xe]
	strh r0, [r1, #0x1e]
	ldrh r0, [r1, #0x1c]
	strh r0, [r2]
	ldrh r0, [r1, #0x1e]
	add r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r1, sp, #0x10
	strh r0, [r1, #8]
	lsr r0, r0, #0x10
	strh r0, [r1, #0xa]
	ldrh r0, [r1, #8]
	strh r0, [r1, #0x14]
	ldrh r0, [r1, #0xa]
	strh r0, [r1, #0x16]
	add r0, r5, #0
	mov r1, #4
	bl ov42_02228188
	str r0, [sp, #4]
	ldr r0, [sp]
	bl ov42_022280A8
	mov r5, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _0222849C
	add r4, sp, #0x10
	mov r0, #0x16
	ldrsh r7, [r4, r0]
	mov r0, #0x14
	ldrsh r0, [r4, r0]
	str r0, [sp, #0xc]
_02228422:
	lsl r1, r5, #0x10
	ldr r0, [sp]
	lsr r1, r1, #0x10
	bl ov42_02228180
	add r6, r0, #0
	beq _02228494
	mov r1, #4
	bl ov42_02228188
	ldr r1, [sp, #4]
	cmp r0, r1
	beq _02228494
	add r0, r6, #0
	bl ov42_022282DC
	strh r0, [r4, #4]
	lsr r0, r0, #0x10
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	strh r0, [r4, #0x18]
	ldrh r0, [r4, #6]
	strh r0, [r4, #0x1a]
	mov r0, #0x18
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _02228468
	mov r0, #0x1a
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228468
	add sp, #0x30
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02228468:
	add r0, r6, #0
	bl ov42_022282E8
	strh r0, [r4]
	lsr r0, r0, #0x10
	strh r0, [r4, #2]
	ldrh r0, [r4]
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #2]
	strh r0, [r4, #0x12]
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bne _02228494
	mov r0, #0x12
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228494
	add sp, #0x30
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02228494:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blo _02228422
_0222849C:
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov42_022283BC

	thumb_func_start ov42_022284A4
ov42_022284A4: ; 0x022284A4
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r2, sp, #0x30
	mov r1, #6
	str r0, [sp]
	ldrsh r6, [r2, r1]
	bl ov42_022280A8
	mov r5, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _0222853C
	add r1, sp, #0x30
	mov r0, #4
	ldrsh r7, [r1, r0]
	add r4, sp, #0xc
_022284C6:
	lsl r1, r5, #0x10
	ldr r0, [sp]
	lsr r1, r1, #0x10
	bl ov42_02228180
	str r0, [sp, #4]
	cmp r0, #0
	beq _02228534
	bl ov42_022282DC
	strh r0, [r4, #4]
	lsr r0, r0, #0x10
	strh r0, [r4, #6]
	ldrh r0, [r4, #4]
	strh r0, [r4, #0xc]
	ldrh r0, [r4, #6]
	strh r0, [r4, #0xe]
	mov r0, #0xc
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228504
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	cmp r0, r6
	bne _02228504
	ldr r0, [sp, #4]
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_02228504:
	ldr r0, [sp, #4]
	bl ov42_022282E8
	strh r0, [r4]
	lsr r0, r0, #0x10
	strh r0, [r4, #2]
	ldrh r0, [r4]
	strh r0, [r4, #8]
	ldrh r0, [r4, #2]
	strh r0, [r4, #0xa]
	mov r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, r7
	bne _02228534
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, r6
	bne _02228534
	ldr r0, [sp, #4]
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
_02228534:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blo _022284C6
_0222853C:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022284A4

	thumb_func_start ov42_02228548
ov42_02228548: ; 0x02228548
	push {r3, r4, r5, lr}
	add r3, r1, #0
	ldrh r1, [r3]
	mov r2, sp
	sub r2, r2, #4
	strh r1, [r2]
	ldrh r1, [r3, #2]
	add r4, r0, #0
	strh r1, [r2, #2]
	ldr r1, [r2]
	ldrb r2, [r3, #6]
	ldrh r3, [r3, #4]
	lsl r5, r3, #2
	ldr r3, _02228570 ; =ov42_02229E14
	ldr r3, [r3, r5]
	blx r3
	mov r0, #0
	strh r0, [r4, #0x16]
	pop {r3, r4, r5, pc}
	nop
_02228570: .word ov42_02229E14
	thumb_func_end ov42_02228548

	thumb_func_start ov42_02228574
ov42_02228574: ; 0x02228574
	push {r4, lr}
	mov r1, #5
	add r4, r0, #0
	bl ov42_02228188
	add r1, r0, #0
	lsl r2, r1, #2
	ldr r1, _022285A0 ; =ov42_02229E44
	add r0, r4, #0
	ldr r1, [r1, r2]
	blx r1
	ldrh r1, [r4, #0x16]
	add r1, r1, #1
	strh r1, [r4, #0x16]
	cmp r0, #1
	bne _0222859E
	add r0, r4, #0
	bl ov42_02228C40
	mov r0, #0
	strh r0, [r4, #0x16]
_0222859E:
	pop {r4, pc}
	.balign 4, 0
_022285A0: .word ov42_02229E44
	thumb_func_end ov42_02228574

	thumb_func_start ov42_022285A4
ov42_022285A4: ; 0x022285A4
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _022285B4
	bl GF_AssertFail
_022285B4:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022285A4

	thumb_func_start ov42_022285FC
ov42_022285FC: ; 0x022285FC
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _0222860C
	bl GF_AssertFail
_0222860C:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #1
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #2
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022285FC

	thumb_func_start ov42_02228668
ov42_02228668: ; 0x02228668
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _0222867A
	bl GF_AssertFail
_0222867A:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	add r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #2
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #8
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov42_02228668

	thumb_func_start ov42_02228700
ov42_02228700: ; 0x02228700
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02228712
	bl GF_AssertFail
_02228712:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	add r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #3
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #4
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov42_02228700

	thumb_func_start ov42_02228798
ov42_02228798: ; 0x02228798
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _022287A8
	bl GF_AssertFail
_022287A8:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #4
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228798

	thumb_func_start ov42_022287F0
ov42_022287F0: ; 0x022287F0
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02228800
	bl GF_AssertFail
_02228800:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	mov r1, #5
	add r0, r5, #0
	add r2, r1, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #0x10
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022287F0

	thumb_func_start ov42_0222885C
ov42_0222885C: ; 0x0222885C
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _0222886E
	bl GF_AssertFail
_0222886E:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	add r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #6
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #0x10
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov42_0222885C

	thumb_func_start ov42_022288F4
ov42_022288F4: ; 0x022288F4
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02228906
	bl GF_AssertFail
_02228906:
	add r0, sp, #0x18
	ldrh r1, [r0, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r1, [r2]
	ldrh r0, [r0, #6]
	add r1, r4, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228BDC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #7
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #4
	bl ov42_022281F8
	add sp, #8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end ov42_022288F4

	thumb_func_start ov42_0222898C
ov42_0222898C: ; 0x0222898C
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _0222899C
	bl GF_AssertFail
_0222899C:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #8
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #2
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_0222898C

	thumb_func_start ov42_022289F8
ov42_022289F8: ; 0x022289F8
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02228A08
	bl GF_AssertFail
_02228A08:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #9
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #4
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022289F8

	thumb_func_start ov42_02228A64
ov42_02228A64: ; 0x02228A64
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02228A74
	bl GF_AssertFail
_02228A74:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #0xa
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #8
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228A64

	thumb_func_start ov42_02228AD0
ov42_02228AD0: ; 0x02228AD0
	push {r0, r1, r2, r3}
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r5, #0
	bne _02228AE0
	bl GF_AssertFail
_02228AE0:
	add r1, sp, #0x10
	ldrh r2, [r1, #4]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r1, [r1, #6]
	add r0, r5, #0
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
	add r1, sp, #0x10
	mov r3, sp
	ldrh r2, [r1, #4]
	sub r3, r3, #4
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_0222839C
	add r0, r5, #0
	mov r1, #6
	add r2, r4, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #5
	mov r2, #0xb
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #8
	mov r2, #0
	bl ov42_022281F8
	add r0, r5, #0
	mov r1, #9
	mov r2, #0x10
	bl ov42_022281F8
	pop {r3, r4, r5}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228AD0

	thumb_func_start ov42_02228B3C
ov42_02228B3C: ; 0x02228B3C
	mov r0, #0
	bx lr
	thumb_func_end ov42_02228B3C

	thumb_func_start ov42_02228B40
ov42_02228B40: ; 0x02228B40
	ldr r3, _02228B44 ; =ov42_02228C0C
	bx r3
	.balign 4, 0
_02228B44: .word ov42_02228C0C
	thumb_func_end ov42_02228B40

	thumb_func_start ov42_02228B48
ov42_02228B48: ; 0x02228B48
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov42_02228C0C
	add r4, r0, #0
	cmp r4, #1
	bne _02228B82
	add r0, r5, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
_02228B82:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228B48

	thumb_func_start ov42_02228B88
ov42_02228B88: ; 0x02228B88
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov42_02228C0C
	add r4, r0, #0
	cmp r4, #1
	bne _02228BC2
	add r0, r5, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	mov r3, sp
	sub r3, r3, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	ldrh r2, [r1, #4]
	add r0, r5, #0
	strh r2, [r3]
	ldrh r1, [r1, #6]
	strh r1, [r3, #2]
	ldr r1, [r3]
	bl ov42_022283AC
_02228BC2:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228B88

	thumb_func_start ov42_02228BC8
ov42_02228BC8: ; 0x02228BC8
	mov r0, #0
	bx lr
	thumb_func_end ov42_02228BC8

	thumb_func_start ov42_02228BCC
ov42_02228BCC: ; 0x02228BCC
	ldr r3, _02228BD0 ; =ov42_02228C0C
	bx r3
	.balign 4, 0
_02228BD0: .word ov42_02228C0C
	thumb_func_end ov42_02228BCC

	thumb_func_start ov42_02228BD4
ov42_02228BD4: ; 0x02228BD4
	ldr r3, _02228BD8 ; =ov42_02228C0C
	bx r3
	.balign 4, 0
_02228BD8: .word ov42_02228C0C
	thumb_func_end ov42_02228BD4

	thumb_func_start ov42_02228BDC
ov42_02228BDC: ; 0x02228BDC
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	ldrh r2, [r0]
	mov r3, sp
	sub r3, r3, #4
	strh r2, [r3]
	ldrh r0, [r0, #2]
	strh r0, [r3, #2]
	ldr r0, [r3]
	bl ov42_02228270
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r2, [r1, #2]
	ldrh r0, [r1]
	lsl r1, r2, #0x10
	orr r0, r1
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02228BDC

	thumb_func_start ov42_02228C0C
ov42_02228C0C: ; 0x02228C0C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r1, #8
	bl ov42_02228188
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #9
	bl ov42_02228188
	add r6, r0, #0
	cmp r4, r6
	bge _02228C3A
	add r0, r5, #0
	mov r1, #8
	add r2, r4, #1
	bl ov42_022281F8
	add r0, r4, #1
	cmp r0, r6
	bge _02228C3A
	mov r0, #0
	pop {r4, r5, r6, pc}
_02228C3A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_02228C0C

	thumb_func_start ov42_02228C40
ov42_02228C40: ; 0x02228C40
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	add r0, r4, #0
	mov r1, #6
	bl ov42_02228188
	add r1, sp, #0
	add r2, r0, #0
	add r0, r4, #0
	mov r4, sp
	ldrh r3, [r1, #4]
	sub r4, r4, #4
	strh r3, [r4]
	ldrh r1, [r1, #6]
	strh r1, [r4, #2]
	ldr r1, [r4]
	bl ov42_022285A4
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_02228C40

	thumb_func_start ov42_02228C80
ov42_02228C80: ; 0x02228C80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r7, #0
	bne _02228C94
	bl GF_AssertFail
_02228C94:
	cmp r5, #0
	bne _02228C9C
	bl GF_AssertFail
_02228C9C:
	cmp r4, #0
	bne _02228CA4
	bl GF_AssertFail
_02228CA4:
	cmp r6, #0
	bne _02228CAC
	bl GF_AssertFail
_02228CAC:
	ldrb r1, [r4, #3]
	add r0, r5, #0
	bl ov42_02228178
	str r0, [sp, #4]
	cmp r0, #0
	bne _02228CBE
	bl GF_AssertFail
_02228CBE:
	str r6, [sp]
	add r3, r4, #0
	ldrh r4, [r4]
	add r2, r5, #0
	ldr r0, [sp, #4]
	lsl r5, r4, #2
	ldr r4, _02228CD8 ; =ov42_02229E74
	add r1, r7, #0
	ldr r4, [r4, r5]
	blx r4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228CD8: .word ov42_02229E74
	thumb_func_end ov42_02228C80

	thumb_func_start ov42_02228CDC
ov42_02228CDC: ; 0x02228CDC
	push {r3, r4, r5, lr}
	mov r1, #5
	add r5, r0, #0
	add r4, r3, #0
	bl ov42_02228188
	cmp r0, #0
	beq _02228CF0
	cmp r0, #4
	bne _02228D04
_02228CF0:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x10]
	bl ov42_02228EB0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02228D04:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228CDC

	thumb_func_start ov42_02228D08
ov42_02228D08: ; 0x02228D08
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r1, #5
	add r4, r3, #0
	bl ov42_02228188
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #6
	bl ov42_02228188
	cmp r6, #0
	bne _02228D3E
	ldrb r1, [r4, #2]
	cmp r0, r1
	beq _02228D3E
	str r1, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl ov42_02228EB0
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02228D3E:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov42_02228D08

	thumb_func_start ov42_02228D44
ov42_02228D44: ; 0x02228D44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	mov r1, #5
	add r5, r0, #0
	str r2, [sp, #4]
	add r4, r3, #0
	bl ov42_02228188
	add r6, r0, #0
	bne _02228D8C
	ldrb r2, [r4, #2]
	add r0, r5, #0
	add r1, r7, #0
	bl ov42_02228E34
	cmp r0, #1
	beq _02228D8C
	ldrb r2, [r4, #2]
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl ov42_02228E9C
	cmp r0, #1
	beq _02228D8C
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x20]
	bl ov42_02228EB0
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228D8C:
	cmp r6, #0
	bne _02228DB2
	add r0, r5, #0
	mov r1, #0xa
	bl ov42_02228188
	cmp r0, #8
	blt _02228DB2
	ldrb r0, [r4, #2]
	add r1, r5, #0
	mov r2, #5
	str r0, [sp]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x20]
	bl ov42_02228EB0
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02228DB2:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02228D44

	thumb_func_start ov42_02228DB8
ov42_02228DB8: ; 0x02228DB8
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl ov42_02228D44
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov42_02228DB8

	thumb_func_start ov42_02228DC8
ov42_02228DC8: ; 0x02228DC8
	push {r3, r4, r5, lr}
	mov r1, #5
	add r5, r0, #0
	add r4, r3, #0
	bl ov42_02228188
	cmp r0, #0
	bne _02228DEC
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x10]
	bl ov42_02228EB0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02228DEC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228DC8

	thumb_func_start ov42_02228DF0
ov42_02228DF0: ; 0x02228DF0
	push {r3, lr}
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov42_02228DF0

	thumb_func_start ov42_02228DFC
ov42_02228DFC: ; 0x02228DFC
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	bl ov42_02228D44
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov42_02228DFC

	thumb_func_start ov42_02228E0C
ov42_02228E0C: ; 0x02228E0C
	push {r3, r4, r5, lr}
	mov r1, #5
	add r5, r0, #0
	add r4, r3, #0
	bl ov42_02228188
	cmp r0, #0
	bne _02228E30
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrh r2, [r4]
	ldrb r3, [r4, #3]
	ldr r0, [sp, #0x10]
	bl ov42_02228EB0
	mov r0, #1
	pop {r3, r4, r5, pc}
_02228E30:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02228E0C

	thumb_func_start ov42_02228E34
ov42_02228E34: ; 0x02228E34
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r2, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	mov r2, sp
	sub r2, r2, #4
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldrh r0, [r1, #0xc]
	strh r0, [r2]
	ldrh r0, [r1, #0xe]
	add r1, r5, #0
	strh r0, [r2, #2]
	ldr r0, [r2]
	bl ov42_02228270
	add r2, sp, #0
	strh r0, [r2]
	lsr r0, r0, #0x10
	strh r0, [r2, #2]
	ldrh r0, [r2]
	mov r1, #8
	strh r0, [r2, #8]
	ldrh r0, [r2, #2]
	strh r0, [r2, #0xa]
	ldrsh r3, [r2, r1]
	add r0, r4, #0
	asr r1, r3, #3
	lsr r1, r1, #0x1c
	add r1, r3, r1
	mov r3, #0xa
	ldrsh r3, [r2, r3]
	lsl r1, r1, #0xc
	lsr r1, r1, #0x10
	asr r2, r3, #3
	lsr r2, r2, #0x1c
	add r2, r3, r2
	lsl r2, r2, #0xc
	lsr r2, r2, #0x10
	bl ov42_02227FA4
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov42_02228E34

	thumb_func_start ov42_02228E9C
ov42_02228E9C: ; 0x02228E9C
	push {r3, lr}
	bl ov42_022283BC
	cmp r0, #0
	beq _02228EAA
	mov r0, #1
	pop {r3, pc}
_02228EAA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov42_02228E9C

	thumb_func_start ov42_02228EB0
ov42_02228EB0: ; 0x02228EB0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r5]
	ldrh r0, [r1, #2]
	strh r0, [r5, #2]
	strh r4, [r5, #4]
	ldr r0, [sp, #0x18]
	strb r6, [r5, #7]
	strb r0, [r5, #6]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov42_02228EB0

	thumb_func_start ov42_02228EDC
ov42_02228EDC: ; 0x02228EDC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	str r1, [sp]
	ldr r0, [sp, #0x18]
	mov r1, #0xc
	add r5, r2, #0
	add r6, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	ldr r1, [sp]
	ldr r3, [sp, #0x18]
	add r0, r7, #0
	add r2, r5, #0
	bl ov42_02227060
	str r0, [r4]
	strh r5, [r4, #8]
	ldrh r2, [r4, #8]
	mov r1, #0x14
	ldr r0, [sp, #0x18]
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldrh r3, [r4, #8]
	mov r2, #0x14
	mov r1, #0
	mul r2, r3
	bl memset
	mov r0, #2
	strb r0, [r4, #0xa]
	strb r6, [r4, #0xb]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02228EDC

	thumb_func_start ov42_02228F24
ov42_02228F24: ; 0x02228F24
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, [sp, #0x28]
	add r7, r0, #0
	str r1, [sp, #4]
	add r0, r5, #0
	mov r1, #0xc
	add r6, r2, #0
	str r3, [sp, #8]
	bl AllocFromHeap
	add r4, r0, #0
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl ov42_02227060
	str r0, [r4]
	strh r6, [r4, #8]
	ldrh r2, [r4, #8]
	mov r1, #0x14
	add r0, r5, #0
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldrh r3, [r4, #8]
	mov r2, #0x14
	mov r1, #0
	mul r2, r3
	bl memset
	mov r0, #2
	strb r0, [r4, #0xa]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #8]
	strb r0, [r4, #0xb]
	str r5, [sp]
	ldrb r2, [r4, #0xb]
	ldr r0, [r4]
	ldr r3, [sp, #0x20]
	bl ov42_02227194
	ldrb r1, [r4, #0xb]
	ldr r0, [r4]
	ldr r2, _02228F90 ; =0x00009C41
	add r3, r5, #0
	bl ov42_0222729C
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02228F90: .word 0x00009C41
	thumb_func_end ov42_02228F24

	thumb_func_start ov42_02228F94
ov42_02228F94: ; 0x02228F94
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #8]
	mov r6, #0
	cmp r0, #0
	ble _02228FC0
	add r4, r6, #0
_02228FA2:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ov42_02229274
	cmp r0, #0
	bne _02228FB6
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ov42_022290C4
_02228FB6:
	ldrh r0, [r5, #8]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _02228FA2
_02228FC0:
	ldr r0, [r5]
	bl ov42_022272B4
	add r0, r5, #0
	bl ov42_0222901C
	ldr r0, [r5]
	bl ov42_02227114
	ldr r0, [r5, #4]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02228F94

	thumb_func_start ov42_02228FE0
ov42_02228FE0: ; 0x02228FE0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl ov42_022271E4
	cmp r0, #0
	bne _02229002
	str r4, [sp]
	ldrb r2, [r5, #0xb]
	ldr r0, [r5]
	add r1, r6, #0
	add r3, r7, #0
	bl ov42_02227194
_02229002:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02228FE0

	thumb_func_start ov42_02229004
ov42_02229004: ; 0x02229004
	ldr r3, _0222900C ; =ov42_022271D0
	ldr r0, [r0]
	bx r3
	nop
_0222900C: .word ov42_022271D0
	thumb_func_end ov42_02229004

	thumb_func_start ov42_02229010
ov42_02229010: ; 0x02229010
	ldr r3, _02229018 ; =ov42_022271E4
	ldr r0, [r0]
	bx r3
	nop
_02229018: .word ov42_022271E4
	thumb_func_end ov42_02229010

	thumb_func_start ov42_0222901C
ov42_0222901C: ; 0x0222901C
	ldr r3, _02229024 ; =ov42_022271F8
	ldr r0, [r0]
	bx r3
	nop
_02229024: .word ov42_022271F8
	thumb_func_end ov42_0222901C

	thumb_func_start ov42_02229028
ov42_02229028: ; 0x02229028
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrb r1, [r5, #0xb]
	add r3, r2, #0
	ldr r0, [r5]
	add r2, r4, #0
	bl ov42_02227228
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02229028

	thumb_func_start ov42_0222903C
ov42_0222903C: ; 0x0222903C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	str r3, [sp]
	bl ov42_02229284
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #5
	bl ov42_02228188
	strh r0, [r4, #8]
	add r0, r5, #0
	mov r1, #6
	bl ov42_02228188
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #4
	bl ov42_02228188
	strh r0, [r4, #0xc]
	str r5, [r4]
	strb r7, [r4, #0x12]
	mov r0, #1
	strb r0, [r4, #0x13]
	mov r1, #0
	strh r1, [r4, #0xe]
	add r0, r5, #0
	strh r1, [r4, #0x10]
	bl ov42_02228188
	add r1, sp, #4
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #1
	bl ov42_02228188
	add r1, sp, #4
	strh r0, [r1, #2]
	mov r0, #2
	ldrsh r0, [r1, r0]
	ldrb r1, [r4, #0x12]
	bl ov42_0222922C
	add r1, sp, #4
	strh r0, [r1, #4]
	ldrb r0, [r6, #0xa]
	strh r0, [r1, #6]
	add r0, r5, #0
	mov r1, #7
	bl ov42_02228188
	add r2, r0, #0
	ldr r0, [r6]
	ldr r3, [sp]
	add r1, sp, #4
	bl ov42_022272BC
	str r0, [r4, #4]
	add r0, r4, #0
	bl ov42_0222910C
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov42_0222903C

	thumb_func_start ov42_022290C4
ov42_022290C4: ; 0x022290C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov42_0222740C
	mov r1, #0x14
	mov r0, #0
_022290D2:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _022290D2
	pop {r4, pc}
	thumb_func_end ov42_022290C4

	thumb_func_start ov42_022290DC
ov42_022290DC: ; 0x022290DC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #8]
	mov r6, #0
	cmp r0, #0
	ble _02229108
	add r4, r6, #0
_022290EA:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ov42_02229274
	cmp r0, #0
	bne _022290FE
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ov42_0222910C
_022290FE:
	ldrh r0, [r5, #8]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _022290EA
_02229108:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_022290DC

	thumb_func_start ov42_0222910C
ov42_0222910C: ; 0x0222910C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldrb r0, [r5, #0x13]
	cmp r0, #0
	beq _02229196
	ldr r0, [r5]
	mov r1, #5
	bl ov42_02228188
	add r6, r0, #0
	ldr r0, [r5]
	mov r1, #6
	bl ov42_02228188
	add r4, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl ov42_02228188
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	ldrh r0, [r5, #8]
	cmp r0, r6
	bne _02229148
	ldrh r0, [r5, #0xa]
	cmp r0, r4
	bne _02229148
	cmp r1, #0
	bne _0222915E
_02229148:
	strh r6, [r5, #8]
	strh r4, [r5, #0xa]
	ldr r0, [r5, #4]
	add r1, r6, #0
	bl ov42_022292BC
	add r1, r0, #0
	add r0, r5, #0
	add r2, r4, #0
	bl ov42_02229308
_0222915E:
	add r1, sp, #0
	add r0, r5, #0
	add r1, #2
	add r2, sp, #0
	bl ov42_022292D8
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, #4]
	bl ov42_02227434
	add r1, sp, #0
	mov r0, #0
	ldrsh r0, [r1, r0]
	ldrb r1, [r5, #0x12]
	bl ov42_0222922C
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, [r5, #4]
	bl ov42_02227474
	ldr r0, [r5, #4]
	bl ov42_02227538
_02229196:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_0222910C

	thumb_func_start ov42_0222919C
ov42_0222919C: ; 0x0222919C
	strb r1, [r0, #0x13]
	bx lr
	thumb_func_end ov42_0222919C

	thumb_func_start ov42_022291A0
ov42_022291A0: ; 0x022291A0
	ldr r3, _022291A8 ; =ov42_02229308
	mov r1, #1
	ldrh r2, [r0, #0xa]
	bx r3
	.balign 4, 0
_022291A8: .word ov42_02229308
	thumb_func_end ov42_022291A0

	thumb_func_start ov42_022291AC
ov42_022291AC: ; 0x022291AC
	ldr r3, _022291B4 ; =ov42_02227538
	ldr r0, [r0, #4]
	bx r3
	nop
_022291B4: .word ov42_02227538
	thumb_func_end ov42_022291AC

	thumb_func_start ov42_022291B8
ov42_022291B8: ; 0x022291B8
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #8]
	ldr r0, [r4, #4]
	bl ov42_022292BC
	add r1, r0, #0
	ldrh r2, [r4, #0xa]
	add r0, r4, #0
	bl ov42_02229308
	add r0, r4, #0
	bl ov42_0222910C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_022291B8

	thumb_func_start ov42_022291D8
ov42_022291D8: ; 0x022291D8
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r3, sp, #8
	mov r1, #4
	mov r2, #6
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r0, #4]
	bl ov42_02227434
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_022291D8

	thumb_func_start ov42_022291F4
ov42_022291F4: ; 0x022291F4
	ldr r3, _022291FC ; =ov42_022274AC
	ldr r0, [r0, #4]
	bx r3
	nop
_022291FC: .word ov42_022274AC
	thumb_func_end ov42_022291F4

	thumb_func_start ov42_02229200
ov42_02229200: ; 0x02229200
	ldr r3, _02229208 ; =ov42_02227490
	ldr r0, [r0, #4]
	bx r3
	nop
_02229208: .word ov42_02227490
	thumb_func_end ov42_02229200

	thumb_func_start ov42_0222920C
ov42_0222920C: ; 0x0222920C
	ldr r3, _02229214 ; =ov42_02227480
	ldr r0, [r0, #4]
	bx r3
	nop
_02229214: .word ov42_02227480
	thumb_func_end ov42_0222920C

	thumb_func_start ov42_02229218
ov42_02229218: ; 0x02229218
	push {r4, lr}
	add r2, r1, #0
	add r4, r0, #0
	mov r1, #0
	bl ov42_02229308
	ldr r0, [r4, #4]
	bl ov42_02227538
	pop {r4, pc}
	thumb_func_end ov42_02229218

	thumb_func_start ov42_0222922C
ov42_0222922C: ; 0x0222922C
	cmp r1, #1
	bne _02229238
	lsl r1, r0, #1
	ldr r0, _02229240 ; =0x00009C40
	sub r0, r0, r1
	bx lr
_02229238:
	lsl r1, r0, #1
	ldr r0, _02229244 ; =0x00009C41
	sub r0, r0, r1
	bx lr
	.balign 4, 0
_02229240: .word 0x00009C40
_02229244: .word 0x00009C41
	thumb_func_end ov42_0222922C

	thumb_func_start ov42_02229248
ov42_02229248: ; 0x02229248
	push {r3, lr}
	ldr r0, [r0, #4]
	bl ov42_02227430
	bl sub_02024ACC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov42_02229248

	thumb_func_start ov42_02229258
ov42_02229258: ; 0x02229258
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r3, sp, #8
	mov r1, #4
	mov r2, #6
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r0, #4]
	bl ov42_022274DC
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end ov42_02229258

	thumb_func_start ov42_02229274
ov42_02229274: ; 0x02229274
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0222927E
	mov r0, #1
	bx lr
_0222927E:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov42_02229274

	thumb_func_start ov42_02229284
ov42_02229284: ; 0x02229284
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #8]
	mov r6, #0
	cmp r0, #0
	ble _022292B2
	add r4, r6, #0
_02229292:
	ldr r0, [r5, #4]
	add r0, r0, r4
	bl ov42_02229274
	cmp r0, #1
	bne _022292A8
	mov r0, #0x14
	ldr r1, [r5, #4]
	mul r0, r6
	add r0, r1, r0
	pop {r4, r5, r6, pc}
_022292A8:
	ldrh r0, [r5, #8]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _02229292
_022292B2:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov42_02229284

	thumb_func_start ov42_022292BC
ov42_022292BC: ; 0x022292BC
	push {r4, lr}
	add r4, r1, #0
	bl ov42_022274B8
	cmp r0, #2
	bne _022292CC
	mov r0, #0
	pop {r4, pc}
_022292CC:
	ldr r0, _022292D4 ; =ov42_02229EB0
	ldrb r0, [r0, r4]
	pop {r4, pc}
	nop
_022292D4: .word ov42_02229EB0
	thumb_func_end ov42_022292BC

	thumb_func_start ov42_022292D8
ov42_022292D8: ; 0x022292D8
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	bl ov42_022282F4
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #4]
	ldrh r0, [r1, #2]
	strh r0, [r1, #6]
	mov r0, #4
	ldrsh r0, [r1, r0]
	strh r0, [r5]
	mov r0, #6
	ldrsh r0, [r1, r0]
	strh r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov42_022292D8

	thumb_func_start ov42_02229308
ov42_02229308: ; 0x02229308
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	str r2, [sp]
	bl ov42_022274D0
	add r7, r0, #0
	ldr r0, [r5, #4]
	bl ov42_022274C0
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [r5, #4]
	ldr r2, [sp]
	add r1, r4, #0
	bl ov42_02227504
	cmp r6, r4
	beq _02229352
	ldr r0, _02229354 ; =ov42_02229EA4
	ldrb r0, [r0, r4]
	cmp r0, #1
	bne _02229346
	ldrh r0, [r5, #0x10]
	cmp r0, r4
	bne _02229346
	ldrh r1, [r5, #0xe]
	ldr r0, [r5, #4]
	bl ov42_022274C4
_02229346:
	ldr r0, _02229354 ; =ov42_02229EA4
	ldrb r0, [r0, r6]
	cmp r0, #1
	bne _02229352
	strh r6, [r5, #0x10]
	strh r7, [r5, #0xe]
_02229352:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229354: .word ov42_02229EA4
	thumb_func_end ov42_02229308

	thumb_func_start ov42_02229358
ov42_02229358: ; 0x02229358
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r1, #0
	bl ov42_022282F4
	add r3, sp, #0
	strh r0, [r3]
	lsr r0, r0, #0x10
	strh r0, [r3, #2]
	ldrh r0, [r3]
	mov r1, #6
	mov r2, #4
	strh r0, [r3, #4]
	ldrh r0, [r3, #2]
	strh r0, [r3, #6]
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	sub r1, #0x60
	sub r2, #0x70
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov42_022293A0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_02229358

	thumb_func_start ov42_02229394
ov42_02229394: ; 0x02229394
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	bx lr
	thumb_func_end ov42_02229394

	thumb_func_start ov42_022293A0
ov42_022293A0: ; 0x022293A0
	strh r1, [r0]
	strh r2, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end ov42_022293A0

	thumb_func_start ov42_022293A8
ov42_022293A8: ; 0x022293A8
	mov r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov42_022293A8

	thumb_func_start ov42_022293B0
ov42_022293B0: ; 0x022293B0
	mov r1, #2
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov42_022293B0

	thumb_func_start ov42_022293B8
ov42_022293B8: ; 0x022293B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r7, r1, #0
	add r0, r3, #0
	mov r1, #0x1c
	add r5, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x1c
	mov r0, #0
_022293D4:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _022293D4
	str r6, [r4]
	str r7, [r4, #4]
	ldrb r0, [r5]
	add r2, r5, #0
	str r0, [r4, #0x10]
	ldrb r1, [r5, #1]
	str r1, [r4, #0x14]
	ldr r0, [r4, #4]
	bl ov42_02229514
	ldr r0, [sp, #4]
	add r3, r4, #0
	str r0, [sp]
	ldrb r0, [r5, #8]
	ldrb r1, [r5, #9]
	ldrb r2, [r5, #0xa]
	add r3, #0xc
	bl GfGfxLoader_GetScrnData
	str r0, [r4, #8]
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov42_022293B8

	thumb_func_start ov42_0222940C
ov42_0222940C: ; 0x0222940C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_0222940C

	thumb_func_start ov42_02229420
ov42_02229420: ; 0x02229420
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r6, r0, #0
	add r0, r4, #0
	bl ov42_022293A8
	add r5, r0, #0
	add r0, r4, #0
	bl ov42_022293B0
	add r4, r0, #0
	ldr r0, [r6, #0x10]
	cmp r0, #0
	bne _022294A0
	cmp r5, #0
	ble _02229454
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02229462
_02229454:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02229462:
	add r7, r0, #0
	cmp r4, #0
	ble _0222947A
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02229488
_0222947A:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02229488:
	bl _ffix
	str r0, [sp]
	add r0, r7, #0
	bl _ffix
	add r2, r0, #0
	ldr r0, [r6]
	ldr r1, [sp]
	bl G2dRenderer_SetMainSurfaceCoords
	b _02229506
_022294A0:
	cmp r5, #0
	ble _022294B6
	lsl r0, r5, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022294C4
_022294B6:
	lsl r0, r5, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022294C4:
	add r7, r0, #0
	cmp r4, #0
	ble _022294DC
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _022294EA
_022294DC:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_022294EA:
	bl _ffix
	str r0, [sp, #4]
	add r0, r7, #0
	bl _ffix
	mov r2, #3
	add r3, r0, #0
	lsl r2, r2, #0x12
	ldr r0, [r6]
	ldr r1, [sp, #4]
	add r2, r3, r2
	bl G2dRenderer_SetSubSurfaceCoords
_02229506:
	add r0, r6, #0
	add r1, r4, #0
	add r2, r5, #0
	bl ov42_02229570
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02229420

	thumb_func_start ov42_02229514
ov42_02229514: ; 0x02229514
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	ldr r6, _0222956C ; =ov42_02229EBC
	add r5, r0, #0
	add r4, r1, #0
	ldmia r6!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldrb r1, [r2, #2]
	add r0, sp, #0
	strb r1, [r0, #0x11]
	ldrb r1, [r2, #3]
	strb r1, [r0, #0x12]
	ldrb r1, [r2, #4]
	strb r1, [r0, #0x13]
	ldrb r1, [r2, #5]
	strb r1, [r0, #0x14]
	ldrb r1, [r2, #6]
	strb r1, [r0, #0x15]
	mov r1, #0
	strb r1, [r0, #0x16]
	ldrb r0, [r2, #7]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl FreeBgTilemapBuffer
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_0222956C: .word ov42_02229EBC
	thumb_func_end ov42_02229514

	thumb_func_start ov42_02229570
ov42_02229570: ; 0x02229570
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	lsl r0, r0, #0xd
	asr r3, r0, #0x10
	asr r0, r2, #2
	lsr r0, r0, #0x1d
	add r0, r2, r0
	lsr r4, r1, #0x1f
	lsl r6, r1, #0x1d
	sub r6, r6, r4
	mov r1, #0x1d
	ror r6, r1
	add r4, r4, r6
	lsl r4, r4, #0x10
	asr r6, r4, #0x10
	lsr r4, r2, #0x1f
	lsl r2, r2, #0x1d
	sub r2, r2, r4
	ror r2, r1
	add r1, r4, r2
	lsl r1, r1, #0x10
	asr r4, r1, #0x10
	lsl r0, r0, #0xd
	ldrh r1, [r5, #0x18]
	asr r0, r0, #0x10
	cmp r3, r1
	bne _022295B4
	ldrh r1, [r5, #0x1a]
	cmp r0, r1
	beq _022295DC
_022295B4:
	strh r3, [r5, #0x18]
	strh r0, [r5, #0x1a]
	neg r0, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	neg r3, r3
	lsl r3, r3, #0x10
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0xc]
	asr r3, r3, #0x10
	bl ov42_02229600
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
_022295DC:
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #3
	add r3, r4, #0
	bl ScheduleSetBgPosText
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov42_02229570

	thumb_func_start ov42_02229600
ov42_02229600: ; 0x02229600
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp, #0x1c]
	add r0, r2, #0
	ldrh r0, [r0]
	ldr r4, [sp, #0x50]
	add r5, r3, #0
	lsl r0, r0, #0xd
	asr r0, r0, #0x10
	str r0, [sp, #0x34]
	add r0, r2, #0
	ldrh r0, [r0, #2]
	str r1, [sp, #0x20]
	str r2, [sp, #0x24]
	lsl r0, r0, #0xd
	asr r0, r0, #0x10
	str r0, [sp, #0x30]
	cmp r5, #0
	bge _02229630
	neg r0, r5
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x2c]
	b _02229634
_02229630:
	mov r0, #0
	str r0, [sp, #0x2c]
_02229634:
	cmp r4, #0
	bge _02229642
	neg r0, r4
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x28]
	b _02229646
_02229642:
	mov r0, #0
	str r0, [sp, #0x28]
_02229646:
	cmp r5, #0
	bgt _0222964C
	mov r5, #0
_0222964C:
	cmp r4, #0
	bgt _02229652
	mov r4, #0
_02229652:
	mov r0, #0x21
	sub r0, r0, r5
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	mov r0, #0x19
	sub r0, r0, r4
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [sp, #0x2c]
	add r1, r0, r7
	ldr r0, [sp, #0x34]
	cmp r0, r1
	bge _02229674
	sub r0, r1, r0
	sub r0, r7, r0
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
_02229674:
	ldr r0, [sp, #0x28]
	add r1, r0, r6
	ldr r0, [sp, #0x30]
	cmp r0, r1
	bge _02229686
	sub r0, r1, r0
	sub r0, r6, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
_02229686:
	mov r2, #0
	str r2, [sp]
	mov r0, #0x21
	str r0, [sp, #4]
	mov r0, #0x19
	ldr r1, [sp, #0x20]
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x1c]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	add r0, #0xc
	str r0, [sp, #0x24]
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	lsl r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x28]
	lsl r2, r5, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	lsl r3, r4, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov42_022296F0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov42_02229600

	thumb_func_start ov42_022296F0
ov42_022296F0: ; 0x022296F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	ldr r0, [sp, #0x70]
	str r3, [sp, #0x24]
	str r0, [sp, #0x70]
	ldr r0, [sp, #0x78]
	add r4, r2, #0
	str r0, [sp, #0x78]
	ldr r0, [sp, #0x7c]
	str r0, [sp, #0x7c]
	ldr r0, [sp, #0x80]
	str r0, [sp, #0x80]
	ldr r0, [sp, #0x7c]
	ldr r1, [sp, #0x80]
	bl ov42_02229880
	str r0, [sp, #0x40]
	cmp r0, #0
	add r1, sp, #0x58
	bne _02229748
	ldrb r0, [r1, #0x10]
	add r2, r4, #0
	str r0, [sp]
	ldrb r0, [r1, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x70]
	str r0, [sp, #8]
	ldrb r0, [r1, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x78]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x7c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x80]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl CopyToBgTilemapRect
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
_02229748:
	mov r0, #0x14
	ldrsb r0, [r1, r0]
	str r0, [sp, #0x48]
	cmp r0, #0
	bgt _02229754
	b _0222987A
_02229754:
	mov r0, #0x10
	ldrsb r0, [r1, r0]
	str r0, [sp, #0x3c]
	mov r0, #0x1c
	ldrsb r0, [r1, r0]
	str r0, [sp, #0x38]
	lsl r0, r4, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #0x34]
_02229766:
	ldr r0, [sp, #0x78]
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	add r0, r2, r1
	ldr r1, [sp, #0x48]
	add r1, r0, r1
	cmp r1, #0x20
	bgt _02229786
	ldr r1, [sp, #0x48]
	str r1, [sp, #0x44]
	mov r1, #0
	str r1, [sp, #0x48]
	b _0222979A
_02229786:
	mov r1, #0x20
	sub r1, r1, r0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x48]
	sub r1, r2, r1
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	str r1, [sp, #0x48]
_0222979A:
	ldr r1, [sp, #0x78]
	ldr r4, [sp, #0x3c]
	lsl r1, r1, #0x13
	asr r2, r1, #0x18
	add r1, r4, #0
	ldr r5, [sp, #0x38]
	ldr r7, [sp, #0x34]
	cmp r1, #0
	ble _0222985A
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x30]
	ldr r1, [sp, #0x44]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsr r0, r0, #0x18
	str r1, [sp, #0x2c]
	str r0, [sp, #0x4c]
_022297C0:
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	add r0, r2, r1
	str r0, [sp, #0x28]
	add r0, r0, r4
	cmp r0, #0x20
	bgt _022297DA
	add r6, r4, #0
	mov r4, #0
	b _022297EA
_022297DA:
	ldr r0, [sp, #0x28]
	mov r1, #0x20
	sub r0, r1, r0
	lsl r0, r0, #0x18
	asr r6, r0, #0x18
	sub r0, r4, r6
	lsl r0, r0, #0x18
	asr r4, r0, #0x18
_022297EA:
	ldr r0, [sp, #0x7c]
	asr r1, r5, #4
	str r0, [sp]
	ldr r0, [sp, #0x80]
	lsr r1, r1, #0x1b
	add r1, r5, r1
	str r0, [sp, #4]
	add r0, sp, #0x50
	str r0, [sp, #8]
	lsl r1, r1, #0x13
	asr r1, r1, #0x18
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x70]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x40]
	lsr r1, r1, #0x18
	bl ov42_022298B4
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x2c]
	lsl r2, r7, #0x18
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, sp, #0x50
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x4c]
	lsr r2, r2, #0x18
	str r0, [sp, #0x10]
	mov r0, #0
	ldrsh r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	mov r0, #2
	ldrsh r0, [r1, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x24]
	bl CopyToBgTilemapRect
	add r0, r5, r6
	lsl r0, r0, #0x18
	asr r5, r0, #0x18
	add r0, r7, r6
	lsl r0, r0, #0x18
	asr r7, r0, #0x18
	cmp r4, #0
	bgt _022297C0
_0222985A:
	ldr r1, [sp, #0x78]
	ldr r0, [sp, #0x44]
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x78]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x44]
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x48]
	cmp r0, #0
	ble _0222987A
	b _02229766
_0222987A:
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov42_022296F0

	thumb_func_start ov42_02229880
ov42_02229880: ; 0x02229880
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0x40
	bls _0222988E
	bl GF_AssertFail
_0222988E:
	cmp r4, #0x40
	bls _02229896
	bl GF_AssertFail
_02229896:
	cmp r5, #0x20
	bhi _022298A6
	cmp r4, #0x20
	bhi _022298A2
	mov r0, #0
	pop {r3, r4, r5, pc}
_022298A2:
	mov r0, #2
	pop {r3, r4, r5, pc}
_022298A6:
	cmp r4, #0x20
	bhi _022298AE
	mov r0, #1
	pop {r3, r4, r5, pc}
_022298AE:
	mov r0, #3
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov42_02229880

	thumb_func_start ov42_022298B4
ov42_022298B4: ; 0x022298B4
	push {r4, r5, r6, lr}
	add r5, r3, #0
	add r6, r2, #0
	ldr r4, [sp, #0x10]
	ldr r3, [sp, #0x14]
	ldr r2, [sp, #0x18]
	cmp r5, #3
	bhi _02229968
	add r5, r5, r5
	add r5, pc
	ldrh r5, [r5, #6]
	lsl r5, r5, #0x10
	asr r5, r5, #0x10
	add pc, r5
_022298D0: ; jump table
	.short _022298D8 - _022298D0 - 2 ; case 0
	.short _022298DE - _022298D0 - 2 ; case 1
	.short _022298FC - _022298D0 - 2 ; case 2
	.short _0222991A - _022298D0 - 2 ; case 3
_022298D8:
	strh r4, [r2]
	strh r3, [r2, #2]
	pop {r4, r5, r6, pc}
_022298DE:
	add r5, r1, #1
	lsl r5, r5, #5
	cmp r5, r4
	bgt _022298EA
	mov r4, #0x20
	b _022298EE
_022298EA:
	lsl r5, r1, #5
	sub r4, r4, r5
_022298EE:
	strh r4, [r2]
	strh r3, [r2, #2]
	lsl r2, r3, #0x16
	asr r2, r2, #0x10
	mul r2, r1
	add r0, r0, r2
	pop {r4, r5, r6, pc}
_022298FC:
	add r1, r6, #1
	lsl r1, r1, #5
	strh r4, [r2]
	cmp r1, r3
	bgt _0222990A
	mov r1, #0x20
	b _0222990E
_0222990A:
	lsl r1, r6, #5
	sub r1, r3, r1
_0222990E:
	strh r1, [r2, #2]
	lsl r1, r4, #0x16
	asr r1, r1, #0x10
	mul r1, r6
	add r0, r0, r1
	pop {r4, r5, r6, pc}
_0222991A:
	add r5, r1, #1
	lsl r5, r5, #5
	cmp r5, r4
	bgt _02229926
	mov r5, #0x20
	b _0222992A
_02229926:
	lsl r5, r1, #5
	sub r5, r4, r5
_0222992A:
	strh r5, [r2]
	add r5, r6, #1
	lsl r5, r5, #5
	cmp r5, r3
	bgt _02229938
	mov r5, #0x20
	b _0222993C
_02229938:
	lsl r5, r6, #5
	sub r5, r3, r5
_0222993C:
	strh r5, [r2, #2]
	cmp r6, #0
	bne _02229954
	mov r2, #0
	cmp r1, #0
	beq _02229964
	mov r1, #2
	lsl r1, r1, #0xa
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	b _02229964
_02229954:
	lsl r2, r4, #0x16
	lsr r2, r2, #0x10
	cmp r1, #0
	beq _02229964
	lsl r1, r3, #6
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
_02229964:
	add r0, r0, r2
	pop {r4, r5, r6, pc}
_02229968:
	bl GF_AssertFail
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_022298B4

	thumb_func_start ov42_02229974
ov42_02229974: ; 0x02229974
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	bne _0222998A
	bl GF_AssertFail
_0222998A:
	add r1, r5, #1
	str r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #3
	bl AllocFromHeap
	str r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #0
	lsl r2, r2, #3
	bl memset
	mov r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02229974

	thumb_func_start ov42_022299AC
ov42_022299AC: ; 0x022299AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_022299AC

	thumb_func_start ov42_022299C0
ov42_022299C0: ; 0x022299C0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldrh r0, [r5, #0xa]
	add r4, r1, #0
	ldr r1, [r5, #4]
	add r0, r0, #1
	bl _u32_div_f
	ldrh r0, [r5, #8]
	cmp r0, r1
	bne _022299E0
	add r0, r5, #0
	add r1, sp, #0
	bl ov42_02229A08
_022299E0:
	ldrh r0, [r5, #0xa]
	ldr r3, [r5]
	lsl r2, r0, #3
	ldrh r0, [r4]
	add r1, r3, r2
	strh r0, [r3, r2]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #4]
	strh r0, [r1, #4]
	ldrh r0, [r4, #6]
	strh r0, [r1, #6]
	ldrh r0, [r5, #0xa]
	ldr r1, [r5, #4]
	add r0, r0, #1
	bl _u32_div_f
	strh r1, [r5, #0xa]
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_022299C0

	thumb_func_start ov42_02229A08
ov42_02229A08: ; 0x02229A08
	push {r4, lr}
	add r4, r0, #0
	ldrh r2, [r4, #8]
	ldrh r0, [r4, #0xa]
	cmp r0, r2
	bne _02229A18
	mov r0, #0
	pop {r4, pc}
_02229A18:
	ldr r3, [r4]
	lsl r0, r2, #3
	add r2, r3, r0
	ldrh r0, [r3, r0]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r2, #4]
	strh r0, [r1, #4]
	ldrh r0, [r2, #6]
	strh r0, [r1, #6]
	ldrh r0, [r4, #8]
	ldr r1, [r4, #4]
	add r0, r0, #1
	bl _u32_div_f
	strh r1, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_02229A08

	thumb_func_start ov42_02229A40
ov42_02229A40: ; 0x02229A40
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	bne _02229A56
	bl GF_AssertFail
_02229A56:
	add r1, r5, #1
	str r1, [r4, #4]
	add r0, r6, #0
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r4]
	ldr r2, [r4, #4]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov42_02229A40

	thumb_func_start ov42_02229A78
ov42_02229A78: ; 0x02229A78
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_02229A78

	thumb_func_start ov42_02229A8C
ov42_02229A8C: ; 0x02229A8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0xa]
	add r4, r1, #0
	ldr r1, [r5, #4]
	add r0, r0, #1
	bl _u32_div_f
	ldrh r0, [r5, #8]
	cmp r0, r1
	bne _02229AAA
	add r0, r5, #0
	add r1, sp, #0
	bl ov42_02229AC8
_02229AAA:
	ldrh r0, [r5, #0xa]
	ldr r3, [r5]
	lsl r2, r0, #2
	ldrh r0, [r4]
	add r1, r3, r2
	strh r0, [r3, r2]
	ldrh r0, [r4, #2]
	strh r0, [r1, #2]
	ldrh r0, [r5, #0xa]
	ldr r1, [r5, #4]
	add r0, r0, #1
	bl _u32_div_f
	strh r1, [r5, #0xa]
	pop {r3, r4, r5, pc}
	thumb_func_end ov42_02229A8C

	thumb_func_start ov42_02229AC8
ov42_02229AC8: ; 0x02229AC8
	push {r4, lr}
	add r4, r0, #0
	ldrh r2, [r4, #8]
	ldrh r0, [r4, #0xa]
	cmp r0, r2
	bne _02229AD8
	mov r0, #0
	pop {r4, pc}
_02229AD8:
	ldr r3, [r4]
	lsl r0, r2, #2
	add r2, r3, r0
	ldrh r0, [r3, r0]
	strh r0, [r1]
	ldrh r0, [r2, #2]
	strh r0, [r1, #2]
	ldrh r0, [r4, #8]
	ldr r1, [r4, #4]
	add r0, r0, #1
	bl _u32_div_f
	strh r1, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov42_02229AC8

	.rodata

_02229AF8:
	.byte 0x00, 0x00, 0x01, 0x01

ov42_02229AFC: ; 0x02229AFC
	.byte 0x00, 0x01, 0x95, 0x96
	.byte 0x97, 0x98, 0x00, 0x00

ov42_02229B04: ; 0x02229B04
	.byte 0x01, 0xFF, 0x08, 0x02, 0x04, 0x10, 0x10, 0x02, 0x04, 0x00, 0x00, 0x00

ov42_02229B10: ; 0x02229B10
	.byte 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11

ov42_02229B20: ; 0x02229B20
	.word ov42_02227D48
	.word ov42_02227D54
	.word ov42_02227D64
	.word ov42_02227D74
	.word ov42_02227D88
	.word ov42_02227D98
	.word ov42_02227DA8
	.word ov42_02227DB8
	.word ov42_02227DC8
	.word 0

ov42_02229B48: ; 0x02229B48
	.word 0
	.word ov42_02227DD8
	.word ov42_02227DE8
	.word ov42_02227DF8
	.word ov42_02227E18
	.word ov42_02227E28
	.word ov42_02227E38
	.word ov42_02227E48
	.word ov42_02227E58
	.word 0

ov42_02229B70: ; 0x02229B70
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00

ov42_02229BA0: ; 0x02229BA0
	.byte 0x00, 0x00

ov42_02229BA2: ; 0x02229BA2
	.byte 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x05, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x04, 0x00
	.byte 0x1F, 0x00, 0x05, 0x00, 0x32, 0x00, 0x06, 0x00, 0x33, 0x00, 0x07, 0x00, 0x3E, 0x00, 0x08, 0x00
	.byte 0x46, 0x00, 0x09, 0x00, 0x61, 0x00, 0x01, 0x00, 0x06, 0x00, 0x0A, 0x00, 0x07, 0x00, 0x0B, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x23, 0x00, 0x0E, 0x00, 0x25, 0x00, 0x0F, 0x00
	.byte 0x2A, 0x00, 0x10, 0x00, 0x3F, 0x00, 0x11, 0x00, 0x04, 0x00, 0x12, 0x00, 0x08, 0x00, 0x13, 0x00
	.byte 0x34, 0x00, 0x14, 0x00, 0x35, 0x00, 0x15, 0x00, 0x02, 0x00, 0x16, 0x00, 0x0F, 0x00, 0x17, 0x00
	.byte 0x10, 0x00, 0x18, 0x00, 0x3B, 0x00, 0x19, 0x00, 0x3C, 0x00, 0x1A, 0x00, 0x09, 0x00, 0x1B, 0x00
	.byte 0x0C, 0x00, 0x1C, 0x00, 0x17, 0x00, 0x1D, 0x00, 0x16, 0x00, 0x1E, 0x00, 0x29, 0x00, 0x1F, 0x00
	.byte 0x26, 0x00, 0x20, 0x00, 0x27, 0x00, 0x21, 0x00, 0x11, 0x00, 0x22, 0x00, 0x44, 0x00, 0x23, 0x00
	.byte 0x45, 0x00, 0x24, 0x00, 0x01, 0x00, 0x25, 0x00, 0x2D, 0x00, 0x26, 0x00, 0x36, 0x00, 0x27, 0x00
	.byte 0x38, 0x00, 0x28, 0x00, 0x14, 0x00, 0x29, 0x00, 0x0A, 0x00, 0x2A, 0x00, 0x13, 0x00, 0x2B, 0x00
	.byte 0x1D, 0x00, 0x2C, 0x00, 0x24, 0x00, 0x2D, 0x00, 0x28, 0x00, 0x2E, 0x00, 0x2B, 0x00, 0x2F, 0x00
	.byte 0x22, 0x00, 0x30, 0x00, 0x37, 0x00, 0x31, 0x00, 0x47, 0x00, 0x32, 0x00, 0x8D, 0x00, 0x33, 0x00
	.byte 0x8E, 0x00, 0x34, 0x00, 0x8F, 0x00, 0x35, 0x00, 0x90, 0x00, 0x36, 0x00, 0x91, 0x00, 0x37, 0x00
	.byte 0xA9, 0x00, 0x38, 0x00, 0x2C, 0x00, 0x3A, 0x00, 0x1E, 0x00, 0x3B, 0x00, 0xAF, 0x00, 0x5E, 0x00
	.byte 0x12, 0x00, 0x67, 0x00, 0x94, 0x00, 0x72, 0x00, 0x54, 0x00, 0x73, 0x00, 0x18, 0x00, 0x74, 0x00
	.byte 0x19, 0x00, 0x75, 0x00, 0xA8, 0x00, 0x84, 0x00, 0x56, 0x00, 0x87, 0x00, 0x15, 0x01, 0x8B, 0x00
	.byte 0x16, 0x01, 0x8C, 0x00, 0x17, 0x01, 0x8D, 0x00, 0x18, 0x01, 0x8E, 0x00, 0x19, 0x01, 0x8F, 0x00
	.byte 0x1A, 0x01, 0x90, 0x00, 0x1B, 0x01, 0x91, 0x00, 0x1C, 0x01, 0x92, 0x00, 0x1D, 0x01, 0x93, 0x00
	.byte 0x1E, 0x01, 0x94, 0x00, 0xEE, 0x00, 0x95, 0x00, 0xEF, 0x00, 0x96, 0x00, 0x27, 0x01, 0x97, 0x00
	.byte 0x28, 0x01, 0x98, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov42_02229E04: ; 0x02229E04
	.byte 0xFF, 0xFF, 0xFF, 0xFF

ov42_02229E08: ; 0x02229E08
	.byte 0x01, 0x00, 0x03, 0x02

ov42_02229E0C: ; 0x02229E0C
	.byte 0x00

ov42_02229E0D: ; 0x02229E0D
	.byte 0xF0, 0x00, 0x10
	.byte 0xF0, 0x00, 0x10, 0x00

ov42_02229E14: ; 0x02229E14
	.word ov42_022285A4
	.word ov42_022285FC
	.word ov42_02228668
	.word ov42_02228700
	.word ov42_02228798
	.word ov42_022287F0
	.word ov42_0222885C
	.word ov42_022288F4
	.word ov42_0222898C
	.word ov42_022289F8
	.word ov42_02228A64
	.word ov42_02228AD0

ov42_02229E44: ; 0x02229E44
	.word ov42_02228B3C
	.word ov42_02228B40
	.word ov42_02228B48
	.word ov42_02228B88
	.word ov42_02228BC8
	.word ov42_02228BCC
	.word ov42_02228B48
	.word ov42_02228B48
	.word ov42_02228BD4
	.word ov42_02228BD4
	.word ov42_02228BD4
	.word ov42_02228BD4

ov42_02229E74: ; 0x02229E74
	.word ov42_02228CDC
	.word ov42_02228D08
	.word ov42_02228D44
	.word ov42_02228DB8
	.word ov42_02228DC8
	.word ov42_02228DF0
	.word ov42_02228DFC
	.word ov42_02228D44
	.word ov42_02228E0C
	.word ov42_02228E0C
	.word ov42_02228E0C
	.word ov42_02228E0C

ov42_02229EA4: ; 0x02229EA4
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00

ov42_02229EB0: ; 0x02229EB0
	.byte 0x00, 0x03, 0x02, 0x04, 0x00, 0x05, 0x06, 0x08, 0x07, 0x08, 0x02, 0x06

ov42_02229EBC: ; 0x02229EBC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
