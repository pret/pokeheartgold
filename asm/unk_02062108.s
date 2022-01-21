#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.data

_0210FACC:
	.word _020FDA84
	.word _020FDAC4
	.word _020FDB04

	.text

	thumb_func_start sub_02062108
sub_02062108: ; 0x02062108
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	bl sub_0205F228
	cmp r0, #0
	bne _0206211A
	mov r0, #0
	pop {r4, pc}
_0206211A:
	add r0, r4, #0
	mov r1, #2
	bl sub_0205F228
	cmp r0, #1
	bne _0206212A
	mov r0, #0
	pop {r4, pc}
_0206212A:
	add r0, r4, #0
	mov r1, #0x10
	bl sub_0205F228
	cmp r0, #1
	bne _02062146
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	bne _02062146
	mov r0, #0
	pop {r4, pc}
_02062146:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062108

	thumb_func_start sub_0206214C
sub_0206214C: ; 0x0206214C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x71
	blt _0206215A
	bl GF_AssertFail
_0206215A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F4CC
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F4DC
	add r0, r5, #0
	mov r1, #0x10
	bl sub_0205F20C
	add r0, r5, #0
	mov r1, #0x20
	bl sub_0205F214
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0206214C

	thumb_func_start sub_0206217C
sub_0206217C: ; 0x0206217C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F4CC
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F4DC
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F214
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206217C

	thumb_func_start sub_02062198
sub_02062198: ; 0x02062198
	push {r4, lr}
	mov r1, #0x10
	add r4, r0, #0
	bl sub_0205F228
	cmp r0, #0
	bne _020621AA
	mov r0, #1
	pop {r4, pc}
_020621AA:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	beq _020621BA
	mov r0, #1
	pop {r4, pc}
_020621BA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062198

	thumb_func_start sub_020621C0
sub_020621C0: ; 0x020621C0
	push {r4, lr}
	mov r1, #0x10
	add r4, r0, #0
	bl sub_0205F228
	cmp r0, #0
	bne _020621D2
	mov r0, #1
	pop {r4, pc}
_020621D2:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	bne _020621E2
	mov r0, #0
	pop {r4, pc}
_020621E2:
	add r0, r4, #0
	mov r1, #0x30
	bl sub_0205F214
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020621C0

	thumb_func_start sub_020621F0
sub_020621F0: ; 0x020621F0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x10
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F20C
	add r0, r4, #0
	mov r1, #0xff
	bl sub_0205F4CC
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F4DC
	pop {r4, pc}
	thumb_func_end sub_020621F0

	thumb_func_start EventObjectMovementMan_Create
EventObjectMovementMan_Create: ; 0x02062214
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #4
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bne _0206222A
	bl GF_AssertFail
_0206222A:
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_02062230:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02062230
	add r0, r5, #0
	bl sub_0205F35C
	bl sub_0205F19C
	sub r2, r0, #1
	ldr r0, _0206225C ; =sub_0206229C
	add r1, r4, #0
	bl sub_0200E320
	add r7, r0, #0
	bne _02062254
	bl GF_AssertFail
_02062254:
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206225C: .word sub_0206229C
	thumb_func_end EventObjectMovementMan_Create

	thumb_func_start sub_02062260
sub_02062260: ; 0x02062260
	push {r3, lr}
	bl sub_0201F988
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062260

	thumb_func_start sub_0206226C
sub_0206226C: ; 0x0206226C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0201F988
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02062198
	cmp r0, #1
	beq _02062284
	bl GF_AssertFail
_02062284:
	ldr r0, [r4, #0xc]
	bl sub_020621C0
	mov r0, #4
	add r1, r4, #0
	bl FreeToHeapExplicit
	add r0, r5, #0
	bl sub_0200E390
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0206226C

	thumb_func_start sub_0206229C
sub_0206229C: ; 0x0206229C
	push {r3, r4, r5, lr}
	ldr r4, _020622B4 ; =_020FDA38
	add r5, r1, #0
_020622A2:
	ldr r1, [r5]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r4, r1]
	blx r1
	cmp r0, #1
	beq _020622A2
	pop {r3, r4, r5, pc}
	nop
_020622B4: .word _020FDA38
	thumb_func_end sub_0206229C

	thumb_func_start sub_020622B8
sub_020622B8: ; 0x020622B8
	mov r1, #0
	str r1, [r0, #8]
	mov r1, #1
	str r1, [r0]
	add r0, r1, #0
	bx lr
	thumb_func_end sub_020622B8

	thumb_func_start sub_020622C4
sub_020622C4: ; 0x020622C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02062108
	cmp r0, #0
	bne _020622D6
	mov r0, #0
	pop {r4, pc}
_020622D6:
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020622C4

	thumb_func_start sub_020622E0
sub_020622E0: ; 0x020622E0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0xc]
	ldrh r1, [r1]
	bl sub_0206214C
	mov r0, #3
	str r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020622E0

	thumb_func_start sub_020622F8
sub_020622F8: ; 0x020622F8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_02062198
	cmp r0, #0
	bne _0206230A
	mov r0, #0
	pop {r4, pc}
_0206230A:
	mov r0, #4
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020622F8

	thumb_func_start sub_02062314
sub_02062314: ; 0x02062314
	ldr r1, [r0, #8]
	ldr r3, [r0, #0x10]
	add r2, r1, #1
	str r2, [r0, #8]
	ldrh r1, [r3, #2]
	cmp r2, r1
	bge _0206232A
	mov r1, #1
	str r1, [r0]
	add r0, r1, #0
	bx lr
_0206232A:
	add r1, r3, #4
	str r1, [r0, #0x10]
	ldrh r1, [r3, #4]
	cmp r1, #0xfe
	beq _0206233C
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bx lr
_0206233C:
	mov r1, #1
	str r1, [r0, #4]
	mov r1, #5
	str r1, [r0]
	mov r0, #0
	bx lr
	thumb_func_end sub_02062314

	thumb_func_start sub_02062348
sub_02062348: ; 0x02062348
	mov r0, #0
	bx lr
	thumb_func_end sub_02062348

	thumb_func_start sub_0206234C
sub_0206234C: ; 0x0206234C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r4, r1, #0
	cmp r7, #4
	blt _0206235A
	bl GF_AssertFail
_0206235A:
	ldr r3, _0206238C ; =_020FD198
	ldr r6, [r3]
	cmp r6, #0
	beq _02062384
	mov r1, #0
_02062364:
	add r2, r1, #0
	add r5, r6, #0
_02062368:
	ldr r0, [r5]
	cmp r4, r0
	bne _02062374
	lsl r0, r7, #2
	ldr r0, [r6, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02062374:
	add r2, r2, #1
	add r5, r5, #4
	cmp r2, #4
	blt _02062368
	add r3, r3, #4
	ldr r6, [r3]
	cmp r6, #0
	bne _02062364
_02062384:
	bl GF_AssertFail
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206238C: .word _020FD198
	thumb_func_end sub_0206234C

	thumb_func_start sub_02062390
sub_02062390: ; 0x02062390
	push {r4, r5}
	ldr r4, _020623C4 ; =_020FD198
	ldr r5, [r4]
	cmp r5, #0
	beq _020623BA
	mov r2, #0
_0206239C:
	add r3, r2, #0
_0206239E:
	ldr r1, [r5]
	cmp r0, r1
	bne _020623AA
	add r0, r3, #0
	pop {r4, r5}
	bx lr
_020623AA:
	add r3, r3, #1
	add r5, r5, #4
	cmp r3, #4
	blt _0206239E
	add r4, r4, #4
	ldr r5, [r4]
	cmp r5, #0
	bne _0206239C
_020623BA:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5}
	bx lr
	nop
_020623C4: .word _020FD198
	thumb_func_end sub_02062390

	thumb_func_start sub_020623C8
sub_020623C8: ; 0x020623C8
	sub r0, #0x38
	cmp r0, #3
	bhi _020623D2
	mov r0, #1
	bx lr
_020623D2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020623C8

	thumb_func_start sub_020623D8
sub_020623D8: ; 0x020623D8
	push {r4, lr}
	sub sp, #0x10
	ldr r3, _020623FC ; =_020FDA28
	add r2, sp, #0
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	cmp r4, #4
	blt _020623F2
	bl GF_AssertFail
_020623F2:
	lsl r1, r4, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_020623FC: .word _020FDA28
	thumb_func_end sub_020623D8

	thumb_func_start sub_02062400
sub_02062400: ; 0x02062400
	push {r3, r4, r5, lr}
	add r5, r0, #0
_02062404:
	add r0, r5, #0
	bl sub_0205F4D4
	add r4, r0, #0
	cmp r4, #0xff
	beq _02062424
	add r0, r5, #0
	bl sub_0205F4F4
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206245C
	cmp r0, #0
	bne _02062404
_02062424:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062400

	thumb_func_start sub_02062428
sub_02062428: ; 0x02062428
	push {r4, lr}
	add r4, r0, #0
	bl sub_02062400
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F228
	cmp r0, #0
	bne _02062440
	mov r0, #0
	pop {r4, pc}
_02062440:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #0xff
	bl sub_0205F4CC
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F4DC
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062428

	thumb_func_start sub_0206245C
sub_0206245C: ; 0x0206245C
	push {r3, lr}
	lsl r3, r1, #2
	ldr r1, _0206246C ; =_020FD2D8
	ldr r3, [r1, r3]
	lsl r1, r2, #2
	ldr r1, [r3, r1]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_0206246C: .word _020FD2D8
	thumb_func_end sub_0206245C

	thumb_func_start sub_02062470
sub_02062470: ; 0x02062470
	push {r3, lr}
	mov r1, #0x20
	bl sub_0205F20C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062470

	thumb_func_start sub_0206247C
sub_0206247C: ; 0x0206247C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F290
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_02060F78
	add r0, r4, #0
	bl sub_0205F4E4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0206247C

	thumb_func_start sub_0206249C
sub_0206249C: ; 0x0206249C
	push {r3, lr}
	mov r1, #0
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206249C

	thumb_func_start sub_020624A8
sub_020624A8: ; 0x020624A8
	push {r3, lr}
	mov r1, #1
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020624A8

	thumb_func_start sub_020624B4
sub_020624B4: ; 0x020624B4
	push {r3, lr}
	mov r1, #2
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020624B4

	thumb_func_start sub_020624C0
sub_020624C0: ; 0x020624C0
	push {r3, lr}
	mov r1, #3
	bl sub_0206247C
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020624C0

	thumb_func_start sub_020624CC
sub_020624CC: ; 0x020624CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0xc
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F3C0
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0]
	strh r7, [r0, #2]
	str r4, [r0, #4]
	str r6, [r0, #8]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2BC
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl sub_0205F328
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020624CC

	thumb_func_start sub_02062514
sub_02062514: ; 0x02062514
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #2
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #2]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02062540
	mov r0, #0
	pop {r3, r4, r5, pc}
_02062540:
	add r0, r5, #0
	mov r1, #0x28
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062514

	thumb_func_start sub_02062568
sub_02062568: ; 0x02062568
	push {r3, lr}
	mov r2, #1
	str r2, [sp]
	mov r1, #0
	lsl r2, r2, #0xb
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062568

	thumb_func_start sub_0206257C
sub_0206257C: ; 0x0206257C
	push {r3, lr}
	mov r1, #1
	lsl r2, r1, #0xb
	mov r3, #0x20
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206257C

	thumb_func_start sub_02062590
sub_02062590: ; 0x02062590
	push {r3, lr}
	mov r1, #1
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xa
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062590

	thumb_func_start sub_020625A4
sub_020625A4: ; 0x020625A4
	push {r3, lr}
	mov r2, #1
	str r2, [sp]
	mov r1, #3
	lsl r2, r2, #0xb
	mov r3, #0x20
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625A4

	thumb_func_start sub_020625B8
sub_020625B8: ; 0x020625B8
	push {r3, lr}
	mov r2, #2
	str r2, [sp]
	mov r1, #0
	lsl r2, r2, #0xb
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625B8

	thumb_func_start sub_020625CC
sub_020625CC: ; 0x020625CC
	push {r3, lr}
	mov r1, #2
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xc
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625CC

	thumb_func_start sub_020625E0
sub_020625E0: ; 0x020625E0
	push {r3, lr}
	mov r1, #2
	lsl r2, r1, #0xb
	mov r3, #0x10
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020625E0

	thumb_func_start sub_020625F4
sub_020625F4: ; 0x020625F4
	push {r3, lr}
	mov r2, #2
	str r2, [sp]
	mov r1, #3
	lsl r2, r2, #0xb
	mov r3, #0x10
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020625F4

	thumb_func_start sub_02062608
sub_02062608: ; 0x02062608
	push {r3, lr}
	mov r1, #3
	mov r2, #2
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xc
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062608

	thumb_func_start sub_02062620
sub_02062620: ; 0x02062620
	push {r3, lr}
	mov r1, #3
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xd
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062620

	thumb_func_start sub_02062634
sub_02062634: ; 0x02062634
	push {r3, lr}
	mov r1, #3
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xc
	mov r3, #8
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062634

	thumb_func_start sub_02062648
sub_02062648: ; 0x02062648
	push {r3, lr}
	mov r2, #2
	mov r1, #3
	lsl r2, r2, #0xc
	mov r3, #8
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062648

	thumb_func_start sub_0206265C
sub_0206265C: ; 0x0206265C
	push {r3, lr}
	mov r3, #4
	mov r1, #0
	lsl r2, r3, #0xc
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206265C

	thumb_func_start sub_02062670
sub_02062670: ; 0x02062670
	push {r3, lr}
	mov r1, #1
	mov r3, #4
	lsl r2, r1, #0xe
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062670

	thumb_func_start sub_02062684
sub_02062684: ; 0x02062684
	push {r3, lr}
	mov r1, #2
	mov r3, #4
	lsl r2, r1, #0xd
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062684

	thumb_func_start sub_02062698
sub_02062698: ; 0x02062698
	push {r3, lr}
	mov r3, #4
	mov r1, #3
	lsl r2, r3, #0xc
	str r3, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062698

	thumb_func_start sub_020626AC
sub_020626AC: ; 0x020626AC
	push {r3, lr}
	mov r1, #5
	mov r2, #2
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020626AC

	thumb_func_start sub_020626C4
sub_020626C4: ; 0x020626C4
	push {r3, lr}
	mov r1, #5
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xf
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020626C4

	thumb_func_start sub_020626D8
sub_020626D8: ; 0x020626D8
	push {r3, lr}
	mov r1, #5
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xe
	add r3, r1, #0
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020626D8

	thumb_func_start sub_020626EC
sub_020626EC: ; 0x020626EC
	push {r3, lr}
	mov r1, #5
	mov r2, #2
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #2
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020626EC

	thumb_func_start sub_02062704
sub_02062704: ; 0x02062704
	push {r3, lr}
	mov r2, #1
	mov r1, #0
	lsl r2, r2, #0x10
	mov r3, #1
	str r1, [sp]
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062704

	thumb_func_start sub_02062718
sub_02062718: ; 0x02062718
	push {r3, lr}
	mov r1, #0
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0x10
	add r3, r1, #0
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062718

	thumb_func_start sub_0206272C
sub_0206272C: ; 0x0206272C
	push {r3, lr}
	mov r1, #0
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xf
	mov r3, #1
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206272C

	thumb_func_start sub_02062740
sub_02062740: ; 0x02062740
	push {r3, lr}
	mov r1, #0
	mov r2, #1
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0x10
	mov r3, #1
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062740

	thumb_func_start sub_02062758
sub_02062758: ; 0x02062758
	push {r3, lr}
	mov r1, #9
	mov r2, #1
	str r1, [sp]
	mov r1, #0
	lsl r2, r2, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062758

	thumb_func_start sub_02062770
sub_02062770: ; 0x02062770
	push {r3, lr}
	mov r1, #9
	str r1, [sp]
	mov r1, #1
	lsl r2, r1, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062770

	thumb_func_start sub_02062784
sub_02062784: ; 0x02062784
	push {r3, lr}
	mov r1, #9
	str r1, [sp]
	mov r1, #2
	lsl r2, r1, #0xd
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062784

	thumb_func_start sub_02062798
sub_02062798: ; 0x02062798
	push {r3, lr}
	mov r1, #9
	mov r2, #1
	str r1, [sp]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #4
	bl sub_020624CC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02062798

	thumb_func_start sub_020627B0
sub_020627B0: ; 0x020627B0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r2, #0
	add r4, r3, #0
	mov r1, #0xc
	add r5, r0, #0
	bl sub_0205F3C0
	strh r4, [r0]
	add r1, r6, #1
	strh r1, [r0, #2]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0205F290
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020627B0

	thumb_func_start sub_020627E4
sub_020627E4: ; 0x020627E4
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	mov r1, #2
	ldrsh r2, [r0, r1]
	sub r2, r2, #1
	strh r2, [r0, #2]
	ldrsh r0, [r0, r1]
	cmp r0, #0
	ble _020627FE
	mov r0, #0
	pop {r4, pc}
_020627FE:
	add r0, r4, #0
	mov r1, #0x20
	bl sub_0205F20C
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_020627E4

	thumb_func_start sub_02062818
sub_02062818: ; 0x02062818
	push {r3, lr}
	mov r1, #0
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062818

	thumb_func_start sub_02062828
sub_02062828: ; 0x02062828
	push {r3, lr}
	mov r1, #1
	mov r2, #0x20
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062828

	thumb_func_start sub_02062838
sub_02062838: ; 0x02062838
	push {r3, lr}
	mov r1, #2
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062838

	thumb_func_start sub_02062848
sub_02062848: ; 0x02062848
	push {r3, lr}
	mov r1, #3
	mov r2, #0x20
	mov r3, #1
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062848

	thumb_func_start sub_02062858
sub_02062858: ; 0x02062858
	push {r3, lr}
	mov r1, #0
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062858

	thumb_func_start sub_02062868
sub_02062868: ; 0x02062868
	push {r3, lr}
	mov r1, #1
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062868

	thumb_func_start sub_02062878
sub_02062878: ; 0x02062878
	push {r3, lr}
	mov r1, #2
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062878

	thumb_func_start sub_02062888
sub_02062888: ; 0x02062888
	push {r3, lr}
	mov r1, #3
	mov r2, #0x10
	mov r3, #2
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062888

	thumb_func_start sub_02062898
sub_02062898: ; 0x02062898
	push {r3, lr}
	mov r1, #0
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062898

	thumb_func_start sub_020628A8
sub_020628A8: ; 0x020628A8
	push {r3, lr}
	mov r1, #1
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628A8

	thumb_func_start sub_020628B8
sub_020628B8: ; 0x020628B8
	push {r3, lr}
	mov r1, #2
	mov r2, #8
	mov r3, #3
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628B8

	thumb_func_start sub_020628C8
sub_020628C8: ; 0x020628C8
	push {r3, lr}
	mov r1, #3
	mov r2, #8
	add r3, r1, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628C8

	thumb_func_start sub_020628D8
sub_020628D8: ; 0x020628D8
	push {r3, lr}
	mov r2, #4
	mov r1, #0
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628D8

	thumb_func_start sub_020628E8
sub_020628E8: ; 0x020628E8
	push {r3, lr}
	mov r2, #4
	mov r1, #1
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628E8

	thumb_func_start sub_020628F8
sub_020628F8: ; 0x020628F8
	push {r3, lr}
	mov r2, #4
	mov r1, #2
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020628F8

	thumb_func_start sub_02062908
sub_02062908: ; 0x02062908
	push {r3, lr}
	mov r2, #4
	mov r1, #3
	add r3, r2, #0
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062908

	thumb_func_start sub_02062918
sub_02062918: ; 0x02062918
	push {r3, lr}
	mov r1, #0
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062918

	thumb_func_start sub_02062928
sub_02062928: ; 0x02062928
	push {r3, lr}
	mov r1, #1
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062928

	thumb_func_start sub_02062938
sub_02062938: ; 0x02062938
	push {r3, lr}
	mov r1, #2
	add r2, r1, #0
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062938

	thumb_func_start sub_02062948
sub_02062948: ; 0x02062948
	push {r3, lr}
	mov r1, #3
	mov r2, #2
	mov r3, #5
	bl sub_020627B0
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062948

	thumb_func_start sub_02062958
sub_02062958: ; 0x02062958
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0x10
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_0205F3C0
	strb r4, [r0, #0xc]
	str r6, [r0]
	strb r7, [r0, #0xd]
	add r2, sp, #8
	ldrh r1, [r2, #0x10]
	strb r1, [r0, #0xe]
	mov r1, #0x14
	ldrsh r1, [r2, r1]
	cmp r6, #0
	strb r1, [r0, #0xf]
	ldrh r1, [r2, #0x18]
	strh r1, [r0, #8]
	bne _0206298A
	add r0, r5, #0
	bl sub_02060F78
	b _02062992
_0206298A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
_02062992:
	ldr r1, _020629C4 ; =0x00010004
	add r0, r5, #0
	bl sub_0205F20C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2BC
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r5, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _020629C2
	ldr r0, _020629C8 ; =SEQ_SE_DP_DANSA
	bl PlaySE
_020629C2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020629C4: .word 0x00010004
_020629C8: .word SEQ_SE_DP_DANSA
	thumb_func_end sub_02062958

	thumb_func_start sub_020629CC
sub_020629CC: ; 0x020629CC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r2, [r4]
	cmp r2, #0
	beq _02062A1C
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #0x10
	cmp r1, r0
	blt _02062A0E
	mov r0, #0
	str r0, [r4, #4]
	mov r1, #0xc
	ldrsb r1, [r4, r1]
	add r0, r5, #0
	bl sub_02060F24
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
_02062A0E:
	ldr r1, [r4]
	cmp r1, #0
	bge _02062A16
	neg r1, r1
_02062A16:
	ldr r0, [r4, #4]
	add r0, r0, r1
	str r0, [r4, #4]
_02062A1C:
	ldrh r1, [r4, #0xa]
	ldrh r0, [r4, #8]
	add r0, r1, r0
	strh r0, [r4, #0xa]
	mov r0, #0xf
	ldrh r1, [r4, #0xa]
	lsl r0, r0, #8
	cmp r1, r0
	bls _02062A30
	strh r0, [r4, #0xa]
_02062A30:
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	ldrh r0, [r4, #0xa]
	lsl r2, r1, #2
	ldr r1, _02062AB0 ; =_0210FACC
	lsr r0, r0, #8
	lsl r0, r0, #0x10
	ldr r2, [r1, r2]
	mov r1, #0
	str r1, [sp, #0xc]
	lsr r0, r0, #0xe
	ldr r0, [r2, r0]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	add r0, r5, #0
	add r1, sp, #0xc
	bl sub_0205F97C
	mov r0, #0xd
	ldrsb r1, [r4, r0]
	sub r1, r1, #1
	strb r1, [r4, #0xd]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02062A68
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, pc}
_02062A68:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r1, _02062AB4 ; =0x00020028
	add r0, r5, #0
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	add r0, r5, #0
	bl sub_0205F684
	cmp r0, #0
	bne _02062AAA
	ldr r0, _02062AB8 ; =SEQ_SE_DP_SUTYA2
	bl PlaySE
_02062AAA:
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02062AB0: .word _0210FACC
_02062AB4: .word 0x00020028
_02062AB8: .word SEQ_SE_DP_SUTYA2
	thumb_func_end sub_020629CC

	thumb_func_start sub_02062ABC
sub_02062ABC: ; 0x02062ABC
	push {lr}
	sub sp, #0xc
	mov r2, #2
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfe
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062ABC

	thumb_func_start sub_02062ADC
sub_02062ADC: ; 0x02062ADC
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r1, #0xfe
	str r1, [sp, #8]
	mov r1, #1
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062ADC

	thumb_func_start sub_02062AFC
sub_02062AFC: ; 0x02062AFC
	push {lr}
	sub sp, #0xc
	mov r1, #2
	add r3, r1, #0
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r3, #0xfe
	str r3, [sp, #8]
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062AFC

	thumb_func_start sub_02062B1C
sub_02062B1C: ; 0x02062B1C
	push {lr}
	sub sp, #0xc
	mov r1, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r1, #0xfe
	str r1, [sp, #8]
	mov r1, #3
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062B1C

	thumb_func_start sub_02062B3C
sub_02062B3C: ; 0x02062B3C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	mov r2, #2
	str r1, [sp, #4]
	lsl r2, r2, #8
	str r2, [sp, #8]
	add r2, r1, #0
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062B3C

	thumb_func_start sub_02062B5C
sub_02062B5C: ; 0x02062B5C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	mov r1, #2
	str r2, [sp, #4]
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #1
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062B5C

	thumb_func_start sub_02062B7C
sub_02062B7C: ; 0x02062B7C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	mov r1, #2
	str r2, [sp, #4]
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #2
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062B7C

	thumb_func_start sub_02062B9C
sub_02062B9C: ; 0x02062B9C
	push {lr}
	sub sp, #0xc
	mov r1, #3
	mov r3, #2
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	lsl r3, r3, #8
	str r3, [sp, #8]
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062B9C

	thumb_func_start sub_02062BBC
sub_02062BBC: ; 0x02062BBC
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	mov r2, #2
	str r1, [sp, #4]
	lsl r2, r2, #8
	str r2, [sp, #8]
	lsl r2, r2, #4
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062BBC

	thumb_func_start sub_02062BDC
sub_02062BDC: ; 0x02062BDC
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #1
	lsl r2, r1, #0xd
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062BDC

	thumb_func_start sub_02062C00
sub_02062C00: ; 0x02062C00
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #2
	lsl r1, r1, #8
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xc
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062C00

	thumb_func_start sub_02062C24
sub_02062C24: ; 0x02062C24
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r2, #2
	lsl r2, r2, #8
	str r2, [sp, #8]
	lsl r2, r2, #4
	mov r3, #8
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C24

	thumb_func_start sub_02062C44
sub_02062C44: ; 0x02062C44
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	str r2, [sp, #8]
	mov r2, #2
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C44

	thumb_func_start sub_02062C64
sub_02062C64: ; 0x02062C64
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	mov r1, #1
	str r2, [sp, #8]
	lsl r2, r1, #0xd
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C64

	thumb_func_start sub_02062C84
sub_02062C84: ; 0x02062C84
	push {lr}
	sub sp, #0xc
	mov r2, #3
	str r2, [sp]
	mov r1, #0
	str r1, [sp, #4]
	add r2, #0xfd
	mov r1, #2
	str r2, [sp, #8]
	lsl r2, r1, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062C84

	thumb_func_start sub_02062CA4
sub_02062CA4: ; 0x02062CA4
	push {lr}
	sub sp, #0xc
	mov r1, #3
	str r1, [sp]
	mov r2, #0
	str r2, [sp, #4]
	add r2, r1, #0
	add r2, #0xfd
	str r2, [sp, #8]
	mov r2, #2
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062CA4

	thumb_func_start sub_02062CC8
sub_02062CC8: ; 0x02062CC8
	push {lr}
	sub sp, #0xc
	mov r1, #0xa
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0xf0
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xb
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062CC8

	thumb_func_start sub_02062CE8
sub_02062CE8: ; 0x02062CE8
	push {lr}
	sub sp, #0xc
	mov r1, #0xa
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #0xf0
	mov r2, #1
	str r1, [sp, #8]
	mov r1, #3
	lsl r2, r2, #0xc
	mov r3, #0x10
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062CE8

	thumb_func_start sub_02062D0C
sub_02062D0C: ; 0x02062D0C
	push {lr}
	sub sp, #0xc
	mov r1, #0xb
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #5
	lsl r1, r1, #6
	str r1, [sp, #8]
	mov r1, #2
	lsl r2, r1, #0xd
	mov r3, #0xc
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end sub_02062D0C

	thumb_func_start sub_02062D30
sub_02062D30: ; 0x02062D30
	push {lr}
	sub sp, #0xc
	mov r1, #0xb
	str r1, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #5
	lsl r1, r1, #6
	mov r2, #1
	str r1, [sp, #8]
	mov r1, #3
	lsl r2, r2, #0xe
	mov r3, #0xc
	bl sub_02062958
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02062D30

	thumb_func_start sub_02062D54
sub_02062D54: ; 0x02062D54
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	str r4, [r0]
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062D54

	thumb_func_start sub_02062D6C
sub_02062D6C: ; 0x02062D6C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	cmp r1, #0
	beq _02062D82
	sub r1, r1, #1
	str r1, [r0]
	mov r0, #0
	pop {r4, pc}
_02062D82:
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062D6C

	thumb_func_start sub_02062D8C
sub_02062D8C: ; 0x02062D8C
	push {r3, lr}
	mov r1, #1
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062D8C

	thumb_func_start sub_02062D98
sub_02062D98: ; 0x02062D98
	push {r3, lr}
	mov r1, #2
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062D98

	thumb_func_start sub_02062DA4
sub_02062DA4: ; 0x02062DA4
	push {r3, lr}
	mov r1, #4
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DA4

	thumb_func_start sub_02062DB0
sub_02062DB0: ; 0x02062DB0
	push {r3, lr}
	mov r1, #8
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DB0

	thumb_func_start sub_02062DBC
sub_02062DBC: ; 0x02062DBC
	push {r3, lr}
	mov r1, #0xf
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DBC

	thumb_func_start sub_02062DC8
sub_02062DC8: ; 0x02062DC8
	push {r3, lr}
	mov r1, #0x10
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DC8

	thumb_func_start sub_02062DD4
sub_02062DD4: ; 0x02062DD4
	push {r3, lr}
	mov r1, #0x20
	bl sub_02062D54
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_02062DD4

	thumb_func_start sub_02062DE0
sub_02062DE0: ; 0x02062DE0
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl sub_0205F3C0
	mov r1, #1
	lsl r1, r1, #0x10
	str r1, [r0, #4]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062DE0

	thumb_func_start sub_02062E04
sub_02062E04: ; 0x02062E04
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r4]
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r1, [r4]
	asr r0, r1, #0xe
	lsr r0, r0, #0x11
	add r0, r1, r0
	asr r0, r0, #0xf
	cmp r0, #0x28
	bge _02062E40
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02062E40:
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02062E04

	thumb_func_start sub_02062E4C
sub_02062E4C: ; 0x02062E4C
	push {r4, lr}
	mov r1, #8
	add r4, r0, #0
	bl sub_0205F3C0
	mov r1, #5
	lsl r1, r1, #0x12
	str r1, [r0]
	ldr r1, _02062E74 ; =0xFFFF0000
	str r1, [r0, #4]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	nop
_02062E74: .word 0xFFFF0000
	thumb_func_end sub_02062E4C

	thumb_func_start sub_02062E78
sub_02062E78: ; 0x02062E78
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, [r4, #4]
	add r0, r1, r0
	str r0, [r4]
	bpl _02062E92
	mov r0, #0
	str r0, [r4]
_02062E92:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r0, [r4]
	cmp r0, #0
	ble _02062EB2
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02062EB2:
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02062E78

	thumb_func_start sub_02062EC0
sub_02062EC0: ; 0x02062EC0
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F20C
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062EC0

	thumb_func_start sub_02062ED8
sub_02062ED8: ; 0x02062ED8
	push {r4, lr}
	mov r1, #2
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062ED8

	thumb_func_start sub_02062EF0
sub_02062EF0: ; 0x02062EF0
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x80
	bl sub_0205F20C
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062EF0

	thumb_func_start sub_02062F04
sub_02062F04: ; 0x02062F04
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x80
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02062F04

	thumb_func_start sub_02062F18
sub_02062F18: ; 0x02062F18
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F20C
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062F18

	thumb_func_start sub_02062F30
sub_02062F30: ; 0x02062F30
	push {r4, lr}
	mov r1, #1
	add r4, r0, #0
	lsl r1, r1, #8
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02062F30

	thumb_func_start sub_02062F48
sub_02062F48: ; 0x02062F48
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #8
	add r5, r0, #0
	bl sub_0205F3C0
	add r4, r0, #0
	str r6, [r4]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov01_02200540
	str r0, [r4, #4]
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02062F48

	thumb_func_start sub_02062F6C
sub_02062F6C: ; 0x02062F6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov01_022003F4
	cmp r0, #1
	bne _02062F90
	ldr r0, [r4, #4]
	bl sub_02068B48
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r3, r4, r5, pc}
_02062F90:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02062F6C

	thumb_func_start sub_02062F94
sub_02062F94: ; 0x02062F94
	push {r3, lr}
	mov r1, #0
	bl sub_02062F48
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062F94

	thumb_func_start sub_02062FA0
sub_02062FA0: ; 0x02062FA0
	push {r3, lr}
	mov r1, #1
	bl sub_02062F48
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02062FA0

	thumb_func_start sub_02062FAC
sub_02062FAC: ; 0x02062FAC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #8
	add r5, r0, #0
	add r7, r2, #0
	add r6, r3, #0
	bl sub_0205F3C0
	strh r4, [r0]
	strh r6, [r0, #2]
	strh r7, [r0, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02060F24
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205F2BC
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205F328
	add r0, r5, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_0205F4E4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02062FAC

	thumb_func_start sub_02062FEC
sub_02062FEC: ; 0x02062FEC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_0205F3E4
	add r4, r0, #0
	mov r2, #6
	ldrsh r2, [r4, r2]
	mov r1, #0
	ldrsh r1, [r4, r1]
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	add r0, r5, #0
	bl sub_0206101C
	add r0, r5, #0
	bl sub_02061070
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r1, [r4, r0]
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r1, r0
	bge _02063026
	mov r0, #0
	pop {r4, r5, r6, pc}
_02063026:
	add r0, r5, #0
	mov r1, #0x28
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	bl sub_0205F484
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02062FEC

	thumb_func_start sub_0206304C
sub_0206304C: ; 0x0206304C
	push {r3, lr}
	mov r2, #6
	mov r1, #0
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206304C

	thumb_func_start sub_0206305C
sub_0206305C: ; 0x0206305C
	push {r3, lr}
	mov r2, #6
	mov r1, #1
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206305C

	thumb_func_start sub_0206306C
sub_0206306C: ; 0x0206306C
	push {r3, lr}
	mov r2, #6
	mov r1, #2
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206306C

	thumb_func_start sub_0206307C
sub_0206307C: ; 0x0206307C
	push {r3, lr}
	mov r2, #6
	mov r1, #3
	add r3, r2, #0
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206307C

	thumb_func_start sub_0206308C
sub_0206308C: ; 0x0206308C
	push {r3, lr}
	ldr r1, _020630A0 ; =_020FDA50
	bl sub_02062FEC
	cmp r0, #1
	bne _0206309C
	mov r0, #1
	pop {r3, pc}
_0206309C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020630A0: .word _020FDA50
	thumb_func_end sub_0206308C

	thumb_func_start sub_020630A4
sub_020630A4: ; 0x020630A4
	push {r3, lr}
	mov r1, #0
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630A4

	thumb_func_start sub_020630B4
sub_020630B4: ; 0x020630B4
	push {r3, lr}
	mov r1, #1
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630B4

	thumb_func_start sub_020630C4
sub_020630C4: ; 0x020630C4
	push {r3, lr}
	mov r1, #2
	mov r2, #3
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630C4

	thumb_func_start sub_020630D4
sub_020630D4: ; 0x020630D4
	push {r3, lr}
	mov r1, #3
	add r2, r1, #0
	mov r3, #7
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630D4

	thumb_func_start sub_020630E4
sub_020630E4: ; 0x020630E4
	push {r3, lr}
	ldr r1, _020630F8 ; =_020FDA1C
	bl sub_02062FEC
	cmp r0, #1
	bne _020630F4
	mov r0, #1
	pop {r3, pc}
_020630F4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_020630F8: .word _020FDA1C
	thumb_func_end sub_020630E4

	thumb_func_start sub_020630FC
sub_020630FC: ; 0x020630FC
	push {r3, lr}
	mov r1, #0
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_020630FC

	thumb_func_start sub_0206310C
sub_0206310C: ; 0x0206310C
	push {r3, lr}
	mov r1, #1
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206310C

	thumb_func_start sub_0206311C
sub_0206311C: ; 0x0206311C
	push {r3, lr}
	mov r1, #2
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206311C

	thumb_func_start sub_0206312C
sub_0206312C: ; 0x0206312C
	push {r3, lr}
	mov r1, #3
	mov r2, #7
	mov r3, #8
	bl sub_02062FAC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end sub_0206312C

	thumb_func_start sub_0206313C
sub_0206313C: ; 0x0206313C
	push {r3, lr}
	ldr r1, _02063150 ; =_020FDA68
	bl sub_02062FEC
	cmp r0, #1
	bne _0206314C
	mov r0, #1
	pop {r3, pc}
_0206314C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02063150: .word _020FDA68
	thumb_func_end sub_0206313C

	thumb_func_start sub_02063154
sub_02063154: ; 0x02063154
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #9
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063154

	thumb_func_start sub_02063170
sub_02063170: ; 0x02063170
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	cmp r1, #8
	blt _02063198
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F290
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
_02063198:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063170

	thumb_func_start sub_0206319C
sub_0206319C: ; 0x0206319C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	bl sub_0206642C
	cmp r0, #0
	beq _020631B6
	bl sub_02068B48
_020631B6:
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	bl sub_0205F97C
	add r0, r4, #0
	bl ov01_022000DC
	ldr r1, _020631EC ; =0x00010004
	add r0, r4, #0
	bl sub_0205F20C
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl sub_0205F214
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_020631EC: .word 0x00010004
	thumb_func_end sub_0206319C

	thumb_func_start sub_020631F0
sub_020631F0: ; 0x020631F0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_0205F3E4
	add r4, r0, #0
	ldr r0, _02063250 ; =_0210FACC
	add r1, sp, #0
	ldr r2, [r0]
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r4]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205F97C
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	cmp r0, #0x10
	bhs _02063228
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, pc}
_02063228:
	mov r0, #0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0205F97C
	ldr r1, _02063254 ; =0x00020028
	add r0, r5, #0
	bl sub_0205F20C
	add r0, r5, #0
	bl sub_02066438
	add r0, r5, #0
	bl sub_0205F4E4
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02063250: .word _0210FACC
_02063254: .word 0x00020028
	thumb_func_end sub_020631F0

	thumb_func_start sub_02063258
sub_02063258: ; 0x02063258
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063258

	thumb_func_start sub_02063274
sub_02063274: ; 0x02063274
	push {r4, lr}
	add r4, r0, #0
	mov r1, #4
	bl sub_0205F3C0
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F328
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02063274

	thumb_func_start sub_02063290
sub_02063290: ; 0x02063290
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F3E4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	cmp r1, #0x15
	bhs _020632A6
	mov r0, #0
	pop {r4, pc}
_020632A6:
	add r0, r4, #0
	bl sub_0205F4E4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02063290

	.rodata

_020FDA1C:
	.byte 0x00, 0x50, 0x00, 0x00
	.byte 0x00, 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00
_020FDA28:
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
_020FDA38:
	.word sub_020622B8
	.word sub_020622C4
	.word sub_020622E0
	.word sub_020622F8
	.word sub_02062314
	.word sub_02062348
_020FDA50:
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00
_020FDA68:
	.byte 0x00, 0x25, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x24, 0x00, 0x00
	.public _020FDA84
_020FDA84:
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00
	.byte 0x00, 0xC0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.public _020FDAC4
_020FDAC4:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x60, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x50, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00
	.byte 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.public _020FDB04
_020FDB04:
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x80, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00
	.byte 0x00, 0xA0, 0x00, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00
	.byte 0x00, 0x50, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
