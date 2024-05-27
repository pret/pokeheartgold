#include "constants/items.h"
	.include "asm/macros.inc"
	.include "unk_0203BC10.inc"
	.include "global.inc"

	.rodata

	.extern sub_0203C8FC
	.extern sub_0203CA44
	.extern sub_0203CF0C
	.extern sub_0203D1A8
	.extern sub_0203D244
	.extern sub_0203D318
	.extern sub_0203D394
	.extern sub_0203D488
	.extern sub_0203D500
	.extern sub_0203D2CC

	.public _020FA0AC
_020FA0AC:
	.byte 0x01, 0x04, 0x00, 0x00
	.public _020FA0B0
_020FA0B0:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00
	.public _020FA0B8
_020FA0B8:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0xFF, 0x00, 0x00, 0x00
	.public _020FA0C4
_020FA0C4:
	.word 0
	.word 1
	.word 2
	.word 4
	.word 5
	.word 6
	.word 100
	.word 100
	.word 100
	.word 100
	.word 100
	.word 3
	.global _020FA0F4
_020FA0F4:
	.word  0, sub_0203C8FC
	.word  1, sub_0203CA44
	.word  2, sub_0203CF0C
	.word  3, sub_0203D1A8
	.word  4, sub_0203D244
	.word  5, sub_0203D318
	.word  6, -2
	.word  7, sub_0203D394
	.word  8, sub_0203D488
	.word 14, sub_0203D500
	.word 14, sub_0203D500
	.word 14, sub_0203D500
	.word 14, sub_0203D2CC

	.text

	.extern sub_0203C1FC
	.extern sub_0203C38C
	.extern sub_0203C3B8
	.extern sub_0203C460
	.extern sub_0203CF74
	.extern sub_0203CFC0

	thumb_func_start sub_0203D394
sub_0203D394: ; 0x0203D394
	push {r4, lr}
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203D3B4 ; =sub_0203D3B8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203D3B4: .word sub_0203D3B8
	thumb_func_end sub_0203D394

	thumb_func_start sub_0203D3B8
sub_0203D3B8: ; 0x0203D3B8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	mov r0, #0xb
	str r0, [sp]
	mov r3, #0x43
	lsl r3, r3, #2
	ldr r2, [r5, #0xc]
	mov r0, #2
	mov r1, #0
	add r3, r5, r3
	bl EasyChat_CreateArgs
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	add r0, sp, #4
	mov r1, #4
	bl MailMsg_Init_WithBank
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	add r1, sp, #4
	bl sub_02090D20
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	add r0, r5, #0
	bl EasyChat_LaunchApp
	mov r0, #0xd5
	ldr r1, _0203D414 ; =sub_0203D418
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0203D414: .word sub_0203D418
	thumb_func_end sub_0203D3B8

	thumb_func_start sub_0203D418
sub_0203D418: ; 0x0203D418
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnvironment
	add r5, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02090D48
	cmp r0, #0
	bne _0203D466
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, sp, #0
	bl sub_02090D60
	bl sub_02035650
	cmp r0, #0
	beq _0203D460
	add r0, sp, #0
	bl sub_0205AB88
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, sp, #0
	bl sub_0205AA6C
_0203D460:
	mov r0, #0xa
	strh r0, [r5, #0x26]
	b _0203D46A
_0203D466:
	mov r0, #0xf
	strh r0, [r5, #0x26]
_0203D46A:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl EasyChat_FreeArgs
	add r0, r4, #0
	bl sub_020505C0
	add r4, #0x84
	ldr r0, [r4]
	bl sub_0205AD0C
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203D418

	thumb_func_start sub_0203D488
sub_0203D488: ; 0x0203D488
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnvironment
	add r1, r4, #0
	add r6, r0, #0
	bl sub_0203C38C
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x3f
	bic r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_CheckSafariSysFlag
	cmp r0, #1
	bne _0203D4CA
	ldr r1, _0203D4F8 ; =0x00002266
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	b _0203D4EE
_0203D4CA:
	ldr r0, [r4, #0xc]
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_CheckBugContestFlag
	cmp r0, #1
	bne _0203D4E4
	ldr r1, _0203D4FC ; =0x000028A4
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	b _0203D4EE
_0203D4E4:
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl StartScriptFromMenu
_0203D4EE:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0203D4F8: .word 0x00002266
_0203D4FC: .word 0x000028A4
	thumb_func_end sub_0203D488

	thumb_func_start sub_0203D500
sub_0203D500: ; 0x0203D500
	push {r4, lr}
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xd5
	ldr r1, _0203D520 ; =sub_0203D524
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #4
	strh r0, [r4, #0x26]
	mov r0, #1
	pop {r4, pc}
	nop
_0203D520: .word sub_0203D524
	thumb_func_end sub_0203D500

	thumb_func_start sub_0203D524
sub_0203D524: ; 0x0203D524
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	add r0, r5, #0
	bl PokegearPhone_LaunchApp
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, _0203D54C ; =sub_0203D550
	sub r1, #0x2c
	str r0, [r4, r1]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D54C: .word sub_0203D550
	thumb_func_end sub_0203D524

	thumb_func_start sub_0203D550
sub_0203D550: ; 0x0203D550
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0203D578
	mov r0, #0xb
	bl FreeToHeapExplicit
_0203D578:
	mov r0, #0xf
	strh r0, [r4, #0x26]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203D550

	thumb_func_start sub_0203D580
sub_0203D580: ; 0x0203D580
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	str r0, [sp]
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x3c
	bl AllocFromHeap
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r2, #0x3c
	add r6, r0, #0
	bl memcpy
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldrb r0, [r6, #0x12]
	cmp r0, #2
	bne _0203D634
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0xe1
	lsl r1, r1, #2
	ldr r7, [r4, r1]
	ldr r1, [sp]
	add r2, r4, #0
	add r5, r0, #0
	bl sub_0203CF74
	ldrh r0, [r7]
	strh r0, [r5, #0x28]
	add r0, r5, #0
	ldrb r1, [r6, #0x14]
	add r0, #0x26
	strb r1, [r0]
	ldrh r0, [r6, #0x18]
	strh r0, [r5, #0x2a]
	add r0, r5, #0
	ldrb r1, [r6, #0x16]
	add r0, #0x2c
	strb r1, [r0]
	ldrh r0, [r7]
	cmp r0, #0
	beq _0203D5FA
	add r0, r5, #0
	mov r1, #7
	add r0, #0x24
	strb r1, [r0]
	mov r0, #0
	b _0203D604
_0203D5FA:
	add r0, r5, #0
	mov r1, #8
	add r0, #0x24
	strb r1, [r0]
	ldrh r0, [r7, #2]
_0203D604:
	str r0, [r5, #0x38]
	mov r1, #0x43
	ldr r0, [sp]
	lsl r1, r1, #2
	add r0, r0, r1
	str r0, [r5, #0x20]
	ldr r0, [sp]
	ldr r1, _0203D65C ; =gOverlayTemplate_PartyMenu
	add r2, r5, #0
	bl FieldSystem_LaunchApplication
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0xe
	lsl r0, r0, #6
	str r5, [r4, r0]
	ldr r1, _0203D660 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D650
_0203D634:
	mov r1, #0x37
	lsl r1, r1, #4
	ldrb r2, [r6, #0x14]
	ldr r0, [sp]
	add r1, r4, r1
	bl PartyMenu_LaunchApp_Unk1
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D660 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
_0203D650:
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203D65C: .word gOverlayTemplate_PartyMenu
_0203D660: .word sub_0203CA9C
	thumb_func_end sub_0203D580

	thumb_func_start sub_0203D664
sub_0203D664: ; 0x0203D664
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	str r0, [sp, #4]
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0xc]
	bl Save_Bag_Get
	add r4, r0, #0
	mov r5, #0
	mov r6, #1
	mov r7, #0xb
_0203D688:
	add r0, r5, #0
	bl BerryToItemId
	add r1, r0, #0
	add r0, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl Bag_HasItem
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #0x40
	blo _0203D688
	ldr r0, [sp, #4]
	add r3, sp, #8
	add r0, #0x94
	str r0, [sp, #4]
	ldr r0, [r0]
	mov r1, #4
	add r2, sp, #8
	add r3, #1
	bl BagCursor_Field_PocketGetPosition
	ldr r0, [sp]
	ldr r1, _0203D6C4 ; =sub_0203D6C8
	bl sub_0203C8F0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203D6C4: .word sub_0203D6C8
	thumb_func_end sub_0203D664

	thumb_func_start sub_0203D6C8
sub_0203D6C8: ; 0x0203D6C8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x94
	mov r2, #0
	ldr r0, [r0]
	mov r1, #4
	add r3, r2, #0
	bl BagCursor_Field_PocketSetPosition
	mov r1, #0xe
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D714 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D714: .word sub_0203CFC0
	thumb_func_end sub_0203D6C8

	thumb_func_start sub_0203D718
sub_0203D718: ; 0x0203D718
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	mov r1, #0xe
	add r4, r0, #0
	lsl r1, r1, #6
	ldr r1, [r4, r1]
	mov r0, #0xb
	bl FreeToHeapExplicit
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D754 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D754: .word sub_0203CFC0
	thumb_func_end sub_0203D718

	thumb_func_start Task_UseFlyInField
Task_UseFlyInField: ; 0x0203D758
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r7, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	mov r0, #0xb
	ldr r6, [r1]
	bl FreeToHeapExplicit
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _0203D7AE
	mov r0, #0xb
	add r1, r5, #0
	bl FreeToHeapExplicit
	mov r1, #0x37
	lsl r1, r1, #4
	lsl r2, r6, #0x18
	add r0, r7, #0
	add r1, r4, r1
	lsr r2, r2, #0x18
	bl PartyMenu_LaunchApp_Unk1
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D810 ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D808
_0203D7AE:
	ldr r0, [r7, #0xc]
	bl SaveArray_Party_Get
	add r1, r6, #0
	bl Party_GetMonByIndex
	add r2, r0, #0
	ldrh r0, [r5, #0x20]
	lsl r3, r6, #0x10
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [r5, #0x18]
	lsr r3, r3, #0x10
	lsl r0, r0, #5
	add r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r5, #0x1c]
	lsl r0, r0, #5
	add r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xb
	bl sub_02067BF8
	mov r1, #0xe
	lsl r1, r1, #6
	add r5, r0, #0
	ldr r1, [r4, r1]
	mov r0, #0xb
	bl FreeToHeapExplicit
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _0203D814 ; =sub_02067C30
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
_0203D808:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0203D810: .word sub_0203CA9C
_0203D814: .word sub_02067C30
	thumb_func_end Task_UseFlyInField

	thumb_func_start sub_0203D818
sub_0203D818: ; 0x0203D818
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0xb
	mov r1, #4
	add r6, r2, #0
	bl AllocFromHeap
	strh r5, [r0]
	strb r6, [r0, #2]
	strb r4, [r0, #3]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203D818

	thumb_func_start sub_0203D830
sub_0203D830: ; 0x0203D830
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r6, [r4, r0]
	ldrb r1, [r6, #3]
	cmp r1, #3
	bhi _0203D928
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203D85A: ; jump table
	.short _0203D8AC - _0203D85A - 2 ; case 0
	.short _0203D8EC - _0203D85A - 2 ; case 1
	.short _0203D886 - _0203D85A - 2 ; case 2
	.short _0203D862 - _0203D85A - 2 ; case 3
_0203D862:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D938 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D928
_0203D886:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0x37
	lsl r1, r1, #4
	ldrb r2, [r6, #2]
	add r0, r5, #0
	add r1, r4, r1
	bl PartyMenu_LaunchApp_Unk1
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D93C ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D928
_0203D8AC:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F6C
	cmp r0, #1
	bne _0203D8C4
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xc
	bl sub_0203D940
	b _0203D928
_0203D8C4:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0x37
	lsl r1, r1, #4
	ldrb r2, [r6, #2]
	add r0, r5, #0
	add r1, r4, r1
	bl PartyMenu_LaunchApp_Unk1
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D93C ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	b _0203D928
_0203D8EC:
	sub r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_02090F6C
	cmp r0, #1
	bne _0203D904
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xb
	bl sub_0203D940
	b _0203D928
_0203D904:
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02090F90
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D938 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
_0203D928:
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0203D938: .word sub_0203CFC0
_0203D93C: .word sub_0203CA9C
	thumb_func_end sub_0203D830

	thumb_func_start sub_0203D940
sub_0203D940: ; 0x0203D940
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0xe1
	add r5, r1, #0
	str r2, [sp]
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	add r1, r7, #0
	add r2, r5, #0
	add r4, r0, #0
	bl sub_0203CF74
	ldrh r0, [r6]
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #2]
	add r0, #0x26
	strb r1, [r0]
	add r1, r4, #0
	ldr r0, [sp]
	add r1, #0x24
	strb r0, [r1]
	ldrb r1, [r6, #2]
	ldr r0, [r4]
	bl Party_GetMonByIndex
	add r1, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02090F70
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl sub_02090F90
	ldr r1, _0203D9AC ; =gOverlayTemplate_PartyMenu
	add r0, r7, #0
	add r2, r4, #0
	bl FieldSystem_LaunchApplication
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r5, r0]
	ldr r1, _0203D9B0 ; =sub_0203CA9C
	add r0, r5, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0203D9AC: .word gOverlayTemplate_PartyMenu
_0203D9B0: .word sub_0203CA9C
	thumb_func_end sub_0203D940

	thumb_func_start sub_0203D9B4
sub_0203D9B4: ; 0x0203D9B4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	mov r1, #0xd6
	add r4, r0, #0
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _0203D9E4 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0203D9E4: .word sub_0203CFC0
	thumb_func_end sub_0203D9B4

	thumb_func_start sub_0203D9E8
sub_0203D9E8: ; 0x0203D9E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r5, r0, #0
	bl TaskManager_GetFieldSystem
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnvironment
	add r6, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r5, [r6, r0]
	bl Sound_Stop
	mov r0, #3
	mov r1, #0x47
	lsl r2, r0, #0x10
	bl CreateHeap
	ldr r0, [r4, #0xc]
	bl SaveArray_Party_Get
	ldrb r1, [r5]
	str r0, [sp, #0x1c]
	bl Party_GetMonByIndex
	str r0, [sp, #0x20]
	ldrb r0, [r5, #1]
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _0203DA72
	bl Save_PlayerData_GetOptionsAddr
	str r0, [sp, #0x24]
	ldr r0, [r4, #0xc]
	bl sub_02088288
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_Pokedex_Get
	str r0, [sp, #0x28]
	ldr r0, [r4, #0xc]
	bl Save_Bag_Get
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0xc]
	bl Save_GameStats_Get
	ldr r1, [sp, #0x28]
	str r7, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x20]
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	mov r0, #0x47
	str r0, [sp, #0x18]
	ldrh r2, [r5, #4]
	ldr r0, [sp, #0x1c]
	bl sub_02075A7C
	b _0203DABA
_0203DA72:
	bl Save_PlayerData_GetOptionsAddr
	str r0, [sp, #0x30]
	ldr r0, [r4, #0xc]
	bl sub_02088288
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_Pokedex_Get
	str r0, [sp, #0x34]
	ldr r0, [r4, #0xc]
	bl Save_Bag_Get
	str r0, [sp, #0x38]
	ldr r0, [r4, #0xc]
	bl Save_GameStats_Get
	ldr r1, [sp, #0x34]
	str r7, [sp]
	str r1, [sp, #4]
	ldr r1, [sp, #0x38]
	ldr r3, [sp, #0x30]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #8]
	ldr r1, [sp, #0x20]
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	mov r0, #0x47
	str r0, [sp, #0x18]
	ldrh r2, [r5, #4]
	ldr r0, [sp, #0x1c]
	bl sub_02075A7C
_0203DABA:
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	ldrb r1, [r5]
	str r1, [r0]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r6, r1]
	sub r0, r1, #4
	ldr r0, [r6, r0]
	bl FreeToHeap
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r6, r0]
	mov r0, #9
	strh r0, [r6, #0x26]
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0203D9E8

	thumb_func_start sub_0203DAE4
sub_0203DAE4: ; 0x0203DAE4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnvironment
	add r4, r0, #0
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02075D3C
	cmp r0, #1
	bne _0203DB60
	mov r0, #0xe
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02075D4C
	mov r0, #0x47
	bl DestroyHeap
	ldr r0, _0203DB64 ; =0x000003F3
	mov r1, #0
	bl StopBGM
	mov r0, #0
	bl sub_02004AD8
	ldr r1, [r5, #0x20]
	add r0, r5, #0
	ldr r1, [r1]
	bl sub_02055164
	mov r1, #0xd6
	lsl r1, r1, #2
	add r0, r5, #0
	add r1, r4, r1
	bl sub_0203E3FC
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	ldr r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020778E0
	mov r0, #0xe1
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r1, _0203DB68 ; =sub_0203CFC0
	add r0, r4, #0
	bl sub_0203C8F0
_0203DB60:
	pop {r3, r4, r5, pc}
	nop
_0203DB64: .word 0x000003F3
_0203DB68: .word sub_0203CFC0
	thumb_func_end sub_0203DAE4
