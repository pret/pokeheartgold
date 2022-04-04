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

	thumb_func_start ov01_021EF7A0
ov01_021EF7A0: ; 0x021EF7A0
	push {r4, r5, r6, lr}
	lsl r6, r1, #5
	add r5, r0, #0
	add r4, r2, #0
	add r1, r6, #0
	bl DC_FlushRange
	add r0, r5, #0
	lsl r1, r4, #5
	add r2, r6, #0
	bl GX_LoadBGPltt
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021EF7A0

	thumb_func_start ov01_021EF7BC
ov01_021EF7BC: ; 0x021EF7BC
	push {lr}
	sub sp, #0x14
	mov r3, #0
	add r1, r0, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	mov r0, #0xb
	str r0, [sp, #0xc]
	ldr r0, _021EF7E4 ; =0x00000197
	mov r2, #3
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x1c]
	add r1, #0x20
	bl AddWindowParameterized
	add sp, #0x14
	pop {pc}
	.balign 4, 0
_021EF7E4: .word 0x00000197
	thumb_func_end ov01_021EF7BC

	thumb_func_start ov01_021EF7E8
ov01_021EF7E8: ; 0x021EF7E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r3, [sp, #4]
	add r0, #0x31
	ldrb r0, [r0]
	add r3, r5, #0
	add r6, r2, #0
	lsl r0, r0, #0x19
	lsr r4, r0, #0x18
	mov r0, #4
	add r7, r1, #0
	str r0, [sp]
	mov r0, #0xa3
	add r1, r4, #0
	mov r2, #0
	add r3, #0x34
	bl GfGfxLoader_GetCharData
	str r0, [r5, #0x38]
	ldr r3, [r5, #0x34]
	add r1, r7, #0
	str r6, [sp]
	ldr r2, [r3, #0x14]
	ldr r0, [r5, #0x1c]
	ldr r3, [r3, #0x10]
	bl BG_LoadCharTilesData
	mov r0, #0xa3
	add r1, r4, #1
	add r2, sp, #8
	mov r3, #4
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp, #8]
	ldr r2, [sp, #4]
	ldr r0, [r0, #0xc]
	mov r1, #1
	bl ov01_021EF7A0
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EF7E8

	thumb_func_start ov01_021EF844
ov01_021EF844: ; 0x021EF844
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	mov r2, #0x84
	sub r2, r2, r1
	lsr r1, r2, #0x1f
	add r1, r2, r1
	asr r1, r1, #1
	add r6, r0, #0
	add r2, r1, #4
	add r1, r6, #0
	add r1, #0x30
	strb r2, [r1]
	mov r1, #0
	str r1, [sp]
	ldr r2, _021EF8D0 ; =0x000002D9
	mov r1, #3
	mov r3, #0xb
	bl ov01_021EF7E8
	add r0, r6, #0
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r7, r6, #0
	mov r4, #0
	add r7, #0x20
_021EF87A:
	add r0, r4, #0
	mov r1, #0x11
	bl _s32_div_f
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0x11
	bl _s32_div_f
	mov r1, #8
	str r1, [sp]
	str r1, [sp, #4]
	lsl r1, r5, #0x13
	lsr r1, r1, #0x10
	lsl r0, r0, #0x13
	add r2, r4, #1
	lsl r2, r2, #0x13
	str r1, [sp, #8]
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r6, #0x34]
	add r0, r7, #0
	ldr r1, [r1, #0x14]
	lsr r2, r2, #0x10
	mov r3, #0
	bl BlitBitmapRectToWindow
	add r4, r4, #1
	cmp r4, #0x44
	blt _021EF87A
	add r0, r6, #0
	add r0, #0x20
	bl CopyWindowToVram
	ldr r0, [r6, #0x38]
	bl FreeToHeap
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EF8D0: .word 0x000002D9
	thumb_func_end ov01_021EF844

	thumb_func_start ov01_021EF8D4
ov01_021EF8D4: ; 0x021EF8D4
	mov r1, #0
	str r1, [r0]
	strb r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	strh r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov01_021EF8D4

	thumb_func_start ov01_021EF8E8
ov01_021EF8E8: ; 0x021EF8E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov01_021EF8D4
	str r4, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021EF8E8

	thumb_func_start ov01_021EF8F8
ov01_021EF8F8: ; 0x021EF8F8
	push {r4, lr}
	add r4, r1, #0
	ldrb r0, [r4, #4]
	cmp r0, #3
	bhi _021EF9A4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021EF90E: ; jump table
	.short _021EF9A4 - _021EF90E - 2 ; case 0
	.short _021EF916 - _021EF90E - 2 ; case 1
	.short _021EF954 - _021EF90E - 2 ; case 2
	.short _021EF93E - _021EF90E - 2 ; case 3
_021EF916:
	ldr r0, [r4, #0xc]
	sub r0, r0, #4
	str r0, [r4, #0xc]
	bpl _021EF922
	mov r0, #0
	str r0, [r4, #0xc]
_021EF922:
	mov r1, #3
	ldr r0, [r4, #0x1c]
	ldr r3, [r4, #0xc]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _021EF9A4
	mov r0, #0
	strh r0, [r4, #0x10]
	mov r0, #3
	strb r0, [r4, #4]
	pop {r4, pc}
_021EF93E:
	ldrh r0, [r4, #0x10]
	add r0, r0, #1
	strh r0, [r4, #0x10]
	ldrh r0, [r4, #0x10]
	cmp r0, #0x3c
	blo _021EF9A4
	mov r0, #0
	strh r0, [r4, #0x10]
	mov r0, #2
	strb r0, [r4, #4]
	pop {r4, pc}
_021EF954:
	ldr r0, [r4, #0xc]
	add r0, r0, #4
	str r0, [r4, #0xc]
	cmp r0, #0x26
	ble _021EF962
	mov r0, #0x26
	str r0, [r4, #0xc]
_021EF962:
	mov r1, #3
	ldr r0, [r4, #0x1c]
	ldr r3, [r4, #0xc]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0xc]
	cmp r0, #0x26
	bne _021EF9A4
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021EF99E
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x40]
	bl sub_02068F84
	add r1, r0, #0
	add r0, r4, #0
	bl ov01_021EF844
	ldr r1, [r4, #0x40]
	add r0, r4, #0
	bl ov01_021EF9A8
	mov r0, #1
	strb r0, [r4, #4]
	pop {r4, pc}
_021EF99E:
	add r0, r4, #0
	bl ov01_021EFACC
_021EF9A4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EF8F8

	thumb_func_start ov01_021EF9A8
ov01_021EF9A8: ; 0x021EF9A8
	push {r3, lr}
	sub sp, #0x10
	add r3, r0, #0
	mov r0, #8
	add r2, r1, #0
	str r0, [sp]
	mov r1, #0
	ldr r0, _021EF9D0 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r3, #0
	str r1, [sp, #0xc]
	add r3, #0x30
	ldrb r3, [r3]
	add r0, #0x20
	bl AddTextPrinterParameterized2
	add sp, #0x10
	pop {r3, pc}
	nop
_021EF9D0: .word 0x00010200
	thumb_func_end ov01_021EF9A8

	thumb_func_start ov01_021EF9D4
ov01_021EF9D4: ; 0x021EF9D4
	mov r1, #2
	strb r1, [r0, #4]
	mov r1, #0
	strh r1, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021EF9D4

	thumb_func_start ov01_021EF9E0
ov01_021EF9E0: ; 0x021EF9E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #4
	mov r1, #0x44
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0x16
	mov r1, #4
	bl String_ctor
	str r0, [r4, #0x40]
	add r0, r4, #0
	add r1, r5, #0
	bl ov01_021EF8E8
	add r0, r4, #0
	bl ov01_021EF7BC
	mov r1, #0x1b
	add r2, r1, #0
	mov r0, #1
	add r2, #0xfc
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x3c]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021EF9E0

	thumb_func_start ov01_021EFA1C
ov01_021EFA1C: ; 0x021EFA1C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl DestroyMsgData
	add r0, r4, #0
	add r0, #0x20
	bl RemoveWindow
	ldr r0, [r4, #0x40]
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov01_021EFA1C

	thumb_func_start ov01_021EFA3C
ov01_021EFA3C: ; 0x021EFA3C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	str r1, [r4, #0x18]
	ldr r1, [r4]
	add r5, r2, #0
	cmp r1, #0
	bne _021EFA90
	mov r0, #1
	str r0, [r4]
	mov r1, #3
	ldr r0, [r4, #0x1c]
	add r2, r1, #0
	mov r3, #0x26
	bl BgSetPosTextAndCommit
	mov r0, #0x26
	str r0, [r4, #0xc]
	ldr r0, _021EFAC8 ; =ov01_021EF8F8
	add r1, r4, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r4, #8]
	mov r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #0x3c]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x40]
	bl sub_02068F84
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x31
	strb r5, [r0]
	add r0, r4, #0
	bl ov01_021EF844
	ldr r1, [r4, #0x40]
	add r0, r4, #0
	bl ov01_021EF9A8
	pop {r3, r4, r5, pc}
_021EFA90:
	ldrb r1, [r4, #4]
	cmp r1, #3
	bhi _021EFAC2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021EFAA2: ; jump table
	.short _021EFAC2 - _021EFAA2 - 2 ; case 0
	.short _021EFAAA - _021EFAA2 - 2 ; case 1
	.short _021EFAB8 - _021EFAA2 - 2 ; case 2
	.short _021EFAAA - _021EFAA2 - 2 ; case 3
_021EFAAA:
	bl ov01_021EF9D4
	mov r0, #1
	str r0, [r4, #0x14]
	add r4, #0x31
	strb r5, [r4]
	pop {r3, r4, r5, pc}
_021EFAB8:
	mov r0, #1
	str r0, [r4, #0x14]
	add r4, #0x31
	strb r5, [r4]
	pop {r3, r4, r5, pc}
_021EFAC2:
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EFAC8: .word ov01_021EF8F8
	thumb_func_end ov01_021EFA3C

	thumb_func_start ov01_021EFACC
ov01_021EFACC: ; 0x021EFACC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021EFADA
	bl DestroySysTask
_021EFADA:
	add r0, r4, #0
	add r0, #0x20
	bl ClearWindowTilemapAndCopyToVram
	mov r1, #3
	ldr r0, [r4, #0x1c]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	bl ov01_021EF8E8
	pop {r4, pc}
	thumb_func_end ov01_021EFACC

	thumb_func_start ov01_021EFAF8
ov01_021EFAF8: ; 0x021EFAF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetAreaIcon
	cmp r0, #0
	beq _021EFB36
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl sub_0203B58C
	cmp r0, #0
	bne _021EFB36
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	add r4, r0, #0
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetAreaIcon
	add r2, r0, #0
	beq _021EFB2C
	sub r2, r2, #1
_021EFB2C:
	ldr r0, [r5, #4]
	add r1, r4, #0
	ldr r0, [r0, #8]
	bl ov01_021EFA3C
_021EFB36:
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021EFAF8
