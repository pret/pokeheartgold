#include "constants/items.h"
#include "constants/moves.h"
	.include "macros.inc"
	.include "unk_020773AC.inc"
	.include "global.inc"

	.text

	.extern sub_02077584
	.extern sub_020775AC

	thumb_func_start sub_020775C4
sub_020775C4: ; 0x020775C4
	push {r3}
	sub sp, #0xc
	add r1, sp, #0
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	mov r1, #0x56
	lsl r1, r1, #4
	str r2, [sp]
	str r2, [sp, #8]
	str r1, [sp, #4]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r2, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #4]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r1, [r0, #0x20]
	ldr r2, [sp, #8]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	add r1, r2, r1
	str r1, [r0, #0x30]
	add sp, #0xc
	pop {r3}
	bx lr
	thumb_func_end sub_020775C4

	thumb_func_start sub_02077604
sub_02077604: ; 0x02077604
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x10
	bl Heap_Alloc
	add r4, r0, #0
	bne _02077618
	bl GF_AssertFail
_02077618:
	ldr r0, [r5]
	ldr r2, [r5, #4]
	mov r1, #0x77
	str r0, [r4]
	str r2, [r4, #4]
	ldr r0, [r4]
	bl sub_02077584
	mov r1, #1
	str r0, [r4, #0xc]
	bl sub_02015528
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02077604

	thumb_func_start sub_02077634
sub_02077634: ; 0x02077634
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r2, _0207764C ; =sub_020775C4
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02015528
	pop {r4, pc}
	.balign 4, 0
_0207764C: .word sub_020775C4
	thumb_func_end sub_02077634

	thumb_func_start sub_02077650
sub_02077650: ; 0x02077650
	push {r3, lr}
	ldr r0, [r0, #0xc]
	bl sub_020154B0
	cmp r0, #0
	beq _02077660
	mov r0, #1
	pop {r3, pc}
_02077660:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02077650

	thumb_func_start sub_02077664
sub_02077664: ; 0x02077664
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_020775AC
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02077664
