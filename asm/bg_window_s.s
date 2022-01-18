	.include "asm/macros.inc"
	.include "global.inc"

	.text

	.extern GetBgScreenDimensions
	.extern Bg_SetPosText
	.extern SetBgAffine
	.extern CopyOrUncompressTilemapData
	.extern CopyTilesToVram
	.extern LoadBgVramChar
	.extern GetTileMapIndexFromCoords
	.extern GetSrcTileMapIndexFromCoords
	.extern Convert4bppTo8bppInternal
	.extern BlitBitmapRect8bit
	.extern FillBitmapRect4bit
	.extern FillBitmapRect8bit
	.extern PutWindowTilemap_TextMode
	.extern PutWindowTilemap_AffineMode
	.extern ClearWindowTilemapText
	.extern ClearWindowTilemapAffine
	.extern CopyWindowToVram_TextMode
	.extern ScheduleWindowCopyToVram_TextMode
	.extern CopyWindowToVram_AffineMode
	.extern ScheduleWindowCopyToVram_AffineMode
	.extern CopyWindowPixelsToVram_TextMode

	thumb_func_start ScrollWindow
ScrollWindow: ; 0x0201EC48
	push {r4, r5, r6, lr}
	ldrb r6, [r0, #4]
	mov r5, #0x2c
	ldr r4, [r0]
	mul r5, r6
	add r4, r4, r5
	ldrb r4, [r4, #0x1e]
	cmp r4, #0
	bne _0201EC60
	bl ScrollWindow_Text
	pop {r4, r5, r6, pc}
_0201EC60:
	bl ScrollWindow_Affine
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrollWindow

	thumb_func_start ScrollWindow_Text
ScrollWindow_Text: ; 0x0201EC68
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r3, #0
	add r4, r0, #0
	add r0, r1, #0
	lsl r3, r6, #0x18
	lsl r1, r6, #0x10
	str r2, [sp]
	orr r1, r3
	lsl r5, r6, #8
	orr r1, r5
	orr r1, r6
	str r1, [sp, #4]
	ldrb r1, [r4, #7]
	ldrb r3, [r4, #8]
	ldr r2, [r4, #0xc]
	str r1, [sp, #8]
	mul r1, r3
	lsl r1, r1, #5
	str r1, [sp, #0xc]
	cmp r0, #3
	bhi _0201ED4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0201ECA0: ; jump table
	.short _0201ECA8 - _0201ECA0 - 2 ; case 0
	.short _0201ECF6 - _0201ECA0 - 2 ; case 1
	.short _0201ED4E - _0201ECA0 - 2 ; case 2
	.short _0201ED4E - _0201ECA0 - 2 ; case 3
_0201ECA8:
	add r0, r1, #0
	mov r7, #0
	cmp r0, #0
	ble _0201ED4E
	mov r0, #7
	mov lr, r0
_0201ECB4:
	ldr r3, [sp]
	mov r4, #0
	add r5, r7, #0
_0201ECBA:
	mov r0, #7
	add r6, r3, #0
	and r6, r0
	add r1, r3, #0
	mov r0, lr
	bic r1, r0
	ldr r0, [sp, #8]
	mul r1, r0
	add r0, r6, #0
	orr r0, r1
	lsl r0, r0, #2
	add r1, r7, r0
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bge _0201ECDC
	ldr r0, [r2, r1]
	b _0201ECDE
_0201ECDC:
	ldr r0, [sp, #4]
_0201ECDE:
	add r4, r4, #1
	str r0, [r2, r5]
	add r3, r3, #1
	add r5, r5, #4
	cmp r4, #8
	blt _0201ECBA
	ldr r0, [sp, #0xc]
	add r7, #0x20
	cmp r7, r0
	blt _0201ECB4
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_0201ECF6:
	add r0, r1, #0
	sub r0, r0, #4
	add r2, r2, r0
	add r0, r1, #0
	mov r7, #0
	cmp r0, #0
	ble _0201ED4E
	mov r0, #7
	mov ip, r0
_0201ED08:
	ldr r4, [sp]
	mov r5, #0
	add r3, r7, #0
_0201ED0E:
	mov r0, #7
	add r6, r4, #0
	and r6, r0
	add r1, r4, #0
	mov r0, ip
	bic r1, r0
	ldr r0, [sp, #8]
	mul r1, r0
	add r0, r6, #0
	orr r0, r1
	lsl r0, r0, #2
	add r1, r7, r0
	ldr r0, [sp, #0xc]
	cmp r1, r0
	bge _0201ED36
	sub r0, r2, r1
	ldr r1, [r0]
	sub r0, r2, r3
	str r1, [r0]
	b _0201ED3C
_0201ED36:
	ldr r0, [sp, #4]
	sub r1, r2, r3
	str r0, [r1]
_0201ED3C:
	add r5, r5, #1
	add r4, r4, #1
	add r3, r3, #4
	cmp r5, #8
	blt _0201ED0E
	ldr r0, [sp, #0xc]
	add r7, #0x20
	cmp r7, r0
	blt _0201ED08
_0201ED4E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrollWindow_Text

	thumb_func_start ScrollWindow_Affine
ScrollWindow_Affine: ; 0x0201ED54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r6, r3, #0
	add r4, r0, #0
	str r2, [sp]
	lsl r2, r6, #0x18
	lsl r0, r6, #0x10
	orr r0, r2
	ldrb r2, [r4, #7]
	ldr r3, [r4, #0xc]
	lsl r5, r6, #8
	orr r0, r5
	ldrb r4, [r4, #8]
	str r2, [sp, #0x10]
	orr r0, r6
	mul r2, r4
	lsl r2, r2, #6
	str r2, [sp, #0x1c]
	cmp r1, #3
	bls _0201ED7E
	b _0201EE84
_0201ED7E:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201ED8A: ; jump table
	.short _0201ED92 - _0201ED8A - 2 ; case 0
	.short _0201EE00 - _0201ED8A - 2 ; case 1
	.short _0201EE84 - _0201ED8A - 2 ; case 2
	.short _0201EE84 - _0201ED8A - 2 ; case 3
_0201ED92:
	mov r1, #0
	str r1, [sp, #0xc]
	add r1, r2, #0
	cmp r1, #0
	ble _0201EE84
	add r1, r1, #4
	str r1, [sp, #0x14]
	mov r1, #7
	mov lr, r1
_0201EDA4:
	ldr r4, [sp]
	ldr r5, [sp, #0xc]
	mov r7, #0
_0201EDAA:
	mov r1, #7
	add r6, r4, #0
	and r6, r1
	add r2, r4, #0
	mov r1, lr
	bic r2, r1
	ldr r1, [sp, #0x10]
	mul r2, r1
	add r1, r6, #0
	orr r1, r2
	lsl r2, r1, #3
	ldr r1, [sp, #0xc]
	add r1, r1, r2
	ldr r2, [sp, #0x1c]
	cmp r1, r2
	bge _0201EDD0
	ldr r2, [r3, r1]
	str r2, [r3, r5]
	b _0201EDD2
_0201EDD0:
	str r0, [r3, r5]
_0201EDD2:
	add r2, r1, #4
	ldr r1, [sp, #0x14]
	cmp r2, r1
	bge _0201EDE2
	ldr r2, [r3, r2]
	add r1, r5, #4
	str r2, [r3, r1]
	b _0201EDE6
_0201EDE2:
	add r1, r5, #4
	str r0, [r3, r1]
_0201EDE6:
	add r7, r7, #1
	add r4, r4, #1
	add r5, #8
	cmp r7, #8
	blt _0201EDAA
	ldr r2, [sp, #0xc]
	ldr r1, [sp, #0x1c]
	add r2, #0x40
	str r2, [sp, #0xc]
	cmp r2, r1
	blt _0201EDA4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0201EE00:
	add r1, r2, #0
	sub r1, #8
	add r3, r3, r1
	mov r1, #0
	str r1, [sp, #8]
	add r1, r2, #0
	cmp r1, #0
	ble _0201EE84
_0201EE10:
	mov r1, #0
	str r1, [sp, #4]
	ldr r1, [sp, #0x1c]
	ldr r5, [sp]
	sub r1, r1, #4
	str r1, [sp, #0x18]
	mov r1, #7
	ldr r4, [sp, #8]
	mov ip, r1
_0201EE22:
	mov r1, #7
	add r6, r5, #0
	and r6, r1
	add r2, r5, #0
	mov r1, ip
	bic r2, r1
	ldr r1, [sp, #0x10]
	mul r2, r1
	add r1, r6, #0
	orr r1, r2
	lsl r2, r1, #3
	ldr r1, [sp, #8]
	add r6, r1, r2
	ldr r1, [sp, #0x1c]
	cmp r6, r1
	bge _0201EE4C
	sub r1, r3, r6
	ldr r2, [r1]
	sub r1, r3, r4
	str r2, [r1]
	b _0201EE50
_0201EE4C:
	sub r1, r3, r4
	str r0, [r1]
_0201EE50:
	ldr r1, [sp, #0x18]
	sub r2, r6, #4
	cmp r2, r1
	bge _0201EE64
	sub r1, r3, r2
	sub r2, r4, #4
	ldr r1, [r1]
	sub r2, r3, r2
	str r1, [r2]
	b _0201EE6A
_0201EE64:
	sub r1, r4, #4
	sub r1, r3, r1
	str r0, [r1]
_0201EE6A:
	ldr r1, [sp, #4]
	add r5, r5, #1
	add r1, r1, #1
	add r4, #8
	str r1, [sp, #4]
	cmp r1, #8
	blt _0201EE22
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x1c]
	add r2, #0x40
	str r2, [sp, #8]
	cmp r2, r1
	blt _0201EE10
_0201EE84:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrollWindow_Affine

	thumb_func_start GetWindowBgConfig
GetWindowBgConfig: ; 0x0201EE88
	ldr r0, [r0]
	bx lr
	thumb_func_end GetWindowBgConfig

	thumb_func_start GetWindowBgId
GetWindowBgId: ; 0x0201EE8C
	ldrb r0, [r0, #4]
	bx lr
	thumb_func_end GetWindowBgId

	thumb_func_start GetWindowWidth
GetWindowWidth: ; 0x0201EE90
	ldrb r0, [r0, #7]
	bx lr
	thumb_func_end GetWindowWidth

	thumb_func_start GetWindowHeight
GetWindowHeight: ; 0x0201EE94
	ldrb r0, [r0, #8]
	bx lr
	thumb_func_end GetWindowHeight

	thumb_func_start GetWindowX
GetWindowX: ; 0x0201EE98
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end GetWindowX

	thumb_func_start GetWindowY
GetWindowY: ; 0x0201EE9C
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end GetWindowY

	thumb_func_start GetWindowBaseTile
GetWindowBaseTile: ; 0x0201EEA0
	ldrh r0, [r0, #0xa]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x11
	bx lr
	thumb_func_end GetWindowBaseTile

	thumb_func_start GetWindowLeft
GetWindowLeft: ; 0x0201EEA8
	strb r1, [r0, #5]
	bx lr
	thumb_func_end GetWindowLeft

	thumb_func_start GetWindowTop
GetWindowTop: ; 0x0201EEAC
	strb r1, [r0, #6]
	bx lr
	thumb_func_end GetWindowTop

	thumb_func_start GetWindowPaletteNum
GetWindowPaletteNum: ; 0x0201EEB0
	strb r1, [r0, #9]
	bx lr
	thumb_func_end GetWindowPaletteNum

	thumb_func_start BgConfig_HandleScheduledScrollAndTransferOps
BgConfig_HandleScheduledScrollAndTransferOps: ; 0x0201EEB4
	push {r4, lr}
	add r4, r0, #0
	bl BgConfig_HandleScheduledScrolls
	add r0, r4, #0
	bl BgConfig_HandleScheduledBufferTransfers
	mov r0, #0
	strh r0, [r4, #4]
	strh r0, [r4, #6]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BgConfig_HandleScheduledScrollAndTransferOps

	thumb_func_start BgConfig_HandleScheduledBufferTransfers
BgConfig_HandleScheduledBufferTransfers: ; 0x0201EECC
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4, #6]
	mov r0, #1
	tst r0, r1
	beq _0201EEE6
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #8]
	ldr r3, [r4, #0xc]
	mov r0, #0
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EEE6:
	ldrh r1, [r4, #6]
	mov r0, #2
	tst r0, r1
	beq _0201EEFC
	ldr r2, [r4, #0x3c]
	ldr r1, [r4, #0x34]
	ldr r3, [r4, #0x38]
	mov r0, #1
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EEFC:
	ldrh r1, [r4, #6]
	mov r0, #4
	tst r0, r1
	beq _0201EF12
	ldr r2, [r4, #0x68]
	ldr r1, [r4, #0x60]
	ldr r3, [r4, #0x64]
	mov r0, #2
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF12:
	ldrh r1, [r4, #6]
	mov r0, #8
	tst r0, r1
	beq _0201EF34
	add r2, r4, #0
	add r1, r4, #0
	add r2, #0x94
	add r3, r4, #0
	add r1, #0x8c
	ldr r2, [r2]
	add r3, #0x90
	ldr r1, [r1]
	ldr r3, [r3]
	mov r0, #3
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF34:
	ldrh r1, [r4, #6]
	mov r0, #0x10
	tst r0, r1
	beq _0201EF56
	add r2, r4, #0
	add r1, r4, #0
	add r2, #0xc0
	add r3, r4, #0
	add r1, #0xb8
	ldr r2, [r2]
	add r3, #0xbc
	ldr r1, [r1]
	ldr r3, [r3]
	mov r0, #4
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF56:
	ldrh r1, [r4, #6]
	mov r0, #0x20
	tst r0, r1
	beq _0201EF78
	add r2, r4, #0
	add r1, r4, #0
	add r2, #0xec
	add r3, r4, #0
	add r1, #0xe4
	ldr r2, [r2]
	add r3, #0xe8
	ldr r1, [r1]
	ldr r3, [r3]
	mov r0, #5
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF78:
	ldrh r0, [r4, #6]
	mov r3, #0x40
	tst r0, r3
	beq _0201EF98
	add r2, r3, #0
	add r1, r3, #0
	add r2, #0xd8
	add r1, #0xd0
	ldr r2, [r4, r2]
	add r3, #0xd4
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	mov r0, #6
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EF98:
	ldrh r0, [r4, #6]
	mov r3, #0x80
	tst r0, r3
	beq _0201EFB8
	add r2, r3, #0
	add r1, r3, #0
	add r2, #0xc4
	add r1, #0xbc
	ldr r2, [r4, r2]
	add r3, #0xc0
	ldr r1, [r4, r1]
	ldr r3, [r4, r3]
	mov r0, #7
	lsl r2, r2, #1
	bl CopyTilesToVram
_0201EFB8:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end BgConfig_HandleScheduledBufferTransfers

	thumb_func_start ScheduleBgTilemapBufferTransfer
ScheduleBgTilemapBufferTransfer: ; 0x0201EFBC
	ldrh r3, [r0, #6]
	mov r2, #1
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strh r1, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ScheduleBgTilemapBufferTransfer

	thumb_func_start BgConfig_HandleScheduledScrolls
BgConfig_HandleScheduledScrolls: ; 0x0201EFCC
	push {r4, lr}
	sub sp, #0x48
	add r4, r0, #0
	ldrh r1, [r4, #4]
	mov r0, #1
	tst r0, r1
	beq _0201EFF2
	ldr r1, [r4, #0x14]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	ldr r1, [r4, #0x18]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F208 ; =0x04000010
	str r1, [r0]
_0201EFF2:
	ldrh r1, [r4, #4]
	mov r0, #2
	tst r0, r1
	beq _0201F012
	ldr r1, [r4, #0x40]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	ldr r1, [r4, #0x44]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F20C ; =0x04000014
	str r1, [r0]
_0201F012:
	ldrh r1, [r4, #4]
	mov r0, #4
	tst r0, r1
	beq _0201F072
	add r0, r4, #0
	add r0, #0x74
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201F03E
	ldr r1, [r4, #0x6c]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	ldr r1, [r4, #0x70]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F210 ; =0x04000018
	str r1, [r0]
	b _0201F072
_0201F03E:
	mov r0, #2
	str r0, [sp]
	add r1, r4, #0
	add r1, #0x78
	add r3, r4, #0
	add r3, #0x80
	ldrh r1, [r1]
	ldr r2, [r4, #0x7c]
	ldr r3, [r3]
	add r0, sp, #0x38
	bl MTX22_2DAffine
	ldr r0, [r4, #0x6c]
	add r2, r4, #0
	str r0, [sp]
	ldr r0, [r4, #0x70]
	add r3, r4, #0
	str r0, [sp, #4]
	add r2, #0x84
	add r3, #0x88
	ldr r0, _0201F214 ; =0x04000020
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, sp, #0x38
	bl G2x_SetBGyAffine_
_0201F072:
	ldrh r1, [r4, #4]
	mov r0, #8
	tst r0, r1
	beq _0201F0E2
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0201F0A2
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0x98
	add r2, #0x9c
	ldr r2, [r2]
	ldr r0, [r0]
	ldr r1, _0201F204 ; =0x000001FF
	lsl r2, r2, #0x10
	and r0, r1
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F218 ; =0x0400001C
	str r1, [r0]
	b _0201F0E2
_0201F0A2:
	mov r0, #2
	add r1, r4, #0
	str r0, [sp]
	add r1, #0xa4
	add r2, r4, #0
	add r3, r4, #0
	add r2, #0xa8
	add r3, #0xac
	ldrh r1, [r1]
	ldr r2, [r2]
	ldr r3, [r3]
	add r0, sp, #0x28
	bl MTX22_2DAffine
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r2, r4, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	add r3, r4, #0
	str r0, [sp, #4]
	add r2, #0xb0
	add r3, #0xb4
	ldr r0, _0201F21C ; =0x04000030
	ldr r2, [r2]
	ldr r3, [r3]
	add r1, sp, #0x28
	bl G2x_SetBGyAffine_
_0201F0E2:
	ldrh r1, [r4, #4]
	mov r0, #0x10
	tst r0, r1
	beq _0201F106
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0xc4
	add r2, #0xc8
	ldr r2, [r2]
	ldr r0, [r0]
	ldr r1, _0201F204 ; =0x000001FF
	lsl r2, r2, #0x10
	and r0, r1
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F220 ; =0x04001010
	str r1, [r0]
_0201F106:
	ldrh r1, [r4, #4]
	mov r0, #0x20
	tst r0, r1
	beq _0201F12A
	add r0, r4, #0
	add r2, r4, #0
	add r0, #0xf0
	add r2, #0xf4
	ldr r2, [r2]
	ldr r0, [r0]
	ldr r1, _0201F204 ; =0x000001FF
	lsl r2, r2, #0x10
	and r0, r1
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F224 ; =0x04001014
	str r1, [r0]
_0201F12A:
	ldrh r0, [r4, #4]
	mov r3, #0x40
	tst r0, r3
	beq _0201F192
	add r0, r3, #0
	add r0, #0xe4
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0201F158
	ldr r1, _0201F204 ; =0x000001FF
	add r3, #0xdc
	add r2, r1, #0
	sub r2, #0xdf
	ldr r0, [r4, r3]
	ldr r2, [r4, r2]
	and r0, r1
	lsl r2, r2, #0x10
	lsl r1, r1, #0x10
	and r1, r2
	orr r1, r0
	ldr r0, _0201F228 ; =0x04001018
	str r1, [r0]
	b _0201F192
_0201F158:
	mov r0, #2
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r1, #0xe8
	add r2, #0xec
	add r3, #0xf0
	ldrh r1, [r4, r1]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r0, sp, #0x18
	bl MTX22_2DAffine
	mov r3, #0x47
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #4
	ldr r0, [r4, r0]
	add r2, #0x18
	str r0, [sp, #4]
	add r3, #0x1c
	ldr r0, _0201F22C ; =0x04001020
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r1, sp, #0x18
	bl G2x_SetBGyAffine_
_0201F192:
	ldrh r0, [r4, #4]
	mov r3, #0x80
	tst r0, r3
	beq _0201F200
	add r0, r3, #0
	add r0, #0xd0
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0201F1C6
	add r3, #0xc8
	ldr r1, [r4, r3]
	ldr r0, _0201F204 ; =0x000001FF
	add r2, r1, #0
	add r1, r0, #0
	sub r1, #0xb3
	ldr r1, [r4, r1]
	and r2, r0
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	ldr r0, _0201F230 ; =0x0400101C
	add sp, #0x48
	str r1, [r0]
	pop {r4, pc}
_0201F1C6:
	mov r0, #2
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp]
	add r1, #0xd4
	add r2, #0xd8
	add r3, #0xdc
	ldrh r1, [r4, r1]
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r0, sp, #8
	bl MTX22_2DAffine
	mov r3, #0x52
	lsl r3, r3, #2
	ldr r0, [r4, r3]
	add r2, r3, #0
	str r0, [sp]
	add r0, r3, #4
	ldr r0, [r4, r0]
	add r2, #0x18
	str r0, [sp, #4]
	add r3, #0x1c
	ldr r0, _0201F234 ; =0x04001030
	ldr r2, [r4, r2]
	ldr r3, [r4, r3]
	add r1, sp, #8
	bl G2x_SetBGyAffine_
_0201F200:
	add sp, #0x48
	pop {r4, pc}
	.balign 4, 0
_0201F204: .word 0x000001FF
_0201F208: .word 0x04000010
_0201F20C: .word 0x04000014
_0201F210: .word 0x04000018
_0201F214: .word 0x04000020
_0201F218: .word 0x0400001C
_0201F21C: .word 0x04000030
_0201F220: .word 0x04001010
_0201F224: .word 0x04001014
_0201F228: .word 0x04001018
_0201F22C: .word 0x04001020
_0201F230: .word 0x0400101C
_0201F234: .word 0x04001030
	thumb_func_end BgConfig_HandleScheduledScrolls

	thumb_func_start ScheduleSetBgPosText
ScheduleSetBgPosText: ; 0x0201F238
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	mov r0, #0x2c
	add r1, #8
	mul r0, r4
	add r0, r1, r0
	add r1, r2, #0
	add r2, r3, #0
	bl Bg_SetPosText
	mov r0, #1
	ldrh r1, [r5, #4]
	lsl r0, r4
	orr r0, r1
	strh r0, [r5, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ScheduleSetBgPosText

	thumb_func_start ScheduleSetBgAffineRotation
ScheduleSetBgAffineRotation: ; 0x0201F25C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r1, r5, #0
	mov r0, #0x2c
	add r1, #8
	mul r0, r4
	add r0, r1, r0
	add r1, r2, #0
	add r2, r3, #0
	bl Bg_SetAffineRotation
	mov r0, #1
	ldrh r1, [r5, #4]
	lsl r0, r4
	orr r0, r1
	strh r0, [r5, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ScheduleSetBgAffineRotation

	thumb_func_start Bg_SetAffineRotation
Bg_SetAffineRotation: ; 0x0201F280
	cmp r1, #8
	bhi _0201F2C8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201F290: ; jump table
	.short _0201F2C8 - _0201F290 - 2 ; case 0
	.short _0201F2C8 - _0201F290 - 2 ; case 1
	.short _0201F2C8 - _0201F290 - 2 ; case 2
	.short _0201F2A2 - _0201F290 - 2 ; case 3
	.short _0201F2A6 - _0201F290 - 2 ; case 4
	.short _0201F2AE - _0201F290 - 2 ; case 5
	.short _0201F2B6 - _0201F290 - 2 ; case 6
	.short _0201F2BA - _0201F290 - 2 ; case 7
	.short _0201F2C2 - _0201F290 - 2 ; case 8
_0201F2A2:
	str r2, [r0, #0x1c]
	bx lr
_0201F2A6:
	ldr r1, [r0, #0x1c]
	add r1, r1, r2
	str r1, [r0, #0x1c]
	bx lr
_0201F2AE:
	ldr r1, [r0, #0x1c]
	sub r1, r1, r2
	str r1, [r0, #0x1c]
	bx lr
_0201F2B6:
	str r2, [r0, #0x20]
	bx lr
_0201F2BA:
	ldr r1, [r0, #0x20]
	add r1, r1, r2
	str r1, [r0, #0x20]
	bx lr
_0201F2C2:
	ldr r1, [r0, #0x20]
	sub r1, r1, r2
	str r1, [r0, #0x20]
_0201F2C8:
	bx lr
	.balign 4, 0
	thumb_func_end Bg_SetAffineRotation

	thumb_func_start DoesPixelAtScreenXYMatchPtrVal
DoesPixelAtScreenXYMatchPtrVal: ; 0x0201F2CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp]
	add r6, r0, #0
	str r2, [sp, #4]
	ldr r0, [sp, #0x38]
	str r3, [sp, #8]
	str r0, [sp, #0x38]
	ldr r0, [sp]
	add r4, r6, #0
	mov r1, #0x2c
	add r5, r0, #0
	mul r5, r1
	add r4, #8
	ldr r0, [r4, r5]
	cmp r0, #0
	bne _0201F2F4
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F2F4:
	add r0, r6, #0
	str r0, [sp, #0x18]
	add r0, #0x1c
	str r0, [sp, #0x18]
	ldr r3, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r2, r6, r5
	lsl r0, r0, #0x15
	lsl r1, r1, #0x15
	ldrb r2, [r2, #0x1d]
	ldrb r3, [r3, r5]
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl GetTileMapIndexFromCoords
	add r7, r0, #0
	ldr r0, [sp]
	bl BgGetCharPtr
	str r0, [sp, #0x1c]
	ldr r1, [sp, #4]
	mov r0, #7
	and r1, r0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x14]
	ldr r1, [sp, #8]
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	add r0, r6, r5
	ldrb r0, [r0, #0x1e]
	cmp r0, #0
	bne _0201F3B2
	ldr r0, [r4, r5]
	mov r1, #0x40
	str r0, [sp, #0xc]
	ldr r0, [r6]
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	lsl r0, r7, #1
	ldr r1, [sp, #0xc]
	mov ip, r0
	ldrh r0, [r1, r0]
	mov r3, #0
	mov r7, #0xf
	lsl r0, r0, #0x16
	lsr r1, r0, #0x11
	ldr r0, [sp, #0x1c]
	add r2, r0, r1
_0201F35E:
	ldrb r5, [r2, r3]
	lsl r0, r3, #1
	add r1, r4, r0
	and r5, r7
	strb r5, [r4, r0]
	ldrb r0, [r2, r3]
	asr r0, r0, #4
	strb r0, [r1, #1]
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, #0x20
	blo _0201F35E
	ldr r2, [sp, #0xc]
	mov r1, ip
	ldrh r1, [r2, r1]
	add r0, r6, #0
	asr r2, r1, #0xa
	mov r1, #3
	and r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r4, #0
	bl ApplyFlipFlagsToTile
	ldr r0, [sp, #0x10]
	lsl r1, r0, #3
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	ldrb r5, [r4, r0]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [sp, #0x38]
	ldrh r2, [r0]
	mov r0, #1
	add r1, r0, #0
	lsl r1, r5
	tst r1, r2
	beq _0201F42A
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
_0201F3B2:
	ldr r0, [sp, #0x18]
	ldrb r0, [r0, r5]
	cmp r0, #1
	beq _0201F3FE
	ldr r0, [r6]
	ldr r4, [r4, r5]
	mov r1, #0x40
	bl AllocFromHeapAtEnd
	lsl r7, r7, #1
	ldrh r1, [r4, r7]
	add r5, r0, #0
	lsl r1, r1, #0x16
	lsr r2, r1, #0x10
	ldr r1, [sp, #0x1c]
	add r1, r1, r2
	mov r2, #0x40
	bl memcpy
	ldrh r1, [r4, r7]
	add r0, r6, #0
	asr r2, r1, #0xa
	mov r1, #3
	and r1, r2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	add r2, r5, #0
	bl ApplyFlipFlagsToTile
	ldr r0, [sp, #0x10]
	lsl r1, r0, #3
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	ldrb r4, [r5, r0]
	add r0, r5, #0
	bl FreeToHeap
	b _0201F412
_0201F3FE:
	ldr r1, [r4, r5]
	ldr r0, [sp, #0x10]
	ldrb r1, [r1, r7]
	lsl r0, r0, #3
	lsl r2, r1, #6
	ldr r1, [sp, #0x14]
	add r1, r1, r2
	add r1, r0, r1
	ldr r0, [sp, #0x1c]
	ldrb r4, [r0, r1]
_0201F412:
	ldr r0, [sp, #0x38]
	ldrh r2, [r0]
	lsl r0, r2, #0x18
	lsr r1, r0, #0x18
	ldr r0, _0201F430 ; =0x0000FFFF
_0201F41C:
	cmp r2, r0
	beq _0201F42A
	cmp r4, r1
	bne _0201F41C
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0201F42A:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201F430: .word 0x0000FFFF
	thumb_func_end DoesPixelAtScreenXYMatchPtrVal

	thumb_func_start ApplyFlipFlagsToTile
ApplyFlipFlagsToTile: ; 0x0201F434
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	ldr r1, [sp]
	add r7, r2, #0
	cmp r1, #0
	beq _0201F4C0
	ldr r0, [r0]
	mov r1, #0x40
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	ldr r0, [sp]
	mov r1, #1
	tst r0, r1
	beq _0201F482
	mov r0, #0
	mov r5, #7
_0201F456:
	lsl r3, r0, #3
	add r2, r7, r3
	mov r1, #0
	add r3, r4, r3
_0201F45E:
	sub r6, r5, r1
	ldrb r6, [r2, r6]
	strb r6, [r3, r1]
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	cmp r1, #8
	blo _0201F45E
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #8
	blo _0201F456
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0x40
	bl memcpy
_0201F482:
	ldr r0, [sp]
	mov r1, #2
	tst r0, r1
	beq _0201F4BA
	mov r5, #0
	mov r6, #7
_0201F48E:
	lsl r0, r5, #3
	add r3, r4, r0
	sub r0, r6, r5
	lsl r0, r0, #3
	add r2, r7, r0
	mov r1, #8
_0201F49A:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _0201F49A
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, #8
	blo _0201F48E
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0x40
	bl memcpy
_0201F4BA:
	add r0, r4, #0
	bl FreeToHeap
_0201F4C0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ApplyFlipFlagsToTile
