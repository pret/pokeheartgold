#include "constants/items.h"
#include "constants/moves.h"
#include "constants/species.h"
#include "constants/maps.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02090C94
sub_02090C94: ; 0x02090C94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r0, [sp, #0x18]
	mov r1, #0x28
	add r6, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	strb r5, [r4]
	strb r7, [r4, #1]
	add r0, r6, #0
	bl Sav2_Pokedex_get
	str r0, [r4, #0xc]
	add r0, r6, #0
	bl SaveData_EasyChat_get
	str r0, [r4, #0x10]
	add r0, r6, #0
	bl SavArray_Flags_get
	bl CheckGameClearFlag
	strb r0, [r4, #4]
	mov r1, #0
	strb r1, [r4, #5]
	mov r0, #1
	strb r0, [r4, #2]
	strb r1, [r4, #3]
	add r0, r6, #0
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetFrame
	str r0, [r4, #8]
	ldr r0, [sp]
	cmp r5, #2
	str r0, [r4, #0x24]
	bne _02090CF2
	add r0, r4, #0
	add r0, #0x14
	mov r1, #3
	bl MailMsg_init_withBank
	b _02090D02
_02090CF2:
	ldr r0, _02090D08 ; =0x0000FFFF
	mov r1, #0
	add r2, r4, #0
_02090CF8:
	add r1, r1, #1
	strh r0, [r2, #0x1c]
	add r2, r2, #2
	cmp r1, #2
	blt _02090CF8
_02090D02:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02090D08: .word 0x0000FFFF
	thumb_func_end sub_02090C94

	thumb_func_start sub_02090D0C
sub_02090D0C: ; 0x02090D0C
	ldr r3, _02090D10 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02090D10: .word FreeToHeap
	thumb_func_end sub_02090D0C

	thumb_func_start sub_02090D14
sub_02090D14: ; 0x02090D14
	strh r1, [r0, #0x1c]
	bx lr
	thumb_func_end sub_02090D14

	thumb_func_start sub_02090D18
sub_02090D18: ; 0x02090D18
	strh r1, [r0, #0x1c]
	strh r2, [r0, #0x1e]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02090D18

	thumb_func_start sub_02090D20
sub_02090D20: ; 0x02090D20
	ldrh r2, [r1]
	strh r2, [r0, #0x14]
	ldrh r2, [r1, #2]
	strh r2, [r0, #0x16]
	ldrh r2, [r1, #4]
	strh r2, [r0, #0x18]
	ldrh r1, [r1, #6]
	strh r1, [r0, #0x1a]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02090D20

	thumb_func_start sub_02090D34
sub_02090D34: ; 0x02090D34
	mov r1, #1
	strb r1, [r0, #2]
	mov r1, #0
	strb r1, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02090D34

	thumb_func_start sub_02090D40
sub_02090D40: ; 0x02090D40
	mov r1, #1
	strb r1, [r0, #5]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02090D40

	thumb_func_start sub_02090D48
sub_02090D48: ; 0x02090D48
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end sub_02090D48

	thumb_func_start sub_02090D4C
sub_02090D4C: ; 0x02090D4C
	ldrb r0, [r0, #3]
	bx lr
	thumb_func_end sub_02090D4C

	thumb_func_start sub_02090D50
sub_02090D50: ; 0x02090D50
	ldrh r0, [r0, #0x1c]
	bx lr
	thumb_func_end sub_02090D50

	thumb_func_start sub_02090D54
sub_02090D54: ; 0x02090D54
	ldrh r2, [r0, #0x1c]
	strh r2, [r1]
	ldrh r0, [r0, #0x1e]
	strh r0, [r1, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02090D54

	thumb_func_start sub_02090D60
sub_02090D60: ; 0x02090D60
	add r2, r0, #0
	ldr r3, _02090D6C ; =MailMsg_copy
	add r2, #0x14
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	.balign 4, 0
_02090D6C: .word MailMsg_copy
	thumb_func_end sub_02090D60

	thumb_func_start sub_02090D70
sub_02090D70: ; 0x02090D70
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_02090D70

	thumb_func_start sub_02090D74
sub_02090D74: ; 0x02090D74
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end sub_02090D74

	thumb_func_start sub_02090D78
sub_02090D78: ; 0x02090D78
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_02090D78

	thumb_func_start sub_02090D7C
sub_02090D7C: ; 0x02090D7C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_02090D7C

	thumb_func_start sub_02090D80
sub_02090D80: ; 0x02090D80
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_02090D80

	thumb_func_start sub_02090D84
sub_02090D84: ; 0x02090D84
	ldrb r0, [r0, #4]
	bx lr
	thumb_func_end sub_02090D84

	thumb_func_start sub_02090D88
sub_02090D88: ; 0x02090D88
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end sub_02090D88

	thumb_func_start sub_02090D8C
sub_02090D8C: ; 0x02090D8C
	ldrb r3, [r0]
	cmp r3, #0
	beq _02090D9C
	cmp r3, #1
	beq _02090DA2
	cmp r3, #2
	beq _02090DAC
	bx lr
_02090D9C:
	ldrh r0, [r0, #0x1c]
	strh r0, [r1]
	bx lr
_02090DA2:
	ldrh r2, [r0, #0x1c]
	strh r2, [r1]
	ldrh r0, [r0, #0x1e]
	strh r0, [r1, #2]
	bx lr
_02090DAC:
	ldrh r1, [r0, #0x14]
	strh r1, [r2]
	ldrh r1, [r0, #0x16]
	strh r1, [r2, #2]
	ldrh r1, [r0, #0x18]
	strh r1, [r2, #4]
	ldrh r0, [r0, #0x1a]
	strh r0, [r2, #6]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02090D8C

	thumb_func_start sub_02090DC0
sub_02090DC0: ; 0x02090DC0
	push {r3, lr}
	ldrb r3, [r0]
	cmp r3, #0
	beq _02090DD0
	cmp r3, #1
	beq _02090DE0
	cmp r3, #2
	b _02090DF8
_02090DD0:
	ldrh r1, [r1]
	ldrh r0, [r0, #0x1c]
	cmp r1, r0
	bne _02090DDC
	mov r0, #1
	pop {r3, pc}
_02090DDC:
	mov r0, #0
	pop {r3, pc}
_02090DE0:
	ldrh r3, [r1]
	ldrh r2, [r0, #0x1c]
	cmp r3, r2
	bne _02090DF4
	ldrh r1, [r1, #2]
	ldrh r0, [r0, #0x1e]
	cmp r1, r0
	bne _02090DF4
	mov r0, #1
	pop {r3, pc}
_02090DF4:
	mov r0, #0
	pop {r3, pc}
_02090DF8:
	add r0, #0x14
	add r1, r2, #0
	bl MailMsg_compare
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02090DC0

	thumb_func_start sub_02090E04
sub_02090E04: ; 0x02090E04
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02090DC0
	cmp r0, #0
	bne _02090E18
	mov r0, #1
	b _02090E1A
_02090E18:
	mov r0, #0
_02090E1A:
	strb r0, [r5, #3]
	mov r1, #0
	strb r1, [r5, #2]
	add r2, r5, #0
_02090E22:
	ldrh r0, [r4]
	add r1, r1, #1
	add r4, r4, #2
	strh r0, [r2, #0x1c]
	add r2, r2, #2
	cmp r1, #2
	blt _02090E22
	ldrh r0, [r6]
	strh r0, [r5, #0x14]
	ldrh r0, [r6, #2]
	strh r0, [r5, #0x16]
	ldrh r0, [r6, #4]
	strh r0, [r5, #0x18]
	ldrh r0, [r6, #6]
	strh r0, [r5, #0x1a]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02090E04

	thumb_func_start sub_02090E44
sub_02090E44: ; 0x02090E44
	push {r3, lr}
	cmp r0, #0
	beq _02090E50
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _02090E54
_02090E50:
	mov r0, #0
	pop {r3, pc}
_02090E54:
	bl sub_020183F0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02090E44

	thumb_func_start sub_02090E5C
sub_02090E5C: ; 0x02090E5C
	ldr r3, _02090E64 ; =sub_02018410
	ldr r0, [r0, #0x24]
	bx r3
	nop
_02090E64: .word sub_02018410
	thumb_func_end sub_02090E5C

	thumb_func_start sub_02090E68
sub_02090E68: ; 0x02090E68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl Sav2_Mailbox_get
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	mov r1, #0x20
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [sp]
	strb r0, [r4, #0xf]
	ldr r0, [sp, #4]
	strb r6, [r4, #0xe]
	str r0, [r4, #0x18]
	mov r0, #1
	strh r0, [r4]
	str r7, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xc]
	ldr r0, [sp, #0x20]
	str r5, [r4, #0x10]
	bl Mail_new
	str r0, [r4, #0x14]
	bl Mail_init
	ldr r0, [r4, #0x14]
	mov r1, #0xff
	add r2, r6, #0
	add r3, r5, #0
	bl Mail_SetNewMessageDetails
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02090E68

	thumb_func_start sub_02090EC0
sub_02090EC0: ; 0x02090EC0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x20
	add r6, r2, #0
	str r3, [sp]
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r4]
	str r5, [r4, #8]
	strh r6, [r4, #0xc]
	add r0, r7, #0
	str r7, [r4, #0x10]
	bl Sav2_Mailbox_get
	ldr r3, [sp]
	add r1, r5, #0
	add r2, r6, #0
	str r0, [r4, #0x18]
	bl Mailbox_AllocAndFetchMailI
	str r0, [r4, #0x14]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02090EC0

	thumb_func_start sub_02090F00
sub_02090F00: ; 0x02090F00
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r7, #0
	mov r1, #0x20
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r4]
	str r5, [r4, #0x10]
	add r0, r7, #0
	bl Mail_new
	str r0, [r4, #0x14]
	ldr r2, [r4, #0x14]
	add r0, r6, #0
	mov r1, #0xaa
	bl GetMonData
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02090F00

	thumb_func_start sub_02090F38
sub_02090F38: ; 0x02090F38
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r7, #0
	mov r1, #0x20
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x20
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r4]
	add r0, r7, #0
	str r5, [r4, #0x10]
	bl Mail_new
	add r1, r6, #0
	str r0, [r4, #0x14]
	bl Mail_SetType
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02090F38

	thumb_func_start sub_02090F6C
sub_02090F6C: ; 0x02090F6C
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_02090F6C

	thumb_func_start sub_02090F70
sub_02090F70: ; 0x02090F70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02090F6C
	cmp r0, #0
	bne _02090F82
	mov r0, #0
	pop {r3, r4, r5, pc}
_02090F82:
	ldr r2, [r5, #0x14]
	add r0, r4, #0
	mov r1, #0xaa
	bl SetMonData
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02090F70

	thumb_func_start sub_02090F90
sub_02090F90: ; 0x02090F90
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _02090F9E
	bl FreeToHeap
_02090F9E:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02090F90

	thumb_func_start sub_02090FA8
sub_02090FA8: ; 0x02090FA8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0
	add r7, r0, #0
	add r4, r2, #0
	str r1, [sp]
	bl Mailbox_GetFirstEmptySlotIdx
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02091002
	add r0, r4, #0
	bl Mail_new
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0xaa
	add r2, r4, #0
	bl GetMonData
	add r0, r7, #0
	mov r1, #0
	add r2, r6, #0
	add r3, r4, #0
	bl Mailbox_CopyMailToSlotI
	add r0, r4, #0
	bl Mail_init
	add r0, r5, #0
	mov r1, #0xaa
	add r2, r4, #0
	bl SetMonData
	add r0, r5, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
_02091002:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02090FA8

	thumb_func_start sub_02091004
sub_02091004: ; 0x02091004
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r2, #0
	mov r1, #0
	add r2, r5, #0
	add r7, r0, #0
	str r1, [sp]
	bl Mailbox_AllocAndFetchMailI
	add r6, r0, #0
	bne _02091020
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02091020:
	bl Mail_GetType
	bl MailToItemId
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xaa
	add r2, r6, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r7, #0
	mov r1, #0
	add r2, r5, #0
	bl Mailbox_DeleteSlotI
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02091004

	thumb_func_start sub_02091054
sub_02091054: ; 0x02091054
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x51
	blo _02091060
	bl GF_AssertFail
_02091060:
	ldr r0, _02091068 ; =_02105F04
	lsl r1, r4, #2
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_02091068: .word _02105F04
	thumb_func_end sub_02091054

	thumb_func_start sub_0209106C
sub_0209106C: ; 0x0209106C
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x51
	blo _02091078
	bl GF_AssertFail
_02091078:
	ldr r0, _02091080 ; =_02105F04 + 1
	lsl r1, r4, #2
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_02091080: .word _02105F04 + 1
	thumb_func_end sub_0209106C

	thumb_func_start sub_02091084
sub_02091084: ; 0x02091084
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x51
	blo _02091090
	bl GF_AssertFail
_02091090:
	ldr r0, _02091098 ; =_02105F04 + 2
	lsl r1, r4, #2
	ldrb r0, [r0, r1]
	pop {r4, pc}
	.balign 4, 0
_02091098: .word _02105F04 + 2
	thumb_func_end sub_02091084

	thumb_func_start sub_0209109C
sub_0209109C: ; 0x0209109C
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x51
	blo _020910A8
	bl GF_AssertFail
_020910A8:
	cmp r4, #0x32
	blo _020910B0
	cmp r4, #0x4d
	bls _020910B4
_020910B0:
	mov r0, #0
	pop {r4, pc}
_020910B4:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_0209109C

	thumb_func_start sub_020910B8
sub_020910B8: ; 0x020910B8
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #0x51
	blo _020910C4
	bl GF_AssertFail
_020910C4:
	ldr r0, _020910D4 ; =_02105F04
	lsl r1, r4, #2
	add r0, r0, r1
	ldrb r0, [r0, #3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1a
	pop {r4, pc}
	nop
_020910D4: .word _02105F04
	thumb_func_end sub_020910B8

	.rodata

_02105F04:
	.byte 0x27, 0x00, 0x35, 0x01, 0x28, 0x01, 0x35, 0x01, 0x29, 0x02, 0x36, 0x05
	.byte 0x2A, 0x03, 0x37, 0x09, 0x2B, 0x04, 0x38, 0x0D, 0x2C, 0x05, 0x39, 0x12, 0x2D, 0x06, 0x3A, 0x16
	.byte 0x2F, 0x07, 0x3B, 0x19, 0x2E, 0x08, 0x3C, 0x1D, 0x31, 0x09, 0x3D, 0x21, 0x30, 0x0A, 0x3E, 0x25
	.byte 0x33, 0x0B, 0x3F, 0x2A, 0x32, 0x0C, 0x40, 0x2E, 0x34, 0x0D, 0x41, 0x32, 0x35, 0x0E, 0x42, 0x36
	.byte 0x36, 0x0F, 0x43, 0x3A, 0x37, 0x10, 0x44, 0x3E, 0x38, 0x11, 0x49, 0x42, 0x39, 0x12, 0x4A, 0x46
	.byte 0x3A, 0x13, 0x4B, 0x4A, 0x3B, 0x14, 0x4C, 0x4E, 0x3C, 0x15, 0x45, 0x52, 0x3D, 0x16, 0x46, 0x56
	.byte 0x3E, 0x17, 0x47, 0x5A, 0x3F, 0x18, 0x48, 0x5E, 0x40, 0x19, 0x4D, 0x61, 0x41, 0x1A, 0x4E, 0x65
	.byte 0x42, 0x1B, 0x4F, 0x69, 0x43, 0x1C, 0x50, 0x6D, 0x44, 0x1D, 0x51, 0x71, 0x45, 0x1E, 0x52, 0x75
	.byte 0x46, 0x1F, 0x53, 0x79, 0x47, 0x20, 0x54, 0x7D, 0x48, 0x21, 0x55, 0x81, 0x49, 0x22, 0x56, 0x85
	.byte 0x4A, 0x23, 0x57, 0x8A, 0x4B, 0x24, 0x58, 0x8E, 0x4C, 0x25, 0x59, 0x91, 0x4D, 0x26, 0x5A, 0x95
	.byte 0x4E, 0x27, 0x5B, 0x99, 0x4F, 0x28, 0x5C, 0x9D, 0x50, 0x29, 0x5D, 0xA1, 0x51, 0x2A, 0x5E, 0xA5
	.byte 0x52, 0x2B, 0x5F, 0xA9, 0x53, 0x2C, 0x60, 0xAD, 0x54, 0x2D, 0x61, 0xB1, 0x55, 0x2E, 0x62, 0xB5
	.byte 0x56, 0x2F, 0x63, 0xB9, 0x57, 0x30, 0x64, 0xBD, 0x58, 0x31, 0x65, 0xC1, 0x59, 0x32, 0x66, 0x00
	.byte 0x5A, 0x33, 0x67, 0x00, 0x5B, 0x34, 0x68, 0x00, 0x5C, 0x35, 0x69, 0x00, 0x5D, 0x36, 0x6A, 0x00
	.byte 0x5E, 0x37, 0x6B, 0x00, 0x5F, 0x38, 0x6C, 0x00, 0x60, 0x39, 0x6D, 0x00, 0x61, 0x3A, 0x6E, 0x00
	.byte 0x62, 0x3B, 0x6F, 0x00, 0x63, 0x3C, 0x70, 0x00, 0x64, 0x3D, 0x71, 0x00, 0x65, 0x3E, 0x72, 0x00
	.byte 0x66, 0x3F, 0x73, 0x00, 0x67, 0x40, 0x74, 0x00, 0x68, 0x41, 0x75, 0x00, 0x69, 0x42, 0x76, 0x00
	.byte 0x6A, 0x43, 0x77, 0x00, 0x6B, 0x44, 0x78, 0x00, 0x6C, 0x45, 0x79, 0x00, 0x6D, 0x46, 0x7A, 0x00
	.byte 0x6E, 0x47, 0x7B, 0x00, 0x6F, 0x48, 0x7C, 0x00, 0x70, 0x49, 0x7D, 0x00, 0x71, 0x4A, 0x7E, 0x00
	.byte 0x72, 0x4B, 0x7F, 0x00, 0x73, 0x4C, 0x80, 0x00, 0x74, 0x4D, 0x81, 0x00, 0x75, 0x4E, 0x82, 0xC4
	.byte 0x76, 0x4F, 0x83, 0xC8, 0x77, 0x50, 0x84, 0xCC
