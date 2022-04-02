#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021E7FDC
ov01_021E7FDC: ; 0x021E7FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	str r1, [sp, #0x10]
	add r4, r3, #0
	add r0, r2, #0
	add r1, r5, #4
	add r2, r4, #0
	bl G2dRenderer_Init
	str r0, [r5]
	ldr r1, _021E818C ; =0x00000162
	ldr r0, [sp, #0x10]
	strh r4, [r5, r1]
	ldrh r2, [r0, #8]
	ldr r0, _021E8190 ; =0x0000FFFF
	cmp r2, r0
	bne _021E8004
	mov r2, #4
	b _021E8006
_021E8004:
	mov r2, #6
_021E8006:
	sub r0, r1, #2
	strh r2, [r5, r0]
	bl sub_0200A8FC
	mov r1, #0x16
	lsl r1, r1, #4
	ldrh r2, [r5, r1]
	add r3, r0, #0
	add r0, r4, #0
	add r1, r2, #0
	mul r1, r3
	bl AllocFromHeap
	add r7, r0, #0
	mov r0, #0xaf
	add r1, r4, #0
	bl NARC_ctor
	str r0, [sp, #0x20]
	mov r0, #0
	str r0, [sp, #0x1c]
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	cmp r0, #0
	bls _021E807A
	ldr r6, [sp, #0x10]
_021E803C:
	ldr r1, [sp, #0x1c]
	add r0, r7, #0
	bl sub_0200A900
	str r0, [sp, #0x24]
	mov r0, #1
	str r0, [sp]
	ldrh r1, [r6]
	ldr r0, [sp, #0x20]
	mov r2, #0
	add r3, r4, #0
	bl GfGfxLoader_LoadFromOpenNarc
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x28]
	add r2, r4, #0
	bl sub_0200A908
	ldr r0, [sp, #0x28]
	bl FreeToHeap
	ldr r0, [sp, #0x1c]
	add r6, r6, #2
	add r0, r0, #1
	str r0, [sp, #0x1c]
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	blo _021E803C
_021E807A:
	mov r6, #0
	cmp r0, #0
	bls _021E80B0
	str r5, [sp, #0x18]
_021E8082:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0200A900
	bl sub_0200A96C
	add r1, r6, #0
	add r2, r4, #0
	bl Create2DGfxResObjMan
	mov r1, #0x13
	ldr r2, [sp, #0x18]
	lsl r1, r1, #4
	str r0, [r2, r1]
	add r0, r2, #0
	add r0, r0, #4
	str r0, [sp, #0x18]
	add r0, r1, #0
	add r0, #0x30
	ldrh r0, [r5, r0]
	add r6, r6, #1
	cmp r6, r0
	blo _021E8082
_021E80B0:
	mov r1, #0
	str r1, [sp, #0x14]
	cmp r0, #0
	bls _021E80FC
	add r6, r5, #0
_021E80BA:
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl sub_0200A900
	str r0, [sp, #0x2c]
	bl sub_0200A96C
	add r1, r4, #0
	bl Create2DGfxResObjList
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r6, r1]
	add r0, r1, #0
	mov r2, #0x52
	sub r0, #0x18
	lsl r2, r2, #2
	ldr r0, [r6, r0]
	ldr r1, [sp, #0x2c]
	ldr r2, [r6, r2]
	add r3, r4, #0
	bl LoadAll2DGfxResObjsFromHeader
	ldr r0, [sp, #0x14]
	add r6, r6, #4
	add r0, r0, #1
	str r0, [sp, #0x14]
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	ldr r1, [sp, #0x14]
	cmp r1, r0
	blo _021E80BA
_021E80FC:
	mov r6, #0
	cmp r0, #0
	bls _021E811A
_021E8102:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0200A900
	bl sub_0200A954
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	add r6, r6, #1
	cmp r6, r0
	blo _021E8102
_021E811A:
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200ADE4
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200B050
	mov r0, #1
	str r0, [sp]
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x20]
	ldrh r1, [r1, #0xc]
	mov r2, #0
	add r3, r4, #0
	bl GfGfxLoader_LoadFromOpenNarc
	mov r3, #0x4e
	lsl r3, r3, #2
	ldr r1, [r5, r3]
	add r2, r3, #0
	str r1, [sp]
	add r1, r3, #4
	ldr r1, [r5, r1]
	sub r2, #8
	str r1, [sp, #4]
	add r1, r3, #0
	add r1, #8
	ldr r1, [r5, r1]
	add r6, r0, #0
	str r1, [sp, #8]
	add r1, r3, #0
	add r1, #0xc
	ldr r1, [r5, r1]
	sub r3, r3, #4
	str r1, [sp, #0xc]
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	add r1, r4, #0
	bl sub_02009E84
	mov r1, #0x4b
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [sp, #0x20]
	bl NARC_dtor
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E818C: .word 0x00000162
_021E8190: .word 0x0000FFFF
	thumb_func_end ov01_021E7FDC

	thumb_func_start ov01_021E8194
ov01_021E8194: ; 0x021E8194
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl sub_02024504
	mov r0, #0x4b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_02009F24
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200AED4
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200B0CC
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r0, [r5, r0]
	mov r6, #0
	cmp r0, #0
	bls _021E81EC
	mov r7, #0x16
	add r4, r5, #0
	lsl r7, r7, #4
_021E81CE:
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl Delete2DGfxResObjList
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl Destroy2DGfxResObjMan
	ldrh r0, [r5, r7]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blo _021E81CE
_021E81EC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021E8194

	thumb_func_start ov01_021E81F0
ov01_021E81F0: ; 0x021E81F0
	push {r4, r5, r6, lr}
	sub sp, #0x48
	ldr r5, _021E8294 ; =ov01_022063FC
	add r2, r0, #0
	add r4, r1, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #0xc
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #6
	str r0, [r3]
	mov r0, #4
	ldrsh r0, [r4, r0]
	mov r3, #8
	ldrsh r3, [r4, r3]
	lsl r0, r0, #0xc
	str r0, [sp]
	ldrsh r0, [r4, r1]
	lsl r3, r3, #0xc
	str r3, [sp, #8]
	lsl r0, r0, #0xc
	ldr r3, [r4, #0x14]
	str r0, [sp, #4]
	cmp r3, #2
	bne _021E8228
	lsl r1, r1, #0x11
	add r0, r0, r1
	str r0, [sp, #4]
_021E8228:
	ldr r0, [r2]
	mov r3, #0x4b
	str r0, [sp, #0x18]
	lsl r3, r3, #2
	ldr r0, [r2, r3]
	ldr r1, [r4]
	ldr r5, [r0]
	mov r0, #0x24
	mul r0, r1
	add r0, r5, r0
	add r6, sp, #0
	str r0, [sp, #0x1c]
	ldmia r6!, {r0, r1}
	add r5, sp, #0x20
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	add r6, sp, #0xc
	str r0, [r5]
	ldmia r6!, {r0, r1}
	add r5, sp, #0x2c
	stmia r5!, {r0, r1}
	ldr r0, [r6]
	mov r1, #0
	str r0, [r5]
	add r0, sp, #0
	strh r1, [r0, #0x38]
	ldr r0, [r4, #0xc]
	add r3, #0x36
	str r0, [sp, #0x3c]
	ldr r0, [r4, #0x14]
	str r0, [sp, #0x40]
	ldrh r0, [r2, r3]
	str r0, [sp, #0x44]
	add r0, sp, #0x18
	bl CreateSprite
	add r5, r0, #0
	bne _021E8278
	bl GF_AssertFail
_021E8278:
	ldrh r1, [r4, #0xa]
	add r0, r5, #0
	bl Set2dSpriteAnimSeqNo
	ldr r0, [r4, #0x18]
	cmp r0, #1
	beq _021E828E
	ldr r1, [r4, #0x10]
	add r0, r5, #0
	bl sub_02024A48
_021E828E:
	add r0, r5, #0
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E8294: .word ov01_022063FC
	thumb_func_end ov01_021E81F0

	thumb_func_start ov01_021E8298
ov01_021E8298: ; 0x021E8298
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	str r1, [sp]
	add r0, r2, #0
	str r3, [sp, #4]
	add r1, r7, #4
	add r2, r3, #0
	bl G2dRenderer_Init
	str r0, [r7]
	ldr r1, _021E8374 ; =0x00000162
	ldr r0, [sp, #4]
	strh r0, [r7, r1]
	ldr r0, [sp]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _021E82C4
	ldr r0, [sp]
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _021E82DA
_021E82C4:
	mov r1, #0x16
	mov r0, #4
	lsl r1, r1, #4
	strh r0, [r7, r1]
	add r0, r1, #0
	mov r2, #0
	sub r0, #0x20
	str r2, [r7, r0]
	sub r1, #0x1c
	str r2, [r7, r1]
	b _021E82E0
_021E82DA:
	mov r2, #6
	sub r0, r1, #2
	strh r2, [r7, r0]
_021E82E0:
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r1, [r7, r0]
	mov r4, #0
	cmp r1, #0
	bls _021E8310
	ldr r5, [sp]
	add r6, r7, #0
_021E82F0:
	ldr r0, [r5]
	ldr r2, [sp, #4]
	add r1, r4, #0
	bl Create2DGfxResObjMan
	mov r1, #0x13
	lsl r1, r1, #4
	str r0, [r6, r1]
	add r0, r1, #0
	add r0, #0x30
	ldrh r1, [r7, r0]
	add r4, r4, #1
	add r5, r5, #4
	add r6, r6, #4
	cmp r4, r1
	blo _021E82F0
_021E8310:
	mov r0, #0
	str r0, [sp, #8]
	cmp r1, #0
	bls _021E836E
	mov r6, #0x52
	add r5, r7, #0
	add r4, r0, #0
	lsl r6, r6, #2
_021E8320:
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	beq _021E8354
	ldr r1, [sp, #4]
	bl Create2DGfxResObjList
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	mov r1, #0
	ldr r0, [r3, #4]
	cmp r0, #0
	bls _021E8354
	add r2, r1, #0
_021E8344:
	ldr r0, [r3]
	add r1, r1, #1
	str r4, [r0, r2]
	ldr r3, [r5, r6]
	add r2, r2, #4
	ldr r0, [r3, #4]
	cmp r1, r0
	blo _021E8344
_021E8354:
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r1, [r7, r0]
	ldr r0, [sp, #8]
	cmp r0, r1
	blo _021E8320
_021E836E:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E8374: .word 0x00000162
	thumb_func_end ov01_021E8298

	thumb_func_start ov01_021E8378
ov01_021E8378: ; 0x021E8378
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x4d
	lsl r0, r0, #2
	add r4, r1, #0
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x30]
	add r6, r2, #0
	add r7, r3, #0
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _021E839C
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E839C:
	ldr r0, [sp, #0x30]
	add r2, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r3, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	ldr r0, _021E83EC ; =0x00000162
	ldrh r1, [r5, r0]
	sub r0, #0x2e
	str r1, [sp, #0xc]
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl AddPlttResObjFromNarc
	add r4, r0, #0
	beq _021E83E4
	bl sub_0200B00C
	cmp r0, #1
	beq _021E83CC
	bl GF_AssertFail
_021E83CC:
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ov01_021E847C
	ldr r1, [sp, #0x2c]
	add r0, r4, #0
	bl sub_0200B12C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021E83E4:
	bl GF_AssertFail
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E83EC: .word 0x00000162
	thumb_func_end ov01_021E8378

	thumb_func_start ov01_021E83F0
ov01_021E83F0: ; 0x021E83F0
	push {r4, lr}
	sub sp, #8
	mov r4, #2
	str r4, [sp]
	ldr r4, [sp, #0x10]
	str r4, [sp, #4]
	bl ov01_021E84B0
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021E83F0

	thumb_func_start ov01_021E8404
ov01_021E8404: ; 0x021E8404
	push {r4, lr}
	sub sp, #8
	mov r4, #3
	str r4, [sp]
	ldr r4, [sp, #0x10]
	str r4, [sp, #4]
	bl ov01_021E84B0
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov01_021E8404

	thumb_func_start ov01_021E8418
ov01_021E8418: ; 0x021E8418
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x13
	lsl r0, r0, #4
	add r4, r1, #0
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x24]
	add r6, r2, #0
	add r7, r3, #0
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _021E843C
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021E843C:
	ldr r0, [sp, #0x24]
	add r2, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r3, r7, #0
	str r0, [sp, #4]
	ldr r0, _021E8478 ; =0x00000162
	ldrh r1, [r5, r0]
	sub r0, #0x32
	str r1, [sp, #8]
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl AddCharResObjFromNarc
	add r4, r0, #0
	beq _021E8470
	bl sub_0200ADA4
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl ov01_021E847C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_021E8470:
	bl GF_AssertFail
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8478: .word 0x00000162
	thumb_func_end ov01_021E8418

	thumb_func_start ov01_021E847C
ov01_021E847C: ; 0x021E847C
	push {r3, r4, r5, r6}
	ldr r6, [r0, #4]
	mov r3, #0
	cmp r6, #0
	ble _021E84A8
	ldr r5, [r0]
	add r4, r5, #0
_021E848A:
	ldr r2, [r4]
	cmp r2, #0
	bne _021E84A0
	lsl r2, r3, #2
	str r1, [r5, r2]
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_021E84A0:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, r6
	blt _021E848A
_021E84A8:
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021E847C

	thumb_func_start ov01_021E84B0
ov01_021E84B0: ; 0x021E84B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [sp, #0x28]
	add r7, r1, #0
	lsl r4, r0, #2
	mov r0, #0x13
	lsl r0, r0, #4
	add r6, r5, r0
	ldr r0, [r6, r4]
	ldr r1, [sp, #0x2c]
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _021E84DA
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021E84DA:
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0xc]
	str r0, [sp]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, _021E8518 ; =0x00000162
	add r1, r7, #0
	ldrh r0, [r5, r0]
	str r0, [sp, #8]
	ldr r0, [r6, r4]
	bl AddCellOrAnimResObjFromNarc
	add r1, r0, #0
	beq _021E8510
	mov r0, #0x52
	add r2, r5, r4
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	bl ov01_021E847C
	cmp r0, #1
	beq _021E8514
	bl GF_AssertFail
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_021E8510:
	bl GF_AssertFail
_021E8514:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8518: .word 0x00000162
	thumb_func_end ov01_021E84B0

	thumb_func_start ov01_021E851C
ov01_021E851C: ; 0x021E851C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x74
	add r5, r0, #0
	ldr r0, _021E86F0 ; =0x00000162
	add r4, r1, #0
	ldrh r0, [r5, r0]
	mov r1, #0x10
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, _021E86F0 ; =0x00000162
	mov r1, #8
	ldrh r0, [r5, r0]
	bl AllocFromHeap
	str r0, [r6, #8]
	ldr r0, _021E86F0 ; =0x00000162
	mov r1, #0x24
	ldrh r0, [r5, r0]
	bl AllocFromHeap
	ldr r1, [r6, #8]
	add r2, r4, #0
	str r0, [r1]
	ldr r0, [r6, #8]
	mov r1, #0
	ldr r0, [r0]
	add r3, sp, #0x2c
	str r0, [r6, #4]
_021E8556:
	ldr r0, [r2, #0x14]
	add r1, r1, #1
	add r2, r2, #4
	stmia r3!, {r0}
	cmp r1, #6
	blt _021E8556
	mov r1, #5
	lsl r1, r1, #6
	ldr r0, [r5, r1]
	cmp r0, #0
	beq _021E8574
	add r1, r1, #4
	ldr r1, [r5, r1]
	cmp r1, #0
	bne _021E857E
_021E8574:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x3c]
	str r0, [sp, #0x40]
	b _021E85B4
_021E857E:
	mov r2, #0
	ldr r1, [sp, #0x3c]
	mvn r2, r2
	cmp r1, r2
	beq _021E8596
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _021E8596
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x3c]
_021E8596:
	mov r0, #0
	ldr r1, [sp, #0x40]
	mvn r0, r0
	cmp r1, r0
	beq _021E85B4
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl _2DGfxResObjExistsById
	cmp r0, #0
	bne _021E85B4
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x40]
_021E85B4:
	ldr r0, [sp, #0x38]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	str r0, [sp, #8]
	ldr r0, [r4, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x2c]
	str r0, [sp, #0x10]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	str r1, [sp, #0x14]
	add r1, r0, #4
	ldr r1, [r5, r1]
	str r1, [sp, #0x18]
	add r1, r0, #0
	add r1, #8
	ldr r1, [r5, r1]
	str r1, [sp, #0x1c]
	add r1, r0, #0
	add r1, #0xc
	ldr r1, [r5, r1]
	str r1, [sp, #0x20]
	add r1, r0, #0
	add r1, #0x10
	ldr r1, [r5, r1]
	add r0, #0x14
	str r1, [sp, #0x24]
	ldr r0, [r5, r0]
	str r0, [sp, #0x28]
	ldr r0, [r6, #4]
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	bl CreateSpriteResourcesHeader
	ldr r0, [r5]
	str r0, [sp, #0x44]
	ldr r0, [r6, #4]
	str r0, [sp, #0x48]
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E8622
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E8630
_021E8622:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E8630:
	bl _ffix
	str r0, [sp, #0x4c]
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E8650
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E865E
_021E8650:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E865E:
	bl _ffix
	str r0, [sp, #0x50]
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _021E867E
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _021E868C
_021E867E:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_021E868C:
	bl _ffix
	str r0, [sp, #0x54]
	ldr r0, [r4, #0x10]
	cmp r0, #2
	bne _021E86A2
	mov r0, #3
	ldr r1, [sp, #0x50]
	lsl r0, r0, #0x12
	add r0, r1, r0
	str r0, [sp, #0x50]
_021E86A2:
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	str r0, [sp, #0x60]
	mov r1, #0
	add r0, sp, #0x2c
	strh r1, [r0, #0x38]
	ldr r0, [r4, #8]
	str r0, [sp, #0x68]
	ldr r0, [r4, #0x10]
	str r0, [sp, #0x6c]
	ldr r0, _021E86F0 ; =0x00000162
	ldrh r0, [r5, r0]
	str r0, [sp, #0x70]
	add r0, sp, #0x44
	bl CreateSprite
	str r0, [r6]
	cmp r0, #0
	beq _021E86E6
	bl sub_02024A6C
	add r5, r0, #0
	ldrh r1, [r4, #6]
	ldr r0, [r6]
	bl Set2dSpriteAnimSeqNo
	ldr r1, [r4, #0xc]
	ldr r0, [r6]
	add r1, r5, r1
	bl sub_02024A14
	b _021E86EA
_021E86E6:
	bl GF_AssertFail
_021E86EA:
	add r0, r6, #0
	add sp, #0x74
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021E86F0: .word 0x00000162
	thumb_func_end ov01_021E851C

	thumb_func_start ov01_021E86F4
ov01_021E86F4: ; 0x021E86F4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl sub_02024504
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200AED4
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r0, [r6, r0]
	bl sub_0200B0CC
	mov r0, #0x16
	lsl r0, r0, #4
	ldrh r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	bls _021E8742
	mov r7, #0x16
	add r5, r6, #0
	lsl r7, r7, #4
_021E8724:
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl Delete2DGfxResObjList
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl Destroy2DGfxResObjMan
	ldrh r0, [r6, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blo _021E8724
_021E8742:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021E86F4

	.rodata

ov01_022063FC: ; 0x022063FC
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
