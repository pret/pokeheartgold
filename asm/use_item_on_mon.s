#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start CanUseItemOnPokemon
CanUseItemOnPokemon: ; 0x0208FD9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #4]
	add r6, r0, #0
	add r7, r2, #0
	ldr r0, [sp, #4]
	mov r1, #0
	add r2, r3, #0
	bl LoadItemDataOrGfx
	mov r1, #0xe
	add r4, r0, #0
	bl GetItemAttr_PreloadedItemData
	cmp r0, #1
	beq _0208FDC8
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0208FDC8:
	add r0, r6, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0xf
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FDF2
	mov r0, #7
	tst r0, r5
	beq _0208FDF2
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FDF2:
	add r0, r4, #0
	mov r1, #0x10
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FE10
	mov r0, #0x88
	tst r0, r5
	beq _0208FE10
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FE10:
	add r0, r4, #0
	mov r1, #0x11
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FE2E
	mov r0, #0x10
	tst r0, r5
	beq _0208FE2E
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FE2E:
	add r0, r4, #0
	mov r1, #0x12
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FE4C
	mov r0, #0x20
	tst r0, r5
	beq _0208FE4C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FE4C:
	add r0, r4, #0
	mov r1, #0x13
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FE6A
	mov r0, #0x40
	tst r0, r5
	beq _0208FE6A
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FE6A:
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x17
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0208FE8E
	add r0, r4, #0
	mov r1, #0x18
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FEAA
_0208FE8E:
	add r0, r4, #0
	mov r1, #0x19
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0208FEAA
	cmp r5, #0
	bne _0208FED4
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FEAA:
	add r0, r4, #0
	mov r1, #0x26
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FED4
	cmp r5, #0
	beq _0208FED4
	add r0, r6, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	cmp r5, r0
	bhs _0208FED4
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FED4:
	add r0, r4, #0
	mov r1, #0x19
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FEFA
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x64
	bhs _0208FEFA
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FEFA:
	add r0, r4, #0
	mov r1, #0x1a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FF24
	mov r0, #0
	str r0, [sp]
	ldr r3, [sp, #4]
	add r1, r6, #0
	mov r2, #3
	bl GetMonEvolution
	cmp r0, #0
	beq _0208FF24
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FF24:
	add r0, r4, #0
	mov r1, #0x22
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _0208FF3C
	add r0, r4, #0
	mov r1, #0x23
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FF72
_0208FF3C:
	add r1, r7, #0
	add r0, r6, #0
	add r1, #0x3e
	mov r2, #0
	bl GetMonData
	cmp r0, #3
	bhs _0208FF72
	add r1, r7, #0
	add r0, r6, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0
	bl WazaGetMaxPp
	cmp r0, #5
	blo _0208FF72
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FF72:
	add r0, r4, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FF96
	add r0, r6, #0
	add r1, r7, #0
	bl MonMoveCanRestorePP
	cmp r0, #1
	bne _0208FF96
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FF96:
	add r0, r4, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0208FFC2
	mov r5, #0
_0208FFA4:
	add r0, r6, #0
	add r1, r5, #0
	bl MonMoveCanRestorePP
	cmp r0, #1
	bne _0208FFBC
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0208FFBC:
	add r5, r5, #1
	cmp r5, #4
	blt _0208FFA4
_0208FFC2:
	add r0, r6, #0
	mov r1, #0xd
	mov r2, #0
	bl GetMonData
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x14]
	add r0, r6, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r6, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x49
	lsl r1, r1, #2
	cmp r0, r1
	beq _02090086
	add r0, r4, #0
	mov r1, #0x27
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090086
	add r0, r4, #0
	mov r1, #0x30
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _0209005C
	cmp r5, #0x64
	bge _02090086
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	ldr r0, [sp, #0x10]
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	add r1, r0, r1
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r7, r0
	ldr r0, _020902B4 ; =0x000001FE
	cmp r1, r0
	bge _02090086
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0209005C:
	bge _02090086
	cmp r5, #0
	ble _0209006E
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0209006E:
	add r0, r6, #0
	add r1, r4, #0
	bl CanItemModFriendship
	cmp r0, #1
	bne _02090086
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02090086:
	add r0, r4, #0
	mov r1, #0x28
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020900F2
	add r0, r4, #0
	mov r1, #0x31
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _020900C6
	ldr r0, [sp, #0x14]
	cmp r0, #0x64
	bge _020900F2
	add r1, r5, r0
	ldr r0, [sp, #0x10]
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	add r1, r0, r1
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r7, r0
	ldr r0, _020902B4 ; =0x000001FE
	cmp r1, r0
	bge _020900F2
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020900C6:
	bge _020900F2
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ble _020900DA
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020900DA:
	add r0, r6, #0
	add r1, r4, #0
	bl CanItemModFriendship
	cmp r0, #1
	bne _020900F2
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020900F2:
	add r0, r4, #0
	mov r1, #0x29
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090160
	add r0, r4, #0
	mov r1, #0x32
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02090134
	ldr r0, [sp, #0x10]
	cmp r0, #0x64
	bge _02090160
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	ldr r0, [sp, #0x10]
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	add r1, r0, r1
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r7, r0
	ldr r0, _020902B4 ; =0x000001FE
	cmp r1, r0
	bge _02090160
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02090134:
	bge _02090160
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _02090148
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02090148:
	add r0, r6, #0
	add r1, r4, #0
	bl CanItemModFriendship
	cmp r0, #1
	bne _02090160
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02090160:
	add r0, r4, #0
	mov r1, #0x2a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020901CE
	add r0, r4, #0
	mov r1, #0x33
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _020901A2
	ldr r0, [sp, #0xc]
	cmp r0, #0x64
	bge _020901CE
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	ldr r0, [sp, #0x10]
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	add r1, r0, r1
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r7, r0
	ldr r0, _020902B4 ; =0x000001FE
	cmp r1, r0
	bge _020901CE
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020901A2:
	bge _020901CE
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _020901B6
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020901B6:
	add r0, r6, #0
	add r1, r4, #0
	bl CanItemModFriendship
	cmp r0, #1
	bne _020901CE
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020901CE:
	add r0, r4, #0
	mov r1, #0x2b
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209023C
	add r0, r4, #0
	mov r1, #0x34
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02090210
	ldr r0, [sp, #8]
	cmp r0, #0x64
	bge _0209023C
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	ldr r0, [sp, #0x10]
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	add r1, r0, r1
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r7, r0
	ldr r0, _020902B4 ; =0x000001FE
	cmp r1, r0
	bge _0209023C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02090210:
	bge _0209023C
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _02090224
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02090224:
	add r0, r6, #0
	add r1, r4, #0
	bl CanItemModFriendship
	cmp r0, #1
	bne _0209023C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0209023C:
	add r0, r4, #0
	mov r1, #0x2c
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020902A6
	add r0, r4, #0
	mov r1, #0x35
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _0209027C
	cmp r7, #0x64
	bge _020902A6
	ldr r0, [sp, #0x14]
	add r1, r5, r0
	ldr r0, [sp, #0x10]
	add r1, r0, r1
	ldr r0, [sp, #0xc]
	add r1, r0, r1
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r7, r0
	ldr r0, _020902B4 ; =0x000001FE
	cmp r1, r0
	bge _020902A6
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0209027C:
	bge _020902A6
	cmp r7, #0
	ble _0209028E
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0209028E:
	add r0, r6, #0
	add r1, r4, #0
	bl CanItemModFriendship
	cmp r0, #1
	bne _020902A6
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020902A6:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020902B4: .word 0x000001FE
	thumb_func_end CanUseItemOnPokemon

	thumb_func_start CanUseItemOnMonInParty
CanUseItemOnMonInParty: ; 0x020902B8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	bl GetPartyMonByIndex
	ldr r3, [sp, #0x10]
	add r1, r5, #0
	add r2, r4, #0
	bl CanUseItemOnPokemon
	pop {r3, r4, r5, pc}
	thumb_func_end CanUseItemOnMonInParty

	thumb_func_start UseItemOnPokemon
UseItemOnPokemon: ; 0x020902D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	str r1, [sp, #4]
	add r5, r0, #0
	ldr r0, [sp, #0x88]
	str r2, [sp, #8]
	str r0, [sp, #0x88]
	str r3, [sp, #0xc]
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x88]
	mov r1, #0
	bl LoadItemDataOrGfx
	mov r1, #0xe
	add r4, r0, #0
	bl GetItemAttr_PreloadedItemData
	cmp r0, #1
	beq _02090302
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x74
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02090302:
	mov r6, #0
	add r0, r5, #0
	mov r1, #0xa0
	add r2, r6, #0
	add r7, r6, #0
	bl GetMonData
	str r0, [sp, #0x54]
	str r0, [sp, #0x58]
	add r0, r4, #0
	mov r1, #0xf
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209032A
	ldr r1, [sp, #0x58]
	mov r0, #7
	bic r1, r0
	str r1, [sp, #0x58]
	mov r7, #1
_0209032A:
	add r0, r4, #0
	mov r1, #0x10
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090340
	ldr r1, [sp, #0x58]
	ldr r0, _020904EC ; =0xFFFFF077
	mov r7, #1
	and r0, r1
	str r0, [sp, #0x58]
_02090340:
	add r0, r4, #0
	mov r1, #0x11
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090356
	ldr r1, [sp, #0x58]
	mov r0, #0x10
	bic r1, r0
	str r1, [sp, #0x58]
	mov r7, #1
_02090356:
	add r0, r4, #0
	mov r1, #0x12
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209036C
	ldr r1, [sp, #0x58]
	mov r0, #0x20
	bic r1, r0
	str r1, [sp, #0x58]
	mov r7, #1
_0209036C:
	add r0, r4, #0
	mov r1, #0x13
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090382
	ldr r1, [sp, #0x58]
	mov r0, #0x40
	bic r1, r0
	str r1, [sp, #0x58]
	mov r7, #1
_02090382:
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0x58]
	cmp r1, r0
	beq _02090396
	add r0, r5, #0
	mov r1, #0xa0
	add r2, sp, #0x58
	bl SetMonData
	mov r6, #1
_02090396:
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x54]
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x58]
	add r0, r4, #0
	mov r1, #0x17
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	bne _020903C6
	add r0, r4, #0
	mov r1, #0x18
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020903F2
_020903C6:
	add r0, r4, #0
	mov r1, #0x19
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020903F2
	ldr r0, [sp, #0x54]
	cmp r0, #0
	bne _020903EE
	add r0, r4, #0
	mov r1, #0x36
	bl GetItemAttr_PreloadedItemData
	add r3, r0, #0
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x58]
	add r0, r5, #0
	bl RestoreMonHPBy
	mov r6, #1
_020903EE:
	mov r7, #1
	b _0209041E
_020903F2:
	add r0, r4, #0
	mov r1, #0x26
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209041E
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0x58]
	cmp r1, r0
	bge _0209041C
	add r0, r4, #0
	mov r1, #0x36
	bl GetItemAttr_PreloadedItemData
	add r3, r0, #0
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x58]
	add r0, r5, #0
	bl RestoreMonHPBy
	mov r6, #1
_0209041C:
	mov r7, #1
_0209041E:
	add r0, r5, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x5c]
	add r0, r4, #0
	mov r1, #0x19
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090476
	ldr r0, [sp, #0x5c]
	cmp r0, #0x64
	bge _02090474
	add r0, r5, #0
	bl CalcMonExpToNextLevel
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #8
	bl AddMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	ldr r0, [sp, #0x54]
	cmp r0, #0
	bne _02090472
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r3, [sp, #0x58]
	ldr r1, [sp, #0x54]
	add r0, r5, #0
	sub r3, r2, r3
	str r2, [sp, #0x60]
	bl RestoreMonHPBy
_02090472:
	mov r6, #1
_02090474:
	mov r7, #1
_02090476:
	add r0, r4, #0
	mov r1, #0x1a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090484
	mov r7, #1
_02090484:
	add r0, r4, #0
	mov r1, #0x22
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020904A4
	ldr r1, [sp, #8]
	add r0, r5, #0
	mov r2, #1
	bl BoostMonMovePpUpBy
	cmp r0, #1
	bne _020904A0
	mov r6, #1
_020904A0:
	mov r7, #1
	b _020904C2
_020904A4:
	add r0, r4, #0
	mov r1, #0x23
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020904C2
	ldr r1, [sp, #8]
	add r0, r5, #0
	mov r2, #3
	bl BoostMonMovePpUpBy
	cmp r0, #1
	bne _020904C0
	mov r6, #1
_020904C0:
	mov r7, #1
_020904C2:
	add r0, r4, #0
	mov r1, #0x24
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020904F0
	add r0, r4, #0
	mov r1, #0x37
	bl GetItemAttr_PreloadedItemData
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl MonMoveRestorePP
	cmp r0, #1
	bne _020904E6
	mov r6, #1
_020904E6:
	mov r7, #1
	b _0209052A
	nop
_020904EC: .word 0xFFFFF077
_020904F0:
	add r0, r4, #0
	mov r1, #0x25
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209052A
	mov r0, #0
	str r0, [sp, #0x54]
	cmp r0, #4
	bge _02090528
	mov r7, #0x37
_02090506:
	add r0, r4, #0
	add r1, r7, #0
	bl GetItemAttr_PreloadedItemData
	add r2, r0, #0
	ldr r1, [sp, #0x54]
	add r0, r5, #0
	bl MonMoveRestorePP
	cmp r0, #1
	bne _0209051E
	mov r6, #1
_0209051E:
	ldr r0, [sp, #0x54]
	add r0, r0, #1
	str r0, [sp, #0x54]
	cmp r0, #4
	blt _02090506
_02090528:
	mov r7, #1
_0209052A:
	add r0, r5, #0
	mov r1, #0xd
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x54]
	add r0, r5, #0
	mov r1, #0xe
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x58]
	add r0, r5, #0
	mov r1, #0xf
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x5c]
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x60]
	add r0, r5, #0
	mov r1, #0x11
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x64]
	add r0, r5, #0
	mov r1, #0x12
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x68]
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x49
	lsl r1, r1, #2
	cmp r0, r1
	beq _020905E4
	add r0, r4, #0
	mov r1, #0x27
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020905E4
	add r0, r4, #0
	mov r1, #0x30
	bl GetItemAttr_PreloadedItemData
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x58]
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x60]
	str r0, [sp, #0x10]
	str r1, [sp, #0x18]
	ldr r1, [sp, #0x5c]
	str r0, [sp, #0x70]
	add r2, r2, r1
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x68]
	add r2, r1, r2
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x54]
	add r1, r1, r2
	ldr r2, [sp, #0x10]
	add r1, r3, r1
	bl TryModEV
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0x6c]
	cmp r0, r1
	beq _020905DC
	str r0, [sp, #0x54]
	add r0, r5, #0
	mov r1, #0xd
	add r2, sp, #0x54
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	mov r6, #1
_020905DC:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	ble _020905E4
	mov r7, #1
_020905E4:
	add r0, r4, #0
	mov r1, #0x28
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090644
	add r0, r4, #0
	mov r1, #0x31
	bl GetItemAttr_PreloadedItemData
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x54]
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x60]
	str r0, [sp, #0x1c]
	str r1, [sp, #0x24]
	ldr r1, [sp, #0x5c]
	str r0, [sp, #0x70]
	add r2, r2, r1
	ldr r1, [sp, #0x24]
	ldr r3, [sp, #0x68]
	add r2, r1, r2
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x58]
	add r1, r1, r2
	ldr r2, [sp, #0x1c]
	add r1, r3, r1
	bl TryModEV
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0x6c]
	cmp r0, r1
	beq _0209063C
	str r0, [sp, #0x58]
	add r0, r5, #0
	mov r1, #0xe
	add r2, sp, #0x58
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	mov r6, #1
_0209063C:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	ble _02090644
	mov r7, #1
_02090644:
	add r0, r4, #0
	mov r1, #0x29
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020906A4
	add r0, r4, #0
	mov r1, #0x32
	bl GetItemAttr_PreloadedItemData
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x54]
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x60]
	str r0, [sp, #0x28]
	str r1, [sp, #0x30]
	ldr r1, [sp, #0x58]
	str r0, [sp, #0x70]
	add r2, r2, r1
	ldr r1, [sp, #0x30]
	ldr r3, [sp, #0x68]
	add r2, r1, r2
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x5c]
	add r1, r1, r2
	ldr r2, [sp, #0x28]
	add r1, r3, r1
	bl TryModEV
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0x6c]
	cmp r0, r1
	beq _0209069C
	str r0, [sp, #0x5c]
	add r0, r5, #0
	mov r1, #0xf
	add r2, sp, #0x5c
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	mov r6, #1
_0209069C:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	ble _020906A4
	mov r7, #1
_020906A4:
	add r0, r4, #0
	mov r1, #0x2a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090704
	add r0, r4, #0
	mov r1, #0x33
	bl GetItemAttr_PreloadedItemData
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x54]
	str r1, [sp, #0x38]
	ldr r1, [sp, #0x5c]
	str r0, [sp, #0x34]
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x58]
	str r0, [sp, #0x70]
	add r2, r2, r1
	ldr r1, [sp, #0x3c]
	ldr r3, [sp, #0x68]
	add r2, r1, r2
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x60]
	add r1, r1, r2
	ldr r2, [sp, #0x34]
	add r1, r3, r1
	bl TryModEV
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0x6c]
	cmp r0, r1
	beq _020906FC
	str r0, [sp, #0x60]
	add r0, r5, #0
	mov r1, #0x10
	add r2, sp, #0x60
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	mov r6, #1
_020906FC:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	ble _02090704
	mov r7, #1
_02090704:
	add r0, r4, #0
	mov r1, #0x2b
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090764
	add r0, r4, #0
	mov r1, #0x34
	bl GetItemAttr_PreloadedItemData
	ldr r1, [sp, #0x60]
	ldr r2, [sp, #0x54]
	str r1, [sp, #0x44]
	ldr r1, [sp, #0x5c]
	str r0, [sp, #0x40]
	str r1, [sp, #0x48]
	ldr r1, [sp, #0x58]
	str r0, [sp, #0x70]
	add r2, r2, r1
	ldr r1, [sp, #0x48]
	ldr r3, [sp, #0x68]
	add r2, r1, r2
	ldr r1, [sp, #0x44]
	ldr r0, [sp, #0x64]
	add r1, r1, r2
	ldr r2, [sp, #0x40]
	add r1, r3, r1
	bl TryModEV
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0x6c]
	cmp r0, r1
	beq _0209075C
	str r0, [sp, #0x64]
	add r0, r5, #0
	mov r1, #0x11
	add r2, sp, #0x64
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	mov r6, #1
_0209075C:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	ble _02090764
	mov r7, #1
_02090764:
	add r0, r4, #0
	mov r1, #0x2c
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _020907C4
	add r0, r4, #0
	mov r1, #0x35
	bl GetItemAttr_PreloadedItemData
	ldr r1, [sp, #0x60]
	ldr r2, [sp, #0x54]
	str r1, [sp, #0x50]
	ldr r1, [sp, #0x5c]
	str r0, [sp, #0x4c]
	mov ip, r1
	ldr r1, [sp, #0x58]
	str r0, [sp, #0x70]
	add r1, r2, r1
	mov r2, ip
	add r2, r2, r1
	ldr r1, [sp, #0x50]
	ldr r3, [sp, #0x64]
	add r1, r1, r2
	ldr r0, [sp, #0x68]
	ldr r2, [sp, #0x4c]
	add r1, r3, r1
	bl TryModEV
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0x6c]
	cmp r0, r1
	beq _020907BC
	str r0, [sp, #0x68]
	add r0, r5, #0
	mov r1, #0x12
	add r2, sp, #0x68
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	mov r6, #1
_020907BC:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	ble _020907C4
	mov r7, #1
_020907C4:
	cmp r6, #0
	bne _020907D8
	cmp r7, #1
	bne _020907D8
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x74
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020907D8:
	add r0, r5, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x54]
	cmp r0, #0x64
	bge _02090820
	add r0, r4, #0
	mov r1, #0x2d
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209089E
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl sub_02097EF4
	add r0, r4, #0
	mov r1, #0x38
	bl GetItemAttr_PreloadedItemData
	add r2, r0, #0
	ldr r0, [sp, #0x88]
	str r0, [sp]
	ldr r1, [sp, #0x54]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	bl DoItemFriendshipMod
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x74
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02090820:
	blt _0209085E
	cmp r0, #0xc8
	bge _0209085E
	add r0, r4, #0
	mov r1, #0x2e
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209089E
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl sub_02097EF4
	add r0, r4, #0
	mov r1, #0x39
	bl GetItemAttr_PreloadedItemData
	add r2, r0, #0
	ldr r0, [sp, #0x88]
	str r0, [sp]
	ldr r1, [sp, #0x54]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	bl DoItemFriendshipMod
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x74
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_0209085E:
	cmp r0, #0xc8
	blt _0209089E
	cmp r0, #0xff
	bgt _0209089E
	add r0, r4, #0
	mov r1, #0x2f
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _0209089E
	ldr r1, [sp, #4]
	add r0, r5, #0
	bl sub_02097EF4
	add r0, r4, #0
	mov r1, #0x3a
	bl GetItemAttr_PreloadedItemData
	add r2, r0, #0
	ldr r0, [sp, #0x88]
	str r0, [sp]
	ldr r1, [sp, #0x54]
	ldr r3, [sp, #0xc]
	add r0, r5, #0
	bl DoItemFriendshipMod
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x74
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_0209089E:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end UseItemOnPokemon

	thumb_func_start UseItemOnMonInParty
UseItemOnMonInParty: ; 0x020908AC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	bl GetPartyMonByIndex
	ldr r1, [sp, #0x14]
	add r3, sp, #0
	str r1, [sp]
	ldrh r3, [r3, #0x10]
	add r1, r5, #0
	add r2, r4, #0
	bl UseItemOnPokemon
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end UseItemOnMonInParty

	thumb_func_start MonMoveCanRestorePP
MonMoveCanRestorePP: ; 0x020908CC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r1, #0x36
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	bne _020908E4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020908E4:
	add r1, r6, #0
	add r0, r5, #0
	add r1, #0x3a
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	add r6, #0x3e
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	add r0, r7, #0
	bl WazaGetMaxPp
	cmp r4, r0
	bhs _02090912
	mov r0, #1
	b _02090914
_02090912:
	mov r0, #0
_02090914:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MonMoveCanRestorePP

	thumb_func_start MonMoveRestorePP
MonMoveRestorePP: ; 0x0209091C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r2, #0
	add r1, #0x36
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	bne _0209093A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0209093A:
	add r0, r5, #0
	str r0, [sp]
	add r0, #0x3a
	str r0, [sp]
	ldr r1, [sp]
	add r0, r6, #0
	mov r2, #0
	bl GetMonData
	add r1, sp, #4
	strb r0, [r1]
	add r5, #0x3e
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl WazaGetMaxPp
	add r1, sp, #4
	ldrb r2, [r1]
	cmp r2, r0
	bhs _02090994
	cmp r4, #0x7f
	bne _02090978
	strb r0, [r1]
	b _02090984
_02090978:
	add r2, r2, r4
	strb r2, [r1]
	ldrb r2, [r1]
	cmp r2, r0
	bls _02090984
	strb r0, [r1]
_02090984:
	ldr r1, [sp]
	add r0, r6, #0
	add r2, sp, #4
	bl SetMonData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02090994:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MonMoveRestorePP

	thumb_func_start BoostMonMovePpUpBy
BoostMonMovePpUpBy: ; 0x0209099C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r4, r1, #0
	str r1, [sp]
	add r1, #0x3e
	mov r2, #0
	add r5, r0, #0
	str r1, [sp]
	bl GetMonData
	add r1, sp, #8
	strb r0, [r1]
	ldrb r0, [r1]
	cmp r0, #3
	bne _020909C2
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020909C2:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0
	str r0, [sp, #4]
	bl WazaGetMaxPp
	cmp r0, #5
	bhs _020909E4
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020909E4:
	add r4, #0x3a
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl GetMonData
	add r1, sp, #8
	strb r0, [r1, #1]
	ldrb r1, [r1]
	ldr r0, [sp, #4]
	bl WazaGetMaxPp
	add r7, r0, #0
	add r0, sp, #8
	ldrb r0, [r0]
	add r0, r0, r6
	cmp r0, #3
	bls _02090A0C
	mov r0, #3
	b _02090A10
_02090A0C:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
_02090A10:
	add r1, sp, #8
	strb r0, [r1]
	ldrb r1, [r1]
	ldr r0, [sp, #4]
	bl WazaGetMaxPp
	add r1, sp, #8
	ldrb r2, [r1, #1]
	add r0, r2, r0
	sub r0, r0, r7
	strb r0, [r1, #1]
	ldr r1, [sp]
	add r0, r5, #0
	add r2, sp, #8
	bl SetMonData
	add r2, sp, #8
	add r0, r5, #0
	add r1, r4, #0
	add r2, #1
	bl SetMonData
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end BoostMonMovePpUpBy

	thumb_func_start RestoreMonHPBy
RestoreMonHPBy: ; 0x02090A44
	push {r0, r1, r2, r3}
	push {r3, lr}
	cmp r2, #1
	bne _02090A50
	mov r3, #1
	b _02090A66
_02090A50:
	cmp r3, #0xff
	bne _02090A58
	add r3, r2, #0
	b _02090A66
_02090A58:
	cmp r3, #0xfe
	bne _02090A60
	lsr r3, r2, #1
	b _02090A66
_02090A60:
	cmp r3, #0xfd
	bne _02090A66
	lsr r3, r2, #2
_02090A66:
	ldr r1, [sp, #0xc]
	add r1, r1, r3
	cmp r1, r2
	bls _02090A72
	str r2, [sp, #0xc]
	b _02090A74
_02090A72:
	str r1, [sp, #0xc]
_02090A74:
	mov r1, #0xa3
	add r2, sp, #0xc
	bl SetMonData
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end RestoreMonHPBy

	thumb_func_start TryModEV
TryModEV: ; 0x02090A84
	push {r3, r4}
	cmp r0, #0
	bne _02090A96
	cmp r2, #0
	bge _02090A96
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
_02090A96:
	cmp r0, #0x64
	blt _02090AA6
	cmp r2, #0
	ble _02090AA6
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
_02090AA6:
	ldr r3, _02090AD8 ; =0x000001FE
	add r4, r0, r1
	cmp r4, r3
	blt _02090ABA
	cmp r2, #0
	ble _02090ABA
	mov r0, #0
	mvn r0, r0
	pop {r3, r4}
	bx lr
_02090ABA:
	add r0, r0, r2
	cmp r0, #0x64
	ble _02090AC4
	mov r0, #0x64
	b _02090ACA
_02090AC4:
	cmp r0, #0
	bge _02090ACA
	mov r0, #0
_02090ACA:
	ldr r2, _02090AD8 ; =0x000001FE
	add r3, r0, r1
	cmp r3, r2
	ble _02090AD4
	sub r0, r2, r1
_02090AD4:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02090AD8: .word 0x000001FE
	thumb_func_end TryModEV

	thumb_func_start CanItemModFriendship
CanItemModFriendship: ; 0x02090ADC
	push {r4, lr}
	add r4, r1, #0
	mov r1, #9
	mov r2, #0
	bl GetMonData
	cmp r0, #0xff
	blt _02090AF0
	mov r0, #0
	pop {r4, pc}
_02090AF0:
	cmp r0, #0x64
	bge _02090B14
	add r0, r4, #0
	mov r1, #0x2d
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090B10
	add r0, r4, #0
	mov r1, #0x38
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02090B10
	mov r0, #1
	pop {r4, pc}
_02090B10:
	mov r0, #0
	pop {r4, pc}
_02090B14:
	blt _02090B3A
	cmp r0, #0xc8
	bge _02090B3A
	add r0, r4, #0
	mov r1, #0x2e
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090B36
	add r0, r4, #0
	mov r1, #0x39
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02090B36
	mov r0, #1
	pop {r4, pc}
_02090B36:
	mov r0, #0
	pop {r4, pc}
_02090B3A:
	cmp r0, #0xc8
	blt _02090B62
	cmp r0, #0xff
	bge _02090B62
	add r0, r4, #0
	mov r1, #0x2f
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	beq _02090B5E
	add r0, r4, #0
	mov r1, #0x3a
	bl GetItemAttr_PreloadedItemData
	cmp r0, #0
	ble _02090B5E
	mov r0, #1
	pop {r4, pc}
_02090B5E:
	mov r0, #0
	pop {r4, pc}
_02090B62:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end CanItemModFriendship

	thumb_func_start DoItemFriendshipMod
DoItemFriendshipMod: ; 0x02090B68
	push {r0, r1, r2, r3}
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r3, #0
	cmp r4, #0xff
	bne _02090B86
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _02090B86
	mov r0, #0
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
_02090B86:
	cmp r4, #0
	bne _02090B9A
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bge _02090B9A
	mov r0, #0
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
_02090B9A:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _02090BF0
	add r0, r5, #0
	mov r1, #0x9b
	mov r2, #0
	bl GetMonData
	cmp r0, #0xb
	bne _02090BB4
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_02090BB4:
	add r0, r5, #0
	mov r1, #0x98
	mov r2, #0
	bl GetMonData
	cmp r6, r0
	bne _02090BC8
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
_02090BC8:
	add r0, r5, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	ldr r2, [sp, #0x20]
	lsr r0, r0, #0x10
	mov r1, #1
	bl GetItemAttr
	cmp r0, #0x35
	bne _02090BF0
	ldr r1, [sp, #0x18]
	mov r0, #0x96
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	str r0, [sp, #0x18]
_02090BF0:
	ldr r0, [sp, #0x18]
	add r0, r0, r4
	str r0, [sp, #0x18]
	cmp r0, #0xff
	ble _02090BFE
	mov r0, #0xff
	str r0, [sp, #0x18]
_02090BFE:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bge _02090C08
	mov r0, #0
	str r0, [sp, #0x18]
_02090C08:
	add r0, r5, #0
	mov r1, #9
	add r2, sp, #0x18
	bl SetMonData
	mov r0, #1
	pop {r4, r5, r6}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end DoItemFriendshipMod

	thumb_func_start HealParty
HealParty: ; 0x02090C1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	bl GetPartyCount
	mov r7, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02090C90
	mov r6, #0x7f
_02090C30:
	ldr r0, [sp]
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02090C88
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xa3
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0xa0
	add r2, sp, #8
	bl SetMonData
	mov r4, #0
_02090C6C:
	add r0, r5, #0
	add r1, r4, #0
	bl MonMoveCanRestorePP
	cmp r0, #1
	bne _02090C82
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MonMoveRestorePP
_02090C82:
	add r4, r4, #1
	cmp r4, #4
	blt _02090C6C
_02090C88:
	ldr r0, [sp, #4]
	add r7, r7, #1
	cmp r7, r0
	blt _02090C30
_02090C90:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end HealParty
