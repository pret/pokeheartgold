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
	.include "overlay_01_021FEEEC.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FEEEC
ov01_021FEEEC: ; 0x021FEEEC
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_021FEF18
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEEEC

	thumb_func_start ov01_021FEF08
ov01_021FEF08: ; 0x021FEF08
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FEFF8
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FEF08

	thumb_func_start ov01_021FEF18
ov01_021FEF18: ; 0x021FEF18
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x7e
	bl ov01_021F18D4
	ldr r0, [r4]
	mov r1, #5
	mov r2, #0x7f
	bl ov01_021F18D4
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x8c
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #3
	mov r2, #0x8d
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #4
	mov r2, #0x8e
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #5
	mov r2, #0x8f
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x19
	mov r3, #1
	bl ov01_021F1930
	ldr r0, [r4]
	mov r1, #4
	mov r2, #0x10
	mov r3, #1
	bl ov01_021F1930
	ldr r0, [r4]
	mov r1, #5
	mov r2, #0
	mov r3, #1
	bl ov01_021F1930
	mov r2, #1
	ldr r0, [r4]
	mov r1, #6
	add r3, r2, #0
	bl ov01_021F1930
	mov r1, #0
	str r1, [sp]
	ldr r0, _021FEFE8 ; =ov01_02209178
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4]
	add r2, r1, #0
	add r3, r1, #0
	bl ov01_021F1758
	mov r0, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021FEFEC ; =ov01_02209190
	mov r1, #5
	str r0, [sp, #8]
	ldr r0, [r4]
	add r2, r1, #0
	mov r3, #3
	bl ov01_021F1758
	mov r2, #5
	str r2, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021FEFF0 ; =ov01_02209160
	mov r1, #6
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r3, #4
	bl ov01_021F1758
	mov r0, #6
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021FEFF4 ; =ov01_022091A8
	mov r2, #5
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #7
	add r3, r2, #0
	bl ov01_021F1758
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_021FEFE8: .word ov01_02209178
_021FEFEC: .word ov01_02209190
_021FEFF0: .word ov01_02209160
_021FEFF4: .word ov01_022091A8
	thumb_func_end ov01_021FEF18

	thumb_func_start ov01_021FEFF8
ov01_021FEFF8: ; 0x021FEFF8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #0
	bl ov01_021F18FC
	ldr r0, [r4]
	mov r1, #5
	bl ov01_021F18FC
	ldr r0, [r4]
	mov r1, #0
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #3
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #4
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #5
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #0
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #4
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #5
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #6
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #0
	bl ov01_021F18C8
	ldr r0, [r4]
	mov r1, #5
	bl ov01_021F18C8
	ldr r0, [r4]
	mov r1, #6
	bl ov01_021F18C8
	ldr r0, [r4]
	mov r1, #7
	bl ov01_021F18C8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEFF8

	thumb_func_start ov01_021FF070
ov01_021FF070: ; 0x021FF070
	push {r4, r5, r6, lr}
	sub sp, #0x38
	add r5, r0, #0
	add r6, r1, #0
	bl ov01_021F146C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetXCoord
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObject_GetYCoord
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl MapObject_GetZCoord
	str r0, [sp, #0x10]
	mov r1, #0
	add r0, sp, #8
	strh r1, [r0, #0x1c]
	strh r1, [r0, #0x1e]
	sub r1, r1, #1
	add r0, sp, #0x28
	strb r1, [r0]
	add r0, r4, #0
	str r4, [sp, #0x18]
	bl ov01_021F1468
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #8
	bl ov01_021F1450
	str r0, [sp, #0x1c]
	add r0, r5, #0
	add r1, sp, #0x2c
	str r5, [sp, #0x20]
	bl MapObject_CopyPositionVector
	add r0, r5, #0
	mov r1, #2
	bl MapObject_GetPriorityPlusValue
	add r1, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _021FF0E0 ; =ov01_02209138
	add r0, r4, #0
	add r2, sp, #0x2c
	add r3, r6, #0
	bl ov01_021F1620
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FF0E0: .word ov01_02209138
	thumb_func_end ov01_021FF070

	thumb_func_start ov01_021FF0E4
ov01_021FF0E4: ; 0x021FF0E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r0, #0
	str r1, [sp, #8]
	add r4, r2, #0
	add r6, r3, #0
	bl ov01_021F146C
	add r7, r0, #0
	add r0, r5, #0
	str r4, [sp, #0xc]
	bl MapObject_GetYCoord
	str r0, [sp, #0x10]
	add r0, r5, #0
	str r6, [sp, #0x14]
	bl MapObject_GetXCoord
	sub r1, r0, r4
	add r0, sp, #0xc
	strh r1, [r0, #0x1c]
	add r0, r5, #0
	bl MapObject_GetZCoord
	sub r1, r0, r6
	add r0, sp, #0xc
	strh r1, [r0, #0x1e]
	ldr r0, [sp, #0x50]
	cmp r0, #0
	beq _021FF12C
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r1, sp, #0x2c
	strb r0, [r1]
	b _021FF134
_021FF12C:
	mov r1, #0
	mvn r1, r1
	add r0, sp, #0x2c
	strb r1, [r0]
_021FF134:
	add r0, r7, #0
	str r7, [sp, #0x1c]
	bl ov01_021F1468
	str r0, [sp, #0x18]
	add r0, r7, #0
	mov r1, #8
	bl ov01_021F1450
	str r0, [sp, #0x20]
	add r0, r5, #0
	add r1, sp, #0x30
	str r5, [sp, #0x24]
	bl MapObject_CopyPositionVector
	add r0, r5, #0
	mov r1, #2
	bl MapObject_GetPriorityPlusValue
	add r1, sp, #0xc
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _021FF170 ; =ov01_02209138
	ldr r3, [sp, #8]
	add r0, r7, #0
	add r2, sp, #0x30
	bl ov01_021F1620
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF170: .word ov01_02209138
	thumb_func_end ov01_021FF0E4

	thumb_func_start ov01_021FF174
ov01_021FF174: ; 0x021FF174
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r4, #0
	add r6, r0, #0
	add r3, #0x18
	mov r2, #4
_021FF188:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021FF188
	ldr r0, [r6]
	str r0, [r3]
	ldr r0, [r4, #0x30]
	bl MapObject_GetSpriteID
	str r0, [r4, #4]
	ldr r0, [r4, #0x30]
	bl MapObject_GetID
	str r0, [r4, #8]
	ldr r0, [r4, #0x30]
	bl MapObject_GetMapID
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x18]
	lsl r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x20]
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r4, #0x30]
	bl MapObject_GetPositionVectorYCoord
	str r0, [sp, #4]
	ldr r0, [r4, #0x24]
	add r1, sp, #0
	bl sub_0206121C
	str r0, [r4, #0x14]
	mov r0, #2
	ldr r1, [sp]
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp]
	mov r0, #0x12
	ldr r1, [sp, #8]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0x28]
	mov r1, #0
	add r2, sp, #0
	bl ov01_021F1740
	str r0, [r4, #0x3c]
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021FF208
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_02023EA4
_021FF208:
	add r0, r5, #0
	bl sub_02068D90
	cmp r0, #0
	bne _021FF220
	mov r1, #3
	ldr r0, [r4, #0x3c]
	lsl r1, r1, #0xe
	bl sub_02023F1C
	mov r0, #2
	str r0, [r4]
_021FF220:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FF174

	thumb_func_start ov01_021FF228
ov01_021FF228: ; 0x021FF228
	ldr r3, _021FF230 ; =sub_02023DA4
	ldr r0, [r1, #0x3c]
	bx r3
	nop
_021FF230: .word sub_02023DA4
	thumb_func_end ov01_021FF228

	thumb_func_start ov01_021FF234
ov01_021FF234: ; 0x021FF234
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r1, #0
	ldr r6, [r4, #0x30]
	ldr r1, [r4, #4]
	add r5, r0, #0
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	add r0, r6, #0
	bl sub_0205F0F8
	cmp r0, #0
	bne _021FF258
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FF258:
	mov r1, #2
	add r0, r6, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	ldr r0, [r4, #0x3c]
	bne _021FF270
	mov r1, #0
	bl sub_02023EA4
	b _021FF276
_021FF270:
	mov r1, #1
	bl sub_02023EA4
_021FF276:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021FF2AE
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_02068DB8
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	lsl r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x20]
	lsl r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	str r0, [sp, #4]
	ldr r0, [r4, #0x24]
	bl sub_0206121C
	str r0, [r4, #0x14]
	cmp r0, #1
	bne _021FF2AE
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_02068DA8
_021FF2AE:
	ldr r0, [r4]
	cmp r0, #0
	beq _021FF2C0
	cmp r0, #1
	beq _021FF2E4
	cmp r0, #2
	beq _021FF2F2
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FF2C0:
	mov r1, #1
	ldr r0, [r4, #0x3c]
	lsl r1, r1, #0xc
	bl sub_02023F04
	ldr r0, [r4, #0x3c]
	bl sub_02023F70
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	cmp r0, #0xc
	blt _021FF358
	mov r0, #1
	add sp, #0x18
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021FF2E4:
	mov r1, #3
	ldr r0, [r4, #0x3c]
	lsl r1, r1, #0xe
	bl sub_02023F1C
	mov r0, #2
	str r0, [r4]
_021FF2F2:
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	add r0, r6, #0
	bl sub_0205F0F8
	cmp r0, #0
	bne _021FF30C
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FF30C:
	add r0, r6, #0
	bl MapObject_GetXCoord
	mov r1, #0x34
	ldrsh r1, [r4, r1]
	sub r7, r0, r1
	add r0, r6, #0
	bl MapObject_GetZCoord
	mov r1, #0x36
	ldrsh r1, [r4, r1]
	sub r1, r0, r1
	ldr r0, [r4, #0x18]
	cmp r0, r7
	bne _021FF330
	ldr r0, [r4, #0x20]
	cmp r0, r1
	beq _021FF33A
_021FF330:
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FF33A:
	mov r0, #0x38
	ldrsb r1, [r4, r0]
	sub r0, #0x39
	cmp r1, r0
	beq _021FF358
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	mov r1, #0x38
	ldrsb r1, [r4, r1]
	cmp r1, r0
	beq _021FF358
	add r0, r5, #0
	bl ov01_021F1640
_021FF358:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FF234

	thumb_func_start ov01_021FF35C
ov01_021FF35C: ; 0x021FF35C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl sub_0205F0F8
	cmp r0, #0
	bne _021FF37E
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r4, r5, pc}
_021FF37E:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl sub_02023E50
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FF35C

	thumb_func_start ov01_021FF394
ov01_021FF394: ; 0x021FF394
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x10
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	add r0, r5, #0
	bl sub_02068D90
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x10]
	lsl r1, r0, #0x10
	mov r0, #2
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp]
	ldr r0, [r4, #0x14]
	lsl r1, r0, #0x10
	mov r0, #9
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	bl sub_0206121C
	mov r0, #1
	ldr r1, [sp, #4]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DA8
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _021FF3FE
	cmp r0, #1
	beq _021FF402
	cmp r0, #2
	b _021FF406
_021FF3FE:
	mov r1, #5
	b _021FF408
_021FF402:
	mov r1, #6
	b _021FF408
_021FF406:
	mov r1, #7
_021FF408:
	ldr r0, [r4, #0x1c]
	add r2, sp, #0
	bl ov01_021F1740
	str r0, [r4, #0x24]
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov01_021FF394

	thumb_func_start ov01_021FF418
ov01_021FF418: ; 0x021FF418
	ldr r3, _021FF420 ; =sub_02023DA4
	ldr r0, [r1, #0x24]
	bx r3
	nop
_021FF420: .word sub_02023DA4
	thumb_func_end ov01_021FF418

	thumb_func_start ov01_021FF424
ov01_021FF424: ; 0x021FF424
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021FF432
	cmp r0, #1
	pop {r4, pc}
_021FF432:
	mov r1, #1
	ldr r0, [r4, #0x24]
	lsl r1, r1, #0xc
	bl sub_02023F04
	cmp r0, #1
	bne _021FF44A
	mov r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_021FF44A:
	pop {r4, pc}
	thumb_func_end ov01_021FF424

	thumb_func_start ov01_021FF44C
ov01_021FF44C: ; 0x021FF44C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x24]
	add r1, sp, #0
	bl sub_02023E50
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_021FF44C

	.rodata

ov01_02209138: ; 0x02209138
	.word 0x00000040
	.word ov01_021FF174
	.word ov01_021FF228
	.word ov01_021FF234
	.word ov01_021FF35C

ov01_0220914C:
	.word 0x00000028
	.word ov01_021FF394
	.word ov01_021FF418
	.word ov01_021FF424
	.word ov01_021FF44C

ov01_02209160: ; 0x02209160
	.byte 0x00, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov01_02209178: ; 0x02209178
	.byte 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov01_02209190: ; 0x02209190
	.byte 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov01_022091A8: ; 0x022091A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
