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
	.include "overlay_01_021E7FDC.inc"
	.include "global.inc"

	.text

	.extern ov01_021E847C

	thumb_func_start ov01_021E851C
ov01_021E851C: ; 0x021E851C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x74
	add r5, r0, #0
	ldr r0, _021E86F0 ; =0x00000162
	add r4, r1, #0
	ldrh r0, [r5, r0]
	mov r1, #0x10
	bl Heap_Alloc
	add r6, r0, #0
	ldr r0, _021E86F0 ; =0x00000162
	mov r1, #8
	ldrh r0, [r5, r0]
	bl Heap_Alloc
	str r0, [r6, #8]
	ldr r0, _021E86F0 ; =0x00000162
	mov r1, #0x24
	ldrh r0, [r5, r0]
	bl Heap_Alloc
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
	bl GF2DGfxResObjExistsById
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
	bl GF2DGfxResObjExistsById
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
	bl Sprite_CreateAffine
	str r0, [r6]
	cmp r0, #0
	beq _021E86E6
	bl Sprite_GetPalIndex
	add r5, r0, #0
	ldrh r1, [r4, #6]
	ldr r0, [r6]
	bl Sprite_SetAnimCtrlSeq
	ldr r1, [r4, #0xc]
	ldr r0, [r6]
	add r1, r5, r1
	bl Sprite_SetPaletteOverride
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
	bl SpriteList_Delete
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
