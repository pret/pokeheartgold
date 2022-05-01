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

	.bss

_021D43B0:
	.space 0x4

	.text

	thumb_func_start sub_0207F42C
sub_0207F42C: ; 0x0207F42C
	lsl r1, r0, #2
	ldr r0, _0207F434 ; =_02101CB8
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0207F434: .word _02101CB8
	thumb_func_end sub_0207F42C

	thumb_func_start sub_0207F438
sub_0207F438: ; 0x0207F438
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	add r0, r5, #0
	mov r1, #0x27
	mov r2, #0
	bl sub_0207DAD8
	mov r0, #3
	mov r1, #0xc
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #3
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x44
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #4
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x40
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
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
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #8]
	add r1, sp, #4
	strb r2, [r1, #8]
	mov r3, #1
	strb r3, [r1, #9]
	mov r0, #3
	strb r0, [r1, #0xa]
	ldrb r6, [r1, #0xb]
	mov r0, #0xf
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0x30
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0xc0
	bic r6, r0
	strb r6, [r1, #0xb]
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
	ldr r1, _0207F4F8 ; =0x00000824
	str r0, [r5, r1]
	mov r0, #0xf
	str r0, [r4]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207F4F8: .word 0x00000824
	thumb_func_end sub_0207F438

	thumb_func_start sub_0207F4FC
sub_0207F4FC: ; 0x0207F4FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207F51C ; =0x00000654
	mov r1, #3
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207F51C: .word 0x00000654
	thumb_func_end sub_0207F4FC

	thumb_func_start sub_0207F520
sub_0207F520: ; 0x0207F520
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	add r7, r1, #0
	add r0, r5, r0
	mov r1, #1
	mov r4, #0x11
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207F684 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r2, r5, r0
	ldr r0, _0207F688 ; =0x00000834
	ldrh r2, [r2, r0]
	ldr r0, _0207F68C ; =0x00000654
	cmp r2, #0
	bne _0207F590
	ldr r0, [r5, r0]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r2, #0x1f
	lsl r2, r2, #6
	add r6, r0, #0
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x52
	bl ReadMsgDataIntoString
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207F690 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207F690 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207F65E
_0207F590:
	ldr r0, [r5, r0]
	add r1, r2, #0
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #1
	bne _0207F64E
	ldr r0, _0207F68C ; =0x00000654
	ldr r1, _0207F684 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0
	str r1, [sp]
	add r6, r0, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r6, #0
	bl Pokemon_UpdateArceusForme
	add r0, r6, #0
	bl Mon_UpdateGiratinaForme
	ldr r1, _0207F684 ; =0x00000C65
	ldrb r2, [r5, r1]
	mov r1, #0x30
	mul r1, r2
	add r2, r5, r1
	ldr r1, _0207F688 ; =0x00000834
	ldrh r1, [r2, r1]
	cmp r1, #0x70
	bne _0207F5E2
	cmp r0, #0
	bne _0207F5E2
	mov r4, #0x12
_0207F5E2:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x53
	bl ReadMsgDataIntoString
	add r0, r6, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207F690 ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207F684 ; =0x00000C65
	ldr r3, _0207F690 ; =0x000007C4
	ldrb r6, [r5, r2]
	mov r2, #0x30
	ldr r0, [r5, r3]
	mul r2, r6
	add r2, r5, r2
	add r3, #0x70
	ldrh r2, [r2, r3]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207F690 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	ldr r6, _0207F684 ; =0x00000C65
	mov r3, #0x30
	ldrb r1, [r5, r6]
	mov r0, #0
	add r2, r1, #0
	mul r2, r3
	add r1, r5, r2
	ldr r2, _0207F688 ; =0x00000834
	strh r0, [r1, r2]
	ldrb r1, [r5, r6]
	add r0, r5, #0
	mul r3, r1
	add r3, r5, r3
	ldrh r2, [r3, r2]
	bl sub_0207F004
	b _0207F65E
_0207F64E:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x54
	bl ReadMsgDataIntoString
_0207F65E:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	mov r2, #0x2a
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	str r4, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207F684: .word 0x00000C65
_0207F688: .word 0x00000834
_0207F68C: .word 0x00000654
_0207F690: .word 0x000007C4
	thumb_func_end sub_0207F520

	thumb_func_start sub_0207F694
sub_0207F694: ; 0x0207F694
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207F6DC ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207F6D6
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207F6E0 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _0207F6E4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0207F6D6:
	mov r0, #0x11
	pop {r4, pc}
	nop
_0207F6DC: .word 0x00000C64
_0207F6E0: .word 0x00000678
_0207F6E4: .word 0x04000050
	thumb_func_end sub_0207F694

	thumb_func_start sub_0207F6E8
sub_0207F6E8: ; 0x0207F6E8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207F71C ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207F716
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB54
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	mov r0, #0x13
	pop {r4, pc}
_0207F716:
	mov r0, #0x12
	pop {r4, pc}
	nop
_0207F71C: .word 0x00000C64
	thumb_func_end sub_0207F6E8

	thumb_func_start sub_0207F720
sub_0207F720: ; 0x0207F720
	push {r4, lr}
	add r4, r0, #0
	bl PartyMenu_AnimateIconFormeChange
	cmp r0, #1
	bne _0207F736
	add r0, r4, #0
	bl sub_0207CB6C
	mov r0, #0x11
	pop {r4, pc}
_0207F736:
	mov r0, #0x13
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207F720

	thumb_func_start sub_0207F73C
sub_0207F73C: ; 0x0207F73C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	add r0, r5, #0
	mov r1, #0x28
	mov r2, #0
	bl sub_0207DAD8
	mov r0, #3
	mov r1, #0xc
	bl ListMenuItems_ctor
	mov r1, #0x82
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #6
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x38
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
	mov r0, #7
	bl sub_0207F42C
	mov r1, #0x82
	lsl r1, r1, #4
	add r2, r0, #0
	ldr r0, [r5, r1]
	sub r1, #0x34
	ldr r1, [r5, r1]
	bl ListMenuItems_AddItem
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
	mov r0, #0x8d
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #8]
	add r1, sp, #4
	strb r2, [r1, #8]
	mov r3, #1
	strb r3, [r1, #9]
	mov r0, #3
	strb r0, [r1, #0xa]
	ldrb r6, [r1, #0xb]
	mov r0, #0xf
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0x30
	bic r6, r0
	strb r6, [r1, #0xb]
	ldrb r6, [r1, #0xb]
	mov r0, #0xc0
	bic r6, r0
	strb r6, [r1, #0xb]
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
	ldr r1, _0207F7FC ; =0x00000824
	str r0, [r5, r1]
	mov r0, #0xf
	str r0, [r4]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0207F7FC: .word 0x00000824
	thumb_func_end sub_0207F73C

	thumb_func_start sub_0207F800
sub_0207F800: ; 0x0207F800
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207F820 ; =0x00000654
	mov r1, #7
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207F820: .word 0x00000654
	thumb_func_end sub_0207F800

	thumb_func_start sub_0207F824
sub_0207F824: ; 0x0207F824
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #2
	add r4, r1, #0
	add r0, r5, r0
	mov r1, #1
	bl sub_0200E5D4
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x2c
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207F864 ; =sub_0207F870
	ldr r1, _0207F868 ; =0x00000C58
	ldr r2, _0207F86C ; =sub_0207F8F4
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207F864: .word sub_0207F870
_0207F868: .word 0x00000C58
_0207F86C: .word sub_0207F8F4
	thumb_func_end sub_0207F824

	thumb_func_start sub_0207F870
sub_0207F870: ; 0x0207F870
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0207F8E0 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _0207F8E4 ; =0x00000654
	ldr r1, _0207F8E8 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, _0207F8E4 ; =0x00000654
	mov r2, #0xc
	ldr r0, [r4, r0]
	ldr r0, [r0, #8]
	bl sub_02090FA8
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _0207F8CA
	ldr r1, _0207F8E8 ; =0x00000C65
	mov r2, #0x30
	ldrb r3, [r4, r1]
	mov r0, #0
	add r5, r3, #0
	mul r5, r2
	ldr r3, _0207F8EC ; =0x00000834
	add r5, r4, r5
	strh r0, [r5, r3]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	add r0, r4, #0
	mov r1, #0x2f
	mov r2, #0
	bl sub_0207DAEC
	b _0207F8D4
_0207F8CA:
	add r0, r4, #0
	mov r1, #0x33
	mov r2, #0
	bl sub_0207DAEC
_0207F8D4:
	ldr r0, _0207F8F0 ; =0x00000C62
	mov r1, #0x14
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0207F8E0: .word 0x04000050
_0207F8E4: .word 0x00000654
_0207F8E8: .word 0x00000C65
_0207F8EC: .word 0x00000834
_0207F8F0: .word 0x00000C62
	thumb_func_end sub_0207F870

	thumb_func_start sub_0207F8F4
sub_0207F8F4: ; 0x0207F8F4
	push {r4, lr}
	mov r1, #0x30
	mov r2, #0
	add r4, r0, #0
	bl sub_0207DAEC
	ldr r0, _0207F918 ; =sub_0207F924
	ldr r1, _0207F91C ; =0x00000C58
	ldr r2, _0207F920 ; =sub_0207F9CC
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r4, pc}
	nop
_0207F918: .word sub_0207F924
_0207F91C: .word 0x00000C58
_0207F920: .word sub_0207F9CC
	thumb_func_end sub_0207F8F4

	thumb_func_start sub_0207F924
sub_0207F924: ; 0x0207F924
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0207F9B8 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r1, _0207F9BC ; =0x00000C65
	ldr r0, _0207F9C0 ; =0x00000654
	ldrb r2, [r4, r1]
	mov r1, #0x30
	ldr r0, [r4, r0]
	mul r1, r2
	add r2, r4, r1
	ldr r1, _0207F9C4 ; =0x00000834
	ldr r0, [r0, #4]
	ldrh r1, [r2, r1]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #1
	bne _0207F9A2
	ldr r0, _0207F9C0 ; =0x00000654
	ldr r1, _0207F9BC ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0
	str r1, [sp]
	add r5, r0, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	add r0, r5, #0
	bl Pokemon_UpdateArceusForme
	add r0, r5, #0
	bl Mon_UpdateGiratinaForme
	ldr r1, _0207F9BC ; =0x00000C65
	mov r2, #0x30
	ldrb r3, [r4, r1]
	mov r0, #0
	add r5, r3, #0
	mul r5, r2
	ldr r3, _0207F9C4 ; =0x00000834
	add r5, r4, r5
	strh r0, [r5, r3]
	ldrb r1, [r4, r1]
	add r0, r4, #0
	mul r2, r1
	add r2, r4, r2
	ldrh r2, [r2, r3]
	bl sub_0207F004
	add r0, r4, #0
	mov r1, #0x34
	mov r2, #0
	bl sub_0207DAEC
	b _0207F9AC
_0207F9A2:
	add r0, r4, #0
	mov r1, #0x54
	mov r2, #0
	bl sub_0207DAEC
_0207F9AC:
	ldr r0, _0207F9C8 ; =0x00000C62
	mov r1, #0x14
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r3, r4, r5, pc}
	nop
_0207F9B8: .word 0x04000050
_0207F9BC: .word 0x00000C65
_0207F9C0: .word 0x00000654
_0207F9C4: .word 0x00000834
_0207F9C8: .word 0x00000C62
	thumb_func_end sub_0207F924

	thumb_func_start sub_0207F9CC
sub_0207F9CC: ; 0x0207F9CC
	push {r4, lr}
	ldr r2, _0207FA00 ; =0x04000050
	mov r1, #0
	add r4, r0, #0
	strh r1, [r2]
	bl sub_02079224
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207FA04 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r4, pc}
	nop
_0207FA00: .word 0x04000050
_0207FA04: .word 0x00000678
	thumb_func_end sub_0207F9CC

	thumb_func_start sub_0207FA08
sub_0207FA08: ; 0x0207FA08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207FA38 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0207FA38: .word 0x00000678
	thumb_func_end sub_0207FA08

	thumb_func_start sub_0207FA3C
sub_0207FA3C: ; 0x0207FA3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _0207FA90 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207FA94 ; =0x0000083A
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207FA6C
	ldr r0, _0207FA98 ; =0x00000654
	mov r1, #0
	ldr r0, [r5, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	str r0, [r4]
	pop {r3, r4, r5, pc}
_0207FA6C:
	add r0, r5, #0
	mov r1, #0xb3
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207FA9C ; =sub_0207FAA8
	ldr r1, _0207FAA0 ; =0x00000C58
	ldr r2, _0207FAA4 ; =sub_0207FAD4
	str r0, [r5, r1]
	add r0, r1, #4
	str r2, [r5, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r5, r1]
	mov r0, #0x18
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207FA90: .word 0x00000C65
_0207FA94: .word 0x0000083A
_0207FA98: .word 0x00000654
_0207FA9C: .word sub_0207FAA8
_0207FAA0: .word 0x00000C58
_0207FAA4: .word sub_0207FAD4
	thumb_func_end sub_0207FA3C

	thumb_func_start sub_0207FAA8
sub_0207FAA8: ; 0x0207FAA8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207FACC ; =0x00000654
	ldr r1, _0207FAD0 ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	bl Pokemon_RemoveCapsule
	ldr r0, _0207FACC ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
	.balign 4, 0
_0207FACC: .word 0x00000654
_0207FAD0: .word 0x00000C65
	thumb_func_end sub_0207FAA8

	thumb_func_start sub_0207FAD4
sub_0207FAD4: ; 0x0207FAD4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207FB04 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207FB08 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r4, pc}
	nop
_0207FB04: .word 0x04000050
_0207FB08: .word 0x00000678
	thumb_func_end sub_0207FAD4

	thumb_func_start sub_0207FB0C
sub_0207FB0C: ; 0x0207FB0C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0207FBB8 ; =0x00000C63
	add r4, r1, #0
	ldrb r2, [r5, r0]
	mov r1, #0x40
	orr r1, r2
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	mov r2, #0x3f
	bic r1, r2
	add r2, r0, #2
	ldrb r3, [r5, r2]
	mov r2, #0x3f
	and r2, r3
	orr r1, r2
	strb r1, [r5, r0]
	ldr r0, _0207FBBC ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	ldr r0, _0207FBBC ; =0x00000678
	add r1, sp, #0
	ldr r0, [r5, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	ldr r0, _0207FBC0 ; =0x0000067C
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r5, r0]
	bl sub_0200DD88
	ldr r0, _0207FBC4 ; =0x00000654
	ldr r1, _0207FBB8 ; =0x00000C63
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	add r0, #0x25
	ldrb r0, [r0]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _0207FBC0 ; =0x0000067C
	add r1, r1, #2
	ldr r0, [r5, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _0207FBC0 ; =0x0000067C
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	ldr r1, _0207FBB8 ; =0x00000C63
	add r0, r5, #0
	ldrb r1, [r5, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x1f
	mov r2, #1
	bl sub_0207DAC4
	mov r0, #0x1c
	str r0, [r4]
	pop {r3, r4, r5, pc}
	nop
_0207FBB8: .word 0x00000C63
_0207FBBC: .word 0x00000678
_0207FBC0: .word 0x0000067C
_0207FBC4: .word 0x00000654
	thumb_func_end sub_0207FB0C

	thumb_func_start sub_0207FBC8
sub_0207FBC8: ; 0x0207FBC8
	push {r4, lr}
	ldr r1, _0207FC10 ; =0x00000C63
	add r4, r0, #0
	ldrb r2, [r4, r1]
	mov r0, #0x40
	bic r2, r0
	strb r2, [r4, r1]
	ldr r0, _0207FC14 ; =0x0000067C
	mov r1, #0
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207FC18 ; =0x00000C65
	ldrb r1, [r4, r0]
	cmp r1, #6
	bhs _0207FBEE
	add r0, r4, #0
	bl sub_0207A7F4
_0207FBEE:
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r1, _0207FC10 ; =0x00000C63
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	pop {r4, pc}
	.balign 4, 0
_0207FC10: .word 0x00000C63
_0207FC14: .word 0x0000067C
_0207FC18: .word 0x00000C65
	thumb_func_end sub_0207FBC8

	thumb_func_start sub_0207FC1C
sub_0207FC1C: ; 0x0207FC1C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	ldr r2, _0207FD44 ; =0x00000C65
	add r6, r0, #0
	ldrb r1, [r6, r2]
	add r0, r2, #0
	sub r0, #0x19
	strb r1, [r6, r0]
	sub r0, r2, #2
	ldrb r0, [r6, r0]
	add r3, r2, #0
	sub r3, #0x13
	lsl r0, r0, #0x1a
	lsr r1, r0, #0x1a
	add r0, r2, #0
	sub r0, #0x18
	strb r1, [r6, r0]
	add r0, r2, #0
	mov r1, #1
	sub r0, #0x15
	strb r1, [r6, r0]
	mov r0, #0
	strb r0, [r6, r3]
	add r3, r2, #0
	sub r3, #0x14
	strb r0, [r6, r3]
	add r3, r2, #0
	sub r3, #0x19
	ldrb r3, [r6, r3]
	tst r3, r1
	beq _0207FC60
	sub r2, #0x17
	strb r1, [r6, r2]
	b _0207FC64
_0207FC60:
	sub r2, #0x17
	strb r0, [r6, r2]
_0207FC64:
	ldr r0, _0207FD48 ; =0x00000C4D
	mov r1, #1
	ldrb r2, [r6, r0]
	tst r2, r1
	beq _0207FC70
	b _0207FC72
_0207FC70:
	mov r1, #0
_0207FC72:
	add r0, r0, #2
	strb r1, [r6, r0]
	ldr r0, [r6]
	mov r1, #2
	bl GetBgTilemapBuffer
	str r0, [sp, #0x14]
	ldr r0, [r6]
	mov r1, #1
	bl GetBgTilemapBuffer
	ldr r1, _0207FD4C ; =0x00000C4C
	str r0, [sp, #0x10]
	ldrb r3, [r6, r1]
	add r1, r1, #1
	mov r2, #0x30
	add r0, r3, #0
	ldrb r3, [r6, r1]
	mul r0, r2
	mov r4, #0
	add r1, r3, #0
	add r3, r6, r0
	ldr r0, _0207FD50 ; =0x0000083D
	mul r1, r2
	ldrsb r2, [r3, r0]
	str r2, [sp, #0xc]
	sub r2, r0, #1
	ldrsb r2, [r3, r2]
	str r2, [sp, #8]
	add r2, r6, r1
	ldrsb r1, [r2, r0]
	sub r0, r0, #1
	ldrsb r0, [r2, r0]
	str r1, [sp, #4]
	str r0, [sp]
	ldr r0, _0207FD54 ; =0x0000094C
	add r0, r6, r0
	str r0, [sp, #0x18]
	ldr r0, _0207FD58 ; =0x00000ACC
	add r0, r6, r0
	str r0, [sp, #0x1c]
	ldr r0, _0207FD5C ; =0x00000A0C
	add r0, r6, r0
	str r0, [sp, #0x20]
	ldr r0, _0207FD60 ; =0x00000B8C
	add r0, r6, r0
	str r0, [sp, #0x24]
_0207FCD0:
	ldr r0, [sp, #0xc]
	lsl r5, r4, #5
	add r0, r0, r4
	lsl r1, r0, #5
	ldr r0, [sp, #8]
	mov r2, #0x20
	add r0, r0, r1
	lsl r7, r0, #1
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x14]
	add r0, r0, r5
	add r1, r1, r7
	bl memcpy
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x10]
	add r0, r0, r5
	add r1, r1, r7
	mov r2, #0x20
	bl memcpy
	ldr r0, [sp, #4]
	mov r2, #0x20
	add r0, r0, r4
	lsl r1, r0, #5
	ldr r0, [sp]
	add r0, r0, r1
	lsl r7, r0, #1
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x14]
	add r0, r0, r5
	add r1, r1, r7
	bl memcpy
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x10]
	add r0, r0, r5
	add r1, r1, r7
	mov r2, #0x20
	bl memcpy
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #6
	blo _0207FCD0
	ldr r0, _0207FD64 ; =0x00000678
	mov r1, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, _0207FD68 ; =0x0000067C
	mov r1, #0
	ldr r0, [r6, r0]
	bl Set2dSpriteVisibleFlag
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0207FD44: .word 0x00000C65
_0207FD48: .word 0x00000C4D
_0207FD4C: .word 0x00000C4C
_0207FD50: .word 0x0000083D
_0207FD54: .word 0x0000094C
_0207FD58: .word 0x00000ACC
_0207FD5C: .word 0x00000A0C
_0207FD60: .word 0x00000B8C
_0207FD64: .word 0x00000678
_0207FD68: .word 0x0000067C
	thumb_func_end sub_0207FC1C

	thumb_func_start sub_0207FD6C
sub_0207FD6C: ; 0x0207FD6C
	push {r3, r4, r5, lr}
	ldr r1, _0207FEC4 ; =0x0000094C
	add r5, r0, #0
	ldr r2, _0207FEC8 ; =0x00000305
	add r4, r5, r1
	ldrb r1, [r4, r2]
	cmp r1, #4
	bls _0207FD7E
	b _0207FEBE
_0207FD7E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0207FD8A: ; jump table
	.short _0207FD94 - _0207FD8A - 2 ; case 0
	.short _0207FDAA - _0207FD8A - 2 ; case 1
	.short _0207FDFA - _0207FD8A - 2 ; case 2
	.short _0207FE0C - _0207FD8A - 2 ; case 3
	.short _0207FE6A - _0207FD8A - 2 ; case 4
_0207FD94:
	ldr r0, _0207FECC ; =0x0000069F
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _0207FEC8 ; =0x00000305
	mov r1, #1
	strb r1, [r4, r0]
	b _0207FEBE
_0207FDAA:
	add r1, r2, #1
	ldrb r1, [r4, r1]
	add r3, r1, #1
	add r1, r2, #1
	strb r3, [r4, r1]
	mov r1, #0
	bl sub_0207FEE8
	add r0, r5, #0
	mov r1, #1
	bl sub_0207FEE8
	ldr r2, _0207FED0 ; =0x00000302
	add r0, r5, #0
	ldrb r2, [r4, r2]
	mov r1, #0
	bl sub_02080040
	ldr r2, _0207FED4 ; =0x00000303
	add r0, r5, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	bl sub_02080040
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0207FED8 ; =0x00000306
	ldrb r1, [r4, r0]
	cmp r1, #0x10
	bne _0207FEBE
	mov r1, #2
	sub r0, r0, #1
	strb r1, [r4, r0]
	b _0207FEBE
_0207FDFA:
	bl sub_02080198
	ldr r0, _0207FECC ; =0x0000069F
	bl PlaySE
	ldr r0, _0207FEC8 ; =0x00000305
	mov r1, #3
	strb r1, [r4, r0]
	b _0207FEBE
_0207FE0C:
	add r1, r2, #1
	ldrb r1, [r4, r1]
	sub r3, r1, #1
	add r1, r2, #1
	strb r3, [r4, r1]
	mov r1, #0
	bl sub_0207FEE8
	add r0, r5, #0
	mov r1, #1
	bl sub_0207FEE8
	ldr r2, _0207FED0 ; =0x00000302
	add r0, r5, #0
	ldrb r3, [r4, r2]
	mov r2, #1
	mov r1, #0
	eor r2, r3
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_02080040
	ldr r2, _0207FED4 ; =0x00000303
	mov r1, #1
	ldrb r2, [r4, r2]
	add r0, r5, #0
	eor r2, r1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_02080040
	ldr r0, [r5]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0207FED8 ; =0x00000306
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _0207FEBE
	mov r1, #4
	sub r0, r0, #1
	strb r1, [r4, r0]
	b _0207FEBE
_0207FE6A:
	ldr r0, _0207FEDC ; =0x00000654
	sub r1, r2, #5
	ldr r0, [r5, r0]
	sub r2, r2, #4
	ldrb r1, [r4, r1]
	ldrb r2, [r4, r2]
	ldr r0, [r0]
	bl Party_SwapSlots
	ldr r0, _0207FEE0 ; =0x00000678
	mov r1, #1
	ldr r0, [r5, r0]
	bl Set2dSpriteVisibleFlag
	mov r0, #0xc1
	mov r1, #0
	lsl r0, r0, #2
	strb r1, [r4, r0]
	ldr r1, _0207FEE4 ; =0x00000C63
	mov r0, #0x40
	ldrb r2, [r5, r1]
	bic r2, r0
	strb r2, [r5, r1]
	add r1, r1, #2
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207A7F4
	ldr r1, _0207FEE4 ; =0x00000C63
	add r0, r5, #0
	ldrb r1, [r5, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	add r0, r5, #0
	mov r1, #0x1d
	mov r2, #0
	bl sub_0207DAC4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0207FEBE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0207FEC4: .word 0x0000094C
_0207FEC8: .word 0x00000305
_0207FECC: .word 0x0000069F
_0207FED0: .word 0x00000302
_0207FED4: .word 0x00000303
_0207FED8: .word 0x00000306
_0207FEDC: .word 0x00000654
_0207FEE0: .word 0x00000678
_0207FEE4: .word 0x00000C63
	thumb_func_end sub_0207FD6C

	thumb_func_start sub_0207FEE8
sub_0207FEE8: ; 0x0207FEE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, _02080030 ; =0x0000094C
	add r7, r1, #0
	add r4, r5, r0
	mov r0, #3
	add r1, r4, r7
	lsl r0, r0, #8
	ldrb r1, [r1, r0]
	mov r0, #0x30
	mul r0, r1
	ldr r1, _02080034 ; =0x0000083C
	add r2, r5, r0
	ldrsb r0, [r2, r1]
	str r0, [sp, #0x28]
	add r0, r1, #1
	ldrb r6, [r2, r0]
	ldr r0, [sp, #0x28]
	mov r1, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	str r6, [sp]
	str r1, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5]
	ldr r3, [sp, #0x1c]
	mov r1, #2
	mov r2, #0
	bl FillBgTilemapRect
	str r6, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5]
	ldr r3, [sp, #0x1c]
	mov r1, #1
	mov r2, #0
	bl FillBgTilemapRect
	ldr r1, _02080038 ; =0x00000302
	add r0, r4, r7
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _0207FFB8
	add r0, r1, #4
	ldrb r2, [r4, r0]
	mov r0, #0xc0
	mul r0, r7
	str r0, [sp, #0x24]
	mov r0, #0x10
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	ldr r3, [sp, #0x24]
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5]
	ldr r2, [sp, #0x1c]
	mov r1, #2
	add r3, r6, #0
	bl CopyToBgTilemapRect
	ldr r0, _0208003C ; =0x00000306
	ldrb r2, [r4, r0]
	mov r0, #0x10
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #6
	lsl r3, r1, #6
	add r4, r4, r3
	ldr r3, [sp, #0x24]
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5]
	ldr r2, [sp, #0x1c]
	mov r1, #1
	add r3, r6, #0
	bl CopyToBgTilemapRect
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_0207FFB8:
	mov r0, #0xc0
	mul r0, r7
	str r0, [sp, #0x20]
	add r0, r1, #4
	ldrb r2, [r4, r0]
	mov r0, #0x10
	ldr r3, [sp, #0x20]
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r3, [sp, #0x28]
	ldr r0, [r5]
	add r2, r3, r2
	lsl r2, r2, #0x18
	mov r1, #2
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl CopyToBgTilemapRect
	ldr r0, _0208003C ; =0x00000306
	ldrb r2, [r4, r0]
	mov r0, #0x10
	sub r1, r0, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	mov r1, #6
	lsl r3, r1, #6
	add r4, r4, r3
	ldr r3, [sp, #0x20]
	str r1, [sp, #4]
	add r3, r4, r3
	str r3, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r3, [sp, #0x28]
	ldr r0, [r5]
	add r2, r3, r2
	lsl r2, r2, #0x18
	mov r1, #1
	lsr r2, r2, #0x18
	add r3, r6, #0
	bl CopyToBgTilemapRect
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02080030: .word 0x0000094C
_02080034: .word 0x0000083C
_02080038: .word 0x00000302
_0208003C: .word 0x00000306
	thumb_func_end sub_0207FEE8

	thumb_func_start sub_02080040
sub_02080040: ; 0x02080040
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02080184 ; =0x0000094C
	add r4, r1, #0
	add r1, r5, r0
	mov r0, #3
	lsl r0, r0, #8
	add r6, r1, r0
	ldrb r0, [r6, r4]
	add r7, r2, #0
	add r2, sp, #0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	add r1, #2
	bl sub_0200DE00
	cmp r7, #0
	ldr r0, _02080188 ; =0x0000083E
	bne _020800A8
	ldrb r3, [r6, r4]
	mov r7, #0x30
	add r2, r5, r0
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	sub r3, #8
	strh r3, [r2, r1]
	ldrb r3, [r6, r4]
	add r1, r0, #4
	add r2, r5, r1
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	add r0, #8
	add r0, r5, r0
	sub r3, #8
	strh r3, [r2, r1]
	ldrb r1, [r6, r4]
	add r2, r1, #0
	mul r2, r7
	ldrsh r1, [r0, r2]
	sub r1, #8
	strh r1, [r0, r2]
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	sub r0, #8
	b _020800E0
_020800A8:
	ldrb r3, [r6, r4]
	mov r7, #0x30
	add r2, r5, r0
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	add r3, #8
	strh r3, [r2, r1]
	ldrb r3, [r6, r4]
	add r1, r0, #4
	add r2, r5, r1
	add r1, r3, #0
	mul r1, r7
	ldrsh r3, [r2, r1]
	add r0, #8
	add r0, r5, r0
	add r3, #8
	strh r3, [r2, r1]
	ldrb r1, [r6, r4]
	add r2, r1, #0
	mul r2, r7
	ldrsh r1, [r0, r2]
	add r1, #8
	strh r1, [r0, r2]
	add r1, sp, #0
	mov r0, #2
	ldrsh r0, [r1, r0]
	add r0, #8
_020800E0:
	strh r0, [r1, #2]
	ldrb r1, [r6, r4]
	mov r0, #0x30
	ldr r2, _0208018C ; =0x0000084C
	mul r0, r1
	add r3, r5, r0
	add r1, r2, #0
	ldr r0, [r3, r2]
	sub r1, #0xe
	sub r2, #0xc
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl sub_0200DD88
	ldrb r2, [r6, r4]
	mov r0, #0x30
	ldr r3, _02080190 ; =0x00000842
	add r1, r2, #0
	add r2, #0xa
	mul r1, r0
	lsl r0, r2, #2
	add r2, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r3]
	add r3, r3, #2
	ldrsh r2, [r2, r3]
	bl sub_0200DD88
	ldrb r2, [r6, r4]
	mov r0, #0x30
	ldr r3, _02080194 ; =0x00000846
	add r1, r2, #0
	add r2, #0x10
	mul r1, r0
	lsl r0, r2, #2
	add r2, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r3]
	add r3, r3, #2
	ldrsh r2, [r2, r3]
	bl sub_0200DD88
	ldrb r2, [r6, r4]
	mov r0, #0x30
	ldr r3, _02080194 ; =0x00000846
	add r1, r2, #0
	add r2, #0x16
	mul r1, r0
	lsl r0, r2, #2
	add r2, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r2, r0]
	add r2, r5, r1
	ldrsh r1, [r2, r3]
	add r3, r3, #2
	ldrsh r2, [r2, r3]
	add r1, #8
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl sub_0200DD88
	ldrb r0, [r6, r4]
	add r3, sp, #0
	mov r2, #0
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	bl sub_0200DD88
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080184: .word 0x0000094C
_02080188: .word 0x0000083E
_0208018C: .word 0x0000084C
_02080190: .word 0x00000842
_02080194: .word 0x00000846
	thumb_func_end sub_02080040

	thumb_func_start sub_02080198
sub_02080198: ; 0x02080198
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, _02080464 ; =0x0000094C
	mov r1, #0x30
	add r4, r5, r0
	mov r0, #0xc
	bl AllocFromHeap
	add r7, r0, #0
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r0, #0x30
	add r3, r7, #0
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02080468 ; =0x00000828
	mov r2, #6
	add r6, r1, r0
_020801C0:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020801C0
	mov r1, #3
	lsl r1, r1, #8
	ldrb r0, [r4, r1]
	add r1, r1, #1
	ldrb r1, [r4, r1]
	mov r2, #0x30
	add r3, r0, #0
	mul r3, r2
	mul r2, r1
	ldr r1, _02080468 ; =0x00000828
	add r0, r5, r3
	add r2, r5, r2
	add r6, r2, r1
	add r3, r0, r1
	mov r2, #6
_020801E6:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020801E6
	ldr r0, _0208046C ; =0x00000301
	add r6, r7, #0
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mov r2, #6
	mul r0, r1
	add r1, r5, r0
	ldr r0, _02080468 ; =0x00000828
	add r3, r1, r0
_02080200:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02080200
	mov r0, #0xc
	add r1, r7, #0
	bl FreeToHeapExplicit
	mov r1, #3
	lsl r1, r1, #8
	ldrb r3, [r4, r1]
	ldr r0, _02080470 ; =0x0000083E
	add r2, r5, r0
	mov r0, #0x30
	add r7, r3, #0
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	mul r6, r0
	ldr r3, _02080470 ; =0x0000083E
	add r6, r5, r6
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, [sp]
	ldr r2, _02080470 ; =0x0000083E
	strh r3, [r6, r2]
	add r2, r2, #2
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #4]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #2
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #2
	ldr r3, [sp, #4]
	strh r3, [r2, r6]
	ldr r2, _02080470 ; =0x0000083E
	add r2, r2, #4
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #8]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #4
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #4
	ldr r3, [sp, #8]
	strh r3, [r2, r6]
	ldr r2, _02080470 ; =0x0000083E
	add r2, r2, #6
	add r3, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsh r2, [r3, r7]
	str r2, [sp, #0xc]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	add r6, r6, #6
	ldrsh r2, [r2, r6]
	strh r2, [r3, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	add r6, r3, #6
	ldr r3, [sp, #0xc]
	strh r3, [r2, r6]
	ldrb r3, [r4, r1]
	ldr r2, _02080470 ; =0x0000083E
	add r2, #8
	add r7, r3, #0
	add r2, r5, r2
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp, #0x10]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	ldr r3, _02080470 ; =0x0000083E
	mul r6, r0
	add r6, r5, r6
	add r3, #8
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	ldr r2, [sp, #0x10]
	add r3, #8
	strh r2, [r6, r3]
	ldrb r3, [r4, r1]
	ldr r2, _02080470 ; =0x0000083E
	add r2, #0xa
	add r7, r3, #0
	add r2, r5, r2
	mul r7, r0
	ldrsh r3, [r2, r7]
	str r3, [sp, #0x14]
	add r3, r1, #1
	ldrb r3, [r4, r3]
	add r6, r3, #0
	ldr r3, _02080470 ; =0x0000083E
	mul r6, r0
	add r6, r5, r6
	add r3, #0xa
	ldrsh r3, [r6, r3]
	strh r3, [r2, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r6, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	ldr r2, [sp, #0x14]
	add r3, #0xa
	strh r2, [r6, r3]
	ldr r2, _02080470 ; =0x0000083E
	sub r2, r2, #2
	add r6, r5, r2
	ldrb r2, [r4, r1]
	add r3, r2, #0
	mul r3, r0
	add r3, r6, r3
	mov r2, #0
	ldrsb r7, [r3, r2]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r6, r2, #0
	mul r6, r0
	add r2, r5, r6
	ldr r6, _02080470 ; =0x0000083E
	sub r6, r6, #2
	ldrsb r2, [r2, r6]
	strb r2, [r3]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	mul r3, r0
	add r2, r5, r3
	ldr r3, _02080470 ; =0x0000083E
	sub r3, r3, #2
	strb r7, [r2, r3]
	ldr r2, _02080470 ; =0x0000083E
	sub r2, r2, #1
	add r6, r5, r2
	ldrb r2, [r4, r1]
	add r7, r2, #0
	mul r7, r0
	ldrsb r2, [r6, r7]
	mov ip, r2
	add r2, r1, #1
	ldrb r2, [r4, r2]
	add r3, r2, #0
	ldr r2, _02080470 ; =0x0000083E
	mul r3, r0
	add r3, r5, r3
	sub r2, r2, #1
	ldrsb r2, [r3, r2]
	strb r2, [r6, r7]
	add r2, r1, #1
	ldrb r2, [r4, r2]
	mul r0, r2
	ldr r2, _02080470 ; =0x0000083E
	add r0, r5, r0
	sub r3, r2, #1
	mov r2, ip
	strb r2, [r0, r3]
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207D5DC
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207D5DC
	mov r1, #3
	lsl r1, r1, #8
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207D6D8
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207D6D8
	add r0, r5, #0
	mov r1, #0
	bl sub_0208047C
	add r0, r5, #0
	mov r1, #1
	bl sub_0208047C
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r2, #0x30
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080474 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	ldr r0, _0208046C ; =0x00000301
	mov r2, #0x30
	ldrb r1, [r4, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080474 ; =0x00000836
	ldrh r2, [r3, r2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x14
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl sub_0207EFC4
	mov r0, #3
	lsl r0, r0, #8
	ldrb r1, [r4, r0]
	mov r2, #0x30
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080478 ; =0x00000834
	ldrh r2, [r3, r2]
	bl sub_0207F004
	ldr r0, _0208046C ; =0x00000301
	mov r2, #0x30
	ldrb r1, [r4, r0]
	add r0, r5, #0
	mul r2, r1
	add r3, r5, r2
	ldr r2, _02080478 ; =0x00000834
	ldrh r2, [r3, r2]
	bl sub_0207F004
	mov r1, #3
	lsl r1, r1, #8
	ldrb r1, [r4, r1]
	add r0, r5, #0
	bl sub_0207F0C8
	ldr r1, _0208046C ; =0x00000301
	add r0, r5, #0
	ldrb r1, [r4, r1]
	bl sub_0207F0C8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02080464: .word 0x0000094C
_02080468: .word 0x00000828
_0208046C: .word 0x00000301
_02080470: .word 0x0000083E
_02080474: .word 0x00000836
_02080478: .word 0x00000834
	thumb_func_end sub_02080198

	thumb_func_start sub_0208047C
sub_0208047C: ; 0x0208047C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r1, _02080500 ; =0x0000094C
	add r6, r0, #0
	add r4, r6, r1
	mov r1, #0xc0
	mul r1, r7
	add r5, r4, r1
	bl sub_0207A16C
	add r3, r0, #0
	mov r0, #3
	add r1, r4, r7
	lsl r0, r0, #8
	ldrb r1, [r1, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r6, r0
	ldr r0, _02080504 ; =0x00000838
	ldrb r0, [r1, r0]
	cmp r0, #1
	bne _020804D2
	mov r3, #0xf
	mov r1, #0
	lsl r3, r3, #0xc
	mov r4, #0x4b
_020804B0:
	lsl r0, r1, #1
	add r2, r5, r0
	add r2, #0x6c
	ldrh r2, [r2]
	add r0, r5, r0
	add r0, #0x6c
	and r2, r3
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	orr r2, r4
	strh r2, [r0]
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	cmp r1, #9
	blo _020804B0
	pop {r3, r4, r5, r6, r7, pc}
_020804D2:
	mov r6, #0xf
	ldr r0, _02080508 ; =0x00000FFF
	mov r4, #0
	lsl r6, r6, #0xc
_020804DA:
	lsl r2, r4, #1
	add r1, r5, r2
	add r1, #0x6c
	ldrh r1, [r1]
	ldrh r7, [r3, r2]
	and r1, r6
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	and r7, r0
	orr r7, r1
	add r1, r5, r2
	add r1, #0x6c
	strh r7, [r1]
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #9
	blo _020804DA
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080500: .word 0x0000094C
_02080504: .word 0x00000838
_02080508: .word 0x00000FFF
	thumb_func_end sub_0208047C

	thumb_func_start sub_0208050C
sub_0208050C: ; 0x0208050C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	add r6, r1, #0
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _02080600 ; =0x00000654
	mov r4, #0
	ldr r0, [r5, r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	beq _0208059E
_02080542:
	add r2, r0, r4
	add r2, #0x30
	ldrb r2, [r2]
	cmp r2, #0
	bne _02080594
	ldr r1, _02080604 ; =0x00000C65
	add r0, r0, r4
	ldrb r2, [r5, r1]
	add r0, #0x30
	add r2, r2, #1
	strb r2, [r0]
	ldrb r1, [r5, r1]
	add r0, r5, #0
	bl sub_0207D8EC
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080608 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	ldr r0, _02080600 ; =0x00000654
	ldr r0, [r5, r0]
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	sub r0, r0, #1
	cmp r4, r0
	bne _0208058E
	add r0, r5, #0
	mov r1, #6
	bl sub_0207AB84
_0208058E:
	mov r0, #1
	str r0, [r6]
	pop {r4, r5, r6, pc}
_02080594:
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, r1
	blo _02080542
_0208059E:
	cmp r1, #5
	bhi _020805F4
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020805AE: ; jump table
	.short _020805F4 - _020805AE - 2 ; case 0
	.short _020805BA - _020805AE - 2 ; case 1
	.short _020805C6 - _020805AE - 2 ; case 2
	.short _020805D2 - _020805AE - 2 ; case 3
	.short _020805DE - _020805AE - 2 ; case 4
	.short _020805EA - _020805AE - 2 ; case 5
_020805BA:
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805C6:
	add r0, r5, #0
	mov r1, #0x63
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805D2:
	add r0, r5, #0
	mov r1, #0x71
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805DE:
	add r0, r5, #0
	mov r1, #0x72
	mov r2, #1
	bl sub_0207DAEC
	b _020805F4
_020805EA:
	add r0, r5, #0
	mov r1, #0x73
	mov r2, #1
	bl sub_0207DAEC
_020805F4:
	ldr r0, _0208060C ; =0x00000C62
	mov r1, #0x17
	strb r1, [r5, r0]
	mov r0, #0x18
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02080600: .word 0x00000654
_02080604: .word 0x00000C65
_02080608: .word 0x00000678
_0208060C: .word 0x00000C62
	thumb_func_end sub_0208050C

	thumb_func_start sub_02080610
sub_02080610: ; 0x02080610
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080638 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02080638: .word 0x00000678
	thumb_func_end sub_02080610

	thumb_func_start sub_0208063C
sub_0208063C: ; 0x0208063C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	mov r1, #0
	add r5, r0, #0
	bl sub_02079224
	ldr r0, _02080718 ; =0x00000654
	mov r4, #0
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r2, r0, #0x1c
	beq _020806C2
	ldr r0, _0208071C ; =0x00000C65
	ldrb r0, [r5, r0]
	add r0, r0, #1
_02080660:
	add r3, r1, r4
	add r3, #0x30
	ldrb r3, [r3]
	cmp r0, r3
	bne _020806B8
	add r0, r1, r4
	mov r2, #0
	add r0, #0x30
	strb r2, [r0]
	ldr r0, _02080718 ; =0x00000654
	ldr r6, [r5, r0]
	add r0, r6, #0
	add r0, #0x36
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	sub r0, r0, #1
	cmp r4, r0
	bge _020806C2
	ldr r0, _02080718 ; =0x00000654
	add r1, r0, #0
_0208068A:
	add r3, r6, r4
	add r3, #0x31
	ldrb r3, [r3]
	add r6, r6, r4
	add r6, #0x30
	strb r3, [r6]
	ldr r3, [r5, r0]
	add r3, r3, r4
	add r3, #0x31
	strb r2, [r3]
	add r3, r4, #1
	lsl r3, r3, #0x18
	ldr r6, [r5, r1]
	lsr r4, r3, #0x18
	add r3, r6, #0
	add r3, #0x36
	ldrb r3, [r3]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x1c
	sub r3, r3, #1
	cmp r4, r3
	blt _0208068A
	b _020806C2
_020806B8:
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r4, r3, #0x18
	cmp r4, r2
	blo _02080660
_020806C2:
	ldr r6, _02080720 ; =0x00000855
	mov r4, #0
	mov r7, #0x30
_020806C8:
	add r0, r4, #0
	mul r0, r7
	add r0, r5, r0
	ldrb r0, [r0, r6]
	cmp r0, #0
	beq _020806DC
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0207D8EC
_020806DC:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #6
	blo _020806C8
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r5, #0
	mov r1, #0x23
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080724 ; =0x00000678
	mov r1, #0
	ldr r0, [r5, r0]
	bl sub_0200DD08
	ldr r0, [sp]
	mov r1, #1
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02080718: .word 0x00000654
_0208071C: .word 0x00000C65
_02080720: .word 0x00000855
_02080724: .word 0x00000678
	thumb_func_end sub_0208063C

	thumb_func_start sub_02080728
sub_02080728: ; 0x02080728
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080744 ; =0x00000654
	mov r2, #0
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080744: .word 0x00000654
	thumb_func_end sub_02080728

	thumb_func_start sub_02080748
sub_02080748: ; 0x02080748
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080764 ; =0x00000654
	mov r2, #0
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080764: .word 0x00000654
	thumb_func_end sub_02080748

	thumb_func_start sub_02080768
sub_02080768: ; 0x02080768
	push {r4, lr}
	add r4, r1, #0
	ldr r1, _02080784 ; =0x00000654
	mov r2, #1
	ldr r1, [r0, r1]
	add r1, #0x27
	strb r2, [r1]
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
_02080784: .word 0x00000654
	thumb_func_end sub_02080768

	thumb_func_start sub_02080788
sub_02080788: ; 0x02080788
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r5, #0
	bl sub_020807AC
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02080788

	thumb_func_start sub_020807AC
sub_020807AC: ; 0x020807AC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02080828 ; =0x00000654
	ldr r1, _0208082C ; =0x00000C65
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	ldr r0, [r0]
	bl GetPartyMonByIndex
	mov r1, #0xa2
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _020807F2
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x76
	bl ReadMsgDataIntoString
	ldr r0, _0208082C ; =0x00000C65
	ldrb r0, [r4, r0]
	add r0, #0x16
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x66
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	b _02080808
_020807F2:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	mov r1, #0x77
	bl ReadMsgDataIntoString
	ldr r0, _0208082C ; =0x00000C65
	mov r1, #7
	strb r1, [r4, r0]
_02080808:
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02080828 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	ldr r0, _02080830 ; =0x00000C62
	mov r1, #0x19
	strb r1, [r4, r0]
	mov r0, #0x18
	pop {r4, pc}
	.balign 4, 0
_02080828: .word 0x00000654
_0208082C: .word 0x00000C65
_02080830: .word 0x00000C62
	thumb_func_end sub_020807AC

	thumb_func_start sub_02080834
sub_02080834: ; 0x02080834
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r4, r0, #0
	ldr r1, _020808C8 ; =0x00000654
	mov r0, #1
	ldr r1, [r4, r1]
	add r1, #0x27
	ldrb r1, [r1]
	sub r1, #0xb
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl PartyMenu_GetFieldMoveFunc
	add r1, r0, #0
	beq _0208085C
	ldr r0, _020808C8 ; =0x00000654
	ldr r0, [r4, r0]
	ldr r0, [r0, #0x18]
	blx r1
	b _0208085E
_0208085C:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
_0208085E:
	cmp r0, #5
	bhi _0208089C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0208086E: ; jump table
	.short _0208087A - _0208086E - 2 ; case 0
	.short _0208088A - _0208086E - 2 ; case 1
	.short _0208088E - _0208086E - 2 ; case 2
	.short _02080892 - _0208086E - 2 ; case 3
	.short _02080896 - _0208086E - 2 ; case 4
	.short _0208089A - _0208086E - 2 ; case 5
_0208087A:
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	mov r0, #0x20
	str r0, [r6]
	pop {r4, r5, r6, pc}
_0208088A:
	mov r5, #msg_0300_00101
	b _0208089C
_0208088E:
	mov r5, #msg_0300_00077
	b _0208089C
_02080892:
	mov r5, #msg_0300_00180
	b _0208089C
_02080896:
	mov r5, #msg_0300_00100
	b _0208089C
_0208089A:
	mov r5, #msg_0300_00181
_0208089C:
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _020808CC ; =0x00000C62
	mov r1, #3
	strb r1, [r4, r0]
	mov r0, #0x18
	str r0, [r6]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020808C8: .word 0x00000654
_020808CC: .word 0x00000C62
	thumb_func_end sub_02080834

	thumb_func_start sub_020808D0
sub_020808D0: ; 0x020808D0
	ldr r2, _020808E0 ; =0x00000654
	mov r3, #0xb
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020808E4 ; =sub_02080834
	bx r3
	nop
_020808E0: .word 0x00000654
_020808E4: .word sub_02080834
	thumb_func_end sub_020808D0

	thumb_func_start sub_020808E8
sub_020808E8: ; 0x020808E8
	ldr r2, _020808F8 ; =0x00000654
	mov r3, #0xf
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020808FC ; =sub_02080834
	bx r3
	nop
_020808F8: .word 0x00000654
_020808FC: .word sub_02080834
	thumb_func_end sub_020808E8

	thumb_func_start sub_02080900
sub_02080900: ; 0x02080900
	ldr r2, _02080910 ; =0x00000654
	mov r3, #0xe
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080914 ; =sub_02080834
	bx r3
	nop
_02080910: .word 0x00000654
_02080914: .word sub_02080834
	thumb_func_end sub_02080900

	thumb_func_start sub_02080918
sub_02080918: ; 0x02080918
	ldr r2, _02080928 ; =0x00000654
	mov r3, #0xd
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208092C ; =sub_02080834
	bx r3
	nop
_02080928: .word 0x00000654
_0208092C: .word sub_02080834
	thumb_func_end sub_02080918

	thumb_func_start sub_02080930
sub_02080930: ; 0x02080930
	ldr r2, _02080940 ; =0x00000654
	mov r3, #0x11
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080944 ; =sub_02080834
	bx r3
	nop
_02080940: .word 0x00000654
_02080944: .word sub_02080834
	thumb_func_end sub_02080930

	thumb_func_start sub_02080948
sub_02080948: ; 0x02080948
	ldr r2, _02080958 ; =0x00000654
	mov r3, #0xc
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208095C ; =sub_02080834
	bx r3
	nop
_02080958: .word 0x00000654
_0208095C: .word sub_02080834
	thumb_func_end sub_02080948

	thumb_func_start sub_02080960
sub_02080960: ; 0x02080960
	ldr r2, _02080970 ; =0x00000654
	mov r3, #0x10
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080974 ; =sub_02080834
	bx r3
	nop
_02080970: .word 0x00000654
_02080974: .word sub_02080834
	thumb_func_end sub_02080960

	thumb_func_start sub_02080978
sub_02080978: ; 0x02080978
	ldr r2, _02080988 ; =0x00000654
	mov r3, #0x17
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _0208098C ; =sub_02080834
	bx r3
	nop
_02080988: .word 0x00000654
_0208098C: .word sub_02080834
	thumb_func_end sub_02080978

	thumb_func_start sub_02080990
sub_02080990: ; 0x02080990
	ldr r2, _020809A0 ; =0x00000654
	mov r3, #0x12
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809A4 ; =sub_02080834
	bx r3
	nop
_020809A0: .word 0x00000654
_020809A4: .word sub_02080834
	thumb_func_end sub_02080990

	thumb_func_start sub_020809A8
sub_020809A8: ; 0x020809A8
	ldr r2, _020809B8 ; =0x00000654
	mov r3, #0x13
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809BC ; =sub_02080834
	bx r3
	nop
_020809B8: .word 0x00000654
_020809BC: .word sub_02080834
	thumb_func_end sub_020809A8

	thumb_func_start sub_020809C0
sub_020809C0: ; 0x020809C0
	ldr r2, _020809D0 ; =0x00000654
	mov r3, #0x14
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809D4 ; =sub_02080834
	bx r3
	nop
_020809D0: .word 0x00000654
_020809D4: .word sub_02080834
	thumb_func_end sub_020809C0

	thumb_func_start sub_020809D8
sub_020809D8: ; 0x020809D8
	ldr r2, _020809E8 ; =0x00000654
	mov r3, #0x15
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _020809EC ; =sub_02080834
	bx r3
	nop
_020809E8: .word 0x00000654
_020809EC: .word sub_02080834
	thumb_func_end sub_020809D8

	thumb_func_start sub_020809F0
sub_020809F0: ; 0x020809F0
	ldr r2, _02080A00 ; =0x00000654
	mov r3, #0x16
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080A04 ; =sub_02080834
	bx r3
	nop
_02080A00: .word 0x00000654
_02080A04: .word sub_02080834
	thumb_func_end sub_020809F0

	thumb_func_start sub_02080A08
sub_02080A08: ; 0x02080A08
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_02080A58
	str r0, [r5]
	cmp r0, #0x1e
	bne _02080A1E
	ldr r0, _02080A20 ; =0x00000C6E
	mov r1, #0xe
	strh r1, [r4, r0]
_02080A1E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02080A20: .word 0x00000C6E
	thumb_func_end sub_02080A08

	thumb_func_start sub_02080A24
sub_02080A24: ; 0x02080A24
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_02080A58
	str r0, [r5]
	cmp r0, #0x1e
	bne _02080A3A
	ldr r0, _02080A3C ; =0x00000C6E
	mov r1, #0xf
	strh r1, [r4, r0]
_02080A3A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02080A3C: .word 0x00000C6E
	thumb_func_end sub_02080A24

	thumb_func_start sub_02080A40
sub_02080A40: ; 0x02080A40
	ldr r2, _02080A50 ; =0x00000654
	mov r3, #0x18
	ldr r2, [r0, r2]
	add r2, #0x27
	strb r3, [r2]
	ldr r3, _02080A54 ; =sub_02080834
	bx r3
	nop
_02080A50: .word 0x00000654
_02080A54: .word sub_02080834
	thumb_func_end sub_02080A40

	thumb_func_start sub_02080A58
sub_02080A58: ; 0x02080A58
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB20
	bl sub_0207CB90
	ldr r0, _02080B50 ; =0x00000C65
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	mov r0, #0x83
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	mov r1, #5
	bl _s32_div_f
	ldr r1, _02080B54 ; =0x00000C68
	strh r0, [r4, r1]
	sub r0, r1, #3
	ldrb r2, [r4, r0]
	mov r0, #0x30
	mul r0, r2
	add r2, r4, r0
	ldr r0, _02080B58 ; =0x0000082E
	ldrh r2, [r2, r0]
	ldrh r0, [r4, r1]
	cmp r2, r0
	bhi _02080AB8
	add r0, r4, #0
	mov r1, #0x7f
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _02080B5C ; =0x00000C62
	mov r1, #3
	strb r1, [r4, r0]
	add sp, #4
	mov r0, #0x18
	pop {r3, r4, pc}
_02080AB8:
	sub r0, r1, #5
	ldrb r2, [r4, r0]
	mov r0, #0x40
	orr r2, r0
	sub r0, r1, #5
	strb r2, [r4, r0]
	ldrb r0, [r4, r0]
	mov r2, #0x3f
	bic r0, r2
	sub r2, r1, #3
	ldrb r3, [r4, r2]
	mov r2, #0x3f
	and r2, r3
	orr r2, r0
	sub r0, r1, #5
	strb r2, [r4, r0]
	ldr r0, _02080B60 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _02080B60 ; =0x00000678
	add r1, sp, #0
	ldr r0, [r4, r0]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE00
	ldr r0, _02080B64 ; =0x0000067C
	add r3, sp, #0
	mov r1, #2
	mov r2, #0
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, r0]
	bl sub_0200DD88
	ldr r0, _02080B68 ; =0x00000654
	ldr r1, _02080B6C ; =0x00000C63
	ldr r0, [r4, r0]
	ldrb r1, [r4, r1]
	add r0, #0x25
	ldrb r0, [r0]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207B5EC
	add r1, r0, #0
	ldr r0, _02080B64 ; =0x0000067C
	add r1, r1, #2
	ldr r0, [r4, r0]
	bl Set2dSpriteAnimSeqNo
	ldr r0, _02080B64 ; =0x0000067C
	mov r1, #1
	ldr r0, [r4, r0]
	bl Set2dSpriteVisibleFlag
	ldr r1, _02080B6C ; =0x00000C63
	add r0, r4, #0
	ldrb r1, [r4, r1]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1a
	bl sub_0207A7F4
	add r0, r4, #0
	mov r1, #0x25
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _02080B70 ; =0x00000C6A
	mov r1, #0
	strh r1, [r4, r0]
	mov r0, #0x1e
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_02080B50: .word 0x00000C65
_02080B54: .word 0x00000C68
_02080B58: .word 0x0000082E
_02080B5C: .word 0x00000C62
_02080B60: .word 0x00000678
_02080B64: .word 0x0000067C
_02080B68: .word 0x00000654
_02080B6C: .word 0x00000C63
_02080B70: .word 0x00000C6A
	thumb_func_end sub_02080A58

	thumb_func_start sub_02080B74
sub_02080B74: ; 0x02080B74
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	add r0, r4, #0
	mov r1, #0
	bl sub_02079224
	ldr r0, _02080BAC ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_0200DD08
	ldr r0, _02080BB0 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
	nop
_02080BAC: .word 0x00000678
_02080BB0: .word 0x04000050
	thumb_func_end sub_02080B74

	.rodata
_02101CB8:
	.word sub_0207FB0C
	.word sub_02080768
	.word sub_0207F438
	.word sub_0207F4FC
	.word sub_0207F520
	.word sub_0207F73C
	.word sub_0207F800
	.word sub_0207F824
	.word sub_0207FA3C
	.word 0xFFFFFFFE
	.word 0xFFFFFFFE
	.word sub_0208050C
	.word sub_0208063C
	.word sub_02080728
	.word sub_02080788
	.word sub_02080748
	.word sub_020808D0
	.word sub_02080948
	.word sub_02080918
	.word sub_02080900
	.word sub_020808E8
	.word sub_02080960
	.word sub_02080930
	.word sub_02080978
	.word sub_02080990
	.word sub_020809A8
	.word sub_020809C0
	.word sub_020809D8
	.word sub_020809F0
	.word sub_02080A40
	.word sub_02080A08
	.word sub_02080A24
	.word 0xFFFFFFFE
