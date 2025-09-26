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
	.include "overlay_01_021FE200.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FE200
ov01_021FE200: ; 0x021FE200
	push {r3, r4, r5, lr}
	mov r2, #0
	ldr r1, _021FE21C ; =0x00000824
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_021FE230
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021FE21C: .word 0x00000824
	thumb_func_end ov01_021FE200

	thumb_func_start ov01_021FE220
ov01_021FE220: ; 0x021FE220
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FE2B8
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FE220

	thumb_func_start ov01_021FE230
ov01_021FE230: ; 0x021FE230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r1, #0x65
	ldr r5, [sp, #4]
	lsl r1, r1, #2
	add r4, r0, #4
	add r0, r0, r1
	str r0, [sp, #0xc]
	ldr r1, _021FE2AC ; =0x000004DC
	ldr r0, [sp, #4]
	ldr r7, _021FE2B0 ; =ov01_0220901C
	add r0, r0, r1
	ldr r6, _021FE2B4 ; =ov01_02208FF4
	add r5, #0xcc
	str r0, [sp, #8]
_021FE256:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [r7]
	ldr r0, [r0]
	add r1, r4, #0
	mov r2, #0
	bl ov01_021F19F4
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	bl sub_02069978
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [r6]
	ldr r0, [r0]
	add r1, r5, #0
	mov r2, #0
	bl ov01_021F19F4
	ldr r0, [sp, #8]
	add r1, r5, #0
	bl sub_02069978
	ldr r0, [sp, #0xc]
	add r7, r7, #4
	add r0, #0x54
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r4, #0x14
	add r0, #0x54
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	add r6, r6, #4
	add r0, r0, #1
	add r5, #0x14
	str r0, [sp, #0x10]
	cmp r0, #0xa
	blo _021FE256
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FE2AC: .word 0x000004DC
_021FE2B0: .word ov01_0220901C
_021FE2B4: .word ov01_02208FF4
	thumb_func_end ov01_021FE230

	thumb_func_start ov01_021FE2B8
ov01_021FE2B8: ; 0x021FE2B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r0, #4
	add r5, #0xcc
_021FE2C2:
	add r0, r4, #0
	bl sub_02069784
	add r0, r5, #0
	bl sub_02069784
	add r6, r6, #1
	add r4, #0x14
	add r5, #0x14
	cmp r6, #0xa
	blt _021FE2C2
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE2B8

	thumb_func_start ov01_021FE2DC
ov01_021FE2DC: ; 0x021FE2DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	mov r4, #0
	cmp r0, #4
	bhi _021FE346
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FE2F6: ; jump table
	.short _021FE300 - _021FE2F6 - 2 ; case 0
	.short _021FE30E - _021FE2F6 - 2 ; case 1
	.short _021FE326 - _021FE2F6 - 2 ; case 2
	.short _021FE332 - _021FE2F6 - 2 ; case 3
	.short _021FE326 - _021FE2F6 - 2 ; case 4
_021FE300:
	mov r0, #0x65
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x54
	mul r0, r2
	add r4, r1, r0
	b _021FE346
_021FE30E:
	lsl r3, r1, #4
	ldr r1, _021FE354 ; =ov01_02209044
	lsl r2, r2, #2
	add r1, r1, r3
	mov r0, #0x65
	ldr r2, [r2, r1]
	lsl r0, r0, #2
	mov r1, #0x54
	add r0, r5, r0
	mul r1, r2
	add r4, r0, r1
	b _021FE346
_021FE326:
	ldr r0, _021FE358 ; =0x000004DC
	add r1, r5, r0
	mov r0, #0x54
	mul r0, r2
	add r4, r1, r0
	b _021FE346
_021FE332:
	lsl r3, r1, #4
	ldr r1, _021FE354 ; =ov01_02209044
	lsl r2, r2, #2
	add r1, r1, r3
	ldr r0, _021FE358 ; =0x000004DC
	ldr r2, [r2, r1]
	mov r1, #0x54
	add r0, r5, r0
	mul r1, r2
	add r4, r0, r1
_021FE346:
	cmp r4, #0
	bne _021FE34E
	bl GF_AssertFail
_021FE34E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_021FE354: .word ov01_02209044
_021FE358: .word 0x000004DC
	thumb_func_end ov01_021FE2DC

	thumb_func_start ov01_021FE35C
ov01_021FE35C: ; 0x021FE35C
	push {r4, lr}
	mov r4, #0
	cmp r1, #4
	bhi _021FE3B4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021FE370: ; jump table
	.short _021FE37A - _021FE370 - 2 ; case 0
	.short _021FE384 - _021FE370 - 2 ; case 1
	.short _021FE398 - _021FE370 - 2 ; case 2
	.short _021FE3A2 - _021FE370 - 2 ; case 3
	.short _021FE398 - _021FE370 - 2 ; case 4
_021FE37A:
	add r1, r0, #4
	mov r0, #0x14
	mul r0, r2
	add r4, r1, r0
	b _021FE3B4
_021FE384:
	ldr r1, _021FE3C0 ; =ov01_02209044
	lsl r3, r3, #4
	lsl r2, r2, #2
	add r1, r1, r3
	ldr r2, [r2, r1]
	mov r1, #0x14
	add r0, r0, #4
	mul r1, r2
	add r4, r0, r1
	b _021FE3B4
_021FE398:
	mov r1, #0x14
	add r0, #0xcc
	mul r1, r2
	add r4, r0, r1
	b _021FE3B4
_021FE3A2:
	ldr r1, _021FE3C0 ; =ov01_02209044
	lsl r3, r3, #4
	lsl r2, r2, #2
	add r1, r1, r3
	ldr r2, [r2, r1]
	mov r1, #0x14
	add r0, #0xcc
	mul r1, r2
	add r4, r0, r1
_021FE3B4:
	cmp r4, #0
	bne _021FE3BC
	bl GF_AssertFail
_021FE3BC:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_021FE3C0: .word ov01_02209044
	thumb_func_end ov01_021FE35C

	thumb_func_start ov01_021FE3C4
ov01_021FE3C4: ; 0x021FE3C4
	ldr r3, _021FE3CC ; =ov01_021FE3F8
	mov r1, #0
	bx r3
	nop
_021FE3CC: .word ov01_021FE3F8
	thumb_func_end ov01_021FE3C4

	thumb_func_start ov01_021FE3D0
ov01_021FE3D0: ; 0x021FE3D0
	ldr r3, _021FE3D8 ; =ov01_021FE3F8
	mov r1, #1
	bx r3
	nop
_021FE3D8: .word ov01_021FE3F8
	thumb_func_end ov01_021FE3D0

	thumb_func_start ov01_021FE3DC
ov01_021FE3DC: ; 0x021FE3DC
	ldr r3, _021FE3E4 ; =ov01_021FE3F8
	mov r1, #2
	bx r3
	nop
_021FE3E4: .word ov01_021FE3F8
	thumb_func_end ov01_021FE3DC

	thumb_func_start ov01_021FE3E8
ov01_021FE3E8: ; 0x021FE3E8
	ldr r3, _021FE3F0 ; =ov01_021FE3F8
	mov r1, #4
	bx r3
	nop
_021FE3F0: .word ov01_021FE3F8
	thumb_func_end ov01_021FE3E8

	thumb_func_start ov01_021FE3F4
ov01_021FE3F4: ; 0x021FE3F4
	mov r0, #0
	bx lr
	thumb_func_end ov01_021FE3F4

	thumb_func_start ov01_021FE3F8
ov01_021FE3F8: ; 0x021FE3F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetPreviousXCoord
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl MapObject_GetPreviousZCoord
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl MapObject_GetPositionVectorYCoord
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl MapObject_GetPreviousFacingDirection
	str r0, [sp, #0x18]
	add r0, r5, #0
	mov r1, #2
	bl MapObject_GetPriorityPlusValue
	add r7, r0, #0
	add r0, r5, #0
	bl ov01_021F146C
	mov r1, #2
	str r0, [sp, #8]
	bl ov01_021F1450
	mov r1, #2
	str r0, [sp, #0x1c]
	add r0, r5, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021FE454
	add sp, #0x38
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021FE454:
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r1, r4, #0
	str r4, [sp, #0x20]
	bl ov01_021FE2DC
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	add r1, r4, #0
	bl ov01_021FE35C
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	add r2, sp, #0x2c
	bl sub_020611C8
	str r6, [sp, #0x30]
	cmp r4, #5
	bhi _021FE4E0
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FE48E: ; jump table
	.short _021FE49A - _021FE48E - 2 ; case 0
	.short _021FE49A - _021FE48E - 2 ; case 1
	.short _021FE4BC - _021FE48E - 2 ; case 2
	.short _021FE4BC - _021FE48E - 2 ; case 3
	.short _021FE49A - _021FE48E - 2 ; case 4
	.short _021FE49A - _021FE48E - 2 ; case 5
_021FE49A:
	mov r0, #2
	lsl r0, r0, #0xe
	sub r1, r6, r0
	str r1, [sp, #0x30]
	sub r1, r4, #2
	cmp r1, #1
	bhi _021FE4B2
	ldr r1, [sp, #0x34]
	lsr r0, r0, #2
	sub r0, r1, r0
	str r0, [sp, #0x34]
	b _021FE4E0
_021FE4B2:
	ldr r1, [sp, #0x34]
	lsr r0, r0, #3
	add r0, r1, r0
	str r0, [sp, #0x34]
	b _021FE4E0
_021FE4BC:
	mov r0, #0xa
	lsl r0, r0, #0xc
	sub r0, r6, r0
	str r0, [sp, #0x30]
	sub r0, r4, #2
	cmp r0, #1
	bhi _021FE4D6
	mov r0, #2
	ldr r1, [sp, #0x34]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	str r0, [sp, #0x34]
	b _021FE4E0
_021FE4D6:
	mov r0, #2
	ldr r1, [sp, #0x34]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #0x34]
_021FE4E0:
	add r0, sp, #0x20
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, _021FE4F8 ; =ov01_02208FE0
	add r2, sp, #0x2c
	mov r3, #0
	str r7, [sp, #4]
	bl ov01_021F1620
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021FE4F8: .word ov01_02208FE0
	thumb_func_end ov01_021FE3F8

	thumb_func_start ov01_021FE4FC
ov01_021FE4FC: ; 0x021FE4FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D90
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl sub_02068D98
	ldr r1, [r0, #8]
	str r1, [r4, #0x18]
	ldr r1, [r0, #4]
	str r1, [r4, #0x14]
	mov r1, #0x1f
	str r1, [r4, #0xc]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE4FC

	thumb_func_start ov01_021FE524
ov01_021FE524: ; 0x021FE524
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FE524

	thumb_func_start ov01_021FE528
ov01_021FE528: ; 0x021FE528
	push {r3, lr}
	ldr r2, [r1]
	cmp r2, #0
	beq _021FE536
	cmp r2, #1
	beq _021FE548
	pop {r3, pc}
_021FE536:
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	cmp r0, #0x10
	blt _021FE554
	ldr r0, [r1]
	add r0, r0, #1
	str r0, [r1]
	pop {r3, pc}
_021FE548:
	ldr r2, [r1, #0xc]
	sub r2, r2, #2
	str r2, [r1, #0xc]
	bpl _021FE554
	bl ov01_021F1640
_021FE554:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE528

	thumb_func_start ov01_021FE558
ov01_021FE558: ; 0x021FE558
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	bne _021FE58A
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x14]
	mov r2, #0x1f
	ldr r0, [r0, #0xc]
	mov r1, #1
	lsl r2, r2, #0x10
	bl NNSi_G3dModifyPolygonAttrMask
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0xc]
	ldr r0, [r0, #0xc]
	bl NNS_G3dMdlSetMdlAlphaAll
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	bl sub_020699BC
_021FE58A:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE558

	.rodata

ov01_02208FE0: ; 0x02208FE0
	.word 0x0000001C
	.word ov01_021FE4FC
	.word ov01_021FE524
	.word ov01_021FE528
	.word ov01_021FE558

ov01_02208FF4: ; 0x02208FF4
	.byte 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00, 0x5C, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00, 0x62, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00

ov01_0220901C: ; 0x0220901C
	.byte 0x4A, 0x00, 0x00, 0x00
	.byte 0x4B, 0x00, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x00, 0x00
	.byte 0x4F, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00

ov01_02209044: ; 0x02209044
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00
