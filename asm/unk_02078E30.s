#include "constants/items.h"
#include "constants/moves.h"
#include "constants/pokemon.h"
#include "constants/ribbon.h"
#include "constants/party_menu.h"
#include "msgdata/msg/msg_0300.h"
	.include "asm/macros.inc"
	.include "unk_02078E30.inc"
	.include "global.inc"

	.public gOverlayTemplate_Battle
	.public gNatureStatMods

	.extern PartyMenuApp_Init
	.extern PartyMenuApp_Main
	.extern PartyMenuApp_Exit
	.extern sub_02079720
	.extern sub_02079E28
	.extern sub_0207A174
	.extern sub_0207A8FC
	.extern sub_0207A910
	.extern sub_0207A988
	.extern sub_0207AC70
	.extern sub_0207AD6C
	.extern sub_0207B51C
	.extern PartyMenu_SoftboiledTryTargetCheck
	.extern sub_0207C3D0
	.extern sub_0207C5D4
	.extern sub_0207C658

	.text

	thumb_func_start sub_0207C6DC
sub_0207C6DC: ; 0x0207C6DC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C708 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C702
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	bl sub_0207CB54
	mov r0, #0xd
	pop {r4, pc}
_0207C702:
	mov r0, #0xc
	pop {r4, pc}
	nop
_0207C708: .word 0x00000C64
	thumb_func_end sub_0207C6DC

	thumb_func_start sub_0207C70C
sub_0207C70C: ; 0x0207C70C
	push {r4, lr}
	add r4, r0, #0
	bl PartyMenu_AnimateIconFormChange
	cmp r0, #1
	bne _0207C722
	add r0, r4, #0
	bl sub_0207CB6C
	mov r0, #0xb
	pop {r4, pc}
_0207C722:
	mov r0, #0xd
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0207C70C

	thumb_func_start sub_0207C728
sub_0207C728: ; 0x0207C728
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C748 ; =0x00000C64
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0207C742
	add r0, r4, #0
	bl sub_0207DBCC
	mov r0, #0xa
	pop {r4, pc}
_0207C742:
	mov r0, #9
	pop {r4, pc}
	nop
_0207C748: .word 0x00000C64
	thumb_func_end sub_0207C728

	thumb_func_start sub_0207C74C
sub_0207C74C: ; 0x0207C74C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl YesNoPrompt_HandleInput
	cmp r0, #1
	beq _0207C766
	cmp r0, #2
	bne _0207C764
	b _0207C882
_0207C764:
	b _0207C898
_0207C766:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl YesNoPrompt_Destroy
	bl sub_0207CB90
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r1, _0207C8A8 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	str r0, [sp]
	ldr r0, _0207C8A4 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r6, [r0, #0x28]
	ldr r0, _0207C8A8 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207C8AC ; =0x00000834
	ldrh r4, [r1, r0]
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_0207C5D4
	add r7, r0, #0
	ldr r0, _0207C8A4 ; =0x00000654
	add r1, r4, #0
	ldr r0, [r5, r0]
	mov r2, #1
	ldr r0, [r0, #4]
	mov r3, #0xc
	bl Bag_AddItem
	cmp r0, #0
	bne _0207C7D6
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #8
	ldr r2, [r5, r2]
	mov r1, #0x54
	bl ReadMsgDataIntoString
	mov r7, #0xb
	b _0207C86A
_0207C7D6:
	ldr r0, _0207C8A4 ; =0x00000654
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	bl ItemIdIsMail
	cmp r0, #1
	bne _0207C812
	ldr r0, _0207C8A4 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_TakeItem
	ldr r1, [sp]
	add r0, r5, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_0207C658
	ldr r0, _0207C8A4 ; =0x00000654
	mov r1, #6
	ldr r0, [r5, r0]
	add sp, #8
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0207C812:
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207C8B0 ; =0x000007C4
	mov r1, #2
	ldr r0, [r5, r0]
	add r2, r6, #0
	bl BufferItemName
	ldr r2, _0207C8B0 ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	cmp r6, #0x70
	beq _0207C860
	cmp r4, #0x70
	bne _0207C860
	mov r0, #0
	ldr r1, [sp, #4]
	mvn r0, r0
	cmp r1, r0
	beq _0207C860
	mov r7, #0xc
	b _0207C86A
_0207C860:
	cmp r6, #0x70
	bne _0207C86A
	cmp r4, #0x70
	bne _0207C86A
	mov r7, #0xb
_0207C86A:
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	bl sub_0207DB30
	add sp, #8
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_0207C882:
	ldr r0, _0207C8A0 ; =0x00000C88
	ldr r0, [r5, r0]
	bl YesNoPrompt_Destroy
	bl sub_0207CB90
	add r0, r5, #0
	bl sub_0207C8B4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0207C898:
	mov r0, #0xa
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207C8A0: .word 0x00000C88
_0207C8A4: .word 0x00000654
_0207C8A8: .word 0x00000C65
_0207C8AC: .word 0x00000834
_0207C8B0: .word 0x000007C4
	thumb_func_end sub_0207C74C

	thumb_func_start sub_0207C8B4
sub_0207C8B4: ; 0x0207C8B4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207C900 ; =0x00000654
	ldr r1, [r4, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xa
	bne _0207C8F4
	mov r0, #0x89
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #1
	bl ClearFrameAndWindow2
	add r0, r4, #0
	mov r1, #0x1d
	mov r2, #1
	bl sub_0207DAC4
	ldr r0, _0207C904 ; =0x00000678
	mov r1, #0
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	ldr r0, _0207C900 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x24
	strb r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0207C8F4:
	mov r0, #0xa
	add r1, #0x27
	strb r0, [r1]
	mov r0, #0x20
	pop {r4, pc}
	nop
_0207C900: .word 0x00000654
_0207C904: .word 0x00000678
	thumb_func_end sub_0207C8B4

	thumb_func_start sub_0207C908
sub_0207C908: ; 0x0207C908
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, _0207CA24 ; =0x00000C65
	ldr r0, [r5, r0]
	ldrb r1, [r5, r1]
	ldr r0, [r0]
	bl Party_GetMonByIndex
	add r7, r0, #0
	ldr r0, _0207CA20 ; =0x00000654
	add r2, sp, #4
	ldr r0, [r5, r0]
	ldrh r0, [r0, #0x28]
	str r0, [sp]
	ldr r0, _0207CA24 ; =0x00000C65
	ldrb r1, [r5, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r5, r0
	ldr r0, _0207CA28 ; =0x00000834
	ldrh r4, [r1, r0]
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0207C5D4
	add r6, r0, #0
	cmp r4, #0x70
	bne _0207C950
	cmp r6, #0xb
	bne _0207C950
	ldr r0, [sp, #4]
	cmp r0, #0
	bne _0207C950
	mov r6, #0xc
_0207C950:
	cmp r4, #0
	bne _0207C998
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x6b
	bl ReadMsgDataIntoString
	add r0, r7, #0
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #0
	ldr r0, [r5, r0]
	bl BufferBoxMonNickname
	ldr r2, _0207CA20 ; =0x00000654
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	ldrh r2, [r2, #0x28]
	mov r1, #1
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
	b _0207C9E2
_0207C998:
	ldr r0, _0207CA20 ; =0x00000654
	lsl r1, r4, #0x10
	ldr r0, [r5, r0]
	lsr r1, r1, #0x10
	ldr r0, [r0, #4]
	mov r2, #1
	mov r3, #0xc
	bl Bag_AddItem
	mov r2, #0x1f
	lsl r2, r2, #6
	ldr r0, [r5, r2]
	add r2, #0xc
	ldr r2, [r5, r2]
	mov r1, #0x55
	bl ReadMsgDataIntoString
	ldr r0, _0207CA2C ; =0x000007C4
	mov r1, #1
	ldr r0, [r5, r0]
	add r2, r4, #0
	bl BufferItemName
	ldr r0, _0207CA2C ; =0x000007C4
	ldr r2, [sp]
	ldr r0, [r5, r0]
	mov r1, #2
	bl BufferItemName
	ldr r2, _0207CA2C ; =0x000007C4
	add r1, r2, #4
	ldr r0, [r5, r2]
	add r2, #8
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	bl StringExpandPlaceholders
_0207C9E2:
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
	ldr r0, _0207CA20 ; =0x00000654
	ldr r1, [r5, r0]
	add r0, r1, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0xc
	bne _0207CA18
	mov r0, #0xa
	add r1, #0x24
	strb r0, [r1]
_0207CA18:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0207CA20: .word 0x00000654
_0207CA24: .word 0x00000C65
_0207CA28: .word 0x00000834
_0207CA2C: .word 0x000007C4
	thumb_func_end sub_0207C908

	thumb_func_start sub_0207CA30
sub_0207CA30: ; 0x0207CA30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CA80 ; =0x00000C65
	ldrb r1, [r4, r0]
	mov r0, #0x30
	mul r0, r1
	add r1, r4, r0
	ldr r0, _0207CA84 ; =0x0000083A
	ldrh r0, [r1, r0]
	cmp r0, #0
	bne _0207CA54
	ldr r0, _0207CA88 ; =0x00000654
	mov r1, #0
	ldr r0, [r4, r0]
	add r0, #0x27
	strb r1, [r0]
	mov r0, #0x20
	pop {r4, pc}
_0207CA54:
	ldr r0, _0207CA8C ; =0x00000678
	mov r1, #1
	ldr r0, [r4, r0]
	bl thunk_Sprite_SetPalIndex
	add r0, r4, #0
	mov r1, #0xb3
	mov r2, #1
	bl sub_0207DAEC
	ldr r0, _0207CA90 ; =sub_0207FAA8
	ldr r1, _0207CA94 ; =0x00000C58
	ldr r2, _0207CA98 ; =sub_0207FAD4
	str r0, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	mov r0, #0x1a
	add r1, #0xa
	strb r0, [r4, r1]
	mov r0, #0x18
	pop {r4, pc}
	nop
_0207CA80: .word 0x00000C65
_0207CA84: .word 0x0000083A
_0207CA88: .word 0x00000654
_0207CA8C: .word 0x00000678
_0207CA90: .word sub_0207FAA8
_0207CA94: .word 0x00000C58
_0207CA98: .word sub_0207FAD4
	thumb_func_end sub_0207CA30

	thumb_func_start sub_0207CA9C
sub_0207CA9C: ; 0x0207CA9C
	mov r0, #0x14
	bx lr
	thumb_func_end sub_0207CA9C

	thumb_func_start sub_0207CAA0
sub_0207CAA0: ; 0x0207CAA0
	mov r0, #0x15
	bx lr
	thumb_func_end sub_0207CAA0

	thumb_func_start sub_0207CAA4
sub_0207CAA4: ; 0x0207CAA4
	mov r0, #0x13
	bx lr
	thumb_func_end sub_0207CAA4

	thumb_func_start sub_0207CAA8
sub_0207CAA8: ; 0x0207CAA8
	mov r0, #0x12
	bx lr
	thumb_func_end sub_0207CAA8

	thumb_func_start sub_0207CAAC
sub_0207CAAC: ; 0x0207CAAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	mov r0, #0x15
	mov r1, #0x16
	add r2, r4, #0
	add r7, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0xc
	str r0, [sp, #8]
	bl NNS_G2dGetUnpackedScreenData
	ldr r0, [sp, #0xc]
	mov r4, #0
	str r0, [sp, #4]
	add r0, #0xc
	str r0, [sp, #4]
	str r0, [sp]
_0207CAD6:
	ldr r1, [sp]
	add r0, r5, #0
	mov r2, #0x20
	bl memcpy
	add r1, r4, #6
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	add r1, r4, #0
	add r1, #0xc
	lsl r2, r1, #6
	ldr r1, [sp, #4]
	add r0, r7, #0
	add r1, r1, r2
	mov r2, #0x20
	bl memcpy
	ldr r0, [sp]
	add r4, r4, #1
	add r0, #0x40
	str r0, [sp]
	add r5, #0x20
	add r6, #0x20
	add r7, #0x20
	cmp r4, #6
	blo _0207CAD6
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0207CAAC

	thumb_func_start sub_0207CB20
sub_0207CB20: ; 0x0207CB20
	push {r4, lr}
	ldr r1, _0207CB38 ; =0x00000824
	add r4, r0, #0
	ldr r1, [r4, r1]
	bl sub_0207E618
	mov r0, #0x82
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl ListMenuItems_Delete
	pop {r4, pc}
	.balign 4, 0
_0207CB38: .word 0x00000824
	thumb_func_end sub_0207CB20

	thumb_func_start sub_0207CB3C
sub_0207CB3C: ; 0x0207CB3C
	push {r3, lr}
	ldr r2, _0207CB50 ; =0x00000654
	ldr r0, [r0, r2]
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _0207CB4C
	bl sub_02018410
_0207CB4C:
	pop {r3, pc}
	nop
_0207CB50: .word 0x00000654
	thumb_func_end sub_0207CB3C

	thumb_func_start sub_0207CB54
sub_0207CB54: ; 0x0207CB54
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0207CB68 ; =FS_OVERLAY_ID(OVY_94)
	mov r1, #2
	bl HandleLoadOverlay
	add r0, r4, #0
	bl PartyMenu_InitIconFormChangeData
	pop {r4, pc}
	.balign 4, 0
_0207CB68: .word FS_OVERLAY_ID(OVY_94)
	thumb_func_end sub_0207CB54

	thumb_func_start sub_0207CB6C
sub_0207CB6C: ; 0x0207CB6C
	ldr r3, _0207CB74 ; =UnloadOverlayByID
	ldr r0, _0207CB78 ; =FS_OVERLAY_ID(OVY_94)
	bx r3
	nop
_0207CB74: .word UnloadOverlayByID
_0207CB78: .word FS_OVERLAY_ID(OVY_94)
	thumb_func_end sub_0207CB6C

	.rodata

	.global _021012B0
_021012B0:
	.byte 0x01, 0x03
	.byte 0x1A, 0x03
	.byte 0x01, 0x0A
	.byte 0x1A, 0x0A
	.byte 0x01, 0x11
	.byte 0x1A, 0x11

	.global _021012BC
_021012BC:
	.word 1, 0, 0, 0

	.global _021012CC
_021012CC:
	.byte 0x00, 0x02, 0x04, 0x01, 0x03, 0x05
	.byte 0x01, 0x03, 0x05, 0x00, 0x02, 0x04
	.byte 0x04, 0x02, 0x00, 0x05, 0x03, 0x01
	.byte 0x05, 0x03, 0x01, 0x04, 0x02, 0x00

	.global _021012E4
_021012E4:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00
	.word 0x00000000

	.global _02101300
_02101300:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global _0210131C
_0210131C:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1D, 0x04, 0x00, 0x02, 0x00, 0x00
	.word 0x00000000

	.global _02101338
_02101338:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1B, 0x04, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.global _02101354
_02101354:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.global _02101370
_02101370:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00
	.word 0x00000000

	.global _0210138C
_0210138C:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1F, 0x02, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000

	.global _021013A8
_021013A8:
	.word 0x00000000, 0x00000000
	.word 0x00000800
	.word 0x00000000
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x01, 0x00, 0x00
	.word 0x00000000

	.global _021013C4
_021013C4:
	.short MOVE_CUT
	.short MOVE_FLY
	.short MOVE_SURF
	.short MOVE_STRENGTH
	.short MOVE_ROCK_SMASH
	.short MOVE_WATERFALL
	.short MOVE_ROCK_CLIMB
	.short MOVE_WHIRLPOOL
	.short MOVE_FLASH
	.short MOVE_TELEPORT
	.short MOVE_DIG
	.short MOVE_SWEET_SCENT
	.short MOVE_CHATTER
	.short MOVE_HEADBUTT
	.short MOVE_MILK_DRINK
	.short MOVE_SOFTBOILED

	.global _021013E4
_021013E4:
	.word 0x00000001
	.word 0x00000000
	.word 0x00000004
	.word 0x00000000
	.word 0x00000010
	.word 0x00000000
	.word 0x00000100
	.word 0x00000000
	.word 0x00000002
	.word 0x00000060

	.global _0210140C
_0210140C:
	.byte 0x40, 0x19, 0x00, 0x00, 0x07, 0x02, 0x07, 0x01
	.byte 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03
	.byte 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x07, 0x03, 0x05
	.byte 0xC0, 0x81, 0x00, 0x00, 0x03, 0x07, 0x04, 0x07
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0x05, 0x00

	.global _0210144C
_0210144C:
	.byte 0x40, 0x19, 0x00, 0x00, 0x04, 0x02, 0x01, 0x01
	.byte 0xC0, 0x19, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x03, 0x03
	.byte 0xC0, 0x49, 0x00, 0x00, 0x01, 0x05, 0x02, 0x02
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x00, 0x05, 0x05
	.byte 0xC0, 0x79, 0x00, 0x00, 0x03, 0x07, 0x04, 0x04
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x01, 0xFF, 0xFF

	.global _0210148C
_0210148C:
	.byte 0x40, 0x19, 0x00, 0x00, 0x07, 0x02, 0x07, 0x01
	.byte 0xC0, 0x21, 0x00, 0x00, 0x07, 0x03, 0x00, 0x02
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03
	.byte 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x06, 0x03, 0x05
	.byte 0xC0, 0x81, 0x00, 0x00, 0x03, 0x06, 0x04, 0x06
	.byte 0xE0, 0xA8, 0x00, 0x00, 0x05, 0x07, 0x05, 0x07
	.byte 0xE0, 0xB8, 0x00, 0x00, 0x06, 0x01, 0x06, 0x00

	.global _021014CC
_021014CC:
	.byte 0x40, 0x19, 0x00, 0x00, 0x05, 0x02, 0x05, 0x01
	.byte 0xC0, 0x21, 0x00, 0x00, 0x05, 0x03, 0x00, 0x02
	.byte 0x40, 0x49, 0x00, 0x00, 0x00, 0x04, 0x01, 0x03
	.byte 0xC0, 0x51, 0x00, 0x00, 0x01, 0x05, 0x02, 0x04
	.byte 0x40, 0x79, 0x00, 0x00, 0x02, 0x00, 0x03, 0x05
	.byte 0xC0, 0x81, 0x00, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.global _0210150C
_0210150C:
	.short 0x0000, 0x0000, 0x001E, 0x0010, 0x0010, 0x000E
	.short 0x0010, 0x0001, 0x009E, 0x0018, 0x0090, 0x0016
	.short 0x0000, 0x0006, 0x001E, 0x0040, 0x0010, 0x003E
	.short 0x0010, 0x0007, 0x009E, 0x0048, 0x0090, 0x0046
	.short 0x0000, 0x000C, 0x001E, 0x0070, 0x0010, 0x006E
	.short 0x0010, 0x000D, 0x009E, 0x0078, 0x0090, 0x0076

	.global _02101554
_02101554:
	.short 0x0000, 0x0000, 0x001E, 0x0010, 0x0010, 0x000E
	.short 0x0010, 0x0000, 0x009E, 0x0010, 0x0090, 0x000E
	.short 0x0000, 0x0006, 0x001E, 0x0040, 0x0010, 0x003E
	.short 0x0010, 0x0006, 0x009E, 0x0040, 0x0090, 0x003E
	.short 0x0000, 0x000C, 0x001E, 0x0070, 0x0010, 0x006E
	.short 0x0010, 0x000C, 0x009E, 0x0070, 0x0090, 0x006E

	.public gOverlayTemplate_PartyMenu
gOverlayTemplate_PartyMenu:
	.word PartyMenuApp_Init, PartyMenuApp_Main, PartyMenuApp_Exit, 0xFFFFFFFF

	.data

	.global _02110104
_02110104:
	.byte 0x00, 0x30, 0x00, 0x80
	.byte 0x08, 0x38, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80
	.byte 0x38, 0x68, 0x80, 0x00
	.byte 0x60, 0x90, 0x00, 0x80
	.byte 0x68, 0x98, 0x80, 0x00
	.byte 0xB0, 0xC0, 0xC8, 0x00
	.byte 0xA0, 0xB0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00

	.global _02110128
_02110128:
	.byte 0x00, 0x30, 0x00, 0x80
	.byte 0x08, 0x38, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80
	.byte 0x38, 0x68, 0x80, 0x00
	.byte 0x60, 0x90, 0x00, 0x80
	.byte 0x68, 0x98, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00

	.byte 0x00, 0x30, 0x00, 0x80
	.byte 0x00, 0x30, 0x80, 0x00
	.byte 0x30, 0x60, 0x00, 0x80
	.byte 0x30, 0x60, 0x80, 0x00
	.byte 0x60, 0x90, 0x00, 0x80
	.byte 0x60, 0x90, 0x80, 0x00
	.byte 0x98, 0xC0, 0xC8, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00
