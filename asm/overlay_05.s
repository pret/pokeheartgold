	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov05_0221BA00
ov05_0221BA00: ; 0x0221BA00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0221BA5C ; =ov05_0221BA70
	ldr r1, _0221BA60 ; =0x00000BD4
	ldr r3, [r5, #0x24]
	mov r2, #0x64
	bl sub_02007200
	bl sub_0201F988
	ldr r2, _0221BA60 ; =0x00000BD4
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, _0221BA64 ; =0x00000B7F
	str r5, [r4]
	mov r1, #0
	strb r1, [r4, r0]
	bl sub_020304B4
	ldr r1, _0221BA68 ; =0x00000BC8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0221BA58
	ldr r0, [r4]
	ldr r1, [r0]
	cmp r1, #0
	beq _0221BA58
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0221BA58
	bl Sav2_Bag_get
	ldr r1, _0221BA6C ; =0x000001D1
	ldr r3, [r5, #0x24]
	mov r2, #1
	bl Bag_HasItem
	ldr r1, _0221BA68 ; =0x00000BC8
	str r0, [r4, r1]
_0221BA58:
	pop {r3, r4, r5, pc}
	nop
_0221BA5C: .word ov05_0221BA70
_0221BA60: .word 0x00000BD4
_0221BA64: .word 0x00000B7F
_0221BA68: .word 0x00000BC8
_0221BA6C: .word 0x000001D1
	thumb_func_end ov05_0221BA00

	thumb_func_start ov05_0221BA70
ov05_0221BA70: ; 0x0221BA70
	push {r4, r5, r6, lr}
	ldr r2, _0221BAF8 ; =0x00000B7F
	add r5, r1, #0
	ldrb r2, [r5, r2]
	cmp r2, #0
	beq _0221BA86
	cmp r2, #1
	beq _0221BA92
	cmp r2, #2
	beq _0221BAC4
	b _0221BACC
_0221BA86:
	add r0, r5, #0
	bl ov05_0221BD28
	ldr r1, _0221BAF8 ; =0x00000B7F
	strb r0, [r5, r1]
	b _0221BACC
_0221BA92:
	mov r4, #0x2e
	lsl r4, r4, #6
	add r6, r4, #0
_0221BA98:
	ldrb r1, [r5, r6]
	ldr r2, [r5, #4]
	add r0, r5, #0
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	blx r1
	cmp r0, #0
	beq _0221BAAE
	ldrb r1, [r5, r4]
	add r1, r1, #1
	strb r1, [r5, r4]
_0221BAAE:
	cmp r0, #2
	beq _0221BA98
	ldr r0, [r5]
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #2
	bne _0221BACC
	add r0, r5, #0
	bl ov05_0221BB30
	b _0221BACC
_0221BAC4:
	bl ov05_0221CC74
	cmp r0, #1
	beq _0221BAF6
_0221BACC:
	mov r0, #0x2e
	lsl r0, r0, #6
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _0221BAE6
	add r0, r5, #0
	bl ov05_0221CE50
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D020
_0221BAE6:
	ldr r0, [r5]
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221BAF6
	ldr r0, _0221BAFC ; =0x04000540
	mov r1, #1
	str r1, [r0]
_0221BAF6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221BAF8: .word 0x00000B7F
_0221BAFC: .word 0x04000540
	thumb_func_end ov05_0221BA70

	thumb_func_start ov05_0221BB00
ov05_0221BB00: ; 0x0221BB00
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _0221BB2C ; =ov05_0221EC00
	add r3, sp, #0
	mov r2, #5
_0221BB0A:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0221BB0A
	add r0, sp, #0
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	add sp, #0x28
	pop {r4, pc}
	nop
_0221BB2C: .word ov05_0221EC00
	thumb_func_end ov05_0221BB00

	thumb_func_start ov05_0221BB30
ov05_0221BB30: ; 0x0221BB30
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov05_0221E9F8
	cmp r0, #0
	bne _0221BB40
	b _0221BD08
_0221BB40:
	ldr r2, _0221BD0C ; =0x00000BBC
	ldr r0, [r4, r2]
	cmp r0, #8
	bhi _0221BBBA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221BB54: ; jump table
	.short _0221BD08 - _0221BB54 - 2 ; case 0
	.short _0221BB66 - _0221BB54 - 2 ; case 1
	.short _0221BBA6 - _0221BB54 - 2 ; case 2
	.short _0221BBC4 - _0221BB54 - 2 ; case 3
	.short _0221BC5C - _0221BB54 - 2 ; case 4
	.short _0221BC98 - _0221BB54 - 2 ; case 5
	.short _0221BD08 - _0221BB54 - 2 ; case 6
	.short _0221BCD8 - _0221BB54 - 2 ; case 7
	.short _0221BD08 - _0221BB54 - 2 ; case 8
_0221BB66:
	add r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221BD10 ; =0x00000BAC
	mov r1, #0
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	ldr r2, _0221BD14 ; =0x00000B88
	str r3, [sp, #4]
	add r0, r4, r2
	str r3, [sp, #8]
	add r2, #0x2c
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0221BD18 ; =0x00000BB8
	str r0, [r4, r1]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0221BD0C ; =0x00000BBC
	mov r1, #2
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BBA6:
	add r0, r2, #0
	add r0, #0xc
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0221BBBA
	ldr r0, _0221BD1C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _0221BBBC
_0221BBBA:
	b _0221BD08
_0221BBBC:
	mov r0, #3
	add sp, #0xc
	str r0, [r4, r2]
	pop {r3, r4, pc}
_0221BBC4:
	add r0, r2, #0
	add r0, #0x10
	ldr r0, [r4, r0]
	cmp r0, #1
	bne _0221BBE0
	add r0, r2, #0
	sub r0, #0x10
	sub r2, #8
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #2
	bl ReadMsgDataIntoString
	b _0221BBF0
_0221BBE0:
	add r0, r2, #0
	sub r0, #0x10
	sub r2, #8
	ldr r0, [r4, r0]
	ldr r2, [r4, r2]
	mov r1, #1
	bl ReadMsgDataIntoString
_0221BBF0:
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _0221BD20 ; =0x00000B98
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _0221BD20 ; =0x00000B98
	mov r1, #0
	add r0, r4, r0
	mov r2, #1
	mov r3, #0xf
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	ldr r2, _0221BD20 ; =0x00000B98
	str r3, [sp, #4]
	add r0, r4, r2
	str r3, [sp, #8]
	add r2, #0x1c
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0221BD18 ; =0x00000BB8
	mov r2, #0x1f
	str r0, [r4, r1]
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r1, _0221BD24 ; =ov05_0221EA58
	ldr r0, [r0, #0x24]
	mov r3, #0xe
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl CreateYesNoMenu
	mov r1, #0x2f
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0221BD0C ; =0x00000BBC
	mov r1, #4
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BC5C:
	ldr r1, [r4]
	add r0, r2, #4
	ldr r0, [r4, r0]
	ldr r1, [r1, #0x24]
	bl Handle2dMenuInput_DeleteOnFinish
	cmp r0, #0
	beq _0221BC78
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	beq _0221BC88
	add sp, #0xc
	pop {r3, r4, pc}
_0221BC78:
	ldr r0, _0221BD0C ; =0x00000BBC
	mov r1, #5
	str r1, [r4, r0]
	mov r1, #0
	add r0, r0, #4
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BC88:
	ldr r0, _0221BD0C ; =0x00000BBC
	mov r1, #1
	str r1, [r4, r0]
	mov r1, #0
	add r0, r0, #4
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BC98:
	add r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221BD10 ; =0x00000BAC
	mov r1, #5
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	ldr r2, _0221BD14 ; =0x00000B88
	str r3, [sp, #4]
	add r0, r4, r2
	str r3, [sp, #8]
	add r2, #0x2c
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0221BD18 ; =0x00000BB8
	str r0, [r4, r1]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0221BD0C ; =0x00000BBC
	mov r1, #6
	add sp, #0xc
	str r1, [r4, r0]
	pop {r3, r4, pc}
_0221BCD8:
	add r0, r2, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221BCF0
	ldr r1, [r4]
	ldr r1, [r1, #0x24]
	bl Clear2dMenuWindowAndDelete
	mov r0, #0x2f
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
_0221BCF0:
	ldr r0, _0221BD14 ; =0x00000B88
	mov r1, #0
	add r0, r4, r0
	bl ClearFrameAndWindow2
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0221BD0C ; =0x00000BBC
	mov r1, #8
	str r1, [r4, r0]
_0221BD08:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0221BD0C: .word 0x00000BBC
_0221BD10: .word 0x00000BAC
_0221BD14: .word 0x00000B88
_0221BD18: .word 0x00000BB8
_0221BD1C: .word gSystem
_0221BD20: .word 0x00000B98
_0221BD24: .word ov05_0221EA58
	thumb_func_end ov05_0221BB30

	thumb_func_start ov05_0221BD28
ov05_0221BD28: ; 0x0221BD28
	push {r3, r4, r5, lr}
	ldr r1, _0221BDE0 ; =0x04000050
	add r4, r0, #0
	mov r0, #0
	strh r0, [r1]
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _0221BDE4 ; =0xFFFFE0FF
	ldr r5, _0221BDE8 ; =0x04000304
	and r0, r2
	str r0, [r1]
	ldr r0, _0221BDEC ; =0x04001000
	add r1, #0x50
	ldr r3, [r0]
	and r2, r3
	str r2, [r0]
	ldrh r3, [r5]
	lsr r2, r5, #0xb
	add r0, #0x50
	orr r2, r3
	strh r2, [r5]
	mov r2, #0
	strh r2, [r1]
	strh r2, [r0]
	bl ov05_0221BB00
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	bl BgConfig_Alloc
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r0, [r0, #0x24]
	bl sub_020030E8
	str r0, [r4, #8]
	ldr r3, [r4]
	mov r1, #0
	ldr r3, [r3, #0x24]
	lsr r2, r5, #0x11
	bl PaletteData_AllocBuffers
	mov r0, #4
	mov r1, #0
	bl BG_SetMaskColor
	ldr r0, _0221BDF0 ; =0x00000B82
	mov r3, #0
	strb r3, [r4, r0]
	sub r1, r0, #1
	mov r2, #8
	strb r2, [r4, r1]
	sub r0, r0, #2
	strb r3, [r4, r0]
	ldr r1, [r4]
	add r0, r1, #0
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221BDBE
	cmp r0, #1
	beq _0221BDC4
	cmp r0, #2
	beq _0221BDCA
	b _0221BDDC
_0221BDBE:
	ldr r0, _0221BDF4 ; =ov05_0221EAC0
	str r0, [r4, #4]
	b _0221BDDC
_0221BDC4:
	ldr r0, _0221BDF8 ; =ov05_0221EA98
	str r0, [r4, #4]
	b _0221BDDC
_0221BDCA:
	add r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #3
	bne _0221BDD8
	ldr r0, _0221BDFC ; =ov05_0221EC28
	str r0, [r4, #4]
	b _0221BDDC
_0221BDD8:
	ldr r0, _0221BE00 ; =ov05_0221EC98
	str r0, [r4, #4]
_0221BDDC:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221BDE0: .word 0x04000050
_0221BDE4: .word 0xFFFFE0FF
_0221BDE8: .word 0x04000304
_0221BDEC: .word 0x04001000
_0221BDF0: .word 0x00000B82
_0221BDF4: .word ov05_0221EAC0
_0221BDF8: .word ov05_0221EA98
_0221BDFC: .word ov05_0221EC28
_0221BE00: .word ov05_0221EC98
	thumb_func_end ov05_0221BD28

	thumb_func_start ov05_0221BE04
ov05_0221BE04: ; 0x0221BE04
	push {r4, lr}
	ldr r1, _0221BE78 ; =0x00000B82
	add r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0
	beq _0221BE1A
	cmp r2, #1
	beq _0221BE26
	cmp r2, #2
	beq _0221BE32
	b _0221BE6C
_0221BE1A:
	bl ov05_0221DB94
	add r0, r4, #0
	bl ov05_0221DC60
	b _0221BE6C
_0221BE26:
	bl ov05_0221E07C
	add r0, r4, #0
	bl ov05_0221E274
	b _0221BE6C
_0221BE32:
	mov r2, #0
	strb r2, [r4, r1]
	mov r2, #0x20
	sub r1, r1, #1
	strb r2, [r4, r1]
	bl ov05_0221DD08
	add r0, r4, #0
	bl ov05_0221E5E4
	add r0, r4, #0
	bl ov05_0221E944
	add r0, r4, #0
	bl ov05_0221DE38
	bl sub_0203A880
	ldr r1, [r4]
	mov r0, #0
	ldr r1, [r1, #0x24]
	bl sub_020880CC
	ldr r0, _0221BE7C ; =ov05_0221CE88
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	mov r0, #1
	pop {r4, pc}
_0221BE6C:
	ldr r0, _0221BE78 ; =0x00000B82
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0221BE78: .word 0x00000B82
_0221BE7C: .word ov05_0221CE88
	thumb_func_end ov05_0221BE04

	thumb_func_start ov05_0221BE80
ov05_0221BE80: ; 0x0221BE80
	push {r4, lr}
	ldr r1, _0221BF00 ; =0x00000B82
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0221BE96
	cmp r1, #1
	beq _0221BEAA
	cmp r1, #2
	beq _0221BEC4
	b _0221BEF2
_0221BE96:
	mov r1, #1
	mov r2, #0
	bl ov05_0221CEB8
	add r0, r4, #0
	bl ov05_0221D094
	bl ov05_0221D228
	b _0221BEF2
_0221BEAA:
	mov r1, #0
	add r2, r1, #0
	bl ov05_0221D6C4
	add r0, r4, #0
	bl ov05_0221D240
	bl sub_0203A880
	add r0, r4, #0
	bl ov05_0221D9F0
	b _0221BEF2
_0221BEC4:
	ldr r1, [r4]
	mov r0, #0
	ldr r1, [r1, #0x24]
	bl sub_020880CC
	ldr r0, _0221BF04 ; =ov05_0221CE88
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r1, _0221BF00 ; =0x00000B82
	mov r0, #0
	strb r0, [r4, r1]
	mov r2, #8
	sub r0, r1, #6
	strb r2, [r4, r0]
	sub r0, r1, #5
	mov r2, #4
	strb r2, [r4, r0]
	mov r0, #0x10
	sub r1, #0xe
	str r0, [r4, r1]
	mov r0, #1
	pop {r4, pc}
_0221BEF2:
	ldr r0, _0221BF00 ; =0x00000B82
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	nop
_0221BF00: .word 0x00000B82
_0221BF04: .word ov05_0221CE88
	thumb_func_end ov05_0221BE80

	thumb_func_start ov05_0221BF08
ov05_0221BF08: ; 0x0221BF08
	push {r3, r4, r5, lr}
	ldr r1, _0221C000 ; =0x00000B82
	add r5, r0, #0
	ldrb r1, [r5, r1]
	cmp r1, #0
	beq _0221BF1E
	cmp r1, #1
	beq _0221BF7A
	cmp r1, #2
	beq _0221BF92
	b _0221BFF2
_0221BF1E:
	mov r1, #0
	mov r2, #1
	bl ov05_0221CEB8
	add r0, r5, #0
	bl ov05_0221D094
	add r0, r5, #0
	bl ov05_0221D140
	bl ov05_0221D228
	ldr r2, [r5]
	mov r0, #7
	ldr r1, [r2]
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	ldr r1, [r2, #0x24]
	add r2, sp, #0
	mov r3, #0
	bl sub_0202FD28
	ldr r1, [sp]
	ldr r0, _0221C004 ; =0x00000BCC
	mov r4, #0
	str r1, [r5, r0]
	add r0, r0, #4
	str r4, [r5, r0]
_0221BF56:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _0221BF72
	bl PlayerProfile_GetVersion
	cmp r0, #0
	bne _0221BF72
	mov r0, #0xbd
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r5, r0]
	b _0221BFF2
_0221BF72:
	add r4, r4, #1
	cmp r4, #8
	blt _0221BF56
	b _0221BFF2
_0221BF7A:
	mov r1, #0x1f
	mvn r1, r1
	add r2, r1, #0
	add r2, #0x10
	bl ov05_0221D6C4
	add r0, r5, #0
	bl ov05_0221D7AC
	bl sub_0203A880
	b _0221BFF2
_0221BF92:
	ldr r1, [r5]
	mov r0, #0
	ldr r1, [r1, #0x24]
	bl sub_020880CC
	ldr r0, _0221C008 ; =ov05_0221CE88
	add r1, r5, #0
	bl Main_SetVBlankIntrCB
	ldr r2, _0221C000 ; =0x00000B82
	mov r0, #0
	strb r0, [r5, r2]
	mov r3, #4
	sub r1, r2, #6
	strb r3, [r5, r1]
	sub r1, r2, #5
	mov r3, #2
	strb r3, [r5, r1]
	mov r1, #0xc
	sub r2, #0xe
	str r1, [r5, r2]
	ldr r3, [r5]
	ldr r2, _0221C00C ; =0x0000027E
	ldr r3, [r3, #0x24]
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	ldr r1, _0221C010 ; =0x00000BAC
	str r0, [r5, r1]
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl ScrStrBufs_new
	mov r1, #0xbb
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r1, [r5]
	mov r0, #5
	ldr r1, [r1, #0x24]
	lsl r0, r0, #6
	bl String_ctor
	ldr r1, _0221C014 ; =0x00000BB4
	str r0, [r5, r1]
	mov r0, #1
	add r1, #8
	str r0, [r5, r1]
	pop {r3, r4, r5, pc}
_0221BFF2:
	ldr r0, _0221C000 ; =0x00000B82
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221C000: .word 0x00000B82
_0221C004: .word 0x00000BCC
_0221C008: .word ov05_0221CE88
_0221C00C: .word 0x0000027E
_0221C010: .word 0x00000BAC
_0221C014: .word 0x00000BB4
	thumb_func_end ov05_0221BF08

	thumb_func_start ov05_0221C018
ov05_0221C018: ; 0x0221C018
	push {r4, lr}
	add r4, r0, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0221C028
	mov r0, #0
	pop {r4, pc}
_0221C028:
	ldr r1, _0221C04C ; =0x00000B81
	add r0, r1, #1
	ldrb r2, [r4, r1]
	ldrb r0, [r4, r0]
	cmp r2, r0
	bne _0221C03E
	mov r2, #0
	add r0, r1, #1
	strb r2, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0221C03E:
	add r0, r1, #1
	ldrb r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #1
	strb r2, [r4, r0]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0221C04C: .word 0x00000B81
	thumb_func_end ov05_0221C018

	thumb_func_start ov05_0221C050
ov05_0221C050: ; 0x0221C050
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl Bg_GetXpos
	cmp r0, #0x18
	bgt _0221C0EC
	ldr r1, _0221C214 ; =0x00000B82
	mov r2, #0
	add r0, r1, #0
	strb r2, [r4, r1]
	sub r0, #0xa
	strh r2, [r4, r0]
	sub r1, #8
	strh r2, [r4, r1]
	ldr r0, [r4, #0xc]
	mov r1, #3
	mov r3, #0x18
	bl ScheduleSetBgPosText
	mov r2, #0
	add r3, r2, #0
	ldr r0, [r4, #0xc]
	mov r1, #2
	sub r3, #0x18
	bl ScheduleSetBgPosText
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov05_0221D3AC
	mov r2, #0
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl ov05_0221D3AC
	mov r2, #0
	add r0, r4, #0
	mov r1, #2
	add r3, r2, #0
	bl ov05_0221D3AC
	mov r2, #0
	add r0, r4, #0
	mov r1, #3
	add r3, r2, #0
	bl ov05_0221D3AC
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov05_0221D664
	mov r2, #0
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl ov05_0221D664
	mov r2, #0
	add r0, r4, #0
	mov r1, #2
	add r3, r2, #0
	bl ov05_0221D664
	mov r2, #0
	add r0, r4, #0
	mov r1, #3
	add r3, r2, #0
	bl ov05_0221D664
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221C0EC:
	ldr r3, _0221C218 ; =0x00000B74
	ldr r0, [r4, #0xc]
	ldr r3, [r4, r3]
	mov r1, #3
	mov r2, #2
	bl ScheduleSetBgPosText
	ldr r3, _0221C218 ; =0x00000B74
	ldr r0, [r4, #0xc]
	ldr r3, [r4, r3]
	mov r1, #2
	mov r2, #1
	bl ScheduleSetBgPosText
	ldr r3, _0221C214 ; =0x00000B82
	mov r1, #0
	ldrb r0, [r4, r3]
	add r2, r3, #0
	sub r2, #0xe
	add r0, r0, #1
	strb r0, [r4, r3]
	ldr r5, [r4, r2]
	ldrb r2, [r4, r3]
	add r3, r5, #0
	add r0, r4, #0
	mul r3, r2
	mov r2, #1
	lsl r2, r2, #8
	sub r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add r3, r1, #0
	bl ov05_0221D3AC
	ldr r2, _0221C218 ; =0x00000B74
	mov r1, #1
	ldr r3, [r4, r2]
	add r2, #0xe
	add r5, r3, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	mov r3, #0
	mul r5, r2
	add r2, r1, #0
	add r2, #0xff
	sub r2, r5, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C218 ; =0x00000B74
	mov r1, #2
	ldr r3, [r4, r2]
	add r2, #0xe
	add r5, r3, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	mov r3, #0
	mul r5, r2
	add r2, r1, #0
	add r2, #0xfe
	sub r2, r2, r5
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C218 ; =0x00000B74
	mov r1, #3
	ldr r3, [r4, r2]
	add r2, #0xe
	add r5, r3, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	mov r3, #0
	mul r5, r2
	add r2, r1, #0
	add r2, #0xfd
	sub r2, r2, r5
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C218 ; =0x00000B74
	mov r1, #0
	ldr r3, [r4, r2]
	add r2, #0xe
	add r5, r3, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	add r3, r1, #0
	mul r5, r2
	mov r2, #1
	lsl r2, r2, #8
	sub r2, r5, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C218 ; =0x00000B74
	mov r1, #1
	ldr r3, [r4, r2]
	add r2, #0xe
	add r5, r3, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	mov r3, #0
	mul r5, r2
	add r2, r1, #0
	add r2, #0xff
	sub r2, r5, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C218 ; =0x00000B74
	mov r1, #2
	ldr r3, [r4, r2]
	add r2, #0xe
	add r5, r3, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	mov r3, #0
	mul r5, r2
	add r2, r1, #0
	add r2, #0xfe
	sub r2, r2, r5
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C218 ; =0x00000B74
	add r0, r4, #0
	ldr r3, [r4, r2]
	add r2, #0xe
	ldrb r2, [r4, r2]
	add r4, r3, #0
	mov r1, #3
	mul r4, r2
	add r2, r1, #0
	add r2, #0xfd
	sub r2, r2, r4
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	mov r3, #0
	bl ov05_0221D664
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221C214: .word 0x00000B82
_0221C218: .word 0x00000B74
	thumb_func_end ov05_0221C050

	thumb_func_start ov05_0221C21C
ov05_0221C21C: ; 0x0221C21C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov05_0221DAE0
	cmp r0, #0
	bne _0221C238
	ldr r0, _0221C418 ; =0x00000B82
	ldrb r1, [r5, r0]
	cmp r1, #0x18
	bls _0221C238
	mov r1, #0
	strb r1, [r5, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0221C238:
	ldr r0, _0221C418 ; =0x00000B82
	ldrb r0, [r5, r0]
	cmp r0, #0
	bne _0221C258
	ldr r0, [r5]
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221C252
	ldr r0, _0221C41C ; =0x00000715
	bl PlaySE
	b _0221C258
_0221C252:
	ldr r0, _0221C420 ; =0x00000852
	bl PlaySE
_0221C258:
	ldr r0, _0221C418 ; =0x00000B82
	ldrb r1, [r5, r0]
	cmp r1, #0x18
	bne _0221C2F4
	ldr r0, [r5, #0xc]
	mov r1, #3
	mov r2, #0
	mov r3, #0x18
	bl ScheduleSetBgPosText
	mov r2, #0
	add r3, r2, #0
	ldr r0, [r5, #0xc]
	mov r1, #2
	sub r3, #0x18
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	mov r3, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5, #0xc]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov05_0221D3AC
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ov05_0221D3AC
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl ov05_0221D3AC
	mov r2, #0
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl ov05_0221D3AC
	mov r1, #0
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl ov05_0221D664
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ov05_0221D664
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl ov05_0221D664
	mov r2, #0
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl ov05_0221D664
	b _0221C40C
_0221C2F4:
	blo _0221C2F8
	b _0221C40C
_0221C2F8:
	sub r0, r0, #6
	ldrsb r4, [r5, r0]
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	lsr r0, r4, #0x1f
	add r0, r4, r0
	asr r0, r0, #1
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, _0221C424 ; =0x00000B7D
	ldrsb r4, [r5, r0]
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	lsr r0, r4, #0x1f
	add r0, r4, r0
	asr r0, r0, #1
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r6, #0
	bge _0221C338
	ldr r0, _0221C428 ; =0x00000B78
	ldrsh r0, [r5, r0]
	cmp r0, #0
	blt _0221C344
_0221C338:
	cmp r6, #0
	ble _0221C34E
	ldr r0, _0221C428 ; =0x00000B78
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _0221C34E
_0221C344:
	mov r0, #0
	mvn r0, r0
	mul r0, r6
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
_0221C34E:
	cmp r4, #0
	bge _0221C35A
	ldr r0, _0221C42C ; =0x00000B7A
	ldrsh r0, [r5, r0]
	cmp r0, #0
	blt _0221C366
_0221C35A:
	cmp r4, #0
	ble _0221C370
	ldr r0, _0221C42C ; =0x00000B7A
	ldrsh r0, [r5, r0]
	cmp r0, #0
	ble _0221C370
_0221C366:
	mov r0, #0
	mvn r0, r0
	mul r0, r4
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_0221C370:
	add r3, r6, #0
	ldr r0, [r5, #0xc]
	mov r1, #3
	mov r2, #0
	add r3, #0x18
	bl ScheduleSetBgPosText
	add r3, r6, #0
	ldr r0, [r5, #0xc]
	mov r1, #2
	mov r2, #0
	sub r3, #0x18
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r5, #0xc]
	add r2, r1, #0
	add r3, r4, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5, #0xc]
	mov r1, #2
	mov r2, #3
	add r3, r4, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D3AC
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D3AC
	add r0, r5, #0
	mov r1, #2
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D3AC
	add r0, r5, #0
	mov r1, #3
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D3AC
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D664
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D664
	add r0, r5, #0
	mov r1, #2
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D664
	add r0, r5, #0
	mov r1, #3
	add r2, r6, #0
	add r3, r4, #0
	bl ov05_0221D664
	ldr r0, _0221C428 ; =0x00000B78
	strh r6, [r5, r0]
	add r0, r0, #2
	strh r4, [r5, r0]
_0221C40C:
	ldr r0, _0221C418 ; =0x00000B82
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221C418: .word 0x00000B82
_0221C41C: .word 0x00000715
_0221C420: .word 0x00000852
_0221C424: .word 0x00000B7D
_0221C428: .word 0x00000B78
_0221C42C: .word 0x00000B7A
	thumb_func_end ov05_0221C21C

	thumb_func_start ov05_0221C430
ov05_0221C430: ; 0x0221C430
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0221C548 ; =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #8
	bne _0221C458
	mov r0, #6
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r3, _0221C54C ; =0x00007FFF
	ldr r0, [r0, #0x24]
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
_0221C458:
	ldr r0, _0221C548 ; =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #8
	blo _0221C474
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0221C474
	ldr r0, _0221C550 ; =0x00000B7F
	mov r1, #2
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0221C474:
	ldr r0, _0221C548 ; =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C482
	ldr r0, _0221C554 ; =0x00000719
	bl PlaySE
_0221C482:
	ldr r0, [r4, #0xc]
	mov r1, #3
	mov r2, #1
	mov r3, #0x10
	bl ScheduleSetBgPosText
	mov r1, #2
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	mov r3, #0x10
	bl ScheduleSetBgPosText
	ldr r2, _0221C548 ; =0x00000B82
	mov r1, #0
	ldrb r0, [r4, r2]
	add r3, r1, #0
	add r0, r0, #1
	strb r0, [r4, r2]
	ldrb r2, [r4, r2]
	add r0, r4, #0
	lsl r2, r2, #4
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	mov r3, #0
	lsl r2, r2, #4
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #2
	mov r3, #0
	lsl r2, r2, #0x14
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #3
	mov r3, #0
	lsl r2, r2, #0x14
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C548 ; =0x00000B82
	mov r1, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	add r3, r1, #0
	lsl r2, r2, #4
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C548 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	mov r3, #0
	lsl r2, r2, #4
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C548 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #2
	mov r3, #0
	lsl r2, r2, #0x14
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C548 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #3
	mov r3, #0
	lsl r2, r2, #0x14
	asr r2, r2, #0x10
	bl ov05_0221D664
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0221C548: .word 0x00000B82
_0221C54C: .word 0x00007FFF
_0221C550: .word 0x00000B7F
_0221C554: .word 0x00000719
	thumb_func_end ov05_0221C430

	thumb_func_start ov05_0221C558
ov05_0221C558: ; 0x0221C558
	ldr r1, _0221C564 ; =0x00000B81
	mov r2, #0x10
	strb r2, [r0, r1]
	mov r0, #2
	bx lr
	nop
_0221C564: .word 0x00000B81
	thumb_func_end ov05_0221C558

	thumb_func_start ov05_0221C568
ov05_0221C568: ; 0x0221C568
	push {r4, lr}
	add r4, r0, #0
	bl ov05_0221CCF4
	cmp r0, #1
	ldr r0, [r4]
	bne _0221C58C
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	ldr r0, _0221C5A4 ; =0x00000B7E
	bne _0221C586
	mov r1, #0
	strb r1, [r4, r0]
	b _0221C5A0
_0221C586:
	mov r1, #1
	strb r1, [r4, r0]
	b _0221C5A0
_0221C58C:
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	ldr r0, _0221C5A4 ; =0x00000B7E
	bne _0221C59C
	mov r1, #1
	strb r1, [r4, r0]
	b _0221C5A0
_0221C59C:
	mov r1, #0
	strb r1, [r4, r0]
_0221C5A0:
	mov r0, #2
	pop {r4, pc}
	.balign 4, 0
_0221C5A4: .word 0x00000B7E
	thumb_func_end ov05_0221C568

	thumb_func_start ov05_0221C5A8
ov05_0221C5A8: ; 0x0221C5A8
	push {r3, lr}
	ldr r1, _0221C5C0 ; =0x00000B7E
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _0221C5B8
	bl ov05_0221C5C4
	pop {r3, pc}
_0221C5B8:
	bl ov05_0221C6C8
	pop {r3, pc}
	nop
_0221C5C0: .word 0x00000B7E
	thumb_func_end ov05_0221C5A8

	thumb_func_start ov05_0221C5C4
ov05_0221C5C4: ; 0x0221C5C4
	push {r3, r4, r5, lr}
	ldr r3, _0221C6B8 ; =0x00000B82
	add r4, r0, #0
	ldrb r3, [r4, r3]
	mov r1, #2
	ldr r0, [r4, #0xc]
	lsl r5, r3, #1
	ldr r3, _0221C6BC ; =ov05_0221EA6C
	add r2, r1, #0
	ldrb r3, [r3, r5]
	bl ScheduleSetBgPosText
	ldr r3, _0221C6B8 ; =0x00000B82
	ldr r0, [r4, #0xc]
	ldrb r3, [r4, r3]
	mov r1, #3
	mov r2, #2
	lsl r5, r3, #1
	ldr r3, _0221C6BC ; =ov05_0221EA6C
	ldrb r3, [r3, r5]
	bl ScheduleSetBgPosText
	ldr r2, _0221C6B8 ; =0x00000B82
	mov r1, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	add r3, r1, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #2
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #3
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	bl ov05_0221D3AC
	ldr r2, _0221C6B8 ; =0x00000B82
	mov r1, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	add r3, r1, #0
	bl ov05_0221D664
	ldr r2, _0221C6B8 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	bl ov05_0221D664
	ldr r2, _0221C6B8 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #2
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	bl ov05_0221D664
	ldr r2, _0221C6B8 ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #3
	lsl r3, r2, #1
	ldr r2, _0221C6C0 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	bl ov05_0221D664
	ldr r0, _0221C6B8 ; =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C69E
	ldr r0, _0221C6C4 ; =0x00000853
	bl PlaySE
_0221C69E:
	ldr r0, _0221C6B8 ; =0x00000B82
	ldrb r1, [r4, r0]
	cmp r1, #5
	bne _0221C6AE
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221C6AE:
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221C6B8: .word 0x00000B82
_0221C6BC: .word ov05_0221EA6C
_0221C6C0: .word ov05_0221EA6D
_0221C6C4: .word 0x00000853
	thumb_func_end ov05_0221C5C4

	thumb_func_start ov05_0221C6C8
ov05_0221C6C8: ; 0x0221C6C8
	push {r3, r4, r5, lr}
	ldr r3, _0221C7EC ; =0x00000B82
	add r4, r0, #0
	ldrb r3, [r4, r3]
	ldr r0, [r4, #0xc]
	mov r1, #2
	lsl r5, r3, #1
	ldr r3, _0221C7F0 ; =ov05_0221EA6C
	mov r2, #1
	ldrb r3, [r3, r5]
	bl ScheduleSetBgPosText
	ldr r3, _0221C7EC ; =0x00000B82
	ldr r0, [r4, #0xc]
	ldrb r3, [r4, r3]
	mov r1, #3
	mov r2, #1
	lsl r5, r3, #1
	ldr r3, _0221C7F0 ; =ov05_0221EA6C
	ldrb r3, [r3, r5]
	bl ScheduleSetBgPosText
	ldr r2, _0221C7EC ; =0x00000B82
	mov r1, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	add r3, r1, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #2
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #3
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D3AC
	ldr r2, _0221C7EC ; =0x00000B82
	mov r1, #0
	ldrb r2, [r4, r2]
	add r0, r4, #0
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	add r3, r1, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C7EC ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #1
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C7EC ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #2
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r2, _0221C7EC ; =0x00000B82
	add r0, r4, #0
	ldrb r2, [r4, r2]
	mov r1, #3
	lsl r3, r2, #1
	ldr r2, _0221C7F4 ; =ov05_0221EA6D
	ldrb r2, [r2, r3]
	mov r3, #0
	neg r2, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov05_0221D664
	ldr r0, _0221C7EC ; =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C7D2
	ldr r0, _0221C7F8 ; =0x00000853
	bl PlaySE
_0221C7D2:
	ldr r0, _0221C7EC ; =0x00000B82
	ldrb r1, [r4, r0]
	cmp r1, #5
	bne _0221C7E2
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221C7E2:
	add r1, r1, #1
	strb r1, [r4, r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221C7EC: .word 0x00000B82
_0221C7F0: .word ov05_0221EA6C
_0221C7F4: .word ov05_0221EA6D
_0221C7F8: .word 0x00000853
	thumb_func_end ov05_0221C6C8

	thumb_func_start ov05_0221C7FC
ov05_0221C7FC: ; 0x0221C7FC
	ldr r1, _0221C808 ; =0x00000B81
	mov r2, #0x10
	strb r2, [r0, r1]
	mov r0, #2
	bx lr
	nop
_0221C808: .word 0x00000B81
	thumb_func_end ov05_0221C7FC

	thumb_func_start ov05_0221C80C
ov05_0221C80C: ; 0x0221C80C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, _0221C894 ; =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221C850
	mov r0, #2
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #1
	lsl r0, r0, #0x1a
	add r3, r0, #0
	ldr r2, [r0]
	ldr r1, _0221C898 ; =0xFFFF1FFF
	add r3, #0x48
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	ldrh r5, [r3]
	mov r2, #0x3f
	mov r1, #0x1f
	bic r5, r2
	orr r5, r1
	mov r1, #0x20
	orr r1, r5
	strh r1, [r3]
	add r0, #0x4a
	ldrh r3, [r0]
	mov r1, #0x1d
	bic r3, r2
	orr r1, r3
	strh r1, [r0]
_0221C850:
	ldr r3, _0221C894 ; =0x00000B82
	ldrb r1, [r4, r3]
	cmp r1, #0x10
	bne _0221C870
	mov r0, #0
	mov r1, #0x20
	strb r0, [r4, r3]
	sub r0, r3, #1
	strb r1, [r4, r0]
	lsl r2, r1, #0x15
	ldr r1, [r2]
	ldr r0, _0221C898 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0221C870:
	mov r2, #0x47
	sub r2, r2, r1
	add r1, #0x48
	lsl r1, r1, #0x18
	mov r6, #0xff
	ldr r0, _0221C89C ; =0x04000040
	lsl r5, r2, #8
	lsl r2, r6, #8
	and r2, r5
	lsr r1, r1, #0x18
	strh r6, [r0]
	orr r1, r2
	strh r1, [r0, #4]
	ldrb r0, [r4, r3]
	add r0, r0, #1
	strb r0, [r4, r3]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221C894: .word 0x00000B82
_0221C898: .word 0xFFFF1FFF
_0221C89C: .word 0x04000040
	thumb_func_end ov05_0221C80C

	thumb_func_start ov05_0221C8A0
ov05_0221C8A0: ; 0x0221C8A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221C8D8 ; =0x0000071A
	bl PlaySE
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, _0221C8DC ; =0x00000B81
	mov r1, #0x20
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0221C8D8: .word 0x0000071A
_0221C8DC: .word 0x00000B81
	thumb_func_end ov05_0221C8A0

	thumb_func_start ov05_0221C8E0
ov05_0221C8E0: ; 0x0221C8E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221C900 ; =0x0000071A
	bl PlaySE
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, _0221C904 ; =0x00000B81
	mov r1, #0x40
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0221C900: .word 0x0000071A
_0221C904: .word 0x00000B81
	thumb_func_end ov05_0221C8E0

	thumb_func_start ov05_0221C908
ov05_0221C908: ; 0x0221C908
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl ov05_0221E9F8
	cmp r0, #0
	bne _0221C920
	ldr r1, _0221CA9C ; =0x00000B81
	mov r0, #1
	add sp, #0xc
	strb r0, [r4, r1]
	pop {r3, r4, pc}
_0221C920:
	mov r0, #0xbd
	lsl r0, r0, #4
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0221C938
	sub r0, #0x10
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221C938
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0221C938:
	ldr r0, _0221CAA0 ; =0x00000BBC
	ldr r1, [r4, r0]
	cmp r1, #5
	bne _0221C946
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0221C946:
	cmp r1, #6
	beq _0221C960
	cmp r1, #5
	beq _0221C960
	cmp r1, #7
	beq _0221C960
	cmp r1, #8
	beq _0221C960
	mov r1, #7
	str r1, [r4, r0]
	mov r1, #0xff
	sub r0, #0x3a
	strb r1, [r4, r0]
_0221C960:
	ldr r0, _0221CAA4 ; =0x00000B82
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0221C972
	cmp r1, #1
	beq _0221C9B0
	cmp r1, #2
	beq _0221CA4A
	b _0221CA68
_0221C972:
	add r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221CAA8 ; =0x00000BAC
	mov r1, #8
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	ldr r2, _0221CAAC ; =0x00000B88
	str r3, [sp, #4]
	add r0, r4, r2
	str r3, [sp, #8]
	add r2, #0x2c
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0221CAB0 ; =0x00000BB8
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov05_0221EA18
	ldr r0, _0221CAA4 ; =0x00000B82
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0221CA8C
_0221C9B0:
	add r2, r0, #2
	add r0, r0, #4
	ldr r1, [r4]
	add r2, r4, r2
	str r2, [sp]
	add r0, r4, r0
	str r0, [sp, #4]
	ldr r2, [r1]
	mov r0, #7
	add r1, #0x2c
	lsl r0, r0, #6
	ldr r0, [r2, r0]
	mov r2, #0
	ldrb r1, [r1]
	add r3, r2, #0
	bl sub_0202FE14
	cmp r0, #2
	bne _0221C9EC
	ldr r2, _0221CAA8 ; =0x00000BAC
	mov r1, #6
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	ldr r0, _0221CAB4 ; =0x0000061A
	bl PlaySE
	b _0221C9FE
_0221C9EC:
	cmp r0, #3
	bne _0221CA8C
	ldr r2, _0221CAA8 ; =0x00000BAC
	mov r1, #7
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
_0221C9FE:
	add r0, r4, #0
	bl ov05_0221EA38
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _0221CAAC ; =0x00000B88
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	mov r3, #0
	str r3, [sp]
	ldr r2, _0221CAAC ; =0x00000B88
	str r3, [sp, #4]
	add r0, r4, r2
	str r3, [sp, #8]
	add r2, #0x2c
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0221CAB0 ; =0x00000BB8
	mov r2, #0
	str r0, [r4, r1]
	add r0, r1, #0
	sub r0, #0x37
	strb r2, [r4, r0]
	add r0, r1, #0
	sub r0, #0x36
	ldrb r0, [r4, r0]
	sub r1, #0x36
	add r0, r0, #1
	strb r0, [r4, r1]
	b _0221CA8C
_0221CA4A:
	sub r1, r0, #1
	ldrb r1, [r4, r1]
	add r2, r1, #1
	sub r1, r0, #1
	strb r2, [r4, r1]
	ldrb r1, [r4, r1]
	cmp r1, #0x1e
	bls _0221CA8C
	mov r2, #0
	sub r1, r0, #1
	strb r2, [r4, r1]
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0221CA8C
_0221CA68:
	add r0, r0, #6
	add r0, r4, r0
	mov r1, #0
	bl ClearFrameAndWindow2
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, _0221CAA4 ; =0x00000B82
	mov r1, #0
	strb r1, [r4, r0]
	mov r1, #0x15
	sub r0, r0, #1
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0221CA8C:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0221CA9C: .word 0x00000B81
_0221CAA0: .word 0x00000BBC
_0221CAA4: .word 0x00000B82
_0221CAA8: .word 0x00000BAC
_0221CAAC: .word 0x00000B88
_0221CAB0: .word 0x00000BB8
_0221CAB4: .word 0x0000061A
	thumb_func_end ov05_0221C908

	thumb_func_start ov05_0221CAB8
ov05_0221CAB8: ; 0x0221CAB8
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r1, _0221CB5C ; =0x00000B82
	add r4, r0, #0
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _0221CACC
	cmp r1, #1
	beq _0221CB34
	b _0221CB4A
_0221CACC:
	bl ov05_0221E9F8
	cmp r0, #0
	bne _0221CADC
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
_0221CADC:
	add r0, r4, #0
	bl ov05_0221E9C4
	ldr r2, _0221CB60 ; =0x00000BAC
	mov r1, #9
	ldr r0, [r4, r2]
	add r2, #8
	ldr r2, [r4, r2]
	bl ReadMsgDataIntoString
	mov r3, #0
	str r3, [sp]
	ldr r2, _0221CB64 ; =0x00000B88
	str r3, [sp, #4]
	add r0, r4, r2
	str r3, [sp, #8]
	add r2, #0x2c
	ldr r2, [r4, r2]
	mov r1, #1
	bl AddTextPrinterParameterized
	ldr r1, _0221CB68 ; =0x00000BB8
	str r0, [r4, r1]
	mov r0, #0x3e
	bl sub_02037AC0
	ldr r0, _0221CB6C ; =0x00000BC8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221CB2A
	add r0, r4, #0
	bl ov05_0221E9F8
	cmp r0, #1
	bne _0221CB2A
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
_0221CB2A:
	ldr r0, _0221CB5C ; =0x00000B82
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	b _0221CB4E
_0221CB34:
	mov r0, #0x3e
	bl sub_02037B38
	cmp r0, #0
	beq _0221CB4E
	ldr r0, _0221CB5C ; =0x00000B82
	mov r1, #0
	strb r1, [r4, r0]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0221CB4A:
	bl GF_AssertFail
_0221CB4E:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ScheduleBgTilemapBufferTransfer
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0221CB5C: .word 0x00000B82
_0221CB60: .word 0x00000BAC
_0221CB64: .word 0x00000B88
_0221CB68: .word 0x00000BB8
_0221CB6C: .word 0x00000BC8
	thumb_func_end ov05_0221CAB8

	thumb_func_start ov05_0221CB70
ov05_0221CB70: ; 0x0221CB70
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov05_0221CCF4
	cmp r0, #1
	ldr r0, [r4]
	bne _0221CBB2
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221CB9E
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [r4, #8]
	mov r2, #0x40
	add r3, r1, #0
	bl PaletteData_CopyPalette
	b _0221CBE2
_0221CB9E:
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	mov r2, #0x40
	add r3, r1, #0
	bl PaletteData_CopyPalette
	b _0221CBE2
_0221CBB2:
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221CBCE
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, [r4, #8]
	mov r2, #0x40
	add r3, r1, #0
	bl PaletteData_CopyPalette
	b _0221CBE2
_0221CBCE:
	mov r0, #0x30
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [r4, #8]
	mov r2, #0x40
	add r3, r1, #0
	bl PaletteData_CopyPalette
_0221CBE2:
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02003B74
	ldr r0, _0221CBFC ; =0x0000071B
	bl PlaySE
	ldr r0, _0221CC00 ; =0x00000B81
	mov r1, #0x40
	strb r1, [r4, r0]
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0221CBFC: .word 0x0000071B
_0221CC00: .word 0x00000B81
	thumb_func_end ov05_0221CB70

	thumb_func_start ov05_0221CC04
ov05_0221CC04: ; 0x0221CC04
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221CC50 ; =0x00000B82
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _0221CC16
	ldr r0, _0221CC54 ; =0x00000719
	bl PlaySE
_0221CC16:
	ldr r1, _0221CC50 ; =0x00000B82
	ldrb r0, [r4, r1]
	cmp r0, #0x10
	bne _0221CC2C
	mov r0, #0
	strb r0, [r4, r1]
	mov r2, #0x40
	sub r0, r1, #1
	strb r2, [r4, r0]
	mov r0, #1
	pop {r4, pc}
_0221CC2C:
	add r0, r0, #1
	strb r0, [r4, r1]
	ldrb r2, [r4, r1]
	mov r1, #0x10
	add r0, r4, #0
	sub r1, r1, r2
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	bl ov05_0221E564
	ldr r1, _0221CC50 ; =0x00000B82
	add r0, r4, #0
	ldrb r1, [r4, r1]
	bl ov05_0221DE6C
	mov r0, #0
	pop {r4, pc}
	nop
_0221CC50: .word 0x00000B82
_0221CC54: .word 0x00000719
	thumb_func_end ov05_0221CC04

	thumb_func_start ov05_0221CC58
ov05_0221CC58: ; 0x0221CC58
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #1
	ldr r1, [r1, #0x24]
	bl sub_020880CC
	ldr r0, _0221CC70 ; =0x00000B7F
	mov r1, #2
	strb r1, [r4, r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0221CC70: .word 0x00000B7F
	thumb_func_end ov05_0221CC58

	thumb_func_start ov05_0221CC74
ov05_0221CC74: ; 0x0221CC74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0221CC86
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221CC86:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	add r0, r4, #0
	bl ov05_0221EA38
	ldr r0, [r4]
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CCBE
	add r0, r4, #0
	bl ov05_0221CFF0
	add r0, r4, #0
	bl ov05_0221D020
	add r0, r4, #0
	bl ov05_0221D054
	add r0, r4, #0
	bl ov05_0221DB18
	add r0, r4, #0
	bl ov05_0221D690
	b _0221CCCA
_0221CCBE:
	add r0, r4, #0
	bl ov05_0221DC34
	add r0, r4, #0
	bl ov05_0221E60C
_0221CCCA:
	add r0, r4, #0
	bl ov05_0221CE0C
	bl GF_DestroyVramTransferManager
	ldr r0, [r4, #8]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #8]
	bl sub_02003104
	ldr r0, [r4]
	mov r1, #1
	add r0, #0x2b
	strb r1, [r0]
	add r0, r5, #0
	bl sub_02007234
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov05_0221CC74

	thumb_func_start ov05_0221CCF4
ov05_0221CCF4: ; 0x0221CCF4
	push {r3, lr}
	bl sub_0203769C
	bl sub_020378AC
	cmp r0, #3
	bhi _0221CD1E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221CD0E: ; jump table
	.short _0221CD16 - _0221CD0E - 2 ; case 0
	.short _0221CD1A - _0221CD0E - 2 ; case 1
	.short _0221CD16 - _0221CD0E - 2 ; case 2
	.short _0221CD1A - _0221CD0E - 2 ; case 3
_0221CD16:
	mov r0, #1
	pop {r3, pc}
_0221CD1A:
	mov r0, #0
	pop {r3, pc}
_0221CD1E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov05_0221CCF4

	thumb_func_start ov05_0221CD24
ov05_0221CD24: ; 0x0221CD24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	mov r0, #0x40
	ldr r1, [r1, #0x24]
	add r4, r2, #0
	bl GF_CreateVramTransferManager
	ldr r0, [r5]
	ldr r0, [r0, #0x24]
	bl sub_0200CF18
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [r5, r1]
	ldr r0, [r5, r1]
	bl sub_0200CF38
	mov r1, #0x65
	lsl r1, r1, #2
	add r2, sp, #0x18
	ldr r3, _0221CDBC ; =ov05_0221EBE0
	str r0, [r5, r1]
	ldmia r3!, {r0, r1}
	add r6, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _0221CDC0 ; =ov05_0221EAAC
	add r2, sp, #4
	ldmia r3!, {r0, r1}
	add r7, r2, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	add r1, r6, #0
	str r0, [r2]
	mov r0, #0x65
	lsl r0, r0, #2
	str r4, [sp, #4]
	sub r0, r0, #4
	ldr r0, [r5, r0]
	add r2, r7, #0
	mov r3, #0x10
	bl sub_0200CF70
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl sub_0200CFF4
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	ldr r2, [sp]
	bl sub_0200D3F8
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CDBC: .word ov05_0221EBE0
_0221CDC0: .word ov05_0221EAAC
	thumb_func_end ov05_0221CD24

	thumb_func_start ov05_0221CDC4
ov05_0221CDC4: ; 0x0221CDC4
	push {lr}
	sub sp, #0x34
	add r2, r0, #0
	mov r0, #0
	add r3, sp, #0
	strh r0, [r3]
	strh r0, [r3, #2]
	strh r0, [r3, #4]
	strh r0, [r3, #6]
	ldr r3, [r1, #0x14]
	str r3, [sp, #8]
	ldr r3, [r1, #0x18]
	str r3, [sp, #0xc]
	mov r3, #1
	str r3, [sp, #0x10]
	ldr r3, [r1]
	str r3, [sp, #0x14]
	ldr r3, [r1, #4]
	str r3, [sp, #0x18]
	ldr r3, [r1, #8]
	str r3, [sp, #0x1c]
	ldr r3, [r1, #0xc]
	str r3, [sp, #0x20]
	ldr r1, [r1, #0x10]
	str r1, [sp, #0x2c]
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0x30]
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	add r2, sp, #0
	bl sub_0200D734
	add sp, #0x34
	pop {pc}
	thumb_func_end ov05_0221CDC4

	thumb_func_start ov05_0221CE0C
ov05_0221CE0C: ; 0x0221CE0C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r4, #0
	cmp r0, #0
	bls _0221CE36
	mov r7, #0x21
	add r5, r6, #0
	lsl r7, r7, #4
_0221CE22:
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200D9DC
	ldr r0, [r6, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blo _0221CE22
_0221CE36:
	mov r1, #0x19
	lsl r1, r1, #4
	ldr r0, [r6, r1]
	add r1, r1, #4
	ldr r1, [r6, r1]
	bl sub_0200D998
	mov r0, #0x19
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	bl sub_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221CE0C

	thumb_func_start ov05_0221CE50
ov05_0221CE50: ; 0x0221CE50
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0x21
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	mov r4, #0
	cmp r0, #0
	bls _0221CE84
	mov r7, #0x66
	lsl r7, r7, #2
	add r6, r7, #0
	add r6, #0x78
_0221CE68:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, r7]
	mov r1, #1
	ldr r0, [r0]
	lsl r1, r1, #0xc
	bl sub_020249B0
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [r5, r6]
	cmp r4, r0
	blo _0221CE68
_0221CE84:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov05_0221CE50

	thumb_func_start ov05_0221CE88
ov05_0221CE88: ; 0x0221CE88
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r0, [r4, #8]
	bl sub_0200398C
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r3, _0221CEB0 ; =0x027E0000
	ldr r1, _0221CEB4 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_0221CEB0: .word 0x027E0000
_0221CEB4: .word 0x00003FF8
	thumb_func_end ov05_0221CE88

	thumb_func_start ov05_0221CEB8
ov05_0221CEB8: ; 0x0221CEB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x80
	add r5, r0, #0
	ldr r0, _0221CFD4 ; =0x00000BA8
	add r4, r1, #0
	ldr r6, _0221CFD8 ; =ov05_0221EA78
	str r4, [r5, r0]
	add r3, sp, #0x70
	add r7, r2, #0
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	str r4, [sp, #0x7c]
	bl SetBothScreensModesAndDisable
	ldr r6, _0221CFDC ; =ov05_0221EB1C
	add r3, sp, #0x54
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r5, #0xc]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0xc]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r1, #3
	add r3, r1, #0
	ldr r0, [r5, #0xc]
	mov r2, #0
	add r3, #0xfd
	bl ScheduleSetBgPosText
	ldr r6, _0221CFE0 ; =ov05_0221EB54
	add r3, sp, #0x38
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r5, #0xc]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r3, #0xff
	ldr r0, [r5, #0xc]
	mov r1, #2
	mov r2, #0
	mvn r3, r3
	bl ScheduleSetBgPosText
	ldr r6, _0221CFE4 ; =ov05_0221EB70
	add r3, sp, #0x1c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r5, #0xc]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	cmp r7, #1
	bne _0221CF88
	ldr r0, [r5, #0xc]
	mov r1, #1
	mov r2, #3
	mov r3, #0x18
	bl BgSetPosTextAndCommit
_0221CF88:
	cmp r4, #0
	bne _0221CFD0
	ldr r4, _0221CFE8 ; =ov05_0221EBA8
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #0
	str r0, [r3]
	ldr r0, [r5, #0xc]
	add r3, r1, #0
	bl InitBgFromTemplate
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl BgClearTilemapBufferAndCommit
	ldr r0, _0221CFEC ; =0x00000BC8
	ldr r0, [r5, r0]
	cmp r0, #1
	bne _0221CFC8
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
_0221CFC8:
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
_0221CFD0:
	add sp, #0x80
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221CFD4: .word 0x00000BA8
_0221CFD8: .word ov05_0221EA78
_0221CFDC: .word ov05_0221EB1C
_0221CFE0: .word ov05_0221EB54
_0221CFE4: .word ov05_0221EB70
_0221CFE8: .word ov05_0221EBA8
_0221CFEC: .word 0x00000BC8
	thumb_func_end ov05_0221CEB8

	thumb_func_start ov05_0221CFF0
ov05_0221CFF0: ; 0x0221CFF0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221D018 ; =0x00000B94
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0221D004
	sub r0, #0xc
	add r0, r4, r0
	bl RemoveWindow
_0221D004:
	ldr r0, _0221D01C ; =0x00000BA4
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0221D014
	sub r0, #0xc
	add r0, r4, r0
	bl RemoveWindow
_0221D014:
	pop {r4, pc}
	nop
_0221D018: .word 0x00000B94
_0221D01C: .word 0x00000BA4
	thumb_func_end ov05_0221CFF0

	thumb_func_start ov05_0221D020
ov05_0221D020: ; 0x0221D020
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221D04C ; =0x00000BB4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D030
	bl String_dtor
_0221D030:
	mov r0, #0xbb
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D03E
	bl ScrStrBufs_delete
_0221D03E:
	ldr r0, _0221D050 ; =0x00000BAC
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D04A
	bl DestroyMsgData
_0221D04A:
	pop {r4, pc}
	.balign 4, 0
_0221D04C: .word 0x00000BB4
_0221D050: .word 0x00000BAC
	thumb_func_end ov05_0221D020

	thumb_func_start ov05_0221D054
ov05_0221D054: ; 0x0221D054
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, _0221D090 ; =0x00000BA8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221D088
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl FreeBgTilemapBuffer
_0221D088:
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_0221D090: .word 0x00000BA8
	thumb_func_end ov05_0221D054

	thumb_func_start ov05_0221D094
ov05_0221D094: ; 0x0221D094
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x68
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r2, [r5]
	mov r3, #1
	ldr r2, [r2, #0x24]
	add r4, r0, #0
	str r2, [sp, #0xc]
	ldr r2, [r5, #0xc]
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #4
	ldr r0, [r0, #0x24]
	mov r3, #1
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #2
	ldr r0, [r0, #0x24]
	add r3, r1, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #3
	ldr r0, [r0, #0x24]
	add r3, r1, #0
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r2, #0
	str r2, [sp]
	ldr r0, [r5]
	mov r1, #1
	ldr r0, [r0, #0x24]
	add r3, r2, #0
	str r0, [sp, #4]
	add r0, r4, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r1, #0
	ldr r0, [r5, #8]
	add r2, r1, #0
	mov r3, #0xa0
	bl sub_020032A4
	ldr r1, _0221D13C ; =0x000018C6
	mov r0, #1
	bl BG_SetMaskColor
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D13C: .word 0x000018C6
	thumb_func_end ov05_0221D094

	thumb_func_start ov05_0221D140
ov05_0221D140: ; 0x0221D140
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, _0221D21C ; =0x00000BA8
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _0221D164
	ldr r0, [r4]
	cmp r0, #0
	beq _0221D164
	ldr r1, [r0]
	cmp r1, #0
	beq _0221D164
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _0221D168
_0221D164:
	bl GF_AssertFail
_0221D168:
	ldr r0, [r4]
	ldr r1, [r0]
	mov r0, #0x13
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #0
	ldr r0, [r0, #0x24]
	mov r2, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	mov r3, #0xf
	bl LoadUserFrameGfx2
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #0xf0
	mov r3, #0x20
	bl sub_020032A4
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	mov r2, #0x1f
	ldr r0, [r0, #0x24]
	mov r3, #0xe
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl LoadUserFrameGfx1
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #0xe0
	mov r3, #0x20
	bl sub_020032A4
	ldr r2, [r4]
	mov r1, #0x1a
	ldr r2, [r2, #0x24]
	mov r0, #0
	lsl r1, r1, #4
	bl LoadFontPal0
	ldr r0, [r4, #8]
	mov r1, #0
	mov r2, #0xd0
	mov r3, #0x20
	bl sub_020032A4
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	ldr r1, _0221D220 ; =0x00000B88
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xc]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	mov r0, #0x13
	str r0, [sp]
	mov r0, #0x1b
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x28
	ldr r1, _0221D224 ; =0x00000B98
	str r0, [sp, #0x10]
	ldr r0, [r4, #0xc]
	add r1, r4, r1
	mov r2, #0
	mov r3, #2
	bl AddWindowParameterized
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0221D21C: .word 0x00000BA8
_0221D220: .word 0x00000B88
_0221D224: .word 0x00000B98
	thumb_func_end ov05_0221D140

	thumb_func_start ov05_0221D228
ov05_0221D228: ; 0x0221D228
	push {r3, lr}
	ldr r0, _0221D23C ; =0x04000050
	mov r3, #8
	mov r1, #2
	mov r2, #0x1c
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_0221D23C: .word 0x04000050
	thumb_func_end ov05_0221D228

	thumb_func_start ov05_0221D240
ov05_0221D240: ; 0x0221D240
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, _0221D310 ; =ov05_0221EB04
	add r3, sp, #0
	add r6, r0, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r1, r2, #0
	add r0, r6, #0
	mov r2, #0x15
	bl ov05_0221CD24
	add r0, r6, #0
	bl ov05_0221D318
	ldr r4, _0221D314 ; =ov05_0221EDA4
	mov r7, #0
	add r5, r6, #0
_0221D26E:
	add r0, r6, #0
	add r1, r4, #0
	bl ov05_0221CDC4
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r7, r7, #1
	add r4, #0x1c
	add r5, r5, #4
	cmp r7, #0xc
	blo _0221D26E
	mov r1, #0
	mov r2, #0xff
	add r0, r6, #0
	mvn r2, r2
	add r3, r1, #0
	bl ov05_0221D3AC
	mov r2, #0xff
	add r0, r6, #0
	mov r1, #1
	mvn r2, r2
	mov r3, #0
	bl ov05_0221D3AC
	mov r1, #2
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfe
	mov r3, #0
	bl ov05_0221D3AC
	mov r1, #3
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfd
	mov r3, #0
	bl ov05_0221D3AC
	add r0, r6, #0
	bl ov05_0221D4D0
	mov r0, #0x21
	mov r1, #0xc
	lsl r0, r0, #4
	str r1, [r6, r0]
	add r0, r6, #0
	bl ov05_0221D5DC
	mov r1, #0
	mov r2, #0xff
	add r0, r6, #0
	mvn r2, r2
	add r3, r1, #0
	bl ov05_0221D664
	mov r2, #0xff
	add r0, r6, #0
	mov r1, #1
	mvn r2, r2
	mov r3, #0
	bl ov05_0221D664
	mov r1, #2
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfe
	mov r3, #0
	bl ov05_0221D664
	mov r1, #3
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfd
	mov r3, #0
	bl ov05_0221D664
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D310: .word ov05_0221EB04
_0221D314: .word ov05_0221EDA4
	thumb_func_end ov05_0221D240

	thumb_func_start ov05_0221D318
ov05_0221D318: ; 0x0221D318
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #8
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221D3A8 ; =0x0000B807
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0xd0
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _0221D3A8 ; =0x0000B807
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	mov r2, #0x68
	mov r3, #8
	bl sub_0200D564
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221D3A8 ; =0x0000B807
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0xcf
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221D3A8 ; =0x0000B807
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0xd1
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221D3A8: .word 0x0000B807
	thumb_func_end ov05_0221D318

	thumb_func_start ov05_0221D3AC
ov05_0221D3AC: ; 0x0221D3AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r4, _0221D408 ; =_0221EA54
	str r2, [sp]
	ldrb r5, [r4]
	str r3, [sp, #4]
	add r3, sp, #8
	strb r5, [r3]
	ldrb r5, [r4, #1]
	add r2, sp, #8
	mov r7, #0
	strb r5, [r3, #1]
	ldrb r5, [r4, #2]
	ldrb r4, [r4, #3]
	add r6, r0, r1
	strb r5, [r3, #2]
	strb r4, [r3, #3]
	ldrb r2, [r2, r1]
	add r4, r7, #0
	lsl r2, r2, #2
	add r5, r0, r2
_0221D3D6:
	ldr r1, _0221D40C ; =0x00000B64
	mov r0, #0x66
	ldrb r1, [r6, r1]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r1, r4
	ldr r1, [sp]
	add r1, r1, r2
	ldr r2, _0221D410 ; =0x00000B68
	lsl r1, r1, #0x10
	ldrb r3, [r6, r2]
	ldr r2, [sp, #4]
	asr r1, r1, #0x10
	add r2, r2, r3
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r7, r7, #1
	add r4, #0x13
	add r5, r5, #4
	cmp r7, #3
	blo _0221D3D6
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D408: .word _0221EA54
_0221D40C: .word 0x00000B64
_0221D410: .word 0x00000B68
	thumb_func_end ov05_0221D3AC

	thumb_func_start ov05_0221D414
ov05_0221D414: ; 0x0221D414
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r0, r1, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r7, r3, #0
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r5, #0
	ldr r0, [sp, #4]
	add r4, r5, #0
	cmp r0, #0
	ble _0221D4CC
	lsl r0, r7, #2
	add r6, r6, r0
_0221D43A:
	lsl r0, r4, #2
	add r1, r6, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [sp, #8]
	cmp r0, r4
	bls _0221D4C0
	ldr r0, [sp]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _0221D4C0
	add r0, r7, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0221D4C0
	add r0, r7, #0
	bl sub_0208AD64
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #6
	bne _0221D494
	lsl r0, r5, #2
	add r1, r6, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #3
	bl sub_0200DC4C
	b _0221D4BA
_0221D494:
	cmp r0, #7
	beq _0221D4AA
	lsl r0, r5, #2
	add r1, r6, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #2
	bl sub_0200DC4C
	b _0221D4BA
_0221D4AA:
	lsl r0, r5, #2
	add r1, r6, r0
	mov r0, #0x66
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DC4C
_0221D4BA:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_0221D4C0:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _0221D43A
_0221D4CC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221D414

	thumb_func_start ov05_0221D4D0
ov05_0221D4D0: ; 0x0221D4D0
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4]
	add r1, r2, #0
	add r1, #0x29
	ldrb r1, [r1]
	cmp r1, #0
	ldr r1, [r2, #4]
	bne _0221D4FA
	mov r2, #6
	mov r3, #0
	bl ov05_0221D414
	ldr r1, [r4]
	mov r2, #6
	ldr r1, [r1, #8]
	add r0, r4, #0
	add r3, r2, #0
	bl ov05_0221D414
	pop {r4, pc}
_0221D4FA:
	mov r2, #3
	mov r3, #0
	bl ov05_0221D414
	ldr r1, [r4]
	mov r2, #3
	ldr r1, [r1, #0xc]
	add r0, r4, #0
	add r3, r2, #0
	bl ov05_0221D414
	ldr r1, [r4]
	add r0, r4, #0
	ldr r1, [r1, #8]
	mov r2, #3
	mov r3, #6
	bl ov05_0221D414
	ldr r1, [r4]
	add r0, r4, #0
	ldr r1, [r1, #0x10]
	mov r2, #3
	mov r3, #9
	bl ov05_0221D414
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov05_0221D4D0

	thumb_func_start ov05_0221D530
ov05_0221D530: ; 0x0221D530
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r4, r0, #0
	mov r0, #0
	add r5, r4, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r7, r2, #0
	add r5, #0x10
	add r6, r1, #0
	ldr r0, [r4, #0xc]
	add r1, r5, #0
	mov r2, #8
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r7, #0
	add r3, r1, #0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	ldr r0, _0221D5D0 ; =0x00000B44
	ldr r0, [r4, r0]
	str r0, [sp, #0x10]
	mov r0, #0x65
	str r5, [sp, #0x14]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200E2B0
	str r0, [sp, #0x18]
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r1, _0221D5D4 ; =0x0000B807
	bl sub_0200D934
	mov r1, #0x3e
	lsl r2, r6, #4
	lsl r1, r1, #4
	sub r1, r1, r2
	lsl r1, r1, #5
	str r0, [sp, #0x1c]
	mov r0, #0
	str r1, [sp, #0x24]
	mov r1, #2
	str r0, [sp, #0x20]
	str r0, [sp, #0x28]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x34]
	mov r0, #1
	str r1, [sp, #0x30]
	str r0, [sp, #0x38]
	ldr r0, [r4]
	lsl r6, r6, #2
	ldr r0, [r0, #0x24]
	str r0, [sp, #0x3c]
	ldr r0, _0221D5D8 ; =0x00000B48
	add r4, r4, r0
	add r0, sp, #0x10
	bl sub_020135D8
	str r0, [r4, r6]
	ldr r0, [r4, r6]
	mov r1, #0
	bl sub_02013850
	add r0, r5, #0
	bl RemoveWindow
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D5D0: .word 0x00000B44
_0221D5D4: .word 0x0000B807
_0221D5D8: .word 0x00000B48
	thumb_func_end ov05_0221D530

	thumb_func_start ov05_0221D5DC
ov05_0221D5DC: ; 0x0221D5DC
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #8
	ldr r1, [r1, #0x24]
	bl sub_02013534
	ldr r1, _0221D658 ; =0x00000B44
	str r0, [r4, r1]
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0x14]
	mov r1, #0
	bl ov05_0221D530
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0x18]
	mov r1, #2
	bl ov05_0221D530
	ldr r2, [r4]
	add r0, r2, #0
	add r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221D62A
	ldr r2, [r2, #0x1c]
	add r0, r4, #0
	mov r1, #1
	bl ov05_0221D530
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0x20]
	mov r1, #3
	bl ov05_0221D530
	pop {r4, pc}
_0221D62A:
	ldr r2, [r2, #0x14]
	add r0, r4, #0
	mov r1, #1
	bl ov05_0221D530
	ldr r2, [r4]
	add r0, r4, #0
	ldr r2, [r2, #0x18]
	mov r1, #3
	bl ov05_0221D530
	ldr r0, _0221D65C ; =0x00000B4C
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020137C0
	ldr r0, _0221D660 ; =0x00000B54
	mov r1, #0
	ldr r0, [r4, r0]
	bl sub_020137C0
	pop {r4, pc}
	nop
_0221D658: .word 0x00000B44
_0221D65C: .word 0x00000B4C
_0221D660: .word 0x00000B54
	thumb_func_end ov05_0221D5DC

	thumb_func_start ov05_0221D664
ov05_0221D664: ; 0x0221D664
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	add r4, r0, #0
	lsl r0, r5, #2
	add r0, r4, r0
	ldr r3, _0221D68C ; =0x00000B48
	add r4, r4, r5
	add r5, r3, #0
	ldr r0, [r0, r3]
	add r5, #0x24
	add r3, #0x28
	ldrb r5, [r4, r5]
	ldrb r3, [r4, r3]
	add r1, r1, r5
	add r2, r2, r3
	bl sub_020136B4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D68C: .word 0x00000B48
	thumb_func_end ov05_0221D664

	thumb_func_start ov05_0221D690
ov05_0221D690: ; 0x0221D690
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221D6BA
	ldr r6, _0221D6BC ; =0x00000B48
	mov r4, #0
	add r5, r7, #0
_0221D6A4:
	ldr r0, [r5, r6]
	bl sub_02013660
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _0221D6A4
	ldr r0, _0221D6C0 ; =0x00000B44
	ldr r0, [r7, r0]
	bl sub_020135AC
_0221D6BA:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D6BC: .word 0x00000B48
_0221D6C0: .word 0x00000B44
	thumb_func_end ov05_0221D690

	thumb_func_start ov05_0221D6C4
ov05_0221D6C4: ; 0x0221D6C4
	push {r3, r4, r5, r6}
	ldr r3, [r0]
	add r3, #0x29
	ldrb r3, [r3]
	cmp r3, #1
	ldr r3, _0221D7A8 ; =0x00000B64
	bne _0221D74E
	mov r4, #0x14
	add r5, r1, #0
	strb r4, [r0, r3]
	add r5, #0x92
	add r4, r3, #4
	strb r5, [r0, r4]
	mov r5, #0x51
	add r4, r3, #1
	strb r5, [r0, r4]
	add r5, r1, #0
	add r5, #0xa2
	add r4, r3, #5
	strb r5, [r0, r4]
	mov r5, #0x80
	add r4, r3, #2
	strb r5, [r0, r4]
	add r5, r2, #0
	add r5, #0x2c
	add r4, r3, #6
	strb r5, [r0, r4]
	mov r5, #0xbd
	add r4, r3, #3
	strb r5, [r0, r4]
	add r5, r2, #0
	add r5, #0x3c
	add r4, r3, #7
	strb r5, [r0, r4]
	add r4, r3, #0
	mov r5, #0xb
	add r4, #8
	strb r5, [r0, r4]
	add r5, r1, #0
	add r4, r3, #0
	add r5, #0x78
	add r4, #0xc
	strb r5, [r0, r4]
	add r4, r3, #0
	mov r5, #0x4c
	add r4, #9
	strb r5, [r0, r4]
	add r4, r3, #0
	add r1, #0x88
	add r4, #0xd
	strb r1, [r0, r4]
	add r1, r3, #0
	mov r4, #0x77
	add r1, #0xa
	strb r4, [r0, r1]
	add r4, r2, #0
	add r1, r3, #0
	add r4, #0x12
	add r1, #0xe
	strb r4, [r0, r1]
	add r1, r3, #0
	mov r4, #0xb8
	add r1, #0xb
	strb r4, [r0, r1]
	add r2, #0x22
	add r3, #0xf
	strb r2, [r0, r3]
	pop {r3, r4, r5, r6}
	bx lr
_0221D74E:
	mov r4, #0x18
	strb r4, [r0, r3]
	add r4, r1, #0
	add r4, #0xa0
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	add r5, r3, #4
	strb r4, [r0, r5]
	mov r6, #0x51
	add r5, r3, #1
	strb r6, [r0, r5]
	add r5, r3, #5
	strb r4, [r0, r5]
	mov r5, #0x88
	add r4, r3, #2
	strb r5, [r0, r4]
	add r4, r2, #0
	add r4, #0x30
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	add r5, r3, #6
	strb r4, [r0, r5]
	mov r6, #0xc1
	add r5, r3, #3
	strb r6, [r0, r5]
	add r5, r3, #7
	strb r4, [r0, r5]
	add r4, r3, #0
	mov r5, #0xf
	add r4, #8
	strb r5, [r0, r4]
	add r4, r3, #0
	add r1, #0x86
	add r4, #0xc
	strb r1, [r0, r4]
	add r1, r3, #0
	mov r4, #0x80
	add r1, #0xa
	strb r4, [r0, r1]
	add r2, #0x16
	add r3, #0xe
	strb r2, [r0, r3]
	pop {r3, r4, r5, r6}
	bx lr
	nop
_0221D7A8: .word 0x00000B64
	thumb_func_end ov05_0221D6C4

	thumb_func_start ov05_0221D7AC
ov05_0221D7AC: ; 0x0221D7AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r4, _0221D888 ; =ov05_0221EAD4
	add r3, sp, #0
	add r6, r0, #0
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r1, r2, #0
	add r0, r6, #0
	mov r2, #0x17
	bl ov05_0221CD24
	add r0, r6, #0
	bl ov05_0221D318
	add r0, r6, #0
	bl ov05_0221D890
	ldr r4, _0221D88C ; =ov05_0221EDA4
	mov r7, #0
	add r5, r6, #0
_0221D7E0:
	add r0, r6, #0
	add r1, r4, #0
	bl ov05_0221CDC4
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r7, r7, #1
	add r4, #0x1c
	add r5, r5, #4
	cmp r7, #0xe
	blo _0221D7E0
	mov r1, #0
	mov r2, #0xff
	add r0, r6, #0
	mvn r2, r2
	add r3, r1, #0
	bl ov05_0221D3AC
	mov r2, #0xff
	add r0, r6, #0
	mov r1, #1
	mvn r2, r2
	mov r3, #0
	bl ov05_0221D3AC
	mov r1, #2
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfe
	mov r3, #0
	bl ov05_0221D3AC
	mov r1, #3
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfd
	mov r3, #0
	bl ov05_0221D3AC
	add r0, r6, #0
	bl ov05_0221D4D0
	add r0, r6, #0
	bl ov05_0221D904
	add r0, r6, #0
	bl ov05_0221D5DC
	mov r1, #0
	mov r2, #0xff
	add r0, r6, #0
	mvn r2, r2
	add r3, r1, #0
	bl ov05_0221D664
	mov r2, #0xff
	add r0, r6, #0
	mov r1, #1
	mvn r2, r2
	mov r3, #0
	bl ov05_0221D664
	mov r1, #2
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfe
	mov r3, #0
	bl ov05_0221D664
	mov r1, #3
	add r2, r1, #0
	add r0, r6, #0
	add r2, #0xfd
	mov r3, #0
	bl ov05_0221D664
	mov r0, #0x21
	mov r1, #0xe
	lsl r0, r0, #4
	str r1, [r6, r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221D888: .word ov05_0221EAD4
_0221D88C: .word ov05_0221EDA4
	thumb_func_end ov05_0221D7AC

	thumb_func_start ov05_0221D890
ov05_0221D890: ; 0x0221D890
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x68
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221D900 ; =0x0000B808
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #5
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221D900 ; =0x0000B808
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #6
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221D900 ; =0x0000B808
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #7
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_0221D900: .word 0x0000B808
	thumb_func_end ov05_0221D890

	thumb_func_start ov05_0221D904
ov05_0221D904: ; 0x0221D904
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4]
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #3
	bne _0221D946
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x80
	mov r2, #0x48
	bl sub_0200DDB8
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl sub_0200DC4C
	pop {r4, pc}
_0221D946:
	bl ov05_0221CCF4
	cmp r0, #1
	ldr r0, [r4]
	bne _0221D994
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221D976
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x30
	mov r2, #0x48
	bl sub_0200DDB8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd0
	mov r2, #0x48
	bl sub_0200DDB8
	b _0221D9D6
_0221D976:
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd0
	mov r2, #0x48
	bl sub_0200DDB8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x30
	mov r2, #0x48
	bl sub_0200DDB8
	b _0221D9D6
_0221D994:
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221D9BA
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd0
	mov r2, #0x48
	bl sub_0200DDB8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x30
	mov r2, #0x48
	bl sub_0200DDB8
	b _0221D9D6
_0221D9BA:
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x30
	mov r2, #0x48
	bl sub_0200DDB8
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0xd0
	mov r2, #0x48
	bl sub_0200DDB8
_0221D9D6:
	mov r0, #0x72
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x73
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DC4C
	pop {r4, pc}
	thumb_func_end ov05_0221D904

	thumb_func_start ov05_0221D9F0
ov05_0221D9F0: ; 0x0221D9F0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #2
	mov r1, #0
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r4]
	mov r2, #4
	ldr r0, [r0, #0x24]
	add r3, r1, #0
	bl GF_3DVramMan_Create
	ldr r1, _0221DAC8 ; =0x00000B58
	ldr r2, _0221DACC ; =0x04000060
	str r0, [r4, r1]
	ldrh r1, [r2]
	ldr r0, _0221DAD0 ; =0xFFFFCFFF
	and r1, r0
	mov r0, #8
	orr r0, r1
	strh r0, [r2]
	bl sub_02014DA0
	ldr r0, [r4]
	mov r1, #0x12
	ldr r0, [r0, #0x24]
	lsl r1, r1, #0xa
	bl AllocFromHeap
	mov r2, #0xb6
	lsl r2, r2, #4
	str r0, [r4, r2]
	mov r0, #1
	str r0, [sp]
	ldr r0, [r4]
	mov r3, #0x12
	ldr r0, [r0, #0x24]
	ldr r1, _0221DAD4 ; =ov05_0221DB70
	str r0, [sp, #4]
	ldr r0, _0221DAD8 ; =ov05_0221DB4C
	ldr r2, [r4, r2]
	lsl r3, r3, #0xa
	bl sub_02014DB4
	ldr r1, _0221DADC ; =0x00000B5C
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	ldr r2, [r4]
	mov r0, #0x3b
	ldr r2, [r2, #0x24]
	mov r1, #2
	bl sub_02015264
	add r1, r0, #0
	ldr r0, _0221DADC ; =0x00000B5C
	mov r2, #0xa
	ldr r0, [r4, r0]
	mov r3, #1
	bl sub_0201526C
	mov r1, #0
	ldr r0, _0221DADC ; =0x00000B5C
	add r2, r1, #0
	ldr r0, [r4, r0]
	add r3, r1, #0
	bl sub_02015494
	ldr r0, _0221DADC ; =0x00000B5C
	mov r2, #0
	ldr r0, [r4, r0]
	mov r1, #1
	add r3, r2, #0
	bl sub_02015494
	ldr r0, _0221DADC ; =0x00000B5C
	mov r2, #0
	ldr r0, [r4, r0]
	mov r1, #2
	add r3, r2, #0
	bl sub_02015494
	ldr r0, _0221DADC ; =0x00000B5C
	mov r2, #0
	ldr r0, [r4, r0]
	mov r1, #3
	add r3, r2, #0
	bl sub_02015494
	ldr r0, _0221DADC ; =0x00000B5C
	mov r2, #0
	ldr r0, [r4, r0]
	mov r1, #4
	add r3, r2, #0
	bl sub_02015494
	add sp, #8
	pop {r4, pc}
	nop
_0221DAC8: .word 0x00000B58
_0221DACC: .word 0x04000060
_0221DAD0: .word 0xFFFFCFFF
_0221DAD4: .word ov05_0221DB70
_0221DAD8: .word ov05_0221DB4C
_0221DADC: .word 0x00000B5C
	thumb_func_end ov05_0221D9F0

	thumb_func_start ov05_0221DAE0
ov05_0221DAE0: ; 0x0221DAE0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	beq _0221DAF2
	mov r0, #0
	pop {r4, pc}
_0221DAF2:
	bl sub_02026E48
	ldr r0, _0221DB14 ; =0x00000B5C
	ldr r0, [r4, r0]
	bl sub_020154B0
	cmp r0, #0
	bne _0221DB06
	mov r0, #0
	pop {r4, pc}
_0221DB06:
	bl sub_0201543C
	bl sub_02015460
	mov r0, #1
	pop {r4, pc}
	nop
_0221DB14: .word 0x00000B5C
	thumb_func_end ov05_0221DAE0

	thumb_func_start ov05_0221DB18
ov05_0221DB18: ; 0x0221DB18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	add r0, #0x28
	ldrb r0, [r0]
	cmp r0, #1
	bne _0221DB40
	ldr r0, _0221DB44 ; =0x00000B5C
	ldr r0, [r4, r0]
	bl sub_02014EBC
	mov r0, #0xb6
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl FreeToHeap
	ldr r0, _0221DB48 ; =0x00000B58
	ldr r0, [r4, r0]
	bl GF_3DVramMan_Delete
_0221DB40:
	pop {r4, pc}
	nop
_0221DB44: .word 0x00000B5C
_0221DB48: .word 0x00000B58
	thumb_func_end ov05_0221DB18

	thumb_func_start ov05_0221DB4C
ov05_0221DB4C: ; 0x0221DB4C
	push {r4, lr}
	ldr r3, _0221DB6C ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015354
	cmp r4, #0
	bne _0221DB64
	bl GF_AssertFail
_0221DB64:
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_0221DB6C: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov05_0221DB4C

	thumb_func_start ov05_0221DB70
ov05_0221DB70: ; 0x0221DB70
	push {r4, lr}
	ldr r3, _0221DB90 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #1
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bl sub_02015394
	cmp r4, #0
	bne _0221DB88
	bl GF_AssertFail
_0221DB88:
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_0221DB90: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov05_0221DB70

	thumb_func_start ov05_0221DB94
ov05_0221DB94: ; 0x0221DB94
	push {r4, r5, lr}
	sub sp, #0x64
	ldr r5, _0221DC24 ; =ov05_0221EA88
	add r3, sp, #0x54
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r5, _0221DC28 ; =ov05_0221EB8C
	add r3, sp, #0x38
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #1
	str r0, [r3]
	ldr r0, [r4, #0xc]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0221DC2C ; =ov05_0221EB38
	add r3, sp, #0x1c
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #2
	str r0, [r3]
	ldr r0, [r4, #0xc]
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r5, _0221DC30 ; =ov05_0221EBC4
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	mov r1, #3
	str r0, [r3]
	ldr r0, [r4, #0xc]
	mov r3, #0
	bl InitBgFromTemplate
	add sp, #0x64
	pop {r4, r5, pc}
	nop
_0221DC24: .word ov05_0221EA88
_0221DC28: .word ov05_0221EB8C
_0221DC2C: .word ov05_0221EB38
_0221DC30: .word ov05_0221EBC4
	thumb_func_end ov05_0221DB94

	thumb_func_start ov05_0221DC34
ov05_0221DC34: ; 0x0221DC34
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1e
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0xc]
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov05_0221DC34

	thumb_func_start ov05_0221DC60
ov05_0221DC60: ; 0x0221DC60
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x15
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r5]
	mov r3, #3
	ldr r1, [r1, #0x24]
	add r4, r0, #0
	str r1, [sp, #0xc]
	ldr r2, [r5, #0xc]
	mov r1, #0xf
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x11
	ldr r0, [r0, #0x24]
	mov r3, #3
	str r0, [sp, #0xc]
	ldr r2, [r5, #0xc]
	add r0, r4, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r2, [r5]
	add r0, r4, #0
	ldr r2, [r2, #0x24]
	mov r1, #0x10
	bl NARC_AllocAndReadWholeMember
	add r1, sp, #0x10
	add r6, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	ldr r2, [sp, #0x10]
	mov r0, #3
	ldr r1, [r2, #0xc]
	ldr r2, [r2, #8]
	mov r3, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl BG_LoadPlttData
	ldr r1, [sp, #0x10]
	ldr r0, _0221DD00 ; =0x000004E4
	ldr r1, [r1, #0xc]
	add r0, r5, r0
	add r1, #0x60
	mov r2, #0x60
	bl memcpy
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r5]
	mov r2, #0xa9
	lsl r2, r2, #2
	ldr r3, _0221DD04 ; =0x00000424
	add r1, r5, r2
	add r2, #0xc0
	ldr r0, [r0, #0x24]
	add r2, r5, r2
	add r3, r5, r3
	bl sub_0207CAAC
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0221DD00: .word 0x000004E4
_0221DD04: .word 0x00000424
	thumb_func_end ov05_0221DC60

	thumb_func_start ov05_0221DD08
ov05_0221DD08: ; 0x0221DD08
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r6, _0221DDDC ; =ov05_0221EA60
	mov r4, #0
	add r7, r5, #0
_0221DD14:
	cmp r4, #0
	beq _0221DD1C
	cmp r4, #3
	bne _0221DD24
_0221DD1C:
	mov r0, #0xa9
	lsl r0, r0, #2
	add r1, r5, r0
	b _0221DD3A
_0221DD24:
	mov r0, #0x86
	lsl r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #0
	bne _0221DD34
	ldr r0, _0221DDE0 ; =0x00000424
	add r1, r5, r0
	b _0221DD3A
_0221DD34:
	mov r0, #0xd9
	lsl r0, r0, #2
	add r1, r5, r0
_0221DD3A:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x10
	str r0, [sp, #0x14]
	mov r0, #6
	str r0, [sp, #0x18]
	ldrb r2, [r6]
	ldrb r3, [r6, #1]
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl CopyToBgTilemapRect
	mov r0, #0x86
	lsl r0, r0, #2
	ldrh r0, [r7, r0]
	cmp r0, #0
	beq _0221DDC6
	mov r0, #0x10
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r4, #3
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldrb r2, [r6]
	ldrb r3, [r6, #1]
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl BgTilemapRectChangePalette
	cmp r4, #3
	bhs _0221DD92
	ldr r0, [r5]
	add r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0221DDA0
_0221DD92:
	cmp r4, #3
	blo _0221DDB4
	ldr r0, [r5]
	add r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221DDB4
_0221DDA0:
	ldr r1, _0221DDE4 ; =0x00000504
	add r3, r4, #3
	lsl r3, r3, #0x15
	mov r0, #2
	add r1, r5, r1
	mov r2, #0x20
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	b _0221DDC6
_0221DDB4:
	ldr r1, _0221DDE8 ; =0x000004E4
	add r3, r4, #3
	lsl r3, r3, #0x15
	mov r0, #2
	add r1, r5, r1
	mov r2, #0x20
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
_0221DDC6:
	add r4, r4, #1
	add r7, #0x18
	add r6, r6, #2
	cmp r4, #6
	blo _0221DD14
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221DDDC: .word ov05_0221EA60
_0221DDE0: .word 0x00000424
_0221DDE4: .word 0x00000504
_0221DDE8: .word 0x000004E4
	thumb_func_end ov05_0221DD08

	thumb_func_start ov05_0221DDEC
ov05_0221DDEC: ; 0x0221DDEC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	str r1, [sp]
	add r1, r2, #0
	bl GetBgTilemapBuffer
	add r6, r0, #0
	ldr r0, [r4]
	add r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221DE0A
	mov r7, #0x10
	b _0221DE0C
_0221DE0A:
	mov r7, #0
_0221DE0C:
	mov r5, #0
_0221DE0E:
	lsl r0, r5, #5
	add r0, r7, r0
	lsl r4, r0, #1
	ldr r0, [sp]
	lsl r1, r5, #5
	add r0, r0, r1
	add r1, r6, r4
	mov r2, #0x20
	bl memcpy
	add r0, r6, r4
	mov r1, #0
	mov r2, #0x20
	bl memset
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x18
	blo _0221DE0E
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221DDEC

	thumb_func_start ov05_0221DE38
ov05_0221DE38: ; 0x0221DE38
	push {r4, lr}
	ldr r1, _0221DE64 ; =0x00000544
	add r4, r0, #0
	add r1, r4, r1
	mov r2, #1
	bl ov05_0221DDEC
	ldr r1, _0221DE68 ; =0x00000844
	add r0, r4, #0
	add r1, r4, r1
	mov r2, #2
	bl ov05_0221DDEC
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r4, #0xc]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	pop {r4, pc}
	.balign 4, 0
_0221DE64: .word 0x00000544
_0221DE68: .word 0x00000844
	thumb_func_end ov05_0221DE38

	thumb_func_start ov05_0221DE6C
ov05_0221DE6C: ; 0x0221DE6C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	add r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221DECC
	mov r0, #0x20
	sub r6, r0, r4
	ldr r1, _0221DF30 ; =0x00000544
	str r4, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r1, r5, r1
	str r1, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	lsl r2, r6, #0x18
	str r3, [sp, #0x10]
	mov r1, #0x10
	str r1, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	mov r1, #1
	lsr r2, r2, #0x18
	bl CopyToBgTilemapRect
	ldr r0, _0221DF34 ; =0x00000844
	lsl r2, r6, #0x18
	str r4, [sp]
	mov r1, #0x18
	str r1, [sp, #4]
	add r0, r5, r0
	str r0, [sp, #8]
	mov r3, #0
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	mov r0, #0x10
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5, #0xc]
	mov r1, #2
	lsr r2, r2, #0x18
	bl CopyToBgTilemapRect
	b _0221DF1A
_0221DECC:
	ldr r2, _0221DF30 ; =0x00000544
	mov r0, #0x10
	str r4, [sp]
	mov r1, #0x18
	sub r6, r0, r4
	str r1, [sp, #4]
	add r2, r5, r2
	str r2, [sp, #8]
	lsl r2, r6, #0x18
	lsr r2, r2, #0x18
	str r2, [sp, #0xc]
	mov r2, #0
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	ldr r0, [r5, #0xc]
	mov r1, #1
	add r3, r2, #0
	bl CopyToBgTilemapRect
	ldr r1, _0221DF34 ; =0x00000844
	mov r2, #0
	str r4, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r1, r5, r1
	str r1, [sp, #8]
	lsl r1, r6, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	mov r1, #0x10
	str r1, [sp, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r5, #0xc]
	mov r1, #2
	add r3, r2, #0
	bl CopyToBgTilemapRect
_0221DF1A:
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_0221DF30: .word 0x00000544
_0221DF34: .word 0x00000844
	thumb_func_end ov05_0221DE6C

	thumb_func_start ov05_0221DF38
ov05_0221DF38: ; 0x0221DF38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, r1, #0
	str r1, [sp]
	add r5, r2, #0
	bl GetPartyCount
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x18
	mul r0, r5
	add r0, r4, r0
	mov r6, #0
	str r0, [sp, #4]
_0221DF58:
	ldr r0, [sp, #8]
	cmp r0, r6
	bhi _0221DF7A
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl GetMonIconNaixEx
	mov r1, #0x18
	add r2, r6, #0
	mul r2, r1
	ldr r1, [sp, #4]
	add r2, r1, r2
	mov r1, #0x85
	lsl r1, r1, #2
	str r0, [r2, r1]
	b _0221E054
_0221DF7A:
	ldr r0, [sp]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x18
	add r2, r6, #0
	mul r2, r1
	ldr r1, [sp, #4]
	add r4, r0, #0
	add r7, r1, r2
	bl Pokemon_GetIconNaix
	mov r1, #0x85
	lsl r1, r1, #2
	str r0, [r7, r1]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x86
	lsl r1, r1, #2
	strh r0, [r7, r1]
	add r0, r1, #0
	ldrh r0, [r7, r0]
	cmp r0, #0
	beq _0221E054
	mov r0, #0x18
	add r1, r6, #0
	mul r1, r0
	ldr r0, [sp, #4]
	mov r2, #0
	add r5, r0, r1
	add r0, r4, #0
	mov r1, #0x4c
	bl GetMonData
	ldr r1, _0221E064 ; =0x00000223
	mov r2, #0
	strb r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa3
	bl GetMonData
	ldr r1, _0221E068 ; =0x0000021A
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa4
	bl GetMonData
	mov r1, #0x87
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	mov r1, #0x22
	lsl r1, r1, #4
	strb r0, [r5, r1]
	add r0, r4, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	ldr r1, _0221E06C ; =0x0000021E
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xa2
	bl GetMonData
	mov r1, #0x89
	lsl r1, r1, #2
	strb r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	ldr r1, _0221E070 ; =0x00000225
	mov r2, #0
	strb r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0xb0
	bl GetMonData
	cmp r0, #1
	bne _0221E034
	mov r1, #0
	b _0221E036
_0221E034:
	mov r1, #1
_0221E036:
	ldr r0, _0221E074 ; =0x00000222
	strb r1, [r7, r0]
	add r0, r4, #0
	bl GetMonGender
	ldr r1, _0221E078 ; =0x00000221
	strb r0, [r5, r1]
	add r0, r4, #0
	bl sub_0208AD64
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x8a
	lsl r0, r0, #2
	str r1, [r5, r0]
_0221E054:
	add r0, r6, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	cmp r6, #3
	bhs _0221E060
	b _0221DF58
_0221E060:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E064: .word 0x00000223
_0221E068: .word 0x0000021A
_0221E06C: .word 0x0000021E
_0221E070: .word 0x00000225
_0221E074: .word 0x00000222
_0221E078: .word 0x00000221
	thumb_func_end ov05_0221DF38

	thumb_func_start ov05_0221E07C
ov05_0221E07C: ; 0x0221E07C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x85
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #0x90
	bl memset
	ldr r1, [r4]
	add r0, r4, #0
	ldr r1, [r1, #4]
	mov r2, #0
	bl ov05_0221DF38
	ldr r1, [r4]
	add r0, r4, #0
	ldr r1, [r1, #0xc]
	mov r2, #3
	bl ov05_0221DF38
	pop {r4, pc}
	thumb_func_end ov05_0221E07C

	thumb_func_start ov05_0221E0A8
ov05_0221E0A8: ; 0x0221E0A8
	push {r4, lr}
	add r3, r0, #0
	add r2, r1, #0
	mov r0, #0x18
	mul r2, r0
	ldr r1, _0221E10C ; =0x0000021A
	add r4, r3, r2
	ldrh r0, [r4, r1]
	cmp r0, #0
	bne _0221E0C0
	mov r0, #0
	pop {r4, pc}
_0221E0C0:
	add r1, #0xe
	ldr r1, [r4, r1]
	cmp r1, #7
	beq _0221E0D0
	cmp r1, #0
	beq _0221E0D0
	mov r0, #5
	pop {r4, pc}
_0221E0D0:
	mov r1, #0x87
	add r2, r3, r2
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0221E108
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E0EE: ; jump table
	.short _0221E108 - _0221E0EE - 2 ; case 0
	.short _0221E104 - _0221E0EE - 2 ; case 1
	.short _0221E100 - _0221E0EE - 2 ; case 2
	.short _0221E0FC - _0221E0EE - 2 ; case 3
	.short _0221E0F8 - _0221E0EE - 2 ; case 4
_0221E0F8:
	mov r0, #1
	pop {r4, pc}
_0221E0FC:
	mov r0, #2
	pop {r4, pc}
_0221E100:
	mov r0, #3
	pop {r4, pc}
_0221E104:
	mov r0, #4
	pop {r4, pc}
_0221E108:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0221E10C: .word 0x0000021A
	thumb_func_end ov05_0221E0A8

	thumb_func_start ov05_0221E110
ov05_0221E110: ; 0x0221E110
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	str r1, [sp]
	add r0, r1, #0
	lsl r1, r0, #2
	ldr r0, [sp]
	ldr r2, _0221E268 ; =ov05_0221EC5C
	add r7, r0, r1
	lsl r0, r7, #2
	add r4, r5, r0
	ldr r0, [sp]
	mov r1, #0xa
	mul r1, r0
	str r4, [sp, #4]
	add r6, r2, r1
_0221E134:
	mov r1, #0x1c
	add r2, r7, #0
	mul r2, r1
	ldr r1, _0221E26C ; =ov05_0221EF2C
	add r0, r5, #0
	add r1, r1, r2
	bl ov05_0221CDC4
	mov r1, #0x66
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #0
	ldrb r1, [r6]
	ldrb r2, [r6, #1]
	ldr r0, [r4, r0]
	bl sub_0200DDB8
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, #1
	add r4, r4, #4
	add r6, r6, #2
	str r0, [sp, #8]
	cmp r0, #5
	blo _0221E134
	ldr r0, [sp]
	mov r2, #0x86
	mov r1, #0x18
	add r6, r0, #0
	mul r6, r1
	add r3, r5, r6
	lsl r2, r2, #2
	ldrh r0, [r3, r2]
	cmp r0, #0
	bne _0221E19C
	mov r5, #0
	add r4, r2, #0
	add r6, r5, #0
	sub r4, #0x80
_0221E182:
	ldr r0, [sp, #4]
	add r1, r6, #0
	ldr r0, [r0, r4]
	bl sub_0200DCE8
	ldr r0, [sp, #4]
	add r5, r5, #1
	add r0, r0, #4
	str r0, [sp, #4]
	cmp r5, #5
	blo _0221E182
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221E19C:
	ldr r1, [sp]
	mov r4, #0x14
	mul r4, r1
	add r1, r2, #0
	sub r1, #0x80
	add r7, r5, r1
	add r1, r2, #0
	add r1, #0xd
	add r2, #0xb
	ldrb r1, [r3, r1]
	ldrb r2, [r3, r2]
	bl GetMonIconPaletteEx
	add r1, r0, #0
	ldr r0, [r7, r4]
	bl sub_0200DD10
	ldr r1, [sp]
	add r0, r5, #0
	bl ov05_0221E0A8
	add r1, r0, #0
	ldr r0, [r7, r4]
	bl sub_0200DC4C
	ldr r1, _0221E270 ; =0x0000021E
	add r0, r5, r6
	ldrh r0, [r0, r1]
	cmp r0, #0
	bne _0221E1E6
	add r0, r5, r4
	sub r1, #0x82
	ldr r0, [r0, r1]
	mov r1, #0
	bl sub_0200DCE8
	b _0221E20C
_0221E1E6:
	bl ItemIdIsMail
	cmp r0, #1
	bne _0221E1FE
	mov r0, #0x67
	add r1, r5, r4
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #1
	bl sub_0200DC4C
	b _0221E20C
_0221E1FE:
	mov r0, #0x67
	add r1, r5, r4
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DC4C
_0221E20C:
	mov r0, #0x89
	add r1, r5, r6
	lsl r0, r0, #2
	ldrb r1, [r1, r0]
	cmp r1, #0
	bne _0221E226
	add r1, r5, r4
	sub r0, #0x84
	ldr r0, [r1, r0]
	mov r1, #0
	bl sub_0200DCE8
	b _0221E232
_0221E226:
	add r1, r5, r4
	sub r0, #0x84
	ldr r0, [r1, r0]
	mov r1, #2
	bl sub_0200DC4C
_0221E232:
	mov r3, #0x8a
	add r0, r5, r6
	lsl r3, r3, #2
	ldr r0, [r0, r3]
	cmp r0, #7
	bne _0221E24E
	add r0, r5, r4
	sub r3, #0x84
	ldr r0, [r0, r3]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0221E24E:
	add r0, r3, #0
	add r1, r5, r4
	sub r0, #0x84
	ldr r0, [r1, r0]
	ldr r1, [sp, #8]
	mov r2, #0x18
	mul r2, r1
	add r1, r5, r2
	ldr r1, [r1, r3]
	bl sub_0200DC4C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E268: .word ov05_0221EC5C
_0221E26C: .word ov05_0221EF2C
_0221E270: .word 0x0000021E
	thumb_func_end ov05_0221E110

	thumb_func_start ov05_0221E274
ov05_0221E274: ; 0x0221E274
	push {r3, r4, r5, lr}
	sub sp, #0x18
	ldr r5, _0221E2D4 ; =ov05_0221EAEC
	add r3, sp, #0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r1, r2, #0
	add r0, r4, #0
	mov r2, #0x1f
	bl ov05_0221CD24
	add r0, r4, #0
	bl ov05_0221E2D8
	add r0, r4, #0
	bl ov05_0221E390
	add r0, r4, #0
	bl ov05_0221E42C
	add r0, r4, #0
	bl ov05_0221E4C8
	mov r5, #0
_0221E2B0:
	add r0, r4, #0
	add r1, r5, #0
	bl ov05_0221E110
	add r5, r5, #1
	cmp r5, #6
	blo _0221E2B0
	add r0, r4, #0
	mov r1, #0x10
	bl ov05_0221E564
	mov r0, #0x21
	mov r1, #0x1e
	lsl r0, r0, #4
	str r1, [r4, r0]
	add sp, #0x18
	pop {r3, r4, r5, pc}
	nop
_0221E2D4: .word ov05_0221EAEC
	thumb_func_end ov05_0221E274

	thumb_func_start ov05_0221E2D8
ov05_0221E2D8: ; 0x0221E2D8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x14
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	add r7, r0, #0
	bl sub_02074490
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _0221E388 ; =0x0000B808
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl sub_0200D5D4
	bl sub_02074498
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E38C ; =0x0000B809
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl sub_0200D6EC
	bl sub_020744A4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E38C ; =0x0000B809
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl sub_0200D71C
	mov r4, #0
	add r6, r5, #0
_0221E350:
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E38C ; =0x0000B809
	mov r1, #0x65
	add r0, r4, r0
	str r0, [sp, #8]
	mov r0, #0x19
	mov r3, #0x85
	lsl r0, r0, #4
	lsl r1, r1, #2
	lsl r3, r3, #2
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	ldr r3, [r6, r3]
	add r2, r7, #0
	bl sub_0200D504
	add r4, r4, #1
	add r6, #0x18
	cmp r4, #6
	blo _0221E350
	add r0, r7, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E388: .word 0x0000B808
_0221E38C: .word 0x0000B809
	thumb_func_end ov05_0221E2D8

	thumb_func_start ov05_0221E390
ov05_0221E390: ; 0x0221E390
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x15
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E420 ; =0x0000B80F
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x14
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221E424 ; =0x0000B809
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x15
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E428 ; =0x0000B80A
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x13
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E428 ; =0x0000B80A
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x12
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221E420: .word 0x0000B80F
_0221E424: .word 0x0000B809
_0221E428: .word 0x0000B80A
	thumb_func_end ov05_0221E390

	thumb_func_start ov05_0221E42C
ov05_0221E42C: ; 0x0221E42C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x27
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E4BC ; =0x0000B810
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x40
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, _0221E4C0 ; =0x0000B80A
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x41
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E4C4 ; =0x0000B80B
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x3f
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E4C4 ; =0x0000B80B
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #0x3e
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221E4BC: .word 0x0000B810
_0221E4C0: .word 0x0000B80A
_0221E4C4: .word 0x0000B80B
	thumb_func_end ov05_0221E42C

	thumb_func_start ov05_0221E4C8
ov05_0221E4C8: ; 0x0221E4C8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5]
	mov r0, #0x15
	ldr r1, [r1, #0x24]
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0221E558 ; =0x0000B811
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #8]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #2
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, _0221E55C ; =0x0000B80B
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #8
	bl sub_0200D5D4
	mov r0, #0
	str r0, [sp]
	ldr r0, _0221E560 ; =0x0000B80C
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	mov r3, #1
	bl sub_0200D6EC
	mov r3, #0
	mov r1, #0x19
	ldr r0, _0221E560 ; =0x0000B80C
	str r3, [sp]
	lsl r1, r1, #4
	str r0, [sp, #4]
	ldr r0, [r5, r1]
	add r1, r1, #4
	ldr r1, [r5, r1]
	add r2, r4, #0
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0221E558: .word 0x0000B811
_0221E55C: .word 0x0000B80B
_0221E560: .word 0x0000B80C
	thumb_func_end ov05_0221E4C8

	thumb_func_start ov05_0221E564
ov05_0221E564: ; 0x0221E564
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0]
	add r7, r1, #0
	add r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221E57E
	mov r0, #3
	str r0, [sp, #8]
	lsl r0, r7, #0x13
	b _0221E588
_0221E57E:
	mov r0, #0
	str r0, [sp, #8]
	lsl r0, r7, #3
	neg r0, r0
	lsl r0, r0, #0x10
_0221E588:
	asr r7, r0, #0x10
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	mov r1, #0xa
	ldr r2, _0221E5E0 ; =ov05_0221EC5C
	mul r1, r0
	add r0, r2, r1
	str r0, [sp, #4]
_0221E59A:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	ldr r4, [sp, #4]
	add r1, r1, r0
	lsl r0, r1, #2
	add r0, r1, r0
	lsl r1, r0, #2
	ldr r0, [sp]
	mov r6, #0
	add r5, r0, r1
_0221E5AE:
	ldrb r1, [r4]
	mov r0, #0x66
	lsl r0, r0, #2
	add r1, r7, r1
	lsl r1, r1, #0x10
	ldrb r2, [r4, #1]
	ldr r0, [r5, r0]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r6, #5
	blt _0221E5AE
	ldr r0, [sp, #4]
	add r0, #0xa
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _0221E59A
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E5E0: .word ov05_0221EC5C
	thumb_func_end ov05_0221E564

	thumb_func_start ov05_0221E5E4
ov05_0221E5E4: ; 0x0221E5E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _0221E608 ; =ov05_0221ECE4
	mov r6, #0
	add r5, #0x10
_0221E5F0:
	ldr r0, [r7, #0xc]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #0x18
	blo _0221E5F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221E608: .word ov05_0221ECE4
	thumb_func_end ov05_0221E5E4

	thumb_func_start ov05_0221E60C
ov05_0221E60C: ; 0x0221E60C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x10
_0221E614:
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x18
	blo _0221E614
	pop {r3, r4, r5, pc}
	thumb_func_end ov05_0221E60C

	thumb_func_start ov05_0221E624
ov05_0221E624: ; 0x0221E624
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r4, [sp, #0x3c]
	add r5, r0, #0
	add r7, r5, #0
	lsl r0, r4, #6
	add r7, #0x10
	str r0, [sp, #0x1c]
	str r1, [sp, #0x10]
	str r3, [sp, #0x14]
	ldr r6, [sp, #0x38]
	cmp r4, #3
	ldr r0, [r5]
	bhs _0221E64C
	ldr r0, [r0, #4]
	add r1, r4, #0
	bl GetPartyMonByIndex
	str r0, [sp, #0x18]
	b _0221E656
_0221E64C:
	ldr r0, [r0, #0xc]
	sub r1, r4, #3
	bl GetPartyMonByIndex
	str r0, [sp, #0x18]
_0221E656:
	add r1, r4, #0
	ldr r0, [sp, #0x10]
	add r1, #8
	bl NewString_ReadMsgData
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0
	bl BufferBoxMonNickname
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x20]
	add r1, r6, #0
	bl StringExpandPlaceholders
	ldr r0, [sp, #0x20]
	bl String_dtor
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E708 ; =0x000F0E00
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	add r3, r1, #0
	add r0, r7, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	mov r0, #0x18
	mul r0, r4
	add r2, r5, r0
	ldr r0, _0221E70C ; =0x00000222
	ldrb r1, [r2, r0]
	cmp r1, #0
	bne _0221E704
	sub r0, r0, #1
	ldrb r0, [r2, r0]
	cmp r0, #0
	bne _0221E6DC
	ldr r0, [sp, #0x10]
	mov r1, #0x1b
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0xc1
	lsl r0, r0, #0xa
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	add r2, r6, #0
	add r0, r7, r0
	mov r3, #0x40
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0221E6DC:
	cmp r0, #1
	bne _0221E704
	ldr r0, [sp, #0x10]
	mov r1, #0x1c
	add r2, r6, #0
	bl ReadMsgDataIntoString
	mov r1, #0
	str r1, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _0221E710 ; =0x00050600
	add r2, r6, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x1c]
	mov r3, #0x40
	add r0, r7, r0
	str r1, [sp, #0xc]
	bl AddTextPrinterParameterized2
_0221E704:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E708: .word 0x000F0E00
_0221E70C: .word 0x00000222
_0221E710: .word 0x00050600
	thumb_func_end ov05_0221E624

	thumb_func_start ov05_0221E714
ov05_0221E714: ; 0x0221E714
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, [sp, #0x24]
	add r4, r0, #0
	lsl r5, r3, #2
	add r5, r5, #1
	mov r1, #0
	add r0, #0x10
	lsl r5, r5, #4
	str r1, [sp]
	add r0, r0, r5
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, #2
	str r0, [sp, #0xc]
	add r0, r2, #0
	mov r2, #0x18
	mul r2, r3
	add r3, r4, r2
	mov r2, #0x22
	lsl r2, r2, #4
	ldrb r2, [r3, r2]
	mov r1, #1
	mov r3, #3
	bl sub_0200CE7C
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov05_0221E714

	thumb_func_start ov05_0221E74C
ov05_0221E74C: ; 0x0221E74C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, [sp, #0x24]
	add r5, r0, #0
	lsl r0, r1, #2
	add r7, r2, #0
	add r2, r5, #0
	add r0, r0, #2
	add r6, r1, #0
	add r2, #0x10
	lsl r0, r0, #4
	add r4, r2, r0
	mov r0, #0x18
	mul r6, r0
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r1, _0221E7B4 ; =0x0000021A
	add r2, r5, r6
	ldrh r1, [r2, r1]
	add r0, r7, #0
	mov r2, #3
	mov r3, #1
	bl sub_0200CDF0
	mov r0, #2
	str r0, [sp]
	add r0, r7, #0
	mov r1, #0
	add r2, r4, #0
	mov r3, #0x18
	bl sub_0200CDAC
	mov r1, #0x87
	str r4, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	add r2, r5, r6
	lsl r1, r1, #2
	ldrh r1, [r2, r1]
	add r0, r7, #0
	mov r2, #3
	mov r3, #0
	bl sub_0200CDF0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221E7B4: .word 0x0000021A
	thumb_func_end ov05_0221E74C

	thumb_func_start ov05_0221E7B8
ov05_0221E7B8: ; 0x0221E7B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	lsl r0, r1, #2
	add r2, r5, #0
	add r0, r0, #3
	add r2, #0x10
	lsl r0, r0, #4
	add r4, r2, r0
	mov r0, #0x18
	add r6, r1, #0
	mul r6, r0
	mov r0, #0x87
	lsl r0, r0, #2
	add r7, r5, r0
	sub r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #8]
	ldrh r0, [r0, r6]
	ldrh r1, [r7, r6]
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0221E846
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E7F6: ; jump table
	.short _0221E846 - _0221E7F6 - 2 ; case 0
	.short _0221E830 - _0221E7F6 - 2 ; case 1
	.short _0221E818 - _0221E7F6 - 2 ; case 2
	.short _0221E800 - _0221E7F6 - 2 ; case 3
	.short _0221E800 - _0221E7F6 - 2 ; case 4
_0221E800:
	ldrb r3, [r4, #9]
	ldr r1, _0221E89C ; =0x000004F6
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	b _0221E846
_0221E818:
	ldrb r3, [r4, #9]
	ldr r1, _0221E8A0 ; =0x00000516
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
	b _0221E846
_0221E830:
	ldrb r3, [r4, #9]
	ldr r1, _0221E8A4 ; =0x00000536
	mov r0, #1
	lsl r3, r3, #4
	add r3, #9
	lsl r3, r3, #0x11
	add r1, r5, r1
	mov r2, #4
	lsr r3, r3, #0x10
	bl BG_LoadPlttData
_0221E846:
	ldr r0, [sp, #8]
	ldrh r1, [r7, r6]
	ldrh r0, [r0, r6]
	mov r2, #0x30
	bl sub_02088068
	add r5, r0, #0
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	mov r3, #2
	bl FillWindowPixelRect
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #9
	mov r2, #0
	mov r3, #3
	bl FillWindowPixelRect
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	mov r3, #5
	bl FillWindowPixelRect
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221E89C: .word 0x000004F6
_0221E8A0: .word 0x00000516
_0221E8A4: .word 0x00000536
	thumb_func_end ov05_0221E7B8

	thumb_func_start ov05_0221E8A8
ov05_0221E8A8: ; 0x0221E8A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	ldr r6, [sp, #0x2c]
	add r5, r7, #0
	str r1, [sp, #8]
	add r5, #0x10
	lsl r4, r6, #6
	add r0, r5, r4
	mov r1, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	bl FillWindowPixelBuffer
	add r0, r5, r4
	add r0, #0x10
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, r4
	add r0, #0x20
	mov r1, #0
	bl FillWindowPixelBuffer
	add r0, r5, r4
	add r0, #0x30
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	str r6, [sp, #4]
	bl ov05_0221E624
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	str r6, [sp, #4]
	bl ov05_0221E714
	ldr r0, [sp, #0x28]
	ldr r1, [sp, #8]
	str r0, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add r0, r7, #0
	str r6, [sp, #4]
	bl ov05_0221E74C
	add r0, r7, #0
	add r1, r6, #0
	bl ov05_0221E7B8
	add r0, r5, r4
	bl ScheduleWindowCopyToVram
	add r0, r5, r4
	add r0, #0x10
	bl ScheduleWindowCopyToVram
	add r0, r5, r4
	add r0, #0x20
	bl ScheduleWindowCopyToVram
	add r0, r5, r4
	add r0, #0x30
	bl ScheduleWindowCopyToVram
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov05_0221E8A8

	thumb_func_start ov05_0221E944
ov05_0221E944: ; 0x0221E944
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldr r3, [r6]
	mov r2, #0x4b
	ldr r3, [r3, #0x24]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	ldr r3, [r6]
	str r0, [sp, #0x10]
	ldr r3, [r3, #0x24]
	mov r0, #0xf
	mov r1, #0xe
	mov r2, #0
	bl MessagePrinter_new
	str r0, [sp, #0xc]
	ldr r0, [r6]
	ldr r0, [r0, #0x24]
	bl ScrStrBufs_new
	ldr r1, [r6]
	str r0, [sp, #8]
	ldr r1, [r1, #0x24]
	mov r0, #0x20
	bl String_ctor
	add r7, r0, #0
	mov r4, #0
	add r5, r6, #0
_0221E986:
	mov r0, #0x86
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r0, #0
	beq _0221E9A0
	ldr r1, [sp, #0x10]
	str r7, [sp]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	add r0, r6, #0
	str r4, [sp, #4]
	bl ov05_0221E8A8
_0221E9A0:
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #6
	blo _0221E986
	add r0, r7, #0
	bl String_dtor
	ldr r0, [sp, #0x10]
	bl DestroyMsgData
	ldr r0, [sp, #0xc]
	bl MessagePrinter_delete
	ldr r0, [sp, #8]
	bl ScrStrBufs_delete
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov05_0221E944

	thumb_func_start ov05_0221E9C4
ov05_0221E9C4: ; 0x0221E9C4
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0xd8
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	ldr r0, _0221E9F4 ; =0x00000B88
	mov r2, #0
	add r0, r4, r0
	mov r1, #0xf
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r0, _0221E9F4 ; =0x00000B88
	mov r1, #0
	add r0, r4, r0
	mov r2, #1
	mov r3, #0xf
	bl DrawFrameAndWindow2
	add sp, #8
	pop {r4, pc}
	nop
_0221E9F4: .word 0x00000B88
	thumb_func_end ov05_0221E9C4

	thumb_func_start ov05_0221E9F8
ov05_0221E9F8: ; 0x0221E9F8
	push {r3, lr}
	ldr r0, [r0]
	ldr r1, [r0]
	mov r0, #7
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0221EA10
	bl sub_0202FC48
	cmp r0, #0
	bne _0221EA14
_0221EA10:
	mov r0, #0
	pop {r3, pc}
_0221EA14:
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov05_0221E9F8

	thumb_func_start ov05_0221EA18
ov05_0221EA18: ; 0x0221EA18
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221EA34 ; =0x00000BC4
	ldr r1, [r4, r0]
	cmp r1, #0
	bne _0221EA32
	sub r0, #0x3c
	add r0, r4, r0
	mov r1, #1
	bl sub_0200F0AC
	ldr r1, _0221EA34 ; =0x00000BC4
	str r0, [r4, r1]
_0221EA32:
	pop {r4, pc}
	.balign 4, 0
_0221EA34: .word 0x00000BC4
	thumb_func_end ov05_0221EA18

	thumb_func_start ov05_0221EA38
ov05_0221EA38: ; 0x0221EA38
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0221EA50 ; =0x00000BC4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221EA4E
	bl sub_0200F450
	ldr r0, _0221EA50 ; =0x00000BC4
	mov r1, #0
	str r1, [r4, r0]
_0221EA4E:
	pop {r4, pc}
	.balign 4, 0
_0221EA50: .word 0x00000BC4
	thumb_func_end ov05_0221EA38

	.rodata

_0221EA54:
	.byte 0x00, 0x03, 0x06, 0x09

ov05_0221EA58: ; 0x0221EA58
	.byte 0x00, 0x19, 0x0D, 0x06, 0x04, 0x0D, 0x94, 0x00

ov05_0221EA60: ; 0x0221EA60
	.byte 0x00, 0x00, 0x00, 0x06, 0x00, 0x0C, 0x10, 0x01, 0x10, 0x07, 0x10, 0x0D

ov05_0221EA6C: ; 0x0221EA6C
	.byte 0x06

ov05_0221EA6D: ; 0x0221EA6D
	.byte 0x06, 0x00, 0x06
	.byte 0x00, 0x06, 0x04, 0x0A, 0x00, 0x0A, 0x00, 0x0A

ov05_0221EA78: ; 0x0221EA78
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov05_0221EA88: ; 0x0221EA88
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EA98: ; 0x0221EA98
	.word ov05_0221BE80
	.word ov05_0221C018
	.word ov05_0221C050
	.word ov05_0221C21C
	.word ov05_0221C430

ov05_0221EAAC: ; 0x0221EAAC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov05_0221EAC0: ; 0x0221EAC0
	.word ov05_0221BE04
	.word ov05_0221C018
	.word ov05_0221CC04
	.word ov05_0221C018
	.word ov05_0221CC58

ov05_0221EAD4: ; 0x0221EAD4
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EAEC: ; 0x0221EAEC
	.byte 0x09, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov05_0221EB04: ; 0x0221EB04
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EB1C: ; 0x0221EB1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1E, 0x04
	.byte 0x01, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EB38: ; 0x0221EB38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1E, 0x04, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov05_0221EB54: ; 0x0221EB54
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x1C, 0x04, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EB70: ; 0x0221EB70
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x1B, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EB8C: ; 0x0221EB8C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EBA8: ; 0x0221EBA8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov05_0221EBC4: ; 0x0221EBC4
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1D, 0x04, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov05_0221EBE0: ; 0x0221EBE0
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov05_0221EC00: ; 0x0221EC00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

ov05_0221EC28: ; 0x0221EC28
	.word ov05_0221BF08
	.word ov05_0221C018
	.word ov05_0221C050
	.word ov05_0221C21C
	.word ov05_0221C7FC
	.word ov05_0221C80C
	.word ov05_0221C018
	.word ov05_0221C8E0
	.word ov05_0221C018
	.word ov05_0221C908
	.word ov05_0221C018
	.word ov05_0221CAB8
	.word ov05_0221CC58

ov05_0221EC5C: ; 0x0221EC5C
	.byte 0x1E, 0x10, 0x26, 0x18
	.byte 0x2E, 0x18, 0x24, 0x2C, 0x10, 0x0E, 0x1E, 0x40, 0x26, 0x48, 0x2E, 0x48, 0x24, 0x5C, 0x10, 0x3E
	.byte 0x1E, 0x70, 0x26, 0x78, 0x2E, 0x78, 0x24, 0x8C, 0x10, 0x6E, 0x9E, 0x18, 0xA6, 0x20, 0xAE, 0x20
	.byte 0xA4, 0x34, 0x90, 0x16, 0x9E, 0x48, 0xA6, 0x50, 0xAE, 0x50, 0xA4, 0x64, 0x90, 0x46, 0x9E, 0x78
	.byte 0xA6, 0x80, 0xAE, 0x80, 0xA4, 0x94, 0x90, 0x76

ov05_0221EC98: ; 0x0221EC98
	.word ov05_0221BF08
	.word ov05_0221C018
	.word ov05_0221C050
	.word ov05_0221C21C
	.word ov05_0221C558
	.word ov05_0221C018
	.word ov05_0221C568
	.word ov05_0221C5A8
	.word ov05_0221C7FC
	.word ov05_0221C80C
	.word ov05_0221C018
	.word ov05_0221C8A0
	.word ov05_0221C018
	.word ov05_0221CB70
	.word ov05_0221C018
	.word ov05_0221C908
	.word ov05_0221C018
	.word ov05_0221CAB8
	.word ov05_0221CC58

ov05_0221ECE4: ; 0x0221ECE4
	.byte 0x01, 0x06, 0x01, 0x09, 0x02, 0x00, 0x01, 0x00, 0x01, 0x01, 0x04, 0x05
	.byte 0x02, 0x00, 0x13, 0x00, 0x01, 0x07, 0x04, 0x08, 0x02, 0x00, 0x1D, 0x00, 0x01, 0x08, 0x03, 0x06
	.byte 0x01, 0x03, 0x2D, 0x00, 0x01, 0x06, 0x07, 0x09, 0x02, 0x00, 0x33, 0x00, 0x01, 0x01, 0x0A, 0x05
	.byte 0x02, 0x00, 0x45, 0x00, 0x01, 0x07, 0x0A, 0x08, 0x02, 0x00, 0x4F, 0x00, 0x01, 0x08, 0x09, 0x06
	.byte 0x01, 0x04, 0x5F, 0x00, 0x01, 0x06, 0x0D, 0x09, 0x02, 0x00, 0x65, 0x00, 0x01, 0x01, 0x10, 0x05
	.byte 0x02, 0x00, 0x77, 0x00, 0x01, 0x07, 0x10, 0x08, 0x02, 0x00, 0x81, 0x00, 0x01, 0x08, 0x0F, 0x06
	.byte 0x01, 0x05, 0x91, 0x00, 0x01, 0x16, 0x02, 0x09, 0x02, 0x00, 0x97, 0x00, 0x01, 0x11, 0x05, 0x05
	.byte 0x02, 0x00, 0xA9, 0x00, 0x01, 0x17, 0x05, 0x08, 0x02, 0x00, 0xB3, 0x00, 0x01, 0x18, 0x04, 0x06
	.byte 0x01, 0x06, 0xC3, 0x00, 0x01, 0x16, 0x08, 0x09, 0x02, 0x00, 0xC9, 0x00, 0x01, 0x11, 0x0B, 0x05
	.byte 0x02, 0x00, 0xDB, 0x00, 0x01, 0x17, 0x0B, 0x08, 0x02, 0x00, 0xE5, 0x00, 0x01, 0x18, 0x0A, 0x06
	.byte 0x01, 0x07, 0xF5, 0x00, 0x01, 0x16, 0x0E, 0x09, 0x02, 0x00, 0xFB, 0x00, 0x01, 0x11, 0x11, 0x05
	.byte 0x02, 0x00, 0x0D, 0x01, 0x01, 0x17, 0x11, 0x08, 0x02, 0x00, 0x17, 0x01, 0x01, 0x18, 0x10, 0x06
	.byte 0x01, 0x08, 0x27, 0x01

ov05_0221EDA4: ; 0x0221EDA4
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00
	.byte 0x07, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x07, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov05_0221EF2C: ; 0x0221EF2C
	.byte 0x09, 0xB8, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0xB8, 0x00, 0x00
	.byte 0x08, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00
	.byte 0x0B, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0xB8, 0x00, 0x00, 0x08, 0xB8, 0x00, 0x00
	.byte 0x09, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0F, 0xB8, 0x00, 0x00, 0x09, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00, 0x0A, 0xB8, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xB8, 0x00, 0x00
	.byte 0x0A, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x11, 0xB8, 0x00, 0x00, 0x0B, 0xB8, 0x00, 0x00
	.byte 0x0C, 0xB8, 0x00, 0x00, 0x0C, 0xB8, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	; 0x0221F280
