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
	.include "global.inc"

	.public sub_0205ECE0
	.public sub_0205ED18
	.public sub_0205F160
	.public sub_0205F240
	.public MapObject_SetMovement

	.text

	thumb_func_start sub_0205F354
sub_0205F354: ; 0x0205F354
	add r0, #0xb4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F354

	thumb_func_start sub_0205F35C
sub_0205F35C: ; 0x0205F35C
	add r0, #0xb4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F35C

	thumb_func_start sub_0205F364
sub_0205F364: ; 0x0205F364
	ldr r3, _0205F36C ; =sub_0205F160
	add r0, #0xb4
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0205F36C: .word sub_0205F160
	thumb_func_end sub_0205F364

	thumb_func_start sub_0205F370
sub_0205F370: ; 0x0205F370
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F37E
	bl GF_AssertFail
_0205F37E:
	add r0, r4, #0
	bl sub_0205F394
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F370

	thumb_func_start sub_0205F394
sub_0205F394: ; 0x0205F394
	add r0, #0xd8
	bx lr
	thumb_func_end sub_0205F394

	thumb_func_start sub_0205F398
sub_0205F398: ; 0x0205F398
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F3A6
	bl GF_AssertFail
_0205F3A6:
	add r0, r4, #0
	bl sub_0205F3BC
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F398

	thumb_func_start sub_0205F3BC
sub_0205F3BC: ; 0x0205F3BC
	add r0, #0xe8
	bx lr
	thumb_func_end sub_0205F3BC

	thumb_func_start sub_0205F3C0
sub_0205F3C0: ; 0x0205F3C0
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x10
	ble _0205F3CE
	bl GF_AssertFail
_0205F3CE:
	add r0, r4, #0
	bl sub_0205F3E4
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F3C0

	thumb_func_start sub_0205F3E4
sub_0205F3E4: ; 0x0205F3E4
	add r0, #0xf8
	bx lr
	thumb_func_end sub_0205F3E4

	thumb_func_start sub_0205F3E8
sub_0205F3E8: ; 0x0205F3E8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0x20
	ble _0205F3F6
	bl GF_AssertFail
_0205F3F6:
	add r0, r4, #0
	bl sub_0205F40C
	mov r1, #0
	add r2, r5, #0
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205F3E8

	thumb_func_start sub_0205F40C
sub_0205F40C: ; 0x0205F40C
	mov r1, #0x42
	lsl r1, r1, #2
	add r0, r0, r1
	bx lr
	thumb_func_end sub_0205F40C

	thumb_func_start sub_0205F414
sub_0205F414: ; 0x0205F414
	add r0, #0xb8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F414

	thumb_func_start sub_0205F41C
sub_0205F41C: ; 0x0205F41C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xb8
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F41C

	thumb_func_start sub_0205F428
sub_0205F428: ; 0x0205F428
	add r0, #0xbc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F428

	thumb_func_start sub_0205F430
sub_0205F430: ; 0x0205F430
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xbc
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F430

	thumb_func_start sub_0205F43C
sub_0205F43C: ; 0x0205F43C
	add r0, #0xc0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F43C

	thumb_func_start sub_0205F444
sub_0205F444: ; 0x0205F444
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc0
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F444

	thumb_func_start sub_0205F450
sub_0205F450: ; 0x0205F450
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetMovement
	bl sub_0205FB00
	add r1, r0, #0
	ldr r1, [r1, #0x10]
	add r0, r4, #0
	blx r1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205F450

	thumb_func_start sub_0205F468
sub_0205F468: ; 0x0205F468
	add r0, #0xc4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F468

	thumb_func_start sub_0205F470
sub_0205F470: ; 0x0205F470
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc4
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F470

	thumb_func_start sub_0205F47C
sub_0205F47C: ; 0x0205F47C
	add r0, #0xc8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F47C

	thumb_func_start sub_0205F484
sub_0205F484: ; 0x0205F484
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xc8
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F484

	thumb_func_start sub_0205F490
sub_0205F490: ; 0x0205F490
	add r0, #0xcc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F490

	thumb_func_start sub_0205F498
sub_0205F498: ; 0x0205F498
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xcc
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F498

	thumb_func_start sub_0205F4A4
sub_0205F4A4: ; 0x0205F4A4
	add r0, #0xd0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4A4

	thumb_func_start sub_0205F4AC
sub_0205F4AC: ; 0x0205F4AC
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xd0
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F4AC

	thumb_func_start sub_0205F4B8
sub_0205F4B8: ; 0x0205F4B8
	add r0, #0xd4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4B8

	thumb_func_start sub_0205F4C0
sub_0205F4C0: ; 0x0205F4C0
	push {r3, lr}
	add r1, r0, #0
	add r1, #0xd4
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	thumb_func_end sub_0205F4C0

	thumb_func_start MapObject_SetMovementCommand
MapObject_SetMovementCommand: ; 0x0205F4CC
	add r0, #0xa4
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_SetMovementCommand

	thumb_func_start MapObject_GetMovementCommand
MapObject_GetMovementCommand: ; 0x0205F4D4
	add r0, #0xa4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_GetMovementCommand

	thumb_func_start MapObject_SetMovementStep
MapObject_SetMovementStep: ; 0x0205F4DC
	add r0, #0xa8
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_SetMovementStep

	thumb_func_start MapObject_IncMovementStep
MapObject_IncMovementStep: ; 0x0205F4E4
	add r1, r0, #0
	add r1, #0xa8
	ldr r1, [r1]
	add r0, #0xa8
	add r1, r1, #1
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_IncMovementStep

	thumb_func_start MapObject_GetMovementStep
MapObject_GetMovementStep: ; 0x0205F4F4
	add r0, #0xa8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end MapObject_GetMovementStep

	thumb_func_start sub_0205F4FC
sub_0205F4FC: ; 0x0205F4FC
	add r0, #0xac
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F4FC

	thumb_func_start sub_0205F504
sub_0205F504: ; 0x0205F504
	add r0, #0xac
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F504

	thumb_func_start sub_0205F50C
sub_0205F50C: ; 0x0205F50C
	add r0, #0xae
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F50C

	thumb_func_start sub_0205F514
sub_0205F514: ; 0x0205F514
	add r0, #0xae
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205F514

	thumb_func_start sub_0205F51C
sub_0205F51C: ; 0x0205F51C
	mov r2, #0x4a
	lsl r2, r2, #2
	strh r1, [r0, r2]
	bx lr
	thumb_func_end sub_0205F51C

	thumb_func_start sub_0205F524
sub_0205F524: ; 0x0205F524
	mov r1, #0x4a
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end sub_0205F524

	thumb_func_start MapObject_GetFieldSysPtr
MapObject_GetFieldSysPtr: ; 0x0205F52C
	push {r3, lr}
	bl sub_0205F364
	bl MapObjectMan_GetFieldSysPtr
	pop {r3, pc}
	thumb_func_end MapObject_GetFieldSysPtr

	thumb_func_start sub_0205F538
sub_0205F538: ; 0x0205F538
	push {r3, lr}
	bl sub_0205F35C
	bl sub_0205F19C
	pop {r3, pc}
	thumb_func_end sub_0205F538

	thumb_func_start sub_0205F544
sub_0205F544: ; 0x0205F544
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F7D4
	cmp r0, #1
	beq _0205F554
	bl GF_AssertFail
_0205F554:
	add r0, r4, #0
	bl MapObject_GetFlagID
	pop {r4, pc}
	thumb_func_end sub_0205F544

	thumb_func_start sub_0205F55C
sub_0205F55C: ; 0x0205F55C
	ldr r3, _0205F564 ; =sub_0205F17C
	mov r1, #6
	bx r3
	nop
_0205F564: .word sub_0205F17C
	thumb_func_end sub_0205F55C

	thumb_func_start sub_0205F568
sub_0205F568: ; 0x0205F568
	ldr r3, _0205F570 ; =sub_0205F184
	mov r1, #6
	bx r3
	nop
_0205F570: .word sub_0205F184
	thumb_func_end sub_0205F568

	thumb_func_start MapObjectMan_PauseAllMovement
MapObjectMan_PauseAllMovement: ; 0x0205F574
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl MapObjectMan_GetCount
	add r4, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r6, #0x4b
	add r5, r0, #0
	lsl r6, r6, #2
_0205F58A:
	add r0, r5, #0
	bl MapObject_IsInUse
	cmp r0, #0
	beq _0205F59A
	add r0, r5, #0
	bl MapObject_PauseMovement
_0205F59A:
	add r5, r5, r6
	sub r4, r4, #1
	bne _0205F58A
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MapObjectMan_PauseAllMovement

	thumb_func_start MapObjectMan_UnpauseAllMovement
MapObjectMan_UnpauseAllMovement: ; 0x0205F5A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl MapObjectMan_GetCount
	add r4, r0, #0
	add r0, r5, #0
	bl MapObjectMan_GetArray
	mov r6, #0x4b
	add r5, r0, #0
	lsl r6, r6, #2
_0205F5BA:
	add r0, r5, #0
	bl MapObject_IsInUse
	cmp r0, #0
	beq _0205F5CA
	add r0, r5, #0
	bl MapObject_UnpauseMovement
_0205F5CA:
	add r5, r5, r6
	sub r4, r4, #1
	bne _0205F5BA
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MapObjectMan_UnpauseAllMovement

	thumb_func_start sub_0205F5D4
sub_0205F5D4: ; 0x0205F5D4
	push {r3, lr}
	mov r1, #1
	bl sub_0205F190
	cmp r0, #0
	beq _0205F5E4
	mov r0, #1
	pop {r3, pc}
_0205F5E4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F5D4

	thumb_func_start sub_0205F5E8
sub_0205F5E8: ; 0x0205F5E8
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F35C
	add r1, r4, #0
	bl sub_0205F190
	pop {r4, pc}
	thumb_func_end sub_0205F5E8

	thumb_func_start sub_0205F5F8
sub_0205F5F8: ; 0x0205F5F8
	push {r3, lr}
	cmp r1, #0
	bne _0205F606
	mov r1, #8
	bl sub_0205F17C
	pop {r3, pc}
_0205F606:
	mov r1, #8
	bl sub_0205F184
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F5F8

	thumb_func_start sub_0205F610
sub_0205F610: ; 0x0205F610
	push {r3, lr}
	mov r1, #8
	bl sub_0205F190
	cmp r0, #0
	bne _0205F620
	mov r0, #1
	pop {r3, pc}
_0205F620:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F610

	thumb_func_start MapObject_IsInUse
MapObject_IsInUse: ; 0x0205F624
	ldr r3, _0205F62C ; =MapObject_TestBits
	mov r1, #1
	bx r3
	nop
_0205F62C: .word MapObject_TestBits
	thumb_func_end MapObject_IsInUse

	thumb_func_start MapObject_SingleMovementSetActive
MapObject_SingleMovementSetActive: ; 0x0205F630
	ldr r3, _0205F638 ; =MapObject_SetBits
	mov r1, #2
	bx r3
	nop
_0205F638: .word MapObject_SetBits
	thumb_func_end MapObject_SingleMovementSetActive

	thumb_func_start MapObject_SingleMovementSetInactive
MapObject_SingleMovementSetInactive: ; 0x0205F63C
	ldr r3, _0205F644 ; =MapObject_ClearBits
	mov r1, #2
	bx r3
	nop
_0205F644: .word MapObject_ClearBits
	thumb_func_end MapObject_SingleMovementSetInactive

	thumb_func_start MapObject_IsSingleMovementActive
MapObject_IsSingleMovementActive: ; 0x0205F648
	ldr r3, _0205F650 ; =MapObject_TestBits
	mov r1, #2
	bx r3
	nop
_0205F650: .word MapObject_TestBits
	thumb_func_end MapObject_IsSingleMovementActive

	thumb_func_start sub_0205F654
sub_0205F654: ; 0x0205F654
	ldr r3, _0205F65C ; =MapObject_SetBits
	mov r1, #4
	bx r3
	nop
_0205F65C: .word MapObject_SetBits
	thumb_func_end sub_0205F654

	thumb_func_start sub_0205F660
sub_0205F660: ; 0x0205F660
	ldr r3, _0205F668 ; =MapObject_ClearBits
	mov r1, #8
	bx r3
	nop
_0205F668: .word MapObject_ClearBits
	thumb_func_end sub_0205F660

	thumb_func_start sub_0205F66C
sub_0205F66C: ; 0x0205F66C
	ldr r3, _0205F674 ; =MapObject_SetBits
	mov r1, #1
	lsl r1, r1, #0xe
	bx r3
	.balign 4, 0
_0205F674: .word MapObject_SetBits
	thumb_func_end sub_0205F66C

	thumb_func_start sub_0205F678
sub_0205F678: ; 0x0205F678
	ldr r3, _0205F680 ; =MapObject_TestBits
	mov r1, #1
	lsl r1, r1, #0xe
	bx r3
	.balign 4, 0
_0205F680: .word MapObject_TestBits
	thumb_func_end sub_0205F678

	thumb_func_start sub_0205F684
sub_0205F684: ; 0x0205F684
	ldr r3, _0205F68C ; =MapObject_TestBits
	mov r1, #2
	lsl r1, r1, #8
	bx r3
	.balign 4, 0
_0205F68C: .word MapObject_TestBits
	thumb_func_end sub_0205F684

	thumb_func_start sub_0205F690
sub_0205F690: ; 0x0205F690
	push {r3, lr}
	cmp r1, #1
	bne _0205F6A0
	mov r1, #2
	lsl r1, r1, #8
	bl MapObject_SetBits
	pop {r3, pc}
_0205F6A0:
	mov r1, #2
	lsl r1, r1, #8
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F690

	thumb_func_start sub_0205F6AC
sub_0205F6AC: ; 0x0205F6AC
	push {r3, lr}
	cmp r1, #1
	bne _0205F6BC
	mov r1, #1
	lsl r1, r1, #0x12
	bl MapObject_ClearBits
	pop {r3, pc}
_0205F6BC:
	mov r1, #1
	lsl r1, r1, #0x12
	bl MapObject_SetBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6AC

	thumb_func_start sub_0205F6C8
sub_0205F6C8: ; 0x0205F6C8
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x12
	bl MapObject_TestBits
	cmp r0, #1
	beq _0205F6DA
	mov r0, #1
	pop {r3, pc}
_0205F6DA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6C8

	thumb_func_start sub_0205F6E0
sub_0205F6E0: ; 0x0205F6E0
	push {r3, lr}
	cmp r1, #1
	bne _0205F6F0
	mov r1, #2
	lsl r1, r1, #0x12
	bl MapObject_SetBits
	pop {r3, pc}
_0205F6F0:
	mov r1, #2
	lsl r1, r1, #0x12
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F6E0

	thumb_func_start MapObject_PauseMovement
MapObject_PauseMovement: ; 0x0205F6FC
	ldr r3, _0205F704 ; =MapObject_SetBits
	mov r1, #0x40
	bx r3
	nop
_0205F704: .word MapObject_SetBits
	thumb_func_end MapObject_PauseMovement

	thumb_func_start MapObject_UnpauseMovement
MapObject_UnpauseMovement: ; 0x0205F708
	ldr r3, _0205F710 ; =MapObject_ClearBits
	mov r1, #0x40
	bx r3
	nop
_0205F710: .word MapObject_ClearBits
	thumb_func_end MapObject_UnpauseMovement

	thumb_func_start sub_0205F714
sub_0205F714: ; 0x0205F714
	push {r4, lr}
	mov r1, #1
	lsl r1, r1, #0x1e
	add r4, r0, #0
	bl MapObject_TestBits
	cmp r0, #1
	bne _0205F728
	mov r0, #1
	pop {r4, pc}
_0205F728:
	add r0, r4, #0
	mov r1, #0x40
	bl MapObject_TestBits
	cmp r0, #1
	bne _0205F738
	mov r0, #1
	pop {r4, pc}
_0205F738:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0205F714

	thumb_func_start sub_0205F73C
sub_0205F73C: ; 0x0205F73C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205F35C
	bl sub_0205F5D4
	cmp r0, #0
	bne _0205F750
	mov r0, #0
	pop {r4, pc}
_0205F750:
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0xe
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F762
	mov r0, #1
	pop {r4, pc}
_0205F762:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205F73C

	thumb_func_start sub_0205F768
sub_0205F768: ; 0x0205F768
	push {r3, lr}
	cmp r1, #1
	bne _0205F778
	mov r1, #2
	lsl r1, r1, #0x16
	bl MapObject_SetBits
	pop {r3, pc}
_0205F778:
	mov r1, #2
	lsl r1, r1, #0x16
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F768

	thumb_func_start sub_0205F784
sub_0205F784: ; 0x0205F784
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x16
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F796
	mov r0, #1
	pop {r3, pc}
_0205F796:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F784

	thumb_func_start sub_0205F79C
sub_0205F79C: ; 0x0205F79C
	push {r3, lr}
	cmp r1, #1
	bne _0205F7AC
	mov r1, #1
	lsl r1, r1, #0xa
	bl MapObject_SetBits
	pop {r3, pc}
_0205F7AC:
	mov r1, #1
	lsl r1, r1, #0xa
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F79C

	thumb_func_start sub_0205F7B8
sub_0205F7B8: ; 0x0205F7B8
	push {r3, lr}
	cmp r1, #1
	bne _0205F7C8
	mov r1, #2
	lsl r1, r1, #0x18
	bl MapObject_SetBits
	pop {r3, pc}
_0205F7C8:
	mov r1, #2
	lsl r1, r1, #0x18
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7B8

	thumb_func_start sub_0205F7D4
sub_0205F7D4: ; 0x0205F7D4
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x18
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F7E6
	mov r0, #1
	pop {r3, pc}
_0205F7E6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7D4

	thumb_func_start sub_0205F7EC
sub_0205F7EC: ; 0x0205F7EC
	push {r3, lr}
	cmp r1, #1
	bne _0205F7FC
	mov r1, #1
	lsl r1, r1, #0x1a
	bl MapObject_SetBits
	pop {r3, pc}
_0205F7FC:
	mov r1, #1
	lsl r1, r1, #0x1a
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F7EC

	thumb_func_start sub_0205F808
sub_0205F808: ; 0x0205F808
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x1a
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F81A
	mov r0, #1
	pop {r3, pc}
_0205F81A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F808

	thumb_func_start sub_0205F820
sub_0205F820: ; 0x0205F820
	push {r3, lr}
	cmp r1, #1
	bne _0205F830
	mov r1, #1
	lsl r1, r1, #0x1c
	bl MapObject_SetBits
	pop {r3, pc}
_0205F830:
	mov r1, #1
	lsl r1, r1, #0x1c
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F820

	thumb_func_start sub_0205F83C
sub_0205F83C: ; 0x0205F83C
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x1c
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F84E
	mov r0, #1
	pop {r3, pc}
_0205F84E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F83C

	thumb_func_start sub_0205F854
sub_0205F854: ; 0x0205F854
	push {r3, lr}
	cmp r1, #1
	bne _0205F864
	mov r1, #1
	lsl r1, r1, #0x18
	bl MapObject_SetBits
	pop {r3, pc}
_0205F864:
	mov r1, #1
	lsl r1, r1, #0x18
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F854

	thumb_func_start sub_0205F870
sub_0205F870: ; 0x0205F870
	push {r3, lr}
	mov r1, #1
	lsl r1, r1, #0x18
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F882
	mov r0, #1
	pop {r3, pc}
_0205F882:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F870

	thumb_func_start sub_0205F888
sub_0205F888: ; 0x0205F888
	push {r3, lr}
	mov r1, #0x10
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F898
	mov r0, #1
	pop {r3, pc}
_0205F898:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F888

	thumb_func_start sub_0205F89C
sub_0205F89C: ; 0x0205F89C
	push {r3, lr}
	cmp r1, #1
	bne _0205F8AC
	mov r1, #2
	lsl r1, r1, #0x1c
	bl MapObject_SetBits
	pop {r3, pc}
_0205F8AC:
	mov r1, #2
	lsl r1, r1, #0x1c
	bl MapObject_ClearBits
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F89C

	thumb_func_start sub_0205F8B8
sub_0205F8B8: ; 0x0205F8B8
	push {r3, lr}
	mov r1, #2
	lsl r1, r1, #0x1c
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205F8CA
	mov r0, #1
	pop {r3, pc}
_0205F8CA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F8B8

	thumb_func_start sub_0205F8D0
sub_0205F8D0: ; 0x0205F8D0
	push {r3, lr}
	mov r1, #4
	bl sub_0205F240
	cmp r0, #0
	beq _0205F8E0
	mov r0, #1
	pop {r3, pc}
_0205F8E0:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_0205F8D0

	thumb_func_start MapObject_GetInitialX
MapObject_GetInitialX: ; 0x0205F8E4
	ldr r0, [r0, #0x4c]
	bx lr
	thumb_func_end MapObject_GetInitialX

	thumb_func_start MapObject_SetInitialX
MapObject_SetInitialX: ; 0x0205F8E8
	str r1, [r0, #0x4c]
	bx lr
	thumb_func_end MapObject_SetInitialX

	thumb_func_start MapObject_GetInitialHeight
MapObject_GetInitialHeight: ; 0x0205F8EC
	ldr r0, [r0, #0x50]
	bx lr
	thumb_func_end MapObject_GetInitialHeight

	thumb_func_start MapObject_SetInitialHeight
MapObject_SetInitialHeight: ; 0x0205F8F0
	str r1, [r0, #0x50]
	bx lr
	thumb_func_end MapObject_SetInitialHeight

	thumb_func_start MapObject_GetInitialY
MapObject_GetInitialY: ; 0x0205F8F4
	ldr r0, [r0, #0x54]
	bx lr
	thumb_func_end MapObject_GetInitialY

	thumb_func_start MapObject_SetInitialY
MapObject_SetInitialY: ; 0x0205F8F8
	str r1, [r0, #0x54]
	bx lr
	thumb_func_end MapObject_SetInitialY

	thumb_func_start MapObject_GetPrevX
MapObject_GetPrevX: ; 0x0205F8FC
	ldr r0, [r0, #0x58]
	bx lr
	thumb_func_end MapObject_GetPrevX

	thumb_func_start MapObject_SetPrevX
MapObject_SetPrevX: ; 0x0205F900
	str r1, [r0, #0x58]
	bx lr
	thumb_func_end MapObject_SetPrevX

	thumb_func_start MapObject_GetPrevHeight
MapObject_GetPrevHeight: ; 0x0205F904
	ldr r0, [r0, #0x5c]
	bx lr
	thumb_func_end MapObject_GetPrevHeight

	thumb_func_start MapObject_SetPrevHeight
MapObject_SetPrevHeight: ; 0x0205F908
	str r1, [r0, #0x5c]
	bx lr
	thumb_func_end MapObject_SetPrevHeight

	thumb_func_start MapObject_GetPrevY
MapObject_GetPrevY: ; 0x0205F90C
	ldr r0, [r0, #0x60]
	bx lr
	thumb_func_end MapObject_GetPrevY

	thumb_func_start MapObject_SetPrevY
MapObject_SetPrevY: ; 0x0205F910
	str r1, [r0, #0x60]
	bx lr
	thumb_func_end MapObject_SetPrevY

	thumb_func_start MapObject_GetCurrentX
MapObject_GetCurrentX: ; 0x0205F914
	ldr r0, [r0, #0x64]
	bx lr
	thumb_func_end MapObject_GetCurrentX

	thumb_func_start MapObject_SetCurrentX
MapObject_SetCurrentX: ; 0x0205F918
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end MapObject_SetCurrentX

	thumb_func_start MapObject_AddCurrentX
MapObject_AddCurrentX: ; 0x0205F91C
	ldr r2, [r0, #0x64]
	add r1, r2, r1
	str r1, [r0, #0x64]
	bx lr
	thumb_func_end MapObject_AddCurrentX

	thumb_func_start MapObject_GetCurrentHeight
MapObject_GetCurrentHeight: ; 0x0205F924
	ldr r0, [r0, #0x68]
	bx lr
	thumb_func_end MapObject_GetCurrentHeight

	thumb_func_start MapObject_SetCurrentHeight
MapObject_SetCurrentHeight: ; 0x0205F928
	str r1, [r0, #0x68]
	bx lr
	thumb_func_end MapObject_SetCurrentHeight

	thumb_func_start MapObject_AddCurrentHeight
MapObject_AddCurrentHeight: ; 0x0205F92C
	ldr r2, [r0, #0x68]
	add r1, r2, r1
	str r1, [r0, #0x68]
	bx lr
	thumb_func_end MapObject_AddCurrentHeight

	thumb_func_start MapObject_GetCurrentY
MapObject_GetCurrentY: ; 0x0205F934
	ldr r0, [r0, #0x6c]
	bx lr
	thumb_func_end MapObject_GetCurrentY

	thumb_func_start MapObject_SetCurrentY
MapObject_SetCurrentY: ; 0x0205F938
	str r1, [r0, #0x6c]
	bx lr
	thumb_func_end MapObject_SetCurrentY

	thumb_func_start MapObject_AddCurrentY
MapObject_AddCurrentY: ; 0x0205F93C
	ldr r2, [r0, #0x6c]
	add r1, r2, r1
	str r1, [r0, #0x6c]
	bx lr
	thumb_func_end MapObject_AddCurrentY

	thumb_func_start MapObject_GetPositionVec
MapObject_GetPositionVec: ; 0x0205F944
	add r2, r0, #0
	add r2, #0x70
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end MapObject_GetPositionVec

	thumb_func_start MapObject_SetPositionVec
MapObject_SetPositionVec: ; 0x0205F954
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x70
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end MapObject_SetPositionVec

	thumb_func_start MapObject_GetPositionVecPtr
MapObject_GetPositionVecPtr: ; 0x0205F964
	add r0, #0x70
	bx lr
	thumb_func_end MapObject_GetPositionVecPtr

	thumb_func_start MapObject_GetPosVecYCoord
MapObject_GetPosVecYCoord: ; 0x0205F968
	ldr r0, [r0, #0x74]
	bx lr
	thumb_func_end MapObject_GetPosVecYCoord

	thumb_func_start MapObject_GetFacingVec
MapObject_GetFacingVec: ; 0x0205F96C
	add r2, r0, #0
	add r2, #0x7c
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end MapObject_GetFacingVec

	thumb_func_start MapObject_SetFacingVec
MapObject_SetFacingVec: ; 0x0205F97C
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x7c
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end MapObject_SetFacingVec

	thumb_func_start MapObject_GetFacingVecPtr
MapObject_GetFacingVecPtr: ; 0x0205F98C
	add r0, #0x7c
	bx lr
	thumb_func_end MapObject_GetFacingVecPtr

	thumb_func_start sub_0205F990
sub_0205F990: ; 0x0205F990
	add r2, r0, #0
	add r2, #0x88
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F990

	thumb_func_start sub_0205F9A0
sub_0205F9A0: ; 0x0205F9A0
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x88
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F9A0

	thumb_func_start sub_0205F9B0
sub_0205F9B0: ; 0x0205F9B0
	add r2, r0, #0
	add r2, #0x94
	add r3, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205F9B0

	thumb_func_start sub_0205F9C0
sub_0205F9C0: ; 0x0205F9C0
	add r3, r1, #0
	add r2, r0, #0
	ldmia r3!, {r0, r1}
	add r2, #0x94
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	bx lr
	thumb_func_end sub_0205F9C0

	thumb_func_start sub_0205F9D0
sub_0205F9D0: ; 0x0205F9D0
	push {r3, lr}
	bl MapObject_GetPosVecYCoord
	asr r1, r0, #3
	asr r0, r1, #0xb
	lsr r0, r0, #0x14
	add r0, r1, r0
	asr r0, r0, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0205F9D0

	thumb_func_start ObjectEventTemplate_SetID
ObjectEventTemplate_SetID: ; 0x0205F9E4
	strh r1, [r0]
	bx lr
	thumb_func_end ObjectEventTemplate_SetID

	thumb_func_start ObjectEventTemplate_GetID
ObjectEventTemplate_GetID: ; 0x0205F9E8
	ldrh r0, [r0]
	bx lr
	thumb_func_end ObjectEventTemplate_GetID

	thumb_func_start ObjectEventTemplate_SetSprite
ObjectEventTemplate_SetSprite: ; 0x0205F9EC
	strh r1, [r0, #2]
	bx lr
	thumb_func_end ObjectEventTemplate_SetSprite

	thumb_func_start ObjectEventTemplate_GetSprite
ObjectEventTemplate_GetSprite: ; 0x0205F9F0
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end ObjectEventTemplate_GetSprite

	thumb_func_start ObjectEventTemplate_SetMovement
ObjectEventTemplate_SetMovement: ; 0x0205F9F4
	strh r1, [r0, #4]
	bx lr
	thumb_func_end ObjectEventTemplate_SetMovement

	thumb_func_start ObjectEventTemplate_GetMovement
ObjectEventTemplate_GetMovement: ; 0x0205F9F8
	ldrh r0, [r0, #4]
	bx lr
	thumb_func_end ObjectEventTemplate_GetMovement

	thumb_func_start ObjectEventTemplate_SetType
ObjectEventTemplate_SetType: ; 0x0205F9FC
	strh r1, [r0, #6]
	bx lr
	thumb_func_end ObjectEventTemplate_SetType

	thumb_func_start ObjectEventTemplate_GetType
ObjectEventTemplate_GetType: ; 0x0205FA00
	ldrh r0, [r0, #6]
	bx lr
	thumb_func_end ObjectEventTemplate_GetType

	thumb_func_start ObjectEventTemplate_SetFlagID
ObjectEventTemplate_SetFlagID: ; 0x0205FA04
	strh r1, [r0, #8]
	bx lr
	thumb_func_end ObjectEventTemplate_SetFlagID

	thumb_func_start ObjectEventTemplate_GetFlagID
ObjectEventTemplate_GetFlagID: ; 0x0205FA08
	ldrh r0, [r0, #8]
	bx lr
	thumb_func_end ObjectEventTemplate_GetFlagID

	thumb_func_start ObjectEventTemplate_SetScript
ObjectEventTemplate_SetScript: ; 0x0205FA0C
	strh r1, [r0, #0xa]
	bx lr
	thumb_func_end ObjectEventTemplate_SetScript

	thumb_func_start ObjectEventTemplate_GetScript
ObjectEventTemplate_GetScript: ; 0x0205FA10
	ldrh r0, [r0, #0xa]
	bx lr
	thumb_func_end ObjectEventTemplate_GetScript

	thumb_func_start ObjectEventTemplate_SetFacing
ObjectEventTemplate_SetFacing: ; 0x0205FA14
	strh r1, [r0, #0xc]
	bx lr
	thumb_func_end ObjectEventTemplate_SetFacing

	thumb_func_start ObjectEventTemplate_GetFacing
ObjectEventTemplate_GetFacing: ; 0x0205FA18
	mov r1, #0xc
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_GetFacing

	thumb_func_start ObjectEventTemplate_SetParam
ObjectEventTemplate_SetParam: ; 0x0205FA20
	push {r3, lr}
	cmp r2, #0
	beq _0205FA30
	cmp r2, #1
	beq _0205FA34
	cmp r2, #2
	beq _0205FA38
	b _0205FA3C
_0205FA30:
	strh r1, [r0, #0xe]
	pop {r3, pc}
_0205FA34:
	strh r1, [r0, #0x10]
	pop {r3, pc}
_0205FA38:
	strh r1, [r0, #0x12]
	pop {r3, pc}
_0205FA3C:
	bl GF_AssertFail
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_SetParam

	thumb_func_start ObjectEventTemplate_GetParam
ObjectEventTemplate_GetParam: ; 0x0205FA44
	push {r3, lr}
	cmp r1, #0
	beq _0205FA54
	cmp r1, #1
	beq _0205FA58
	cmp r1, #2
	beq _0205FA5C
	b _0205FA60
_0205FA54:
	ldrh r0, [r0, #0xe]
	pop {r3, pc}
_0205FA58:
	ldrh r0, [r0, #0x10]
	pop {r3, pc}
_0205FA5C:
	ldrh r0, [r0, #0x12]
	pop {r3, pc}
_0205FA60:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ObjectEventTemplate_GetParam

	thumb_func_start ObjectEventTemplate_SetXRange
ObjectEventTemplate_SetXRange: ; 0x0205FA68
	strh r1, [r0, #0x14]
	bx lr
	thumb_func_end ObjectEventTemplate_SetXRange

	thumb_func_start ObjectEventTemplate_GetXRange
ObjectEventTemplate_GetXRange: ; 0x0205FA6C
	mov r1, #0x14
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_GetXRange

	thumb_func_start ObjectEventTemplate_SetYRange
ObjectEventTemplate_SetYRange: ; 0x0205FA74
	strh r1, [r0, #0x16]
	bx lr
	thumb_func_end ObjectEventTemplate_SetYRange

	thumb_func_start ObjectEventTemplate_GetYRange
ObjectEventTemplate_GetYRange: ; 0x0205FA78
	mov r1, #0x16
	ldrsh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end ObjectEventTemplate_GetYRange

	thumb_func_start ObjectEventTemplate_SetXCoord
ObjectEventTemplate_SetXCoord: ; 0x0205FA80
	strh r1, [r0, #0x18]
	bx lr
	thumb_func_end ObjectEventTemplate_SetXCoord

	thumb_func_start ObjectEventTemplate_GetXCoord
ObjectEventTemplate_GetXCoord: ; 0x0205FA84
	ldrh r0, [r0, #0x18]
	bx lr
	thumb_func_end ObjectEventTemplate_GetXCoord

	thumb_func_start ObjectEventTemplate_SetHeight
ObjectEventTemplate_SetHeight: ; 0x0205FA88
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ObjectEventTemplate_SetHeight

	thumb_func_start ObjectEventTemplate_GetHeight
ObjectEventTemplate_GetHeight: ; 0x0205FA8C
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end ObjectEventTemplate_GetHeight

	thumb_func_start ObjectEventTemplate_SetYCoord
ObjectEventTemplate_SetYCoord: ; 0x0205FA90
	strh r1, [r0, #0x1a]
	bx lr
	thumb_func_end ObjectEventTemplate_SetYCoord

	thumb_func_start ObjectEventTemplate_GetYCoord
ObjectEventTemplate_GetYCoord: ; 0x0205FA94
	ldrh r0, [r0, #0x1a]
	bx lr
	thumb_func_end ObjectEventTemplate_GetYCoord

	thumb_func_start sub_0205FA98
sub_0205FA98: ; 0x0205FA98
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	str r2, [sp]
	mov r4, #0
	add r5, r2, #0
_0205FAA4:
	add r0, r5, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #0
	bne _0205FAC0
	add r0, r5, #0
	bl ObjectEventTemplate_GetID
	cmp r6, r0
	bne _0205FAC0
	ldr r0, [sp]
	lsl r1, r4, #5
	add r0, r0, r1
	pop {r3, r4, r5, r6, r7, pc}
_0205FAC0:
	add r4, r4, #1
	add r5, #0x20
	cmp r4, r7
	blt _0205FAA4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FA98

	thumb_func_start ObjectEventTemplate_ScriptIdIsFFFF
ObjectEventTemplate_ScriptIdIsFFFF: ; 0x0205FACC
	push {r3, lr}
	bl ObjectEventTemplate_GetScript
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _0205FAE4 ; =0x0000FFFF
	cmp r1, r0
	bne _0205FAE0
	mov r0, #1
	pop {r3, pc}
_0205FAE0:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0205FAE4: .word 0x0000FFFF
	thumb_func_end ObjectEventTemplate_ScriptIdIsFFFF

	thumb_func_start ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF
ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF: ; 0x0205FAE8
	push {r4, lr}
	add r4, r0, #0
	bl ObjectEventTemplate_ScriptIdIsFFFF
	cmp r0, #1
	beq _0205FAF8
	bl GF_AssertFail
_0205FAF8:
	add r0, r4, #0
	bl ObjectEventTemplate_GetFlagID
	pop {r4, pc}
	thumb_func_end ObjectEventTemplate_GetFlagID_AssertScriptIdIsFFFF

	thumb_func_start sub_0205FB00
sub_0205FB00: ; 0x0205FB00
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x39
	blo _0205FB0C
	bl GF_AssertFail
_0205FB0C:
	ldr r0, _0205FB14 ; =_020FD1F4
	lsl r1, r4, #2
	ldr r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_0205FB14: .word _020FD1F4
	thumb_func_end sub_0205FB00

	thumb_func_start sub_0205FB18
sub_0205FB18: ; 0x0205FB18
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205FB18

	thumb_func_start sub_0205FB1C
sub_0205FB1C: ; 0x0205FB1C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205FB1C

	thumb_func_start sub_0205FB20
sub_0205FB20: ; 0x0205FB20
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205FB20

	thumb_func_start sub_0205FB24
sub_0205FB24: ; 0x0205FB24
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0205FB24

	thumb_func_start sub_0205FB28
sub_0205FB28: ; 0x0205FB28
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_0205FB28

	thumb_func_start sub_0205FB2C
sub_0205FB2C: ; 0x0205FB2C
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_0205FB2C

	thumb_func_start sub_0205FB30
sub_0205FB30: ; 0x0205FB30
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0205FB30

	thumb_func_start sub_0205FB34
sub_0205FB34: ; 0x0205FB34
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_0205FB34

	thumb_func_start sub_0205FB38
sub_0205FB38: ; 0x0205FB38
	push {r3, lr}
	bl GetObjectEventGfxInfoPtr
	cmp r0, #0
	bne _0205FB46
	mov r0, #0
	pop {r3, pc}
_0205FB46:
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x16
	lsr r0, r0, #0x1b
	lsl r1, r0, #2
	ldr r0, _0205FB54 ; =ov01_02209A38
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0205FB54: .word ov01_02209A38
	thumb_func_end sub_0205FB38

	thumb_func_start sub_0205FB58
sub_0205FB58: ; 0x0205FB58
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl MapObjectMan_GetCount
	add r7, r0, #0
	add r0, r4, #0
	bl MapObjectMan_GetArray
	add r4, r0, #0
_0205FB70:
	add r0, r4, #0
	mov r1, #1
	bl MapObject_GetBitsMask
	cmp r0, #0
	beq _0205FBB2
	ldr r0, [sp]
	cmp r0, #0
	beq _0205FB9A
	add r0, r4, #0
	bl MapObject_GetPrevX
	cmp r5, r0
	bne _0205FB9A
	add r0, r4, #0
	bl MapObject_GetPrevY
	cmp r6, r0
	bne _0205FB9A
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205FB9A:
	add r0, r4, #0
	bl MapObject_GetCurrentX
	cmp r5, r0
	bne _0205FBB2
	add r0, r4, #0
	bl MapObject_GetCurrentY
	cmp r6, r0
	bne _0205FBB2
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205FBB2:
	mov r0, #0x4b
	lsl r0, r0, #2
	add r4, r4, r0
	sub r7, r7, #1
	bne _0205FB70
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205FB58

	thumb_func_start sub_0205FBC0
sub_0205FBC0: ; 0x0205FBC0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	ldr r1, [r4]
	add r6, r2, #0
	asr r2, r1, #4
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	add r5, r0, #0
	bl MapObject_SetCurrentX
	ldr r1, [r4, #4]
	add r0, r5, #0
	asr r2, r1, #3
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl MapObject_SetCurrentHeight
	ldr r1, [r4, #8]
	add r0, r5, #0
	asr r2, r1, #4
	asr r1, r2, #0xb
	lsr r1, r1, #0x14
	add r1, r2, r1
	asr r1, r1, #0xc
	bl MapObject_SetCurrentY
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl sub_02060F78
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_ForceSetFacingDirection
	add r0, r5, #0
	bl MapObject_ClearHeldMovement
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r5, #0
	mov r1, #0xa
	bl MapObject_ClearBits
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205FBC0

	thumb_func_start sub_0205FC2C
sub_0205FC2C: ; 0x0205FC2C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r2, #0
	mov r2, #2
	add r6, r3, #0
	lsl r3, r1, #0x10
	lsl r2, r2, #0xe
	add r2, r3, r2
	add r5, r0, #0
	str r2, [sp]
	bl MapObject_SetCurrentX
	lsl r0, r4, #0xf
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetCurrentHeight
	mov r0, #2
	lsl r1, r6, #0x10
	lsl r0, r0, #0xe
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_SetCurrentY
	add r0, r5, #0
	add r1, sp, #0
	bl MapObject_SetPositionVec
	add r0, r5, #0
	bl sub_02060F78
	ldr r1, [sp, #0x20]
	add r0, r5, #0
	bl MapObject_ForceSetFacingDirection
	add r0, r5, #0
	mov r1, #4
	bl MapObject_SetBits
	add r0, r5, #0
	mov r1, #0xa
	bl MapObject_ClearBits
	add r0, r5, #0
	bl MapObject_ClearHeldMovement
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0205FC2C

	thumb_func_start sub_0205FC94
sub_0205FC94: ; 0x0205FC94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0205F444
	add r0, r5, #0
	add r1, r4, #0
	bl MapObject_SetMovement
	add r0, r5, #0
	bl sub_0205ECE0
	add r0, r5, #0
	bl sub_0205FD20
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205FC94

	thumb_func_start sub_0205FCB4
sub_0205FCB4: ; 0x0205FCB4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCB4

	thumb_func_start sub_0205FCB8
sub_0205FCB8: ; 0x0205FCB8
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCB8

	thumb_func_start sub_0205FCBC
sub_0205FCBC: ; 0x0205FCBC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCBC

	thumb_func_start sub_0205FCC0
sub_0205FCC0: ; 0x0205FCC0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC0

	thumb_func_start sub_0205FCC4
sub_0205FCC4: ; 0x0205FCC4
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC4

	thumb_func_start sub_0205FCC8
sub_0205FCC8: ; 0x0205FCC8
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCC8

	thumb_func_start sub_0205FCCC
sub_0205FCCC: ; 0x0205FCCC
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCCC

	thumb_func_start sub_0205FCD0
sub_0205FCD0: ; 0x0205FCD0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205FCD0

	thumb_func_start sub_0205FCD4
sub_0205FCD4: ; 0x0205FCD4
	push {r4, lr}
	add r4, r0, #0
	bl MapObject_GetGfxID
	mov r1, #2
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _0205FCE8
	ldr r0, _0205FCFC ; =ov01_0220724C
	b _0205FCEC
_0205FCE8:
	bl sub_0205FB38
_0205FCEC:
	bl sub_0205FB28
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205F47C
	pop {r4, pc}
	nop
_0205FCFC: .word ov01_0220724C
	thumb_func_end sub_0205FCD4

	thumb_func_start SaveMapObjects_SearchSpriteId
SaveMapObjects_SearchSpriteId: ; 0x0205FD00
	push {r3, r4}
	cmp r1, #0
	beq _0205FD1A
	mov r3, #1
_0205FD08:
	ldr r4, [r0]
	tst r4, r3
	beq _0205FD14
	ldrh r4, [r0, #0x12]
	cmp r4, r2
	beq _0205FD1C
_0205FD14:
	add r0, #0x50
	sub r1, r1, #1
	bne _0205FD08
_0205FD1A:
	mov r0, #0
_0205FD1C:
	pop {r3, r4}
	bx lr
	thumb_func_end SaveMapObjects_SearchSpriteId
