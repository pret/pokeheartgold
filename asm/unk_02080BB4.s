#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_02080BB4.inc"
	.include "global.inc"

	.extern sub_02080BB4
	.extern sub_02080E9C
	.extern sub_02081720
	.extern sub_020817DC
	.extern sub_02081C50
	.extern sub_02081F8C
	.extern sub_02081FE0

	.text

	thumb_func_start sub_020822CC
sub_020822CC: ; 0x020822CC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02082360 ; =0x00000654
	ldr r1, _02082364 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
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
	bl String_Delete
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl PartyMenu_PrintMessageOnWindow34
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
	bl Party_GetMonByIndex
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
	bl String_Delete
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl PartyMenu_PrintMessageOnWindow34
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
	bl String_Delete
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl PartyMenu_PrintMessageOnWindow34
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
	bl String_Delete
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #1
	bl PartyMenu_PrintMessageOnWindow34
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
	bl String_Delete
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl PartyMenu_PrintMessageOnWindow34
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
	bl String_Delete
	mov r1, #0
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0
	bl PartyMenu_PrintMessageOnWindow34
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
	bl GetMoveMaxPP
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
	bl Party_GetMonByIndex
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
	bl String_Delete
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
	bl PartyMenu_PrintMessageOnWindow33
	b _02082682
_02082678:
	add r0, r5, #0
	mov r1, #0x29
	mov r2, #1
	bl PartyMenu_PrintMessageOnWindow33
_02082682:
	mov r0, #5
	mov r1, #0xc
	bl ListMenuItems_New
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
	bl GetPartyMenuContextMenuActionFunc
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
	bl PartyMenu_CreateContextMenuCursor
	ldr r1, _02082734 ; =0x00000824
	str r0, [r5, r1]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02082734: .word 0x00000824
	thumb_func_end sub_02082654

	thumb_func_start PartyMenu_Subtask_SelectMove
PartyMenu_Subtask_SelectMove: ; 0x02082738
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, _02082850 ; =0x00000824
	add r5, r0, #0
	ldr r1, [r5, r1]
	bl PartyMenu_HandleSubcontextMenuInput_TopLevel
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
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
	add r0, r5, #0
	mov r1, #0x21
	mov r2, #1
	bl PartyMenu_PrintMessageOnWindow32
	ldr r0, _02082854 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl thunk_Sprite_SetPalIndex
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
	bl PartyMenu_DisableMainScreenBlend_AfterYesNo
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
	bl Party_GetMonByIndex
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
	bl PartyMenu_PrintMessageOnWindow34
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
	thumb_func_end PartyMenu_Subtask_SelectMove

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
	bl PartyMenu_SetMonHeldMailIcon
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
	bl PartyMenu_PrintMessageOnWindow34
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
