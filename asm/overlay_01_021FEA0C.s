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
	.include "overlay_01_021FEA0C.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FEA0C
ov01_021FEA0C: ; 0x021FEA0C
	push {r4, lr}
	mov r2, #0
	mov r1, #0x7c
	add r3, r2, #0
	add r4, r0, #0
	bl ov01_021F1430
	str r4, [r0, #0x10]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEA0C

	thumb_func_start ov01_021FEA20
ov01_021FEA20: ; 0x021FEA20
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FEA7C
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FEA20

	thumb_func_start ov01_021FEA30
ov01_021FEA30: ; 0x021FEA30
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bx lr
	thumb_func_end ov01_021FEA30

	thumb_func_start ov01_021FEA38
ov01_021FEA38: ; 0x021FEA38
	push {r3, lr}
	ldr r1, [r0]
	sub r1, r1, #1
	str r1, [r0]
	bpl _021FEA46
	bl GF_AssertFail
_021FEA46:
	pop {r3, pc}
	thumb_func_end ov01_021FEA38

	thumb_func_start ov01_021FEA48
ov01_021FEA48: ; 0x021FEA48
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _021FEA76
	mov r0, #1
	str r0, [sp]
	add r1, r4, #0
	ldr r0, [r4, #0x10]
	add r1, #0x14
	mov r2, #0
	mov r3, #0x57
	bl ov01_021F19F4
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0x28
	add r1, #0x14
	bl sub_02069978
	mov r0, #1
	str r0, [r4, #4]
_021FEA76:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEA48

	thumb_func_start ov01_021FEA7C
ov01_021FEA7C: ; 0x021FEA7C
	push {r3, lr}
	ldr r1, [r0, #4]
	cmp r1, #1
	bne _021FEA8E
	mov r1, #0
	str r1, [r0, #4]
	add r0, #0x14
	bl sub_02069784
_021FEA8E:
	pop {r3, pc}
	thumb_func_end ov01_021FEA7C

	thumb_func_start ov01_021FEA90
ov01_021FEA90: ; 0x021FEA90
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _021FEA9C
	bl ov01_021FEA48
_021FEA9C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEA90

	thumb_func_start ov01_021FEAA0
ov01_021FEAA0: ; 0x021FEAA0
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	bne _021FEAAC
	bl ov01_021FEA7C
_021FEAAC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEAA0

	thumb_func_start ov01_021FEAB0
ov01_021FEAB0: ; 0x021FEAB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r1, #0
	add r7, r2, #0
	add r2, sp, #0xc
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	str r3, [sp, #8]
	add r5, r0, #0
	str r1, [r2, #8]
	bl ov01_021F146C
	add r4, r0, #0
	ldr r0, [sp, #8]
	str r4, [sp, #0x1c]
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	str r0, [sp, #0x20]
	add r0, r4, #0
	mov r1, #5
	bl ov01_021F1450
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x40]
	str r5, [sp, #0x28]
	cmp r0, #0
	bne _021FEB06
	mov r0, #2
	lsl r1, r6, #0x10
	lsl r0, r0, #0xe
	add r1, r1, r0
	str r1, [sp, #0xc]
	lsl r1, r7, #0x10
	add r0, r1, r0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	add r1, sp, #0xc
	bl sub_0206121C
	b _021FEB0E
_021FEB06:
	add r0, r5, #0
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
_021FEB0E:
	add r0, r5, #0
	mov r1, #2
	bl sub_0205F09C
	add r1, sp, #0x18
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _021FEB2C ; =ov01_022090FC
	ldr r3, [sp, #0x40]
	add r0, r4, #0
	add r2, sp, #0xc
	bl ov01_021F1620
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FEB2C: .word ov01_022090FC
	thumb_func_end ov01_021FEAB0

	thumb_func_start ov01_021FEB30
ov01_021FEB30: ; 0x021FEB30
	push {r4, lr}
	add r4, r1, #0
	bl sub_02068D74
	str r4, [r0, #0xc]
	pop {r4, pc}
	thumb_func_end ov01_021FEB30

	thumb_func_start ov01_021FEB3C
ov01_021FEB3C: ; 0x021FEB3C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r2, r0, #0
	add r6, r2, #0
	add r3, r4, #0
	ldmia r6!, {r0, r1}
	add r3, #0x10
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	str r0, [r3]
	ldr r0, [r2]
	str r0, [r4, #4]
	add r0, r5, #0
	bl sub_02068D90
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x1c]
	bl ov01_021FEA90
	ldr r0, [r4, #0x1c]
	bl ov01_021FEA30
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEB3C

	thumb_func_start ov01_021FEB78
ov01_021FEB78: ; 0x021FEB78
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x1c]
	bl ov01_021FEA38
	ldr r0, [r4, #0x1c]
	bl ov01_021FEAA0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEB78

	thumb_func_start ov01_021FEB8C
ov01_021FEB8C: ; 0x021FEB8C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r1, #0xc]
	ldr r4, [r1, #0x20]
	cmp r0, #0
	beq _021FEBBA
	add r1, sp, #0xc
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	bl sub_0205F9A0
	add r0, r4, #0
	add r1, sp, #0
	bl MapObject_GetPositionVec
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
_021FEBBA:
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEB8C

	thumb_func_start ov01_021FEBC0
ov01_021FEBC0: ; 0x021FEBC0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x3c
	add r3, r1, #0
	add r6, r0, #0
	ldr r0, [r3]
	cmp r0, #1
	beq _021FEC2C
	ldr r0, [r3, #8]
	ldr r5, _021FEC30 ; =ov01_022090F0
	add r0, r0, #1
	str r0, [r3, #8]
	ldmia r5!, {r0, r1}
	add r4, sp, #0
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	mov r2, #0
	str r0, [r4]
	ldr r4, [r3, #0x1c]
	ldr r0, [r3, #4]
	add r4, #0x28
	cmp r0, #3
	bhi _021FEC0A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FEBF8: ; jump table
	.short _021FEC00 - _021FEBF8 - 2 ; case 0
	.short _021FEC0A - _021FEBF8 - 2 ; case 1
	.short _021FEC04 - _021FEBF8 - 2 ; case 2
	.short _021FEC08 - _021FEBF8 - 2 ; case 3
_021FEC00:
	mov r2, #0xb4
	b _021FEC0A
_021FEC04:
	ldr r2, _021FEC34 ; =0x0000010E
	b _021FEC0A
_021FEC08:
	mov r2, #0x5a
_021FEC0A:
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
_021FEC2C:
	add sp, #0x3c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021FEC30: .word ov01_022090F0
_021FEC34: .word 0x0000010E
	thumb_func_end ov01_021FEBC0

	.rodata

ov01_022090F0: ; 0x022090F0
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00

ov01_022090FC: ; 0x022090FC
	.word 0x00000024
	.word ov01_021FEB3C
	.word ov01_021FEB78
	.word ov01_021FEB8C
	.word ov01_021FEBC0
