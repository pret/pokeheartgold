#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0271.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0640.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "overlay_101.inc"
	.include "global.inc"

	.text

	thumb_func_start ov101_021F017C
ov101_021F017C: ; 0x021F017C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xac
	mov r1, #0
	add r5, r0, #0
	mov r0, #1
	add r2, r1, #0
	bl GX_SetGraphicsMode
	ldr r4, _021F025C ; =ov101_021F8440
	add r3, sp, #4
	mov r2, #0x15
_021F0192:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021F0192
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x74]
	add r2, sp, #4
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	add r2, sp, #0x20
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, sp, #0x3c
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #5
	ldr r0, [r0, #0x74]
	add r2, sp, #0x58
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #6
	ldr r0, [r0, #0x74]
	add r2, sp, #0x74
	bl InitBgFromTemplateEx
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	add r2, sp, #0x90
	bl InitBgFromTemplateEx
	mov r4, #0
	mov r6, #0x20
	add r7, r4, #0
_021F0200:
	ldr r0, [r5, #0xc]
	add r1, r4, #1
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #1
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	add r1, r6, #0
	add r2, r7, #0
	bl BG_ClearCharDataRange
	ldr r0, [r5, #0xc]
	add r1, r4, #5
	lsl r1, r1, #0x18
	ldr r0, [r0, #0x74]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #5
	lsl r0, r0, #0x18
	ldr r3, [r5]
	lsr r0, r0, #0x18
	mov r1, #0x20
	mov r2, #0
	bl BG_ClearCharDataRange
	add r4, r4, #1
	cmp r4, #3
	blt _021F0200
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	ldr r0, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0x20
	bl BgSetPosTextAndCommit
	add sp, #0xac
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F025C: .word ov101_021F8440
	thumb_func_end ov101_021F017C

	thumb_func_start ov101_021F0260
ov101_021F0260: ; 0x021F0260
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl SetBgPriority
	ldr r0, [r4, #0xc]
	mov r1, #3
	ldr r0, [r0, #0x74]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0xc]
	bl ov100_021E5CA4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0260

	thumb_func_start ov101_021F0284
ov101_021F0284: ; 0x021F0284
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #4
	bl FontID_Alloc
	ldr r1, [r5]
	mov r0, #0x92
	bl NARC_New
	add r4, r0, #0
	ldrb r0, [r5, #0x11]
	add r2, r4, #0
	mov r3, #0x92
	add r0, #0x1c
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldrb r0, [r5, #0x11]
	add r2, r4, #0
	mov r3, #0x92
	add r0, #0x10
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldrb r0, [r5, #0x11]
	add r2, r4, #0
	mov r3, #0x92
	add r0, #0x16
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	ldr r1, [r5]
	ldr r0, [r0, #0x74]
	bl sub_0208820C
	ldr r0, [r5]
	ldr r3, _021F0368 ; =0x0000050C
	str r0, [sp]
	ldrb r1, [r5, #0x11]
	add r0, r4, #0
	mov r2, #0
	add r1, #0x22
	add r3, r5, r3
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r1, _021F036C ; =0x00000508
	mov r2, #0
	str r0, [r5, r1]
	add r0, r1, #4
	ldr r0, [r5, r0]
	mov r1, #0x20
	str r1, [sp]
	mov r1, #0x14
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrh r1, [r0]
	add r3, r2, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #2
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r4, #0
	bl NARC_Delete
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0xc]
	mov r1, #7
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
_021F0368: .word 0x0000050C
_021F036C: .word 0x00000508
	thumb_func_end ov101_021F0284

	thumb_func_start ov101_021F0370
ov101_021F0370: ; 0x021F0370
	push {r3, lr}
	ldr r1, _021F0384 ; =0x00000508
	ldr r0, [r0, r1]
	bl FreeToHeap
	mov r0, #4
	bl FontID_Release
	pop {r3, pc}
	nop
_021F0384: .word 0x00000508
	thumb_func_end ov101_021F0370

	thumb_func_start ov101_021F0388
ov101_021F0388: ; 0x021F0388
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x92
	bl NARC_New
	add r4, r0, #0
	mov r1, #0
	mov r0, #7
	str r1, [sp]
	lsl r0, r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r2, [r5, #0x11]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, #0xa
	bl PaletteData_LoadFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #6
	lsl r0, r0, #6
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldrb r2, [r5, #0x11]
	ldr r0, [r0, #0x78]
	ldr r3, [r5]
	add r1, r4, #0
	add r2, r2, #4
	bl PaletteData_LoadFromOpenNarc
	mov r0, #2
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl PaletteData_LoadFromOpenNarc
	mov r0, #3
	str r0, [sp]
	mov r0, #0x16
	lsl r0, r0, #4
	str r0, [sp, #4]
	mov r0, #0x40
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r5, #0xc]
	ldr r3, [r5]
	ldr r0, [r0, #0x78]
	add r1, r4, #0
	bl PaletteData_LoadFromOpenNarc
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	mov r0, #0x10
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0388

	thumb_func_start ov101_021F0464
ov101_021F0464: ; 0x021F0464
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r0, #0xbc
	ldr r0, [r0]
	add r4, r1, #0
	bl Sprite_SetVisibleFlag
	add r0, r5, #0
	add r0, #0x48
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x58
	mov r1, #0
	bl FillWindowPixelBuffer
	cmp r4, #0
	beq _021F0508
	mov r0, #8
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xb0
	bl PaletteData_BlendPalette
	mov r0, #8
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r2, #0xe0
	ldr r0, [r0, #0x78]
	mov r3, #0x20
	bl PaletteData_BlendPalette
	mov r0, #8
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x60
	mov r3, #0x20
	bl PaletteData_BlendPalette
	mov r0, #8
	str r0, [sp]
	mov r2, #0
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r3, #0x40
	bl PaletteData_BlendPalette
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0xc8
	add r0, #0xc4
	ldrb r1, [r1]
	ldr r0, [r0]
	bl PhoneContact_GetName
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	ldr r0, _021F0574 ; =0x00010200
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x58
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterizedWithColor
	b _021F0552
_021F0508:
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	ldr r0, [r0, #0x78]
	mov r3, #0xe0
	bl PaletteData_BlendPalette
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r2, #0xe0
	ldr r0, [r0, #0x78]
	mov r3, #0x20
	bl PaletteData_BlendPalette
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r2, #0x40
	mov r3, #0xc0
	bl PaletteData_BlendPalette
	mov r2, #0
	str r2, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #0xc]
	mov r1, #2
	ldr r0, [r0, #0x78]
	mov r3, #0x40
	bl PaletteData_BlendPalette
_021F0552:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x78]
	bl PaletteData_PushTransparentBuffers
	ldr r0, [r5, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x78]
	bl PaletteData_SetAutoTransparent
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_021F0574: .word 0x00010200
	thumb_func_end ov101_021F0464

	thumb_func_start ov101_021F0578
ov101_021F0578: ; 0x021F0578
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _021F05C4 ; =ov101_021F8420
	mov r6, #0
	add r5, #0x48
_021F0586:
	ldrb r0, [r4, #2]
	add r1, r5, #0
	str r0, [sp]
	ldrb r0, [r4, #3]
	str r0, [sp, #4]
	ldrb r0, [r4, #4]
	str r0, [sp, #8]
	ldrb r0, [r4, #5]
	str r0, [sp, #0xc]
	ldrh r0, [r4, #6]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0xc]
	ldrb r2, [r4]
	ldrb r3, [r4, #1]
	ldr r0, [r0, #0x74]
	bl AddWindowParameterized
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #4
	blt _021F0586
	ldr r0, _021F05C8 ; =0x000003E1
	bl TextPrinter_SetDownArrowBaseTile
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F05C4: .word ov101_021F8420
_021F05C8: .word 0x000003E1
	thumb_func_end ov101_021F0578

	thumb_func_start ov101_021F05CC
ov101_021F05CC: ; 0x021F05CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x48
_021F05D4:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #4
	blt _021F05D4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F05CC

	thumb_func_start ov101_021F05EC
ov101_021F05EC: ; 0x021F05EC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r6]
	mov r0, #0
	add r2, #0xf4
	bl NewMsgDataFromNarc
	str r0, [r6, #0x14]
	ldr r2, [r6]
	mov r0, #2
	mov r1, #0x20
	bl MessageFormat_New_Custom
	str r0, [r6, #0x18]
	mov r0, #0xa
	ldr r1, [r6]
	lsl r0, r0, #6
	bl String_New
	str r0, [r6, #0x1c]
	mov r0, #0xa
	ldr r1, [r6]
	lsl r0, r0, #6
	bl String_New
	str r0, [r6, #0x20]
	mov r4, #0
	add r5, r6, #0
_021F0628:
	add r1, r4, #0
	ldr r0, [r6, #0x14]
	add r1, #0x14
	bl NewString_ReadMsgData
	str r0, [r5, #0x24]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _021F0628
	ldr r0, [r6, #0xc]
	ldr r0, [r0, #0x30]
	bl Options_GetTextFrameDelay
	add r6, #0x44
	strb r0, [r6]
	mov r0, #1
	bl TextFlags_SetAlternateDownArrow
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F05EC

	thumb_func_start ov101_021F0658
ov101_021F0658: ; 0x021F0658
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021F0660:
	ldr r0, [r5, #0x24]
	bl String_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _021F0660
	ldr r0, [r6, #0x20]
	bl String_Delete
	ldr r0, [r6, #0x1c]
	bl String_Delete
	ldr r0, [r6, #0x18]
	bl MessageFormat_Delete
	ldr r0, [r6, #0x14]
	bl DestroyMsgData
	mov r0, #0
	bl TextFlags_SetAlternateDownArrow
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F0658

	thumb_func_start ov101_021F0694
ov101_021F0694: ; 0x021F0694
	push {r3, r4, lr}
	sub sp, #0x3c
	add r4, r0, #0
	add r0, sp, #0
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	ldr r0, [r4]
	str r0, [sp]
	ldr r0, [r4, #0xc]
	add r0, #0xc
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xbc
	ldr r0, [r0]
	str r4, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x10]
	add r0, r4, #0
	add r0, #0x48
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r0, #0x58
	str r0, [sp, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x78]
	str r0, [sp, #0x1c]
	add r0, r4, #0
	add r0, #0x44
	ldrb r1, [r0]
	add r0, sp, #0x20
	strb r1, [r0, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x20]
	ldrh r1, [r0, #0x10]
	add r0, sp, #0
	strh r1, [r0, #0x34]
	ldr r1, [r4, #0xc]
	ldr r1, [r1, #0x20]
	ldrh r1, [r1, #0x12]
	strh r1, [r0, #0x36]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	str r0, [sp, #0x20]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	bl SaveData_GetMomsSavingsAddr
	str r0, [sp, #0x24]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x34]
	str r0, [sp, #0x28]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x2c]
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0x24]
	bl Save_SysInfo_RTC_Get
	str r0, [sp, #0x30]
	add r0, sp, #0
	bl ov101_021F1D74
	add r4, #0xc4
	str r0, [r4]
	add sp, #0x3c
	pop {r3, r4, pc}
	thumb_func_end ov101_021F0694

	thumb_func_start ov101_021F0720
ov101_021F0720: ; 0x021F0720
	ldr r3, _021F0728 ; =ov101_021F1E80
	add r0, #0xc4
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_021F0728: .word ov101_021F1E80
	thumb_func_end ov101_021F0720

	thumb_func_start ov101_021F072C
ov101_021F072C: ; 0x021F072C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl ov100_021E6978
	ldr r1, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [r1, #0x78]
	bl TouchscreenListMenuSpawner_Create
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov101_021F072C

	thumb_func_start ov101_021F0748
ov101_021F0748: ; 0x021F0748
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl TouchscreenListMenuSpawner_Destroy
	ldr r0, [r4, #0xc]
	bl ov100_021E69C8
	pop {r4, pc}
	thumb_func_end ov101_021F0748

	thumb_func_start ov101_021F075C
ov101_021F075C: ; 0x021F075C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r4, _021F0858 ; =ov101_021F84E8
	mov r7, #0
	add r5, r6, #0
_021F0766:
	ldr r1, [r6, #0xc]
	add r2, r4, #0
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteRenderer_CreateSprite
	add r1, r5, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl thunk_Sprite_SetPriority
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl Sprite_SetVisibleFlag
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	add r7, r7, #1
	add r4, #0x28
	add r5, r5, #4
	cmp r7, #5
	ble _021F0766
	add r4, r6, #0
	mov r7, #6
	add r4, #0x18
	mov r5, #0x90
_021F07B4:
	ldr r1, [r6, #0xc]
	ldr r2, _021F085C ; =ov101_021F85D8
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteRenderer_CreateSprite
	add r1, r4, #0
	add r1, #0x88
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl thunk_Sprite_SetDrawPriority
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl Sprite_SetVisibleFlag
	add r0, r4, #0
	add r0, #0x88
	ldr r0, [r0]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	add r0, r4, #0
	add r2, r5, #0
	add r0, #0x88
	sub r2, #0x80
	lsl r2, r2, #0x10
	ldr r0, [r0]
	mov r1, #0xc
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	add r7, r7, #1
	add r4, r4, #4
	add r5, #0x18
	cmp r7, #0xc
	ble _021F07B4
	ldr r1, [r6, #0xc]
	ldr r2, _021F0860 ; =ov101_021F8600
	add r0, r1, #0
	add r0, #0x8c
	add r1, #0x90
	ldr r0, [r0]
	ldr r1, [r1]
	bl SpriteRenderer_CreateSprite
	add r1, r6, #0
	add r1, #0xbc
	str r0, [r1]
	add r0, r6, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0
	bl thunk_Sprite_SetPriority
	add r0, r6, #0
	add r0, #0xbc
	ldr r0, [r0]
	mov r1, #0
	bl Sprite_SetVisibleFlag
	add r6, #0xbc
	ldr r0, [r6]
	mov r1, #0
	bl Sprite_SetAnimActiveFlag
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F0858: .word ov101_021F84E8
_021F085C: .word ov101_021F85D8
_021F0860: .word ov101_021F8600
	thumb_func_end ov101_021F075C

	thumb_func_start ov101_021F0864
ov101_021F0864: ; 0x021F0864
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_021F086A:
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	bl thunk_Sprite_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xe
	blt _021F086A
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0864

	thumb_func_start ov101_021F0880
ov101_021F0880: ; 0x021F0880
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0
	ldr r5, _021F08D4 ; =ov101_021F8404
	str r0, [sp]
	add r6, r7, #0
_021F088C:
	ldrb r0, [r5]
	ldr r1, [r7]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	bl ListMenuItems_New
	ldr r1, _021F08D8 ; =0x000004E8
	mov r4, #0
	str r0, [r6, r1]
	ldrb r0, [r5]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	cmp r0, #0
	ble _021F08C4
_021F08A8:
	ldr r0, _021F08D8 ; =0x000004E8
	ldrb r2, [r5, #1]
	ldr r0, [r6, r0]
	ldr r1, [r7, #0x14]
	add r2, r2, r4
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	ldrb r0, [r5]
	add r4, r4, #1
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	cmp r4, r0
	blt _021F08A8
_021F08C4:
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp]
	cmp r0, #7
	blt _021F088C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F08D4: .word ov101_021F8404
_021F08D8: .word 0x000004E8
	thumb_func_end ov101_021F0880

	thumb_func_start ov101_021F08DC
ov101_021F08DC: ; 0x021F08DC
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r7, _021F08FC ; =0x000004E8
	add r5, r0, #0
	add r6, r4, #0
_021F08E6:
	ldr r0, _021F08FC ; =0x000004E8
	ldr r0, [r5, r0]
	bl ListMenuItems_Delete
	str r6, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #7
	blt _021F08E6
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F08FC: .word 0x000004E8
	thumb_func_end ov101_021F08DC

	thumb_func_start ov101_021F0900
ov101_021F0900: ; 0x021F0900
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F0990
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #6]
	cmp r0, #0
	ldr r0, [r1, #0x7c]
	bne _021F091C
	mov r1, #0
	add r2, r1, #0
	bl ov100_021E7128
	pop {r4, pc}
_021F091C:
	mov r1, #0
	mov r2, #1
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	add r4, #0xe0
	add r0, r4, #0
	mov r1, #0xff
	mov r2, #0
	bl ov101_021F1290
	pop {r4, pc}
	thumb_func_end ov101_021F0900

	thumb_func_start ov101_021F0944
ov101_021F0944: ; 0x021F0944
	ldr r3, _021F0950 ; =ov101_021F1290
	add r0, #0xe0
	mov r1, #0xff
	mov r2, #1
	bx r3
	nop
_021F0950: .word ov101_021F1290
	thumb_func_end ov101_021F0944

	thumb_func_start ov101_021F0954
ov101_021F0954: ; 0x021F0954
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0, #6]
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #0xff
	mov r2, #1
	bl ov101_021F1290
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	add r2, r1, #0
	bl ov100_021E7128
	pop {r4, pc}
	thumb_func_end ov101_021F0954

	thumb_func_start ov101_021F0978
ov101_021F0978: ; 0x021F0978
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xe0
	bl ov101_021F1804
	add r4, #0xe0
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl ov101_021F1364
	pop {r4, pc}
	thumb_func_end ov101_021F0978

	thumb_func_start ov101_021F0990
ov101_021F0990: ; 0x021F0990
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F0F48
	add r0, r4, #0
	bl ov101_021F11B0
	add r0, r4, #0
	add r4, #0xe0
	mov r2, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov101_021F11E0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0990

	thumb_func_start ov101_021F09B0
ov101_021F09B0: ; 0x021F09B0
	push {r4, r5, r6, lr}
	sub sp, #0x30
	add r5, r0, #0
	add r0, #0xcc
	strb r1, [r0]
	add r4, r2, #0
	add r0, sp, #0x18
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r0, _021F0A74 ; =ov101_021F8628
	add r2, sp, #0x18
	ldrh r3, [r0]
	add r1, sp, #0x18
	strh r3, [r2]
	ldrh r3, [r0, #2]
	strh r3, [r2, #2]
	ldrh r3, [r0, #4]
	strh r3, [r2, #4]
	ldrh r3, [r0, #6]
	strh r3, [r2, #6]
	ldrh r3, [r0, #8]
	ldrh r0, [r0, #0xa]
	strh r3, [r2, #8]
	strh r0, [r2, #0xa]
	lsl r3, r4, #2
	ldr r0, _021F0A78 ; =0x000004E8
	add r6, r5, r3
	ldr r0, [r6, r0]
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	str r0, [sp, #0x28]
	ldr r0, _021F0A7C ; =ov101_021F8404
	ldrb r6, [r0, r3]
	lsl r6, r6, #0x1d
	lsr r6, r6, #0x1d
	strb r6, [r2, #0x14]
	cmp r4, #1
	bne _021F0A36
	ldr r2, _021F0A80 ; =ov101_021F8404 + 3
	ldr r4, _021F0A84 ; =ov101_021F8404 + 2
	ldrb r2, [r2, r3]
	str r2, [sp]
	ldrb r0, [r0, r3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _021F0A88 ; =ov101_021F0A94
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	ldr r2, [r2, #0xc]
	add r0, #0xc0
	lsl r2, r2, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r0]
	lsr r2, r2, #0x18
	bl TouchscreenListMenu_CreateWithCallback
	b _021F0A68
_021F0A36:
	ldr r2, _021F0A80 ; =ov101_021F8404 + 3
	ldr r4, _021F0A84 ; =ov101_021F8404 + 2
	ldrb r2, [r2, r3]
	str r2, [sp]
	ldrb r0, [r0, r3]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, _021F0A8C ; =ov101_021F0AB8
	str r0, [sp, #0xc]
	str r5, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	ldr r2, [r5, #0xc]
	add r0, r5, #0
	ldr r2, [r2, #0xc]
	add r0, #0xc0
	lsl r2, r2, #0x18
	ldrb r3, [r4, r3]
	ldr r0, [r0]
	lsr r2, r2, #0x18
	bl TouchscreenListMenu_CreateWithCallback
_021F0A68:
	ldr r1, _021F0A90 ; =0x00000504
	str r0, [r5, r1]
	ldr r0, _021F0A90 ; =0x00000504
	ldr r0, [r5, r0]
	add sp, #0x30
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F0A74: .word ov101_021F8628
_021F0A78: .word 0x000004E8
_021F0A7C: .word ov101_021F8404
_021F0A80: .word ov101_021F8404 + 3
_021F0A84: .word ov101_021F8404 + 2
_021F0A88: .word ov101_021F0A94
_021F0A8C: .word ov101_021F0AB8
_021F0A90: .word 0x00000504
	thumb_func_end ov101_021F09B0

	thumb_func_start ov101_021F0A94
ov101_021F0A94: ; 0x021F0A94
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	cmp r3, #0
	beq _021F0AA4
	ldr r0, _021F0AB4 ; =0x00000941
	bl PlaySE
_021F0AA4:
	add r1, r5, #3
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	mov r2, #1
	bl ov101_021F0ACC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F0AB4: .word 0x00000941
	thumb_func_end ov101_021F0A94

	thumb_func_start ov101_021F0AB8
ov101_021F0AB8: ; 0x021F0AB8
	push {r3, lr}
	cmp r3, #0
	beq _021F0AC4
	ldr r0, _021F0AC8 ; =0x00000941
	bl PlaySE
_021F0AC4:
	pop {r3, pc}
	nop
_021F0AC8: .word 0x00000941
	thumb_func_end ov101_021F0AB8

	thumb_func_start ov101_021F0ACC
ov101_021F0ACC: ; 0x021F0ACC
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r6, r1, #0
	cmp r2, #0
	beq _021F0B48
	ldr r0, _021F0B7C ; =0x0000050C
	mov r1, #0x20
	ldr r0, [r5, r0]
	mov r2, #0
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0xc
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0x18
	str r1, [sp, #0x10]
	ldrh r1, [r0]
	mov r3, #0x14
	lsl r1, r1, #0x15
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldrh r0, [r0, #2]
	mov r1, #1
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	ldr r0, [r0, #0x74]
	bl CopyToBgTilemapRect
	add r0, r5, #0
	add r0, #0x78
	mov r1, #5
	bl FillWindowPixelBuffer
	add r4, r5, #0
	mov r0, #0
	add r4, #0x24
	lsl r6, r6, #2
	ldr r1, [r4, r6]
	add r2, r0, #0
	bl FontID_String_GetWidth
	mov r1, #1
	lsl r1, r1, #8
	sub r0, r1, r0
	mov r1, #0
	lsr r3, r0, #1
	str r1, [sp]
	ldr r0, _021F0B80 ; =0x00030205
	str r1, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	ldr r2, [r4, r6]
	add r0, #0x78
	bl AddTextPrinterParameterizedWithColor
	b _021F0B6C
_021F0B48:
	add r0, #0x78
	bl ClearWindowTilemapAndScheduleTransfer
	mov r0, #0x14
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r5, #0xc]
	mov r2, #0
	ldr r0, [r0, #0x74]
	mov r1, #1
	add r3, r2, #0
	bl FillBgTilemapRect
_021F0B6C:
	ldr r0, [r5, #0xc]
	mov r1, #1
	ldr r0, [r0, #0x74]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_021F0B7C: .word 0x0000050C
_021F0B80: .word 0x00030205
	thumb_func_end ov101_021F0ACC

	thumb_func_start ov101_021F0B84
ov101_021F0B84: ; 0x021F0B84
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xe0
	bl ov101_021F1808
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #1
	bl ov101_021F1338
	add r0, r4, #0
	bl ov101_021F0944
	pop {r4, pc}
	thumb_func_end ov101_021F0B84

	thumb_func_start ov101_021F0BA0
ov101_021F0BA0: ; 0x021F0BA0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F0C44 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _021F0BF2
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _021F0BF2
	ldr r0, [r4, #0xc]
	mov r1, #1
	strb r1, [r0, #6]
	mov r0, #0x25
	lsl r0, r0, #6
	bl PlaySE
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	mov r2, #1
	bl ov100_021E7128
	ldr r0, [r4, #0xc]
	bl ov100_021E5DC8
	add r2, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	ldr r0, [r0, #0x7c]
	bl ov100_021E72F8
	add r4, #0xe0
	add r0, r4, #0
	mov r1, #0xff
	mov r2, #0
	bl ov101_021F1290
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_021F0BF2:
	add r0, r4, #0
	add r0, #0xe0
	bl ov101_021F1408
	cmp r0, #0
	blt _021F0C3E
	mov r1, #0xc
	mul r1, r0
	add r0, r4, r1
	add r0, #0xf4
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xc8
	strb r1, [r0]
	ldr r0, _021F0C48 ; =0x00000941
	bl PlaySE
	add r0, r4, #0
	add r0, #0xe0
	mov r1, #0
	bl ov101_021F1338
	add r0, r4, #0
	add r0, #0xe0
	bl ov101_021F1804
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl ov101_021F09B0
	add r0, r4, #0
	mov r1, #0
	mov r2, #1
	bl ov101_021F0ACC
	mov r0, #8
	pop {r4, pc}
_021F0C3E:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
_021F0C44: .word gSystem
_021F0C48: .word 0x00000941
	thumb_func_end ov101_021F0BA0

	thumb_func_start ov101_021F0C4C
ov101_021F0C4C: ; 0x021F0C4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _021F0C6C
	ldr r0, [r5, #0xc]
	bl PokegearApp_HandleTouchInput_SwitchApps
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _021F0C6C
	ldr r1, [r5, #0xc]
	mov r2, #1
	str r2, [r1, #0xc]
	pop {r3, r4, r5, pc}
_021F0C6C:
	add r0, r5, #0
	add r0, #0xe0
	bl ov101_021F16A8
	add r4, r0, #0
	bmi _021F0CD8
	ldr r0, [r5, #0xc]
	ldrb r0, [r0, #6]
	cmp r0, #1
	bne _021F0C86
	add r0, r5, #0
	bl ov101_021F0954
_021F0C86:
	cmp r4, #0
	bne _021F0C90
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_021F0C90:
	sub r1, r4, #1
	mov r0, #0xc
	mul r0, r1
	add r0, r5, r0
	add r0, #0xf4
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	strb r1, [r0]
	ldr r0, _021F0CE0 ; =0x00000941
	bl PlaySE
	add r0, r5, #0
	add r0, #0xe0
	mov r1, #0
	bl ov101_021F1338
	add r0, r5, #0
	add r0, #0xe0
	bl ov101_021F1804
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl ov101_021F09B0
	add r0, r5, #0
	mov r1, #0
	mov r2, #1
	bl ov101_021F0ACC
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
	mov r0, #8
	pop {r3, r4, r5, pc}
_021F0CD8:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	nop
_021F0CE0: .word 0x00000941
	thumb_func_end ov101_021F0C4C

	thumb_func_start ov101_021F0CE4
ov101_021F0CE4: ; 0x021F0CE4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xe0
	add r1, sp, #0
	bl ov101_021F1768
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	bne _021F0D16
	ldrb r0, [r5, #0x10]
	cmp r0, #0
	bne _021F0D0A
	ldr r0, [r5, #0xc]
	bl ov100_021E5900
_021F0D0A:
	add r0, r5, #0
	add r0, #0xe0
	bl ov101_021F1564
	add r4, r0, #0
	b _021F0D1C
_021F0D16:
	ldr r0, [r5, #0xc]
	mov r1, #1
	str r1, [r0, #0xc]
_021F0D1C:
	cmp r4, #0
	bge _021F0D24
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F0D24:
	add r0, r5, #0
	add r0, #0xe2
	ldrb r2, [r0]
	cmp r4, r2
	bne _021F0D32
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F0D32:
	mov r1, #0xc
	mul r1, r2
	add r1, r5, r1
	add r1, #0xf0
	lsl r2, r4, #0x18
	ldr r1, [r1]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl ov101_021F0E0C
	add r0, r5, #0
	add r0, #0xe2
	strb r4, [r0]
	add r0, r5, #0
	bl ov101_021F11B0
	add r2, r5, #0
	add r1, r5, #0
	add r0, r5, #0
	add r2, #0xe3
	add r5, #0xe1
	ldrb r2, [r2]
	ldrb r3, [r5]
	add r1, #0xe0
	bl ov101_021F11E0
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0CE4

	thumb_func_start ov101_021F0D6C
ov101_021F0D6C: ; 0x021F0D6C
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xcd
	ldrb r2, [r1]
	mov r1, #0xc
	ldr r0, [r4]
	mul r1, r2
	bl AllocFromHeap
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	add r0, r4, #0
	bl ov101_021F1840
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0D6C

	thumb_func_start ov101_021F0D90
ov101_021F0D90: ; 0x021F0D90
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0xd8
	ldr r1, [r1]
	mov r0, #0
	ldrb r2, [r1, #1]
	add r1, r4, #0
	add r1, #0xd0
	ldr r1, [r1]
	add r0, r0, #1
	strb r2, [r1]
	add r1, r4, #0
	add r1, #0xd8
	ldr r2, [r1]
	lsl r0, r0, #0x18
	ldr r1, [r2, #8]
	lsr r0, r0, #0x18
	cmp r1, r2
	beq _021F0DD6
_021F0DB8:
	add r3, r4, #0
	add r3, #0xd0
	ldrb r5, [r1, #1]
	add r2, r0, #0
	ldr r3, [r3]
	add r0, r0, #1
	strb r5, [r3, r2]
	add r2, r4, #0
	add r2, #0xd8
	lsl r0, r0, #0x18
	ldr r1, [r1, #8]
	ldr r2, [r2]
	lsr r0, r0, #0x18
	cmp r1, r2
	bne _021F0DB8
_021F0DD6:
	add r2, r4, #0
	ldr r0, [r4, #0xc]
	add r1, r4, #0
	add r2, #0xcd
	add r1, #0xd0
	ldrb r2, [r2]
	ldr r0, [r0, #0x28]
	ldr r1, [r1]
	bl GSPlayerMisc_SetPhonebookFromBuffer
	add r2, r4, #0
	add r2, #0xcd
	add r0, r4, #0
	ldrb r3, [r2]
	add r0, #0xd4
	mov r2, #0xc
	ldr r0, [r0]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	add r4, #0xd4
	ldr r0, [r4]
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0D90

	thumb_func_start ov101_021F0E0C
ov101_021F0E0C: ; 0x021F0E0C
	push {r3, r4, r5, r6}
	ldr r5, [r1, #8]
	ldr r4, [r1, #4]
	mov r3, #0
	str r5, [r4, #8]
	ldr r5, [r1, #4]
	ldr r4, [r1, #8]
	str r5, [r4, #4]
	add r4, r0, #0
	add r4, #0xd8
	ldr r4, [r4]
	cmp r1, r4
	bne _021F0E2E
	add r4, r0, #0
	ldr r5, [r1, #8]
	add r4, #0xd8
	str r5, [r4]
_021F0E2E:
	add r4, r0, #0
	add r4, #0xdc
	ldr r4, [r4]
	cmp r1, r4
	bne _021F0E40
	add r4, r0, #0
	ldr r5, [r1, #4]
	add r4, #0xdc
	str r5, [r4]
_021F0E40:
	add r4, r0, #0
	add r4, #0xcd
	ldrb r4, [r4]
	sub r4, r4, #1
	cmp r2, r4
	bne _021F0E76
	add r2, r0, #0
	add r2, #0xdc
	ldr r2, [r2]
	str r2, [r1, #4]
	add r2, r0, #0
	add r2, #0xdc
	ldr r2, [r2]
	ldr r2, [r2, #8]
	str r2, [r1, #8]
	add r2, r0, #0
	add r2, #0xdc
	ldr r2, [r2]
	str r1, [r2, #8]
	add r2, r0, #0
	add r2, #0xd8
	ldr r2, [r2]
	add r0, #0xdc
	str r1, [r2, #4]
	str r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
_021F0E76:
	add r4, r0, #0
	add r4, #0xd8
	ldr r6, [r4]
	add r4, r6, #0
_021F0E7E:
	add r5, r3, #0
	add r3, r3, #1
	cmp r5, r2
	beq _021F0E8A
	ldr r4, [r4, #8]
	b _021F0EA6
_021F0E8A:
	str r4, [r1, #8]
	ldr r2, [r4, #4]
	str r2, [r1, #4]
	str r1, [r2, #8]
	add r2, r0, #0
	str r1, [r4, #4]
	add r2, #0xd8
	ldr r2, [r2]
	cmp r4, r2
	bne _021F0EAA
	add r0, #0xd8
	str r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
_021F0EA6:
	cmp r4, r6
	bne _021F0E7E
_021F0EAA:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F0E0C

	thumb_func_start ov101_021F0EB0
ov101_021F0EB0: ; 0x021F0EB0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r3, #0
	add r0, #0x84
	ldr r2, [r0]
	add r0, r6, #0
	add r0, #0xcd
	ldrb r0, [r0]
	sub r4, r0, #1
	cmp r4, #0
	ble _021F0F10
	add r2, r2, r1
_021F0ECC:
	cmp r4, r3
	ble _021F0F02
_021F0ED0:
	add r0, r6, #0
	add r0, #0xd0
	ldr r7, [r0]
	mov r0, #0x14
	ldrb r5, [r7, r4]
	ldrb r1, [r3, r7]
	mul r0, r5
	mov ip, r5
	mov r5, #0x14
	mul r5, r1
	add r0, r2, r0
	add r5, r2, r5
	ldrb r0, [r0, #0x10]
	ldrb r5, [r5, #0x10]
	cmp r0, r5
	bhs _021F0EFC
	mov r0, ip
	strb r0, [r3, r7]
	add r0, r6, #0
	add r0, #0xd0
	ldr r0, [r0]
	strb r1, [r0, r4]
_021F0EFC:
	sub r4, r4, #1
	cmp r4, r3
	bgt _021F0ED0
_021F0F02:
	add r0, r6, #0
	add r0, #0xcd
	ldrb r0, [r0]
	add r3, r3, #1
	sub r4, r0, #1
	cmp r3, r4
	blt _021F0ECC
_021F0F10:
	add r0, r6, #0
	bl ov101_021F1840
	add r0, r6, #0
	bl ov101_021F11B0
	add r0, r6, #0
	add r2, r6, #0
	mov r1, #0
	add r0, #0xe1
	strb r1, [r0]
	add r0, r6, #0
	add r0, #0xe1
	ldrb r1, [r0]
	add r0, r6, #0
	add r0, #0xe3
	strb r1, [r0]
	add r1, r6, #0
	add r0, r6, #0
	add r2, #0xe3
	add r6, #0xe1
	ldrb r2, [r2]
	ldrb r3, [r6]
	add r1, #0xe0
	bl ov101_021F11E0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F0EB0

	thumb_func_start ov101_021F0F48
ov101_021F0F48: ; 0x021F0F48
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0xe0
	ldr r2, _021F11AC ; =0x00000408
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r6, r4, #0
	mov r7, #0
	add r6, #0xc
_021F0F60:
	add r0, r6, #0
	bl ov101_021F18E0
	add r7, r7, #1
	add r6, #0xc
	cmp r7, #0x4b
	blt _021F0F60
	add r0, r5, #0
	add r0, #0xcd
	ldrb r0, [r0]
	mov r1, #0x39
	lsl r1, r1, #4
	strb r0, [r4]
	add r0, r5, #0
	add r0, #0x68
	str r0, [r4, r1]
	add r0, r5, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r1, #0
	add r0, #0x6c
	str r2, [r4, r0]
	ldrb r2, [r4, #6]
	mov r0, #1
	mov r6, #0
	bic r2, r0
	add r0, r1, #0
	strb r2, [r4, #6]
	ldr r2, [r5, #0xc]
	add r0, #0x70
	add r2, #0xc
	str r2, [r4, r0]
	add r0, r5, #0
	add r0, #0x10
	add r1, #0x74
	str r0, [r4, r1]
	mov r1, #0xf3
	add r2, r5, #0
	add r3, r4, #0
	lsl r1, r1, #2
_021F0FB0:
	add r0, r2, #0
	add r0, #0x98
	ldr r0, [r0]
	add r6, r6, #1
	str r0, [r3, r1]
	add r2, r2, #4
	add r3, r3, #4
	cmp r6, #2
	blt _021F0FB0
	mov r1, #0xf5
	mov r6, #0
	add r2, r5, #0
	add r3, r4, #0
	lsl r1, r1, #2
_021F0FCC:
	add r0, r2, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r6, r6, #1
	str r0, [r3, r1]
	add r2, r2, #4
	add r3, r3, #4
	cmp r6, #6
	blt _021F0FCC
	mov r1, #0xfb
	mov r3, #0
	add r2, r4, #0
	lsl r1, r1, #2
_021F0FE6:
	add r0, r5, #0
	add r0, #0x88
	ldr r0, [r0]
	add r3, r3, #1
	str r0, [r2, r1]
	add r5, r5, #4
	add r2, r2, #4
	cmp r3, #4
	blt _021F0FE6
	mov r3, #0xe5
	lsl r3, r3, #2
	mov r2, #1
	strb r2, [r4, r3]
	mov r1, #9
	add r0, r3, #1
	strb r1, [r4, r0]
	mov r1, #2
	add r0, r3, #2
	strb r1, [r4, r0]
	mov r0, #3
	add r5, r3, #3
	strb r0, [r4, r5]
	add r6, r3, #4
	mov r5, #4
	strb r5, [r4, r6]
	add r5, r3, #0
	mov r6, #0xb
	add r5, #0xa
	strb r6, [r4, r5]
	add r6, r3, #5
	mov r5, #5
	strb r5, [r4, r6]
	mov r5, #0xa
	add r6, r3, #6
	strb r5, [r4, r6]
	add r7, r3, #7
	mov r6, #6
	strb r6, [r4, r7]
	add r7, r3, #0
	add r7, #8
	mov r6, #7
	strb r6, [r4, r7]
	add r7, r3, #0
	add r7, #9
	mov r6, #8
	strb r6, [r4, r7]
	add r6, r3, #0
	add r6, #0xb
	strb r5, [r4, r6]
	add r5, r3, #1
	add r7, r3, #2
	ldrb r6, [r4, r5]
	ldrb r5, [r4, r3]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0xc
	str r6, [r4, r5]
	add r5, r3, #6
	ldrb r6, [r4, r5]
	add r5, r3, #5
	add r7, r3, #7
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0x10
	str r6, [r4, r5]
	add r5, r3, #1
	ldrb r6, [r4, r5]
	add r5, r3, #3
	add r7, r3, #4
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0x14
	str r6, [r4, r5]
	add r5, r3, #6
	ldrb r6, [r4, r5]
	add r5, r3, #0
	add r7, r3, #0
	add r5, #8
	add r7, #9
	ldrb r5, [r4, r5]
	ldrb r7, [r4, r7]
	lsl r5, r5, #0x18
	lsl r7, r7, #0x18
	lsr r5, r5, #8
	lsr r7, r7, #0x10
	orr r5, r7
	orr r6, r5
	add r5, r3, #0
	add r5, #0x18
	str r6, [r4, r5]
	add r5, r3, #0
	add r5, #0x1c
	strb r2, [r4, r5]
	add r2, r3, #0
	mov r5, #0xc
	add r2, #0x1d
	strb r5, [r4, r2]
	add r2, r3, #0
	add r2, #0x1e
	strb r1, [r4, r2]
	add r1, r3, #0
	add r1, #0x1f
	strb r0, [r4, r1]
	add r1, r3, #0
	add r2, r3, #0
	add r1, #0x20
	mov r0, #4
	strb r0, [r4, r1]
	add r0, r3, #0
	mov r1, #0xe
	add r0, #0x26
	strb r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x21
	mov r0, #5
	strb r0, [r4, r1]
	add r1, r3, #0
	mov r0, #0xd
	add r1, #0x22
	strb r0, [r4, r1]
	add r2, #0x23
	mov r1, #6
	strb r1, [r4, r2]
	add r2, r3, #0
	add r2, #0x24
	mov r1, #7
	strb r1, [r4, r2]
	add r2, r3, #0
	add r2, #0x25
	mov r1, #8
	strb r1, [r4, r2]
	add r1, r3, #0
	add r1, #0x27
	strb r0, [r4, r1]
	add r1, r3, #0
	add r1, #0x1c
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x1d
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x1e
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r1, r0
	add r0, r3, #0
	add r0, #0x28
	str r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x21
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x22
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x23
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r1, r0
	add r0, r3, #0
	add r0, #0x2c
	str r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x1f
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x1d
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x20
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r1, r0
	add r0, r3, #0
	add r0, #0x30
	str r1, [r4, r0]
	add r1, r3, #0
	add r1, #0x24
	ldrb r1, [r4, r1]
	add r0, r3, #0
	add r0, #0x22
	lsl r1, r1, #0x18
	lsr r2, r1, #8
	add r1, r3, #0
	add r1, #0x25
	ldrb r1, [r4, r1]
	ldrb r0, [r4, r0]
	add r3, #0x34
	lsl r1, r1, #0x18
	lsr r1, r1, #0x10
	orr r1, r2
	orr r0, r1
	str r0, [r4, r3]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F11AC: .word 0x00000408
	thumb_func_end ov101_021F0F48

	thumb_func_start ov101_021F11B0
ov101_021F11B0: ; 0x021F11B0
	push {r3, r4}
	add r3, r0, #0
	add r1, r0, #0
	add r0, #0xe0
	add r1, #0xd8
	ldr r2, [r1]
	ldrb r0, [r0]
	add r3, #0xe0
	mov r1, #0
	cmp r0, #0
	ble _021F11DC
	add r4, r3, #0
_021F11C8:
	strb r1, [r4, #0xc]
	ldrb r0, [r2, #1]
	add r1, r1, #1
	strb r0, [r4, #0x14]
	str r2, [r4, #0x10]
	ldrb r0, [r3]
	ldr r2, [r2, #8]
	add r4, #0xc
	cmp r1, r0
	blt _021F11C8
_021F11DC:
	pop {r3, r4}
	bx lr
	thumb_func_end ov101_021F11B0

	thumb_func_start ov101_021F11E0
ov101_021F11E0: ; 0x021F11E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r2, [sp, #8]
	add r5, r1, #0
	str r3, [sp, #0xc]
	str r0, [sp, #4]
	ldrb r1, [r5]
	ldr r0, [sp, #8]
	cmp r0, r1
	blo _021F11F8
	mov r0, #0
	str r0, [sp, #8]
_021F11F8:
	add r0, r5, #0
	bl ov101_021F19E4
	mov r6, #0
	strb r6, [r5, #5]
	ldr r0, [sp, #8]
	add r7, r6, #0
	strb r0, [r5, #3]
	mov r0, #0xff
	strb r0, [r5, #2]
	ldr r4, [sp, #8]
_021F120E:
	ldrb r0, [r5]
	cmp r4, r0
	blt _021F121C
	sub r0, r4, #1
	strb r0, [r5, #4]
	strb r6, [r5, #5]
	b _021F1238
_021F121C:
	add r1, r6, #1
	lsl r1, r1, #0x18
	lsl r2, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	add r3, r7, #0
	str r7, [sp]
	bl ov101_021F1A40
	add r6, r6, #1
	add r4, r4, #1
	cmp r6, #6
	blt _021F120E
_021F1238:
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _021F1248
	strb r6, [r5, #5]
	ldr r0, [sp, #8]
	sub r1, r6, #1
	add r0, r1, r0
	strb r0, [r5, #4]
_021F1248:
	ldrb r1, [r5, #5]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _021F1254
	mov r0, #0
	str r0, [sp, #0xc]
_021F1254:
	ldr r0, [sp, #0xc]
	strb r0, [r5, #1]
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl CopyWindowToVram
	add r0, r5, #0
	bl ov101_021F1B48
	ldr r0, [sp, #4]
	add r0, #0xcb
	str r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F1282
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0
	bl ov101_021F1290
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F1282:
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1290
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F11E0

	thumb_func_start ov101_021F1290
ov101_021F1290: ; 0x021F1290
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	str r1, [sp]
	cmp r2, #0
	beq _021F12B4
	mov r7, #0xfb
	mov r4, #0
	add r5, r6, #0
	lsl r7, r7, #2
_021F12A2:
	ldr r0, [r5, r7]
	mov r1, #1
	bl Sprite_SetVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F12A2
	b _021F12CC
_021F12B4:
	mov r7, #0xfb
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #2
_021F12BC:
	ldr r0, [r4, r7]
	mov r1, #0
	bl Sprite_SetVisibleFlag
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _021F12BC
_021F12CC:
	ldr r0, [sp]
	cmp r0, #6
	blo _021F12D6
	ldrb r0, [r6, #1]
	str r0, [sp]
_021F12D6:
	ldrb r1, [r6, #5]
	ldrb r0, [r6, #1]
	cmp r0, r1
	blo _021F12E6
	sub r0, r1, #1
	strb r0, [r6, #1]
	ldrb r0, [r6, #1]
	str r0, [sp]
_021F12E6:
	ldr r0, [sp]
	mov r1, #0x18
	add r4, r0, #0
	mul r4, r1
	add r5, r4, #0
	mov r0, #0xfb
	add r5, #8
	lsl r0, r0, #2
	lsl r2, r5, #0x10
	ldr r0, [r6, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r0, #0x3f
	add r4, #0x1e
	lsl r0, r0, #4
	lsl r2, r4, #0x10
	ldr r0, [r6, r0]
	mov r1, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r0, #0xfd
	lsl r0, r0, #2
	lsl r2, r5, #0x10
	ldr r0, [r6, r0]
	mov r1, #0xe0
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r0, #0xfe
	lsl r0, r0, #2
	lsl r2, r4, #0x10
	ldr r0, [r6, r0]
	mov r1, #0xe0
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1290

	thumb_func_start ov101_021F1338
ov101_021F1338: ; 0x021F1338
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0xfb
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	lsl r7, r7, #2
_021F1344:
	mov r0, #0xfb
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl Sprite_SetAnimActiveFlag
	ldr r0, [r5, r7]
	mov r1, #1
	bl Sprite_SetVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021F1344
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1338

	thumb_func_start ov101_021F1364
ov101_021F1364: ; 0x021F1364
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	cmp r2, #0
	beq _021F13AE
	ldrb r0, [r5, #5]
	mov r6, #0
	cmp r0, #0
	ble _021F13C6
	add r4, r5, #0
_021F1378:
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetVisibleFlag
	cmp r7, r6
	bne _021F1396
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #7
	bl Sprite_SetAnimCtrlSeq
	b _021F13A2
_021F1396:
	mov r0, #0xf5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	bl Sprite_SetAnimCtrlSeq
_021F13A2:
	ldrb r0, [r5, #5]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _021F1378
	pop {r3, r4, r5, r6, r7, pc}
_021F13AE:
	mov r4, #0
	mov r6, #0xf5
	add r7, r4, #0
	lsl r6, r6, #2
_021F13B6:
	ldr r0, [r5, r6]
	add r1, r7, #0
	bl Sprite_SetVisibleFlag
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _021F13B6
_021F13C6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F1364

	thumb_func_start ov101_021F13C8
ov101_021F13C8: ; 0x021F13C8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	ldrb r2, [r4, #6]
	bne _021F13F2
	mov r1, #0xfe
	bic r2, r1
	strb r2, [r4, #6]
	mov r1, #0xff
	mov r2, #0
	bl ov101_021F1364
	add r0, r4, #0
	bl ov101_021F1808
	ldrb r1, [r4, #1]
	add r0, r4, #0
	mov r2, #1
	bl ov101_021F1290
	pop {r4, pc}
_021F13F2:
	mov r1, #0xfe
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r4, #6]
	ldrb r1, [r4, #1]
	mov r2, #1
	bl ov101_021F1364
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F13C8

	thumb_func_start ov101_021F1408
ov101_021F1408: ; 0x021F1408
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r1, [r5, #7]
	lsl r2, r1, #0x1f
	lsr r2, r2, #0x1f
	beq _021F141E
	bl ov101_021F1D44
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F141E:
	lsl r2, r1, #0x18
	lsr r2, r2, #0x1b
	beq _021F143C
	mov r0, #0xf8
	bic r1, r0
	sub r0, r2, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5, #7]
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F143C:
	ldrb r6, [r5, #3]
	ldrb r1, [r5, #1]
	ldr r7, _021F1558 ; =gSystem
	mov r3, #1
	add r1, r6, r1
	lsl r1, r1, #0x18
	ldr r2, [r7, #0x48]
	lsr r4, r1, #0x18
	add r1, r2, #0
	tst r1, r3
	beq _021F146E
	strb r4, [r5, #2]
	str r3, [sp]
	ldrb r1, [r5, #1]
	ldrb r2, [r5, #2]
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov101_021F1A40
	ldr r0, _021F155C ; =0x00000941
	bl PlaySE
	ldrb r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
_021F146E:
	ldr r3, [r7, #0x4c]
	mov r0, #0x40
	add r1, r3, #0
	tst r1, r0
	beq _021F14BC
	cmp r4, #0
	bne _021F1480
	sub r0, #0x41
	pop {r3, r4, r5, r6, r7, pc}
_021F1480:
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _021F149E
	cmp r4, #0
	beq _021F1498
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1B94
_021F1498:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F149E:
	sub r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1290
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F14BC:
	mov r0, #0x80
	add r1, r3, #0
	tst r1, r0
	beq _021F1510
	ldrb r1, [r5]
	sub r1, r1, #1
	cmp r4, r1
	blt _021F14D0
	sub r0, #0x81
	pop {r3, r4, r5, r6, r7, pc}
_021F14D0:
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #5
	bne _021F14F2
	ldrb r0, [r5]
	sub r0, r0, #1
	cmp r4, r0
	bge _021F14EC
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1B94
_021F14EC:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F14F2:
	add r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1290
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
_021F1510:
	mov r0, #0x20
	tst r0, r2
	beq _021F152E
	cmp r6, #0
	beq _021F1528
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1C98
_021F1528:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F152E:
	mov r0, #0x10
	add r1, r2, #0
	tst r1, r0
	beq _021F1552
	ldrb r0, [r5]
	add r1, r6, #6
	cmp r1, r0
	bge _021F154C
	ldr r0, _021F1560 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1C98
_021F154C:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021F1552:
	sub r0, #0x11
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F1558: .word gSystem
_021F155C: .word 0x00000941
_021F1560: .word 0x0000093F
	thumb_func_end ov101_021F1408

	thumb_func_start ov101_021F1564
ov101_021F1564: ; 0x021F1564
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r1, [r5, #7]
	lsl r2, r1, #0x1f
	lsr r2, r2, #0x1f
	beq _021F157A
	bl ov101_021F1D44
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F157A:
	lsl r0, r1, #0x18
	lsr r2, r0, #0x1b
	beq _021F1598
	mov r0, #0xf8
	bic r1, r0
	sub r0, r2, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r5, #7]
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F1598:
	ldrb r2, [r5, #3]
	ldrb r0, [r5, #1]
	ldr r3, _021F16A0 ; =gSystem
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r1, [r3, #0x48]
	mov r0, #1
	tst r0, r1
	beq _021F15B0
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_021F15B0:
	mov r0, #2
	tst r0, r1
	beq _021F15BA
	ldrb r0, [r5, #2]
	pop {r4, r5, r6, pc}
_021F15BA:
	ldr r6, [r3, #0x4c]
	mov r0, #0x40
	add r3, r6, #0
	tst r3, r0
	beq _021F1608
	cmp r4, #0
	bne _021F15CC
	sub r0, #0x41
	pop {r4, r5, r6, pc}
_021F15CC:
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #0
	bne _021F15EA
	cmp r4, #0
	beq _021F15E4
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1B94
_021F15E4:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F15EA:
	sub r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1364
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r4, r5, r6, pc}
_021F1608:
	mov r0, #0x80
	add r3, r6, #0
	tst r3, r0
	beq _021F165C
	ldrb r1, [r5]
	sub r1, r1, #1
	cmp r4, r1
	blt _021F161C
	sub r0, #0x81
	pop {r4, r5, r6, pc}
_021F161C:
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	ldrb r0, [r5, #1]
	cmp r0, #5
	bne _021F163E
	ldrb r0, [r5]
	sub r0, r0, #1
	cmp r4, r0
	bge _021F1638
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1B94
_021F1638:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F163E:
	add r0, r0, #1
	strb r0, [r5, #1]
	ldrb r1, [r5, #1]
	add r0, r5, #0
	mov r2, #1
	bl ov101_021F1364
	ldrb r1, [r5, #7]
	mov r0, #0xf8
	bic r1, r0
	mov r0, #0x10
	orr r1, r0
	strb r1, [r5, #7]
	sub r0, #0x11
	pop {r4, r5, r6, pc}
_021F165C:
	mov r0, #0x20
	tst r0, r1
	beq _021F167A
	cmp r2, #0
	beq _021F1674
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1C98
_021F1674:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F167A:
	mov r0, #0x10
	tst r1, r0
	beq _021F169C
	ldrb r0, [r5]
	add r1, r2, #6
	cmp r1, r0
	bge _021F1696
	ldr r0, _021F16A4 ; =0x0000093F
	bl PlaySE
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1C98
_021F1696:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F169C:
	sub r0, #0x11
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F16A0: .word gSystem
_021F16A4: .word 0x0000093F
	thumb_func_end ov101_021F1564

	thumb_func_start ov101_021F16A8
ov101_021F16A8: ; 0x021F16A8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r1, [r4, #7]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021F16C2
	bl ov101_021F1D44
	mov r0, #0
	add sp, #4
	mvn r0, r0
	pop {r3, r4, pc}
_021F16C2:
	ldr r0, _021F175C ; =ov101_021F8634
	bl TouchscreenHitbox_FindRectAtTouchNew
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _021F16D6
	add sp, #4
	add r0, r1, #0
	pop {r3, r4, pc}
_021F16D6:
	cmp r0, #6
	bge _021F1714
	ldrb r1, [r4, #5]
	cmp r0, r1
	bge _021F1714
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	mov r3, #1
	add r0, r1, r0
	strb r0, [r4, #2]
	str r3, [sp]
	ldrb r1, [r4, #1]
	ldrb r2, [r4, #2]
	add r0, r4, #0
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov101_021F1A40
	ldrb r1, [r4, #1]
	add r0, r4, #0
	mov r2, #1
	bl ov101_021F1290
	ldr r0, _021F1760 ; =0x00000941
	bl PlaySE
	ldrb r0, [r4, #2]
	add sp, #4
	add r0, r0, #1
	pop {r3, r4, pc}
_021F1714:
	cmp r0, #6
	bne _021F1732
	ldrb r1, [r4, #3]
	cmp r1, #0
	beq _021F1732
	add r0, r4, #0
	mov r1, #1
	bl ov101_021F1C98
	ldr r0, _021F1764 ; =0x0000093F
	bl PlaySE
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_021F1732:
	cmp r0, #7
	bne _021F1754
	ldrb r0, [r4, #3]
	add r1, r0, #6
	ldrb r0, [r4]
	cmp r1, r0
	bge _021F1754
	add r0, r4, #0
	mov r1, #0
	bl ov101_021F1C98
	ldr r0, _021F1764 ; =0x0000093F
	bl PlaySE
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_021F1754:
	mov r0, #0
	mvn r0, r0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021F175C: .word ov101_021F8634
_021F1760: .word 0x00000941
_021F1764: .word 0x0000093F
	thumb_func_end ov101_021F16A8

	thumb_func_start ov101_021F1768
ov101_021F1768: ; 0x021F1768
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldrb r1, [r5, #7]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021F1780
	bl ov101_021F1D44
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_021F1780:
	ldr r0, _021F17F8 ; =ov101_021F8658
	bl TouchscreenHitbox_FindRectAtTouchNew
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021F17F4
	cmp r4, #6
	bge _021F17AC
	ldrb r0, [r5, #5]
	cmp r4, r0
	bge _021F17AC
	ldr r0, _021F17FC ; =0x00000941
	strb r4, [r5, #1]
	bl PlaySE
	mov r0, #1
	str r0, [r6]
	ldrb r0, [r5, #3]
	add r0, r0, r4
	pop {r4, r5, r6, pc}
_021F17AC:
	cmp r4, #6
	bne _021F17CC
	ldrb r0, [r5, #3]
	cmp r0, #0
	beq _021F17CC
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F1C98
	ldr r0, _021F1800 ; =0x0000093F
	bl PlaySE
	mov r0, #1
	str r0, [r6]
	sub r0, r0, #2
	pop {r4, r5, r6, pc}
_021F17CC:
	cmp r4, #7
	bne _021F17F0
	ldrb r0, [r5, #3]
	add r1, r0, #6
	ldrb r0, [r5]
	cmp r1, r0
	bge _021F17F0
	add r0, r5, #0
	mov r1, #0
	bl ov101_021F1C98
	ldr r0, _021F1800 ; =0x0000093F
	bl PlaySE
	mov r0, #1
	str r0, [r6]
	sub r0, r0, #2
	pop {r4, r5, r6, pc}
_021F17F0:
	mov r0, #0
	mvn r0, r0
_021F17F4:
	pop {r4, r5, r6, pc}
	nop
_021F17F8: .word ov101_021F8658
_021F17FC: .word 0x00000941
_021F1800: .word 0x0000093F
	thumb_func_end ov101_021F1768

	thumb_func_start ov101_021F1804
ov101_021F1804: ; 0x021F1804
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end ov101_021F1804

	thumb_func_start ov101_021F1808
ov101_021F1808: ; 0x021F1808
	push {r3, lr}
	ldrb r2, [r0, #2]
	mov r1, #0xff
	strb r1, [r0, #2]
	ldrb r3, [r0, #3]
	cmp r2, r3
	blo _021F182E
	ldrb r1, [r0, #4]
	cmp r1, r2
	blo _021F182E
	mov r1, #1
	str r1, [sp]
	sub r1, r2, r3
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r3, #0
	bl ov101_021F1A40
_021F182E:
	pop {r3, pc}
	thumb_func_end ov101_021F1808

	thumb_func_start ov101_021F1830
ov101_021F1830: ; 0x021F1830
	mov r2, #0
	strb r2, [r0]
	mov r1, #0xff
	strb r1, [r0, #1]
	str r2, [r0, #8]
	str r2, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F1830

	thumb_func_start ov101_021F1840
ov101_021F1840: ; 0x021F1840
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	add r0, #0xdc
	str r6, [r0]
	add r0, r5, #0
	add r0, #0xdc
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xd8
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xcd
	ldrb r0, [r0]
	cmp r0, #0
	ble _021F18C4
	add r7, r6, #0
_021F1862:
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	add r4, r0, r7
	str r0, [sp]
	add r0, r4, #0
	bl ov101_021F1830
	ldr r0, [sp]
	strb r6, [r0, r7]
	add r0, r5, #0
	add r0, #0xd0
	ldr r0, [r0]
	ldrb r0, [r0, r6]
	strb r0, [r4, #1]
	add r0, r5, #0
	add r0, #0xd8
	ldr r0, [r0]
	cmp r0, #0
	bne _021F1890
	add r0, r5, #0
	add r0, #0xd8
	str r4, [r0]
_021F1890:
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	cmp r0, #0
	bne _021F18A0
	add r0, r5, #0
	add r0, #0xdc
	str r4, [r0]
_021F18A0:
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r6, r6, #1
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	add r7, #0xc
	str r4, [r0, #8]
	add r0, r5, #0
	add r0, #0xdc
	str r4, [r0]
	add r0, r5, #0
	add r0, #0xcd
	ldrb r0, [r0]
	cmp r6, r0
	blt _021F1862
_021F18C4:
	add r0, r5, #0
	add r0, #0xd8
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0xdc
	ldr r0, [r0]
	str r1, [r0, #8]
	add r0, r5, #0
	add r0, #0xdc
	add r5, #0xd8
	ldr r1, [r0]
	ldr r0, [r5]
	str r1, [r0, #4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F1840

	thumb_func_start ov101_021F18E0
ov101_021F18E0: ; 0x021F18E0
	mov r1, #0
	strb r1, [r0]
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov101_021F18E0

	thumb_func_start ov101_021F18E8
ov101_021F18E8: ; 0x021F18E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0xe5
	mov r4, #0x1c
	mul r4, r2
	lsl r1, r1, #2
	add r7, r3, #0
	add r3, r5, r1
	add r4, r3, r4
	mov r2, #0x18
	add r3, r0, #0
	mul r3, r2
	lsl r0, r3, #0x18
	lsr r6, r0, #0x18
	mov r0, #0xd8
	str r0, [sp]
	str r2, [sp, #4]
	sub r0, r1, #4
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #0
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #0x52
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	ldrb r1, [r4, #1]
	ldr r0, [r5, r0]
	mov r2, #8
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #0x7e
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	ldrb r1, [r4, #6]
	ldr r0, [r5, r0]
	mov r2, #0x5a
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	add r3, r6, #1
	lsl r3, r3, #0x10
	ldrb r1, [r4, #0xb]
	ldr r0, [r5, r0]
	mov r2, #1
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #8
	add r3, r6, #0
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	add r3, r6, #0
	lsl r0, r0, #4
	add r3, #9
	lsl r3, r3, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #9
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	add r3, r6, #0
	lsl r0, r0, #4
	add r3, #0xd
	lsl r3, r3, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #9
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x39
	lsl r0, r0, #4
	add r6, #0x11
	lsl r3, r6, #0x10
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, r0]
	mov r2, #9
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
	cmp r7, #0
	beq _021F19DE
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl CopyWindowToVram
_021F19DE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F18E8

	thumb_func_start ov101_021F19E4
ov101_021F19E4: ; 0x021F19E4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrb r0, [r6, #6]
	mov r4, #0
	mov r7, #1
	lsl r0, r0, #0x1f
	lsr r5, r0, #0x1f
_021F19F2:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	add r2, r5, #0
	mov r3, #0
	bl ov101_021F18E8
	add r0, r5, #0
	eor r0, r7
	lsl r0, r0, #0x18
	add r4, r4, #1
	lsr r5, r0, #0x18
	cmp r4, #8
	blt _021F19F2
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F19E4

	thumb_func_start ov101_021F1A10
ov101_021F1A10: ; 0x021F1A10
	ldrb r0, [r0, #6]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F1A2E
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r1, r2, r1
	mov r0, #1
	sub r0, r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
_021F1A2E:
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end ov101_021F1A10

	thumb_func_start ov101_021F1A40
ov101_021F1A40: ; 0x021F1A40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp, #0x10]
	add r7, r2, #0
	mov r2, #0xc
	add r5, r0, #0
	str r3, [sp, #0x14]
	add r3, r5, #0
	add r3, #0xc
	mul r2, r7
	add r4, r3, r2
	bl ov101_021F1A10
	add r2, r0, #0
	mov r0, #0xe5
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x1c
	mul r0, r2
	add r6, r1, r0
	ldr r1, [sp, #0x10]
	add r0, r5, #0
	mov r3, #0
	bl ov101_021F18E8
	ldr r0, [sp, #0x10]
	mov r1, #0x18
	mul r1, r0
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _021F1A88
	ldrb r0, [r5, #2]
	cmp r7, r0
	bne _021F1ADE
_021F1A88:
	mov r0, #0xff
	add r7, r1, #2
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetName
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x14]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x10
	bl AddTextPrinterParameterizedWithColor
	mov r0, #0xff
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetClass
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x18]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x39
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x5e
	bl AddTextPrinterParameterizedWithColor
	b _021F1B32
_021F1ADE:
	mov r0, #0xff
	add r7, r1, #2
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetName
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0xc]
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x10
	bl AddTextPrinterParameterizedWithColor
	mov r0, #0xff
	lsl r0, r0, #2
	ldrb r1, [r4, #8]
	ldr r0, [r5, r0]
	bl PhoneContact_GetClass
	add r2, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [r6, #0x10]
	mov r1, #0
	str r0, [sp, #8]
	mov r0, #0x39
	str r1, [sp, #0xc]
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r3, #0x5e
	bl AddTextPrinterParameterizedWithColor
_021F1B32:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _021F1B42
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl CopyWindowToVram
_021F1B42:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1A40

	thumb_func_start ov101_021F1B48
ov101_021F1B48: ; 0x021F1B48
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _021F1B60
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetVisibleFlag
	b _021F1B6C
_021F1B60:
	mov r0, #0xf3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl Sprite_SetVisibleFlag
_021F1B6C:
	ldrb r0, [r4, #3]
	add r1, r0, #6
	ldrb r0, [r4]
	cmp r1, r0
	bge _021F1B84
	mov r0, #0x3d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl Sprite_SetVisibleFlag
	pop {r4, pc}
_021F1B84:
	mov r0, #0x3d
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl Sprite_SetVisibleFlag
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1B48

	thumb_func_start ov101_021F1B94
ov101_021F1B94: ; 0x021F1B94
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	beq _021F1BC0
	ldrb r1, [r4, #3]
	cmp r1, #1
	bhs _021F1BA6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F1BA6:
	sub r1, r1, #1
	strb r1, [r4, #3]
	mov r1, #1
	str r1, [sp]
	mov r1, #0
	ldrb r2, [r4, #3]
	add r3, r1, #0
	bl ov101_021F1A40
	ldrb r0, [r4, #4]
	sub r0, r0, #1
	strb r0, [r4, #4]
	b _021F1BE6
_021F1BC0:
	ldrb r1, [r4]
	ldrb r2, [r4, #4]
	sub r1, r1, #1
	cmp r2, r1
	blt _021F1BCE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F1BCE:
	add r1, r2, #1
	strb r1, [r4, #4]
	mov r1, #1
	str r1, [sp]
	ldrb r2, [r4, #4]
	mov r1, #7
	mov r3, #0
	bl ov101_021F1A40
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
_021F1BE6:
	ldrb r1, [r4, #7]
	mov r0, #0xf8
	mov r2, #1
	bic r1, r0
	strb r1, [r4, #7]
	ldrb r1, [r4, #7]
	mov r0, #2
	bic r1, r0
	lsl r0, r5, #0x1f
	lsr r0, r0, #0x1e
	orr r0, r1
	strb r0, [r4, #7]
	ldrb r0, [r4, #7]
	mov r1, #1
	bic r0, r2
	orr r0, r1
	strb r0, [r4, #7]
	ldr r0, _021F1C30 ; =0x00000404
	ldr r0, [r4, r0]
	strb r1, [r0]
	ldrb r3, [r4, #6]
	add r0, r3, #0
	bic r0, r2
	lsl r2, r3, #0x1f
	lsr r2, r2, #0x1f
	eor r2, r1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	and r1, r2
	orr r0, r1
	strb r0, [r4, #6]
	add r0, r4, #0
	bl ov101_021F1B48
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021F1C30: .word 0x00000404
	thumb_func_end ov101_021F1B94

	thumb_func_start ov101_021F1C34
ov101_021F1C34: ; 0x021F1C34
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #7]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F1C52
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	mov r2, #8
	mov r3, #0
	bl ScrollWindow
	b _021F1C62
_021F1C52:
	mov r0, #0x39
	lsl r0, r0, #4
	mov r1, #0
	ldr r0, [r4, r0]
	mov r2, #8
	add r3, r1, #0
	bl ScrollWindow
_021F1C62:
	mov r0, #0x39
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl CopyWindowToVram
	ldrb r0, [r4, #7]
	mov r2, #0xf8
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1b
	add r3, r1, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1b
	bic r0, r2
	lsr r3, r3, #0x18
	orr r0, r3
	strb r0, [r4, #7]
	cmp r1, #2
	blo _021F1C92
	ldrb r0, [r4, #7]
	bic r0, r2
	strb r0, [r4, #7]
	mov r0, #1
	pop {r4, pc}
_021F1C92:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1C34

	thumb_func_start ov101_021F1C98
ov101_021F1C98: ; 0x021F1C98
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrb r3, [r4, #8]
	mov r2, #0x70
	bic r3, r2
	strb r3, [r4, #8]
	ldrb r3, [r4, #7]
	mov r2, #4
	orr r2, r3
	strb r2, [r4, #7]
	ldrb r3, [r4, #7]
	mov r2, #2
	bic r3, r2
	lsl r2, r1, #0x1f
	lsr r2, r2, #0x1e
	orr r2, r3
	strb r2, [r4, #7]
	ldrb r5, [r4, #7]
	mov r2, #1
	mov r3, #1
	bic r5, r2
	add r2, r5, #0
	orr r2, r3
	strb r2, [r4, #7]
	ldr r2, _021F1CE4 ; =0x00000404
	ldr r2, [r4, r2]
	strb r3, [r2]
	bl ov101_021F1B94
	cmp r0, #0
	bne _021F1CDE
	ldrb r1, [r4, #8]
	mov r0, #0x80
	orr r0, r1
	strb r0, [r4, #8]
_021F1CDE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F1CE4: .word 0x00000404
	thumb_func_end ov101_021F1C98

	thumb_func_start ov101_021F1CE8
ov101_021F1CE8: ; 0x021F1CE8
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F1C34
	cmp r0, #0
	bne _021F1CF8
	mov r0, #0
	pop {r4, pc}
_021F1CF8:
	ldrb r1, [r4, #8]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x1f
	bne _021F1D2A
	lsl r0, r1, #0x19
	mov r2, #0x70
	lsr r0, r0, #0x1d
	bic r1, r2
	add r2, r0, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x19
	orr r1, r2
	strb r1, [r4, #8]
	cmp r0, #5
	bhs _021F1D2A
	ldrb r1, [r4, #7]
	add r0, r4, #0
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	bl ov101_021F1B94
	cmp r0, #0
	bne _021F1D3E
_021F1D2A:
	ldrb r1, [r4, #8]
	mov r0, #0x70
	bic r1, r0
	strb r1, [r4, #8]
	ldrb r1, [r4, #7]
	mov r0, #4
	bic r1, r0
	strb r1, [r4, #7]
	mov r0, #1
	pop {r4, pc}
_021F1D3E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F1CE8

	thumb_func_start ov101_021F1D44
ov101_021F1D44: ; 0x021F1D44
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #7]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _021F1D56
	bl ov101_021F1CE8
	b _021F1D5A
_021F1D56:
	bl ov101_021F1C34
_021F1D5A:
	cmp r0, #0
	beq _021F1D6E
	ldr r0, _021F1D70 ; =0x00000404
	mov r1, #0
	ldr r0, [r4, r0]
	strb r1, [r0]
	ldrb r1, [r4, #7]
	mov r0, #1
	bic r1, r0
	strb r1, [r4, #7]
_021F1D6E:
	pop {r4, pc}
	.balign 4, 0
_021F1D70: .word 0x00000404
	thumb_func_end ov101_021F1D44

	// Gendered phone call?
	thumb_func_start ov101_021F1D74
ov101_021F1D74: ; 0x021F1D74
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0xdc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xdc
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r5]
	bl AllocAndReadPhoneBook
	add r1, r4, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r0, #4]
	add r0, r4, #0
	add r0, #0x84
	str r1, [r0]
	ldr r0, [r5, #0xc]
	str r0, [r4, #4]
	ldr r0, [r5, #4]
	str r0, [r4, #0x3c]
	ldr r0, [r5, #8]
	str r0, [r4, #0x40]
	ldr r0, [r5, #0x10]
	str r0, [r4, #8]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x1c]
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x20]
	str r0, [r4, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x2c]
	str r0, [r4, #0x28]
	ldr r0, [r5, #0x30]
	str r0, [r4, #0x2c]
	ldrh r0, [r5, #0x34]
	strh r0, [r4, #0x30]
	ldrh r0, [r5, #0x36]
	add r5, #0x38
	strh r0, [r4, #0x32]
	add r0, r4, #0
	ldrb r1, [r5]
	add r0, #0x34
	strb r1, [r0]
	ldr r0, [r4, #0x24]
	bl PlayerProfile_GetTrainerGender
	add r1, r4, #0
	add r1, #0x36
	strb r0, [r1]
	mov r1, #0x1b
	add r2, r1, #0
	ldr r3, [r4]
	mov r0, #0
	add r2, #0xf4 // NARC_msg_msg_0271_bin
	bl NewMsgDataFromNarc
	str r0, [r4, #0x44]
	mov r2, #0xa
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #6 // NARC_msg_msg_0640_bin
	bl NewMsgDataFromNarc
	str r0, [r4, #0x48]
	ldr r2, [r4]
	mov r0, #0x10
	mov r1, #0x25
	bl MessageFormat_New_Custom
	str r0, [r4, #0x50]
	ldr r0, _021F1E7C ; =0x00000439
	ldr r1, [r4]
	bl String_New
	str r0, [r4, #0x54]
	ldr r0, _021F1E7C ; =0x00000439
	ldr r1, [r4]
	bl String_New
	str r0, [r4, #0x64]
	ldr r1, [r4]
	mov r0, #0x10
	bl String_New
	str r0, [r4, #0x58]
	ldr r1, [r4]
	mov r0, #0x2c
	bl String_New
	str r0, [r4, #0x5c]
	ldr r0, [r4, #0x44]
	mov r1, #msg_0271_00029
	bl NewString_ReadMsgData
	str r0, [r4, #0x60]
	mov r6, #0
	add r5, r4, #0
_021F1E58:
	add r1, r6, #0
	ldr r0, [r4, #0x44]
	add r1, #msg_0271_00030
	bl NewString_ReadMsgData
	str r0, [r5, #0x68]
	add r1, r6, #0
	ldr r0, [r4, #0x44]
	add r1, #msg_0271_00033
	bl NewString_ReadMsgData
	str r0, [r5, #0x74]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _021F1E58
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F1E7C: .word 0x00000439
	thumb_func_end ov101_021F1D74

	thumb_func_start ov101_021F1E80
ov101_021F1E80: ; 0x021F1E80
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_021F1E88:
	ldr r0, [r5, #0x68]
	bl String_Delete
	ldr r0, [r5, #0x74]
	bl String_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #3
	blt _021F1E88
	ldr r0, [r6, #0x60]
	bl String_Delete
	ldr r0, [r6, #0x5c]
	bl String_Delete
	ldr r0, [r6, #0x58]
	bl String_Delete
	ldr r0, [r6, #0x64]
	bl String_Delete
	ldr r0, [r6, #0x54]
	bl String_Delete
	ldr r0, [r6, #0x50]
	bl MessageFormat_Delete
	ldr r0, [r6, #0x48]
	bl DestroyMsgData
	ldr r0, [r6, #0x44]
	bl DestroyMsgData
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FreePhoneBook
	add r0, r6, #0
	mov r1, #0
	mov r2, #0xdc
	bl MI_CpuFill8
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F1E80

	thumb_func_start PhoneContact_GetName
PhoneContact_GetName: ; 0x021F1EE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #NUM_PHONE_CONTACTS
	blo _021F1EF2
	mov r1, #0
_021F1EF2:
	add r0, r1, #0
	bl GetPhoneMessageGmm
	add r2, r0, #0
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	ldr r2, [r5, #0x58]
	add r4, r0, #0
	mov r1, #0
	bl ReadMsgDataIntoString
	add r0, r4, #0
	bl DestroyMsgData
	ldr r0, [r5, #0x58]
	pop {r3, r4, r5, pc}
	thumb_func_end PhoneContact_GetName

	thumb_func_start PhoneContact_GetClass
PhoneContact_GetClass: ; 0x021F1F18
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #NUM_PHONE_CONTACTS
	blo _021F1F22
	mov r1, #0
_021F1F22:
	add r0, r4, #0
	add r0, #0x84
	ldr r2, [r0]
	mov r0, #0x14
	mul r0, r1
	add r0, r2, r0
	ldrb r2, [r0, #3]
	cmp r2, #0xc8
	bne _021F1F3C
	ldr r0, [r4, #0x5c]
	bl String_SetEmpty
	b _021F1F60
_021F1F3C:
	cmp r2, #0xc9
	blo _021F1F4E
	sub r2, #0xa3
	add r1, r2, #0
	ldr r0, [r4, #0x44]
	ldr r2, [r4, #0x5c]
	bl ReadMsgDataIntoString
	b _021F1F60
_021F1F4E:
	ldr r0, [r4, #0x50]
	mov r1, #0
	bl BufferTrainerClassName
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0x60]
	bl StringExpandPlaceholders
_021F1F60:
	ldr r0, [r4, #0x5c]
	pop {r4, pc}
	thumb_func_end PhoneContact_GetClass

	thumb_func_start PhoneCall_CheckMapPermissionAndGetTimeOfDay
PhoneCall_CheckMapPermissionAndGetTimeOfDay: ; 0x021F1F64
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	add r6, r1, #0
	add r7, r2, #0
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x54
	str r3, [sp]
	bl MI_CpuFill8
	cmp r6, #NUM_PHONE_CONTACTS
	blo _021F1F8C
	bl GF_AssertFail
	mov r0, #0xff
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1F8C:
	cmp r7, #0
	ldrh r0, [r5, #0x30]
	beq _021F1FA2
	bl MapHeader_GetField14_1E
	cmp r0, #0
	bne _021F1FB2
	mov r0, #0xff
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1FA2:
	bl MapHeader_GetField14_1D
	cmp r0, #0
	bne _021F1FB2
	mov r0, #0xff
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F1FB2:
	strb r6, [r4, #0x18]
	add r5, #0x84
	mov r0, #0x14
	ldr r1, [r5]
	mul r0, r6
	add r0, r1, r0
	str r0, [r4, #0x10]
	strb r7, [r4, #0x19]
	ldr r0, [sp]
	add r1, r4, #0
	strb r0, [r4, #0x1a]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	add r1, #0x38
	strh r0, [r4, #0x1c]
	ldrb r0, [r4, #0x19]
	str r0, [r4]
	add r0, r4, #0
	add r0, #0x28
	bl GF_RTC_CopyDateTime
	ldr r0, [r4, #0x38]
	bl GF_RTC_GetTimeOfDayWildParamByHour
	add r1, r4, #0
	add r1, #0x23
	strb r0, [r1]
	mov r0, #0
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x1e]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end PhoneCall_CheckMapPermissionAndGetTimeOfDay

	thumb_func_start PhoneCall_GetCallScriptId
PhoneCall_GetCallScriptId: ; 0x021F1FF4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r4, r5, #0
	mov r1, #0
	add r4, #0x88
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0xc]
	bl ScheduleWindowCopyToVram
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #1]
	cmp r0, #0xf
	bhi _021F20F2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F201E: ; jump table
	.short _021F203E - _021F201E - 2 ; case 0
	.short _021F204A - _021F201E - 2 ; case 1
	.short _021F2056 - _021F201E - 2 ; case 2
	.short _021F2062 - _021F201E - 2 ; case 3
	.short _021F20B6 - _021F201E - 2 ; case 4
	.short _021F206E - _021F201E - 2 ; case 5
	.short _021F20CE - _021F201E - 2 ; case 6
	.short _021F207A - _021F201E - 2 ; case 7
	.short _021F2092 - _021F201E - 2 ; case 8
	.short _021F2086 - _021F201E - 2 ; case 9
	.short _021F209E - _021F201E - 2 ; case 10
	.short _021F20AA - _021F201E - 2 ; case 11
	.short _021F20C2 - _021F201E - 2 ; case 12
	.short _021F20DA - _021F201E - 2 ; case 13
	.short _021F20E6 - _021F201E - 2 ; case 14
	.short _021F20F2 - _021F201E - 2 ; case 15
_021F203E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2B80
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F204A:
	add r0, r5, #0
	add r1, r4, #0
	bl PhoneCall_GetCallScriptId_Mother
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2056:
	add r0, r5, #0
	add r1, r4, #0
	bl PhoneCall_GetCallScriptId_ProfElm
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2062:
	add r0, r5, #0
	add r1, r4, #0
	bl PhoneCall_GetCallScriptId_ProfOak
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F206E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3518
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F207A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F35C4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2086:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F388C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F2092:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F36F4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F209E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3AA4
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20AA:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3C8C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20B6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F342C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20C2:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3EA8
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20CE:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F3530
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20DA:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F410C
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20E6:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F4274
	strh r0, [r4, #0x1e]
	b _021F20F8
_021F20F2:
	mov r0, #0
	strh r0, [r4, #0x20]
	strh r0, [r4, #0x1e]
_021F20F8:
	ldrh r0, [r4, #0x20]
	cmp r0, #2
	bhi _021F210A
	ldrh r1, [r4, #0x1e]
	mov r0, #6
	ldr r2, _021F210C ; =sPhoneCallScriptDef
	mul r0, r1
	add r0, r2, r0
	str r0, [r4, #0x14]
_021F210A:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F210C: .word sPhoneCallScriptDef
	thumb_func_end PhoneCall_GetCallScriptId

	thumb_func_start ov101_021F2110
ov101_021F2110: ; 0x021F2110
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	add r0, #0xa0
	ldrb r0, [r0]
	bl GetPhoneMessageGmm
	add r2, r0, #0
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x24]
	mov r1, #0
	bl BufferPlayersName
	add r1, r4, #0
	add r1, #0xa0
	ldrb r1, [r1]
	add r0, r4, #0
	bl PhoneContact_GetName
	mov r1, #1
	str r1, [sp]
	mov r3, #2
	str r3, [sp, #4]
	add r2, r0, #0
	ldr r0, [r4, #0x50]
	bl BufferString
	ldrh r0, [r4, #0x30]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	ldr r0, [r4, #0x50]
	mov r1, #2
	bl BufferLandmarkName
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	ldr r0, [r4, #0x50]
	mov r1, #3
	bl BufferLandmarkName
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov101_021F2110

	thumb_func_start ov101_021F217C
ov101_021F217C: ; 0x021F217C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021F219C ; =ov101_021F8400
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #0
	beq _021F2198
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl Sprite_SetAnimActiveFlag
	ldr r0, [r4, #0x40]
	bl Sprite_ResetAnimCtrlState
_021F2198:
	pop {r4, pc}
	nop
_021F219C: .word ov101_021F8400
	thumb_func_end ov101_021F217C

	thumb_func_start PhoneCallMessagePrint
PhoneCallMessagePrint: ; 0x021F21A0
	// r0: PhoneCallData
	// r1: MsgData
	// r2: MsgIDs
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	add r1, #0x36
	ldrb r1, [r1]
	ldrb r1, [r2, r1]
	ldr r2, [r4, #0x64]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	ldr r1, [r4, #0x54]
	ldr r2, [r4, #0x64]
	bl StringExpandPlaceholders
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl FillWindowPixelBuffer
	mov r1, #0
	add r0, r4, #0
	str r1, [sp]
	add r0, #0x34
	ldrb r0, [r0]
	add r3, r1, #0
	str r0, [sp, #4]
	ldr r0, _021F21EC ; =0x00010200
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r4, #0xc]
	ldr r2, [r4, #0x54]
	bl AddTextPrinterParameterizedWithColor
	add r4, #0x35
	strb r0, [r4]
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021F21EC: .word 0x00010200
	thumb_func_end PhoneCallMessagePrint

	thumb_func_start PhoneCallMessagePrint_Gendered
PhoneCallMessagePrint_Gendered: ; 0x021F21F0
	push {r4, lr}
	add r4, r0, #0
	add r4, #0x37
	strb r2, [r4]
	add r2, r0, #0
	add r2, #0x38
	strb r3, [r2]
	add r2, r0, #0
	add r2, #0x37
	bl PhoneCallMessagePrint
	pop {r4, pc}
	thumb_func_end PhoneCallMessagePrint_Gendered

	thumb_func_start PhoneCallMessagePrint_Ungendered
PhoneCallMessagePrint_Ungendered: ; 0x021F2208
	add r3, r0, #0
	add r3, #0x37
	strb r2, [r3]
	add r3, r0, #0
	add r3, #0x38
	strb r2, [r3]
	add r2, r0, #0
	ldr r3, _021F221C ; =PhoneCallMessagePrint
	add r2, #0x37
	bx r3
	.balign 4, 0
_021F221C: .word PhoneCallMessagePrint
	thumb_func_end PhoneCallMessagePrint_Ungendered

	thumb_func_start ov101_021F2220
ov101_021F2220: ; 0x021F2220
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F217C
	add r0, r4, #0
	add r0, #0x35
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	beq _021F223A
	mov r0, #0
	pop {r4, pc}
_021F223A:
	bl TextFlags_GetIsTouchSpeedingUpPrint
	add r4, #0xaa
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2220

	thumb_func_start ov101_021F2248
ov101_021F2248: ; 0x021F2248
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	add r4, r0, #0
	ldrh r0, [r5, #2]
	add r6, r4, #0
	add r6, #0x88
	lsl r1, r0, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #5
	bhi _021F2304
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F226A: ; jump table
	.short _021F2304 - _021F226A - 2 ; case 0
	.short _021F22BC - _021F226A - 2 ; case 1
	.short _021F22BC - _021F226A - 2 ; case 2
	.short _021F2276 - _021F226A - 2 ; case 3
	.short _021F2284 - _021F226A - 2 ; case 4
	.short _021F22D8 - _021F226A - 2 ; case 5
_021F2276:
	ldrb r1, [r6, #0x18]
	ldr r0, [r4, #0x20]
	mov r2, #1
	bl PhoneRematches_SetSeeking
	add sp, #8
	pop {r4, r5, r6, pc}
_021F2284:
	ldrh r2, [r5, #4]
	cmp r2, #0x95
	bne _021F229C
	bl MTRandom
	mov r1, #0xa
	bl _u32_div_f
	add r1, #0x95
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	b _021F22B0
_021F229C:
	cmp r2, #4
	bne _021F22B0
	bl MTRandom
	mov r1, #3
	bl _u32_div_f
	add r0, r1, #2
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_021F22B0:
	ldrb r1, [r6, #0x18]
	ldr r0, [r4, #0x20]
	bl PhoneRematches_GiftItemIdSet
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22BC:
	lsl r0, r0, #0x10
	lsr r0, r0, #0x14
	ldr r0, [r4, #0x28]
	beq _021F22CE
	ldrh r1, [r5, #4]
	bl Save_VarsFlags_SetFlagInArray
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22CE:
	ldrh r1, [r5, #4]
	bl Save_VarsFlags_ClearFlagInArray
	add sp, #8
	pop {r4, r5, r6, pc}
_021F22D8:
	bl LCRandom
	ldrh r1, [r5, #2]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x14
	bl _s32_div_f
	ldrh r2, [r5, #4]
	ldr r0, [r4, #0x4c]
	add r1, r2, r1
	ldr r2, [r4, #0x54]
	bl ReadMsgDataIntoString
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x54]
	mov r1, #4
	bl BufferString
_021F2304:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2248

	thumb_func_start ov101_021F2308
ov101_021F2308: ; 0x021F2308
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	mov r1, #2
	mov r2, #1
	bl ov101_021F0ACC
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, r4, #0
	bl ov101_021F09B0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0x40]
	mov r1, #0
	bl Sprite_SetVisibleFlag
	add r0, r5, #0
	mov r1, #1
	bl ov101_021F2384
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2308

	thumb_func_start ov101_021F2338
ov101_021F2338: ; 0x021F2338
	ldr r3, _021F2340 ; =TouchscreenListMenu_HandleInput
	ldr r0, [r0, #0x14]
	bx r3
	nop
_021F2340: .word TouchscreenListMenu_HandleInput
	thumb_func_end ov101_021F2338

	thumb_func_start ov101_021F2344
ov101_021F2344: ; 0x021F2344
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	bl TouchscreenListMenu_WasLastInputTouch
	ldr r1, [r4, #0x3c]
	str r0, [r1]
	ldr r0, [r4, #0x14]
	bl TouchscreenListMenu_Destroy
	mov r1, #0
	ldr r0, [r4, #4]
	add r2, r1, #0
	bl ov101_021F0ACC
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl Sprite_SetVisibleFlag
	add r0, r4, #0
	mov r1, #0
	bl ov101_021F2384
	pop {r4, pc}
	thumb_func_end ov101_021F2344

	thumb_func_start ov101_021F2374
ov101_021F2374: ; 0x021F2374
	mov r1, #6
	ldr r2, _021F2380 ; =sPhoneCallScriptDef
	mul r1, r0
	add r0, r2, r1
	bx lr
	nop
_021F2380: .word sPhoneCallScriptDef
	thumb_func_end ov101_021F2374

	thumb_func_start ov101_021F2384
ov101_021F2384: ; 0x021F2384
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	cmp r1, #0
	beq _021F23B0
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r2, #0x10
	ldr r0, [r4, #0x18]
	add r3, r2, #0
	bl PaletteData_BlendPalette
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [r4, #0x18]
	mov r2, #0xa0
	mov r3, #0x10
	bl PaletteData_BlendPalette
	b _021F23D4
_021F23B0:
	mov r0, #8
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	mov r2, #0x10
	ldr r0, [r4, #0x18]
	add r3, r2, #0
	bl PaletteData_BlendPalette
	mov r0, #8
	str r0, [sp]
	mov r1, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x18]
	mov r2, #0xa0
	mov r3, #0x10
	bl PaletteData_BlendPalette
_021F23D4:
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl PaletteData_SetAutoTransparent
	ldr r0, [r4, #0x18]
	bl PaletteData_PushTransparentBuffers
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl PaletteData_SetAutoTransparent
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2384

	thumb_func_start ov101_021F23F0
ov101_021F23F0: ; 0x021F23F0
	push {r4, lr}
	add r4, r0, #0
	bl ov101_021F217C
	ldr r0, _021F2430 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _021F2412
	ldr r0, _021F2434 ; =0x000005DC
	bl PlaySE
	mov r0, #0
	add r4, #0xaa
	strb r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021F2412:
	ldr r0, _021F2438 ; =ov101_021F8400
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #0
	beq _021F242A
	ldr r0, _021F2434 ; =0x000005DC
	bl PlaySE
	mov r0, #1
	add r4, #0xaa
	strb r0, [r4]
	pop {r4, pc}
_021F242A:
	mov r0, #0
	pop {r4, pc}
	nop
_021F2430: .word gSystem
_021F2434: .word 0x000005DC
_021F2438: .word ov101_021F8400
	thumb_func_end ov101_021F23F0

	thumb_func_start ov101_021F243C
ov101_021F243C: ; 0x021F243C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bne _021F2450
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl FillWindowPixelBuffer
_021F2450:
	cmp r6, #0
	ldr r0, _021F2490 ; =0x00010200
	bne _021F2472
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r4, #2
	str r1, [sp, #0xc]
	add r2, r5, r2
	ldr r0, [r5, #0xc]
	ldr r2, [r2, #0x68]
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021F2472:
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	lsl r2, r4, #2
	str r1, [sp, #0xc]
	add r2, r5, r2
	ldr r0, [r5, #0xc]
	ldr r2, [r2, #0x74]
	add r3, r1, #0
	bl AddTextPrinterParameterizedWithColor
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_021F2490: .word 0x00010200
	thumb_func_end ov101_021F243C

	thumb_func_start ov101_021F2494
ov101_021F2494: ; 0x021F2494
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021F24B0
	cmp r0, #1
	beq _021F24C6
	cmp r0, #2
	beq _021F24EA
	b _021F2500
_021F24B0:
	ldr r0, _021F250C ; =0x00000878
	bl PlaySE
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F2500
_021F24C6:
	ldr r0, _021F250C ; =0x00000878
	bl IsSEPlaying
	cmp r0, #0
	beq _021F24D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F24D4:
	ldr r0, _021F250C ; =0x00000878
	bl PlaySE
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F2500
_021F24EA:
	ldr r0, _021F250C ; =0x00000878
	bl IsSEPlaying
	cmp r0, #0
	beq _021F24F8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F24F8:
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2500:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F250C: .word 0x00000878
	thumb_func_end ov101_021F2494

	thumb_func_start ov101_021F2510
ov101_021F2510: ; 0x021F2510
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021F258A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F252E: ; jump table
	.short _021F2536 - _021F252E - 2 ; case 0
	.short _021F2550 - _021F252E - 2 ; case 1
	.short _021F2550 - _021F252E - 2 ; case 2
	.short _021F2572 - _021F252E - 2 ; case 3
_021F2536:
	ldr r0, _021F2594 ; =0x0000087A
	bl PlaySE
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov101_021F243C
	mov r0, #0
	strh r0, [r4, #0x24]
	b _021F258A
_021F2550:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F255E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F255E:
	mov r0, #0
	strh r0, [r4, #0x24]
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F258A
_021F2572:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F2580
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2580:
	mov r0, #0
	strh r0, [r4, #0x24]
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F258A:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F2594: .word 0x0000087A
	thumb_func_end ov101_021F2510

	thumb_func_start ov101_021F2598
ov101_021F2598: ; 0x021F2598
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r2, [r4, #8]
	cmp r2, #3
	bhi _021F2608
	add r0, r2, r2
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F25B6: ; jump table
	.short _021F25BE - _021F25B6 - 2 ; case 0
	.short _021F25D0 - _021F25B6 - 2 ; case 1
	.short _021F25D0 - _021F25B6 - 2 ; case 2
	.short _021F25F0 - _021F25B6 - 2 ; case 3
_021F25BE:
	lsl r2, r2, #0x18
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov101_021F243C
	mov r0, #0
	strh r0, [r4, #0x24]
	b _021F2608
_021F25D0:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F25DE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F25DE:
	mov r1, #0
	strh r1, [r4, #0x24]
	ldr r2, [r4, #8]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl ov101_021F243C
	b _021F2608
_021F25F0:
	ldrh r1, [r4, #0x24]
	add r0, r1, #1
	strh r0, [r4, #0x24]
	cmp r1, #0xa
	bhs _021F25FE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F25FE:
	mov r0, #0
	strh r0, [r4, #0x24]
	str r0, [r4, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2608:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2598

	thumb_func_start ov101_021F2614
ov101_021F2614: ; 0x021F2614
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	bl ov101_021F217C
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021F262C
	cmp r0, #1
	beq _021F265C
	b _021F2672
_021F262C:
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldrb r1, [r4, #0x19]
	lsl r2, r0, #1
	mov r0, #6
	mul r0, r1
	add r0, r2, r0
	ldr r1, [r4, #0x10]
	lsl r0, r0, #0x10
	ldrb r2, [r1, #0xc]
	lsr r3, r0, #0x10
	mov r1, #0xc
	ldr r0, _021F267C ; =ov101_021F962C
	mul r1, r2
	add r6, r0, r1
	ldrb r2, [r6, r3]
	add r3, r3, #1
	ldrb r3, [r6, r3]
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl PhoneCallMessagePrint_Gendered
	b _021F2672
_021F265C:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F266A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F266A:
	mov r0, #0
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F2672:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F267C: .word ov101_021F962C
	thumb_func_end ov101_021F2614

	thumb_func_start ov101_021F2680
ov101_021F2680: ; 0x021F2680
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	ldr r6, [r4, #0x14]
	cmp r1, #3
	bhi _021F26EC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F269C: ; jump table
	.short _021F26A4 - _021F269C - 2 ; case 0
	.short _021F26C0 - _021F269C - 2 ; case 1
	.short _021F26CC - _021F269C - 2 ; case 2
	.short _021F26D6 - _021F269C - 2 ; case 3
_021F26A4:
	bl ov101_021F2110
	add r0, r5, #0
	add r1, r6, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F26EC
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021F26EC
_021F26C0:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F26EC
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F26CC:
	ldr r1, [r5, #0x4c]
	add r2, r6, #0
	bl PhoneCallMessagePrint
	b _021F26EC
_021F26D6:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F26E2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F26E2:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F26EC:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2680

	thumb_func_start ov101_021F26F8
ov101_021F26F8: ; 0x021F26F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x88
	mov r3, #1
	add r4, r5, #0
	ldr r1, [r1]
	lsl r3, r3, #8
	add r4, #0x88
	cmp r1, r3
	bgt _021F2732
	bge _021F279C
	cmp r1, #3
	bgt _021F272C
	cmp r1, #0
	blt _021F27D4
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_021F2724: ; jump table
	.short _021F2744 - _021F2724 - 2 ; case 0
	.short _021F2750 - _021F2724 - 2 ; case 1
	.short _021F276E - _021F2724 - 2 ; case 2
	.short _021F277A - _021F2724 - 2 ; case 3
_021F272C:
	cmp r1, #0xff
	beq _021F278E
	b _021F27D4
_021F2732:
	add r2, r3, #1
	cmp r1, r2
	bgt _021F273C
	beq _021F27B4
	b _021F27D4
_021F273C:
	add r2, r3, #2
	cmp r1, r2
	beq _021F27C0
	b _021F27D4
_021F2744:
	bl ov101_021F2494
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2750:
	ldrh r1, [r4, #0x20]
	lsl r2, r1, #2
	ldr r1, _021F27E0 ; =ov101_021F867C
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _021F2762
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2762:
	add r0, r4, #0
	add r0, #0x22
	ldrb r1, [r0]
	ldr r0, [r5, #0x3c]
	str r1, [r0]
	b _021F27D4
_021F276E:
	bl ov101_021F23F0
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F277A:
	bl ov101_021F2510
	cmp r0, #0
	bne _021F2786
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2786:
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F278E:
	add r0, r5, #0
	bl ov101_021F2598
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F279C:
	bl ov101_021F2510
	cmp r0, #0
	bne _021F27A8
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F27A8:
	ldr r1, [r5, #0x44]
	add r0, r5, #0
	mov r2, #0x25
	bl PhoneCallMessagePrint_Ungendered
	b _021F27D4
_021F27B4:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F27D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F27C0:
	bl ov101_021F23F0
	cmp r0, #0
	bne _021F27CC
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F27CC:
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F27D4:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F27E0: .word ov101_021F867C
	thumb_func_end ov101_021F26F8

	thumb_func_start PhoneCall_GetCallScriptId_Mother
PhoneCall_GetCallScriptId_Mother: ; 0x021F27E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrb r1, [r4, #0x1a]
	cmp r1, #2
	bne _021F2804
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #4
	strh r0, [r4, #0x20]
	mov r0, #0  // Bank call
	pop {r3, r4, r5, pc}
_021F2804:
	ldr r1, [r4, #0x10]
	ldrh r2, [r1, #6]
	ldrh r1, [r5, #0x30]
	cmp r2, r1
	bne _021F2812
	mov r0, #0x17  // Hello? {STRVAR_1 3, 0, 0}?\rI’ve gotten so used to hearing your\nvoice, but you almost sound like\fa different person on the phone.\fIt’s so strange...
	pop {r3, r4, r5, pc}
_021F2812:
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _021F281E
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]  // Whatever was queued up before
	pop {r3, r4, r5, pc}
_021F281E:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_GAVE_RIVAL_NAME_TO_OFFICER
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F282E
	mov r0, #0x19  // Hello?\rOh, hi, {STRVAR_1 3, 0, 0}!\nSo, how goes the errand you’re\fhelping Professor Elm with?\rI know you’re determined. You’ll be OK!
	pop {r3, r4, r5, pc}
_021F282E:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_TALKED_TO_MOM_AFTER_NAMING_RIVAL
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F283E
	mov r0, #0x1a  // Hello?\rHi, {STRVAR_1 3, 0, 0}! If you’re done with\nyour errand, come on home, dear.
	pop {r3, r4, r5, pc}
_021F283E:
	mov r0, #4
	strh r0, [r4, #0x20]
	mov r0, #0  // Bank call
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end PhoneCall_GetCallScriptId_Mother

	thumb_func_start GearPhoneCall_Mom
GearPhoneCall_Mom: ; 0x021F2848
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #4
	bls _021F285A
	b _021F29BE
_021F285A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F2866: ; jump table
	.short _021F2870 - _021F2866 - 2 ; case 0
	.short _021F28FC - _021F2866 - 2 ; case 1
	.short _021F292A - _021F2866 - 2 ; case 2
	.short _021F2940 - _021F2866 - 2 ; case 3
	.short _021F2958 - _021F2866 - 2 ; case 4
_021F2870:
	bl ov101_021F2110
	mov r1, #0
	ldr r0, [r5, #0x20]
	add r2, r1, #0
	bl MomSavingsBalanceAction
	str r0, [r4, #0x44]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	ldr r2, [r4, #0x44]
	mov r1, #0xa
	mov r3, #6
	bl BufferIntegerAsString
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_MomsSavingsFlagCheck
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r0, [r5, #0x20]
	bl sub_0202F240
	add r1, r4, #0
	add r1, #0x4d
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r1]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F28E4
	mov r0, #2
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F28E4:
	add r0, r5, #0
	add r1, r4, #0
	bl MomCallGetIntroMsgByLocation
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F29DA
_021F28FC:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F290A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F290A:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F29DA
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #msg_0664_00021
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F292A:
	add r1, r4, #0
	bl MomCallGetSaveMoneyPromptMsg
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F29DA
_021F2940:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F294E
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F294E:
	add r0, r5, #0
	mov r1, #2
	bl ov101_021F2308
	b _021F29DA
_021F2958:
	bl ov101_021F2338
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021F296C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F296C:
	add r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	bne _021F2992
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #2
	mov r2, #msg_0664_00025
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint_Ungendered
	b _021F29AC
_021F2992:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #2
	mov r2, #msg_0664_00026
	bic r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint_Ungendered
_021F29AC:
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	ldr r0, [r5, #0x28]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	bl Save_VarsFlags_MomsSavingsFlagAction
	b _021F29DA
_021F29BE:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F29CE
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F29CE:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F29DA:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end GearPhoneCall_Mom

	thumb_func_start MomCallGetIntroMsgByLocation
MomCallGetIntroMsgByLocation: ; 0x021F29E8
	push {r3, lr}
	ldrh r0, [r0, #0x30]
	bl MapHeader_GetMomCallIntroParam
	add r0, r0, #msg_0664_00007
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	thumb_func_end MomCallGetIntroMsgByLocation

	thumb_func_start MomCallGetSaveMoneyPromptMsg
MomCallGetSaveMoneyPromptMsg: ; 0x021F29F8
	ldrb r0, [r1, #0x1a]
	cmp r0, #2
	bne _021F2A02
	mov r0, #0x16
	bx lr
_021F2A02:
	add r0, r1, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	ldr r0, [r1, #0x44]
	beq _021F2A1C
	cmp r0, #0
	beq _021F2A18
	mov r0, #msg_0664_00023
	bx lr
_021F2A18:
	mov r0, #msg_0664_00027
	bx lr
_021F2A1C:
	cmp r0, #0
	beq _021F2A24
	mov r0, #msg_0664_00024
	bx lr
_021F2A24:
	mov r0, #msg_0664_00028
	bx lr
	thumb_func_end MomCallGetSaveMoneyPromptMsg

	thumb_func_start PhoneCall_GetCallScriptId_ProfElm
PhoneCall_GetCallScriptId_ProfElm: ; 0x021F2A28
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F2A48
	ldrh r0, [r4, #0x1c]
	lsl r1, r0, #1
	ldr r0, _021F2B70 ; =sPhoneCallData_ProfElm_MapScripts
	ldrb r0, [r0, r1]
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	lsl r1, r0, #1
	ldr r0, _021F2B74 ; =sPhoneCallData_ProfElm_MapScripts + 1
	ldrb r0, [r0, r1]
	pop {r3, r4, r5, r6, r7, pc}
_021F2A48:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F2A56
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrh r0, [r4, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
_021F2A56:
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x24]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F2A72
	mov r0, #1  // Hello, {STRVAR_1 3, 0, 0}?\rWhat’s wrong?\nIf you’re nearby, you should come talk\fin person!
	pop {r3, r4, r5, r6, r7, pc}
_021F2A72:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_GOT_ELMS_PANIC_CALL
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2A82
	mov r0, #8  // Hello, {STRVAR_1 3, 0, 0}?\rTry not to overdo it.\nBe sure to heal your Pokémon if they\fare hurt.
	pop {r3, r4, r5, r6, r7, pc}
_021F2A82:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_GAVE_RIVAL_NAME_TO_OFFICER
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2A92
	mov r0, #9  // Oh, {STRVAR_1 3, 0, 0}...\rI just stepped away for a second...\nHow could...?
	pop {r3, r4, r5, r6, r7, pc}
_021F2A92:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_GOT_PICK_UP_EGG_CALL_FROM_ELM
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2AA2
	mov r0, #0xa  // Hello, {STRVAR_1 3, 0, 0}?\rWe’re checking the Egg now. It does\nappear to be a Pokémon Egg.\rWe’ll do a few more tests!
	pop {r3, r4, r5, r6, r7, pc}
_021F2AA2:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_GOT_EGG_FROM_ELMS_ASSISTANT
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2AB2
	mov r0, #0xb  // Hello, {STRVAR_1 3, 0, 0}?\rDid you see my assistant? He’s at the\nPoké Mart in Violet City.\rHe’s got something very important, so\nbe sure to pick it up!
	pop {r3, r4, r5, r6, r7, pc}
_021F2AB2:
	ldr r0, [r5, #0x28]
	ldr r1, _021F2B78 ; =FLAG_SYS_HATCHED_TOGEPI_EGG
	bl Save_VarsFlags_CheckFlagInArray
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r5, #0x28]
	ldr r1, _021F2B7C ; =FLAG_GOT_EVERSTONE_FROM_ELM
	bl Save_VarsFlags_CheckFlagInArray
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r7, #7
	bhs _021F2AF6
	cmp r6, #0
	bne _021F2AD6
	mov r0, #0xc  // Hello, {STRVAR_1 3, 0, 0}?\rHow’s the Egg? Has anything changed?\rIf anything happens, please call.
	pop {r3, r4, r5, r6, r7, pc}
_021F2AD6:
	cmp r4, #0
	beq _021F2AF2
	// Randomly chooses:
	// Hello, {STRVAR_1 3, 0, 0}?\rI just made a new discovery.\rThe time it takes for an Egg to hatch\ndepends on the Pokémon.
	// Hello, {STRVAR_1 3, 0, 0}?\rIt’s still a mystery what kinds of moves\nhatched Pokémon have.\rWe’re investigating that now.
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, #0xe
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2AF2:
	mov r0, #0xd  // Hey, {STRVAR_1 3, 0, 0}, this is great news!\nA Pokémon hatched from that Egg!\rI knew that giving that Egg to you,\n{STRVAR_1 3, 0, 0}, was the right thing to\fdo. I just knew it!\rYou should come here and show me what\nkind of Pokémon it is!
	pop {r3, r4, r5, r6, r7, pc}
_021F2AF6:
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F2B04
	mov r0, #0x10  // Hello, {STRVAR_1 3, 0, 0}?\rThere’s something strange on\nthe radio.\rIs something happening in Goldenrod?
	pop {r3, r4, r5, r6, r7, pc}
_021F2B04:
	cmp r7, #8
	bhs _021F2B0C
	mov r0, #0x11  // Hello, is this {STRVAR_1 3, 0, 0}?\rJust one more Badge to go before you\ncollect all the Johto Badges!\rBlackthorn’s Gym Leader is said to be a\npretty powerful Dragon Tamer!
	pop {r3, r4, r5, r6, r7, pc}
_021F2B0C:
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	cmp r0, #0
	bne _021F2B1A
	mov r0, #0x12  // Hello, {STRVAR_1 3, 0, 0}?\nYou seem to be doing well.\rYou’ve done so well, I have nothing to\nworry about for you.\rI think you could do anything you try!
	pop {r3, r4, r5, r6, r7, pc}
_021F2B1A:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_GOT_SS_TICKET_FROM_ELM
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2B2A
	mov r0, #0x13  // Hello, {STRVAR_1 3, 0, 0}?\rI have something here for you from\nProfessor Oak.\rCould you swing by my Lab?\nSee you later!
	pop {r3, r4, r5, r6, r7, pc}
_021F2B2A:
	cmp r4, #0
	bne _021F2B3A
	cmp r6, #0
	beq _021F2B36
	mov r0, #0xd  // Hey, {STRVAR_1 3, 0, 0}, this is great news!\nA Pokémon hatched from that Egg!\rI knew that giving that Egg to you,\n{STRVAR_1 3, 0, 0}, was the right thing to\fdo. I just knew it!\rYou should come here and show me what\nkind of Pokémon it is!
	pop {r3, r4, r5, r6, r7, pc}
_021F2B36:
	mov r0, #0xc  // Hello, {STRVAR_1 3, 0, 0}?\rHow’s the Egg? Has anything changed?\rIf anything happens, please call.
	pop {r3, r4, r5, r6, r7, pc}
_021F2B3A:
	ldr r0, [r5, #0x28]
	mov r1, #FLAG_WAS_TOLD_ABOUT_POKERUS
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F2B58
	// Randomly chooses:
	// Hello, {STRVAR_1 3, 0, 0}?\rThere are so many different ways that\nPokémon evolve, aren’t there?!\rSome Pokémon don’t even evolve until\nthey meet certain conditions first!
	// Hello, {STRVAR_1 3, 0, 0}?\rI expect that there are some Pokémon\nin the Kanto region that I don’t know.\rThere are probably also methods of\nevolution that I’m not familiar with yet.\rI should use that perspective and\ndiscover what I can!
	// Hello, {STRVAR_1 3, 0, 0}?\rIt seems that Pokémon that have been\ninfected with Pokérus level up better.\fWe’re not quite sure why...
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0x14
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F2B58:
	// Randomly chooses:
	// Hello, {STRVAR_1 3, 0, 0}?\rThere are so many different ways that\nPokémon evolve, aren’t there?!\rSome Pokémon don’t even evolve until\nthey meet certain conditions first!
	// Hello, {STRVAR_1 3, 0, 0}?\rI expect that there are some Pokémon\nin the Kanto region that I don’t know.\rThere are probably also methods of\nevolution that I’m not familiar with yet.\rI should use that perspective and\ndiscover what I can!
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	add r0, #0x14
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F2B70: .word sPhoneCallData_ProfElm_MapScripts
_021F2B74: .word sPhoneCallData_ProfElm_MapScripts + 1
_021F2B78: .word FLAG_SYS_HATCHED_TOGEPI_EGG
_021F2B7C: .word FLAG_GOT_EVERSTONE_FROM_ELM
	thumb_func_end PhoneCall_GetCallScriptId_ProfElm

	thumb_func_start ov101_021F2B80
ov101_021F2B80: ; 0x021F2B80
	push {r3, r4, r5, lr}
	mov r2, #0
	strh r2, [r1, #0x20]
	ldrb r2, [r1, #0x18]
	ldr r3, _021F2BBC ; =ov101_021F968C
	lsl r4, r2, #4
	mov r2, #6
	mul r2, r4
	ldrb r4, [r1, #0x19]
	cmp r4, #0
	beq _021F2BA2
	add r1, r3, r2
	add r1, #0x30
	mov r2, #8
	bl ov101_021F2BC0
	pop {r3, r4, r5, pc}
_021F2BA2:
	ldr r5, [r1, #0x10]
	ldrh r1, [r0, #0x30]
	ldrh r4, [r5, #6]
	cmp r4, r1
	bne _021F2BB0
	ldrh r0, [r5, #0xa]
	pop {r3, r4, r5, pc}
_021F2BB0:
	add r1, r3, r2
	mov r2, #8
	bl ov101_021F2BC0
	pop {r3, r4, r5, pc}
	nop
_021F2BBC: .word ov101_021F968C
	thumb_func_end ov101_021F2B80

	thumb_func_start ov101_021F2BC0
ov101_021F2BC0: ; 0x021F2BC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r0, [sp]
	add r0, #0x88
	add r7, r2, #0
	str r0, [sp]
	add r4, r1, #0
	mov r6, #0
	cmp r7, #0
	ble _021F2C5C
_021F2BD4:
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _021F2C5C
	cmp r0, #0
	beq _021F2C5C
	cmp r0, #8
	bhi _021F2C3C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F2BEE: ; jump table
	.short _021F2C3C - _021F2BEE - 2 ; case 0
	.short _021F2C3C - _021F2BEE - 2 ; case 1
	.short _021F2C00 - _021F2BEE - 2 ; case 2
	.short _021F2C1E - _021F2BEE - 2 ; case 3
	.short _021F2C28 - _021F2BEE - 2 ; case 4
	.short _021F2C32 - _021F2BEE - 2 ; case 5
	.short _021F2C3C - _021F2BEE - 2 ; case 6
	.short _021F2C0A - _021F2BEE - 2 ; case 7
	.short _021F2C14 - _021F2BEE - 2 ; case 8
_021F2C00:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2CB8
	b _021F2C44
_021F2C0A:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2D48
	b _021F2C44
_021F2C14:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2D90
	b _021F2C44
_021F2C1E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2D10
	b _021F2C44
_021F2C28:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2DC8
	b _021F2C44
_021F2C32:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2DE8
	b _021F2C44
_021F2C3C:
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F2CAC
_021F2C44:
	cmp r0, #0
	beq _021F2C52
	ldrh r1, [r4, #2]
	ldr r0, [sp]
	strh r1, [r0, #0x20]
	ldrh r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_021F2C52:
	add r6, r6, #1
	add r1, r4, #0
	add r4, r4, #6
	cmp r6, r7
	blt _021F2BD4
_021F2C5C:
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _021F2C66
	cmp r0, #0
	bne _021F2C6E
_021F2C66:
	ldr r1, [sp]
	mov r0, #0
	strh r0, [r1, #0x20]
	pop {r3, r4, r5, r6, r7, pc}
_021F2C6E:
	ldrh r2, [r1, #2]
	ldr r0, [sp]
	strh r2, [r0, #0x20]
	ldrh r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F2BC0

	thumb_func_start ov101_021F2C78
ov101_021F2C78: ; 0x021F2C78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl MTRandom
	add r5, r0, #0
	bl MTRandom
	add r2, r5, #0
	eor r2, r0
	lsl r0, r2, #0x10
	lsr r1, r0, #0x10
	asr r0, r2, #8
	eor r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	bgt _021F2CA8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2CA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2C78

	thumb_func_start ov101_021F2CAC
ov101_021F2CAC: ; 0x021F2CAC
	ldr r3, _021F2CB4 ; =ov101_021F2C78
	ldrb r0, [r1, #1]
	bx r3
	nop
_021F2CB4: .word ov101_021F2C78
	thumb_func_end ov101_021F2CAC

	thumb_func_start ov101_021F2CB8
ov101_021F2CB8: ; 0x021F2CB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r5, #0
	add r6, #0x88
	add r4, r1, #0
	ldrb r1, [r6, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	beq _021F2CD2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2CD2:
	ldrb r1, [r6, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_GiftItemIdGet
	cmp r0, #0
	beq _021F2CE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2CE2:
	ldr r0, [r5, #0x28]
	mov r1, #0xc6
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2D08
	ldrh r0, [r4, #2]
	cmp r0, #0
	bne _021F2D08
	ldrh r0, [r4, #4]
	bl ov101_021F2374
	ldrh r0, [r0, #2]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	cmp r0, #3
	bne _021F2D08
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D08:
	ldrb r0, [r4, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2CB8

	thumb_func_start ov101_021F2D10
ov101_021F2D10: ; 0x021F2D10
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	ldr r0, [r0, #0x28]
	mov r1, #0xc6
	add r4, #0x88
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2D28
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2D28:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x34]
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bne _021F2D3C
	add r4, #0x23
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	cmp r1, r0
	beq _021F2D40
_021F2D3C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2D40:
	ldrb r0, [r5, #1]
	bl ov101_021F2C78
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2D10

	thumb_func_start ov101_021F2D48
ov101_021F2D48: ; 0x021F2D48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	add r6, r1, #0
	add r4, r5, #0
	mov r1, #0xc6
	add r4, #0x88
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F2D62
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D62:
	ldr r0, [r4, #0x10]
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _021F2D78
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_CheckBugContestFlag
	cmp r0, #0
	beq _021F2D78
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D78:
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	bne _021F2D88
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2D88:
	ldrb r0, [r6, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2D48

	thumb_func_start ov101_021F2D90
ov101_021F2D90: ; 0x021F2D90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r0, [r4, #0x10]
	add r6, r1, #0
	ldrh r0, [r0, #6]
	cmp r0, #0x60
	bne _021F2DB0
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_CheckBugContestFlag
	cmp r0, #0
	beq _021F2DB0
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2DB0:
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_GiftItemIdGet
	cmp r0, #0
	bne _021F2DC0
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F2DC0:
	ldrb r0, [r6, #1]
	bl ov101_021F2C78
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F2D90

	thumb_func_start ov101_021F2DC8
ov101_021F2DC8: ; 0x021F2DC8
	push {r3, lr}
	add r0, #0xbc
	ldr r0, [r0]
	cmp r0, #2
	beq _021F2DDA
	cmp r0, #4
	beq _021F2DDA
	cmp r0, #6
	bne _021F2DE2
_021F2DDA:
	ldrb r0, [r1, #1]
	bl ov101_021F2C78
	pop {r3, pc}
_021F2DE2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2DC8

	thumb_func_start ov101_021F2DE8
ov101_021F2DE8: ; 0x021F2DE8
	push {r4, lr}
	ldr r0, [r0, #0x28]
	add r4, r1, #0
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F2DFE
	ldrb r0, [r4, #1]
	bl ov101_021F2C78
	pop {r4, pc}
_021F2DFE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2DE8

	thumb_func_start ov101_021F2E04
ov101_021F2E04: ; 0x021F2E04
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc4
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	bne _021F2E1C
	add sp, #0xc4
	mov r0, #SPECIES_RATTATA
	pop {r3, r4, r5, r6, pc}
_021F2E1C:
	add r0, sp, #0
	add r1, r6, #0
	bl WildEncounters_ReadFromNarc
	cmp r5, #0xb
	bne _021F2E4A
	cmp r4, #2
	bne _021F2E34
	add r0, sp, #0xc0
	ldrh r1, [r0] // swarmSpecies[3]
	add r0, sp, #0x80
	strh r1, [r0, #0x22] // goodRodSlots[3].species
_021F2E34:
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r0, sp, #0x94 // goodRodSlots
	lsl r1, r1, #2
	add r0, #2
	add sp, #0xc4
	ldrh r0, [r0, r1]
	pop {r3, r4, r5, r6, pc}
_021F2E4A:
	cmp r4, #0
	beq _021F2E60
	cmp r4, #1
	beq _021F2E58
	cmp r4, #2
	beq _021F2E5C
	b _021F2E60
_021F2E58:
	add r4, sp, #0x2c // landSlots.species_day
	b _021F2E62
_021F2E5C:
	add r4, sp, #0x44 // landSlots.species_nite
	b _021F2E62
_021F2E60:
	add r4, sp, #0x14 // landSlots.species_morn
_021F2E62:
	bl LCRandom
	mov r1, #0xc
	bl _s32_div_f
	lsl r0, r1, #1
	ldrh r0, [r4, r0]
	add sp, #0xc4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov101_021F2E04

	thumb_func_start ov101_021F2E74
ov101_021F2E74: ; 0x021F2E74
	push {r3, r4, r5, lr}
	sub sp, #0x40
	add r4, r1, #0
	add r1, sp, #0xc
	add r5, r0, #0
	bl TrainerData_ReadTrData
	add r0, r4, #0
	mov r1, #0x6c
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x6c
	bl MI_CpuFill8
	add r0, r5, #0
	add r1, r4, #0
	bl TrainerData_ReadTrPoke
	add r1, sp, #0
	ldrb r0, [r1, #0xc]
	cmp r0, #3
	bhi _021F2F28
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021F2EB0: ; jump table
	.short _021F2EB8 - _021F2EB0 - 2 ; case 0
	.short _021F2ED4 - _021F2EB0 - 2 ; case 1
	.short _021F2EF0 - _021F2EB0 - 2 ; case 2
	.short _021F2F0C - _021F2EB0 - 2 ; case 3
_021F2EB8:
	ldrb r5, [r1, #0xf]
	mov r2, #0
	cmp r5, #0
	ble _021F2F34
	add r1, r4, #0
	add r3, sp, #0
_021F2EC4:
	ldrh r0, [r1, #4]
	add r2, r2, #1
	add r1, #8
	strh r0, [r3]
	add r3, r3, #2
	cmp r2, r5
	blt _021F2EC4
	b _021F2F34
_021F2ED4:
	ldrb r3, [r1, #0xf]
	mov r5, #0
	cmp r3, #0
	ble _021F2F34
	add r1, r4, #0
	add r2, sp, #0
_021F2EE0:
	ldrh r0, [r1, #4]
	add r5, r5, #1
	add r1, #0x10
	strh r0, [r2]
	add r2, r2, #2
	cmp r5, r3
	blt _021F2EE0
	b _021F2F34
_021F2EF0:
	ldrb r3, [r1, #0xf]
	mov r5, #0
	cmp r3, #0
	ble _021F2F34
	add r1, r4, #0
	add r2, sp, #0
_021F2EFC:
	ldrh r0, [r1, #4]
	add r5, r5, #1
	add r1, #0xa
	strh r0, [r2]
	add r2, r2, #2
	cmp r5, r3
	blt _021F2EFC
	b _021F2F34
_021F2F0C:
	ldrb r3, [r1, #0xf]
	mov r5, #0
	cmp r3, #0
	ble _021F2F34
	add r1, r4, #0
	add r2, sp, #0
_021F2F18:
	ldrh r0, [r1, #4]
	add r5, r5, #1
	add r1, #0x12
	strh r0, [r2]
	add r2, r2, #2
	cmp r5, r3
	blt _021F2F18
	b _021F2F34
_021F2F28:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x40
	mov r0, #0x13
	pop {r3, r4, r5, pc}
_021F2F34:
	add r0, r4, #0
	bl FreeToHeap
	bl LCRandom
	add r1, sp, #0
	ldrb r1, [r1, #0xf]
	bl _s32_div_f
	lsl r1, r1, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	add sp, #0x40
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F2E74

	thumb_func_start ov101_021F2F50
ov101_021F2F50: ; 0x021F2F50
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F2F68
	cmp r1, #1
	beq _021F2FB8
	cmp r1, #2
	beq _021F2FC4
	b _021F2FDA
_021F2F68:
	bl ov101_021F2110
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	add r1, r0, #0
	add r0, r5, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	ldrh r0, [r0, #4]
	bl ov101_021F2E74
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferSpeciesName
	ldr r1, [r4, #0x10]
	add r2, r4, #0
	add r2, #0x23
	ldrh r0, [r1, #6]
	ldrb r1, [r1, #3]
	ldrb r2, [r2]
	bl ov101_021F2E04
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	bl BufferSpeciesName
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F2FF0
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021F2FF0
_021F2FB8:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F2FF0
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2FC4:
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	add r3, r0, #0
	ldrb r2, [r3]
	ldrb r3, [r3, #1]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint_Gendered
	b _021F2FF0
_021F2FDA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F2FE6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F2FE6:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F2FF0:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2F50

	thumb_func_start ov101_021F2FFC
ov101_021F2FFC: ; 0x021F2FFC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r6, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3014
	cmp r1, #1
	beq _021F3036
	cmp r1, #2
	beq _021F3042
	b _021F308A
_021F3014:
	bl ov101_021F2110
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	add r1, r0, #0
	add r0, r6, #0
	bl ov101_021F2248
	ldr r0, [r4, #0x10]
	ldrb r0, [r0, #0xc]
	cmp r0, #0xff
	bne _021F30A0
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _021F30A0
_021F3036:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F30A0
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3042:
	bl LCRandom
	mov r1, #0xb
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r5, r0, #0x18
	ldrh r0, [r4, #0x1e]
	bl ov101_021F2374
	ldrb r3, [r0, #1]
	ldrb r2, [r0]
	cmp r2, r3
	bne _021F306E
	add r2, r2, r5
	lsl r2, r2, #0x18
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F30A0
_021F306E:
	lsl r0, r5, #0x19
	lsr r5, r0, #0x18
	add r3, r3, r5
	add r2, r2, r5
	add r3, r3, #1
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
	b _021F30A0
_021F308A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3096
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3096:
	ldr r0, [r6, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F30A0:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F2FFC

	thumb_func_start PhoneCall_GetCallScriptId_ProfOak
PhoneCall_GetCallScriptId_ProfOak: ; 0x021F30AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x1c]
	bl Save_Pokedex_Get
	ldrb r1, [r4, #0x1a]
	add r6, r0, #0
	cmp r1, #2
	bne _021F30CC
	mov r0, #0
	strh r0, [r4, #0x20]
	mov r0, #0x52  // scripted call for rock climb gift
	pop {r4, r5, r6, pc}
_021F30CC:
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _021F30F4
	bl Pokedex_CountNationalDexOwned
	mov r1, #0x32
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bne _021F30E6
	mov r0, #1
	b _021F30EC
_021F30E6:
	cmp r0, #9
	bls _021F30EC
	mov r0, #9
_021F30EC:
	add r0, #0x44
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
_021F30F4:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3102
	mov r0, #0x44
	pop {r4, r5, r6, pc}
_021F3102:
	ldr r0, [r5, #0x28]
	ldr r1, _021F3134 ; =FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F3112
	mov r0, #0x51
	pop {r4, r5, r6, pc}
_021F3112:
	add r0, r6, #0
	bl Pokedex_GetNatDexFlag
	cmp r0, #0
	bne _021F312C
	ldr r0, [r5, #0x28]
	ldr r1, _021F3138 ; =FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F312C
	mov r0, #0x50
	pop {r4, r5, r6, pc}
_021F312C:
	mov r0, #5
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F3134: .word FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION
_021F3138: .word FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	thumb_func_end PhoneCall_GetCallScriptId_ProfOak

	thumb_func_start ov101_021F313C
ov101_021F313C: ; 0x021F313C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #5
	bls _021F314E
	b _021F33E8
_021F314E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F315A: ; jump table
	.short _021F3166 - _021F315A - 2 ; case 0
	.short _021F31E0 - _021F315A - 2 ; case 1
	.short _021F31FA - _021F315A - 2 ; case 2
	.short _021F3250 - _021F315A - 2 ; case 3
	.short _021F332E - _021F315A - 2 ; case 4
	.short _021F33C0 - _021F315A - 2 ; case 5
_021F3166:
	bl ov101_021F2110
	ldr r0, [r5, #0x1c]
	bl Save_Pokedex_Get
	add r6, r0, #0
	bl Pokedex_GetNatDexFlag
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r6, #0
	bl Pokedex_JohtoDexIsComplete
	add r1, r4, #0
	add r1, #0x4d
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r1]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	add r0, r6, #0
	bl Pokedex_NationalDexIsComplete
	add r1, r4, #0
	add r1, #0x4d
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r1]
	mov r2, #4
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	str r6, [r4, #0x50]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xd
	mov r3, #0xe
	bl PhoneCallMessagePrint_Gendered
	b _021F3418
_021F31E0:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F31EE
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F31EE:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xf
	bl PhoneCallMessagePrint_Ungendered
	b _021F3418
_021F31FA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3208
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F3208:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021F3234
	ldr r0, [r5, #0x28]
	ldr r1, _021F3424 ; =FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F322A
	add r0, r4, #0
	mov r1, #2
	add r0, #0x4a
	strb r1, [r0]
	b _021F323C
_021F322A:
	add r0, r4, #0
	mov r1, #1
	add r0, #0x4a
	strb r1, [r0]
	b _021F323C
_021F3234:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x4a
	strb r1, [r0]
_021F323C:
	add r1, r4, #0
	add r1, #0x4a
	ldrb r1, [r1]
	add r0, r5, #0
	add r1, r1, #3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov101_021F2308
	b _021F3418
_021F3250:
	bl ov101_021F2338
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021F3264
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F3264:
	add r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	bne _021F329C
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F328A
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #8
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F328A:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #8
	bic r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F329C:
	cmp r6, #1
	bne _021F32BC
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F32BC
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #8
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	b _021F32D0
_021F32BC:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x15
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F32D0:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x50]
	bne _021F32EC
	bl Pokedex_CountJohtoDexSeen
	add r7, r0, #0
	ldr r0, [r4, #0x50]
	bl Pokedex_CountJohtoDexOwned
	b _021F32F8
_021F32EC:
	bl Pokedex_CountNationalDexSeen
	add r7, r0, #0
	ldr r0, [r4, #0x50]
	bl Pokedex_CountNationalDexOwned
_021F32F8:
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r1, #5
	add r2, r7, #0
	mov r3, #3
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r1, #6
	add r2, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x14
	bl PhoneCallMessagePrint_Ungendered
	b _021F3418
_021F332E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F333C
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F333C:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	mov r6, #0
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x50]
	bne _021F3376
	bl Pokedex_CountJohtoOwned_ExcludeMythical
	add r1, r5, #0
	add r1, #0x36
	ldrb r1, [r1]
	add r2, sp, #8
	bl sub_0205BBD0
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F339E
	ldr r0, [r5, #0x28]
	ldr r1, _021F3424 ; =FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
	bl Save_VarsFlags_SetFlagInArray
	mov r6, #1
	b _021F339E
_021F3376:
	bl Pokedex_CountNationalOwned_ExcludeMythical
	add r1, r5, #0
	add r1, #0x36
	ldrb r1, [r1]
	add r2, sp, #8
	bl sub_0205BC78
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _021F339E
	ldr r0, [r5, #0x28]
	ldr r1, _021F3428 ; =FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION
	bl Save_VarsFlags_SetFlagInArray
	mov r6, #1
_021F339E:
	add r0, sp, #8
	ldrh r0, [r0]
	bl PlayFanfare
	lsl r2, r7, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	cmp r6, #0
	beq _021F3418
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33C0:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F33CE
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33CE:
	bl IsFanfarePlaying
	cmp r0, #0
	beq _021F33DC
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33DC:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x15
	bl PhoneCallMessagePrint_Ungendered
	b _021F3418
_021F33E8:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F33F8
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F33F8:
	ldr r0, [r4, #4]
	cmp r0, #0xff
	bne _021F340C
	bl IsFanfarePlaying
	cmp r0, #0
	beq _021F340C
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_021F340C:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F3418:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F3424: .word FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION
_021F3428: .word FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION
	thumb_func_end ov101_021F313C

	thumb_func_start ov101_021F342C
ov101_021F342C: ; 0x021F342C
	mov r3, #0
	strh r3, [r1, #0x20]
	ldr r2, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r2, [r2, #6]
	cmp r2, r0
	bne _021F343E
	mov r0, #0x53
	bx lr
_021F343E:
	mov r0, #0xc
	strh r0, [r1, #0x20]
	add r0, r3, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F342C

	thumb_func_start ov101_021F3448
ov101_021F3448: ; 0x021F3448
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F345E
	cmp r1, #1
	beq _021F3486
	b _021F34E8
_021F345E:
	bl ov101_021F2110
	ldr r0, [r5, #0x28]
	ldr r1, _021F3510 ; =0x00000127
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F347A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
	b _021F3502
_021F347A:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint_Ungendered
	b _021F3502
_021F3486:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3494
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F3494:
	ldr r0, [r5, #0x1c]
	bl Save_ApricornBox_Get
	add r6, r0, #0
	bl ApricornBox_GetKurtQuantity
	add r7, r0, #0
	bne _021F34A8
	mov r2, #5
	b _021F34DE
_021F34A8:
	ldr r0, [r5, #0x28]
	ldr r1, _021F3514 ; =0x00000AA2
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F34B8
	mov r2, #4
	b _021F34DE
_021F34B8:
	add r0, r6, #0
	bl ApricornBox_GetKurtBall
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferItemName
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	add r2, r7, #0
	mov r3, #2
	bl BufferIntegerAsString
	mov r2, #3
_021F34DE:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint_Ungendered
	b _021F3502
_021F34E8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F34F6
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F34F6:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F3502:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3510: .word 0x00000127
_021F3514: .word 0x00000AA2
	thumb_func_end ov101_021F3448

	thumb_func_start ov101_021F3518
ov101_021F3518: ; 0x021F3518
	mov r2, #0
	strh r2, [r1, #0x20]
	ldr r1, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r1, [r1, #6]
	cmp r1, r0
	bne _021F352A
	mov r0, #0x54
	bx lr
_021F352A:
	mov r0, #0x55
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F3518

	thumb_func_start ov101_021F3530
ov101_021F3530: ; 0x021F3530
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3548
	mov r0, #0x56
	pop {r4, r5, r6, pc}
_021F3548:
	ldr r0, [r5, #0x20]
	bl sub_0202F284
	add r1, r4, #0
	add r1, #0x4a
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bls _021F3562
	mov r0, #0x57
	pop {r4, r5, r6, pc}
_021F3562:
	bne _021F3568
	mov r0, #0x58
	pop {r4, r5, r6, pc}
_021F3568:
	ldr r0, [r5, #0x20]
	bl sub_0202F274
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	beq _021F3584
	ldr r0, [r5, #0x20]
	mov r1, #0x10
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	bne _021F3584
	mov r0, #0x57
	pop {r4, r5, r6, pc}
_021F3584:
	ldr r0, [r4, #0x38]
	bl GF_RTC_GetTimeOfDayByHour
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _021F359C
	mov r0, #0x5b
	pop {r4, r5, r6, pc}
_021F359C:
	cmp r6, #0
	bne _021F35B2
	ldr r0, [r5, #0x20]
	mov r1, #1
	bl sub_0202F254
	ldr r0, [r5, #0x20]
	mov r1, #0x10
	mov r2, #1
	bl PhoneRematches_SetSeeking
_021F35B2:
	add r4, #0x23
	ldrb r0, [r4]
	cmp r0, #1
	bne _021F35BE
	mov r0, #0x5a
	pop {r4, r5, r6, pc}
_021F35BE:
	mov r0, #0x59
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3530

	thumb_func_start ov101_021F35C4
ov101_021F35C4: ; 0x021F35C4
	ldrb r2, [r1, #0x19]
	cmp r2, #0
	beq _021F35D2
	mov r0, #0
	strh r0, [r1, #0x20]
	mov r0, #0x5d
	bx lr
_021F35D2:
	ldr r2, [r1, #0x10]
	ldrh r0, [r0, #0x30]
	ldrh r2, [r2, #6]
	cmp r2, r0
	bne _021F35E4
	mov r0, #0
	strh r0, [r1, #0x20]
	mov r0, #0x5c
	bx lr
_021F35E4:
	mov r0, #3
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
	thumb_func_end ov101_021F35C4

	thumb_func_start ov101_021F35EC
ov101_021F35EC: ; 0x021F35EC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	add r5, r4, #0
	add r5, #0x88
	ldr r1, [r5, #4]
	cmp r1, #4
	bhi _021F36E6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F3608: ; jump table
	.short _021F3612 - _021F3608 - 2 ; case 0
	.short _021F3618 - _021F3608 - 2 ; case 1
	.short _021F3634 - _021F3608 - 2 ; case 2
	.short _021F36B2 - _021F3608 - 2 ; case 3
	.short _021F36CC - _021F3608 - 2 ; case 4
_021F3612:
	bl ov101_021F2110
	b _021F36E6
_021F3618:
	bl ov101_021F2614
	cmp r0, #0
	bne _021F3626
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3626:
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	mov r2, #3
	mov r3, #4
	bl PhoneCallMessagePrint_Gendered
	b _021F36E6
_021F3634:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3642
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3642:
	ldr r0, [r4, #0x1c]
	bl SaveArray_PCStorage_Get
	add r6, r0, #0
	bl PCStorage_GetActiveBox
	add r1, r0, #0
	ldr r2, [r4, #0x54]
	add r0, r6, #0
	bl PCStorage_GetBoxName
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r4, #0x50]
	ldr r2, [r4, #0x54]
	mov r1, #0xa
	bl BufferString
	add r0, r6, #0
	bl PCStorage_CountEmptySpotsInAllBoxes
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x50]
	mov r1, #0xb
	add r2, r6, #0
	mov r3, #3
	bl BufferIntegerAsString
	cmp r6, #0
	bne _021F3696
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	mov r2, #9
	bl PhoneCallMessagePrint_Ungendered
	b _021F36E6
_021F3696:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, r2, #5
	lsl r2, r2, #0x18
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F36E6
_021F36B2:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F36C0
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F36C0:
	ldr r1, [r4, #0x4c]
	add r0, r4, #0
	mov r2, #8
	bl PhoneCallMessagePrint_Ungendered
	b _021F36E6
_021F36CC:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F36DA
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F36DA:
	ldr r0, [r4, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F36E6:
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F35EC

	thumb_func_start ov101_021F36F4
ov101_021F36F4: ; 0x021F36F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp]
	add r7, r0, #0
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0, #0x20]
	ldrb r0, [r0, #0x19]
	cmp r0, #0
	beq _021F3720
	ldr r0, [r7, #0x28]
	ldr r1, _021F3794 ; =0x00000992
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F371A
	add sp, #8
	mov r0, #0x60
	pop {r3, r4, r5, r6, r7, pc}
_021F371A:
	add sp, #8
	mov r0, #0x5f
	pop {r3, r4, r5, r6, r7, pc}
_021F3720:
	ldr r0, [r7, #0x1c]
	bl Save_Daycare_Get
	ldr r1, [sp]
	str r0, [sp, #4]
	str r0, [r1, #0x50]
	add r0, r1, #0
	add r4, r1, #0
	mov r5, #0
	add r0, #0x4a
	strb r5, [r0]
	add r4, #0x4a
_021F3738:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl Save_Daycare_GetMonX
	add r6, r0, #0
	bl DaycareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _021F376A
	add r0, r6, #0
	bl DaycareMon_GetBoxMon
	add r2, r0, #0
	add r1, r5, #0
	ldr r0, [r7, #0x50]
	add r1, #0xa
	bl BufferBoxMonNickname
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_021F376A:
	add r5, r5, #1
	cmp r5, #2
	blt _021F3738
	ldr r0, [sp]
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #2
	bne _021F3786
	ldr r0, [sp, #4]
	bl Save_Daycare_CalcCompatibility
	ldr r1, [sp]
	add r1, #0x48
	strh r0, [r1]
_021F3786:
	ldr r0, [sp]
	mov r1, #7
	strh r1, [r0, #0x20]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F3794: .word 0x00000992
	thumb_func_end ov101_021F36F4

	thumb_func_start ov101_021F3798
ov101_021F3798: ; 0x021F3798
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bhi _021F386A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F37B2: ; jump table
	.short _021F37BA - _021F37B2 - 2 ; case 0
	.short _021F37CA - _021F37B2 - 2 ; case 1
	.short _021F3830 - _021F37B2 - 2 ; case 2
	.short _021F3852 - _021F37B2 - 2 ; case 3
_021F37BA:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint_Ungendered
	b _021F3882
_021F37CA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F37D6
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F37D6:
	ldr r0, [r4, #0x50]
	bl Save_Daycare_HasEgg
	cmp r0, #0
	beq _021F37F0
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	b _021F382C
_021F37F0:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F380A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #4
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #3
	str r0, [r4, #4]
	b _021F382C
_021F380A:
	cmp r0, #1
	bne _021F381E
	mov r0, #3
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint_Ungendered
	b _021F382C
_021F381E:
	mov r0, #2
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
_021F382C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3830:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F383C
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F383C:
	add r2, r4, #0
	add r2, #0x48
	ldrh r2, [r2]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	add r2, r2, #7
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3882
_021F3852:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F385E
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F385E:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xb
	bl PhoneCallMessagePrint_Ungendered
	b _021F3882
_021F386A:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3878
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3878:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3882:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3798

	thumb_func_start ov101_021F388C
ov101_021F388C: ; 0x021F388C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0
	strh r1, [r5, #0x20]
	ldr r1, [r5, #0x10]
	ldrh r2, [r1, #6]
	ldrh r1, [r0, #0x30]
	cmp r2, r1
	bne _021F38A2
	mov r0, #0x61
	pop {r3, r4, r5, r6, r7, pc}
_021F38A2:
	ldr r0, [r0, #0x1c]
	bl Save_Daycare_Get
	add r6, r5, #0
	str r0, [sp]
	str r0, [r5, #0x50]
	add r0, r5, #0
	mov r4, #0
	add r0, #0x4a
	strb r4, [r0]
	add r6, #0x4a
_021F38B8:
	ldr r0, [sp]
	add r1, r4, #0
	bl Save_Daycare_GetMonX
	add r7, r0, #0
	bl DaycareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _021F38E4
	ldrb r0, [r6]
	add r0, r0, #1
	strb r0, [r6]
	add r0, r7, #0
	bl DaycareMon_CalcLevelGrowth
	add r1, r5, r4
	add r1, #0x4b
	b _021F38EA
_021F38E4:
	add r1, r5, r4
	add r1, #0x4b
	mov r0, #0
_021F38EA:
	add r4, r4, #1
	strb r0, [r1]
	cmp r4, #2
	blt _021F38B8
	mov r0, #6
	strh r0, [r5, #0x20]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov101_021F388C

	thumb_func_start ov101_021F38FC
ov101_021F38FC: ; 0x021F38FC
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #4
	bls _021F390E
	b _021F3A7A
_021F390E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F391A: ; jump table
	.short _021F3924 - _021F391A - 2 ; case 0
	.short _021F3936 - _021F391A - 2 ; case 1
	.short _021F396E - _021F391A - 2 ; case 2
	.short _021F3A02 - _021F391A - 2 ; case 3
	.short _021F3A4A - _021F391A - 2 ; case 4
_021F3924:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	mov r3, #4
	bl PhoneCallMessagePrint_Gendered
	b _021F3A96
_021F3936:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3944
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3944:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #0
	bne _021F3962
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xa
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3962:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F396E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F397C
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F397C:
	add r0, r4, #0
	add r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F399E
	add r0, r4, #0
	add r0, #0x4c
	ldrb r0, [r0]
	mov r6, #0
	cmp r0, #0
	bne _021F3998
	mov r0, #4
	str r0, [r4, #4]
	b _021F39C4
_021F3998:
	mov r0, #3
	str r0, [r4, #4]
	b _021F39C4
_021F399E:
	add r0, r4, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F39B0
	mov r0, #4
	mov r6, #1
	str r0, [r4, #4]
	b _021F39C4
_021F39B0:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F39C4:
	ldr r0, [r4, #0x50]
	add r1, r6, #0
	bl Save_Daycare_GetMonX
	bl DaycareMon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r2, r4, r6
	str r0, [sp, #4]
	add r2, #0x4b
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A02:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A10
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A10:
	ldr r0, [r4, #0x50]
	mov r1, #1
	bl Save_Daycare_GetMonX
	bl DaycareMon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #0xa
	bl BufferBoxMonNickname
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r2, r4, #0
	str r0, [sp, #4]
	add r2, #0x4c
	ldrb r2, [r2]
	ldr r0, [r5, #0x50]
	mov r1, #0xb
	mov r3, #3
	bl BufferIntegerAsString
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F3A4A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A58
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A58:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #1
	bne _021F3A6E
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #8
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F3A6E:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint_Ungendered
	b _021F3A96
_021F3A7A:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3A8A
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3A8A:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F3A96:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F38FC

	thumb_func_start ov101_021F3AA4
ov101_021F3AA4: ; 0x021F3AA4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	add r1, r4, #0
	add r1, #0x4d
	ldrb r1, [r1]
	mov r2, #1
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #1
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldr r0, [r4, #0x38]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov101_021F3C60
	add r1, r4, #0
	add r1, #0x4a
	strb r0, [r1]
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F3AEC
	mov r0, #0x63
	pop {r3, r4, r5, pc}
_021F3AEC:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3AFA
	mov r0, #9
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3AFA:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3B08
	mov r0, #0x64
	pop {r3, r4, r5, pc}
_021F3B08:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3B16
	mov r0, #0x62
	pop {r3, r4, r5, pc}
_021F3B16:
	mov r0, #8
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3AA4

	thumb_func_start ov101_021F3B20
ov101_021F3B20: ; 0x021F3B20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3B34
	cmp r1, #1
	beq _021F3B56
	b _021F3B7E
_021F3B34:
	bl ov101_021F2110
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r5, #0x4c]
	lsl r3, r0, #1
	add r2, r3, #3
	add r3, r3, #4
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r5, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
	b _021F3B94
_021F3B56:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B62
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3B62:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, #0xa
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3B94
_021F3B7E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3B8A
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3B8A:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3B94:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3B20

	thumb_func_start ov101_021F3BA0
ov101_021F3BA0: ; 0x021F3BA0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r4, r6, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3BB4
	cmp r1, #1
	beq _021F3BD8
	b _021F3C3E
_021F3BB4:
	bl ov101_021F2110
	add r0, r4, #0
	add r0, #0x23
	ldrb r0, [r0]
	ldr r1, [r6, #0x4c]
	lsl r3, r0, #1
	add r2, r3, #0
	add r2, #0xf
	add r3, #0x10
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	add r0, r6, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
	b _021F3C54
_021F3BD8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3BE4
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3BE4:
	add r0, r4, #0
	add r0, #0x4a
	ldrb r0, [r0]
	cmp r0, #3
	bne _021F3BFA
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	mov r2, #0x24
	bl PhoneCallMessagePrint_Ungendered
	b _021F3C54
_021F3BFA:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r1, r0, #0x1f
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, #0xb
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r2, r0, #0x18
	cmp r2, #0xd
	bne _021F3C2E
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	mov r2, #0x22
	mov r3, #0x23
	bl PhoneCallMessagePrint_Gendered
	b _021F3C54
_021F3C2E:
	add r2, #0x15
	lsl r2, r2, #0x18
	ldr r1, [r6, #0x4c]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3C54
_021F3C3E:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3C4A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3C4A:
	ldr r0, [r6, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F3C54:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3BA0

	thumb_func_start ov101_021F3C60
ov101_021F3C60: ; 0x021F3C60
	push {r4, lr}
	add r4, r0, #0
	bl sub_02095FF8
	cmp r0, #0
	beq _021F3C70
	mov r0, #3
	pop {r4, pc}
_021F3C70:
	cmp r4, #3
	bls _021F3C7C
	cmp r4, #0xa
	bhs _021F3C7C
	mov r0, #0
	pop {r4, pc}
_021F3C7C:
	cmp r4, #9
	bls _021F3C88
	cmp r4, #0x14
	bhs _021F3C88
	mov r0, #1
	pop {r4, pc}
_021F3C88:
	mov r0, #2
	pop {r4, pc}
	thumb_func_end ov101_021F3C60

	thumb_func_start ov101_021F3C8C
ov101_021F3C8C: ; 0x021F3C8C
	ldrb r2, [r1, #0x19]
	cmp r2, #0
	beq _021F3C9A
	mov r0, #0xb
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
_021F3C9A:
	ldr r2, [r1, #0x10]
	ldrh r3, [r2, #6]
	ldrh r2, [r0, #0x30]
	cmp r3, r2
	bne _021F3CB4
	mov r2, #0
	strh r2, [r1, #0x20]
	add r0, #0x36
	ldrb r0, [r0]
	lsl r1, r0, #1
	ldr r0, _021F3CBC ; =ov101_021F86C8
	ldrh r0, [r0, r1]
	bx lr
_021F3CB4:
	mov r0, #0xa
	strh r0, [r1, #0x20]
	mov r0, #0
	bx lr
	.balign 4, 0
_021F3CBC: .word ov101_021F86C8
	thumb_func_end ov101_021F3C8C

	thumb_func_start ov101_021F3CC0
ov101_021F3CC0: ; 0x021F3CC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3CD8
	cmp r1, #1
	beq _021F3CDE
	cmp r1, #2
	beq _021F3CF2
	b _021F3D14
_021F3CD8:
	bl ov101_021F2110
	b _021F3D2A
_021F3CDE:
	add r2, r4, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	add r2, r2, #4
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3D2A
_021F3CF2:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3CFE
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3CFE:
	ldrh r0, [r5, #0x32]
	bl ov101_021F3E74
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3D2A
_021F3D14:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3D20
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3D20:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3D2A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3CC0

	thumb_func_start ov101_021F3D34
ov101_021F3D34: ; 0x021F3D34
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	bl SaveData_GSPlayerMisc_Get
	bl sub_0202EE70
	add r6, r0, #0
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0]
	ldr r0, [r5, #0x28]
	mov r1, #2
	mov r2, #0x19
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	beq _021F3D62
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #1]
_021F3D62:
	cmp r6, #0
	beq _021F3D6C
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #2]
_021F3D6C:
	cmp r6, #1
	bls _021F3D76
	mov r1, #1
	add r0, sp, #0
	strb r1, [r0, #3]
_021F3D76:
	ldr r0, [r5]
	mov r1, #0x49
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x49
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r3, _021F3DC4 ; =ov101_021F8760
	mov r1, #0
	add r0, sp, #0
_021F3D8E:
	ldrb r2, [r3]
	ldrb r2, [r0, r2]
	cmp r2, #0
	beq _021F3DA0
	add r2, r4, #0
	add r4, r4, #1
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	strb r1, [r5, r2]
_021F3DA0:
	add r1, r1, #1
	add r3, r3, #1
	cmp r1, #0x49
	blt _021F3D8E
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	ldrb r4, [r5, r1]
	add r0, r5, #0
	bl FreeToHeap
	add r4, #0x56
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_021F3DC4: .word ov101_021F8760
	thumb_func_end ov101_021F3D34

	thumb_func_start ov101_021F3DC8
ov101_021F3DC8: ; 0x021F3DC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F3DE0
	cmp r1, #1
	beq _021F3DE6
	cmp r1, #2
	beq _021F3DFA
	b _021F3E54
_021F3DE0:
	bl ov101_021F2110
	b _021F3E6A
_021F3DE6:
	add r2, r4, #0
	add r2, #0x23
	ldrb r2, [r2]
	ldr r1, [r5, #0x4c]
	add r2, r2, #7
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3E6A
_021F3DFA:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E06
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3E06:
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bge _021F3E42
	bl LCRandom
	mov r1, #0xe1
	lsl r1, r1, #2
	bl _s32_div_f
	add r0, r1, #0
	mov r1, #0x4b
	lsl r1, r1, #2
	bl _s32_div_f
	add r2, r0, #0
	add r2, #0xa
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F3E6A
_021F3E42:
	add r0, r5, #0
	bl ov101_021F3D34
	add r2, r0, #0
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	bl PhoneCallMessagePrint_Ungendered
	b _021F3E6A
_021F3E54:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3E60
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F3E60:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F3E6A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F3DC8

	thumb_func_start ov101_021F3E74
ov101_021F3E74: ; 0x021F3E74
	push {r3, lr}
	ldr r3, _021F3EA4 ; =ov101_021F86CC
	mov r2, #0
_021F3E7A:
	ldrh r1, [r3]
	cmp r0, r1
	bne _021F3E88
	add r2, #0xd
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
_021F3E88:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #0x49
	blt _021F3E7A
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0xa
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, pc}
	nop
_021F3EA4: .word ov101_021F86CC
	thumb_func_end ov101_021F3E74

	thumb_func_start ov101_021F3EA8
ov101_021F3EA8: ; 0x021F3EA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x24]
	add r4, r1, #0
	bl PlayerProfile_CountBadges
	cmp r0, #0x10
	blt _021F3EC8
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
	mov r0, #1
	orr r1, r0
	b _021F3ED2
_021F3EC8:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r1, [r0]
	mov r0, #1
	bic r1, r0
_021F3ED2:
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	bl PhoneRematches_IsSeeking
	add r1, r4, #0
	add r1, #0x4d
	ldrb r2, [r1]
	lsl r0, r0, #0x18
	mov r1, #2
	lsr r0, r0, #0x18
	bic r2, r1
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1e
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x4d
	strb r1, [r0]
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F3F06
	mov r0, #0xe
	b _021F3F08
_021F3F06:
	mov r0, #0xd
_021F3F08:
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov101_021F3EA8

	thumb_func_start ov101_021F3F10
ov101_021F3F10: ; 0x021F3F10
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #3
	bls _021F3F20
	b _021F4042
_021F3F20:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F3F2C: ; jump table
	.short _021F3F34 - _021F3F2C - 2 ; case 0
	.short _021F3F60 - _021F3F2C - 2 ; case 1
	.short _021F3FD6 - _021F3F2C - 2 ; case 2
	.short _021F3FEC - _021F3F2C - 2 ; case 3
_021F3F34:
	bl ov101_021F2110
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F3F54
	mov r0, #0xff
	str r0, [r4, #4]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #1
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F54:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #2
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F3F60:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3F6C
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F6C:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	bne _021F3F8A
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #3
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3F8A:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F3FA2
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #9
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FA2:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x34]
	ldrb r0, [r2, #0xd]
	cmp r1, r0
	bne _021F3FB8
	add r0, r4, #0
	add r0, #0x23
	ldrb r1, [r0]
	ldrb r0, [r2, #0xe]
	cmp r1, r0
	beq _021F3FCA
_021F3FB8:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #4
	bl PhoneCallMessagePrint_Ungendered
	mov r0, #0xff
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FCA:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #5
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F3FD6:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F3FE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FE2:
	add r0, r5, #0
	mov r1, #6
	bl ov101_021F2308
	b _021F405A
_021F3FEC:
	bl ov101_021F2338
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _021F3FFE
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F3FFE:
	add r0, r5, #0
	bl ov101_021F2344
	cmp r6, #0
	beq _021F4014
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #7
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F4014:
	ldrb r1, [r4, #0x18]
	add r0, r5, #0
	bl ov101_021F40E8
	cmp r0, #0
	beq _021F4036
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #6
	bl PhoneCallMessagePrint_Ungendered
	ldrb r1, [r4, #0x18]
	ldr r0, [r5, #0x20]
	mov r2, #1
	bl PhoneRematches_SetSeeking
	b _021F405A
_021F4036:
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #8
	bl PhoneCallMessagePrint_Ungendered
	b _021F405A
_021F4042:
	add r0, r5, #0
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4050
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F4050:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r4, r5, r6, pc}
_021F405A:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov101_021F3F10

	thumb_func_start ov101_021F4064
ov101_021F4064: ; 0x021F4064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x88
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _021F4078
	cmp r1, #1
	beq _021F4088
	b _021F40C8
_021F4078:
	bl ov101_021F2110
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xa
	bl PhoneCallMessagePrint_Ungendered
	b _021F40DE
_021F4088:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4094
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F4094:
	add r0, r4, #0
	add r0, #0x4d
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _021F40AC
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0xb
	bl PhoneCallMessagePrint_Ungendered
	b _021F40DE
_021F40AC:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r2, r1, #0
	add r2, #0xc
	lsl r2, r2, #0x18
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl PhoneCallMessagePrint_Ungendered
	b _021F40DE
_021F40C8:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F40D4
	mov r0, #0
	pop {r3, r4, r5, pc}
_021F40D4:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F40DE:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov101_021F4064

	thumb_func_start ov101_021F40E8
ov101_021F40E8: ; 0x021F40E8
	push {r4, lr}
	mov r4, #0
	cmp r1, #0x12
	beq _021F40FE
	ldr r0, [r0, #0x20]
	mov r1, #0x12
	bl PhoneRematches_IsSeeking
	cmp r0, #0
	beq _021F40FE
	add r4, r4, #1
_021F40FE:
	cmp r4, #5
	bge _021F4106
	mov r0, #1
	pop {r4, pc}
_021F4106:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov101_021F40E8

	thumb_func_start ov101_021F410C
ov101_021F410C: ; 0x021F410C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F4120
	mov r0, #0x8d
	pop {r4, r5, r6, pc}
_021F4120:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F419A
	ldr r0, [r5, #0x1c]
	bl Save_SafariZone_Get
	ldrh r1, [r4, #0x1c]
	add r6, r0, #0
	cmp r1, #0
	bgt _021F4138
	beq _021F4154
	b _021F4186
_021F4138:
	sub r1, #0x8e
	cmp r1, #4
	bhi _021F4186
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F414A: ; jump table
	.short _021F415C - _021F414A - 2 ; case 0
	.short _021F4168 - _021F414A - 2 ; case 1
	.short _021F4168 - _021F414A - 2 ; case 2
	.short _021F417E - _021F414A - 2 ; case 3
	.short _021F417E - _021F414A - 2 ; case 4
_021F4154:
	mov r0, #0xf
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F415C:
	ldr r0, [r5, #0x28]
	mov r1, #4
	bl Save_VarsFlags_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F4168:
	mov r1, #1
	bl sub_0202F730
	ldr r0, [r5, #0x1c]
	bl Save_PlayerData_GetIGTAddr
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0202F784
	b _021F418E
_021F417E:
	mov r1, #4
	bl sub_0202F730
	b _021F418E
_021F4186:
	mov r0, #0x9a
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F418E:
	ldr r0, [r5, #0x28]
	mov r1, #7
	bl Save_VarsFlags_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F419A:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F41A8
	mov r0, #0x8c
	pop {r4, r5, r6, pc}
_021F41A8:
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_GetVar4057
	add r0, #0x93
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov101_021F410C

	thumb_func_start ov101_021F41B8
ov101_021F41B8: ; 0x021F41B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	str r1, [sp]
	add r1, #0x88
	str r1, [sp]
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _021F424A
	bl ov101_021F2110
	ldr r0, [r5, #0x20]
	ldr r2, [r5]
	add r1, sp, #4
	bl sub_0202F340
	add r7, sp, #4
	add r6, r0, #0
	ldrb r0, [r7]
	cmp r0, #0
	bne _021F41F2
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x26
	mov r3, #0x27
	bl PhoneCallMessagePrint_Gendered
	b _021F4242
_021F41F2:
	cmp r0, #6
	blo _021F4204
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x18
	mov r3, #0x19
	bl PhoneCallMessagePrint_Gendered
	b _021F4242
_021F4204:
	mov r4, #0
	cmp r0, #0
	bls _021F4222
_021F420A:
	ldrb r2, [r6, r4]
	add r1, r4, #0
	ldr r0, [r5, #0x50]
	add r1, #0xa
	bl BufferSafariZoneAreaName
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldrb r0, [r7]
	cmp r4, r0
	blo _021F420A
_021F4222:
	sub r0, r0, #1
	lsl r1, r0, #1
	add r0, sp, #4
	strb r1, [r0]
	ldrb r3, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	add r2, r3, #0
	add r2, #0xe
	add r3, #0xf
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
_021F4242:
	add r0, r6, #0
	bl FreeToHeap
	b _021F4264
_021F424A:
	bl ov101_021F2220
	cmp r0, #0
	bne _021F4258
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F4258:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F4264:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov101_021F41B8

	thumb_func_start ov101_021F4274
ov101_021F4274: ; 0x021F4274
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0
	strh r0, [r7, #0x20]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	bne _021F42A4
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F4292
	mov r0, #0x9c
	pop {r3, r4, r5, r6, r7, pc}
_021F4292:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0xac
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F42A4:
	ldr r0, [r5, #0x24]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov101_021F42E4
	ldr r1, _021F42E0 ; =0x0000FFFF
	cmp r0, r1
	bne _021F42DE
	cmp r4, #0
	bne _021F42D4
	mov r0, #0xa9
	pop {r3, r4, r5, r6, r7, pc}
_021F42D4:
	cmp r6, #0x10
	bhs _021F42DC
	mov r0, #0xaa
	pop {r3, r4, r5, r6, r7, pc}
_021F42DC:
	mov r0, #0xab
_021F42DE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F42E0: .word 0x0000FFFF
	thumb_func_end ov101_021F4274

	thumb_func_start ov101_021F42E4
ov101_021F42E4: ; 0x021F42E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	add r4, r2, #0
	add r6, r3, #0
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F42FC
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F42FC:
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	bl Save_VarsFlags_ClearFlagInArray
	cmp r4, #0x10
	blo _021F4324
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4320
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa8
	pop {r4, r5, r6, pc}
_021F4320:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4324:
	ldr r0, [r5, #0x24]
	mov r1, #0xd
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F434C
	ldr r1, _021F4468 ; =0x000009A3
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4348
	ldr r0, [r5, #0x28]
	ldr r1, _021F4468 ; =0x000009A3
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa7
	pop {r4, r5, r6, pc}
_021F4348:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F434C:
	mov r1, #0xf9
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4372
	ldr r1, _021F446C ; =0x000009A2
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F436E
	ldr r0, [r5, #0x28]
	ldr r1, _021F446C ; =0x000009A2
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa6
	pop {r4, r5, r6, pc}
_021F436E:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4372:
	mov r1, #0x87
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4398
	ldr r1, _021F4470 ; =0x000009A1
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4394
	ldr r0, [r5, #0x28]
	ldr r1, _021F4470 ; =0x000009A1
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa5
	pop {r4, r5, r6, pc}
_021F4394:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4398:
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	beq _021F43A8
	mov r0, #0xa4
	pop {r4, r5, r6, pc}
_021F43A8:
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	cmp r0, #0
	beq _021F43CE
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F43CA
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa3
	pop {r4, r5, r6, pc}
_021F43CA:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F43CE:
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F43DE
	mov r0, #0xa2
	pop {r4, r5, r6, pc}
_021F43DE:
	ldr r0, [r5, #0x28]
	mov r1, #0xc6
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F43EE
	mov r0, #0xa1
	pop {r4, r5, r6, pc}
_021F43EE:
	ldr r0, [r5, #0x28]
	mov r1, #0xca
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F441A
	mov r1, #0x9a
	lsl r1, r1, #4
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4416
	mov r1, #0x9a
	ldr r0, [r5, #0x28]
	lsl r1, r1, #4
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa0
	pop {r4, r5, r6, pc}
_021F4416:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F441A:
	ldr r1, _021F4478 ; =0x0000096A
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F4440
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F443C
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0x9f
	pop {r4, r5, r6, pc}
_021F443C:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4440:
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F4450
	mov r0, #0x9e
	pop {r4, r5, r6, pc}
_021F4450:
	cmp r6, #0
	beq _021F4458
	mov r0, #0x9d
	pop {r4, r5, r6, pc}
_021F4458:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F445C: .word 0x00000998
_021F4460: .word 0x0000FFFF
_021F4464: .word 0x000009A4
_021F4468: .word 0x000009A3
_021F446C: .word 0x000009A2
_021F4470: .word 0x000009A1
_021F4474: .word 0x000009A5
_021F4478: .word 0x0000096A
_021F447C: .word 0x0000099F
	thumb_func_end ov101_021F42E4

    .rodata

	.global ov101_021F8400
ov101_021F8400: ; 0x021F8400
	.byte 0x88, 0xB8, 0x08, 0xF8

ov101_021F8404: ; 0x021F8404
	.byte 0x83, 0x00, 0x0D, 0x09
	.byte 0x85, 0x03, 0x0D, 0x03
	.byte 0xB2, 0x08, 0x07, 0x0B
	.byte 0xB2, 0x0A, 0x07, 0x0B
	.byte 0xB3, 0x0C, 0x07, 0x09
	.byte 0xB2, 0x0F, 0x07, 0x0B
	.byte 0x82, 0x12, 0x0D, 0x0B

ov101_021F8420: ; 0x021F8420
	.byte 0x06, 0x02, 0x13, 0x1B, 0x04, 0x01, 0x75, 0x03
	.byte 0x06, 0x04, 0x10, 0x09, 0x02, 0x01, 0x63, 0x03
	.byte 0x03, 0x01, 0x02, 0x1B, 0x18, 0x02, 0x77, 0x01
	.byte 0x01, 0x00, 0x15, 0x20, 0x02, 0x0A, 0xBF, 0x03

ov101_021F8440: ; 0x021F8440
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x04, 0x00, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1D, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1C, 0x00
	.byte 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F84E8: ; 0x021F84E8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F85D8: ; 0x021F85D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F8600: ; 0x021F8600
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xA0, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov101_021F8628: ; 0x021F8628
	.byte 0x03, 0x00, 0x01, 0x0D, 0x00, 0x00, 0x04, 0x03
	.byte 0xA4, 0x03, 0xA0, 0x00

ov101_021F8634: ; 0x021F8634
	.byte 0x08, 0x20, 0x08, 0xE0, 0x20, 0x38, 0x08, 0xE0, 0x38, 0x50, 0x08, 0xE0
	.byte 0x50, 0x68, 0x08, 0xE0, 0x68, 0x80, 0x08, 0xE0, 0x80, 0x98, 0x08, 0xE0, 0x08, 0x50, 0xE0, 0xF8
	.byte 0x50, 0x98, 0xE0, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov101_021F8658: ; 0x021F8658
	.byte 0x08, 0x18, 0x04, 0x24, 0x20, 0x30, 0x04, 0x24
	.byte 0x38, 0x48, 0x04, 0x24, 0x50, 0x60, 0x04, 0x24, 0x68, 0x78, 0x04, 0x24, 0x80, 0x90, 0x04, 0x24
	.byte 0x08, 0x50, 0xE0, 0xF8, 0x50, 0x98, 0xE0, 0xF8, 0xFF, 0x00, 0x00, 0x00

ov101_021F867C: ; 0x021F867C
	.word ov101_021F2680
	.word ov101_021F2F50
	.word ov101_021F2FFC
	.word ov101_021F35EC
	.word GearPhoneCall_Mom
	.word ov101_021F313C
	.word ov101_021F38FC
	.word ov101_021F3798
	.word ov101_021F3B20
	.word ov101_021F3BA0
	.word ov101_021F3CC0
	.word ov101_021F3DC8
	.word ov101_021F3448
	.word ov101_021F3F10
	.word ov101_021F4064
	.word ov101_021F41B8

    ; file boundary?

sPhoneCallData_ProfElm_MapScripts: ; 0x021F86BC
	.byte 0x00, 0x02  // H-hello? {STRVAR_1 3, 0, 0}?\rIt’s a disaster!\nUh, um, it’s just terrible!\rWhat should I do?\nIt... Oh, no...\rPlease get back here now!
	.byte 0x00, 0x03  // Hello, {STRVAR_1 3, 0, 0}?\nWe’ve discovered something!\rThe details are...well, I can’t really\nsay anything, but we want you to carry\fthat Egg!\rMy assistant is at the Poké Mart in\nViolet City. Could you go meet him and\fpick up that Egg?
	.byte 0x00, 0x04  // {STRVAR_1 3, 0, 0}, how are things going?\rI called because something weird is\nhappening with the radio broadcasts.\rThey were talking about Team Rocket.\r{STRVAR_1 3, 0, 0}, do you know anything\nabout it?\rMaybe Team Rocket has returned.\nNo, that just can’t be true.\rSorry to bug you. Take care!
	.byte 0x00, 0x05  // Hello, {STRVAR_1 3, 0, 0}?\nHow’s it going?\rI’ve gotten hold of something neat.\nSwing by my Lab and pick it up!\rSee you later!
	.byte 0x00, 0x06  // Hello, {STRVAR_1 3, 0, 0}?\rI have something here for you.\nCould you swing by my Lab?\rSee you later!

    ; file boundary?

	.balign 4, 0
ov101_021F86C8: ; 0x021F86C8
	.short 0x0066
	.short 0x0065

ov101_021F86CC: ; 0x021F86CC
	.short 0x0009, 0x000A
	.short 0x000B, 0x000C, 0x000D, 0x000E, 0x000F, 0x0010, 0x0011, 0x0012
	.short 0x0013, 0x0014, 0x0015, 0x0016, 0x0017, 0x0018, 0x0019, 0x001A
	.short 0x005B, 0x005C, 0x005D, 0x001B, 0x001C, 0x001D, 0x001E, 0x001F
	.short 0x0020, 0x0021, 0x0022, 0x0023, 0x0024, 0x0025, 0x0026, 0x0027
	.short 0x0028, 0x0029, 0x002A, 0x002B, 0x005E, 0x005F, 0x002C, 0x002D
	.short 0x002E, 0x002F, 0x0030, 0x0097, 0x0098, 0x0031, 0x0032, 0x0033
	.short 0x0034, 0x0035, 0x0036, 0x0037, 0x0038, 0x0039, 0x003A, 0x003B
	.short 0x003C, 0x0043, 0x0049, 0x004A, 0x004B, 0x004C, 0x004D, 0x004E
	.short 0x0057, 0x0058, 0x0059, 0x005A, 0x0060, 0x0071, 0x00AE, 0x0000

ov101_021F8760: ; 0x021F8760
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x03
	.byte 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x03, 0x02, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
