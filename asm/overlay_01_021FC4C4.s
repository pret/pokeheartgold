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
	.include "overlay_01_021FC4C4.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FC4C4
ov01_021FC4C4: ; 0x021FC4C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r2, #0
	lsl r2, r3, #3
	add r6, r5, r2
	add r6, #0x18
	str r2, [sp, #8]
	add r2, r6, #0
	str r0, [sp]
	add r7, r1, #0
	str r3, [sp, #4]
	bl CreateHeap
	cmp r0, #1
	beq _021FC4E6
	bl GF_AssertFail
_021FC4E6:
	sub r5, r6, r5
	add r0, r7, #0
	add r1, r5, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _021FC4F8
	bl GF_AssertFail
_021FC4F8:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	ldr r0, [sp]
	str r0, [r4]
	ldr r0, [sp, #4]
	str r7, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [sp, #8]
	str r6, [r4, #0xc]
	str r0, [r4, #0x10]
	add r0, r4, #0
	add r0, #0x18
	str r0, [r4, #0x14]
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC4C4

	thumb_func_start ov01_021FC520
ov01_021FC520: ; 0x021FC520
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r4, [r6, #8]
	ldr r5, [r6, #0x14]
	cmp r4, #0
	beq _021FC542
_021FC52C:
	ldr r0, [r5]
	cmp r0, #0
	beq _021FC53A
	ldr r1, [r5, #4]
	add r0, r6, #0
	bl ov01_021FC588
_021FC53A:
	sub r4, r4, #1
	add r5, #8
	cmp r4, #0
	bne _021FC52C
_021FC542:
	ldr r4, [r6, #4]
	add r0, r6, #0
	bl Heap_Free
	add r0, r4, #0
	bl DestroyHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC520

	thumb_func_start ov01_021FC554
ov01_021FC554: ; 0x021FC554
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov01_021FC644
	str r0, [sp]
	cmp r0, #0
	bne _021FC56C
	bl GF_AssertFail
_021FC56C:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov01_021FC5FC
	add r5, r0, #0
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r5, #0
	bl ov01_021FC65C
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC554

	thumb_func_start ov01_021FC588
ov01_021FC588: ; 0x021FC588
	push {r4, lr}
	bl ov01_021FC624
	add r4, r0, #0
	bne _021FC596
	bl GF_AssertFail
_021FC596:
	ldr r0, [r4]
	bl ov01_021FC61C
	add r0, r4, #0
	bl ov01_021FC664
	pop {r4, pc}
	thumb_func_end ov01_021FC588

	thumb_func_start ov01_021FC5A4
ov01_021FC5A4: ; 0x021FC5A4
	push {r4, lr}
	bl ov01_021FC624
	add r4, r0, #0
	bne _021FC5B2
	bl GF_AssertFail
_021FC5B2:
	ldr r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC5A4

	thumb_func_start ov01_021FC5B8
ov01_021FC5B8: ; 0x021FC5B8
	push {r3, lr}
	bl ov01_021FC624
	cmp r0, #0
	beq _021FC5C6
	mov r0, #1
	pop {r3, pc}
_021FC5C6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC5B8

	thumb_func_start ov01_021FC5CC
ov01_021FC5CC: ; 0x021FC5CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r7, r3, #0
	add r6, r1, #0
	add r0, r4, #0
	add r1, r7, #0
	bl NARC_GetMemberSize
	add r2, r0, #0
	ldr r3, [sp, #0x18]
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021FC554
	add r5, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl NARC_ReadWholeMember
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov01_021FC5CC

	thumb_func_start ov01_021FC5FC
ov01_021FC5FC: ; 0x021FC5FC
	push {r4, lr}
	cmp r2, #0
	ldr r0, [r0, #4]
	bne _021FC60A
	bl AllocFromHeap
	b _021FC60E
_021FC60A:
	bl AllocFromHeapAtEnd
_021FC60E:
	add r4, r0, #0
	cmp r4, #0
	bne _021FC618
	bl GF_AssertFail
_021FC618:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov01_021FC5FC

	thumb_func_start ov01_021FC61C
ov01_021FC61C: ; 0x021FC61C
	ldr r3, _021FC620 ; =Heap_Free
	bx r3
	.balign 4, 0
_021FC620: .word Heap_Free
	thumb_func_end ov01_021FC61C

	thumb_func_start ov01_021FC624
ov01_021FC624: ; 0x021FC624
	ldr r3, [r0, #8]
	ldr r0, [r0, #0x14]
	cmp r3, #0
	beq _021FC63E
_021FC62C:
	ldr r2, [r0]
	cmp r2, #0
	beq _021FC638
	ldr r2, [r0, #4]
	cmp r2, r1
	beq _021FC640
_021FC638:
	add r0, #8
	sub r3, r3, #1
	bne _021FC62C
_021FC63E:
	mov r0, #0
_021FC640:
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FC624

	thumb_func_start ov01_021FC644
ov01_021FC644: ; 0x021FC644
	ldr r2, [r0, #8]
	ldr r0, [r0, #0x14]
	cmp r2, #0
	beq _021FC658
_021FC64C:
	ldr r1, [r0]
	cmp r1, #0
	beq _021FC65A
	add r0, #8
	sub r2, r2, #1
	bne _021FC64C
_021FC658:
	mov r0, #0
_021FC65A:
	bx lr
	thumb_func_end ov01_021FC644

	thumb_func_start ov01_021FC65C
ov01_021FC65C: ; 0x021FC65C
	str r2, [r0]
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FC65C

	thumb_func_start ov01_021FC664
ov01_021FC664: ; 0x021FC664
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov01_021FC664
