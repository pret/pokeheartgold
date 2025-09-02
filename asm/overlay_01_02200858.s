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
	.include "overlay_01_02200858.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_02200858
ov01_02200858: ; 0x02200858
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r1, #0x6c
	add r3, r2, #0
	add r5, r0, #0
	bl ov01_021F1430
	add r4, r0, #0
	str r5, [r4]
	bl ov01_02200884
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_02200858

	thumb_func_start ov01_02200874
ov01_02200874: ; 0x02200874
	push {r4, lr}
	add r4, r0, #0
	bl ov01_022008A8
	add r0, r4, #0
	bl ov01_021F1448
	pop {r4, pc}
	thumb_func_end ov01_02200874

	thumb_func_start ov01_02200884
ov01_02200884: ; 0x02200884
	push {r3, r4, lr}
	sub sp, #4
	mov r2, #0
	add r4, r0, #0
	str r2, [sp]
	ldr r0, [r4]
	add r1, r4, #4
	mov r3, #0x55
	bl ov01_021F19F4
	add r0, r4, #0
	add r0, #0x18
	add r1, r4, #4
	bl sub_02069978
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02200884

	thumb_func_start ov01_022008A8
ov01_022008A8: ; 0x022008A8
	ldr r3, _022008B0 ; =sub_02069784
	add r0, r0, #4
	bx r3
	nop
_022008B0: .word sub_02069784
	thumb_func_end ov01_022008A8

	thumb_func_start ov01_022008B4
ov01_022008B4: ; 0x022008B4
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r2, sp, #8
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	add r5, r0, #0
	str r1, [r2, #8]
	bl PlayerAvatar_GetMapObject
	add r4, r0, #0
	bl ov01_021F146C
	add r6, r0, #0
	mov r1, #3
	str r6, [sp, #0x14]
	bl ov01_021F1450
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #2
	str r5, [sp, #0x1c]
	bl MapObject_GetPriorityPlusValue
	add r1, sp, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, _022008FC ; =ov01_02209340
	add r0, r6, #0
	add r2, sp, #8
	mov r3, #0
	bl ov01_021F1620
	add sp, #0x20
	pop {r4, r5, r6, pc}
	nop
_022008FC: .word ov01_02209340
	thumb_func_end ov01_022008B4

	thumb_func_start ov01_02200900
ov01_02200900: ; 0x02200900
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_02068D98
	add r4, r0, #0
	add r3, r4, #0
	add r2, r5, #0
	ldmia r3!, {r0, r1}
	add r2, #0x24
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #8]
	bl PlayerAvatar_GetMapObject
	mov r1, #0
	mvn r1, r1
	add r4, r0, #0
	str r1, [r5, #4]
	bl MapObject_GetID
	str r0, [r5, #0x14]
	add r0, r4, #0
	bl MapObject_GetMapID
	str r0, [r5, #0x18]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov01_02200900

	thumb_func_start ov01_02200938
ov01_02200938: ; 0x02200938
	bx lr
	.balign 4, 0
	thumb_func_end ov01_02200938

	thumb_func_start ov01_0220093C
ov01_0220093C: ; 0x0220093C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	str r0, [sp]
	ldr r0, [r5, #0x2c]
	str r0, [sp, #4]
	bl PlayerAvatar_GetMapObject
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x18]
	add r6, r0, #0
	bl sub_0205F0A8
	cmp r0, #0
	bne _02200964
	ldr r0, [sp]
	bl ov01_021F1640
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_02200964:
	ldr r7, [r5, #4]
	add r0, r6, #0
	bl sub_0205F504
	strb r0, [r5, #8]
	ldrb r0, [r5, #8]
	bl ov01_02200AB0
	str r0, [r5, #4]
	mov r0, #0
	str r0, [r5]
	ldr r4, [r5, #4]
	sub r0, r0, #1
	cmp r4, r0
	beq _0220098C
	ldr r0, [sp, #4]
	bl PlayerAvatar_GetFacingDirection
	cmp r4, r0
	beq _0220099A
_0220098C:
	mov r0, #0
	str r0, [r5, #0x1c]
	str r0, [r5, #0x20]
	mov r0, #1
	add sp, #0x24
	str r0, [r5]
	pop {r4, r5, r6, r7, pc}
_0220099A:
	cmp r7, r4
	beq _022009A4
	mov r0, #0
	str r0, [r5, #0x1c]
	str r0, [r5, #0x20]
_022009A4:
	add r0, r6, #0
	bl MapObject_GetXCoord
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl GetDeltaXByFacingDirection
	add r7, r0, #0
	add r0, r6, #0
	bl MapObject_GetZCoord
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl GetDeltaYByFacingDirection
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r4, r7
	add r1, r1, r2
	add r2, sp, #0xc
	bl sub_020611C8
	add r0, r6, #0
	add r1, sp, #0x18
	bl MapObject_CopyPositionVector
	ldr r0, [sp, #0x1c]
	add r1, sp, #0xc
	str r0, [sp, #0x10]
	ldr r0, [sp]
	bl sub_02068DA8
	ldr r0, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r5, #0x1c]
	cmp r0, #0xf
	ble _02200A04
	mov r0, #0
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	add r0, r0, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	str r0, [r5, #0x20]
_02200A04:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_0220093C

	thumb_func_start ov01_02200A08
ov01_02200A08: ; 0x02200A08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r3, r1, #0
	add r6, r0, #0
	ldr r0, [r3]
	cmp r0, #1
	beq _02200AA4
	mov r0, #0
	ldr r1, [r3, #4]
	mvn r0, r0
	cmp r1, r0
	beq _02200AA4
	ldr r5, _02200AA8 ; =ov01_02209334
	add r4, sp, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	mov r7, #0x18
	str r0, [r4]
	ldr r1, [r3, #4]
	ldr r4, _02200AAC ; =ov01_02209354
	add r0, r1, #0
	mul r0, r7
	add r0, r4, r0
	ldr r5, [r3, #0x28]
	ldr r4, [r3, #0x20]
	mov r3, #0xc
	mul r3, r4
	mov r2, #0
	add r5, #0x18
	add r4, r0, r3
	cmp r1, #3
	bhi _02200A6A
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02200A56: ; jump table
	.short _02200A5E - _02200A56 - 2 ; case 0
	.short _02200A6A - _02200A56 - 2 ; case 1
	.short _02200A62 - _02200A56 - 2 ; case 2
	.short _02200A68 - _02200A56 - 2 ; case 3
_02200A5E:
	mov r2, #0xb4
	b _02200A6A
_02200A62:
	add r2, r7, #0
	add r2, #0xf6
	b _02200A6A
_02200A68:
	mov r2, #0x5a
_02200A6A:
	mov r1, #0
	lsl r2, r2, #0x10
	add r0, sp, #0x18
	lsr r2, r2, #0x10
	add r3, r1, #0
	bl sub_02020DA4
	add r0, r6, #0
	add r1, sp, #0xc
	bl sub_02068DB8
	ldr r1, [sp, #0xc]
	ldr r0, [r4]
	add r2, sp, #0
	add r0, r1, r0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	ldr r0, [r4, #4]
	add r3, sp, #0x18
	add r0, r1, r0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_020699AC
_02200AA4:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02200AA8: .word ov01_02209334
_02200AAC: .word ov01_02209354
	thumb_func_end ov01_02200A08

	thumb_func_start ov01_02200AB0
ov01_02200AB0: ; 0x02200AB0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205B730
	cmp r0, #0
	beq _02200AC0
	mov r0, #0
	pop {r4, pc}
_02200AC0:
	add r0, r4, #0
	bl sub_0205B73C
	cmp r0, #0
	beq _02200ACE
	mov r0, #1
	pop {r4, pc}
_02200ACE:
	add r0, r4, #0
	bl sub_0205B724
	cmp r0, #0
	beq _02200ADC
	mov r0, #2
	pop {r4, pc}
_02200ADC:
	add r0, r4, #0
	bl sub_0205B718
	cmp r0, #0
	beq _02200AEA
	mov r0, #3
	pop {r4, pc}
_02200AEA:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	thumb_func_end ov01_02200AB0

	.rodata

ov01_02209334: ; 0x02209334
	.word 0x1000, 0x1000, 0x1000

ov01_02209340: ; 0x02209340
	.word 0x00000030
	.word ov01_02200900
	.word ov01_02200938
	.word ov01_0220093C
	.word ov01_02200A08

ov01_02209354: ; 0x02209354
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xE0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
