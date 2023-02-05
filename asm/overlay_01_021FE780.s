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
	.include "overlay_01_021FE780.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FE780
ov01_021FE780: ; 0x021FE780
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #0x6c
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_021FE7AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE780

	thumb_func_start ov01_021FE79C
ov01_021FE79C: ; 0x021FE79C
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FE7D0
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FE79C

	thumb_func_start ov01_021FE7AC
ov01_021FE7AC: ; 0x021FE7AC
	push {r3, r4, lr}
	sub sp, #4
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	ldr r0, [r4]
	add r1, r4, #4
	mov r3, #0x56
	bl ov01_021F19F4
	add r0, r4, #0
	add r0, #0x18
	add r1, r4, #4
	bl sub_02069978
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE7AC

	thumb_func_start ov01_021FE7D0
ov01_021FE7D0: ; 0x021FE7D0
	ldr r3, _021FE7D8 ; =sub_02069784
	add r0, r0, #4
	bx r3
	nop
_021FE7D8: .word sub_02069784
	thumb_func_end ov01_021FE7D0

	thumb_func_start ov01_021FE7DC
ov01_021FE7DC: ; 0x021FE7DC
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r4, r1, #0
	add r6, r2, #0
	add r2, sp, #0x14
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	add r5, r0, #0
	str r1, [r2, #8]
	str r3, [sp, #0x20]
	bl ov01_021F146C
	mov r1, #4
	str r0, [sp, #0x24]
	bl ov01_021F1450
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x40]
	str r5, [sp, #0x2c]
	cmp r0, #0
	bne _021FE826
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	mov r1, #2
	lsl r2, r4, #0x10
	lsl r1, r1, #0xe
	add r2, r2, r1
	str r2, [sp, #0x14]
	lsl r2, r6, #0x10
	add r1, r2, r1
	str r1, [sp, #0x1c]
	add r1, sp, #0x14
	bl sub_0206121C
	b _021FE842
_021FE826:
	ldr r3, _021FE860 ; =ov01_022090D0
	add r2, sp, #8
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, sp, #0x14
	str r0, [r2]
	add r0, r5, #0
	bl MapObject_GetPositionVec
	add r0, r5, #0
	add r1, sp, #8
	bl sub_0205F9A0
_021FE842:
	add r0, r5, #0
	mov r1, #2
	bl sub_0205F09C
	add r1, sp, #0x20
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r1, _021FE864 ; =ov01_022090DC
	ldr r3, [sp, #0x40]
	add r2, sp, #0x14
	bl ov01_021F1620
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FE860: .word ov01_022090D0
_021FE864: .word ov01_022090DC
	thumb_func_end ov01_021FE7DC

	thumb_func_start ov01_021FE868
ov01_021FE868: ; 0x021FE868
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	bl sub_02068D98
	add r7, r0, #0
	add r2, r5, #0
	add r3, r7, #0
	ldr r4, [r7, #0xc]
	add r2, #0x24
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r0, r4, #0
	bl MapObject_GetID
	str r0, [r5, #0xc]
	add r0, r4, #0
	bl sub_0205F254
	str r0, [r5, #0x10]
	ldr r0, [r7]
	str r0, [r5, #8]
	add r0, r6, #0
	bl sub_02068D90
	str r0, [r5, #0x18]
	mov r0, #1
	lsl r0, r0, #0xc
	str r0, [r5, #0x1c]
	lsr r0, r0, #2
	str r0, [r5, #0x20]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE868

	thumb_func_start ov01_021FE8B0
ov01_021FE8B0: ; 0x021FE8B0
	push {lr}
	sub sp, #0xc
	ldr r0, [r1, #0x30]
	add r1, sp, #0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	bl sub_0205F9A0
	add sp, #0xc
	pop {pc}
	thumb_func_end ov01_021FE8B0

	thumb_func_start ov01_021FE8C8
ov01_021FE8C8: ; 0x021FE8C8
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	ldr r4, [r5, #0x30]
	ldr r1, [r5, #0xc]
	add r6, r0, #0
	ldr r2, [r5, #0x10]
	add r0, r4, #0
	bl sub_0205F0A8
	cmp r0, #0
	bne _021FE8EA
	add r0, r6, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r4, r5, r6, pc}
_021FE8EA:
	mov r0, #0
	str r0, [r5]
	add r0, r4, #0
	bl MapObject_GetFacingDirection
	mov r1, #0
	mvn r1, r1
	str r0, [r5, #4]
	cmp r0, r1
	bne _021FE906
	mov r0, #1
	add sp, #0x18
	str r0, [r5]
	pop {r4, r5, r6, pc}
_021FE906:
	ldr r1, [r5, #0x18]
	cmp r1, #0
	beq _021FE96C
	str r0, [r5, #8]
	ldr r1, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	add r2, r1, r0
	mov r1, #1
	lsl r1, r1, #0xe
	str r2, [r5, #0x1c]
	cmp r2, r1
	blt _021FE928
	str r1, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	neg r0, r0
	str r0, [r5, #0x20]
	b _021FE936
_021FE928:
	lsr r0, r1, #2
	cmp r2, r0
	bgt _021FE936
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	neg r0, r0
	str r0, [r5, #0x20]
_021FE936:
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #1
	ldr r1, [r5, #0x1c]
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r1, sp, #0xc
	bl sub_0205F9A0
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_GetPositionVec
	mov r0, #1
	ldr r1, [r5, #0x1c]
	lsl r0, r0, #0xc
	sub r0, r1, r0
	ldr r2, [sp, #4]
	add r1, sp, #0
	add r0, r2, r0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_02068DA8
_021FE96C:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021FE8C8

	thumb_func_start ov01_021FE970
ov01_021FE970: ; 0x021FE970
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	add r3, r1, #0
	add r6, r0, #0
	ldr r0, [r3]
	cmp r0, #1
	beq _021FE9E6
	mov r0, #0
	ldr r1, [r3, #8]
	mvn r0, r0
	cmp r1, r0
	beq _021FE9E6
	ldr r0, [r3, #0x14]
	ldr r5, _021FE9EC ; =ov01_022090C4
	add r0, r0, #1
	str r0, [r3, #0x14]
	ldmia r5!, {r0, r1}
	add r4, sp, #0
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	mov r2, #0
	str r0, [r4]
	ldr r4, [r3, #0x2c]
	ldr r0, [r3, #8]
	add r4, #0x18
	cmp r0, #3
	bhi _021FE9C4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FE9B2: ; jump table
	.short _021FE9BA - _021FE9B2 - 2 ; case 0
	.short _021FE9C4 - _021FE9B2 - 2 ; case 1
	.short _021FE9BE - _021FE9B2 - 2 ; case 2
	.short _021FE9C2 - _021FE9B2 - 2 ; case 3
_021FE9BA:
	mov r2, #0xb4
	b _021FE9C4
_021FE9BE:
	ldr r2, _021FE9F0 ; =0x0000010E
	b _021FE9C4
_021FE9C2:
	mov r2, #0x5a
_021FE9C4:
	mov r1, #0
	lsl r2, r2, #0x10
	add r0, sp, #0x18
	lsr r2, r2, #0x10
	add r3, r1, #0
	bl sub_02020DA4
	add r0, r6, #0
	add r1, sp, #0xc
	bl sub_02068DB8
	add r0, r4, #0
	add r1, sp, #0xc
	add r2, sp, #0
	add r3, sp, #0x18
	bl sub_020699AC
_021FE9E6:
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	nop
_021FE9EC: .word ov01_022090C4
_021FE9F0: .word 0x0000010E
	thumb_func_end ov01_021FE970

	thumb_func_start ov01_021FE9F4
ov01_021FE9F4: ; 0x021FE9F4
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D74
	mov r1, #1
	str r4, [r0, #0x18]
	lsl r1, r1, #0xc
	str r1, [r0, #0x1c]
	lsr r1, r1, #2
	str r1, [r0, #0x20]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FE9F4

	.rodata

ov01_022090C4: ; 0x022090C4
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_022090D0: ; 0x022090D0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00

ov01_022090DC: ; 0x022090DC
	.word 0x00000034
	.word ov01_021FE868
	.word ov01_021FE8B0
	.word ov01_021FE8C8
	.word ov01_021FE970
