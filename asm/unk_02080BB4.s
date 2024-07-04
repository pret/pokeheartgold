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
	.extern sub_020823F4
	.extern sub_02082448
	.extern sub_020825D8

	.text

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
