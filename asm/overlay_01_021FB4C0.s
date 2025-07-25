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
	.include "overlay_01_021FB4C0.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FB4C0
ov01_021FB4C0: ; 0x021FB4C0
	push {r4, lr}
	mov r1, #0x1c
	bl Heap_Alloc
	add r4, r0, #0
	bl ov01_021FB55C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB4C0

	thumb_func_start ov01_021FB4D4
ov01_021FB4D4: ; 0x021FB4D4
	push {r4, lr}
	add r4, r0, #0
	beq _021FB4F0
	ldr r1, [r4]
	cmp r1, #1
	bne _021FB4E4
	bl ov01_021FB514
_021FB4E4:
	add r0, r4, #0
	bl ov01_021FB55C
	add r0, r4, #0
	bl Heap_Free
_021FB4F0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB4D4

	thumb_func_start ov01_021FB4F4
ov01_021FB4F4: ; 0x021FB4F4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021FB510 ; =ov01_021FB594
	add r1, r4, #0
	bl Main_SetHBlankIntrCB
	cmp r0, #1
	beq _021FB508
	bl GF_AssertFail
_021FB508:
	mov r0, #1
	str r0, [r4]
	pop {r4, pc}
	nop
_021FB510: .word ov01_021FB594
	thumb_func_end ov01_021FB4F4

	thumb_func_start ov01_021FB514
ov01_021FB514: ; 0x021FB514
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetHBlankIntrCB
	cmp r0, #1
	beq _021FB528
	bl GF_AssertFail
_021FB528:
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB514

	thumb_func_start ov01_021FB530
ov01_021FB530: ; 0x021FB530
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl ov01_021FB5B4
	add r4, r0, #0
	bne _021FB542
	bl GF_AssertFail
_021FB542:
	cmp r4, #0
	beq _021FB54E
	str r6, [r4, #4]
	str r5, [r4, #8]
	mov r0, #1
	str r0, [r4]
_021FB54E:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB530

	thumb_func_start ov01_021FB554
ov01_021FB554: ; 0x021FB554
	ldr r3, _021FB558 ; =ov01_021FB584
	bx r3
	.balign 4, 0
_021FB558: .word ov01_021FB584
	thumb_func_end ov01_021FB554

	thumb_func_start ov01_021FB55C
ov01_021FB55C: ; 0x021FB55C
	push {r3, r4, r5, lr}
	add r3, r0, #0
	mov r2, #0x1c
	mov r1, #0
_021FB564:
	strb r1, [r3]
	add r3, r3, #1
	sub r2, r2, #1
	bne _021FB564
	mov r4, #0
	str r4, [r0]
	add r5, r0, #4
_021FB572:
	add r0, r5, #0
	bl ov01_021FB584
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #2
	blt _021FB572
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB55C

	thumb_func_start ov01_021FB584
ov01_021FB584: ; 0x021FB584
	mov r2, #0
	ldr r1, _021FB590 ; =ov01_021FB5B0
	str r2, [r0]
	str r1, [r0, #8]
	str r2, [r0, #4]
	bx lr
	.balign 4, 0
_021FB590: .word ov01_021FB5B0
	thumb_func_end ov01_021FB584

	thumb_func_start ov01_021FB594
ov01_021FB594: ; 0x021FB594
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #4
_021FB59C:
	ldr r1, [r5, #8]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	blx r2
	add r6, r6, #1
	add r5, #0xc
	add r4, #0xc
	cmp r6, #2
	blt _021FB59C
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021FB594

	thumb_func_start ov01_021FB5B0
ov01_021FB5B0: ; 0x021FB5B0
	bx lr
	.balign 4, 0
	thumb_func_end ov01_021FB5B0

	thumb_func_start ov01_021FB5B4
ov01_021FB5B4: ; 0x021FB5B4
	mov r2, #0
	add r3, r0, #0
_021FB5B8:
	ldr r1, [r3, #4]
	cmp r1, #0
	bne _021FB5C8
	add r1, r0, #4
	mov r0, #0xc
	mul r0, r2
	add r0, r1, r0
	bx lr
_021FB5C8:
	add r2, r2, #1
	add r3, #0xc
	cmp r2, #2
	blt _021FB5B8
	mov r0, #0
	bx lr
	thumb_func_end ov01_021FB5B4
