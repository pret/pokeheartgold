	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020183F0
sub_020183F0: ; 0x020183F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #1
	cmp r0, #0
	beq _02018402
	cmp r0, #1
	beq _02018402
	mov r1, #0
_02018402:
	cmp r1, #0
	bne _0201840A
	bl GF_AssertFail
_0201840A:
	ldr r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020183F0

	thumb_func_start sub_02018410
sub_02018410: ; 0x02018410
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	beq _02018420
	cmp r4, #1
	beq _02018420
	bl GF_AssertFail
_02018420:
	str r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02018410

	thumb_func_start sub_02018424
sub_02018424: ; 0x02018424
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r1, #0
	mov r1, #0x18
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	str r5, [r4]
	mov r2, #0
	mov r0, #0xa5
	mov r1, #1
	add r3, r5, #0
	str r2, [sp]
	bl GfGfxLoader_LoadFromNarc
	add r1, r4, #4
	str r0, [r4, #0xc]
	bl NNS_G2dGetUnpackedBGCharacterData
	mov r1, #0
	mov r0, #0xa5
	add r2, r1, #0
	add r3, r5, #0
	str r1, [sp]
	bl GfGfxLoader_LoadFromNarc
	add r1, r4, #0
	add r1, #8
	str r0, [r4, #0x10]
	bl NNS_G2dGetUnpackedPaletteData
	str r6, [r4, #0x14]
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02018424

	thumb_func_start sub_02018474
sub_02018474: ; 0x02018474
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02018474

	thumb_func_start sub_02018498
sub_02018498: ; 0x02018498
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r2, [sp]
	add r7, r1, #0
	ldr r0, [r5]
	mov r1, #0x38
	add r6, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x38
	bl MI_CpuFill8
	add r0, r7, #0
	add r1, r4, #4
	mov r2, #0x18
	bl MI_CpuCopy8
	str r5, [r4]
	add r0, sp, #8
	ldrb r1, [r0, #0x18]
	ldrb r0, [r4, #0x18]
	cmp r1, r0
	bhs _020184D0
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
_020184D0:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	ldr r0, [r5]
	add r3, sp, #8
	str r0, [r4, #0x2c]
	add r0, r4, #0
	ldrb r1, [r3, #0x10]
	add r0, #0x29
	strb r1, [r0]
	add r0, r4, #0
	ldrb r1, [r3, #0x18]
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	mov r1, #0xfe
	bic r0, r1
	ldr r1, [sp]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x18
	orr r1, r0
	add r0, r4, #0
	add r0, #0x27
	strb r1, [r0]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x30]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x34]
	add r0, r4, #0
	add r0, #0x27
	ldrb r2, [r0]
	mov r0, #1
	bic r2, r0
	ldr r0, [sp, #0x2c]
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #1
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x27
	strb r1, [r0]
	ldrb r1, [r3, #0x14]
	cmp r1, #0
	bne _02018546
	ldrb r1, [r4, #0x18]
	ldrb r3, [r4, #5]
	ldr r0, [r7, #0xc]
	mov r2, #4
	bl sub_0201881C
	add r1, r4, #0
	add r1, #0x26
	strb r0, [r1]
	b _0201854C
_02018546:
	add r0, r4, #0
	add r0, #0x26
	strb r1, [r0]
_0201854C:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _0201855E
	cmp r0, #1
	beq _02018566
	cmp r0, #2
	beq _0201859C
	bl GF_AssertFail
_0201855E:
	add r0, r4, #0
	add r0, #0x28
	strb r6, [r0]
	b _020185B8
_02018566:
	add r0, r4, #0
	add r0, #0x26
	ldrb r1, [r0]
	mov r0, #1
	add r1, r1, #1
	bic r1, r0
	add r0, r4, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r1, r0, #2
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	sub r1, r6, r0
	bpl _02018594
	add r0, r4, #0
	mov r1, #0
	add r0, #0x28
	strb r1, [r0]
	b _020185B8
_02018594:
	add r0, r4, #0
	add r0, #0x28
	strb r1, [r0]
	b _020185B8
_0201859C:
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r0, r0, #2
	sub r1, r6, r0
	bpl _020185B2
	add r0, r4, #0
	mov r1, #0
	add r0, #0x28
	strb r1, [r0]
	b _020185B8
_020185B2:
	add r0, r4, #0
	add r0, #0x28
	strb r1, [r0]
_020185B8:
	add r0, r4, #0
	bl sub_02018890
	ldr r2, [r4]
	ldr r3, [r4, #0x2c]
	ldr r2, [r2, #0x14]
	add r0, r5, #0
	add r1, r4, #4
	bl sub_02018744
	add r0, r4, #0
	bl sub_020189AC
	add r0, r4, #0
	bl sub_02018C90
	add r1, r4, #0
	add r1, #0x24
	ldrb r1, [r1]
	add r0, r4, #0
	bl sub_02018DF4
	ldr r1, _020185F8 ; =0x000005DC
	add r0, r4, #0
	bl sub_02018FE8
	add r0, r4, #0
	mov r1, #0
	bl sub_02018FFC
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020185F8: .word 0x000005DC
	thumb_func_end sub_02018498

	thumb_func_start sub_020185FC
sub_020185FC: ; 0x020185FC
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, sp, #0x18
	ldrb r5, [r4, #0x10]
	str r5, [sp]
	ldrb r5, [r4, #0x14]
	str r5, [sp, #4]
	ldrb r4, [r4, #0x18]
	str r4, [sp, #8]
	mov r4, #0
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	str r4, [sp, #0x18]
	bl sub_02018498
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end sub_020185FC

	thumb_func_start sub_02018620
sub_02018620: ; 0x02018620
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, sp, #0x18
	ldrb r5, [r4, #0x10]
	str r5, [sp]
	ldrb r5, [r4, #0x14]
	str r5, [sp, #4]
	ldrb r4, [r4, #0x18]
	str r4, [sp, #8]
	mov r4, #0
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	ldr r4, [sp, #0x34]
	str r4, [sp, #0x18]
	bl sub_02018498
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02018620

	thumb_func_start sub_02018648
sub_02018648: ; 0x02018648
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, sp, #0x18
	ldrb r5, [r4, #0x10]
	str r5, [sp]
	ldrb r5, [r4, #0x14]
	str r5, [sp, #4]
	ldrb r4, [r4, #0x18]
	str r4, [sp, #8]
	ldr r4, [sp, #0x34]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x38]
	str r4, [sp, #0x10]
	ldr r4, [sp, #0x3c]
	str r4, [sp, #0x14]
	mov r4, #0
	str r4, [sp, #0x18]
	bl sub_02018498
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02018648

	thumb_func_start sub_02018674
sub_02018674: ; 0x02018674
	add r0, #0x27
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	bx lr
	.balign 4, 0
	thumb_func_end sub_02018674

	thumb_func_start sub_02018680
sub_02018680: ; 0x02018680
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x38
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02018680

	thumb_func_start sub_02018694
sub_02018694: ; 0x02018694
	push {r4, lr}
	add r4, r0, #0
	bl sub_02018D90
	add r0, r4, #0
	bl sub_02018998
	pop {r4, pc}
	thumb_func_end sub_02018694

	thumb_func_start sub_020186A4
sub_020186A4: ; 0x020186A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x25
	ldrb r1, [r1]
	cmp r1, #1
	bne _02018716
	add r1, r5, #0
	add r1, #0x2b
	ldrb r4, [r1]
	cmp r4, #0
	bne _020186CE
	bl sub_02018694
	ldr r1, [r5, #0x10]
	add r5, #0x2a
	ldrb r0, [r5]
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_020186CE:
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r3, #0x1f
	ror r1, r3
	add r1, r2, r1
	bne _02018704
	lsr r1, r4, #1
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1f
	sub r1, r1, r2
	ror r1, r3
	add r1, r2, r1
	bne _020186F8
	add r1, r5, #0
	add r1, #0x2a
	ldrb r1, [r1]
	mov r2, #1
	bl sub_02018D0C
	b _02018704
_020186F8:
	add r1, r5, #0
	add r1, #0x2a
	ldrb r1, [r1]
	mov r2, #0
	bl sub_02018D0C
_02018704:
	add r0, r5, #0
	add r0, #0x2b
	ldrb r0, [r0]
	add r5, #0x2b
	sub r0, r0, #1
	strb r0, [r5]
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02018716:
	add r1, sp, #0
	bl sub_02018E08
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	bne _0201872C
	add r0, r5, #0
	bl sub_02018E8C
	add r4, r0, #0
_0201872C:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	bne _0201873E
	add r0, r5, #0
	bl sub_02018694
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_0201873E:
	add r0, r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020186A4

	thumb_func_start sub_02018744
sub_02018744: ; 0x02018744
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0x10
	add r7, r2, #0
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x10
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r6, #4]
	add r1, r4, #0
	str r0, [r4, #8]
	ldr r0, [r6, #8]
	mov r2, #0x80
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x10]
	str r0, [r4]
	ldrb r0, [r5, #2]
	strb r0, [r4, #4]
	ldrh r0, [r5, #8]
	strh r0, [r4, #6]
	ldrb r0, [r5, #3]
	strb r0, [r4, #5]
	ldr r0, _020187BC ; =sub_020187C0
	bl sub_0200E374
	cmp r7, #0
	beq _020187B8
	ldrb r0, [r5, #2]
	cmp r0, #4
	bhs _020187A2
	mov r0, #0x20
	str r0, [sp]
	ldrb r3, [r5, #3]
	ldr r1, [r4, #0xc]
	add r0, r7, #0
	lsl r3, r3, #0x14
	ldr r1, [r1, #0xc]
	mov r2, #0
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
	pop {r3, r4, r5, r6, r7, pc}
_020187A2:
	mov r0, #0x20
	str r0, [sp]
	ldrb r3, [r5, #3]
	ldr r1, [r4, #0xc]
	add r0, r7, #0
	lsl r3, r3, #0x14
	ldr r1, [r1, #0xc]
	mov r2, #1
	lsr r3, r3, #0x10
	bl PaletteData_LoadPalette
_020187B8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020187BC: .word sub_020187C0
	thumb_func_end sub_02018744

	thumb_func_start sub_020187C0
sub_020187C0: ; 0x020187C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, [r4, #8]
	add r5, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1, #0x10]
	bl DC_FlushRange
	ldrh r0, [r4, #6]
	ldr r3, [r4, #8]
	str r0, [sp]
	ldr r2, [r3, #0x14]
	ldrb r1, [r4, #4]
	ldr r0, [r4]
	ldr r3, [r3, #0x10]
	bl BG_LoadCharTilesData
	ldr r0, [r4, #0xc]
	mov r1, #0x20
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	ldrb r0, [r4, #4]
	cmp r0, #4
	ldr r0, [r4, #0xc]
	bhs _02018802
	ldrb r1, [r4, #5]
	ldr r0, [r0, #0xc]
	mov r2, #0x20
	lsl r1, r1, #5
	bl GX_LoadBGPltt
	b _0201880E
_02018802:
	ldrb r1, [r4, #5]
	ldr r0, [r0, #0xc]
	mov r2, #0x20
	lsl r1, r1, #5
	bl GXS_LoadBGPltt
_0201880E:
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020187C0

	thumb_func_start sub_0201881C
sub_0201881C: ; 0x0201881C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r2, [sp]
	mov r4, #0
	add r7, r1, #0
	add r5, r0, #0
	add r6, r4, #0
	str r3, [sp, #4]
	cmp r7, #0
	ble _02018864
_02018830:
	ldr r0, [r5]
	cmp r0, #0
	bne _0201883A
	bl GF_AssertFail
_0201883A:
	mov r0, #0
	ldr r1, [r5]
	mvn r0, r0
	cmp r1, r0
	bne _02018848
	bl GF_AssertFail
_02018848:
	ldr r0, [sp]
	ldr r1, [r5]
	mov r2, #0
	bl FontID_String_GetWidth
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, r4
	bls _0201885C
	add r4, r0, #0
_0201885C:
	add r6, r6, #1
	add r5, #8
	cmp r6, r7
	blt _02018830
_02018864:
	ldr r0, [sp, #4]
	lsl r0, r0, #1
	add r0, r4, r0
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	lsr r2, r3, #0x1f
	lsl r1, r3, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	bne _02018884
	lsl r0, r3, #0x15
	add sp, #8
	lsr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_02018884:
	lsr r0, r3, #3
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0201881C

	thumb_func_start sub_02018890
sub_02018890: ; 0x02018890
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldrb r1, [r5, #0x18]
	ldr r0, [r5, #0x2c]
	bl AllocWindows
	str r0, [r5, #0x1c]
	ldrb r1, [r5, #0x18]
	ldr r0, [r5, #0x2c]
	add r1, r1, #1
	lsl r1, r1, #2
	bl AllocFromHeap
	str r0, [r5, #0x20]
	ldrb r2, [r5, #0x18]
	mov r1, #0
	add r2, r2, #1
	lsl r2, r2, #2
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x20]
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	ble _02018988
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	add r6, r0, #0
	add r7, r0, #0
	add r4, r0, #0
_020188DC:
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	add r3, #0x28
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	str r0, [sp, #0xc]
	ldrh r1, [r5, #0xa]
	ldr r0, [sp, #0x1c]
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x10]
	ldrb r3, [r3]
	ldr r1, [r5, #0x1c]
	ldrb r2, [r5, #6]
	add r3, r3, #1
	lsl r3, r3, #0x18
	ldr r0, [r5, #0x14]
	add r1, r1, r6
	lsr r3, r3, #0x18
	bl AddWindowParameterized
	ldr r0, [r5, #0x1c]
	mov r1, #3
	add r0, r0, r6
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r2, r5, #0
	add r2, #0x26
	add r0, r0, #1
	lsl r0, r0, #3
	add r1, r0, r7
	ldr r0, [r5, #0x20]
	add r6, #0x10
	strb r1, [r0, r4]
	ldr r0, [r5, #0x20]
	add r7, #0x18
	add r1, r0, r4
	ldrb r0, [r0, r4]
	add r0, #0x10
	strb r0, [r1, #1]
	add r0, r5, #0
	add r0, #0x28
	ldrb r0, [r0]
	add r0, r0, #1
	lsl r1, r0, #3
	ldr r0, [r5, #0x20]
	add r0, r0, r4
	strb r1, [r0, #2]
	ldr r0, [r5, #0x20]
	ldrb r2, [r2]
	add r1, r0, r4
	ldrb r0, [r1, #2]
	lsl r2, r2, #3
	add r4, r4, #4
	add r0, r0, r2
	strb r0, [r1, #3]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	ldrb r1, [r5, #0x18]
	add r0, r0, #3
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, r1
	blt _020188DC
_02018988:
	ldr r0, [sp, #0x20]
	ldr r1, [r5, #0x20]
	mov r2, #0xff
	lsl r0, r0, #2
	strb r2, [r1, r0]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02018890

	thumb_func_start sub_02018998
sub_02018998: ; 0x02018998
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x20]
	bl FreeToHeap
	ldrb r1, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	bl WindowArray_dtor
	pop {r4, pc}
	thumb_func_end sub_02018998

	thumb_func_start sub_020189AC
sub_020189AC: ; 0x020189AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldrb r0, [r5, #0x18]
	ldrh r4, [r5, #0xc]
	sub r0, r0, #1
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _020189C6
	add r4, #0xc
_020189C6:
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	lsl r2, r4, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	add r2, r4, #1
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r3, #0x28
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	add r2, r4, #2
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	add r3, #0x28
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x24
	ldrh r4, [r5, #0xc]
	ldrb r1, [r0]
	ldr r0, [sp, #0x10]
	add r4, #9
	cmp r1, r0
	bne _02018A62
	add r4, #0xc
_02018A62:
	add r0, r5, #0
	add r0, #0x29
	ldrb r1, [r5, #0x18]
	ldrb r2, [r0]
	add r3, r5, #0
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r4, #0x10
	add r3, #0x28
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r1, [r5, #0x18]
	ldrb r2, [r0]
	add r3, r5, #0
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r2, r4, #1
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	add r3, r5, #0
	ldrb r1, [r5, #0x18]
	ldrb r2, [r0]
	add r3, #0x28
	lsl r0, r1, #1
	add r0, r1, r0
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r2, r4, #2
	lsl r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r1, [r5, #0x18]
	mov r6, #0
	sub r0, r1, #1
	cmp r0, #0
	ble _02018BFE
	ldr r0, [sp, #0x10]
	add r7, r6, #0
	sub r0, r0, #1
	str r0, [sp, #0x14]
_02018B22:
	ldrh r0, [r5, #0xc]
	add r4, r0, #6
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _02018B34
	cmp r6, #0
	beq _02018B38
_02018B34:
	cmp r0, r6
	bne _02018B3C
_02018B38:
	add r4, #0xc
	b _02018B50
_02018B3C:
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _02018B48
	ldr r1, [sp, #0x14]
	cmp r6, r1
	beq _02018B4E
_02018B48:
	add r1, r6, #1
	cmp r0, r1
	bne _02018B50
_02018B4E:
	add r4, #0x12
_02018B50:
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r1, r7, #3
	add r3, r5, #0
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsl r2, r4, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	lsr r2, r2, #0x10
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r1, r7, #3
	add r3, r5, #0
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	add r3, #0x28
	add r2, r4, #1
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	add r3, r5, #0
	add r2, r4, #2
	ldrb r0, [r0]
	add r1, r7, #3
	add r3, #0x28
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r1, [r5, #0x18]
	add r6, r6, #1
	add r7, r7, #3
	sub r0, r1, #1
	cmp r6, r0
	blt _02018B22
_02018BFE:
	mov r7, #0
	cmp r1, #0
	ble _02018C8C
	add r6, r7, #0
_02018C06:
	ldrh r0, [r5, #0xc]
	add r4, r0, #3
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, r7
	bne _02018C16
	add r4, #0xc
_02018C16:
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	lsl r2, r4, #0x10
	add r0, r0, r6
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	add r3, #0x28
	lsr r2, r2, #0x10
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	bl FillBgTilemapRect
	add r0, r5, #0
	add r0, #0x29
	ldrb r0, [r0]
	add r3, r5, #0
	add r2, r4, #2
	add r0, r0, r6
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	lsl r2, r2, #0x10
	add r3, #0x28
	str r0, [sp, #0xc]
	ldrb r4, [r3]
	add r3, r5, #0
	add r3, #0x26
	ldrb r3, [r3]
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	add r3, r4, r3
	add r3, r3, #1
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldrb r0, [r5, #0x18]
	add r7, r7, #1
	add r6, r6, #3
	cmp r7, r0
	blt _02018C06
_02018C8C:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020189AC

	thumb_func_start sub_02018C90
sub_02018C90: ; 0x02018C90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	mov r7, #0
	lsl r0, r0, #3
	str r0, [sp, #0x10]
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	ble _02018CFA
	add r6, r7, #0
	add r4, r7, #0
_02018CAA:
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	bne _02018CB6
	ldrb r3, [r5, #5]
	b _02018CC8
_02018CB6:
	ldr r1, [r5, #0x10]
	mov r0, #4
	ldr r1, [r1, r6]
	mov r2, #0
	bl FontID_String_GetWidth
	ldr r1, [sp, #0x10]
	sub r0, r1, r0
	lsr r3, r0, #1
_02018CC8:
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02018D08 ; =0x00010203
	mov r1, #4
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x10]
	ldr r0, [r5, #0x1c]
	ldr r2, [r2, r6]
	add r0, r0, r4
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #0x1c]
	add r0, r0, r4
	bl ScheduleWindowCopyToVram
	ldrb r0, [r5, #0x18]
	add r7, r7, #1
	add r6, #8
	add r4, #0x10
	cmp r7, r0
	blt _02018CAA
_02018CFA:
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02018D08: .word 0x00010203
	thumb_func_end sub_02018C90

	thumb_func_start sub_02018D0C
sub_02018D0C: ; 0x02018D0C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	cmp r2, #0
	beq _02018D20
	mov r0, #6
	ldr r7, _02018D88 ; =0x00040506
	str r0, [sp, #0x14]
	b _02018D26
_02018D20:
	mov r0, #3
	ldr r7, _02018D8C ; =0x00010203
	str r0, [sp, #0x14]
_02018D26:
	add r0, r5, #0
	add r0, #0x26
	ldrb r0, [r0]
	lsl r6, r0, #3
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x19
	bne _02018D3C
	ldrb r0, [r5, #5]
	str r0, [sp, #0x10]
	b _02018D50
_02018D3C:
	ldr r2, [r5, #0x10]
	lsl r1, r4, #3
	ldr r1, [r2, r1]
	mov r0, #4
	mov r2, #0
	bl FontID_String_GetWidth
	sub r0, r6, r0
	lsr r0, r0, #1
	str r0, [sp, #0x10]
_02018D50:
	ldr r0, [r5, #0x1c]
	lsl r6, r4, #4
	ldr r1, [sp, #0x14]
	add r0, r0, r6
	bl FillWindowPixelBuffer
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x10]
	lsl r2, r4, #3
	ldr r2, [r3, r2]
	ldr r3, [sp, #0x10]
	add r0, r0, r6
	mov r1, #4
	bl AddTextPrinterParameterized2
	ldr r0, [r5, #0x1c]
	add r0, r0, r6
	bl ScheduleWindowCopyToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02018D88: .word 0x00040506
_02018D8C: .word 0x00010203
	thumb_func_end sub_02018D0C

	thumb_func_start sub_02018D90
sub_02018D90: ; 0x02018D90
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #0x18]
	mov r6, #0
	cmp r0, #0
	ble _02018DB2
	add r4, r6, #0
_02018DA0:
	ldr r0, [r5, #0x1c]
	add r0, r0, r4
	bl ClearWindowTilemapAndScheduleTransfer
	ldrb r0, [r5, #0x18]
	add r6, r6, #1
	add r4, #0x10
	cmp r6, r0
	blt _02018DA0
_02018DB2:
	add r1, r5, #0
	add r1, #0x29
	ldrb r1, [r1]
	add r3, r5, #0
	add r3, #0x28
	str r1, [sp]
	add r1, r5, #0
	add r1, #0x26
	ldrb r1, [r1]
	mov r2, #0
	add r1, r1, #2
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsl r1, r0, #1
	add r0, r0, r1
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldrb r0, [r5, #7]
	str r0, [sp, #0xc]
	ldrb r1, [r5, #6]
	ldrb r3, [r3]
	ldr r0, [r5, #0x14]
	bl FillBgTilemapRect
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02018D90

	thumb_func_start sub_02018DF4
sub_02018DF4: ; 0x02018DF4
	push {r4, lr}
	add r4, r0, #0
	bl sub_020189AC
	ldrb r1, [r4, #6]
	ldr r0, [r4, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02018DF4

	thumb_func_start sub_02018E08
sub_02018E08: ; 0x02018E08
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	add r4, r1, #0
	bl sub_02025224
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _02018E24
	mov r1, #0
	str r1, [r4]
	pop {r4, r5, r6, pc}
_02018E24:
	lsl r0, r6, #0x18
	mov r2, #1
	lsr r1, r0, #0x18
	add r0, r5, #0
	str r2, [r4]
	add r0, #0x24
	strb r1, [r0]
	add r0, r5, #0
	bl sub_02018D0C
	add r0, r5, #0
	bl sub_020189AC
	ldrb r1, [r5, #6]
	ldr r0, [r5, #0x14]
	bl ScheduleBgTilemapBufferTransfer
	add r0, r5, #0
	mov r1, #1
	add r0, #0x25
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #8
	add r0, #0x2b
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x2a
	strb r6, [r0]
	add r0, r5, #0
	add r0, #0x27
	ldrb r1, [r0]
	mov r0, #0xfe
	bic r1, r0
	mov r0, #2
	orr r1, r0
	add r0, r5, #0
	add r0, #0x27
	strb r1, [r0]
	ldr r1, _02018E88 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #2
	bl sub_02018FFC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_02018E88: .word 0x000005DC
	thumb_func_end sub_02018E08

	thumb_func_start sub_02018E8C
sub_02018E8C: ; 0x02018E8C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02018FDC ; =gSystem
	ldr r1, [r0, #0x48]
	ldr r0, _02018FE0 ; =0x00000CF3
	tst r0, r1
	beq _02018EAA
	add r0, r5, #0
	add r0, #0x27
	ldrb r1, [r0]
	mov r0, #0xfe
	bic r1, r0
	add r0, r5, #0
	add r0, #0x27
	strb r1, [r0]
_02018EAA:
	ldr r0, _02018FDC ; =gSystem
	mov r1, #2
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02018ECA
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #3
	bl sub_02018FFC
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02018ECA:
	mov r2, #1
	add r1, r0, #0
	tst r1, r2
	beq _02018F10
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	add r0, r5, #0
	bl sub_02018D0C
	add r0, r5, #0
	mov r1, #1
	add r0, #0x25
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #8
	add r0, #0x2b
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x24
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2a
	strb r1, [r0]
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #2
	bl sub_02018FFC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02018F10:
	add r1, r5, #0
	add r1, #0x24
	ldrb r4, [r1]
	mov r1, #0x40
	tst r0, r1
	beq _02018F6E
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02018F36
	ldrb r1, [r5, #0x18]
	sub r0, r1, #1
	add r0, r4, r0
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
	b _02018F48
_02018F36:
	cmp r4, #0
	beq _02018F48
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
_02018F48:
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r4, r0
	beq _02018F6E
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #1
	bl sub_02018FFC
	add r1, r5, #0
	add r1, #0x24
	ldrb r1, [r1]
	add r0, r5, #0
	bl sub_02018DF4
_02018F6E:
	ldr r0, _02018FDC ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0x80
	tst r0, r1
	beq _02018FD6
	ldrb r0, [r5, #4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02018F96
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	ldrb r1, [r5, #0x18]
	add r0, r0, #1
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
	b _02018FB2
_02018F96:
	add r0, r5, #0
	add r0, #0x24
	ldrb r1, [r0]
	ldrb r0, [r5, #0x18]
	sub r0, r0, #1
	cmp r1, r0
	bge _02018FB2
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x24
	strb r1, [r0]
_02018FB2:
	add r0, r5, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r4, r0
	beq _02018FD6
	ldr r1, _02018FE4 ; =0x000005DC
	add r0, r5, #0
	bl sub_02018FE8
	add r0, r5, #0
	mov r1, #1
	bl sub_02018FFC
	add r0, r5, #0
	add r5, #0x24
	ldrb r1, [r5]
	bl sub_02018DF4
_02018FD6:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02018FDC: .word gSystem
_02018FE0: .word 0x00000CF3
_02018FE4: .word 0x000005DC
	thumb_func_end sub_02018E8C

	thumb_func_start sub_02018FE8
sub_02018FE8: ; 0x02018FE8
	push {r3, lr}
	add r0, #0x27
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02018FFA
	add r0, r1, #0
	bl PlaySE
_02018FFA:
	pop {r3, pc}
	thumb_func_end sub_02018FE8

	thumb_func_start sub_02018FFC
sub_02018FFC: ; 0x02018FFC
	push {r4, lr}
	ldr r4, [r0, #0x30]
	add r3, r1, #0
	cmp r4, #0
	beq _02019010
	add r1, r0, #0
	add r1, #0x24
	ldrb r1, [r1]
	ldr r2, [r0, #0x34]
	blx r4
_02019010:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02018FFC
