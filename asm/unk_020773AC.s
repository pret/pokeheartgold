#include "constants/items.h"
#include "constants/moves.h"
	.include "macros.inc"
	.include "unk_020773AC.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020774A0
sub_020774A0: ; 0x020774A0
	push {r3, r4, r5, lr}
	ldr r3, _020774D8 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, #2
	mov r1, #0
	ldr r3, [r3]
	lsl r0, r0, #0xe
	add r2, r1, #0
	blx r3
	ldr r3, _020774DC ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r1, #0
	add r4, r0, #0
	ldr r3, [r3]
	mov r0, #0xa0
	add r2, r1, #0
	blx r3
	add r5, r0, #0
	cmp r4, #0
	bne _020774C8
	bl GF_AssertFail
_020774C8:
	cmp r5, #0
	bne _020774D0
	bl GF_AssertFail
_020774D0:
	bl sub_02014DA0
	pop {r3, r4, r5, pc}
	nop
_020774D8: .word NNS_GfdDefaultFuncAllocTexVram
_020774DC: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end sub_020774A0

	thumb_func_start sub_020774E0
sub_020774E0: ; 0x020774E0
	push {r3, lr}
	bl Thunk_G3X_Reset
	bl sub_0201543C
	cmp r0, #0
	ble _020774F6
	bl Thunk_G3X_Reset
	bl NNS_G2dSetupSoftwareSpriteCamera
_020774F6:
	bl sub_02015460
	mov r0, #1
	mov r1, #0
	bl RequestSwap3DBuffers
	pop {r3, pc}
	thumb_func_end sub_020774E0

	thumb_func_start sub_02077504
sub_02077504: ; 0x02077504
	push {r4, lr}
	ldr r3, _0207751C ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015354
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_0207751C: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end sub_02077504

	thumb_func_start sub_02077520
sub_02077520: ; 0x02077520
	push {r4, lr}
	ldr r3, _02077538 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_02077538: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end sub_02077520

	thumb_func_start sub_0207753C
sub_0207753C: ; 0x0207753C
	push {r4, lr}
	sub sp, #8
	mov r1, #0x12
	lsl r1, r1, #0xa
	add r4, r0, #0
	bl Heap_Alloc
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #0x12
	ldr r0, _0207757C ; =sub_02077504
	ldr r1, _02077580 ; =sub_02077520
	lsl r3, r3, #0xa
	str r4, [sp, #4]
	bl sub_02014DB4
	add r4, r0, #0
	bl sub_02015524
	add r2, r0, #0
	beq _02077574
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl Camera_SetPerspectiveClippingPlane
_02077574:
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	nop
_0207757C: .word sub_02077504
_02077580: .word sub_02077520
	thumb_func_end sub_0207753C

	thumb_func_start sub_02077584
sub_02077584: ; 0x02077584
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl sub_0207753C
	add r4, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	bl sub_02015264
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02077584

	thumb_func_start sub_020775AC
sub_020775AC: ; 0x020775AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020154D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02014EBC
	add r0, r4, #0
	bl Heap_Free
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020775AC

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
