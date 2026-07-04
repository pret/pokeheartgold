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
