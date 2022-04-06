	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

sFadeFuncPtrs:
	.word FadeFunc_00
	.word FadeFunc_01
	.word FadeFunc_02
	.word FadeFunc_03
	.word FadeFunc_04
	.word FadeFunc_05
	.word FadeFunc_06
	.word FadeFunc_07
	.word FadeFunc_08
	.word FadeFunc_09
	.word FadeFunc_10
	.word FadeFunc_11
	.word FadeFunc_12
	.word FadeFunc_13
	.word FadeFunc_14
	.word FadeFunc_15
	.word FadeFunc_16
	.word FadeFunc_17
	.word FadeFunc_18
	.word FadeFunc_19
	.word FadeFunc_20
	.word FadeFunc_21
	.word FadeFunc_22
	.word FadeFunc_23
	.word FadeFunc_24
	.word FadeFunc_25
	.word FadeFunc_26
	.word FadeFunc_27
	.word FadeFunc_28
	.word FadeFunc_29
	.word FadeFunc_30
	.word FadeFunc_31
	.word FadeFunc_32
	.word FadeFunc_33
	.word FadeFunc_34
	.word FadeFunc_35
	.word FadeFunc_36
	.word FadeFunc_37
	.word FadeFunc_38
	.word FadeFunc_39
	.word FadeFunc_40
	.word FadeFunc_41
	.word FadeFunc_42

	.bss

_021D0EF4:
	.space 0x4

_021D0EF8:
	.space 0x4

_021D0EFC:
	.space 0xC

_021D0F08:
	.space 0x30

_021D0F38:
	.space 0x30

_021D0F68:
	.space 0x18

_021D0F80:
	.space 0xB4

_021D1034:
	.space 0x14

	.text

	thumb_func_start BeginNormalPaletteFade
BeginNormalPaletteFade: ; 0x0200FA24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [sp, #0x30]
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	cmp r0, #0
	bne _0200FA3A
	bl GF_AssertFail
_0200FA3A:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	bne _0200FA44
	bl GF_AssertFail
_0200FA44:
	ldr r0, _0200FB00 ; =_021D1034
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _0200FA50
	bl GF_AssertFail
_0200FA50:
	ldr r0, _0200FB04 ; =_021D0EF4
	bl sub_020100C4
	ldr r1, _0200FB04 ; =_021D0EF4
	add r0, r5, #0
	bl sub_0200FE14
	ldr r0, _0200FB08 ; =_021D0F68
	bl sub_0200FEB0
	ldr r0, _0200FB04 ; =_021D0EF4
	add r1, r6, #0
	bl sub_02010018
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0200FB0C ; =_021D0F80
	ldr r2, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, _0200FB08 ; =_021D0F68
	ldr r3, [sp, #0x34]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x38]
	add r1, r4, #0
	str r0, [sp, #0x14]
	ldr r0, _0200FB10 ; =_021D0F08
	str r5, [sp, #0x18]
	bl sub_0200FE84
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _0200FB0C ; =_021D0F80
	ldr r2, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, _0200FB08 ; =_021D0F68
	ldr r3, [sp, #0x34]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x38]
	add r1, r7, #0
	str r0, [sp, #0x14]
	ldr r0, _0200FB14 ; =_021D0F38
	str r5, [sp, #0x18]
	bl sub_0200FE84
	ldr r0, _0200FB00 ; =_021D1034
	mov r1, #1
	strh r1, [r0, #0xc]
	ldr r0, _0200FB18 ; =_021D0EF8
	ldr r1, _0200FB10 ; =_021D0F08
	bl FadeWork_UpdateFrame
	ldr r0, _0200FB1C ; =_021D0EFC
	ldr r1, _0200FB14 ; =_021D0F38
	bl FadeWork_UpdateFrame
	ldr r0, _0200FB20 ; =_021D0EF4
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0200FAE2
	ldr r0, _0200FB04 ; =_021D0EF4
	add r0, #0x14
	bl sub_02010064
	ldr r1, _0200FB24 ; =0x0000014E
	ldr r0, _0200FB04 ; =_021D0EF4
	mov r2, #1
	strb r2, [r0, r1]
_0200FAE2:
	ldr r0, _0200FB04 ; =_021D0EF4
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0200FAFA
	ldr r0, _0200FB04 ; =_021D0EF4
	add r0, #0x44
	bl sub_02010064
	ldr r1, _0200FB28 ; =0x0000014F
	ldr r0, _0200FB04 ; =_021D0EF4
	mov r2, #1
	strb r2, [r0, r1]
_0200FAFA:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0200FB00: .word _021D1034
_0200FB04: .word _021D0EF4
_0200FB08: .word _021D0F68
_0200FB0C: .word _021D0F80
_0200FB10: .word _021D0F08
_0200FB14: .word _021D0F38
_0200FB18: .word _021D0EF8
_0200FB1C: .word _021D0EFC
_0200FB20: .word _021D0EF4
_0200FB24: .word 0x0000014E
_0200FB28: .word 0x0000014F
	thumb_func_end BeginNormalPaletteFade

	thumb_func_start HandleFadeUpdateFrame
HandleFadeUpdateFrame: ; 0x0200FB2C
	push {r4, lr}
	ldr r0, _0200FB54 ; =_021D1034
	ldr r4, _0200FB58 ; =_021D0EF4
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	beq _0200FB50
	add r1, r4, #0
	add r2, r4, #0
	add r0, r4, #0
	add r1, #0x14
	add r2, #0x44
	bl DoFadeUpdateFrame
	cmp r0, #1
	bne _0200FB50
	add r0, r4, #0
	bl HandleEndFade
_0200FB50:
	pop {r4, pc}
	nop
_0200FB54: .word _021D1034
_0200FB58: .word _021D0EF4
	thumb_func_end HandleFadeUpdateFrame

	thumb_func_start IsPaletteFadeFinished
IsPaletteFadeFinished: ; 0x0200FB5C
	ldr r0, _0200FB6C ; =_021D1034
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	bne _0200FB68
	mov r0, #1
	bx lr
_0200FB68:
	mov r0, #0
	bx lr
	.balign 4, 0
_0200FB6C: .word _021D1034
	thumb_func_end IsPaletteFadeFinished

	thumb_func_start sub_0200FB70
sub_0200FB70: ; 0x0200FB70
	push {r3, lr}
	ldr r0, _0200FBBC ; =_021D0F68
	mov r1, #0
	bl sub_0200FF5C
	ldr r0, _0200FBBC ; =_021D0F68
	mov r1, #1
	bl sub_0200FF5C
	ldr r0, _0200FBC0 ; =_021D0EF4
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0200FB8E
	mov r1, #2
	str r1, [r0, #0x20]
_0200FB8E:
	ldr r0, _0200FBC0 ; =_021D0EF4
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0200FB9A
	mov r1, #2
	str r1, [r0, #0x50]
_0200FB9A:
	ldr r0, _0200FBC4 ; =_021D0EF8
	ldr r1, _0200FBC8 ; =_021D0F08
	bl FadeWork_UpdateFrame
	ldr r0, _0200FBCC ; =_021D0EFC
	ldr r1, _0200FBD0 ; =_021D0F38
	bl FadeWork_UpdateFrame
	ldr r0, _0200FBD4 ; =_021D1034
	mov r1, #0
	strh r1, [r0, #0xc]
	strb r1, [r0, #0xe]
	strb r1, [r0, #0xf]
	ldr r0, _0200FBD8 ; =_021D0EF4
	bl sub_020100C4
	pop {r3, pc}
	.balign 4, 0
_0200FBBC: .word _021D0F68
_0200FBC0: .word _021D0EF4
_0200FBC4: .word _021D0EF8
_0200FBC8: .word _021D0F08
_0200FBCC: .word _021D0EFC
_0200FBD0: .word _021D0F38
_0200FBD4: .word _021D1034
_0200FBD8: .word _021D0EF4
	thumb_func_end sub_0200FB70

	thumb_func_start sub_0200FBDC
sub_0200FBDC: ; 0x0200FBDC
	ldr r3, _0200FBE4 ; =sub_020131F4
	add r1, r0, #0
	mov r0, #0
	bx r3
	.balign 4, 0
_0200FBE4: .word sub_020131F4
	thumb_func_end sub_0200FBDC

	thumb_func_start SetMasterBrightnessNeutral
SetMasterBrightnessNeutral: ; 0x0200FBE8
	ldr r3, _0200FBF0 ; =SetMasterBrightness
	mov r1, #0
	bx r3
	nop
_0200FBF0: .word SetMasterBrightness
	thumb_func_end SetMasterBrightnessNeutral

	thumb_func_start sub_0200FBF4
sub_0200FBF4: ; 0x0200FBF4
	ldr r2, _0200FC10 ; =0x0000FFFF
	cmp r1, r2
	bne _0200FBFE
	ldr r1, _0200FC14 ; =_021D1034
	ldrh r1, [r1, #0x10]
_0200FBFE:
	ldr r2, _0200FC18 ; =0x00007FFF
	cmp r1, r2
	bne _0200FC08
	mov r1, #0x10
	b _0200FC0C
_0200FC08:
	mov r1, #0xf
	mvn r1, r1
_0200FC0C:
	ldr r3, _0200FC1C ; =SetMasterBrightness
	bx r3
	.balign 4, 0
_0200FC10: .word 0x0000FFFF
_0200FC14: .word _021D1034
_0200FC18: .word 0x00007FFF
_0200FC1C: .word SetMasterBrightness
	thumb_func_end sub_0200FBF4

	thumb_func_start sub_0200FC20
sub_0200FC20: ; 0x0200FC20
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _0200FC54 ; =0x0000FFFF
	cmp r4, r0
	bne _0200FC2E
	ldr r0, _0200FC58 ; =_021D1034
	ldrh r4, [r0, #0x10]
_0200FC2E:
	ldr r0, _0200FC5C ; =0x00007FFF
	cmp r4, r0
	bne _0200FC38
	mov r5, #0x10
	b _0200FC3C
_0200FC38:
	mov r5, #0xf
	mvn r5, r5
_0200FC3C:
	mov r0, #0
	add r1, r5, #0
	bl SetMasterBrightness
	mov r0, #1
	add r1, r5, #0
	bl SetMasterBrightness
	ldr r0, _0200FC58 ; =_021D1034
	strh r4, [r0, #0x10]
	pop {r3, r4, r5, pc}
	nop
_0200FC54: .word 0x0000FFFF
_0200FC58: .word _021D1034
_0200FC5C: .word 0x00007FFF
	thumb_func_end sub_0200FC20

	thumb_func_start sub_0200FC60
sub_0200FC60: ; 0x0200FC60
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #0xc
	add r1, sp, #0x18
	ldrh r2, [r1, #4]
	add r4, r0, #0
	ldr r0, _0200FCD0 ; =0x0000FFFF
	cmp r2, r0
	bne _0200FC78
	ldr r0, _0200FCD4 ; =_021D1034
	ldrh r0, [r0, #0x10]
	strh r0, [r1, #4]
_0200FC78:
	cmp r4, #0
	add r0, sp, #0x1c
	bne _0200FC88
	mov r1, #0
	mov r2, #2
	bl GX_LoadBGPltt
	b _0200FC90
_0200FC88:
	mov r1, #0
	mov r2, #2
	bl GXS_LoadBGPltt
_0200FC90:
	ldr r0, _0200FCD8 ; =_021D0F80
	mov r1, #1
	add r2, r4, #0
	bl sub_02013424
	mov r2, #0
	ldr r0, _0200FCD8 ; =_021D0F80
	mov r1, #0x3f
	add r3, r2, #0
	str r4, [sp]
	bl sub_02013440
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, _0200FCD8 ; =_021D0F80
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp, #8]
	bl sub_02013488
	ldr r0, _0200FCD8 ; =_021D0F80
	mov r1, #0x20
	mov r2, #0
	add r3, r4, #0
	bl sub_02013468
	add sp, #0xc
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0200FCD0: .word 0x0000FFFF
_0200FCD4: .word _021D1034
_0200FCD8: .word _021D0F80
	thumb_func_end sub_0200FC60

	thumb_func_start sub_0200FCDC
sub_0200FCDC: ; 0x0200FCDC
	push {r0, r1, r2, r3}
	push {r3, lr}
	add r0, sp, #8
	mov r1, #0
	mov r2, #2
	bl GX_LoadBGPltt
	add r0, sp, #8
	mov r1, #0
	mov r2, #2
	bl GXS_LoadBGPltt
	pop {r3}
	pop {r3}
	add sp, #0x10
	bx r3
	thumb_func_end sub_0200FCDC

	thumb_func_start SetMasterBrightness
SetMasterBrightness: ; 0x0200FCFC
	push {r3, lr}
	cmp r0, #0
	bne _0200FD0A
	; GX_SetMasterBrightness(a1);
	ldr r0, _0200FD14 ; =0x0400006C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
_0200FD0A:
	; GXS_SetMasterBrightness(a1);
	ldr r0, _0200FD18 ; =0x0400106C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
	nop
_0200FD14: .word 0x0400006C
_0200FD18: .word 0x0400106C
	thumb_func_end SetMasterBrightness

	thumb_func_start HandleEndFade
HandleEndFade: ; 0x0200FD1C
	push {r4, lr}
	mov r1, #0x53
	add r4, r0, #0
	mov r2, #0
	lsl r1, r1, #2
	strh r2, [r4, r1]
	bl sub_0201002C
	mov r1, #0x15
	lsl r1, r1, #4
	strh r0, [r4, r1]
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0200FD4C
	add r0, r4, #0
	add r0, #0x14
	bl sub_02010094
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0200FD4C
	ldr r0, _0200FD70 ; =_021D1034
	mov r1, #0
	strb r1, [r0, #0xe]
_0200FD4C:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0200FD66
	add r0, r4, #0
	add r0, #0x44
	bl sub_02010094
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0200FD66
	ldr r0, _0200FD70 ; =_021D1034
	mov r1, #0
	strb r1, [r0, #0xf]
_0200FD66:
	add r0, r4, #0
	bl sub_020100C4
	pop {r4, pc}
	nop
_0200FD70: .word _021D1034
	thumb_func_end HandleEndFade

	thumb_func_start DoFadeUpdateFrame
DoFadeUpdateFrame: ; 0x0200FD74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r2, #0
	cmp r0, #0
	beq _0200FD8A
	cmp r0, #1
	beq _0200FD9C
	cmp r0, #2
	beq _0200FDB6
	b _0200FDCE
_0200FD8A:
	add r0, r5, #4
	bl FadeWork_UpdateFrame
	add r0, r5, #0
	add r0, #8
	add r1, r4, #0
	bl FadeWork_UpdateFrame
	b _0200FDCE
_0200FD9C:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0200FDAA
	add r0, r5, #4
	bl FadeWork_UpdateFrame
	b _0200FDCE
_0200FDAA:
	add r0, r5, #0
	add r0, #8
	add r1, r4, #0
	bl FadeWork_UpdateFrame
	b _0200FDCE
_0200FDB6:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0200FDC8
	add r0, r5, #0
	add r0, #8
	add r1, r4, #0
	bl FadeWork_UpdateFrame
	b _0200FDCE
_0200FDC8:
	add r0, r5, #4
	bl FadeWork_UpdateFrame
_0200FDCE:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _0200FDDE
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0200FDDE
	mov r0, #1
	pop {r3, r4, r5, pc}
_0200FDDE:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end DoFadeUpdateFrame

	thumb_func_start FadeWork_UpdateFrame
FadeWork_UpdateFrame: ; 0x0200FDE4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0200FDFC
	add r0, r1, #0
	bl CallFadeFunc
	cmp r0, #1
	bne _0200FDFC
	mov r0, #0
	str r0, [r4]
_0200FDFC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FadeWork_UpdateFrame

	thumb_func_start CallFadeFunc
CallFadeFunc: ; 0x0200FE00
	push {r3, lr}
	ldr r1, [r0]
	lsl r2, r1, #2
	ldr r1, _0200FE10 ; =sFadeFuncPtrs
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_0200FE10: .word sFadeFuncPtrs
	thumb_func_end CallFadeFunc

	thumb_func_start sub_0200FE14
sub_0200FE14: ; 0x0200FE14
	push {r3, lr}
	cmp r0, #4
	bhi _0200FE74
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0200FE26: ; jump table
	.short _0200FE30 - _0200FE26 - 2 ; case 0
	.short _0200FE3E - _0200FE26 - 2 ; case 1
	.short _0200FE4C - _0200FE26 - 2 ; case 2
	.short _0200FE5A - _0200FE26 - 2 ; case 3
	.short _0200FE68 - _0200FE26 - 2 ; case 4
_0200FE30:
	mov r2, #1
	add r0, r1, #0
	mov r1, #0
	add r3, r2, #0
	bl sub_0200FE78
	pop {r3, pc}
_0200FE3E:
	add r0, r1, #0
	mov r1, #1
	add r2, r1, #0
	add r3, r1, #0
	bl sub_0200FE78
	pop {r3, pc}
_0200FE4C:
	mov r2, #1
	add r0, r1, #0
	mov r1, #2
	add r3, r2, #0
	bl sub_0200FE78
	pop {r3, pc}
_0200FE5A:
	add r0, r1, #0
	mov r1, #1
	add r2, r1, #0
	mov r3, #0
	bl sub_0200FE78
	pop {r3, pc}
_0200FE68:
	add r0, r1, #0
	mov r1, #2
	mov r2, #0
	mov r3, #1
	bl sub_0200FE78
_0200FE74:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0200FE14

	thumb_func_start sub_0200FE78
sub_0200FE78: ; 0x0200FE78
	str r1, [r0]
	str r2, [r0, #4]
	str r3, [r0, #8]
	str r2, [r0, #0xc]
	str r3, [r0, #0x10]
	bx lr
	thumb_func_end sub_0200FE78

	thumb_func_start sub_0200FE84
sub_0200FE84: ; 0x0200FE84
	str r1, [r0]
	str r2, [r0, #4]
	ldr r1, [sp]
	str r3, [r0, #8]
	str r1, [r0, #0xc]
	ldr r1, [sp, #4]
	str r1, [r0, #0x14]
	ldr r1, [sp, #8]
	str r1, [r0, #0x10]
	ldr r1, [sp, #0xc]
	str r1, [r0, #0x18]
	ldr r1, [sp, #0x10]
	str r1, [r0, #0x1c]
	ldr r1, [sp, #0x14]
	str r1, [r0, #0x20]
	ldr r1, _0200FEAC ; =0xFFFFFFF0
	add r1, sp
	ldrh r1, [r1, #0x28]
	strh r1, [r0, #0x24]
	bx lr
	.balign 4, 0
_0200FEAC: .word 0xFFFFFFF0
	thumb_func_end sub_0200FE84

	thumb_func_start sub_0200FEB0
sub_0200FEB0: ; 0x0200FEB0
	mov r3, #0
	ldr r1, _0200FEC8 ; =sub_02010014
	add r2, r3, #0
_0200FEB6:
	str r2, [r0]
	str r1, [r0, #8]
	str r2, [r0, #0x10]
	add r3, r3, #1
	add r0, r0, #4
	cmp r3, #2
	blt _0200FEB6
	bx lr
	nop
_0200FEC8: .word sub_02010014
	thumb_func_end sub_0200FEB0

	thumb_func_start sub_0200FECC
sub_0200FECC: ; 0x0200FECC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0200FED2:
	ldr r0, [r5]
	ldr r1, [r5, #8]
	blx r1
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _0200FED2
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200FECC

	thumb_func_start sub_0200FEE4
sub_0200FEE4: ; 0x0200FEE4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	str r0, [sp, #8]
	add r0, #0x10
	lsl r4, r3, #2
	str r0, [sp, #8]
	ldr r0, [r0, r4]
	add r7, r2, #0
	str r1, [sp]
	cmp r0, #0
	beq _0200FF06
	bl GF_AssertFail
_0200FF06:
	add r6, r5, #0
	add r6, #8
	ldr r0, [r6, r4]
	cmp r0, #0
	bne _0200FF14
	bl GF_AssertFail
_0200FF14:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0200FF2E
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _0200FF2E
	ldr r0, _0200FF54 ; =sub_0200FECC
	add r1, r5, #0
	bl Main_SetHBlankIntrCB
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
_0200FF2E:
	ldr r0, [sp, #4]
	cmp r0, #1
	beq _0200FF38
	bl GF_AssertFail
_0200FF38:
	ldr r0, [sp]
	cmp r7, #0
	str r0, [r5, r4]
	beq _0200FF44
	str r7, [r6, r4]
	b _0200FF48
_0200FF44:
	ldr r0, _0200FF58 ; =sub_02010014
	str r0, [r6, r4]
_0200FF48:
	ldr r0, [sp, #8]
	mov r1, #1
	str r1, [r0, r4]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0200FF54: .word sub_0200FECC
_0200FF58: .word sub_02010014
	thumb_func_end sub_0200FEE4

	thumb_func_start sub_0200FF5C
sub_0200FF5C: ; 0x0200FF5C
	push {r3, r4, r5, lr}
	lsl r4, r1, #2
	add r5, r0, #0
	mov r1, #0
	add r0, r5, r4
	str r1, [r0, #0x10]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bne _0200FF78
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _0200FF78
	bl HBlankInterruptDisable
_0200FF78:
	ldr r1, _0200FF84 ; =sub_02010014
	add r0, r5, r4
	str r1, [r0, #8]
	mov r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0200FF84: .word sub_02010014
	thumb_func_end sub_0200FF5C

	thumb_func_start sub_0200FF88
sub_0200FF88: ; 0x0200FF88
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, [sp, #0x18]
	mov r1, #0x10
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeapAtEnd
	add r1, r0, #0
	str r5, [r1]
	str r4, [r1, #4]
	mov r2, #1
	str r6, [r1, #8]
	ldr r0, _0200FFB0 ; =sub_0200FFD8
	lsl r2, r2, #0xa
	str r7, [r1, #0xc]
	bl sub_0200E374
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0200FFB0: .word sub_0200FFD8
	thumb_func_end sub_0200FF88

	thumb_func_start sub_0200FFB4
sub_0200FFB4: ; 0x0200FFB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r2, #0
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r1, r0, #0
	mov r2, #1
	str r5, [r1]
	ldr r0, _0200FFD4 ; =sub_0200FFF8
	lsl r2, r2, #0xa
	str r4, [r1, #4]
	bl sub_0200E374
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0200FFD4: .word sub_0200FFF8
	thumb_func_end sub_0200FFB4

	thumb_func_start sub_0200FFD8
sub_0200FFD8: ; 0x0200FFD8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	bl sub_0200FEE4
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200FFD8

	thumb_func_start sub_0200FFF8
sub_0200FFF8: ; 0x0200FFF8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	bl sub_0200FF5C
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200FFF8

	thumb_func_start sub_02010014
sub_02010014: ; 0x02010014
	bx lr
	.balign 4, 0
	thumb_func_end sub_02010014

	thumb_func_start sub_02010018
sub_02010018: ; 0x02010018
	ldr r2, _02010028 ; =0x0000FFFF
	cmp r1, r2
	bne _02010024
	mov r1, #0x15
	lsl r1, r1, #4
	ldrh r1, [r0, r1]
_02010024:
	add r0, r1, #0
	bx lr
	.balign 4, 0
_02010028: .word 0x0000FFFF
	thumb_func_end sub_02010018

	thumb_func_start sub_0201002C
sub_0201002C: ; 0x0201002C
	ldr r1, [r0, #0xc]
	cmp r1, #1
	bne _02010038
	add r2, r0, #0
	add r2, #0x14
	b _0201003C
_02010038:
	add r2, r0, #0
	add r2, #0x44
_0201003C:
	ldr r1, [r2, #0x28]
	cmp r1, #1
	bne _02010046
	ldrh r0, [r2, #0x24]
	bx lr
_02010046:
	mov r1, #0x15
	lsl r1, r1, #4
	ldrh r0, [r0, r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201002C

	thumb_func_start sub_02010050
sub_02010050: ; 0x02010050
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1, #0x10]
	mov r1, #0
	bl SetMasterBrightness
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end sub_02010050

	thumb_func_start sub_02010064
sub_02010064: ; 0x02010064
	push {r3, lr}
	add r1, r0, #0
	ldr r0, [r1, #0x28]
	cmp r0, #0
	bne _0201008A
	ldrh r2, [r1, #0x24]
	ldr r0, _0201008C ; =0x00007FFF
	cmp r2, r0
	beq _0201007A
	cmp r2, #0
	bne _0201008A
_0201007A:
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _0201008A
	mov r2, #1
	ldr r0, _02010090 ; =sub_02010050
	lsl r2, r2, #0xa
	bl sub_0200E374
_0201008A:
	pop {r3, pc}
	.balign 4, 0
_0201008C: .word 0x00007FFF
_02010090: .word sub_02010050
	thumb_func_end sub_02010064

	thumb_func_start sub_02010094
sub_02010094: ; 0x02010094
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x28]
	cmp r0, #1
	bne _020100BC
	ldrh r1, [r4, #0x24]
	ldr r0, _020100C0 ; =0x00007FFF
	cmp r1, r0
	beq _020100AA
	cmp r1, #0
	bne _020100BC
_020100AA:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _020100BC
	ldr r0, [r4, #0x10]
	bl sub_0200FBF4
	ldr r0, [r4, #0x10]
	bl sub_0200FBDC
_020100BC:
	pop {r4, pc}
	nop
_020100C0: .word 0x00007FFF
	thumb_func_end sub_02010094

	thumb_func_start sub_020100C4
sub_020100C4: ; 0x020100C4
	push {r4, lr}
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_020100CE:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _020100CE
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0
	mov r2, #0x30
	bl memset
	add r0, r4, #0
	add r0, #0x44
	mov r1, #0
	mov r2, #0x30
	bl memset
	add r2, r4, #0
	add r2, #0x74
	mov r1, #0x18
	mov r0, #0
_020100F6:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _020100F6
	add r4, #0x8c
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc0
	bl memset
	pop {r4, pc}
	thumb_func_end sub_020100C4
