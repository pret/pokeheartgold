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
	.include "overlay_01_021FED9C.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FED9C
ov01_021FED9C: ; 0x021FED9C
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #0x3c
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_021FEDC8
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FED9C

	thumb_func_start ov01_021FEDB8
ov01_021FEDB8: ; 0x021FEDB8
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FEDF0
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_021FEDB8

	thumb_func_start ov01_021FEDC8
ov01_021FEDC8: ; 0x021FEDC8
	push {r3, r4, lr}
	sub sp, #4
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	ldr r0, [r4]
	add r1, r4, #4
	mov r3, #0x1e
	bl ov01_021F19F4
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4]
	add r4, #0x18
	add r1, r4, #0
	mov r3, #0x87
	bl ov01_021F1A18
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov01_021FEDC8

	thumb_func_start ov01_021FEDF0
ov01_021FEDF0: ; 0x021FEDF0
	push {r4, lr}
	add r4, r0, #0
	add r0, r4, #4
	bl sub_02069784
	add r4, #0x18
	add r0, r4, #0
	bl sub_020698D0
	pop {r4, pc}
	thumb_func_end ov01_021FEDF0

	thumb_func_start ov01_021FEE04
ov01_021FEE04: ; 0x021FEE04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	bl ov01_021F146C
	mov r1, #7
	str r0, [sp, #8]
	bl ov01_021F1450
	str r0, [sp, #0xc]
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #0x10
	bl sub_020611C8
	ldr r1, [sp, #0x18]
	lsl r0, r4, #3
	add r0, r1, r0
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl MapObject_GetPreviousYCoord
	lsl r1, r0, #0xf
	mov r0, #2
	lsl r0, r0, #0xe
	sub r0, r1, r0
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r1, #2
	bl MapObject_GetPriorityPlusValue
	add r1, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, _021FEE60 ; =ov01_02209124
	add r2, sp, #0x10
	mov r3, #0
	bl ov01_021F1620
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_021FEE60: .word ov01_02209124
	thumb_func_end ov01_021FEE04

	thumb_func_start ov01_021FEE64
ov01_021FEE64: ; 0x021FEE64
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	bl sub_02068D98
	ldr r3, [r0, #4]
	ldr r1, [r0]
	mov r0, #0
	str r1, [r4, #0x78]
	str r3, [r4, #0x7c]
	str r0, [sp]
	add r2, r3, #4
	ldr r0, [r4, #0x78]
	add r1, r4, #0
	add r3, #0x18
	bl ov01_021F1A34
	ldr r1, [r4, #0x7c]
	add r0, r4, #0
	add r0, #0x24
	add r1, r1, #4
	add r2, r4, #0
	bl sub_02069998
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEE64

	thumb_func_start ov01_021FEE9C
ov01_021FEE9C: ; 0x021FEE9C
	ldr r3, _021FEEA4 ; =sub_020698D0
	add r0, r1, #0
	bx r3
	nop
_021FEEA4: .word sub_020698D0
	thumb_func_end ov01_021FEE9C

	thumb_func_start ov01_021FEEA8
ov01_021FEEA8: ; 0x021FEEA8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02069948
	cmp r0, #1
	bne _021FEEC0
	add r0, r5, #0
	bl ov01_021F1640
	pop {r3, r4, r5, pc}
_021FEEC0:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xc
	mov r2, #0
	bl sub_020698E8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEEA8

	thumb_func_start ov01_021FEED0
ov01_021FEED0: ; 0x021FEED0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl sub_02068DB8
	add r4, #0x24
	add r0, r4, #0
	add r1, sp, #0
	bl sub_020699BC
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FEED0

	.rodata

ov01_02209124: ; 0x02209124
	.word 0x00000080
	.word ov01_021FEE64
	.word ov01_021FEE9C
	.word ov01_021FEEA8
	.word ov01_021FEED0
