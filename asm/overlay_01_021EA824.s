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
	.include "overlay_01_021EA824.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021EA824
ov01_021EA824: ; 0x021EA824
	push {r4, lr}
	mov r0, #4
	mov r1, #0x38
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x38
	bl MIi_CpuClear32
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA824

	thumb_func_start ov01_021EA840
ov01_021EA840: ; 0x021EA840
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl Heap_FreeExplicit
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA840

	thumb_func_start ov01_021EA854
ov01_021EA854: ; 0x021EA854
	ldr r0, [r0]
	bx lr
	thumb_func_end ov01_021EA854

	thumb_func_start ov01_021EA858
ov01_021EA858: ; 0x021EA858
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov01_021EA858

	thumb_func_start ov01_021EA85C
ov01_021EA85C: ; 0x021EA85C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov01_021EA85C

	thumb_func_start ov01_021EA860
ov01_021EA860: ; 0x021EA860
	ldrh r0, [r0, #0x10]
	bx lr
	thumb_func_end ov01_021EA860

	thumb_func_start ov01_021EA864
ov01_021EA864: ; 0x021EA864
	push {r4, lr}
	add r4, r0, #0
	mov r0, #1
	tst r0, r1
	beq _021EA870
	str r2, [r4]
_021EA870:
	mov r0, #2
	tst r0, r1
	beq _021EA878
	str r3, [r4, #4]
_021EA878:
	mov r0, #4
	tst r0, r1
	beq _021EA882
	ldr r0, [sp, #8]
	str r0, [r4, #8]
_021EA882:
	mov r0, #8
	tst r0, r1
	beq _021EA88C
	ldr r0, [sp, #0xc]
	str r0, [r4, #0xc]
_021EA88C:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl G3X_SetFog
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA864

	thumb_func_start ov01_021EA89C
ov01_021EA89C: ; 0x021EA89C
	push {r3, r4}
	mov r4, #0x10
	tst r4, r1
	beq _021EA8A6
	strh r2, [r0, #0x10]
_021EA8A6:
	mov r2, #0x20
	tst r1, r2
	beq _021EA8AE
	str r3, [r0, #0x14]
_021EA8AE:
	ldrh r1, [r0, #0x10]
	ldr r0, [r0, #0x14]
	lsl r0, r0, #0x10
	orr r1, r0
	ldr r0, _021EA8C0 ; =0x04000358
	str r1, [r0]
	pop {r3, r4}
	bx lr
	nop
_021EA8C0: .word 0x04000358
	thumb_func_end ov01_021EA89C

	thumb_func_start ov01_021EA8C4
ov01_021EA8C4: ; 0x021EA8C4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	add r1, #0x18
	mov r2, #0x20
	bl MIi_CpuCopy32
	add r4, #0x18
	add r0, r4, #0
	bl G3X_SetFogTable
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EA8C4
