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
	.include "overlay_01_021FF854.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FF854
ov01_021FF854: ; 0x021FF854
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #4
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_021FF880
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FF854

	thumb_func_start ov01_021FF870
ov01_021FF870: ; 0x021FF870
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FF8C8
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FF870

	thumb_func_start ov01_021FF880
ov01_021FF880: ; 0x021FF880
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #7
	mov r2, #0x7a
	bl ov01_021F18D4
	ldr r0, [r4]
	mov r1, #7
	mov r2, #0x92
	bl ov01_021F1908
	ldr r0, [r4]
	mov r1, #8
	mov r2, #0x15
	mov r3, #1
	bl ov01_021F1930
	mov r0, #8
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _021FF8C4 ; =ov01_0220922C
	mov r2, #7
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #9
	add r3, r2, #0
	bl ov01_021F1758
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021FF8C4: .word ov01_0220922C
	thumb_func_end ov01_021FF880

	thumb_func_start ov01_021FF8C8
ov01_021FF8C8: ; 0x021FF8C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #7
	bl ov01_021F18FC
	ldr r0, [r4]
	mov r1, #7
	bl ov01_021F1924
	ldr r0, [r4]
	mov r1, #8
	bl ov01_021F1970
	ldr r0, [r4]
	mov r1, #9
	bl ov01_021F18C8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FF8C8

	thumb_func_start ov01_021FF8F0
ov01_021FF8F0: ; 0x021FF8F0
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
	mov r1, #0xc
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
	ldr r1, _021FF960 ; =ov01_02209218
	add r0, r4, #0
	add r2, sp, #0x2c
	add r3, r6, #0
	bl ov01_021F1620
	add sp, #0x38
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FF960: .word ov01_02209218
	thumb_func_end ov01_021FF8F0

	thumb_func_start ov01_021FF964
ov01_021FF964: ; 0x021FF964
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
	beq _021FF9AC
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	add r1, sp, #0x2c
	strb r0, [r1]
	b _021FF9B4
_021FF9AC:
	mov r1, #0
	mvn r1, r1
	add r0, sp, #0x2c
	strb r1, [r0]
_021FF9B4:
	add r0, r7, #0
	str r7, [sp, #0x1c]
	bl ov01_021F1468
	str r0, [sp, #0x18]
	add r0, r7, #0
	mov r1, #0xc
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
	ldr r1, _021FF9F0 ; =ov01_02209218
	ldr r3, [sp, #8]
	add r0, r7, #0
	add r2, sp, #0x30
	bl ov01_021F1620
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021FF9F0: .word ov01_02209218
	thumb_func_end ov01_021FF964

	thumb_func_start ov01_021FF9F4
ov01_021FF9F4: ; 0x021FF9F4
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r4, #0
	add r6, r0, #0
	add r3, #0x18
	mov r2, #4
_021FFA08:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021FFA08
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
	mov r1, #9
	add r2, sp, #0
	bl ov01_021F1740
	str r0, [r4, #0x3c]
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _021FFA88
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_02023EA4
_021FFA88:
	add r0, r5, #0
	bl sub_02068D90
	cmp r0, #0
	bne _021FFAA8
	mov r1, #3
	ldr r0, [r4, #0x3c]
	lsl r1, r1, #0xe
	bl sub_02023F1C
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_02023F04
	mov r0, #2
	str r0, [r4]
_021FFAA8:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FF9F4

	thumb_func_start ov01_021FFAB0
ov01_021FFAB0: ; 0x021FFAB0
	ldr r3, _021FFAB8 ; =sub_02023DA4
	ldr r0, [r1, #0x3c]
	bx r3
	nop
_021FFAB8: .word sub_02023DA4
	thumb_func_end ov01_021FFAB0

	thumb_func_start ov01_021FFABC
ov01_021FFABC: ; 0x021FFABC
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
	bne _021FFAE0
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FFAE0:
	mov r1, #2
	add r0, r6, #0
	lsl r1, r1, #8
	bl MapObject_TestFlagsBits
	cmp r0, #1
	ldr r0, [r4, #0x3c]
	bne _021FFAF8
	mov r1, #0
	bl sub_02023EA4
	b _021FFAFE
_021FFAF8:
	mov r1, #1
	bl sub_02023EA4
_021FFAFE:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021FFB36
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
	bne _021FFB36
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl sub_02068DA8
_021FFB36:
	ldr r0, [r4]
	cmp r0, #0
	beq _021FFB48
	cmp r0, #1
	beq _021FFB6C
	cmp r0, #2
	beq _021FFB82
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FFB48:
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
	blt _021FFBCE
	mov r0, #1
	add sp, #0x18
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_021FFB6C:
	mov r1, #3
	ldr r0, [r4, #0x3c]
	lsl r1, r1, #0xe
	bl sub_02023F1C
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_02023F04
	mov r0, #2
	str r0, [r4]
_021FFB82:
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
	bne _021FFBA6
	ldr r0, [r4, #0x20]
	cmp r0, r1
	beq _021FFBB0
_021FFBA6:
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021FFBB0:
	mov r0, #0x38
	ldrsb r1, [r4, r0]
	sub r0, #0x39
	cmp r1, r0
	beq _021FFBCE
	add r0, r6, #0
	bl MapObject_GetFacingDirection
	mov r1, #0x38
	ldrsb r1, [r4, r1]
	cmp r1, r0
	beq _021FFBCE
	add r0, r5, #0
	bl ov01_021F1640
_021FFBCE:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FFABC

	thumb_func_start ov01_021FFBD4
ov01_021FFBD4: ; 0x021FFBD4
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
	bne _021FFBF6
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0xc
	pop {r4, r5, pc}
_021FFBF6:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x3c]
	add r1, sp, #0
	bl sub_02023E50
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FFBD4

	.rodata

ov01_02209218: ; 0x02209218
	.word 0x00000040
	.word ov01_021FF9F4
	.word ov01_021FFAB0
	.word ov01_021FFABC
	.word ov01_021FFBD4

ov01_0220922C: ; 0x0220922C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00

ov01_02209244:
	.word 0x00000040
	.word ov01_021FFCA8
	.word ov01_021FFD64
	.word ov01_021FFD70
	.word ov01_021FFE98
