	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6B2C:
	.word sub_02097238
	.word sub_02097230
	.word 0
	.word sub_02097248
	.word sub_0209722C
	.word 0
	.word sub_02097258
	.word sub_02097234
	.word 0
_020F6B50:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01, 0x23, 0x00
_020F6B58:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F6B68:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020F6B84:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_0203AC88
sub_0203AC88: ; 0x0203AC88
	ldr r0, _0203AC8C ; =_020F6B2C
	bx lr
	.balign 4, 0
_0203AC8C: .word _020F6B2C
	thumb_func_end sub_0203AC88

	thumb_func_start sub_0203AC90
sub_0203AC90: ; 0x0203AC90
	mov r0, #3
	bx lr
	thumb_func_end sub_0203AC90

	thumb_func_start ShowWFCUserInfoWarning
ShowWFCUserInfoWarning: ; 0x0203AC94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0
	add r1, r0, #0
	bl sub_0201A120
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0203AE70 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0203AE74 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, _0203AE78 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r3, _0203AE7C ; =0x04000050
	mov r0, #0
	strh r0, [r3]
	ldr r2, _0203AE80 ; =0x04001050
	sub r3, #0x50
	strh r0, [r2]
	ldr r1, [r3]
	ldr r0, _0203AE84 ; =0xFFFF1FFF
	sub r2, #0x50
	and r1, r0
	str r1, [r3]
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	ldr r0, _0203AE88 ; =_020F6B84
	bl GX_SetBanks
	add r0, r4, #0
	bl BgConfig_Alloc
	str r0, [sp, #0x10]
	ldr r0, _0203AE8C ; =_020F6B58
	bl SetBothScreensModesAndDisable
	mov r1, #0
	ldr r0, [sp, #0x10]
	ldr r2, _0203AE90 ; =_020F6B68
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, _0203AE94 ; =0x000001F7
	mov r3, #2
	str r4, [sp, #4]
	bl sub_0200E3DC
	mov r0, #0
	mov r1, #0x20
	add r2, r4, #0
	bl sub_02003030
	mov r0, #0
	mov r1, #0x20
	add r2, r0, #0
	add r3, r4, #0
	bl BG_ClearCharDataRange
	ldr r1, _0203AE98 ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _0203AE98 ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r2, #0x32
	mov r0, #1
	mov r1, #0x1b
	lsl r2, r2, #4
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	add r4, r0, #0
	bl sub_02020080
	ldr r0, [sp, #0x10]
	ldr r2, _0203AE9C ; =_020F6B50
	add r1, sp, #0x14
	bl AddWindow
	mov r0, #0xd0
	str r0, [sp]
	mov r0, #0x90
	mov r2, #0
	str r0, [sp, #4]
	add r0, sp, #0x14
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r2, _0203AE94 ; =0x000001F7
	add r0, sp, #0x14
	mov r1, #0
	mov r3, #2
	bl DrawFrameAndWindow1
	ldr r0, [sp, #0xc]
	mov r1, #0x10
	add r2, r4, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, sp, #0x14
	add r2, r4, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	bl GX_BothDispOn
	mov r0, #0
	bl sub_0200FBE8
	mov r0, #1
	bl sub_0200FBE8
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl SetBrightness
	ldr r4, _0203AEA0 ; =0x04000130
	ldr r6, _0203AEA4 ; =0x027FFFA8
	mov r7, #1
_0203ADEE:
	ldrh r1, [r4]
	ldrh r0, [r6]
	orr r1, r0
	ldr r0, _0203AEA8 ; =0x00002FFF
	eor r1, r0
	and r0, r1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	bl HandleDSLidAction
	add r0, r5, #0
	tst r0, r7
	bne _0203AE12
	mov r0, #1
	add r1, r0, #0
	bl OS_WaitIrq
	b _0203ADEE
_0203AE12:
	add r0, sp, #0x14
	bl RemoveWindow
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	mov r0, #0
	add r1, r0, #0
	bl sub_0201BC28
	mov r0, #1
	mov r1, #0
	bl sub_0201BC28
	mov r0, #2
	mov r1, #0
	bl sub_0201BC28
	mov r0, #3
	mov r1, #0
	bl sub_0201BC28
	mov r0, #4
	mov r1, #0
	bl sub_0201BC28
	mov r0, #5
	mov r1, #0
	bl sub_0201BC28
	mov r0, #6
	mov r1, #0
	bl sub_0201BC28
	mov r0, #7
	mov r1, #0
	bl sub_0201BC28
	ldr r0, [sp, #0x10]
	mov r1, #0
	bl FreeBgTilemapBuffer
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0203AE70: .word 0xFFFFE0FF
_0203AE74: .word 0x04001000
_0203AE78: .word gMain + 0x60
_0203AE7C: .word 0x04000050
_0203AE80: .word 0x04001050
_0203AE84: .word 0xFFFF1FFF
_0203AE88: .word _020F6B84
_0203AE8C: .word _020F6B58
_0203AE90: .word _020F6B68
_0203AE94: .word 0x000001F7
_0203AE98: .word 0x00006C21
_0203AE9C: .word _020F6B50
_0203AEA0: .word 0x04000130
_0203AEA4: .word 0x027FFFA8
_0203AEA8: .word 0x00002FFF
	thumb_func_end ShowWFCUserInfoWarning
