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
	.include "overlay_01_02204004.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_022046A4
ov01_022046A4: ; 0x022046A4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r2, #0
	mov r1, #0
	bl NNS_G3dGetAnmByIdx
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov01_022046D4
	add r1, r4, #0
	str r0, [r5]
	bl ov01_02204728
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_022046A4

	thumb_func_start ov01_022046C8
ov01_022046C8: ; 0x022046C8
	ldrb r0, [r0, #9]
	mov r1, #3
	lsl r0, r0, #1
	add r0, #0x1c
	bic r0, r1
	bx lr
	thumb_func_end ov01_022046C8

	thumb_func_start ov01_022046D4
ov01_022046D4: ; 0x022046D4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov01_022046C8
	add r1, r0, #0
	add r0, r4, #0
	bl NNS_FndAllocFromAllocator
	pop {r4, pc}
	thumb_func_end ov01_022046D4

	thumb_func_start ov01_022046E8
ov01_022046E8: ; 0x022046E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02204724 ; =_02110A0C
	add r4, r1, #0
	ldr r0, [r0]
	add r1, r5, #0
	str r0, [r5, #0xc]
	ldrb r2, [r4, #9]
	mov r0, #0
	add r1, #0x1a
	strb r2, [r5, #0x19]
	lsl r2, r2, #1
	bl MIi_CpuClear16
	ldrb r0, [r4, #9]
	mov r2, #0
	cmp r0, #0
	bls _02204720
	mov r0, #1
	lsl r0, r0, #8
_02204710:
	add r1, r2, #0
	orr r1, r0
	strh r1, [r5, #0x1a]
	ldrb r1, [r4, #9]
	add r2, r2, #1
	add r5, r5, #2
	cmp r2, r1
	blo _02204710
_02204720:
	pop {r3, r4, r5, pc}
	nop
_02204724: .word _02110A0C
	thumb_func_end ov01_022046E8

	thumb_func_start ov01_02204728
ov01_02204728: ; 0x02204728
	mov r3, #0
	str r3, [r0]
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r2, #0x7f
	strb r2, [r0, #0x18]
	mov r2, #1
	lsl r2, r2, #0xc
	str r2, [r0, #4]
	str r3, [r0, #0x14]
	ldr r3, _02204740 ; =ov01_022046E8
	bx r3
	.balign 4, 0
_02204740: .word ov01_022046E8
	thumb_func_end ov01_02204728

	thumb_func_start ov01_02204744
ov01_02204744: ; 0x02204744
	push {r4, lr}
	mov r1, #0x78
	bl Heap_Alloc
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x78
	bl MIi_CpuClearFast
	bl GF_RTC_GetTimeOfDay
	str r0, [r4]
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_02204744

	thumb_func_start ov01_02204764
ov01_02204764: ; 0x02204764
	ldr r3, _02204768 ; =Heap_Free
	bx r3
	.balign 4, 0
_02204768: .word Heap_Free
	thumb_func_end ov01_02204764

	thumb_func_start ov01_0220476C
ov01_0220476C: ; 0x0220476C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r1, [r5, #4]
	add r4, r2, #0
	add r6, r3, #0
	cmp r1, #4
	bge _022047D4
	mov r0, #0x1c
	mul r0, r1
	add r0, r5, r0
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0220478C
	bl GF_AssertFail
_0220478C:
	cmp r6, #4
	ble _02204794
	bl GF_AssertFail
_02204794:
	ldr r2, [r5, #4]
	add r1, r5, #0
	mov r0, #0x1c
	add r1, #8
	mul r0, r2
	mov r3, #1
	add r2, r1, r0
	str r3, [r1, r0]
	str r6, [r2, #4]
	cmp r6, #4
	ble _022047AE
	mov r0, #4
	str r0, [r2, #4]
_022047AE:
	ldr r1, [r2, #4]
	mov r0, #0
	cmp r1, #0
	ble _022047CA
_022047B6:
	lsl r1, r0, #2
	ldr r3, [r4, r1]
	add r1, r2, r1
	add r0, r0, #1
	str r3, [r1, #8]
	lsl r0, r0, #0x18
	ldr r1, [r2, #4]
	lsr r0, r0, #0x18
	cmp r0, r1
	blt _022047B6
_022047CA:
	str r7, [r2, #0x18]
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_022047D4:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_0220476C

	thumb_func_start ov01_022047DC
ov01_022047DC: ; 0x022047DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl GF_RTC_GetTimeOfDay
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [r5]
	cmp r0, r7
	beq _0220482E
	lsl r0, r0, #0x18
	add r4, r5, #0
	lsr r0, r0, #0x18
	str r7, [r5]
	mov r6, #0
	add r4, #8
	str r0, [sp]
_022047FC:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02204824
	ldr r2, _02204830 ; =ov01_022095EC
	ldr r1, [sp]
	ldr r0, [r4, #0x18]
	ldrb r1, [r2, r1]
	lsl r1, r1, #2
	add r1, r1, r4
	ldr r1, [r1, #8]
	bl ov01_02204518
	ldr r1, _02204830 ; =ov01_022095EC
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, r7]
	lsl r1, r1, #2
	add r1, r1, r4
	ldr r1, [r1, #8]
	bl ov01_0220450C
_02204824:
	add r6, r6, #1
	add r5, #0x1c
	add r4, #0x1c
	cmp r6, #4
	blt _022047FC
_0220482E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02204830: .word ov01_022095EC
	thumb_func_end ov01_022047DC

	thumb_func_start ov01_02204834
ov01_02204834: ; 0x02204834
	ldr r1, [r0]
	ldr r0, _0220483C ; =ov01_022095EC
	ldrb r0, [r0, r1]
	bx lr
	.balign 4, 0
_0220483C: .word ov01_022095EC
	thumb_func_end ov01_02204834

	.rodata

ov01_022095EC: ; 0x022095EC
	.byte 0, 1, 2, 3, 3

