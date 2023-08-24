#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "unk_02061284.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02061284
sub_02061284: ; 0x02061284
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #8
	add r5, r0, #0
	bl sub_0205F370
	add r4, r0, #0
	mov r1, #0
	ldr r0, _020612B0 ; =_020FD7B8
	mvn r1, r1
	bl sub_02061E20
	strh r0, [r4, #2]
	add r0, r5, #0
	mov r1, #0
	str r6, [r4, #4]
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020612B0: .word _020FD7B8
	thumb_func_end sub_02061284

	thumb_func_start sub_020612B4
sub_020612B4: ; 0x020612B4
	ldr r3, _020612BC ; =sub_02061284
	mov r1, #0
	bx r3
	nop
_020612BC: .word sub_02061284
	thumb_func_end sub_020612B4

	thumb_func_start sub_020612C0
sub_020612C0: ; 0x020612C0
	ldr r3, _020612C8 ; =sub_02061284
	mov r1, #1
	bx r3
	nop
_020612C8: .word sub_02061284
	thumb_func_end sub_020612C0

	thumb_func_start sub_020612CC
sub_020612CC: ; 0x020612CC
	ldr r3, _020612D4 ; =sub_02061284
	mov r1, #2
	bx r3
	nop
_020612D4: .word sub_02061284
	thumb_func_end sub_020612CC

	thumb_func_start sub_020612D8
sub_020612D8: ; 0x020612D8
	ldr r3, _020612E0 ; =sub_02061284
	mov r1, #3
	bx r3
	nop
_020612E0: .word sub_02061284
	thumb_func_end sub_020612D8

	thumb_func_start sub_020612E4
sub_020612E4: ; 0x020612E4
	ldr r3, _020612EC ; =sub_02061284
	mov r1, #4
	bx r3
	nop
_020612EC: .word sub_02061284
	thumb_func_end sub_020612E4

	thumb_func_start sub_020612F0
sub_020612F0: ; 0x020612F0
	ldr r3, _020612F8 ; =sub_02061284
	mov r1, #5
	bx r3
	nop
_020612F8: .word sub_02061284
	thumb_func_end sub_020612F0

	thumb_func_start sub_020612FC
sub_020612FC: ; 0x020612FC
	ldr r3, _02061304 ; =sub_02061284
	mov r1, #6
	bx r3
	nop
_02061304: .word sub_02061284
	thumb_func_end sub_020612FC

	thumb_func_start sub_02061308
sub_02061308: ; 0x02061308
	ldr r3, _02061310 ; =sub_02061284
	mov r1, #7
	bx r3
	nop
_02061310: .word sub_02061284
	thumb_func_end sub_02061308

	thumb_func_start sub_02061314
sub_02061314: ; 0x02061314
	ldr r3, _0206131C ; =sub_02061284
	mov r1, #8
	bx r3
	nop
_0206131C: .word sub_02061284
	thumb_func_end sub_02061314

	thumb_func_start sub_02061320
sub_02061320: ; 0x02061320
	ldr r3, _02061328 ; =sub_02061284
	mov r1, #9
	bx r3
	nop
_02061328: .word sub_02061284
	thumb_func_end sub_02061320

	thumb_func_start sub_0206132C
sub_0206132C: ; 0x0206132C
	ldr r3, _02061334 ; =sub_02061284
	mov r1, #0xa
	bx r3
	nop
_02061334: .word sub_02061284
	thumb_func_end sub_0206132C

	thumb_func_start sub_02061338
sub_02061338: ; 0x02061338
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	mov r2, #0
	ldr r1, [r4, #4]
	add r0, r5, #0
	mvn r2, r2
	bl sub_02061F5C
	mov r2, #0
	add r1, r0, #0
	mvn r2, r2
	cmp r1, r2
	beq _02061360
	add r0, r5, #0
	bl MapObject_SetFacingDirection
	b _02061390
_02061360:
	ldrh r0, [r4]
	cmp r0, #0
	bne _02061390
	mov r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bgt _02061390
	ldr r0, _02061398 ; =_020FD7B8
	add r1, r2, #0
	bl sub_02061E20
	strh r0, [r4, #2]
	mov r1, #0
	ldr r0, [r4, #4]
	mvn r1, r1
	bl sub_02061E44
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_SetFacingDirection
_02061390:
	add r0, r5, #0
	bl sub_02060F78
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02061398: .word _020FD7B8
	thumb_func_end sub_02061338

	thumb_func_start sub_0206139C
sub_0206139C: ; 0x0206139C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0206139C

	thumb_func_start sub_020613A0
sub_020613A0: ; 0x020613A0
	push {r3, lr}
	mov r1, #0xc
	mov r2, #0xb
	mov r3, #0
	bl sub_020613D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020613A0

	thumb_func_start sub_020613B0
sub_020613B0: ; 0x020613B0
	push {r3, lr}
	mov r1, #0xc
	add r2, r1, #0
	mov r3, #0
	bl sub_020613D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020613B0

	thumb_func_start sub_020613C0
sub_020613C0: ; 0x020613C0
	push {r3, lr}
	mov r1, #0xc
	mov r2, #0xd
	mov r3, #0
	bl sub_020613D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020613C0

	thumb_func_start sub_020613D0
sub_020613D0: ; 0x020613D0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r3, #0
	mov r1, #0x10
	add r5, r0, #0
	add r6, r2, #0
	bl sub_0205F370
	str r7, [r0, #4]
	str r4, [r0, #8]
	str r6, [r0, #0xc]
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020613D0

	thumb_func_start sub_020613F8
sub_020613F8: ; 0x020613F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	mov r0, #0
	ldrsh r0, [r4, r0]
	cmp r0, #4
	bhi _020614EE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02061416: ; jump table
	.short _02061420 - _02061416 - 2 ; case 0
	.short _0206144A - _02061416 - 2 ; case 1
	.short _02061468 - _02061416 - 2 ; case 2
	.short _0206147E - _02061416 - 2 ; case 3
	.short _020614DA - _02061416 - 2 ; case 4
_02061420:
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl MapObject_ClearFlag3
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_0206144A:
	add r0, r5, #0
	bl sub_02062428
	cmp r0, #0
	beq _020614EE
	mov r1, #0
	ldr r0, _020614F0 ; =_020FD7B8
	mvn r1, r1
	bl sub_02061E20
	strh r0, [r4, #2]
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
_02061468:
	mov r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _020614EE
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
_0206147E:
	mov r1, #0
	ldr r0, [r4, #0xc]
	mvn r1, r1
	bl sub_02061E44
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_SetOrQueueFacing
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _020614AA
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020615F0
	cmp r0, #0
	bne _020614AA
	mov r0, #0
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_020614AA:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02060BB8
	cmp r0, #0
	beq _020614BC
	mov r0, #0
	strh r0, [r4]
	pop {r4, r5, r6, pc}
_020614BC:
	ldr r1, [r4, #8]
	add r0, r6, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
	add r0, r5, #0
	bl MapObject_SingleMovementSetActive
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4]
_020614DA:
	add r0, r5, #0
	bl sub_02062428
	cmp r0, #0
	beq _020614EE
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	mov r0, #0
	strh r0, [r4]
_020614EE:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020614F0: .word _020FD7B8
	thumb_func_end sub_020613F8

	thumb_func_start sub_020614F4
sub_020614F4: ; 0x020614F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r4, r1, #0
	bl MapObject_GetInitialX
	add r6, r0, #0
	ldr r0, [sp]
	bl MapObject_GetInitialY
	add r5, r0, #0
	ldr r0, [sp]
	bl MapObject_GetXRange
	add r7, r0, #0
	ldr r0, [sp]
	bl MapObject_GetYRange
	str r0, [sp, #4]
	ldr r0, [sp]
	bl MapObject_GetMovement
	cmp r0, #0xd
	bhi _020615E8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02061530: ; jump table
	.short _020615E8 - _02061530 - 2 ; case 0
	.short _020615E8 - _02061530 - 2 ; case 1
	.short _020615E8 - _02061530 - 2 ; case 2
	.short _020615E8 - _02061530 - 2 ; case 3
	.short _020615E8 - _02061530 - 2 ; case 4
	.short _020615E8 - _02061530 - 2 ; case 5
	.short _0206154C - _02061530 - 2 ; case 6
	.short _0206155E - _02061530 - 2 ; case 7
	.short _02061570 - _02061530 - 2 ; case 8
	.short _02061582 - _02061530 - 2 ; case 9
	.short _02061594 - _02061530 - 2 ; case 10
	.short _020615AA - _02061530 - 2 ; case 11
	.short _020615C0 - _02061530 - 2 ; case 12
	.short _020615D4 - _02061530 - 2 ; case 13
_0206154C:
	sub r0, r6, r7
	str r0, [r4]
	ldr r0, [sp, #4]
	str r6, [r4, #8]
	sub r0, r5, r0
	str r0, [r4, #4]
	add sp, #8
	str r5, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0206155E:
	str r6, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	add sp, #8
	sub r0, r5, r0
	str r0, [r4, #4]
	str r5, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02061570:
	sub r0, r6, r7
	str r0, [r4]
	ldr r0, [sp, #4]
	str r6, [r4, #8]
	str r5, [r4, #4]
	add r0, r5, r0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02061582:
	str r6, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	str r5, [r4, #4]
	add r0, r5, r0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_02061594:
	sub r0, r6, r7
	str r0, [r4]
	ldr r0, [sp, #4]
	str r6, [r4, #8]
	sub r0, r5, r0
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	add sp, #8
	add r0, r5, r0
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615AA:
	str r6, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	sub r0, r5, r0
	str r0, [r4, #4]
	ldr r0, [sp, #4]
	add sp, #8
	add r0, r5, r0
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615C0:
	sub r0, r6, r7
	str r0, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	add sp, #8
	sub r0, r5, r0
	str r0, [r4, #4]
	str r5, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615D4:
	sub r0, r6, r7
	str r0, [r4]
	add r0, r6, r7
	str r0, [r4, #8]
	ldr r0, [sp, #4]
	str r5, [r4, #4]
	add r0, r5, r0
	add sp, #8
	str r0, [r4, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_020615E8:
	bl GF_AssertFail
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020614F4

	thumb_func_start sub_020615F0
sub_020615F0: ; 0x020615F0
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r0, #0
	add r1, sp, #0
	bl sub_020614F4
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r6, #0
	bl GetDeltaXByFacingDirection
	add r4, r4, r0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r5, r0, #0
	add r0, r6, #0
	bl GetDeltaYByFacingDirection
	add r1, r5, r0
	ldr r0, [sp]
	cmp r0, r4
	bgt _0206162A
	ldr r0, [sp, #8]
	cmp r0, r4
	bge _02061630
_0206162A:
	add sp, #0x10
	mov r0, #0
	pop {r4, r5, r6, pc}
_02061630:
	ldr r0, [sp, #4]
	cmp r0, r1
	bgt _0206163C
	ldr r0, [sp, #0xc]
	cmp r0, r1
	bge _02061642
_0206163C:
	add sp, #0x10
	mov r0, #0
	pop {r4, r5, r6, pc}
_02061642:
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020615F0

	thumb_func_start sub_02061648
sub_02061648: ; 0x02061648
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #8
	bl sub_0205F370
	str r4, [r0]
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl sub_02060F78
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02061648

	thumb_func_start sub_0206166C
sub_0206166C: ; 0x0206166C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02061680
	cmp r0, #1
	pop {r3, r4, r5, pc}
_02061680:
	ldr r1, [r4]
	add r0, r5, #0
	bl MapObject_SetFacingDirection
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206166C

	thumb_func_start sub_02061690
sub_02061690: ; 0x02061690
	ldr r3, _02061698 ; =sub_02061648
	mov r1, #0
	bx r3
	nop
_02061698: .word sub_02061648
	thumb_func_end sub_02061690

	thumb_func_start sub_0206169C
sub_0206169C: ; 0x0206169C
	ldr r3, _020616A4 ; =sub_02061648
	mov r1, #1
	bx r3
	nop
_020616A4: .word sub_02061648
	thumb_func_end sub_0206169C

	thumb_func_start sub_020616A8
sub_020616A8: ; 0x020616A8
	ldr r3, _020616B0 ; =sub_02061648
	mov r1, #2
	bx r3
	nop
_020616B0: .word sub_02061648
	thumb_func_end sub_020616A8

	thumb_func_start sub_020616B4
sub_020616B4: ; 0x020616B4
	ldr r3, _020616BC ; =sub_02061648
	mov r1, #3
	bx r3
	nop
_020616BC: .word sub_02061648
	thumb_func_end sub_020616B4

	thumb_func_start sub_020616C0
sub_020616C0: ; 0x020616C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #8
	bl sub_0205F370
	strb r4, [r0]
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl sub_02060F78
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020616C0

	thumb_func_start sub_020616E4
sub_020616E4: ; 0x020616E4
	ldr r3, _020616EC ; =sub_020616C0
	mov r1, #2
	bx r3
	nop
_020616EC: .word sub_020616C0
	thumb_func_end sub_020616E4

	thumb_func_start sub_020616F0
sub_020616F0: ; 0x020616F0
	ldr r3, _020616F8 ; =sub_020616C0
	mov r1, #3
	bx r3
	nop
_020616F8: .word sub_020616C0
	thumb_func_end sub_020616F0

	thumb_func_start sub_020616FC
sub_020616FC: ; 0x020616FC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _0206171C ; =_020FD5D0
	add r4, r0, #0
	mov r7, #2
_0206170A:
	ldrsb r2, [r4, r7]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _0206170A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206171C: .word _020FD5D0
	thumb_func_end sub_020616FC

	thumb_func_start sub_02061720
sub_02061720: ; 0x02061720
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x26
	add r2, r1, #0
	sub r2, #0x27
	add r5, r0, #0
	bl sub_02061F5C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _0206173E
	add r0, r5, #0
	bl MapObject_GetFacingDirection
_0206173E:
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
	mov r0, #1
	strb r0, [r4, #2]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061720

	thumb_func_start sub_02061754
sub_02061754: ; 0x02061754
	push {r4, lr}
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #0
	bne _02061764
	mov r0, #0
	pop {r4, pc}
_02061764:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #2
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02061754

	thumb_func_start sub_02061770
sub_02061770: ; 0x02061770
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02061794
	mov r1, #0x26
	add r2, r1, #0
	sub r2, #0x27
	bl sub_02061F5C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02061794
	mov r0, #0
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
_02061794:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #0x18
	bge _020617A2
	mov r0, #0
	pop {r4, pc}
_020617A2:
	mov r0, #3
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02061770

	thumb_func_start sub_020617AC
sub_020617AC: ; 0x020617AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r3, _0206183C ; =_020FD754
	add r2, sp, #0x14
	add r7, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r5, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r4, _02061840 ; =_020FD768
	str r0, [r2]
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	str r0, [r3]
	mov r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #2
	beq _020617E2
	add r5, r2, #0
_020617E2:
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	mov r4, #0
	ldr r2, [r5]
	sub r1, r4, #1
	cmp r2, r1
	beq _02061806
	add r1, r5, #0
	sub r2, r4, #1
_020617F6:
	ldr r3, [r1]
	cmp r0, r3
	beq _02061806
	add r1, r1, #4
	ldr r3, [r1]
	add r4, r4, #1
	cmp r3, r2
	bne _020617F6
_02061806:
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061816
	bl GF_AssertFail
_02061816:
	add r4, r4, #1
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061826
	mov r4, #0
_02061826:
	lsl r1, r4, #2
	ldr r1, [r5, r1]
	add r0, r7, #0
	bl MapObject_SetFacingDirection
	mov r0, #0
	strb r0, [r6, #2]
	mov r0, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206183C: .word _020FD754
_02061840: .word _020FD768
	thumb_func_end sub_020617AC

	thumb_func_start sub_02061844
sub_02061844: ; 0x02061844
	ldr r3, _0206184C ; =sub_020616C0
	mov r1, #3
	bx r3
	nop
_0206184C: .word sub_020616C0
	thumb_func_end sub_02061844

	thumb_func_start sub_02061850
sub_02061850: ; 0x02061850
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _02061870 ; =_020FD5A0
	add r4, r0, #0
	mov r7, #2
_0206185E:
	ldrsb r2, [r4, r7]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _0206185E
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02061870: .word _020FD5A0
	thumb_func_end sub_02061850

	thumb_func_start sub_02061874
sub_02061874: ; 0x02061874
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetFacingDirection
	mov r1, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
	mov r0, #1
	strb r0, [r4, #2]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061874

	thumb_func_start sub_02061894
sub_02061894: ; 0x02061894
	push {r4, lr}
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #0
	bne _020618A4
	mov r0, #0
	pop {r4, pc}
_020618A4:
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #2
	strb r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02061894

	thumb_func_start sub_020618B0
sub_020618B0: ; 0x020618B0
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	cmp r0, #0x18
	bge _020618BE
	mov r0, #0
	bx lr
_020618BE:
	mov r0, #3
	strb r0, [r1, #2]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_020618B0

	thumb_func_start sub_020618C8
sub_020618C8: ; 0x020618C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r3, _02061974 ; =_020FD77C
	add r2, sp, #0x14
	add r7, r0, #0
	add r6, r1, #0
	ldmia r3!, {r0, r1}
	add r5, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	ldr r3, _02061978 ; =_020FD7A4
	str r0, [r2]
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	add r4, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #2
	beq _020618FE
	add r5, r4, #0
_020618FE:
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	mov r4, #0
	ldr r2, [r5]
	sub r1, r4, #1
	cmp r2, r1
	beq _02061922
	add r1, r5, #0
	sub r2, r4, #1
_02061912:
	ldr r3, [r1]
	cmp r0, r3
	beq _02061922
	add r1, r1, #4
	ldr r3, [r1]
	add r4, r4, #1
	cmp r3, r2
	bne _02061912
_02061922:
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061932
	bl GF_AssertFail
_02061932:
	add r4, r4, #1
	lsl r0, r4, #2
	ldr r1, [r5, r0]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02061942
	mov r4, #0
_02061942:
	lsl r1, r4, #2
	ldr r1, [r5, r1]
	add r0, r7, #0
	bl MapObject_SetFacingDirection
	add r0, r7, #0
	bl MapObject_GetFacingDirection
	add r4, r0, #0
	add r0, r7, #0
	bl MapObject_GetInitialFacing
	cmp r4, r0
	bne _02061968
	mov r0, #0
	ldrsb r0, [r6, r0]
	bl sub_020611F4
	strb r0, [r6]
_02061968:
	mov r0, #0
	strb r0, [r6, #2]
	mov r0, #1
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02061974: .word _020FD77C
_02061978: .word _020FD7A4
	thumb_func_end sub_020618C8

	thumb_func_start sub_0206197C
sub_0206197C: ; 0x0206197C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #8
	bl sub_0205F370
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _0206199A
	add r0, r5, #0
	add r1, r4, #4
	bl sub_02062064
_0206199A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206197C

	thumb_func_start sub_0206199C
sub_0206199C: ; 0x0206199C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _020619BC ; =_020FD548
	add r4, r0, #0
	mov r7, #0
_020619AA:
	ldrsh r2, [r4, r7]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _020619AA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020619BC: .word _020FD548
	thumb_func_end sub_0206199C

	thumb_func_start sub_020619C0
sub_020619C0: ; 0x020619C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetInitialFacing
	mov r1, #2
	ldrsh r1, [r4, r1]
	add r6, r0, #0
	cmp r1, #1
	bne _020619DA
	bl sub_020611F4
	add r6, r0, #0
_020619DA:
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #0
	bne _020619F4
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_SetFacingDirection
_020619F4:
	mov r0, #1
	strh r0, [r4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020619C0

	thumb_func_start sub_020619FC
sub_020619FC: ; 0x020619FC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #2
	ldrsh r1, [r6, r1]
	add r5, r0, #0
	cmp r1, #0
	beq _02061A5A
	bl MapObject_GetInitialX
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetInitialY
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	cmp r7, r4
	bne _02061A5A
	ldr r1, [sp]
	cmp r1, r0
	bne _02061A5A
	add r0, r5, #0
	bl MapObject_GetNextFacing
	bl sub_020611F4
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetNextFacing
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #0
	bne _02061A56
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetFacingDirection
_02061A56:
	mov r0, #0
	strh r0, [r6, #2]
_02061A5A:
	add r0, r5, #0
	bl MapObject_GetNextFacing
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060BB8
	mov r1, #1
	add r2, r0, #0
	tst r2, r1
	beq _02061A84
	add r0, r4, #0
	strh r1, [r6, #2]
	bl sub_020611F4
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060BB8
_02061A84:
	mov r1, #0xc
	cmp r0, #0
	beq _02061A8C
	mov r1, #0x20
_02061A8C:
	add r0, r4, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061AAC
	add r0, r5, #0
	add r1, r6, #4
	bl sub_0206207C
_02061AAC:
	add r0, r5, #0
	bl MapObject_SingleMovementSetActive
	mov r0, #2
	strh r0, [r6]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020619FC

	thumb_func_start sub_02061ABC
sub_02061ABC: ; 0x02061ABC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02061AE6
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061AE2
	add r0, r5, #0
	add r1, r4, #4
	bl sub_020620F8
_02061AE2:
	mov r0, #0
	strh r0, [r4]
_02061AE6:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02061ABC

	thumb_func_start sub_02061AEC
sub_02061AEC: ; 0x02061AEC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0xc
	add r5, r0, #0
	add r7, r2, #0
	str r3, [sp]
	bl sub_0205F370
	add r4, r0, #0
	strb r6, [r4, #2]
	ldr r0, [sp]
	strb r7, [r4, #3]
	str r0, [r4, #4]
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061B1A
	add r4, #8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02062064
_02061B1A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02061AEC

	thumb_func_start sub_02061B1C
sub_02061B1C: ; 0x02061B1C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0xe
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B1C

	thumb_func_start sub_02061B2C
sub_02061B2C: ; 0x02061B2C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0xf
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B2C

	thumb_func_start sub_02061B3C
sub_02061B3C: ; 0x02061B3C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x10
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B3C

	thumb_func_start sub_02061B4C
sub_02061B4C: ; 0x02061B4C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x11
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B4C

	thumb_func_start sub_02061B5C
sub_02061B5C: ; 0x02061B5C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x12
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B5C

	thumb_func_start sub_02061B6C
sub_02061B6C: ; 0x02061B6C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x13
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B6C

	thumb_func_start sub_02061B7C
sub_02061B7C: ; 0x02061B7C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x14
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B7C

	thumb_func_start sub_02061B8C
sub_02061B8C: ; 0x02061B8C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x15
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B8C

	thumb_func_start sub_02061B9C
sub_02061B9C: ; 0x02061B9C
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x16
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061B9C

	thumb_func_start sub_02061BAC
sub_02061BAC: ; 0x02061BAC
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x17
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BAC

	thumb_func_start sub_02061BBC
sub_02061BBC: ; 0x02061BBC
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x18
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BBC

	thumb_func_start sub_02061BCC
sub_02061BCC: ; 0x02061BCC
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x19
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BCC

	thumb_func_start sub_02061BDC
sub_02061BDC: ; 0x02061BDC
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1a
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BDC

	thumb_func_start sub_02061BEC
sub_02061BEC: ; 0x02061BEC
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1b
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BEC

	thumb_func_start sub_02061BFC
sub_02061BFC: ; 0x02061BFC
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x1c
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061BFC

	thumb_func_start sub_02061C0C
sub_02061C0C: ; 0x02061C0C
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x1d
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061C0C

	thumb_func_start sub_02061C1C
sub_02061C1C: ; 0x02061C1C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _02061C3C ; =_020FD4EC
	add r4, r0, #0
_02061C28:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02061C28
	pop {r4, r5, r6, pc}
	nop
_02061C3C: .word _020FD4EC
	thumb_func_end sub_02061C1C

	thumb_func_start sub_02061C40
sub_02061C40: ; 0x02061C40
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrb r2, [r4, #1]
	ldrb r1, [r4, #2]
	add r6, r0, #0
	cmp r2, r1
	bne _02061C82
	ldrb r1, [r4, #3]
	cmp r1, #0
	bne _02061C6C
	bl MapObject_GetInitialX
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentX
	cmp r5, r0
	bne _02061C82
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	b _02061C82
_02061C6C:
	bl MapObject_GetInitialY
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	cmp r5, r0
	bne _02061C82
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02061C82:
	ldrb r0, [r4, #1]
	cmp r0, #3
	bne _02061CB4
	add r0, r6, #0
	bl MapObject_GetInitialX
	add r7, r0, #0
	add r0, r6, #0
	bl MapObject_GetInitialY
	str r0, [sp]
	add r0, r6, #0
	bl MapObject_GetCurrentX
	add r5, r0, #0
	add r0, r6, #0
	bl MapObject_GetCurrentY
	cmp r7, r5
	bne _02061CB4
	ldr r1, [sp]
	cmp r1, r0
	bne _02061CB4
	mov r0, #0
	strb r0, [r4, #1]
_02061CB4:
	ldr r0, [r4, #4]
	bl sub_02061E6C
	add r7, r0, #0
	ldrb r0, [r4, #1]
	lsl r0, r0, #2
	ldr r5, [r7, r0]
	add r0, r6, #0
	add r1, r5, #0
	bl MapObject_SetNextFacing
	add r0, r6, #0
	bl sub_02062050
	cmp r0, #0
	bne _02061CDC
	add r0, r6, #0
	add r1, r5, #0
	bl MapObject_SetFacingDirection
_02061CDC:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02060BB8
	mov r1, #1
	tst r1, r0
	beq _02061D18
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	lsl r0, r0, #2
	ldr r5, [r7, r0]
	add r0, r6, #0
	add r1, r5, #0
	bl MapObject_SetNextFacing
	add r0, r6, #0
	bl sub_02062050
	cmp r0, #0
	bne _02061D10
	add r0, r6, #0
	add r1, r5, #0
	bl MapObject_SetFacingDirection
_02061D10:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02060BB8
_02061D18:
	mov r1, #0xc
	cmp r0, #0
	beq _02061D20
	mov r1, #0x20
_02061D20:
	add r0, r5, #0
	bl sub_0206234C
	add r1, r0, #0
	add r0, r6, #0
	bl MapObject_ForceSetHeldMovement
	add r0, r6, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061D42
	add r1, r4, #0
	add r0, r6, #0
	add r1, #8
	bl sub_0206207C
_02061D42:
	add r0, r6, #0
	bl MapObject_SingleMovementSetActive
	mov r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02061C40

	thumb_func_start sub_02061D50
sub_02061D50: ; 0x02061D50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02061D7C
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl sub_02062050
	cmp r0, #1
	bne _02061D78
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	bl sub_020620F8
_02061D78:
	mov r0, #0
	strb r0, [r4]
_02061D7C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02061D50

	thumb_func_start sub_02061D80
sub_02061D80: ; 0x02061D80
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1e
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061D80

	thumb_func_start sub_02061D90
sub_02061D90: ; 0x02061D90
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x1f
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061D90

	thumb_func_start sub_02061DA0
sub_02061DA0: ; 0x02061DA0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x20
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DA0

	thumb_func_start sub_02061DB0
sub_02061DB0: ; 0x02061DB0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x21
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DB0

	thumb_func_start sub_02061DC0
sub_02061DC0: ; 0x02061DC0
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x22
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DC0

	thumb_func_start sub_02061DD0
sub_02061DD0: ; 0x02061DD0
	push {r3, lr}
	mov r1, #2
	mov r2, #1
	mov r3, #0x23
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DD0

	thumb_func_start sub_02061DE0
sub_02061DE0: ; 0x02061DE0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x24
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DE0

	thumb_func_start sub_02061DF0
sub_02061DF0: ; 0x02061DF0
	push {r3, lr}
	mov r1, #2
	mov r2, #0
	mov r3, #0x25
	bl sub_02061AEC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02061DF0

	thumb_func_start sub_02061E00
sub_02061E00: ; 0x02061E00
	push {r4, lr}
	ldr r2, [r0]
	mov r4, #0
	cmp r1, r2
	beq _02061E14
_02061E0A:
	add r0, r0, #4
	ldr r2, [r0]
	add r4, r4, #1
	cmp r1, r2
	bne _02061E0A
_02061E14:
	cmp r4, #0
	bne _02061E1C
	bl GF_AssertFail
_02061E1C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_02061E00

	thumb_func_start sub_02061E20
sub_02061E20: ; 0x02061E20
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl LCRandom
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02061E00
	add r1, r0, #0
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r1, #2
	ldr r0, [r5, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02061E20

	thumb_func_start sub_02061E44
sub_02061E44: ; 0x02061E44
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl sub_02061E6C
	add r4, r0, #0
	bl LCRandom
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02061E00
	add r1, r0, #0
	add r0, r6, #0
	bl _s32_div_f
	lsl r0, r1, #2
	ldr r0, [r4, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02061E44

	thumb_func_start sub_02061E6C
sub_02061E6C: ; 0x02061E6C
	push {r3, lr}
	ldr r1, _02061E8C ; =_020FD838
	mov r2, #0
_02061E72:
	cmp r2, r0
	bne _02061E7A
	ldr r0, [r1, #4]
	pop {r3, pc}
_02061E7A:
	add r1, #8
	ldr r2, [r1]
	cmp r2, #0x27
	bne _02061E72
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_02061E8C: .word _020FD838
	thumb_func_end sub_02061E6C

	thumb_func_start sub_02061E90
sub_02061E90: ; 0x02061E90
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl MapObject_GetType
	cmp r0, #1
	beq _02061EA6
	cmp r0, #2
	beq _02061EA6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EA6:
	add r0, r5, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	add r6, r0, #0
	bl sub_0205DE98
	cmp r0, #0
	bne _02061EC0
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EC0:
	add r0, r5, #0
	mov r4, #0
	bl MapObject_GetMovement
	ldr r1, _02061F58 ; =_020FD800
_02061ECA:
	lsl r2, r4, #2
	ldr r2, [r1, r2]
	add r4, r4, #1
	cmp r2, r0
	beq _02061ED8
	cmp r2, #0xff
	bne _02061ECA
_02061ED8:
	cmp r0, r2
	beq _02061EE2
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EE2:
	add r0, r6, #0
	bl PlayerAvatar_GetMapObject
	bl sub_0205F9D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F9D0
	cmp r4, r0
	beq _02061EFE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02061EFE:
	add r0, r6, #0
	bl GetPlayerXCoord
	add r4, r0, #0
	add r0, r6, #0
	bl GetPlayerYCoord
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl MapObject_GetParam
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	ldr r3, [sp]
	ldr r0, [sp]
	add r5, r2, r3
	sub r1, r7, r0
	sub r3, r2, r3
	add r0, r7, r0
	cmp r3, r6
	bgt _02061F52
	cmp r5, r6
	blt _02061F52
	cmp r1, r4
	bgt _02061F52
	cmp r0, r4
	blt _02061F52
	add r1, r2, #0
	add r0, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02061200
	pop {r3, r4, r5, r6, r7, pc}
_02061F52:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02061F58: .word _020FD800
	thumb_func_end sub_02061E90

	thumb_func_start sub_02061F5C
sub_02061F5C: ; 0x02061F5C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r4, r2, #0
	add r0, r1, #0
	bl sub_02061E6C
	add r1, r4, #0
	add r5, r0, #0
	bl sub_02061E00
	add r4, r0, #0
	cmp r4, #1
	bne _02061F80
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02061F80:
	ldr r0, [sp]
	bl sub_02061E90
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0206204A
	mov r2, #0
	add r3, r5, #0
_02061F92:
	ldr r1, [r3]
	cmp r0, r1
	beq _0206204A
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, r4
	blt _02061F92
	mov r7, #0
	mvn r7, r7
	ldr r0, [sp]
	add r6, r7, #0
	bl MapObject_GetCurrentX
	str r0, [sp, #8]
	ldr r0, [sp]
	bl MapObject_GetCurrentY
	str r0, [sp, #4]
	ldr r0, [sp]
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	str r0, [sp, #0xc]
	bl GetPlayerXCoord
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	bl GetPlayerYCoord
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x10]
	cmp r2, r1
	ble _02061FDA
	mov r7, #2
	b _02061FE0
_02061FDA:
	cmp r2, r1
	bge _02061FE0
	mov r7, #3
_02061FE0:
	ldr r1, [sp, #4]
	cmp r1, r0
	ble _02061FEA
	mov r6, #0
	b _02061FF0
_02061FEA:
	cmp r1, r0
	bge _02061FF0
	mov r6, #1
_02061FF0:
	mov r0, #0
	sub r1, r0, #1
	cmp r7, r1
	bne _0206200E
_02061FF8:
	ldr r1, [r5]
	cmp r6, r1
	bne _02062004
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02062004:
	add r0, r0, #1
	add r5, r5, #4
	cmp r0, r4
	blt _02061FF8
	b _02062046
_0206200E:
	cmp r6, r1
	bne _02062028
_02062012:
	ldr r1, [r5]
	cmp r7, r1
	bne _0206201E
	add sp, #0x14
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_0206201E:
	add r0, r0, #1
	add r5, r5, #4
	cmp r0, r4
	blt _02062012
	b _02062046
_02062028:
	ldr r1, [r5]
	cmp r7, r1
	bne _02062034
	add sp, #0x14
	add r0, r7, #0
	pop {r4, r5, r6, r7, pc}
_02062034:
	cmp r6, r1
	bne _0206203E
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_0206203E:
	add r0, r0, #1
	add r5, r5, #4
	cmp r0, r4
	blt _02062028
_02062046:
	mov r0, #0
	mvn r0, r0
_0206204A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02061F5C

	thumb_func_start sub_02062050
sub_02062050: ; 0x02062050
	push {r3, lr}
	bl MapObject_GetType
	sub r0, r0, #7
	cmp r0, #1
	bhi _02062060
	mov r0, #1
	pop {r3, pc}
_02062060:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062050

	thumb_func_start sub_02062064
sub_02062064: ; 0x02062064
	push {r4, lr}
	add r4, r1, #0
	bl MapObject_GetType
	cmp r0, #7
	bne _02062076
	mov r0, #0
	strb r0, [r4, #1]
	pop {r4, pc}
_02062076:
	mov r0, #1
	strb r0, [r4, #1]
	pop {r4, pc}
	thumb_func_end sub_02062064

	thumb_func_start sub_0206207C
sub_0206207C: ; 0x0206207C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	bl MapObject_GetFacingDirection
	mov r4, #0
	add r6, r0, #0
	add r1, r4, #0
	ldr r0, _020620F4 ; =_020FD7E0
	mov r2, #1
	b _02062096
_02062092:
	add r1, r1, #4
	add r4, r4, #1
_02062096:
	cmp r4, #4
	bge _020620A6
	ldrsb r3, [r5, r2]
	lsl r3, r3, #4
	add r3, r0, r3
	ldr r3, [r1, r3]
	cmp r6, r3
	bne _02062092
_020620A6:
	cmp r4, #4
	blt _020620AE
	bl GF_AssertFail
_020620AE:
	add r0, r4, #1
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	strb r6, [r5]
	mov r0, #1
	add r1, r2, r1
	ldrsb r0, [r5, r0]
	lsl r1, r1, #2
	lsl r2, r0, #4
	ldr r0, _020620F4 ; =_020FD7E0
	add r0, r0, r2
	ldr r4, [r1, r0]
	add r0, r7, #0
	mov r1, #0x80
	bl MapObject_GetFlagsMask
	cmp r0, #0
	beq _020620DC
	mov r0, #1
	b _020620DE
_020620DC:
	mov r0, #0
_020620DE:
	strb r0, [r5, #2]
	add r0, r7, #0
	add r1, r4, #0
	bl MapObject_SetFacingDirection
	add r0, r7, #0
	mov r1, #0x80
	bl MapObject_SetFlagsBits
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020620F4: .word _020FD7E0
	thumb_func_end sub_0206207C

	thumb_func_start sub_020620F8
sub_020620F8: ; 0x020620F8
	push {r3, lr}
	ldrb r1, [r1, #2]
	cmp r1, #0
	bne _02062106
	mov r1, #0x80
	bl MapObject_ClearFlagsBits
_02062106:
	pop {r3, pc}
	thumb_func_end sub_020620F8

	.rodata

	.public _020FD4EC
_020FD4EC:
	.word sub_02061C40
	.word sub_02061D50
_020FD4F4:
	.word 0, 2, -1
_020FD500:
	.word 1, 2, -1
_020FD50C:
	.word 2, 3, -1
_020FD518:
	.word 0, 3, -1
_020FD524:
	.word 1, 3, -1
_020FD530:
	.word 0, 1, -1
_020FD53C:
	.word 2, 3, -1
	.public _020FD548
_020FD548:
	.word sub_020619C0
	.word sub_020619FC
	.word sub_02061ABC
_020FD554:
	.word 0, 1, -1
_020FD560:
	.word 1, 0, 2, 3
_020FD570:
	.word 2, 3, 0, 1
_020FD580:
	.word 0, 1, 2, 3
_020FD590:
	.word 0, 3, 1, 2
	.public _020FD5A0
_020FD5A0:
	.word sub_02061874
	.word sub_02061894
	.word sub_020618B0
	.word sub_020618C8
_020FD5B0:
	.word 1, 2, 3, 0
_020FD5C0:
	.word 1, 3, 0, 2
	.public _020FD5D0
_020FD5D0:
	.word sub_02061720
	.word sub_02061754
	.word sub_02061770
	.word sub_020617AC
_020FD5E0:
	.word 0x00000001, 0x00000002, 0x00000000, 0x00000003
_020FD5F0:
	.word 0x00000002, 0x00000000, 0x00000003, 0x00000001
_020FD600:
	.word 0x00000002, 0x00000003, 0x00000001, 0x00000000
_020FD610:
	.word 0x00000000, 0x00000002, 0x00000001, 0x00000003
_020FD620:
	.word 0x00000001, 0x00000000, 0x00000003, 0x00000002
_020FD630:
	.word 0x00000002, 0x00000001, 0x00000000, 0x00000003
_020FD640:
	.word 0x00000003, 0x00000002, 0x00000001, 0x00000000
_020FD650:
	.word 0x00000000, 0x00000003, 0x00000002, 0x00000001
_020FD660:
	.word 0x00000002, 0x00000000, 0x00000001, 0x00000003
_020FD670:
	.word 0x00000000, 0x00000001, 0x00000003, 0x00000002
_020FD680:
	.word 0x00000003, 0x00000000, 0x00000001, 0x00000002
_020FD690:
	.word 0x00000002, 0x00000001, 0x00000003, 0x00000000
_020FD6A0:
	.word 0x00000000, 0x00000001, 0x00000003, 0xFFFFFFFF
_020FD6B0:
	.word 0x00000000, 0x00000002, 0x00000003, 0xFFFFFFFF
_020FD6C0:
	.word 0x00000003, 0x00000002, 0x00000000, 0x00000001
_020FD6D0:
	.word 0x00000001, 0x00000002, 0x00000003, 0xFFFFFFFF
_020FD6E0:
	.word 0x00000000, 0x00000001, 0x00000002, 0xFFFFFFFF
_020FD6F0:
	.word 0x00000001, 0x00000003, 0x00000002, 0x00000000
_020FD700:
	.word 0x00000003, 0x00000000, 0x00000002, 0x00000001
_020FD710:
	.word 0x00000003, 0x00000001, 0x00000002, 0x00000000
_020FD720:
	.word 0x00000002, 0x00000003, 0x00000001, 0x00000000
_020FD730:
	.word 0x00000003, 0x00000001, 0x00000000, 0x00000002
_020FD740:
	.word 0x00000000, 0x00000001, 0x00000002, 0x00000003
	.word 0xFFFFFFFF
	.public _020FD754
_020FD754:
	.word 0x00000000, 0x00000002, 0x00000001
	.word 0x00000003, 0xFFFFFFFF
	.public _020FD768
_020FD768:
	.word 0x00000000, 0x00000003
	.word 0x00000001, 0x00000002, 0xFFFFFFFF
	.public _020FD77C
_020FD77C:
	.word 0x00000000
	.word 0x00000002, 0x00000001, 0x00000003, 0xFFFFFFFF
_020FD790:
	.word 0x00000000, 0x00000001, 0x00000002, 0x00000003
	.word 0xFFFFFFFF
	.public _020FD7A4
_020FD7A4:
	.word 0x00000000, 0x00000003, 0x00000001
	.word 0x00000002, 0xFFFFFFFF
	.public _020FD7B8
_020FD7B8:
	.word 0x00000010, 0x00000020
	.word 0x00000030, 0x00000040, 0xFFFFFFFF
_020FD7CC:
	.word 0x00000000
	.word 0x00000001, 0x00000002, 0x00000003, 0xFFFFFFFF
	.public _020FD7E0
_020FD7E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.public _020FD800
_020FD800:
	.byte 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00
	.byte 0x13, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.public _020FD838
_020FD838:
	.word 0, _020FD7CC
	.word 0x00000001, _020FD4F4
	.word 0x00000002, _020FD518
	.word 0x00000003, _020FD500
	.word 0x00000004, _020FD524
	.word 0x00000005, _020FD6E0
	.word 0x00000006, _020FD6A0
	.word 0x00000007, _020FD6B0
	.word 0x00000008, _020FD6D0
	.word 0x00000009, _020FD554
	.word 0x0000000A, _020FD53C
	.word 0x0000000B, _020FD740
	.word 0x0000000C, _020FD530
	.word 0x0000000D, _020FD50C
	.word 0x0000000E, _020FD650
	.word 0x0000000F, _020FD640
	.word 0x00000010, _020FD620
	.word 0x00000011, _020FD630
	.word 0x00000012, _020FD720
	.word 0x00000013, _020FD600
	.word 0x00000014, _020FD560
	.word 0x00000015, _020FD730
	.word 0x00000016, _020FD660
	.word 0x00000017, _020FD670
	.word 0x00000018, _020FD6C0
	.word 0x00000019, _020FD6F0
	.word 0x0000001A, _020FD680
	.word 0x0000001B, _020FD580
	.word 0x0000001C, _020FD570
	.word 0x0000001D, _020FD5B0
	.word 0x0000001E, _020FD610
	.word 0x0000001F, _020FD5C0
	.word 0x00000020, _020FD690
	.word 0x00000021, _020FD700
	.word 0x00000022, _020FD590
	.word 0x00000023, _020FD5E0
	.word 0x00000024, _020FD5F0
	.word 0x00000025, _020FD710
	.word 0x00000026, _020FD790
	.word 0x00000027, 0
