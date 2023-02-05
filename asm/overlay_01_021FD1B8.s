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
	.include "overlay_01_021FD1B8.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FD1B8
ov01_021FD1B8: ; 0x021FD1B8
	push {r4, lr}
	mov r2, #0
	mov r1, #0xc
	add r3, r2, #0
	add r4, r0, #0
	bl ov01_021F1430
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD1B8

	thumb_func_start ov01_021FD1CC
ov01_021FD1CC: ; 0x021FD1CC
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021FD21C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021FD1DE
	bl ov01_021F1448
_021FD1DE:
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD1CC

	thumb_func_start ov01_021FD1E8
ov01_021FD1E8: ; 0x021FD1E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	str r1, [r5]
	mov r2, #0
	add r0, r3, #0
	add r1, r5, #4
	add r3, r4, #0
	str r2, [sp]
	bl ov01_021F19F4
	add r0, r5, #0
	add r0, #0x18
	add r1, r5, #4
	bl sub_02069978
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD1E8

	thumb_func_start ov01_021FD20C
ov01_021FD20C: ; 0x021FD20C
	ldr r1, _021FD214 ; =0x0000FFFF
	ldr r3, _021FD218 ; =sub_02069784
	stmia r0!, {r1}
	bx r3
	.balign 4, 0
_021FD214: .word 0x0000FFFF
_021FD218: .word sub_02069784
	thumb_func_end ov01_021FD20C

	thumb_func_start ov01_021FD21C
ov01_021FD21C: ; 0x021FD21C
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, [r0, #4]
	mov r4, #0
	ldr r5, [r0, #8]
	cmp r6, #0
	bls _021FD23E
	ldr r7, _021FD240 ; =0x0000FFFF
_021FD22A:
	ldr r0, [r5]
	cmp r0, r7
	beq _021FD236
	add r0, r5, #0
	bl ov01_021FD20C
_021FD236:
	add r4, r4, #1
	add r5, #0x6c
	cmp r4, r6
	blo _021FD22A
_021FD23E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FD240: .word 0x0000FFFF
	thumb_func_end ov01_021FD21C

	thumb_func_start ov01_021FD244
ov01_021FD244: ; 0x021FD244
	ldr r3, [r0, #4]
	ldr r0, [r0, #8]
_021FD248:
	ldr r2, [r0]
	cmp r2, r1
	beq _021FD256
	add r0, #0x6c
	sub r3, r3, #1
	bne _021FD248
	mov r0, #0
_021FD256:
	bx lr
	thumb_func_end ov01_021FD244

	thumb_func_start ov01_021FD258
ov01_021FD258: ; 0x021FD258
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x14
	add r6, r0, #0
	bl ov01_021F1450
	add r4, r0, #0
	cmp r5, #0
	bne _021FD26E
	bl GF_AssertFail
_021FD26E:
	mov r1, #0x6c
	mov r2, #0
	add r0, r6, #0
	mul r1, r5
	add r3, r2, #0
	str r5, [r4, #4]
	bl ov01_021F1430
	ldr r1, _021FD28C ; =0x0000FFFF
	str r0, [r4, #8]
_021FD282:
	str r1, [r0]
	add r0, #0x6c
	sub r5, r5, #1
	bne _021FD282
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FD28C: .word 0x0000FFFF
	thumb_func_end ov01_021FD258

	thumb_func_start ov01_021FD290
ov01_021FD290: ; 0x021FD290
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0x14
	add r5, r0, #0
	add r6, r2, #0
	bl ov01_021F1450
	add r1, r4, #0
	add r7, r0, #0
	bl ov01_021FD244
	cmp r0, #0
	bne _021FD2C6
	ldr r1, _021FD2C8 ; =0x0000FFFF
	add r0, r7, #0
	bl ov01_021FD244
	cmp r0, #0
	bne _021FD2BC
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_021FD2BC:
	add r1, r4, #0
	add r2, r6, #0
	add r3, r5, #0
	bl ov01_021FD1E8
_021FD2C6:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021FD2C8: .word 0x0000FFFF
	thumb_func_end ov01_021FD290

	thumb_func_start ov01_021FD2CC
ov01_021FD2CC: ; 0x021FD2CC
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x14
	bl ov01_021F1450
	add r1, r4, #0
	bl ov01_021FD244
	add r4, r0, #0
	bne _021FD2E4
	bl GF_AssertFail
_021FD2E4:
	add r4, #0x18
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD2CC

	thumb_func_start ov01_021FD2EC
ov01_021FD2EC: ; 0x021FD2EC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	bl ov01_021F146C
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetGfxID
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #2
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	bl sub_0205F09C
	add r1, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _021FD324 ; =ov01_02208E1C
	add r0, r4, #0
	add r2, r6, #0
	mov r3, #0
	bl ov01_021F1620
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021FD324: .word ov01_02208E1C
	thumb_func_end ov01_021FD2EC

	thumb_func_start ov01_021FD328
ov01_021FD328: ; 0x021FD328
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02068D98
	add r3, r0, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	add r2, #0x1c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x24]
	bl MapObject_GetID
	str r0, [r4, #4]
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	bl ov01_021FD2CC
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x24]
	bl MapObject_CheckFlag25
	cmp r0, #1
	ldr r0, [r4, #0x24]
	bne _021FD364
	bl sub_0205F544
	b _021FD368
_021FD364:
	bl sub_0205F254
_021FD368:
	str r0, [r4, #8]
	add r4, #0xc
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02068DB8
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_021FD328

	thumb_func_start ov01_021FD378
ov01_021FD378: ; 0x021FD378
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FD378

	thumb_func_start ov01_021FD37C
ov01_021FD37C: ; 0x021FD37C
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r4, r1, #0
	ldr r6, [r4, #0x24]
	ldr r1, [r4, #4]
	add r5, r0, #0
	ldr r2, [r4, #8]
	add r0, r6, #0
	bl sub_0205F0A8
	cmp r0, #0
	bne _021FD39E
	add r0, r5, #0
	bl ov01_021F1640
	add sp, #0x18
	pop {r4, r5, r6, pc}
_021FD39E:
	add r0, r6, #0
	add r1, sp, #0xc
	bl MapObject_GetPositionVec
	add r0, r6, #0
	add r1, sp, #0
	bl MapObject_GetFacingVec
	ldr r1, [sp]
	ldr r0, [r4, #0xc]
	ldr r2, [sp, #0xc]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x10]
	ldr r2, [sp, #0x10]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [sp, #0x10]
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r2, [sp, #0x14]
	add r0, r1, r0
	add r0, r2, r0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_02068DA8
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FD37C

	thumb_func_start ov01_021FD3E0
ov01_021FD3E0: ; 0x021FD3E0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r1, sp, #0
	bl sub_02068DB8
	ldr r0, [r4, #0x18]
	add r1, sp, #0
	bl sub_020699BC
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov01_021FD3E0

	thumb_func_start ov01_021FD3F8
ov01_021FD3F8: ; 0x021FD3F8
	push {r4, r5, r6, lr}
	mov r5, #0xc
	add r1, r5, #0
	add r6, r0, #0
	ldr r4, _021FD418 ; =ov01_02208E30
	bl ov01_021FD258
_021FD406:
	ldr r1, [r4]
	ldr r2, [r4, #4]
	add r0, r6, #0
	bl ov01_021FD290
	add r4, #8
	sub r5, r5, #1
	bne _021FD406
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021FD418: .word ov01_02208E30
	thumb_func_end ov01_021FD3F8

	.rodata

ov01_02208E1C: ; 0x02208E1C
	.word 0x00000028
	.word ov01_021FD328
	.word ov01_021FD378
	.word ov01_021FD37C
	.word ov01_021FD3E0

ov01_02208E30: ; 0x02208E30
	.word 0x000000B7, 0x00000054
	.word 0x00000100, 0x0000006B
	.word 0x00000101, 0x0000006C
	.word 0x000000FD, 0x0000006D
	.word 0x000000FB, 0x0000006E
	.word 0x000000FC, 0x0000006F
	.word 0x000000FE, 0x00000070
	.word 0x000000FF, 0x00000071
	.word 0x00000120, 0x00000072
	.word 0x00000123, 0x00000074
	.word 0x00000124, 0x00000073
	.word 0x00000121, 0x00000075
