#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FA484
	.public gNatureStatMods

	.text

	thumb_func_start sub_02080BB4
sub_02080BB4: ; 0x02080BB4
	push {r3, r4, r5, lr}
	mov r1, #0
	mov r2, #0xc
	bl LoadItemDataOrGfx
	mov r1, #0xe
	add r4, r0, #0
	bl GetItemAttr_PreloadedItemData
	cmp r0, #1
	beq _02080BD4
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1c
	pop {r3, r4, r5, pc}
_02080BD4:
	add r0, r4, #0
	mov r1, #0x1b
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1c
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1d
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1e
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x1f
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x20
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080C28
	add r0, r4, #0
	mov r1, #0x21
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080C32
_02080C28:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r3, r4, r5, pc}
_02080C32:
	add r0, r4, #0
	mov r1, #0x18
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080C48
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02080C48:
	add r0, r4, #0
	mov r1, #0x19
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080C5E
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #2
	pop {r3, r4, r5, pc}
_02080C5E:
	add r0, r4, #0
	mov r1, #0xf
	bl GetItemAttr_PreloadedItemData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x10
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #1
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x11
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #2
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x12
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #3
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x13
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #4
	add r5, r5, r0
	add r0, r4, #0
	mov r1, #0x14
	bl GetItemAttr_PreloadedItemData
	lsl r0, r0, #5
	add r5, r5, r0
	cmp r5, #0x10
	bgt _02080CCC
	bge _02080D02
	cmp r5, #8
	bhi _02080D36
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02080CBA: ; jump table
	.short _02080D36 - _02080CBA - 2 ; case 0
	.short _02080CDA - _02080CBA - 2 ; case 1
	.short _02080CE4 - _02080CBA - 2 ; case 2
	.short _02080D36 - _02080CBA - 2 ; case 3
	.short _02080CEE - _02080CBA - 2 ; case 4
	.short _02080D36 - _02080CBA - 2 ; case 5
	.short _02080D36 - _02080CBA - 2 ; case 6
	.short _02080D36 - _02080CBA - 2 ; case 7
	.short _02080CF8 - _02080CBA - 2 ; case 8
_02080CCC:
	cmp r5, #0x20
	bgt _02080CD4
	beq _02080D0C
	b _02080D36
_02080CD4:
	cmp r5, #0x3f
	beq _02080D16
	b _02080D36
_02080CDA:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #3
	pop {r3, r4, r5, pc}
_02080CE4:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #4
	pop {r3, r4, r5, pc}
_02080CEE:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #5
	pop {r3, r4, r5, pc}
_02080CF8:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #6
	pop {r3, r4, r5, pc}
_02080D02:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #7
	pop {r3, r4, r5, pc}
_02080D0C:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #8
	pop {r3, r4, r5, pc}
_02080D16:
	add r0, r4, #0
	mov r1, #0x26
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080D2C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_02080D2C:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #9
	pop {r3, r4, r5, pc}
_02080D36:
	add r0, r4, #0
	mov r1, #0x15
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080D4C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xa
	pop {r3, r4, r5, pc}
_02080D4C:
	add r0, r4, #0
	mov r1, #0x26
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080D62
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xb
	pop {r3, r4, r5, pc}
_02080D62:
	add r0, r4, #0
	mov r1, #0x30
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080D78
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xc
	pop {r3, r4, r5, pc}
_02080D78:
	bge _02080D84
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x12
	pop {r3, r4, r5, pc}
_02080D84:
	add r0, r4, #0
	mov r1, #0x31
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080D9A
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xd
	pop {r3, r4, r5, pc}
_02080D9A:
	bge _02080DA6
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x13
	pop {r3, r4, r5, pc}
_02080DA6:
	add r0, r4, #0
	mov r1, #0x32
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080DBC
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xe
	pop {r3, r4, r5, pc}
_02080DBC:
	bge _02080DC8
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x14
	pop {r3, r4, r5, pc}
_02080DC8:
	add r0, r4, #0
	mov r1, #0x33
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080DDE
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0xf
	pop {r3, r4, r5, pc}
_02080DDE:
	bge _02080DEA
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x15
	pop {r3, r4, r5, pc}
_02080DEA:
	add r0, r4, #0
	mov r1, #0x34
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080E00
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x10
	pop {r3, r4, r5, pc}
_02080E00:
	bge _02080E0C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x16
	pop {r3, r4, r5, pc}
_02080E0C:
	add r0, r4, #0
	mov r1, #0x35
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02080E22
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x11
	pop {r3, r4, r5, pc}
_02080E22:
	bge _02080E2E
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x17
	pop {r3, r4, r5, pc}
_02080E2E:
	add r0, r4, #0
	mov r1, #0x1a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E44
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_02080E44:
	add r0, r4, #0
	mov r1, #0x22
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E5A
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x19
	pop {r3, r4, r5, pc}
_02080E5A:
	add r0, r4, #0
	mov r1, #0x23
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E70
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1a
	pop {r3, r4, r5, pc}
_02080E70:
	add r0, r4, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _02080E88
	add r0, r4, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02080E92
_02080E88:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1b
	pop {r3, r4, r5, pc}
_02080E92:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1c
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02080BB4

	thumb_func_start sub_02080E9C
sub_02080E9C: ; 0x02080E9C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _0208123C ; =0x00000654
	add r6, r1, #0
	ldr r1, _02081240 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	add r5, r2, #0
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	add r0, r6, #0
	bl sub_02080BB4
	cmp r0, #0x1b
	bls _02080ECE
	b _020812D0
_02080ECE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02080EDA: ; jump table
	.short _020812D0 - _02080EDA - 2 ; case 0
	.short _020812D0 - _02080EDA - 2 ; case 1
	.short _020812D0 - _02080EDA - 2 ; case 2
	.short _02080F36 - _02080EDA - 2 ; case 3
	.short _02080F12 - _02080EDA - 2 ; case 4
	.short _02080F5A - _02080EDA - 2 ; case 5
	.short _02080F7E - _02080EDA - 2 ; case 6
	.short _02080FA2 - _02080EDA - 2 ; case 7
	.short _02080FC6 - _02080EDA - 2 ; case 8
	.short _0208100E - _02080EDA - 2 ; case 9
	.short _02080FEA - _02080EDA - 2 ; case 10
	.short _020812D0 - _02080EDA - 2 ; case 11
	.short _02081032 - _02080EDA - 2 ; case 12
	.short _02081062 - _02080EDA - 2 ; case 13
	.short _02081092 - _02080EDA - 2 ; case 14
	.short _020810C2 - _02080EDA - 2 ; case 15
	.short _020810F2 - _02080EDA - 2 ; case 16
	.short _02081122 - _02080EDA - 2 ; case 17
	.short _02081152 - _02080EDA - 2 ; case 18
	.short _02081184 - _02080EDA - 2 ; case 19
	.short _020811B6 - _02080EDA - 2 ; case 20
	.short _020811E8 - _02080EDA - 2 ; case 21
	.short _0208121A - _02080EDA - 2 ; case 22
	.short _0208125C - _02080EDA - 2 ; case 23
	.short _020812D0 - _02080EDA - 2 ; case 24
	.short _0208128E - _02080EDA - 2 ; case 25
	.short _0208128E - _02080EDA - 2 ; case 26
	.short _020812BE - _02080EDA - 2 ; case 27
_02080F12:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x42
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080F36:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x5c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080F5A:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x44
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080F7E:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x45
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080FA2:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x43
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080FC6:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4a
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02080FEA:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4b
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208100E:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x48
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081032:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081062:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081092:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #2
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020810C2:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #3
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020810F2:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #4
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081122:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x4c
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #5
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081152:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_02081184:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	add r2, r1, #0
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020811B6:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #2
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020811E8:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #3
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208121A:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _02081244 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #4
	bl BufferStatName
	ldr r1, _02081244 ; =0x000007C4
	b _02081248
	nop
_0208123C: .word 0x00000654
_02081240: .word 0x00000C65
_02081244: .word 0x000007C4
_02081248:
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208125C:
	mov r0, #0x1f
	lsl r0, r0, #6
	add r5, #0x68
	ldr r0, [r4, r0]
	add r1, r5, #0
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r0, _020812E4 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	mov r2, #5
	bl BufferStatName
	ldr r1, _020812E4 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_0208128E:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x49
	bl NewString_ReadMsgData
	add r6, r0, #0
	ldr r0, _020812E4 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	add r2, r5, #0
	bl BufferMoveName
	ldr r1, _020812E4 ; =0x000007C4
	add r2, r6, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	pop {r4, r5, r6, pc}
_020812BE:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x46
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
_020812D0:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
	pop {r4, r5, r6, pc}
	nop
_020812E4: .word 0x000007C4
	thumb_func_end sub_02080E9C

	thumb_func_start sub_020812E8
sub_020812E8: ; 0x020812E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02081360 ; =0x00000654
	ldr r0, [r4, r0]
	ldrh r0, [r0, #0x28]
	bl sub_02080BB4
	cmp r0, #0x1c
	bhi _0208135E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02081306: ; jump table
	.short _0208135E - _02081306 - 2 ; case 0
	.short _0208135E - _02081306 - 2 ; case 1
	.short _02081340 - _02081306 - 2 ; case 2
	.short _02081348 - _02081306 - 2 ; case 3
	.short _02081348 - _02081306 - 2 ; case 4
	.short _02081348 - _02081306 - 2 ; case 5
	.short _02081348 - _02081306 - 2 ; case 6
	.short _02081348 - _02081306 - 2 ; case 7
	.short _02081348 - _02081306 - 2 ; case 8
	.short _02081348 - _02081306 - 2 ; case 9
	.short _02081348 - _02081306 - 2 ; case 10
	.short _02081358 - _02081306 - 2 ; case 11
	.short _02081348 - _02081306 - 2 ; case 12
	.short _02081348 - _02081306 - 2 ; case 13
	.short _02081348 - _02081306 - 2 ; case 14
	.short _02081348 - _02081306 - 2 ; case 15
	.short _02081348 - _02081306 - 2 ; case 16
	.short _02081348 - _02081306 - 2 ; case 17
	.short _02081350 - _02081306 - 2 ; case 18
	.short _02081350 - _02081306 - 2 ; case 19
	.short _02081350 - _02081306 - 2 ; case 20
	.short _02081350 - _02081306 - 2 ; case 21
	.short _02081350 - _02081306 - 2 ; case 22
	.short _02081350 - _02081306 - 2 ; case 23
	.short _0208135E - _02081306 - 2 ; case 24
	.short _02081348 - _02081306 - 2 ; case 25
	.short _02081348 - _02081306 - 2 ; case 26
	.short _02081348 - _02081306 - 2 ; case 27
	.short _0208135E - _02081306 - 2 ; case 28
_02081340:
	ldr r1, _02081364 ; =sub_02081A74
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
	pop {r4, pc}
_02081348:
	ldr r1, _0208136C ; =sub_020813A4
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
	pop {r4, pc}
_02081350:
	ldr r1, _02081370 ; =sub_02081444
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
	pop {r4, pc}
_02081358:
	ldr r1, _02081374 ; =sub_020815E4
	ldr r0, _02081368 ; =0x00000C54
	str r1, [r4, r0]
_0208135E:
	pop {r4, pc}
	.balign 4, 0
_02081360: .word 0x00000654
_02081364: .word sub_02081A74
_02081368: .word 0x00000C54
_0208136C: .word sub_020813A4
_02081370: .word sub_02081444
_02081374: .word sub_020815E4
	thumb_func_end sub_020812E8

	thumb_func_start sub_02081378
sub_02081378: ; 0x02081378
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0208139C ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _0208138C
	mov r0, #5
	pop {r4, pc}
_0208138C:
	ldr r0, _020813A0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
	nop
_0208139C: .word 0x00000C64
_020813A0: .word 0x00000654
	thumb_func_end sub_02081378

	thumb_func_start sub_020813A4
sub_020813A4: ; 0x020813A4
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r1, _0208142C ; =0x00000654
	add r5, r0, #0
	ldr r4, [r5, r1]
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _02081430 ; =0x00000C65
	ldrh r1, [r4, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	mov r3, #0
	bl UseItemOnMonInParty
	ldr r1, _02081430 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_02079E38
	ldr r1, _02081430 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D5DC
	ldr r1, _02081430 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D6A0
	ldr r0, _02081430 ; =0x00000C65
	mov r2, #0x30
	ldrb r1, [r5, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02081434 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	ldr r1, _0208142C ; =0x00000654
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #0
	ldrh r1, [r1, #0x28]
	bl sub_02080E9C
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02081438 ; =0x000005EC
	bl PlaySE
	ldr r1, _0208143C ; =sub_02081378
	ldr r0, _02081440 ; =0x00000C54
	str r1, [r5, r0]
	mov r0, #5
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208142C: .word 0x00000654
_02081430: .word 0x00000C65
_02081434: .word 0x00000836
_02081438: .word 0x000005EC
_0208143C: .word sub_02081378
_02081440: .word 0x00000C54
	thumb_func_end sub_020813A4

	thumb_func_start sub_02081444
sub_02081444: ; 0x02081444
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _020815D0 ; =0x00000654
	ldr r1, _020815D4 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xd
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, _020815D0 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r5, #0
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _020815D4 ; =0x00000C65
	ldrh r1, [r6, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r6]
	mov r3, #0
	bl UseItemOnMonInParty
	ldr r1, _020815D4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_02079E38
	ldr r1, _020815D4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D5DC
	ldr r1, _020815D4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D6A0
	ldr r0, _020815D4 ; =0x00000C65
	mov r2, #0x30
	ldrb r1, [r5, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _020815D8 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	add r0, r4, #0
	mov r1, #0xd
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x18]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x14]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x10]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bne _0208157E
	add r0, r4, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _020815AA
_0208157E:
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	ldr r1, _020815D0 ; =0x00000654
	beq _0208159C
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1, #0x28]
	mov r2, #0
	bl sub_02080E9C
	b _020815B8
_0208159C:
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1, #0x28]
	mov r2, #1
	bl sub_02080E9C
	b _020815B8
_020815AA:
	ldr r1, _020815D0 ; =0x00000654
	add r0, r5, #0
	ldr r1, [r5, r1]
	mov r2, #2
	ldrh r1, [r1, #0x28]
	bl sub_02080E9C
_020815B8:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _020815DC ; =sub_02081378
	ldr r0, _020815E0 ; =0x00000C54
	str r1, [r5, r0]
	mov r0, #5
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020815D0: .word 0x00000654
_020815D4: .word 0x00000C65
_020815D8: .word 0x00000836
_020815DC: .word sub_02081378
_020815E0: .word 0x00000C54
	thumb_func_end sub_02081444

	thumb_func_start sub_020815E4
sub_020815E4: ; 0x020815E4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _020816FC ; =0x00000654
	add r5, r0, #0
	ldr r4, [r5, r1]
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _02081700 ; =0x00000C65
	ldrh r1, [r4, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r4]
	mov r3, #0
	bl UseItemOnMonInParty
	ldr r0, _020816FC ; =0x00000654
	ldr r1, _02081700 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	add r4, r0, #0
	ldr r0, _02081700 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02081704 ; =0x0000082E
	ldrh r1, [r1, r0]
	cmp r1, #0
	bne _02081640
	sub r0, #0x6e
	ldr r0, [r5, r0]
	mov r1, #0x47
	bl NewString_ReadMsgData
	add r7, r0, #0
	b _0208165E
_02081640:
	cmp r4, r1
	bne _02081652
	sub r0, #0x6e
	ldr r0, [r5, r0]
	mov r1, #0x48
	bl NewString_ReadMsgData
	add r7, r0, #0
	b _0208165E
_02081652:
	sub r0, #0x6e
	ldr r0, [r5, r0]
	mov r1, #0x41
	bl NewString_ReadMsgData
	add r7, r0, #0
_0208165E:
	ldr r0, [sp, #8]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081708 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, _02081700 ; =0x00000C65
	str r1, [sp, #4]
	ldrb r6, [r5, r2]
	ldr r3, _02081708 ; =0x000007C4
	mov r2, #0x30
	mul r2, r6
	ldr r0, [r5, r3]
	add r2, r5, r2
	add r3, #0x6a
	ldrh r2, [r2, r3]
	mov r3, #3
	sub r2, r4, r2
	bl BufferIntegerAsString
	ldr r1, _02081708 ; =0x000007C4
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #8]
	bl sub_0208AD64
	add r4, r0, #0
	ldr r1, _02081700 ; =0x00000C65
	lsl r2, r4, #0x18
	ldrb r1, [r5, r1]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	cmp r4, #7
	bne _020816E0
	ldr r1, _02081700 ; =0x00000C65
	ldr r0, _0208170C ; =0x00000836
	ldrb r3, [r5, r1]
	add r2, r5, r0
	mov r0, #0x30
	mul r0, r3
	ldrh r4, [r2, r0]
	ldr r3, _02081710 ; =0xFFFFF000
	and r4, r3
	mov r3, #7
	orr r3, r4
	strh r3, [r2, r0]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D3E4
_020816E0:
	ldr r1, _02081700 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207A7F4
	ldr r1, _02081714 ; =sub_02081720
	ldr r0, _02081718 ; =0x00000C54
	str r1, [r5, r0]
	ldr r0, _0208171C ; =0x000005EC
	bl PlaySE
	mov r0, #5
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020816FC: .word 0x00000654
_02081700: .word 0x00000C65
_02081704: .word 0x0000082E
_02081708: .word 0x000007C4
_0208170C: .word 0x00000836
_02081710: .word 0xFFFFF000
_02081714: .word sub_02081720
_02081718: .word 0x00000C54
_0208171C: .word 0x000005EC
	thumb_func_end sub_020815E4

	thumb_func_start sub_02081720
sub_02081720: ; 0x02081720
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020817B0 ; =0x00000654
	ldr r1, _020817B4 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, _020817B4 ; =0x00000C65
	add r4, r0, #0
	ldrb r2, [r5, r1]
	ldr r0, _020817B8 ; =0x0000082E
	mov r1, #0x30
	add r3, r2, #0
	add r0, r5, r0
	mul r3, r1
	ldrh r1, [r0, r3]
	cmp r4, r1
	beq _02081754
	add r1, r1, #1
	strh r1, [r0, r3]
_02081754:
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D480
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #4
	ldrb r2, [r5, r1]
	lsl r1, r2, #2
	add r1, r2, r1
	add r1, r1, #3
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D440
	ldr r1, _020817B4 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D4EC
	ldr r0, _020817B4 ; =0x00000C65
	mov r1, #0x30
	ldrb r0, [r5, r0]
	add r2, r0, #0
	mul r2, r1
	ldr r0, _020817B8 ; =0x0000082E
	add r2, r5, r2
	ldrh r0, [r2, r0]
	cmp r4, r0
	bne _020817AC
	add r0, r5, #0
	sub r1, #0x31
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _020817BC ; =sub_02081378
	ldr r0, _020817C0 ; =0x00000C54
	str r1, [r5, r0]
_020817AC:
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020817B0: .word 0x00000654
_020817B4: .word 0x00000C65
_020817B8: .word 0x0000082E
_020817BC: .word sub_02081378
_020817C0: .word 0x00000C54
	thumb_func_end sub_02081720

	thumb_func_start sub_020817C4
sub_020817C4: ; 0x020817C4
	push {r3, lr}
	mov r1, #0x18
	mov r2, #0xc
	bl GetItemAttr
	cmp r0, #0
	beq _020817D6
	mov r0, #1
	pop {r3, pc}
_020817D6:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020817C4

	thumb_func_start sub_020817DC
sub_020817DC: ; 0x020817DC
	push {r3, r4, r5, r6}
	cmp r1, #6
	blo _020817E8
	mov r0, #0xff
	pop {r3, r4, r5, r6}
	bx lr
_020817E8:
	bhs _02081814
	ldr r2, _0208181C ; =0x0000082E
	mov r3, #0x30
	add r4, r2, #0
	add r4, #0x27
_020817F2:
	add r5, r1, #0
	mul r5, r3
	add r6, r0, r5
	ldrb r5, [r6, r4]
	cmp r5, #0
	beq _0208180A
	ldrh r5, [r6, r2]
	cmp r5, #0
	bne _0208180A
	add r0, r1, #0
	pop {r3, r4, r5, r6}
	bx lr
_0208180A:
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #6
	blo _020817F2
_02081814:
	mov r0, #0xff
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0208181C: .word 0x0000082E
	thumb_func_end sub_020817DC

	thumb_func_start sub_02081820
sub_02081820: ; 0x02081820
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02081A4C ; =0x00000C62
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #3
	bls _0208182E
	b _02081A46
_0208182E:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0208183A: ; jump table
	.short _02081842 - _0208183A - 2 ; case 0
	.short _02081894 - _0208183A - 2 ; case 1
	.short _0208195C - _0208183A - 2 ; case 2
	.short _020819E0 - _0208183A - 2 ; case 3
_02081842:
	mov r1, #0
	bl sub_020817DC
	ldr r1, _02081A50 ; =0x00000C65
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #0xff
	bne _02081888
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _02081A54 ; =sub_02081378
	ldr r0, _02081A58 ; =0x00000C54
	mov r2, #1
	str r1, [r4, r0]
	add r0, r4, #0
	mov r1, #0
	bl sub_0207F240
	ldr r0, _02081A50 ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_02081888:
	cmp r0, #0
	beq _02081894
	add r0, r4, #0
	mov r1, #0
	bl sub_0207A7F4
_02081894:
	ldr r0, _02081A5C ; =0x00000654
	ldr r1, _02081A50 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	add r0, r4, #0
	bl sub_020828EC
	add r3, r0, #0
	mov r0, #0xc
	str r0, [sp]
	ldr r1, _02081A5C ; =0x00000654
	add r0, r5, #0
	ldr r1, [r4, r1]
	mov r2, #0
	ldrh r1, [r1, #0x28]
	bl UseItemOnPokemon
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x47
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081A60 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r1, _02081A60 ; =0x000007C4
	add r2, r6, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r6, #0
	bl String_dtor
	ldr r7, _02081A50 ; =0x00000C65
	ldr r3, _02081A64 ; =0x00000836
	ldrb r5, [r4, r7]
	mov r2, #0x30
	add r1, r4, r3
	add r0, r5, #0
	mul r0, r2
	ldrh r6, [r1, r0]
	ldr r5, _02081A68 ; =0xFFFFF000
	and r6, r5
	mov r5, #7
	orr r5, r6
	strh r5, [r1, r0]
	ldrb r1, [r4, r7]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	add r1, r7, #0
	ldrb r1, [r4, r1]
	add r0, r4, #0
	bl sub_0207D3E4
	add r1, r7, #0
	ldrb r1, [r4, r1]
	add r0, r4, #0
	bl sub_0207A7F4
	add r1, r7, #0
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mov r2, #1
	bl sub_0207F240
	ldr r0, _02081A6C ; =0x000005EC
	bl PlaySE
	sub r0, r7, #3
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02081A46
_0208195C:
	ldr r0, _02081A5C ; =0x00000654
	add r1, r1, #3
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r2, _02081A50 ; =0x00000C65
	add r5, r0, #0
	ldr r0, _02081A70 ; =0x0000082E
	ldrb r3, [r4, r2]
	add r1, r4, r0
	mov r0, #0x30
	mul r0, r3
	ldrh r3, [r1, r0]
	add r3, r3, #1
	strh r3, [r1, r0]
	ldrb r1, [r4, r2]
	add r0, r4, #0
	bl sub_0207D480
	ldr r1, _02081A50 ; =0x00000C65
	add r0, r4, #4
	ldrb r2, [r4, r1]
	lsl r1, r2, #2
	add r1, r2, r1
	add r1, r1, #3
	lsl r1, r1, #4
	add r0, r0, r1
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r1, _02081A50 ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl sub_0207D440
	ldr r1, _02081A50 ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl sub_0207D4EC
	ldr r0, _02081A50 ; =0x00000C65
	mov r1, #0x30
	ldrb r0, [r4, r0]
	add r2, r0, #0
	mul r2, r1
	ldr r0, _02081A70 ; =0x0000082E
	add r2, r4, r2
	ldrh r0, [r2, r0]
	cmp r5, r0
	bne _02081A46
	add r0, r4, #0
	sub r1, #0x31
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02081A4C ; =0x00000C62
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _02081A46
_020819E0:
	add r0, r1, #2
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02081A46
	ldr r0, _02081A50 ; =0x00000C65
	ldrb r5, [r4, r0]
	add r0, r4, #0
	add r1, r5, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020817DC
	ldr r1, _02081A50 ; =0x00000C65
	strb r0, [r4, r1]
	ldrb r0, [r4, r1]
	cmp r0, #0xff
	beq _02081A22
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0207A7F4
	ldr r0, _02081A4C ; =0x00000C62
	mov r1, #1
	strb r1, [r4, r0]
	b _02081A46
_02081A22:
	ldr r0, _02081A5C ; =0x00000654
	mov r2, #1
	ldr r1, [r4, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	ldr r0, _02081A5C ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02081A50 ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_02081A46:
	mov r0, #7
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02081A4C: .word 0x00000C62
_02081A50: .word 0x00000C65
_02081A54: .word sub_02081378
_02081A58: .word 0x00000C54
_02081A5C: .word 0x00000654
_02081A60: .word 0x000007C4
_02081A64: .word 0x00000836
_02081A68: .word 0xFFFFF000
_02081A6C: .word 0x000005EC
_02081A70: .word 0x0000082E
	thumb_func_end sub_02081820

	thumb_func_start sub_02081A74
sub_02081A74: ; 0x02081A74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _02081C14 ; =0x00000654
	ldr r1, _02081C18 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa4
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	ldr r1, _02081C1C ; =0x00000C68
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa5
	bl GetMonData
	ldr r1, _02081C20 ; =0x00000C6A
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa6
	bl GetMonData
	ldr r1, _02081C24 ; =0x00000C6C
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa8
	bl GetMonData
	ldr r1, _02081C28 ; =0x00000C6E
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa9
	bl GetMonData
	mov r1, #0xc7
	lsl r1, r1, #4
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C2C ; =0x00000C72
	strh r0, [r5, r1]
	ldr r0, _02081C14 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r5, #0
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _02081C18 ; =0x00000C65
	ldrh r1, [r6, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r6]
	mov r3, #0
	bl UseItemOnMonInParty
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C18 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02081C30 ; =0x00000832
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C18 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	ldr r1, _02081C34 ; =0x0000082E
	strh r0, [r2, r1]
	add r0, r4, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	ldr r1, _02081C18 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	mov r1, #0x83
	lsl r1, r1, #4
	strh r0, [r2, r1]
	sub r1, #0x70
	ldr r0, [r5, r1]
	mov r1, #0xb1
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r4, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081C38 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	ldr r2, _02081C18 ; =0x00000C65
	str r1, [sp, #4]
	ldrb r6, [r5, r2]
	ldr r3, _02081C38 ; =0x000007C4
	mov r2, #0x30
	mul r2, r6
	ldr r0, [r5, r3]
	add r2, r5, r2
	add r3, #0x6e
	ldrh r2, [r2, r3]
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, _02081C38 ; =0x000007C4
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	add r0, r4, #0
	bl sub_0208AD64
	add r4, r0, #0
	ldr r1, _02081C18 ; =0x00000C65
	lsl r2, r4, #0x18
	ldrb r1, [r5, r1]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	cmp r4, #7
	bne _02081BD2
	ldr r1, _02081C18 ; =0x00000C65
	ldr r0, _02081C3C ; =0x00000836
	ldrb r3, [r5, r1]
	add r2, r5, r0
	mov r0, #0x30
	mul r0, r3
	ldrh r4, [r2, r0]
	ldr r3, _02081C40 ; =0xFFFFF000
	and r4, r3
	mov r3, #7
	orr r3, r4
	strh r3, [r2, r0]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D3E4
_02081BD2:
	ldr r1, _02081C18 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207A7F4
	ldr r0, _02081C44 ; =sub_02081720
	ldr r1, _02081C48 ; =0x00000C54
	str r0, [r5, r1]
	add r1, #0x11
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D5DC
	ldr r1, _02081C18 ; =0x00000C65
	add r0, r5, #0
	ldrb r1, [r5, r1]
	bl sub_0207D6A0
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r1, _02081C4C ; =sub_02081C50
	ldr r0, _02081C48 ; =0x00000C54
	str r1, [r5, r0]
	mov r1, #0
	add r0, #0x13
	strb r1, [r5, r0]
	mov r0, #5
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02081C14: .word 0x00000654
_02081C18: .word 0x00000C65
_02081C1C: .word 0x00000C68
_02081C20: .word 0x00000C6A
_02081C24: .word 0x00000C6C
_02081C28: .word 0x00000C6E
_02081C2C: .word 0x00000C72
_02081C30: .word 0x00000832
_02081C34: .word 0x0000082E
_02081C38: .word 0x000007C4
_02081C3C: .word 0x00000836
_02081C40: .word 0xFFFFF000
_02081C44: .word sub_02081720
_02081C48: .word 0x00000C54
_02081C4C: .word sub_02081C50
	thumb_func_end sub_02081A74

	thumb_func_start sub_02081C50
sub_02081C50: ; 0x02081C50
	push {r3, r4, r5, lr}
	ldr r1, _02081EAC ; =0x00000C67
	add r4, r0, #0
	ldrb r0, [r4, r1]
	cmp r0, #6
	bhi _02081D0C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02081C68: ; jump table
	.short _02081C76 - _02081C68 - 2 ; case 0
	.short _02081C90 - _02081C68 - 2 ; case 1
	.short _02081CB6 - _02081C68 - 2 ; case 2
	.short _02081CE4 - _02081C68 - 2 ; case 3
	.short _02081DDC - _02081C68 - 2 ; case 4
	.short _02081DF0 - _02081C68 - 2 ; case 5
	.short _02081E54 - _02081C68 - 2 ; case 6
_02081C76:
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02081D0C
	add r0, r4, #0
	bl sub_0207DDFC
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #1
	strb r1, [r4, r0]
	b _02081EA8
_02081C90:
	ldr r0, _02081EB0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02081CA2
	bl System_GetTouchNew
	cmp r0, #1
	bne _02081D0C
_02081CA2:
	ldr r0, _02081EB4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0207DF98
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #2
	strb r1, [r4, r0]
	b _02081EA8
_02081CB6:
	ldr r0, _02081EB0 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _02081CC8
	bl System_GetTouchNew
	cmp r0, #1
	bne _02081D0C
_02081CC8:
	ldr r0, _02081EB4 ; =0x000005DC
	bl PlaySE
	add r0, r4, #0
	bl sub_0207E04C
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #3
	strb r1, [r4, r0]
	ldr r0, _02081EB8 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	str r1, [r0, #0x38]
	b _02081EA8
_02081CE4:
	ldr r0, _02081EB8 ; =0x00000654
	sub r1, r1, #2
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r1, _02081EB8 ; =0x00000654
	add r5, r0, #0
	ldr r2, [r4, r1]
	add r1, r2, #0
	add r1, #0x38
	add r2, #0x2a
	bl MonTryLearnMoveOnLevelUp
	cmp r0, #0
	beq _02081D16
	ldr r1, _02081EBC ; =0x0000FFFE
	cmp r0, r1
	bne _02081D0E
_02081D0C:
	b _02081EA8
_02081D0E:
	add r1, r1, #1
	cmp r0, r1
	beq _02081D1E
	b _02081D84
_02081D16:
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #6
	strb r1, [r4, r0]
	b _02081EA8
_02081D1E:
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081EC0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r2, _02081EB8 ; =0x00000654
	ldr r0, _02081EC0 ; =0x000007C4
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	ldrh r2, [r2, #0x2a]
	mov r1, #1
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081EC0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081EC4 ; =sub_02081F8C
	ldr r1, _02081EC8 ; =0x00000C58
	ldr r2, _02081ECC ; =sub_02081FE0
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
_02081D84:
	add r0, r5, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081EC0 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r2, _02081EB8 ; =0x00000654
	ldr r0, _02081EC0 ; =0x000007C4
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	ldrh r2, [r2, #0x2a]
	mov r1, #1
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0xb2
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081EC0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #4
	strb r1, [r4, r0]
	b _02081EA8
_02081DDC:
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _02081EA8
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #3
	strb r1, [r4, r0]
	b _02081EA8
_02081DF0:
	ldr r0, _02081EB8 ; =0x00000654
	sub r1, r1, #2
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r2, _02081EB8 ; =0x00000654
	add r1, r0, #0
	ldr r2, [r4, r2]
	add r0, r4, #0
	add r2, #0x2c
	ldrb r2, [r2]
	bl sub_0208254C
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3e
	bl NewString_ReadMsgData
	ldr r2, _02081EB8 ; =0x00000654
	add r5, r0, #0
	ldr r2, [r4, r2]
	ldr r0, _02081EC0 ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _02081EC0 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081EAC ; =0x00000C67
	mov r1, #4
	strb r1, [r4, r0]
	b _02081EA8
_02081E54:
	ldr r0, _02081EB8 ; =0x00000654
	sub r1, r1, #2
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	ldr r0, _02081EB8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapEvolutionMethod
	add r3, r0, #0
	ldr r0, _02081EB8 ; =0x00000654
	lsl r3, r3, #0x10
	ldr r1, [r4, r0]
	mov r2, #0
	add r0, r1, #0
	add r0, #0x40
	str r0, [sp]
	ldr r0, [r1]
	add r1, r5, #0
	lsr r3, r3, #0x10
	bl GetMonEvolution
	ldr r1, _02081EB8 ; =0x00000654
	ldr r2, [r4, r1]
	strh r0, [r2, #0x3c]
	ldr r1, [r4, r1]
	ldrh r0, [r1, #0x3c]
	cmp r0, #0
	beq _02081E9E
	mov r0, #9
	b _02081EA0
_02081E9E:
	mov r0, #0
_02081EA0:
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r3, r4, r5, pc}
_02081EA8:
	mov r0, #5
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02081EAC: .word 0x00000C67
_02081EB0: .word gSystem
_02081EB4: .word 0x000005DC
_02081EB8: .word 0x00000654
_02081EBC: .word 0x0000FFFE
_02081EC0: .word 0x000007C4
_02081EC4: .word sub_02081F8C
_02081EC8: .word 0x00000C58
_02081ECC: .word sub_02081FE0
	thumb_func_end sub_02081C50

	thumb_func_start sub_02081ED0
sub_02081ED0: ; 0x02081ED0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02081F78 ; =sub_02081C50
	ldr r1, _02081F7C ; =0x00000C54
	mov r2, #3
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0x13
	strb r2, [r4, r0]
	ldr r0, _02081F80 ; =0x00000654
	add r1, #0x11
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02081F84 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r0, _02081F80 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x2c
	ldrb r1, [r0]
	cmp r1, #4
	bne _02081F24
	ldr r0, _02081F84 ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferMoveName
	add r0, r4, #0
	bl sub_02081FE0
	pop {r3, r4, r5, pc}
_02081F24:
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _02081F84 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3d
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02081F84 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02081F88 ; =0x00000C62
	mov r1, #5
	strb r1, [r4, r0]
	add r0, r0, #5
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_02081F78: .word sub_02081C50
_02081F7C: .word 0x00000C54
_02081F80: .word 0x00000654
_02081F84: .word 0x000007C4
_02081F88: .word 0x00000C62
	thumb_func_end sub_02081ED0

	thumb_func_start sub_02081F8C
sub_02081F8C: ; 0x02081F8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3c
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _02081FD4 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02081FD8 ; =0x00000654
	mov r1, #5
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02081FDC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_02081FD4: .word 0x000007C4
_02081FD8: .word 0x00000654
_02081FDC: .word 0x00000C62
	thumb_func_end sub_02081F8C

	thumb_func_start sub_02081FE0
sub_02081FE0: ; 0x02081FE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x38
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _02082028 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0208202C ; =sub_02082038
	ldr r1, _02082030 ; =0x00000C58
	ldr r2, _02082034 ; =sub_02082084
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082028: .word 0x000007C4
_0208202C: .word sub_02082038
_02082030: .word 0x00000C58
_02082034: .word sub_02082084
	thumb_func_end sub_02081FE0

	thumb_func_start sub_02082038
sub_02082038: ; 0x02082038
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3b
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208207C ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02082080 ; =0x00000C62
	mov r1, #5
	strb r1, [r5, r0]
	mov r1, #4
	add r0, r0, #5
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0208207C: .word 0x000007C4
_02082080: .word 0x00000C62
	thumb_func_end sub_02082038

	thumb_func_start sub_02082084
sub_02082084: ; 0x02082084
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _020820CC ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _020820D0 ; =sub_02081F8C
	ldr r1, _020820D4 ; =0x00000C58
	ldr r2, _020820D8 ; =sub_02081FE0
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020820CC: .word 0x000007C4
_020820D0: .word sub_02081F8C
_020820D4: .word 0x00000C58
_020820D8: .word sub_02081FE0
	thumb_func_end sub_02082084

	thumb_func_start sub_020820DC
sub_020820DC: ; 0x020820DC
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02082130 ; =0x00000654
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_020820E6:
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r0, [r5, r7]
	ldrh r1, [r0, #0x2a]
	cmp r2, r1
	bne _02082102
	mov r0, #0xfd
	pop {r3, r4, r5, r6, r7, pc}
_02082102:
	cmp r2, #0
	beq _02082110
	add r1, r4, #1
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	cmp r4, #4
	blo _020820E6
_02082110:
	ldrh r0, [r0, #0x28]
	bl ItemToTMHMId
	add r1, r0, #0
	add r0, r6, #0
	bl GetMonTMHMCompat
	cmp r0, #0
	bne _02082126
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_02082126:
	cmp r4, #4
	bne _0208212C
	mov r4, #0xfe
_0208212C:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02082130: .word 0x00000654
	thumb_func_end sub_020820DC

	thumb_func_start sub_02082134
sub_02082134: ; 0x02082134
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _020822B0 ; =0x00000654
	ldr r1, _020822B4 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020820DC
	add r5, r0, #0
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _020822B8 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r2, _020822B0 ; =0x00000654
	ldr r0, _020822B8 ; =0x000007C4
	ldr r2, [r4, r2]
	ldr r0, [r4, r0]
	ldrh r2, [r2, #0x2a]
	mov r1, #1
	bl BufferMoveName
	cmp r5, #0xfd
	bhi _02082192
	bhs _020821EA
	cmp r5, #3
	bhi _02082198
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208218A: ; jump table
	.short _020821A0 - _0208218A - 2 ; case 0
	.short _020821A0 - _0208218A - 2 ; case 1
	.short _020821A0 - _0208218A - 2 ; case 2
	.short _020821A0 - _0208218A - 2 ; case 3
_02082192:
	cmp r5, #0xfe
	bhi _0208219A
	beq _0208222A
_02082198:
	b _020822AA
_0208219A:
	cmp r5, #0xff
	beq _0208226C
	b _020822AA
_020821A0:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl sub_0208254C
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3e
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822B0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020822BC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	b _020822AA
_020821EA:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x40
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822B0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020822BC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	b _020822AA
_0208222A:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822C0 ; =sub_020823F4
	ldr r1, _020822C4 ; =0x00000C58
	ldr r2, _020822C8 ; =sub_02082448
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	b _020822AA
_0208226C:
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3f
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _020822B8 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020822B0 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020822BC ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
_020822AA:
	mov r0, #0x18
	pop {r4, r5, r6, pc}
	nop
_020822B0: .word 0x00000654
_020822B4: .word 0x00000C65
_020822B8: .word 0x000007C4
_020822BC: .word 0x00000C62
_020822C0: .word sub_020823F4
_020822C4: .word 0x00000C58
_020822C8: .word sub_02082448
	thumb_func_end sub_02082134

	thumb_func_start sub_020822CC
sub_020822CC: ; 0x020822CC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02082360 ; =0x00000654
	ldr r1, _02082364 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r5, r0, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _02082368 ; =0x000007C4
	mov r1, #0
	ldr r0, [r4, r0]
	bl BufferBoxMonNickname
	ldr r0, _02082360 ; =0x00000654
	ldr r2, [r4, r0]
	add r0, r2, #0
	add r0, #0x2c
	ldrb r1, [r0]
	cmp r1, #4
	bne _02082312
	ldr r0, _02082368 ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r4, r0]
	mov r1, #1
	bl BufferMoveName
	add r0, r4, #0
	bl sub_02082448
	pop {r3, r4, r5, pc}
_02082312:
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _02082368 ; =0x000007C4
	mov r1, #1
	ldr r0, [r4, r0]
	bl BufferMoveName
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0x3d
	bl NewString_ReadMsgData
	add r5, r0, #0
	ldr r1, _02082368 ; =0x000007C4
	add r2, r5, #0
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl StringExpandPlaceholders
	add r0, r5, #0
	bl String_dtor
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0208236C ; =0x00000C62
	mov r1, #0x16
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082360: .word 0x00000654
_02082364: .word 0x00000C65
_02082368: .word 0x000007C4
_0208236C: .word 0x00000C62
	thumb_func_end sub_020822CC

	thumb_func_start sub_02082370
sub_02082370: ; 0x02082370
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020823E4 ; =0x00000654
	ldr r1, _020823E8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	ldr r2, _020823E4 ; =0x00000654
	add r1, r0, #0
	ldr r2, [r5, r2]
	add r0, r5, #0
	add r2, #0x2c
	ldrb r2, [r2]
	bl sub_0208254C
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3e
	bl NewString_ReadMsgData
	ldr r2, _020823E4 ; =0x00000654
	add r4, r0, #0
	ldr r2, [r5, r2]
	ldr r0, _020823EC ; =0x000007C4
	ldrh r2, [r2, #0x2a]
	ldr r0, [r5, r0]
	mov r1, #1
	bl BufferMoveName
	ldr r1, _020823EC ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _020823E4 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020823F0 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020823E4: .word 0x00000654
_020823E8: .word 0x00000C65
_020823EC: .word 0x000007C4
_020823F0: .word 0x00000C62
	thumb_func_end sub_02082370

	thumb_func_start sub_020823F4
sub_020823F4: ; 0x020823F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3c
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208243C ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02082440 ; =0x00000654
	mov r1, #4
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02082444 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0208243C: .word 0x000007C4
_02082440: .word 0x00000654
_02082444: .word 0x00000C62
	thumb_func_end sub_020823F4

	thumb_func_start sub_02082448
sub_02082448: ; 0x02082448
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x38
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _02082490 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02082494 ; =sub_020824A0
	ldr r1, _02082498 ; =0x00000C58
	ldr r2, _0208249C ; =sub_020824F4
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082490: .word 0x000007C4
_02082494: .word sub_020824A0
_02082498: .word 0x00000C58
_0208249C: .word sub_020824F4
	thumb_func_end sub_02082448

	thumb_func_start sub_020824A0
sub_020824A0: ; 0x020824A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x3b
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _020824E8 ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _020824EC ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020824F0 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_020824E8: .word 0x000007C4
_020824EC: .word 0x00000654
_020824F0: .word 0x00000C62
	thumb_func_end sub_020824A0

	thumb_func_start sub_020824F4
sub_020824F4: ; 0x020824F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x1f
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0x35
	bl NewString_ReadMsgData
	add r4, r0, #0
	ldr r1, _0208253C ; =0x000007C4
	add r2, r4, #0
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r4, #0
	bl String_dtor
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl sub_0207DAEC
	ldr r0, _02082540 ; =sub_020823F4
	ldr r1, _02082544 ; =0x00000C58
	ldr r2, _02082548 ; =sub_02082448
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0208253C: .word 0x000007C4
_02082540: .word sub_020823F4
_02082544: .word 0x00000C58
_02082548: .word sub_02082448
	thumb_func_end sub_020824F4

	thumb_func_start sub_0208254C
sub_0208254C: ; 0x0208254C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, _020825D4 ; =0x00000654
	add r6, r2, #0
	ldr r0, [r5, r0]
	add r4, r1, #0
	ldrh r0, [r0, #0x2a]
	add r1, r6, #0
	add r1, #0x36
	str r0, [sp]
	add r0, r4, #0
	add r2, sp, #0
	bl SetMonData
	mov r0, #0
	add r1, r6, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, #0x3e
	add r2, sp, #0
	bl SetMonData
	ldr r0, _020825D4 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x2a]
	bl WazaGetMaxPp
	add r6, #0x3a
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #0
	bl SetMonData
	ldr r0, _020825D4 ; =0x00000654
	ldr r1, [r5, r0]
	ldrh r0, [r1, #0x28]
	cmp r0, #0
	beq _020825D0
	ldrh r0, [r1, #0x2a]
	bl MoveIsHM
	cmp r0, #0
	bne _020825B8
	ldr r0, _020825D4 ; =0x00000654
	mov r2, #1
	ldr r1, [r5, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
_020825B8:
	add r0, r5, #0
	bl sub_020828EC
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #4
	bl MonApplyFriendshipMod
	add r0, r4, #0
	mov r1, #3
	bl ApplyMonMoodModifier
_020825D0:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020825D4: .word 0x00000654
	thumb_func_end sub_0208254C

	thumb_func_start sub_020825D8
sub_020825D8: ; 0x020825D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02082648 ; =0x00000654
	add r6, r1, #0
	ldr r1, _0208264C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x1f
	lsl r0, r0, #6
	add r1, r6, #0
	ldr r0, [r5, r0]
	add r1, #0x91
	bl NewString_ReadMsgData
	add r7, r0, #0
	ldr r0, _02082650 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferMoveName
	ldr r1, _02082650 ; =0x000007C4
	add r2, r7, #0
	ldr r0, [r5, r1]
	add r1, #8
	ldr r1, [r5, r1]
	bl StringExpandPlaceholders
	add r0, r7, #0
	bl String_dtor
	cmp r4, #0
	bne _02082632
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02082632:
	mov r1, #0x82
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	sub r1, #0x54
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ListMenuItems_AddItem
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02082648: .word 0x00000654
_0208264C: .word 0x00000C65
_02082650: .word 0x000007C4
	thumb_func_end sub_020825D8

	thumb_func_start sub_02082654
sub_02082654: ; 0x02082654
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	cmp r4, #0
	bne _02082678
	add r0, r5, #0
	mov r1, #0x2a
	mov r2, #1
	bl sub_0207DAD8
	b _02082682
_02082678:
	add r0, r5, #0
	mov r1, #0x29
	mov r2, #1
	bl sub_0207DAD8
_02082682:
	mov r0, #5
	mov r1, #0xc
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	add r0, r5, #0
	mov r1, #0
	bl sub_020825D8
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_020825D8
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	mov r1, #2
	bl sub_020825D8
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	mov r1, #3
	bl sub_020825D8
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	mov r0, #9
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x2c
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r2, #0
	str r0, [sp, #4]
	mov r0, #0x91
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #8]
	add r1, sp, #4
	strb r2, [r1, #8]
	mov r3, #1
	strb r3, [r1, #9]
	add r0, r4, #1
	strb r0, [r1, #0xa]
	ldrb r4, [r1, #0xb]
	mov r0, #0xf
	bic r4, r0
	strb r4, [r1, #0xb]
	ldrb r4, [r1, #0xb]
	mov r0, #0x30
	bic r4, r0
	strb r4, [r1, #0xb]
	ldrb r4, [r1, #0xb]
	mov r0, #0xc0
	bic r4, r0
	mov r0, #0x40
	orr r0, r4
	strb r0, [r1, #0xb]
	ldrb r1, [r1, #0xa]
	add r0, r5, #0
	bl sub_0207E54C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r1, sp, #4
	mov r2, #0
	mov r3, #0xc
	bl sub_0207E590
	ldr r1, _02082734 ; =0x00000824
	str r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082734: .word 0x00000824
	thumb_func_end sub_02082654

	thumb_func_start sub_02082738
sub_02082738: ; 0x02082738
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _02082850 ; =0x00000824
	add r5, r0, #0
	ldr r1, [r5, r1]
	bl sub_0207E93C
	add r4, r0, #0
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _02082758
	add r0, r0, #1
	cmp r4, r0
	beq _0208284A
	b _02082794
_02082758:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x91
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x21
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02082854 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	add sp, #8
	mov r0, #4
	pop {r4, r5, r6, pc}
_02082794:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	mov r0, #0x91
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _02082858 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r5, #0
	bl sub_020828EC
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r2, _0208285C ; =0x00000C65
	lsl r3, r4, #0x18
	ldrh r1, [r6, #0x28]
	ldrb r2, [r5, r2]
	ldr r0, [r6]
	lsr r3, r3, #0x18
	bl UseItemOnMonInParty
	cmp r0, #1
	bne _02082818
	ldr r0, _02082858 ; =0x00000654
	ldr r1, _0208285C ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r4, #0x36
	add r1, r4, #0
	mov r2, #0
	bl GetMonData
	ldr r1, _02082858 ; =0x00000654
	add r2, r0, #0
	ldr r1, [r5, r1]
	add r0, r5, #0
	ldrh r1, [r1, #0x28]
	bl sub_02080E9C
	ldr r0, _02082858 ; =0x00000654
	mov r2, #1
	ldr r1, [r5, r0]
	mov r3, #0xc
	ldr r0, [r1, #4]
	ldrh r1, [r1, #0x28]
	bl Bag_TakeItem
	ldr r0, _02082860 ; =0x000005EC
	bl PlaySE
	b _02082828
_02082818:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x66
	bl ReadMsgDataIntoString
_02082828:
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02082858 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add sp, #8
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02082864 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r5, r0]
	mov r0, #0x18
	pop {r4, r5, r6, pc}
_0208284A:
	mov r0, #6
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02082850: .word 0x00000824
_02082854: .word 0x00000678
_02082858: .word 0x00000654
_0208285C: .word 0x00000C65
_02082860: .word 0x000005EC
_02082864: .word 0x00000C62
	thumb_func_end sub_02082738

	thumb_func_start sub_02082868
sub_02082868: ; 0x02082868
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x81
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	ldr r0, _020828DC ; =0x00000C65
	ldr r2, _020828E0 ; =0x00000834
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r0, r4, r0
	ldrh r0, [r0, r2]
	cmp r0, #0
	bne _020828A6
	add r0, r2, #0
	sub r0, #0x74
	sub r2, #0x6c
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #0x74
	bl ReadMsgDataIntoString
	ldr r1, _020828DC ; =0x00000C65
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl sub_0207F044
	b _020828BC
_020828A6:
	add r0, r2, #0
	sub r0, #0x74
	sub r2, #0x6c
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #0x75
	bl ReadMsgDataIntoString
	ldr r0, _020828DC ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
_020828BC:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020828E4 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _020828E8 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	pop {r4, pc}
	nop
_020828DC: .word 0x00000C65
_020828E0: .word 0x00000834
_020828E4: .word 0x00000654
_020828E8: .word 0x00000C62
	thumb_func_end sub_02082868

	thumb_func_start sub_020828EC
sub_020828EC: ; 0x020828EC
	push {r3, lr}
	ldr r1, _02082904 ; =0x00000654
	ldr r0, [r0, r1]
	ldr r0, [r0, #0x1c]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	nop
_02082904: .word 0x00000654
	thumb_func_end sub_020828EC
