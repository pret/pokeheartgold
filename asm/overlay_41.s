	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov41_02245EA0
ov41_02245EA0: ; 0x02245EA0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #8
	bl AllocFromHeap
	lsl r6, r5, #3
	add r4, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r6, #0
	str r0, [r4]
	bl memset
	str r5, [r4, #4]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02245EA0

	thumb_func_start ov41_02245ECC
ov41_02245ECC: ; 0x02245ECC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02245ECC

	thumb_func_start ov41_02245EE0
ov41_02245EE0: ; 0x02245EE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl ov41_0224607C
	add r4, r0, #0
	bne _02245EF2
	bl GF_AssertFail
_02245EF2:
	ldr r0, [r5, #0x18]
	str r0, [r4]
	add r0, r5, #0
	bl ov41_022460A8
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02245EE0

	thumb_func_start ov41_02245F04
ov41_02245F04: ; 0x02245F04
	push {r3, lr}
	add r1, sp, #0
	bl ov41_022460DC
	add r0, sp, #0
	bl sub_020252F4
	pop {r3, pc}
	thumb_func_end ov41_02245F04

	thumb_func_start ov41_02245F14
ov41_02245F14: ; 0x02245F14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r6, r1, #0
	str r2, [sp]
	add r7, r3, #0
	bl ov41_02245F04
	cmp r0, #0
	bne _02245F2E
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02245F2E:
	add r0, r4, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov41_02245FA8
	ldr r0, _02245F98 ; =gSystem + 0x40
	ldr r1, [sp, #8]
	ldrh r2, [r0, #0x20]
	sub r1, r2, r1
	str r1, [r6]
	ldrh r1, [r0, #0x22]
	ldr r0, [sp, #4]
	sub r1, r1, r0
	ldr r0, [sp]
	sub r4, r1, #4
	str r1, [r0]
	add r0, r1, #4
	cmp r4, r0
	bge _02245F92
_02245F54:
	cmp r4, #0
	blt _02245F86
	ldr r0, [r6]
	sub r5, r0, #4
	add r0, r0, #4
	cmp r5, r0
	bge _02245F86
_02245F62:
	cmp r5, #0
	blt _02245F7C
	add r0, r7, #0
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov41_022464BC
	cmp r0, #0
	bne _02245F7C
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02245F7C:
	ldr r0, [r6]
	add r5, r5, #1
	add r0, r0, #4
	cmp r5, r0
	blt _02245F62
_02245F86:
	ldr r0, [sp]
	add r4, r4, #1
	ldr r0, [r0]
	add r0, r0, #4
	cmp r4, r0
	blt _02245F54
_02245F92:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02245F98: .word gSystem + 0x40
	thumb_func_end ov41_02245F14

	thumb_func_start ov41_02245F9C
ov41_02245F9C: ; 0x02245F9C
	ldr r3, _02245FA4 ; =sub_02015FC4
	ldr r0, [r0, #4]
	bx r3
	nop
_02245FA4: .word sub_02015FC4
	thumb_func_end ov41_02245F9C

	thumb_func_start ov41_02245FA8
ov41_02245FA8: ; 0x02245FA8
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02015FCC
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
	str r0, [r5]
	mov r0, #6
	ldrsh r0, [r1, r0]
	str r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02245FA8

	thumb_func_start ov41_02245FD8
ov41_02245FD8: ; 0x02245FD8
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02015FE8
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
	str r0, [r5]
	mov r0, #6
	ldrsh r0, [r1, r0]
	str r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02245FD8

	thumb_func_start ov41_02246008
ov41_02246008: ; 0x02246008
	ldr r3, _02246010 ; =sub_02015FB0
	ldr r0, [r0, #4]
	bx r3
	nop
_02246010: .word sub_02015FB0
	thumb_func_end ov41_02246008

	thumb_func_start ov41_02246014
ov41_02246014: ; 0x02246014
	ldr r3, _0224601C ; =sub_02015FF4
	ldr r0, [r0, #4]
	bx r3
	nop
_0224601C: .word sub_02015FF4
	thumb_func_end ov41_02246014

	thumb_func_start ov41_02246020
ov41_02246020: ; 0x02246020
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r2, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02245FD8
	ldr r0, [sp, #4]
	cmp r0, #0x10
	beq _02246040
	cmp r0, #0x20
	beq _02246046
	cmp r0, #0x40
	beq _0224604C
	b _02246050
_02246040:
	mov r0, #0
	str r0, [r5]
	b _02246050
_02246046:
	mov r0, #0xa
	str r0, [r5]
	b _02246050
_0224604C:
	mov r0, #0x14
	str r0, [r5]
_02246050:
	ldr r0, [sp]
	cmp r0, #0x10
	beq _02246062
	cmp r0, #0x20
	beq _0224606A
	cmp r0, #0x40
	beq _02246072
	add sp, #8
	pop {r3, r4, r5, pc}
_02246062:
	mov r0, #0
	add sp, #8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0224606A:
	mov r0, #0xa
	add sp, #8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02246072:
	mov r0, #0x14
	str r0, [r4]
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02246020

	thumb_func_start ov41_0224607C
ov41_0224607C: ; 0x0224607C
	push {r3, r4}
	ldr r4, [r0, #4]
	mov r1, #0
	cmp r4, #0
	ble _022460A0
	ldr r3, [r0]
	add r2, r3, #0
_0224608A:
	ldr r0, [r2, #4]
	cmp r0, #0
	bne _02246098
	lsl r0, r1, #3
	add r0, r3, r0
	pop {r3, r4}
	bx lr
_02246098:
	add r1, r1, #1
	add r2, #8
	cmp r1, r4
	blt _0224608A
_022460A0:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov41_0224607C

	thumb_func_start ov41_022460A8
ov41_022460A8: ; 0x022460A8
	push {r3, lr}
	sub sp, #0x20
	ldr r1, [r0, #4]
	mov r3, #0
	str r1, [sp]
	ldr r1, [r0, #8]
	str r1, [sp, #4]
	ldr r1, [r0, #0xc]
	str r1, [sp, #8]
	ldr r2, [r0, #0x10]
	add r1, sp, #0
	strh r2, [r1, #0xc]
	ldr r2, [r0, #0x14]
	strh r2, [r1, #0xe]
	strh r3, [r1, #0x10]
	mov r2, #0x1f
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	ldr r0, [r0, #0x1c]
	strh r0, [r1, #0x1c]
	add r0, sp, #0
	bl sub_02015F8C
	add sp, #0x20
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_022460A8

	thumb_func_start ov41_022460DC
ov41_022460DC: ; 0x022460DC
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	bl sub_02015FCC
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	strh r0, [r1, #0xc]
	ldrh r0, [r1, #6]
	strh r0, [r1, #0xe]
	ldr r0, [r5, #4]
	bl sub_02015FE8
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r1, #8]
	ldrh r0, [r1, #2]
	strh r0, [r1, #0xa]
	mov r0, #0xe
	ldrsh r2, [r1, r0]
	mov r0, #0xa
	strb r2, [r4]
	ldrsh r0, [r1, r0]
	add r0, r2, r0
	strb r0, [r4, #1]
	mov r0, #0xc
	ldrsh r2, [r1, r0]
	mov r0, #8
	strb r2, [r4, #2]
	ldrsh r0, [r1, r0]
	add r0, r2, r0
	strb r0, [r4, #3]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_022460DC

	thumb_func_start ov41_02246130
ov41_02246130: ; 0x02246130
	push {r3, lr}
	bl ov41_022466D0
	bl ov41_022466F0
	bl ov41_02246778
	ldr r0, _0224614C ; =gSystem + 0x60
	mov r1, #1
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	pop {r3, pc}
	nop
_0224614C: .word gSystem + 0x60
	thumb_func_end ov41_02246130

	thumb_func_start ov41_02246150
ov41_02246150: ; 0x02246150
	push {r3, lr}
	ldr r0, _0224616C ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	bl ov41_022467D4
	bl ov41_022467C8
	bl GX_ResetBankForTex
	pop {r3, pc}
	nop
_0224616C: .word gSystem + 0x60
	thumb_func_end ov41_02246150

	thumb_func_start ov41_02246170
ov41_02246170: ; 0x02246170
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _022461CC ; =ov41_0224BFB4
	add r2, sp, #0
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0x1a
	mov r1, #0xe
	bl NARC_ctor
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r0, r4, #0
	add r1, sp, #0
	bl ov41_022467E4
	mov r2, #0xa
	add r0, r4, #0
	mov r1, #0xe
	lsl r2, r2, #0xa
	mov r3, #0x20
	bl ov41_02246CC0
	add r0, r4, #0
	bl ov41_02246A50
	add r0, r4, #0
	mov r1, #0xd
	bl ov41_02246C90
	add r0, r4, #0
	bl ov41_02246A94
	mov r0, #0xe
	bl BgConfig_Alloc
	str r0, [r4, #0x40]
	add r0, r4, #0
	bl ov41_022468FC
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_022461CC: .word ov41_0224BFB4
	thumb_func_end ov41_02246170

	thumb_func_start ov41_022461D0
ov41_022461D0: ; 0x022461D0
	push {r4, lr}
	add r4, r0, #0
	bl ov41_02246CB0
	add r0, r4, #0
	bl ov41_02246820
	add r0, r4, #0
	bl ov41_02246A20
	ldr r0, [r4, #0x40]
	bl FreeToHeap
	add r0, r4, #0
	bl ov41_02246D2C
	add r0, r4, #0
	bl ov41_02246B34
	add r0, r4, #0
	bl ov41_02246A7C
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl NARC_dtor
	ldr r0, [r4, #4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end ov41_022461D0

	thumb_func_start ov41_0224621C
ov41_0224621C: ; 0x0224621C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02026E48
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02246234
	add r0, r4, #0
	bl ov41_02246830
_02246234:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02246240
	ldr r0, [r4, #0x20]
	bl sub_02008120
_02246240:
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	add r0, r4, #0
	bl ov41_02246B5C
	pop {r4, pc}
	thumb_func_end ov41_0224621C

	thumb_func_start ov41_02246250
ov41_02246250: ; 0x02246250
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r5, r0, #0
	bl ov41_0224683C
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	add r0, r5, #0
	bl ov41_0224689C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02246250

	thumb_func_start ov41_0224626C
ov41_0224626C: ; 0x0224626C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02015EF4
	ldr r0, [r4]
	bl sub_02015F64
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224626C

	thumb_func_start ov41_02246280
ov41_02246280: ; 0x02246280
	push {r4, r5, r6, lr}
	sub sp, #0x70
	add r5, r0, #0
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r4, r2, #0
	ldr r2, [r5, #0x48]
	add r6, r3, #0
	str r2, [sp, #0x14]
	ldr r2, [r5, #0x4c]
	add r3, r1, #0
	str r2, [sp, #0x18]
	ldr r2, [r5, #0x50]
	str r2, [sp, #0x1c]
	ldr r2, [r5, #0x54]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	add r0, sp, #0x4c
	add r2, r1, #0
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x44]
	str r0, [sp, #0x2c]
	add r0, sp, #0x4c
	str r0, [sp, #0x30]
	lsl r0, r4, #0xc
	str r0, [sp, #0x34]
	lsl r0, r6, #0xc
	str r0, [sp, #0x38]
	mov r0, #0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x80]
	str r0, [sp, #0x40]
	ldr r0, [sp, #0x84]
	str r0, [sp, #0x44]
	mov r0, #0xe
	str r0, [sp, #0x48]
	add r0, sp, #0x2c
	bl sub_02024714
	add sp, #0x70
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02246280

	thumb_func_start ov41_022462E4
ov41_022462E4: ; 0x022462E4
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x1c]
	str r4, [sp]
	ldr r4, [sp, #0x18]
	str r4, [sp, #4]
	mov r4, #0xe
	str r4, [sp, #8]
	ldr r0, [r0, #0x48]
	bl AddCharResObjFromOpenNarc
	bl sub_0200ADA4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_022462E4

	thumb_func_start ov41_02246304
ov41_02246304: ; 0x02246304
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x20]
	str r4, [sp]
	ldr r4, [sp, #0x18]
	str r4, [sp, #4]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #8]
	mov r4, #0xe
	str r4, [sp, #0xc]
	ldr r0, [r0, #0x4c]
	bl AddPlttResObjFromOpenNarc
	bl sub_0200B00C
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246304

	thumb_func_start ov41_02246328
ov41_02246328: ; 0x02246328
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x18]
	str r4, [sp]
	mov r4, #2
	str r4, [sp, #4]
	mov r4, #0xe
	str r4, [sp, #8]
	ldr r0, [r0, #0x50]
	bl AddCellOrAnimResObjFromOpenNarc
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246328

	thumb_func_start ov41_02246344
ov41_02246344: ; 0x02246344
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x18]
	str r4, [sp]
	mov r4, #3
	str r4, [sp, #4]
	mov r4, #0xe
	str r4, [sp, #8]
	ldr r0, [r0, #0x54]
	bl AddCellOrAnimResObjFromOpenNarc
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246344

	thumb_func_start ov41_02246360
ov41_02246360: ; 0x02246360
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x48]
	bl Get2DGfxResObjById
	add r1, r0, #0
	ldr r0, [r4, #0x48]
	bl DestroySingle2DGfxResObj
	pop {r4, pc}
	thumb_func_end ov41_02246360

	thumb_func_start ov41_02246374
ov41_02246374: ; 0x02246374
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	bl Get2DGfxResObjById
	add r1, r0, #0
	ldr r0, [r4, #0x4c]
	bl DestroySingle2DGfxResObj
	pop {r4, pc}
	thumb_func_end ov41_02246374

	thumb_func_start ov41_02246388
ov41_02246388: ; 0x02246388
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x50]
	bl Get2DGfxResObjById
	add r1, r0, #0
	ldr r0, [r4, #0x50]
	bl DestroySingle2DGfxResObj
	pop {r4, pc}
	thumb_func_end ov41_02246388

	thumb_func_start ov41_0224639C
ov41_0224639C: ; 0x0224639C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x54]
	bl Get2DGfxResObjById
	add r1, r0, #0
	ldr r0, [r4, #0x54]
	bl DestroySingle2DGfxResObj
	pop {r4, pc}
	thumb_func_end ov41_0224639C

	thumb_func_start ov41_022463B0
ov41_022463B0: ; 0x022463B0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x76
	mov r2, #0x13
	mov r3, #0xe
	bl ov41_02246D54
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_02246B68
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_02246BEC
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_022463B0

	thumb_func_start ov41_022463D4
ov41_022463D4: ; 0x022463D4
	ldr r3, _022463D8 ; =ov41_02246DA8
	bx r3
	.balign 4, 0
_022463D8: .word ov41_02246DA8
	thumb_func_end ov41_022463D4

	thumb_func_start ov41_022463DC
ov41_022463DC: ; 0x022463DC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x34]
	add r6, r1, #0
	add r5, r2, #0
	bl sub_020255C4
	ldr r1, [r4, #0x38]
	lsl r5, r5, #2
	add r0, r6, #0
	add r1, r1, r5
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, [r4, #0x38]
	ldr r0, [r0, r5]
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022463DC

	thumb_func_start ov41_022463FC
ov41_022463FC: ; 0x022463FC
	push {r3, r4}
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02246428 ; =0xFFFF1FFF
	add r3, r0, #0
	and r1, r2
	str r1, [r0]
	add r3, #8
	ldrh r4, [r3]
	mov r2, #3
	mov r1, #1
	bic r4, r2
	orr r1, r4
	add r0, #0xa
	strh r1, [r3]
	ldrh r1, [r0]
	bic r1, r2
	strh r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_02246428: .word 0xFFFF1FFF
	thumb_func_end ov41_022463FC

	thumb_func_start ov41_0224642C
ov41_0224642C: ; 0x0224642C
	push {r3, r4}
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02246488 ; =0xFFFF1FFF
	add r3, r0, #0
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	add r3, #0x48
	ldrh r4, [r3]
	mov r2, #0x3f
	mov r1, #0x1f
	bic r4, r2
	orr r1, r4
	strh r1, [r3]
	add r3, r0, #0
	add r3, #0x4a
	ldrh r4, [r3]
	mov r1, #0x12
	bic r4, r2
	orr r1, r4
	strh r1, [r3]
	add r1, r0, #0
	ldr r2, _0224648C ; =0x00000AF6
	add r1, #0x40
	strh r2, [r1]
	add r1, r0, #0
	ldr r2, _02246490 ; =0x0000128F
	add r1, #0x44
	strh r2, [r1]
	add r2, r0, #0
	add r2, #8
	ldrh r3, [r2]
	mov r1, #3
	add r0, #0xa
	bic r3, r1
	strh r3, [r2]
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02246488: .word 0xFFFF1FFF
_0224648C: .word 0x00000AF6
_02246490: .word 0x0000128F
	thumb_func_end ov41_0224642C

	thumb_func_start ov41_02246494
ov41_02246494: ; 0x02246494
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r0, [r4, #0x20]
	bl sub_02009418
	bl OamManager_ApplyAndResetBuffers
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246494

	thumb_func_start ov41_022464AC
ov41_022464AC: ; 0x022464AC
	push {r3, lr}
	add r3, r1, #0
	mov r1, #0x76
	mov r2, #0x13
	bl ov41_02246D54
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_022464AC

	thumb_func_start ov41_022464BC
ov41_022464BC: ; 0x022464BC
	push {r4, r5}
	ldrh r5, [r0, #2]
	ldrh r4, [r0]
	lsl r5, r5, #3
	cmp r1, #0
	blt _022464D6
	cmp r2, #0
	blt _022464D6
	cmp r1, r5
	bge _022464D6
	lsl r4, r4, #3
	cmp r2, r4
	blt _022464DC
_022464D6:
	mov r0, #2
	pop {r4, r5}
	bx lr
_022464DC:
	add r4, r2, #0
	mul r4, r5
	add r4, r1, r4
	lsr r5, r4, #0x1f
	lsl r2, r4, #0x1d
	sub r2, r2, r5
	mov r1, #0x1d
	ror r2, r1
	add r1, r5, r2
	lsl r2, r1, #2
	add r1, r3, #0
	ldr r3, [r0, #0x14]
	asr r0, r4, #2
	lsr r0, r0, #0x1d
	add r0, r4, r0
	asr r0, r0, #3
	lsl r0, r0, #2
	ldr r3, [r3, r0]
	mov r0, #0xf
	lsl r0, r2
	lsl r1, r2
	and r0, r3
	cmp r1, r0
	bne _02246512
	mov r0, #1
	pop {r4, r5}
	bx lr
_02246512:
	mov r0, #0
	pop {r4, r5}
	bx lr
	thumb_func_end ov41_022464BC

	thumb_func_start ov41_02246518
ov41_02246518: ; 0x02246518
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov41_022467E4
	mov r2, #0xa
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #0xa
	mov r3, #0x20
	bl ov41_02246CC0
	ldr r0, [r5, #0x20]
	mov r1, #1
	bl sub_020094B0
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_02246C90
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02246518

	thumb_func_start ov41_02246544
ov41_02246544: ; 0x02246544
	push {r4, r5, lr}
	sub sp, #0x1c
	ldr r3, _02246590 ; =ov41_0224C018
	add r5, r0, #0
	str r1, [r5, #0x40]
	add r4, r2, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #2
	str r0, [r2]
	ldr r0, [r5, #0x40]
	bl FreeBgTilemapBuffer
	ldr r0, [r5, #0x40]
	mov r1, #2
	add r2, sp, #0
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0x40]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_02246590: .word ov41_0224C018
	thumb_func_end ov41_02246544

	thumb_func_start ov41_02246594
ov41_02246594: ; 0x02246594
	push {r4, lr}
	add r4, r0, #0
	bl ov41_02246CB0
	add r0, r4, #0
	bl ov41_02246820
	add r0, r4, #0
	bl ov41_02246D2C
	ldr r0, [r4, #4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246594

	thumb_func_start ov41_022465C0
ov41_022465C0: ; 0x022465C0
	ldr r3, _022465C8 ; =FreeBgTilemapBuffer
	ldr r0, [r0, #0x40]
	mov r1, #2
	bx r3
	.balign 4, 0
_022465C8: .word FreeBgTilemapBuffer
	thumb_func_end ov41_022465C0

	thumb_func_start ov41_022465CC
ov41_022465CC: ; 0x022465CC
	ldr r3, _022465D4 ; =sub_02009418
	ldr r0, [r0, #0x20]
	bx r3
	nop
_022465D4: .word sub_02009418
	thumb_func_end ov41_022465CC

	thumb_func_start ov41_022465D8
ov41_022465D8: ; 0x022465D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0224665C ; =0x04000454
	str r3, [sp]
	mov r1, #0
	str r1, [r0]
	sub r0, #0x10
	add r6, r2, #0
	ldr r7, [sp, #0x18]
	str r1, [r0]
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r1, _02246660 ; =0x04000470
	lsl r0, r4, #0xc
	str r0, [r1]
	lsl r0, r6, #0xc
	str r0, [r1]
	mov r0, #0
	str r0, [r1]
	ldr r0, [sp]
	ldr r1, _02246664 ; =FX_SinCosTable_
	asr r0, r0, #4
	lsl r2, r0, #1
	lsl r0, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	ldrsh r0, [r1, r0]
	ldrsh r1, [r1, r2]
	bl G3_RotZ
	ldr r2, [r7, #8]
	ldr r1, [r7, #4]
	ldr r3, [r7]
	ldr r0, _02246668 ; =0x0400046C
	str r3, [r0]
	str r1, [r0]
	neg r1, r4
	str r2, [r0]
	lsl r1, r1, #0xc
	str r1, [r0, #4]
	neg r1, r6
	lsl r1, r1, #0xc
	str r1, [r0, #4]
	mov r1, #0
	str r1, [r0, #4]
	sub r0, #0x28
	str r1, [r0]
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02246644
	add r0, r5, #0
	bl ov41_02246830
_02246644:
	ldr r0, [r5, #0x2c]
	cmp r0, #0
	beq _02246650
	ldr r0, [r5, #0x20]
	bl sub_02008120
_02246650:
	ldr r0, _0224666C ; =0x04000448
	mov r1, #1
	str r1, [r0]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224665C: .word 0x04000454
_02246660: .word 0x04000470
_02246664: .word FX_SinCosTable_
_02246668: .word 0x0400046C
_0224666C: .word 0x04000448
	thumb_func_end ov41_022465D8

	thumb_func_start ov41_02246670
ov41_02246670: ; 0x02246670
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1a
	mov r1, #0xe
	bl NARC_ctor
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov41_02246A94
	mov r0, #0xe
	bl BgConfig_Alloc
	str r0, [r4, #0x40]
	add r0, r4, #0
	bl ov41_022468FC
	pop {r4, pc}
	thumb_func_end ov41_02246670

	thumb_func_start ov41_02246698
ov41_02246698: ; 0x02246698
	push {r4, lr}
	add r4, r0, #0
	bl ov41_02246A20
	ldr r0, [r4, #0x40]
	bl FreeToHeap
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl NARC_dtor
	add r0, r4, #0
	bl ov41_02246B34
	pop {r4, pc}
	thumb_func_end ov41_02246698

	thumb_func_start ov41_022466B8
ov41_022466B8: ; 0x022466B8
	push {r3, lr}
	ldr r0, [r0, #0x40]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	bl OamManager_ApplyAndResetBuffers
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_022466B8

	thumb_func_start ov41_022466C8
ov41_022466C8: ; 0x022466C8
	ldr r3, _022466CC ; =ov41_02246B5C
	bx r3
	.balign 4, 0
_022466CC: .word ov41_02246B5C
	thumb_func_end ov41_022466C8

	thumb_func_start ov41_022466D0
ov41_022466D0: ; 0x022466D0
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _022466EC ; =ov41_0224C06C
	add r3, sp, #0
	mov r2, #5
_022466DA:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022466DA
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_022466EC: .word ov41_0224C06C
	thumb_func_end ov41_022466D0

	thumb_func_start ov41_022466F0
ov41_022466F0: ; 0x022466F0
	push {r3, lr}
	bl NNS_G3dInit
	bl G3X_InitMtxStack
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02246764 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r1, [r0]
	ldr r2, _02246768 ; =0xFFFFCFFD
	and r1, r2
	strh r1, [r0]
	ldrh r3, [r0]
	add r1, r2, #2
	and r3, r1
	mov r1, #0x10
	orr r1, r3
	strh r1, [r0]
	ldrh r3, [r0]
	ldr r1, _0224676C ; =0x0000CFFB
	and r1, r3
	strh r1, [r0]
	add r1, r2, #2
	ldrh r3, [r0]
	lsr r2, r2, #0x11
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r2, _02246770 ; =0x04000540
	mov r0, #2
	ldr r1, _02246774 ; =0xBFFF0000
	str r0, [r2]
	str r1, [r2, #0x40]
	mov r1, #1
	bl GF_3DVramMan_InitFrameTexVramManager
	mov r0, #1
	lsl r0, r0, #0xe
	mov r1, #1
	bl GF_3DVramMan_InitFramePlttVramManager
	pop {r3, pc}
	.balign 4, 0
_02246764: .word 0x04000008
_02246768: .word 0xFFFFCFFD
_0224676C: .word 0x0000CFFB
_02246770: .word 0x04000540
_02246774: .word 0xBFFF0000
	thumb_func_end ov41_022466F0

	thumb_func_start ov41_02246778
ov41_02246778: ; 0x02246778
	push {r4, lr}
	sub sp, #0x10
	ldr r4, _022467C0 ; =_0224BF94
	add r3, sp, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022467C4 ; =0xFFCFFFEF
	and r1, r0
	mov r0, #0x10
	orr r0, r1
	str r0, [r2]
	bl NNS_G2dInitOamManagerModule
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r0, #0x1f
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x13
	mov r1, #1
	bl GX_EngineBToggleLayers
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_022467C0: .word _0224BF94
_022467C4: .word 0xFFCFFFEF
	thumb_func_end ov41_02246778

	thumb_func_start ov41_022467C8
ov41_022467C8: ; 0x022467C8
	push {r3, lr}
	bl NNS_GfdResetFrmTexVramState
	bl NNS_GfdResetFrmPlttVramState
	pop {r3, pc}
	thumb_func_end ov41_022467C8

	thumb_func_start ov41_022467D4
ov41_022467D4: ; 0x022467D4
	push {r3, lr}
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	bl NNS_G2dInitOamManagerModule
	pop {r3, pc}
	thumb_func_end ov41_022467D4

	thumb_func_start ov41_022467E4
ov41_022467E4: ; 0x022467E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02015DDC
	str r0, [r5]
	mov r1, #0x76
	ldr r0, [r4, #0xc]
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r5, #4]
	mov r0, #0x76
	str r0, [r5, #8]
	mov r0, #0
	str r0, [r5, #0xc]
	ldr r0, [r4, #0xc]
	mov r1, #0x4c
	bl AllocFromHeap
	str r0, [r5, #0x10]
	mov r0, #0x13
	str r0, [r5, #0x14]
	mov r0, #0
	str r0, [r5, #0x18]
	mov r0, #1
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_022467E4

	thumb_func_start ov41_02246820
ov41_02246820: ; 0x02246820
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02015E20
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov41_02246820

	thumb_func_start ov41_02246830
ov41_02246830: ; 0x02246830
	ldr r3, _02246838 ; =sub_02015E64
	ldr r0, [r0]
	bx r3
	nop
_02246838: .word sub_02015E64
	thumb_func_end ov41_02246830

	thumb_func_start ov41_0224683C
ov41_0224683C: ; 0x0224683C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, r2, #0
	add r4, r1, #0
	str r2, [sp]
	cmp r0, #0
	ble _02246898
	add r7, r5, #0
	add r6, r4, #0
	add r7, #0xc
_02246856:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #8]
	cmp r1, r0
	blt _02246862
	bl GF_AssertFail
_02246862:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246878
	add r0, r6, #0
	bl sub_02015EA0
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #4]
	lsl r2, r2, #2
	str r0, [r1, r2]
	b _02246882
_02246878:
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #4]
	lsl r2, r1, #2
	mov r1, #0
	str r1, [r0, r2]
_02246882:
	ldr r0, [r7]
	add r4, #8
	add r0, r0, #1
	str r0, [r7]
	ldr r0, [sp, #4]
	add r6, #8
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [sp, #4]
	cmp r1, r0
	blt _02246856
_02246898:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224683C

	thumb_func_start ov41_0224689C
ov41_0224689C: ; 0x0224689C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, r2, #0
	add r4, r1, #0
	str r2, [sp]
	cmp r0, #0
	ble _022468F8
	add r7, r5, #0
	add r6, r4, #0
	add r7, #0x18
_022468B6:
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x14]
	cmp r1, r0
	blt _022468C2
	bl GF_AssertFail
_022468C2:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022468D8
	add r0, r6, #0
	bl sub_02015F1C
	ldr r2, [r5, #0x18]
	ldr r1, [r5, #0x10]
	lsl r2, r2, #2
	str r0, [r1, r2]
	b _022468E2
_022468D8:
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x10]
	lsl r2, r1, #2
	mov r1, #0
	str r1, [r0, r2]
_022468E2:
	ldr r0, [r7]
	add r4, #0xc
	add r0, r0, #1
	str r0, [r7]
	ldr r0, [sp, #4]
	add r6, #0xc
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [sp, #4]
	cmp r1, r0
	blt _022468B6
_022468F8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224689C

	thumb_func_start ov41_022468FC
ov41_022468FC: ; 0x022468FC
	push {r4, r5, lr}
	sub sp, #0x8c
	ldr r5, _02246A0C ; =ov41_0224BFE0
	add r4, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0x70
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xe
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02246A10 ; =ov41_0224BFFC
	add r3, sp, #0x54
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #2
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xe
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02246A14 ; =ov41_0224C034
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #3
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xe
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02246A18 ; =ov41_0224BFC4
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #4
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #4
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xe
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x40]
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	ldr r5, _02246A1C ; =ov41_0224C050
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #5
	str r0, [r3]
	ldr r0, [r4, #0x40]
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #5
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xe
	bl BG_ClearCharDataRange
	ldr r0, [r4, #0x40]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	add sp, #0x8c
	pop {r4, r5, pc}
	nop
_02246A0C: .word ov41_0224BFE0
_02246A10: .word ov41_0224BFFC
_02246A14: .word ov41_0224C034
_02246A18: .word ov41_0224BFC4
_02246A1C: .word ov41_0224C050
	thumb_func_end ov41_022468FC

	thumb_func_start ov41_02246A20
ov41_02246A20: ; 0x02246A20
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #4
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x40]
	mov r1, #5
	bl FreeBgTilemapBuffer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246A20

	thumb_func_start ov41_02246A50
ov41_02246A50: ; 0x02246A50
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x77
	mov r1, #0xe
	bl Create2DGfxResMan
	mov r1, #0x77
	str r0, [r4, #0x34]
	mov r0, #0xe
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x77
	mov r1, #0
	lsl r2, r2, #2
	str r0, [r4, #0x38]
	bl memset
	mov r0, #0x77
	str r0, [r4, #0x3c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246A50

	thumb_func_start ov41_02246A7C
ov41_02246A7C: ; 0x02246A7C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	bl FreeToHeap
	ldr r0, [r4, #0x34]
	bl Destroy2DGfxResMan
	mov r0, #0
	str r0, [r4, #0x3c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246A7C

	thumb_func_start ov41_02246A94
ov41_02246A94: ; 0x02246A94
	push {r4, r5, lr}
	sub sp, #0x24
	ldr r5, _02246B30 ; =ov41_0224BFA4
	add r3, sp, #0x14
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	mov r1, #0x10
	add r0, r2, #0
	add r2, r1, #0
	bl sub_020215C0
	mov r0, #5
	mov r1, #0xe
	bl sub_02022588
	bl sub_020216C8
	bl sub_02022638
	bl NNS_G2dInitOamManagerModule
	mov r0, #0
	str r0, [sp]
	mov r1, #0x7c
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #0x1f
	str r3, [sp, #0xc]
	mov r2, #0xe
	str r2, [sp, #0x10]
	add r2, r0, #0
	bl OamManager_Create
	add r1, r4, #0
	mov r0, #0x30
	add r1, #0x58
	mov r2, #0xe
	bl G2dRenderer_Init
	str r0, [r4, #0x44]
	add r0, r4, #0
	mov r2, #2
	add r0, #0x58
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	mov r0, #8
	mov r1, #0
	mov r2, #0xe
	bl Create2DGfxResObjMan
	str r0, [r4, #0x48]
	mov r0, #5
	mov r1, #1
	mov r2, #0xe
	bl Create2DGfxResObjMan
	str r0, [r4, #0x4c]
	mov r0, #0x30
	mov r1, #2
	mov r2, #0xe
	bl Create2DGfxResObjMan
	str r0, [r4, #0x50]
	mov r0, #0x30
	mov r1, #3
	mov r2, #0xe
	bl Create2DGfxResObjMan
	str r0, [r4, #0x54]
	add sp, #0x24
	pop {r4, r5, pc}
	nop
_02246B30: .word ov41_0224BFA4
	thumb_func_end ov41_02246A94

	thumb_func_start ov41_02246B34
ov41_02246B34: ; 0x02246B34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x44]
	bl sub_02024504
	mov r4, #0
_02246B40:
	ldr r0, [r5, #0x48]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _02246B40
	bl sub_0202168C
	bl sub_02022608
	bl OamManager_Free
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02246B34

	thumb_func_start ov41_02246B5C
ov41_02246B5C: ; 0x02246B5C
	ldr r3, _02246B64 ; =sub_0202457C
	ldr r0, [r0, #0x44]
	bx r3
	nop
_02246B64: .word sub_0202457C
	thumb_func_end ov41_02246B5C

	thumb_func_start ov41_02246B68
ov41_02246B68: ; 0x02246B68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r4, #0
	add r6, r0, #0
	add r7, r1, #0
	add r5, r4, #0
_02246B74:
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r6, r0]
	add r1, r4, #1
	mov r2, #0
	mov r3, #0xe
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [sp, #4]
	cmp r0, #0
	bne _02246B92
	bl GF_AssertFail
_02246B92:
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r2, r4, #0
	bl ov41_022463DC
	ldr r1, [r7]
	add r4, r4, #1
	add r1, r1, r5
	str r0, [r1, #4]
	ldr r1, [r6]
	ldr r0, [r7]
	str r1, [r0, r5]
	add r5, #8
	cmp r4, #0x64
	blt _02246B74
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	mov r1, #0
	ldr r0, [r6, r0]
	add r2, r1, #0
	mov r3, #0xe
	bl GfGfxLoader_LoadFromOpenNarc
	add r4, r0, #0
	ldr r0, [r7, #0x14]
	add r1, r4, #0
	mov r2, #0
	bl sub_020255C4
	ldr r1, [r7, #8]
	add r0, r4, #0
	add r1, r1, #4
	bl NNS_G2dGetUnpackedPaletteData
	ldr r1, [r6]
	ldr r0, [r7, #8]
	str r1, [r0]
	ldr r0, [r7, #8]
	mov r1, #3
	str r1, [r0, #8]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02246B68

	thumb_func_start ov41_02246BEC
ov41_02246BEC: ; 0x02246BEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x87
	add r4, r1, #0
	mov r6, #0
	str r0, [sp, #8]
_02246BFA:
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r1, #0xce
	mov r2, #0
	mov r3, #0xe
	bl GfGfxLoader_LoadFromOpenNarc
	add r2, r6, #0
	add r1, r0, #0
	add r2, #0x64
	add r0, r5, #0
	lsl r7, r2, #3
	bl ov41_022463DC
	ldr r1, [r4]
	mov r2, #0
	add r1, r1, r7
	str r0, [r1, #4]
	ldr r1, [r5]
	ldr r0, [r4]
	mov r3, #0xe
	str r1, [r0, r7]
	add r0, r6, #1
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	ldr r1, [sp, #8]
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	bl sub_020255C4
	ldr r1, [sp, #4]
	mov r0, #0xc
	add r7, r1, #0
	mul r7, r0
	ldr r1, [r4, #8]
	ldr r0, [sp, #0xc]
	add r1, r1, r7
	add r1, r1, #4
	bl NNS_G2dGetUnpackedPaletteData
	ldr r0, [r4, #8]
	add r0, r0, r7
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _02246C70
	bl GF_AssertFail
_02246C70:
	ldr r1, [r5]
	ldr r0, [r4, #8]
	add r6, r6, #1
	str r1, [r0, r7]
	ldr r0, [r4, #8]
	add r1, r0, r7
	mov r0, #1
	str r0, [r1, #8]
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	cmp r6, #0x12
	blt _02246BFA
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02246BEC

	thumb_func_start ov41_02246C90
ov41_02246C90: ; 0x02246C90
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r2, #0
	mov r0, #6
	add r3, r1, #0
	str r2, [sp]
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xeb
	bl GfGfxLoader_LoadFromOpenNarc
	str r0, [r4, #0x30]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246C90

	thumb_func_start ov41_02246CB0
ov41_02246CB0: ; 0x02246CB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x30]
	pop {r4, pc}
	thumb_func_end ov41_02246CB0

	thumb_func_start ov41_02246CC0
ov41_02246CC0: ; 0x02246CC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02007FD4
	str r0, [r5, #0x20]
	ldr r3, _02246D1C ; =NNS_GfdDefaultFuncAllocTexVram
	mov r1, #0
	ldr r3, [r3]
	add r0, r4, #0
	add r2, r1, #0
	blx r3
	str r0, [r5, #0x24]
	ldr r3, _02246D20 ; =NNS_GfdDefaultFuncAllocPlttVram
	add r0, r6, #0
	ldr r3, [r3]
	mov r1, #0
	mov r2, #1
	blx r3
	str r0, [r5, #0x28]
	ldr r3, [r5, #0x24]
	ldr r2, _02246D24 ; =0x7FFF0000
	lsl r1, r3, #0x10
	and r2, r3
	lsr r2, r2, #0x10
	ldr r0, [r5, #0x20]
	lsr r1, r1, #0xd
	lsl r2, r2, #4
	bl sub_020093FC
	ldr r3, [r5, #0x28]
	ldr r2, _02246D28 ; =0xFFFF0000
	lsl r1, r3, #0x10
	and r2, r3
	lsr r2, r2, #0x10
	ldr r0, [r5, #0x20]
	lsr r1, r1, #0xd
	lsl r2, r2, #3
	bl sub_02009408
	mov r0, #1
	str r0, [r5, #0x2c]
	pop {r4, r5, r6, pc}
	nop
_02246D1C: .word NNS_GfdDefaultFuncAllocTexVram
_02246D20: .word NNS_GfdDefaultFuncAllocPlttVram
_02246D24: .word 0x7FFF0000
_02246D28: .word 0xFFFF0000
	thumb_func_end ov41_02246CC0

	thumb_func_start ov41_02246D2C
ov41_02246D2C: ; 0x02246D2C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	bl sub_02008524
	ldr r1, _02246D4C ; =NNS_GfdDefaultFuncFreeTexVram
	ldr r0, [r4, #0x24]
	ldr r1, [r1]
	blx r1
	ldr r1, _02246D50 ; =NNS_GfdDefaultFuncFreePlttVram
	ldr r0, [r4, #0x28]
	ldr r1, [r1]
	blx r1
	mov r0, #0
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
_02246D4C: .word NNS_GfdDefaultFuncFreeTexVram
_02246D50: .word NNS_GfdDefaultFuncFreePlttVram
	thumb_func_end ov41_02246D2C

	thumb_func_start ov41_02246D54
ov41_02246D54: ; 0x02246D54
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r4, #3
	str r0, [sp]
	add r7, r3, #0
	ldr r1, [sp]
	add r0, r7, #0
	add r6, r2, #0
	bl AllocFromHeap
	ldr r2, [sp]
	mov r1, #0
	str r0, [r5]
	bl memset
	add r0, r4, #0
	add r1, r7, #0
	bl Create2DGfxResMan
	str r0, [r5, #0x10]
	str r4, [r5, #4]
	mov r0, #0xc
	add r4, r6, #0
	mul r4, r0
	add r0, r7, #0
	add r1, r4, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r4, #0
	str r0, [r5, #8]
	bl memset
	add r0, r6, #0
	add r1, r7, #0
	bl Create2DGfxResMan
	str r0, [r5, #0x14]
	str r6, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02246D54

	thumb_func_start ov41_02246DA8
ov41_02246DA8: ; 0x02246DA8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02246DBA
	bl Destroy2DGfxResMan
	mov r0, #0
	str r0, [r4, #0x10]
_02246DBA:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02246DC8
	bl Destroy2DGfxResMan
	mov r0, #0
	str r0, [r4, #0x14]
_02246DC8:
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02246DA8

	thumb_func_start ov41_02246DE0
ov41_02246DE0: ; 0x02246DE0
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r2, #2
	add r5, r0, #0
	mov r0, #3
	mov r1, #0xd
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r2, #1
	mov r0, #3
	mov r1, #0xe
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #0x6f
	add r0, r5, #0
	lsl r1, r1, #4
	mov r2, #0xd
	bl OverlayManager_CreateAndGetData
	mov r2, #0x6f
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl memset
	ldr r0, _02246EF0 ; =ov41_02247478
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r0, r5, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	ldr r1, _02246EF4 ; =0x000006DC
	str r0, [r4, r1]
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _02246E3E
	bl sub_020183F0
	ldr r1, _02246EF8 ; =0x000006EC
	b _02246E42
_02246E3E:
	mov r0, #0
	add r1, #0x10
_02246E42:
	str r0, [r4, r1]
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r0, [r5, #8]
	add r1, r4, r1
	bl ov41_02248E84
	add r0, r4, #0
	bl ov41_02247240
	mov r1, #0xd7
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x8d
	mov r2, #0xd
	bl ov41_022499B4
	mov r0, #0xaf
	lsl r0, r0, #2
	mov r1, #0xd
	bl ov41_02245EA0
	mov r1, #0xd9
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r1, [r5]
	add r0, r4, #0
	mov r2, #0xa
	mov r3, #0
	bl ov41_02247288
	add r0, r4, #0
	bl ov41_02247334
	add r0, r4, #0
	mov r1, #0
	bl ov41_02247480
	add r0, r4, #0
	bl ov41_022474D4
	ldr r1, [r5, #0xc]
	add r0, r4, #0
	bl ov41_0224765C
	ldr r0, _02246EFC ; =0x00000568
	mov r2, #0xfd
	add r1, r4, r0
	str r1, [sp]
	mov r1, #1
	sub r0, #0xd0
	lsl r2, r2, #2
	str r1, [sp, #4]
	add r1, r4, r2
	sub r2, #0x8c
	add r0, r4, r0
	add r2, r4, r2
	add r3, r4, #0
	bl ov41_02248F18
	mov r0, #0xd
	bl sub_0201660C
	ldr r1, _02246F00 ; =0x000006B8
	str r0, [r4, r1]
	mov r0, #0xd
	mov r1, #1
	bl AllocWindows
	ldr r2, _02246F04 ; =0x000006BC
	mov r1, #0
	str r0, [r4, r2]
	sub r2, #0xc
	str r1, [r4, r2]
	mov r0, #0x35
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02246EF0: .word ov41_02247478
_02246EF4: .word 0x000006DC
_02246EF8: .word 0x000006EC
_02246EFC: .word 0x00000568
_02246F00: .word 0x000006B8
_02246F04: .word 0x000006BC
	thumb_func_end ov41_02246DE0

	thumb_func_start ov41_02246F08
ov41_02246F08: ; 0x02246F08
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r5, r1, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r7, #0
	mov r6, #0
	bl OverlayManager_GetParentWork
	ldr r1, [r5]
	cmp r1, #0xc
	bhi _02246FD6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02246F30: ; jump table
	.short _02246F4A - _02246F30 - 2 ; case 0
	.short _02246F4A - _02246F30 - 2 ; case 1
	.short _02246F66 - _02246F30 - 2 ; case 2
	.short _02246F76 - _02246F30 - 2 ; case 3
	.short _02246FA4 - _02246F30 - 2 ; case 4
	.short _02246FC6 - _02246F30 - 2 ; case 5
	.short _02246FF4 - _02246F30 - 2 ; case 6
	.short _0224702A - _02246F30 - 2 ; case 7
	.short _02247050 - _02246F30 - 2 ; case 8
	.short _02247094 - _02246F30 - 2 ; case 9
	.short _022470D0 - _02246F30 - 2 ; case 10
	.short _022470EE - _02246F30 - 2 ; case 11
	.short _0224710C - _02246F30 - 2 ; case 12
_02246F4A:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #0xd
	str r1, [sp, #8]
	mov r1, #5
	add r2, r1, #0
	add r3, r6, #0
	bl BeginNormalPaletteFade
	mov r0, #2
	str r0, [r5]
	b _0224712A
_02246F66:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02246FD6
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246F76:
	ldr r0, [r0, #0x1c]
	cmp r0, #1
	bne _02246F9E
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _02247138 ; =0x00000568
	mov r1, #0x1b
	add r0, r4, r0
	mov r2, #0xd7
	mov r3, #0x2f
	bl ov41_0224AC40
	mov r1, #0x6e
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246F9E:
	mov r0, #6
	str r0, [r5]
	b _0224712A
_02246FA4:
	mov r0, #0x6e
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02246FD6
	ldr r0, _02247138 ; =0x00000568
	add r0, r4, r0
	bl ov41_0224AC80
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246FC6:
	ldr r0, _0224713C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	and r1, r0
	ldr r0, _02247140 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	orr r0, r1
	bne _02246FD8
_02246FD6:
	b _0224712A
_02246FD8:
	ldr r0, _02247138 ; =0x00000568
	mov r1, #0x1b
	add r0, r4, r0
	mov r2, #0xd7
	mov r3, #0x30
	bl ov41_0224AC08
	add r0, r6, #0
	bl sub_02002B8C
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224712A
_02246FF4:
	mov r1, #0x6b
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	cmp r0, #3
	bne _0224700C
	add r1, r1, #4
	add r0, r4, #0
	add r1, r4, r1
	bl ov41_022476B8
	mov r0, #7
	str r0, [r5]
_0224700C:
	ldr r0, _02247144 ; =0x00000498
	add r0, r4, r0
	bl ov41_02248E44
	add r0, r4, #0
	bl ov41_02247D44
	ldr r0, _02247138 ; =0x00000568
	add r0, r4, r0
	bl ov41_0224ABF0
	add r0, r4, #0
	bl ov41_02247578
	b _0224712A
_0224702A:
	ldr r0, _02247148 ; =0x000006B4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0224712A
	add r1, r6, #0
	str r1, [r4, r0]
	mov r1, #8
	str r1, [r5]
	mov r1, #4
	sub r0, r0, #4
	str r1, [r4, r0]
	ldr r1, _0224714C ; =0x0000047C
	mov r2, #0xe
	add r0, r4, r1
	sub r1, #0x88
	add r1, r4, r1
	bl ov41_0224B4E8
	b _0224712A
_02247050:
	mov r1, #0x6b
	lsl r1, r1, #4
	ldr r0, [r4, r1]
	cmp r0, #9
	bne _0224706A
	add r1, r1, #4
	add r0, r4, #0
	add r1, r4, r1
	bl ov41_02247828
	mov r0, #0xa
	str r0, [r5]
	b _0224712A
_0224706A:
	cmp r0, #8
	bne _0224707E
	mov r0, #9
	str r0, [r5]
	mov r0, #5
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov41_02247D64
	b _0224712A
_0224707E:
	add r0, r4, #0
	bl ov41_02247B7C
	mov r1, #0x6b
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, _0224714C ; =0x0000047C
	add r0, r4, r0
	bl ov41_0224B50C
	b _0224712A
_02247094:
	mov r0, #0x6b
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #6
	bne _022470AA
	mov r1, #1
	add r0, #0x10
	str r1, [r4, r0]
	mov r0, #0xb
	str r0, [r5]
	b _0224712A
_022470AA:
	cmp r1, #7
	bne _022470BA
	add r1, r6, #0
	add r0, #0x10
	str r1, [r4, r0]
	mov r0, #0xb
	str r0, [r5]
	b _0224712A
_022470BA:
	add r0, r4, #0
	bl ov41_02247DF8
	mov r1, #0x6b
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, _0224714C ; =0x0000047C
	add r0, r4, r0
	bl ov41_0224B50C
	b _0224712A
_022470D0:
	ldr r0, _02247148 ; =0x000006B4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0224712A
	add r2, r6, #0
	str r2, [r4, r0]
	mov r1, #6
	str r1, [r5]
	sub r0, r0, #4
	str r2, [r4, r0]
	ldr r0, _0224714C ; =0x0000047C
	add r0, r4, r0
	bl ov41_0224B518
	b _0224712A
_022470EE:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #0xd
	str r1, [sp, #8]
	add r1, r6, #0
	add r2, r1, #0
	add r3, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _0224712A
_0224710C:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224712A
	add r0, r6, #0
	str r0, [r5]
	mov r0, #0x6b
	mov r1, #0xa
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _0224714C ; =0x0000047C
	mov r6, #1
	add r0, r4, r0
	bl ov41_0224B518
_0224712A:
	add r0, r4, #0
	bl ov41_0224726C
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02247138: .word 0x00000568
_0224713C: .word gSystem
_02247140: .word gSystem + 0x40
_02247144: .word 0x00000498
_02247148: .word 0x000006B4
_0224714C: .word 0x0000047C
	thumb_func_end ov41_02246F08

	thumb_func_start ov41_02247150
ov41_02247150: ; 0x02247150
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	add r0, r6, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	mov r0, #0x1b
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _02247182
	ldr r0, [r5, #0x10]
	mov r1, #8
	bl GameStats_AddSpecial
	mov r1, #0xfd
	lsl r1, r1, #2
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x14]
	add r1, r4, r1
	bl ov41_022479A8
_02247182:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	beq _0224719C
	mov r1, #0x1b
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	cmp r1, #1
	bne _02247198
	mov r1, #1
	str r1, [r0]
	b _0224719C
_02247198:
	mov r1, #0
	str r1, [r0]
_0224719C:
	ldr r0, [r5, #0x20]
	cmp r0, #0
	beq _022471AA
	ldr r1, _02247230 ; =0x000006EC
	ldr r1, [r4, r1]
	bl sub_02018410
_022471AA:
	ldr r0, _02247234 ; =0x000006B8
	ldr r0, [r4, r0]
	bl sub_02016624
	ldr r0, _02247238 ; =0x000006BC
	mov r1, #1
	ldr r0, [r4, r0]
	bl WindowArray_dtor
	add r0, r4, #0
	bl ov41_022476A8
	ldr r0, _0224723C ; =0x00000498
	add r0, r4, r0
	bl ov41_02248F6C
	add r0, r4, #0
	bl ov41_02247568
	add r0, r4, #0
	bl ov41_022474C4
	add r0, r4, #0
	bl ov41_02247310
	add r0, r4, #0
	bl ov41_022473F0
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_02245ECC
	mov r0, #0xd9
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #8
	add r0, r4, r0
	bl ov41_022499DC
	add r0, r4, #0
	bl ov41_02247274
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl sub_02021238
	cmp r0, #1
	beq _0224721A
	bl GF_AssertFail
_0224721A:
	add r0, r6, #0
	bl OverlayManager_FreeData
	mov r0, #0xd
	bl DestroyHeap
	mov r0, #0xe
	bl DestroyHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02247230: .word 0x000006EC
_02247234: .word 0x000006B8
_02247238: .word 0x000006BC
_0224723C: .word 0x00000498
	thumb_func_end ov41_02247150

	thumb_func_start ov41_02247240
ov41_02247240: ; 0x02247240
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	bl ov41_02246130
	add r0, r4, #0
	bl ov41_02246170
	add r0, r4, #0
	add r1, sp, #0
	bl ov41_022463B0
	add r0, r4, #0
	add r1, sp, #0
	bl ov41_02246250
	add r0, sp, #0
	bl ov41_022463D4
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02247240

	thumb_func_start ov41_0224726C
ov41_0224726C: ; 0x0224726C
	ldr r3, _02247270 ; =ov41_0224621C
	bx r3
	.balign 4, 0
_02247270: .word ov41_0224621C
	thumb_func_end ov41_0224726C

	thumb_func_start ov41_02247274
ov41_02247274: ; 0x02247274
	push {r4, lr}
	add r4, r0, #0
	bl ov41_0224626C
	add r0, r4, #0
	bl ov41_022461D0
	bl ov41_02246150
	pop {r4, pc}
	thumb_func_end ov41_02247274

	thumb_func_start ov41_02247288
ov41_02247288: ; 0x02247288
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	mov r1, #0xd9
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x10]
	lsl r1, r1, #2
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x30]
	add r6, r3, #0
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x40]
	str r2, [sp, #0x30]
	str r0, [sp, #0x24]
	ldr r0, [r5, r1]
	str r0, [sp, #0x28]
	add r0, r1, #0
	sub r0, #8
	add r0, r5, r0
	add r1, #0x90
	str r0, [sp, #0x2c]
	add r0, r5, r1
	add r1, sp, #0x10
	bl ov41_02247F3C
	cmp r6, #0
	add r2, sp, #0
	bne _022472DC
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0xe
	bl ov41_02247FE0
	b _022472EA
_022472DC:
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r4, #0
	mov r3, #0xe
	bl ov41_02247FFC
_022472EA:
	add r0, r5, #0
	add r1, sp, #0
	bl ov41_022495C8
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov41_02248158
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #0xe
	bl ov41_0224825C
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02247288

	thumb_func_start ov41_02247310
ov41_02247310: ; 0x02247310
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_022482A8
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_022480E0
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_02247F90
	pop {r4, pc}
	thumb_func_end ov41_02247310

	thumb_func_start ov41_02247334
ov41_02247334: ; 0x02247334
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5]
	str r0, [sp]
	ldr r0, [r5, #4]
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	str r0, [sp, #8]
	ldr r0, [r5, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x40]
	str r0, [sp, #0x10]
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #0x28]
	mov r0, #0xd9
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	str r1, [sp, #0x14]
	add r1, r0, #0
	sub r1, #8
	add r1, r5, r1
	str r1, [sp, #0x18]
	mov r1, #0xe
	str r1, [sp, #0x1c]
	mov r1, #2
	str r1, [sp, #0x20]
	mov r1, #1
	add r0, r0, #4
	str r1, [sp, #0x24]
	add r0, r5, r0
	add r1, sp, #0
	bl ov41_02248488
	mov r0, #0xda
	lsl r0, r0, #2
	mov r1, #0
	add r0, r5, r0
	add r2, r1, #0
	bl ov41_022487F8
	mov r6, #0
_0224738C:
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r5, r0
	add r1, r6, #0
	bl ov41_02248ED4
	add r7, r0, #0
	mov r4, #0
	cmp r7, #0
	ble _022473B4
_022473A0:
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	add r2, r6, #0
	bl ov41_022485DC
	add r4, r4, #1
	cmp r4, r7
	blt _022473A0
_022473B4:
	add r6, r6, #1
	cmp r6, #0x64
	blt _0224738C
	mov r7, #0xda
	mov r6, #0x61
	mov r4, #0
	lsl r7, r7, #2
	lsl r6, r6, #2
_022473C4:
	add r0, r5, r6
	add r1, r4, #0
	bl ov41_02248EE8
	add r2, r0, #0
	cmp r2, #0x12
	bge _022473DA
	add r0, r5, r7
	mov r1, #1
	bl ov41_022485DC
_022473DA:
	add r4, r4, #1
	cmp r4, #0x12
	blt _022473C4
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov41_02248724
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02247334

	thumb_func_start ov41_022473F0
ov41_022473F0: ; 0x022473F0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_02248940
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_022486F8
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_022484C0
	pop {r4, pc}
	thumb_func_end ov41_022473F0

	thumb_func_start ov41_02247414
ov41_02247414: ; 0x02247414
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, _02247474 ; =0x04000008
	mov r2, #3
	ldrh r3, [r0]
	mov r1, #1
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0, #2]
	bic r1, r2
	strh r1, [r0, #2]
	ldrh r3, [r0, #4]
	mov r1, #2
	bic r3, r2
	orr r1, r3
	strh r1, [r0, #4]
	ldrh r3, [r0, #6]
	mov r1, #3
	bic r3, r2
	add r2, r3, #0
	orr r2, r1
	strh r2, [r0, #6]
	add r3, r1, #0
	ldr r0, [r4, #0x40]
	add r2, r1, #0
	sub r3, #0x13
	bl BgSetPosTextAndCommit
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov41_0224888C
	mov r1, #0
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r2, #2
	add r3, r1, #0
	str r1, [sp]
	bl ov41_022488D8
	add sp, #4
	pop {r3, r4, pc}
	nop
_02247474: .word 0x04000008
	thumb_func_end ov41_02247414

	thumb_func_start ov41_02247478
ov41_02247478: ; 0x02247478
	ldr r3, _0224747C ; =ov41_02246494
	bx r3
	.balign 4, 0
_0224747C: .word ov41_02246494
	thumb_func_end ov41_02247478

	thumb_func_start ov41_02247480
ov41_02247480: ; 0x02247480
	push {r3, lr}
	sub sp, #0x30
	ldr r2, [r0, #0x40]
	str r2, [sp]
	mov r2, #0x1a
	str r2, [sp, #4]
	lsl r2, r1, #1
	add r1, r2, #0
	add r1, #0x79
	str r1, [sp, #8]
	mov r1, #0x85
	str r1, [sp, #0xc]
	mov r1, #1
	add r2, #0x7a
	str r2, [sp, #0x10]
	mov r2, #0
	str r1, [sp, #0x1c]
	str r1, [sp, #0x20]
	mov r1, #2
	str r1, [sp, #0x24]
	mov r1, #0xe
	str r1, [sp, #0x2c]
	ldr r1, _022474C0 ; =0x000004B4
	str r2, [sp, #0x14]
	add r0, r0, r1
	add r1, sp, #0
	str r2, [sp, #0x18]
	str r2, [sp, #0x28]
	bl ov41_02249C7C
	add sp, #0x30
	pop {r3, pc}
	.balign 4, 0
_022474C0: .word 0x000004B4
	thumb_func_end ov41_02247480

	thumb_func_start ov41_022474C4
ov41_022474C4: ; 0x022474C4
	ldr r1, _022474CC ; =0x000004B4
	ldr r3, _022474D0 ; =ov41_02249CC4
	add r0, r0, r1
	bx r3
	.balign 4, 0
_022474CC: .word 0x000004B4
_022474D0: .word ov41_02249CC4
	thumb_func_end ov41_022474C4

	thumb_func_start ov41_022474D4
ov41_022474D4: ; 0x022474D4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x4e
	ldr r2, _02247550 ; =0x000006EC
	lsl r0, r0, #4
	add r0, r4, r0
	add r1, r4, #0
	add r2, r4, r2
	bl ov41_0224A27C
	mov r0, #0x4e
	lsl r0, r0, #4
	mov r1, #0
	ldr r2, _02247554 ; =ov41_022475B4
	add r0, r4, r0
	add r3, r4, #0
	str r1, [sp]
	bl ov41_0224A5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x4e
	lsl r0, r0, #4
	ldr r2, _02247558 ; =ov41_022475D4
	add r0, r4, r0
	mov r1, #1
	add r3, r4, #0
	bl ov41_0224A5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x4e
	lsl r0, r0, #4
	ldr r2, _0224755C ; =ov41_022475F4
	add r0, r4, r0
	mov r1, #2
	add r3, r4, #0
	bl ov41_0224A5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x4e
	lsl r0, r0, #4
	ldr r2, _02247560 ; =ov41_02247628
	add r0, r4, r0
	mov r1, #3
	add r3, r4, #0
	bl ov41_0224A5D4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x4e
	lsl r0, r0, #4
	ldr r2, _02247564 ; =ov41_02247598
	add r0, r4, r0
	mov r1, #4
	add r3, r4, #0
	bl ov41_0224A5D4
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02247550: .word 0x000006EC
_02247554: .word ov41_022475B4
_02247558: .word ov41_022475D4
_0224755C: .word ov41_022475F4
_02247560: .word ov41_02247628
_02247564: .word ov41_02247598
	thumb_func_end ov41_022474D4

	thumb_func_start ov41_02247568
ov41_02247568: ; 0x02247568
	add r1, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #4
	ldr r3, _02247574 ; =ov41_0224A3E4
	add r0, r1, r0
	bx r3
	.balign 4, 0
_02247574: .word ov41_0224A3E4
	thumb_func_end ov41_02247568

	thumb_func_start ov41_02247578
ov41_02247578: ; 0x02247578
	mov r1, #0x4e
	lsl r1, r1, #4
	ldr r3, _02247584 ; =ov41_0224A54C
	add r0, r0, r1
	bx r3
	nop
_02247584: .word ov41_0224A54C
	thumb_func_end ov41_02247578

	thumb_func_start ov41_02247588
ov41_02247588: ; 0x02247588
	mov r1, #0x4e
	lsl r1, r1, #4
	ldr r3, _02247594 ; =ov41_0224A580
	add r0, r0, r1
	bx r3
	nop
_02247594: .word ov41_0224A580
	thumb_func_end ov41_02247588

	thumb_func_start ov41_02247598
ov41_02247598: ; 0x02247598
	push {r4, lr}
	mov r0, #0xda
	add r4, r1, #0
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_02248998
	cmp r0, #0
	beq _022475B2
	mov r0, #0x6b
	mov r1, #3
	lsl r0, r0, #4
	str r1, [r4, r0]
_022475B2:
	pop {r4, pc}
	thumb_func_end ov41_02247598

	thumb_func_start ov41_022475B4
ov41_022475B4: ; 0x022475B4
	push {r4, lr}
	mov r0, #0xda
	add r4, r1, #0
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_0224894C
	add r1, r0, #0
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r2, #0
	bl ov41_02248790
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_022475B4

	thumb_func_start ov41_022475D4
ov41_022475D4: ; 0x022475D4
	push {r4, lr}
	mov r0, #0xda
	add r4, r1, #0
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_0224894C
	add r1, r0, #0
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r2, #1
	bl ov41_02248790
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_022475D4

	thumb_func_start ov41_022475F4
ov41_022475F4: ; 0x022475F4
	push {r4, lr}
	mov r0, #0x6b
	add r4, r1, #0
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02247624
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov41_0224895C
	add r2, r0, #0
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ov41_022487F8
	mov r0, #0x6b
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
_02247624:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_022475F4

	thumb_func_start ov41_02247628
ov41_02247628: ; 0x02247628
	push {r4, lr}
	mov r0, #0x6b
	add r4, r1, #0
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #1
	beq _02247658
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov41_0224895C
	add r2, r0, #0
	mov r0, #0xda
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ov41_022487F8
	mov r0, #0x6b
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
_02247658:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02247628

	thumb_func_start ov41_0224765C
ov41_0224765C: ; 0x0224765C
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r0, #0
	add r2, sp, #0
	mov r0, #0
	add r3, r1, #0
	add r5, r2, #0
	add r1, r0, #0
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	stmia r5!, {r0, r1}
	ldr r0, [r4, #0x40]
	add r1, r2, #0
	str r0, [sp]
	ldr r0, [r4, #0x44]
	mov r2, #0xf
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x48
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0x10]
	mov r0, #6
	str r3, [sp, #0xc]
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	str r0, [sp, #0x24]
	ldr r0, _022476A4 ; =0x00000568
	add r0, r4, r0
	bl ov41_0224AA08
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_022476A4: .word 0x00000568
	thumb_func_end ov41_0224765C

	thumb_func_start ov41_022476A8
ov41_022476A8: ; 0x022476A8
	ldr r1, _022476B0 ; =0x00000568
	ldr r3, _022476B4 ; =ov41_0224AB40
	add r0, r0, r1
	bx r3
	.balign 4, 0
_022476B0: .word 0x00000568
_022476B4: .word ov41_0224AB40
	thumb_func_end ov41_022476A8

	thumb_func_start ov41_022476B8
ov41_022476B8: ; 0x022476B8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _022476DC ; =ov41_022476E0
	mov r1, #0x10
	mov r2, #0xa
	mov r3, #0xd
	bl sub_02007200
	bl sub_0201F988
	str r5, [r0]
	str r4, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	nop
_022476DC: .word ov41_022476E0
	thumb_func_end ov41_022476B8

	thumb_func_start ov41_022476E0
ov41_022476E0: ; 0x022476E0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #9
	bls _022476EE
	b _02247822
_022476EE:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022476FA: ; jump table
	.short _0224770E - _022476FA - 2 ; case 0
	.short _02247730 - _022476FA - 2 ; case 1
	.short _0224774A - _022476FA - 2 ; case 2
	.short _02247766 - _022476FA - 2 ; case 3
	.short _0224777A - _022476FA - 2 ; case 4
	.short _022477A2 - _022476FA - 2 ; case 5
	.short _022477C2 - _022476FA - 2 ; case 6
	.short _022477E8 - _022476FA - 2 ; case 7
	.short _02247804 - _022476FA - 2 ; case 8
	.short _02247818 - _022476FA - 2 ; case 9
_0224770E:
	mov r0, #0xda
	ldr r1, [r4]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #3
	mov r2, #0
	bl ov41_02248750
	cmp r0, #0
	bne _02247726
	bl GF_AssertFail
_02247726:
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247730:
	mov r0, #0xda
	ldr r1, [r4]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ov41_02248998
	cmp r0, #0
	beq _02247822
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224774A:
	mov r0, #1
	str r0, [sp]
	mov r0, #8
	add r1, r0, #0
	sub r1, #0x18
	mov r2, #0
	mov r3, #0xa
	bl sub_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247766:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _02247822
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224777A:
	mov r0, #0x4e
	ldr r1, [r4]
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	mov r2, #8
	bl ov41_0224A5A4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	blt _02247822
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022477A2:
	mov r1, #7
	add r0, r4, #0
	mvn r1, r1
	mov r2, #5
	mov r3, #8
	bl ov41_02247A48
	cmp r0, #0
	beq _02247822
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022477C2:
	ldr r0, [r4]
	mov r1, #1
	bl ov41_02247480
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0, #0x40]
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4]
	bl ov41_02247AB4
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022477E8:
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	str r0, [sp]
	mov r0, #8
	sub r2, #0x10
	mov r3, #0xa
	bl sub_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247804:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _02247822
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247818:
	ldr r1, [r4, #4]
	mov r2, #1
	str r2, [r1]
	bl sub_02007234
_02247822:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_022476E0

	thumb_func_start ov41_02247828
ov41_02247828: ; 0x02247828
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, _0224784C ; =ov41_02247850
	mov r1, #0x10
	mov r2, #0xa
	mov r3, #0xd
	bl sub_02007200
	bl sub_0201F988
	str r5, [r0]
	str r4, [r0, #4]
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	nop
_0224784C: .word ov41_02247850
	thumb_func_end ov41_02247828

	thumb_func_start ov41_02247850
ov41_02247850: ; 0x02247850
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldr r1, [r4, #0xc]
	cmp r1, #9
	bls _0224785E
	b _022479A2
_0224785E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0224786A: ; jump table
	.short _0224787E - _0224786A - 2 ; case 0
	.short _0224789A - _0224786A - 2 ; case 1
	.short _022478AE - _0224786A - 2 ; case 2
	.short _022478E2 - _0224786A - 2 ; case 3
	.short _02247902 - _0224786A - 2 ; case 4
	.short _0224792C - _0224786A - 2 ; case 5
	.short _02247948 - _0224786A - 2 ; case 6
	.short _0224795C - _0224786A - 2 ; case 7
	.short _0224797E - _0224786A - 2 ; case 8
	.short _02247998 - _0224786A - 2 ; case 9
_0224787E:
	mov r0, #1
	str r0, [sp]
	mov r0, #8
	add r1, r0, #0
	sub r1, #0x18
	mov r2, #0
	mov r3, #0xa
	bl sub_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224789A:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _022479A2
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022478AE:
	ldr r0, [r4]
	bl ov41_02247B5C
	ldr r0, [r4]
	bl ov41_02247414
	ldr r0, [r4]
	bl ov41_02247588
	ldr r0, [r4]
	mov r1, #0
	bl ov41_02247480
	ldr r0, [r4]
	mov r2, #3
	add r3, r2, #0
	ldr r0, [r0, #0x40]
	mov r1, #1
	sub r3, #0x2b
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_022478E2:
	mov r1, #8
	add r2, r1, #0
	add r0, r4, #0
	sub r2, #0xd
	add r3, r1, #0
	bl ov41_02247A48
	cmp r0, #0
	beq _022479A2
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247902:
	mov r0, #0x4e
	ldr r1, [r4]
	lsl r0, r0, #4
	add r0, r1, r0
	mov r1, #0
	add r2, r1, #0
	sub r2, #8
	bl ov41_0224A5A4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	blt _022479A2
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224792C:
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	str r0, [sp]
	mov r0, #8
	sub r2, #0x10
	mov r3, #0xa
	bl sub_0200B484
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247948:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _022479A2
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224795C:
	mov r0, #0xda
	ldr r1, [r4]
	lsl r0, r0, #2
	add r0, r1, r0
	mov r1, #0
	add r2, r1, #0
	bl ov41_02248750
	cmp r0, #0
	bne _02247974
	bl GF_AssertFail
_02247974:
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_0224797E:
	mov r0, #0xda
	ldr r1, [r4]
	lsl r0, r0, #2
	add r0, r1, r0
	bl ov41_02248998
	cmp r0, #0
	beq _022479A2
	ldr r0, [r4, #0xc]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, pc}
_02247998:
	ldr r1, [r4, #4]
	mov r2, #1
	str r2, [r1]
	bl sub_02007234
_022479A2:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02247850

	thumb_func_start ov41_022479A8
ov41_022479A8: ; 0x022479A8
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0202BC60
	ldr r1, [sp]
	ldr r2, [sp]
	add r1, #0x84
	ldr r1, [r1]
	add r0, r6, #0
	add r2, #0x78
	bl sub_0202BC88
	cmp r4, #0
	beq _022479E8
	add r0, r4, #0
	mov r1, #0xd
	bl PlayerProfile_GetPlayerName_NewString
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0202BDC8
	add r0, r5, #0
	bl String_dtor
_022479E8:
	ldr r0, [sp]
	mov r5, #0
	add r7, r0, #0
	ldr r4, [r0, #0x1c]
	add r7, #0x14
	cmp r4, r7
	beq _02247A0E
_022479F6:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02247A08
	ldr r1, [r4]
	add r0, r6, #0
	add r2, r5, #0
	bl sub_0202BCAC
	add r5, r5, #1
_02247A08:
	ldr r4, [r4, #8]
	cmp r4, r7
	bne _022479F6
_02247A0E:
	ldr r0, [sp]
	ldr r4, [r0, #0xc]
	add r7, r0, #4
	cmp r4, r7
	beq _02247A30
_02247A18:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02247A2A
	ldr r1, [r4]
	add r0, r6, #0
	add r2, r5, #0
	bl sub_0202BCAC
	add r5, r5, #1
_02247A2A:
	ldr r4, [r4, #8]
	cmp r4, r7
	bne _02247A18
_02247A30:
	ldr r1, [sp]
	add r0, r6, #0
	ldr r1, [r1, #0x74]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0202BD60
	add r0, r6, #0
	bl sub_0202BC38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_022479A8

	thumb_func_start ov41_02247A48
ov41_02247A48: ; 0x02247A48
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #8
	bge _02247A64
	mov r0, #0xfd
	ldr r3, [r5]
	lsl r0, r0, #2
	add r0, r3, r0
	bl ov41_022480F8
_02247A64:
	ldr r0, [r5, #8]
	cmp r0, #1
	blt _02247AA2
	ldr r0, [r5]
	mov r1, #2
	ldr r0, [r0, #0x40]
	add r2, r1, #0
	add r3, r4, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0x40]
	mov r2, #2
	add r3, r4, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5]
	mov r1, #2
	ldr r0, [r0, #0x40]
	mov r2, #5
	add r3, r6, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0x40]
	mov r2, #5
	add r3, r6, #0
	bl ScheduleSetBgPosText
_02247AA2:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	cmp r0, r7
	ble _02247AB0
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02247AB0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02247A48

	thumb_func_start ov41_02247AB4
ov41_02247AB4: ; 0x02247AB4
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	ldr r0, [r4, #0x40]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r1, #3
	ldr r0, [r4, #0x40]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #0x40]
	add r3, sp, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0x19
	strb r0, [r3, #0x10]
	mov r0, #4
	strb r0, [r3, #0x11]
	ldrb r0, [r3, #0x12]
	mov r1, #0xf
	ldr r2, _02247B54 ; =0x000006EC
	bic r0, r1
	ldr r1, [r4, r2]
	sub r2, #0x34
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	mov r1, #0xf
	and r1, r5
	orr r0, r1
	strb r0, [r3, #0x12]
	ldr r0, [r4, r2]
	add r1, sp, #0
	bl sub_020166FC
	add r0, r4, #0
	mov r1, #1
	bl ov41_02247D1C
	ldr r0, _02247B58 ; =0x04000008
	mov r2, #3
	ldrh r3, [r0]
	mov r1, #2
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	ldrh r3, [r0, #2]
	mov r1, #1
	bic r3, r2
	orr r1, r3
	strh r1, [r0, #2]
	ldrh r3, [r0, #4]
	mov r1, #3
	bic r3, r2
	orr r1, r3
	strh r1, [r0, #4]
	ldrh r1, [r0, #6]
	bic r1, r2
	strh r1, [r0, #6]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02247B54: .word 0x000006EC
_02247B58: .word 0x04000008
	thumb_func_end ov41_02247AB4

	thumb_func_start ov41_02247B5C
ov41_02247B5C: ; 0x02247B5C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02247B78 ; =0x000006B8
	ldr r0, [r4, r0]
	bl sub_020169CC
	add r0, r4, #0
	bl ov41_02247D3C
	ldr r0, [r4, #0x40]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	pop {r4, pc}
	.balign 4, 0
_02247B78: .word 0x000006B8
	thumb_func_end ov41_02247B5C

	thumb_func_start ov41_02247B7C
ov41_02247B7C: ; 0x02247B7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02247BB0 ; =0x000006B8
	ldr r0, [r5, r0]
	bl sub_020168F4
	add r4, r0, #0
	beq _02247B96
	cmp r4, #1
	beq _02247B9A
	cmp r4, #2
	beq _02247B9E
	b _02247BA0
_02247B96:
	mov r0, #4
	pop {r3, r4, r5, pc}
_02247B9A:
	mov r4, #8
	b _02247BA0
_02247B9E:
	mov r4, #9
_02247BA0:
	ldr r0, _02247BB0 ; =0x000006B8
	ldr r0, [r5, r0]
	bl sub_020169C0
	ldr r1, _02247BB4 ; =0x000006EC
	str r0, [r5, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02247BB0: .word 0x000006B8
_02247BB4: .word 0x000006EC
	thumb_func_end ov41_02247B7C

	thumb_func_start ov41_02247BB8
ov41_02247BB8: ; 0x02247BB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _02247C70 ; =0x000006DC
	str r1, [sp, #0x14]
	ldr r0, [r5, r0]
	add r7, r2, #0
	add r4, r3, #0
	bl Options_GetFrame
	add r6, r0, #0
	mov r0, #0
	mov r1, #0xe0
	mov r2, #0xe
	bl LoadFontPal1
	str r4, [sp]
	add r0, sp, #0x20
	ldrb r1, [r0, #0x10]
	mov r2, #3
	add r3, r7, #0
	str r1, [sp, #4]
	ldrb r0, [r0, #0x14]
	ldr r1, _02247C74 ; =0x000006BC
	str r0, [sp, #8]
	mov r0, #7
	str r0, [sp, #0xc]
	mov r0, #0x5a
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x40]
	ldr r1, [r5, r1]
	bl AddWindowParameterized
	ldr r0, _02247C74 ; =0x000006BC
	mov r1, #0xf
	ldr r0, [r5, r0]
	bl FillWindowPixelBuffer
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	mov r1, #3
	mov r2, #0x3c
	mov r3, #8
	bl LoadUserFrameGfx2
	ldr r0, _02247C74 ; =0x000006BC
	mov r1, #0
	ldr r0, [r5, r0]
	mov r2, #0x3c
	mov r3, #8
	bl DrawFrameAndWindow2
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xd7
	mov r3, #0xd
	bl NewMsgDataFromNarc
	ldr r1, [sp, #0x14]
	add r6, r0, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	mov r3, #0
	str r3, [sp]
	ldr r0, _02247C78 ; =0x0001020F
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02247C74 ; =0x000006BC
	str r3, [sp, #0xc]
	ldr r0, [r5, r0]
	mov r1, #1
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl DestroyMsgData
	ldr r0, _02247C74 ; =0x000006BC
	ldr r0, [r5, r0]
	bl CopyWindowToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02247C70: .word 0x000006DC
_02247C74: .word 0x000006BC
_02247C78: .word 0x0001020F
	thumb_func_end ov41_02247BB8

	thumb_func_start ov41_02247C7C
ov41_02247C7C: ; 0x02247C7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _02247CF4 ; =0x000006BC
	add r4, r1, #0
	ldr r0, [r5, r0]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xd7
	mov r3, #0xd
	bl NewMsgDataFromNarc
	add r1, r4, #0
	add r7, r0, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #8
	mov r1, #0xd
	bl String_ctor
	add r4, r0, #0
	ldr r0, _02247CF8 ; =0x000006E8
	add r1, r4, #0
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	ldr r0, _02247CFC ; =0x0001020F
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _02247CF4 ; =0x000006BC
	str r3, [sp, #0xc]
	ldr r0, [r5, r0]
	mov r1, #1
	add r2, r4, #0
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, _02247CF4 ; =0x000006BC
	ldr r0, [r5, r0]
	bl CopyWindowToVram
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02247CF4: .word 0x000006BC
_02247CF8: .word 0x000006E8
_02247CFC: .word 0x0001020F
	thumb_func_end ov41_02247C7C

	thumb_func_start ov41_02247D00
ov41_02247D00: ; 0x02247D00
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02247D18 ; =0x000006BC
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, _02247D18 ; =0x000006BC
	ldr r0, [r4, r0]
	bl RemoveWindow
	pop {r4, pc}
	nop
_02247D18: .word 0x000006BC
	thumb_func_end ov41_02247D00

	thumb_func_start ov41_02247D1C
ov41_02247D1C: ; 0x02247D1C
	push {r3, lr}
	sub sp, #8
	mov r2, #0x1b
	str r2, [sp]
	mov r2, #2
	mov r3, #1
	str r2, [sp, #4]
	bl ov41_02247BB8
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_02247D1C

	thumb_func_start ov41_02247D34
ov41_02247D34: ; 0x02247D34
	ldr r3, _02247D38 ; =ov41_02247C7C
	bx r3
	.balign 4, 0
_02247D38: .word ov41_02247C7C
	thumb_func_end ov41_02247D34

	thumb_func_start ov41_02247D3C
ov41_02247D3C: ; 0x02247D3C
	ldr r3, _02247D40 ; =ov41_02247D00
	bx r3
	.balign 4, 0
_02247D40: .word ov41_02247D00
	thumb_func_end ov41_02247D3C

	thumb_func_start ov41_02247D44
ov41_02247D44: ; 0x02247D44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xfd
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov41_022482B4
	add r1, r0, #0
	ldr r0, _02247D60 ; =0x00000568
	add r0, r4, r0
	bl ov41_0224AC98
	pop {r4, pc}
	nop
_02247D60: .word 0x00000568
	thumb_func_end ov41_02247D44

	thumb_func_start ov41_02247D64
ov41_02247D64: ; 0x02247D64
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r4, #0x40]
	add r3, sp, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #0x19
	strb r0, [r3, #0x10]
	mov r0, #4
	strb r0, [r3, #0x11]
	ldrb r0, [r3, #0x12]
	mov r1, #0xf
	ldr r2, _02247DEC ; =0x000006EC
	bic r0, r1
	ldr r1, [r4, r2]
	sub r2, #0x34
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	mov r1, #0xf
	and r1, r5
	orr r0, r1
	strb r0, [r3, #0x12]
	ldr r0, [r4, r2]
	bl sub_020169CC
	ldr r0, _02247DF0 ; =0x000006B8
	add r1, sp, #0
	ldr r0, [r4, r0]
	bl sub_020166FC
	add r0, r4, #0
	mov r1, #2
	bl ov41_02247D34
	ldr r0, _02247DF4 ; =0x04000008
	mov r2, #3
	ldrh r3, [r0]
	mov r1, #2
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
	ldrh r3, [r0, #2]
	mov r1, #1
	bic r3, r2
	orr r1, r3
	strh r1, [r0, #2]
	ldrh r3, [r0, #4]
	mov r1, #3
	bic r3, r2
	orr r1, r3
	strh r1, [r0, #4]
	ldrh r1, [r0, #6]
	bic r1, r2
	strh r1, [r0, #6]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_02247DEC: .word 0x000006EC
_02247DF0: .word 0x000006B8
_02247DF4: .word 0x04000008
	thumb_func_end ov41_02247D64

	thumb_func_start ov41_02247DF8
ov41_02247DF8: ; 0x02247DF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02247E2C ; =0x000006B8
	ldr r0, [r5, r0]
	bl sub_020168F4
	add r4, r0, #0
	beq _02247E12
	cmp r4, #1
	beq _02247E16
	cmp r4, #2
	beq _02247E1A
	b _02247E1C
_02247E12:
	mov r0, #5
	pop {r3, r4, r5, pc}
_02247E16:
	mov r4, #6
	b _02247E1C
_02247E1A:
	mov r4, #7
_02247E1C:
	ldr r0, _02247E2C ; =0x000006B8
	ldr r0, [r5, r0]
	bl sub_020169C0
	ldr r1, _02247E30 ; =0x000006EC
	str r0, [r5, r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02247E2C: .word 0x000006B8
_02247E30: .word 0x000006EC
	thumb_func_end ov41_02247DF8

	thumb_func_start ov41_02247E34
ov41_02247E34: ; 0x02247E34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	str r1, [sp]
	add r7, r2, #0
	add r0, r3, #0
	sub r0, r0, r7
	mov r1, #3
	str r3, [sp, #4]
	ldr r4, [sp, #0x2c]
	ldr r5, [sp, #0x30]
	bl _u32_div_f
	add r1, r7, r0
	lsl r0, r0, #1
	add r0, r7, r0
	str r0, [sp, #8]
	ldr r0, [sp]
	str r1, [sp, #0xc]
	sub r0, r0, r6
	mov r1, #3
	bl _u32_div_f
	add r2, r6, r0
	lsl r0, r0, #1
	ldr r1, [sp, #0x28]
	add r0, r6, r0
	cmp r1, #0xf
	bhi _02247F36
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02247E7A: ; jump table
	.short _02247E9A - _02247E7A - 2 ; case 0
	.short _02247EA2 - _02247E7A - 2 ; case 1
	.short _02247EAA - _02247E7A - 2 ; case 2
	.short _02247EB2 - _02247E7A - 2 ; case 3
	.short _02247EBC - _02247E7A - 2 ; case 4
	.short _02247EC6 - _02247E7A - 2 ; case 5
	.short _02247ED0 - _02247E7A - 2 ; case 6
	.short _02247EDA - _02247E7A - 2 ; case 7
	.short _02247EE6 - _02247E7A - 2 ; case 8
	.short _02247EF0 - _02247E7A - 2 ; case 9
	.short _02247EFA - _02247E7A - 2 ; case 10
	.short _02247F04 - _02247E7A - 2 ; case 11
	.short _02247F10 - _02247E7A - 2 ; case 12
	.short _02247F1A - _02247E7A - 2 ; case 13
	.short _02247F24 - _02247E7A - 2 ; case 14
	.short _02247F2E - _02247E7A - 2 ; case 15
_02247E9A:
	str r7, [r4]
	add sp, #0x10
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EA2:
	str r7, [r4]
	add sp, #0x10
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EAA:
	str r7, [r4]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EB2:
	ldr r0, [sp]
	str r7, [r4]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EBC:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	str r0, [r4]
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EC6:
	ldr r0, [sp, #0xc]
	add sp, #0x10
	str r0, [r4]
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247ED0:
	ldr r1, [sp, #0xc]
	add sp, #0x10
	str r1, [r4]
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EDA:
	ldr r0, [sp, #0xc]
	str r0, [r4]
	ldr r0, [sp]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EE6:
	ldr r0, [sp, #8]
	add sp, #0x10
	str r0, [r4]
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EF0:
	ldr r0, [sp, #8]
	add sp, #0x10
	str r0, [r4]
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247EFA:
	ldr r1, [sp, #8]
	add sp, #0x10
	str r1, [r4]
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F04:
	ldr r0, [sp, #8]
	str r0, [r4]
	ldr r0, [sp]
	add sp, #0x10
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F10:
	ldr r0, [sp, #4]
	add sp, #0x10
	str r0, [r4]
	str r6, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F1A:
	ldr r0, [sp, #4]
	add sp, #0x10
	str r0, [r4]
	str r2, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F24:
	ldr r1, [sp, #4]
	add sp, #0x10
	str r1, [r4]
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02247F2E:
	ldr r0, [sp, #4]
	str r0, [r4]
	ldr r0, [sp]
	str r0, [r5]
_02247F36:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02247E34

	thumb_func_start ov41_02247F3C
ov41_02247F3C: ; 0x02247F3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1]
	mov r2, #0
	str r0, [r4, #0x2c]
	ldr r0, [r1, #4]
	str r0, [r4, #0x30]
	ldr r0, [r1, #8]
	str r0, [r4, #0x34]
	ldr r0, [r1, #0xc]
	str r0, [r4, #0x38]
	ldr r0, [r1, #0x10]
	str r0, [r4, #0x3c]
	ldr r0, [r1, #0x14]
	str r0, [r4, #0x40]
	ldr r0, [r1, #0x18]
	str r0, [r4, #0x44]
	str r2, [r4, #0x74]
	ldr r0, [r1, #0x1c]
	str r0, [r4]
	add r0, r4, #4
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	add r0, r4, #0
	add r0, #0x14
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r2, [r4, #0x24]
	ldr r0, [r1, #0x20]
	add r1, r4, #0
	str r0, [r4, #0x28]
	ldr r0, [r4]
	add r1, #0x78
	mov r2, #3
	bl ov41_022499F0
	add r4, #0x14
	add r1, r4, #0
	bl ov41_02249A50
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02247F3C

	thumb_func_start ov41_02247F90
ov41_02247F90: ; 0x02247F90
	push {r4, lr}
	add r4, r0, #0
	bl ov41_02248038
	add r0, r4, #0
	bl ov41_022480E0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x88
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02247F90

	thumb_func_start ov41_02247FAC
ov41_02247FAC: ; 0x02247FAC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [sp, #0x20]
	add r6, r1, #0
	str r0, [sp]
	add r5, r2, #0
	add r0, r4, #0
	add r7, r3, #0
	ldr r1, [r4, #0x3c]
	add r0, #0x78
	add r2, r6, #0
	add r3, r5, #0
	bl ov41_022495F0
	add r0, r4, #0
	ldr r1, [sp, #0x1c]
	add r0, #0x78
	bl ov41_02249700
	add r4, #0x78
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	add r1, r7, #0
	bl ov41_0224971C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02247FAC

	thumb_func_start ov41_02247FE0
ov41_02247FE0: ; 0x02247FE0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	str r3, [sp]
	add r5, r1, #0
	add r4, r2, #0
	ldr r1, [r6, #0x3c]
	add r0, #0x78
	add r2, r5, #0
	add r3, r4, #0
	bl ov41_022495F0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_02247FE0

	thumb_func_start ov41_02247FFC
ov41_02247FFC: ; 0x02247FFC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	str r3, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r5, r1, #0
	add r4, r2, #0
	add r0, r6, #0
	ldr r1, [r6, #0x3c]
	add r0, #0x78
	add r2, r5, #0
	add r3, r4, #0
	bl ov41_02249604
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02247FFC

	thumb_func_start ov41_02248020
ov41_02248020: ; 0x02248020
	ldr r3, _0224802C ; =ov41_02249A50
	add r2, r0, #0
	add r0, r1, #0
	ldr r1, [r2, #0x20]
	bx r3
	nop
_0224802C: .word ov41_02249A50
	thumb_func_end ov41_02248020

	thumb_func_start ov41_02248030
ov41_02248030: ; 0x02248030
	ldr r3, _02248034 ; =ov41_02249A60
	bx r3
	.balign 4, 0
_02248034: .word ov41_02249A60
	thumb_func_end ov41_02248030

	thumb_func_start ov41_02248038
ov41_02248038: ; 0x02248038
	ldr r3, _02248040 ; =ov41_022496E8
	add r0, #0x78
	bx r3
	nop
_02248040: .word ov41_022496E8
	thumb_func_end ov41_02248038

	thumb_func_start ov41_02248044
ov41_02248044: ; 0x02248044
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r5, [r4, #0x24]
	ldr r0, [r4, #0x28]
	cmp r5, r0
	bge _0224809E
	ldr r0, [r4, #0x44]
	str r0, [sp]
	ldr r0, [r4, #0x2c]
	str r0, [sp, #4]
	ldr r5, [r4, #0x30]
	lsl r0, r1, #2
	ldr r0, [r5, r0]
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	ldr r0, [r0]
	str r2, [sp, #0x10]
	str r3, [sp, #0x14]
	str r1, [sp, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x38]
	ldrb r0, [r0, r1]
	str r0, [sp, #0x1c]
	add r0, sp, #0
	bl ov41_02245EE0
	ldr r1, [sp, #0x30]
	add r5, r0, #0
	bl ov41_02246014
	ldr r0, [r4]
	add r1, r5, #0
	mov r2, #0
	bl ov41_022499F0
	add r1, r4, #4
	bl ov41_02249A50
	ldr r0, [r4, #0x24]
	add sp, #0x20
	add r0, r0, #1
	str r0, [r4, #0x24]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0224809E:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02248044

	thumb_func_start ov41_022480A4
ov41_022480A4: ; 0x022480A4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r3, r2, #0
	ldr r5, [r4, #0x24]
	ldr r2, [r4, #0x28]
	cmp r5, r2
	bge _022480C2
	mov r2, #1
	bl ov41_02248324
	ldr r0, [r4, #0x24]
	add r0, r0, #1
	str r0, [r4, #0x24]
	mov r0, #1
	pop {r3, r4, r5, pc}
_022480C2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_022480A4

	thumb_func_start ov41_022480C8
ov41_022480C8: ; 0x022480C8
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov41_02249A60
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	str r0, [r4, #0x24]
	bpl _022480DE
	bl GF_AssertFail
_022480DE:
	pop {r4, pc}
	thumb_func_end ov41_022480C8

	thumb_func_start ov41_022480E0
ov41_022480E0: ; 0x022480E0
	push {r4, lr}
	add r4, r0, #0
	add r0, r4, #4
	bl ov41_02249A70
	add r0, r4, #0
	add r0, #0x14
	bl ov41_02249A70
	mov r0, #0
	str r0, [r4, #0x24]
	pop {r4, pc}
	thumb_func_end ov41_022480E0

	thumb_func_start ov41_022480F8
ov41_022480F8: ; 0x022480F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r5, #4
	add r4, r1, #0
	add r6, r2, #0
	bl ov41_02249BE8
	add r5, #0x14
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov41_02249BE8
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022480F8

	thumb_func_start ov41_02248114
ov41_02248114: ; 0x02248114
	ldr r3, _0224811C ; =ov41_02249BE8
	add r0, #0x14
	bx r3
	nop
_0224811C: .word ov41_02249BE8
	thumb_func_end ov41_02248114

	thumb_func_start ov41_02248120
ov41_02248120: ; 0x02248120
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	neg r4, r2
	neg r7, r1
	add r0, r5, #4
	add r1, r7, #0
	add r2, r4, #0
	add r6, r3, #0
	bl ov41_02249BE8
	ldr r2, [sp, #0x18]
	add r0, r5, #4
	add r1, r6, #0
	bl ov41_02249BE8
	add r0, r5, #0
	add r0, #0x14
	add r1, r7, #0
	add r2, r4, #0
	bl ov41_02249BE8
	add r5, #0x14
	ldr r2, [sp, #0x18]
	add r0, r5, #0
	add r1, r6, #0
	bl ov41_02249BE8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248120

	thumb_func_start ov41_02248158
ov41_02248158: ; 0x02248158
	ldr r3, _02248160 ; =ov41_02248164
	mov r1, #0
	mvn r1, r1
	bx r3
	.balign 4, 0
_02248160: .word ov41_02248164
	thumb_func_end ov41_02248158

	thumb_func_start ov41_02248164
ov41_02248164: ; 0x02248164
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r7, #0
	ldr r4, [r7, #0x1c]
	add r6, #0x14
	add r5, r1, #0
	cmp r4, r6
	beq _02248192
_02248174:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4]
	bne _02248184
	add r1, r5, #0
	bl ov41_02246014
	b _0224818A
_02248184:
	add r1, r5, #0
	bl ov41_02249700
_0224818A:
	ldr r4, [r4, #8]
	sub r5, r5, #1
	cmp r4, r6
	bne _02248174
_02248192:
	ldr r4, [r7, #0xc]
	add r6, r7, #4
	sub r5, #8
	cmp r4, r6
	beq _022481BA
_0224819C:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldr r0, [r4]
	bne _022481AC
	add r1, r5, #0
	bl ov41_02246014
	b _022481B2
_022481AC:
	add r1, r5, #0
	bl ov41_02249700
_022481B2:
	ldr r4, [r4, #8]
	sub r5, r5, #1
	cmp r4, r6
	bne _0224819C
_022481BA:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248164

	thumb_func_start ov41_022481BC
ov41_022481BC: ; 0x022481BC
	push {r3, lr}
	mov r1, #0x12
	add r0, sp, #0
	strb r1, [r0]
	mov r1, #0x8f
	strb r1, [r0, #1]
	mov r1, #0x8a
	strb r1, [r0, #2]
	mov r1, #0xf6
	strb r1, [r0, #3]
	add r0, sp, #0
	bl sub_020252F4
	pop {r3, pc}
	thumb_func_end ov41_022481BC

	thumb_func_start ov41_022481D8
ov41_022481D8: ; 0x022481D8
	push {r3, lr}
	mov r3, #0x12
	add r0, sp, #0
	strb r3, [r0]
	mov r3, #0x8f
	strb r3, [r0, #1]
	mov r3, #0x8a
	strb r3, [r0, #2]
	mov r3, #0xf6
	strb r3, [r0, #3]
	add r0, sp, #0
	bl sub_020253F0
	pop {r3, pc}
	thumb_func_end ov41_022481D8

	thumb_func_start ov41_022481F4
ov41_022481F4: ; 0x022481F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r5, [r0, #0x1c]
	str r0, [sp]
	str r0, [sp, #4]
	add r0, #0x14
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	str r0, [sp, #4]
	cmp r5, r0
	beq _0224822A
_0224820C:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov41_02249AA8
	cmp r0, #1
	bne _02248222
	add sp, #0xc
	add r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_02248222:
	ldr r5, [r5, #8]
	ldr r0, [sp, #4]
	cmp r5, r0
	bne _0224820C
_0224822A:
	ldr r0, [sp]
	ldr r5, [r0, #0xc]
	add r0, r0, #4
	str r0, [sp, #8]
	cmp r5, r0
	beq _02248254
_02248236:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov41_02249AA8
	cmp r0, #1
	bne _0224824C
	add sp, #0xc
	add r0, r5, #0
	pop {r4, r5, r6, r7, pc}
_0224824C:
	ldr r5, [r5, #8]
	ldr r0, [sp, #8]
	cmp r5, r0
	bne _02248236
_02248254:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_022481F4

	thumb_func_start ov41_0224825C
ov41_0224825C: ; 0x0224825C
	push {r3, r4, r5, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	str r0, [sp]
	mov r0, #0x1a
	lsl r1, r4, #2
	str r0, [sp, #4]
	add r0, r1, #0
	add r0, #0x86
	str r0, [sp, #8]
	add r0, r1, #0
	add r0, #0x87
	str r0, [sp, #0xc]
	mov r0, #0x88
	str r0, [sp, #0x14]
	mov r0, #0x10
	str r0, [sp, #0x18]
	mov r0, #2
	str r0, [sp, #0x1c]
	mov r0, #1
	str r0, [sp, #0x20]
	mov r0, #0xd
	str r0, [sp, #0x24]
	mov r0, #0
	add r1, #0x88
	str r0, [sp, #0x28]
	add r0, r5, #0
	str r1, [sp, #0x10]
	add r0, #0x48
	add r1, sp, #0
	str r2, [sp, #0x2c]
	bl ov41_02249C7C
	str r4, [r5, #0x74]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224825C

	thumb_func_start ov41_022482A8
ov41_022482A8: ; 0x022482A8
	ldr r3, _022482B0 ; =ov41_02249CC4
	add r0, #0x48
	bx r3
	nop
_022482B0: .word ov41_02249CC4
	thumb_func_end ov41_022482A8

	thumb_func_start ov41_022482B4
ov41_022482B4: ; 0x022482B4
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end ov41_022482B4

	thumb_func_start ov41_022482B8
ov41_022482B8: ; 0x022482B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	ldr r6, [r7, #0x1c]
	mov r4, #0
	add r7, #0x14
	str r1, [sp]
	str r2, [sp, #4]
	add r5, r4, #0
	cmp r6, r7
	beq _02248316
_022482CE:
	add r0, r6, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_02248400
	cmp r4, #0
	bge _022482E0
	neg r1, r4
	b _022482E2
_022482E0:
	add r1, r4, #0
_022482E2:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bge _022482EC
	neg r2, r0
	b _022482EE
_022482EC:
	add r2, r0, #0
_022482EE:
	cmp r2, r1
	ble _022482F4
	add r4, r0, #0
_022482F4:
	cmp r5, #0
	bge _022482FC
	neg r1, r5
	b _022482FE
_022482FC:
	add r1, r5, #0
_022482FE:
	ldr r0, [sp, #8]
	cmp r0, #0
	bge _02248308
	neg r2, r0
	b _0224830A
_02248308:
	add r2, r0, #0
_0224830A:
	cmp r2, r1
	ble _02248310
	add r5, r0, #0
_02248310:
	ldr r6, [r6, #8]
	cmp r6, r7
	bne _022482CE
_02248316:
	ldr r0, [sp]
	str r4, [r0]
	ldr r0, [sp, #4]
	str r5, [r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_022482B8

	thumb_func_start ov41_02248324
ov41_02248324: ; 0x02248324
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	str r0, [sp, #0xc]
	str r2, [sp, #0x14]
	str r1, [sp, #0x10]
	add r0, r1, #0
	add r1, sp, #0x54
	add r2, sp, #0x50
	add r4, r3, #0
	bl ov41_02249B44
	ldr r0, [sp, #0x10]
	add r1, sp, #0x4c
	add r2, sp, #0x48
	bl ov41_02249B94
	add r0, sp, #0x30
	str r0, [sp]
	ldr r0, [sp, #0x10]
	add r1, sp, #0x44
	add r2, sp, #0x34
	add r3, sp, #0x40
	bl ov41_02249BAC
	mov r0, #0x76
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r5, #0
	str r0, [sp, #0x20]
	ldr r6, [sp, #0x54]
	ldr r0, [sp, #0x4c]
	ldr r7, [sp, #0x44]
	add r1, r6, r0
	ldr r0, [sp, #0x34]
	add r4, r5, #0
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x48]
	str r0, [sp, #0x24]
	add r1, r0, r1
	ldr r0, [sp, #0x30]
	sub r0, r1, r0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x40]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x2c]
	add r0, #0x78
	str r0, [sp, #0x2c]
_02248388:
	str r4, [sp]
	add r0, sp, #0x3c
	str r0, [sp, #4]
	add r0, sp, #0x38
	str r0, [sp, #8]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	add r0, r1, r0
	ldr r1, [sp, #0x18]
	add r2, r6, r7
	bl ov41_02247E34
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	ldr r3, [sp, #0x20]
	bl ov41_02249820
	add r4, r4, #1
	orr r5, r0
	cmp r4, #0x10
	blt _02248388
	cmp r5, #0
	beq _022483DE
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _022483D0
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r1, #0x14
	str r1, [sp, #0xc]
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_022483D0:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [r1, #0x20]
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_022483DE:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _022483F2
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r1, r1, #4
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_022483F2:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	ldr r1, [r1, #0x10]
	bl ov41_02249A50
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248324

	thumb_func_start ov41_02248400
ov41_02248400: ; 0x02248400
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl ov41_02249B94
	add r0, r6, #0
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov41_02249B44
	add r0, sp, #4
	str r0, [sp]
	add r0, r6, #0
	add r1, sp, #0x10
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov41_02249BAC
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0xc]
	add r2, r0, r1
	mov r1, #0x8a
	sub r2, r1, r2
	ldr r1, [sp, #0x20]
	add r1, r0, r1
	ldr r0, [sp, #8]
	sub r1, r1, r0
	ldr r0, [sp, #0x14]
	sub r1, #0xf6
	add r6, r0, r3
	mov r3, #0x12
	sub r3, r3, r6
	ldr r6, [sp, #0x1c]
	add r6, r0, r6
	ldr r0, [sp, #4]
	sub r6, r6, r0
	sub r6, #0x8f
	cmp r2, #0
	ble _0224845C
	str r2, [r5]
	b _0224846A
_0224845C:
	cmp r1, #0
	ble _02248466
	neg r0, r1
	str r0, [r5]
	b _0224846A
_02248466:
	mov r0, #0
	str r0, [r5]
_0224846A:
	cmp r3, #0
	ble _02248474
	add sp, #0x24
	str r3, [r4]
	pop {r3, r4, r5, r6, pc}
_02248474:
	cmp r6, #0
	ble _02248480
	neg r0, r6
	add sp, #0x24
	str r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02248480:
	mov r0, #0
	str r0, [r4]
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_02248400

	thumb_func_start ov41_02248488
ov41_02248488: ; 0x02248488
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r5, r0, #0
	str r1, [r5, #0x44]
	ldr r1, [r4, #4]
	str r1, [r5, #0x48]
	ldr r1, [r4, #8]
	str r1, [r5, #0x4c]
	ldr r1, [r4, #0xc]
	str r1, [r5, #0x50]
	ldr r1, [r4, #0x10]
	str r1, [r5, #0x54]
	ldr r1, [r4, #0x14]
	str r1, [r5, #0x58]
	ldr r1, [r4, #0x18]
	str r1, [r5, #8]
	ldr r1, [r4, #0x28]
	str r1, [r5, #4]
	mov r1, #0
	bl ov41_0224888C
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_022489A8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02248488

	thumb_func_start ov41_022484C0
ov41_022484C0: ; 0x022484C0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov41_022486F8
	add r5, r6, #0
	mov r4, #0
	add r5, #0xc
_022484CE:
	add r0, r5, #0
	bl ov41_02248A6C
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #4
	blt _022484CE
	add r0, r6, #0
	mov r1, #0
	mov r2, #0x8c
	bl memset
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022484C0

	thumb_func_start ov41_022484E8
ov41_022484E8: ; 0x022484E8
	push {r3, lr}
	cmp r0, #0
	beq _022484F8
	cmp r0, #1
	beq _02248568
	cmp r0, #2
	beq _02248576
	pop {r3, pc}
_022484F8:
	cmp r1, #5
	bgt _02248500
	mov r0, #0
	pop {r3, pc}
_02248500:
	cmp r1, #0xb
	bgt _02248508
	mov r0, #1
	pop {r3, pc}
_02248508:
	cmp r1, #0x11
	bgt _02248510
	mov r0, #2
	pop {r3, pc}
_02248510:
	cmp r1, #0x15
	bgt _02248518
	mov r0, #3
	pop {r3, pc}
_02248518:
	cmp r1, #0x1c
	bgt _02248520
	mov r0, #4
	pop {r3, pc}
_02248520:
	cmp r1, #0x21
	bgt _02248528
	mov r0, #5
	pop {r3, pc}
_02248528:
	cmp r1, #0x26
	bgt _02248530
	mov r0, #6
	pop {r3, pc}
_02248530:
	cmp r1, #0x2a
	bgt _02248538
	mov r0, #7
	pop {r3, pc}
_02248538:
	cmp r1, #0x31
	bgt _02248540
	mov r0, #8
	pop {r3, pc}
_02248540:
	cmp r1, #0x37
	bgt _02248548
	mov r0, #9
	pop {r3, pc}
_02248548:
	cmp r1, #0x3c
	bgt _02248550
	mov r0, #0xa
	pop {r3, pc}
_02248550:
	cmp r1, #0x47
	bgt _02248558
	mov r0, #0xb
	pop {r3, pc}
_02248558:
	cmp r1, #0x5b
	bgt _02248560
	mov r0, #0xc
	pop {r3, pc}
_02248560:
	cmp r1, #0x63
	bgt _02248582
	mov r0, #0xd
	pop {r3, pc}
_02248568:
	add r0, r2, #0
	bl ov41_02248EF4
	mov r1, #9
	bl _s32_div_f
	pop {r3, pc}
_02248576:
	add r0, r2, #0
	bl ov41_02248EF4
	mov r1, #9
	bl _s32_div_f
_02248582:
	pop {r3, pc}
	thumb_func_end ov41_022484E8

	thumb_func_start ov41_02248584
ov41_02248584: ; 0x02248584
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #0
	beq _02248598
	cmp r0, #1
	beq _022485CA
	cmp r0, #2
	beq _022485CA
	pop {r3, r4, r5, pc}
_02248598:
	mov r0, #0xa
	str r0, [r5]
	mov r0, #0x12
	str r0, [r4]
	bl MTRandom
	ldr r2, [sp, #0x10]
	mov r1, #0x6c
	sub r1, r1, r2
	bl _u32_div_f
	ldr r0, [r5]
	add r0, r0, r1
	str r0, [r5]
	bl MTRandom
	ldr r2, [sp, #0x14]
	mov r1, #0x7d
	sub r1, r1, r2
	bl _u32_div_f
	ldr r0, [r4]
	add r0, r0, r1
	str r0, [r4]
	pop {r3, r4, r5, pc}
_022485CA:
	ldr r0, [sp, #0x18]
	bl ov41_02248EF4
	add r1, r5, #0
	add r2, r4, #0
	bl ov41_02248B48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02248584

	thumb_func_start ov41_022485DC
ov41_022485DC: ; 0x022485DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	ldr r0, [r5, #0x58]
	add r4, r2, #0
	str r4, [sp, #0x40]
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x44]
	add r6, r1, #0
	mov r1, #0
	str r0, [sp, #0x2c]
	str r1, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r6, #0
	beq _02248604
	cmp r6, #1
	beq _02248610
	cmp r6, #2
	beq _0224861E
	b _0224862C
_02248604:
	ldr r0, [r5, #0x50]
	str r4, [sp, #0xc]
	ldrb r0, [r0, r4]
	add r7, r1, #0
	str r0, [sp, #0x44]
	b _02248630
_02248610:
	add r0, r4, #0
	str r0, [sp, #0xc]
	add r0, #0x64
	str r0, [sp, #0xc]
	add r7, r4, #1
	str r1, [sp, #0x44]
	b _02248630
_0224861E:
	add r0, r4, #0
	str r0, [sp, #0xc]
	add r0, #0x64
	str r0, [sp, #0xc]
	add r7, r4, #1
	str r1, [sp, #0x44]
	b _02248630
_0224862C:
	bl GF_AssertFail
_02248630:
	ldr r0, [sp, #0xc]
	ldr r1, [r5, #0x48]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	lsl r1, r7, #2
	str r0, [sp, #0x30]
	ldr r2, [r5, #0x4c]
	cmp r0, #0
	ldr r1, [r2, r1]
	str r1, [sp, #0x34]
	bne _0224864A
	bl GF_AssertFail
_0224864A:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	bne _02248654
	bl GF_AssertFail
_02248654:
	ldr r2, [r5, #4]
	add r0, r6, #0
	add r1, r4, #0
	bl ov41_022484E8
	add r7, r0, #0
	add r0, sp, #0x28
	bl ov41_02245EE0
	str r0, [sp, #0x10]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x10]
	add r2, r6, #0
	bl ov41_022499F0
	mov r1, #0xc
	mul r1, r6
	add r1, r5, r1
	ldr r2, [r1, #0xc]
	lsl r1, r7, #4
	add r1, r2, r1
	ldr r1, [r1, #0xc]
	str r0, [sp, #0x14]
	bl ov41_02249A50
	ldr r0, [sp, #0x14]
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl ov41_02249B94
	ldr r0, [sp, #0x1c]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r2, sp, #0x24
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	add r3, sp, #0x20
	str r0, [sp, #8]
	add r0, r6, #0
	bl ov41_02248584
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x20]
	bl ov41_02249AF4
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov41_02248B20
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_022485DC

	thumb_func_start ov41_022486C4
ov41_022486C4: ; 0x022486C4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0xc
	add r5, r0, #0
	mul r1, r4
	add r7, r3, #0
	add r1, r5, r1
	add r6, r2, #0
	ldr r2, [r1, #0xc]
	lsl r1, r6, #4
	add r0, r7, #0
	add r1, r2, r1
	bl ov41_02249A50
	ldr r1, [r7]
	add r0, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov41_02248B20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_022486C4

	thumb_func_start ov41_022486F0
ov41_022486F0: ; 0x022486F0
	ldr r3, _022486F4 ; =ov41_02249A60
	bx r3
	.balign 4, 0
_022486F4: .word ov41_02249A60
	thumb_func_end ov41_022486F0

	thumb_func_start ov41_022486F8
ov41_022486F8: ; 0x022486F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r7, #0
_022486FE:
	ldr r0, [r5, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _0224871A
	add r4, r6, #0
_02248708:
	ldr r0, [r5, #0xc]
	add r0, r0, r4
	bl ov41_02249A70
	ldr r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02248708
_0224871A:
	add r7, r7, #1
	add r5, #0xc
	cmp r7, #3
	blt _022486FE
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_022486F8

	thumb_func_start ov41_02248724
ov41_02248724: ; 0x02248724
	push {r4, r5, r6, lr}
	mov r5, #0
	mvn r5, r5
	bl ov41_02248A94
	add r6, r0, #0
	ldr r4, [r6, #8]
	cmp r4, r6
	beq _0224874C
_02248736:
	ldr r0, [r4, #4]
	cmp r0, #2
	bhi _02248744
	ldr r0, [r4]
	add r1, r5, #0
	bl ov41_02246014
_02248744:
	ldr r4, [r4, #8]
	sub r5, r5, #1
	cmp r4, r6
	bne _02248736
_0224874C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02248724

	thumb_func_start ov41_02248750
ov41_02248750: ; 0x02248750
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	ldr r1, [r5, #0x3c]
	add r4, r2, #0
	cmp r1, #0
	bne _02248788
	ldr r1, [r5]
	mov r2, #0xc
	mul r2, r1
	str r4, [sp]
	add r2, r5, r2
	ldr r2, [r2, #0x14]
	add r3, r6, #0
	bl ov41_02248B84
	mov r0, #0xc
	mul r0, r6
	str r6, [r5]
	add r0, r5, r0
	str r4, [r0, #0x14]
	add r0, r5, #0
	bl ov41_02248724
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02248788:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02248750

	thumb_func_start ov41_02248790
ov41_02248790: ; 0x02248790
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	str r2, [sp, #8]
	bl ov41_0224895C
	add r7, r0, #0
	ldr r0, [sp, #4]
	mov r1, #0xc
	mul r1, r0
	ldr r0, [sp]
	mov r4, #1
	add r6, r0, r1
	ldr r0, [r6, #0x10]
	cmp r0, #1
	ble _022487F2
_022487B2:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _022487C4
	ldr r1, [r6, #0x10]
	add r0, r4, r7
	bl _s32_div_f
	add r5, r1, #0
	b _022487CC
_022487C4:
	sub r5, r7, r4
	bpl _022487CC
	ldr r0, [r6, #0x10]
	add r5, r5, r0
_022487CC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r5, #0
	bl ov41_02248ABC
	ldr r1, [r0, #8]
	cmp r1, r0
	beq _022487EA
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r5, #0
	bl ov41_02248750
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_022487EA:
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	cmp r4, r0
	blt _022487B2
_022487F2:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248790

	thumb_func_start ov41_022487F8
ov41_022487F8: ; 0x022487F8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0
	add r5, r0, #0
	add r6, r2, #0
	bl ov41_02248A18
	mov r0, #0xc
	mul r0, r4
	str r4, [r5]
	add r0, r5, r0
	str r6, [r0, #0x14]
	add r0, r5, #0
	mov r1, #1
	bl ov41_02248A18
	add r0, r5, #0
	bl ov41_02248724
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022487F8

	thumb_func_start ov41_02248820
ov41_02248820: ; 0x02248820
	push {r3, lr}
	mov r1, #0x12
	add r0, sp, #0
	strb r1, [r0]
	mov r1, #0x8f
	strb r1, [r0, #1]
	mov r1, #0xa
	strb r1, [r0, #2]
	mov r1, #0x76
	strb r1, [r0, #3]
	add r0, sp, #0
	bl sub_020252F4
	pop {r3, pc}
	thumb_func_end ov41_02248820

	thumb_func_start ov41_0224883C
ov41_0224883C: ; 0x0224883C
	push {r3, lr}
	mov r3, #0x12
	add r0, sp, #0
	strb r3, [r0]
	mov r3, #0x8f
	strb r3, [r0, #1]
	mov r3, #0xa
	strb r3, [r0, #2]
	mov r3, #0x76
	strb r3, [r0, #3]
	add r0, sp, #0
	bl sub_020253F0
	pop {r3, pc}
	thumb_func_end ov41_0224883C

	thumb_func_start ov41_02248858
ov41_02248858: ; 0x02248858
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl ov41_02248A94
	add r5, r0, #0
	ldr r4, [r5, #8]
	cmp r4, r5
	beq _02248886
_0224886C:
	ldr r3, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov41_02249AA8
	cmp r0, #1
	bne _02248880
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_02248880:
	ldr r4, [r4, #8]
	cmp r4, r5
	bne _0224886C
_02248886:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02248858

	thumb_func_start ov41_0224888C
ov41_0224888C: ; 0x0224888C
	push {r3, r4, r5, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, [r5, #0x54]
	add r4, r1, #0
	str r0, [sp]
	mov r0, #0x1a
	lsl r1, r4, #1
	str r0, [sp, #4]
	add r0, r1, #0
	add r0, #0x81
	str r0, [sp, #8]
	mov r0, #0x85
	str r0, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x14]
	mov r0, #0x81
	str r0, [sp, #0x18]
	mov r0, #3
	str r0, [sp, #0x1c]
	mov r0, #1
	str r0, [sp, #0x20]
	mov r0, #2
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x28]
	mov r0, #0xe
	add r1, #0x82
	str r0, [sp, #0x2c]
	add r0, r5, #0
	str r1, [sp, #0x10]
	add r0, #0x5c
	add r1, sp, #0
	bl ov41_02249C7C
	str r4, [r5, #0x40]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224888C

	thumb_func_start ov41_022488D8
ov41_022488D8: ; 0x022488D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5, #0x54]
	add r4, r1, #0
	str r0, [sp, #8]
	mov r0, #0x1a
	lsl r1, r4, #1
	str r0, [sp, #0xc]
	add r0, r1, #0
	add r0, #0x81
	str r0, [sp, #0x10]
	mov r0, #0x85
	str r0, [sp, #0x14]
	mov r0, #8
	add r1, #0x82
	str r0, [sp, #0x1c]
	mov r0, #0x81
	str r1, [sp, #0x18]
	str r0, [sp, #0x20]
	mov r0, #3
	mov r1, #2
	str r0, [sp, #0x24]
	mov r0, #1
	str r1, [sp, #0x2c]
	mov r7, #0
	mov r1, #0xe
	str r0, [sp, #0x28]
	str r7, [sp, #0x30]
	str r1, [sp, #0x34]
	tst r0, r2
	beq _0224891A
	mov r7, #0x70
_0224891A:
	mov r0, #2
	tst r0, r2
	beq _02248924
	mov r6, #0x81
	b _02248926
_02248924:
	mov r6, #0
_02248926:
	ldr r0, [sp, #0x50]
	str r3, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x5c
	add r1, sp, #8
	add r2, r7, #0
	add r3, r6, #0
	bl ov41_02249DB4
	str r4, [r5, #0x40]
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_022488D8

	thumb_func_start ov41_02248940
ov41_02248940: ; 0x02248940
	ldr r3, _02248948 ; =ov41_02249CC4
	add r0, #0x5c
	bx r3
	nop
_02248948: .word ov41_02249CC4
	thumb_func_end ov41_02248940

	thumb_func_start ov41_0224894C
ov41_0224894C: ; 0x0224894C
	push {r4, lr}
	add r4, r0, #0
	bne _02248956
	bl GF_AssertFail
_02248956:
	ldr r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224894C

	thumb_func_start ov41_0224895C
ov41_0224895C: ; 0x0224895C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0224896C
	bl GF_AssertFail
_0224896C:
	mov r0, #0xc
	mul r0, r4
	add r3, r5, r0
	add r3, #0xc
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov41_0224895C

	thumb_func_start ov41_02248984
ov41_02248984: ; 0x02248984
	push {r4, lr}
	add r4, r3, #0
	bl ov41_02248ABC
	ldr r2, [sp, #8]
	add r1, r4, #0
	bl ov41_02249BE8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02248984

	thumb_func_start ov41_02248998
ov41_02248998: ; 0x02248998
	ldr r0, [r0, #0x3c]
	cmp r0, #0
	bne _022489A2
	mov r0, #1
	bx lr
_022489A2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02248998

	thumb_func_start ov41_022489A8
ov41_022489A8: ; 0x022489A8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x1c]
	add r5, r0, #0
	add r0, #0xc
	bl ov41_02248A28
	mov r0, #0
	str r0, [r5]
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl ov41_022489E4
	add r0, r5, #0
	ldr r1, [r4, #0x20]
	add r0, #0x18
	bl ov41_02248A28
	add r0, r5, #0
	ldr r1, [r4, #0x24]
	add r0, #0x24
	bl ov41_02248A28
	add r5, #0x30
	add r0, r5, #0
	mov r1, #1
	bl ov41_02248A28
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_022489A8

	thumb_func_start ov41_022489E4
ov41_022489E4: ; 0x022489E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r4, [r5, #8]
	add r6, r1, #0
	cmp r4, r5
	beq _02248A04
_022489F0:
	ldr r0, [r4, #4]
	cmp r0, #2
	bhi _022489FE
	ldr r0, [r4]
	add r1, r6, #0
	bl ov41_02246008
_022489FE:
	ldr r4, [r4, #8]
	cmp r4, r5
	bne _022489F0
_02248A04:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_022489E4

	thumb_func_start ov41_02248A08
ov41_02248A08: ; 0x02248A08
	push {r4, lr}
	add r4, r3, #0
	bl ov41_02248ABC
	add r1, r4, #0
	bl ov41_022489E4
	pop {r4, pc}
	thumb_func_end ov41_02248A08

	thumb_func_start ov41_02248A18
ov41_02248A18: ; 0x02248A18
	push {r4, lr}
	add r4, r1, #0
	bl ov41_02248A94
	add r1, r4, #0
	bl ov41_022489E4
	pop {r4, pc}
	thumb_func_end ov41_02248A18

	thumb_func_start ov41_02248A28
ov41_02248A28: ; 0x02248A28
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r0, #0xe
	lsl r1, r4, #4
	bl AllocFromHeap
	str r0, [r5]
	str r4, [r5, #4]
	mov r6, #0
	str r6, [r5, #8]
	ldr r0, [r5, #4]
	cmp r0, #0
	ble _02248A68
	add r4, r6, #0
	add r7, r6, #0
_02248A48:
	ldr r0, [r5]
	add r1, r7, #0
	add r0, r0, r4
	str r0, [r0, #8]
	ldr r0, [r5]
	add r0, r0, r4
	str r0, [r0, #0xc]
	ldr r0, [r5]
	add r0, r0, r4
	bl ov41_022489E4
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02248A48
_02248A68:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02248A28

	thumb_func_start ov41_02248A6C
ov41_02248A6C: ; 0x02248A6C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
	pop {r4, pc}
	thumb_func_end ov41_02248A6C

	thumb_func_start ov41_02248A94
ov41_02248A94: ; 0x02248A94
	push {r3}
	sub sp, #0xc
	ldr r2, [r0]
	mov r1, #0xc
	mul r1, r2
	add r3, r0, r1
	add r3, #0xc
	ldmia r3!, {r0, r1}
	add r2, sp, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #8]
	ldr r1, [sp]
	lsl r0, r0, #4
	add r0, r1, r0
	add sp, #0xc
	pop {r3}
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02248A94

	thumb_func_start ov41_02248ABC
ov41_02248ABC: ; 0x02248ABC
	push {r4}
	sub sp, #0xc
	mov r3, #0xc
	mul r3, r1
	add r4, r0, r3
	add r4, #0xc
	ldmia r4!, {r0, r1}
	add r3, sp, #0
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	ldr r1, [sp]
	lsl r0, r2, #4
	add r0, r1, r0
	add sp, #0xc
	pop {r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02248ABC

	thumb_func_start ov41_02248AE0
ov41_02248AE0: ; 0x02248AE0
	push {r4, lr}
	mov r4, #0
	bl ov41_02248ABC
	ldr r1, [r0, #8]
	cmp r1, r0
	beq _02248AF6
_02248AEE:
	ldr r1, [r1, #8]
	add r4, r4, #1
	cmp r1, r0
	bne _02248AEE
_02248AF6:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02248AE0

	thumb_func_start ov41_02248AFC
ov41_02248AFC: ; 0x02248AFC
	push {r3, r4, r5, lr}
	add r5, r3, #0
	mov r4, #0
	bl ov41_02248ABC
	ldr r1, [r0, #8]
	cmp r1, r0
	beq _02248B1C
_02248B0C:
	cmp r4, r5
	bne _02248B14
	add r0, r1, #0
	pop {r3, r4, r5, pc}
_02248B14:
	ldr r1, [r1, #8]
	add r4, r4, #1
	cmp r1, r0
	bne _02248B0C
_02248B1C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02248AFC

	thumb_func_start ov41_02248B20
ov41_02248B20: ; 0x02248B20
	push {r4, lr}
	ldr r4, [r0]
	cmp r4, r2
	bne _02248B34
	mov r4, #0xc
	mul r4, r2
	add r0, r0, r4
	ldr r0, [r0, #0x14]
	cmp r3, r0
	beq _02248B3E
_02248B34:
	add r0, r1, #0
	mov r1, #0
	bl ov41_02246008
	pop {r4, pc}
_02248B3E:
	add r0, r1, #0
	mov r1, #1
	bl ov41_02246008
	pop {r4, pc}
	thumb_func_end ov41_02248B20

	thumb_func_start ov41_02248B48
ov41_02248B48: ; 0x02248B48
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #9
	add r4, r2, #0
	bl _s32_div_f
	add r7, r1, #0
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #3
	bl _s32_div_f
	add r0, r6, #1
	lsl r2, r0, #3
	lsl r0, r6, #5
	add r0, r2, r0
	add r0, #0x10
	str r0, [r4]
	add r0, r1, #1
	lsl r2, r0, #3
	mov r0, #0x18
	mul r0, r1
	add r0, r2, r0
	add r0, #8
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02248B48

	thumb_func_start ov41_02248B84
ov41_02248B84: ; 0x02248B84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	ldr r0, _02248BF8 ; =ov41_02248BFC
	mov r1, #0x30
	mov r2, #0
	mov r3, #0xd
	bl sub_02007200
	bl sub_0201F988
	add r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	ldr r0, [sp]
	str r7, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [r4, #0x10]
	mov r0, #0
	str r0, [r4, #0x1c]
	add r0, r5, #0
	add r2, r7, #0
	bl ov41_02248AE0
	str r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r2, [sp, #0x18]
	add r0, r5, #0
	bl ov41_02248AE0
	str r0, [r4, #0x24]
	ldr r1, [r4, #0x20]
	add r2, r1, r0
	mov r1, #0xc
	mov r0, #0xd
	mul r1, r2
	str r2, [r4, #0x2c]
	bl AllocFromHeap
	str r0, [r4, #0x28]
	cmp r0, #0
	bne _02248BE4
	bl GF_AssertFail
_02248BE4:
	ldr r3, [r4, #0x2c]
	mov r2, #0xc
	ldr r0, [r4, #0x28]
	mov r1, #0
	mul r2, r3
	bl memset
	mov r0, #1
	str r0, [r5, #0x3c]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248BF8: .word ov41_02248BFC
	thumb_func_end ov41_02248B84

	thumb_func_start ov41_02248BFC
ov41_02248BFC: ; 0x02248BFC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #4
	bls _02248C0C
	b _02248D54
_02248C0C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02248C18: ; jump table
	.short _02248C22 - _02248C18 - 2 ; case 0
	.short _02248C76 - _02248C18 - 2 ; case 1
	.short _02248CC2 - _02248C18 - 2 ; case 2
	.short _02248D08 - _02248C18 - 2 ; case 3
	.short _02248D20 - _02248C18 - 2 ; case 4
_02248C22:
	mov r0, #0x83
	mvn r0, r0
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	mov r3, #0
	bl ov41_02248984
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	mov r3, #1
	bl ov41_02248A08
	mov r0, #0
	str r0, [r4, #0x14]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0x14
	str r1, [sp]
	ldr r1, [r0, #0x40]
	add r1, r1, #1
	lsr r3, r1, #0x1f
	lsl r2, r1, #0x1f
	sub r2, r2, r3
	mov r1, #0x1f
	ror r2, r1
	add r1, r3, r2
	mov r2, #2
	mov r3, #5
	bl ov41_022488D8
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl ov41_02248E10
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	str r0, [r4, #0x1c]
	b _02248D58
_02248C76:
	ldr r0, [r4, #0x18]
	mov r6, #0
	cmp r0, #0
	ble _02248CAA
	add r5, r4, #0
	add r5, #0x20
_02248C82:
	ldr r0, [r4, #0x20]
	sub r0, r0, #1
	bmi _02248CA2
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x20]
	bl ov41_02248AFC
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	bl ov41_02248D64
_02248CA2:
	ldr r0, [r4, #0x18]
	add r6, r6, #1
	cmp r6, r0
	blt _02248C82
_02248CAA:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _02248D58
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl ov41_02248E10
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	str r0, [r4, #0x1c]
	b _02248D58
_02248CC2:
	ldr r0, [r4, #0x18]
	mov r6, #0
	cmp r0, #0
	ble _02248CF6
	add r5, r4, #0
	add r5, #0x24
_02248CCE:
	ldr r0, [r4, #0x24]
	sub r0, r0, #1
	bmi _02248CEE
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0x24]
	bl ov41_02248AFC
	ldr r1, [r4, #0x28]
	ldr r2, [r4, #0x2c]
	bl ov41_02248D64
_02248CEE:
	ldr r0, [r4, #0x18]
	add r6, r6, #1
	cmp r6, r0
	blt _02248CCE
_02248CF6:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02248D58
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x18]
	b _02248D58
_02248D08:
	ldr r0, [r4, #0x18]
	add r0, r0, #1
	str r0, [r4, #0x18]
	cmp r0, #3
	ble _02248D58
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02248D58
	ldr r0, [r4, #0x1c]
	add r0, r0, #1
	str r0, [r4, #0x1c]
	b _02248D58
_02248D20:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	mov r3, #0
	bl ov41_02248A08
	mov r0, #0x83
	mvn r0, r0
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	mov r3, #0
	bl ov41_02248984
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0, #0x3c]
	ldr r0, [r4, #0x28]
	bl FreeToHeap
	add r0, r5, #0
	bl sub_02007234
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02248D54:
	bl GF_AssertFail
_02248D58:
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x2c]
	bl ov41_02248DA4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_02248BFC

	thumb_func_start ov41_02248D64
ov41_02248D64: ; 0x02248D64
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	bl ov41_02248D7C
	str r4, [r0]
	mov r1, #3
	str r1, [r0, #4]
	mov r1, #0x2c
	str r1, [r0, #8]
	pop {r4, pc}
	thumb_func_end ov41_02248D64

	thumb_func_start ov41_02248D7C
ov41_02248D7C: ; 0x02248D7C
	push {r3, r4}
	mov r3, #0
	cmp r1, #0
	ble _02248D9E
	add r4, r0, #0
_02248D86:
	ldr r2, [r4]
	cmp r2, #0
	bne _02248D96
	mov r1, #0xc
	mul r1, r3
	add r0, r0, r1
	pop {r3, r4}
	bx lr
_02248D96:
	add r3, r3, #1
	add r4, #0xc
	cmp r3, r1
	blt _02248D86
_02248D9E:
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov41_02248D7C

	thumb_func_start ov41_02248DA4
ov41_02248DA4: ; 0x02248DA4
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _02248DC4
_02248DB0:
	ldr r0, [r5]
	cmp r0, #0
	beq _02248DBC
	add r0, r5, #0
	bl ov41_02248DC8
_02248DBC:
	add r4, r4, #1
	add r5, #0xc
	cmp r4, r6
	blt _02248DB0
_02248DC4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02248DA4

	thumb_func_start ov41_02248DC8
ov41_02248DC8: ; 0x02248DC8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r1, [sp]
	ldr r0, [r4, #8]
	add r2, r1, r0
	str r2, [sp]
	ldr r0, [r4]
	ldr r1, [sp, #4]
	bl ov41_02249AF4
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0
	bgt _02248E0C
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	strb r0, [r4, #8]
	strb r0, [r4, #9]
	strb r0, [r4, #0xa]
	strb r0, [r4, #0xb]
_02248E0C:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov41_02248DC8

	thumb_func_start ov41_02248E10
ov41_02248E10: ; 0x02248E10
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	bl _s32_div_f
	sub r0, r4, r1
	add r0, r5, r0
	add r1, r4, #0
	bl _s32_div_f
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02248E10

	thumb_func_start ov41_02248E28
ov41_02248E28: ; 0x02248E28
	add r3, r0, #0
	mov r2, #0x1c
	mov r1, #0
_02248E2E:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _02248E2E
	ldr r1, _02248E40 ; =ov41_02248E80
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
_02248E40: .word ov41_02248E80
	thumb_func_end ov41_02248E28

	thumb_func_start ov41_02248E44
ov41_02248E44: ; 0x02248E44
	push {r4, lr}
	ldr r1, _02248E7C ; =gSystem + 0x40
	add r4, r0, #0
	ldrh r2, [r1, #0x24]
	cmp r2, #0
	beq _02248E56
	ldr r1, [r4, #4]
	blx r1
	b _02248E6C
_02248E56:
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	beq _02248E62
	ldr r1, [r4, #0xc]
	blx r1
	b _02248E6C
_02248E62:
	ldrb r1, [r4, #0x18]
	cmp r1, #0
	beq _02248E6C
	ldr r1, [r4, #8]
	blx r1
_02248E6C:
	ldr r0, _02248E7C ; =gSystem + 0x40
	ldrh r1, [r0, #0x20]
	strh r1, [r4, #0x14]
	ldrh r1, [r0, #0x22]
	strh r1, [r4, #0x16]
	ldrh r0, [r0, #0x26]
	strb r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
_02248E7C: .word gSystem + 0x40
	thumb_func_end ov41_02248E44

	thumb_func_start ov41_02248E80
ov41_02248E80: ; 0x02248E80
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02248E80

	thumb_func_start ov41_02248E84
ov41_02248E84: ; 0x02248E84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	mov r4, #0
	add r5, r7, #0
_02248E8E:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202BA70
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, #0x64
	blt _02248E8E
	mov r0, #0x19
	mov r3, #0
	add r2, r7, #0
	mov r1, #0x12
	lsl r0, r0, #4
_02248EA8:
	add r3, r3, #1
	str r1, [r2, r0]
	add r2, r2, #4
	cmp r3, #0x12
	blt _02248EA8
	mov r5, #0x19
	mov r4, #0
	lsl r5, r5, #4
_02248EB8:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202BAB0
	cmp r0, #0x12
	beq _02248ECA
	lsl r0, r0, #2
	add r0, r7, r0
	str r4, [r0, r5]
_02248ECA:
	add r4, r4, #1
	cmp r4, #0x12
	blt _02248EB8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02248E84

	thumb_func_start ov41_02248ED4
ov41_02248ED4: ; 0x02248ED4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x64
	blo _02248EE2
	bl GF_AssertFail
_02248EE2:
	lsl r0, r5, #2
	ldr r0, [r4, r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02248ED4

	thumb_func_start ov41_02248EE8
ov41_02248EE8: ; 0x02248EE8
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bx lr
	thumb_func_end ov41_02248EE8

	thumb_func_start ov41_02248EF4
ov41_02248EF4: ; 0x02248EF4
	push {r3, r4}
	mov r2, #0x19
	mov r4, #0
	lsl r2, r2, #4
_02248EFC:
	ldr r3, [r0, r2]
	cmp r1, r3
	bne _02248F08
	add r0, r4, #0
	pop {r3, r4}
	bx lr
_02248F08:
	add r4, r4, #1
	add r0, r0, #4
	cmp r4, #0x12
	blt _02248EFC
	add r0, r4, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02248EF4

	thumb_func_start ov41_02248F18
ov41_02248F18: ; 0x02248F18
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov41_02248E28
	mov r0, #0xd
	mov r1, #0x34
	bl AllocFromHeap
	str r0, [r5]
	mov r1, #0
	mov r2, #0x34
	bl memset
	ldr r1, [r5]
	ldr r0, [sp, #0x18]
	str r4, [r1, #4]
	str r6, [r1, #8]
	str r7, [r1]
	str r0, [r1, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r1, #0x2c]
	ldr r0, _02248F5C ; =ov41_02248F80
	str r0, [r5, #4]
	ldr r0, _02248F60 ; =ov41_022490F0
	str r0, [r5, #8]
	ldr r0, _02248F64 ; =ov41_02249280
	str r0, [r5, #0xc]
	ldr r0, _02248F68 ; =ov41_02248F6C
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02248F5C: .word ov41_02248F80
_02248F60: .word ov41_022490F0
_02248F64: .word ov41_02249280
_02248F68: .word ov41_02248F6C
	thumb_func_end ov41_02248F18

	thumb_func_start ov41_02248F6C
ov41_02248F6C: ; 0x02248F6C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	bl ov41_02248E28
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02248F6C

	thumb_func_start ov41_02248F80
ov41_02248F80: ; 0x02248F80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4, #4]
	bl ov41_022481BC
	cmp r0, #0
	beq _02249002
	ldr r3, [r4]
	ldr r0, [r4, #4]
	ldr r3, [r3, #0x38]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_022481F4
	add r6, r0, #0
	beq _02248FB2
	ldr r0, [r6, #4]
	cmp r0, #3
	bne _02248FB2
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _02248FB2
	mov r6, #0
_02248FB2:
	cmp r6, #0
	beq _0224903E
	ldr r0, [r6, #4]
	cmp r0, #0
	bne _02248FC8
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov41_022480C8
	mov r7, #0
	b _02248FE4
_02248FC8:
	add r0, r6, #0
	bl ov41_02248030
	ldr r0, [r6]
	bl ov41_02249710
	add r1, r4, #0
	add r2, r4, #0
	add r7, r0, #0
	add r0, r6, #0
	add r1, #0x24
	add r2, #0x28
	bl ov41_02249B44
_02248FE4:
	ldr r0, [r4, #4]
	bl ov41_02248158
	ldr r0, [sp, #8]
	add r1, r6, #0
	str r0, [sp]
	str r7, [sp, #4]
	ldr r3, [sp, #0xc]
	add r0, r4, #0
	mov r2, #1
	bl ov41_022493BC
	bl ov41_0224642C
	b _0224903E
_02249002:
	ldr r0, [r4, #8]
	bl ov41_02248820
	cmp r0, #0
	beq _0224903E
	ldr r3, [r4]
	ldr r0, [r4, #8]
	ldr r3, [r3, #0x38]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_02248858
	add r6, r0, #0
	beq _0224903E
	bl ov41_022486F0
	ldr r0, [r4, #8]
	bl ov41_02248724
	ldr r0, [sp, #8]
	mov r2, #0
	str r0, [sp]
	str r2, [sp, #4]
	ldr r3, [sp, #0xc]
	add r0, r4, #0
	add r1, r6, #0
	bl ov41_022493BC
	bl ov41_0224642C
_0224903E:
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _02249088
	ldr r1, [r1, #4]
	ldr r0, _0224908C ; =0x000005EB
	cmp r1, #0
	beq _02249056
	cmp r1, #1
	beq _02249060
	cmp r1, #3
	beq _02249072
	b _0224907A
_02249056:
	ldr r1, _02249090 ; =ov41_022490F0
	str r1, [r5, #8]
	ldr r1, _02249094 ; =ov41_02249280
	str r1, [r5, #0xc]
	b _0224907A
_02249060:
	ldr r0, _02249098 ; =ov41_022490B0
	str r0, [r5, #8]
	ldr r0, _0224909C ; =ov41_022490AC
	str r0, [r5, #0xc]
	add r0, r5, #0
	bl ov41_02249390
	ldr r0, _022490A0 ; =0x0000067D
	b _0224907A
_02249072:
	ldr r1, _022490A4 ; =ov41_022492B0
	str r1, [r5, #8]
	ldr r1, _022490A8 ; =ov41_022492E0
	str r1, [r5, #0xc]
_0224907A:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
	add r0, r4, #0
	bl ov41_02249574
_02249088:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224908C: .word 0x000005EB
_02249090: .word ov41_022490F0
_02249094: .word ov41_02249280
_02249098: .word ov41_022490B0
_0224909C: .word ov41_022490AC
_022490A0: .word 0x0000067D
_022490A4: .word ov41_022492B0
_022490A8: .word ov41_022492E0
	thumb_func_end ov41_02248F80

	thumb_func_start ov41_022490AC
ov41_022490AC: ; 0x022490AC
	bx lr
	.balign 4, 0
	thumb_func_end ov41_022490AC

	thumb_func_start ov41_022490B0
ov41_022490B0: ; 0x022490B0
	push {r4, lr}
	sub sp, #8
	ldr r4, [r0]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _022490EA
	ldr r0, [r0, #4]
	cmp r0, #1
	beq _022490C6
	bl GF_AssertFail
_022490C6:
	ldr r0, [r4, #0x10]
	mov r2, #0x1c
	ldr r0, [r0, #4]
	mov r3, #0x1e
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	mov r1, #4
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, r4, #0
	bl ov41_02249480
	add r0, r4, #0
	bl ov41_02249418
_022490EA:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_022490B0

	thumb_func_start ov41_022490F0
ov41_022490F0: ; 0x022490F0
	push {r4, r5, r6, lr}
	sub sp, #0x28
	add r6, r0, #0
	ldr r4, [r6]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	bne _02249100
	b _0224926E
_02249100:
	add r1, sp, #0x18
	str r1, [sp]
	add r1, sp, #0x24
	add r2, sp, #0x20
	add r3, sp, #0x1c
	bl ov41_0224946C
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	bl ov41_022481D8
	add r5, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	bl ov41_022481D8
	add r5, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	bl ov41_022481D8
	add r5, r5, r0
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x20]
	bl ov41_022481D8
	add r0, r5, r0
	cmp r0, #4
	blt _022491A2
	ldr r2, [r4]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r2, [r2, #0x38]
	bl ov41_022480A4
	cmp r0, #0
	bne _0224918C
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	str r0, [sp, #0xc]
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	str r0, [sp, #8]
	ldr r0, _02249274 ; =0x00000682
	bl PlaySE
	ldr r0, [r4, #0xc]
	mov r1, #0x1b
	mov r2, #0xd7
	mov r3, #3
	bl ov41_0224AC08
	ldr r0, [r4, #0x10]
	mov r1, #4
	ldr r0, [r0, #4]
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl ov41_02249480
	b _02249268
_0224918C:
	ldr r0, [r4, #4]
	bl ov41_02248158
	bl ov41_022463FC
	mov r0, #0
	str r0, [r4, #0x30]
	ldr r0, _02249278 ; =0x000005EA
	bl PlaySE
	b _02249268
_022491A2:
	ldr r0, [r4, #0x10]
	add r1, sp, #0x24
	ldr r5, [r0]
	add r0, sp, #0x18
	str r0, [sp]
	add r0, r6, #0
	add r2, sp, #0x20
	add r3, sp, #0x1c
	bl ov41_0224942C
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	bl ov41_0224883C
	add r6, r0, #0
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x20]
	bl ov41_0224883C
	add r0, r6, r0
	cmp r0, #2
	bge _02249220
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224920C
	ldr r0, [r4, #0x10]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl ov41_02249B94
	bl MTRandom
	ldr r2, [sp, #0x14]
	mov r1, #0x6c
	sub r1, r1, r2
	bl _u32_div_f
	add r1, #0xa
	str r1, [sp, #0xc]
	bl MTRandom
	ldr r2, [sp, #0x10]
	mov r1, #0x7d
	sub r1, r1, r2
	bl _u32_div_f
	add r1, #0x12
	str r1, [sp, #8]
	b _02249218
_0224920C:
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	str r0, [sp, #0xc]
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	str r0, [sp, #8]
_02249218:
	ldr r0, _02249274 ; =0x00000682
	bl PlaySE
	b _02249230
_02249220:
	ldr r0, [r4, #0x10]
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_02249B44
	ldr r0, _0224927C ; =0x000005EB
	bl PlaySE
_02249230:
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #1
	bne _0224924E
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #8]
	ldr r0, [r0, #4]
	ldr r1, [r5]
	ldr r2, [r2, #4]
	bl ov41_022484E8
	add r1, r4, #0
	add r1, #0x21
	strb r0, [r1]
_0224924E:
	ldr r0, [r4, #0x10]
	mov r1, #4
	ldr r0, [r0, #4]
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	str r0, [sp, #4]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	add r0, r4, #0
	bl ov41_02249480
_02249268:
	add r0, r4, #0
	bl ov41_02249418
_0224926E:
	add sp, #0x28
	pop {r4, r5, r6, pc}
	nop
_02249274: .word 0x00000682
_02249278: .word 0x000005EA
_0224927C: .word 0x000005EB
	thumb_func_end ov41_022490F0

	thumb_func_start ov41_02249280
ov41_02249280: ; 0x02249280
	push {r4, lr}
	ldr r2, [r0]
	ldr r0, [r2, #0x10]
	cmp r0, #0
	beq _022492A4
	ldr r3, _022492A8 ; =gSystem + 0x40
	ldr r1, _022492AC ; =0x0000FFFF
	ldrh r4, [r3, #0x20]
	cmp r4, r1
	beq _022492A4
	beq _022492A4
	ldrh r3, [r3, #0x22]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #0x18]
	sub r1, r4, r1
	sub r2, r3, r2
	bl ov41_02249AF4
_022492A4:
	pop {r4, pc}
	nop
_022492A8: .word gSystem + 0x40
_022492AC: .word 0x0000FFFF
	thumb_func_end ov41_02249280

	thumb_func_start ov41_022492B0
ov41_022492B0: ; 0x022492B0
	push {r4, lr}
	ldr r4, [r0]
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _022492DA
	ldr r0, [r4, #4]
	bl ov41_02248020
	ldr r0, [r4, #4]
	bl ov41_02248158
	bl ov41_022463FC
	mov r0, #0
	str r0, [r4, #0x30]
	ldr r0, _022492DC ; =0x000005EB
	bl PlaySE
	add r0, r4, #0
	bl ov41_02249418
_022492DA:
	pop {r4, pc}
	.balign 4, 0
_022492DC: .word 0x000005EB
	thumb_func_end ov41_022492B0

	thumb_func_start ov41_022492E0
ov41_022492E0: ; 0x022492E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r4, [r0]
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02249384
	ldr r1, _02249388 ; =gSystem + 0x40
	ldrh r2, [r1, #0x20]
	ldr r1, _0224938C ; =0x0000FFFF
	cmp r2, r1
	beq _02249384
	beq _02249384
	add r1, sp, #8
	str r1, [sp]
	add r1, sp, #0x14
	add r2, sp, #0xc
	add r3, sp, #0x10
	bl ov41_02249BAC
	ldr r0, [r4, #0x10]
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl ov41_02249B94
	ldr r0, _02249388 ; =gSystem + 0x40
	ldr r1, [r4, #0x14]
	ldrh r2, [r0, #0x20]
	ldr r3, [sp, #0x18]
	sub r5, r2, r1
	ldrh r1, [r0, #0x22]
	ldr r0, [r4, #0x18]
	ldr r2, [sp, #0x1c]
	sub r6, r1, r0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	sub r0, r2, r0
	ldr r2, [sp, #8]
	add r7, r6, r1
	sub r2, r3, r2
	ldr r3, [sp, #0x14]
	str r2, [sp, #0x18]
	add r2, r5, r3
	str r0, [sp, #0x1c]
	cmp r2, #0x8a
	bgt _02249342
	mov r0, #0x8a
	sub r5, r0, r3
	b _0224934C
_02249342:
	add r2, r5, r0
	cmp r2, #0xf6
	blt _0224934C
	mov r2, #0xf6
	sub r5, r2, r0
_0224934C:
	cmp r7, #0x12
	bgt _02249356
	mov r0, #0x12
	sub r6, r0, r1
	b _02249362
_02249356:
	ldr r1, [sp, #0x18]
	add r0, r6, r1
	cmp r0, #0x8f
	blt _02249362
	mov r0, #0x8f
	sub r6, r0, r1
_02249362:
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	bl ov41_022495A4
	ldr r0, [r4, #4]
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl ov41_022482B8
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r0, [sp, #4]
	add r1, r5, r1
	add r2, r6, r2
	bl ov41_022495A4
_02249384:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02249388: .word gSystem + 0x40
_0224938C: .word 0x0000FFFF
	thumb_func_end ov41_022492E0

	thumb_func_start ov41_02249390
ov41_02249390: ; 0x02249390
	push {r3, r4, r5, lr}
	ldr r4, [r0]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _022493B8
	ldr r0, [r0, #4]
	cmp r0, #1
	beq _022493A4
	bl GF_AssertFail
_022493A4:
	ldr r0, [r4, #0x10]
	ldr r5, [r0]
	ldr r0, [r4, #4]
	bl ov41_022482A8
	ldr r0, [r4, #4]
	ldr r1, [r5]
	mov r2, #0xe
	bl ov41_0224825C
_022493B8:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02249390

	thumb_func_start ov41_022493BC
ov41_022493BC: ; 0x022493BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	add r7, r3, #0
	bl ov41_02249B44
	str r4, [r5, #0x10]
	ldr r0, [sp, #4]
	strh r0, [r5, #0x1c]
	ldr r0, [sp]
	strh r0, [r5, #0x1e]
	add r0, r5, #0
	add r0, #0x20
	strb r6, [r0]
	ldr r0, [sp, #0x20]
	str r7, [r5, #0x14]
	str r0, [r5, #0x18]
	cmp r6, #0
	bne _022493FE
	ldr r1, [r5, #0x10]
	ldr r0, [r5, #8]
	ldr r1, [r1, #4]
	bl ov41_0224895C
	add r1, r5, #0
	add r1, #0x21
	strb r0, [r1]
	b _02249406
_022493FE:
	add r0, r5, #0
	mov r1, #0
	add r0, #0x21
	strb r1, [r0]
_02249406:
	mov r0, #1
	str r0, [r5, #0x30]
	ldr r1, [sp, #0x24]
	add r0, r4, #0
	bl ov41_02249A90
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_022493BC

	thumb_func_start ov41_02249418
ov41_02249418: ; 0x02249418
	mov r2, #0
	str r2, [r0, #0x10]
	strh r2, [r0, #0x1c]
	add r1, r0, #0
	strh r2, [r0, #0x1e]
	add r1, #0x20
	strb r2, [r1]
	add r0, #0x21
	strb r2, [r0]
	bx lr
	thumb_func_end ov41_02249418

	thumb_func_start ov41_0224942C
ov41_0224942C: ; 0x0224942C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, [r0]
	add r5, r1, #0
	ldr r0, [r4, #0x10]
	add r6, r2, #0
	add r1, sp, #0xc
	add r2, sp, #8
	add r7, r3, #0
	bl ov41_02249B94
	ldr r0, [r4, #0x10]
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r0, [sp]
	str r0, [r5]
	ldr r1, [sp]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [r6]
	ldr r0, [sp, #4]
	str r0, [r7]
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	add r1, r1, r0
	ldr r0, [sp, #0x28]
	str r1, [r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224942C

	thumb_func_start ov41_0224946C
ov41_0224946C: ; 0x0224946C
	push {r3, r4, lr}
	sub sp, #4
	ldr r4, [sp, #0x10]
	str r4, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	bl ov41_02249C20
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov41_0224946C

	thumb_func_start ov41_02249480
ov41_02249480: ; 0x02249480
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	ldr r0, _022494F0 ; =ov41_022494F4
	mov r1, #0x2c
	mov r2, #0
	mov r3, #0xd
	bl sub_02007200
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [r5, #8]
	add r1, sp, #8
	str r0, [r4]
	ldr r0, [r5, #0x10]
	add r2, sp, #4
	str r0, [r4, #4]
	str r6, [r4, #0x20]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #8]
	add r0, #0x3c
	str r0, [r4, #0x24]
	add r0, r5, #0
	add r0, #0x30
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x10]
	bl ov41_02249B44
	ldr r1, [r4, #0x10]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	add r1, r6, #0
	bl _s32_div_f
	str r0, [r4, #8]
	ldr r1, [r4, #0x14]
	ldr r0, [sp, #4]
	sub r0, r1, r0
	add r1, r6, #0
	bl _s32_div_f
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022494F0: .word ov41_022494F4
	thumb_func_end ov41_02249480

	thumb_func_start ov41_022494F4
ov41_022494F4: ; 0x022494F4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x24]
	ldr r0, [r0]
	cmp r0, #1
	beq _0224956E
	ldr r0, [r4, #4]
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r1, [sp, #4]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [sp]
	ldr r0, [r4, #0xc]
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4, #0x20]
	sub r0, r0, #1
	str r0, [r4, #0x20]
	bmi _02249532
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02249564
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02249564
_02249532:
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	bl ov41_02249AF4
	ldr r0, [r4]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #4]
	bl ov41_022486C4
	ldr r0, [r4]
	bl ov41_02248724
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	cmp r0, #0
	bne _0224955A
	bl ov41_022463FC
_0224955A:
	add r0, r5, #0
	bl sub_02007234
	add sp, #8
	pop {r3, r4, r5, pc}
_02249564:
	ldr r0, [r4, #4]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl ov41_02249AF4
_0224956E:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_022494F4

	thumb_func_start ov41_02249574
ov41_02249574: ; 0x02249574
	push {r3, lr}
	ldr r3, [r0, #0x10]
	ldr r1, [r3, #4]
	cmp r1, #0
	bne _0224958E
	ldr r3, [r3]
	ldr r0, [r0, #0xc]
	ldr r3, [r3]
	mov r1, #0x1b
	mov r2, #0xd8
	bl ov41_0224AC08
	pop {r3, pc}
_0224958E:
	cmp r1, #1
	bne _022495A0
	ldr r3, [r3]
	ldr r0, [r0, #0xc]
	ldr r3, [r3]
	mov r1, #0x1b
	mov r2, #0xda
	bl ov41_0224AC08
_022495A0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_02249574

	thumb_func_start ov41_022495A4
ov41_022495A4: ; 0x022495A4
	push {r4, r5, r6, lr}
	ldr r4, [r0]
	add r5, r1, #0
	ldr r0, [r4, #0x10]
	add r6, r2, #0
	bl ov41_02249AF4
	ldr r1, [r4, #0x24]
	ldr r2, [r4, #0x28]
	ldr r0, [r4, #4]
	sub r1, r5, r1
	sub r2, r6, r2
	bl ov41_02248114
	str r5, [r4, #0x24]
	str r6, [r4, #0x28]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_022495A4

	thumb_func_start ov41_022495C8
ov41_022495C8: ; 0x022495C8
	push {r3, r4, r5, lr}
	mov r2, #0
	add r4, r1, #0
	str r2, [sp]
	add r5, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	mov r3, #0xe
	bl GfGfxLoader_LoadFromNarc
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0x76
	bl ov41_022463DC
	ldrh r1, [r4]
	ldr r0, [r0, #0x14]
	bl sub_02009D28
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_022495C8

	thumb_func_start ov41_022495F0
ov41_022495F0: ; 0x022495F0
	push {r4, lr}
	sub sp, #8
	ldr r4, [sp, #0x10]
	str r4, [sp]
	mov r4, #0
	str r4, [sp, #4]
	bl ov41_02249604
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov41_022495F0

	thumb_func_start ov41_02249604
ov41_02249604: ; 0x02249604
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r2, #0
	add r5, r0, #0
	add r7, r1, #0
	add r4, r3, #0
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #2
	bl sub_02070130
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0xc0
	mov r3, #0x38
	bl sub_020085EC
	str r0, [r5]
	add r0, r5, #0
	add r1, sp, #0x1c
	add r2, sp, #0x18
	bl ov41_022497A0
	ldr r1, [sp, #0x1c]
	mov r2, #0x38
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	ldr r1, [sp, #0x18]
	str r0, [sp, #0x1c]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp, #0x18]
	sub r0, r2, r0
	strb r0, [r5, #4]
	ldr r0, [sp, #0x18]
	mov r1, #0xc0
	add r0, #0x38
	strb r0, [r5, #5]
	ldr r0, [sp, #0x1c]
	sub r0, r1, r0
	strb r0, [r5, #6]
	ldr r0, [sp, #0x1c]
	add r0, #0xc0
	strb r0, [r5, #7]
	ldr r0, [sp, #0x18]
	str r0, [sp]
	ldr r3, [sp, #0x1c]
	add r0, r5, #4
	bl ov41_02249978
	add r0, r6, #0
	mov r1, #2
	bl sub_02070848
	mov r2, #0
	str r2, [sp]
	add r7, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r3, [sp, #0x38]
	bl GfGfxLoader_LoadFromNarc
	add r1, sp, #0x14
	str r0, [sp, #0x10]
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, [sp, #0x14]
	ldrh r1, [r4]
	ldr r0, [r0, #0x14]
	bl sub_02009D28
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _022496C6
	ldr r2, [sp, #0x14]
	add r3, r5, #0
	ldrh r1, [r2, #2]
	ldr r0, [r2, #0x14]
	ldrh r2, [r2]
	lsl r1, r1, #3
	add r3, #8
	lsl r2, r2, #3
	bl ov41_022498E8
	b _022496DC
_022496C6:
	ldr r1, [sp, #0x14]
	ldr r0, [r1, #0x14]
	ldrh r1, [r1, #2]
	lsl r1, r1, #3
	bl ov41_0224989C
	strb r0, [r5, #8]
	ldrb r0, [r5, #8]
	strb r0, [r5, #9]
	strb r7, [r5, #0xb]
	strb r7, [r5, #0xa]
_022496DC:
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	str r6, [r5, #0xc]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249604

	thumb_func_start ov41_022496E8
ov41_022496E8: ; 0x022496E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02008780
	mov r1, #0x10
	mov r0, #0
_022496F6:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _022496F6
	pop {r4, pc}
	thumb_func_end ov41_022496E8

	thumb_func_start ov41_02249700
ov41_02249700: ; 0x02249700
	ldr r3, _0224970C ; =sub_020087A4
	add r2, r1, #0
	ldr r0, [r0]
	mov r1, #2
	bx r3
	nop
_0224970C: .word sub_020087A4
	thumb_func_end ov41_02249700

	thumb_func_start ov41_02249710
ov41_02249710: ; 0x02249710
	ldr r3, _02249718 ; =sub_02008A78
	ldr r0, [r0]
	mov r1, #2
	bx r3
	.balign 4, 0
_02249718: .word sub_02008A78
	thumb_func_end ov41_02249710

	thumb_func_start ov41_0224971C
ov41_0224971C: ; 0x0224971C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov41_022497A0
	ldr r0, [r5]
	mov r1, #0
	add r2, r4, #0
	bl sub_020087A4
	ldr r0, [r5]
	mov r1, #1
	add r2, r6, #0
	bl sub_020087A4
	ldr r1, [sp, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	ldr r1, [sp, #8]
	str r2, [sp, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp, #8]
	str r2, [sp]
	ldr r3, [sp, #8]
	add r0, r5, #4
	add r1, r4, #0
	add r2, r6, #0
	bl ov41_02249978
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov41_0224971C

	thumb_func_start ov41_02249768
ov41_02249768: ; 0x02249768
	ldr r3, _02249770 ; =sub_020252F4
	add r0, r0, #4
	bx r3
	nop
_02249770: .word sub_020252F4
	thumb_func_end ov41_02249768

	thumb_func_start ov41_02249774
ov41_02249774: ; 0x02249774
	ldr r3, _0224977C ; =sub_020253F0
	add r0, r0, #4
	bx r3
	nop
_0224977C: .word sub_020253F0
	thumb_func_end ov41_02249774

	thumb_func_start ov41_02249780
ov41_02249780: ; 0x02249780
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	mov r1, #0
	add r6, r2, #0
	bl sub_02008A78
	str r0, [r4]
	ldr r0, [r5]
	mov r1, #1
	bl sub_02008A78
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02249780

	thumb_func_start ov41_022497A0
ov41_022497A0: ; 0x022497A0
	mov r0, #0x50
	str r0, [r1]
	str r0, [r2]
	bx lr
	thumb_func_end ov41_022497A0

	thumb_func_start ov41_022497A8
ov41_022497A8: ; 0x022497A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov41_02249768
	cmp r0, #0
	bne _022497C2
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_022497C2:
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249780
	add r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_022497A0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	sub r1, r2, r0
	ldr r3, [sp, #8]
	ldr r0, [sp]
	lsr r2, r3, #0x1f
	add r2, r3, r2
	asr r2, r2, #1
	sub r0, r0, r2
	str r0, [sp]
	ldr r0, _0224981C ; =gSystem + 0x40
	str r1, [sp, #4]
	ldrh r2, [r0, #0x20]
	mov r3, #0
	sub r1, r2, r1
	str r1, [r4]
	ldrh r1, [r0, #0x22]
	ldr r0, [sp]
	sub r2, r1, r0
	str r2, [r6]
	ldr r1, [r4]
	add r0, r7, #0
	bl ov41_022464BC
	cmp r0, #0
	bne _02249816
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02249816:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224981C: .word gSystem + 0x40
	thumb_func_end ov41_022497A8

	thumb_func_start ov41_02249820
ov41_02249820: ; 0x02249820
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov41_02249774
	cmp r0, #0
	bne _0224983A
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0224983A:
	add r0, r5, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249780
	add r0, r5, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov41_022497A0
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	sub r1, r2, r0
	ldr r3, [sp, #8]
	str r1, [sp, #4]
	lsr r2, r3, #0x1f
	add r2, r3, r2
	ldr r0, [sp]
	asr r2, r2, #1
	sub r0, r0, r2
	str r0, [sp]
	sub r2, r6, r0
	sub r1, r4, r1
	add r0, r7, #0
	mov r3, #0
	bl ov41_022464BC
	cmp r0, #0
	bne _02249880
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02249880:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02249820

	thumb_func_start ov41_02249888
ov41_02249888: ; 0x02249888
	ldrb r2, [r0, #8]
	strb r2, [r1]
	ldrb r2, [r0, #9]
	strb r2, [r1, #1]
	ldrb r2, [r0, #0xa]
	strb r2, [r1, #2]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #3]
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02249888

	thumb_func_start ov41_0224989C
ov41_0224989C: ; 0x0224989C
	push {r4, r5, r6, r7}
	mov ip, r0
	add r7, r1, #0
	mov r2, #0
_022498A4:
	mov r3, #0
	add r4, r3, #0
_022498A8:
	add r1, r2, r4
	lsr r0, r1, #0x1f
	lsl r6, r1, #0x1f
	sub r6, r6, r0
	mov r5, #0x1f
	ror r6, r5
	add r5, r0, r6
	lsl r6, r5, #2
	mov r5, #0xf
	add r0, r1, r0
	lsl r5, r6
	asr r1, r0, #1
	mov r0, ip
	lsl r5, r5, #0x18
	ldrsb r0, [r0, r1]
	lsr r5, r5, #0x18
	tst r0, r5
	beq _022498D2
	add r0, r2, #0
	pop {r4, r5, r6, r7}
	bx lr
_022498D2:
	add r3, r3, #1
	add r4, r4, r7
	cmp r3, #0x50
	blt _022498A8
	add r2, r2, #1
	cmp r2, #0x50
	blt _022498A4
	mov r0, #0x50
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov41_0224989C

	thumb_func_start ov41_022498E8
ov41_022498E8: ; 0x022498E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	str r1, [sp, #4]
	add r1, r3, #0
	mov r0, #0x28
	strb r0, [r1]
	strb r0, [r1, #1]
	strb r0, [r1, #2]
	strb r0, [r1, #3]
	mov r6, #0
_022498FE:
	mov r2, #0x50
	sub r2, r2, r6
	str r2, [sp, #8]
	lsl r2, r6, #0x18
	lsr r2, r2, #0x18
	mov lr, r2
	ldr r2, [sp, #8]
	mov r0, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	add r5, r0, #0
	mov ip, r2
_02249916:
	add r7, r6, r5
	lsr r3, r7, #0x1f
	lsl r4, r7, #0x1f
	sub r4, r4, r3
	mov r2, #0x1f
	ror r4, r2
	add r2, r3, r4
	lsl r4, r2, #2
	mov r2, #0xf
	lsl r2, r4
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	add r3, r7, r3
	ldr r2, [sp]
	asr r3, r3, #1
	ldrsb r2, [r2, r3]
	tst r2, r4
	beq _02249964
	ldrb r2, [r1]
	cmp r2, r6
	ble _02249944
	mov r2, lr
	strb r2, [r1]
_02249944:
	ldrb r3, [r1, #1]
	ldr r2, [sp, #8]
	cmp r3, r2
	ble _02249950
	mov r2, ip
	strb r2, [r1, #1]
_02249950:
	ldrb r2, [r1, #2]
	cmp r2, r0
	ble _02249958
	strb r0, [r1, #2]
_02249958:
	mov r2, #0x50
	sub r3, r2, r0
	ldrb r2, [r1, #3]
	cmp r2, r3
	ble _02249964
	strb r3, [r1, #3]
_02249964:
	ldr r2, [sp, #4]
	add r0, r0, #1
	add r5, r5, r2
	cmp r0, #0x50
	blt _02249916
	add r6, r6, #1
	cmp r6, #0x50
	blt _022498FE
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_022498E8

	thumb_func_start ov41_02249978
ov41_02249978: ; 0x02249978
	push {r3, r4}
	ldr r4, [sp, #8]
	sub r4, r2, r4
	bmi _02249982
	b _02249984
_02249982:
	mov r4, #0
_02249984:
	strb r4, [r0]
	ldr r4, [sp, #8]
	add r2, r2, r4
	cmp r2, #0xbf
	bgt _02249990
	b _02249992
_02249990:
	mov r2, #0xbf
_02249992:
	strb r2, [r0, #1]
	sub r2, r1, r3
	bmi _0224999A
	b _0224999C
_0224999A:
	mov r2, #0
_0224999C:
	add r1, r1, r3
	strb r2, [r0, #2]
	cmp r1, #0xff
	bgt _022499AA
	strb r1, [r0, #3]
	pop {r3, r4}
	bx lr
_022499AA:
	mov r1, #0xff
	strb r1, [r0, #3]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02249978

	thumb_func_start ov41_022499B4
ov41_022499B4: ; 0x022499B4
	push {r4, r5, r6, lr}
	add r6, r1, #0
	lsl r4, r6, #4
	add r5, r0, #0
	add r0, r2, #0
	add r1, r4, #0
	bl AllocFromHeap
	str r0, [r5]
	cmp r0, #0
	bne _022499CE
	bl GF_AssertFail
_022499CE:
	ldr r0, [r5]
	mov r1, #0
	add r2, r4, #0
	bl memset
	str r6, [r5, #4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_022499B4

	thumb_func_start ov41_022499DC
ov41_022499DC: ; 0x022499DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_022499DC

	thumb_func_start ov41_022499F0
ov41_022499F0: ; 0x022499F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	add r7, r2, #0
	cmp r0, #0
	bne _02249A02
	bl GF_AssertFail
_02249A02:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02249A0C
	bl GF_AssertFail
_02249A0C:
	ldr r2, [r5, #4]
	mov r4, #0
	cmp r2, #0
	ble _02249A24
	ldr r1, [r5]
_02249A16:
	ldr r0, [r1]
	cmp r0, #0
	beq _02249A24
	add r4, r4, #1
	add r1, #0x10
	cmp r4, r2
	blt _02249A16
_02249A24:
	cmp r2, r4
	bgt _02249A2C
	bl GF_AssertFail
_02249A2C:
	ldr r0, [r5]
	lsl r1, r4, #4
	str r6, [r0, r1]
	ldr r0, [r5]
	add r0, r0, r1
	str r7, [r0, #4]
	ldr r0, [r5]
	add r0, r0, r1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_022499F0

	thumb_func_start ov41_02249A40
ov41_02249A40: ; 0x02249A40
	mov r2, #0x10
	mov r1, #0
_02249A44:
	strb r1, [r0]
	add r0, r0, #1
	sub r2, r2, #1
	bne _02249A44
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02249A40

	thumb_func_start ov41_02249A50
ov41_02249A50: ; 0x02249A50
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	ldr r2, [r1, #8]
	str r0, [r2, #0xc]
	str r1, [r0, #0xc]
	str r0, [r1, #8]
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02249A50

	thumb_func_start ov41_02249A60
ov41_02249A60: ; 0x02249A60
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	str r2, [r1, #8]
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #8]
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end ov41_02249A60

	thumb_func_start ov41_02249A70
ov41_02249A70: ; 0x02249A70
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r4, [r6, #8]
	cmp r4, r6
	beq _02249A8E
_02249A7A:
	add r0, r4, #0
	ldr r5, [r4, #8]
	bl ov41_02249A60
	add r0, r4, #0
	bl ov41_02249A40
	add r4, r5, #0
	cmp r5, r6
	bne _02249A7A
_02249A8E:
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_02249A70

	thumb_func_start ov41_02249A90
ov41_02249A90: ; 0x02249A90
	push {r3, lr}
	ldr r2, [r0, #4]
	ldr r0, [r0]
	cmp r2, #3
	bge _02249AA0
	bl ov41_02246014
	pop {r3, pc}
_02249AA0:
	bl ov41_02249700
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_02249A90

	thumb_func_start ov41_02249AA8
ov41_02249AA8: ; 0x02249AA8
	push {r4, lr}
	ldr r4, [r0, #4]
	cmp r4, #0
	bne _02249ABE
	ldr r0, [r0]
	ldr r4, [r0]
	lsl r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_02245F14
	pop {r4, pc}
_02249ABE:
	cmp r4, #1
	bne _02249AD2
	ldr r0, [r0]
	ldr r4, [r0]
	add r4, #0x64
	lsl r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_02245F14
	pop {r4, pc}
_02249AD2:
	cmp r4, #2
	ldr r0, [r0]
	bne _02249AE6
	ldr r4, [r0]
	add r4, #0x64
	lsl r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_02245F14
	pop {r4, pc}
_02249AE6:
	mov r4, #0x76
	lsl r4, r4, #2
	ldr r3, [r3, r4]
	bl ov41_022497A8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_02249AA8

	thumb_func_start ov41_02249AF4
ov41_02249AF4: ; 0x02249AF4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r1, [r0, #4]
	add r4, r2, #0
	cmp r1, #3
	bge _02249B14
	lsl r1, r5, #0x10
	lsl r2, r4, #0x10
	ldr r0, [r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov41_02245F9C
	add sp, #8
	pop {r4, r5, r6, pc}
_02249B14:
	ldr r6, [r0]
	add r1, sp, #4
	add r0, r6, #0
	add r2, sp, #0
	bl ov41_022497A0
	ldr r1, [sp, #4]
	ldr r2, [sp]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	lsr r0, r2, #0x1f
	add r0, r2, r0
	asr r2, r0, #1
	str r1, [sp, #4]
	str r2, [sp]
	add r0, r6, #0
	add r1, r5, r1
	add r2, r4, r2
	bl ov41_0224971C
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_02249AF4

	thumb_func_start ov41_02249B44
ov41_02249B44: ; 0x02249B44
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r3, [r0, #4]
	add r5, r1, #0
	add r4, r2, #0
	cmp r3, #3
	bge _02249B5C
	ldr r0, [r0]
	bl ov41_02245FA8
	add sp, #8
	pop {r4, r5, r6, pc}
_02249B5C:
	ldr r6, [r0]
	add r0, r6, #0
	bl ov41_02249780
	add r0, r6, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_022497A0
	ldr r1, [sp, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	ldr r1, [sp]
	str r2, [sp, #4]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp]
	ldr r0, [r5]
	sub r0, r0, r2
	str r0, [r5]
	ldr r1, [r4]
	ldr r0, [sp]
	sub r0, r1, r0
	str r0, [r4]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_02249B44

	thumb_func_start ov41_02249B94
ov41_02249B94: ; 0x02249B94
	push {r3, lr}
	ldr r3, [r0, #4]
	ldr r0, [r0]
	cmp r3, #3
	bge _02249BA4
	bl ov41_02245FD8
	pop {r3, pc}
_02249BA4:
	bl ov41_022497A0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_02249B94

	thumb_func_start ov41_02249BAC
ov41_02249BAC: ; 0x02249BAC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	ldr r2, [r0, #4]
	add r6, r1, #0
	add r5, r3, #0
	ldr r4, [sp, #0x18]
	cmp r2, #3
	ldr r0, [r0]
	bge _02249BCE
	add r2, r5, #0
	bl ov41_02246020
	ldr r0, [r6]
	str r0, [r7]
	ldr r0, [r5]
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02249BCE:
	add r1, sp, #0
	bl ov41_02249888
	add r0, sp, #0
	ldrb r1, [r0]
	str r1, [r6]
	ldrb r1, [r0, #1]
	str r1, [r7]
	ldrb r1, [r0, #2]
	str r1, [r5]
	ldrb r0, [r0, #3]
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249BAC

	thumb_func_start ov41_02249BE8
ov41_02249BE8: ; 0x02249BE8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5, #8]
	add r6, r1, #0
	add r7, r2, #0
	cmp r4, r5
	beq _02249C1A
_02249BF8:
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov41_02249B44
	ldr r0, [sp, #4]
	add r1, r0, r6
	ldr r0, [sp]
	str r1, [sp, #4]
	add r2, r0, r7
	str r2, [sp]
	add r0, r4, #0
	bl ov41_02249AF4
	ldr r4, [r4, #8]
	cmp r4, r5
	bne _02249BF8
_02249C1A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02249BE8

	thumb_func_start ov41_02249C20
ov41_02249C20: ; 0x02249C20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	add r6, r2, #0
	add r5, r0, #0
	add r1, sp, #0x20
	add r2, sp, #0x1c
	add r7, r3, #0
	bl ov41_02249B94
	add r0, r5, #0
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov41_02249B44
	add r0, sp, #4
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #0x10
	add r2, sp, #8
	add r3, sp, #0xc
	bl ov41_02249BAC
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	add r0, r1, r0
	str r0, [r4]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	add r1, r1, r0
	ldr r0, [sp, #4]
	sub r0, r1, r0
	str r0, [r6]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	str r0, [r7]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r1, r1, r0
	ldr r0, [sp, #8]
	sub r1, r1, r0
	ldr r0, [sp, #0x38]
	str r1, [r0]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249C20

	thumb_func_start ov41_02249C7C
ov41_02249C7C: ; 0x02249C7C
	add r2, r0, #0
	ldr r0, [r1]
	str r0, [r2]
	ldr r3, [r1, #0x14]
	asr r0, r3, #2
	lsr r0, r0, #0x1d
	add r0, r3, r0
	asr r0, r0, #3
	str r0, [r2, #0xc]
	ldr r3, [r1, #0x18]
	asr r0, r3, #2
	lsr r0, r0, #0x1d
	add r0, r3, r0
	asr r0, r0, #3
	str r0, [r2, #0x10]
	ldr r0, [r1, #0x1c]
	ldr r3, _02249CC0 ; =ov41_02249E60
	str r0, [r2, #0x1c]
	ldr r0, [r1, #0x24]
	str r0, [r2, #0x20]
	ldr r0, [r1, #0x20]
	str r0, [r2, #0x24]
	ldr r0, [r1, #0x28]
	str r0, [r2, #0x28]
	ldr r0, [r1, #4]
	str r0, [r2, #4]
	ldr r0, [r1, #0x10]
	str r0, [r2, #8]
	add r0, r1, #0
	add r1, r2, #0
	add r1, #0x14
	add r2, #0x18
	bx r3
	nop
_02249CC0: .word ov41_02249E60
	thumb_func_end ov41_02249C7C

	thumb_func_start ov41_02249CC4
ov41_02249CC4: ; 0x02249CC4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	ldr r0, [r4]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x2c
	bl memset
	pop {r4, pc}
	thumb_func_end ov41_02249CC4

	thumb_func_start ov41_02249CE0
ov41_02249CE0: ; 0x02249CE0
	ldr r2, [r1]
	str r2, [r0]
	ldr r2, [r1, #4]
	str r2, [r0, #4]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	mov r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
	ldr r1, [r1, #0xc]
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov41_02249CE0

	thumb_func_start ov41_02249CF8
ov41_02249CF8: ; 0x02249CF8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r1, r0, r1
	str r1, [r5, #0xc]
	ldr r0, [r5, #8]
	cmp r1, r0
	ble _02249D5C
	mov r2, #0
	str r2, [r5, #0xc]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _02249D1C
	ldr r1, [r5, #4]
	mov r0, #1
	str r0, [r5, #0x10]
	b _02249D22
_02249D1C:
	ldr r0, [r5]
	ldr r1, [r0, #8]
	str r2, [r5, #0x10]
_02249D22:
	ldr r0, [r5, #0x14]
	mov r2, #0
	str r0, [sp]
	ldr r0, [r5]
	add r3, sp, #0x14
	ldr r0, [r0, #4]
	bl GfGfxLoader_GetScrnData
	ldr r3, [r5]
	add r4, r0, #0
	ldr r0, [r3, #0x18]
	str r0, [sp]
	ldr r0, [r3, #0xc]
	str r0, [sp, #4]
	ldr r0, [r3, #0x10]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [r3, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r3]
	ldr r1, [r3, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [r3, #0x14]
	bl ov41_02249F7C
	add r0, r4, #0
	bl FreeToHeap
_02249D5C:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02249CF8

	thumb_func_start ov41_02249D60
ov41_02249D60: ; 0x02249D60
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r1, [r5]
	ldr r0, [r5, #0x14]
	mov r2, #0
	str r0, [sp]
	ldr r0, [r1, #4]
	ldr r1, [r1, #8]
	add r3, sp, #0x14
	bl GfGfxLoader_GetScrnData
	ldr r3, [r5]
	add r4, r0, #0
	ldr r0, [r3, #0x18]
	str r0, [sp]
	ldr r0, [r3, #0xc]
	str r0, [sp, #4]
	ldr r0, [r3, #0x10]
	str r0, [sp, #8]
	ldr r0, [r3, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [r3, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r3]
	ldr r1, [r3, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [r3, #0x14]
	bl ov41_02249F7C
	add r0, r4, #0
	bl FreeToHeap
	mov r1, #0x18
	mov r0, #0
_02249DA6:
	strb r0, [r5]
	add r5, r5, #1
	sub r1, r1, #1
	bne _02249DA6
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_02249D60

	thumb_func_start ov41_02249DB4
ov41_02249DB4: ; 0x02249DB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	ldr r0, _02249E3C ; =ov41_02249F0C
	mov r1, #0x4c
	mov r2, #0
	mov r3, #0xd
	bl sub_02007200
	bl sub_0201F988
	add r4, r0, #0
	str r6, [r4]
	add r7, r5, #0
	add r3, r4, #4
	mov r2, #6
_02249DDA:
	ldmia r7!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02249DDA
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x20]
	str r0, [r4, #0x34]
	ldr r0, [sp]
	str r1, [r4, #0x38]
	bl _s32_div_f
	str r0, [r4, #0x3c]
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	bl _s32_div_f
	str r0, [r4, #0x40]
	ldr r0, [r6]
	ldr r1, [r6, #0x1c]
	bl Bg_GetXpos
	str r0, [r4, #0x44]
	ldr r0, [r6]
	ldr r1, [r6, #0x1c]
	bl Bg_GetYpos
	str r0, [r4, #0x48]
	mov r0, #0x80
	str r0, [r5, #0x28]
	mov r0, #5
	str r0, [r5, #0x24]
	ldr r1, [r5, #0x14]
	ldr r0, [sp]
	sub r0, r1, r0
	str r0, [r5, #0x14]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #4]
	sub r0, r1, r0
	str r0, [r5, #0x18]
	mov r0, #0xe
	mov r1, #0
	str r0, [r5, #0x2c]
	add r0, r5, #0
	add r2, r1, #0
	bl ov41_02249E60
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02249E3C: .word ov41_02249F0C
	thumb_func_end ov41_02249DB4

	thumb_func_start ov41_02249E40
ov41_02249E40: ; 0x02249E40
	push {r3, r4}
	ldr r2, [r0, #8]
	add r0, #0xc
	lsr r4, r2, #1
	mov r3, #0
	cmp r4, #0
	ble _02249E5C
_02249E4E:
	ldrh r2, [r0]
	add r3, r3, #1
	add r2, r2, r1
	strh r2, [r0]
	add r0, r0, #2
	cmp r3, r4
	blt _02249E4E
_02249E5C:
	pop {r3, r4}
	bx lr
	thumb_func_end ov41_02249E40

	thumb_func_start ov41_02249E60
ov41_02249E60: ; 0x02249E60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x14]
	add r6, r2, #0
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	ldr r1, [r5, #0x18]
	str r0, [sp, #0x18]
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x28]
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [r5]
	ldr r3, [r5, #0x1c]
	bl ov41_02249FFC
	ldr r0, [r5, #0x1c]
	cmp r0, #4
	bge _02249EA0
	mov r2, #0
	b _02249EA2
_02249EA0:
	mov r2, #4
_02249EA2:
	ldr r0, [r5, #0x20]
	lsl r0, r0, #5
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #4]
	ldr r3, [r5, #0x24]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0xc]
	lsl r3, r3, #5
	bl ov41_0224A04C
	ldr r0, [r5, #0x2c]
	mov r2, #0
	str r0, [sp]
	ldr r0, [r5, #4]
	ldr r1, [r5, #0x10]
	add r3, sp, #0x24
	bl GfGfxLoader_GetScrnData
	ldr r2, [sp, #0x24]
	str r0, [sp, #0x20]
	ldrh r0, [r2]
	lsr r7, r0, #3
	ldrh r0, [r2, #2]
	add r3, r7, #0
	lsr r0, r0, #3
	str r0, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [r5, #0x28]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x10]
	ldr r0, [r5]
	ldr r1, [r5, #0x1c]
	bl ov41_02249F7C
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	cmp r4, #0
	beq _02249EFE
	str r7, [r4]
_02249EFE:
	cmp r6, #0
	beq _02249F06
	ldr r0, [sp, #0x1c]
	str r0, [r6]
_02249F06:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_02249E60

	thumb_func_start ov41_02249F0C
ov41_02249F0C: ; 0x02249F0C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x38]
	sub r0, r0, #1
	str r0, [r4, #0x38]
	ldr r1, [r4]
	bmi _02249F40
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	ldr r3, [r4, #0x3c]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #2
	bl ScheduleSetBgPosText
	ldr r1, [r4]
	ldr r3, [r4, #0x40]
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	mov r2, #5
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ScheduleSetBgPosText
	pop {r3, r4, r5, pc}
_02249F40:
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	ldr r3, [r4, #0x44]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0
	bl ScheduleSetBgPosText
	ldr r1, [r4]
	ldr r3, [r4, #0x48]
	ldr r0, [r1]
	ldr r1, [r1, #0x1c]
	mov r2, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ScheduleSetBgPosText
	ldr r0, [r4]
	add r1, r4, #4
	bl ov41_02249C7C
	ldr r1, [r4, #0x34]
	cmp r1, #0
	beq _02249F74
	mov r0, #1
	str r0, [r1]
_02249F74:
	add r0, r5, #0
	bl sub_02007234
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_02249F0C

	thumb_func_start ov41_02249F7C
ov41_02249F7C: ; 0x02249F7C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r4, r2, #0
	add r7, r0, #0
	ldr r1, [sp, #0x3c]
	add r0, r4, #0
	add r6, r3, #0
	bl ov41_02249E40
	ldr r1, [sp, #0x30]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	str r0, [sp]
	ldr r3, [sp, #0x38]
	str r2, [sp, #4]
	add r4, #0xc
	lsl r3, r3, #0x18
	str r4, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	ldr r2, [sp, #0x34]
	lsl r1, r5, #0x18
	lsl r2, r2, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl CopyToBgTilemapRect
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x34]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	ldr r3, [sp, #0x38]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r1, r5, #0x18
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	str r0, [sp, #8]
	add r0, r7, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl BgTilemapRectChangePalette
	lsl r1, r5, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_02249F7C

	thumb_func_start ov41_02249FFC
ov41_02249FFC: ; 0x02249FFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	str r1, [sp, #4]
	ldr r0, [sp, #0x24]
	mov r1, #0x14
	add r5, r2, #0
	add r6, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_0224A018:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0224A018
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #4]
	str r0, [sp]
	add r0, r7, #0
	mov r2, #0
	add r3, r4, #4
	bl GfGfxLoader_GetCharData
	str r0, [r4, #8]
	str r5, [r4]
	ldr r0, [sp, #0x20]
	str r6, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r0, _0224A048 ; =ov41_0224A094
	add r1, r4, #0
	mov r2, #0x80
	bl sub_0200E374
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224A048: .word ov41_0224A094
	thumb_func_end ov41_02249FFC

	thumb_func_start ov41_0224A04C
ov41_0224A04C: ; 0x0224A04C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	str r1, [sp]
	ldr r0, [sp, #0x1c]
	mov r1, #0x14
	add r5, r2, #0
	add r6, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_0224A066:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0224A066
	ldr r1, [sp]
	ldr r3, [sp, #0x1c]
	add r0, r7, #0
	add r2, r4, #0
	bl GfGfxLoader_GetPlttData
	str r0, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [sp, #0x18]
	str r6, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r0, _0224A090 ; =ov41_0224A0D0
	add r1, r4, #0
	mov r2, #0x80
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224A090: .word ov41_0224A0D0
	thumb_func_end ov41_0224A04C

	thumb_func_start ov41_0224A094
ov41_0224A094: ; 0x0224A094
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #4]
	add r5, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldr r3, [r4, #4]
	ldr r0, [r4, #0x10]
	str r0, [sp]
	ldr r1, [r4, #0xc]
	ldr r2, [r3, #0x14]
	lsl r1, r1, #0x18
	ldr r0, [r4]
	ldr r3, [r3, #0x10]
	lsr r1, r1, #0x18
	bl BG_LoadCharTilesData
	add r0, r5, #0
	bl DestroySysTask
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A094

	thumb_func_start ov41_0224A0D0
ov41_0224A0D0: ; 0x0224A0D0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _0224A0F4
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ldr r2, [r4, #0x10]
	bl GX_LoadBGPltt
	b _0224A104
_0224A0F4:
	cmp r0, #4
	bne _0224A104
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ldr r2, [r4, #0x10]
	bl GXS_LoadBGPltt
_0224A104:
	add r0, r5, #0
	bl DestroySysTask
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224A0D0

	thumb_func_start ov41_0224A118
ov41_0224A118: ; 0x0224A118
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0224A126
	bl GF_AssertFail
_0224A126:
	cmp r4, #0
	bne _0224A12E
	bl GF_AssertFail
_0224A12E:
	ldr r0, [r4]
	bl CreateSprite
	str r0, [r5]
	cmp r0, #0
	bne _0224A13E
	bl GF_AssertFail
_0224A13E:
	ldr r0, [r4, #0xc]
	str r0, [r5, #4]
	ldr r0, [r4, #8]
	str r0, [r5, #8]
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224A150
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
_0224A150:
	ldr r0, _0224A158 ; =ov41_0224A254
	str r0, [r5, #0xc]
	pop {r3, r4, r5, pc}
	nop
_0224A158: .word ov41_0224A254
	thumb_func_end ov41_0224A118

	thumb_func_start ov41_0224A15C
ov41_0224A15C: ; 0x0224A15C
	push {r3, r4, r5, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r5, r0, #0
	bl ov41_0224A118
	ldr r0, [r4, #0x14]
	str r0, [sp]
	ldr r0, [r4, #0x10]
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r5]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x24]
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x20]
	str r0, [sp, #0x1c]
	mov r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	ldr r0, [r4]
	ldr r0, [r0, #0x28]
	str r0, [sp, #0x28]
	ldr r0, [r4]
	ldr r0, [r0, #0x2c]
	str r0, [sp, #0x2c]
	add r0, sp, #0
	bl sub_020135D8
	str r0, [r5, #0x10]
	add sp, #0x30
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224A15C

	thumb_func_start ov41_0224A1A8
ov41_0224A1A8: ; 0x0224A1A8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02024758
	mov r1, #0x10
	mov r0, #0
_0224A1B6:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _0224A1B6
	pop {r4, pc}
	thumb_func_end ov41_0224A1A8

	thumb_func_start ov41_0224A1C0
ov41_0224A1C0: ; 0x0224A1C0
	push {r4, lr}
	add r4, r0, #0
	bl ov41_0224A1A8
	ldr r0, [r4, #0x10]
	bl sub_02013660
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x20
	bl memset
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A1C0

	thumb_func_start ov41_0224A1DC
ov41_0224A1DC: ; 0x0224A1DC
	push {r3, lr}
	ldr r2, [r0, #4]
	cmp r1, r2
	bne _0224A1EA
	ldr r1, [r0, #8]
	ldr r2, [r0, #0xc]
	blx r2
_0224A1EA:
	pop {r3, pc}
	thumb_func_end ov41_0224A1DC

	thumb_func_start ov41_0224A1EC
ov41_0224A1EC: ; 0x0224A1EC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	mov r4, #2
	add r5, #0x20
_0224A1F8:
	cmp r4, r7
	beq _0224A204
	add r0, r5, #0
	bl ov41_0224A264
	b _0224A228
_0224A204:
	cmp r6, #0
	bne _0224A216
	add r0, r5, #0
	bl ov41_0224A270
	ldr r0, _0224A234 ; =0x0000067C
	bl PlaySE
	b _0224A228
_0224A216:
	cmp r6, #2
	bne _0224A222
	add r0, r5, #0
	bl ov41_0224A258
	b _0224A228
_0224A222:
	add r0, r5, #0
	bl ov41_0224A270
_0224A228:
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #3
	ble _0224A1F8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224A234: .word 0x0000067C
	thumb_func_end ov41_0224A1EC

	thumb_func_start ov41_0224A238
ov41_0224A238: ; 0x0224A238
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _0224A24A
	bl GF_AssertFail
_0224A24A:
	str r7, [r5, #4]
	str r6, [r5, #8]
	str r4, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A238

	thumb_func_start ov41_0224A254
ov41_0224A254: ; 0x0224A254
	bx lr
	.balign 4, 0
	thumb_func_end ov41_0224A254

	thumb_func_start ov41_0224A258
ov41_0224A258: ; 0x0224A258
	ldr r3, _0224A260 ; =sub_020249D4
	ldr r0, [r0]
	mov r1, #2
	bx r3
	.balign 4, 0
_0224A260: .word sub_020249D4
	thumb_func_end ov41_0224A258

	thumb_func_start ov41_0224A264
ov41_0224A264: ; 0x0224A264
	ldr r3, _0224A26C ; =sub_020249D4
	ldr r0, [r0]
	mov r1, #0
	bx r3
	.balign 4, 0
_0224A26C: .word sub_020249D4
	thumb_func_end ov41_0224A264

	thumb_func_start ov41_0224A270
ov41_0224A270: ; 0x0224A270
	ldr r3, _0224A278 ; =sub_020249D4
	ldr r0, [r0]
	mov r1, #1
	bx r3
	.balign 4, 0
_0224A278: .word sub_020249D4
	thumb_func_end ov41_0224A270

	thumb_func_start ov41_0224A27C
ov41_0224A27C: ; 0x0224A27C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x80
	add r4, r1, #0
	str r2, [r0]
	mov r0, #1
	mov r1, #0xd
	bl sub_02013534
	str r0, [r5, #0x64]
	add r0, r4, #0
	bl ov41_0224A7F8
	mov r0, #0x90
	str r0, [sp]
	mov r0, #0x28
	str r0, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #0x30
	bl ov41_0224A6C4
	mov r0, #0x28
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x6c
	mov r1, #0
	mov r2, #0x30
	mov r3, #0x98
	bl ov41_0224A7E0
	mov r0, #0x90
	str r0, [sp]
	mov r0, #0x28
	str r0, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x10
	mov r1, #1
	add r2, r4, #0
	mov r3, #8
	bl ov41_0224A6C4
	mov r0, #0x28
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x6c
	mov r1, #1
	mov r2, #8
	mov r3, #0x98
	bl ov41_0224A7E0
	mov r0, #0x90
	str r0, [sp]
	mov r0, #0x28
	str r0, [sp, #4]
	mov r0, #0x2a
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x20
	mov r1, #2
	add r2, r4, #0
	mov r3, #0x60
	bl ov41_0224A6C4
	mov r0, #0x28
	str r0, [sp]
	mov r0, #0x22
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x6c
	mov r1, #2
	mov r2, #0x60
	mov r3, #0x9c
	bl ov41_0224A7E0
	mov r0, #0x90
	str r0, [sp]
	mov r0, #0x28
	str r0, [sp, #4]
	mov r0, #0x2a
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x30
	mov r1, #3
	add r2, r4, #0
	mov r3, #0x88
	bl ov41_0224A6C4
	mov r0, #0x28
	str r0, [sp]
	mov r0, #0x22
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x6c
	mov r1, #3
	mov r2, #0x88
	mov r3, #0x9c
	bl ov41_0224A7E0
	mov r0, #2
	mov r1, #0xe
	bl FontID_Alloc
	mov r0, #9
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0x1b
	mov r2, #0xd7
	mov r3, #0
	bl ov41_0224A928
	add r6, r0, #0
	str r6, [sp]
	mov r0, #0xb8
	str r0, [sp, #4]
	mov r0, #0x90
	str r0, [sp, #8]
	mov r0, #0x48
	str r0, [sp, #0xc]
	mov r0, #0x2a
	str r0, [sp, #0x10]
	add r0, r5, #0
	ldr r3, [r5, #0x64]
	add r0, #0x40
	mov r1, #4
	add r2, r4, #0
	bl ov41_0224A734
	mov r0, #0x48
	str r0, [sp]
	mov r0, #0x22
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x6c
	mov r1, #4
	mov r2, #0xb8
	mov r3, #0x9c
	bl ov41_0224A7E0
	add r0, r6, #0
	bl ov41_0224A9B0
	mov r0, #2
	bl FontID_Release
	mov r0, #1
	str r0, [r5, #0x60]
	add r0, r4, #0
	bl ov41_0224A888
	add r0, r5, #0
	add r0, #0x20
	bl ov41_0224A258
	mov r0, #0xd
	str r0, [sp]
	add r0, r5, #0
	ldr r2, _0224A3E0 ; =ov41_0224A60C
	add r0, #0x6c
	mov r1, #5
	add r3, r5, #0
	bl sub_02026C44
	str r0, [r5, #0x68]
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0224A3E0: .word ov41_0224A60C
	thumb_func_end ov41_0224A27C

	thumb_func_start ov41_0224A3E4
ov41_0224A3E4: ; 0x0224A3E4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
_0224A3EC:
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_02246388
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_0224639C
	add r0, r4, #0
	bl sub_02021884
	add r4, r4, #1
	cmp r4, #5
	blt _0224A3EC
	mov r0, #0
	bl sub_02022744
	mov r0, #1
	bl sub_02022744
	mov r5, #0
	add r4, r6, #0
_0224A418:
	add r0, r4, #0
	bl ov41_0224A1A8
	add r5, r5, #1
	add r4, #0x10
	cmp r5, #4
	blt _0224A418
	add r0, r6, #0
	add r0, #0x54
	bl sub_02021B5C
	add r0, r6, #0
	add r0, #0x40
	bl ov41_0224A1C0
	ldr r0, [r6, #0x64]
	bl sub_020135AC
	ldr r0, [r6, #0x68]
	bl sub_02026CAC
	mov r0, #0
	str r0, [r6, #0x68]
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_0224A3E4

	thumb_func_start ov41_0224A448
ov41_0224A448: ; 0x0224A448
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x68]
	mov r4, #0xff
	cmp r0, #0
	bne _0224A458
	bl GF_AssertFail
_0224A458:
	add r0, r5, #0
	add r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	beq _0224A48C
	add r0, r5, #0
	add r0, #0x84
	ldrh r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x84
	strh r1, [r0]
	add r1, r5, #0
	add r1, #0x84
	ldrh r2, [r1]
	mov r1, #1
	add r0, r5, #0
	eor r2, r1
	ldr r1, _0224A4E4 ; =ov41_0224C094
	add r0, #0x86
	ldrb r1, [r1, r2]
	ldrh r0, [r0]
	add r2, r5, #0
	bl ov41_0224A60C
	pop {r3, r4, r5, pc}
_0224A48C:
	ldr r0, _0224A4E8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	add r2, r1, #0
	tst r2, r0
	beq _0224A49C
	mov r4, #4
	b _0224A4C2
_0224A49C:
	mov r2, #0x40
	tst r2, r1
	beq _0224A4A6
	mov r4, #1
	b _0224A4C2
_0224A4A6:
	mov r2, #0x80
	tst r2, r1
	beq _0224A4B0
	mov r4, #0
	b _0224A4C2
_0224A4B0:
	mov r2, #0x20
	tst r2, r1
	beq _0224A4BA
	mov r4, #2
	b _0224A4C2
_0224A4BA:
	mov r2, #0x10
	tst r1, r2
	beq _0224A4C2
	add r4, r0, #0
_0224A4C2:
	cmp r4, #0xff
	beq _0224A4E2
	add r0, r5, #0
	add r0, #0x86
	strh r4, [r0]
	add r0, r5, #0
	mov r1, #2
	add r0, #0x84
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x86
	ldrh r0, [r0]
	mov r1, #0
	add r2, r5, #0
	bl ov41_0224A60C
_0224A4E2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0224A4E4: .word ov41_0224C094
_0224A4E8: .word gSystem
	thumb_func_end ov41_0224A448

	thumb_func_start ov41_0224A4EC
ov41_0224A4EC: ; 0x0224A4EC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x84
	ldrh r0, [r0]
	cmp r0, #0
	beq _0224A4FC
	mov r0, #0
	pop {r4, pc}
_0224A4FC:
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #1
	bne _0224A526
	bl System_GetTouchHeld
	cmp r0, #0
	beq _0224A514
	mov r0, #0
	pop {r4, pc}
_0224A514:
	ldr r0, _0224A548 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0224A542
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #0
	str r1, [r0]
	b _0224A542
_0224A526:
	ldr r0, _0224A548 ; =gSystem
	ldr r0, [r0, #0x44]
	cmp r0, #0
	beq _0224A532
	mov r0, #0
	pop {r4, pc}
_0224A532:
	bl System_GetTouchHeld
	cmp r0, #0
	beq _0224A542
	add r4, #0x80
	ldr r0, [r4]
	mov r1, #1
	str r1, [r0]
_0224A542:
	mov r0, #0
	pop {r4, pc}
	nop
_0224A548: .word gSystem
	thumb_func_end ov41_0224A4EC

	thumb_func_start ov41_0224A54C
ov41_0224A54C: ; 0x0224A54C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	cmp r0, #0
	bne _0224A55A
	bl GF_AssertFail
_0224A55A:
	add r0, r4, #0
	bl ov41_0224A4EC
	cmp r0, #0
	bne _0224A57E
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _0224A578
	add r0, r4, #0
	bl ov41_0224A448
	pop {r4, pc}
_0224A578:
	ldr r0, [r4, #0x68]
	bl sub_02026CC4
_0224A57E:
	pop {r4, pc}
	thumb_func_end ov41_0224A54C

	thumb_func_start ov41_0224A580
ov41_0224A580: ; 0x0224A580
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x40
	mov r1, #3
	bl ov41_0224A8B0
	add r0, r4, #0
	add r0, #0x40
	mov r1, #3
	bl ov41_0224A8D4
	add r0, r4, #0
	mov r1, #2
	mov r2, #3
	bl ov41_0224A1EC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A580

	thumb_func_start ov41_0224A5A4
ov41_0224A5A4: ; 0x0224A5A4
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r6, r1, #0
	add r7, r2, #0
	mov r4, #0
	add r5, r0, #0
_0224A5B0:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov41_0224A9BC
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _0224A5B0
	ldr r0, [sp]
	add r1, r6, #0
	add r0, #0x40
	add r2, r7, #0
	str r0, [sp]
	bl ov41_0224A9F8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A5A4

	thumb_func_start ov41_0224A5D4
ov41_0224A5D4: ; 0x0224A5D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _0224A5E6
	bl GF_AssertFail
_0224A5E6:
	cmp r4, #4
	bge _0224A5FA
	lsl r0, r4, #4
	ldr r3, [sp, #0x18]
	add r0, r5, r0
	add r1, r6, #0
	add r2, r7, #0
	bl ov41_0224A238
	pop {r3, r4, r5, r6, r7, pc}
_0224A5FA:
	add r5, #0x40
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov41_0224A238
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A5D4

	thumb_func_start ov41_0224A60C
ov41_0224A60C: ; 0x0224A60C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	cmp r6, #4
	bhi _0224A6B8
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224A624: ; jump table
	.short _0224A62E - _0224A624 - 2 ; case 0
	.short _0224A64C - _0224A624 - 2 ; case 1
	.short _0224A670 - _0224A624 - 2 ; case 2
	.short _0224A670 - _0224A624 - 2 ; case 3
	.short _0224A686 - _0224A624 - 2 ; case 4
_0224A62E:
	add r0, r4, #0
	bl ov41_0224A8B0
	mov r1, #0x1a
	add r0, r4, #0
	lsl r1, r1, #6
	mov r2, #0
	add r3, r5, #0
	bl ov41_0224A918
	add r0, r4, #0
	add r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A64C:
	add r0, r4, #0
	add r0, #0x10
	bl ov41_0224A8B0
	add r0, r4, #0
	mov r1, #0x1a
	add r0, #0x10
	lsl r1, r1, #6
	mov r2, #0
	add r3, r5, #0
	bl ov41_0224A918
	add r4, #0x10
	add r0, r4, #0
	add r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A670:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov41_0224A1EC
	lsl r0, r6, #4
	add r0, r4, r0
	add r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A686:
	ldr r0, [r4, #0x60]
	cmp r0, #1
	bne _0224A6BC
	add r0, r4, #0
	add r0, #0x40
	bl ov41_0224A8B0
	add r0, r4, #0
	add r0, #0x40
	add r1, r5, #0
	bl ov41_0224A8D4
	add r0, r4, #0
	ldr r1, _0224A6C0 ; =0x000005E2
	add r0, #0x40
	mov r2, #0
	add r3, r5, #0
	bl ov41_0224A918
	add r4, #0x40
	add r0, r4, #0
	add r1, r5, #0
	bl ov41_0224A1DC
	pop {r4, r5, r6, pc}
_0224A6B8:
	bl GF_AssertFail
_0224A6BC:
	pop {r4, r5, r6, pc}
	nop
_0224A6C0: .word 0x000005E2
	thumb_func_end ov41_0224A60C

	thumb_func_start ov41_0224A6C4
ov41_0224A6C4: ; 0x0224A6C4
	push {r4, r5, r6, lr}
	sub sp, #0x90
	add r6, r0, #0
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	add r5, r2, #0
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r5, #0x48]
	add r4, r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x4c]
	add r3, r1, #0
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x50]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x5c
	bl CreateSpriteResourcesHeader
	ldr r0, [r5, #0x44]
	mov r2, #0
	mov r1, #1
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	lsl r0, r4, #0xc
	str r0, [sp, #0x34]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #0x54]
	lsl r0, r0, #0xc
	str r0, [sp, #0x38]
	mov r0, #2
	str r0, [sp, #0x50]
	mov r0, #0xe
	str r0, [sp, #0x58]
	add r0, sp, #0x2c
	str r0, [sp, #0x80]
	str r1, [sp, #0x8c]
	add r0, r6, #0
	add r1, sp, #0x80
	str r2, [sp, #0x3c]
	str r2, [sp, #0x84]
	str r2, [sp, #0x88]
	bl ov41_0224A118
	add sp, #0x90
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A6C4

	thumb_func_start ov41_0224A734
ov41_0224A734: ; 0x0224A734
	push {r4, r5, r6, lr}
	sub sp, #0xa8
	add r5, r0, #0
	mov r0, #0
	str r1, [sp]
	mvn r0, r0
	str r0, [sp, #4]
	add r4, r2, #0
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, [r4, #0x48]
	add r6, r3, #0
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x4c]
	add r3, r1, #0
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x50]
	str r0, [sp, #0x1c]
	ldr r0, [r4, #0x54]
	str r0, [sp, #0x20]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	add r0, sp, #0x5c
	bl CreateSpriteResourcesHeader
	ldr r0, [r4, #0x44]
	mov r2, #0xe
	str r0, [sp, #0x2c]
	add r0, sp, #0x5c
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xbc]
	str r2, [sp, #0x58]
	lsl r0, r0, #0xc
	str r0, [sp, #0x34]
	ldr r0, [sp, #0xc0]
	add r2, sp, #0x2c
	lsl r0, r0, #0xc
	mov r1, #2
	str r2, [sp, #0x80]
	ldr r2, [sp, #0xb8]
	str r0, [sp, #0x38]
	mov r0, #0
	str r1, [sp, #0x50]
	mov r1, #1
	str r0, [sp, #0x3c]
	str r1, [sp, #0x54]
	str r0, [sp, #0x84]
	str r0, [sp, #0x88]
	str r0, [sp, #0x9c]
	mov r0, #0x13
	str r1, [sp, #0x8c]
	str r6, [sp, #0x94]
	str r2, [sp, #0x90]
	str r0, [sp, #0xa0]
	ldr r0, [r4, #0x4c]
	bl Get2DGfxResObjById
	mov r1, #0
	bl sub_0200B0F8
	str r0, [sp, #0x98]
	ldr r0, [sp, #0xb8]
	mov r1, #1
	mov r2, #0xd
	bl sub_02013688
	mov r1, #1
	add r3, r5, #0
	add r2, r1, #0
	add r3, #0x14
	bl sub_02021AC8
	cmp r0, #0
	bne _0224A7D0
	bl GF_AssertFail
_0224A7D0:
	ldr r0, [r5, #0x18]
	add r1, sp, #0x80
	str r0, [sp, #0xa4]
	add r0, r5, #0
	bl ov41_0224A15C
	add sp, #0xa8
	pop {r4, r5, r6, pc}
	thumb_func_end ov41_0224A734

	thumb_func_start ov41_0224A7E0
ov41_0224A7E0: ; 0x0224A7E0
	lsl r1, r1, #2
	strb r3, [r0, r1]
	add r1, r0, r1
	ldr r0, [sp, #4]
	strb r2, [r1, #2]
	add r0, r3, r0
	strb r0, [r1, #1]
	ldr r0, [sp]
	add r0, r2, r0
	strb r0, [r1, #3]
	bx lr
	.balign 4, 0
	thumb_func_end ov41_0224A7E0

	thumb_func_start ov41_0224A7F8
ov41_0224A7F8: ; 0x0224A7F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x6b
	mov r4, #0
	str r0, [sp, #0xc]
	mov r7, #0x6a
	mov r6, #0x69
_0224A808:
	mov r0, #1
	str r0, [sp]
	mov r1, #6
	str r4, [sp, #4]
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	ldr r2, [sp, #0xc]
	add r0, r5, #0
	mov r3, #0
	bl ov41_022462E4
	mov r1, #6
	str r4, [sp]
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, r7, #0
	mov r3, #0
	bl ov41_02246328
	mov r1, #6
	str r4, [sp]
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov41_02246344
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r0, r0, #3
	str r0, [sp, #0xc]
	add r7, r7, #3
	add r6, r6, #3
	cmp r4, #5
	blt _0224A808
	mov r0, #1
	str r0, [sp]
	mov r1, #3
	str r1, [sp, #4]
	mov r3, #0
	str r3, [sp, #8]
	lsl r1, r1, #7
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0x68
	bl ov41_02246304
	mov r1, #1
	str r1, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #6
	lsl r1, r1, #6
	ldr r1, [r5, r1]
	add r0, r5, #0
	mov r2, #0x78
	mov r3, #0
	bl ov41_02246304
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224A7F8

	thumb_func_start ov41_0224A888
ov41_0224A888: ; 0x0224A888
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0224A88E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_02246360
	add r4, r4, #1
	cmp r4, #5
	blt _0224A88E
	add r0, r5, #0
	mov r1, #0
	bl ov41_02246374
	add r0, r5, #0
	mov r1, #1
	bl ov41_02246374
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A888

	thumb_func_start ov41_0224A8B0
ov41_0224A8B0: ; 0x0224A8B0
	push {r3, lr}
	cmp r1, #0
	bne _0224A8BC
	bl ov41_0224A270
	pop {r3, pc}
_0224A8BC:
	cmp r1, #2
	bne _0224A8C6
	bl ov41_0224A258
	pop {r3, pc}
_0224A8C6:
	cmp r1, #1
	beq _0224A8CE
	cmp r1, #3
	bne _0224A8D2
_0224A8CE:
	bl ov41_0224A264
_0224A8D2:
	pop {r3, pc}
	thumb_func_end ov41_0224A8B0

	thumb_func_start ov41_0224A8D4
ov41_0224A8D4: ; 0x0224A8D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _0224A8F0
	ldr r0, [r5, #0x10]
	mov r1, #0
	mov r2, #0xf
	bl sub_020136B4
	ldr r0, [r5, #0x10]
	mov r1, #4
	bl sub_02013850
	pop {r3, r4, r5, pc}
_0224A8F0:
	cmp r4, #1
	bne _0224A8FE
	ldr r0, [r5, #0x10]
	mov r1, #0
	mov r2, #0x13
	bl sub_020136B4
_0224A8FE:
	cmp r4, #3
	bne _0224A914
	ldr r0, [r5, #0x10]
	mov r1, #0
	mov r2, #0x13
	bl sub_020136B4
	ldr r0, [r5, #0x10]
	mov r1, #3
	bl sub_02013850
_0224A914:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A8D4

	thumb_func_start ov41_0224A918
ov41_0224A918: ; 0x0224A918
	push {r3, lr}
	cmp r3, r2
	bne _0224A926
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl PlaySE
_0224A926:
	pop {r3, pc}
	thumb_func_end ov41_0224A918

	thumb_func_start ov41_0224A928
ov41_0224A928: ; 0x0224A928
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r3, #0
	mov r0, #0
	mov r3, #0xd
	bl NewMsgDataFromNarc
	add r7, r0, #0
	bne _0224A940
	bl GF_AssertFail
_0224A940:
	add r0, r7, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	mov r0, #0xe
	mov r1, #1
	bl AllocWindows
	add r4, r0, #0
	bl InitWindow
	mov r0, #0
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	str r0, [sp]
	str r0, [sp, #4]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r6, #0x40]
	add r1, r4, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl AddTextWindowTopLeftCorner
	ldr r3, [sp, #0x28]
	mov r0, #2
	add r1, r5, #0
	mov r2, #0
	lsl r3, r3, #3
	bl FontID_String_GetCenterAlignmentX
	mov r1, #0
	add r3, r0, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0224A9AC ; =0x00010203
	add r2, r5, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r4, #0
	mov r1, #2
	bl AddTextPrinterParameterized2
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224A9AC: .word 0x00010203
	thumb_func_end ov41_0224A928

	thumb_func_start ov41_0224A9B0
ov41_0224A9B0: ; 0x0224A9B0
	ldr r3, _0224A9B8 ; =WindowArray_dtor
	mov r1, #1
	bx r3
	nop
_0224A9B8: .word WindowArray_dtor
	thumb_func_end ov41_0224A9B0

	thumb_func_start ov41_0224A9BC
ov41_0224A9BC: ; 0x0224A9BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r6, r2, #0
	bl sub_020248AC
	add r3, r0, #0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [sp]
	lsl r0, r4, #0xc
	add r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	lsl r0, r6, #0xc
	add r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, r7, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224A9BC

	thumb_func_start ov41_0224A9F8
ov41_0224A9F8: ; 0x0224A9F8
	push {r4, lr}
	add r4, r0, #0
	bl ov41_0224A9BC
	ldr r0, [r4, #0x10]
	bl sub_02013728
	pop {r4, pc}
	thumb_func_end ov41_0224A9F8

	thumb_func_start ov41_0224AA08
ov41_0224AA08: ; 0x0224AA08
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r6, r2, #0
	mov r1, #1
	add r5, r0, #0
	tst r1, r6
	beq _0224AA22
	mov r2, #0x52
	mov r1, #0
	lsl r2, r2, #2
	bl memset
_0224AA22:
	mov r0, #2
	tst r0, r6
	beq _0224AA30
	ldr r1, [r4]
	add r0, r5, #0
	bl ov41_0224ACA4
_0224AA30:
	mov r0, #4
	add r1, r6, #0
	tst r1, r0
	beq _0224AA54
	mov r1, #0x1b
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0x1f
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	add r0, r5, #0
	ldr r1, [r4]
	add r0, #0x2c
	mov r2, #2
	mov r3, #0x13
	bl ov41_0224AD0C
_0224AA54:
	mov r0, #8
	tst r0, r6
	beq _0224AA6C
	ldr r0, [r4, #0x24]
	str r0, [sp]
	add r0, r5, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x10]
	add r0, #0x38
	bl ov41_0224AED8
_0224AA6C:
	mov r0, #0x10
	tst r0, r6
	beq _0224AA8C
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [r4, #0x20]
	str r0, [sp, #4]
	ldr r0, [r4, #0x24]
	str r0, [sp, #8]
	add r0, r5, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x1c]
	add r0, #0xa0
	bl ov41_0224B118
_0224AA8C:
	mov r0, #0x20
	tst r0, r6
	beq _0224AB02
	mov r0, #0x1b
	str r0, [sp]
	mov r2, #2
	str r2, [sp, #4]
	mov r0, #0x8b
	str r0, [sp, #8]
	mov r3, #1
	str r3, [sp, #0xc]
	add r0, #0xa9
	ldr r1, [r4]
	add r0, r5, r0
	bl ov41_0224AD0C
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0224AB3C ; =0x0001020F
	mov r1, #0x1b
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	add r0, #0x35
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x14]
	mov r3, #6
	bl ov41_0224AE24
	mov r0, #0x48
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0224AB3C ; =0x0001020F
	mov r1, #0x1b
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	add r0, #0x35
	ldr r0, [r5, r0]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl ov41_0224AE24
	mov r0, #0x4d
	lsl r0, r0, #2
	mov r2, #1
	ldr r0, [r5, r0]
	mov r1, #0
	add r3, r2, #0
	bl DrawFrameAndWindow2
_0224AB02:
	ldr r0, [r4, #4]
	str r0, [r5, #0x30]
	ldr r0, [r4, #8]
	str r0, [r5, #0x34]
	ldr r0, [r4]
	ldr r1, [r4, #0xc]
	bl ov41_0224ACDC
	ldr r0, [r4, #0xc]
	bl Options_GetFrame
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r5, r1]
	ldr r0, [r4, #0xc]
	bl Options_GetTextFrameDelay
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	add r0, r1, #0
	sub r0, #8
	ldr r0, [r5, r0]
	sub r1, #8
	orr r0, r6
	str r0, [r5, r1]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_0224AB3C: .word 0x0001020F
	thumb_func_end ov41_0224AA08

	thumb_func_start ov41_0224AB40
ov41_0224AB40: ; 0x0224AB40
	push {r4, lr}
	mov r1, #0x4e
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r1, #2
	tst r1, r2
	beq _0224AB60
	bl ov41_0224AD7C
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #2
	bic r2, r0
	str r2, [r4, r1]
_0224AB60:
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #4
	tst r0, r1
	beq _0224AB7E
	ldr r0, [r4, #0x2c]
	bl ov41_0224AD84
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #4
	bic r2, r0
	str r2, [r4, r1]
_0224AB7E:
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #8
	tst r0, r1
	beq _0224ABA0
	add r0, r4, #0
	ldr r1, [r4, #0x34]
	add r0, #0x38
	bl ov41_0224AFD4
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #8
	bic r2, r0
	str r2, [r4, r1]
_0224ABA0:
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0x10
	tst r0, r1
	beq _0224ABC2
	add r0, r4, #0
	ldr r1, [r4, #0x34]
	add r0, #0xa0
	bl ov41_0224B21C
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #0x10
	bic r2, r0
	str r2, [r4, r1]
_0224ABC2:
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r2, [r4, r0]
	mov r1, #0x20
	tst r1, r2
	beq _0224ABE2
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl ov41_0224AD84
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r2, [r4, r1]
	mov r0, #0x20
	bic r2, r0
	str r2, [r4, r1]
_0224ABE2:
	mov r2, #0x52
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	pop {r4, pc}
	thumb_func_end ov41_0224AB40

	thumb_func_start ov41_0224ABF0
ov41_0224ABF0: ; 0x0224ABF0
	push {r3, lr}
	mov r1, #0x4e
	lsl r1, r1, #2
	ldr r2, [r0, r1]
	mov r1, #0x10
	tst r1, r2
	beq _0224AC04
	add r0, #0xa0
	bl ov41_0224B250
_0224AC04:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_0224ABF0

	thumb_func_start ov41_0224AC08
ov41_0224AC08: ; 0x0224AC08
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r1, [r5, r0]
	mov r0, #4
	add r6, r2, #0
	add r7, r3, #0
	tst r0, r1
	bne _0224AC24
	bl GF_AssertFail
_0224AC24:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xff
	str r0, [sp, #8]
	ldr r0, [r5, #0x2c]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov41_0224AD90
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224AC08

	thumb_func_start ov41_0224AC40
ov41_0224AC40: ; 0x0224AC40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x4e
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r1, [r5, r0]
	mov r0, #4
	add r6, r2, #0
	add r7, r3, #0
	tst r0, r1
	bne _0224AC5C
	bl GF_AssertFail
_0224AC5C:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #5
	lsl r0, r0, #6
	ldr r1, [r5, r0]
	add r0, r0, #4
	str r1, [sp, #8]
	add r0, r5, r0
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov41_0224ADD8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AC40

	thumb_func_start ov41_0224AC80
ov41_0224AC80: ; 0x0224AC80
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl String_dtor
	mov r0, #0x51
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov41_0224AC80

	thumb_func_start ov41_0224AC98
ov41_0224AC98: ; 0x0224AC98
	ldr r3, _0224ACA0 ; =ov41_0224AF8C
	add r0, #0x38
	bx r3
	nop
_0224ACA0: .word ov41_0224AF8C
	thumb_func_end ov41_0224AC98

	thumb_func_start ov41_0224ACA4
ov41_0224ACA4: ; 0x0224ACA4
	push {r3, lr}
	sub sp, #0x30
	str r1, [sp]
	mov r1, #0x1a
	str r1, [sp, #4]
	mov r1, #0xe0
	str r1, [sp, #8]
	mov r1, #0xe1
	str r1, [sp, #0xc]
	mov r2, #0
	mov r1, #0xe2
	str r1, [sp, #0x10]
	mov r1, #4
	str r1, [sp, #0x1c]
	mov r1, #1
	str r1, [sp, #0x20]
	mov r1, #0xe
	str r1, [sp, #0x2c]
	add r1, sp, #0
	str r2, [sp, #0x14]
	str r2, [sp, #0x18]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	bl ov41_02249C7C
	add sp, #0x30
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov41_0224ACA4

	thumb_func_start ov41_0224ACDC
ov41_0224ACDC: ; 0x0224ACDC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, r1, #0
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xe
	mov r2, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #5
	add r3, r2, #0
	bl LoadUserFrameGfx2
	mov r0, #4
	mov r1, #0x40
	mov r2, #0xe
	bl LoadFontPal1
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov41_0224ACDC

	thumb_func_start ov41_0224AD0C
ov41_0224AD0C: ; 0x0224AD0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r7, r1, #0
	add r6, r3, #0
	mov r0, #0xe
	mov r1, #1
	add r4, r2, #0
	bl AllocWindows
	str r0, [r5]
	bl InitWindow
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x28]
	lsl r3, r4, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	mov r2, #5
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	lsr r3, r3, #0x18
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldr r1, [r5]
	add r0, r7, #0
	bl AddWindowParameterized
	ldr r0, [r5]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x34]
	cmp r0, #0
	beq _0224AD70
	mov r2, #1
	ldr r0, [r5]
	mov r1, #0
	add r3, r2, #0
	bl DrawFrameAndWindow2
_0224AD70:
	ldr r0, [r5]
	bl CopyWindowToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224AD0C

	thumb_func_start ov41_0224AD7C
ov41_0224AD7C: ; 0x0224AD7C
	ldr r3, _0224AD80 ; =ov41_02249CC4
	bx r3
	.balign 4, 0
_0224AD80: .word ov41_02249CC4
	thumb_func_end ov41_0224AD7C

	thumb_func_start ov41_0224AD84
ov41_0224AD84: ; 0x0224AD84
	ldr r3, _0224AD8C ; =WindowArray_dtor
	mov r1, #1
	bx r3
	nop
_0224AD8C: .word WindowArray_dtor
	thumb_func_end ov41_0224AD84

	thumb_func_start ov41_0224AD90
ov41_0224AD90: ; 0x0224AD90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #0xf
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x28]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r2, r6, #0
	str r0, [sp, #4]
	ldr r0, _0224ADD4 ; =0x0001020F
	add r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov41_0224AE24
	mov r2, #1
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	add r3, r2, #0
	bl DrawFrameAndWindow2
	add r0, r4, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224ADD4: .word 0x0001020F
	thumb_func_end ov41_0224AD90

	thumb_func_start ov41_0224ADD8
ov41_0224ADD8: ; 0x0224ADD8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	mov r1, #0xf
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x28]
	add r1, r4, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r2, r6, #0
	str r0, [sp, #4]
	ldr r0, _0224AE20 ; =0x0001020F
	add r3, r7, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov41_0224AE78
	mov r2, #1
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	add r3, r2, #0
	bl DrawFrameAndWindow2
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0224AE20: .word 0x0001020F
	thumb_func_end ov41_0224ADD8

	thumb_func_start ov41_0224AE24
ov41_0224AE24: ; 0x0224AE24
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r0, #0
	add r4, r3, #0
	mov r0, #0
	mov r3, #0xd
	bl NewMsgDataFromNarc
	add r5, r0, #0
	bne _0224AE3C
	bl GF_AssertFail
_0224AE3C:
	add r0, r5, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r6, #0
	bl AddTextPrinterParameterized2
	add r6, r0, #0
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r6, #0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_0224AE24

	thumb_func_start ov41_0224AE78
ov41_0224AE78: ; 0x0224AE78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x38]
	add r7, r0, #0
	ldr r0, [r4]
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp, #0x10]
	cmp r0, #0
	beq _0224AE90
	bl GF_AssertFail
_0224AE90:
	mov r0, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0xd
	bl NewMsgDataFromNarc
	add r5, r0, #0
	bne _0224AEA4
	bl GF_AssertFail
_0224AEA4:
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	bl NewString_ReadMsgData
	str r0, [r4]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x28]
	str r0, [sp]
	ldr r0, [sp, #0x34]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r4]
	add r0, r7, #0
	bl AddTextPrinterParameterized2
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AE78

	thumb_func_start ov41_0224AED8
ov41_0224AED8: ; 0x0224AED8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	add r5, r1, #0
	mov r1, #0x67
	str r1, [sp]
	mov r1, #0xe1
	str r1, [sp, #4]
	mov r1, #0x66
	str r1, [sp, #8]
	mov r1, #0x65
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	mov r1, #0x7d
	add r4, r2, #0
	str r3, [sp, #0x1c]
	lsl r1, r1, #4
	str r1, [sp, #0x14]
	ldr r3, [sp, #0x80]
	str r0, [sp, #0x18]
	add r1, r4, #0
	mov r2, #0xe
	bl ov41_0224AFF8
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	add r2, sp, #0x48
	mov r3, #0
	bl ov41_0224B0B8
	add r0, sp, #0x48
	str r0, [sp, #0x2c]
	mov r0, #2
	str r0, [sp, #0x40]
	mov r0, #0
	str r0, [sp, #0x24]
	str r0, [sp, #0x3c]
	mov r0, #0xe
	str r0, [sp, #0x44]
	mov r0, #0x68
	ldr r7, [sp, #0x24]
	str r5, [sp, #0x28]
	str r0, [sp, #0x20]
_0224AF2E:
	ldr r0, [sp, #0x20]
	mov r6, #0
	str r0, [sp, #0x34]
	lsl r1, r0, #0xc
	mov r0, #2
	lsl r0, r0, #0x14
	str r1, [sp, #0x34]
	add r0, r1, r0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x18]
	lsl r1, r7, #2
	mov r4, #0x26
	add r5, r0, r1
_0224AF48:
	str r4, [sp, #0x30]
	lsl r0, r4, #0xc
	str r0, [sp, #0x30]
	add r0, sp, #0x28
	bl sub_02024714
	mov r1, #1
	str r0, [r5, #0x10]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [sp, #0x1c]
	add r1, r6, r7
	cmp r1, r0
	blt _0224AF6C
	ldr r0, [r5, #0x10]
	mov r1, #0
	bl Set2dSpriteVisibleFlag
_0224AF6C:
	add r6, r6, #1
	add r4, #0x12
	add r5, r5, #4
	cmp r6, #0xa
	blt _0224AF48
	ldr r0, [sp, #0x20]
	add r7, #0xa
	add r0, #0x12
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x24]
	add r0, r0, #1
	str r0, [sp, #0x24]
	cmp r0, #2
	blt _0224AF2E
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AED8

	thumb_func_start ov41_0224AF8C
ov41_0224AF8C: ; 0x0224AF8C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r6, [r7, #0x60]
	add r5, r1, #0
	cmp r6, r5
	bge _0224AFB2
	cmp r6, r5
	bge _0224AFD0
	lsl r0, r6, #2
	add r4, r7, r0
_0224AFA0:
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl Set2dSpriteAnimSeqNo
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r5
	blt _0224AFA0
	b _0224AFD0
_0224AFB2:
	cmp r6, r5
	ble _0224AFD0
	sub r6, r6, #1
	cmp r6, r5
	blt _0224AFD0
	lsl r0, r6, #2
	add r4, r7, r0
_0224AFC0:
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl Set2dSpriteAnimSeqNo
	sub r6, r6, #1
	sub r4, r4, #4
	cmp r6, r5
	bge _0224AFC0
_0224AFD0:
	str r5, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224AF8C

	thumb_func_start ov41_0224AFD4
ov41_0224AFD4: ; 0x0224AFD4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	mov r4, #0
	add r5, r6, #0
_0224AFDE:
	ldr r0, [r5, #0x10]
	bl sub_02024758
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x14
	blt _0224AFDE
	add r0, r6, #0
	add r1, r7, #0
	bl ov41_0224B084
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224AFD4

	thumb_func_start ov41_0224AFF8
ov41_0224AFF8: ; 0x0224AFF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r2, #0
	ldr r7, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	add r5, r0, #0
	add r0, r7, r2
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r4, r1, #0
	str r6, [sp, #8]
	ldr r0, [r4]
	str r3, [sp, #0x10]
	add r1, r3, #0
	mov r3, #0
	bl AddCharResObjFromOpenNarc
	str r0, [r5]
	bl sub_0200ADA4
	ldr r0, [r5]
	bl sub_0200A740
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x10]
	add r0, r7, r2
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	mov r3, #0
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r0, [r4, #4]
	bl AddPlttResObjFromOpenNarc
	str r0, [r5, #4]
	bl sub_0200B00C
	ldr r0, [r5, #4]
	bl sub_0200A740
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x10]
	add r0, r7, r2
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r4, #8]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	ldr r2, [sp, #0x34]
	str r0, [r5, #8]
	add r0, r7, r2
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r4, #0xc]
	ldr r1, [sp, #0x10]
	mov r3, #0
	bl AddCellOrAnimResObjFromOpenNarc
	str r0, [r5, #0xc]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224AFF8

	thumb_func_start ov41_0224B084
ov41_0224B084: ; 0x0224B084
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl sub_0200AEB0
	ldr r0, [r5, #4]
	bl sub_0200B0A8
	ldr r0, [r4]
	ldr r1, [r5]
	bl DestroySingle2DGfxResObj
	ldr r0, [r4, #4]
	ldr r1, [r5, #4]
	bl DestroySingle2DGfxResObj
	ldr r0, [r4, #8]
	ldr r1, [r5, #8]
	bl DestroySingle2DGfxResObj
	ldr r0, [r4, #0xc]
	ldr r1, [r5, #0xc]
	bl DestroySingle2DGfxResObj
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224B084

	thumb_func_start ov41_0224B0B8
ov41_0224B0B8: ; 0x0224B0B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_0200A7FC
	str r0, [sp, #0x2c]
	ldr r0, [r5, #4]
	bl sub_0200A7FC
	str r0, [sp, #0x30]
	ldr r0, [r5, #8]
	bl sub_0200A7FC
	str r0, [sp, #0x34]
	ldr r0, [r5, #0xc]
	bl sub_0200A7FC
	str r0, [sp]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r6, [sp, #0x10]
	ldr r1, [r4]
	ldr r2, [sp, #0x30]
	str r1, [sp, #0x14]
	ldr r1, [r4, #4]
	ldr r3, [sp, #0x34]
	str r1, [sp, #0x18]
	ldr r1, [r4, #8]
	str r1, [sp, #0x1c]
	ldr r1, [r4, #0xc]
	str r1, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	add r0, r7, #0
	bl CreateSpriteResourcesHeader
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B0B8

	thumb_func_start ov41_0224B118
ov41_0224B118: ; 0x0224B118
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r4, r1, #0
	mov r1, #0xe5
	str r1, [sp]
	mov r1, #0xe6
	str r1, [sp, #4]
	mov r1, #0xe4
	str r1, [sp, #8]
	mov r1, #0xe3
	str r1, [sp, #0xc]
	mov r1, #2
	str r1, [sp, #0x10]
	ldr r1, _0224B214 ; =0x00000BB8
	add r5, r2, #0
	str r3, [sp, #0x18]
	str r1, [sp, #0x14]
	ldr r3, [sp, #0x80]
	add r7, r0, #0
	add r1, r5, #0
	mov r2, #0xe
	bl ov41_0224AFF8
	add r0, r7, #0
	add r1, r5, #0
	add r2, sp, #0x3c
	mov r3, #0
	bl ov41_0224B0B8
	add r0, sp, #0x3c
	str r0, [sp, #0x20]
	mov r2, #2
	mov r0, #0xe
	mov r1, #0x3a
	str r0, [sp, #0x38]
	lsl r1, r1, #0xc
	lsl r0, r2, #0x14
	mov r6, #0
	str r4, [sp, #0x1c]
	str r1, [sp, #0x28]
	add r0, r1, r0
	str r2, [sp, #0x34]
	str r6, [sp, #0x30]
	str r0, [sp, #0x28]
	mov r4, #0x67
	add r5, r7, #0
_0224B174:
	str r4, [sp, #0x24]
	lsl r0, r4, #0xc
	str r0, [sp, #0x24]
	add r0, sp, #0x1c
	bl sub_02024714
	str r0, [r5, #0x10]
	add r6, r6, #1
	add r4, #0x18
	add r5, r5, #4
	cmp r6, #2
	blt _0224B174
	ldr r0, [sp, #0x18]
	mov r1, #0x1e
	str r0, [r7, #0x1c]
	mul r1, r0
	str r1, [r7, #0x20]
	ldr r1, [sp, #0x7c]
	str r1, [r7, #0x2c]
	str r0, [r1]
	ldr r1, [r7, #0x2c]
	str r0, [r1, #8]
	add r0, r7, #0
	mov r1, #0
	add r0, #0x90
	str r1, [r0]
	add r0, r7, #0
	bl ov41_0224B298
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xc1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	add r0, r7, #0
	ldr r1, [sp, #0x78]
	add r0, #0x18
	mov r2, #0xa
	mov r3, #8
	bl ov41_0224AD0C
	ldr r0, [r7, #0x18]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r0, #0
	str r0, [sp]
	mov r3, #4
	ldr r0, _0224B218 ; =0x00010200
	str r3, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x18]
	mov r1, #0x1b
	mov r2, #0xd7
	bl ov41_0224AE24
	mov r0, #0x48
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _0224B218 ; =0x00010200
	mov r1, #0x1b
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x18]
	mov r2, #0xd7
	mov r3, #5
	bl ov41_0224AE24
	ldr r0, [r7, #0x18]
	bl CopyWindowToVram
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B214: .word 0x00000BB8
_0224B218: .word 0x00010200
	thumb_func_end ov41_0224B118

	thumb_func_start ov41_0224B21C
ov41_0224B21C: ; 0x0224B21C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	add r4, r1, #0
	cmp r0, #0
	beq _0224B22C
	bl DestroySysTask
_0224B22C:
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _0224B236
	bl DestroySysTask
_0224B236:
	add r0, r5, #0
	add r1, r4, #0
	bl ov41_0224B084
	ldr r0, [r5, #0x18]
	bl ov41_0224AD84
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x94
	bl memset
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224B21C

	thumb_func_start ov41_0224B250
ov41_0224B250: ; 0x0224B250
	push {r4, lr}
	add r4, r0, #0
	bl ov41_0224B310
	add r0, r4, #0
	bl ov41_0224B270
	add r0, r4, #0
	bl ov41_0224B298
	add r4, #0x30
	add r0, r4, #0
	bl ov41_0224B450
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B250

	thumb_func_start ov41_0224B270
ov41_0224B270: ; 0x0224B270
	push {r3, lr}
	ldr r1, [r0, #0x2c]
	ldr r2, [r1]
	ldr r1, [r0, #0x1c]
	cmp r1, r2
	beq _0224B290
	str r2, [r0, #0x1c]
	cmp r2, #0xa
	bgt _0224B290
	add r1, r0, #0
	add r1, #0x30
	bl ov41_0224B374
	ldr r0, _0224B294 ; =0x00000682
	bl PlaySE
_0224B290:
	pop {r3, pc}
	nop
_0224B294: .word 0x00000682
	thumb_func_end ov41_0224B270

	thumb_func_start ov41_0224B298
ov41_0224B298: ; 0x0224B298
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, [r6, #0x1c]
	mov r1, #1
	str r0, [sp]
	mov r0, #0xa
	add r4, r1, #0
	mul r4, r0
	mov r7, #0
	add r5, r6, #0
_0224B2AE:
	ldr r0, [sp]
	add r1, r4, #0
	bl _s32_div_f
	str r0, [sp, #4]
	cmp r0, #0xa
	ble _0224B2C0
	bl GF_AssertFail
_0224B2C0:
	ldr r0, [r5, #0x10]
	ldr r1, [sp, #4]
	bl Set2dSpriteAnimSeqNo
	ldr r0, [sp, #4]
	add r1, r0, #0
	ldr r0, [sp]
	mul r1, r4
	sub r0, r0, r1
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	add r4, r0, #0
	add r0, r6, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0
	bne _0224B302
	ldr r0, [r6, #0x1c]
	cmp r0, #0xa
	bgt _0224B302
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl sub_02024A48
	cmp r7, #1
	bne _0224B302
	add r1, r6, #0
	add r1, #0x90
	mov r0, #1
	str r0, [r1]
_0224B302:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #2
	blt _0224B2AE
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B298

	thumb_func_start ov41_0224B310
ov41_0224B310: ; 0x0224B310
	ldr r1, [r0, #0x20]
	sub r1, r1, #1
	bmi _0224B318
	str r1, [r0, #0x20]
_0224B318:
	bx lr
	.balign 4, 0
	thumb_func_end ov41_0224B310

	thumb_func_start ov41_0224B31C
ov41_0224B31C: ; 0x0224B31C
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov41_0224B31C

	thumb_func_start ov41_0224B32C
ov41_0224B32C: ; 0x0224B32C
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
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
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0xc
	bl FX_Div
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _0224B36C
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_0224B36C:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B32C

	thumb_func_start ov41_0224B374
ov41_0224B374: ; 0x0224B374
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	mov r1, #0x3a
	mov r0, #2
	lsl r1, r1, #0xc
	lsl r0, r0, #0x14
	ldr r4, [sp, #4]
	str r1, [sp, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x10]
	add r0, r4, #0
	ldr r6, [sp]
	mov r7, #0
	mov r5, #0x67
	str r0, [sp, #8]
_0224B396:
	ldr r0, [r6, #0x10]
	mov r1, #2
	str r0, [r4, #4]
	bl sub_0202487C
	ldr r2, [sp, #8]
	str r5, [sp, #0xc]
	lsl r0, r5, #0xc
	add r2, #0xc
	add r3, sp, #0xc
	str r0, [sp, #0xc]
	ldmia r3!, {r0, r1}
	str r2, [sp, #8]
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r7, r7, #1
	str r0, [r2]
	add r6, r6, #4
	add r4, r4, #4
	add r5, #0x18
	cmp r7, #2
	blt _0224B396
	ldr r0, [sp]
	ldr r1, [r0, #0x1c]
	mov r0, #0xa
	sub r0, r0, r1
	cmp r0, #0
	ble _0224B3F0
	lsl r0, r0, #0xc
	ldr r2, _0224B44C ; =0x00000266
	asr r1, r0, #0x1f
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r4, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r4, #0xc
	orr r1, r0
	lsl r0, r2, #1
	add r4, r1, r0
	b _0224B3F4
_0224B3F0:
	mov r4, #1
	lsl r4, r4, #0xc
_0224B3F4:
	ldr r0, [sp, #4]
	mov r2, #1
	add r0, #0x24
	add r1, r4, #0
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl ov41_0224B31C
	mov r2, #6
	asr r1, r4, #0x1f
	add r0, r4, #0
	lsl r2, r2, #0xe
	mov r3, #0
	bl _ll_mul
	mov r3, #2
	mov r2, #0
	lsl r3, r3, #0xa
	add r3, r0, r3
	adc r1, r2
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	mov r0, #6
	lsl r0, r0, #0xe
	sub r4, r1, r0
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r0, #0x38
	mov r3, #0x10
	bl ov41_0224B31C
	ldr r0, [sp, #4]
	add r1, r4, #0
	add r0, #0x4c
	mov r2, #0
	mov r3, #0x10
	bl ov41_0224B31C
	ldr r0, [sp, #4]
	mov r1, #1
	str r1, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B44C: .word 0x00000266
	thumb_func_end ov41_0224B374

	thumb_func_start ov41_0224B450
ov41_0224B450: ; 0x0224B450
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _0224B4E2
	add r0, r5, #0
	add r0, #0x24
	bl ov41_0224B32C
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x38
	bl ov41_0224B32C
	add r0, r5, #0
	add r0, #0x4c
	bl ov41_0224B32C
	ldr r0, [r5, #0x24]
	add r1, sp, #0xc
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	bl sub_020247F4
	ldr r0, [r5, #8]
	add r1, sp, #0xc
	bl sub_020247F4
	add r6, r5, #0
	add r6, #0xc
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldr r1, [sp]
	ldr r0, [r5, #0x38]
	sub r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r5, #0x4c]
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	add r1, r2, #0
	bl sub_020247D4
	add r6, r5, #0
	add r6, #0x18
	add r3, sp, #0
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldr r1, [sp, #4]
	ldr r0, [r5, #0x4c]
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	add r1, r2, #0
	bl sub_020247D4
	cmp r4, #0
	beq _0224B4E2
	mov r0, #0
	str r0, [r5]
_0224B4E2:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B450

	thumb_func_start ov41_0224B4E8
ov41_0224B4E8: ; 0x0224B4E8
	push {r3, lr}
	sub sp, #0x10
	add r3, r1, #0
	stmia r0!, {r1}
	add r3, #0x48
	str r3, [sp]
	ldr r1, [r1, #0x74]
	lsl r1, r1, #2
	add r1, #0x89
	str r1, [sp, #4]
	mov r1, #0x10
	str r1, [sp, #8]
	add r1, sp, #0
	str r2, [sp, #0xc]
	bl ov41_02249CE0
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end ov41_0224B4E8

	thumb_func_start ov41_0224B50C
ov41_0224B50C: ; 0x0224B50C
	ldr r3, _0224B514 ; =ov41_02249CF8
	add r0, r0, #4
	mov r1, #1
	bx r3
	.balign 4, 0
_0224B514: .word ov41_02249CF8
	thumb_func_end ov41_0224B50C

	thumb_func_start ov41_0224B518
ov41_0224B518: ; 0x0224B518
	push {r4, lr}
	add r4, r0, #0
	add r0, r4, #4
	bl ov41_02249D60
	mov r1, #0x1c
	mov r0, #0
_0224B526:
	strb r0, [r4]
	add r4, r4, #1
	sub r1, r1, #1
	bne _0224B526
	pop {r4, pc}
	thumb_func_end ov41_0224B518

	thumb_func_start ov41_0224B530
ov41_0224B530: ; 0x0224B530
	push {r3, r4, lr}
	sub sp, #0x6c
	add r2, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	add r1, r2, #0
	bl ov41_0224B8DC
	add r0, sp, #0
	add r1, r4, #0
	bl ov41_0224B8F0
	add r0, sp, #0
	bl ov41_0224B630
	add sp, #0x6c
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B530

	thumb_func_start ov41_0224B554
ov41_0224B554: ; 0x0224B554
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _0224B56A
	sub r0, #0x48
	add r0, r4, r0
	bl ov41_0224B50C
_0224B56A:
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0224B57A
	add r0, r4, #0
	bl ov41_0224B720
_0224B57A:
	pop {r4, pc}
	thumb_func_end ov41_0224B554

	thumb_func_start ov41_0224B57C
ov41_0224B57C: ; 0x0224B57C
	push {r4, lr}
	mov r1, #0x26
	add r4, r0, #0
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _0224B58E
	bl ov41_0224B878
_0224B58E:
	add r0, r4, #0
	bl ov41_0224B85C
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov41_02245ECC
	mov r0, #0x63
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #8
	add r0, r4, r0
	bl ov41_022499DC
	add r0, r4, #0
	bl ov41_0224B754
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B57C

	thumb_func_start ov41_0224B5C8
ov41_0224B5C8: ; 0x0224B5C8
	ldr r3, _0224B5CC ; =ov41_022465CC
	bx r3
	.balign 4, 0
_0224B5CC: .word ov41_022465CC
	thumb_func_end ov41_0224B5C8

	thumb_func_start ov41_0224B5D0
ov41_0224B5D0: ; 0x0224B5D0
	mov r2, #0x99
	lsl r2, r2, #2
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov41_0224B5D0

	thumb_func_start ov41_0224B5D8
ov41_0224B5D8: ; 0x0224B5D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r2, #0
	mov r2, #0x19
	add r4, r1, #0
	lsl r2, r2, #4
	add r5, r0, #0
	add r1, r2, #0
	add r0, r5, r2
	str r6, [sp]
	add r1, #0xac
	add r2, #0xb0
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	add r3, r4, #0
	bl ov41_02248120
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0224B620
	mov r3, #0x88
	ldr r0, [r5, #0x40]
	mov r1, #2
	mov r2, #0
	sub r3, r3, r4
	bl BgSetPosTextAndCommit
	mov r3, #0x10
	ldr r0, [r5, #0x40]
	mov r1, #2
	mov r2, #3
	sub r3, r3, r6
	bl BgSetPosTextAndCommit
_0224B620:
	mov r0, #0x8f
	lsl r0, r0, #2
	str r4, [r5, r0]
	add r0, r0, #4
	str r6, [r5, r0]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B5D8

	thumb_func_start ov41_0224B630
ov41_0224B630: ; 0x0224B630
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x9a
	ldr r0, [r5, #0x68]
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x9a
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	mov r0, #0x8e
	ldr r1, [r5, #0x68]
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, [r5, #0x68]
	bl AllocMonZeroed
	mov r1, #0x8d
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5]
	ldr r1, [r4, r1]
	bl sub_0202BEF4
	add r0, r4, #0
	add r1, r5, #0
	bl ov41_0224B6CC
	ldr r1, [r5, #0x58]
	ldr r2, [r5, #0x68]
	add r0, r4, #0
	bl ov41_02246544
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r2, [r5, #0x68]
	add r0, r4, r0
	mov r1, #0x15
	bl ov41_022499B4
	ldr r1, [r5, #0x68]
	mov r0, #0x14
	bl ov41_02245EA0
	mov r1, #0x63
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	add r1, r5, #0
	bl ov41_0224B780
	add r0, r4, #0
	add r1, r5, #0
	bl ov41_0224B848
	mov r1, #0x86
	lsl r1, r1, #2
	add r0, r4, r1
	sub r1, #0x88
	ldr r2, [r5, #0x68]
	add r1, r4, r1
	bl ov41_0224B4E8
	mov r0, #0x26
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	add r0, r4, #0
	add r1, r5, #0
	bl ov41_0224B888
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov41_0224B630

	thumb_func_start ov41_0224B6CC
ov41_0224B6CC: ; 0x0224B6CC
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r4, r1, #0
	ldr r1, [r4, #0x68]
	add r5, r0, #0
	mov r0, #0x1a
	bl NARC_ctor
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r0, _0224B71C ; =0x000002CE
	add r1, sp, #0
	str r0, [sp]
	mov r0, #0x76
	str r0, [sp, #4]
	mov r0, #0x13
	str r0, [sp, #8]
	ldr r0, [r4, #0x68]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x68]
	add r0, r5, #0
	bl ov41_02246518
	ldr r3, [r4, #0x68]
	add r0, r5, #0
	add r1, sp, #0x10
	add r2, r4, #0
	bl ov41_0224B938
	add r0, r5, #0
	add r1, sp, #0x10
	bl ov41_02246250
	add r0, sp, #0x10
	bl ov41_022463D4
	add sp, #0x28
	pop {r3, r4, r5, pc}
	nop
_0224B71C: .word 0x000002CE
	thumb_func_end ov41_0224B6CC

	thumb_func_start ov41_0224B720
ov41_0224B720: ; 0x0224B720
	push {r3, r4, lr}
	sub sp, #4
	mov r3, #0x25
	lsl r3, r3, #4
	add r1, r0, r3
	str r1, [sp]
	add r1, r3, #0
	sub r1, #0x14
	ldr r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xc
	ldr r1, [r0, r1]
	add r1, r2, r1
	add r2, r3, #0
	sub r2, #0x10
	ldr r4, [r0, r2]
	add r2, r3, #0
	sub r2, #8
	sub r3, r3, #4
	ldr r2, [r0, r2]
	ldrh r3, [r0, r3]
	add r2, r4, r2
	bl ov41_022465D8
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov41_0224B720

	thumb_func_start ov41_0224B754
ov41_0224B754: ; 0x0224B754
	push {r4, lr}
	add r4, r0, #0
	bl ov41_0224626C
	add r0, r4, #0
	bl ov41_02246594
	mov r0, #0x26
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0224B772
	add r0, r4, #0
	bl ov41_022465C0
_0224B772:
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl NARC_dtor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B754

	thumb_func_start ov41_0224B780
ov41_0224B780: ; 0x0224B780
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r5, r0, #0
	add r2, sp, #0x28
	mov r0, #0
	add r7, r1, #0
	add r3, r2, #0
	add r1, r0, #0
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	str r0, [r3]
	ldr r0, [r5]
	str r0, [sp, #0x28]
	ldr r0, [r5, #4]
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x30]
	ldr r0, [r5, #0x30]
	str r0, [sp, #0x34]
	ldr r0, [r5, #0x20]
	str r0, [sp, #0x38]
	ldr r0, [r5, #0x40]
	str r0, [sp, #0x3c]
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	str r1, [sp, #0x40]
	add r1, r0, #0
	sub r1, #8
	add r1, r5, r1
	str r1, [sp, #0x44]
	mov r1, #0x15
	add r0, r0, #4
	str r1, [sp, #0x48]
	add r0, r5, r0
	add r1, r2, #0
	bl ov41_02247F3C
	ldr r0, [r7]
	bl sub_0202BEE4
	add r6, r0, #0
	ldr r0, [r7]
	bl sub_0202BEEC
	add r4, r0, #0
	ldr r0, [r7]
	bl sub_0202BEDC
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, [r7, #0x68]
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #8]
	add r0, r5, r1
	add r1, #0xa4
	ldr r1, [r5, r1]
	add r2, sp, #0x18
	add r3, r6, #0
	bl ov41_02247FAC
	ldr r0, [r7, #0x54]
	mov r6, #0
	cmp r0, #0
	ble _0224B844
	add r4, r7, #0
_0224B80A:
	ldr r0, [r4, #4]
	bl sub_0202BEFC
	str r0, [sp, #0xc]
	ldr r0, [r4, #4]
	bl sub_0202BF00
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	bl sub_0202BF04
	str r0, [sp, #0x14]
	ldr r0, [r4, #4]
	bl sub_0202BF08
	str r0, [sp]
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r5, r0
	bl ov41_02248044
	ldr r0, [r7, #0x54]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _0224B80A
_0224B844:
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224B780

	thumb_func_start ov41_0224B848
ov41_0224B848: ; 0x0224B848
	add r2, r1, #0
	mov r1, #0x19
	lsl r1, r1, #4
	add r0, r0, r1
	ldr r1, [r2, #0x5c]
	ldr r3, _0224B858 ; =ov41_0224825C
	ldr r2, [r2, #0x68]
	bx r3
	.balign 4, 0
_0224B858: .word ov41_0224825C
	thumb_func_end ov41_0224B848

	thumb_func_start ov41_0224B85C
ov41_0224B85C: ; 0x0224B85C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov41_022480E0
	mov r0, #0x19
	lsl r0, r0, #4
	add r0, r4, r0
	bl ov41_02247F90
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B85C

	thumb_func_start ov41_0224B878
ov41_0224B878: ; 0x0224B878
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r3, _0224B884 ; =ov41_022482A8
	add r0, r0, r1
	bx r3
	nop
_0224B884: .word ov41_022482A8
	thumb_func_end ov41_0224B878

	thumb_func_start ov41_0224B888
ov41_0224B888: ; 0x0224B888
	push {r3, r4, r5, lr}
	add r3, r1, #0
	mov r1, #0x8f
	add r4, r0, #0
	mov r2, #0x48
	lsl r1, r1, #2
	str r2, [r4, r1]
	mov r5, #0x38
	add r2, r1, #4
	str r5, [r4, r2]
	add r2, r1, #0
	add r2, #8
	str r5, [r4, r2]
	add r2, r1, #0
	mov r5, #0x40
	add r2, #0xc
	str r5, [r4, r2]
	lsl r2, r5, #6
	add r5, r1, #0
	add r5, #0x14
	str r2, [r4, r5]
	add r5, r1, #0
	add r5, #0x18
	str r2, [r4, r5]
	add r5, r1, #0
	add r5, #0x1c
	str r2, [r4, r5]
	mov r2, #0
	add r1, #0x10
	strh r2, [r4, r1]
	ldr r1, [r3, #0x60]
	ldr r2, [r3, #0x64]
	bl ov41_0224B5D8
	mov r0, #0x97
	ldr r1, _0224B8D8 ; =0x00007FFF
	lsl r0, r0, #2
	strh r1, [r4, r0]
	pop {r3, r4, r5, pc}
	nop
_0224B8D8: .word 0x00007FFF
	thumb_func_end ov41_0224B888

	thumb_func_start ov41_0224B8DC
ov41_0224B8DC: ; 0x0224B8DC
	ldr r2, [r1]
	str r2, [r0, #0x58]
	ldr r2, [r1, #4]
	str r2, [r0, #0x60]
	ldr r2, [r1, #8]
	str r2, [r0, #0x64]
	ldr r1, [r1, #0xc]
	str r1, [r0, #0x68]
	bx lr
	.balign 4, 0
	thumb_func_end ov41_0224B8DC

	thumb_func_start ov41_0224B8F0
ov41_0224B8F0: ; 0x0224B8F0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	bl sub_0202BE14
	add r6, r5, #0
	str r0, [r5]
	mov r4, #0
	str r4, [r5, #0x54]
	add r6, #0x54
_0224B906:
	add r0, r7, #0
	add r1, r4, #0
	bl sub_0202BDEC
	cmp r0, #0
	beq _0224B928
	add r0, r7, #0
	add r1, r4, #0
	bl sub_0202BE2C
	ldr r1, [r5, #0x54]
	lsl r1, r1, #2
	add r1, r5, r1
	str r0, [r1, #4]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_0224B928:
	add r4, r4, #1
	cmp r4, #0xa
	blt _0224B906
	add r0, r7, #0
	bl sub_0202BE80
	str r0, [r5, #0x5c]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224B8F0

	thumb_func_start ov41_0224B938
ov41_0224B938: ; 0x0224B938
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r3, #0
	add r5, r0, #0
	add r6, r2, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov41_022464AC
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov41_0224B958
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov41_0224B938

	thumb_func_start ov41_0224B958
ov41_0224B958: ; 0x0224B958
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, r2, #0
	ldr r0, [r0, #0x54]
	add r4, r1, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r0, #0
	ble _0224B9D0
	add r6, r2, #0
_0224B972:
	ldr r0, [r6, #4]
	bl sub_0202BEFC
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl sub_020255A0
	cmp r0, #1
	bne _0224B9BE
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	ldr r1, [sp, #4]
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	ldr r3, [sp, #0xc]
	add r1, r5, #1
	mov r2, #0
	bl GfGfxLoader_LoadFromOpenNarc
	add r7, r0, #0
	ldr r0, [r4, #0x10]
	add r1, r7, #0
	add r2, r5, #0
	bl sub_020255C4
	ldr r1, [r4]
	lsl r5, r5, #3
	add r1, r1, r5
	add r0, r7, #0
	add r1, r1, #4
	bl NNS_G2dGetUnpackedCharacterData
	ldr r0, [sp, #4]
	ldr r1, [r0]
	ldr r0, [r4]
	str r1, [r0, r5]
_0224B9BE:
	ldr r0, [sp, #0x10]
	add r6, r6, #4
	add r0, r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [r0, #0x54]
	ldr r0, [sp, #0x10]
	cmp r0, r1
	blt _0224B972
_0224B9D0:
	mov r0, #1
	str r0, [sp]
	mov r1, #6
	ldr r0, [sp, #4]
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	mov r1, #0
	ldr r3, [sp, #0xc]
	add r2, r1, #0
	bl GfGfxLoader_LoadFromOpenNarc
	add r5, r0, #0
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	mov r2, #0
	bl sub_020255C4
	ldr r1, [r4, #8]
	add r0, r5, #0
	add r1, r1, #4
	bl NNS_G2dGetUnpackedPaletteData
	ldr r0, [sp, #4]
	ldr r1, [r0]
	ldr r0, [r4, #8]
	str r1, [r0]
	ldr r0, [r4, #8]
	mov r1, #3
	str r1, [r0, #8]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov41_0224B958

	thumb_func_start ov41_0224BA10
ov41_0224BA10: ; 0x0224BA10
	push {r3, r4, r5, lr}
	sub sp, #0x10
	mov r2, #2
	add r4, r0, #0
	mov r0, #3
	mov r1, #0xd
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r2, #1
	mov r0, #3
	mov r1, #0xe
	lsl r2, r2, #0x12
	bl CreateHeap
	mov r1, #0x1a
	add r0, r4, #0
	lsl r1, r1, #4
	mov r2, #0xd
	bl OverlayManager_CreateAndGetData
	mov r2, #0x1a
	mov r1, #0
	lsl r2, r2, #4
	add r5, r0, #0
	bl memset
	ldr r0, _0224BAC4 ; =ov41_0224BBF0
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r0, r4, #0
	bl OverlayManager_GetParentWork
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl sub_0202B9B8
	str r0, [r5]
	ldr r0, [r4, #4]
	str r0, [r5, #8]
	ldr r0, [r4, #8]
	str r0, [r5, #0xc]
	bl ov41_02246130
	ldr r0, _0224BAC8 ; =gSystem + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	add r0, r5, #0
	add r0, #0x14
	mov r1, #0xe
	bl ov41_02246670
	ldr r0, [r5, #0x54]
	str r0, [sp]
	mov r0, #0x48
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r1, [r5]
	add r0, sp, #0
	bl ov41_0224B530
	str r0, [r5, #0x10]
	add r0, r5, #0
	bl ov41_0224BC04
	add r0, r5, #0
	bl ov41_0224BCA4
	add r0, r5, #0
	bl ov41_0224BCF0
	add r0, r5, #0
	bl ov41_0224BDCC
	add r0, r5, #0
	bl ov41_0224BE5C
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0224BAC4: .word ov41_0224BBF0
_0224BAC8: .word gSystem + 0x60
	thumb_func_end ov41_0224BA10

	thumb_func_start ov41_0224BACC
ov41_0224BACC: ; 0x0224BACC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	bl OverlayManager_GetData
	add r5, r0, #0
	bl sub_02026E48
	bl NNS_G2dSetupSoftwareSpriteCamera
	ldr r0, [r5, #0x10]
	bl ov41_0224B554
	mov r0, #0
	add r1, r0, #0
	bl sub_02026E50
	add r5, #0x14
	add r0, r5, #0
	bl ov41_022466C8
	ldr r1, [r4]
	cmp r1, #5
	bhi _0224BB96
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0224BB08: ; jump table
	.short _0224BB14 - _0224BB08 - 2 ; case 0
	.short _0224BB1A - _0224BB08 - 2 ; case 1
	.short _0224BB38 - _0224BB08 - 2 ; case 2
	.short _0224BB48 - _0224BB08 - 2 ; case 3
	.short _0224BB68 - _0224BB08 - 2 ; case 4
	.short _0224BB88 - _0224BB08 - 2 ; case 5
_0224BB14:
	add r0, r1, #1
	str r0, [r4]
	b _0224BB96
_0224BB1A:
	mov r0, #6
	str r0, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r0, #0xd
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #5
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB38:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224BB96
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB48:
	ldr r0, _0224BB9C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0224BB5A
	bl System_GetTouchNew
	cmp r0, #0
	beq _0224BB96
_0224BB5A:
	ldr r0, _0224BBA0 ; =0x000005DD
	bl PlaySE
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB68:
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xd
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #2
	add r2, r0, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0224BB96
_0224BB88:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0224BB96
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_0224BB96:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0224BB9C: .word gSystem
_0224BBA0: .word 0x000005DD
	thumb_func_end ov41_0224BACC

	thumb_func_start ov41_0224BBA4
ov41_0224BBA4: ; 0x0224BBA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov41_0224B57C
	add r0, r4, #0
	bl ov41_0224BD8C
	add r0, r4, #0
	bl ov41_0224BE34
	add r4, #0x14
	add r0, r4, #0
	bl ov41_02246698
	bl ov41_02246150
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0xd
	bl DestroyHeap
	mov r0, #0xe
	bl DestroyHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov41_0224BBA4

	thumb_func_start ov41_0224BBF0
ov41_0224BBF0: ; 0x0224BBF0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov41_0224B5C8
	add r4, #0x14
	add r0, r4, #0
	bl ov41_022466B8
	pop {r4, pc}
	thumb_func_end ov41_0224BBF0

	thumb_func_start ov41_0224BC04
ov41_0224BC04: ; 0x0224BC04
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #0x40
	str r0, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x7e
	mov r2, #0
	mov r3, #0x60
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r2, [r5, #0x54]
	mov r1, #0x7d
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0x1a
	mov r1, #0x80
	mov r2, #0
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnData
	ldr r2, [sp, #0x10]
	mov r3, #0
	str r3, [sp]
	add r4, r0, #0
	ldrh r0, [r2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [r5, #0x54]
	bl LoadRectToBgTilemapRect
	ldr r1, [sp, #0x10]
	mov r2, #0
	ldrh r0, [r1]
	add r3, r2, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r1, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldr r0, [r5, #0x54]
	bl BgTilemapRectChangePalette
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #0x54]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov41_0224BC04

	thumb_func_start ov41_0224BCA4
ov41_0224BCA4: ; 0x0224BCA4
	push {r4, lr}
	sub sp, #0x10
	mov r1, #0
	add r4, r0, #0
	str r1, [sp]
	mov r0, #0xe
	str r0, [sp, #4]
	mov r0, #0xef
	mov r2, #4
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPal
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	mov r0, #0xef
	mov r1, #9
	mov r3, #4
	bl GfGfxLoader_LoadScrnData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x54]
	mov r0, #0xef
	mov r1, #1
	mov r3, #4
	bl GfGfxLoader_LoadCharData
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov41_0224BCA4

	thumb_func_start ov41_0224BCF0
ov41_0224BCF0: ; 0x0224BCF0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0xfa
	lsl r0, r0, #2
	mov r1, #0x65
	str r0, [sp, #4]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x14
	mov r2, #0xe9
	mov r3, #0
	bl ov41_022462E4
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0xfa
	lsl r0, r0, #2
	mov r1, #0x65
	str r0, [sp, #8]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x14
	mov r2, #0xea
	mov r3, #0
	bl ov41_02246304
	mov r0, #0xfa
	lsl r0, r0, #2
	mov r1, #0x65
	str r0, [sp]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x14
	mov r2, #0xe8
	mov r3, #0
	bl ov41_02246328
	mov r0, #0xfa
	lsl r0, r0, #2
	mov r1, #0x65
	str r0, [sp]
	lsl r1, r1, #2
	add r0, r4, #0
	ldr r1, [r4, r1]
	add r0, #0x14
	mov r2, #0xe7
	mov r3, #0
	bl ov41_02246344
	mov r0, #0x64
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xfa
	add r0, #0x14
	lsl r1, r1, #2
	mov r2, #0
	mov r3, #0x90
	bl ov41_02246280
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #1
	bl sub_02024A04
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov41_0224BCF0

	thumb_func_start ov41_0224BD8C
ov41_0224BD8C: ; 0x0224BD8C
	push {r4, lr}
	mov r1, #0xfa
	add r4, r0, #0
	add r0, #0x14
	lsl r1, r1, #2
	bl ov41_02246360
	add r0, r4, #0
	mov r1, #0xfa
	add r0, #0x14
	lsl r1, r1, #2
	bl ov41_02246374
	add r0, r4, #0
	mov r1, #0xfa
	add r0, #0x14
	lsl r1, r1, #2
	bl ov41_02246388
	add r0, r4, #0
	mov r1, #0xfa
	add r0, #0x14
	lsl r1, r1, #2
	bl ov41_0224639C
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02024758
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224BD8C

	thumb_func_start ov41_0224BDCC
ov41_0224BDCC: ; 0x0224BDCC
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r0, #0xe
	mov r1, #1
	bl AllocWindows
	mov r1, #0x67
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #5
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x54]
	ldr r1, [r4, r1]
	mov r2, #3
	mov r3, #0
	bl AddWindowParameterized
	mov r0, #0
	mov r1, #0xa0
	mov r2, #0xe
	bl LoadFontPal0
	mov r0, #3
	mov r1, #0
	bl SetBgPriority
	mov r0, #0
	mov r1, #2
	bl SetBgPriority
	mov r0, #1
	add r1, r0, #0
	bl SetBgPriority
	mov r1, #3
	ldr r0, [r4, #0x54]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224BDCC

	thumb_func_start ov41_0224BE34
ov41_0224BE34: ; 0x0224BE34
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ClearWindowTilemapAndCopyToVram
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl RemoveWindow
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl WindowArray_dtor
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224BE34

	thumb_func_start ov41_0224BE5C
ov41_0224BE5C: ; 0x0224BE5C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r4, #0
	bl ov41_0224BE80
	mov r0, #0x67
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl CopyWindowToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov41_0224BE5C

	thumb_func_start ov41_0224BE80
ov41_0224BE80: ; 0x0224BE80
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xd7
	mov r3, #0xd
	bl NewMsgDataFromNarc
	str r0, [sp, #0x10]
	cmp r0, #0
	bne _0224BE9C
	bl GF_AssertFail
_0224BE9C:
	mov r0, #0xd
	bl ScrStrBufs_new
	add r6, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #5
	bl Set2dSpriteAnimSeqNo
	mov r0, #3
	lsl r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r0, #9
	lsl r0, r0, #0x10
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, sp, #0x14
	bl sub_020247D4
	mov r0, #0xc
	mov r1, #0xd
	bl String_ctor
	add r7, r0, #0
	ldr r0, [r5]
	add r1, r7, #0
	bl sub_0202BE60
	mov r0, #0
	add r1, r7, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	mov r0, #7
	str r0, [sp]
	mov r1, #0
	lsr r3, r4, #0x1f
	add r3, r4, r3
	asr r4, r3, #1
	mov r3, #0x80
	ldr r0, _0224BF90 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x67
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r7, #0
	sub r3, r3, r4
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl String_dtor
	ldr r0, [r5]
	bl sub_0202BE98
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl BufferECWord
	mov r0, #0xc8
	mov r1, #0xd
	bl String_ctor
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	mov r1, #0x2d
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	add r3, r0, #0
	mov r0, #0x1b
	str r0, [sp]
	mov r1, #0
	ldr r0, _0224BF90 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x67
	str r1, [sp, #0xc]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	lsr r5, r3, #0x1f
	add r5, r3, r5
	asr r5, r5, #1
	mov r3, #0x80
	add r2, r4, #0
	sub r3, r3, r5
	bl AddTextPrinterParameterized2
	add r0, r4, #0
	bl String_dtor
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x10]
	bl DestroyMsgData
	add r0, r6, #0
	bl ScrStrBufs_delete
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0224BF90: .word 0x00010200
	thumb_func_end ov41_0224BE80

	.rodata

_0224BF94:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov41_0224BFA4: ; 0x0224BFA4
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00

ov41_0224BFB4: ; 0x0224BFB4
	.byte 0xCE, 0x02, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00

ov41_0224BFC4: ; 0x0224BFC4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov41_0224BFE0: ; 0x0224BFE0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov41_0224BFFC: ; 0x0224BFFC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov41_0224C018: ; 0x0224C018
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x01, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov41_0224C034: ; 0x0224C034
	.byte 0x00, 0x00, 0x00, 0x00, 0x6F, 0xFF, 0xFF, 0xFF, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x02, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov41_0224C050: ; 0x0224C050
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x0E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov41_0224C06C: ; 0x0224C06C
	.byte 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov41_0224C094: ; 0x0224C094
	.byte 0x02, 0x01, 0x00, 0x00
