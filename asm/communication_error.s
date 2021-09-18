	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6AD0:
	.byte 0x00, 0x03, 0x03, 0x1A, 0x12, 0x01, 0x23, 0x00
_020F6AD8:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020F6AE8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020F6B04:
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_0203A9DC
sub_0203A9DC: ; 0x0203A9DC
	ldr r3, _0203A9F0 ; =0x027E0000
	ldr r1, _0203A9F4 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	ldr r3, _0203A9F8 ; =MI_WaitDma
	mov r0, #3
	bx r3
	nop
_0203A9F0: .word 0x027E0000
_0203A9F4: .word 0x00003FF8
_0203A9F8: .word MI_WaitDma
	thumb_func_end sub_0203A9DC

	thumb_func_start sub_0203A9FC
sub_0203A9FC: ; 0x0203A9FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020393C8
	cmp r0, #0
	beq _0203AA10
	bl sub_02037D78
	cmp r0, #0
	bne _0203AA14
_0203AA10:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203AA14:
	bl sub_020392D8
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl ov00_021E6A70
	ldr r1, [r4]
	cmp r0, #0xb
	str r1, [r5]
	beq _0203AA36
	cmp r0, #0xe
	bge _0203AA36
	ldr r0, [r4]
	sub r0, #0x19
	cmp r0, #1
	bhi _0203AA40
_0203AA36:
	ldr r0, [r4, #4]
	cmp r0, #2
	beq _0203AA40
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203AA40:
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0203A9FC

	thumb_func_start ShowCommunicationError
ShowCommunicationError: ; 0x0203AA44
	push {r0, r1, r2, r3}
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	cmp r1, #6
	bhi _0203AA6A
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203AA5C: ; jump table
	.short _0203AA6A - _0203AA5C - 2 ; case 0
	.short _0203AA6E - _0203AA5C - 2 ; case 1
	.short _0203AA72 - _0203AA5C - 2 ; case 2
	.short _0203AA76 - _0203AA5C - 2 ; case 3
	.short _0203AA7A - _0203AA5C - 2 ; case 4
	.short _0203AA7E - _0203AA5C - 2 ; case 5
	.short _0203AA90 - _0203AA5C - 2 ; case 6
_0203AA6A:
	mov r5, #1
	b _0203AAA0
_0203AA6E:
	mov r5, #2
	b _0203AAA0
_0203AA72:
	mov r5, #3
	b _0203AAA0
_0203AA76:
	mov r5, #4
	b _0203AAA0
_0203AA7A:
	mov r5, #5
	b _0203AAA0
_0203AA7E:
	add r0, sp, #0x40
	bl sub_0203A9FC
	cmp r0, #0
	bne _0203AA8C
	mov r5, #6
	b _0203AAA0
_0203AA8C:
	mov r5, #8
	b _0203AAA0
_0203AA90:
	add r0, sp, #0x40
	bl sub_0203A9FC
	cmp r0, #0
	bne _0203AA9E
	mov r5, #7
	b _0203AAA0
_0203AA9E:
	mov r5, #9
_0203AAA0:
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	bl OS_DisableIrqMask
	ldr r1, _0203AC54 ; =sub_0203A9DC
	mov r0, #1
	bl OS_SetIrqFunction
	mov r0, #1
	bl OS_EnableIrqMask
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
	ldr r0, _0203AC58 ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _0203AC5C ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, _0203AC60 ; =gMain + 0x60
	mov r1, #0
	strb r1, [r0, #9]
	bl GX_SwapDisplay
	ldr r3, _0203AC64 ; =0x04000050
	mov r1, #0
	strh r1, [r3]
	ldr r0, _0203AC68 ; =0x04001050
	sub r3, #0x50
	strh r1, [r0]
	ldr r2, [r3]
	ldr r1, _0203AC6C ; =0xFFFF1FFF
	sub r0, #0x50
	and r2, r1
	str r2, [r3]
	ldr r2, [r0]
	and r1, r2
	str r1, [r0]
	ldr r0, _0203AC70 ; =_020F6B04
	bl GX_SetBanks
	add r0, r4, #0
	bl BgConfig_Alloc
	add r6, r0, #0
	ldr r0, _0203AC74 ; =_020F6AD8
	bl SetBothScreensModesAndDisable
	mov r1, #0
	ldr r2, _0203AC78 ; =_020F6AE8
	add r0, r6, #0
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r6, #0
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	mov r1, #0
	str r1, [sp]
	ldr r2, _0203AC7C ; =0x000001F7
	add r0, r6, #0
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
	ldr r1, _0203AC80 ; =0x00006C21
	mov r0, #0
	bl BG_SetMaskColor
	ldr r1, _0203AC80 ; =0x00006C21
	mov r0, #4
	bl BG_SetMaskColor
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x29
	add r3, r4, #0
	bl NewMsgDataFromNarc
	str r0, [sp, #0xc]
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	add r7, r0, #0
	mov r0, #6
	lsl r0, r0, #6
	add r1, r4, #0
	bl String_ctor
	str r0, [sp, #0x10]
	bl sub_02020080
	add r0, r4, #0
	bl ScrStrBufs_new
	add r4, r0, #0
	ldr r2, _0203AC84 ; =_020F6AD0
	add r0, r6, #0
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
	ldr r2, _0203AC7C ; =0x000001F7
	add r0, sp, #0x14
	mov r1, #0
	mov r3, #2
	bl DrawFrameAndWindow1
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x40]
	add r0, r4, #0
	mov r1, #0
	mov r3, #5
	bl BufferIntegerAsString
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x10]
	add r1, r5, #0
	bl ReadMsgDataIntoString
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	add r1, r7, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	add r0, sp, #0x14
	add r2, r7, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r7, #0
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
	add r0, sp, #0x14
	bl RemoveWindow
	ldr r0, [sp, #0xc]
	bl DestroyMsgData
	add r0, r4, #0
	bl ScrStrBufs_delete
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x24
	pop {r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0203AC54: .word sub_0203A9DC
_0203AC58: .word 0xFFFFE0FF
_0203AC5C: .word 0x04001000
_0203AC60: .word gMain + 0x60
_0203AC64: .word 0x04000050
_0203AC68: .word 0x04001050
_0203AC6C: .word 0xFFFF1FFF
_0203AC70: .word _020F6B04
_0203AC74: .word _020F6AD8
_0203AC78: .word _020F6AE8
_0203AC7C: .word 0x000001F7
_0203AC80: .word 0x00006C21
_0203AC84: .word _020F6AD0
	thumb_func_end ShowCommunicationError
