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
	.include "overlay_01_021FF464.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FF464
ov01_021FF464: ; 0x021FF464
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_021FF490
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FF464

	thumb_func_start ov01_021FF480
ov01_021FF480: ; 0x021FF480
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FF4D4
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FF480

	thumb_func_start ov01_021FF490
ov01_021FF490: ; 0x021FF490
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #3
	mov r2, #0x77
	bl ov01_021F18D4
	ldr r0, [r4]
	mov r1, #2
	mov r2, #0x90
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #2
	mov r2, #0x12
	mov r3, #1
	bl ov01_021F1930
	mov r3, #2
	mov r1, #3
	str r3, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021FF4D0 ; =ov01_022091D4
	add r2, r1, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	bl ov01_021F1758
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021FF4D0: .word ov01_022091D4
	thumb_func_end ov01_021FF490

	thumb_func_start ov01_021FF4D4
ov01_021FF4D4: ; 0x021FF4D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #3
	bl ov01_021F18FC
	ldr r0, [r4]
	mov r1, #2
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #2
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #3
	bl ov01_021F18C8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FF4D4

	thumb_func_start ov01_021FF4FC
ov01_021FF4FC: ; 0x021FF4FC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r6, r1, #0
	bl ov01_021F146C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0xa
	str r4, [sp, #0x18]
	bl ov01_021F1450
	str r0, [sp, #0x1c]
	add r1, sp, #8
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	mov r1, #2
	str r5, [sp, #0x20]
	bl sub_0205F09C
	add r1, sp, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _021FF548 ; =ov01_022091C0
	add r0, r4, #0
	add r2, sp, #8
	add r3, r6, #0
	bl ov01_021F1620
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021FF548: .word ov01_022091C0
	thumb_func_end ov01_021FF4FC

	thumb_func_start ov01_021FF54C
ov01_021FF54C: ; 0x021FF54C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, sp, #0
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	add r5, r0, #0
	str r1, [r2, #8]
	bl sub_02068D98
	add r2, r4, #0
	add r3, r0, #0
	add r2, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x20]
	bl MapObject_GetGfxID
	str r0, [r4, #4]
	ldr r0, [r4, #0x20]
	bl MapObject_GetID
	str r0, [r4, #8]
	ldr r0, [r4, #0x20]
	bl sub_0205F254
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0x18]
	mov r1, #3
	add r2, sp, #0
	bl ov01_021F1740
	str r0, [r4, #0x24]
	mov r1, #2
	ldr r0, [r4, #0x20]
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021FF5B2
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_02023EA4
_021FF5B2:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov01_021FF54C

	thumb_func_start ov01_021FF5B8
ov01_021FF5B8: ; 0x021FF5B8
	ldr r3, _021FF5C0 ; =sub_02023DA4
	ldr r0, [r1, #0x24]
	bx r3
	nop
_021FF5C0: .word sub_02023DA4
	thumb_func_end ov01_021FF5B8

	thumb_func_start ov01_021FF5C4
ov01_021FF5C4: ; 0x021FF5C4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r6, [r4, #0x20]
	ldr r1, [r4, #4]
	add r5, r0, #0
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	add r0, r6, #0
	bl sub_0205F0F8
	cmp r0, #0
	bne _021FF5E4
	add r0, r5, #0
	bl ov01_021F1640
	pop {r3, r4, r5, r6, r7, pc}
_021FF5E4:
	add r0, r5, #0
	bl sub_02068D90
	add r7, r0, #0
	cmp r7, #1
	bne _021FF602
	add r0, r6, #0
	bl MapObject_CheckFlag26
	cmp r0, #0
	bne _021FF602
	add r0, r5, #0
	bl ov01_021F1640
	pop {r3, r4, r5, r6, r7, pc}
_021FF602:
	mov r1, #2
	add r0, r6, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	ldr r0, [r4, #0x24]
	bne _021FF61A
	mov r1, #0
	bl sub_02023EA4
	b _021FF620
_021FF61A:
	mov r1, #1
	bl sub_02023EA4
_021FF620:
	ldr r0, [r4]
	cmp r0, #0
	bne _021FF656
	mov r1, #1
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0xc
	bl sub_02023F04
	ldr r0, [r4, #0x24]
	bl sub_02023F70
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	cmp r0, #0xc
	blt _021FF656
	cmp r7, #0
	bne _021FF64E
	add r0, r5, #0
	bl ov01_021F1640
	pop {r3, r4, r5, r6, r7, pc}
_021FF64E:
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_02023F1C
_021FF656:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FF5C4

	thumb_func_start ov01_021FF658
ov01_021FF658: ; 0x021FF658
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	ldr r4, [r5, #0x20]
	ldr r1, [r5, #4]
	add r6, r0, #0
	ldr r2, [r5, #8]
	ldr r3, [r5, #0xc]
	add r0, r4, #0
	bl sub_0205F0F8
	cmp r0, #0
	bne _021FF67C
	add r0, r6, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r4, r5, r6, pc}
_021FF67C:
	add r0, r4, #0
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_GetFacingVec
	ldr r1, [sp, #0xc]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #8]
	add r1, r1, r0
	mov r0, #2
	lsl r0, r0, #0xe
	str r1, [sp, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [r5, #0x24]
	add r1, sp, #0xc
	bl sub_02023E50
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021FF658

	.rodata

ov01_022091C0: ; 0x022091C0
	.word 0x00000028
	.word ov01_021FF54C
	.word ov01_021FF5B8
	.word ov01_021FF5C4
	.word ov01_021FF658

ov01_022091D4: ; 0x022091D4
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
