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
	.include "overlay_01_021F3D38.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021F3D38
ov01_021F3D38: ; 0x021F3D38
	push {r3, lr}
	mov r1, #0x14
	bl AllocFromHeap
	add r3, r0, #0
	mov r2, #0x14
	mov r1, #0
_021F3D46:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _021F3D46
	pop {r3, pc}
	thumb_func_end ov01_021F3D38

	thumb_func_start ov01_021F3D50
ov01_021F3D50: ; 0x021F3D50
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x13]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	beq _021F3D60
	bl RemoveWindow
_021F3D60:
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	thumb_func_end ov01_021F3D50

	thumb_func_start ov01_021F3D68
ov01_021F3D68: ; 0x021F3D68
	strb r1, [r0, #0x12]
	strh r2, [r0, #0x10]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F3D68

	thumb_func_start ov01_021F3D70
ov01_021F3D70: ; 0x021F3D70
	ldrb r3, [r0, #0x13]
	mov r2, #0x7f
	bic r3, r2
	mov r2, #0x7f
	and r1, r2
	orr r1, r3
	strb r1, [r0, #0x13]
	bx lr
	thumb_func_end ov01_021F3D70

	thumb_func_start ov01_021F3D80
ov01_021F3D80: ; 0x021F3D80
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021F3D80

	thumb_func_start ov01_021F3D84
ov01_021F3D84: ; 0x021F3D84
	ldrb r0, [r0, #0x12]
	bx lr
	thumb_func_end ov01_021F3D84

	thumb_func_start ov01_021F3D88
ov01_021F3D88: ; 0x021F3D88
	ldrb r0, [r0, #0x13]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	bne _021F3D94
	mov r0, #1
	bx lr
_021F3D94:
	mov r0, #0
	bx lr
	thumb_func_end ov01_021F3D88

	thumb_func_start ov01_021F3D98
ov01_021F3D98: ; 0x021F3D98
	push {r4, lr}
	ldr r4, [r0, #0x68]
	ldrb r1, [r4, #0x13]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	cmp r1, #4
	bhi _021F3DFA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F3DB2: ; jump table
	.short _021F3DFA - _021F3DB2 - 2 ; case 0
	.short _021F3DBC - _021F3DB2 - 2 ; case 1
	.short _021F3DCA - _021F3DB2 - 2 ; case 2
	.short _021F3DDC - _021F3DB2 - 2 ; case 3
	.short _021F3DEE - _021F3DB2 - 2 ; case 4
_021F3DBC:
	bl ov01_021F3E10
	ldrb r1, [r4, #0x13]
	mov r0, #0x7f
	bic r1, r0
	strb r1, [r4, #0x13]
	pop {r4, pc}
_021F3DCA:
	bl ov01_021F3EE0
	cmp r0, #1
	bne _021F3DFA
	ldrb r1, [r4, #0x13]
	mov r0, #0x7f
	bic r1, r0
	strb r1, [r4, #0x13]
	pop {r4, pc}
_021F3DDC:
	bl ov01_021F3EA0
	cmp r0, #1
	bne _021F3DFA
	ldrb r1, [r4, #0x13]
	mov r0, #0x7f
	bic r1, r0
	strb r1, [r4, #0x13]
	pop {r4, pc}
_021F3DEE:
	bl ov01_021F3E4C
	ldrb r1, [r4, #0x13]
	mov r0, #0x7f
	bic r1, r0
	strb r1, [r4, #0x13]
_021F3DFA:
	pop {r4, pc}
	thumb_func_end ov01_021F3D98

	thumb_func_start ov01_021F3DFC
ov01_021F3DFC: ; 0x021F3DFC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	bl ov01_021F3D70
	add r0, r4, #0
	bl ov01_021F3D98
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3DFC

	thumb_func_start ov01_021F3E10
ov01_021F3E10: ; 0x021F3E10
	push {r4, lr}
	mov r1, #3
	add r4, r0, #0
	add r3, r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	sub r3, #0x33
	bl BgSetPosTextAndCommit
	ldr r1, [r4, #0x68]
	ldrb r0, [r1, #0x13]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _021F3E40
	ldrb r2, [r1, #0x12]
	ldr r0, [r4, #8]
	mov r3, #3
	bl sub_0205B63C
	ldr r2, [r4, #0x68]
	mov r0, #0x80
	ldrb r1, [r2, #0x13]
	orr r0, r1
	strb r0, [r2, #0x13]
_021F3E40:
	ldr r0, [r4, #0x68]
	ldrb r1, [r0, #0x12]
	ldrh r2, [r0, #0x10]
	bl sub_0205B6A0
	pop {r4, pc}
	thumb_func_end ov01_021F3E10

	thumb_func_start ov01_021F3E4C
ov01_021F3E4C: ; 0x021F3E4C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x68]
	ldrb r1, [r0, #0x13]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	beq _021F3E9A
	bl RemoveWindow
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4, #8]
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	mov r1, #3
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r2, [r4, #0x68]
	mov r0, #0x80
	ldrb r1, [r2, #0x13]
	bic r1, r0
	strb r1, [r2, #0x13]
_021F3E9A:
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3E4C

	thumb_func_start ov01_021F3EA0
ov01_021F3EA0: ; 0x021F3EA0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #3
	bl Bg_GetYpos
	cmp r0, #0
	bne _021F3EB4
	mov r0, #1
	pop {r4, pc}
_021F3EB4:
	mov r1, #0x2f
	mvn r1, r1
	cmp r0, r1
	ble _021F3EC0
	cmp r0, #0
	blt _021F3ECE
_021F3EC0:
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r4, #8]
	add r2, r1, #0
	sub r3, #0x33
	bl BgSetPosTextAndCommit
_021F3ECE:
	ldr r0, [r4, #8]
	mov r1, #3
	mov r2, #4
	mov r3, #0x10
	bl BgSetPosTextAndCommit
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021F3EA0

	thumb_func_start ov01_021F3EE0
ov01_021F3EE0: ; 0x021F3EE0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #3
	bl Bg_GetYpos
	mov r1, #0x2f
	mvn r1, r1
	cmp r0, r1
	bne _021F3F2C
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4, #8]
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	mov r1, #3
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	add sp, #0x10
	mov r0, #1
	pop {r4, pc}
_021F3F2C:
	ble _021F3F32
	cmp r0, #0
	blt _021F3F3E
_021F3F32:
	mov r1, #3
	ldr r0, [r4, #8]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
_021F3F3E:
	ldr r0, [r4, #8]
	mov r1, #3
	mov r2, #5
	mov r3, #0x10
	bl BgSetPosTextAndCommit
	mov r0, #0
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov01_021F3EE0
