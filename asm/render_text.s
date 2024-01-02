	.include "asm/macros.inc"
	.include "render_text.inc"
	.include "global.inc"

	.rodata

_020F56BC:
	.byte 0x00, 0x01, 0x02, 0x01

	.bss

_02111884:
	.space 4

_02111888:
	.space 2

	.text

	thumb_func_start sub_020021A0
sub_020021A0: ; 0x020021A0
	push {r3, lr}
	ldr r1, _02002210 ; =gSystem
	ldr r2, [r1, #0x44]
	mov r1, #3
	tst r1, r2
	beq _020021C2
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _020021C2
	ldr r1, _02002214 ; =_02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	strb r2, [r1, #3]
	mov r0, #1
	pop {r3, pc}
_020021C2:
	ldr r1, _02002214 ; =_02111884
	ldrb r0, [r1, #2]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _0200220A
	ldr r0, _02002218 ; =gSystem + 0x40
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	bne _020021D8
	mov r0, #0
	pop {r3, pc}
_020021D8:
	ldrb r2, [r1, #3]
	lsl r0, r2, #0x1e
	lsr r0, r0, #0x1f
	beq _020021FE
	ldr r0, _0200221C ; =_02111888
	bl TouchscreenHitbox_TouchHeldIsIn
	cmp r0, #0
	beq _020021FA
	ldr r1, _02002214 ; =_02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_020021FA:
	mov r0, #0
	pop {r3, pc}
_020021FE:
	mov r0, #1
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_0200220A:
	mov r0, #0
	pop {r3, pc}
	nop
_02002210: .word gSystem
_02002214: .word _02111884
_02002218: .word gSystem + 0x40
_0200221C: .word _02111888
	thumb_func_end sub_020021A0

	thumb_func_start sub_02002220
sub_02002220: ; 0x02002220
	push {r3, lr}
	ldr r0, _02002288 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0200223A
	ldr r1, _0200228C ; =_02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	strb r2, [r1, #3]
	mov r0, #1
	pop {r3, pc}
_0200223A:
	ldr r1, _0200228C ; =_02111884
	ldrb r0, [r1, #2]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _02002282
	ldr r0, _02002290 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _02002250
	mov r0, #0
	pop {r3, pc}
_02002250:
	ldrb r2, [r1, #3]
	lsl r0, r2, #0x1e
	lsr r0, r0, #0x1f
	beq _02002276
	ldr r0, _02002294 ; =_02111888
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #0
	beq _02002272
	ldr r1, _0200228C ; =_02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_02002272:
	mov r0, #0
	pop {r3, pc}
_02002276:
	mov r0, #1
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_02002282:
	mov r0, #0
	pop {r3, pc}
	nop
_02002288: .word gSystem
_0200228C: .word _02111884
_02002290: .word gSystem + 0x40
_02002294: .word _02111888
	thumb_func_end sub_02002220

	thumb_func_start RenderText
RenderText: ; 0x02002298
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x28
	ldrb r1, [r1]
	add r6, r4, #0
	add r6, #0x20
	cmp r1, #8
	bls _020022AE
	b _020027EA
_020022AE:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020022BA: ; jump table
	.short _020022CC - _020022BA - 2 ; case 0
	.short _0200269A - _020022BA - 2 ; case 1
	.short _020026B4 - _020022BA - 2 ; case 2
	.short _020026DE - _020022BA - 2 ; case 3
	.short _0200270E - _020022BA - 2 ; case 4
	.short _02002764 - _020022BA - 2 ; case 5
	.short _02002770 - _020022BA - 2 ; case 6
	.short _02002790 - _020022BA - 2 ; case 7
	.short _020027BA - _020022BA - 2 ; case 8
_020022CC:
	add r0, r6, #0
	bl sub_020021A0
	cmp r0, #0
	beq _020022F4
	add r0, r4, #0
	mov r1, #0
	add r0, #0x2a
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	beq _020022F4
	ldr r1, _020025B8 ; =_02111884
	mov r0, #0x40
	ldrb r2, [r1, #2]
	orr r0, r2
	strb r0, [r1, #2]
_020022F4:
	add r0, r4, #0
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200233E
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	beq _0200233E
	add r0, r4, #0
	add r0, #0x2a
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x2a
	strb r1, [r0]
	ldr r0, _020025B8 ; =_02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02002338
	bl sub_02002220
	cmp r0, #0
	beq _02002338
	ldrb r1, [r6]
	mov r0, #0x10
	add r4, #0x2a
	orr r0, r1
	strb r0, [r6]
	mov r0, #0
	strb r0, [r4]
_02002338:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_0200233E:
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	add r0, r4, #0
	add r0, #0x2a
	strb r1, [r0]
	ldr r0, [r4]
	ldrh r5, [r0]
	add r0, r0, #2
	str r0, [r4]
	mov r0, #0xf1
	lsl r0, r0, #8
	cmp r5, r0
	bne _02002362
	bl GF_AssertFail
_02002362:
	ldr r0, _020025BC ; =0x0000F0FD
	cmp r5, r0
	bgt _0200238C
	bge _020023C0
	ldr r1, _020025C0 ; =0x000025BD
	cmp r5, r1
	bgt _02002382
	sub r0, r1, #1
	cmp r5, r0
	blt _02002380
	bne _0200237A
	b _02002630
_0200237A:
	cmp r5, r1
	bne _02002380
	b _02002644
_02002380:
	b _02002658
_02002382:
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r5, r0
	beq _020023A4
	b _02002658
_0200238C:
	ldr r0, _020025C4 ; =0x0000FFFE
	cmp r5, r0
	bgt _02002396
	beq _020023CC
	b _02002658
_02002396:
	add r0, r0, #1
	cmp r5, r0
	beq _0200239E
	b _02002658
_0200239E:
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_020023A4:
	ldrb r0, [r4, #0xa]
	mov r1, #1
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #9]
	bl GetFontAttribute
	ldrh r1, [r4, #0x12]
	ldrh r2, [r4, #0xe]
	add sp, #0xc
	add r0, r1, r0
	add r0, r2, r0
	strh r0, [r4, #0xe]
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_020023C0:
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #2
	str r0, [r4]
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_020023CC:
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r4]
	bl MsgArray_GetControlCode
	lsl r0, r0, #0x10
	ldr r1, _020025C8 ; =0x0000FE06
	lsr r0, r0, #0x10
	cmp r0, r1
	bgt _0200240C
	blt _020023E4
	b _020025D0
_020023E4:
	mov r1, #2
	lsl r1, r1, #8
	sub r1, r0, r1
	cmp r1, #8
	bhi _02002416
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020023FA: ; jump table
	.short _02002470 - _020023FA - 2 ; case 0
	.short _020024F0 - _020023FA - 2 ; case 1
	.short _02002512 - _020023FA - 2 ; case 2
	.short _0200252A - _020023FA - 2 ; case 3
	.short _02002536 - _020023FA - 2 ; case 4
	.short _02002542 - _020023FA - 2 ; case 5
	.short _0200256E - _020023FA - 2 ; case 6
	.short _0200249C - _020023FA - 2 ; case 7
	.short _020024C6 - _020023FA - 2 ; case 8
_0200240C:
	mov r1, #0xff
	lsl r1, r1, #8
	cmp r0, r1
	bgt _02002418
	beq _02002422
_02002416:
	b _02002622
_02002418:
	add r1, r1, #1
	cmp r0, r1
	bne _02002420
	b _02002590
_02002420:
	b _02002622
_02002422:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0xff
	bne _02002452
	ldrb r0, [r4, #0x15]
	ldrb r2, [r4, #0x1b]
	sub r1, r0, #1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0x64
	strb r0, [r4, #0x1b]
	cmp r2, #0x64
	blo _02002492
	cmp r2, #0x6b
	bhs _02002492
	sub r2, #0x64
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	b _0200245A
_02002452:
	cmp r0, #0x64
	blo _0200245A
	strb r0, [r4, #0x1b]
	b _02002622
_0200245A:
	lsl r1, r0, #1
	add r0, r1, #1
	strb r0, [r4, #0x15]
	add r0, r1, #2
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x16]
	ldrb r2, [r4, #0x17]
	bl GenerateFontHalfRowLookupTable
	b _02002622
_02002470:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	ldrh r1, [r4, #0xc]
	ldrh r2, [r4, #0xe]
	add r0, r4, #0
	bl RenderScreenFocusIndicatorTile
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _02002494
_02002492:
	b _02002622
_02002494:
	ldr r0, [r4, #4]
	bl CopyWindowToVram
	b _02002622
_0200249C:
	add r0, r4, #0
	mov r1, #7
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl MsgArray_SkipControlCode
	str r0, [r4]
	mov r1, #0xe
	ldrh r2, [r0]
	lsl r1, r1, #0xc
	cmp r2, r1
	bne _020024C0
	add r0, r0, #2
	str r0, [r4]
_020024C0:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020024C6:
	add r0, r4, #0
	mov r1, #8
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl MsgArray_SkipControlCode
	str r0, [r4]
	mov r1, #0xe
	ldrh r2, [r0]
	lsl r1, r1, #0xc
	cmp r2, r1
	bne _020024EA
	add r0, r0, #2
	str r0, [r4]
_020024EA:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020024F0:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	add r1, r4, #0
	add r1, #0x2a
	strb r0, [r1]
	ldr r0, [r4]
	bl MsgArray_SkipControlCode
	str r0, [r4]
	mov r0, #6
	add r4, #0x28
	strb r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002512:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	strh r0, [r4, #0x2e]
	ldr r0, [r4]
	bl MsgArray_SkipControlCode
	str r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_0200252A:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	strh r0, [r4, #0xc]
	b _02002622
_02002536:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	strh r0, [r4, #0xe]
	b _02002622
_02002542: ; 0x0205
	ldr r0, [r4, #4]
	bl GetWindowWidth
	lsl r5, r0, #3
	ldrb r0, [r4, #9]
	ldrh r2, [r4, #0x10]
	ldr r1, [r4]
	bl FontID_FlatArray_GetWidthFirstLine
	cmp r0, r5
	bge _02002568
	sub r1, r5, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	ldrb r2, [r4, #0xa]
	asr r0, r0, #1
	add r0, r2, r0
	strh r0, [r4, #0xc]
	b _02002622
_02002568:
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	b _02002622
_0200256E:
	ldr r0, [r4, #4]
	bl GetWindowWidth
	lsl r5, r0, #3
	ldrb r0, [r4, #9]
	ldrh r2, [r4, #0x10]
	ldr r1, [r4]
	bl FontID_FlatArray_GetWidthFirstLine
	cmp r0, r5
	bge _0200258A
	sub r0, r5, r0
	strh r0, [r4, #0xc]
	b _02002622
_0200258A:
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	b _02002622
_02002590:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x64
	beq _020025A6
	cmp r0, #0xc8
	beq _020025AE
	b _02002622
_020025A6:
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r0, [r4, #0x1a]
	b _02002622
_020025AE:
	ldr r0, _020025CC ; =0x0000FFFC
	strh r0, [r4, #0x18]
	mov r0, #0
	strb r0, [r4, #0x1a]
	b _02002622
	.balign 4, 0
_020025B8: .word _02111884
_020025BC: .word 0x0000F0FD
_020025C0: .word 0x000025BD
_020025C4: .word 0x0000FFFE
_020025C8: .word 0x0000FE06
_020025CC: .word 0x0000FFFC
_020025D0:
	ldr r0, [r4]
	mov r1, #0
	bl MsgArray_ControlCodeGetField
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0xfe
	lsl r0, r0, #8
	cmp r1, r0
	beq _02002606
	add r0, r0, #1
	cmp r1, r0
	bne _02002622
	add r0, r4, #0
	mov r1, #2
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl MsgArray_SkipControlCode
	str r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002606:
	add r0, r4, #0
	mov r1, #3
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl MsgArray_SkipControlCode
	str r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002622:
	ldr r0, [r4]
	bl MsgArray_SkipControlCode
	str r0, [r4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_02002630:
	add r0, r4, #0
	mov r1, #2
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002644:
	add r0, r4, #0
	mov r1, #3
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002658:
	ldrb r0, [r6]
	add r1, r5, #0
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bl FontID_TryLoadGlyph
	add r5, r0, #0
	ldrh r0, [r4, #0xc]
	add r2, r5, #0
	add r3, r5, #0
	str r0, [sp]
	ldrh r0, [r4, #0xe]
	add r2, #0x80
	add r3, #0x81
	str r0, [sp, #4]
	ldrh r0, [r4, #0x18]
	add r1, r5, #0
	str r0, [sp, #8]
	ldrb r2, [r2]
	ldrb r3, [r3]
	ldr r0, [r4, #4]
	bl CopyGlyphToWindow
	add r5, #0x80
	ldrb r1, [r5]
	ldrh r0, [r4, #0x10]
	ldrh r2, [r4, #0xc]
	add sp, #0xc
	add r0, r1, r0
	add r0, r2, r0
	strh r0, [r4, #0xc]
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0200269A:
	bl TextPrinterWait
	cmp r0, #0
	beq _020026AE
	add r0, r4, #0
	bl TextPrinterClearDownArrow
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_020026AE:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020026B4:
	bl TextPrinterWaitWithDownArrow
	cmp r0, #0
	beq _020026D8
	add r0, r4, #0
	bl TextPrinterClearDownArrow
	ldrb r1, [r4, #0x16]
	ldr r0, [r4, #4]
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #0xb]
	strh r0, [r4, #0xe]
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_020026D8:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020026DE:
	bl TextPrinterWaitWithDownArrow
	cmp r0, #0
	beq _02002708
	add r0, r4, #0
	bl TextPrinterClearDownArrow
	ldrb r0, [r4, #9]
	mov r1, #1
	bl GetFontAttribute
	ldrh r1, [r4, #0x12]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x2b
	strb r1, [r0]
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	mov r0, #4
	add r4, #0x28
	strb r0, [r4]
_02002708:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_0200270E:
	add r0, #0x2b
	ldrb r2, [r0]
	cmp r2, #0
	beq _02002758
	cmp r2, #4
	ldrb r5, [r4, #0x16]
	bge _02002730
	lsl r3, r5, #4
	orr r3, r5
	lsl r3, r3, #0x18
	ldr r0, [r4, #4]
	mov r1, #0
	lsr r3, r3, #0x18
	bl ScrollWindow
	mov r1, #0
	b _0200274A
_02002730:
	lsl r3, r5, #4
	orr r3, r5
	lsl r3, r3, #0x18
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #4
	lsr r3, r3, #0x18
	bl ScrollWindow
	add r0, r4, #0
	add r0, #0x2b
	ldrb r0, [r0]
	sub r1, r0, #4
_0200274A:
	add r0, r4, #0
	add r0, #0x2b
	strb r1, [r0]
	ldr r0, [r4, #4]
	bl CopyWindowToVram
	b _0200275E
_02002758:
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_0200275E:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002764:
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002770:
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _02002784
	add r0, r4, #0
	add r0, #0x2a
	ldrb r0, [r0]
	add r4, #0x2a
	sub r0, r0, #1
	b _02002788
_02002784:
	mov r0, #0
	add r4, #0x28
_02002788:
	add sp, #0xc
	strb r0, [r4]
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002790:
	bl TextPrinterWaitWithDownArrow
	cmp r0, #0
	beq _020027B4
	add r0, r4, #0
	bl TextPrinterClearDownArrow
	ldrb r1, [r4, #0x16]
	ldr r0, [r4, #4]
	bl FillWindowPixelBuffer
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #0xb]
	strh r0, [r4, #0xe]
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_020027B4:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020027BA:
	bl TextPrinterWaitWithDownArrow
	cmp r0, #0
	beq _020027E4
	add r0, r4, #0
	bl TextPrinterClearDownArrow
	ldrb r0, [r4, #9]
	mov r1, #1
	bl GetFontAttribute
	ldrh r1, [r4, #0x12]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x2b
	strb r1, [r0]
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	mov r0, #4
	add r4, #0x28
	strb r0, [r4]
_020027E4:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020027EA:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end RenderText

	thumb_func_start sub_020027F0
sub_020027F0: ; 0x020027F0
	ldr r1, _020027F8 ; =_02111884
	strh r0, [r1]
	bx lr
	nop
_020027F8: .word _02111884
	thumb_func_end sub_020027F0

	thumb_func_start sub_020027FC
sub_020027FC: ; 0x020027FC
	ldr r2, _02002830 ; =_02111884
	add r1, r0, #0
	ldrb r2, [r2, #2]
	add r1, #0x20
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x1f
	beq _02002814
	ldrb r3, [r1, #2]
	mov r2, #0xff
	bic r3, r2
	strb r3, [r1, #2]
	b _02002824
_02002814:
	ldrb r3, [r1, #1]
	mov r2, #0x60
	bic r3, r2
	strb r3, [r1, #1]
	ldrb r3, [r1, #1]
	mov r2, #0x1f
	bic r3, r2
	strb r3, [r1, #1]
_02002824:
	ldr r1, _02002830 ; =_02111884
	ldr r3, _02002834 ; =sub_0200EB68
	ldr r0, [r0, #4]
	ldrh r1, [r1]
	bx r3
	nop
_02002830: .word _02111884
_02002834: .word sub_0200EB68
	thumb_func_end sub_020027FC

	thumb_func_start TextPrinterDrawDownArrow
TextPrinterDrawDownArrow: ; 0x02002838
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, _020029D0 ; =_02111884
	add r4, r5, #0
	ldrb r0, [r0, #2]
	add r4, #0x20
	lsl r1, r0, #0x1d
	lsr r1, r1, #0x1f
	bne _02002852
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02002854
_02002852:
	b _020029CC
_02002854:
	ldrb r0, [r4, #1]
	lsl r1, r0, #0x1b
	lsr r2, r1, #0x1b
	beq _02002872
	mov r1, #0x1f
	add r2, #0xff
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x1f
	and r1, r2
	orr r0, r1
	add sp, #0x30
	strb r0, [r4, #1]
	pop {r3, r4, r5, r6, r7, pc}
_02002872:
	ldr r0, [r5, #4]
	bl GetWindowBgId
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	bl GetWindowX
	str r0, [sp, #0x24]
	ldr r0, [r5, #4]
	bl GetWindowY
	add r7, r0, #0
	ldr r0, [r5, #4]
	bl GetWindowWidth
	str r0, [sp, #0x28]
	ldr r0, [r5, #4]
	bl GetWindowHeight
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _020029D0 ; =_02111884
	add r7, r7, r1
	ldrh r6, [r0]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	add r2, r6, #0
	add r0, r1, r0
	str r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x18]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	str r2, [sp, #0x2c]
	add r2, #0x12
	str r2, [sp, #0x2c]
	ldrb r2, [r4, #1]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =_020F56BC
	ldr r0, [r0]
	ldrb r2, [r2, r3]
	lsl r3, r2, #2
	ldr r2, [sp, #0x2c]
	add r2, r2, r3
	ldr r3, [sp, #0x18]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x1c]
	add r2, r6, #0
	add r0, r0, #2
	str r0, [sp, #0x10]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	add r2, #0x13
	mov ip, r2
	ldrb r2, [r4, #1]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =_020F56BC
	ldr r0, [r0]
	ldrb r2, [r2, r3]
	mov r3, ip
	lsl r2, r2, #2
	add r2, r3, r2
	ldr r3, [sp, #0x10]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r7, #1
	str r0, [sp, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldrb r2, [r4, #1]
	add r7, r6, #0
	ldr r0, [r5, #4]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =_020F56BC
	add r7, #0x14
	ldrb r2, [r2, r3]
	ldr r3, [sp, #0x18]
	ldr r0, [r0]
	lsl r2, r2, #2
	add r2, r7, r2
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x20]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [sp, #0x14]
	add r6, #0x15
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldrb r2, [r4, #1]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =_020F56BC
	ldr r0, [r0]
	ldrb r2, [r2, r3]
	ldr r3, [sp, #0x10]
	lsl r2, r2, #2
	add r2, r6, r2
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	bl BgCommitTilemapBufferToVram
	ldrb r1, [r4, #1]
	mov r0, #0x1f
	bic r1, r0
	mov r0, #8
	orr r0, r1
	strb r0, [r4, #1]
	ldrb r2, [r4, #1]
	mov r1, #0x60
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x19
	lsr r1, r1, #0x1e
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x19
	orr r0, r1
	strb r0, [r4, #1]
_020029CC:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020029D0: .word _02111884
_020029D4: .word _020F56BC
	thumb_func_end TextPrinterDrawDownArrow

	thumb_func_start TextPrinterClearDownArrow
TextPrinterClearDownArrow: ; 0x020029D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _02002A80 ; =_02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _02002A7C
	ldr r0, [r5, #4]
	bl GetWindowBgId
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	bl GetWindowX
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	bl GetWindowY
	add r6, r0, #0
	ldr r0, [r5, #4]
	bl GetWindowWidth
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	bl GetWindowHeight
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _02002A80 ; =_02111884
	add r7, r6, r1
	ldrh r4, [r0]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	add r6, r1, r0
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	add r2, #0xa
	add r3, r6, #1
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	add r4, #0xb
	add r3, r6, #2
	lsl r2, r4, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	bl BgCommitTilemapBufferToVram
_02002A7C:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02002A80: .word _02111884
	thumb_func_end TextPrinterClearDownArrow

	thumb_func_start TextPrinterContinue
TextPrinterContinue: ; 0x02002A84
	push {r3, lr}
	bl sub_02002220
	cmp r0, #0
	beq _02002AA2
	ldr r0, _02002AA8 ; =0x000005DC
	bl PlaySE
	ldr r1, _02002AAC ; =_02111884
	mov r0, #0x80
	ldrb r2, [r1, #2]
	orr r0, r2
	strb r0, [r1, #2]
	mov r0, #1
	pop {r3, pc}
_02002AA2:
	mov r0, #0
	pop {r3, pc}
	nop
_02002AA8: .word 0x000005DC
_02002AAC: .word _02111884
	thumb_func_end TextPrinterContinue

	thumb_func_start TextPrinterWaitAutoMode
TextPrinterWaitAutoMode: ; 0x02002AB0
	push {r4, lr}
	add r2, r0, #0
	add r2, #0x20
	ldrb r1, [r2, #2]
	add r4, r1, #0
	cmp r4, #0x64
	bne _02002AC2
	mov r0, #1
	pop {r4, pc}
_02002AC2:
	mov r3, #0xff
	bic r1, r3
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	orr r1, r3
	strb r1, [r2, #2]
	ldr r1, _02002AE8 ; =_02111884
	ldrb r1, [r1, #2]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1f
	beq _02002AE4
	bl TextPrinterContinue
	pop {r4, pc}
_02002AE4:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02002AE8: .word _02111884
	thumb_func_end TextPrinterWaitAutoMode

	thumb_func_start TextPrinterWaitWithDownArrow
TextPrinterWaitWithDownArrow: ; 0x02002AEC
	push {r4, lr}
	ldr r1, _02002B0C ; =_02111884
	add r4, r0, #0
	ldrb r1, [r1, #2]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _02002B00
	bl TextPrinterWaitAutoMode
	pop {r4, pc}
_02002B00:
	bl TextPrinterDrawDownArrow
	add r0, r4, #0
	bl TextPrinterContinue
	pop {r4, pc}
	.balign 4, 0
_02002B0C: .word _02111884
	thumb_func_end TextPrinterWaitWithDownArrow

	thumb_func_start TextPrinterWait
TextPrinterWait: ; 0x02002B10
	push {r3, lr}
	ldr r1, _02002B30 ; =_02111884
	ldrb r1, [r1, #2]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _02002B26
	bl TextPrinterWaitAutoMode
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
_02002B26:
	bl TextPrinterContinue
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
_02002B30: .word _02111884
	thumb_func_end TextPrinterWait

	thumb_func_start TextFlags_SetCanABSpeedUpPrint
TextFlags_SetCanABSpeedUpPrint: ; 0x02002B34
	ldr r2, _02002B4C ; =_02111884
	mov r1, #1
	ldrb r3, [r2, #2]
	lsl r0, r0, #0x18
	bic r3, r1
	lsr r1, r0, #0x18
	mov r0, #1
	and r0, r1
	orr r0, r3
	strb r0, [r2, #2]
	bx lr
	nop
_02002B4C: .word _02111884
	thumb_func_end TextFlags_SetCanABSpeedUpPrint

	thumb_func_start sub_02002B50
sub_02002B50: ; 0x02002B50
	push {r3, r4}
	ldr r1, _02002B88 ; =_02111884
	mov r3, #4
	ldrb r2, [r1, #2]
	mov r4, #1
	bic r2, r3
	add r3, r0, #0
	and r3, r4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1d
	orr r2, r3
	asr r0, r0, #1
	and r0, r4
	strb r2, [r1, #2]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r2, [r1, #2]
	mov r3, #0x20
	lsr r0, r0, #0x1a
	bic r2, r3
	orr r0, r2
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
	nop
_02002B88: .word _02111884
	thumb_func_end sub_02002B50

	thumb_func_start sub_02002B8C
sub_02002B8C: ; 0x02002B8C
	ldr r2, _02002BA4 ; =_02111884
	lsl r0, r0, #0x18
	ldrb r3, [r2, #2]
	lsr r0, r0, #0x18
	mov r1, #0x10
	lsl r0, r0, #0x1f
	bic r3, r1
	lsr r0, r0, #0x1b
	orr r0, r3
	strb r0, [r2, #2]
	bx lr
	nop
_02002BA4: .word _02111884
	thumb_func_end sub_02002B8C

	thumb_func_start sub_02002BA8
sub_02002BA8: ; 0x02002BA8
	ldr r2, _02002BC0 ; =_02111884
	lsl r0, r0, #0x18
	ldrb r3, [r2, #2]
	lsr r0, r0, #0x18
	mov r1, #2
	lsl r0, r0, #0x1f
	bic r3, r1
	lsr r0, r0, #0x1e
	orr r0, r3
	strb r0, [r2, #2]
	bx lr
	nop
_02002BC0: .word _02111884
	thumb_func_end sub_02002BA8

	thumb_func_start sub_02002BC4
sub_02002BC4: ; 0x02002BC4
	ldr r0, _02002BD0 ; =_02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	bx lr
	nop
_02002BD0: .word _02111884
	thumb_func_end sub_02002BC4

	thumb_func_start sub_02002BD4
sub_02002BD4: ; 0x02002BD4
	ldr r1, _02002BE0 ; =_02111884
	mov r0, #0x40
	ldrb r2, [r1, #2]
	bic r2, r0
	strb r2, [r1, #2]
	bx lr
	.balign 4, 0
_02002BE0: .word _02111884
	thumb_func_end sub_02002BD4

	thumb_func_start sub_02002BE4
sub_02002BE4: ; 0x02002BE4
	ldr r0, _02002BF0 ; =_02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bx lr
	nop
_02002BF0: .word _02111884
	thumb_func_end sub_02002BE4

	thumb_func_start sub_02002BF4
sub_02002BF4: ; 0x02002BF4
	ldr r1, _02002C00 ; =_02111884
	mov r0, #0x80
	ldrb r2, [r1, #2]
	bic r2, r0
	strb r2, [r1, #2]
	bx lr
	.balign 4, 0
_02002C00: .word _02111884
	thumb_func_end sub_02002BF4

	thumb_func_start sub_02002C04
sub_02002C04: ; 0x02002C04
	ldr r0, _02002C1C ; =_02111884
	ldrb r1, [r0, #2]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1f
	beq _02002C16
	ldrb r0, [r0, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
_02002C16:
	mov r0, #0
	bx lr
	nop
_02002C1C: .word _02111884
	thumb_func_end sub_02002C04

	thumb_func_start sub_02002C20
sub_02002C20: ; 0x02002C20
	ldr r2, _02002C3C ; =_02111884
	mov r1, #2
	ldrb r3, [r2, #3]
	orr r1, r3
	strb r1, [r2, #3]
	ldrb r1, [r0]
	strb r1, [r2, #4]
	ldrb r1, [r0, #1]
	strb r1, [r2, #5]
	ldrb r1, [r0, #2]
	strb r1, [r2, #6]
	ldrb r0, [r0, #3]
	strb r0, [r2, #7]
	bx lr
	.balign 4, 0
_02002C3C: .word _02111884
	thumb_func_end sub_02002C20

	thumb_func_start sub_02002C40
sub_02002C40: ; 0x02002C40
	ldr r1, _02002C5C ; =_02111884
	mov r0, #2
	ldrb r2, [r1, #3]
	bic r2, r0
	strb r2, [r1, #3]
	mov r2, #0
	strb r2, [r1, #4]
	mov r0, #0xc0
	strb r0, [r1, #5]
	strb r2, [r1, #6]
	mov r0, #0xff
	strb r0, [r1, #7]
	bx lr
	nop
_02002C5C: .word _02111884
	thumb_func_end sub_02002C40

	thumb_func_start sub_02002C60
sub_02002C60: ; 0x02002C60
	push {r3, lr}
	cmp r0, #0
	bne _02002C7A
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #3
	bl sub_02002B50
	mov r0, #1
	bl sub_02002B8C
	pop {r3, pc}
_02002C7A:
	mov r0, #1
	bl sub_02002B50
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02002C60

	thumb_func_start sub_02002C90
sub_02002C90: ; 0x02002C90
	push {r3, lr}
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02002C90
