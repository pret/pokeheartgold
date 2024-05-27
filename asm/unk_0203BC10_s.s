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
