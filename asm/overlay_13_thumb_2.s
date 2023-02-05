	.include "asm/macros.inc"
	.include "overlay_13_thumb_2.inc"
	.include "global.inc"

	.text

	thumb_func_start ov13_022208E8
ov13_022208E8: ; 0x022208E8
	push {r3, lr}
	ldr r1, _022208F4 ; =ov13_0224DD80
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	nop
_022208F4: .word ov13_0224DD80
	thumb_func_end ov13_022208E8

	thumb_func_start ov13_022208F8
ov13_022208F8: ; 0x022208F8
	push {r3, lr}
	ldr r1, _02220904 ; =ov13_0224DD8C
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	nop
_02220904: .word ov13_0224DD8C
	thumb_func_end ov13_022208F8

	thumb_func_start ov13_02220908
ov13_02220908: ; 0x02220908
	push {r4, lr}
	ldr r2, _022209DC ; =0x00000106
	add r4, r0, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _02220958
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	blt _02220958
	add r0, r2, #2
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt _02220958
	add r0, r2, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _02220958
	cmp r0, r1
	blt _02220958
	add r0, r2, #6
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt _02220958
	add r0, r2, #0
	add r0, #8
	ldrsh r0, [r4, r0]
	cmp r0, r1
	blt _02220958
	ldrh r1, [r4, #4]
	cmp r1, #0
	beq _02220958
	sub r0, r2, #6
	cmp r1, r0
	bhi _02220958
	sub r0, r1, #1
	add r0, r4, r0
	ldrb r0, [r0, #6]
	cmp r0, #0
	beq _0222095E
_02220958:
	mov r1, #0
	mvn r1, r1
	b _02220960
_0222095E:
	mov r1, #0
_02220960:
	ldr r0, _022209E0 ; =ov13_0224DD80
	ldr r0, [r0]
	cmp r0, #0
	beq _02220970
	ldr r0, _022209E4 ; =ov13_0224DD8C
	ldr r0, [r0]
	cmp r0, #0
	bne _02220974
_02220970:
	mov r1, #0
	mvn r1, r1
_02220974:
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _0222098C
	ldr r0, _022209E8 ; =0x00000116
	mov r1, #0xf
	strb r1, [r4, r0]
	bl ov13_02221428
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_0222098C:
	ldr r0, _022209EC ; =0x000005F8
	bl ov13_022208E8
	ldr r1, _022209F0 ; =_0224CF98
	cmp r0, #0
	str r0, [r1, #0x14]
	bne _022209AA
	ldr r0, _022209E8 ; =0x00000116
	mov r1, #0xf
	strb r1, [r4, r0]
	bl ov13_02221428
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_022209AA:
	mov r0, #0
	mvn r0, r0
	bl ov13_022217D0
	add r0, r4, #0
	bl ov13_022209F8
	add r4, r0, #0
	ldr r0, _022209F0 ; =_0224CF98
	ldr r0, [r0, #0x14]
	bl ov13_022208F8
	bl ov13_02221428
	ldr r0, _022209F4 ; =ov13_022459B4
	mov r1, #0
	ldr r0, [r0]
	mvn r1, r1
	cmp r0, r1
	beq _022209D6
	bl ov13_02222A14
_022209D6:
	add r0, r4, #0
	pop {r4, pc}
	nop
_022209DC: .word 0x00000106
_022209E0: .word ov13_0224DD80
_022209E4: .word ov13_0224DD8C
_022209E8: .word 0x00000116
_022209EC: .word 0x000005F8
_022209F0: .word _0224CF98
_022209F4: .word ov13_022459B4
	thumb_func_end ov13_02220908

	thumb_func_start ov13_022209F8
ov13_022209F8: ; 0x022209F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xc8
	ldr r1, _02220D4C ; =_0224267C
	str r0, [sp, #8]
	ldrh r2, [r1]
	ldrh r1, [r1, #2]
	add r0, sp, #0x2c
	strh r2, [r0, #0x30]
	strh r1, [r0, #0x32]
	mov r0, #0
	add r1, sp, #0x58
	strh r0, [r1]
	str r0, [sp, #0x24]
	strh r0, [r1, #2]
	mov r0, #1
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x50]
	str r0, [sp, #0x1c]
	add r0, sp, #0xb0
	mov r2, #0x18
	bl ov13_02222978
	ldr r1, _02220D50 ; =0x00000106
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x30]
	mov r0, #0x30
	ldrsh r2, [r1, r0]
	sub r0, #0x31
	cmp r2, r0
	bne _02220A40
	mov r0, #0xa
	strh r0, [r1, #0x30]
_02220A40:
	ldr r1, _02220D54 ; =0x0000010A
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x2c]
	mov r0, #0x2c
	ldrsh r2, [r1, r0]
	sub r0, #0x2d
	cmp r2, r0
	bne _02220A58
	mov r0, #0xa
	strh r0, [r1, #0x2c]
_02220A58:
	mov r1, #0x42
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x32]
	mov r0, #0x32
	ldrsh r2, [r1, r0]
	sub r0, #0x33
	cmp r2, r0
	bne _02220A72
	mov r0, #0x64
	strh r0, [r1, #0x32]
_02220A72:
	mov r1, #0x43
	ldr r0, [sp, #8]
	lsl r1, r1, #2
	ldrsh r0, [r0, r1]
	add r1, sp, #0x2c
	strh r0, [r1, #0x2e]
	mov r0, #0x2e
	ldrsh r2, [r1, r0]
	sub r0, #0x2f
	cmp r2, r0
	bne _02220A8C
	mov r0, #0x64
	strh r0, [r1, #0x2e]
_02220A8C:
	ldr r1, _02220D58 ; =0x0000010E
	ldr r0, [sp, #8]
	ldrsh r0, [r0, r1]
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0xc]
	cmp r0, r1
	bne _02220AA2
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #0xc]
_02220AA2:
	ldr r0, [sp, #8]
	bl ov13_02221454
	ldr r0, _02220D5C ; =_0224CF98
	ldr r1, [r0, #0x2c]
	mov r0, #1
	and r0, r1
	cmp r0, #1
	beq _02220ACE
	mov r0, #0x13
	bl ov13_022214AC
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220ACE:
	mov r4, #0
	add r0, r4, #0
	bl ov13_022217D0
	add r1, sp, #0x2c
	mov r0, #0x32
	ldrsh r6, [r1, r0]
	mov r0, #0x30
	ldrsh r7, [r1, r0]
	ldr r5, _02220D5C ; =_0224CF98
_02220AE2:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02220AF0
	bl ov13_022208F8
	mov r0, #0
	str r0, [r5, #4]
_02220AF0:
	ldr r0, _02220D64 ; =ov13_0224CF9C
	bl ov13_02222DB0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02220B12
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B12:
	ldr r0, [r5, #4]
	bl ov13_022216E0
	cmp r0, #4
	bne _02220B30
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #2
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B30:
	cmp r0, #0
	beq _02220B5A
	cmp r4, r7
	blt _02220B4C
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B4C:
	add r0, r6, #0
	bl ov13_022230F8
	add r0, r4, #1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02220AE2
_02220B5A:
	mov r0, #1
	bl ov13_022217D0
	add r0, sp, #0x74
	mov r1, #0
	mov r2, #0x3c
	bl ov13_02222978
	add r0, sp, #0x74
	bl ov13_0222175C
	cmp r0, #0
	beq _02220B88
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220B88:
	mov r0, #0x58
	bl ov13_022208E8
	ldr r1, _02220D5C ; =_0224CF98
	cmp r0, #0
	str r0, [r1, #0xc]
	bne _02220BAA
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220BAA:
	mov r1, #0
	mov r2, #0x58
	bl ov13_02222978
	add r1, sp, #0x2c
	mov r0, #0x30
	ldrsh r5, [r1, r0]
	mov r4, #0
	cmp r5, #0
	ble _02220C02
	ldr r7, _02220D5C ; =_0224CF98
_02220BC0:
	ldr r1, [r7, #0xc]
	add r0, sp, #0x74
	bl ov13_02222F28
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02220BE4
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220BE4:
	cmp r0, #0
	bne _02220BF2
	bne _02220C02
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	cmp r0, #1
	beq _02220C02
_02220BF2:
	add r0, r6, #0
	bl ov13_022230F8
	add r0, r4, #1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r4, r5
	blt _02220BC0
_02220C02:
	add r0, sp, #0x2c
	mov r1, #0x30
	ldrsh r0, [r0, r1]
	cmp r4, r0
	bne _02220C20
	ldr r0, [sp, #8]
	mov r2, #0xf
	add r1, #0xe6
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220C20:
	ldr r0, _02220D68 ; =0xC0A80B65
	mov r1, #0xff
	mvn r1, r1
	add r2, r0, #0
	bl ov13_022228CC
	cmp r0, #0
	beq _02220C4A
	mov r0, #0xc
	bl ov13_022214AC
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220C4A:
	bl ov13_02221428
	mov r3, #0x11
	ldr r2, [sp, #8]
	lsl r3, r3, #4
	mov r0, #3
	add r1, sp, #0xb0
	add r2, r2, r3
	bl ov13_022217A0
	mov r0, #2
	add r1, r0, #0
	mov r2, #0
	bl ov13_02222A00
	ldr r1, _02220D6C ; =ov13_022459B4
	cmp r0, #0
	str r0, [r1]
	bge _02220C84
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220C84:
	mov r1, #4
	str r1, [sp]
	ldr r1, _02220D70 ; =0x0000FFFF
	mov r2, #1
	add r3, sp, #0x54
	bl ov13_022229FC
	cmp r0, #0
	bge _02220CB0
	mov r0, #0xb
	bl ov13_022214AC
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220CB0:
	add r0, sp, #0x2c
	mov r1, #0
	mov r2, #8
	bl ov13_02222978
	mov r1, #2
	add r0, sp, #0x2c
	strb r1, [r0, #1]
	ldr r0, _02220D68 ; =0xC0A80B65
	bl ov13_02222A1C
	str r0, [sp, #0x30]
	ldr r0, _02220D74 ; =0x00005790
	bl ov13_02222A44
	add r1, sp, #0x2c
	strh r0, [r1, #2]
	ldr r0, _02220D6C ; =ov13_022459B4
	add r1, sp, #0x2c
	ldr r0, [r0]
	mov r2, #8
	bl ov13_02222A08
	cmp r0, #0
	bge _02220CF6
	ldr r1, _02220D60 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220CF6:
	ldr r0, _02220D5C ; =_0224CF98
	mov r1, #0
	ldr r0, [r0, #0x14]
	mov r2, #0x14
	str r0, [sp, #0x18]
	add r0, sp, #0x60
	bl ov13_02222978
	ldr r0, _02220D68 ; =0xC0A80B65
	mov r1, #0xfa
	str r0, [sp, #0x70]
	sub r0, #0x64
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xc]
	lsl r1, r1, #2
	bl _s32_div_f
	str r0, [sp, #0x14]
	mov r1, #0xfa
	ldr r0, [sp, #0xc]
	lsl r1, r1, #2
	bl _s32_div_f
	mov r0, #0xfa
	lsl r0, r0, #2
	mul r0, r1
	str r0, [sp, #0x10]
	mov r1, #0x30
	add r0, sp, #0x2c
	ldrsh r7, [r0, r1]
	ldr r5, _02220D5C ; =_0224CF98
_02220D34:
	ldr r0, [sp, #0x24]
	cmp r0, #1
	bne _02220D44
	ldr r1, _02220D78 ; =ov13_0224CFB8
	mov r0, #0x1c
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _02220D46
_02220D44:
	b _02220FC0
_02220D46:
	ldr r0, _02220D6C ; =ov13_022459B4
	b _02220D7C
	nop
_02220D4C: .word _0224267C
_02220D50: .word 0x00000106
_02220D54: .word 0x0000010A
_02220D58: .word 0x0000010E
_02220D5C: .word _0224CF98
_02220D60: .word 0x00000116
_02220D64: .word ov13_0224CF9C
_02220D68: .word 0xC0A80B65
_02220D6C: .word ov13_022459B4
_02220D70: .word 0x0000FFFF
_02220D74: .word 0x00005790
_02220D78: .word ov13_0224CFB8
_02220D7C:
	mov r1, #0
	ldr r0, [r0]
	mvn r1, r1
	cmp r0, r1
	beq _02220D8A
	bl ov13_02222A14
_02220D8A:
	mov r1, #0
	ldr r0, _022210BC ; =ov13_022459B4
	mvn r1, r1
	str r1, [r0]
	bl ov13_02222924
	cmp r0, #0
	beq _02220DAE
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220DAE:
	mov r0, #0x58
	bl ov13_022208E8
	str r0, [r5, #4]
	cmp r0, #0
	bne _02220DCE
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220DCE:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02220DDC
	bl ov13_022208F8
	mov r0, #0
	str r0, [r5, #4]
_02220DDC:
	ldr r0, _022210C4 ; =ov13_0224CF9C
	bl ov13_02222DB0
	mov r1, #0
	mvn r1, r1
	str r0, [sp, #0x28]
	cmp r0, r1
	bne _02220E00
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E00:
	ldr r0, [r5, #4]
	bl ov13_022216E0
	cmp r0, #4
	bne _02220E1E
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #2
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E1E:
	cmp r0, #0
	beq _02220E48
	cmp r4, r7
	blt _02220E3A
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E3A:
	add r0, r6, #0
	bl ov13_022230F8
	add r0, r4, #1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02220DCE
_02220E48:
	mov r0, #0
	ldr r1, [sp, #0x28]
	mvn r0, r0
	cmp r1, r0
	bne _02220E66
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E66:
	mov r0, #0x58
	bl ov13_022208E8
	str r0, [r5, #0xc]
	cmp r0, #0
	bne _02220E86
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220E86:
	mov r1, #0
	mov r2, #0x58
	bl ov13_02222978
	mov r4, #0
	cmp r7, #0
	ble _02220ED6
_02220E94:
	ldr r1, [r5, #0xc]
	add r0, sp, #0x74
	bl ov13_02222F28
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02220EB8
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220EB8:
	cmp r0, #0
	bne _02220EC6
	bne _02220ED6
	ldr r0, [r5, #0xc]
	ldr r0, [r0]
	cmp r0, #1
	beq _02220ED6
_02220EC6:
	add r0, r6, #0
	bl ov13_022230F8
	add r0, r4, #1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r4, r7
	blt _02220E94
_02220ED6:
	cmp r4, r7
	bne _02220EEE
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220EEE:
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl ov13_02221410
	ldr r1, [r5, #0x38]
	add r2, r0, #0
	str r0, [sp, #0x1c]
	bl ov13_022228CC
	cmp r0, #0
	beq _02220F1E
	mov r0, #0xc
	bl ov13_022214AC
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220F1E:
	ldr r0, _022210C8 ; =ov13_0224CFB8
	mov r1, #1
	strb r1, [r0, #0x1c]
	bl ov13_02221428
	mov r0, #2
	add r1, r0, #0
	mov r2, #0
	bl ov13_02222A00
	ldr r1, _022210BC ; =ov13_022459B4
	cmp r0, #0
	str r0, [r1]
	bge _02220F4E
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220F4E:
	mov r1, #4
	str r1, [sp]
	ldr r1, _022210CC ; =0x0000FFFF
	mov r2, #1
	add r3, sp, #0x54
	bl ov13_022229FC
	cmp r0, #0
	bge _02220F7A
	mov r0, #0xb
	bl ov13_022214AC
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220F7A:
	add r0, sp, #0x2c
	mov r1, #0
	mov r2, #8
	bl ov13_02222978
	mov r1, #2
	add r0, sp, #0x2c
	strb r1, [r0, #1]
	ldr r0, [sp, #0x1c]
	bl ov13_02222A1C
	str r0, [sp, #0x30]
	ldr r0, _022210D0 ; =0x00005790
	bl ov13_02222A44
	add r1, sp, #0x2c
	strh r0, [r1, #2]
	ldr r0, _022210BC ; =ov13_022459B4
	add r1, sp, #0x2c
	ldr r0, [r0]
	mov r2, #8
	bl ov13_02222A08
	cmp r0, #0
	bge _02220FC0
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220FC0:
	ldr r3, _022210BC ; =ov13_022459B4
	ldr r0, [sp, #0x24]
	ldr r3, [r3]
	add r1, sp, #0x60
	add r2, sp, #0xb0
	bl ov13_022220B4
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02220FF6
	mov r1, #1
	ldr r0, [sp, #0x24]
	lsl r1, r1, #0xc
	add r0, r0, r1
	bl ov13_022214AC
	ldr r1, _022210C0 ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02220FF6:
	ldr r0, [sp, #0x18]
	ldr r2, _022210D4 ; =0x000005F8
	mov r1, #0
	bl ov13_02222978
	add r0, sp, #0x3c
	bl ov13_02222B20
	ldr r0, _022210BC ; =ov13_022459B4
	add r1, sp, #0x3c
	ldr r0, [r0]
	bl ov13_02222B2C
	ldr r0, [sp, #0x14]
	mov r2, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x10]
	add r1, sp, #0x3c
	str r0, [sp, #0x38]
	add r0, sp, #0x34
	str r0, [sp]
	ldr r0, _022210BC ; =ov13_022459B4
	add r3, r2, #0
	ldr r0, [r0]
	add r0, r0, #1
	bl ov13_02222998
	cmp r0, #0
	bgt _02221070
	ldr r0, [sp, #0x50]
	add r1, sp, #0x2c
	add r2, r0, #1
	str r2, [sp, #0x50]
	mov r0, #0x2c
	ldrsh r0, [r1, r0]
	cmp r2, r0
	ble _02221066
	ldr r0, [sp, #0x24]
	cmp r0, #0
	bne _0222104E
	mov r0, #0xf
	bl ov13_022214AC
	b _02221060
_0222104E:
	cmp r0, #1
	bne _0222105A
	mov r0, #0x10
	bl ov13_022214AC
	b _02221060
_0222105A:
	mov r0, #0x11
	bl ov13_022214AC
_02221060:
	mov r5, #0
	mvn r5, r5
	b _0222134E
_02221066:
	mov r0, #0x2e
	ldrsh r0, [r1, r0]
	bl ov13_022230F8
	b _02220D34
_02221070:
	mov r0, #8
	str r0, [sp, #0x44]
	add r0, sp, #0x48
	str r0, [sp]
	add r0, sp, #0x44
	str r0, [sp, #4]
	ldr r0, _022210BC ; =ov13_022459B4
	ldr r1, [sp, #0x18]
	ldr r0, [r0]
	ldr r2, _022210D8 ; =0x000005DC
	add r1, #0xc
	mov r3, #0
	bl ov13_02222984
	ldr r1, _022210BC ; =ov13_022459B4
	lsl r0, r0, #0x10
	ldr r2, [r1]
	ldr r1, [sp, #0x18]
	lsr r0, r0, #0x10
	str r2, [r1]
	bl ov13_02222A84
	ldr r1, [sp, #0x18]
	add r2, sp, #0x50
	str r0, [r1, #4]
	ldr r0, _022210BC ; =ov13_022459B4
	add r3, sp, #0xb0
	ldr r0, [r0]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	bl ov13_022217FC
	str r0, [sp, #0x20]
	cmp r0, #0x64
	bne _022210DC
	mov r5, #0
	b _0222134E
	nop
_022210BC: .word ov13_022459B4
_022210C0: .word 0x00000116
_022210C4: .word ov13_0224CF9C
_022210C8: .word ov13_0224CFB8
_022210CC: .word 0x0000FFFF
_022210D0: .word 0x00005790
_022210D4: .word 0x000005F8
_022210D8: .word 0x000005DC
_022210DC:
	mov r5, #0
	mvn r5, r5
	cmp r0, r5
	bne _022210E6
	b _0222134E
_022210E6:
	ldr r1, [sp, #0x24]
	cmp r1, r0
	bne _022210EE
	b _02221310
_022210EE:
	cmp r0, #2
	beq _022210F4
	b _0222130A
_022210F4:
	ldr r0, _022213F8 ; =ov13_022459B4
	ldr r0, [r0]
	cmp r0, r5
	beq _02221100
	bl ov13_02222A14
_02221100:
	mov r1, #0
	ldr r0, _022213F8 ; =ov13_022459B4
	mvn r1, r1
	str r1, [r0]
	bl ov13_02222924
	cmp r0, #0
	beq _02221124
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221124:
	mov r0, #4
	mov r4, #0
	bl ov13_022217D0
	add r1, sp, #0x2c
	mov r0, #0x30
	ldrsh r7, [r1, r0]
	ldr r5, _02221400 ; =_0224CF98
_02221134:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02221142
	bl ov13_022208F8
	mov r0, #0
	str r0, [r5, #4]
_02221142:
	ldr r0, _02221404 ; =ov13_0224CF9C
	bl ov13_02222DB0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02221164
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221164:
	ldr r0, [r5, #4]
	bl ov13_022216E0
	cmp r0, #4
	bne _02221182
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #2
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221182:
	cmp r0, #0
	beq _022211AC
	cmp r4, r7
	blt _0222119E
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #1
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222119E:
	add r0, r6, #0
	bl ov13_022230F8
	add r0, r4, #1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	b _02221134
_022211AC:
	mov r0, #0x58
	bl ov13_022208E8
	ldr r1, _02221400 ; =_0224CF98
	cmp r0, #0
	str r0, [r1, #0xc]
	bne _022211CE
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022211CE:
	mov r1, #0
	mov r2, #0x58
	bl ov13_02222978
	add r1, sp, #0x2c
	mov r0, #0x30
	ldrsh r5, [r1, r0]
	mov r4, #0
	cmp r5, #0
	ble _02221226
	ldr r7, _02221400 ; =_0224CF98
_022211E4:
	ldr r1, [r7, #0xc]
	add r0, sp, #0x74
	bl ov13_02222F28
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02221208
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221208:
	cmp r0, #0
	bne _02221216
	bne _02221226
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	cmp r0, #1
	beq _02221226
_02221216:
	add r0, r6, #0
	bl ov13_022230F8
	add r0, r4, #1
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r4, r5
	blt _022211E4
_02221226:
	add r0, sp, #0x2c
	mov r1, #0x30
	ldrsh r0, [r0, r1]
	cmp r4, r0
	bne _02221244
	ldr r0, [sp, #8]
	mov r2, #0xf
	add r1, #0xe6
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221244:
	ldr r1, _02221400 ; =_0224CF98
	ldr r0, [sp, #0x1c]
	ldr r1, [r1, #0x38]
	add r2, r0, #0
	bl ov13_022228CC
	cmp r0, #0
	beq _0222126E
	mov r0, #0xc
	bl ov13_022214AC
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222126E:
	bl ov13_02221428
	mov r0, #2
	add r1, r0, #0
	mov r2, #0
	bl ov13_02222A00
	ldr r1, _022213F8 ; =ov13_022459B4
	cmp r0, #0
	str r0, [r1]
	bge _02221298
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221298:
	mov r1, #4
	str r1, [sp]
	ldr r1, _02221408 ; =0x0000FFFF
	mov r2, #1
	add r3, sp, #0x54
	bl ov13_022229FC
	cmp r0, #0
	bge _022212C4
	mov r0, #0xb
	bl ov13_022214AC
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022212C4:
	add r0, sp, #0x2c
	mov r1, #0
	mov r2, #8
	bl ov13_02222978
	mov r1, #2
	add r0, sp, #0x2c
	strb r1, [r0, #1]
	ldr r0, [sp, #0x1c]
	bl ov13_02222A1C
	str r0, [sp, #0x30]
	ldr r0, _0222140C ; =0x00005790
	bl ov13_02222A44
	add r1, sp, #0x2c
	strh r0, [r1, #2]
	ldr r0, _022213F8 ; =ov13_022459B4
	add r1, sp, #0x2c
	ldr r0, [r0]
	mov r2, #8
	bl ov13_02222A08
	cmp r0, #0
	bge _0222130A
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222130A:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x24]
	b _02220CF6
_02221310:
	str r0, [sp, #0x24]
	add r1, sp, #0x2c
	mov r0, #0x2c
	ldrsh r0, [r1, r0]
	ldr r2, [sp, #0x50]
	cmp r2, r0
	ble _02221344
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _0222132C
	mov r0, #0xf
	bl ov13_022214AC
	b _0222133E
_0222132C:
	cmp r0, #1
	bne _02221338
	mov r0, #0x10
	bl ov13_022214AC
	b _0222133E
_02221338:
	mov r0, #0x11
	bl ov13_022214AC
_0222133E:
	mov r5, #0
	mvn r5, r5
	b _0222134E
_02221344:
	mov r0, #0x2e
	ldrsh r0, [r1, r0]
	bl ov13_022230F8
	b _02220CF6
_0222134E:
	ldr r0, _022213F8 ; =ov13_022459B4
	mov r1, #0
	ldr r0, [r0]
	mvn r1, r1
	cmp r0, r1
	beq _0222135E
	bl ov13_02222A14
_0222135E:
	mov r1, #0
	ldr r0, _022213F8 ; =ov13_022459B4
	mvn r1, r1
	str r1, [r0]
	bl ov13_02222924
	cmp r0, #0
	beq _02221382
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #0xf
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221382:
	cmp r5, #0
	beq _022213D2
	bl ov13_022214B8
	sub r0, #0xf
	cmp r0, #6
	bhi _022213BE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222139C: ; jump table
	.short _022213AA - _0222139C - 2 ; case 0
	.short _022213AE - _0222139C - 2 ; case 1
	.short _022213B2 - _0222139C - 2 ; case 2
	.short _022213BE - _0222139C - 2 ; case 3
	.short _022213BE - _0222139C - 2 ; case 4
	.short _022213B6 - _0222139C - 2 ; case 5
	.short _022213BA - _0222139C - 2 ; case 6
_022213AA:
	mov r2, #3
	b _022213C0
_022213AE:
	mov r2, #4
	b _022213C0
_022213B2:
	mov r2, #5
	b _022213C0
_022213B6:
	mov r2, #7
	b _022213C0
_022213BA:
	mov r2, #8
	b _022213C0
_022213BE:
	mov r2, #0xf
_022213C0:
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022213D2:
	ldr r0, [sp, #8]
	bl ov13_022214C4
	cmp r0, #0
	beq _022213F0
	ldr r1, _022213FC ; =0x00000116
	ldr r0, [sp, #8]
	mov r2, #6
	strb r2, [r0, r1]
	bl ov13_02221428
	mov r0, #0
	add sp, #0xc8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022213F0:
	mov r0, #0
	add sp, #0xc8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022213F8: .word ov13_022459B4
_022213FC: .word 0x00000116
_02221400: .word _0224CF98
_02221404: .word ov13_0224CF9C
_02221408: .word 0x0000FFFF
_0222140C: .word 0x00005790
	thumb_func_end ov13_022209F8

	thumb_func_start ov13_02221410
ov13_02221410: ; 0x02221410
	add r2, r0, #0
	and r2, r1
	mvn r1, r1
	and r0, r1
	add r0, r0, #1
	orr r0, r2
	orr r1, r2
	cmp r0, r1
	blo _02221426
	mov r0, #1
	orr r0, r2
_02221426:
	bx lr
	thumb_func_end ov13_02221410

	thumb_func_start ov13_02221428
ov13_02221428: ; 0x02221428
	push {r3, lr}
	ldr r0, _02221450 ; =_0224CF98
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0222143C
	bl ov13_022208F8
	ldr r0, _02221450 ; =_0224CF98
	mov r1, #0
	str r1, [r0, #0xc]
_0222143C:
	ldr r0, _02221450 ; =_0224CF98
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _0222144E
	bl ov13_022208F8
	ldr r0, _02221450 ; =_0224CF98
	mov r1, #0
	str r1, [r0, #4]
_0222144E:
	pop {r3, pc}
	.balign 4, 0
_02221450: .word _0224CF98
	thumb_func_end ov13_02221428

	thumb_func_start ov13_02221454
ov13_02221454: ; 0x02221454
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02221498 ; =ov13_0224DCF8
	mov r1, #0
	mov r2, #8
	bl ov13_02222978
	ldr r0, _0222149C ; =_0224CF98
	mov r1, #1
	str r1, [r0, #0x10]
	ldr r0, _022214A0 ; =ov13_0224CFBC
	mov r1, #0
	mov r2, #0x1c
	bl ov13_02222978
	ldr r1, _0222149C ; =_0224CF98
	add r0, r4, #6
	str r0, [r1, #0x24]
	ldrh r0, [r4, #4]
	mov r3, #0
	str r0, [r1, #0x28]
	ldrh r2, [r4]
	mov r0, #0xf
	and r0, r2
	str r0, [r1, #0x2c]
	ldrb r2, [r4, #2]
	ldr r0, _022214A4 ; =ov13_0224CFB8
	strb r2, [r0, #0x1d]
	ldr r2, _022214A8 ; =0xC0A80B01
	str r3, [r1, #0x30]
	str r2, [r1, #0x34]
	strb r3, [r0, #0x1c]
	pop {r4, pc}
	nop
_02221498: .word ov13_0224DCF8
_0222149C: .word _0224CF98
_022214A0: .word ov13_0224CFBC
_022214A4: .word ov13_0224CFB8
_022214A8: .word 0xC0A80B01
	thumb_func_end ov13_02221454

	thumb_func_start ov13_022214AC
ov13_022214AC: ; 0x022214AC
	ldr r1, _022214B4 ; =_0224CF98
	str r0, [r1, #0x10]
	bx lr
	nop
_022214B4: .word _0224CF98
	thumb_func_end ov13_022214AC

	thumb_func_start ov13_022214B8
ov13_022214B8: ; 0x022214B8
	ldr r0, _022214C0 ; =_0224CF98
	ldr r0, [r0, #0x10]
	bx lr
	nop
_022214C0: .word _0224CF98
	thumb_func_end ov13_022214B8

	thumb_func_start ov13_022214C4
ov13_022214C4: ; 0x022214C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	ldr r0, _0222169C ; =ov13_0224D8C0
	ldr r2, _022216A0 ; =0x00000117
	str r0, [sp, #4]
	ldr r0, _022216A4 ; =ov13_0224D930
	add r4, r7, r2
	ldr r6, _022216A8 ; =ov13_0224D660
	ldr r5, _022216AC ; =ov13_0224D790
	str r0, [sp]
	bne _022214E4
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022214E4:
	ldr r1, _022216B0 ; =_0224CF98
	add r2, #0x3d
	ldr r0, [r1, #0x2c]
	ldr r1, [r1, #0x30]
	and r0, r1
	strh r0, [r7]
	add r0, r4, #0
	mov r1, #0
	bl ov13_02222978
	ldrh r1, [r7]
	mov r0, #1
	tst r0, r1
	beq _02221562
	add r1, r6, #0
	ldr r2, [r6, #4]
	add r0, r4, #0
	add r1, #0x30
	bl ov13_02222968
	add r1, r6, #0
	ldr r2, [r6, #4]
	add r0, r4, #6
	add r1, #0x70
	bl ov13_02222968
	add r0, r4, #0
	add r1, r6, #0
	ldr r2, [r6, #4]
	add r0, #0xc
	add r1, #0xb0
	bl ov13_02222968
	add r0, r4, #0
	add r1, r6, #0
	ldr r2, [r6, #4]
	add r0, #0x12
	add r1, #0xf0
	bl ov13_02222968
	add r0, r6, #0
	add r0, #8
	bl ov13_02222A9C
	add r1, r0, #0
	add r0, r6, #0
	add r0, #8
	bl ov13_022216BC
	cmp r0, #0
	beq _0222154C
	b _02221688
_0222154C:
	add r0, r6, #0
	add r0, #8
	bl ov13_02222A9C
	add r2, r0, #0
	add r0, r4, #0
	add r6, #8
	add r0, #0x18
	add r1, r6, #0
	bl ov13_02222968
_02221562:
	ldrh r1, [r7]
	mov r0, #2
	tst r0, r1
	beq _022215CE
	add r0, r4, #0
	add r1, r5, #0
	ldr r2, [r5, #4]
	add r0, #0x39
	add r1, #0x30
	bl ov13_02222968
	add r0, r4, #0
	add r1, r5, #0
	ldr r2, [r5, #4]
	add r0, #0x47
	add r1, #0x70
	bl ov13_02222968
	add r0, r4, #0
	add r1, r5, #0
	ldr r2, [r5, #4]
	add r0, #0x55
	add r1, #0xb0
	bl ov13_02222968
	add r0, r4, #0
	add r1, r5, #0
	ldr r2, [r5, #4]
	add r0, #0x63
	add r1, #0xf0
	bl ov13_02222968
	add r0, r5, #0
	add r0, #8
	bl ov13_02222A9C
	add r1, r0, #0
	add r0, r5, #0
	add r0, #8
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	add r0, r5, #0
	add r0, #8
	bl ov13_02222A9C
	add r2, r0, #0
	add r0, r4, #0
	add r5, #8
	add r0, #0x71
	add r1, r5, #0
	bl ov13_02222968
_022215CE:
	ldrh r1, [r7]
	mov r0, #4
	tst r0, r1
	beq _02221626
	ldr r1, [sp, #4]
	ldr r0, [sp, #4]
	ldr r1, [r1, #4]
	add r0, #0x30
	sub r1, r1, #1
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r2, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r4, #0
	ldr r2, [r2, #4]
	add r0, #0x92
	add r1, #0x30
	bl ov13_02222968
	ldr r0, [sp, #4]
	add r0, #8
	bl ov13_02222A9C
	add r1, r0, #0
	ldr r0, [sp, #4]
	add r0, #8
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r0, [sp, #4]
	add r0, #8
	bl ov13_02222A9C
	ldr r1, [sp, #4]
	add r2, r0, #0
	add r0, r4, #0
	add r1, #8
	add r0, #0xd2
	str r1, [sp, #4]
	bl ov13_02222968
_02221626:
	ldrh r1, [r7]
	mov r0, #8
	tst r0, r1
	beq _0222167E
	ldr r1, [sp]
	ldr r0, [sp]
	ldr r1, [r1, #4]
	add r0, #0x30
	sub r1, r1, #1
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r2, [sp]
	ldr r1, [sp]
	add r0, r4, #0
	ldr r2, [r2, #4]
	add r0, #0xf3
	add r1, #0x30
	bl ov13_02222968
	ldr r0, [sp]
	add r0, #8
	bl ov13_02222A9C
	add r1, r0, #0
	ldr r0, [sp]
	add r0, #8
	bl ov13_022216BC
	cmp r0, #0
	bne _02221688
	ldr r0, [sp]
	add r0, #8
	bl ov13_02222A9C
	add r2, r0, #0
	ldr r0, _022216B4 ; =0x00000133
	ldr r1, [sp]
	add r0, r4, r0
	add r1, #8
	str r1, [sp]
	bl ov13_02222968
_0222167E:
	ldr r1, _022216B8 ; =0x00000116
	mov r0, #0
	add sp, #8
	strb r0, [r7, r1]
	pop {r3, r4, r5, r6, r7, pc}
_02221688:
	mov r2, #0x55
	add r0, r4, #0
	mov r1, #0
	lsl r2, r2, #2
	bl ov13_02222978
	mov r0, #0
	mvn r0, r0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222169C: .word ov13_0224D8C0
_022216A0: .word 0x00000117
_022216A4: .word ov13_0224D930
_022216A8: .word ov13_0224D660
_022216AC: .word ov13_0224D790
_022216B0: .word _0224CF98
_022216B4: .word 0x00000133
_022216B8: .word 0x00000116
	thumb_func_end ov13_022214C4

	thumb_func_start ov13_022216BC
ov13_022216BC: ; 0x022216BC
	mov r3, #0
	cmp r1, #0
	ble _022216DA
_022216C2:
	ldrb r2, [r0]
	add r0, r0, #1
	cmp r2, #0x20
	blo _022216CE
	cmp r2, #0x7f
	bls _022216D4
_022216CE:
	mov r0, #0
	mvn r0, r0
	bx lr
_022216D4:
	add r3, r3, #1
	cmp r3, r1
	blt _022216C2
_022216DA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov13_022216BC

	thumb_func_start ov13_022216E0
ov13_022216E0: ; 0x022216E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	mov r4, #0
	str r4, [sp, #4]
	str r0, [sp]
	cmp r0, #0
	bne _022216F8
	add sp, #8
	mov r0, #5
	pop {r3, r4, r5, r6, r7, pc}
_022216F8:
	cmp r0, #0x40
	bls _02221700
	mov r0, #0x40
	str r0, [sp]
_02221700:
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	ble _02221742
	add r6, r5, #0
	add r6, #8
_0222170C:
	ldr r1, [r5, #0x54]
	mov r0, #1
	tst r0, r1
	beq _02221736
	ldr r0, _02221758 ; =ov13_02245A14
	bl ov13_02222A9C
	ldr r1, [r5, #4]
	cmp r1, r0
	bne _02221736
	ldr r0, _02221758 ; =ov13_02245A14
	bl ov13_02222A9C
	add r2, r0, #0
	ldr r1, _02221758 ; =ov13_02245A14
	add r0, r6, #0
	bl ov13_02222948
	cmp r0, #0
	bne _02221736
	add r4, r4, #1
_02221736:
	ldr r0, [sp]
	add r7, r7, #1
	add r5, #0x54
	add r6, #0x54
	cmp r7, r0
	blt _0222170C
_02221742:
	cmp r4, #1
	ble _0222174A
	mov r0, #4
	str r0, [sp, #4]
_0222174A:
	cmp r4, #0
	bne _02221752
	mov r0, #5
	str r0, [sp, #4]
_02221752:
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221758: .word ov13_02245A14
	thumb_func_end ov13_022216E0

	thumb_func_start ov13_0222175C
ov13_0222175C: ; 0x0222175C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02221798 ; =ov13_02245A14
	bl ov13_02222A9C
	str r0, [r4]
	ldr r1, _02221798 ; =ov13_02245A14
	ldr r2, [r4]
	add r0, r4, #4
	bl ov13_02222968
	mov r0, #1
	str r0, [r4, #0x24]
	ldr r0, _0222179C ; =ov13_02245A20
	bl ov13_02222A9C
	add r2, r0, #0
	str r0, [r4, #0x28]
	cmp r2, #0xd
	bls _0222178A
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_0222178A:
	add r4, #0x2c
	ldr r1, _0222179C ; =ov13_02245A20
	add r0, r4, #0
	bl ov13_02222968
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02221798: .word ov13_02245A14
_0222179C: .word ov13_02245A20
	thumb_func_end ov13_0222175C

	thumb_func_start ov13_022217A0
ov13_022217A0: ; 0x022217A0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	mov r4, #0
	cmp r6, #0
	ble _022217CE
_022217AE:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #6
	bl ov13_02222968
	bl ov13_02222AB0
	strh r0, [r5, #6]
	ldrh r0, [r5, #6]
	bl ov13_02222A44
	strh r0, [r5, #6]
	add r4, r4, #1
	add r5, #8
	cmp r4, r6
	blt _022217AE
_022217CE:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_022217A0

	thumb_func_start ov13_022217D0
ov13_022217D0: ; 0x022217D0
	push {r3, lr}
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _022217E2
	ldr r1, _022217F8 ; =ov13_022459B4
	str r0, [r1, #4]
	mov r0, #0
	pop {r3, pc}
_022217E2:
	ldr r1, _022217F8 ; =ov13_022459B4
	ldr r2, [r1, #4]
	cmp r2, r0
	beq _022217F2
	str r0, [r1, #4]
	bl ov13_02223100
	pop {r3, pc}
_022217F2:
	mov r0, #0
	pop {r3, pc}
	nop
_022217F8: .word ov13_022459B4
	thumb_func_end ov13_022217D0

	thumb_func_start ov13_022217FC
ov13_022217FC: ; 0x022217FC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	ldrh r0, [r6, #0xc]
	add r7, r6, #0
	add r4, r2, #0
	str r3, [sp]
	add r7, #0xc
	bl ov13_02222A84
	cmp r0, #1
	bhs _0222181E
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222181E:
	ldrb r0, [r7, #0xf]
	cmp r0, #0x11
	beq _0222182E
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222182E:
	add r0, r6, #0
	add r0, #0xc
	bl ov13_02221AF4
	cmp r0, #0
	ble _02221844
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221844:
	ldrh r0, [r7, #6]
	bl ov13_02222A84
	ldr r1, _02221890 ; =0x00001010
	cmp r0, r1
	beq _0222185E
	ldr r1, _02221894 ; =0x00002010
	cmp r0, r1
	beq _0222186E
	ldr r1, _02221898 ; =0x00003010
	cmp r0, r1
	beq _0222187E
	b _0222188C
_0222185E:
	ldr r3, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov13_0222189C
	add r5, r0, #0
	b _0222188C
_0222186E:
	ldr r3, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov13_02221978
	add r5, r0, #0
	b _0222188C
_0222187E:
	ldr r3, [sp]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov13_02221A50
	add r5, r0, #0
_0222188C:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221890: .word 0x00001010
_02221894: .word 0x00002010
_02221898: .word 0x00003010
	thumb_func_end ov13_022217FC

	thumb_func_start ov13_0222189C
ov13_0222189C: ; 0x0222189C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r2, #0
	cmp r6, #0
	beq _022218AE
	ldr r1, [r5]
	add r1, r1, #1
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_022218AE:
	add r7, r1, #0
	add r7, #0xc
	add r4, r1, #0
	add r1, r7, #0
	add r0, r3, #0
	add r1, #0x10
	add r4, #0x24
	bl ov13_02221C2C
	cmp r0, #0
	bge _022218CE
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022218CE:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	cmp r0, #0
	bne _022218E2
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022218E2:
	ldrb r0, [r4]
	cmp r0, #7
	bne _02221920
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _022218FE
	mov r0, #0x14
	bl ov13_022214AC
	b _0222191A
_022218FE:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	mov r1, #2
	mvn r1, r1
	cmp r0, r1
	bne _02221914
	mov r0, #0x15
	bl ov13_022214AC
	b _0222191A
_02221914:
	mov r0, #0x18
	bl ov13_022214AC
_0222191A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221920:
	cmp r0, #1
	beq _0222192E
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222192E:
	ldr r1, _02221970 ; =ov13_0224CFD8
	add r0, r4, #4
	bl ov13_02221C78
	cmp r0, #0
	bge _02221958
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _0222194E
	mov r0, #0x16
	bl ov13_022214AC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222194E:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221958:
	ldrh r0, [r7, #0xc]
	bl ov13_02222A84
	bl ov13_022220A4
	ldr r1, _02221974 ; =_0224CF98
	str r0, [r1]
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02221970: .word ov13_0224CFD8
_02221974: .word _0224CF98
	thumb_func_end ov13_0222189C

	thumb_func_start ov13_02221978
ov13_02221978: ; 0x02221978
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r2, #0
	cmp r6, #1
	beq _0222198A
	ldr r1, [r5]
	add r1, r1, #1
	str r1, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222198A:
	add r7, r1, #0
	add r7, #0xc
	add r4, r1, #0
	add r3, #8
	add r1, r7, #0
	add r0, r3, #0
	add r1, #0x10
	add r4, #0x24
	bl ov13_02221C2C
	cmp r0, #0
	bge _022219AC
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022219AC:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	cmp r0, #0
	bne _022219C0
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_022219C0:
	ldrb r0, [r4]
	cmp r0, #7
	bne _022219FE
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _022219DC
	mov r0, #0x14
	bl ov13_022214AC
	b _022219F8
_022219DC:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	mov r1, #2
	mvn r1, r1
	cmp r0, r1
	bne _022219F2
	mov r0, #0x15
	bl ov13_022214AC
	b _022219F8
_022219F2:
	mov r0, #0x18
	bl ov13_022214AC
_022219F8:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022219FE:
	mov r2, #0x6a
	ldr r0, _02221A44 ; =ov13_0224D658
	mov r1, #0
	lsl r2, r2, #4
	bl ov13_02222978
	ldrh r0, [r7, #0xa]
	bl ov13_02222A84
	add r2, r0, #0
	ldr r0, _02221A48 ; =ov13_0224CFD8
	ldr r3, _02221A44 ; =ov13_0224D658
	str r0, [sp]
	mov r0, #0
	add r1, r4, #0
	bl ov13_02221F94
	cmp r0, #0
	bge _02221A2E
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221A2E:
	ldr r0, _02221A4C ; =_0224CF98
	ldr r1, [r0, #0x30]
	ldr r0, [r0, #0x2c]
	tst r0, r1
	bne _02221A3C
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02221A3C:
	mov r0, #0
	str r0, [r5]
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221A44: .word ov13_0224D658
_02221A48: .word ov13_0224CFD8
_02221A4C: .word _0224CF98
	thumb_func_end ov13_02221978

	thumb_func_start ov13_02221A50
ov13_02221A50: ; 0x02221A50
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r2, #0
	cmp r6, #2
	beq _02221A62
	ldr r1, [r5]
	add r1, r1, #1
	str r1, [r5]
	pop {r4, r5, r6, pc}
_02221A62:
	add r4, r1, #0
	add r3, #0x10
	add r1, #0xc
	add r0, r3, #0
	add r1, #0x10
	add r4, #0x24
	bl ov13_02221C2C
	cmp r0, #0
	bge _02221A80
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_02221A80:
	ldrb r0, [r4]
	cmp r0, #7
	beq _02221A90
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_02221A90:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	cmp r0, #0
	bne _02221AA4
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add r0, r6, #0
	pop {r4, r5, r6, pc}
_02221AA4:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	cmp r0, #0
	bne _02221AB2
	mov r0, #0x64
	pop {r4, r5, r6, pc}
_02221AB2:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	mov r1, #1
	mvn r1, r1
	cmp r0, r1
	bne _02221ACC
	mov r0, #0x14
	bl ov13_022214AC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02221ACC:
	ldr r0, [r4, #4]
	bl ov13_02222A5C
	mov r1, #2
	mvn r1, r1
	cmp r0, r1
	bne _02221AE6
	mov r0, #0x15
	bl ov13_022214AC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02221AE6:
	mov r0, #0x18
	bl ov13_022214AC
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov13_02221A50

	thumb_func_start ov13_02221AF4
ov13_02221AF4: ; 0x02221AF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r1, r5, #0
	add r4, r5, #0
	add r0, sp, #0xc
	add r1, #0x10
	mov r2, #8
	add r4, #0x18
	bl ov13_02222968
	ldr r0, _02221BE0 ; =ov13_02245A20
	bl ov13_02222A9C
	add r3, r0, #0
	ldr r2, _02221BE0 ; =ov13_02245A20
	add r0, sp, #0xc
	mov r1, #8
	bl ov13_022227A0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02221B32
	mov r0, #2
	bl ov13_022214AC
	mov r0, #0x63
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02221B32:
	ldrh r0, [r5, #6]
	bl ov13_02222A84
	add r1, sp, #0xc
	bl ov13_02221BE8
	cmp r0, #0
	bne _02221BDA
	ldrh r0, [r5, #6]
	bl ov13_02222A84
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r0, r1
	bne _02221B5A
	ldr r0, _02221BE4 ; =ov13_0224DCF8
	add r1, sp, #0xc
	mov r2, #8
	bl ov13_02222968
_02221B5A:
	ldrh r0, [r5, #0xc]
	bl ov13_02222A84
	mov r1, #0xf
	tst r0, r1
	bne _02221B6C
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02221B6C:
	ldrh r0, [r4]
	bl ov13_02222A84
	add r6, r0, #0
	bl ov13_022208E8
	add r7, r0, #0
	bne _02221B88
	mov r0, #2
	bl ov13_022214AC
	add sp, #0x14
	mov r0, #0x64
	pop {r4, r5, r6, r7, pc}
_02221B88:
	add r0, r4, #2
	str r0, [sp]
	ldr r0, _02221BE4 ; =ov13_0224DCF8
	add r1, r7, #0
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	ldrb r3, [r5, #0xe]
	add r0, r4, #4
	add r2, r6, #0
	bl ov13_022225B0
	cmp r0, #0
	bge _02221BBE
	add r0, r7, #0
	bl ov13_022208F8
	bl ov13_022214B8
	cmp r0, #2
	bne _02221BB8
	add sp, #0x14
	mov r0, #0x64
	pop {r4, r5, r6, r7, pc}
_02221BB8:
	add sp, #0x14
	mov r0, #0xc8
	pop {r4, r5, r6, r7, pc}
_02221BBE:
	add r0, r4, #0
	add r1, r7, #0
	add r2, r6, #0
	bl ov13_02222968
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #0xa]
	add r0, r7, #0
	bl ov13_022208F8
	mov r0, #0
_02221BDA:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02221BE0: .word ov13_02245A20
_02221BE4: .word ov13_0224DCF8
	thumb_func_end ov13_02221AF4

	thumb_func_start ov13_02221BE8
ov13_02221BE8: ; 0x02221BE8
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r6, _02221C28 ; =ov13_0224DCF8
	add r5, r4, #0
	add r3, r4, #0
_02221BF2:
	ldrb r2, [r6]
	cmp r2, #0
	beq _02221BFC
	mov r5, #1
	b _02221C04
_02221BFC:
	add r3, r3, #1
	add r6, r6, #1
	cmp r3, #6
	blt _02221BF2
_02221C04:
	cmp r5, #0
	beq _02221C18
	ldr r0, _02221C28 ; =ov13_0224DCF8
	mov r2, #6
	bl ov13_02222948
	cmp r0, #0
	beq _02221C22
	mov r4, #1
	b _02221C22
_02221C18:
	mov r1, #1
	lsl r1, r1, #0xc
	cmp r0, r1
	beq _02221C22
	mov r4, #2
_02221C22:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02221C28: .word ov13_0224DCF8
	thumb_func_end ov13_02221BE8

	thumb_func_start ov13_02221C2C
ov13_02221C2C: ; 0x02221C2C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _02221C74 ; =ov13_02245A20
	add r5, r1, #0
	mov r4, #0
	bl ov13_02222A9C
	add r3, r0, #0
	ldr r2, _02221C74 ; =ov13_02245A20
	add r0, r5, #0
	mov r1, #8
	bl ov13_022227A0
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #6
	bl ov13_02222948
	cmp r0, #0
	beq _02221C58
	sub r4, r4, #1
	b _02221C6E
_02221C58:
	ldrh r0, [r6, #6]
	bl ov13_02222A84
	add r6, r0, #0
	ldrh r0, [r5, #6]
	bl ov13_02222A84
	add r1, r6, #1
	cmp r1, r0
	beq _02221C6E
	sub r4, r4, #2
_02221C6E:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02221C74: .word ov13_02245A20
	thumb_func_end ov13_02221C2C

	thumb_func_start ov13_02221C78
ov13_02221C78: ; 0x02221C78
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r2, #0x41
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #2
	bl ov13_02222978
	add r7, r5, #0
	add r4, r6, #0
	add r7, #0x80
_02221C90:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	add r2, r0, #0
	cmp r2, #0
	bgt _02221CA2
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221CA2:
	ldrb r0, [r4]
	cmp r0, #6
	bhi _02221D18
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02221CB4: ; jump table
	.short _02221CC2 - _02221CB4 - 2 ; case 0
	.short _02221CCC - _02221CB4 - 2 ; case 1
	.short _02221CD6 - _02221CB4 - 2 ; case 2
	.short _02221CE4 - _02221CB4 - 2 ; case 3
	.short _02221CE4 - _02221CB4 - 2 ; case 4
	.short _02221CF4 - _02221CB4 - 2 ; case 5
	.short _02221D06 - _02221CB4 - 2 ; case 6
_02221CC2:
	add r0, r5, #0
	add r1, r4, #6
	bl ov13_02222968
	b _02221D1E
_02221CCC:
	add r0, r7, #0
	add r1, r4, #6
	bl ov13_02222968
	b _02221D1E
_02221CD6:
	mov r0, #1
	lsl r0, r0, #8
	add r0, r5, r0
	add r1, r4, #6
	bl ov13_02222968
	b _02221D1E
_02221CE4:
	ldrb r0, [r4, #6]
	bl ov13_02222A84
	cmp r0, #0
	bgt _02221D1E
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221CF4:
	add r0, r4, #6
	add r1, r2, #0
	bl ov13_02221D34
	bl ov13_02222A5C
	ldr r1, _02221D30 ; =_0224CF98
	str r0, [r1, #0x34]
	b _02221D1E
_02221D06:
	add r0, r4, #6
	add r1, r2, #0
	bl ov13_02221D34
	bl ov13_02222A5C
	ldr r1, _02221D30 ; =_0224CF98
	str r0, [r1, #0x38]
	b _02221D1E
_02221D18:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221D1E:
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02221D2C
	bl ov13_02222A84
	add r4, r6, r0
	b _02221C90
_02221D2C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221D30: .word _0224CF98
	thumb_func_end ov13_02221C78

	thumb_func_start ov13_02221D34
ov13_02221D34: ; 0x02221D34
	push {r4, r5}
	mov r3, #0
	sub r2, r1, #1
	add r5, r0, r2
	add r4, r3, #0
	cmp r1, #0
	ble _02221D50
_02221D42:
	ldrb r0, [r5]
	lsl r2, r3, #8
	add r4, r4, #1
	sub r5, r5, #1
	add r3, r2, r0
	cmp r4, r1
	blt _02221D42
_02221D50:
	add r0, r3, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02221D34

	thumb_func_start ov13_02221D58
ov13_02221D58: ; 0x02221D58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r1, #0
	add r5, r0, #6
	add r0, r6, #0
	str r0, [sp, #0xc]
	add r0, #8
	str r0, [sp, #0xc]
	add r0, r6, #0
	str r0, [sp, #8]
	add r0, #0xf0
	str r0, [sp, #8]
	add r0, r6, #0
	str r0, [sp, #4]
	add r0, #0xb0
	str r0, [sp, #4]
	add r0, r6, #0
	str r0, [sp]
	add r0, #0x70
	add r7, r6, #0
	str r0, [sp]
	add r7, #0x30
	str r5, [sp, #0x10]
_02221D86:
	ldrh r0, [r5, #2]
	bl ov13_02222A84
	add r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #0x21
	bgt _02221DBE
	bge _02221DDC
	cmp r0, #0x15
	bgt _02221DB8
	add r1, r0, #0
	sub r1, #0x10
	bmi _02221DF4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02221DAC: ; jump table
	.short _02221DD0 - _02221DAC - 2 ; case 0
	.short _02221DD0 - _02221DAC - 2 ; case 1
	.short _02221DD0 - _02221DAC - 2 ; case 2
	.short _02221DD0 - _02221DAC - 2 ; case 3
	.short _02221DF4 - _02221DAC - 2 ; case 4
	.short _02221DE8 - _02221DAC - 2 ; case 5
_02221DB8:
	cmp r0, #0x20
	beq _02221DDC
	b _02221DF4
_02221DBE:
	cmp r0, #0x23
	bgt _02221DCA
	bge _02221DDC
	cmp r0, #0x22
	beq _02221DDC
	b _02221DF4
_02221DCA:
	cmp r0, #0x25
	beq _02221DE8
	b _02221DF4
_02221DD0:
	cmp r4, #5
	bls _02221DF4
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02221DDC:
	cmp r4, #0xd
	bls _02221DF4
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02221DE8:
	cmp r4, #0x21
	bls _02221DF4
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02221DF4:
	cmp r0, #0x21
	bgt _02221E22
	bge _02221E42
	cmp r0, #0x15
	bgt _02221E1C
	add r1, r0, #0
	sub r1, #0x10
	bmi _02221E8C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02221E10: ; jump table
	.short _02221E34 - _02221E10 - 2 ; case 0
	.short _02221E42 - _02221E10 - 2 ; case 1
	.short _02221E50 - _02221E10 - 2 ; case 2
	.short _02221E5E - _02221E10 - 2 ; case 3
	.short _02221E8C - _02221E10 - 2 ; case 4
	.short _02221E6C - _02221E10 - 2 ; case 5
_02221E1C:
	cmp r0, #0x20
	beq _02221E34
	b _02221E8C
_02221E22:
	cmp r0, #0x23
	bgt _02221E2E
	bge _02221E5E
	cmp r0, #0x22
	beq _02221E50
	b _02221E8C
_02221E2E:
	cmp r0, #0x25
	beq _02221E6C
	b _02221E8C
_02221E34:
	add r0, r7, #0
	add r1, r5, #6
	add r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E42:
	ldr r0, [sp]
	add r1, r5, #6
	add r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E50:
	ldr r0, [sp, #4]
	add r1, r5, #6
	add r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E5E:
	ldr r0, [sp, #8]
	add r1, r5, #6
	add r2, r4, #0
	bl ov13_02222968
	str r4, [r6, #4]
	b _02221E94
_02221E6C:
	cmp r4, #0
	beq _02221E80
	add r0, r5, r4
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _02221E80
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02221E80:
	ldr r0, [sp, #0xc]
	add r1, r5, #6
	add r2, r4, #0
	bl ov13_02222968
	b _02221E94
_02221E8C:
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02221E94:
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _02221EA4
	bl ov13_02222A84
	ldr r1, [sp, #0x10]
	add r5, r1, r0
	b _02221D86
_02221EA4:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02221D58

	thumb_func_start ov13_02221EAC
ov13_02221EAC: ; 0x02221EAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r1, #0
	add r4, r0, #6
	add r0, r6, #0
	str r0, [sp]
	add r0, #8
	add r7, r6, #0
	str r0, [sp]
	add r7, #0x30
	str r4, [sp, #4]
_02221EC2:
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0x35
	bgt _02221ED8
	bge _02221EF2
	cmp r0, #0x30
	beq _02221EE6
	b _02221EFE
_02221ED8:
	cmp r0, #0x40
	bgt _02221EE0
	beq _02221EE6
	b _02221EFE
_02221EE0:
	cmp r0, #0x45
	beq _02221EF2
	b _02221EFE
_02221EE6:
	cmp r5, #0x40
	bls _02221EFE
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221EF2:
	cmp r5, #0x21
	bls _02221EFE
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221EFE:
	cmp r0, #0x35
	bgt _02221F0A
	bge _02221F26
	cmp r0, #0x30
	beq _02221F18
	b _02221F46
_02221F0A:
	cmp r0, #0x40
	bgt _02221F12
	beq _02221F18
	b _02221F46
_02221F12:
	cmp r0, #0x45
	beq _02221F26
	b _02221F46
_02221F18:
	add r0, r7, #0
	add r1, r4, #6
	add r2, r5, #0
	bl ov13_02222968
	str r5, [r6, #4]
	b _02221F4E
_02221F26:
	cmp r5, #0
	beq _02221F3A
	add r0, r4, r5
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _02221F3A
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221F3A:
	ldr r0, [sp]
	add r1, r4, #6
	add r2, r5, #0
	bl ov13_02222968
	b _02221F4E
_02221F46:
	mov r0, #0
	add sp, #8
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02221F4E:
	ldrh r0, [r4, #4]
	cmp r0, #0
	beq _02221F5E
	bl ov13_02222A84
	ldr r1, [sp, #4]
	add r4, r1, r0
	b _02221EC2
_02221F5E:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_02221EAC

	thumb_func_start ov13_02221F64
ov13_02221F64: ; 0x02221F64
	push {r3, r4, r5, lr}
	add r4, r0, #6
	ldrh r0, [r4, #2]
	add r5, r1, #0
	bl ov13_02222A84
	add r2, r0, #0
	cmp r2, #0
	bgt _02221F7C
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02221F7C:
	ldrb r0, [r4]
	cmp r0, #0x70
	beq _02221F88
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02221F88:
	add r0, r5, #0
	add r1, r4, #6
	bl ov13_02222968
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov13_02221F64

	thumb_func_start ov13_02221F94
ov13_02221F94: ; 0x02221F94
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r2, #0
	str r0, [sp]
	add r4, r1, #0
	mov r5, #0
	str r3, [sp, #4]
	cmp r6, #0
	bgt _02221FAC
	add sp, #0x14
	sub r0, r5, #2
	pop {r4, r5, r6, r7, pc}
_02221FAC:
	ldr r7, _0222209C ; =_022459B0
_02221FAE:
	ldr r2, [sp]
	ldrb r0, [r4]
	ldrb r2, [r7, r2]
	add r1, r4, #0
	cmp r0, r2
	beq _02221FD2
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	add r0, r0, #4
	sub r6, r6, r0
	add r4, r4, r0
	cmp r6, #0
	bgt _02221FAE
	mov r0, #3
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02221FD2:
	ldrh r0, [r1, #2]
	add r4, r4, #4
	bl ov13_02222A84
	add r7, r0, #0
	mov r1, #0x35
	ldr r0, [sp]
	lsl r1, r1, #4
	mul r1, r0
	ldr r0, [sp, #4]
	add r6, r0, r1
	ldr r0, [sp, #0x28]
	str r0, [sp, #8]
	ldr r0, [sp]
	add r0, r0, #3
	lsl r0, r0, #7
	str r0, [sp, #0xc]
	add r0, r6, #0
	str r0, [sp, #0x10]
	add r0, #8
	str r0, [sp, #0x10]
_02221FFC:
	ldrb r0, [r4]
	cmp r0, #0xa
	bhi _02222076
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222200E: ; jump table
	.short _02222076 - _0222200E - 2 ; case 0
	.short _02222076 - _0222200E - 2 ; case 1
	.short _02222076 - _0222200E - 2 ; case 2
	.short _02222024 - _0222200E - 2 ; case 3
	.short _02222032 - _0222200E - 2 ; case 4
	.short _02222044 - _0222200E - 2 ; case 5
	.short _02222056 - _0222200E - 2 ; case 6
	.short _02222076 - _0222200E - 2 ; case 7
	.short _02222076 - _0222200E - 2 ; case 8
	.short _02222076 - _0222200E - 2 ; case 9
	.short _02222068 - _0222200E - 2 ; case 10
_02222024:
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	bl ov13_02221D58
	mov r1, #1
	orr r5, r1
	b _0222207A
_02222032:
	mov r1, #0x4e
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r6, r1
	bl ov13_02221D58
	mov r1, #2
	orr r5, r1
	b _0222207A
_02222044:
	mov r1, #0x9a
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r6, r1
	bl ov13_02221EAC
	mov r1, #4
	orr r5, r1
	b _0222207A
_02222056:
	mov r1, #0xb6
	lsl r1, r1, #2
	add r0, r4, #0
	add r1, r6, r1
	bl ov13_02221EAC
	mov r1, #8
	orr r5, r1
	b _0222207A
_02222068:
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	add r1, r2, r1
	bl ov13_02221F64
	b _0222207A
_02222076:
	mov r0, #2
	mvn r0, r0
_0222207A:
	cmp r0, #0
	bne _02222098
	ldrh r0, [r4, #2]
	bl ov13_02222A84
	add r0, r0, #4
	sub r7, r7, r0
	add r4, r4, r0
	cmp r7, #0
	bgt _02221FFC
	ldr r0, _022220A0 ; =_0224CF98
	ldr r1, [r0, #0x30]
	orr r1, r5
	str r1, [r0, #0x30]
	mov r0, #0
_02222098:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222209C: .word _022459B0
_022220A0: .word _0224CF98
	thumb_func_end ov13_02221F94

	thumb_func_start ov13_022220A4
ov13_022220A4: ; 0x022220A4
	mov r1, #0x10
	mov r2, #0
	tst r0, r1
	beq _022220AE
	mov r2, #1
_022220AE:
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov13_022220A4

	thumb_func_start ov13_022220B4
ov13_022220B4: ; 0x022220B4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #0
	beq _022220CA
	cmp r0, #1
	beq _022220DC
	cmp r0, #2
	beq _022220EE
	b _02222100
_022220CA:
	mov r0, #2
	bl ov13_022217D0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov13_02222108
	pop {r4, r5, r6, pc}
_022220DC:
	mov r0, #3
	bl ov13_022217D0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov13_0222224C
	pop {r4, r5, r6, pc}
_022220EE:
	mov r0, #5
	bl ov13_022217D0
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov13_02222328
	pop {r4, r5, r6, pc}
_02222100:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov13_022220B4

	thumb_func_start ov13_02222108
ov13_02222108: ; 0x02222108
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r1, #0
	mov r1, #0
	add r0, sp, #0x10
	strb r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	ldr r0, _0222223C ; =_0224CF98
	str r2, [sp, #0xc]
	ldr r5, [r0, #0x14]
	ldr r2, _02222240 ; =0x000005DC
	add r0, r5, #0
	bl ov13_02222978
	mov r0, #0x21
	lsl r0, r0, #4
	bl ov13_022208E8
	add r4, r0, #0
	bne _02222140
	mov r0, #2
	bl ov13_022214AC
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222140:
	mov r2, #0x21
	mov r1, #0
	lsl r2, r2, #4
	bl ov13_02222978
	add r6, r5, #0
	ldr r0, _02222244 ; =ov13_0224DCF8
	add r1, r7, #0
	mov r2, #8
	add r6, #0x18
	bl ov13_02222968
	add r0, sp, #0x14
	ldr r1, _02222244 ; =ov13_0224DCF8
	add r0, #2
	mov r2, #8
	bl ov13_02222968
	add r0, r4, #4
	bl ov13_02222394
	add r1, sp, #0x10
	strh r0, [r1, #4]
	mov r0, #4
	ldrsh r0, [r1, r0]
	cmp r0, #0
	bge _0222218E
	mov r0, #3
	bl ov13_022214AC
	cmp r4, #0
	beq _02222186
	add r0, r4, #0
	bl ov13_022208F8
_02222186:
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_0222218E:
	mov r0, #0
	strb r0, [r4]
	ldrh r0, [r1, #4]
	bl ov13_02222A44
	strh r0, [r4, #2]
	add r1, sp, #0x10
	mov r0, #4
	ldrsh r0, [r1, r0]
	add r2, r4, #0
	add r3, sp, #0x14
	add r0, r0, #4
	strh r0, [r1, #4]
	add r0, sp, #0x10
	add r0, #2
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	mov r0, #0
	add r1, r6, #0
	bl ov13_02222420
	add r1, sp, #0x10
	mov r0, #2
	ldrsh r2, [r1, r0]
	mov r0, #0x10
	mov r3, #6
	orr r0, r2
	strh r0, [r1, #2]
	add r0, sp, #0x14
	ldr r2, _02222248 ; =ov13_02245A20
	add r0, #2
	mov r1, #8
	bl ov13_022227A0
	cmp r0, #0
	beq _022221F0
	mov r0, #2
	bl ov13_022214AC
	cmp r4, #0
	beq _022221E8
	add r0, r4, #0
	bl ov13_022208F8
_022221E8:
	mov r0, #0
	add sp, #0x20
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022221F0:
	add r3, sp, #0x10
	mov r0, #0
	ldrsb r0, [r3, r0]
	mov r1, #1
	mov r2, #4
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	add r0, sp, #0x14
	add r0, #2
	str r0, [sp, #8]
	mov r6, #2
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r6]
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl ov13_02222474
	add r2, sp, #0x10
	mov r1, #4
	ldrsh r0, [r2, r1]
	ldr r3, [sp, #0xc]
	add r0, #0x18
	strh r0, [r2, #4]
	ldrsh r1, [r2, r1]
	add r0, r5, #0
	mov r2, #0xff
	bl ov13_022224CC
	cmp r4, #0
	beq _02222234
	add r0, r4, #0
	bl ov13_022208F8
_02222234:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222223C: .word _0224CF98
_02222240: .word 0x000005DC
_02222244: .word ov13_0224DCF8
_02222248: .word ov13_02245A20
	thumb_func_end ov13_02222108

	thumb_func_start ov13_0222224C
ov13_0222224C: ; 0x0222224C
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r1, #0
	mov r1, #0
	add r0, sp, #0xc
	strb r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #2]
	ldr r0, _0222231C ; =_0224CF98
	add r6, r2, #0
	ldr r4, [r0, #0x14]
	add r0, sp, #0x14
	mov r2, #8
	bl ov13_02222978
	ldr r2, _02222320 ; =0x000005DC
	add r0, r4, #0
	mov r1, #0
	bl ov13_02222978
	mov r1, #2
	add r0, sp, #0xc
	strb r1, [r0, #8]
	mov r1, #0
	strb r1, [r0, #9]
	mov r0, #4
	bl ov13_02222A44
	add r1, sp, #0xc
	strh r0, [r1, #0xa]
	ldr r0, _0222231C ; =_0224CF98
	ldr r0, [r0, #0x2c]
	str r0, [sp, #0x18]
	bl ov13_02222A1C
	str r0, [sp, #0x18]
	mov r1, #8
	add r0, sp, #0xc
	strh r1, [r0, #4]
	add r0, sp, #0xc
	add r0, #2
	str r0, [sp]
	add r0, sp, #0xc
	str r0, [sp, #4]
	ldr r0, _0222231C ; =_0224CF98
	add r1, r4, #0
	ldr r0, [r0]
	add r1, #0x18
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl ov13_02222420
	add r5, #8
	add r0, sp, #0x1c
	add r1, r5, #0
	mov r2, #8
	bl ov13_02222968
	ldr r2, _02222324 ; =ov13_02245A20
	add r0, sp, #0x1c
	mov r1, #8
	mov r3, #6
	bl ov13_022227A0
	cmp r0, #0
	beq _022222DE
	mov r0, #2
	bl ov13_022214AC
	mov r0, #0
	add sp, #0x24
	mvn r0, r0
	pop {r3, r4, r5, r6, pc}
_022222DE:
	add r3, sp, #0xc
	mov r0, #0
	ldrsb r0, [r3, r0]
	mov r1, #2
	mov r2, #4
	str r0, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	mov r5, #2
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r5]
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl ov13_02222474
	add r2, sp, #0xc
	mov r1, #4
	ldrsh r0, [r2, r1]
	add r3, r6, #0
	add r0, #0x18
	strh r0, [r2, #4]
	ldrsh r1, [r2, r1]
	add r0, r4, #0
	mov r2, #0
	bl ov13_022224CC
	mov r0, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222231C: .word _0224CF98
_02222320: .word 0x000005DC
_02222324: .word ov13_02245A20
	thumb_func_end ov13_0222224C

	thumb_func_start ov13_02222328
ov13_02222328: ; 0x02222328
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	ldr r0, _02222388 ; =_0224CF98
	add r6, r2, #0
	ldr r4, [r0, #0x14]
	ldr r2, _0222238C ; =0x000005DC
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #0
	bl ov13_02222978
	add r5, #0x10
	add r0, sp, #0xc
	add r1, r5, #0
	mov r2, #8
	bl ov13_02222968
	ldr r0, _02222390 ; =ov13_02245A20
	bl ov13_02222A9C
	add r3, r0, #0
	ldr r2, _02222390 ; =ov13_02245A20
	add r0, sp, #0xc
	mov r1, #8
	bl ov13_022227A0
	mov r2, #0
	mov r1, #3
	str r2, [sp]
	mov r0, #0x11
	str r0, [sp, #4]
	add r0, sp, #0xc
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r1, r1, #0xc
	add r3, r2, #0
	bl ov13_02222474
	add r0, r4, #0
	mov r1, #0x18
	mov r2, #0
	add r3, r6, #0
	bl ov13_022224CC
	mov r0, #0
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02222388: .word _0224CF98
_0222238C: .word 0x000005DC
_02222390: .word ov13_02245A20
	thumb_func_end ov13_02222328

	thumb_func_start ov13_02222394
ov13_02222394: ; 0x02222394
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _02222418 ; =ov13_0224CFB8
	add r5, r0, #0
	mov r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, _0222241C ; =_0224CF98
	mov r6, #0
	strb r0, [r5]
	mov r0, #1
	strb r0, [r5, #1]
	ldr r0, [r1, #0x28]
	ldr r1, [r1, #0x24]
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r0, r5, #6
	add r2, r4, #0
	bl ov13_02222968
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #2]
	add r0, r4, #6
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r1, r0, #1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	lsl r0, r0, #0x11
	asr r7, r0, #0x10
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #4]
	add r0, r6, r7
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	mov r0, #0x60
	strb r0, [r5, r7]
	add r4, r5, r7
	mov r0, #0
	strb r0, [r4, #1]
	bl ov13_02222A44
	strh r0, [r4, #4]
	mov r0, #0xe
	bl ov13_02222A1C
	str r0, [sp]
	add r0, r4, #6
	add r1, sp, #0
	mov r2, #4
	bl ov13_02222968
	mov r0, #4
	bl ov13_02222A44
	add r6, #0xa
	strh r0, [r4, #2]
	lsl r0, r6, #0x10
	asr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222418: .word ov13_0224CFB8
_0222241C: .word _0224CF98
	thumb_func_end ov13_02222394

	thumb_func_start ov13_02222420
ov13_02222420: ; 0x02222420
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r3, #0
	cmp r0, #1
	bne _02222460
	ldr r0, [sp, #0x18]
	mov r1, #1
	strh r1, [r0]
	add r0, r5, #2
	str r0, [sp]
	ldr r0, _02222470 ; =ov13_0224DCF8
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	add r0, r2, #0
	mov r2, #0
	ldrsh r2, [r4, r2]
	add r1, r5, #4
	bl ov13_02222534
	ldrh r0, [r4]
	bl ov13_02222A44
	strh r0, [r5]
	mov r0, #0
	ldrsh r0, [r4, r0]
	add sp, #0xc
	add r0, r0, #4
	strh r0, [r4]
	pop {r4, r5, pc}
_02222460:
	add r1, r2, #0
	mov r2, #0
	ldrsh r2, [r4, r2]
	add r0, r5, #0
	bl ov13_02222968
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02222470: .word ov13_0224DCF8
	thumb_func_end ov13_02222420

	thumb_func_start ov13_02222474
ov13_02222474: ; 0x02222474
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov13_02222A44
	strh r0, [r5]
	mov r0, #0
	strh r0, [r5, #2]
	strh r0, [r5, #4]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #6]
	mov r0, #0
	strh r0, [r5, #8]
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #0xa]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	bl ov13_02222A44
	strh r0, [r5, #0xc]
	add r1, sp, #8
	mov r0, #0x10
	ldrsb r0, [r1, r0]
	mov r2, #8
	strb r0, [r5, #0xe]
	mov r0, #0x14
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x20]
	strb r0, [r5, #0xf]
	add r5, #0x10
	add r0, r5, #0
	bl ov13_02222968
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02222474

	thumb_func_start ov13_022224CC
ov13_022224CC: ; 0x022224CC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	add r0, sp, #8
	mov r1, #0
	mov r2, #8
	add r7, r3, #0
	bl ov13_02222978
	mov r1, #2
	add r0, sp, #8
	strb r1, [r0, #1]
	ldr r0, _02222528 ; =0x00005790
	bl ov13_02222A44
	add r1, sp, #8
	strh r0, [r1, #2]
	ldr r0, _0222252C ; =_0224CF98
	ldr r0, [r0, #0x34]
	bl ov13_02222A1C
	str r0, [sp, #0xc]
	cmp r4, #0xff
	beq _0222250A
	ldr r1, _02222530 ; =ov13_0224CFB8
	mov r0, #0x1c
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _02222510
_0222250A:
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0xc]
_02222510:
	add r0, sp, #8
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl ov13_022229EC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02222528: .word 0x00005790
_0222252C: .word _0224CF98
_02222530: .word ov13_0224CFB8
	thumb_func_end ov13_022224CC

	thumb_func_start ov13_02222534
ov13_02222534: ; 0x02222534
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r2, #0
	add r7, r1, #0
	add r4, r3, #0
	add r1, r5, #0
	add r6, r0, #0
	bl ov13_02222708
	strb r0, [r4]
	add r0, r5, #0
	bl ov13_022208E8
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _0222255C
	mov r0, #0
	add sp, #0x14
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_0222255C:
	bl ov13_02222AB0
	add r1, sp, #0
	strh r0, [r1]
	ldr r0, [sp, #0x28]
	add r1, sp, #0
	mov r2, #2
	bl ov13_02222968
	ldr r0, _022225A8 ; =ov13_0224DD00
	ldr r1, [sp, #0x28]
	mov r2, #2
	bl ov13_02222968
	ldr r0, _022225AC ; =ov13_0224DD02
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	bl ov13_02222968
	ldr r2, [sp, #0x30]
	ldr r1, _022225A8 ; =ov13_0224DD00
	add r0, sp, #4
	add r2, r2, #2
	add r3, r5, #0
	bl ov13_02222638
	add r0, sp, #4
	add r1, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl ov13_0222269C
	ldr r0, [sp, #0xc]
	bl ov13_022208F8
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022225A8: .word ov13_0224DD00
_022225AC: .word ov13_0224DD02
	thumb_func_end ov13_02222534

	thumb_func_start ov13_022225B0
ov13_022225B0: ; 0x022225B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r2, #0
	add r7, r0, #0
	add r0, r4, #0
	add r5, r1, #0
	add r6, r3, #0
	bl ov13_022208E8
	str r0, [sp, #8]
	cmp r0, #0
	bne _022225D6
	mov r0, #2
	bl ov13_022214AC
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022225D6:
	ldr r0, _02222630 ; =ov13_0224DD00
	ldr r1, [sp, #0x28]
	mov r2, #2
	bl ov13_02222968
	ldr r0, _02222634 ; =ov13_0224DD02
	ldr r1, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	bl ov13_02222968
	ldr r2, [sp, #0x30]
	ldr r1, _02222630 ; =ov13_0224DD00
	add r0, sp, #0
	add r2, r2, #2
	add r3, r4, #0
	bl ov13_02222638
	add r0, sp, #0
	add r1, r5, #0
	add r2, r7, #0
	add r3, r4, #0
	bl ov13_0222269C
	add r0, r5, #0
	add r1, r4, #0
	bl ov13_02222708
	cmp r0, r6
	beq _02222624
	mov r0, #0x12
	bl ov13_022214AC
	ldr r0, [sp, #8]
	bl ov13_022208F8
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222624:
	ldr r0, [sp, #8]
	bl ov13_022208F8
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02222630: .word ov13_0224DD00
_02222634: .word ov13_0224DD02
	thumb_func_end ov13_022225B0

	thumb_func_start ov13_02222638
ov13_02222638: ; 0x02222638
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	ldr r4, [r0, #8]
	ldr r1, [sp]
	mov r0, #0
	str r0, [r1, #4]
	str r2, [sp, #8]
	str r0, [r1]
	add r2, r3, #0
	str r2, [r1, #0xc]
	str r3, [sp, #0xc]
	add r1, r3, #0
	beq _02222660
_02222656:
	ldr r1, [sp, #0xc]
	strb r0, [r4, r0]
	add r0, r0, #1
	cmp r0, r1
	blo _02222656
_02222660:
	ldr r0, [sp, #0xc]
	mov r1, #0
	add r6, r1, #0
	add r5, r1, #0
	cmp r0, #0
	bls _02222696
_0222266C:
	ldr r0, [sp, #4]
	ldrb r7, [r4, r5]
	ldrb r0, [r0, r6]
	add r0, r1, r0
	ldr r1, [sp]
	add r0, r7, r0
	ldr r1, [r1, #0xc]
	bl _u32_div_f
	ldrb r0, [r4, r1]
	add r6, r6, #1
	strb r7, [r4, r1]
	strb r0, [r4, r5]
	ldr r0, [sp, #8]
	cmp r6, r0
	blo _0222268E
	mov r6, #0
_0222268E:
	ldr r0, [sp, #0xc]
	add r5, r5, #1
	cmp r5, r0
	blo _0222266C
_02222696:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02222638

	thumb_func_start ov13_0222269C
ov13_0222269C: ; 0x0222269C
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	ldr r4, _022226C4 ; =0x00000000
	beq _022226C0
_022226AA:
	ldr r0, [sp]
	bl ov13_022226C8
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldrb r0, [r6, r4]
	eor r0, r1
	strb r0, [r5, r4]
	add r4, r4, #1
	cmp r4, r7
	blo _022226AA
_022226C0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022226C4: .word 0x00000000
	thumb_func_end ov13_0222269C

	thumb_func_start ov13_022226C8
ov13_022226C8: ; 0x022226C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	ldr r4, [r5, #8]
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, [sp]
	add r0, r0, #1
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	ldrb r6, [r4, r7]
	ldr r0, [r5, #4]
	ldr r1, [sp]
	add r0, r6, r0
	bl _u32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	ldrb r0, [r4, r1]
	str r7, [r5]
	str r1, [r5, #4]
	strb r6, [r4, r1]
	strb r0, [r4, r7]
	ldr r1, [r5, #0xc]
	add r0, r6, r0
	bl _u32_div_f
	ldrb r0, [r4, r1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_022226C8

	thumb_func_start ov13_02222708
ov13_02222708: ; 0x02222708
	push {r3, lr}
	add r3, r0, #0
	ldr r0, _0222272C ; =ov13_0224D258
	add r2, r1, #0
	str r0, [sp]
	mov r0, #0
	add r1, r3, #0
	mvn r0, r0
	mov r3, #0
	bl ov13_02222730
	mov r1, #0
	mvn r1, r1
	eor r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	nop
_0222272C: .word ov13_0224D258
	thumb_func_end ov13_02222708

	thumb_func_start ov13_02222730
ov13_02222730: ; 0x02222730
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	ldr r6, [sp, #0x18]
	cmp r3, #0
	bne _02222746
	add r0, r3, #0
	add r1, r6, #0
	bl ov13_02222768
_02222746:
	mov r1, #0
	cmp r4, #0
	ble _02222762
_0222274C:
	ldrb r2, [r7, r1]
	lsr r0, r5, #8
	add r1, r1, #1
	eor r2, r5
	lsl r2, r2, #0x18
	lsr r2, r2, #0x16
	ldr r2, [r6, r2]
	add r5, r0, #0
	eor r5, r2
	cmp r1, r4
	blt _0222274C
_02222762:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02222730

	thumb_func_start ov13_02222768
ov13_02222768: ; 0x02222768
	push {r4, r5, r6, r7}
	mov r5, #1
	add r3, r5, #0
	ldr r4, _0222279C ; =0xEDB88320
	mov r0, #0
	add r3, #0xff
_02222774:
	add r7, r0, #0
	mov r2, #0
_02222778:
	add r6, r7, #0
	tst r6, r5
	beq _02222786
	lsr r6, r7, #1
	add r7, r6, #0
	eor r7, r4
	b _02222788
_02222786:
	lsr r7, r7, #1
_02222788:
	add r2, r2, #1
	cmp r2, #8
	blt _02222778
	add r0, r0, #1
	stmia r1!, {r7}
	cmp r0, r3
	blt _02222774
	pop {r4, r5, r6, r7}
	bx lr
	nop
_0222279C: .word 0xEDB88320
	thumb_func_end ov13_02222768

	thumb_func_start ov13_022227A0
ov13_022227A0: ; 0x022227A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r7, r0, #0
	lsr r0, r5, #0x1f
	add r0, r5, r0
	asr r0, r0, #1
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl ov13_022208E8
	add r6, r0, #0
	bne _022227C2
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022227C2:
	add r0, r5, #0
	bl ov13_022208E8
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _022227DC
	add r0, r6, #0
	bl ov13_022208F8
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_022227DC:
	mov r4, #0
_022227DE:
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ov13_0222281C
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov13_02222850
	ldr r2, [sp, #0xc]
	add r0, r7, #0
	add r1, r5, #0
	bl ov13_02222874
	add r4, r4, #1
	cmp r4, #2
	blt _022227DE
	add r0, r6, #0
	bl ov13_022208F8
	ldr r0, [sp, #0xc]
	bl ov13_022208F8
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_022227A0

	thumb_func_start ov13_0222281C
ov13_0222281C: ; 0x0222281C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	lsr r1, r2, #0x1f
	add r1, r2, r1
	ldr r6, [sp, #0x18]
	asr r4, r1, #1
	add r1, r6, #0
	add r7, r3, #0
	bl _s32_div_f
	mov r0, #0
	cmp r4, #0
	ble _0222284E
_02222836:
	strb r0, [r5, r0]
	ldrsb r2, [r7, r1]
	ldrsb r3, [r5, r0]
	add r1, r1, #1
	eor r2, r3
	strb r2, [r5, r0]
	cmp r1, r6
	blt _02222848
	mov r1, #0
_02222848:
	add r0, r0, #1
	cmp r0, r4
	blt _02222836
_0222284E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_0222281C

	thumb_func_start ov13_02222850
ov13_02222850: ; 0x02222850
	push {r4, r5}
	lsr r3, r2, #0x1f
	add r3, r2, r3
	asr r4, r3, #1
	mov r3, #0
	cmp r4, #0
	ble _02222870
	add r5, r1, r4
_02222860:
	ldrsb r1, [r0, r3]
	ldrb r2, [r5]
	add r3, r3, #1
	eor r1, r2
	strb r1, [r5]
	add r5, r5, #1
	cmp r3, r4
	blt _02222860
_02222870:
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02222850

	thumb_func_start ov13_02222874
ov13_02222874: ; 0x02222874
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r7, r0, #1
	add r4, r2, #0
	add r0, r4, #0
	add r1, r5, r7
	add r2, r7, #0
	bl ov13_02222968
	add r0, r4, r7
	add r1, r5, #0
	add r2, r7, #0
	bl ov13_02222968
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov13_02222968
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02222874

	thumb_func_start ov13_022228A4
ov13_022228A4: ; 0x022228A4
	push {r3, lr}
	cmp r1, #0
	ble _022228B4
	add r0, r1, #0
	ldr r1, _022228B8 ; =ov13_0224DD80
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
_022228B4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_022228B8: .word ov13_0224DD80
	thumb_func_end ov13_022228A4

	thumb_func_start ov13_022228BC
ov13_022228BC: ; 0x022228BC
	push {r3, lr}
	add r0, r1, #0
	ldr r1, _022228C8 ; =ov13_0224DD8C
	ldr r1, [r1]
	blx r1
	pop {r3, pc}
	.balign 4, 0
_022228C8: .word ov13_0224DD8C
	thumb_func_end ov13_022228BC

	thumb_func_start ov13_022228CC
ov13_022228CC: ; 0x022228CC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl ov13_02222A1C
	ldr r1, _02222918 ; =ov13_022459B4
	str r0, [r1, #0x18]
	add r0, r5, #0
	bl ov13_02222A1C
	ldr r1, _02222918 ; =ov13_022459B4
	str r0, [r1, #0x1c]
	add r0, r4, #0
	bl ov13_02222A1C
	ldr r1, _02222918 ; =ov13_022459B4
	str r0, [r1, #0x20]
	ldr r0, _0222291C ; =ov13_022459BC
	bl SOC_Startup
	cmp r0, #0
	bge _022228FE
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_022228FE:
	ldr r5, _02222920 ; =_021D4670
	ldr r0, [r5]
	cmp r0, #0
	bne _02222914
	mov r4, #0x64
_02222908:
	add r0, r4, #0
	bl OS_Sleep
	ldr r0, [r5]
	cmp r0, #0
	beq _02222908
_02222914:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02222918: .word ov13_022459B4
_0222291C: .word ov13_022459BC
_02222920: .word _021D4670
	thumb_func_end ov13_022228CC

	thumb_func_start ov13_02222924
ov13_02222924: ; 0x02222924
	push {r3, lr}
	bl SOC_Cleanup
	cmp r0, #0
	bge _02222934
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
_02222934:
	bl ov13_02222D78
	cmp r0, #0
	beq _02222940
	mov r0, #1
	b _02222942
_02222940:
	mov r0, #0
_02222942:
	neg r0, r0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov13_02222924

	thumb_func_start ov13_02222948
ov13_02222948: ; 0x02222948
	push {r3, r4}
	mov r3, #0
	b _02222952
_0222294E:
	add r0, r0, #1
	add r1, r1, #1
_02222952:
	add r4, r2, #0
	sub r2, r2, #1
	cmp r4, #0
	ble _02222962
	ldrb r4, [r0]
	ldrb r3, [r1]
	sub r3, r4, r3
	beq _0222294E
_02222962:
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov13_02222948

	thumb_func_start ov13_02222968
ov13_02222968: ; 0x02222968
	add r3, r0, #0
	add r0, r1, #0
	add r1, r3, #0
	ldr r3, _02222974 ; =MI_CpuCopy8
	bx r3
	nop
_02222974: .word MI_CpuCopy8
	thumb_func_end ov13_02222968

	thumb_func_start ov13_02222978
ov13_02222978: ; 0x02222978
	ldr r3, _02222980 ; =MI_CpuFill8
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bx r3
	.balign 4, 0
_02222980: .word MI_CpuFill8
	thumb_func_end ov13_02222978

	thumb_func_start ov13_02222984
ov13_02222984: ; 0x02222984
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x14]
	ldr r5, [r4]
	ldr r4, [sp, #0x10]
	strb r5, [r4]
	str r4, [sp]
	bl SOC_RecvFrom
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov13_02222984

	thumb_func_start ov13_02222998
ov13_02222998: ; 0x02222998
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r2, [r1]
	ldr r0, [r1, #4]
	ldr r5, [sp, #0x18]
	str r2, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	mov r4, #0
	ldr r2, _022229E8 ; =0x01FF6210
	asr r1, r0, #0x1f
	add r3, r4, #0
	bl _ll_mul
	lsr r3, r0, #6
	lsl r2, r1, #0x1a
	orr r3, r2
	lsr r0, r1, #6
	add r6, r4, r3
	adc r4, r0
	ldr r0, [r5, #4]
	ldr r2, _022229E8 ; =0x01FF6210
	asr r1, r0, #0x1f
	mov r3, #0
	bl _ll_mul
	lsr r3, r0, #6
	lsl r2, r1, #0x1a
	orr r3, r2
	lsr r0, r1, #6
	add r2, r6, r3
	adc r4, r0
	add r0, sp, #0
	mov r1, #1
	add r3, r4, #0
	bl SOC_Poll
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_022229E8: .word 0x01FF6210
	thumb_func_end ov13_02222998

	thumb_func_start ov13_022229EC
ov13_022229EC: ; 0x022229EC
	push {r3, r4, r5, lr}
	ldr r5, [sp, #0x14]
	ldr r4, [sp, #0x10]
	strb r5, [r4]
	str r4, [sp]
	bl SOC_SendTo
	pop {r3, r4, r5, pc}
	thumb_func_end ov13_022229EC

	thumb_func_start ov13_022229FC
ov13_022229FC: ; 0x022229FC
	bx lr
	.balign 4, 0
	thumb_func_end ov13_022229FC

	thumb_func_start ov13_02222A00
ov13_02222A00: ; 0x02222A00
	ldr r3, _02222A04 ; =SOC_Socket
	bx r3
	.balign 4, 0
_02222A04: .word SOC_Socket
	thumb_func_end ov13_02222A00

	thumb_func_start ov13_02222A08
ov13_02222A08: ; 0x02222A08
	ldr r3, _02222A10 ; =SOC_Bind
	strb r2, [r1]
	bx r3
	nop
_02222A10: .word SOC_Bind
	thumb_func_end ov13_02222A08

	thumb_func_start ov13_02222A14
ov13_02222A14: ; 0x02222A14
	ldr r3, _02222A18 ; =SOC_Close
	bx r3
	.balign 4, 0
_02222A18: .word SOC_Close
	thumb_func_end ov13_02222A14

	thumb_func_start ov13_02222A1C
ov13_02222A1C: ; 0x02222A1C
	push {r4, r5}
	mov r3, #0xff
	lsl r1, r0, #0x18
	lsl r3, r3, #0x18
	add r2, r1, #0
	lsl r4, r0, #8
	lsr r1, r3, #8
	and r1, r4
	lsr r4, r0, #0x18
	lsl r4, r4, #0x18
	lsr r5, r4, #0x18
	lsr r4, r0, #8
	lsr r0, r3, #0x10
	and r0, r4
	orr r0, r5
	and r2, r3
	orr r0, r1
	orr r0, r2
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02222A1C

	thumb_func_start ov13_02222A44
ov13_02222A44: ; 0x02222A44
	asr r1, r0, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02222A44

	thumb_func_start ov13_02222A5C
ov13_02222A5C: ; 0x02222A5C
	push {r4, r5}
	mov r3, #0xff
	lsl r1, r0, #0x18
	lsl r3, r3, #0x18
	add r2, r1, #0
	lsl r4, r0, #8
	lsr r1, r3, #8
	and r1, r4
	lsr r4, r0, #0x18
	lsl r4, r4, #0x18
	lsr r5, r4, #0x18
	lsr r4, r0, #8
	lsr r0, r3, #0x10
	and r0, r4
	orr r0, r5
	and r2, r3
	orr r0, r1
	orr r0, r2
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02222A5C

	thumb_func_start ov13_02222A84
ov13_02222A84: ; 0x02222A84
	asr r1, r0, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02222A84

	thumb_func_start ov13_02222A9C
ov13_02222A9C: ; 0x02222A9C
	mov r2, #0
	ldrsb r1, [r0, r2]
	cmp r1, #0
	beq _02222AAC
_02222AA4:
	add r2, r2, #1
	ldrsb r1, [r0, r2]
	cmp r1, #0
	bne _02222AA4
_02222AAC:
	add r0, r2, #0
	bx lr
	thumb_func_end ov13_02222A9C

	thumb_func_start ov13_02222AB0
ov13_02222AB0: ; 0x02222AB0
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r0, _02222B10 ; =_0224CF98
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _02222AF2
	mov r4, #0
	add r0, sp, #0
	add r1, r4, #0
	mov r2, #0xc
	bl ov13_02222978
	add r0, sp, #0
	bl RTC_GetTime
	cmp r0, #0
	bne _02222AE2
	ldr r0, [sp]
	lsl r0, r0, #0xa
	add r1, r4, r0
	ldr r0, [sp, #4]
	lsl r0, r0, #3
	add r1, r1, r0
	ldr r0, [sp, #8]
	add r4, r1, r0
_02222AE2:
	ldr r0, _02222B10 ; =_0224CF98
	ldr r1, _02222B14 ; =0x5D588B65
	str r4, [r0, #0x18]
	str r1, [r0, #0x1c]
	ldr r1, _02222B18 ; =0x00269EC3
	str r1, [r0, #0x20]
	mov r1, #1
	str r1, [r0, #8]
_02222AF2:
	ldr r0, _02222B10 ; =_0224CF98
	ldr r2, [r0, #0x1c]
	ldr r1, [r0, #0x18]
	ldr r3, [r0, #0x20]
	mul r1, r2
	add r1, r3, r1
	str r1, [r0, #0x18]
	ldr r0, _02222B1C ; =0x00007FFF
	lsr r1, r1, #0x10
	mul r0, r1
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02222B10: .word _0224CF98
_02222B14: .word 0x5D588B65
_02222B18: .word 0x00269EC3
_02222B1C: .word 0x00007FFF
	thumb_func_end ov13_02222AB0

	thumb_func_start ov13_02222B20
ov13_02222B20: ; 0x02222B20
	mov r1, #0
	str r1, [r0]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02222B20

	thumb_func_start ov13_02222B2C
ov13_02222B2C: ; 0x02222B2C
	str r0, [r1]
	mov r0, #1
	strh r0, [r1, #4]
	bx lr
	thumb_func_end ov13_02222B2C

	thumb_func_start ov13_02222B34
ov13_02222B34: ; 0x02222B34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0xa]
	add r4, r1, #0
	add r1, r4, #4
	str r0, [r4]
	add r0, r5, #0
	add r0, #0xc
	mov r2, #0x20
	bl MIi_CpuCopy16
	ldrh r0, [r5, #0x36]
	add r1, r4, #0
	add r1, #0x30
	str r0, [r4, #0x24]
	add r0, r5, #4
	mov r2, #6
	bl MIi_CpuCopy16
	mov r1, #0
	ldr r2, _02222BBC ; =ov13_02245A28
	add r0, r1, #0
	mov r6, #0x80
_02222B62:
	ldrh r7, [r5, #0x30]
	ldrh r3, [r2]
	tst r3, r7
	beq _02222B8C
	ldrb r7, [r2, #2]
	add r3, r4, r1
	add r3, #0x3c
	strb r7, [r3]
	ldrh r7, [r5, #0x2e]
	ldrh r3, [r2]
	tst r3, r7
	beq _02222B8A
	add r3, r4, r1
	add r3, #0x3c
	ldrb r3, [r3]
	add r7, r3, #0
	add r3, r4, r1
	orr r7, r6
	add r3, #0x3c
	strb r7, [r3]
_02222B8A:
	add r1, r1, #1
_02222B8C:
	add r0, r0, #1
	add r2, r2, #4
	cmp r0, #0xc
	blt _02222B62
	str r1, [r4, #0x38]
	ldrh r0, [r5, #0x32]
	str r0, [r4, #0x4c]
	ldrh r1, [r5, #0x2c]
	mov r0, #3
	and r0, r1
	cmp r0, #1
	bne _02222BAA
	mov r0, #1
	str r0, [r4, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
_02222BAA:
	cmp r0, #2
	bne _02222BB4
	mov r0, #2
	str r0, [r4, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
_02222BB4:
	mov r0, #0
	str r0, [r4, #0x50]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222BBC: .word ov13_02245A28
	thumb_func_end ov13_02222B34

	thumb_func_start ov13_02222BC0
ov13_02222BC0: ; 0x02222BC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	add r1, #0xc
	mov r2, #0x20
	bl MIi_CpuClear16
	ldr r0, [r5]
	add r1, r4, #0
	strh r0, [r4, #0xa]
	ldrh r2, [r4, #0xa]
	add r0, r5, #4
	add r1, #0xc
	bl MI_CpuCopy8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov13_02222BC0

	thumb_func_start ov13_02222BE4
ov13_02222BE4: ; 0x02222BE4
	add r3, r0, #0
	add r0, r1, #0
	str r2, [r3]
	add r1, r3, #4
	ldr r3, _02222BF0 ; =ov13_02222B34
	bx r3
	.balign 4, 0
_02222BF0: .word ov13_02222B34
	thumb_func_end ov13_02222BE4

	thumb_func_start ov13_02222BF4
ov13_02222BF4: ; 0x02222BF4
	ldr r3, _02222C00 ; =OS_SendMessage
	add r1, r0, #0
	ldr r0, _02222C04 ; =ov13_0224DDA0
	mov r2, #0
	bx r3
	nop
_02222C00: .word OS_SendMessage
_02222C04: .word ov13_0224DDA0
	thumb_func_end ov13_02222BF4

	thumb_func_start ov13_02222C08
ov13_02222C08: ; 0x02222C08
	ldr r3, _02222C14 ; =OS_SendMessage
	add r1, r0, #0
	ldr r0, _02222C18 ; =ov13_0224DDA0
	mov r2, #0
	bx r3
	nop
_02222C14: .word OS_SendMessage
_02222C18: .word ov13_0224DDA0
	thumb_func_end ov13_02222C08

	thumb_func_start ov13_02222C1C
ov13_02222C1C: ; 0x02222C1C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, _02222CCC ; =ov13_0224DDA0
	ldr r1, _02222CD0 ; =ov13_0224DD90
	mov r2, #4
	mov r4, #1
	bl OS_InitMessageQueue
	cmp r5, #0
	beq _02222C36
	cmp r6, #0
	bne _02222C3C
_02222C36:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222C3C:
	bl OS_DisableInterrupts
	ldr r1, _02222CD4 ; =ov13_0224DD80
	str r5, [r1]
	str r6, [r1, #0xc]
	bl OS_RestoreInterrupts
	ldr r1, _02222CD4 ; =ov13_0224DD80
	ldr r0, _02222CD8 ; =0x00005890
	ldr r1, [r1]
	blx r1
	add r1, r0, #0
	ldr r0, _02222CD4 ; =ov13_0224DD80
	str r1, [r0, #8]
	bne _02222C5E
	sub r0, r4, #2
	pop {r3, r4, r5, r6, r7, pc}
_02222C5E:
	ldr r0, _02222CDC ; =ov13_02222BF4
	ldr r2, _02222CD8 ; =0x00005890
	bl ov13_022236B8
	cmp r0, #0
	bne _02222C6C
	mov r4, #0
_02222C6C:
	cmp r4, #0
	beq _02222CBC
	ldr r5, _02222CCC ; =ov13_0224DDA0
	add r6, sp, #0
	mov r7, #1
_02222C76:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl OS_ReceiveMessage
	ldr r0, [sp]
	cmp r0, #0xf
	bhi _02222CB6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02222C92: ; jump table
	.short _02222CB6 - _02222C92 - 2 ; case 0
	.short _02222CB6 - _02222C92 - 2 ; case 1
	.short _02222CB6 - _02222C92 - 2 ; case 2
	.short _02222CB6 - _02222C92 - 2 ; case 3
	.short _02222CB8 - _02222C92 - 2 ; case 4
	.short _02222CB8 - _02222C92 - 2 ; case 5
	.short _02222CB2 - _02222C92 - 2 ; case 6
	.short _02222CB6 - _02222C92 - 2 ; case 7
	.short _02222CB6 - _02222C92 - 2 ; case 8
	.short _02222CB6 - _02222C92 - 2 ; case 9
	.short _02222CB6 - _02222C92 - 2 ; case 10
	.short _02222CB6 - _02222C92 - 2 ; case 11
	.short _02222CB6 - _02222C92 - 2 ; case 12
	.short _02222CB6 - _02222C92 - 2 ; case 13
	.short _02222CB6 - _02222C92 - 2 ; case 14
	.short _02222CB6 - _02222C92 - 2 ; case 15
_02222CB2:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02222CB6:
	mov r4, #0
_02222CB8:
	cmp r4, #0
	bne _02222C76
_02222CBC:
	ldr r1, _02222CD4 ; =ov13_0224DD80
	ldr r0, [r1, #8]
	ldr r1, [r1, #0xc]
	blx r1
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222CCC: .word ov13_0224DDA0
_02222CD0: .word ov13_0224DD90
_02222CD4: .word ov13_0224DD80
_02222CD8: .word 0x00005890
_02222CDC: .word ov13_02222BF4
	thumb_func_end ov13_02222C1C

	thumb_func_start ov13_02222CE0
ov13_02222CE0: ; 0x02222CE0
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02222D70 ; =ov13_0224DD80
	mov r4, #1
	ldr r0, [r0, #0xc]
	sub r5, r4, #2
	cmp r0, #0
	bne _02222CF2
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02222CF2:
	bl ov13_022235DC
	cmp r0, #0
	bne _02222CFE
	sub r0, r4, #2
	pop {r3, r4, r5, r6, r7, pc}
_02222CFE:
	ldr r7, _02222D74 ; =ov13_0224DDA0
	ldr r6, _02222D70 ; =ov13_0224DD80
_02222D02:
	add r0, r7, #0
	add r1, sp, #0
	mov r2, #1
	bl OS_ReceiveMessage
	ldr r0, [sp]
	cmp r0, #0x14
	bhi _02222D54
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02222D1E: ; jump table
	.short _02222D54 - _02222D1E - 2 ; case 0
	.short _02222D54 - _02222D1E - 2 ; case 1
	.short _02222D54 - _02222D1E - 2 ; case 2
	.short _02222D54 - _02222D1E - 2 ; case 3
	.short _02222D56 - _02222D1E - 2 ; case 4
	.short _02222D56 - _02222D1E - 2 ; case 5
	.short _02222D54 - _02222D1E - 2 ; case 6
	.short _02222D54 - _02222D1E - 2 ; case 7
	.short _02222D54 - _02222D1E - 2 ; case 8
	.short _02222D54 - _02222D1E - 2 ; case 9
	.short _02222D54 - _02222D1E - 2 ; case 10
	.short _02222D54 - _02222D1E - 2 ; case 11
	.short _02222D54 - _02222D1E - 2 ; case 12
	.short _02222D54 - _02222D1E - 2 ; case 13
	.short _02222D54 - _02222D1E - 2 ; case 14
	.short _02222D54 - _02222D1E - 2 ; case 15
	.short _02222D54 - _02222D1E - 2 ; case 16
	.short _02222D54 - _02222D1E - 2 ; case 17
	.short _02222D54 - _02222D1E - 2 ; case 18
	.short _02222D54 - _02222D1E - 2 ; case 19
	.short _02222D48 - _02222D1E - 2 ; case 20
_02222D48:
	ldr r0, [r6, #8]
	mov r4, #0
	ldr r1, [r6, #0xc]
	add r5, r4, #0
	blx r1
	b _02222D56
_02222D54:
	mov r4, #0
_02222D56:
	cmp r4, #0
	bne _02222D02
	bl OS_DisableInterrupts
	ldr r1, _02222D70 ; =ov13_0224DD80
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #0xc]
	bl OS_RestoreInterrupts
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222D70: .word ov13_0224DD80
_02222D74: .word ov13_0224DDA0
	thumb_func_end ov13_02222CE0

	thumb_func_start ov13_02222D78
ov13_02222D78: ; 0x02222D78
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	mvn r5, r5
	bl ov13_022235A4
	cmp r0, #0
	beq _02222DA8
	ldr r4, _02222DAC ; =ov13_0224DDA0
	add r6, sp, #0
	mov r7, #1
_02222D8C:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl OS_ReceiveMessage
	ldr r0, [sp]
	cmp r0, #0xe
	bne _02222DA2
	mov r0, #0
	add r5, r0, #0
	b _02222DA4
_02222DA2:
	mov r0, #0
_02222DA4:
	cmp r0, #0
	bne _02222D8C
_02222DA8:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02222DAC: .word ov13_0224DDA0
	thumb_func_end ov13_02222D78

	thumb_func_start ov13_02222DB0
ov13_02222DB0: ; 0x02222DB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	str r0, [sp, #4]
	mov r0, #0
	mvn r0, r0
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0xc]
	mov r6, #0
	ldr r0, _02222F14 ; =ov13_0224DD80
	add r7, r6, #0
	ldr r1, [r0]
	add r5, r6, #0
	cmp r1, #0
	beq _02222DD4
	ldr r0, [r0, #0xc]
	cmp r0, #0
	bne _02222DDC
_02222DD4:
	mov r0, #0
	add sp, #0x44
	mvn r0, r0
	pop {r4, r5, r6, r7, pc}
_02222DDC:
	mov r0, #3
	lsl r0, r0, #0xc
	blx r1
	add r4, r0, #0
	bne _02222DEC
	add sp, #0x44
	sub r0, r6, #1
	pop {r4, r5, r6, r7, pc}
_02222DEC:
	add r0, r6, #0
	ldr r3, _02222F18 ; =0x0030BFFE
	add r1, r0, #0
	add r2, r0, #0
	str r4, [sp, #8]
	bl ov13_02223478
	cmp r0, #0
	bne _02222E00
	b _02222F04
_02222E00:
	add r0, sp, #0x18
	bl OS_CreateAlarm
	mov r0, #0x13
	str r0, [sp]
	ldr r1, _02222F1C ; =0x003FEC42
	ldr r3, _02222F20 ; =ov13_02222C08
	add r0, sp, #0x18
	add r2, r6, #0
	bl OS_SetAlarm
_02222E16:
	ldr r0, _02222F24 ; =ov13_0224DDA0
	add r1, sp, #0x14
	mov r2, #1
	bl OS_ReceiveMessage
	ldr r0, [sp, #0x14]
	cmp r0, #0x13
	bhi _02222EEA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02222E32: ; jump table
	.short _02222EEA - _02222E32 - 2 ; case 0
	.short _02222EEA - _02222E32 - 2 ; case 1
	.short _02222EEA - _02222E32 - 2 ; case 2
	.short _02222EEA - _02222E32 - 2 ; case 3
	.short _02222EA0 - _02222E32 - 2 ; case 4
	.short _02222E78 - _02222E32 - 2 ; case 5
	.short _02222EEA - _02222E32 - 2 ; case 6
	.short _02222EEA - _02222E32 - 2 ; case 7
	.short _02222EA0 - _02222E32 - 2 ; case 8
	.short _02222EEA - _02222E32 - 2 ; case 9
	.short _02222E9A - _02222E32 - 2 ; case 10
	.short _02222EEA - _02222E32 - 2 ; case 11
	.short _02222EEA - _02222E32 - 2 ; case 12
	.short _02222EEA - _02222E32 - 2 ; case 13
	.short _02222EEA - _02222E32 - 2 ; case 14
	.short _02222EEA - _02222E32 - 2 ; case 15
	.short _02222EEA - _02222E32 - 2 ; case 16
	.short _02222EEA - _02222E32 - 2 ; case 17
	.short _02222EA0 - _02222E32 - 2 ; case 18
	.short _02222E5A - _02222E32 - 2 ; case 19
_02222E5A:
	cmp r6, #0
	bne _02222EA0
	cmp r5, #0
	beq _02222E6C
	add r0, r4, #0
	mov r1, #0x40
	bl ov13_02223434
	add r7, r0, #0
_02222E6C:
	bl ov13_02223568
	cmp r0, #0
	beq _02222EEA
	mov r6, #1
	b _02222EA0
_02222E78:
	cmp r6, #0
	bne _02222EA0
	cmp r5, #8
	bge _02222E84
	add r5, r5, #1
	b _02222EA0
_02222E84:
	add r0, r4, #0
	mov r1, #0x40
	bl ov13_02223434
	add r7, r0, #0
	bl ov13_02223568
	cmp r0, #0
	beq _02222EEA
	mov r6, #1
	b _02222EA0
_02222E9A:
	mov r0, #0
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
_02222EA0:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _02222E16
	cmp r7, #0
	beq _02222EBE
	sub r1, r7, #1
	mov r0, #0x54
	mul r0, r1
	ldr r1, _02222F14 ; =ov13_0224DD80
	add r0, #0x58
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	bne _02222ECA
	b _02222EEA
_02222EBE:
	ldr r1, _02222F14 ; =ov13_0224DD80
	mov r0, #0x58
	ldr r1, [r1]
	blx r1
	cmp r0, #0
	beq _02222EEA
_02222ECA:
	ldr r1, [sp, #4]
	mov r6, #0
	str r0, [r1]
	str r7, [r0]
	cmp r7, #0
	ble _02222EEA
	add r5, r0, #4
_02222ED8:
	add r0, r4, #0
	add r1, r5, #0
	bl ov13_02222B34
	add r6, r6, #1
	add r4, #0xc0
	add r5, #0x54
	cmp r6, r7
	blt _02222ED8
_02222EEA:
	add r0, sp, #0x18
	bl OS_CancelAlarm
	ldr r5, _02222F24 ; =ov13_0224DDA0
	add r4, sp, #0x14
	mov r6, #0
_02222EF6:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl OS_ReceiveMessage
	cmp r0, #1
	beq _02222EF6
_02222F04:
	ldr r1, _02222F14 ; =ov13_0224DD80
	ldr r0, [sp, #8]
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, [sp, #0x10]
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_02222F14: .word ov13_0224DD80
_02222F18: .word 0x0030BFFE
_02222F1C: .word 0x003FEC42
_02222F20: .word ov13_02222C08
_02222F24: .word ov13_0224DDA0
	thumb_func_end ov13_02222DB0

	thumb_func_start ov13_02222F28
ov13_02222F28: ; 0x02222F28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	mov r4, #1
	add r7, r0, #0
	sub r0, r4, #2
	str r0, [sp, #0xc]
	ldr r0, [r7, #0x24]
	mov r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	bne _02222F42
	lsl r5, r4, #0x13
	b _02222F4A
_02222F42:
	cmp r0, #1
	bne _02222F4A
	mov r5, #3
	lsl r5, r5, #0x12
_02222F4A:
	mov r0, #3
	lsl r0, r0, #0x10
	orr r5, r0
	ldr r0, _022230DC ; =ov13_0224DE80
	mov r1, #0
	mov r2, #0x60
	bl MI_CpuFill8
	ldr r0, [r7, #0x28]
	cmp r0, #5
	bne _02222F68
	ldr r0, _022230DC ; =ov13_0224DE80
	mov r1, #1
	strb r1, [r0]
	b _02222F88
_02222F68:
	cmp r0, #0xd
	bne _02222F74
	ldr r0, _022230DC ; =ov13_0224DE80
	mov r1, #2
	strb r1, [r0]
	b _02222F88
_02222F74:
	cmp r0, #0x10
	bne _02222F80
	ldr r0, _022230DC ; =ov13_0224DE80
	mov r1, #3
	strb r1, [r0]
	b _02222F88
_02222F80:
	mov r0, #0
	add sp, #0x40
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02222F88:
	mov r1, #0x14
	ldr r2, _022230DC ; =ov13_0224DE80
	mul r1, r6
	add r1, r1, #2
	add r0, r7, #0
	strb r6, [r2, #1]
	add r1, r2, r1
	ldr r2, [r7, #0x28]
	add r0, #0x2c
	bl MI_CpuCopy8
	bl WCM_ClearApList
	ldr r2, [r7]
	ldr r3, _022230E0 ; =0x0030BFFE
	mov r0, #0
	add r1, r7, #4
	bl ov13_02223478
	cmp r0, #0
	bne _02222FB4
	b _022230C2
_02222FB4:
	mov r0, #0
	str r0, [sp, #8]
	add r0, sp, #0x14
	bl OS_CreateAlarm
	mov r0, #0x12
	str r0, [sp]
	ldr r1, _022230E4 ; =0x003FEC42
	ldr r3, _022230E8 ; =ov13_02222C08
	add r0, sp, #0x14
	mov r2, #0
	bl OS_SetAlarm
	b _022230A4
_02222FD0:
	ldr r0, _022230EC ; =ov13_0224DDA0
	add r1, sp, #0x10
	mov r2, #1
	bl OS_ReceiveMessage
	ldr r0, [sp, #0x10]
	cmp r0, #0x13
	bhi _022230A2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02222FEC: ; jump table
	.short _022230A2 - _02222FEC - 2 ; case 0
	.short _022230A2 - _02222FEC - 2 ; case 1
	.short _022230A2 - _02222FEC - 2 ; case 2
	.short _022230A2 - _02222FEC - 2 ; case 3
	.short _022230A4 - _02222FEC - 2 ; case 4
	.short _0222301C - _02222FEC - 2 ; case 5
	.short _022230A2 - _02222FEC - 2 ; case 6
	.short _022230A2 - _02222FEC - 2 ; case 7
	.short _022230A4 - _02222FEC - 2 ; case 8
	.short _022230A2 - _02222FEC - 2 ; case 9
	.short _02223062 - _02222FEC - 2 ; case 10
	.short _022230A2 - _02222FEC - 2 ; case 11
	.short _0222307C - _02222FEC - 2 ; case 12
	.short _02223082 - _02222FEC - 2 ; case 13
	.short _022230A2 - _02222FEC - 2 ; case 14
	.short _022230A2 - _02222FEC - 2 ; case 15
	.short _022230A2 - _02222FEC - 2 ; case 16
	.short _022230A2 - _02222FEC - 2 ; case 17
	.short _02223014 - _02222FEC - 2 ; case 18
	.short _0222301A - _02222FEC - 2 ; case 19
_02223014:
	cmp r6, #0
	bne _022230A4
	mov r4, #0
_0222301A:
	b _022230A4
_0222301C:
	cmp r6, #0
	bne _022230A4
	add r0, sp, #0x14
	bl OS_CancelAlarm
	ldr r0, _022230F0 ; =ov13_0224DDC0
	mov r1, #1
	bl ov13_02223434
	cmp r0, #1
	beq _02223036
	mov r4, #0
	b _022230A4
_02223036:
	ldr r1, _022230F0 ; =ov13_0224DDC0
	add r0, r7, #0
	bl ov13_02222BC0
	ldr r1, _022230F4 ; =ov13_0224DDC0
	mov r0, #0
	ldrh r1, [r1, #0xa]
	b _02223048
_02223046:
	add r0, r0, #1
_02223048:
	cmp r0, r1
	blt _02223046
	ldr r0, _022230F0 ; =ov13_0224DDC0
	ldr r1, _022230DC ; =ov13_0224DE80
	add r2, r5, #0
	bl ov13_02223634
	cmp r0, #0
	bne _0222305E
	mov r4, #0
	b _022230A4
_0222305E:
	mov r6, #1
	b _022230A4
_02223062:
	ldr r1, _022230F0 ; =ov13_0224DDC0
	add r0, r7, #0
	bl ov13_02222BC0
	ldr r0, _022230F0 ; =ov13_0224DDC0
	ldr r1, _022230DC ; =ov13_0224DE80
	add r2, r5, #0
	bl ov13_02223634
	cmp r0, #0
	bne _022230A4
	mov r4, #0
	b _022230A4
_0222307C:
	mov r4, #0
	str r4, [sp, #0xc]
	b _022230A4
_02223082:
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, #3
	bge _0222309E
	ldr r0, _022230F0 ; =ov13_0224DDC0
	ldr r1, _022230DC ; =ov13_0224DE80
	add r2, r5, #0
	bl ov13_02223634
	cmp r0, #0
	bne _022230A4
	mov r4, #0
	b _022230A4
_0222309E:
	mov r4, #0
	b _022230A4
_022230A2:
	mov r4, #0
_022230A4:
	cmp r4, #0
	bne _02222FD0
	add r0, sp, #0x14
	bl OS_CancelAlarm
	ldr r5, _022230EC ; =ov13_0224DDA0
	add r4, sp, #0x10
	mov r6, #0
_022230B4:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl OS_ReceiveMessage
	cmp r0, #1
	beq _022230B4
_022230C2:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _022230CC
	mov r2, #1
	b _022230CE
_022230CC:
	mov r2, #0
_022230CE:
	ldr r0, [sp, #4]
	ldr r1, _022230F0 ; =ov13_0224DDC0
	bl ov13_02222BE4
	ldr r0, [sp, #0xc]
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022230DC: .word ov13_0224DE80
_022230E0: .word 0x0030BFFE
_022230E4: .word 0x003FEC42
_022230E8: .word ov13_02222C08
_022230EC: .word ov13_0224DDA0
_022230F0: .word ov13_0224DDC0
_022230F4: .word ov13_0224DDC0
	thumb_func_end ov13_02222F28

	thumb_func_start ov13_022230F8
ov13_022230F8: ; 0x022230F8
	ldr r3, _022230FC ; =OS_Sleep
	bx r3
	.balign 4, 0
_022230FC: .word OS_Sleep
	thumb_func_end ov13_022230F8

	thumb_func_start ov13_02223100
ov13_02223100: ; 0x02223100
	push {r3, lr}
	ldr r1, _02223110 ; =ov13_0224DD80
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _0222310C
	blx r1
_0222310C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02223110: .word ov13_0224DD80
	thumb_func_end ov13_02223100

	thumb_func_start ov13_02223114
ov13_02223114: ; 0x02223114
	push {r3, lr}
	cmp r0, #0
	bne _0222311C
	b _022233C4
_0222311C:
	mov r1, #0
	ldrsh r2, [r0, r1]
	cmp r2, #7
	bls _02223126
	b _022233B6
_02223126:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02223132: ; jump table
	.short _022233B6 - _02223132 - 2 ; case 0
	.short _02223142 - _02223132 - 2 ; case 1
	.short _0222336A - _02223132 - 2 ; case 2
	.short _022231C2 - _02223132 - 2 ; case 3
	.short _02223226 - _02223132 - 2 ; case 4
	.short _022231F4 - _02223132 - 2 ; case 5
	.short _022232C6 - _02223132 - 2 ; case 6
	.short _022233A2 - _02223132 - 2 ; case 7
_02223142:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022231AE
	ldr r2, _022233C8 ; =ov13_0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #4
	bne _02223162
	mov r0, #3
	str r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	cmp r2, #0
	beq _022231BA
	mov r0, #6
	blx r2
	pop {r3, pc}
_02223162:
	cmp r0, #6
	bne _02223188
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	bl WCM_SearchAsync
	cmp r0, #3
	beq _022231BA
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022231BA
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_02223188:
	cmp r0, #8
	bne _022231BA
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	bl WCM_ConnectAsync
	cmp r0, #3
	beq _022231BA
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022231BA
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_022231AE:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r3, #1
	str r3, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	cmp r3, #0
	bne _022231BC
_022231BA:
	b _022233C4
_022231BC:
	add r0, r2, #0
	blx r3
	pop {r3, pc}
_022231C2:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022231E2
	ldr r0, _022233C8 ; =ov13_0224DEE0
	ldr r2, [r0, #0x18]
	cmp r2, #6
	bne _022232BE
	mov r2, #5
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #8
	blx r2
	pop {r3, pc}
_022231E2:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #9
	blx r2
	pop {r3, pc}
_022231F4:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223214
	ldr r0, _022233C8 ; =ov13_0224DEE0
	ldr r2, [r0, #0x18]
	cmp r2, #8
	bne _022232BE
	mov r2, #7
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #0xc
	blx r2
	pop {r3, pc}
_02223214:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #0xd
	blx r2
	pop {r3, pc}
_02223226:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022232B2
	ldr r2, _022233C8 ; =ov13_0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #4
	bne _02223246
	mov r0, #3
	str r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #0xa
	blx r2
	pop {r3, pc}
_02223246:
	cmp r0, #6
	bne _0222326C
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	bl WCM_SearchAsync
	cmp r0, #3
	beq _022232BE
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_0222326C:
	cmp r0, #2
	bne _0222328C
	bl WCM_CleanupAsync
	cmp r0, #3
	beq _022232BE
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_0222328C:
	cmp r0, #8
	bne _022232BE
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	bl WCM_ConnectAsync
	cmp r0, #3
	beq _022232BE
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022232BE
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_022232B2:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	bne _022232C0
_022232BE:
	b _022233C4
_022232C0:
	mov r0, #0xb
	blx r2
	pop {r3, pc}
_022232C6:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223358
	ldr r2, _022233C8 ; =ov13_0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #4
	bne _022232E6
	mov r0, #3
	str r0, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #0xe
	blx r2
	pop {r3, pc}
_022232E6:
	cmp r0, #6
	bne _0222330C
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	bl WCM_SearchAsync
	cmp r0, #3
	beq _022233C4
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_0222330C:
	cmp r0, #2
	bne _0222332C
	bl WCM_CleanupAsync
	cmp r0, #3
	beq _022233C4
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_0222332C:
	cmp r0, #8
	bne _02223352
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	bl WCM_ConnectAsync
	cmp r0, #3
	beq _022233C4
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #3
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_02223352:
	mov r0, #3
	str r0, [r2, #0x18]
	pop {r3, pc}
_02223358:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r2, #3
	str r2, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #0xf
	blx r2
	pop {r3, pc}
_0222336A:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223390
	ldr r0, _022233C8 ; =ov13_0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #2
	bne _022233C4
	bl WCM_Finish
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #0x14
	blx r2
	pop {r3, pc}
_02223390:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	mov r3, #3
	str r3, [r0, #0x18]
	ldr r3, [r0, #0x1c]
	cmp r3, #0
	beq _022233C4
	add r0, r2, #0
	blx r3
	pop {r3, pc}
_022233A2:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	ldr r2, [r0, #0x18]
	cmp r2, #5
	bne _022233C4
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #5
	blx r2
	pop {r3, pc}
_022233B6:
	ldr r0, _022233C8 ; =ov13_0224DEE0
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _022233C4
	mov r0, #1
	mov r1, #0
	blx r2
_022233C4:
	pop {r3, pc}
	nop
_022233C8: .word ov13_0224DEE0
	thumb_func_end ov13_02223114

	thumb_func_start ov13_022233CC
ov13_022233CC: ; 0x022233CC
	push {r3, lr}
	ldr r1, _0222342C ; =ov13_0224DEE0
	ldr r0, [r1, #0x18]
	cmp r0, #8
	bhi _02223422
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022233E2: ; jump table
	.short _02223422 - _022233E2 - 2 ; case 0
	.short _02223412 - _022233E2 - 2 ; case 1
	.short _02223422 - _022233E2 - 2 ; case 2
	.short _02223422 - _022233E2 - 2 ; case 3
	.short _02223422 - _022233E2 - 2 ; case 4
	.short _022233F4 - _022233E2 - 2 ; case 5
	.short _02223422 - _022233E2 - 2 ; case 6
	.short _02223406 - _022233E2 - 2 ; case 7
	.short _02223422 - _022233E2 - 2 ; case 8
_022233F4:
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl WCM_SearchAsync
	cmp r0, #3
	beq _02223426
	mov r0, #0
	pop {r3, pc}
_02223406:
	bl WCM_DisconnectAsync
	cmp r0, #3
	beq _02223426
	mov r0, #0
	pop {r3, pc}
_02223412:
	ldr r0, [r1, #8]
	ldr r1, _02223430 ; =ov13_02223114
	bl WCM_StartupAsync
	cmp r0, #3
	beq _02223426
	mov r0, #0
	pop {r3, pc}
_02223422:
	mov r0, #0
	pop {r3, pc}
_02223426:
	mov r0, #1
	pop {r3, pc}
	nop
_0222342C: .word ov13_0224DEE0
_02223430: .word ov13_02223114
	thumb_func_end ov13_022233CC

	thumb_func_start ov13_02223434
ov13_02223434: ; 0x02223434
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	add r7, r1, #0
	bl WCM_LockApList
	bl WCM_CountApList
	add r6, r0, #0
	cmp r6, #0
	ble _0222346C
	mov r4, #0
	cmp r6, #0
	ble _0222346C
_02223450:
	cmp r4, r7
	bge _0222346C
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl WCM_PointApList
	add r1, r5, #0
	mov r2, #0xc0
	bl MIi_CpuCopy32
	add r4, r4, #1
	add r5, #0xc0
	cmp r4, r6
	blt _02223450
_0222346C:
	mov r0, #0
	bl WCM_LockApList
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02223434

	thumb_func_start ov13_02223478
ov13_02223478: ; 0x02223478
	push {r3, r4, r5, r6, r7, lr}
	str r3, [sp]
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl OS_DisableInterrupts
	add r7, r0, #0
	ldr r1, _02223554 ; =ov13_0224DEE0
	ldr r0, [sp]
	cmp r5, #0
	str r0, [r1, #4]
	beq _022234AC
	ldr r2, _02223558 ; =ov13_0224DF08
	mov r1, #0
_02223496:
	ldrb r0, [r5]
	add r1, r1, #1
	add r5, r5, #1
	strb r0, [r2]
	add r2, r2, #1
	cmp r1, #6
	blt _02223496
	ldr r1, _02223558 ; =ov13_0224DF08
	ldr r0, _02223554 ; =ov13_0224DEE0
	str r1, [r0, #0x10]
	b _022234BC
_022234AC:
	ldr r0, _02223558 ; =ov13_0224DF08
	mov r1, #0xff
	mov r2, #6
	bl MI_CpuFill8
	ldr r1, _0222355C ; =_02108FC0
	ldr r0, _02223554 ; =ov13_0224DEE0
	str r1, [r0, #0x10]
_022234BC:
	cmp r4, #0
	beq _022234FA
	cmp r6, #0
	ble _022234FA
	cmp r6, #0x20
	bgt _022234FA
	mov r0, #0
	cmp r6, #0
	ble _022234DE
	ldr r2, _02223560 ; =ov13_0224DF10
_022234D0:
	ldrb r1, [r4]
	add r0, r0, #1
	add r4, r4, #1
	strb r1, [r2]
	add r2, r2, #1
	cmp r0, r6
	blt _022234D0
_022234DE:
	cmp r0, #0x20
	bge _022234F2
	ldr r1, _02223560 ; =ov13_0224DF10
	add r2, r1, r0
	mov r1, #0
_022234E8:
	add r0, r0, #1
	strb r1, [r2]
	add r2, r2, #1
	cmp r0, #0x20
	blt _022234E8
_022234F2:
	ldr r1, _02223560 ; =ov13_0224DF10
	ldr r0, _02223554 ; =ov13_0224DEE0
	str r1, [r0, #0x14]
	b _0222350A
_022234FA:
	ldr r0, _02223560 ; =ov13_0224DF10
	mov r1, #0xff
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r1, _02223564 ; =_02108FC8
	ldr r0, _02223554 ; =ov13_0224DEE0
	str r1, [r0, #0x14]
_0222350A:
	ldr r2, _02223554 ; =ov13_0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #3
	bne _02223530
	ldr r0, [r2, #0x10]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #4]
	bl WCM_SearchAsync
	cmp r0, #3
	bne _02223548
	ldr r0, _02223554 ; =ov13_0224DEE0
	mov r1, #6
	str r1, [r0, #0x18]
	add r0, r7, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223530:
	bl ov13_022233CC
	cmp r0, #1
	bne _02223548
	ldr r0, _02223554 ; =ov13_0224DEE0
	mov r1, #6
	str r1, [r0, #0x18]
	add r0, r7, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223548:
	add r0, r7, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223554: .word ov13_0224DEE0
_02223558: .word ov13_0224DF08
_0222355C: .word _02108FC0
_02223560: .word ov13_0224DF10
_02223564: .word _02108FC8
	thumb_func_end ov13_02223478

	thumb_func_start ov13_02223568
ov13_02223568: ; 0x02223568
	push {r4, lr}
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _022235A0 ; =ov13_0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #5
	bne _02223596
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl WCM_SearchAsync
	cmp r0, #3
	bne _02223596
	ldr r0, _022235A0 ; =ov13_0224DEE0
	mov r1, #4
	str r1, [r0, #0x18]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, pc}
_02223596:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_022235A0: .word ov13_0224DEE0
	thumb_func_end ov13_02223568

	thumb_func_start ov13_022235A4
ov13_022235A4: ; 0x022235A4
	push {r4, lr}
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _022235D8 ; =ov13_0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #7
	bne _022235CC
	bl WCM_DisconnectAsync
	cmp r0, #3
	bne _022235CC
	ldr r0, _022235D8 ; =ov13_0224DEE0
	mov r1, #4
	str r1, [r0, #0x18]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, pc}
_022235CC:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r4, pc}
	nop
_022235D8: .word ov13_0224DEE0
	thumb_func_end ov13_022235A4

	thumb_func_start ov13_022235DC
ov13_022235DC: ; 0x022235DC
	push {r4, lr}
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _02223630 ; =ov13_0224DEE0
	ldr r0, [r0, #0x18]
	cmp r0, #3
	bne _0222360E
	bl WCM_CleanupAsync
	cmp r0, #3
	beq _022235FE
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r4, pc}
_022235FE:
	ldr r0, _02223630 ; =ov13_0224DEE0
	mov r1, #2
	str r1, [r0, #0x18]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, pc}
_0222360E:
	bl ov13_022233CC
	cmp r0, #1
	bne _02223626
	ldr r0, _02223630 ; =ov13_0224DEE0
	mov r1, #2
	str r1, [r0, #0x18]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, pc}
_02223626:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02223630: .word ov13_0224DEE0
	thumb_func_end ov13_022235DC

	thumb_func_start ov13_02223634
ov13_02223634: ; 0x02223634
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl OS_DisableInterrupts
	ldr r1, _022236B4 ; =ov13_0224DEE0
	add r4, r0, #0
	str r6, [r1, #0xc]
	cmp r5, #0
	beq _02223656
	ldr r1, [r1, #0x24]
	add r0, r5, #0
	mov r2, #0x50
	bl MI_CpuCopy8
	b _02223660
_02223656:
	ldr r0, [r1, #0x24]
	mov r1, #0
	mov r2, #0x50
	bl MI_CpuFill8
_02223660:
	ldr r1, _022236B4 ; =ov13_0224DEE0
	add r0, r7, #0
	ldr r1, [r1, #0x20]
	mov r2, #0xc0
	bl MIi_CpuCopy32
	bl ov13_022233CC
	cmp r0, #1
	bne _02223684
	ldr r0, _022236B4 ; =ov13_0224DEE0
	mov r1, #8
	str r1, [r0, #0x18]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223684:
	ldr r2, _022236B4 ; =ov13_0224DEE0
	ldr r0, [r2, #0x18]
	cmp r0, #3
	bne _022236AA
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	ldr r2, [r2, #0xc]
	bl WCM_ConnectAsync
	cmp r0, #3
	bne _022236AA
	ldr r0, _022236B4 ; =ov13_0224DEE0
	mov r1, #8
	str r1, [r0, #0x18]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_022236AA:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022236B4: .word ov13_0224DEE0
	thumb_func_end ov13_02223634

	thumb_func_start ov13_022236B8
ov13_022236B8: ; 0x022236B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	str r2, [sp]
	bl OS_DisableInterrupts
	add r4, r0, #0
	add r0, r5, #0
	ldr r2, _02223764 ; =ov13_0224DEE0
	add r0, #0x53
	mov r1, #3
	bic r0, r1
	add r6, r0, #0
	str r5, [r2, #0x24]
	add r6, #0x2f
	mov r1, #0x1f
	ldr r3, _02223768 ; =0x0000231F
	str r0, [r2, #8]
	bic r6, r1
	str r6, [r2]
	add r6, r6, r3
	bic r6, r1
	str r6, [r2, #0x20]
	add r6, #0xdf
	bic r6, r1
	str r6, [r0, #4]
	ldr r1, [sp]
	ldr r0, [r2, #8]
	add r5, r5, r1
	ldr r1, [r0, #4]
	sub r1, r5, r1
	str r1, [r0, #8]
	ldr r0, [r2, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r2, #8]
	mov r1, #3
	str r1, [r0]
	str r7, [r2, #0x1c]
	ldr r0, [r2, #0x18]
	cmp r0, #0
	bne _0222372A
	sub r3, #0x1f
	ldr r0, [r2]
	add r1, r3, #0
	bl WCM_Init
	cmp r0, #0
	beq _02223724
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223724:
	ldr r0, _02223764 ; =ov13_0224DEE0
	mov r1, #1
	str r1, [r0, #0x18]
_0222372A:
	ldr r0, _02223764 ; =ov13_0224DEE0
	ldr r1, [r0, #0x18]
	cmp r1, #1
	bne _02223758
	ldr r0, [r0, #8]
	ldr r1, _0222376C ; =ov13_02223114
	bl WCM_StartupAsync
	cmp r0, #3
	beq _02223748
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223748:
	ldr r0, _02223764 ; =ov13_0224DEE0
	mov r1, #4
	str r1, [r0, #0x18]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223758:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223764: .word ov13_0224DEE0
_02223768: .word 0x0000231F
_0222376C: .word ov13_02223114
	thumb_func_end ov13_022236B8

	thumb_func_start ov13_02223770
ov13_02223770: ; 0x02223770
	push {r3, lr}
	cmp r0, #0
	bne _02223778
	b _02223A72
_02223778:
	mov r1, #0
	ldrsh r2, [r0, r1]
	cmp r2, #9
	bls _02223782
	b _02223A64
_02223782:
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0222378E: ; jump table
	.short _02223A64 - _0222378E - 2 ; case 0
	.short _022237A2 - _0222378E - 2 ; case 1
	.short _022239F2 - _0222378E - 2 ; case 2
	.short _02223828 - _0222378E - 2 ; case 3
	.short _02223896 - _0222378E - 2 ; case 4
	.short _02223860 - _0222378E - 2 ; case 5
	.short _0222393E - _0222378E - 2 ; case 6
	.short _02223A2E - _0222378E - 2 ; case 7
	.short _02223A44 - _0222378E - 2 ; case 8
	.short _02223A52 - _0222378E - 2 ; case 9
_022237A2:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223814
	ldr r2, _02223A74 ; =ov13_0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	bne _022237C4
	mov r0, #3
	str r0, [r2, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	mov r0, #6
	blx r2
	pop {r3, pc}
_022237C4:
	cmp r0, #6
	bne _022237EC
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x60]
	bl WCM_SearchAsync
	cmp r0, #3
	beq _02223858
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_022237EC:
	cmp r0, #8
	bne _02223858
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	bl WCM_ConnectAsync
	cmp r0, #3
	beq _02223858
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_02223814:
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r3, #1
	str r3, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r3, [r0]
	cmp r3, #0
	beq _02223858
	add r0, r2, #0
	blx r3
	pop {r3, pc}
_02223828:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0222384A
	ldr r0, _02223A74 ; =ov13_0224DF30
	ldr r2, [r0, #0x2c]
	cmp r2, #6
	bne _02223858
	mov r2, #5
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223858
	mov r0, #8
	blx r2
	pop {r3, pc}
_0222384A:
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	bne _0222385A
_02223858:
	b _02223A72
_0222385A:
	mov r0, #9
	blx r2
	pop {r3, pc}
_02223860:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223882
	ldr r0, _02223A74 ; =ov13_0224DF30
	ldr r2, [r0, #0x2c]
	cmp r2, #8
	bne _0222395A
	mov r2, #7
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	mov r0, #0xc
	blx r2
	pop {r3, pc}
_02223882:
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	mov r0, #0xd
	blx r2
	pop {r3, pc}
_02223896:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _0222392A
	ldr r2, _02223A74 ; =ov13_0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	bne _022238B8
	mov r0, #3
	str r0, [r2, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	mov r0, #0xa
	blx r2
	pop {r3, pc}
_022238B8:
	cmp r0, #6
	bne _022238E0
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x60]
	bl WCM_SearchAsync
	cmp r0, #3
	beq _0222395A
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_022238E0:
	cmp r0, #2
	bne _02223902
	bl WCM_CleanupAsync
	cmp r0, #3
	beq _0222395A
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_02223902:
	cmp r0, #8
	bne _0222395A
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	bl WCM_ConnectAsync
	cmp r0, #3
	beq _0222395A
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_0222392A:
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _0222395A
	mov r0, #0xb
	blx r2
	pop {r3, pc}
_0222393E:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _022239DE
	ldr r2, _02223A74 ; =ov13_0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #4
	bne _02223962
	mov r0, #3
	str r0, [r2, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	bne _0222395C
_0222395A:
	b _02223A72
_0222395C:
	mov r0, #0xe
	blx r2
	pop {r3, pc}
_02223962:
	cmp r0, #6
	bne _0222398A
	ldr r0, [r2, #0x44]
	ldr r1, [r2, #0x48]
	ldr r2, [r2, #0x60]
	bl WCM_SearchAsync
	cmp r0, #3
	beq _02223A72
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_0222398A:
	cmp r0, #2
	bne _022239AC
	bl WCM_CleanupAsync
	cmp r0, #3
	beq _02223A72
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_022239AC:
	cmp r0, #8
	bne _022239D4
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	bl WCM_ConnectAsync
	cmp r0, #3
	beq _02223A72
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #2
	mov r1, #0
	blx r2
	pop {r3, pc}
_022239D4:
	cmp r0, #7
	bne _02223A72
	mov r0, #3
	str r0, [r2, #0x2c]
	pop {r3, pc}
_022239DE:
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r2, #3
	str r2, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #0xf
	blx r2
	pop {r3, pc}
_022239F2:
	mov r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _02223A1A
	ldr r0, _02223A74 ; =ov13_0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #2
	bne _02223A72
	bl WCM_Finish
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r1, #0
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #0x14
	blx r2
	pop {r3, pc}
_02223A1A:
	ldr r0, _02223A74 ; =ov13_0224DF30
	mov r3, #3
	str r3, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r3, [r0]
	cmp r3, #0
	beq _02223A72
	add r0, r2, #0
	blx r3
	pop {r3, pc}
_02223A2E:
	ldr r0, _02223A74 ; =ov13_0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #5
	bne _02223A72
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #5
	blx r2
	pop {r3, pc}
_02223A44:
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #4
	blx r2
	pop {r3, pc}
_02223A52:
	ldr r0, _02223A74 ; =ov13_0224DF30
	str r1, [r0, #0x2c]
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #3
	blx r2
	pop {r3, pc}
_02223A64:
	ldr r0, _02223A78 ; =ov13_0224DFB0
	ldr r2, [r0]
	cmp r2, #0
	beq _02223A72
	mov r0, #1
	mov r1, #0
	blx r2
_02223A72:
	pop {r3, pc}
	.balign 4, 0
_02223A74: .word ov13_0224DF30
_02223A78: .word ov13_0224DFB0
	thumb_func_end ov13_02223770

	thumb_func_start ov13_02223A7C
ov13_02223A7C: ; 0x02223A7C
	push {r3, lr}
	ldr r1, _02223ADC ; =ov13_0224DF30
	ldr r0, [r1, #0x2c]
	cmp r0, #8
	bhi _02223AD2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02223A92: ; jump table
	.short _02223AD2 - _02223A92 - 2 ; case 0
	.short _02223AC2 - _02223A92 - 2 ; case 1
	.short _02223AD2 - _02223A92 - 2 ; case 2
	.short _02223AD2 - _02223A92 - 2 ; case 3
	.short _02223AD2 - _02223A92 - 2 ; case 4
	.short _02223AA4 - _02223A92 - 2 ; case 5
	.short _02223AD2 - _02223A92 - 2 ; case 6
	.short _02223AB6 - _02223A92 - 2 ; case 7
	.short _02223AD2 - _02223A92 - 2 ; case 8
_02223AA4:
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl WCM_SearchAsync
	cmp r0, #3
	beq _02223AD6
	mov r0, #0
	pop {r3, pc}
_02223AB6:
	bl WCM_DisconnectAsync
	cmp r0, #3
	beq _02223AD6
	mov r0, #0
	pop {r3, pc}
_02223AC2:
	ldr r0, [r1, #8]
	ldr r1, _02223AE0 ; =ov13_02223770
	bl WCM_StartupAsync
	cmp r0, #3
	beq _02223AD6
	mov r0, #0
	pop {r3, pc}
_02223AD2:
	mov r0, #0
	pop {r3, pc}
_02223AD6:
	mov r0, #1
	pop {r3, pc}
	nop
_02223ADC: .word ov13_0224DF30
_02223AE0: .word ov13_02223770
	thumb_func_end ov13_02223A7C

	thumb_func_start ov13_02223AE4
ov13_02223AE4: ; 0x02223AE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #1
	add r7, r1, #0
	bl WCM_LockApList
	bl WCM_CountApList
	add r6, r0, #0
	cmp r6, #0
	ble _02223B1C
	mov r4, #0
	cmp r6, #0
	ble _02223B1C
_02223B00:
	cmp r4, r7
	bge _02223B1C
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl WCM_PointApList
	add r1, r5, #0
	mov r2, #0xc0
	bl MIi_CpuCopy32
	add r4, r4, #1
	add r5, #0xc0
	cmp r4, r6
	blt _02223B00
_02223B1C:
	mov r0, #0
	bl WCM_LockApList
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02223AE4

	thumb_func_start ov13_02223B28
ov13_02223B28: ; 0x02223B28
	push {r3, r4, r5, r6, r7, lr}
	str r3, [sp]
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl OS_DisableInterrupts
	add r7, r0, #0
	ldr r1, _02223BFC ; =ov13_0224DF30
	ldr r0, [sp]
	cmp r5, #0
	str r0, [r1, #0x60]
	ldr r0, _02223C00 ; =ov13_0224E3E8
	str r0, [r1, #0x44]
	beq _02223B58
	mov r2, #0
_02223B48:
	ldrb r1, [r5]
	add r2, r2, #1
	add r5, r5, #1
	strb r1, [r0]
	add r0, r0, #1
	cmp r2, #6
	blt _02223B48
	b _02223B66
_02223B58:
	mov r1, #0xff
	mov r2, #6
	bl MI_CpuFill8
	ldr r1, _02223C04 ; =_02108FC0
	ldr r0, _02223BFC ; =ov13_0224DF30
	str r1, [r0, #0x44]
_02223B66:
	ldr r2, _02223C08 ; =ov13_0224E420
	ldr r0, _02223BFC ; =ov13_0224DF30
	cmp r4, #0
	str r2, [r0, #0x48]
	beq _02223BA2
	cmp r6, #0
	ble _02223BA2
	cmp r6, #0x20
	bge _02223BA2
	mov r0, #0
	cmp r6, #0
	ble _02223B8C
_02223B7E:
	ldrb r1, [r4]
	add r0, r0, #1
	add r4, r4, #1
	strb r1, [r2]
	add r2, r2, #1
	cmp r0, r6
	blt _02223B7E
_02223B8C:
	cmp r0, #0x20
	bge _02223BB2
	ldr r1, _02223C08 ; =ov13_0224E420
	add r2, r1, r0
	mov r1, #0
_02223B96:
	add r0, r0, #1
	strb r1, [r2]
	add r2, r2, #1
	cmp r0, #0x20
	blt _02223B96
	b _02223BB2
_02223BA2:
	ldr r0, _02223C08 ; =ov13_0224E420
	mov r1, #0xff
	mov r2, #0x20
	bl MI_CpuFill8
	ldr r1, _02223C0C ; =_02108FC8
	ldr r0, _02223BFC ; =ov13_0224DF30
	str r1, [r0, #0x48]
_02223BB2:
	ldr r2, _02223BFC ; =ov13_0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #3
	bne _02223BD8
	ldr r1, [r2, #0x48]
	ldr r0, _02223C00 ; =ov13_0224E3E8
	ldr r2, [r2, #0x60]
	bl WCM_SearchAsync
	cmp r0, #3
	bne _02223BF0
	ldr r0, _02223BFC ; =ov13_0224DF30
	mov r1, #6
	str r1, [r0, #0x2c]
	add r0, r7, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223BD8:
	bl ov13_02223A7C
	cmp r0, #1
	bne _02223BF0
	ldr r0, _02223BFC ; =ov13_0224DF30
	mov r1, #6
	str r1, [r0, #0x2c]
	add r0, r7, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223BF0:
	add r0, r7, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223BFC: .word ov13_0224DF30
_02223C00: .word ov13_0224E3E8
_02223C04: .word _02108FC0
_02223C08: .word ov13_0224E420
_02223C0C: .word _02108FC8
	thumb_func_end ov13_02223B28

	thumb_func_start ov13_02223C10
ov13_02223C10: ; 0x02223C10
	push {r4, lr}
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _02223C44 ; =ov13_0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #7
	bne _02223C38
	bl WCM_DisconnectAsync
	cmp r0, #3
	bne _02223C38
	ldr r0, _02223C44 ; =ov13_0224DF30
	mov r1, #4
	str r1, [r0, #0x2c]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, pc}
_02223C38:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r4, pc}
	nop
_02223C44: .word ov13_0224DF30
	thumb_func_end ov13_02223C10

	thumb_func_start ov13_02223C48
ov13_02223C48: ; 0x02223C48
	push {r4, lr}
	bl OS_DisableInterrupts
	add r4, r0, #0
	ldr r0, _02223C9C ; =ov13_0224DF30
	ldr r0, [r0, #0x2c]
	cmp r0, #3
	bne _02223C7A
	bl WCM_CleanupAsync
	cmp r0, #3
	beq _02223C6A
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r4, pc}
_02223C6A:
	ldr r0, _02223C9C ; =ov13_0224DF30
	mov r1, #2
	str r1, [r0, #0x2c]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, pc}
_02223C7A:
	bl ov13_02223A7C
	cmp r0, #1
	bne _02223C92
	ldr r0, _02223C9C ; =ov13_0224DF30
	mov r1, #2
	str r1, [r0, #0x2c]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r4, pc}
_02223C92:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02223C9C: .word ov13_0224DF30
	thumb_func_end ov13_02223C48

	thumb_func_start ov13_02223CA0
ov13_02223CA0: ; 0x02223CA0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl OS_DisableInterrupts
	ldr r1, _02223D20 ; =ov13_0224DF30
	add r4, r0, #0
	str r6, [r1, #0x58]
	cmp r5, #0
	beq _02223CC2
	ldr r1, [r1, #0x28]
	add r0, r5, #0
	mov r2, #0x60
	bl MI_CpuCopy8
	b _02223CCC
_02223CC2:
	ldr r0, [r1, #0x28]
	mov r1, #0
	mov r2, #0x60
	bl MI_CpuFill8
_02223CCC:
	ldr r1, _02223D20 ; =ov13_0224DF30
	add r0, r7, #0
	ldr r1, [r1, #0x4c]
	mov r2, #0xc0
	bl MIi_CpuCopy32
	bl ov13_02223A7C
	cmp r0, #1
	bne _02223CF0
	ldr r0, _02223D20 ; =ov13_0224DF30
	mov r1, #8
	str r1, [r0, #0x2c]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223CF0:
	ldr r2, _02223D20 ; =ov13_0224DF30
	ldr r0, [r2, #0x2c]
	cmp r0, #3
	bne _02223D16
	ldr r0, [r2, #0x4c]
	ldr r1, [r2, #0x28]
	ldr r2, [r2, #0x58]
	bl WCM_ConnectAsync
	cmp r0, #3
	bne _02223D16
	ldr r0, _02223D20 ; =ov13_0224DF30
	mov r1, #8
	str r1, [r0, #0x2c]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223D16:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223D20: .word ov13_0224DF30
	thumb_func_end ov13_02223CA0

	thumb_func_start ov13_02223D24
ov13_02223D24: ; 0x02223D24
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	str r2, [sp]
	bl OS_DisableInterrupts
	add r4, r0, #0
	add r0, r5, #0
	ldr r2, _02223DD0 ; =ov13_0224DF30
	add r0, #0x63
	mov r1, #3
	bic r0, r1
	add r6, r0, #0
	str r5, [r2, #0x28]
	add r6, #0x2f
	mov r1, #0x1f
	ldr r3, _02223DD4 ; =0x0000231F
	str r0, [r2, #8]
	bic r6, r1
	str r6, [r2, #0x3c]
	add r6, r6, r3
	bic r6, r1
	str r6, [r2, #0x4c]
	add r6, #0xdf
	bic r6, r1
	str r6, [r0, #4]
	ldr r1, [sp]
	ldr r0, [r2, #8]
	add r5, r5, r1
	ldr r1, [r0, #4]
	sub r1, r5, r1
	str r1, [r0, #8]
	ldr r0, [r2, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	ldr r0, [r2, #8]
	mov r1, #3
	str r1, [r0]
	ldr r0, _02223DD8 ; =ov13_0224DFB0
	str r7, [r0]
	ldr r0, [r2, #0x2c]
	cmp r0, #0
	bne _02223D98
	sub r3, #0x1f
	ldr r0, [r2, #0x3c]
	add r1, r3, #0
	bl WCM_Init
	cmp r0, #0
	beq _02223D92
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223D92:
	ldr r0, _02223DD0 ; =ov13_0224DF30
	mov r1, #1
	str r1, [r0, #0x2c]
_02223D98:
	ldr r0, _02223DD0 ; =ov13_0224DF30
	ldr r1, [r0, #0x2c]
	cmp r1, #1
	bne _02223DC6
	ldr r0, [r0, #8]
	ldr r1, _02223DDC ; =ov13_02223770
	bl WCM_StartupAsync
	cmp r0, #3
	beq _02223DB6
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223DB6:
	ldr r0, _02223DD0 ; =ov13_0224DF30
	mov r1, #4
	str r1, [r0, #0x2c]
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02223DC6:
	add r0, r4, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223DD0: .word ov13_0224DF30
_02223DD4: .word 0x0000231F
_02223DD8: .word ov13_0224DFB0
_02223DDC: .word ov13_02223770
	thumb_func_end ov13_02223D24

	thumb_func_start ov13_02223DE0
ov13_02223DE0: ; 0x02223DE0
	ldr r0, _02223DE8 ; =ov13_0224DF30
	ldr r0, [r0, #0x2c]
	bx lr
	nop
_02223DE8: .word ov13_0224DF30
	thumb_func_end ov13_02223DE0

	thumb_func_start ov13_02223DEC
ov13_02223DEC: ; 0x02223DEC
	push {r4, lr}
	add r4, r1, #0
	cmp r4, #0
	ble _02223E0E
	ldr r0, _02223E14 ; =ov13_0224DFC4
	bl OS_LockMutex
	ldr r1, _02223E18 ; =ov13_0224DF30
	add r0, r4, #0
	ldr r1, [r1, #4]
	blx r1
	add r4, r0, #0
	ldr r0, _02223E14 ; =ov13_0224DFC4
	bl OS_UnlockMutex
	add r0, r4, #0
	pop {r4, pc}
_02223E0E:
	mov r0, #0
	pop {r4, pc}
	nop
_02223E14: .word ov13_0224DFC4
_02223E18: .word ov13_0224DF30
	thumb_func_end ov13_02223DEC

	thumb_func_start ov13_02223E1C
ov13_02223E1C: ; 0x02223E1C
	push {r4, lr}
	add r4, r1, #0
	beq _02223E3A
	cmp r2, #0
	ble _02223E3A
	ldr r0, _02223E3C ; =ov13_0224DFC4
	bl OS_LockMutex
	ldr r1, _02223E40 ; =ov13_0224DF30
	add r0, r4, #0
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, _02223E3C ; =ov13_0224DFC4
	bl OS_UnlockMutex
_02223E3A:
	pop {r4, pc}
	.balign 4, 0
_02223E3C: .word ov13_0224DFC4
_02223E40: .word ov13_0224DF30
	thumb_func_end ov13_02223E1C

	thumb_func_start ov13_02223E44
ov13_02223E44: ; 0x02223E44
	push {r3, lr}
	bl OS_DisableInterrupts
	ldr r1, _02223E64 ; =ov13_0224DF30
	mov r2, #0
	str r2, [r1, #0x68]
	str r2, [r1, #0x6c]
	ldr r3, _02223E68 ; =ov13_0224DFB4
	add r1, r2, #0
_02223E56:
	add r2, r2, #1
	stmia r3!, {r1}
	cmp r2, #4
	blt _02223E56
	bl OS_RestoreInterrupts
	pop {r3, pc}
	.balign 4, 0
_02223E64: .word ov13_0224DF30
_02223E68: .word ov13_0224DFB4
	thumb_func_end ov13_02223E44

	thumb_func_start ov13_02223E6C
ov13_02223E6C: ; 0x02223E6C
	push {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	ldr r1, _02223E9C ; =ov13_0224DF30
	ldr r5, [r1, #0x6c]
	ldr r2, [r1, #0x68]
	cmp r2, r5
	bne _02223E80
	mov r4, #0
	b _02223E92
_02223E80:
	ldr r2, _02223EA0 ; =ov13_0224DFB4
	lsl r3, r5, #2
	ldr r4, [r2, r3]
	add r2, r5, #1
	str r2, [r1, #0x6c]
	cmp r2, #4
	blt _02223E92
	mov r2, #0
	str r2, [r1, #0x6c]
_02223E92:
	bl OS_RestoreInterrupts
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02223E9C: .word ov13_0224DF30
_02223EA0: .word ov13_0224DFB4
	thumb_func_end ov13_02223E6C

	thumb_func_start ov13_02223EA4
ov13_02223EA4: ; 0x02223EA4
	push {r3, r4}
	ldr r1, _02223ECC ; =ov13_0224DF30
	ldr r3, [r1, #0x68]
	ldr r2, [r1, #0x6c]
	add r4, r3, #1
	cmp r4, r2
	beq _02223EC8
	add r2, r2, #3
	cmp r3, r2
	beq _02223EC8
	ldr r2, _02223ED0 ; =ov13_0224DFB4
	lsl r3, r3, #2
	str r0, [r2, r3]
	str r4, [r1, #0x68]
	cmp r4, #4
	blt _02223EC8
	mov r0, #0
	str r0, [r1, #0x68]
_02223EC8:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02223ECC: .word ov13_0224DF30
_02223ED0: .word ov13_0224DFB4
	thumb_func_end ov13_02223EA4

	thumb_func_start ov13_02223ED4
ov13_02223ED4: ; 0x02223ED4
	ldr r3, _02223EDC ; =ov13_02223EA4
	mov r1, #0
	bx r3
	nop
_02223EDC: .word ov13_02223EA4
	thumb_func_end ov13_02223ED4

	thumb_func_start ov13_02223EE0
ov13_02223EE0: ; 0x02223EE0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02223F74 ; =ov13_0224DF30
	mov r4, #1
	str r6, [r0, #0x70]
	bl ov13_02223E44
	mov r0, #0xd0
	add r7, r6, #0
	mul r7, r0
	ldr r0, _02223F78 ; =0x000024D0
	add r1, r7, r0
	mov r0, #0xc0
	mul r0, r6
	add r0, r1, r0
	ldr r1, _02223F74 ; =ov13_0224DF30
	ldr r1, [r1, #4]
	blx r1
	ldr r6, _02223F74 ; =ov13_0224DF30
	cmp r0, #0
	str r0, [r6, #0x54]
	bne _02223F10
	sub r0, r4, #2
	pop {r3, r4, r5, r6, r7, pc}
_02223F10:
	mov r1, #0x1f
	add r2, r0, r1
	add r0, r1, #0
	sub r0, #0x3f
	add r3, r2, #0
	and r3, r0
	ldr r0, _02223F7C ; =0x00002490
	str r3, [r6, #0x40]
	add r2, r7, r0
	add r0, r3, r2
	add r0, r0, r1
	sub r1, #0x3f
	and r0, r1
	str r0, [r6, #0x5c]
	ldr r0, _02223F80 ; =ov13_02223EA4
	add r1, r3, #0
	bl ov13_02223D24
	cmp r0, #0
	bne _02223F3C
	sub r0, r4, #3
	pop {r3, r4, r5, r6, r7, pc}
_02223F3C:
	mov r6, #0
	add r7, r4, #0
_02223F40:
	mov r0, #0xa
	bl OS_Sleep
	bl ov13_02223E6C
	cmp r0, #0
	beq _02223F6C
_02223F4E:
	cmp r0, #4
	beq _02223F64
	cmp r0, #5
	beq _02223F64
	cmp r0, #6
	bne _02223F60
	add r4, r6, #0
	add r5, r7, #0
	b _02223F64
_02223F60:
	mov r4, #0
	sub r5, r4, #2
_02223F64:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02223F4E
_02223F6C:
	cmp r4, #0
	bne _02223F40
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223F74: .word ov13_0224DF30
_02223F78: .word 0x000024D0
_02223F7C: .word 0x00002490
_02223F80: .word ov13_02223EA4
	thumb_func_end ov13_02223EE0

	thumb_func_start ov13_02223F84
ov13_02223F84: ; 0x02223F84
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #1
	bl ov13_02223C48
	cmp r0, #0
	beq _02223FC2
	mov r6, #0
	add r4, r6, #0
	mov r7, #0xa
_02223F96:
	add r0, r7, #0
	bl OS_Sleep
	bl ov13_02223E6C
	cmp r0, #0
	beq _02223FBE
_02223FA4:
	cmp r0, #4
	beq _02223FB6
	cmp r0, #5
	beq _02223FB6
	cmp r0, #0x14
	bne _02223FB4
	add r5, r4, #0
	b _02223FB6
_02223FB4:
	add r5, r6, #0
_02223FB6:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02223FA4
_02223FBE:
	cmp r5, #0
	bne _02223F96
_02223FC2:
	ldr r1, _02223FD8 ; =ov13_0224DF30
	ldr r0, [r1, #0x54]
	cmp r0, #0
	beq _02223FD4
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, _02223FD8 ; =ov13_0224DF30
	mov r1, #0
	str r1, [r0, #0x54]
_02223FD4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223FD8: .word ov13_0224DF30
	thumb_func_end ov13_02223F84

	thumb_func_start ov13_02223FDC
ov13_02223FDC: ; 0x02223FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r0, _022240EC ; =ov13_0224DF30
	mov r4, #1
	ldr r3, [r0, #0x5c]
	ldr r0, [r0, #0x18]
	mov r2, #0xc0
	add r1, r0, #0
	mul r1, r2
	sub r5, r4, #3
	add r6, r3, r1
	bne _02223FFA
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02223FFA:
	add r0, r6, #0
	mov r1, #0
	lsl r2, r2, #0xa
	bl ov13_02223CA0
	cmp r0, #0
	bne _0222400E
	add sp, #0x30
	sub r0, r4, #3
	pop {r3, r4, r5, r6, r7, pc}
_0222400E:
	add r0, sp, #4
	bl OS_CreateAlarm
	mov r0, #0x12
	str r0, [sp]
	ldr r1, _022240F0 ; =0x003FEC42
	ldr r3, _022240F4 ; =ov13_02223ED4
	add r0, sp, #4
	mov r2, #0
	bl OS_SetAlarm
	mov r7, #0
_02224026:
	bl ov13_02226CBC
	ldr r1, _022240F8 ; =ov13_02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	blo _02224038
	mov r5, #2
	mvn r5, r5
	b _022240B8
_02224038:
	ldr r0, _022240EC ; =ov13_0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02224046
	mov r5, #7
	mvn r5, r5
	b _022240B8
_02224046:
	mov r0, #0xa
	bl OS_Sleep
	bl ov13_02223E6C
	cmp r0, #0
	beq _022240B4
_02224054:
	cmp r0, #0xc
	bgt _0222406A
	bge _0222407E
	cmp r0, #5
	bgt _022240AA
	cmp r0, #4
	blt _022240AA
	beq _022240AC
	cmp r0, #5
	beq _022240AC
	b _022240AA
_0222406A:
	cmp r0, #0x13
	bgt _022240AA
	cmp r0, #0xd
	blt _022240AA
	beq _02224084
	cmp r0, #0x12
	beq _022240AC
	cmp r0, #0x13
	beq _022240AC
	b _022240AA
_0222407E:
	add r4, r7, #0
	mov r5, #1
	b _022240AC
_02224084:
	ldr r0, _022240EC ; =ov13_0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02224094
	mov r4, #0
	add r5, r4, #0
	sub r5, #8
	b _022240AC
_02224094:
	mov r2, #3
	add r0, r6, #0
	mov r1, #0
	lsl r2, r2, #0x10
	bl ov13_02223CA0
	cmp r0, #0
	bne _022240AC
	add sp, #0x30
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_022240AA:
	mov r4, #0
_022240AC:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02224054
_022240B4:
	cmp r4, #0
	bne _02224026
_022240B8:
	add r0, sp, #4
	bl OS_CancelAlarm
_022240BE:
	bl ov13_02223E6C
	cmp r0, #0
	bne _022240BE
	cmp r5, #0
	ble _022240E6
	ldr r0, _022240EC ; =ov13_0224DF30
	mov r1, #1
	str r1, [r0, #0x20]
	ldr r0, _022240FC ; =ov13_02245A6C
	bl SOC_Startup
	cmp r0, #0
	bge _022240E0
	mov r5, #1
	mvn r5, r5
	b _022240E6
_022240E0:
	ldr r0, _022240EC ; =ov13_0224DF30
	mov r1, #1
	str r1, [r0, #0x24]
_022240E6:
	add r0, r5, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022240EC: .word ov13_0224DF30
_022240F0: .word 0x003FEC42
_022240F4: .word ov13_02223ED4
_022240F8: .word ov13_02245A58
_022240FC: .word ov13_02245A6C
	thumb_func_end ov13_02223FDC

	thumb_func_start ov13_02224100
ov13_02224100: ; 0x02224100
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _02224160 ; =ov13_0224DF30
	mov r5, #1
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _0222414C
	bl ov13_02223C10
	cmp r0, #0
	beq _02224146
	mov r6, #0
	add r4, r6, #0
	mov r7, #0xa
_0222411A:
	add r0, r7, #0
	bl OS_Sleep
	bl ov13_02223E6C
	cmp r0, #0
	beq _02224142
_02224128:
	cmp r0, #4
	beq _0222413A
	cmp r0, #5
	beq _0222413A
	cmp r0, #0xe
	bne _02224138
	add r5, r4, #0
	b _0222413A
_02224138:
	add r5, r6, #0
_0222413A:
	bl ov13_02223E6C
	cmp r0, #0
	bne _02224128
_02224142:
	cmp r5, #0
	bne _0222411A
_02224146:
	ldr r0, _02224160 ; =ov13_0224DF30
	mov r1, #0
	str r1, [r0, #0x20]
_0222414C:
	ldr r0, _02224160 ; =ov13_0224DF30
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _0222415C
	mov r1, #0
	str r1, [r0, #0x24]
	bl SOC_Cleanup
_0222415C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224160: .word ov13_0224DF30
	thumb_func_end ov13_02224100

	thumb_func_start ov13_02224164
ov13_02224164: ; 0x02224164
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0x20]
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	str r1, [sp, #4]
	add r6, r0, #4
	add r0, r1, #0
	add r4, r0, #4
	ldr r0, [sp, #0x20]
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	bls _02224238
_02224188:
	add r2, sp, #0x48
	add r2, #2
	mov r1, #0x22
	mov r0, #0
_02224190:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02224190
	add r0, sp, #0x48
	add r0, #2
	add r1, r6, #4
	mov r2, #0x20
	bl memcpy
	add r0, sp, #0x48
	ldr r1, [r6]
	mov r7, #0
	add r0, #2
	strb r7, [r0, r1]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	str r0, [sp, #0x10]
	cmp r0, #0
	bls _0222421C
	add r0, r6, #0
	str r0, [sp, #0x24]
	add r0, #0x28
	ldr r5, [r6]
	str r0, [sp, #0x24]
_022241C2:
	cmp r5, #0
	beq _0222421C
	cmp r5, #0x20
	bhi _0222421C
	cmp r5, #1
	bne _022241D8
	ldrb r0, [r6, #4]
	cmp r0, #0
	beq _0222421C
	cmp r0, #0x20
	beq _0222421C
_022241D8:
	add r0, sp, #0x48
	add r0, #2
	bl strlen
	add r2, r0, #0
	add r0, sp, #0x48
	add r0, #2
	add r1, r4, #4
	bl memcmp
	cmp r0, #0
	bne _02224212
	add r1, r4, #0
	ldr r0, [sp, #0x24]
	add r1, #0x28
	mov r2, #6
	bl memcmp
	cmp r0, #0
	bne _02224212
	ldrh r1, [r6, #0x2e]
	ldrh r0, [r4, #0x2e]
	cmp r1, r0
	beq _02224212
	cmp r1, #0
	bne _02224212
	mov r0, #1
	str r0, [sp, #0x20]
	b _0222421C
_02224212:
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	add r4, #0x30
	cmp r7, r0
	blo _022241C2
_0222421C:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02224238
	ldr r0, [sp, #4]
	add r6, #0x30
	add r4, r0, #4
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _02224188
_02224238:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02224314
	add r2, sp, #0x28
	mov r1, #0x22
	mov r0, #0
_02224244:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02224244
	mov r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
	ldr r0, [sp]
	ldr r6, [sp, #0x18]
	add r4, r0, #4
	ldr r0, [sp, #4]
	add r5, r0, #4
	ldr r0, [r0]
	cmp r0, #0
	bls _022242A0
	add r7, sp, #0x28
_02224264:
	add r0, r7, #0
	add r1, r5, #4
	mov r2, #0x20
	bl memcpy
	ldr r1, [r5]
	mov r0, #0
	strb r0, [r7, r1]
	ldr r0, _0222432C ; =ov13_02245AC4
	bl strlen
	add r2, r0, #0
	ldr r1, _0222432C ; =ov13_02245AC4
	add r0, r7, #0
	bl memcmp
	cmp r0, #0
	bne _02224294
	ldrh r0, [r5, #0x2e]
	cmp r0, #0
	bne _02224294
	mov r0, #1
	str r0, [sp, #0x14]
	b _022242A0
_02224294:
	ldr r0, [sp, #4]
	add r6, r6, #1
	ldr r0, [r0]
	add r5, #0x30
	cmp r6, r0
	blo _02224264
_022242A0:
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r0, [r0]
	cmp r0, #0
	bls _02224304
	ldr r7, _0222432C ; =ov13_02245AC4
	add r5, sp, #0x28
_022242B0:
	add r0, r5, #0
	add r1, r4, #4
	mov r2, #0x20
	bl memcpy
	ldr r1, [r4]
	mov r0, #0
	strb r0, [r5, r1]
	add r0, r5, #0
	bl strlen
	add r6, r0, #0
	add r0, r7, #0
	bl strlen
	cmp r6, r0
	bne _022242F2
	add r0, r7, #0
	bl strlen
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl memcmp
	cmp r0, #0
	bne _022242F2
	ldrh r0, [r4, #0x2e]
	cmp r0, #0
	bne _022242F2
	mov r0, #1
	str r0, [sp, #0x18]
	b _02224304
_022242F2:
	ldr r0, [sp, #0xc]
	add r4, #0x30
	add r0, r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, r1
	blo _022242B0
_02224304:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _02224314
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _02224314
	mov r0, #1
	str r0, [sp, #0x20]
_02224314:
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02224324
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	str r1, [r0]
	mov r0, #1
	str r0, [sp, #0x1c]
_02224324:
	ldr r0, [sp, #0x1c]
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_0222432C: .word ov13_02245AC4
	thumb_func_end ov13_02224164

	thumb_func_start ov13_02224330
ov13_02224330: ; 0x02224330
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0x20]
	ldr r0, _022245A8 ; =ov13_0224DF30
	mov r4, #0
	ldr r1, [r0, #0x70]
	mov r0, #0x30
	mul r0, r1
	str r0, [sp, #0x10]
	add r0, #0x34
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	mov r0, #1
	mvn r4, r4
	bl ov13_02226CD8
	str r0, [sp, #0xc]
	cmp r0, #0
	beq _02224368
	ldr r1, [sp, #0x10]
	mov r0, #1
	bl ov13_02226CD8
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222436A
_02224368:
	b _0222458E
_0222436A:
	mov r0, #0
	str r0, [sp, #0x1c]
	b _02224556
_02224370:
	bl ov13_02226CBC
	ldr r1, _022245AC ; =ov13_02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhs _0222445A
	mov r0, #0
	ldr r3, _022245B0 ; =0x0030BFFE
	add r1, r0, #0
	add r2, r0, #0
	bl ov13_02223B28
	cmp r0, #0
	bne _02224392
	mov r4, #1
	mvn r4, r4
	b _0222458E
_02224392:
	add r0, sp, #0x24
	bl OS_CreateAlarm
	mov r0, #0x13
	str r0, [sp]
	ldr r1, _022245B4 ; =0x000FFB10
	ldr r3, _022245B8 ; =ov13_02223ED4
	add r0, sp, #0x24
	mov r2, #0
	bl OS_SetAlarm
	ldr r7, _022245A8 ; =ov13_0224DF30
	mov r5, #1
	mov r4, #0
	add r6, sp, #0x24
_022243B0:
	mov r0, #0xa
	bl OS_Sleep
	bl ov13_02226CBC
	ldr r1, _022245AC ; =ov13_02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bhs _02224444
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bne _02224444
	bl ov13_02223E6C
	cmp r0, #0
	beq _02224440
_022243D0:
	cmp r0, #0x13
	bhi _02224436
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022243E0: ; jump table
	.short _02224436 - _022243E0 - 2 ; case 0
	.short _02224436 - _022243E0 - 2 ; case 1
	.short _02224436 - _022243E0 - 2 ; case 2
	.short _02224436 - _022243E0 - 2 ; case 3
	.short _02224438 - _022243E0 - 2 ; case 4
	.short _0222440C - _022243E0 - 2 ; case 5
	.short _02224436 - _022243E0 - 2 ; case 6
	.short _02224436 - _022243E0 - 2 ; case 7
	.short _02224438 - _022243E0 - 2 ; case 8
	.short _02224436 - _022243E0 - 2 ; case 9
	.short _02224432 - _022243E0 - 2 ; case 10
	.short _02224436 - _022243E0 - 2 ; case 11
	.short _02224436 - _022243E0 - 2 ; case 12
	.short _02224436 - _022243E0 - 2 ; case 13
	.short _02224436 - _022243E0 - 2 ; case 14
	.short _02224436 - _022243E0 - 2 ; case 15
	.short _02224436 - _022243E0 - 2 ; case 16
	.short _02224436 - _022243E0 - 2 ; case 17
	.short _02224438 - _022243E0 - 2 ; case 18
	.short _02224408 - _022243E0 - 2 ; case 19
_02224408:
	mov r5, #0
	b _02224438
_0222440C:
	ldr r0, [r7, #0x5c]
	ldr r1, [r7, #0x70]
	bl ov13_02223AE4
	cmp r0, r4
	ble _02224438
	add r4, r0, #0
	add r0, r6, #0
	bl OS_CancelAlarm
	mov r0, #0x13
	str r0, [sp]
	ldr r1, _022245B4 ; =0x000FFB10
	ldr r3, _022245B8 ; =ov13_02223ED4
	add r0, r6, #0
	mov r2, #0
	bl OS_SetAlarm
	b _02224438
_02224432:
	mov r5, #0
	b _02224438
_02224436:
	mov r5, #0
_02224438:
	bl ov13_02223E6C
	cmp r0, #0
	bne _022243D0
_02224440:
	cmp r5, #0
	bne _022243B0
_02224444:
	add r0, sp, #0x24
	bl OS_CancelAlarm
_0222444A:
	bl ov13_02223E6C
	cmp r0, #0
	bne _0222444A
	ldr r1, _022245A8 ; =ov13_0224DF30
	ldr r0, [r1, #0x10]
	cmp r0, #0
	beq _0222445C
_0222445A:
	b _02224566
_0222445C:
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x70]
	cmp r4, r0
	blt _0222446C
	ldr r0, [sp, #0x14]
	sub r4, r0, #6
	b _0222458E
_0222446C:
	ldr r0, [sp, #0x14]
	ldr r5, [r1, #0x5c]
	str r0, [sp, #0x18]
	cmp r4, #0
	ble _022244E2
	ble _022244E2
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #0xc]
	str r0, [sp, #4]
	add r0, #8
	add r6, r7, #0
	str r0, [sp, #4]
	add r6, #0x2c
_02224486:
	add r1, r5, #0
	ldr r0, [sp, #4]
	add r1, #0xc
	mov r2, #0x20
	bl memcpy
	ldrh r0, [r5, #0xa]
	str r0, [r7, #4]
	ldrh r0, [r5, #0xa]
	add r1, r7, r0
	mov r0, #0
	strb r0, [r1, #8]
	ldrh r1, [r5, #0x2c]
	mov r0, #0x10
	tst r0, r1
	beq _022244AA
	mov r0, #1
	b _022244AC
_022244AA:
	mov r0, #0
_022244AC:
	strh r0, [r7, #0x32]
	ldrb r0, [r5, #4]
	add r7, #0x30
	strb r0, [r6]
	ldrb r0, [r5, #5]
	strb r0, [r6, #1]
	ldrb r0, [r5, #6]
	strb r0, [r6, #2]
	ldrb r0, [r5, #7]
	strb r0, [r6, #3]
	ldrb r0, [r5, #8]
	strb r0, [r6, #4]
	ldrb r0, [r5, #9]
	add r5, #0xc0
	strb r0, [r6, #5]
	ldr r0, [sp, #4]
	add r6, #0x30
	add r0, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, r4
	blt _02224486
_022244E2:
	ldr r0, [sp, #0xc]
	str r4, [r0]
	ldr r0, _022245A8 ; =ov13_0224DF30
	ldr r0, [r0, #0x38]
	cmp r0, #1
	beq _0222453C
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	add r2, sp, #0x20
	bl ov13_02224164
	cmp r0, #0
	beq _0222453C
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x20]
	add r1, r0, #4
	mov r0, #0x30
	mul r0, r2
	add r4, r1, r0
	ldr r0, _022245A8 ; =ov13_0224DF30
	add r1, r4, #4
	str r2, [r0, #0x18]
	ldr r0, _022245BC ; =ov13_0224E440
	bl strcpy
	add r0, r4, #0
	add r4, #0x28
	ldrb r2, [r4]
	ldr r1, _022245C0 ; =ov13_0224E3E0
	add r0, #0x28
	strb r2, [r1]
	ldrb r2, [r0, #1]
	strb r2, [r1, #1]
	ldrb r2, [r0, #2]
	strb r2, [r1, #2]
	ldrb r2, [r0, #3]
	strb r2, [r1, #3]
	ldrb r2, [r0, #4]
	strb r2, [r1, #4]
	ldrb r0, [r0, #5]
	strb r0, [r1, #5]
	add r0, sp, #0x50
	bl ov13_02226D40
	b _02224566
_0222453C:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl memcpy
	ldr r0, _022245A8 ; =ov13_0224DF30
	mov r1, #2
	str r1, [r0, #0x38]
	bl ov13_02226F3C
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
_02224556:
	ldr r0, [sp, #0x1c]
	cmp r0, #0x1e
	bge _02224566
	ldr r0, _022245A8 ; =ov13_0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _02224566
	b _02224370
_02224566:
	ldr r0, [sp, #0x1c]
	cmp r0, #0x1e
	bge _02224578
	bl ov13_02226CBC
	ldr r1, _022245AC ; =ov13_02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	bls _0222457E
_02224578:
	mov r4, #2
	mvn r4, r4
	b _0222458E
_0222457E:
	ldr r0, _022245A8 ; =ov13_0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _0222458C
	mov r4, #7
	mvn r4, r4
	b _0222458E
_0222458C:
	mov r4, #1
_0222458E:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02224598
	bl ov13_02226CFC
_02224598:
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _022245A2
	bl ov13_02226CFC
_022245A2:
	add r0, r4, #0
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022245A8: .word ov13_0224DF30
_022245AC: .word ov13_02245A58
_022245B0: .word 0x0030BFFE
_022245B4: .word 0x000FFB10
_022245B8: .word ov13_02223ED4
_022245BC: .word ov13_0224E440
_022245C0: .word ov13_0224E3E0
	thumb_func_end ov13_02224330

	thumb_func_start ov13_022245C4
ov13_022245C4: ; 0x022245C4
	push {r3, lr}
	ldr r2, [sp, #8]
	str r1, [sp]
	add r1, r3, #0
	mov r3, #0
	bl SOC_SendTo
	cmp r0, #0
	bge _022245DA
	mov r0, #3
	mvn r0, r0
_022245DA:
	pop {r3, pc}
	thumb_func_end ov13_022245C4

	thumb_func_start ov13_022245DC
ov13_022245DC: ; 0x022245DC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	mov r1, #8
	add r0, sp, #4
	strb r1, [r0, #4]
	mov r1, #2
	strb r1, [r0, #5]
	sub r1, r1, #3
	str r1, [sp, #0xc]
	ldr r1, _02224614 ; =0x000001E6
	add r4, r2, #0
	strh r1, [r0, #6]
	bl SOCL_GetHostID
	add r1, sp, #4
	bl SOC_U32to4U8
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	add r3, r6, #0
	str r4, [sp]
	bl ov13_022245C4
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02224614: .word 0x000001E6
	thumb_func_end ov13_022245DC

	thumb_func_start ov13_02224618
ov13_02224618: ; 0x02224618
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _02224620 ; =ov13_022245DC
	bx r3
	.balign 4, 0
_02224620: .word ov13_022245DC
	thumb_func_end ov13_02224618

	thumb_func_start ov13_02224624
ov13_02224624: ; 0x02224624
	push {r3, r4, r5, r6}
	ldrh r5, [r0]
	mov r3, #0
	asr r4, r5, #8
	lsl r4, r4, #0x18
	lsr r6, r4, #0x18
	lsl r4, r5, #8
	mov r5, #0xff
	lsl r5, r5, #8
	and r4, r5
	orr r4, r6
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	str r4, [r1]
	ldrh r6, [r0, #2]
	asr r1, r6, #8
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	lsl r1, r6, #8
	and r1, r5
	orr r1, r4
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	add r1, r0, #6
	str r4, [r2]
	add r2, r1, r4
	add r4, r0, #0
	cmp r0, r2
	bhs _02224668
_0222465E:
	ldrb r1, [r4]
	add r4, r4, #1
	add r3, r3, r1
	cmp r4, r2
	blo _0222465E
_02224668:
	ldrh r5, [r2]
	lsl r1, r3, #0x10
	lsr r1, r1, #0x10
	asr r2, r5, #8
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	mov r2, #0xff
	lsl r3, r5, #8
	lsl r2, r2, #8
	and r2, r3
	orr r2, r4
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	cmp r1, r2
	beq _0222468C
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_0222468C:
	add r0, r0, #6
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02224624

	thumb_func_start ov13_02224694
ov13_02224694: ; 0x02224694
	push {r3, r4, r5, r6}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, r1
	blo _022246A4
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_022246A4:
	ldrh r5, [r0]
	asr r1, r5, #8
	lsl r1, r1, #0x18
	lsr r6, r1, #0x18
	lsl r1, r5, #8
	mov r5, #0xff
	lsl r5, r5, #8
	and r1, r5
	orr r1, r6
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [r2]
	ldrh r6, [r0, #2]
	add r0, r0, #4
	asr r1, r6, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	lsl r1, r6, #8
	and r1, r5
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r2, r1, #0x10
	str r2, [r3]
	add r2, #0xb
	mov r1, #7
	bic r2, r1
	sub r1, r2, #4
	add r1, r0, r1
	str r1, [r4]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02224694

	thumb_func_start ov13_022246E4
ov13_022246E4: ; 0x022246E4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r5, #8
	str r5, [sp]
	add r3, r2, #0
	ldrh r2, [r0]
	add r4, r1, #0
	add r0, sp, #0
	asr r1, r2, #8
	lsl r6, r2, #8
	mov r2, #0xff
	lsl r1, r1, #0x18
	lsl r2, r2, #8
	lsr r1, r1, #0x18
	and r2, r6
	orr r1, r2
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	add r1, r5, r1
	add r2, r4, #0
	bl ov13_02224694
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov13_022246E4

	thumb_func_start ov13_02224718
ov13_02224718: ; 0x02224718
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r3, #0
	add r6, r0, #0
	add r0, r7, #0
	sub r0, #8
	str r1, [sp, #4]
	lsl r0, r0, #0x10
	add r1, r2, #0
	mov r5, #0
	strb r5, [r1]
	lsr r0, r0, #0x10
	strb r5, [r1, #1]
	asr r2, r0, #8
	strb r5, [r1, #2]
	lsl r2, r2, #0x18
	strb r5, [r1, #3]
	lsr r3, r2, #0x18
	lsl r2, r0, #8
	mov r0, #0xff
	strb r5, [r1, #4]
	lsl r0, r0, #8
	strb r5, [r1, #5]
	and r0, r2
	strb r5, [r1, #6]
	orr r0, r3
	strb r5, [r1, #7]
	ldr r3, [sp, #0x20]
	add r4, r6, #0
	strh r0, [r1]
	cmp r3, #0
	beq _02224768
	mov r0, #0x10
	str r0, [sp]
	add r0, r6, #6
	add r2, r7, #0
	bl ov13_02225358
	add r7, #8
	b _02224770
_02224768:
	add r0, r6, #6
	add r2, r7, #0
	bl memcpy
_02224770:
	mov r0, #0
	strb r0, [r6]
	strb r0, [r6, #1]
	strb r0, [r6, #2]
	strb r0, [r6, #3]
	strb r0, [r6, #4]
	strb r0, [r6, #5]
	ldr r0, [sp, #4]
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	asr r0, r1, #8
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r1, r0
	orr r1, r2
	strh r1, [r6]
	lsl r1, r7, #0x10
	lsr r2, r1, #0x10
	asr r1, r2, #8
	lsl r1, r1, #0x18
	lsl r2, r2, #8
	lsr r1, r1, #0x18
	and r0, r2
	orr r0, r1
	strh r0, [r6, #2]
	add r0, r4, #6
	add r4, r0, r7
	add r1, r6, #0
	cmp r6, r4
	bhs _022247BC
_022247B2:
	ldrb r0, [r1]
	add r1, r1, #1
	add r5, r5, r0
	cmp r1, r4
	blo _022247B2
_022247BC:
	lsl r0, r5, #0x10
	lsr r1, r0, #0x10
	asr r0, r1, #8
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	strh r0, [r4]
	add r0, r4, #2
	sub r0, r0, r6
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_02224718

	thumb_func_start ov13_022247DC
ov13_022247DC: ; 0x022247DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	lsl r0, r1, #0x10
	add r4, r3, #0
	mov r3, #0
	lsr r0, r0, #0x10
	add r7, r2, #0
	strb r3, [r5]
	asr r1, r0, #8
	lsl r2, r0, #8
	mov r0, #0xff
	strb r3, [r5, #1]
	lsl r1, r1, #0x18
	lsl r0, r0, #8
	strb r3, [r5, #2]
	lsr r1, r1, #0x18
	and r2, r0
	orr r1, r2
	strb r3, [r5, #3]
	add r2, r4, #0
	strh r1, [r5]
	add r2, #0xb
	mov r1, #7
	bic r2, r1
	lsl r1, r4, #0x10
	sub r6, r2, #4
	lsr r2, r1, #0x10
	asr r1, r2, #8
	lsl r1, r1, #0x18
	lsl r2, r2, #8
	and r0, r2
	lsr r1, r1, #0x18
	orr r0, r1
	strh r0, [r5, #2]
	add r5, r5, #4
	add r0, r5, #0
	add r1, r3, #0
	add r2, r6, #0
	bl memset
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl memcpy
	add r0, r5, r6
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_022247DC

	thumb_func_start ov13_0222483C
ov13_0222483C: ; 0x0222483C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	strb r0, [r4, #4]
	strb r0, [r4, #5]
	strb r0, [r4, #6]
	strb r0, [r4, #7]
	add r0, r4, #0
	add r0, #8
	bl ov13_022247DC
	sub r0, r0, r4
	add r1, r0, #0
	sub r1, #8
	strh r1, [r4]
	pop {r4, pc}
	thumb_func_end ov13_0222483C

	thumb_func_start ov13_02224864
ov13_02224864: ; 0x02224864
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	str r1, [sp]
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov13_02224624
	mov r6, #0
	add r5, r0, #0
	add r7, r6, #0
	str r5, [sp, #8]
	str r6, [sp, #4]
	cmp r5, #0
	bne _02224886
	add sp, #0x1c
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02224886:
	ldr r0, [sp, #0x18]
	cmp r0, #1
	beq _02224892
	add sp, #0x1c
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02224892:
	ldr r4, [sp, #0x14]
	add r0, r5, #0
	add r0, #8
	str r0, [sp, #8]
	add r0, sp, #8
	add r1, r5, r4
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov13_02224694
	cmp r0, #0
	beq _02224912
_022248AA:
	ldr r1, [sp, #0x10]
	cmp r1, #1
	beq _022248BA
	cmp r1, #2
	beq _022248D2
	cmp r1, #5
	beq _022248EC
	b _02224902
_022248BA:
	ldrh r1, [r0]
	asr r0, r1, #8
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	b _02224902
_022248D2:
	ldrh r1, [r0]
	asr r0, r1, #8
	lsl r2, r1, #8
	mov r1, #0xff
	lsl r0, r0, #0x18
	lsl r1, r1, #8
	lsr r0, r0, #0x18
	and r1, r2
	orr r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	b _02224902
_022248EC:
	ldrh r1, [r0]
	asr r0, r1, #8
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
_02224902:
	add r0, sp, #8
	add r1, r5, r4
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov13_02224694
	cmp r0, #0
	bne _022248AA
_02224912:
	cmp r6, #1
	bne _0222491C
	ldr r0, [sp, #4]
	cmp r0, #1
	beq _02224922
_0222491C:
	add sp, #0x1c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02224922:
	cmp r7, #1
	blt _0222492C
	mov r1, #1
	ldr r0, [sp]
	b _02224930
_0222492C:
	ldr r0, [sp]
	mov r1, #0
_02224930:
	str r1, [r0]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov13_02224864

	thumb_func_start ov13_02224938
ov13_02224938: ; 0x02224938
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r2, #0
	add r1, sp, #8
	add r2, sp, #4
	add r4, r3, #0
	bl ov13_02224624
	add r1, r0, #0
	bne _02224954
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02224954:
	ldr r0, [sp, #8]
	cmp r0, r5
	beq _02224960
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_02224960:
	cmp r4, #0
	beq _0222497A
	mov r0, #0x10
	str r0, [sp]
	ldr r2, [sp, #4]
	add r0, r6, #0
	add r3, r4, #0
	bl ov13_02225510
	ldr r0, [sp, #4]
	sub r0, #8
	str r0, [sp, #4]
	b _02224982
_0222497A:
	ldr r2, [sp, #4]
	add r0, r6, #0
	bl memcpy
_02224982:
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov13_02224938

	thumb_func_start ov13_02224988
ov13_02224988: ; 0x02224988
	push {r4, lr}
	sub sp, #0x10
	mov r1, #1
	add r4, r0, #0
	add r2, sp, #4
	lsl r1, r1, #8
	add r0, sp, #4
	strh r1, [r0]
	ldr r3, _02224A10 ; =ov13_02242680
	add r2, #2
	mov r1, #7
_0222499E:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0222499E
	ldr r0, _02224A14 ; =ov13_02245A58
	mov r1, #1
	ldr r0, [r0]
	add r2, sp, #4
	mov r3, #2
	bl ov13_022247DC
	mov r1, #2
	add r2, sp, #4
	add r3, r1, #0
	bl ov13_022247DC
	ldr r1, _02224A18 ; =ov13_0224DF30
	ldr r1, [r1, #0x50]
	cmp r1, #0
	beq _022249D4
	mov r1, #5
	add r2, sp, #4
	mov r3, #2
	bl ov13_022247DC
_022249D4:
	add r2, sp, #4
	mov r1, #3
	add r2, #2
	mov r3, #7
	bl ov13_022247DC
	ldr r1, _02224A18 ; =ov13_0224DF30
	add r3, r0, #0
	ldr r1, [r1, #0x50]
	cmp r1, #0
	beq _022249F6
	ldr r2, _02224A1C ; =ov13_0224E3D8
	mov r1, #4
	mov r3, #6
	bl ov13_022247DC
	add r3, r0, #0
_022249F6:
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	ldr r4, _02224A14 ; =ov13_02245A58
	ldr r2, _02224A20 ; =ov13_0224E464
	ldr r4, [r4]
	mov r1, #2
	sub r3, r3, r4
	add r3, #8
	bl ov13_02224718
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_02224A10: .word ov13_02242680
_02224A14: .word ov13_02245A58
_02224A18: .word ov13_0224DF30
_02224A1C: .word ov13_0224E3D8
_02224A20: .word ov13_0224E464
	thumb_func_end ov13_02224988

	thumb_func_start ov13_02224A24
ov13_02224A24: ; 0x02224A24
	push {r3, lr}
	bl OS_GetMacAddress
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov13_02224A24

	thumb_func_start ov13_02224A30
ov13_02224A30: ; 0x02224A30
	push {r3, r4, lr}
	sub sp, #0x4c
	ldr r1, _02224B1C ; =ov13_02245B18
	add r4, r0, #0
	ldrb r0, [r1]
	add r2, r4, #0
	add r2, #0xc
	strb r0, [r4, #0xc]
	ldrb r0, [r1, #1]
	strb r0, [r2, #1]
	ldrb r0, [r1, #2]
	strb r0, [r2, #2]
	ldrb r0, [r1, #3]
	add r1, sp, #4
	add r1, #2
	strb r0, [r2, #3]
	ldr r0, _02224B20 ; =ov13_0224E3E0
	ldrb r2, [r0]
	strb r2, [r1]
	ldrb r2, [r0, #1]
	strb r2, [r1, #1]
	ldrb r2, [r0, #2]
	strb r2, [r1, #2]
	ldrb r2, [r0, #3]
	strb r2, [r1, #3]
	ldrb r2, [r0, #4]
	ldrb r0, [r0, #5]
	strb r2, [r1, #4]
	strb r0, [r1, #5]
	add r1, sp, #0
	ldrb r2, [r1, #6]
	mov r0, #0xfd
	and r0, r2
	strb r0, [r1, #6]
	add r0, sp, #0
	bl ov13_02224A24
	add r1, sp, #0
	ldrb r2, [r1]
	ldr r0, _02224B24 ; =ov13_0224E3D8
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	strb r2, [r0, #2]
	ldrb r2, [r1, #3]
	strb r2, [r0, #3]
	ldrb r2, [r1, #4]
	strb r2, [r0, #4]
	ldrb r2, [r1, #5]
	strb r2, [r0, #5]
	add r0, sp, #4
	add r0, #2
	mov r2, #6
	bl memcmp
	cmp r0, #0
	bgt _02224AC4
	add r1, sp, #0
	ldrb r0, [r1]
	strb r0, [r4]
	ldrb r0, [r1, #1]
	strb r0, [r4, #1]
	ldrb r0, [r1, #2]
	strb r0, [r4, #2]
	ldrb r0, [r1, #3]
	strb r0, [r4, #3]
	ldrb r0, [r1, #4]
	strb r0, [r4, #4]
	ldrb r0, [r1, #5]
	add r1, sp, #4
	add r1, #2
	strb r0, [r4, #5]
	b _02224AE2
_02224AC4:
	add r1, sp, #4
	add r1, #2
	ldrb r0, [r1]
	strb r0, [r4]
	ldrb r0, [r1, #1]
	strb r0, [r4, #1]
	ldrb r0, [r1, #2]
	strb r0, [r4, #2]
	ldrb r0, [r1, #3]
	strb r0, [r4, #3]
	ldrb r0, [r1, #4]
	strb r0, [r4, #4]
	ldrb r0, [r1, #5]
	add r1, sp, #0
	strb r0, [r4, #5]
_02224AE2:
	ldrb r0, [r1]
	strb r0, [r4, #6]
	ldrb r0, [r1, #1]
	strb r0, [r4, #7]
	ldrb r0, [r1, #2]
	strb r0, [r4, #8]
	ldrb r0, [r1, #3]
	strb r0, [r4, #9]
	ldrb r0, [r1, #4]
	strb r0, [r4, #0xa]
	ldrb r0, [r1, #5]
	strb r0, [r4, #0xb]
	ldr r0, _02224B28 ; =ov13_02245A58
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _02224B14
	add r0, sp, #0x2c
	add r1, sp, #0
	bl ov13_02226D40
	add r1, sp, #4
	add r0, sp, #0xc
	add r1, #2
	bl ov13_02226D40
_02224B14:
	mov r0, #1
	add sp, #0x4c
	pop {r3, r4, pc}
	nop
_02224B1C: .word ov13_02245B18
_02224B20: .word ov13_0224E3E0
_02224B24: .word ov13_0224E3D8
_02224B28: .word ov13_02245A58
	thumb_func_end ov13_02224A30

	thumb_func_start ov13_02224B2C
ov13_02224B2C: ; 0x02224B2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r1, r0, #0
	str r1, [sp, #4]
	add r1, #8
	str r1, [sp, #4]
	str r1, [sp, #0x14]
	mov r1, #0
	str r1, [sp]
	ldrh r1, [r0]
	add r3, sp, #0xc
	asr r0, r1, #8
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	add r0, sp, #0x14
	add r1, r2, r1
	add r2, sp, #0x10
	bl ov13_02224694
	add r5, r0, #0
	bne _02224B6C
	b _02224CDC
_02224B6C:
	ldr r2, [sp, #0x10]
	ldr r0, _02224CE4 ; =0x00000201
	sub r1, r2, r0
	cmp r1, #9
	bhi _02224BFA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02224B82: ; jump table
	.short _02224B96 - _02224B82 - 2 ; case 0
	.short _02224BB6 - _02224B82 - 2 ; case 1
	.short _02224BD2 - _02224B82 - 2 ; case 2
	.short _02224BFC - _02224B82 - 2 ; case 3
	.short _02224C26 - _02224B82 - 2 ; case 4
	.short _02224C42 - _02224B82 - 2 ; case 5
	.short _02224C42 - _02224B82 - 2 ; case 6
	.short _02224C42 - _02224B82 - 2 ; case 7
	.short _02224C42 - _02224B82 - 2 ; case 8
	.short _02224CA2 - _02224B82 - 2 ; case 9
_02224B96:
	ldr r3, _02224CE8 ; =ov13_0224E284
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r2, [sp, #0xc]
	add r0, r3, #0
	add r1, r5, #0
	bl memcpy
	mov r0, #1
	str r0, [sp]
	b _02224CC6
_02224BB6:
	ldrh r1, [r5]
	asr r0, r1, #8
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _02224CEC ; =ov13_0224E2B0
	str r1, [r0]
	b _02224CC6
_02224BD2:
	ldrh r3, [r5]
	ldr r1, _02224CF0 ; =ov13_0224E184
	mov r0, #0
	asr r2, r3, #8
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	mov r2, #0xff
	lsl r3, r3, #8
	lsl r2, r2, #8
	and r2, r3
	orr r2, r4
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	mov r2, #0x57
	lsl r2, r2, #2
_02224BF0:
	add r0, r0, #1
	str r3, [r1, r2]
	add r1, #0x28
	cmp r0, #4
	blt _02224BF0
_02224BFA:
	b _02224CC6
_02224BFC:
	ldrh r3, [r5]
	ldr r0, _02224CF0 ; =ov13_0224E184
	mov r1, #0
	asr r2, r3, #8
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	mov r2, #0xff
	lsl r3, r3, #8
	lsl r2, r2, #8
	and r2, r3
	orr r2, r4
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	mov r2, #0x16
	lsl r2, r2, #4
_02224C1A:
	add r1, r1, #1
	str r3, [r0, r2]
	add r0, #0x28
	cmp r1, #4
	blt _02224C1A
	b _02224CC6
_02224C26:
	ldrh r1, [r5]
	asr r0, r1, #8
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #8
	lsl r0, r0, #8
	and r0, r1
	orr r0, r2
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	ldr r0, _02224CEC ; =ov13_0224E2B0
	str r1, [r0, #4]
	b _02224CC6
_02224C42:
	add r0, r0, #5
	sub r2, r2, r0
	mov r0, #0x28
	mul r0, r2
	ldr r1, _02224CF4 ; =ov13_0224E2E8
	mov r2, #0x20
	add r0, r1, r0
	mov r1, #0
	bl memset
	ldr r0, _02224CEC ; =ov13_0224E2B0
	ldr r1, _02224CF8 ; =0x00000206
	ldr r0, [r0, #0x30]
	cmp r0, #1
	bne _02224C8C
	ldr r2, [sp, #0x10]
	ldr r0, _02224CF4 ; =ov13_0224E2E8
	sub r2, r2, r1
	mov r1, #0x28
	mul r1, r2
	add r4, r0, r1
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _02224CC6
	add r7, r6, #0
_02224C76:
	ldrsb r1, [r5, r7]
	add r0, r4, #0
	add r5, r5, #1
	bl ov13_02226D0C
	add r4, r4, r0
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	cmp r6, r0
	blt _02224C76
	b _02224CC6
_02224C8C:
	ldr r2, [sp, #0x10]
	ldr r0, _02224CF4 ; =ov13_0224E2E8
	sub r2, r2, r1
	mov r1, #0x28
	mul r1, r2
	add r0, r0, r1
	ldr r2, [sp, #0xc]
	add r1, r5, #0
	bl memcpy
	b _02224CC6
_02224CA2:
	ldr r3, _02224CFC ; =ov13_0224E380
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r2, [sp, #0xc]
	add r0, r3, #0
	add r1, r5, #0
	bl memcpy
_02224CC6:
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	add r0, sp, #0x14
	add r1, r2, r1
	add r2, sp, #0x10
	add r3, sp, #0xc
	bl ov13_02224694
	add r5, r0, #0
	beq _02224CDC
	b _02224B6C
_02224CDC:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224CE4: .word 0x00000201
_02224CE8: .word ov13_0224E284
_02224CEC: .word ov13_0224E2B0
_02224CF0: .word ov13_0224E184
_02224CF4: .word ov13_0224E2E8
_02224CF8: .word 0x00000206
_02224CFC: .word ov13_0224E380
	thumb_func_end ov13_02224B2C

	thumb_func_start ov13_02224D00
ov13_02224D00: ; 0x02224D00
	push {r4, r5, r6, r7}
	add r4, r2, #0
	mov r2, #0
	add r5, r1, #0
	add r3, r2, #0
	cmp r4, #0
	ble _02224DAE
	mov r7, #0x1f
_02224D10:
	ldrsb r1, [r5, r3]
	cmp r1, #0x63
	bgt _02224D66
	bge _02224D7E
	cmp r1, #0x61
	bgt _02224D60
	bge _02224D7E
	add r6, r1, #0
	sub r6, #0x30
	cmp r6, #0x16
	bhi _02224D8A
	add r6, r6, r6
	add r6, pc
	ldrh r6, [r6, #6]
	lsl r6, r6, #0x10
	asr r6, r6, #0x10
	add pc, r6
_02224D32: ; jump table
	.short _02224D78 - _02224D32 - 2 ; case 0
	.short _02224D78 - _02224D32 - 2 ; case 1
	.short _02224D78 - _02224D32 - 2 ; case 2
	.short _02224D78 - _02224D32 - 2 ; case 3
	.short _02224D78 - _02224D32 - 2 ; case 4
	.short _02224D78 - _02224D32 - 2 ; case 5
	.short _02224D78 - _02224D32 - 2 ; case 6
	.short _02224D78 - _02224D32 - 2 ; case 7
	.short _02224D78 - _02224D32 - 2 ; case 8
	.short _02224D78 - _02224D32 - 2 ; case 9
	.short _02224D8A - _02224D32 - 2 ; case 10
	.short _02224D8A - _02224D32 - 2 ; case 11
	.short _02224D8A - _02224D32 - 2 ; case 12
	.short _02224D8A - _02224D32 - 2 ; case 13
	.short _02224D8A - _02224D32 - 2 ; case 14
	.short _02224D8A - _02224D32 - 2 ; case 15
	.short _02224D8A - _02224D32 - 2 ; case 16
	.short _02224D84 - _02224D32 - 2 ; case 17
	.short _02224D84 - _02224D32 - 2 ; case 18
	.short _02224D84 - _02224D32 - 2 ; case 19
	.short _02224D84 - _02224D32 - 2 ; case 20
	.short _02224D84 - _02224D32 - 2 ; case 21
	.short _02224D84 - _02224D32 - 2 ; case 22
_02224D60:
	cmp r1, #0x62
	beq _02224D7E
	b _02224D8A
_02224D66:
	cmp r1, #0x65
	bgt _02224D72
	bge _02224D7E
	cmp r1, #0x64
	beq _02224D7E
	b _02224D8A
_02224D72:
	cmp r1, #0x66
	beq _02224D7E
	b _02224D8A
_02224D78:
	sub r1, #0x30
	add r2, r2, r1
	b _02224D90
_02224D7E:
	sub r1, #0x57
	add r2, r2, r1
	b _02224D90
_02224D84:
	sub r1, #0x37
	add r2, r2, r1
	b _02224D90
_02224D8A:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_02224D90:
	lsr r6, r3, #0x1f
	lsl r1, r3, #0x1f
	sub r1, r1, r6
	ror r1, r7
	add r1, r6, r1
	bne _02224DA0
	lsl r2, r2, #4
	b _02224DA8
_02224DA0:
	add r6, r3, r6
	asr r1, r6, #1
	strb r2, [r0, r1]
	mov r2, #0
_02224DA8:
	add r3, r3, #1
	cmp r3, r4
	blt _02224D10
_02224DAE:
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov13_02224D00

	thumb_func_start ov13_02224DB4
ov13_02224DB4: ; 0x02224DB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	mov r0, #1
	str r0, [sp]
	ldr r0, _02224F1C ; =ov13_0224E09C
	ldr r1, _02224F20 ; =ov13_0224E284
	bl strcpy
	ldr r1, _02224F24 ; =ov13_0224E2B0
	ldr r0, [r1]
	cmp r0, #3
	bls _02224DCE
	b _02224F0E
_02224DCE:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02224DDA: ; jump table
	.short _02224DE2 - _02224DDA - 2 ; case 0
	.short _02224DEA - _02224DDA - 2 ; case 1
	.short _02224EE2 - _02224DDA - 2 ; case 2
	.short _02224EF8 - _02224DDA - 2 ; case 3
_02224DE2:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #0
	str r1, [r0, #0xc]
	b _02224F14
_02224DEA:
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _02224DF8
	mov r0, #6
	mvn r0, r0
	str r0, [sp]
	b _02224F14
_02224DF8:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	ldr r6, _02224F2C ; =ov13_0224E2E8
	ldr r5, _02224F30 ; =ov13_0224E0C4
	str r1, [r0, #0x10]
	mov r7, #0
	add r4, sp, #4
_02224E04:
	add r0, sp, #4
	add r1, r6, #0
	mov r2, #0x20
	bl memcpy
	mov r1, #0
	add r0, sp, #0x24
	strb r1, [r0]
	add r0, sp, #4
	bl strlen
	cmp r0, #0x10
	bhi _02224E3C
	cmp r0, #0xa
	blo _02224E2E
	beq _02224E66
	cmp r0, #0xd
	beq _02224E78
	cmp r0, #0x10
	beq _02224EA4
	b _02224ED0
_02224E2E:
	cmp r0, #0
	bhi _02224E36
	beq _02224ED6
	b _02224ED0
_02224E36:
	cmp r0, #5
	beq _02224E4A
	b _02224ED0
_02224E3C:
	cmp r0, #0x1a
	bhi _02224E44
	beq _02224E92
	b _02224ED0
_02224E44:
	cmp r0, #0x20
	beq _02224EBE
	b _02224ED0
_02224E4A:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #1
	str r1, [r0, #0xc]
	ldrb r0, [r4]
	strb r0, [r5]
	ldrb r0, [r4, #1]
	strb r0, [r5, #1]
	ldrb r0, [r4, #2]
	strb r0, [r5, #2]
	ldrb r0, [r4, #3]
	strb r0, [r5, #3]
	ldrb r0, [r4, #4]
	strb r0, [r5, #4]
	b _02224ED6
_02224E66:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #1
	str r1, [r0, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0xa
	bl ov13_02224D00
	b _02224ED6
_02224E78:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #2
	str r1, [r0, #0xc]
	add r3, r4, #0
	add r2, r5, #0
	mov r1, #0xd
_02224E84:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02224E84
	b _02224ED6
_02224E92:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #2
	str r1, [r0, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x1a
	bl ov13_02224D00
	b _02224ED6
_02224EA4:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #3
	str r1, [r0, #0xc]
	add r3, r4, #0
	add r2, r5, #0
	mov r1, #0x10
_02224EB0:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02224EB0
	b _02224ED6
_02224EBE:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #3
	str r1, [r0, #0xc]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x20
	bl ov13_02224D00
	b _02224ED6
_02224ED0:
	mov r0, #6
	mvn r0, r0
	str r0, [sp]
_02224ED6:
	add r7, r7, #1
	add r6, #0x28
	add r5, #0x20
	cmp r7, #4
	blt _02224E04
	b _02224F14
_02224EE2:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #4
	ldr r4, _02224F34 ; =ov13_0224E144
	ldr r3, _02224F38 ; =ov13_0224E380
	str r1, [r0, #0xc]
	mov r2, #8
_02224EEE:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _02224EEE
	b _02224F14
_02224EF8:
	ldr r0, _02224F28 ; =ov13_0224E0B0
	mov r1, #5
	ldr r4, _02224F34 ; =ov13_0224E144
	ldr r3, _02224F38 ; =ov13_0224E380
	str r1, [r0, #0xc]
	mov r2, #8
_02224F04:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _02224F04
	b _02224F14
_02224F0E:
	mov r0, #6
	mvn r0, r0
	str r0, [sp]
_02224F14:
	ldr r0, [sp]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02224F1C: .word ov13_0224E09C
_02224F20: .word ov13_0224E284
_02224F24: .word ov13_0224E2B0
_02224F28: .word ov13_0224E0B0
_02224F2C: .word ov13_0224E2E8
_02224F30: .word ov13_0224E0C4
_02224F34: .word ov13_0224E144
_02224F38: .word ov13_0224E380
	thumb_func_end ov13_02224DB4

	thumb_func_start ov13_02224F3C
ov13_02224F3C: ; 0x02224F3C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r4, #0
	sub r0, r4, #5
	str r0, [sp, #8]
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #1
	str r4, [sp, #0xc]
	str r4, [sp, #4]
	add r6, r4, #0
	str r1, [r0, #0x1c]
	b _022252EE
_02224F54:
	mov r0, #0x7d
	lsl r0, r0, #2
	bl OS_Sleep
	ldr r0, _02225284 ; =ov13_0224DF30
	ldr r0, [r0, #0x1c]
	cmp r0, #0xa
	bls _02224F66
	b _022252EE
_02224F66:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02224F72: ; jump table
	.short _022252EE - _02224F72 - 2 ; case 0
	.short _02224F88 - _02224F72 - 2 ; case 1
	.short _02224FA8 - _02224F72 - 2 ; case 2
	.short _02224FBE - _02224F72 - 2 ; case 3
	.short _0222500C - _02224F72 - 2 ; case 4
	.short _02225074 - _02224F72 - 2 ; case 5
	.short _02225098 - _02224F72 - 2 ; case 6
	.short _02225142 - _02224F72 - 2 ; case 7
	.short _0222519E - _02224F72 - 2 ; case 8
	.short _02225226 - _02224F72 - 2 ; case 9
	.short _022252C4 - _02224F72 - 2 ; case 10
_02224F88:
	bl ov13_02224330
	str r0, [sp, #8]
	cmp r0, #1
	beq _02224F96
	mov r6, #1
	b _022252EE
_02224F96:
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x38]
	bl ov13_02226F3C
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #2
	str r1, [r0, #0x1c]
	b _022252EE
_02224FA8:
	bl ov13_02223FDC
	str r0, [sp, #8]
	cmp r0, #1
	beq _02224FB6
	mov r6, #1
	b _022252EE
_02224FB6:
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #3
	str r1, [r0, #0x1c]
	b _022252EE
_02224FBE:
	mov r0, #2
	add r1, r0, #0
	mov r2, #0
	bl SOC_Socket
	add r4, r0, #0
	bpl _02224FD6
	mov r0, #1
	mvn r0, r0
	str r0, [sp, #8]
	mov r6, #1
	b _022252EE
_02224FD6:
	add r5, sp, #0x24
	mov r1, #0
	str r1, [r5]
	str r1, [r5, #4]
	mov r3, #8
	add r2, sp, #0x10
	strb r3, [r2, #0x14]
	mov r3, #2
	strb r3, [r2, #0x15]
	ldr r3, _02225288 ; =0x000001E6
	strh r3, [r2, #0x16]
	str r1, [sp, #0x28]
	add r1, r5, #0
	bl SOC_Bind
	str r0, [sp, #8]
	cmp r0, #0
	bge _02225004
	mov r0, #1
	mvn r0, r0
	str r0, [sp, #8]
	mov r6, #1
	b _022252EE
_02225004:
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #4
	str r1, [r0, #0x1c]
	b _022252EE
_0222500C:
	bl ov13_02226CBC
	ldr r1, _0222528C ; =ov13_02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	blo _02225028
	add r0, r4, #0
	bl SOC_Close
	mov r0, #2
	mvn r0, r0
	str r0, [sp, #8]
	mov r6, #1
	b _022252EE
_02225028:
	mov r1, #8
	add r0, sp, #0x10
	strb r1, [r0, #0xc]
	ldr r0, _02225290 ; =ov13_0224E3F0
	add r1, sp, #0x1c
	bl ov13_02224A30
	add r0, sp, #0x1c
	mov r2, #2
	str r0, [sp]
	ldr r1, _02225294 ; =ov13_0224EC64
	add r0, r4, #0
	lsl r2, r2, #0xa
	mov r3, #4
	bl SOC_RecvFrom
	cmp r0, #0
	ble _02225126
	ldr r0, _02225294 ; =ov13_0224EC64
	ldr r1, _02225298 ; =ov13_0224DF80
	bl ov13_02224864
	cmp r0, #0
	beq _02225126
	bl ov13_02226CBC
	ldr r1, _0222529C ; =0x00007530
	add r1, r0, r1
	ldr r0, _0222528C ; =ov13_02245A58
	str r1, [r0, #0xc]
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #5
	str r1, [r0, #0x1c]
	mov r1, #4
	str r1, [r0, #0x38]
	bl ov13_02226F3C
	b _022252EE
_02225074:
	ldr r0, _02225294 ; =ov13_0224EC64
	bl ov13_02224988
	add r3, r0, #0
	ldr r0, _02225284 ; =ov13_0224DF30
	ldr r2, _02225294 ; =ov13_0224EC64
	str r3, [r0, #0x14]
	add r0, r4, #0
	add r1, sp, #0x1c
	bl ov13_02224618
	bl ov13_02226CBC
	str r0, [sp, #0xc]
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #6
	str r1, [r0, #0x1c]
	b _022252EE
_02225098:
	bl ov13_02226CBC
	ldr r1, _0222528C ; =ov13_02245A58
	ldr r1, [r1, #0xc]
	cmp r0, r1
	blo _022250B4
	add r0, r4, #0
	bl SOC_Close
	mov r0, #3
	mvn r0, r0
	str r0, [sp, #8]
	mov r6, #1
	b _022252EE
_022250B4:
	add r0, sp, #0x1c
	mov r2, #2
	str r0, [sp]
	ldr r1, _02225294 ; =ov13_0224EC64
	add r0, r4, #0
	lsl r2, r2, #0xa
	mov r3, #4
	bl SOC_RecvFrom
	cmp r0, #0
	ble _02225128
	ldr r0, _02225294 ; =ov13_0224EC64
	ldr r2, _022252A0 ; =ov13_0224E464
	ldr r3, _02225290 ; =ov13_0224E3F0
	mov r1, #3
	bl ov13_02224938
	cmp r0, #0
	beq _02225128
	ldr r0, _022252A0 ; =ov13_0224E464
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov13_022246E4
	add r5, r0, #0
	ldr r1, [sp, #0x18]
	ldr r0, _022252A4 ; =0x00000101
	cmp r1, r0
	bne _02225126
	bl ov13_02226CBC
	ldr r2, _022252A8 ; =ov13_0224E400
	str r0, [sp, #0x10]
	mov r1, #8
_022250F8:
	ldrb r0, [r5]
	add r5, r5, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _022250F8
	ldr r0, _022252AC ; =ov13_0224E408
	add r1, sp, #0x10
	mov r2, #4
	bl ov13_02226C94
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #7
	str r1, [r0, #0x1c]
	mov r1, #5
	str r1, [r0, #0x38]
	ldr r0, _0222528C ; =ov13_02245A58
	sub r1, r1, #6
	str r1, [r0, #0xc]
	bl ov13_02226F3C
_02225126:
	b _022252EE
_02225128:
	bl ov13_02226CBC
	mov r2, #0xfa
	ldr r1, [sp, #0xc]
	lsl r2, r2, #2
	add r1, r1, r2
	cmp r0, r1
	bhs _0222513A
	b _022252EE
_0222513A:
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #5
	str r1, [r0, #0x1c]
	b _022252EE
_02225142:
	ldr r0, _022252A0 ; =ov13_0224E464
	ldr r1, _022252B0 ; =0x00000102
	ldr r2, _022252AC ; =ov13_0224E408
	mov r3, #8
	bl ov13_0222483C
	ldr r3, _02225284 ; =ov13_0224DF30
	ldr r2, _022252A0 ; =ov13_0224E464
	str r0, [r3, #0x34]
	ldr r0, _02225290 ; =ov13_0224E3F0
	mov r1, #4
	str r0, [sp]
	ldr r0, _02225294 ; =ov13_0224EC64
	ldr r3, [r3, #0x34]
	bl ov13_02224718
	add r3, r0, #0
	ldr r0, _02225284 ; =ov13_0224DF30
	ldr r2, _02225294 ; =ov13_0224EC64
	str r3, [r0, #0x14]
	add r0, r4, #0
	add r1, sp, #0x1c
	bl ov13_02224618
	bl ov13_02226CBC
	str r0, [sp, #0xc]
	mov r0, #0
	mov r5, #0x12
	ldr r7, _022252B4 ; =ov13_0224E184
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	mov ip, r5
_02225186:
	stmia r7!, {r0, r1, r2, r3}
	mov r5, ip
	sub r5, r5, #1
	stmia r7!, {r0, r1, r2, r3}
	mov ip, r5
	bne _02225186
	stmia r7!, {r0, r1, r2, r3}
	str r0, [r7]
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #8
	str r1, [r0, #0x1c]
	b _022252EE
_0222519E:
	add r0, sp, #0x1c
	mov r2, #2
	str r0, [sp]
	ldr r1, _02225294 ; =ov13_0224EC64
	add r0, r4, #0
	lsl r2, r2, #0xa
	mov r3, #4
	bl SOC_RecvFrom
	cmp r0, #0
	ble _022251F4
	ldr r0, _02225294 ; =ov13_0224EC64
	ldr r2, _022252A0 ; =ov13_0224E464
	ldr r3, _022252A8 ; =ov13_0224E400
	mov r1, #5
	bl ov13_02224938
	ldr r1, _02225284 ; =ov13_0224DF30
	cmp r0, #0
	str r0, [r1, #0x34]
	beq _022251F4
	ldr r0, _022252A0 ; =ov13_0224E464
	bl ov13_02224B2C
	cmp r0, #0
	beq _022251F4
	ldr r1, _022252B8 ; =ov13_0224E270
	mov r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _022251E2
	mov r1, #1
	ldr r0, _02225284 ; =ov13_0224DF30
	b _022251E6
_022251E2:
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #0
_022251E6:
	strb r1, [r0]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #9
	str r1, [r0, #0x1c]
	b _022252EE
_022251F4:
	bl ov13_02226CBC
	mov r2, #0xfa
	ldr r1, [sp, #0xc]
	lsl r2, r2, #2
	add r1, r1, r2
	cmp r0, r1
	blo _022252EE
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0xa
	blt _0222521E
	add r0, r4, #0
	bl SOC_Close
	mov r0, #1
	mvn r0, r0
	str r0, [sp, #8]
	mov r6, #1
	b _022252EE
_0222521E:
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #7
	str r1, [r0, #0x1c]
	b _022252EE
_02225226:
	ldr r0, _022252A0 ; =ov13_0224E464
	ldr r1, _022252BC ; =0x00000301
	ldr r2, _022252C0 ; =ov13_0224DF30
	mov r3, #1
	bl ov13_0222483C
	ldr r3, _02225284 ; =ov13_0224DF30
	ldr r2, _022252A0 ; =ov13_0224E464
	str r0, [r3, #0x34]
	ldr r0, _022252A8 ; =ov13_0224E400
	mov r1, #6
	str r0, [sp]
	ldr r0, _02225294 ; =ov13_0224EC64
	ldr r3, [r3, #0x34]
	bl ov13_02224718
	ldr r1, _02225284 ; =ov13_0224DF30
	str r0, [r1, #0x14]
	bl ov13_02223DE0
	cmp r0, #7
	beq _02225268
	bl ov13_02226CBC
	mov r1, #0xfa
	lsl r1, r1, #2
	add r0, r0, r1
	str r0, [sp, #0xc]
	mov r0, #0xa
	ldr r1, _02225284 ; =ov13_0224DF30
	str r0, [sp, #4]
	str r0, [r1, #0x1c]
	b _022252EE
_02225268:
	ldr r3, _02225284 ; =ov13_0224DF30
	ldr r2, _02225294 ; =ov13_0224EC64
	ldr r3, [r3, #0x14]
	add r0, r4, #0
	add r1, sp, #0x1c
	bl ov13_02224618
	bl ov13_02226CBC
	str r0, [sp, #0xc]
	ldr r0, _02225284 ; =ov13_0224DF30
	mov r1, #0xa
	str r1, [r0, #0x1c]
	b _022252EE
	.balign 4, 0
_02225284: .word ov13_0224DF30
_02225288: .word 0x000001E6
_0222528C: .word ov13_02245A58
_02225290: .word ov13_0224E3F0
_02225294: .word ov13_0224EC64
_02225298: .word ov13_0224DF80
_0222529C: .word 0x00007530
_022252A0: .word ov13_0224E464
_022252A4: .word 0x00000101
_022252A8: .word ov13_0224E400
_022252AC: .word ov13_0224E408
_022252B0: .word 0x00000102
_022252B4: .word ov13_0224E184
_022252B8: .word ov13_0224E270
_022252BC: .word 0x00000301
_022252C0: .word ov13_0224DF30
_022252C4:
	bl ov13_02226CBC
	mov r2, #0xfa
	ldr r1, [sp, #0xc]
	lsl r2, r2, #2
	add r1, r1, r2
	cmp r0, r1
	blo _022252EE
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0xa
	blt _022252E8
	mov r6, #1
	bl ov13_02224DB4
	str r0, [sp, #8]
	b _022252EE
_022252E8:
	ldr r0, _0222531C ; =ov13_0224DF30
	mov r1, #9
	str r1, [r0, #0x1c]
_022252EE:
	cmp r6, #0
	bne _022252FC
	ldr r0, _0222531C ; =ov13_0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bne _022252FC
	b _02224F54
_022252FC:
	cmp r4, #0
	beq _02225306
	add r0, r4, #0
	bl SOC_Close
_02225306:
	ldr r0, _0222531C ; =ov13_0224DF30
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _02225314
	mov r0, #7
	mvn r0, r0
	str r0, [sp, #8]
_02225314:
	ldr r0, [sp, #8]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0222531C: .word ov13_0224DF30
	thumb_func_end ov13_02224F3C

	thumb_func_start ov13_02225320
ov13_02225320: ; 0x02225320
	push {r4, lr}
	bl ov13_02224F3C
	add r4, r0, #0
	ldr r0, _02225350 ; =ov13_0224DF30
	str r4, [r0, #0x78]
	bl ov13_02224100
	cmp r4, #1
	bne _0222533A
	mov r1, #6
	ldr r0, _02225350 ; =ov13_0224DF30
	b _0222533E
_0222533A:
	ldr r0, _02225350 ; =ov13_0224DF30
	mov r1, #7
_0222533E:
	str r1, [r0, #0x38]
	mov r1, #0
	ldr r0, _02225354 ; =ov13_02245A58
	mvn r1, r1
	str r1, [r0, #0xc]
	bl ov13_02226F3C
	pop {r4, pc}
	nop
_02225350: .word ov13_0224DF30
_02225354: .word ov13_02245A58
	thumb_func_end ov13_02225320

	thumb_func_start ov13_02225358
ov13_02225358: ; 0x02225358
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1a8
	str r0, [sp]
	ldr r0, _0222550C ; =0xA6A6A6A6
	add r4, r2, #0
	add r5, r1, #0
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	mov r0, #7
	add r1, r4, #0
	tst r1, r0
	bne _02225376
	ldr r2, [sp, #0x1c0]
	tst r0, r2
	beq _0222537C
_02225376:
	add sp, #0x1a8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222537C:
	lsr r0, r4, #3
	str r0, [sp, #0x14]
	cmp r0, #2
	bge _0222538A
	add sp, #0x1a8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222538A:
	add r0, sp, #0x68
	add r1, r3, #0
	lsl r2, r2, #3
	bl ov13_02225710
	str r0, [sp, #0x1c]
	ldr r0, [sp]
	add r1, r5, #0
	add r0, #8
	add r2, r4, #0
	bl memcpy
	add r3, sp, #0x58
	add r2, sp, #0x48
	mov r1, #8
_022253A8:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _022253A8
	mov r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	asr r0, r0, #0x1f
	str r0, [sp, #0x18]
_022253BE:
	ldr r0, [sp, #0x14]
	mov r4, #1
	cmp r0, #1
	bge _022253C8
	b _022254E4
_022253C8:
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x18]
	asr r3, r2, #0x1f
	bl _ll_mul
	str r0, [sp, #0xc]
	mov r0, #0
	str r1, [sp, #8]
	str r0, [sp, #0x28]
	mov r0, #0
	mov r1, #0
	str r0, [sp, #0x30]
	add r0, r1, #0
	orr r0, r1
	str r0, [sp, #0x40]
_022253E6:
	ldr r0, [sp]
	lsl r1, r4, #3
	add r5, r0, r1
	add r3, r5, #0
	add r2, sp, #0x60
	mov r1, #8
_022253F2:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _022253F2
	add r2, sp, #0x58
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x68
	add r3, r2, #0
	bl ov13_02225B58
	ldr r0, [sp, #0xc]
	asr r1, r4, #0x1f
	add r3, r4, r0
	ldr r0, [sp, #8]
	adc r1, r0
	mov r0, #0xff
	lsl r0, r0, #0x18
	and r0, r1
	lsr r0, r0, #0x18
	str r0, [sp, #0x24]
	mov r0, #0xff
	lsl r0, r0, #0x10
	and r0, r1
	lsr r0, r0, #8
	str r0, [sp, #0x2c]
	mov r0, #0xff
	lsl r0, r0, #8
	mov r2, #0
	and r0, r1
	and r2, r3
	lsl r6, r0, #8
	lsr r2, r2, #0x18
	str r2, [sp, #0x34]
	orr r2, r6
	lsr r0, r0, #0x18
	str r2, [sp, #0x34]
	str r0, [sp, #0x38]
	mov r0, #0xff
	mov r2, #0
	and r0, r1
	and r2, r3
	lsl r6, r0, #0x18
	lsr r2, r2, #8
	str r2, [sp, #0x44]
	orr r2, r6
	lsr r0, r0, #8
	str r2, [sp, #0x44]
	str r0, [sp, #0x3c]
	mov r0, #0
	add r2, r1, #0
	and r2, r0
	mov r0, #0xff
	lsl r0, r0, #0x18
	and r0, r3
	lsr r6, r0, #0x18
	lsl r0, r0, #8
	mov ip, r0
	mov r0, #0
	and r1, r0
	mov r0, #0xff
	lsl r0, r0, #0x10
	lsl r2, r2, #8
	and r0, r3
	orr r2, r6
	lsr r6, r0, #8
	lsl r7, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #0x18
	and r0, r3
	orr r1, r6
	lsl r6, r0, #0x18
	mov r0, #0xff
	lsl r0, r0, #8
	and r0, r3
	lsl r0, r0, #8
	orr r0, r6
	orr r1, r0
	ldr r0, [sp, #0x40]
	add r3, r7, #0
	orr r3, r0
	mov r0, ip
	orr r1, r2
	add r2, r0, #0
	ldr r0, [sp, #0x3c]
	orr r2, r3
	orr r1, r0
	ldr r0, [sp, #0x44]
	orr r2, r0
	ldr r0, [sp, #0x38]
	orr r1, r0
	ldr r0, [sp, #0x34]
	orr r2, r0
	ldr r0, [sp, #0x30]
	orr r1, r0
	ldr r0, [sp, #0x2c]
	orr r2, r0
	ldr r0, [sp, #0x28]
	orr r1, r0
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x54]
	orr r0, r2
	str r0, [sp, #0x50]
	add r0, sp, #0x58
	add r1, sp, #0x50
	add r2, r0, #0
	bl ov13_022256C8
	add r2, sp, #0x60
	mov r1, #8
_022254D0:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r5]
	add r5, r5, #1
	sub r1, r1, #1
	bne _022254D0
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	cmp r4, r0
	ble _022253E6
_022254E4:
	ldr r0, [sp, #0x20]
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #6
	bge _022254F0
	b _022253BE
_022254F0:
	add r3, sp, #0x58
	mov r2, #8
_022254F4:
	ldrb r1, [r3]
	ldr r0, [sp]
	add r3, r3, #1
	strb r1, [r0]
	add r0, r0, #1
	str r0, [sp]
	sub r2, r2, #1
	bne _022254F4
	mov r0, #1
	add sp, #0x1a8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222550C: .word 0xA6A6A6A6
	thumb_func_end ov13_02225358

	thumb_func_start ov13_02225510
ov13_02225510: ; 0x02225510
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x1a8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, _022256C4 ; =0xA6A6A6A6
	add r4, r2, #0
	add r5, r1, #0
	str r0, [sp, #0x48]
	str r0, [sp, #0x4c]
	mov r0, #7
	add r1, r4, #0
	tst r1, r0
	bne _02225532
	ldr r2, [sp, #0x1c0]
	tst r0, r2
	beq _02225538
_02225532:
	add sp, #0x1a8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02225538:
	sub r0, r4, #1
	lsr r0, r0, #3
	str r0, [sp, #0x14]
	cmp r0, #2
	bge _02225548
	add sp, #0x1a8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02225548:
	add r0, sp, #0x68
	add r1, r3, #0
	lsl r2, r2, #3
	bl ov13_022259C8
	str r0, [sp, #0x20]
	add r3, sp, #0x58
	add r2, r5, #0
	mov r1, #8
_0222555A:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r3]
	add r3, r3, #1
	sub r1, r1, #1
	bne _0222555A
	add r5, #8
	ldr r0, [sp]
	add r1, r5, #0
	sub r2, r4, #1
	bl memcpy
	mov r0, #5
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x14]
	asr r0, r0, #0x1f
	str r0, [sp, #0x18]
_0222557C:
	ldr r4, [sp, #0x14]
	add r0, r4, #0
	cmp r0, #0
	bgt _02225586
	b _022256A0
_02225586:
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x18]
	asr r3, r2, #0x1f
	bl _ll_mul
	str r0, [sp, #0xc]
	mov r0, #0
	str r1, [sp, #8]
	str r0, [sp, #0x2c]
	mov r0, #0
	mov r1, #0
	str r0, [sp, #0x34]
	add r0, r1, #0
	orr r0, r1
	str r0, [sp, #0x40]
_022255A4:
	ldr r0, [sp, #0xc]
	asr r1, r4, #0x1f
	add r5, r4, r0
	ldr r0, [sp, #8]
	adc r1, r0
	mov r0, #0xff
	lsl r0, r0, #0x18
	and r0, r1
	lsr r0, r0, #0x18
	str r0, [sp, #0x28]
	mov r0, #0xff
	lsl r0, r0, #0x10
	and r0, r1
	lsr r0, r0, #8
	str r0, [sp, #0x30]
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, r1, #0
	and r2, r0
	mov r0, #0
	add r3, r5, #0
	and r3, r0
	lsl r0, r2, #8
	lsr r3, r3, #0x18
	orr r3, r0
	lsr r0, r2, #0x18
	str r0, [sp, #0x38]
	mov r0, #0xff
	mov r2, #0
	and r0, r1
	and r2, r5
	lsl r6, r0, #0x18
	lsr r2, r2, #8
	str r2, [sp, #0x44]
	orr r2, r6
	lsr r0, r0, #8
	str r2, [sp, #0x44]
	str r0, [sp, #0x3c]
	mov r0, #0
	add r2, r1, #0
	and r2, r0
	mov r0, #0xff
	lsl r0, r0, #0x18
	and r0, r5
	lsr r6, r0, #0x18
	lsl r0, r0, #8
	mov ip, r0
	mov r0, #0
	and r1, r0
	mov r0, #0xff
	lsl r0, r0, #0x10
	lsl r2, r2, #8
	and r0, r5
	orr r2, r6
	lsr r6, r0, #8
	lsl r7, r0, #0x18
	mov r0, #0xff
	lsl r1, r1, #0x18
	and r0, r5
	orr r1, r6
	lsl r6, r0, #0x18
	mov r0, #0xff
	lsl r0, r0, #8
	and r0, r5
	lsl r0, r0, #8
	orr r0, r6
	orr r1, r0
	ldr r0, [sp, #0x40]
	add r5, r7, #0
	orr r5, r0
	mov r0, ip
	orr r1, r2
	add r2, r0, #0
	ldr r0, [sp, #0x3c]
	orr r2, r5
	orr r1, r0
	ldr r0, [sp, #0x44]
	orr r2, r0
	ldr r0, [sp, #0x38]
	orr r2, r3
	orr r1, r0
	ldr r0, [sp, #0x34]
	orr r1, r0
	ldr r0, [sp, #0x30]
	orr r2, r0
	ldr r0, [sp, #0x2c]
	orr r1, r0
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x54]
	orr r0, r2
	str r0, [sp, #0x50]
	add r0, sp, #0x58
	add r1, sp, #0x50
	add r2, r0, #0
	bl ov13_022256C8
	sub r0, r4, #1
	lsl r1, r0, #3
	ldr r0, [sp]
	add r2, sp, #0x60
	add r5, r0, r1
	add r3, r5, #0
	mov r1, #8
_02225672:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _02225672
	add r2, sp, #0x58
	ldr r1, [sp, #0x20]
	add r0, sp, #0x68
	add r3, r2, #0
	bl ov13_02225F14
	add r2, sp, #0x60
	mov r1, #8
_0222568E:
	ldrb r0, [r2]
	add r2, r2, #1
	strb r0, [r5]
	add r5, r5, #1
	sub r1, r1, #1
	bne _0222568E
	sub r4, r4, #1
	cmp r4, #0
	bgt _022255A4
_022256A0:
	ldr r0, [sp, #0x24]
	sub r0, r0, #1
	str r0, [sp, #0x24]
	bmi _022256AA
	b _0222557C
_022256AA:
	add r0, sp, #0x48
	add r1, sp, #0x58
	mov r2, #8
	bl memcmp
	cmp r0, #0
	beq _022256BC
	mov r0, #0
	str r0, [sp, #0x1c]
_022256BC:
	ldr r0, [sp, #0x1c]
	add sp, #0x1a8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022256C4: .word 0xA6A6A6A6
	thumb_func_end ov13_02225510

	thumb_func_start ov13_022256C8
ov13_022256C8: ; 0x022256C8
	push {r3, r4}
	ldrb r4, [r0]
	ldrb r3, [r1]
	eor r3, r4
	strb r3, [r2]
	ldrb r4, [r0, #1]
	ldrb r3, [r1, #1]
	eor r3, r4
	strb r3, [r2, #1]
	ldrb r4, [r0, #2]
	ldrb r3, [r1, #2]
	eor r3, r4
	strb r3, [r2, #2]
	ldrb r4, [r0, #3]
	ldrb r3, [r1, #3]
	eor r3, r4
	strb r3, [r2, #3]
	ldrb r4, [r0, #4]
	ldrb r3, [r1, #4]
	eor r3, r4
	strb r3, [r2, #4]
	ldrb r4, [r0, #5]
	ldrb r3, [r1, #5]
	eor r3, r4
	strb r3, [r2, #5]
	ldrb r4, [r0, #6]
	ldrb r3, [r1, #6]
	eor r3, r4
	strb r3, [r2, #6]
	ldrb r3, [r0, #7]
	ldrb r0, [r1, #7]
	eor r0, r3
	strb r0, [r2, #7]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov13_022256C8

	thumb_func_start ov13_02225710
ov13_02225710: ; 0x02225710
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r3, r1, #0
	add r1, r2, #0
	mov r2, #0
	str r2, [sp]
	ldrb r2, [r3, #2]
	ldrb r6, [r3, #1]
	ldrb r5, [r3, #3]
	lsl r4, r2, #8
	ldrb r2, [r3]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r4
	eor r2, r5
	str r2, [r0]
	ldrb r2, [r3, #6]
	ldrb r6, [r3, #5]
	ldrb r5, [r3, #7]
	lsl r4, r2, #8
	ldrb r2, [r3, #4]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r4
	eor r2, r5
	str r2, [r0, #4]
	ldrb r2, [r3, #0xa]
	ldrb r6, [r3, #9]
	ldrb r5, [r3, #0xb]
	lsl r4, r2, #8
	ldrb r2, [r3, #8]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r4
	eor r2, r5
	str r2, [r0, #8]
	ldrb r2, [r3, #0xe]
	ldrb r6, [r3, #0xd]
	ldrb r5, [r3, #0xf]
	lsl r4, r2, #8
	ldrb r2, [r3, #0xc]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r4
	eor r2, r5
	str r2, [r0, #0xc]
	cmp r1, #0x80
	bne _022257F4
	ldr r5, _022259C0 ; =ov13_02242688
	ldr r2, _022259C4 ; =ov13_022442B0
_0222577C:
	ldr r4, [r0, #0xc]
	ldr r3, [r5]
	lsr r1, r4, #0x18
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r5, r5, #4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #8]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x16
	ldr r6, [r2, r1]
	mov r1, #0xff
	lsl r1, r1, #8
	add r7, r6, #0
	and r7, r1
	ldr r1, [r0]
	str r1, [sp, #4]
	lsr r1, r4, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x16
	ldr r6, [r2, r1]
	mov r1, #0xff
	lsl r1, r1, #0x18
	lsr r4, r4, #8
	and r6, r1
	ldr r1, [sp, #4]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	eor r1, r6
	ldr r6, [r2, r4]
	mov r4, #0xff
	lsl r4, r4, #0x10
	and r4, r6
	eor r1, r4
	add r4, r7, #0
	eor r4, r1
	ldr r1, [sp, #8]
	eor r1, r4
	eor r3, r1
	str r3, [r0, #0x10]
	ldr r1, [r0, #4]
	eor r3, r1
	str r3, [r0, #0x14]
	ldr r1, [r0, #8]
	eor r3, r1
	str r3, [r0, #0x18]
	ldr r1, [r0, #0xc]
	eor r1, r3
	str r1, [r0, #0x1c]
	ldr r1, [sp]
	add r1, r1, #1
	str r1, [sp]
	cmp r1, #0xa
	blt _022257F0
	add sp, #0x18
	mov r0, #0xa
	pop {r3, r4, r5, r6, r7, pc}
_022257F0:
	add r0, #0x10
	b _0222577C
_022257F4:
	ldrb r2, [r3, #0x12]
	ldrb r6, [r3, #0x11]
	ldrb r5, [r3, #0x13]
	lsl r4, r2, #8
	ldrb r2, [r3, #0x10]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r4
	eor r2, r5
	str r2, [r0, #0x10]
	ldrb r2, [r3, #0x16]
	ldrb r6, [r3, #0x15]
	ldrb r5, [r3, #0x17]
	lsl r4, r2, #8
	ldrb r2, [r3, #0x14]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r4
	eor r2, r5
	str r2, [r0, #0x14]
	cmp r1, #0xc0
	bne _022258B0
	ldr r5, _022259C0 ; =ov13_02242688
	ldr r3, _022259C4 ; =ov13_022442B0
_02225828:
	ldr r4, [r0, #0x14]
	ldr r6, [r5]
	lsr r1, r4, #0x18
	lsl r1, r1, #2
	ldr r1, [r3, r1]
	add r5, r5, #4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0xc]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x16
	ldr r2, [r3, r1]
	mov r1, #0xff
	lsl r1, r1, #8
	add r7, r2, #0
	and r7, r1
	ldr r1, [r0]
	mov lr, r1
	lsr r1, r4, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x16
	ldr r2, [r3, r1]
	mov r1, #0xff
	lsl r1, r1, #0x18
	and r1, r2
	mov r2, lr
	eor r1, r2
	lsr r2, r4, #8
	lsl r2, r2, #0x18
	lsr r2, r2, #0x16
	ldr r4, [r3, r2]
	mov r2, #0xff
	lsl r2, r2, #0x10
	and r2, r4
	eor r1, r2
	add r2, r7, #0
	eor r2, r1
	ldr r1, [sp, #0xc]
	eor r1, r2
	add r2, r6, #0
	eor r2, r1
	str r2, [r0, #0x18]
	ldr r1, [r0, #4]
	eor r2, r1
	str r2, [r0, #0x1c]
	ldr r1, [r0, #8]
	eor r2, r1
	str r2, [r0, #0x20]
	ldr r1, [r0, #0xc]
	eor r1, r2
	str r1, [r0, #0x24]
	ldr r1, [sp]
	add r1, r1, #1
	str r1, [sp]
	cmp r1, #8
	blt _0222589E
	add sp, #0x18
	mov r0, #0xc
	pop {r3, r4, r5, r6, r7, pc}
_0222589E:
	ldr r2, [r0, #0x10]
	ldr r1, [r0, #0x24]
	eor r2, r1
	str r2, [r0, #0x28]
	ldr r1, [r0, #0x14]
	eor r1, r2
	str r1, [r0, #0x2c]
	add r0, #0x18
	b _02225828
_022258B0:
	ldrb r2, [r3, #0x1a]
	ldrb r6, [r3, #0x19]
	ldrb r5, [r3, #0x1b]
	lsl r4, r2, #8
	ldrb r2, [r3, #0x18]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r4
	eor r2, r5
	str r2, [r0, #0x18]
	ldrb r2, [r3, #0x1e]
	ldrb r5, [r3, #0x1f]
	lsl r4, r2, #8
	ldrb r2, [r3, #0x1c]
	ldrb r3, [r3, #0x1d]
	lsl r2, r2, #0x18
	lsl r3, r3, #0x10
	eor r2, r3
	eor r2, r4
	eor r2, r5
	str r2, [r0, #0x1c]
	mov r2, #1
	lsl r2, r2, #8
	cmp r1, r2
	bne _022259BA
	ldr r5, _022259C0 ; =ov13_02242688
	ldr r3, _022259C4 ; =ov13_022442B0
_022258E8:
	ldr r4, [r0, #0x1c]
	ldr r6, [r5]
	lsr r1, r4, #0x18
	lsl r1, r1, #2
	ldr r1, [r3, r1]
	add r5, r5, #4
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #0x10]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x16
	ldr r2, [r3, r1]
	mov r1, #0xff
	lsl r1, r1, #8
	add r7, r2, #0
	and r7, r1
	ldr r1, [r0]
	mov ip, r1
	lsr r1, r4, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x16
	ldr r2, [r3, r1]
	mov r1, #0xff
	lsl r1, r1, #0x18
	and r1, r2
	mov r2, ip
	eor r1, r2
	lsr r2, r4, #8
	lsl r2, r2, #0x18
	lsr r2, r2, #0x16
	ldr r4, [r3, r2]
	mov r2, #0xff
	lsl r2, r2, #0x10
	and r2, r4
	eor r1, r2
	add r2, r7, #0
	eor r2, r1
	ldr r1, [sp, #0x10]
	eor r1, r2
	add r2, r6, #0
	eor r2, r1
	str r2, [r0, #0x20]
	ldr r1, [r0, #4]
	eor r2, r1
	str r2, [r0, #0x24]
	ldr r1, [r0, #8]
	eor r2, r1
	str r2, [r0, #0x28]
	ldr r1, [r0, #0xc]
	eor r1, r2
	str r1, [r0, #0x2c]
	ldr r1, [sp]
	add r1, r1, #1
	str r1, [sp]
	cmp r1, #7
	blt _0222595E
	add sp, #0x18
	mov r0, #0xe
	pop {r3, r4, r5, r6, r7, pc}
_0222595E:
	ldr r6, [r0, #0x2c]
	ldr r7, [r0, #0x10]
	lsl r1, r6, #0x18
	lsr r1, r1, #0x16
	ldr r1, [r3, r1]
	lsl r1, r1, #0x18
	lsr r4, r1, #0x18
	lsr r1, r6, #8
	lsl r1, r1, #0x18
	lsr r1, r1, #0x16
	ldr r2, [r3, r1]
	mov r1, #0xff
	lsl r1, r1, #8
	and r1, r2
	str r1, [sp, #0x14]
	lsr r1, r6, #0x18
	lsl r1, r1, #2
	ldr r2, [r3, r1]
	mov r1, #0xff
	lsl r1, r1, #0x18
	and r1, r2
	lsr r2, r6, #0x10
	lsl r2, r2, #0x18
	lsr r2, r2, #0x16
	ldr r6, [r3, r2]
	mov r2, #0xff
	lsl r2, r2, #0x10
	eor r1, r7
	and r2, r6
	eor r2, r1
	ldr r1, [sp, #0x14]
	eor r1, r2
	add r2, r4, #0
	eor r2, r1
	str r2, [r0, #0x30]
	ldr r1, [r0, #0x14]
	eor r2, r1
	str r2, [r0, #0x34]
	ldr r1, [r0, #0x18]
	eor r2, r1
	str r2, [r0, #0x38]
	ldr r1, [r0, #0x1c]
	eor r1, r2
	str r1, [r0, #0x3c]
	add r0, #0x20
	b _022258E8
_022259BA:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022259C0: .word ov13_02242688
_022259C4: .word ov13_022442B0
	thumb_func_end ov13_02225710

	thumb_func_start ov13_022259C8
ov13_022259C8: ; 0x022259C8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	bl ov13_02225710
	mov ip, r0
	mov r1, ip
	lsl r6, r1, #2
	mov r0, #0
	cmp r6, #0
	ble _02225A0E
	lsl r2, r6, #2
	add r1, r4, #0
	add r2, r4, r2
_022259E2:
	ldr r5, [r1]
	ldr r3, [r2]
	add r0, r0, #4
	str r3, [r1]
	str r5, [r2]
	ldr r5, [r1, #4]
	ldr r3, [r2, #4]
	sub r6, r6, #4
	str r3, [r1, #4]
	str r5, [r2, #4]
	ldr r5, [r1, #8]
	ldr r3, [r2, #8]
	str r3, [r1, #8]
	str r5, [r2, #8]
	ldr r5, [r1, #0xc]
	ldr r3, [r2, #0xc]
	str r3, [r1, #0xc]
	str r5, [r2, #0xc]
	add r1, #0x10
	sub r2, #0x10
	cmp r0, r6
	blt _022259E2
_02225A0E:
	mov r0, #1
	str r0, [sp]
	mov r0, ip
	cmp r0, #1
	bgt _02225A1A
	b _02225B3E
_02225A1A:
	ldr r2, _02225B44 ; =ov13_022442B0
	ldr r7, _02225B48 ; =ov13_02242AB0
_02225A1E:
	add r4, #0x10
	ldr r3, [r4]
	lsl r0, r3, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r1, [r7, r0]
	lsr r0, r3, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r5, r0, #0x16
	ldr r0, _02225B4C ; =ov13_022426B0
	ldr r6, [r0, r5]
	lsr r0, r3, #0x18
	lsl r0, r0, #2
	lsr r3, r3, #0x10
	ldr r0, [r2, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x16
	lsl r0, r0, #0x18
	ldr r3, [r2, r3]
	lsr r5, r0, #0x16
	ldr r0, _02225B50 ; =ov13_022446B0
	lsl r3, r3, #0x18
	ldr r0, [r0, r5]
	lsr r5, r3, #0x16
	ldr r3, _02225B54 ; =ov13_02244AB0
	ldr r3, [r3, r5]
	eor r0, r3
	eor r0, r6
	eor r0, r1
	str r0, [r4]
	ldr r3, [r4, #4]
	lsl r0, r3, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r1, [r7, r0]
	lsr r0, r3, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r5, r0, #0x16
	ldr r0, _02225B4C ; =ov13_022426B0
	ldr r6, [r0, r5]
	lsr r0, r3, #0x18
	lsl r0, r0, #2
	lsr r3, r3, #0x10
	ldr r0, [r2, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x16
	lsl r0, r0, #0x18
	ldr r3, [r2, r3]
	lsr r5, r0, #0x16
	ldr r0, _02225B50 ; =ov13_022446B0
	lsl r3, r3, #0x18
	ldr r0, [r0, r5]
	lsr r5, r3, #0x16
	ldr r3, _02225B54 ; =ov13_02244AB0
	ldr r3, [r3, r5]
	eor r0, r3
	eor r0, r6
	eor r0, r1
	str r0, [r4, #4]
	ldr r3, [r4, #8]
	lsl r0, r3, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r1, [r7, r0]
	lsr r0, r3, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r5, r0, #0x16
	ldr r0, _02225B4C ; =ov13_022426B0
	ldr r6, [r0, r5]
	lsr r0, r3, #0x18
	lsl r0, r0, #2
	lsr r3, r3, #0x10
	ldr r0, [r2, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x16
	lsl r0, r0, #0x18
	ldr r3, [r2, r3]
	lsr r5, r0, #0x16
	ldr r0, _02225B50 ; =ov13_022446B0
	lsl r3, r3, #0x18
	ldr r0, [r0, r5]
	lsr r5, r3, #0x16
	ldr r3, _02225B54 ; =ov13_02244AB0
	ldr r3, [r3, r5]
	eor r0, r3
	eor r0, r6
	eor r0, r1
	str r0, [r4, #8]
	ldr r3, [r4, #0xc]
	lsl r0, r3, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r1, [r7, r0]
	lsr r0, r3, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r2, r0]
	lsl r0, r0, #0x18
	lsr r5, r0, #0x16
	ldr r0, _02225B4C ; =ov13_022426B0
	ldr r6, [r0, r5]
	lsr r0, r3, #0x18
	lsl r0, r0, #2
	lsr r3, r3, #0x10
	ldr r0, [r2, r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x16
	lsl r0, r0, #0x18
	ldr r3, [r2, r3]
	lsr r5, r0, #0x16
	ldr r0, _02225B50 ; =ov13_022446B0
	lsl r3, r3, #0x18
	ldr r0, [r0, r5]
	lsr r5, r3, #0x16
	ldr r3, _02225B54 ; =ov13_02244AB0
	ldr r3, [r3, r5]
	eor r0, r3
	eor r0, r6
	eor r0, r1
	str r0, [r4, #0xc]
	ldr r0, [sp]
	add r1, r0, #1
	mov r0, ip
	str r1, [sp]
	cmp r1, r0
	bge _02225B3E
	b _02225A1E
_02225B3E:
	mov r0, ip
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02225B44: .word ov13_022442B0
_02225B48: .word ov13_02242AB0
_02225B4C: .word ov13_022426B0
_02225B50: .word ov13_022446B0
_02225B54: .word ov13_02244AB0
	thumb_func_end ov13_022259C8

	thumb_func_start ov13_02225B58
ov13_02225B58: ; 0x02225B58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	add r7, r1, #0
	add r1, r2, #0
	ldrb r2, [r1, #2]
	str r3, [sp]
	ldrb r6, [r1, #1]
	lsl r3, r2, #8
	ldrb r2, [r1]
	ldrb r4, [r1, #3]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r3
	eor r2, r4
	ldr r5, [r0]
	ldrb r6, [r1, #5]
	eor r2, r5
	str r2, [sp, #0xc]
	ldrb r2, [r1, #6]
	ldrb r4, [r1, #7]
	lsl r6, r6, #0x10
	lsl r3, r2, #8
	ldrb r2, [r1, #4]
	ldr r5, [r0, #4]
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r3
	eor r2, r4
	eor r2, r5
	str r2, [sp, #8]
	ldrb r2, [r1, #0xa]
	ldrb r6, [r1, #9]
	ldrb r4, [r1, #0xb]
	lsl r3, r2, #8
	ldrb r2, [r1, #8]
	lsl r6, r6, #0x10
	ldr r5, [r0, #8]
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r3
	eor r2, r4
	eor r5, r2
	ldrb r2, [r1, #0xe]
	ldrb r4, [r1, #0xf]
	ldr r6, [r0, #0xc]
	lsl r3, r2, #8
	ldrb r2, [r1, #0xc]
	ldrb r1, [r1, #0xd]
	lsl r2, r2, #0x18
	lsl r1, r1, #0x10
	eor r1, r2
	eor r1, r3
	eor r1, r4
	eor r6, r1
	asr r1, r7, #1
	str r1, [sp, #4]
_02225BCA:
	lsl r1, r6, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F00 ; =ov13_02243EB0
	ldr r4, [r0, #0x10]
	ldr r3, [r1, r2]
	lsr r1, r5, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F04 ; =ov13_02243AB0
	ldr r1, [r1, r2]
	str r1, [sp, #0x40]
	ldr r1, [sp, #0xc]
	lsr r1, r1, #0x18
	lsl r2, r1, #2
	ldr r1, _02225F08 ; =ov13_022432B0
	ldr r7, [r1, r2]
	ldr r1, [sp, #8]
	lsr r1, r1, #0x10
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F0C ; =ov13_022436B0
	ldr r1, [r1, r2]
	add r2, r7, #0
	eor r2, r1
	ldr r1, [sp, #0x40]
	eor r1, r2
	eor r1, r3
	eor r1, r4
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	ldr r4, [r0, #0x14]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F00 ; =ov13_02243EB0
	ldr r3, [r1, r2]
	lsr r1, r6, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F04 ; =ov13_02243AB0
	ldr r1, [r1, r2]
	str r1, [sp, #0x48]
	ldr r1, [sp, #8]
	lsr r1, r1, #0x18
	lsl r2, r1, #2
	ldr r1, _02225F08 ; =ov13_022432B0
	ldr r7, [r1, r2]
	lsr r1, r5, #0x10
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F0C ; =ov13_022436B0
	ldr r1, [r1, r2]
	add r2, r7, #0
	eor r2, r1
	ldr r1, [sp, #0x48]
	eor r1, r2
	eor r1, r3
	eor r1, r4
	str r1, [sp, #0x44]
	ldr r1, [sp, #8]
	ldr r4, [r0, #0x18]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F00 ; =ov13_02243EB0
	ldr r3, [r1, r2]
	ldr r1, [sp, #0xc]
	lsr r1, r1, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F04 ; =ov13_02243AB0
	ldr r1, [r1, r2]
	str r1, [sp, #0x14]
	lsr r1, r5, #0x18
	lsl r2, r1, #2
	ldr r1, _02225F08 ; =ov13_022432B0
	ldr r7, [r1, r2]
	lsr r1, r6, #0x10
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _02225F0C ; =ov13_022436B0
	ldr r1, [r1, r2]
	add r2, r7, #0
	eor r2, r1
	ldr r1, [sp, #0x14]
	ldr r7, [r0, #0x1c]
	eor r1, r2
	eor r1, r3
	add r2, r4, #0
	eor r2, r1
	lsl r1, r5, #0x18
	lsr r3, r1, #0x16
	ldr r1, _02225F00 ; =ov13_02243EB0
	add r0, #0x20
	ldr r3, [r1, r3]
	ldr r1, [sp, #8]
	lsr r1, r1, #8
	lsl r1, r1, #0x18
	lsr r4, r1, #0x16
	ldr r1, _02225F04 ; =ov13_02243AB0
	ldr r1, [r1, r4]
	lsr r4, r6, #0x18
	lsl r5, r4, #2
	ldr r4, _02225F08 ; =ov13_022432B0
	ldr r6, [r4, r5]
	ldr r4, [sp, #0xc]
	lsr r4, r4, #0x10
	lsl r4, r4, #0x18
	lsr r5, r4, #0x16
	ldr r4, _02225F0C ; =ov13_022436B0
	ldr r4, [r4, r5]
	eor r4, r6
	eor r1, r4
	eor r1, r3
	ldr r3, [sp, #4]
	eor r1, r7
	sub r3, r3, #1
	str r3, [sp, #4]
	beq _02225D94
	lsl r3, r1, #0x18
	lsr r5, r3, #0x16
	ldr r3, _02225F00 ; =ov13_02243EB0
	ldr r4, [r0]
	ldr r3, [r3, r5]
	lsr r5, r2, #8
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _02225F04 ; =ov13_02243AB0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x10]
	lsr r5, r5, #0x18
	lsl r6, r5, #2
	ldr r5, _02225F08 ; =ov13_022432B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x18]
	ldr r5, [sp, #0x44]
	lsr r5, r5, #0x10
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _02225F0C ; =ov13_022436B0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x18]
	eor r5, r6
	eor r5, r7
	eor r3, r5
	eor r3, r4
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x10]
	ldr r4, [r0, #4]
	lsl r3, r3, #0x18
	lsr r5, r3, #0x16
	ldr r3, _02225F00 ; =ov13_02243EB0
	ldr r3, [r3, r5]
	lsr r5, r1, #8
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _02225F04 ; =ov13_02243AB0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x44]
	lsr r5, r5, #0x18
	lsl r6, r5, #2
	ldr r5, _02225F08 ; =ov13_022432B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x1c]
	lsr r5, r2, #0x10
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _02225F0C ; =ov13_022436B0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x1c]
	eor r5, r6
	eor r5, r7
	eor r3, r5
	eor r3, r4
	str r3, [sp, #8]
	ldr r3, [sp, #0x44]
	ldr r6, [r0, #8]
	lsl r3, r3, #0x18
	lsr r4, r3, #0x16
	ldr r3, _02225F00 ; =ov13_02243EB0
	ldr r5, [r3, r4]
	ldr r3, [sp, #0x10]
	lsr r3, r3, #8
	lsl r3, r3, #0x18
	lsr r4, r3, #0x16
	ldr r3, _02225F04 ; =ov13_02243AB0
	ldr r3, [r3, r4]
	str r3, [sp, #0x20]
	lsr r3, r2, #0x18
	lsl r4, r3, #2
	ldr r3, _02225F08 ; =ov13_022432B0
	lsl r2, r2, #0x18
	ldr r7, [r3, r4]
	lsr r3, r1, #0x10
	lsl r3, r3, #0x18
	lsr r4, r3, #0x16
	ldr r3, _02225F0C ; =ov13_022436B0
	lsr r1, r1, #0x18
	ldr r3, [r3, r4]
	add r4, r7, #0
	eor r4, r3
	ldr r3, [sp, #0x20]
	ldr r7, [r0, #0xc]
	eor r3, r4
	eor r3, r5
	add r5, r6, #0
	eor r5, r3
	lsr r3, r2, #0x16
	ldr r2, _02225F00 ; =ov13_02243EB0
	ldr r3, [r2, r3]
	ldr r2, [sp, #0x44]
	lsr r2, r2, #8
	lsl r2, r2, #0x18
	lsr r4, r2, #0x16
	ldr r2, _02225F04 ; =ov13_02243AB0
	ldr r2, [r2, r4]
	lsl r4, r1, #2
	ldr r1, _02225F08 ; =ov13_022432B0
	ldr r6, [r1, r4]
	ldr r1, [sp, #0x10]
	lsr r1, r1, #0x10
	lsl r1, r1, #0x18
	lsr r4, r1, #0x16
	ldr r1, _02225F0C ; =ov13_022436B0
	ldr r1, [r1, r4]
	eor r1, r6
	eor r1, r2
	eor r1, r3
	add r6, r7, #0
	eor r6, r1
	b _02225BCA
_02225D94:
	ldr r3, [r0]
	mov r6, #0xff
	str r3, [sp, #0x24]
	lsl r3, r1, #0x18
	lsr r4, r3, #0x16
	ldr r3, _02225F10 ; =ov13_022442B0
	lsl r6, r6, #0x10
	ldr r4, [r3, r4]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	str r4, [sp, #0x28]
	lsr r4, r2, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #8
	and r4, r5
	str r4, [sp, #0x2c]
	ldr r4, [sp, #0x10]
	lsr r4, r4, #0x18
	lsl r4, r4, #2
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x18
	and r5, r4
	ldr r4, [sp, #0x44]
	lsr r4, r4, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	and r4, r6
	eor r5, r4
	ldr r4, [sp, #0x2c]
	eor r5, r4
	ldr r4, [sp, #0x28]
	eor r5, r4
	ldr r4, [sp, #0x24]
	eor r4, r5
	ldr r5, [sp]
	lsr r6, r4, #0x18
	strb r6, [r5]
	lsr r6, r4, #0x10
	strb r6, [r5, #1]
	lsr r6, r4, #8
	strb r6, [r5, #2]
	strb r4, [r5, #3]
	ldr r4, [r0, #4]
	mov r6, #0xff
	str r4, [sp, #0x30]
	ldr r4, [sp, #0x10]
	lsl r6, r6, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	str r4, [sp, #0x34]
	lsr r4, r1, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #8
	and r4, r5
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x44]
	lsr r4, r4, #0x18
	lsl r4, r4, #2
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x18
	and r5, r4
	lsr r4, r2, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	and r4, r6
	eor r5, r4
	ldr r4, [sp, #0x38]
	eor r5, r4
	ldr r4, [sp, #0x34]
	eor r5, r4
	ldr r4, [sp, #0x30]
	eor r4, r5
	ldr r5, [sp]
	lsr r6, r4, #0x18
	strb r6, [r5, #4]
	lsr r6, r4, #0x10
	strb r6, [r5, #5]
	lsr r6, r4, #8
	strb r6, [r5, #6]
	strb r4, [r5, #7]
	ldr r4, [r0, #8]
	str r4, [sp, #0x3c]
	ldr r4, [sp, #0x44]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	mov lr, r4
	ldr r4, [sp, #0x10]
	lsr r4, r4, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #8
	and r4, r5
	mov ip, r4
	lsr r4, r2, #0x18
	lsl r4, r4, #2
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x18
	add r6, r5, #0
	and r6, r4
	lsr r4, r1, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x10
	and r4, r5
	eor r4, r6
	mov r5, ip
	eor r5, r4
	mov r4, lr
	eor r5, r4
	ldr r4, [sp, #0x3c]
	eor r4, r5
	ldr r5, [sp]
	lsr r6, r4, #0x18
	strb r6, [r5, #8]
	lsr r6, r4, #0x10
	strb r6, [r5, #9]
	lsr r6, r4, #8
	strb r6, [r5, #0xa]
	strb r4, [r5, #0xb]
	ldr r5, [r0, #0xc]
	lsl r0, r2, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r3, r0]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp, #0x44]
	lsr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r2, [r3, r0]
	mov r0, #0xff
	lsl r0, r0, #8
	and r2, r0
	lsr r0, r1, #0x18
	lsl r0, r0, #2
	ldr r1, [r3, r0]
	mov r0, #0xff
	lsl r0, r0, #0x18
	and r0, r1
	ldr r1, [sp, #0x10]
	lsr r1, r1, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x16
	ldr r3, [r3, r1]
	mov r1, #0xff
	lsl r1, r1, #0x10
	and r1, r3
	eor r0, r1
	eor r0, r2
	eor r0, r4
	eor r0, r5
	ldr r1, [sp]
	lsr r2, r0, #0x18
	strb r2, [r1, #0xc]
	lsr r2, r0, #0x10
	strb r2, [r1, #0xd]
	lsr r2, r0, #8
	strb r2, [r1, #0xe]
	strb r0, [r1, #0xf]
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02225F00: .word ov13_02243EB0
_02225F04: .word ov13_02243AB0
_02225F08: .word ov13_022432B0
_02225F0C: .word ov13_022436B0
_02225F10: .word ov13_022442B0
	thumb_func_end ov13_02225B58

	thumb_func_start ov13_02225F14
ov13_02225F14: ; 0x02225F14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r7, r1, #0
	add r1, r2, #0
	ldrb r2, [r1, #2]
	str r3, [sp]
	ldrb r6, [r1, #1]
	lsl r3, r2, #8
	ldrb r2, [r1]
	ldrb r4, [r1, #3]
	lsl r6, r6, #0x10
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r3
	eor r2, r4
	ldr r5, [r0]
	ldrb r6, [r1, #5]
	eor r2, r5
	str r2, [sp, #0xc]
	ldrb r2, [r1, #6]
	ldrb r4, [r1, #7]
	lsl r6, r6, #0x10
	lsl r3, r2, #8
	ldrb r2, [r1, #4]
	ldr r5, [r0, #4]
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r3
	eor r2, r4
	eor r2, r5
	str r2, [sp, #8]
	ldrb r2, [r1, #0xa]
	ldrb r6, [r1, #9]
	ldrb r4, [r1, #0xb]
	lsl r3, r2, #8
	ldrb r2, [r1, #8]
	lsl r6, r6, #0x10
	ldr r5, [r0, #8]
	lsl r2, r2, #0x18
	eor r2, r6
	eor r2, r3
	eor r2, r4
	eor r2, r5
	str r2, [sp, #0x40]
	ldrb r2, [r1, #0xe]
	ldr r5, [r0, #0xc]
	ldrb r4, [r1, #0xf]
	lsl r3, r2, #8
	ldrb r2, [r1, #0xc]
	ldrb r1, [r1, #0xd]
	add r6, r5, #0
	lsl r2, r2, #0x18
	lsl r1, r1, #0x10
	eor r1, r2
	eor r1, r3
	eor r1, r4
	eor r6, r1
	asr r1, r7, #1
	str r1, [sp, #4]
_02225F8A:
	ldr r1, [sp, #8]
	ldr r5, [r0, #0x10]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _022262BC ; =ov13_02242AB0
	ldr r4, [r1, r2]
	ldr r1, [sp, #0x40]
	lsr r1, r1, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _022262C0 ; =ov13_022426B0
	ldr r3, [r1, r2]
	ldr r1, [sp, #0xc]
	lsr r1, r1, #0x18
	lsl r2, r1, #2
	ldr r1, _022262C4 ; =ov13_022446B0
	ldr r7, [r1, r2]
	lsr r1, r6, #0x10
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _022262C8 ; =ov13_02244AB0
	ldr r1, [r1, r2]
	eor r1, r7
	eor r1, r3
	eor r1, r4
	eor r1, r5
	str r1, [sp, #0x10]
	ldr r1, [sp, #0x40]
	ldr r5, [r0, #0x14]
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _022262BC ; =ov13_02242AB0
	ldr r4, [r1, r2]
	lsr r1, r6, #8
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _022262C0 ; =ov13_022426B0
	ldr r3, [r1, r2]
	ldr r1, [sp, #8]
	lsr r1, r1, #0x18
	lsl r2, r1, #2
	ldr r1, _022262C4 ; =ov13_022446B0
	ldr r7, [r1, r2]
	ldr r1, [sp, #0xc]
	lsr r1, r1, #0x10
	lsl r1, r1, #0x18
	lsr r2, r1, #0x16
	ldr r1, _022262C8 ; =ov13_02244AB0
	ldr r1, [r1, r2]
	eor r1, r7
	eor r1, r3
	eor r1, r4
	eor r1, r5
	str r1, [sp, #0x44]
	lsl r1, r6, #0x18
	lsr r2, r1, #0x16
	ldr r1, _022262BC ; =ov13_02242AB0
	ldr r3, [r0, #0x18]
	ldr r2, [r1, r2]
	ldr r1, [sp, #0xc]
	lsr r1, r1, #8
	lsl r1, r1, #0x18
	lsr r4, r1, #0x16
	ldr r1, _022262C0 ; =ov13_022426B0
	ldr r1, [r1, r4]
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x40]
	lsr r1, r1, #0x18
	lsl r4, r1, #2
	ldr r1, _022262C4 ; =ov13_022446B0
	ldr r1, [r1, r4]
	ldr r4, [sp, #8]
	lsr r4, r4, #0x10
	lsl r4, r4, #0x18
	lsr r5, r4, #0x16
	ldr r4, _022262C8 ; =ov13_02244AB0
	ldr r4, [r4, r5]
	eor r4, r1
	ldr r1, [sp, #0x14]
	eor r1, r4
	eor r1, r2
	add r2, r3, #0
	eor r2, r1
	ldr r1, [sp, #0xc]
	ldr r3, [r0, #0x1c]
	lsl r1, r1, #0x18
	lsr r4, r1, #0x16
	ldr r1, _022262BC ; =ov13_02242AB0
	add r0, #0x20
	ldr r1, [r1, r4]
	ldr r4, [sp, #8]
	lsr r4, r4, #8
	lsl r4, r4, #0x18
	lsr r5, r4, #0x16
	ldr r4, _022262C0 ; =ov13_022426B0
	ldr r7, [r4, r5]
	lsr r4, r6, #0x18
	lsl r5, r4, #2
	ldr r4, _022262C4 ; =ov13_022446B0
	ldr r6, [r4, r5]
	ldr r4, [sp, #0x40]
	lsr r4, r4, #0x10
	lsl r4, r4, #0x18
	lsr r5, r4, #0x16
	ldr r4, _022262C8 ; =ov13_02244AB0
	ldr r4, [r4, r5]
	eor r4, r6
	eor r4, r7
	eor r1, r4
	eor r1, r3
	ldr r3, [sp, #4]
	sub r3, r3, #1
	str r3, [sp, #4]
	beq _0222614E
	ldr r3, [sp, #0x44]
	ldr r4, [r0]
	lsl r3, r3, #0x18
	lsr r5, r3, #0x16
	ldr r3, _022262BC ; =ov13_02242AB0
	ldr r3, [r3, r5]
	lsr r5, r2, #8
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _022262C0 ; =ov13_022426B0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x10]
	lsr r5, r5, #0x18
	lsl r6, r5, #2
	ldr r5, _022262C4 ; =ov13_022446B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x18]
	lsr r5, r1, #0x10
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _022262C8 ; =ov13_02244AB0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x18]
	eor r5, r6
	eor r5, r7
	eor r3, r5
	eor r3, r4
	str r3, [sp, #0xc]
	lsl r3, r2, #0x18
	lsr r5, r3, #0x16
	ldr r3, _022262BC ; =ov13_02242AB0
	ldr r4, [r0, #4]
	ldr r3, [r3, r5]
	lsr r5, r1, #8
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _022262C0 ; =ov13_022426B0
	ldr r7, [r5, r6]
	ldr r5, [sp, #0x44]
	lsr r5, r5, #0x18
	lsl r6, r5, #2
	ldr r5, _022262C4 ; =ov13_022446B0
	ldr r5, [r5, r6]
	str r5, [sp, #0x1c]
	ldr r5, [sp, #0x10]
	lsr r5, r5, #0x10
	lsl r5, r5, #0x18
	lsr r6, r5, #0x16
	ldr r5, _022262C8 ; =ov13_02244AB0
	ldr r6, [r5, r6]
	ldr r5, [sp, #0x1c]
	eor r5, r6
	eor r5, r7
	eor r3, r5
	eor r3, r4
	str r3, [sp, #8]
	lsl r3, r1, #0x18
	lsr r4, r3, #0x16
	ldr r3, _022262BC ; =ov13_02242AB0
	ldr r6, [r0, #8]
	ldr r5, [r3, r4]
	ldr r3, [sp, #0x10]
	lsr r1, r1, #0x18
	lsr r3, r3, #8
	lsl r3, r3, #0x18
	lsr r4, r3, #0x16
	ldr r3, _022262C0 ; =ov13_022426B0
	ldr r3, [r3, r4]
	str r3, [sp, #0x20]
	lsr r3, r2, #0x18
	lsl r4, r3, #2
	ldr r3, _022262C4 ; =ov13_022446B0
	lsr r2, r2, #0x10
	ldr r7, [r3, r4]
	ldr r3, [sp, #0x44]
	lsl r2, r2, #0x18
	lsr r3, r3, #0x10
	lsl r3, r3, #0x18
	lsr r4, r3, #0x16
	ldr r3, _022262C8 ; =ov13_02244AB0
	ldr r3, [r3, r4]
	add r4, r7, #0
	eor r4, r3
	ldr r3, [sp, #0x20]
	eor r3, r4
	eor r3, r5
	eor r3, r6
	str r3, [sp, #0x40]
	ldr r3, [sp, #0x10]
	ldr r5, [r0, #0xc]
	lsl r3, r3, #0x18
	lsr r4, r3, #0x16
	ldr r3, _022262BC ; =ov13_02242AB0
	ldr r4, [r3, r4]
	ldr r3, [sp, #0x44]
	lsr r3, r3, #8
	lsl r3, r3, #0x18
	lsr r6, r3, #0x16
	ldr r3, _022262C0 ; =ov13_022426B0
	ldr r3, [r3, r6]
	lsl r6, r1, #2
	ldr r1, _022262C4 ; =ov13_022446B0
	ldr r1, [r1, r6]
	lsr r6, r2, #0x16
	ldr r2, _022262C8 ; =ov13_02244AB0
	ldr r2, [r2, r6]
	add r6, r5, #0
	eor r1, r2
	eor r1, r3
	eor r1, r4
	eor r6, r1
	b _02225F8A
_0222614E:
	ldr r3, [r0]
	mov r6, #0xff
	str r3, [sp, #0x24]
	ldr r3, [sp, #0x44]
	lsl r6, r6, #0x10
	lsl r3, r3, #0x18
	lsr r4, r3, #0x16
	ldr r3, _022262CC ; =ov13_02242EB0
	ldr r4, [r3, r4]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	str r4, [sp, #0x28]
	lsr r4, r2, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #8
	and r4, r5
	str r4, [sp, #0x2c]
	ldr r4, [sp, #0x10]
	lsr r4, r4, #0x18
	lsl r4, r4, #2
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x18
	and r5, r4
	lsr r4, r1, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	and r4, r6
	eor r5, r4
	ldr r4, [sp, #0x2c]
	eor r5, r4
	ldr r4, [sp, #0x28]
	eor r5, r4
	ldr r4, [sp, #0x24]
	eor r4, r5
	ldr r5, [sp]
	lsr r6, r4, #0x18
	strb r6, [r5]
	lsr r6, r4, #0x10
	strb r6, [r5, #1]
	lsr r6, r4, #8
	strb r6, [r5, #2]
	strb r4, [r5, #3]
	ldr r4, [r0, #4]
	mov r6, #0xff
	str r4, [sp, #0x30]
	lsl r4, r2, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	lsl r6, r6, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	str r4, [sp, #0x34]
	lsr r4, r1, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #8
	and r4, r5
	str r4, [sp, #0x38]
	ldr r4, [sp, #0x44]
	lsr r4, r4, #0x18
	lsl r4, r4, #2
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x18
	and r5, r4
	ldr r4, [sp, #0x10]
	lsr r4, r4, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	and r4, r6
	eor r5, r4
	ldr r4, [sp, #0x38]
	eor r5, r4
	ldr r4, [sp, #0x34]
	eor r5, r4
	ldr r4, [sp, #0x30]
	eor r4, r5
	ldr r5, [sp]
	lsr r6, r4, #0x18
	strb r6, [r5, #4]
	lsr r6, r4, #0x10
	strb r6, [r5, #5]
	lsr r6, r4, #8
	strb r6, [r5, #6]
	strb r4, [r5, #7]
	ldr r4, [r0, #8]
	str r4, [sp, #0x3c]
	lsl r4, r1, #0x18
	lsr r4, r4, #0x16
	ldr r4, [r3, r4]
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	mov lr, r4
	ldr r4, [sp, #0x10]
	lsr r4, r4, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #8
	and r4, r5
	mov ip, r4
	lsr r4, r2, #0x18
	lsl r4, r4, #2
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x18
	add r6, r5, #0
	and r6, r4
	ldr r4, [sp, #0x44]
	lsr r4, r4, #0x10
	lsl r4, r4, #0x18
	lsr r4, r4, #0x16
	ldr r5, [r3, r4]
	mov r4, #0xff
	lsl r4, r4, #0x10
	and r4, r5
	eor r4, r6
	mov r5, ip
	eor r5, r4
	mov r4, lr
	eor r5, r4
	ldr r4, [sp, #0x3c]
	eor r4, r5
	ldr r5, [sp]
	lsr r6, r4, #0x18
	strb r6, [r5, #8]
	lsr r6, r4, #0x10
	strb r6, [r5, #9]
	lsr r6, r4, #8
	strb r6, [r5, #0xa]
	strb r4, [r5, #0xb]
	ldr r5, [r0, #0xc]
	ldr r0, [sp, #0x10]
	lsr r2, r2, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r0, [r3, r0]
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp, #0x44]
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	ldr r6, [r3, r0]
	mov r0, #0xff
	lsl r0, r0, #8
	lsl r1, r1, #2
	and r0, r6
	mov r6, #0xff
	lsr r2, r2, #0x16
	ldr r1, [r3, r1]
	ldr r3, [r3, r2]
	mov r2, #0xff
	lsl r6, r6, #0x18
	lsl r2, r2, #0x10
	and r1, r6
	and r2, r3
	eor r1, r2
	eor r0, r1
	eor r0, r4
	eor r0, r5
	ldr r1, [sp]
	lsr r2, r0, #0x18
	strb r2, [r1, #0xc]
	lsr r2, r0, #0x10
	strb r2, [r1, #0xd]
	lsr r2, r0, #8
	strb r2, [r1, #0xe]
	strb r0, [r1, #0xf]
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022262BC: .word ov13_02242AB0
_022262C0: .word ov13_022426B0
_022262C4: .word ov13_022446B0
_022262C8: .word ov13_02244AB0
_022262CC: .word ov13_02242EB0
	thumb_func_end ov13_02225F14

	thumb_func_start ov13_022262D0
ov13_022262D0: ; 0x022262D0
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	ldr r1, _022262E8 ; =0x67452301
	str r1, [r0]
	ldr r1, _022262EC ; =0xEFCDAB89
	str r1, [r0, #4]
	ldr r1, _022262F0 ; =0x98BADCFE
	str r1, [r0, #8]
	ldr r1, _022262F4 ; =0x10325476
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
_022262E8: .word 0x67452301
_022262EC: .word 0xEFCDAB89
_022262F0: .word 0x98BADCFE
_022262F4: .word 0x10325476
	thumb_func_end ov13_022262D0

	thumb_func_start ov13_022262F8
ov13_022262F8: ; 0x022262F8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r1, [r5, #0x10]
	add r6, r2, #0
	lsr r2, r1, #3
	mov r0, #0x3f
	and r0, r2
	lsl r2, r6, #3
	add r1, r1, r2
	str r1, [r5, #0x10]
	cmp r1, r2
	bhs _02226318
	ldr r1, [r5, #0x14]
	add r1, r1, #1
	str r1, [r5, #0x14]
_02226318:
	ldr r2, [r5, #0x14]
	lsr r1, r6, #0x1d
	add r1, r2, r1
	str r1, [r5, #0x14]
	mov r1, #0x40
	sub r4, r1, r0
	cmp r6, r4
	blo _0222635E
	add r1, r5, #0
	add r1, #0x18
	add r0, r1, r0
	add r1, r7, #0
	add r2, r4, #0
	bl ov13_02226C64
	add r1, r5, #0
	add r0, r5, #0
	add r1, #0x18
	bl ov13_022263C4
	add r0, r4, #0
	add r0, #0x3f
	cmp r0, r6
	bhs _0222635A
_02226348:
	add r0, r5, #0
	add r1, r7, r4
	bl ov13_022263C4
	add r4, #0x40
	add r0, r4, #0
	add r0, #0x3f
	cmp r0, r6
	blo _02226348
_0222635A:
	mov r0, #0
	b _02226360
_0222635E:
	mov r4, #0
_02226360:
	add r5, #0x18
	add r0, r5, r0
	add r1, r7, r4
	sub r2, r6, r4
	bl ov13_02226C64
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov13_022262F8

	thumb_func_start ov13_02226370
ov13_02226370: ; 0x02226370
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	add r1, #0x10
	mov r2, #8
	bl ov13_02226C0C
	ldr r0, [r4, #0x10]
	lsr r1, r0, #3
	mov r0, #0x3f
	and r1, r0
	cmp r1, #0x38
	bhs _02226392
	mov r0, #0x38
	b _02226394
_02226392:
	mov r0, #0x78
_02226394:
	sub r2, r0, r1
	ldr r1, _022263C0 ; =ov13_02245AD8
	add r0, r4, #0
	bl ov13_022262F8
	add r0, r4, #0
	add r1, sp, #0
	mov r2, #8
	bl ov13_022262F8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x10
	bl ov13_02226C0C
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x58
	bl ov13_02226C7C
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022263C0: .word ov13_02245AD8
	thumb_func_end ov13_02226370

	thumb_func_start ov13_022263C4
ov13_022263C4: ; 0x022263C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	add r7, r0, #0
	ldr r0, [r7]
	mov r2, #0x40
	str r0, [sp]
	add r0, sp, #0x44
	ldr r4, [r7, #4]
	ldr r5, [r7, #8]
	ldr r6, [r7, #0xc]
	bl ov13_02226C38
	ldr r0, [sp, #0x44]
	add r1, r4, #0
	str r0, [sp, #4]
	mvn r0, r4
	and r1, r5
	and r0, r6
	orr r1, r0
	ldr r0, [sp, #4]
	add r1, r0, r1
	ldr r0, _0222679C ; =0x28955B88
	sub r1, r1, r0
	ldr r0, [sp]
	add r0, r0, r1
	lsl r1, r0, #7
	lsr r0, r0, #0x19
	orr r0, r1
	add r3, r0, r4
	ldr r0, [sp, #0x48]
	mvn r1, r3
	str r0, [sp, #8]
	add r0, r3, #0
	and r0, r4
	and r1, r5
	orr r1, r0
	ldr r0, [sp, #8]
	add r1, r0, r1
	ldr r0, _022267A0 ; =0x173848AA
	sub r0, r1, r0
	add r0, r6, r0
	lsl r1, r0, #0xc
	lsr r0, r0, #0x14
	orr r0, r1
	add r2, r0, r3
	ldr r0, [sp, #0x4c]
	mvn r1, r2
	str r0, [sp, #0xc]
	add r0, r2, #0
	and r0, r3
	and r1, r4
	orr r1, r0
	ldr r0, [sp, #0xc]
	add r1, r0, r1
	ldr r0, _022267A4 ; =0x242070DB
	add r0, r1, r0
	add r0, r5, r0
	lsl r1, r0, #0x11
	lsr r0, r0, #0xf
	orr r0, r1
	add r1, r0, r2
	ldr r0, [sp, #0x50]
	mvn r5, r1
	str r0, [sp, #0x10]
	add r0, r1, #0
	and r0, r2
	and r5, r3
	orr r5, r0
	ldr r0, [sp, #0x10]
	add r5, r0, r5
	ldr r0, _022267A8 ; =0x3E423112
	sub r0, r5, r0
	add r0, r4, r0
	lsl r4, r0, #0x16
	lsr r0, r0, #0xa
	orr r0, r4
	ldr r4, [sp, #0x54]
	add r0, r0, r1
	str r4, [sp, #0x14]
	add r4, r0, #0
	mvn r5, r0
	and r4, r1
	and r5, r2
	orr r5, r4
	ldr r4, [sp, #0x14]
	add r5, r4, r5
	ldr r4, _022267AC ; =0x0A83F051
	sub r4, r5, r4
	add r3, r3, r4
	lsl r4, r3, #7
	lsr r3, r3, #0x19
	orr r3, r4
	ldr r4, [sp, #0x58]
	add r3, r3, r0
	str r4, [sp, #0x18]
	add r4, r3, #0
	mvn r5, r3
	and r4, r0
	and r5, r1
	orr r5, r4
	ldr r4, [sp, #0x18]
	add r5, r4, r5
	ldr r4, _022267B0 ; =0x4787C62A
	add r4, r5, r4
	add r2, r2, r4
	lsl r4, r2, #0xc
	lsr r2, r2, #0x14
	orr r2, r4
	ldr r4, [sp, #0x5c]
	add r2, r2, r3
	str r4, [sp, #0x1c]
	add r4, r2, #0
	mvn r5, r2
	and r4, r3
	and r5, r0
	orr r5, r4
	ldr r4, [sp, #0x1c]
	add r5, r4, r5
	ldr r4, _022267B4 ; =0x57CFB9ED
	sub r4, r5, r4
	add r1, r1, r4
	lsl r4, r1, #0x11
	lsr r1, r1, #0xf
	orr r1, r4
	ldr r4, [sp, #0x60]
	add r1, r1, r2
	str r4, [sp, #0x20]
	add r4, r1, #0
	mvn r5, r1
	and r4, r2
	and r5, r3
	orr r5, r4
	ldr r4, [sp, #0x20]
	add r5, r4, r5
	ldr r4, _022267B8 ; =0x02B96AFF
	sub r4, r5, r4
	add r0, r0, r4
	lsl r4, r0, #0x16
	lsr r0, r0, #0xa
	orr r0, r4
	ldr r4, [sp, #0x64]
	add r0, r0, r1
	str r4, [sp, #0x24]
	add r4, r0, #0
	mvn r5, r0
	and r4, r1
	and r5, r2
	orr r5, r4
	ldr r4, [sp, #0x24]
	add r5, r4, r5
	ldr r4, _022267BC ; =0x698098D8
	add r4, r5, r4
	add r3, r3, r4
	lsl r4, r3, #7
	lsr r3, r3, #0x19
	orr r3, r4
	ldr r4, [sp, #0x68]
	add r3, r3, r0
	str r4, [sp, #0x28]
	add r4, r3, #0
	mvn r5, r3
	and r4, r0
	and r5, r1
	orr r5, r4
	ldr r4, [sp, #0x28]
	add r5, r4, r5
	ldr r4, _022267C0 ; =0x74BB0851
	sub r4, r5, r4
	add r2, r2, r4
	lsl r4, r2, #0xc
	lsr r2, r2, #0x14
	orr r2, r4
	ldr r4, [sp, #0x6c]
	add r2, r2, r3
	str r4, [sp, #0x2c]
	add r4, r2, #0
	mvn r5, r2
	and r4, r3
	and r5, r0
	orr r5, r4
	ldr r4, [sp, #0x2c]
	add r5, r4, r5
	ldr r4, _022267C4 ; =0x0000A44F
	sub r4, r5, r4
	add r1, r1, r4
	lsl r4, r1, #0x11
	lsr r1, r1, #0xf
	orr r1, r4
	ldr r4, [sp, #0x70]
	add r1, r1, r2
	str r4, [sp, #0x30]
	add r4, r1, #0
	mvn r5, r1
	and r4, r2
	and r5, r3
	orr r5, r4
	ldr r4, [sp, #0x30]
	add r5, r4, r5
	ldr r4, _022267C8 ; =0x76A32842
	sub r4, r5, r4
	add r0, r0, r4
	lsl r4, r0, #0x16
	lsr r0, r0, #0xa
	orr r0, r4
	add r0, r0, r1
	ldr r4, [sp, #0x74]
	mvn r5, r0
	str r4, [sp, #0x34]
	add r4, r0, #0
	and r4, r1
	and r5, r2
	orr r5, r4
	ldr r4, [sp, #0x34]
	add r5, r4, r5
	ldr r4, _022267CC ; =0x6B901122
	add r4, r5, r4
	add r3, r3, r4
	lsl r4, r3, #7
	lsr r3, r3, #0x19
	orr r3, r4
	add r4, r3, r0
	ldr r3, [sp, #0x78]
	mvn r5, r4
	str r3, [sp, #0x38]
	add r3, r4, #0
	and r3, r0
	and r5, r1
	orr r5, r3
	ldr r3, [sp, #0x38]
	add r5, r3, r5
	ldr r3, _022267D0 ; =0x02678E6D
	sub r3, r5, r3
	add r2, r2, r3
	lsl r3, r2, #0xc
	lsr r2, r2, #0x14
	orr r2, r3
	add r3, r2, r4
	mvn r2, r3
	str r2, [sp, #0x3c]
	ldr r2, [sp, #0x7c]
	ldr r5, [sp, #0x3c]
	str r2, [sp, #0x40]
	add r2, r3, #0
	and r2, r4
	and r5, r0
	orr r5, r2
	ldr r2, [sp, #0x40]
	add r5, r2, r5
	ldr r2, _022267D4 ; =0x5986BC72
	sub r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #0x11
	lsr r1, r1, #0xf
	orr r1, r2
	add r2, r1, r3
	ldr r1, [sp, #0x80]
	add r5, r2, #0
	mvn r6, r2
	mov ip, r1
	add r1, r6, #0
	and r5, r3
	and r1, r4
	orr r5, r1
	mov r1, ip
	add r5, r1, r5
	ldr r1, _022267D8 ; =0x49B40821
	add r1, r5, r1
	add r0, r0, r1
	lsl r1, r0, #0x16
	lsr r0, r0, #0xa
	orr r0, r1
	add r1, r0, r2
	ldr r5, [sp, #0x3c]
	add r0, r1, #0
	and r0, r3
	and r5, r2
	orr r5, r0
	ldr r0, [sp, #8]
	add r5, r0, r5
	ldr r0, _022267DC ; =0x09E1DA9E
	sub r0, r5, r0
	add r0, r4, r0
	lsl r4, r0, #5
	lsr r0, r0, #0x1b
	orr r0, r4
	add r0, r0, r1
	add r4, r0, #0
	add r5, r1, #0
	and r4, r2
	bic r5, r2
	orr r5, r4
	ldr r4, [sp, #0x1c]
	add r5, r4, r5
	ldr r4, _022267E0 ; =0x3FBF4CC0
	sub r4, r5, r4
	add r3, r3, r4
	lsl r4, r3, #9
	lsr r3, r3, #0x17
	orr r3, r4
	add r3, r3, r0
	add r4, r3, #0
	mvn r5, r1
	and r4, r1
	and r5, r0
	orr r5, r4
	ldr r4, [sp, #0x30]
	add r5, r4, r5
	ldr r4, _022267E4 ; =0x265E5A51
	add r4, r5, r4
	add r2, r2, r4
	lsl r4, r2, #0xe
	lsr r2, r2, #0x12
	orr r2, r4
	add r2, r2, r3
	add r4, r2, #0
	mvn r5, r0
	and r4, r0
	and r5, r3
	orr r5, r4
	ldr r4, [sp, #4]
	add r5, r4, r5
	ldr r4, _022267E8 ; =0x16493856
	sub r4, r5, r4
	add r1, r1, r4
	lsl r4, r1, #0x14
	lsr r1, r1, #0xc
	orr r1, r4
	add r1, r1, r2
	add r4, r1, #0
	mvn r5, r3
	and r4, r3
	and r5, r2
	orr r5, r4
	ldr r4, [sp, #0x18]
	add r5, r4, r5
	ldr r4, _022267EC ; =0x29D0EFA3
	sub r4, r5, r4
	add r0, r0, r4
	lsl r4, r0, #5
	lsr r0, r0, #0x1b
	orr r0, r4
	add r4, r0, r1
	add r0, r4, #0
	mvn r5, r2
	and r0, r2
	and r5, r1
	orr r5, r0
	ldr r0, [sp, #0x2c]
	add r5, r0, r5
	ldr r0, _022267F0 ; =0x02441453
	add r0, r5, r0
	add r0, r3, r0
	lsl r3, r0, #9
	lsr r0, r0, #0x17
	orr r0, r3
	add r3, r0, r4
	add r0, r3, #0
	mvn r5, r1
	and r0, r1
	and r5, r4
	orr r5, r0
	mov r0, ip
	add r5, r0, r5
	ldr r0, _022267F4 ; =0x275E197F
	sub r0, r5, r0
	add r0, r2, r0
	lsl r2, r0, #0xe
	lsr r0, r0, #0x12
	orr r0, r2
	add r0, r0, r3
	add r2, r0, #0
	mvn r5, r4
	and r2, r4
	and r5, r3
	orr r5, r2
	ldr r2, [sp, #0x14]
	add r5, r2, r5
	ldr r2, _022267F8 ; =0x182C0438
	sub r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #0x14
	lsr r1, r1, #0xc
	orr r1, r2
	add r5, r1, r0
	add r1, r5, #0
	mvn r2, r3
	and r1, r3
	and r2, r0
	orr r2, r1
	ldr r1, [sp, #0x28]
	add r2, r1, r2
	ldr r1, _022267FC ; =0x21E1CDE6
	add r1, r2, r1
	add r1, r4, r1
	lsl r2, r1, #5
	lsr r1, r1, #0x1b
	orr r1, r2
	add r2, r1, r5
	add r1, r2, #0
	mvn r4, r0
	and r1, r0
	and r4, r5
	orr r4, r1
	ldr r1, [sp, #0x40]
	add r4, r1, r4
	ldr r1, _02226800 ; =0x3CC8F82A
	sub r1, r4, r1
	add r1, r3, r1
	lsl r3, r1, #9
	lsr r1, r1, #0x17
	orr r1, r3
	add r1, r1, r2
	add r3, r1, #0
	mvn r4, r5
	and r3, r5
	and r4, r2
	orr r4, r3
	ldr r3, [sp, #0x10]
	add r4, r3, r4
	ldr r3, _02226804 ; =0x0B2AF279
	sub r3, r4, r3
	add r0, r0, r3
	lsl r3, r0, #0xe
	lsr r0, r0, #0x12
	orr r0, r3
	add r4, r0, r1
	add r0, r4, #0
	mvn r3, r2
	and r0, r2
	and r3, r1
	orr r3, r0
	ldr r0, [sp, #0x24]
	add r3, r0, r3
	ldr r0, _02226808 ; =0x455A14ED
	add r0, r3, r0
	add r0, r5, r0
	lsl r3, r0, #0x14
	lsr r0, r0, #0xc
	orr r0, r3
	add r3, r0, r4
	add r0, r3, #0
	mvn r5, r1
	and r0, r1
	and r5, r4
	orr r5, r0
	ldr r0, [sp, #0x38]
	add r5, r0, r5
	ldr r0, _0222680C ; =0x561C16FB
	sub r0, r5, r0
	add r0, r2, r0
	lsl r2, r0, #5
	lsr r0, r0, #0x1b
	orr r0, r2
	add r0, r0, r3
	add r2, r0, #0
	mvn r5, r4
	and r2, r4
	and r5, r3
	orr r5, r2
	ldr r2, [sp, #0xc]
	add r5, r2, r5
	ldr r2, _02226810 ; =0x03105C08
	sub r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #9
	lsr r1, r1, #0x17
	orr r1, r2
	add r5, r1, r0
	add r1, r5, #0
	mvn r2, r3
	and r1, r3
	and r2, r0
	orr r2, r1
	ldr r1, [sp, #0x20]
	add r2, r1, r2
	ldr r1, _02226814 ; =0x676F02D9
	add r1, r2, r1
	add r1, r4, r1
	lsl r2, r1, #0xe
	lsr r1, r1, #0x12
	orr r1, r2
	add r2, r1, r5
	add r1, r2, #0
	mvn r4, r0
	and r1, r0
	and r4, r5
	orr r4, r1
	ldr r1, [sp, #0x34]
	add r4, r1, r4
	ldr r1, _02226818 ; =0x72D5B376
	b _0222681C
	nop
_0222679C: .word 0x28955B88
_022267A0: .word 0x173848AA
_022267A4: .word 0x242070DB
_022267A8: .word 0x3E423112
_022267AC: .word 0x0A83F051
_022267B0: .word 0x4787C62A
_022267B4: .word 0x57CFB9ED
_022267B8: .word 0x02B96AFF
_022267BC: .word 0x698098D8
_022267C0: .word 0x74BB0851
_022267C4: .word 0x0000A44F
_022267C8: .word 0x76A32842
_022267CC: .word 0x6B901122
_022267D0: .word 0x02678E6D
_022267D4: .word 0x5986BC72
_022267D8: .word 0x49B40821
_022267DC: .word 0x09E1DA9E
_022267E0: .word 0x3FBF4CC0
_022267E4: .word 0x265E5A51
_022267E8: .word 0x16493856
_022267EC: .word 0x29D0EFA3
_022267F0: .word 0x02441453
_022267F4: .word 0x275E197F
_022267F8: .word 0x182C0438
_022267FC: .word 0x21E1CDE6
_02226800: .word 0x3CC8F82A
_02226804: .word 0x0B2AF279
_02226808: .word 0x455A14ED
_0222680C: .word 0x561C16FB
_02226810: .word 0x03105C08
_02226814: .word 0x676F02D9
_02226818: .word 0x72D5B376
_0222681C:
	sub r1, r4, r1
	add r1, r3, r1
	lsl r3, r1, #0x14
	lsr r1, r1, #0xc
	orr r1, r3
	add r1, r1, r2
	add r3, r1, #0
	eor r3, r2
	add r4, r5, #0
	eor r4, r3
	ldr r3, [sp, #0x18]
	add r4, r3, r4
	ldr r3, _02226B8C ; =0x0005C6BE
	sub r3, r4, r3
	add r0, r0, r3
	lsl r3, r0, #4
	lsr r0, r0, #0x1c
	orr r0, r3
	add r4, r0, r1
	add r0, r4, #0
	eor r0, r1
	add r3, r2, #0
	eor r3, r0
	ldr r0, [sp, #0x24]
	add r3, r0, r3
	ldr r0, _02226B90 ; =0x788E097F
	sub r0, r3, r0
	add r0, r5, r0
	lsl r3, r0, #0xb
	lsr r0, r0, #0x15
	orr r0, r3
	add r3, r0, r4
	add r0, r3, #0
	eor r0, r4
	add r5, r1, #0
	eor r5, r0
	ldr r0, [sp, #0x30]
	add r5, r0, r5
	ldr r0, _02226B94 ; =0x6D9D6122
	add r0, r5, r0
	add r0, r2, r0
	lsl r2, r0, #0x10
	lsr r0, r0, #0x10
	orr r0, r2
	add r0, r0, r3
	add r2, r0, #0
	eor r2, r3
	add r5, r4, #0
	eor r5, r2
	ldr r2, [sp, #0x40]
	add r5, r2, r5
	ldr r2, _02226B98 ; =0x021AC7F4
	sub r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #0x17
	lsr r1, r1, #9
	orr r1, r2
	add r5, r1, r0
	add r1, r5, #0
	eor r1, r0
	add r2, r3, #0
	eor r2, r1
	ldr r1, [sp, #8]
	add r2, r1, r2
	ldr r1, _02226B9C ; =0x5B4115BC
	sub r1, r2, r1
	add r1, r4, r1
	lsl r2, r1, #4
	lsr r1, r1, #0x1c
	orr r1, r2
	add r2, r1, r5
	add r1, r2, #0
	eor r1, r5
	add r4, r0, #0
	eor r4, r1
	ldr r1, [sp, #0x14]
	add r4, r1, r4
	ldr r1, _02226BA0 ; =0x4BDECFA9
	add r1, r4, r1
	add r1, r3, r1
	lsl r3, r1, #0xb
	lsr r1, r1, #0x15
	orr r1, r3
	add r1, r1, r2
	add r3, r1, #0
	eor r3, r2
	add r4, r5, #0
	eor r4, r3
	ldr r3, [sp, #0x20]
	add r4, r3, r4
	ldr r3, _02226BA4 ; =0x0944B4A0
	sub r3, r4, r3
	add r0, r0, r3
	lsl r3, r0, #0x10
	lsr r0, r0, #0x10
	orr r0, r3
	add r4, r0, r1
	add r0, r4, #0
	eor r0, r1
	add r3, r2, #0
	eor r3, r0
	ldr r0, [sp, #0x2c]
	add r3, r0, r3
	ldr r0, _02226BA8 ; =0x41404390
	sub r0, r3, r0
	add r0, r5, r0
	lsl r3, r0, #0x17
	lsr r0, r0, #9
	orr r0, r3
	add r3, r0, r4
	add r0, r3, #0
	eor r0, r4
	add r5, r1, #0
	eor r5, r0
	ldr r0, [sp, #0x38]
	add r5, r0, r5
	ldr r0, _02226BAC ; =0x289B7EC6
	add r0, r5, r0
	add r0, r2, r0
	lsl r2, r0, #4
	lsr r0, r0, #0x1c
	orr r0, r2
	add r0, r0, r3
	add r2, r0, #0
	eor r2, r3
	add r5, r4, #0
	eor r5, r2
	ldr r2, [sp, #4]
	add r5, r2, r5
	ldr r2, _02226BB0 ; =0x155ED806
	sub r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #0xb
	lsr r1, r1, #0x15
	orr r1, r2
	add r5, r1, r0
	add r1, r5, #0
	eor r1, r0
	add r2, r3, #0
	eor r2, r1
	ldr r1, [sp, #0x10]
	add r2, r1, r2
	ldr r1, _02226BB4 ; =0x2B10CF7B
	sub r1, r2, r1
	add r1, r4, r1
	lsl r2, r1, #0x10
	lsr r1, r1, #0x10
	orr r1, r2
	add r2, r1, r5
	add r1, r2, #0
	eor r1, r5
	add r4, r0, #0
	eor r4, r1
	ldr r1, [sp, #0x1c]
	add r4, r1, r4
	ldr r1, _02226BB8 ; =0x04881D05
	add r1, r4, r1
	add r1, r3, r1
	lsl r3, r1, #0x17
	lsr r1, r1, #9
	orr r1, r3
	add r1, r1, r2
	add r3, r1, #0
	eor r3, r2
	add r4, r5, #0
	eor r4, r3
	ldr r3, [sp, #0x28]
	add r4, r3, r4
	ldr r3, _02226BBC ; =0x262B2FC7
	sub r3, r4, r3
	add r0, r0, r3
	lsl r3, r0, #4
	lsr r0, r0, #0x1c
	orr r0, r3
	add r4, r0, r1
	add r0, r4, #0
	eor r0, r1
	add r3, r2, #0
	eor r3, r0
	ldr r0, [sp, #0x34]
	add r3, r0, r3
	ldr r0, _02226BC0 ; =0x1924661B
	sub r0, r3, r0
	add r0, r5, r0
	lsl r3, r0, #0xb
	lsr r0, r0, #0x15
	orr r0, r3
	add r3, r0, r4
	add r0, r3, #0
	eor r0, r4
	add r5, r1, #0
	eor r5, r0
	mov r0, ip
	add r5, r0, r5
	ldr r0, _02226BC4 ; =0x1FA27CF8
	add r0, r5, r0
	add r0, r2, r0
	lsl r2, r0, #0x10
	lsr r0, r0, #0x10
	orr r0, r2
	add r0, r0, r3
	add r2, r0, #0
	eor r2, r3
	add r5, r4, #0
	eor r5, r2
	ldr r2, [sp, #0xc]
	add r5, r2, r5
	ldr r2, _02226BC8 ; =0x3B53A99B
	sub r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #0x17
	lsr r1, r1, #9
	orr r1, r2
	add r5, r1, r0
	mvn r1, r3
	orr r1, r5
	add r2, r0, #0
	eor r2, r1
	ldr r1, [sp, #4]
	add r2, r1, r2
	ldr r1, _02226BCC ; =0x0BD6DDBC
	sub r1, r2, r1
	add r1, r4, r1
	lsl r2, r1, #6
	lsr r1, r1, #0x1a
	orr r1, r2
	add r2, r1, r5
	mvn r1, r0
	orr r1, r2
	add r4, r5, #0
	eor r4, r1
	ldr r1, [sp, #0x20]
	add r4, r1, r4
	ldr r1, _02226BD0 ; =0x432AFF97
	add r1, r4, r1
	add r1, r3, r1
	lsl r3, r1, #0xa
	lsr r1, r1, #0x16
	orr r1, r3
	add r1, r1, r2
	mvn r3, r5
	orr r3, r1
	add r4, r2, #0
	eor r4, r3
	ldr r3, [sp, #0x40]
	add r4, r3, r4
	ldr r3, _02226BD4 ; =0x546BDC59
	sub r3, r4, r3
	add r0, r0, r3
	lsl r3, r0, #0xf
	lsr r0, r0, #0x11
	orr r0, r3
	add r4, r0, r1
	mvn r0, r2
	orr r0, r4
	add r3, r1, #0
	eor r3, r0
	ldr r0, [sp, #0x18]
	add r3, r0, r3
	ldr r0, _02226BD8 ; =0x036C5FC7
	sub r0, r3, r0
	add r0, r5, r0
	lsl r3, r0, #0x15
	lsr r0, r0, #0xb
	orr r0, r3
	add r3, r0, r4
	mvn r0, r1
	orr r0, r3
	add r5, r4, #0
	eor r5, r0
	ldr r0, [sp, #0x34]
	add r5, r0, r5
	ldr r0, _02226BDC ; =0x655B59C3
	add r0, r5, r0
	add r0, r2, r0
	lsl r2, r0, #6
	lsr r0, r0, #0x1a
	orr r0, r2
	add r0, r0, r3
	mvn r2, r4
	orr r2, r0
	add r5, r3, #0
	eor r5, r2
	ldr r2, [sp, #0x10]
	add r5, r2, r5
	ldr r2, _02226BE0 ; =0x70F3336E
	sub r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #0xa
	lsr r1, r1, #0x16
	orr r1, r2
	add r5, r1, r0
	mvn r1, r3
	orr r1, r5
	add r2, r0, #0
	eor r2, r1
	ldr r1, [sp, #0x2c]
	add r2, r1, r2
	ldr r1, _02226BE4 ; =0x00100B83
	sub r1, r2, r1
	add r1, r4, r1
	lsl r2, r1, #0xf
	lsr r1, r1, #0x11
	orr r1, r2
	add r2, r1, r5
	mvn r1, r0
	orr r1, r2
	add r4, r5, #0
	eor r4, r1
	ldr r1, [sp, #8]
	add r4, r1, r4
	ldr r1, _02226BE8 ; =0x7A7BA22F
	sub r1, r4, r1
	add r1, r3, r1
	lsl r3, r1, #0x15
	lsr r1, r1, #0xb
	orr r1, r3
	add r1, r1, r2
	mvn r3, r5
	orr r3, r1
	add r4, r2, #0
	eor r4, r3
	ldr r3, [sp, #0x24]
	add r4, r3, r4
	ldr r3, _02226BEC ; =0x6FA87E4F
	add r3, r4, r3
	add r0, r0, r3
	lsl r3, r0, #6
	lsr r0, r0, #0x1a
	orr r0, r3
	add r3, r0, r1
	mvn r0, r2
	orr r0, r3
	eor r0, r1
	mov r4, ip
	add r4, r4, r0
	ldr r0, _02226BF0 ; =0x01D31920
	sub r0, r4, r0
	add r0, r5, r0
	lsl r4, r0, #0xa
	lsr r0, r0, #0x16
	orr r0, r4
	add r0, r0, r3
	mvn r4, r1
	orr r4, r0
	add r5, r3, #0
	eor r5, r4
	ldr r4, [sp, #0x1c]
	add r5, r4, r5
	ldr r4, _02226BF4 ; =0x5CFEBCEC
	sub r4, r5, r4
	add r2, r2, r4
	lsl r4, r2, #0xf
	lsr r2, r2, #0x11
	orr r2, r4
	add r4, r2, r0
	mvn r2, r3
	orr r2, r4
	add r5, r0, #0
	eor r5, r2
	ldr r2, [sp, #0x38]
	add r5, r2, r5
	ldr r2, _02226BF8 ; =0x4E0811A1
	add r2, r5, r2
	add r1, r1, r2
	lsl r2, r1, #0x15
	lsr r1, r1, #0xb
	orr r1, r2
	add r2, r1, r4
	mvn r1, r0
	orr r1, r2
	add r5, r4, #0
	eor r5, r1
	ldr r1, [sp, #0x14]
	add r5, r1, r5
	ldr r1, _02226BFC ; =0x08AC817E
	sub r1, r5, r1
	add r1, r3, r1
	lsl r3, r1, #6
	lsr r1, r1, #0x1a
	orr r1, r3
	add r1, r1, r2
	mvn r3, r4
	orr r3, r1
	add r5, r2, #0
	eor r5, r3
	ldr r3, [sp, #0x30]
	add r5, r3, r5
	ldr r3, _02226C00 ; =0x42C50DCB
	sub r3, r5, r3
	add r0, r0, r3
	lsl r3, r0, #0xa
	lsr r0, r0, #0x16
	orr r0, r3
	add r5, r0, r1
	mvn r0, r2
	orr r0, r5
	add r3, r1, #0
	eor r3, r0
	ldr r0, [sp, #0xc]
	add r3, r0, r3
	ldr r0, _02226C04 ; =0x2AD7D2BB
	add r0, r3, r0
	add r0, r4, r0
	lsl r3, r0, #0xf
	lsr r0, r0, #0x11
	orr r0, r3
	add r3, r0, r5
	mvn r0, r1
	orr r0, r3
	add r4, r5, #0
	eor r4, r0
	ldr r0, [sp, #0x28]
	add r4, r0, r4
	ldr r0, _02226C08 ; =0x14792C6F
	sub r0, r4, r0
	add r0, r2, r0
	lsl r2, r0, #0x15
	lsr r0, r0, #0xb
	orr r0, r2
	ldr r2, [r7]
	add r0, r0, r3
	add r1, r2, r1
	str r1, [r7]
	ldr r1, [r7, #4]
	mov r2, #0x40
	add r0, r1, r0
	str r0, [r7, #4]
	ldr r0, [r7, #8]
	mov r1, #0
	add r0, r0, r3
	str r0, [r7, #8]
	ldr r0, [r7, #0xc]
	add r0, r0, r5
	str r0, [r7, #0xc]
	add r0, sp, #0x44
	bl ov13_02226C7C
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02226B8C: .word 0x0005C6BE
_02226B90: .word 0x788E097F
_02226B94: .word 0x6D9D6122
_02226B98: .word 0x021AC7F4
_02226B9C: .word 0x5B4115BC
_02226BA0: .word 0x4BDECFA9
_02226BA4: .word 0x0944B4A0
_02226BA8: .word 0x41404390
_02226BAC: .word 0x289B7EC6
_02226BB0: .word 0x155ED806
_02226BB4: .word 0x2B10CF7B
_02226BB8: .word 0x04881D05
_02226BBC: .word 0x262B2FC7
_02226BC0: .word 0x1924661B
_02226BC4: .word 0x1FA27CF8
_02226BC8: .word 0x3B53A99B
_02226BCC: .word 0x0BD6DDBC
_02226BD0: .word 0x432AFF97
_02226BD4: .word 0x546BDC59
_02226BD8: .word 0x036C5FC7
_02226BDC: .word 0x655B59C3
_02226BE0: .word 0x70F3336E
_02226BE4: .word 0x00100B83
_02226BE8: .word 0x7A7BA22F
_02226BEC: .word 0x6FA87E4F
_02226BF0: .word 0x01D31920
_02226BF4: .word 0x5CFEBCEC
_02226BF8: .word 0x4E0811A1
_02226BFC: .word 0x08AC817E
_02226C00: .word 0x42C50DCB
_02226C04: .word 0x2AD7D2BB
_02226C08: .word 0x14792C6F
	thumb_func_end ov13_022263C4

	thumb_func_start ov13_02226C0C
ov13_02226C0C: ; 0x02226C0C
	push {r4, r5}
	mov r4, #0
	cmp r2, #0
	bls _02226C34
_02226C14:
	ldr r5, [r1]
	add r3, r0, r4
	strb r5, [r0, r4]
	ldr r5, [r1]
	add r4, r4, #4
	lsr r5, r5, #8
	strb r5, [r3, #1]
	ldr r5, [r1]
	lsr r5, r5, #0x10
	strb r5, [r3, #2]
	ldr r5, [r1]
	add r1, r1, #4
	lsr r5, r5, #0x18
	strb r5, [r3, #3]
	cmp r4, r2
	blo _02226C14
_02226C34:
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02226C0C

	thumb_func_start ov13_02226C38
ov13_02226C38: ; 0x02226C38
	push {r4, r5, r6, r7}
	mov r7, #0
	cmp r2, #0
	bls _02226C5E
_02226C40:
	add r6, r1, r7
	ldrb r3, [r6, #3]
	lsl r5, r3, #0x18
	ldrb r3, [r6, #2]
	ldrb r6, [r6, #1]
	lsl r4, r3, #0x10
	ldrb r3, [r1, r7]
	lsl r6, r6, #8
	add r7, r7, #4
	orr r3, r6
	orr r3, r4
	orr r3, r5
	stmia r0!, {r3}
	cmp r7, r2
	blo _02226C40
_02226C5E:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02226C38

	thumb_func_start ov13_02226C64
ov13_02226C64: ; 0x02226C64
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	bls _02226C76
_02226C6C:
	ldrb r3, [r1, r4]
	strb r3, [r0, r4]
	add r4, r4, #1
	cmp r4, r2
	blo _02226C6C
_02226C76:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02226C64

	thumb_func_start ov13_02226C7C
ov13_02226C7C: ; 0x02226C7C
	mov r3, #0
	cmp r2, #0
	bls _02226C90
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
_02226C86:
	add r3, r3, #1
	strb r1, [r0]
	add r0, r0, #1
	cmp r3, r2
	blo _02226C86
_02226C90:
	bx lr
	.balign 4, 0
	thumb_func_end ov13_02226C7C

	thumb_func_start ov13_02226C94
ov13_02226C94: ; 0x02226C94
	push {r4, r5, r6, lr}
	sub sp, #0x58
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r0, sp, #0
	bl ov13_022262D0
	add r0, sp, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov13_022262F8
	add r0, r5, #0
	add r1, sp, #0
	bl ov13_02226370
	add sp, #0x58
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov13_02226C94

	thumb_func_start ov13_02226CBC
ov13_02226CBC: ; 0x02226CBC
	push {r3, lr}
	bl OS_GetTick
	lsr r2, r0, #0x1a
	lsl r1, r1, #6
	orr r1, r2
	ldr r2, _02226CD4 ; =0x000082EA
	lsl r0, r0, #6
	mov r3, #0
	bl _ll_udiv
	pop {r3, pc}
	.balign 4, 0
_02226CD4: .word 0x000082EA
	thumb_func_end ov13_02226CBC

	thumb_func_start ov13_02226CD8
ov13_02226CD8: ; 0x02226CD8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mul r4, r1
	ldr r1, _02226CF8 ; =ov13_0224DF30
	add r0, r4, #0
	ldr r1, [r1, #4]
	blx r1
	add r5, r0, #0
	beq _02226CF2
	mov r1, #0
	add r2, r4, #0
	bl memset
_02226CF2:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	nop
_02226CF8: .word ov13_0224DF30
	thumb_func_end ov13_02226CD8

	thumb_func_start ov13_02226CFC
ov13_02226CFC: ; 0x02226CFC
	push {r3, lr}
	ldr r1, _02226D08 ; =ov13_0224DF30
	ldr r1, [r1, #0xc]
	blx r1
	pop {r3, pc}
	nop
_02226D08: .word ov13_0224DF30
	thumb_func_end ov13_02226CFC

	thumb_func_start ov13_02226D0C
ov13_02226D0C: ; 0x02226D0C
	push {r4, r5}
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0xf0
	and r1, r3
	asr r5, r1, #4
	mov r1, #0xf
	add r2, r0, #0
	mov r4, #0
	and r1, r3
_02226D20:
	cmp r5, #9
	bgt _02226D28
	add r5, #0x30
	b _02226D2A
_02226D28:
	add r5, #0x37
_02226D2A:
	add r4, r4, #1
	strb r5, [r2]
	add r2, r2, #1
	add r5, r1, #0
	cmp r4, #2
	blt _02226D20
	mov r1, #0
	strb r1, [r2]
	sub r0, r2, r0
	pop {r4, r5}
	bx lr
	thumb_func_end ov13_02226D0C

	thumb_func_start ov13_02226D40
ov13_02226D40: ; 0x02226D40
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	add r6, r1, #0
	add r4, r0, #0
	mov r5, #0
	mov r7, #0x3a
_02226D4C:
	mov r1, #0
	ldrsb r1, [r6, r1]
	add r0, r4, #0
	add r6, r6, #1
	bl ov13_02226D0C
	add r0, r4, r0
	add r4, r0, #0
	cmp r5, #5
	bge _02226D64
	add r4, r0, #1
	strb r7, [r0]
_02226D64:
	add r5, r5, #1
	cmp r5, #6
	blt _02226D4C
	mov r0, #0
	strb r0, [r4]
	ldr r0, [sp]
	sub r0, r4, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov13_02226D40

	thumb_func_start ov13_02226D74
ov13_02226D74: ; 0x02226D74
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02226E44 ; =ov13_0224DF30
	ldr r0, [r0, #0x38]
	cmp r0, #1
	blt _02226D8E
	cmp r0, #5
	bgt _02226D8E
	mov r0, #9
	add sp, #8
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02226D8E:
	ldr r5, _02226E48 ; =ov13_02245A58
	ldr r0, _02226E44 ; =ov13_0224DF30
	mov r6, #7
	str r1, [r5, #0x10]
	str r6, [r0, #0x38]
	str r2, [r0, #0x7c]
	ldr r2, [sp, #0x18]
	str r3, [r0, #4]
	str r2, [r0, #0xc]
	ldr r0, [sp, #0x1c]
	str r0, [r5, #8]
	add r0, r1, #0
	bl ov13_02223EE0
	mov r2, #1
	ldr r1, _02226E44 ; =ov13_0224DF30
	cmp r0, #0
	str r2, [r1, #0x74]
	bge _02226DBA
	str r0, [r1, #0x78]
	add sp, #8
	pop {r4, r5, r6, pc}
_02226DBA:
	add r0, r5, #0
	ldr r0, [r0, #8]
	ldr r1, [r1, #4]
	blx r1
	ldr r1, _02226E44 ; =ov13_0224DF30
	cmp r0, #0
	str r0, [r1, #0x30]
	bne _02226DD4
	add r0, r6, #0
	sub r0, #8
	str r0, [r1, #0x78]
	add sp, #8
	pop {r4, r5, r6, pc}
_02226DD4:
	bl OS_IsThreadAvailable
	cmp r0, #1
	beq _02226DE8
	add r0, r6, #0
	ldr r1, _02226E44 ; =ov13_0224DF30
	sub r0, #0x10
	str r0, [r1, #0x78]
	add sp, #8
	pop {r4, r5, r6, pc}
_02226DE8:
	add r0, r5, #0
	ldr r3, [r0, #8]
	ldr r0, _02226E4C ; =ov13_0224DFDC
	str r3, [sp]
	str r4, [sp, #4]
	ldr r4, _02226E44 ; =ov13_0224DF30
	ldr r1, _02226E50 ; =ov13_02225320
	ldr r5, [r4, #0x30]
	mov r4, #7
	bic r3, r4
	mov r2, #0
	add r3, r5, r3
	bl OS_CreateThread
	ldr r0, _02226E44 ; =ov13_0224DF30
	mov r1, #1
	str r1, [r0, #0x38]
	bl ov13_02226CBC
	ldr r1, _02226E54 ; =0x0000EA60
	ldr r5, _02226E58 ; =ov13_0224E09C
	add r1, r0, r1
	ldr r0, _02226E48 ; =ov13_02245A58
	add r4, r6, #0
	str r1, [r0, #0xc]
	mov r0, #0
	ldr r1, _02226E44 ; =ov13_0224DF30
	add r2, r0, #0
	str r0, [r1, #0x10]
	add r1, r0, #0
	add r3, r0, #0
_02226E26:
	stmia r5!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	sub r4, r4, #1
	bne _02226E26
	stmia r5!, {r0, r1}
	bl ov13_02226F3C
	ldr r0, _02226E4C ; =ov13_0224DFDC
	bl OS_WakeupThreadDirect
	ldr r1, _02226E44 ; =ov13_0224DF30
	mov r0, #1
	str r0, [r1, #0x64]
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02226E44: .word ov13_0224DF30
_02226E48: .word ov13_02245A58
_02226E4C: .word ov13_0224DFDC
_02226E50: .word ov13_02225320
_02226E54: .word 0x0000EA60
_02226E58: .word ov13_0224E09C
	thumb_func_end ov13_02226D74

	thumb_func_start ov13_02226E5C
ov13_02226E5C: ; 0x02226E5C
	push {r4, r5, r6, lr}
	ldr r4, _02226EE8 ; =ov13_0224DF30
	ldr r0, [r4, #0x64]
	cmp r0, #0
	beq _02226ECC
	ldr r6, [r4, #0x38]
	mov r0, #1
	str r0, [r4, #0x10]
	mov r5, #0x64
	b _02226E76
_02226E70:
	add r0, r5, #0
	bl OS_Sleep
_02226E76:
	ldr r0, [r4, #0x38]
	cmp r0, #1
	blt _02226E80
	cmp r0, #5
	ble _02226E70
_02226E80:
	mov r0, #0x7d
	lsl r0, r0, #2
	bl OS_Sleep
	ldr r0, _02226EEC ; =ov13_0224DFDC
	bl OS_IsThreadTerminated
	cmp r0, #0
	bne _02226EAA
	ldr r4, _02226EEC ; =ov13_0224DFDC
_02226E94:
	add r0, r4, #0
	bl OS_WakeupThreadDirect
	add r0, r4, #0
	bl OS_JoinThread
	add r0, r4, #0
	bl OS_IsThreadTerminated
	cmp r0, #0
	beq _02226E94
_02226EAA:
	ldr r1, _02226EE8 ; =ov13_0224DF30
	ldr r0, [r1, #0x30]
	cmp r0, #0
	beq _02226EBC
	ldr r1, [r1, #0xc]
	blx r1
	ldr r0, _02226EE8 ; =ov13_0224DF30
	mov r1, #0
	str r1, [r0, #0x30]
_02226EBC:
	ldr r0, _02226EE8 ; =ov13_0224DF30
	mov r1, #0
	str r1, [r0, #0x64]
	ldr r0, [r0, #0x38]
	cmp r6, r0
	beq _02226ECC
	bl ov13_02226F3C
_02226ECC:
	ldr r0, _02226EE8 ; =ov13_0224DF30
	ldr r0, [r0, #0x74]
	cmp r0, #0
	ble _02226EE0
	bl ov13_02223F84
	ldr r1, _02226EE8 ; =ov13_0224DF30
	mov r2, #0
	str r2, [r1, #0x74]
	pop {r4, r5, r6, pc}
_02226EE0:
	mov r0, #9
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_02226EE8: .word ov13_0224DF30
_02226EEC: .word ov13_0224DFDC
	thumb_func_end ov13_02226E5C

	thumb_func_start ov13_02226EF0
ov13_02226EF0: ; 0x02226EF0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02226F20 ; =ov13_0224DF30
	ldr r0, [r0, #0x38]
	str r0, [r4]
	ldr r0, _02226F24 ; =ov13_02245A58
	ldr r1, [r0, #0xc]
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	bne _02226F08
	b _02226F12
_02226F08:
	bl ov13_02226CBC
	ldr r1, _02226F24 ; =ov13_02245A58
	ldr r1, [r1, #0xc]
	sub r0, r1, r0
_02226F12:
	str r0, [r4, #4]
	ldr r0, _02226F20 ; =ov13_0224DF30
	ldr r0, [r0, #0x78]
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	nop
_02226F20: .word ov13_0224DF30
_02226F24: .word ov13_02245A58
	thumb_func_end ov13_02226EF0

	thumb_func_start ov13_02226F28
ov13_02226F28: ; 0x02226F28
	push {r3, lr}
	ldr r1, _02226F38 ; =ov13_0224E09C
	mov r2, #0xe8
	bl memcpy
	mov r0, #1
	pop {r3, pc}
	nop
_02226F38: .word ov13_0224E09C
	thumb_func_end ov13_02226F28

	thumb_func_start ov13_02226F3C
ov13_02226F3C: ; 0x02226F3C
	push {lr}
	sub sp, #0xc
	add r0, sp, #0
	bl ov13_02226EF0
	ldr r1, _02226F54 ; =ov13_0224DF30
	add r0, sp, #0
	ldr r1, [r1, #0x7c]
	blx r1
	add sp, #0xc
	pop {pc}
	nop
_02226F54: .word ov13_0224DF30
	thumb_func_end ov13_02226F3C

	.rodata

_0224267C:
	.byte 0xFF, 0xFF, 0xFF, 0xFF

ov13_02242680: ; 0x02242680
	.byte 0x06, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x00

ov13_02242688: ; 0x02242688
	.byte 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02
	.byte 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20
	.byte 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x36

ov13_022426B0: ; 0x022426B0
	.byte 0xF4, 0x51, 0x50, 0xA7, 0x41, 0x7E, 0x53, 0x65, 0x17, 0x1A, 0xC3, 0xA4, 0x27, 0x3A, 0x96, 0x5E
	.byte 0xAB, 0x3B, 0xCB, 0x6B, 0x9D, 0x1F, 0xF1, 0x45, 0xFA, 0xAC, 0xAB, 0x58, 0xE3, 0x4B, 0x93, 0x03
	.byte 0x30, 0x20, 0x55, 0xFA, 0x76, 0xAD, 0xF6, 0x6D, 0xCC, 0x88, 0x91, 0x76, 0x02, 0xF5, 0x25, 0x4C
	.byte 0xE5, 0x4F, 0xFC, 0xD7, 0x2A, 0xC5, 0xD7, 0xCB, 0x35, 0x26, 0x80, 0x44, 0x62, 0xB5, 0x8F, 0xA3
	.byte 0xB1, 0xDE, 0x49, 0x5A, 0xBA, 0x25, 0x67, 0x1B, 0xEA, 0x45, 0x98, 0x0E, 0xFE, 0x5D, 0xE1, 0xC0
	.byte 0x2F, 0xC3, 0x02, 0x75, 0x4C, 0x81, 0x12, 0xF0, 0x46, 0x8D, 0xA3, 0x97, 0xD3, 0x6B, 0xC6, 0xF9
	.byte 0x8F, 0x03, 0xE7, 0x5F, 0x92, 0x15, 0x95, 0x9C, 0x6D, 0xBF, 0xEB, 0x7A, 0x52, 0x95, 0xDA, 0x59
	.byte 0xBE, 0xD4, 0x2D, 0x83, 0x74, 0x58, 0xD3, 0x21, 0xE0, 0x49, 0x29, 0x69, 0xC9, 0x8E, 0x44, 0xC8
	.byte 0xC2, 0x75, 0x6A, 0x89, 0x8E, 0xF4, 0x78, 0x79, 0x58, 0x99, 0x6B, 0x3E, 0xB9, 0x27, 0xDD, 0x71
	.byte 0xE1, 0xBE, 0xB6, 0x4F, 0x88, 0xF0, 0x17, 0xAD, 0x20, 0xC9, 0x66, 0xAC, 0xCE, 0x7D, 0xB4, 0x3A
	.byte 0xDF, 0x63, 0x18, 0x4A, 0x1A, 0xE5, 0x82, 0x31, 0x51, 0x97, 0x60, 0x33, 0x53, 0x62, 0x45, 0x7F
	.byte 0x64, 0xB1, 0xE0, 0x77, 0x6B, 0xBB, 0x84, 0xAE, 0x81, 0xFE, 0x1C, 0xA0, 0x08, 0xF9, 0x94, 0x2B
	.byte 0x48, 0x70, 0x58, 0x68, 0x45, 0x8F, 0x19, 0xFD, 0xDE, 0x94, 0x87, 0x6C, 0x7B, 0x52, 0xB7, 0xF8
	.byte 0x73, 0xAB, 0x23, 0xD3, 0x4B, 0x72, 0xE2, 0x02, 0x1F, 0xE3, 0x57, 0x8F, 0x55, 0x66, 0x2A, 0xAB
	.byte 0xEB, 0xB2, 0x07, 0x28, 0xB5, 0x2F, 0x03, 0xC2, 0xC5, 0x86, 0x9A, 0x7B, 0x37, 0xD3, 0xA5, 0x08
	.byte 0x28, 0x30, 0xF2, 0x87, 0xBF, 0x23, 0xB2, 0xA5, 0x03, 0x02, 0xBA, 0x6A, 0x16, 0xED, 0x5C, 0x82
	.byte 0xCF, 0x8A, 0x2B, 0x1C, 0x79, 0xA7, 0x92, 0xB4, 0x07, 0xF3, 0xF0, 0xF2, 0x69, 0x4E, 0xA1, 0xE2
	.byte 0xDA, 0x65, 0xCD, 0xF4, 0x05, 0x06, 0xD5, 0xBE, 0x34, 0xD1, 0x1F, 0x62, 0xA6, 0xC4, 0x8A, 0xFE
	.byte 0x2E, 0x34, 0x9D, 0x53, 0xF3, 0xA2, 0xA0, 0x55, 0x8A, 0x05, 0x32, 0xE1, 0xF6, 0xA4, 0x75, 0xEB
	.byte 0x83, 0x0B, 0x39, 0xEC, 0x60, 0x40, 0xAA, 0xEF, 0x71, 0x5E, 0x06, 0x9F, 0x6E, 0xBD, 0x51, 0x10
	.byte 0x21, 0x3E, 0xF9, 0x8A, 0xDD, 0x96, 0x3D, 0x06, 0x3E, 0xDD, 0xAE, 0x05, 0xE6, 0x4D, 0x46, 0xBD
	.byte 0x54, 0x91, 0xB5, 0x8D, 0xC4, 0x71, 0x05, 0x5D, 0x06, 0x04, 0x6F, 0xD4, 0x50, 0x60, 0xFF, 0x15
	.byte 0x98, 0x19, 0x24, 0xFB, 0xBD, 0xD6, 0x97, 0xE9, 0x40, 0x89, 0xCC, 0x43, 0xD9, 0x67, 0x77, 0x9E
	.byte 0xE8, 0xB0, 0xBD, 0x42, 0x89, 0x07, 0x88, 0x8B, 0x19, 0xE7, 0x38, 0x5B, 0xC8, 0x79, 0xDB, 0xEE
	.byte 0x7C, 0xA1, 0x47, 0x0A, 0x42, 0x7C, 0xE9, 0x0F, 0x84, 0xF8, 0xC9, 0x1E, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x09, 0x83, 0x86, 0x2B, 0x32, 0x48, 0xED, 0x11, 0x1E, 0xAC, 0x70, 0x5A, 0x6C, 0x4E, 0x72
	.byte 0x0E, 0xFD, 0xFB, 0xFF, 0x85, 0x0F, 0x56, 0x38, 0xAE, 0x3D, 0x1E, 0xD5, 0x2D, 0x36, 0x27, 0x39
	.byte 0x0F, 0x0A, 0x64, 0xD9, 0x5C, 0x68, 0x21, 0xA6, 0x5B, 0x9B, 0xD1, 0x54, 0x36, 0x24, 0x3A, 0x2E
	.byte 0x0A, 0x0C, 0xB1, 0x67, 0x57, 0x93, 0x0F, 0xE7, 0xEE, 0xB4, 0xD2, 0x96, 0x9B, 0x1B, 0x9E, 0x91
	.byte 0xC0, 0x80, 0x4F, 0xC5, 0xDC, 0x61, 0xA2, 0x20, 0x77, 0x5A, 0x69, 0x4B, 0x12, 0x1C, 0x16, 0x1A
	.byte 0x93, 0xE2, 0x0A, 0xBA, 0xA0, 0xC0, 0xE5, 0x2A, 0x22, 0x3C, 0x43, 0xE0, 0x1B, 0x12, 0x1D, 0x17
	.byte 0x09, 0x0E, 0x0B, 0x0D, 0x8B, 0xF2, 0xAD, 0xC7, 0xB6, 0x2D, 0xB9, 0xA8, 0x1E, 0x14, 0xC8, 0xA9
	.byte 0xF1, 0x57, 0x85, 0x19, 0x75, 0xAF, 0x4C, 0x07, 0x99, 0xEE, 0xBB, 0xDD, 0x7F, 0xA3, 0xFD, 0x60
	.byte 0x01, 0xF7, 0x9F, 0x26, 0x72, 0x5C, 0xBC, 0xF5, 0x66, 0x44, 0xC5, 0x3B, 0xFB, 0x5B, 0x34, 0x7E
	.byte 0x43, 0x8B, 0x76, 0x29, 0x23, 0xCB, 0xDC, 0xC6, 0xED, 0xB6, 0x68, 0xFC, 0xE4, 0xB8, 0x63, 0xF1
	.byte 0x31, 0xD7, 0xCA, 0xDC, 0x63, 0x42, 0x10, 0x85, 0x97, 0x13, 0x40, 0x22, 0xC6, 0x84, 0x20, 0x11
	.byte 0x4A, 0x85, 0x7D, 0x24, 0xBB, 0xD2, 0xF8, 0x3D, 0xF9, 0xAE, 0x11, 0x32, 0x29, 0xC7, 0x6D, 0xA1
	.byte 0x9E, 0x1D, 0x4B, 0x2F, 0xB2, 0xDC, 0xF3, 0x30, 0x86, 0x0D, 0xEC, 0x52, 0xC1, 0x77, 0xD0, 0xE3
	.byte 0xB3, 0x2B, 0x6C, 0x16, 0x70, 0xA9, 0x99, 0xB9, 0x94, 0x11, 0xFA, 0x48, 0xE9, 0x47, 0x22, 0x64
	.byte 0xFC, 0xA8, 0xC4, 0x8C, 0xF0, 0xA0, 0x1A, 0x3F, 0x7D, 0x56, 0xD8, 0x2C, 0x33, 0x22, 0xEF, 0x90
	.byte 0x49, 0x87, 0xC7, 0x4E, 0x38, 0xD9, 0xC1, 0xD1, 0xCA, 0x8C, 0xFE, 0xA2, 0xD4, 0x98, 0x36, 0x0B
	.byte 0xF5, 0xA6, 0xCF, 0x81, 0x7A, 0xA5, 0x28, 0xDE, 0xB7, 0xDA, 0x26, 0x8E, 0xAD, 0x3F, 0xA4, 0xBF
	.byte 0x3A, 0x2C, 0xE4, 0x9D, 0x78, 0x50, 0x0D, 0x92, 0x5F, 0x6A, 0x9B, 0xCC, 0x7E, 0x54, 0x62, 0x46
	.byte 0x8D, 0xF6, 0xC2, 0x13, 0xD8, 0x90, 0xE8, 0xB8, 0x39, 0x2E, 0x5E, 0xF7, 0xC3, 0x82, 0xF5, 0xAF
	.byte 0x5D, 0x9F, 0xBE, 0x80, 0xD0, 0x69, 0x7C, 0x93, 0xD5, 0x6F, 0xA9, 0x2D, 0x25, 0xCF, 0xB3, 0x12
	.byte 0xAC, 0xC8, 0x3B, 0x99, 0x18, 0x10, 0xA7, 0x7D, 0x9C, 0xE8, 0x6E, 0x63, 0x3B, 0xDB, 0x7B, 0xBB
	.byte 0x26, 0xCD, 0x09, 0x78, 0x59, 0x6E, 0xF4, 0x18, 0x9A, 0xEC, 0x01, 0xB7, 0x4F, 0x83, 0xA8, 0x9A
	.byte 0x95, 0xE6, 0x65, 0x6E, 0xFF, 0xAA, 0x7E, 0xE6, 0xBC, 0x21, 0x08, 0xCF, 0x15, 0xEF, 0xE6, 0xE8
	.byte 0xE7, 0xBA, 0xD9, 0x9B, 0x6F, 0x4A, 0xCE, 0x36, 0x9F, 0xEA, 0xD4, 0x09, 0xB0, 0x29, 0xD6, 0x7C
	.byte 0xA4, 0x31, 0xAF, 0xB2, 0x3F, 0x2A, 0x31, 0x23, 0xA5, 0xC6, 0x30, 0x94, 0xA2, 0x35, 0xC0, 0x66
	.byte 0x4E, 0x74, 0x37, 0xBC, 0x82, 0xFC, 0xA6, 0xCA, 0x90, 0xE0, 0xB0, 0xD0, 0xA7, 0x33, 0x15, 0xD8
	.byte 0x04, 0xF1, 0x4A, 0x98, 0xEC, 0x41, 0xF7, 0xDA, 0xCD, 0x7F, 0x0E, 0x50, 0x91, 0x17, 0x2F, 0xF6
	.byte 0x4D, 0x76, 0x8D, 0xD6, 0xEF, 0x43, 0x4D, 0xB0, 0xAA, 0xCC, 0x54, 0x4D, 0x96, 0xE4, 0xDF, 0x04
	.byte 0xD1, 0x9E, 0xE3, 0xB5, 0x6A, 0x4C, 0x1B, 0x88, 0x2C, 0xC1, 0xB8, 0x1F, 0x65, 0x46, 0x7F, 0x51
	.byte 0x5E, 0x9D, 0x04, 0xEA, 0x8C, 0x01, 0x5D, 0x35, 0x87, 0xFA, 0x73, 0x74, 0x0B, 0xFB, 0x2E, 0x41
	.byte 0x67, 0xB3, 0x5A, 0x1D, 0xDB, 0x92, 0x52, 0xD2, 0x10, 0xE9, 0x33, 0x56, 0xD6, 0x6D, 0x13, 0x47
	.byte 0xD7, 0x9A, 0x8C, 0x61, 0xA1, 0x37, 0x7A, 0x0C, 0xF8, 0x59, 0x8E, 0x14, 0x13, 0xEB, 0x89, 0x3C
	.byte 0xA9, 0xCE, 0xEE, 0x27, 0x61, 0xB7, 0x35, 0xC9, 0x1C, 0xE1, 0xED, 0xE5, 0x47, 0x7A, 0x3C, 0xB1
	.byte 0xD2, 0x9C, 0x59, 0xDF, 0xF2, 0x55, 0x3F, 0x73, 0x14, 0x18, 0x79, 0xCE, 0xC7, 0x73, 0xBF, 0x37
	.byte 0xF7, 0x53, 0xEA, 0xCD, 0xFD, 0x5F, 0x5B, 0xAA, 0x3D, 0xDF, 0x14, 0x6F, 0x44, 0x78, 0x86, 0xDB
	.byte 0xAF, 0xCA, 0x81, 0xF3, 0x68, 0xB9, 0x3E, 0xC4, 0x24, 0x38, 0x2C, 0x34, 0xA3, 0xC2, 0x5F, 0x40
	.byte 0x1D, 0x16, 0x72, 0xC3, 0xE2, 0xBC, 0x0C, 0x25, 0x3C, 0x28, 0x8B, 0x49, 0x0D, 0xFF, 0x41, 0x95
	.byte 0xA8, 0x39, 0x71, 0x01, 0x0C, 0x08, 0xDE, 0xB3, 0xB4, 0xD8, 0x9C, 0xE4, 0x56, 0x64, 0x90, 0xC1
	.byte 0xCB, 0x7B, 0x61, 0x84, 0x32, 0xD5, 0x70, 0xB6, 0x6C, 0x48, 0x74, 0x5C, 0xB8, 0xD0, 0x42, 0x57

ov13_02242AB0: ; 0x02242AB0
	.byte 0x51, 0x50, 0xA7, 0xF4, 0x7E, 0x53, 0x65, 0x41, 0x1A, 0xC3, 0xA4, 0x17, 0x3A, 0x96, 0x5E, 0x27
	.byte 0x3B, 0xCB, 0x6B, 0xAB, 0x1F, 0xF1, 0x45, 0x9D, 0xAC, 0xAB, 0x58, 0xFA, 0x4B, 0x93, 0x03, 0xE3
	.byte 0x20, 0x55, 0xFA, 0x30, 0xAD, 0xF6, 0x6D, 0x76, 0x88, 0x91, 0x76, 0xCC, 0xF5, 0x25, 0x4C, 0x02
	.byte 0x4F, 0xFC, 0xD7, 0xE5, 0xC5, 0xD7, 0xCB, 0x2A, 0x26, 0x80, 0x44, 0x35, 0xB5, 0x8F, 0xA3, 0x62
	.byte 0xDE, 0x49, 0x5A, 0xB1, 0x25, 0x67, 0x1B, 0xBA, 0x45, 0x98, 0x0E, 0xEA, 0x5D, 0xE1, 0xC0, 0xFE
	.byte 0xC3, 0x02, 0x75, 0x2F, 0x81, 0x12, 0xF0, 0x4C, 0x8D, 0xA3, 0x97, 0x46, 0x6B, 0xC6, 0xF9, 0xD3
	.byte 0x03, 0xE7, 0x5F, 0x8F, 0x15, 0x95, 0x9C, 0x92, 0xBF, 0xEB, 0x7A, 0x6D, 0x95, 0xDA, 0x59, 0x52
	.byte 0xD4, 0x2D, 0x83, 0xBE, 0x58, 0xD3, 0x21, 0x74, 0x49, 0x29, 0x69, 0xE0, 0x8E, 0x44, 0xC8, 0xC9
	.byte 0x75, 0x6A, 0x89, 0xC2, 0xF4, 0x78, 0x79, 0x8E, 0x99, 0x6B, 0x3E, 0x58, 0x27, 0xDD, 0x71, 0xB9
	.byte 0xBE, 0xB6, 0x4F, 0xE1, 0xF0, 0x17, 0xAD, 0x88, 0xC9, 0x66, 0xAC, 0x20, 0x7D, 0xB4, 0x3A, 0xCE
	.byte 0x63, 0x18, 0x4A, 0xDF, 0xE5, 0x82, 0x31, 0x1A, 0x97, 0x60, 0x33, 0x51, 0x62, 0x45, 0x7F, 0x53
	.byte 0xB1, 0xE0, 0x77, 0x64, 0xBB, 0x84, 0xAE, 0x6B, 0xFE, 0x1C, 0xA0, 0x81, 0xF9, 0x94, 0x2B, 0x08
	.byte 0x70, 0x58, 0x68, 0x48, 0x8F, 0x19, 0xFD, 0x45, 0x94, 0x87, 0x6C, 0xDE, 0x52, 0xB7, 0xF8, 0x7B
	.byte 0xAB, 0x23, 0xD3, 0x73, 0x72, 0xE2, 0x02, 0x4B, 0xE3, 0x57, 0x8F, 0x1F, 0x66, 0x2A, 0xAB, 0x55
	.byte 0xB2, 0x07, 0x28, 0xEB, 0x2F, 0x03, 0xC2, 0xB5, 0x86, 0x9A, 0x7B, 0xC5, 0xD3, 0xA5, 0x08, 0x37
	.byte 0x30, 0xF2, 0x87, 0x28, 0x23, 0xB2, 0xA5, 0xBF, 0x02, 0xBA, 0x6A, 0x03, 0xED, 0x5C, 0x82, 0x16
	.byte 0x8A, 0x2B, 0x1C, 0xCF, 0xA7, 0x92, 0xB4, 0x79, 0xF3, 0xF0, 0xF2, 0x07, 0x4E, 0xA1, 0xE2, 0x69
	.byte 0x65, 0xCD, 0xF4, 0xDA, 0x06, 0xD5, 0xBE, 0x05, 0xD1, 0x1F, 0x62, 0x34, 0xC4, 0x8A, 0xFE, 0xA6
	.byte 0x34, 0x9D, 0x53, 0x2E, 0xA2, 0xA0, 0x55, 0xF3, 0x05, 0x32, 0xE1, 0x8A, 0xA4, 0x75, 0xEB, 0xF6
	.byte 0x0B, 0x39, 0xEC, 0x83, 0x40, 0xAA, 0xEF, 0x60, 0x5E, 0x06, 0x9F, 0x71, 0xBD, 0x51, 0x10, 0x6E
	.byte 0x3E, 0xF9, 0x8A, 0x21, 0x96, 0x3D, 0x06, 0xDD, 0xDD, 0xAE, 0x05, 0x3E, 0x4D, 0x46, 0xBD, 0xE6
	.byte 0x91, 0xB5, 0x8D, 0x54, 0x71, 0x05, 0x5D, 0xC4, 0x04, 0x6F, 0xD4, 0x06, 0x60, 0xFF, 0x15, 0x50
	.byte 0x19, 0x24, 0xFB, 0x98, 0xD6, 0x97, 0xE9, 0xBD, 0x89, 0xCC, 0x43, 0x40, 0x67, 0x77, 0x9E, 0xD9
	.byte 0xB0, 0xBD, 0x42, 0xE8, 0x07, 0x88, 0x8B, 0x89, 0xE7, 0x38, 0x5B, 0x19, 0x79, 0xDB, 0xEE, 0xC8
	.byte 0xA1, 0x47, 0x0A, 0x7C, 0x7C, 0xE9, 0x0F, 0x42, 0xF8, 0xC9, 0x1E, 0x84, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x83, 0x86, 0x80, 0x32, 0x48, 0xED, 0x2B, 0x1E, 0xAC, 0x70, 0x11, 0x6C, 0x4E, 0x72, 0x5A
	.byte 0xFD, 0xFB, 0xFF, 0x0E, 0x0F, 0x56, 0x38, 0x85, 0x3D, 0x1E, 0xD5, 0xAE, 0x36, 0x27, 0x39, 0x2D
	.byte 0x0A, 0x64, 0xD9, 0x0F, 0x68, 0x21, 0xA6, 0x5C, 0x9B, 0xD1, 0x54, 0x5B, 0x24, 0x3A, 0x2E, 0x36
	.byte 0x0C, 0xB1, 0x67, 0x0A, 0x93, 0x0F, 0xE7, 0x57, 0xB4, 0xD2, 0x96, 0xEE, 0x1B, 0x9E, 0x91, 0x9B
	.byte 0x80, 0x4F, 0xC5, 0xC0, 0x61, 0xA2, 0x20, 0xDC, 0x5A, 0x69, 0x4B, 0x77, 0x1C, 0x16, 0x1A, 0x12
	.byte 0xE2, 0x0A, 0xBA, 0x93, 0xC0, 0xE5, 0x2A, 0xA0, 0x3C, 0x43, 0xE0, 0x22, 0x12, 0x1D, 0x17, 0x1B
	.byte 0x0E, 0x0B, 0x0D, 0x09, 0xF2, 0xAD, 0xC7, 0x8B, 0x2D, 0xB9, 0xA8, 0xB6, 0x14, 0xC8, 0xA9, 0x1E
	.byte 0x57, 0x85, 0x19, 0xF1, 0xAF, 0x4C, 0x07, 0x75, 0xEE, 0xBB, 0xDD, 0x99, 0xA3, 0xFD, 0x60, 0x7F
	.byte 0xF7, 0x9F, 0x26, 0x01, 0x5C, 0xBC, 0xF5, 0x72, 0x44, 0xC5, 0x3B, 0x66, 0x5B, 0x34, 0x7E, 0xFB
	.byte 0x8B, 0x76, 0x29, 0x43, 0xCB, 0xDC, 0xC6, 0x23, 0xB6, 0x68, 0xFC, 0xED, 0xB8, 0x63, 0xF1, 0xE4
	.byte 0xD7, 0xCA, 0xDC, 0x31, 0x42, 0x10, 0x85, 0x63, 0x13, 0x40, 0x22, 0x97, 0x84, 0x20, 0x11, 0xC6
	.byte 0x85, 0x7D, 0x24, 0x4A, 0xD2, 0xF8, 0x3D, 0xBB, 0xAE, 0x11, 0x32, 0xF9, 0xC7, 0x6D, 0xA1, 0x29
	.byte 0x1D, 0x4B, 0x2F, 0x9E, 0xDC, 0xF3, 0x30, 0xB2, 0x0D, 0xEC, 0x52, 0x86, 0x77, 0xD0, 0xE3, 0xC1
	.byte 0x2B, 0x6C, 0x16, 0xB3, 0xA9, 0x99, 0xB9, 0x70, 0x11, 0xFA, 0x48, 0x94, 0x47, 0x22, 0x64, 0xE9
	.byte 0xA8, 0xC4, 0x8C, 0xFC, 0xA0, 0x1A, 0x3F, 0xF0, 0x56, 0xD8, 0x2C, 0x7D, 0x22, 0xEF, 0x90, 0x33
	.byte 0x87, 0xC7, 0x4E, 0x49, 0xD9, 0xC1, 0xD1, 0x38, 0x8C, 0xFE, 0xA2, 0xCA, 0x98, 0x36, 0x0B, 0xD4
	.byte 0xA6, 0xCF, 0x81, 0xF5, 0xA5, 0x28, 0xDE, 0x7A, 0xDA, 0x26, 0x8E, 0xB7, 0x3F, 0xA4, 0xBF, 0xAD
	.byte 0x2C, 0xE4, 0x9D, 0x3A, 0x50, 0x0D, 0x92, 0x78, 0x6A, 0x9B, 0xCC, 0x5F, 0x54, 0x62, 0x46, 0x7E
	.byte 0xF6, 0xC2, 0x13, 0x8D, 0x90, 0xE8, 0xB8, 0xD8, 0x2E, 0x5E, 0xF7, 0x39, 0x82, 0xF5, 0xAF, 0xC3
	.byte 0x9F, 0xBE, 0x80, 0x5D, 0x69, 0x7C, 0x93, 0xD0, 0x6F, 0xA9, 0x2D, 0xD5, 0xCF, 0xB3, 0x12, 0x25
	.byte 0xC8, 0x3B, 0x99, 0xAC, 0x10, 0xA7, 0x7D, 0x18, 0xE8, 0x6E, 0x63, 0x9C, 0xDB, 0x7B, 0xBB, 0x3B
	.byte 0xCD, 0x09, 0x78, 0x26, 0x6E, 0xF4, 0x18, 0x59, 0xEC, 0x01, 0xB7, 0x9A, 0x83, 0xA8, 0x9A, 0x4F
	.byte 0xE6, 0x65, 0x6E, 0x95, 0xAA, 0x7E, 0xE6, 0xFF, 0x21, 0x08, 0xCF, 0xBC, 0xEF, 0xE6, 0xE8, 0x15
	.byte 0xBA, 0xD9, 0x9B, 0xE7, 0x4A, 0xCE, 0x36, 0x6F, 0xEA, 0xD4, 0x09, 0x9F, 0x29, 0xD6, 0x7C, 0xB0
	.byte 0x31, 0xAF, 0xB2, 0xA4, 0x2A, 0x31, 0x23, 0x3F, 0xC6, 0x30, 0x94, 0xA5, 0x35, 0xC0, 0x66, 0xA2
	.byte 0x74, 0x37, 0xBC, 0x4E, 0xFC, 0xA6, 0xCA, 0x82, 0xE0, 0xB0, 0xD0, 0x90, 0x33, 0x15, 0xD8, 0xA7
	.byte 0xF1, 0x4A, 0x98, 0x04, 0x41, 0xF7, 0xDA, 0xEC, 0x7F, 0x0E, 0x50, 0xCD, 0x17, 0x2F, 0xF6, 0x91
	.byte 0x76, 0x8D, 0xD6, 0x4D, 0x43, 0x4D, 0xB0, 0xEF, 0xCC, 0x54, 0x4D, 0xAA, 0xE4, 0xDF, 0x04, 0x96
	.byte 0x9E, 0xE3, 0xB5, 0xD1, 0x4C, 0x1B, 0x88, 0x6A, 0xC1, 0xB8, 0x1F, 0x2C, 0x46, 0x7F, 0x51, 0x65
	.byte 0x9D, 0x04, 0xEA, 0x5E, 0x01, 0x5D, 0x35, 0x8C, 0xFA, 0x73, 0x74, 0x87, 0xFB, 0x2E, 0x41, 0x0B
	.byte 0xB3, 0x5A, 0x1D, 0x67, 0x92, 0x52, 0xD2, 0xDB, 0xE9, 0x33, 0x56, 0x10, 0x6D, 0x13, 0x47, 0xD6
	.byte 0x9A, 0x8C, 0x61, 0xD7, 0x37, 0x7A, 0x0C, 0xA1, 0x59, 0x8E, 0x14, 0xF8, 0xEB, 0x89, 0x3C, 0x13
	.byte 0xCE, 0xEE, 0x27, 0xA9, 0xB7, 0x35, 0xC9, 0x61, 0xE1, 0xED, 0xE5, 0x1C, 0x7A, 0x3C, 0xB1, 0x47
	.byte 0x9C, 0x59, 0xDF, 0xD2, 0x55, 0x3F, 0x73, 0xF2, 0x18, 0x79, 0xCE, 0x14, 0x73, 0xBF, 0x37, 0xC7
	.byte 0x53, 0xEA, 0xCD, 0xF7, 0x5F, 0x5B, 0xAA, 0xFD, 0xDF, 0x14, 0x6F, 0x3D, 0x78, 0x86, 0xDB, 0x44
	.byte 0xCA, 0x81, 0xF3, 0xAF, 0xB9, 0x3E, 0xC4, 0x68, 0x38, 0x2C, 0x34, 0x24, 0xC2, 0x5F, 0x40, 0xA3
	.byte 0x16, 0x72, 0xC3, 0x1D, 0xBC, 0x0C, 0x25, 0xE2, 0x28, 0x8B, 0x49, 0x3C, 0xFF, 0x41, 0x95, 0x0D
	.byte 0x39, 0x71, 0x01, 0xA8, 0x08, 0xDE, 0xB3, 0x0C, 0xD8, 0x9C, 0xE4, 0xB4, 0x64, 0x90, 0xC1, 0x56
	.byte 0x7B, 0x61, 0x84, 0xCB, 0xD5, 0x70, 0xB6, 0x32, 0x48, 0x74, 0x5C, 0x6C, 0xD0, 0x42, 0x57, 0xB8

ov13_02242EB0: ; 0x02242EB0
	.byte 0x52, 0x52, 0x52, 0x52, 0x09, 0x09, 0x09, 0x09, 0x6A, 0x6A, 0x6A, 0x6A, 0xD5, 0xD5, 0xD5, 0xD5
	.byte 0x30, 0x30, 0x30, 0x30, 0x36, 0x36, 0x36, 0x36, 0xA5, 0xA5, 0xA5, 0xA5, 0x38, 0x38, 0x38, 0x38
	.byte 0xBF, 0xBF, 0xBF, 0xBF, 0x40, 0x40, 0x40, 0x40, 0xA3, 0xA3, 0xA3, 0xA3, 0x9E, 0x9E, 0x9E, 0x9E
	.byte 0x81, 0x81, 0x81, 0x81, 0xF3, 0xF3, 0xF3, 0xF3, 0xD7, 0xD7, 0xD7, 0xD7, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x7C, 0x7C, 0x7C, 0x7C, 0xE3, 0xE3, 0xE3, 0xE3, 0x39, 0x39, 0x39, 0x39, 0x82, 0x82, 0x82, 0x82
	.byte 0x9B, 0x9B, 0x9B, 0x9B, 0x2F, 0x2F, 0x2F, 0x2F, 0xFF, 0xFF, 0xFF, 0xFF, 0x87, 0x87, 0x87, 0x87
	.byte 0x34, 0x34, 0x34, 0x34, 0x8E, 0x8E, 0x8E, 0x8E, 0x43, 0x43, 0x43, 0x43, 0x44, 0x44, 0x44, 0x44
	.byte 0xC4, 0xC4, 0xC4, 0xC4, 0xDE, 0xDE, 0xDE, 0xDE, 0xE9, 0xE9, 0xE9, 0xE9, 0xCB, 0xCB, 0xCB, 0xCB
	.byte 0x54, 0x54, 0x54, 0x54, 0x7B, 0x7B, 0x7B, 0x7B, 0x94, 0x94, 0x94, 0x94, 0x32, 0x32, 0x32, 0x32
	.byte 0xA6, 0xA6, 0xA6, 0xA6, 0xC2, 0xC2, 0xC2, 0xC2, 0x23, 0x23, 0x23, 0x23, 0x3D, 0x3D, 0x3D, 0x3D
	.byte 0xEE, 0xEE, 0xEE, 0xEE, 0x4C, 0x4C, 0x4C, 0x4C, 0x95, 0x95, 0x95, 0x95, 0x0B, 0x0B, 0x0B, 0x0B
	.byte 0x42, 0x42, 0x42, 0x42, 0xFA, 0xFA, 0xFA, 0xFA, 0xC3, 0xC3, 0xC3, 0xC3, 0x4E, 0x4E, 0x4E, 0x4E
	.byte 0x08, 0x08, 0x08, 0x08, 0x2E, 0x2E, 0x2E, 0x2E, 0xA1, 0xA1, 0xA1, 0xA1, 0x66, 0x66, 0x66, 0x66
	.byte 0x28, 0x28, 0x28, 0x28, 0xD9, 0xD9, 0xD9, 0xD9, 0x24, 0x24, 0x24, 0x24, 0xB2, 0xB2, 0xB2, 0xB2
	.byte 0x76, 0x76, 0x76, 0x76, 0x5B, 0x5B, 0x5B, 0x5B, 0xA2, 0xA2, 0xA2, 0xA2, 0x49, 0x49, 0x49, 0x49
	.byte 0x6D, 0x6D, 0x6D, 0x6D, 0x8B, 0x8B, 0x8B, 0x8B, 0xD1, 0xD1, 0xD1, 0xD1, 0x25, 0x25, 0x25, 0x25
	.byte 0x72, 0x72, 0x72, 0x72, 0xF8, 0xF8, 0xF8, 0xF8, 0xF6, 0xF6, 0xF6, 0xF6, 0x64, 0x64, 0x64, 0x64
	.byte 0x86, 0x86, 0x86, 0x86, 0x68, 0x68, 0x68, 0x68, 0x98, 0x98, 0x98, 0x98, 0x16, 0x16, 0x16, 0x16
	.byte 0xD4, 0xD4, 0xD4, 0xD4, 0xA4, 0xA4, 0xA4, 0xA4, 0x5C, 0x5C, 0x5C, 0x5C, 0xCC, 0xCC, 0xCC, 0xCC
	.byte 0x5D, 0x5D, 0x5D, 0x5D, 0x65, 0x65, 0x65, 0x65, 0xB6, 0xB6, 0xB6, 0xB6, 0x92, 0x92, 0x92, 0x92
	.byte 0x6C, 0x6C, 0x6C, 0x6C, 0x70, 0x70, 0x70, 0x70, 0x48, 0x48, 0x48, 0x48, 0x50, 0x50, 0x50, 0x50
	.byte 0xFD, 0xFD, 0xFD, 0xFD, 0xED, 0xED, 0xED, 0xED, 0xB9, 0xB9, 0xB9, 0xB9, 0xDA, 0xDA, 0xDA, 0xDA
	.byte 0x5E, 0x5E, 0x5E, 0x5E, 0x15, 0x15, 0x15, 0x15, 0x46, 0x46, 0x46, 0x46, 0x57, 0x57, 0x57, 0x57
	.byte 0xA7, 0xA7, 0xA7, 0xA7, 0x8D, 0x8D, 0x8D, 0x8D, 0x9D, 0x9D, 0x9D, 0x9D, 0x84, 0x84, 0x84, 0x84
	.byte 0x90, 0x90, 0x90, 0x90, 0xD8, 0xD8, 0xD8, 0xD8, 0xAB, 0xAB, 0xAB, 0xAB, 0x00, 0x00, 0x00, 0x00
	.byte 0x8C, 0x8C, 0x8C, 0x8C, 0xBC, 0xBC, 0xBC, 0xBC, 0xD3, 0xD3, 0xD3, 0xD3, 0x0A, 0x0A, 0x0A, 0x0A
	.byte 0xF7, 0xF7, 0xF7, 0xF7, 0xE4, 0xE4, 0xE4, 0xE4, 0x58, 0x58, 0x58, 0x58, 0x05, 0x05, 0x05, 0x05
	.byte 0xB8, 0xB8, 0xB8, 0xB8, 0xB3, 0xB3, 0xB3, 0xB3, 0x45, 0x45, 0x45, 0x45, 0x06, 0x06, 0x06, 0x06
	.byte 0xD0, 0xD0, 0xD0, 0xD0, 0x2C, 0x2C, 0x2C, 0x2C, 0x1E, 0x1E, 0x1E, 0x1E, 0x8F, 0x8F, 0x8F, 0x8F
	.byte 0xCA, 0xCA, 0xCA, 0xCA, 0x3F, 0x3F, 0x3F, 0x3F, 0x0F, 0x0F, 0x0F, 0x0F, 0x02, 0x02, 0x02, 0x02
	.byte 0xC1, 0xC1, 0xC1, 0xC1, 0xAF, 0xAF, 0xAF, 0xAF, 0xBD, 0xBD, 0xBD, 0xBD, 0x03, 0x03, 0x03, 0x03
	.byte 0x01, 0x01, 0x01, 0x01, 0x13, 0x13, 0x13, 0x13, 0x8A, 0x8A, 0x8A, 0x8A, 0x6B, 0x6B, 0x6B, 0x6B
	.byte 0x3A, 0x3A, 0x3A, 0x3A, 0x91, 0x91, 0x91, 0x91, 0x11, 0x11, 0x11, 0x11, 0x41, 0x41, 0x41, 0x41
	.byte 0x4F, 0x4F, 0x4F, 0x4F, 0x67, 0x67, 0x67, 0x67, 0xDC, 0xDC, 0xDC, 0xDC, 0xEA, 0xEA, 0xEA, 0xEA
	.byte 0x97, 0x97, 0x97, 0x97, 0xF2, 0xF2, 0xF2, 0xF2, 0xCF, 0xCF, 0xCF, 0xCF, 0xCE, 0xCE, 0xCE, 0xCE
	.byte 0xF0, 0xF0, 0xF0, 0xF0, 0xB4, 0xB4, 0xB4, 0xB4, 0xE6, 0xE6, 0xE6, 0xE6, 0x73, 0x73, 0x73, 0x73
	.byte 0x96, 0x96, 0x96, 0x96, 0xAC, 0xAC, 0xAC, 0xAC, 0x74, 0x74, 0x74, 0x74, 0x22, 0x22, 0x22, 0x22
	.byte 0xE7, 0xE7, 0xE7, 0xE7, 0xAD, 0xAD, 0xAD, 0xAD, 0x35, 0x35, 0x35, 0x35, 0x85, 0x85, 0x85, 0x85
	.byte 0xE2, 0xE2, 0xE2, 0xE2, 0xF9, 0xF9, 0xF9, 0xF9, 0x37, 0x37, 0x37, 0x37, 0xE8, 0xE8, 0xE8, 0xE8
	.byte 0x1C, 0x1C, 0x1C, 0x1C, 0x75, 0x75, 0x75, 0x75, 0xDF, 0xDF, 0xDF, 0xDF, 0x6E, 0x6E, 0x6E, 0x6E
	.byte 0x47, 0x47, 0x47, 0x47, 0xF1, 0xF1, 0xF1, 0xF1, 0x1A, 0x1A, 0x1A, 0x1A, 0x71, 0x71, 0x71, 0x71
	.byte 0x1D, 0x1D, 0x1D, 0x1D, 0x29, 0x29, 0x29, 0x29, 0xC5, 0xC5, 0xC5, 0xC5, 0x89, 0x89, 0x89, 0x89
	.byte 0x6F, 0x6F, 0x6F, 0x6F, 0xB7, 0xB7, 0xB7, 0xB7, 0x62, 0x62, 0x62, 0x62, 0x0E, 0x0E, 0x0E, 0x0E
	.byte 0xAA, 0xAA, 0xAA, 0xAA, 0x18, 0x18, 0x18, 0x18, 0xBE, 0xBE, 0xBE, 0xBE, 0x1B, 0x1B, 0x1B, 0x1B
	.byte 0xFC, 0xFC, 0xFC, 0xFC, 0x56, 0x56, 0x56, 0x56, 0x3E, 0x3E, 0x3E, 0x3E, 0x4B, 0x4B, 0x4B, 0x4B
	.byte 0xC6, 0xC6, 0xC6, 0xC6, 0xD2, 0xD2, 0xD2, 0xD2, 0x79, 0x79, 0x79, 0x79, 0x20, 0x20, 0x20, 0x20
	.byte 0x9A, 0x9A, 0x9A, 0x9A, 0xDB, 0xDB, 0xDB, 0xDB, 0xC0, 0xC0, 0xC0, 0xC0, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0x78, 0x78, 0x78, 0x78, 0xCD, 0xCD, 0xCD, 0xCD, 0x5A, 0x5A, 0x5A, 0x5A, 0xF4, 0xF4, 0xF4, 0xF4
	.byte 0x1F, 0x1F, 0x1F, 0x1F, 0xDD, 0xDD, 0xDD, 0xDD, 0xA8, 0xA8, 0xA8, 0xA8, 0x33, 0x33, 0x33, 0x33
	.byte 0x88, 0x88, 0x88, 0x88, 0x07, 0x07, 0x07, 0x07, 0xC7, 0xC7, 0xC7, 0xC7, 0x31, 0x31, 0x31, 0x31
	.byte 0xB1, 0xB1, 0xB1, 0xB1, 0x12, 0x12, 0x12, 0x12, 0x10, 0x10, 0x10, 0x10, 0x59, 0x59, 0x59, 0x59
	.byte 0x27, 0x27, 0x27, 0x27, 0x80, 0x80, 0x80, 0x80, 0xEC, 0xEC, 0xEC, 0xEC, 0x5F, 0x5F, 0x5F, 0x5F
	.byte 0x60, 0x60, 0x60, 0x60, 0x51, 0x51, 0x51, 0x51, 0x7F, 0x7F, 0x7F, 0x7F, 0xA9, 0xA9, 0xA9, 0xA9
	.byte 0x19, 0x19, 0x19, 0x19, 0xB5, 0xB5, 0xB5, 0xB5, 0x4A, 0x4A, 0x4A, 0x4A, 0x0D, 0x0D, 0x0D, 0x0D
	.byte 0x2D, 0x2D, 0x2D, 0x2D, 0xE5, 0xE5, 0xE5, 0xE5, 0x7A, 0x7A, 0x7A, 0x7A, 0x9F, 0x9F, 0x9F, 0x9F
	.byte 0x93, 0x93, 0x93, 0x93, 0xC9, 0xC9, 0xC9, 0xC9, 0x9C, 0x9C, 0x9C, 0x9C, 0xEF, 0xEF, 0xEF, 0xEF
	.byte 0xA0, 0xA0, 0xA0, 0xA0, 0xE0, 0xE0, 0xE0, 0xE0, 0x3B, 0x3B, 0x3B, 0x3B, 0x4D, 0x4D, 0x4D, 0x4D
	.byte 0xAE, 0xAE, 0xAE, 0xAE, 0x2A, 0x2A, 0x2A, 0x2A, 0xF5, 0xF5, 0xF5, 0xF5, 0xB0, 0xB0, 0xB0, 0xB0
	.byte 0xC8, 0xC8, 0xC8, 0xC8, 0xEB, 0xEB, 0xEB, 0xEB, 0xBB, 0xBB, 0xBB, 0xBB, 0x3C, 0x3C, 0x3C, 0x3C
	.byte 0x83, 0x83, 0x83, 0x83, 0x53, 0x53, 0x53, 0x53, 0x99, 0x99, 0x99, 0x99, 0x61, 0x61, 0x61, 0x61
	.byte 0x17, 0x17, 0x17, 0x17, 0x2B, 0x2B, 0x2B, 0x2B, 0x04, 0x04, 0x04, 0x04, 0x7E, 0x7E, 0x7E, 0x7E
	.byte 0xBA, 0xBA, 0xBA, 0xBA, 0x77, 0x77, 0x77, 0x77, 0xD6, 0xD6, 0xD6, 0xD6, 0x26, 0x26, 0x26, 0x26
	.byte 0xE1, 0xE1, 0xE1, 0xE1, 0x69, 0x69, 0x69, 0x69, 0x14, 0x14, 0x14, 0x14, 0x63, 0x63, 0x63, 0x63
	.byte 0x55, 0x55, 0x55, 0x55, 0x21, 0x21, 0x21, 0x21, 0x0C, 0x0C, 0x0C, 0x0C, 0x7D, 0x7D, 0x7D, 0x7D

ov13_022432B0: ; 0x022432B0
	.byte 0xA5, 0x63, 0x63, 0xC6, 0x84, 0x7C, 0x7C, 0xF8, 0x99, 0x77, 0x77, 0xEE, 0x8D, 0x7B, 0x7B, 0xF6
	.byte 0x0D, 0xF2, 0xF2, 0xFF, 0xBD, 0x6B, 0x6B, 0xD6, 0xB1, 0x6F, 0x6F, 0xDE, 0x54, 0xC5, 0xC5, 0x91
	.byte 0x50, 0x30, 0x30, 0x60, 0x03, 0x01, 0x01, 0x02, 0xA9, 0x67, 0x67, 0xCE, 0x7D, 0x2B, 0x2B, 0x56
	.byte 0x19, 0xFE, 0xFE, 0xE7, 0x62, 0xD7, 0xD7, 0xB5, 0xE6, 0xAB, 0xAB, 0x4D, 0x9A, 0x76, 0x76, 0xEC
	.byte 0x45, 0xCA, 0xCA, 0x8F, 0x9D, 0x82, 0x82, 0x1F, 0x40, 0xC9, 0xC9, 0x89, 0x87, 0x7D, 0x7D, 0xFA
	.byte 0x15, 0xFA, 0xFA, 0xEF, 0xEB, 0x59, 0x59, 0xB2, 0xC9, 0x47, 0x47, 0x8E, 0x0B, 0xF0, 0xF0, 0xFB
	.byte 0xEC, 0xAD, 0xAD, 0x41, 0x67, 0xD4, 0xD4, 0xB3, 0xFD, 0xA2, 0xA2, 0x5F, 0xEA, 0xAF, 0xAF, 0x45
	.byte 0xBF, 0x9C, 0x9C, 0x23, 0xF7, 0xA4, 0xA4, 0x53, 0x96, 0x72, 0x72, 0xE4, 0x5B, 0xC0, 0xC0, 0x9B
	.byte 0xC2, 0xB7, 0xB7, 0x75, 0x1C, 0xFD, 0xFD, 0xE1, 0xAE, 0x93, 0x93, 0x3D, 0x6A, 0x26, 0x26, 0x4C
	.byte 0x5A, 0x36, 0x36, 0x6C, 0x41, 0x3F, 0x3F, 0x7E, 0x02, 0xF7, 0xF7, 0xF5, 0x4F, 0xCC, 0xCC, 0x83
	.byte 0x5C, 0x34, 0x34, 0x68, 0xF4, 0xA5, 0xA5, 0x51, 0x34, 0xE5, 0xE5, 0xD1, 0x08, 0xF1, 0xF1, 0xF9
	.byte 0x93, 0x71, 0x71, 0xE2, 0x73, 0xD8, 0xD8, 0xAB, 0x53, 0x31, 0x31, 0x62, 0x3F, 0x15, 0x15, 0x2A
	.byte 0x0C, 0x04, 0x04, 0x08, 0x52, 0xC7, 0xC7, 0x95, 0x65, 0x23, 0x23, 0x46, 0x5E, 0xC3, 0xC3, 0x9D
	.byte 0x28, 0x18, 0x18, 0x30, 0xA1, 0x96, 0x96, 0x37, 0x0F, 0x05, 0x05, 0x0A, 0xB5, 0x9A, 0x9A, 0x2F
	.byte 0x09, 0x07, 0x07, 0x0E, 0x36, 0x12, 0x12, 0x24, 0x9B, 0x80, 0x80, 0x1B, 0x3D, 0xE2, 0xE2, 0xDF
	.byte 0x26, 0xEB, 0xEB, 0xCD, 0x69, 0x27, 0x27, 0x4E, 0xCD, 0xB2, 0xB2, 0x7F, 0x9F, 0x75, 0x75, 0xEA
	.byte 0x1B, 0x09, 0x09, 0x12, 0x9E, 0x83, 0x83, 0x1D, 0x74, 0x2C, 0x2C, 0x58, 0x2E, 0x1A, 0x1A, 0x34
	.byte 0x2D, 0x1B, 0x1B, 0x36, 0xB2, 0x6E, 0x6E, 0xDC, 0xEE, 0x5A, 0x5A, 0xB4, 0xFB, 0xA0, 0xA0, 0x5B
	.byte 0xF6, 0x52, 0x52, 0xA4, 0x4D, 0x3B, 0x3B, 0x76, 0x61, 0xD6, 0xD6, 0xB7, 0xCE, 0xB3, 0xB3, 0x7D
	.byte 0x7B, 0x29, 0x29, 0x52, 0x3E, 0xE3, 0xE3, 0xDD, 0x71, 0x2F, 0x2F, 0x5E, 0x97, 0x84, 0x84, 0x13
	.byte 0xF5, 0x53, 0x53, 0xA6, 0x68, 0xD1, 0xD1, 0xB9, 0x00, 0x00, 0x00, 0x00, 0x2C, 0xED, 0xED, 0xC1
	.byte 0x60, 0x20, 0x20, 0x40, 0x1F, 0xFC, 0xFC, 0xE3, 0xC8, 0xB1, 0xB1, 0x79, 0xED, 0x5B, 0x5B, 0xB6
	.byte 0xBE, 0x6A, 0x6A, 0xD4, 0x46, 0xCB, 0xCB, 0x8D, 0xD9, 0xBE, 0xBE, 0x67, 0x4B, 0x39, 0x39, 0x72
	.byte 0xDE, 0x4A, 0x4A, 0x94, 0xD4, 0x4C, 0x4C, 0x98, 0xE8, 0x58, 0x58, 0xB0, 0x4A, 0xCF, 0xCF, 0x85
	.byte 0x6B, 0xD0, 0xD0, 0xBB, 0x2A, 0xEF, 0xEF, 0xC5, 0xE5, 0xAA, 0xAA, 0x4F, 0x16, 0xFB, 0xFB, 0xED
	.byte 0xC5, 0x43, 0x43, 0x86, 0xD7, 0x4D, 0x4D, 0x9A, 0x55, 0x33, 0x33, 0x66, 0x94, 0x85, 0x85, 0x11
	.byte 0xCF, 0x45, 0x45, 0x8A, 0x10, 0xF9, 0xF9, 0xE9, 0x06, 0x02, 0x02, 0x04, 0x81, 0x7F, 0x7F, 0xFE
	.byte 0xF0, 0x50, 0x50, 0xA0, 0x44, 0x3C, 0x3C, 0x78, 0xBA, 0x9F, 0x9F, 0x25, 0xE3, 0xA8, 0xA8, 0x4B
	.byte 0xF3, 0x51, 0x51, 0xA2, 0xFE, 0xA3, 0xA3, 0x5D, 0xC0, 0x40, 0x40, 0x80, 0x8A, 0x8F, 0x8F, 0x05
	.byte 0xAD, 0x92, 0x92, 0x3F, 0xBC, 0x9D, 0x9D, 0x21, 0x48, 0x38, 0x38, 0x70, 0x04, 0xF5, 0xF5, 0xF1
	.byte 0xDF, 0xBC, 0xBC, 0x63, 0xC1, 0xB6, 0xB6, 0x77, 0x75, 0xDA, 0xDA, 0xAF, 0x63, 0x21, 0x21, 0x42
	.byte 0x30, 0x10, 0x10, 0x20, 0x1A, 0xFF, 0xFF, 0xE5, 0x0E, 0xF3, 0xF3, 0xFD, 0x6D, 0xD2, 0xD2, 0xBF
	.byte 0x4C, 0xCD, 0xCD, 0x81, 0x14, 0x0C, 0x0C, 0x18, 0x35, 0x13, 0x13, 0x26, 0x2F, 0xEC, 0xEC, 0xC3
	.byte 0xE1, 0x5F, 0x5F, 0xBE, 0xA2, 0x97, 0x97, 0x35, 0xCC, 0x44, 0x44, 0x88, 0x39, 0x17, 0x17, 0x2E
	.byte 0x57, 0xC4, 0xC4, 0x93, 0xF2, 0xA7, 0xA7, 0x55, 0x82, 0x7E, 0x7E, 0xFC, 0x47, 0x3D, 0x3D, 0x7A
	.byte 0xAC, 0x64, 0x64, 0xC8, 0xE7, 0x5D, 0x5D, 0xBA, 0x2B, 0x19, 0x19, 0x32, 0x95, 0x73, 0x73, 0xE6
	.byte 0xA0, 0x60, 0x60, 0xC0, 0x98, 0x81, 0x81, 0x19, 0xD1, 0x4F, 0x4F, 0x9E, 0x7F, 0xDC, 0xDC, 0xA3
	.byte 0x66, 0x22, 0x22, 0x44, 0x7E, 0x2A, 0x2A, 0x54, 0xAB, 0x90, 0x90, 0x3B, 0x83, 0x88, 0x88, 0x0B
	.byte 0xCA, 0x46, 0x46, 0x8C, 0x29, 0xEE, 0xEE, 0xC7, 0xD3, 0xB8, 0xB8, 0x6B, 0x3C, 0x14, 0x14, 0x28
	.byte 0x79, 0xDE, 0xDE, 0xA7, 0xE2, 0x5E, 0x5E, 0xBC, 0x1D, 0x0B, 0x0B, 0x16, 0x76, 0xDB, 0xDB, 0xAD
	.byte 0x3B, 0xE0, 0xE0, 0xDB, 0x56, 0x32, 0x32, 0x64, 0x4E, 0x3A, 0x3A, 0x74, 0x1E, 0x0A, 0x0A, 0x14
	.byte 0xDB, 0x49, 0x49, 0x92, 0x0A, 0x06, 0x06, 0x0C, 0x6C, 0x24, 0x24, 0x48, 0xE4, 0x5C, 0x5C, 0xB8
	.byte 0x5D, 0xC2, 0xC2, 0x9F, 0x6E, 0xD3, 0xD3, 0xBD, 0xEF, 0xAC, 0xAC, 0x43, 0xA6, 0x62, 0x62, 0xC4
	.byte 0xA8, 0x91, 0x91, 0x39, 0xA4, 0x95, 0x95, 0x31, 0x37, 0xE4, 0xE4, 0xD3, 0x8B, 0x79, 0x79, 0xF2
	.byte 0x32, 0xE7, 0xE7, 0xD5, 0x43, 0xC8, 0xC8, 0x8B, 0x59, 0x37, 0x37, 0x6E, 0xB7, 0x6D, 0x6D, 0xDA
	.byte 0x8C, 0x8D, 0x8D, 0x01, 0x64, 0xD5, 0xD5, 0xB1, 0xD2, 0x4E, 0x4E, 0x9C, 0xE0, 0xA9, 0xA9, 0x49
	.byte 0xB4, 0x6C, 0x6C, 0xD8, 0xFA, 0x56, 0x56, 0xAC, 0x07, 0xF4, 0xF4, 0xF3, 0x25, 0xEA, 0xEA, 0xCF
	.byte 0xAF, 0x65, 0x65, 0xCA, 0x8E, 0x7A, 0x7A, 0xF4, 0xE9, 0xAE, 0xAE, 0x47, 0x18, 0x08, 0x08, 0x10
	.byte 0xD5, 0xBA, 0xBA, 0x6F, 0x88, 0x78, 0x78, 0xF0, 0x6F, 0x25, 0x25, 0x4A, 0x72, 0x2E, 0x2E, 0x5C
	.byte 0x24, 0x1C, 0x1C, 0x38, 0xF1, 0xA6, 0xA6, 0x57, 0xC7, 0xB4, 0xB4, 0x73, 0x51, 0xC6, 0xC6, 0x97
	.byte 0x23, 0xE8, 0xE8, 0xCB, 0x7C, 0xDD, 0xDD, 0xA1, 0x9C, 0x74, 0x74, 0xE8, 0x21, 0x1F, 0x1F, 0x3E
	.byte 0xDD, 0x4B, 0x4B, 0x96, 0xDC, 0xBD, 0xBD, 0x61, 0x86, 0x8B, 0x8B, 0x0D, 0x85, 0x8A, 0x8A, 0x0F
	.byte 0x90, 0x70, 0x70, 0xE0, 0x42, 0x3E, 0x3E, 0x7C, 0xC4, 0xB5, 0xB5, 0x71, 0xAA, 0x66, 0x66, 0xCC
	.byte 0xD8, 0x48, 0x48, 0x90, 0x05, 0x03, 0x03, 0x06, 0x01, 0xF6, 0xF6, 0xF7, 0x12, 0x0E, 0x0E, 0x1C
	.byte 0xA3, 0x61, 0x61, 0xC2, 0x5F, 0x35, 0x35, 0x6A, 0xF9, 0x57, 0x57, 0xAE, 0xD0, 0xB9, 0xB9, 0x69
	.byte 0x91, 0x86, 0x86, 0x17, 0x58, 0xC1, 0xC1, 0x99, 0x27, 0x1D, 0x1D, 0x3A, 0xB9, 0x9E, 0x9E, 0x27
	.byte 0x38, 0xE1, 0xE1, 0xD9, 0x13, 0xF8, 0xF8, 0xEB, 0xB3, 0x98, 0x98, 0x2B, 0x33, 0x11, 0x11, 0x22
	.byte 0xBB, 0x69, 0x69, 0xD2, 0x70, 0xD9, 0xD9, 0xA9, 0x89, 0x8E, 0x8E, 0x07, 0xA7, 0x94, 0x94, 0x33
	.byte 0xB6, 0x9B, 0x9B, 0x2D, 0x22, 0x1E, 0x1E, 0x3C, 0x92, 0x87, 0x87, 0x15, 0x20, 0xE9, 0xE9, 0xC9
	.byte 0x49, 0xCE, 0xCE, 0x87, 0xFF, 0x55, 0x55, 0xAA, 0x78, 0x28, 0x28, 0x50, 0x7A, 0xDF, 0xDF, 0xA5
	.byte 0x8F, 0x8C, 0x8C, 0x03, 0xF8, 0xA1, 0xA1, 0x59, 0x80, 0x89, 0x89, 0x09, 0x17, 0x0D, 0x0D, 0x1A
	.byte 0xDA, 0xBF, 0xBF, 0x65, 0x31, 0xE6, 0xE6, 0xD7, 0xC6, 0x42, 0x42, 0x84, 0xB8, 0x68, 0x68, 0xD0
	.byte 0xC3, 0x41, 0x41, 0x82, 0xB0, 0x99, 0x99, 0x29, 0x77, 0x2D, 0x2D, 0x5A, 0x11, 0x0F, 0x0F, 0x1E
	.byte 0xCB, 0xB0, 0xB0, 0x7B, 0xFC, 0x54, 0x54, 0xA8, 0xD6, 0xBB, 0xBB, 0x6D, 0x3A, 0x16, 0x16, 0x2C

ov13_022436B0: ; 0x022436B0
	.byte 0x63, 0x63, 0xC6, 0xA5, 0x7C, 0x7C, 0xF8, 0x84, 0x77, 0x77, 0xEE, 0x99, 0x7B, 0x7B, 0xF6, 0x8D
	.byte 0xF2, 0xF2, 0xFF, 0x0D, 0x6B, 0x6B, 0xD6, 0xBD, 0x6F, 0x6F, 0xDE, 0xB1, 0xC5, 0xC5, 0x91, 0x54
	.byte 0x30, 0x30, 0x60, 0x50, 0x01, 0x01, 0x02, 0x03, 0x67, 0x67, 0xCE, 0xA9, 0x2B, 0x2B, 0x56, 0x7D
	.byte 0xFE, 0xFE, 0xE7, 0x19, 0xD7, 0xD7, 0xB5, 0x62, 0xAB, 0xAB, 0x4D, 0xE6, 0x76, 0x76, 0xEC, 0x9A
	.byte 0xCA, 0xCA, 0x8F, 0x45, 0x82, 0x82, 0x1F, 0x9D, 0xC9, 0xC9, 0x89, 0x40, 0x7D, 0x7D, 0xFA, 0x87
	.byte 0xFA, 0xFA, 0xEF, 0x15, 0x59, 0x59, 0xB2, 0xEB, 0x47, 0x47, 0x8E, 0xC9, 0xF0, 0xF0, 0xFB, 0x0B
	.byte 0xAD, 0xAD, 0x41, 0xEC, 0xD4, 0xD4, 0xB3, 0x67, 0xA2, 0xA2, 0x5F, 0xFD, 0xAF, 0xAF, 0x45, 0xEA
	.byte 0x9C, 0x9C, 0x23, 0xBF, 0xA4, 0xA4, 0x53, 0xF7, 0x72, 0x72, 0xE4, 0x96, 0xC0, 0xC0, 0x9B, 0x5B
	.byte 0xB7, 0xB7, 0x75, 0xC2, 0xFD, 0xFD, 0xE1, 0x1C, 0x93, 0x93, 0x3D, 0xAE, 0x26, 0x26, 0x4C, 0x6A
	.byte 0x36, 0x36, 0x6C, 0x5A, 0x3F, 0x3F, 0x7E, 0x41, 0xF7, 0xF7, 0xF5, 0x02, 0xCC, 0xCC, 0x83, 0x4F
	.byte 0x34, 0x34, 0x68, 0x5C, 0xA5, 0xA5, 0x51, 0xF4, 0xE5, 0xE5, 0xD1, 0x34, 0xF1, 0xF1, 0xF9, 0x08
	.byte 0x71, 0x71, 0xE2, 0x93, 0xD8, 0xD8, 0xAB, 0x73, 0x31, 0x31, 0x62, 0x53, 0x15, 0x15, 0x2A, 0x3F
	.byte 0x04, 0x04, 0x08, 0x0C, 0xC7, 0xC7, 0x95, 0x52, 0x23, 0x23, 0x46, 0x65, 0xC3, 0xC3, 0x9D, 0x5E
	.byte 0x18, 0x18, 0x30, 0x28, 0x96, 0x96, 0x37, 0xA1, 0x05, 0x05, 0x0A, 0x0F, 0x9A, 0x9A, 0x2F, 0xB5
	.byte 0x07, 0x07, 0x0E, 0x09, 0x12, 0x12, 0x24, 0x36, 0x80, 0x80, 0x1B, 0x9B, 0xE2, 0xE2, 0xDF, 0x3D
	.byte 0xEB, 0xEB, 0xCD, 0x26, 0x27, 0x27, 0x4E, 0x69, 0xB2, 0xB2, 0x7F, 0xCD, 0x75, 0x75, 0xEA, 0x9F
	.byte 0x09, 0x09, 0x12, 0x1B, 0x83, 0x83, 0x1D, 0x9E, 0x2C, 0x2C, 0x58, 0x74, 0x1A, 0x1A, 0x34, 0x2E
	.byte 0x1B, 0x1B, 0x36, 0x2D, 0x6E, 0x6E, 0xDC, 0xB2, 0x5A, 0x5A, 0xB4, 0xEE, 0xA0, 0xA0, 0x5B, 0xFB
	.byte 0x52, 0x52, 0xA4, 0xF6, 0x3B, 0x3B, 0x76, 0x4D, 0xD6, 0xD6, 0xB7, 0x61, 0xB3, 0xB3, 0x7D, 0xCE
	.byte 0x29, 0x29, 0x52, 0x7B, 0xE3, 0xE3, 0xDD, 0x3E, 0x2F, 0x2F, 0x5E, 0x71, 0x84, 0x84, 0x13, 0x97
	.byte 0x53, 0x53, 0xA6, 0xF5, 0xD1, 0xD1, 0xB9, 0x68, 0x00, 0x00, 0x00, 0x00, 0xED, 0xED, 0xC1, 0x2C
	.byte 0x20, 0x20, 0x40, 0x60, 0xFC, 0xFC, 0xE3, 0x1F, 0xB1, 0xB1, 0x79, 0xC8, 0x5B, 0x5B, 0xB6, 0xED
	.byte 0x6A, 0x6A, 0xD4, 0xBE, 0xCB, 0xCB, 0x8D, 0x46, 0xBE, 0xBE, 0x67, 0xD9, 0x39, 0x39, 0x72, 0x4B
	.byte 0x4A, 0x4A, 0x94, 0xDE, 0x4C, 0x4C, 0x98, 0xD4, 0x58, 0x58, 0xB0, 0xE8, 0xCF, 0xCF, 0x85, 0x4A
	.byte 0xD0, 0xD0, 0xBB, 0x6B, 0xEF, 0xEF, 0xC5, 0x2A, 0xAA, 0xAA, 0x4F, 0xE5, 0xFB, 0xFB, 0xED, 0x16
	.byte 0x43, 0x43, 0x86, 0xC5, 0x4D, 0x4D, 0x9A, 0xD7, 0x33, 0x33, 0x66, 0x55, 0x85, 0x85, 0x11, 0x94
	.byte 0x45, 0x45, 0x8A, 0xCF, 0xF9, 0xF9, 0xE9, 0x10, 0x02, 0x02, 0x04, 0x06, 0x7F, 0x7F, 0xFE, 0x81
	.byte 0x50, 0x50, 0xA0, 0xF0, 0x3C, 0x3C, 0x78, 0x44, 0x9F, 0x9F, 0x25, 0xBA, 0xA8, 0xA8, 0x4B, 0xE3
	.byte 0x51, 0x51, 0xA2, 0xF3, 0xA3, 0xA3, 0x5D, 0xFE, 0x40, 0x40, 0x80, 0xC0, 0x8F, 0x8F, 0x05, 0x8A
	.byte 0x92, 0x92, 0x3F, 0xAD, 0x9D, 0x9D, 0x21, 0xBC, 0x38, 0x38, 0x70, 0x48, 0xF5, 0xF5, 0xF1, 0x04
	.byte 0xBC, 0xBC, 0x63, 0xDF, 0xB6, 0xB6, 0x77, 0xC1, 0xDA, 0xDA, 0xAF, 0x75, 0x21, 0x21, 0x42, 0x63
	.byte 0x10, 0x10, 0x20, 0x30, 0xFF, 0xFF, 0xE5, 0x1A, 0xF3, 0xF3, 0xFD, 0x0E, 0xD2, 0xD2, 0xBF, 0x6D
	.byte 0xCD, 0xCD, 0x81, 0x4C, 0x0C, 0x0C, 0x18, 0x14, 0x13, 0x13, 0x26, 0x35, 0xEC, 0xEC, 0xC3, 0x2F
	.byte 0x5F, 0x5F, 0xBE, 0xE1, 0x97, 0x97, 0x35, 0xA2, 0x44, 0x44, 0x88, 0xCC, 0x17, 0x17, 0x2E, 0x39
	.byte 0xC4, 0xC4, 0x93, 0x57, 0xA7, 0xA7, 0x55, 0xF2, 0x7E, 0x7E, 0xFC, 0x82, 0x3D, 0x3D, 0x7A, 0x47
	.byte 0x64, 0x64, 0xC8, 0xAC, 0x5D, 0x5D, 0xBA, 0xE7, 0x19, 0x19, 0x32, 0x2B, 0x73, 0x73, 0xE6, 0x95
	.byte 0x60, 0x60, 0xC0, 0xA0, 0x81, 0x81, 0x19, 0x98, 0x4F, 0x4F, 0x9E, 0xD1, 0xDC, 0xDC, 0xA3, 0x7F
	.byte 0x22, 0x22, 0x44, 0x66, 0x2A, 0x2A, 0x54, 0x7E, 0x90, 0x90, 0x3B, 0xAB, 0x88, 0x88, 0x0B, 0x83
	.byte 0x46, 0x46, 0x8C, 0xCA, 0xEE, 0xEE, 0xC7, 0x29, 0xB8, 0xB8, 0x6B, 0xD3, 0x14, 0x14, 0x28, 0x3C
	.byte 0xDE, 0xDE, 0xA7, 0x79, 0x5E, 0x5E, 0xBC, 0xE2, 0x0B, 0x0B, 0x16, 0x1D, 0xDB, 0xDB, 0xAD, 0x76
	.byte 0xE0, 0xE0, 0xDB, 0x3B, 0x32, 0x32, 0x64, 0x56, 0x3A, 0x3A, 0x74, 0x4E, 0x0A, 0x0A, 0x14, 0x1E
	.byte 0x49, 0x49, 0x92, 0xDB, 0x06, 0x06, 0x0C, 0x0A, 0x24, 0x24, 0x48, 0x6C, 0x5C, 0x5C, 0xB8, 0xE4
	.byte 0xC2, 0xC2, 0x9F, 0x5D, 0xD3, 0xD3, 0xBD, 0x6E, 0xAC, 0xAC, 0x43, 0xEF, 0x62, 0x62, 0xC4, 0xA6
	.byte 0x91, 0x91, 0x39, 0xA8, 0x95, 0x95, 0x31, 0xA4, 0xE4, 0xE4, 0xD3, 0x37, 0x79, 0x79, 0xF2, 0x8B
	.byte 0xE7, 0xE7, 0xD5, 0x32, 0xC8, 0xC8, 0x8B, 0x43, 0x37, 0x37, 0x6E, 0x59, 0x6D, 0x6D, 0xDA, 0xB7
	.byte 0x8D, 0x8D, 0x01, 0x8C, 0xD5, 0xD5, 0xB1, 0x64, 0x4E, 0x4E, 0x9C, 0xD2, 0xA9, 0xA9, 0x49, 0xE0
	.byte 0x6C, 0x6C, 0xD8, 0xB4, 0x56, 0x56, 0xAC, 0xFA, 0xF4, 0xF4, 0xF3, 0x07, 0xEA, 0xEA, 0xCF, 0x25
	.byte 0x65, 0x65, 0xCA, 0xAF, 0x7A, 0x7A, 0xF4, 0x8E, 0xAE, 0xAE, 0x47, 0xE9, 0x08, 0x08, 0x10, 0x18
	.byte 0xBA, 0xBA, 0x6F, 0xD5, 0x78, 0x78, 0xF0, 0x88, 0x25, 0x25, 0x4A, 0x6F, 0x2E, 0x2E, 0x5C, 0x72
	.byte 0x1C, 0x1C, 0x38, 0x24, 0xA6, 0xA6, 0x57, 0xF1, 0xB4, 0xB4, 0x73, 0xC7, 0xC6, 0xC6, 0x97, 0x51
	.byte 0xE8, 0xE8, 0xCB, 0x23, 0xDD, 0xDD, 0xA1, 0x7C, 0x74, 0x74, 0xE8, 0x9C, 0x1F, 0x1F, 0x3E, 0x21
	.byte 0x4B, 0x4B, 0x96, 0xDD, 0xBD, 0xBD, 0x61, 0xDC, 0x8B, 0x8B, 0x0D, 0x86, 0x8A, 0x8A, 0x0F, 0x85
	.byte 0x70, 0x70, 0xE0, 0x90, 0x3E, 0x3E, 0x7C, 0x42, 0xB5, 0xB5, 0x71, 0xC4, 0x66, 0x66, 0xCC, 0xAA
	.byte 0x48, 0x48, 0x90, 0xD8, 0x03, 0x03, 0x06, 0x05, 0xF6, 0xF6, 0xF7, 0x01, 0x0E, 0x0E, 0x1C, 0x12
	.byte 0x61, 0x61, 0xC2, 0xA3, 0x35, 0x35, 0x6A, 0x5F, 0x57, 0x57, 0xAE, 0xF9, 0xB9, 0xB9, 0x69, 0xD0
	.byte 0x86, 0x86, 0x17, 0x91, 0xC1, 0xC1, 0x99, 0x58, 0x1D, 0x1D, 0x3A, 0x27, 0x9E, 0x9E, 0x27, 0xB9
	.byte 0xE1, 0xE1, 0xD9, 0x38, 0xF8, 0xF8, 0xEB, 0x13, 0x98, 0x98, 0x2B, 0xB3, 0x11, 0x11, 0x22, 0x33
	.byte 0x69, 0x69, 0xD2, 0xBB, 0xD9, 0xD9, 0xA9, 0x70, 0x8E, 0x8E, 0x07, 0x89, 0x94, 0x94, 0x33, 0xA7
	.byte 0x9B, 0x9B, 0x2D, 0xB6, 0x1E, 0x1E, 0x3C, 0x22, 0x87, 0x87, 0x15, 0x92, 0xE9, 0xE9, 0xC9, 0x20
	.byte 0xCE, 0xCE, 0x87, 0x49, 0x55, 0x55, 0xAA, 0xFF, 0x28, 0x28, 0x50, 0x78, 0xDF, 0xDF, 0xA5, 0x7A
	.byte 0x8C, 0x8C, 0x03, 0x8F, 0xA1, 0xA1, 0x59, 0xF8, 0x89, 0x89, 0x09, 0x80, 0x0D, 0x0D, 0x1A, 0x17
	.byte 0xBF, 0xBF, 0x65, 0xDA, 0xE6, 0xE6, 0xD7, 0x31, 0x42, 0x42, 0x84, 0xC6, 0x68, 0x68, 0xD0, 0xB8
	.byte 0x41, 0x41, 0x82, 0xC3, 0x99, 0x99, 0x29, 0xB0, 0x2D, 0x2D, 0x5A, 0x77, 0x0F, 0x0F, 0x1E, 0x11
	.byte 0xB0, 0xB0, 0x7B, 0xCB, 0x54, 0x54, 0xA8, 0xFC, 0xBB, 0xBB, 0x6D, 0xD6, 0x16, 0x16, 0x2C, 0x3A

ov13_02243AB0: ; 0x02243AB0
	.byte 0x63, 0xC6, 0xA5, 0x63, 0x7C, 0xF8, 0x84, 0x7C, 0x77, 0xEE, 0x99, 0x77, 0x7B, 0xF6, 0x8D, 0x7B
	.byte 0xF2, 0xFF, 0x0D, 0xF2, 0x6B, 0xD6, 0xBD, 0x6B, 0x6F, 0xDE, 0xB1, 0x6F, 0xC5, 0x91, 0x54, 0xC5
	.byte 0x30, 0x60, 0x50, 0x30, 0x01, 0x02, 0x03, 0x01, 0x67, 0xCE, 0xA9, 0x67, 0x2B, 0x56, 0x7D, 0x2B
	.byte 0xFE, 0xE7, 0x19, 0xFE, 0xD7, 0xB5, 0x62, 0xD7, 0xAB, 0x4D, 0xE6, 0xAB, 0x76, 0xEC, 0x9A, 0x76
	.byte 0xCA, 0x8F, 0x45, 0xCA, 0x82, 0x1F, 0x9D, 0x82, 0xC9, 0x89, 0x40, 0xC9, 0x7D, 0xFA, 0x87, 0x7D
	.byte 0xFA, 0xEF, 0x15, 0xFA, 0x59, 0xB2, 0xEB, 0x59, 0x47, 0x8E, 0xC9, 0x47, 0xF0, 0xFB, 0x0B, 0xF0
	.byte 0xAD, 0x41, 0xEC, 0xAD, 0xD4, 0xB3, 0x67, 0xD4, 0xA2, 0x5F, 0xFD, 0xA2, 0xAF, 0x45, 0xEA, 0xAF
	.byte 0x9C, 0x23, 0xBF, 0x9C, 0xA4, 0x53, 0xF7, 0xA4, 0x72, 0xE4, 0x96, 0x72, 0xC0, 0x9B, 0x5B, 0xC0
	.byte 0xB7, 0x75, 0xC2, 0xB7, 0xFD, 0xE1, 0x1C, 0xFD, 0x93, 0x3D, 0xAE, 0x93, 0x26, 0x4C, 0x6A, 0x26
	.byte 0x36, 0x6C, 0x5A, 0x36, 0x3F, 0x7E, 0x41, 0x3F, 0xF7, 0xF5, 0x02, 0xF7, 0xCC, 0x83, 0x4F, 0xCC
	.byte 0x34, 0x68, 0x5C, 0x34, 0xA5, 0x51, 0xF4, 0xA5, 0xE5, 0xD1, 0x34, 0xE5, 0xF1, 0xF9, 0x08, 0xF1
	.byte 0x71, 0xE2, 0x93, 0x71, 0xD8, 0xAB, 0x73, 0xD8, 0x31, 0x62, 0x53, 0x31, 0x15, 0x2A, 0x3F, 0x15
	.byte 0x04, 0x08, 0x0C, 0x04, 0xC7, 0x95, 0x52, 0xC7, 0x23, 0x46, 0x65, 0x23, 0xC3, 0x9D, 0x5E, 0xC3
	.byte 0x18, 0x30, 0x28, 0x18, 0x96, 0x37, 0xA1, 0x96, 0x05, 0x0A, 0x0F, 0x05, 0x9A, 0x2F, 0xB5, 0x9A
	.byte 0x07, 0x0E, 0x09, 0x07, 0x12, 0x24, 0x36, 0x12, 0x80, 0x1B, 0x9B, 0x80, 0xE2, 0xDF, 0x3D, 0xE2
	.byte 0xEB, 0xCD, 0x26, 0xEB, 0x27, 0x4E, 0x69, 0x27, 0xB2, 0x7F, 0xCD, 0xB2, 0x75, 0xEA, 0x9F, 0x75
	.byte 0x09, 0x12, 0x1B, 0x09, 0x83, 0x1D, 0x9E, 0x83, 0x2C, 0x58, 0x74, 0x2C, 0x1A, 0x34, 0x2E, 0x1A
	.byte 0x1B, 0x36, 0x2D, 0x1B, 0x6E, 0xDC, 0xB2, 0x6E, 0x5A, 0xB4, 0xEE, 0x5A, 0xA0, 0x5B, 0xFB, 0xA0
	.byte 0x52, 0xA4, 0xF6, 0x52, 0x3B, 0x76, 0x4D, 0x3B, 0xD6, 0xB7, 0x61, 0xD6, 0xB3, 0x7D, 0xCE, 0xB3
	.byte 0x29, 0x52, 0x7B, 0x29, 0xE3, 0xDD, 0x3E, 0xE3, 0x2F, 0x5E, 0x71, 0x2F, 0x84, 0x13, 0x97, 0x84
	.byte 0x53, 0xA6, 0xF5, 0x53, 0xD1, 0xB9, 0x68, 0xD1, 0x00, 0x00, 0x00, 0x00, 0xED, 0xC1, 0x2C, 0xED
	.byte 0x20, 0x40, 0x60, 0x20, 0xFC, 0xE3, 0x1F, 0xFC, 0xB1, 0x79, 0xC8, 0xB1, 0x5B, 0xB6, 0xED, 0x5B
	.byte 0x6A, 0xD4, 0xBE, 0x6A, 0xCB, 0x8D, 0x46, 0xCB, 0xBE, 0x67, 0xD9, 0xBE, 0x39, 0x72, 0x4B, 0x39
	.byte 0x4A, 0x94, 0xDE, 0x4A, 0x4C, 0x98, 0xD4, 0x4C, 0x58, 0xB0, 0xE8, 0x58, 0xCF, 0x85, 0x4A, 0xCF
	.byte 0xD0, 0xBB, 0x6B, 0xD0, 0xEF, 0xC5, 0x2A, 0xEF, 0xAA, 0x4F, 0xE5, 0xAA, 0xFB, 0xED, 0x16, 0xFB
	.byte 0x43, 0x86, 0xC5, 0x43, 0x4D, 0x9A, 0xD7, 0x4D, 0x33, 0x66, 0x55, 0x33, 0x85, 0x11, 0x94, 0x85
	.byte 0x45, 0x8A, 0xCF, 0x45, 0xF9, 0xE9, 0x10, 0xF9, 0x02, 0x04, 0x06, 0x02, 0x7F, 0xFE, 0x81, 0x7F
	.byte 0x50, 0xA0, 0xF0, 0x50, 0x3C, 0x78, 0x44, 0x3C, 0x9F, 0x25, 0xBA, 0x9F, 0xA8, 0x4B, 0xE3, 0xA8
	.byte 0x51, 0xA2, 0xF3, 0x51, 0xA3, 0x5D, 0xFE, 0xA3, 0x40, 0x80, 0xC0, 0x40, 0x8F, 0x05, 0x8A, 0x8F
	.byte 0x92, 0x3F, 0xAD, 0x92, 0x9D, 0x21, 0xBC, 0x9D, 0x38, 0x70, 0x48, 0x38, 0xF5, 0xF1, 0x04, 0xF5
	.byte 0xBC, 0x63, 0xDF, 0xBC, 0xB6, 0x77, 0xC1, 0xB6, 0xDA, 0xAF, 0x75, 0xDA, 0x21, 0x42, 0x63, 0x21
	.byte 0x10, 0x20, 0x30, 0x10, 0xFF, 0xE5, 0x1A, 0xFF, 0xF3, 0xFD, 0x0E, 0xF3, 0xD2, 0xBF, 0x6D, 0xD2
	.byte 0xCD, 0x81, 0x4C, 0xCD, 0x0C, 0x18, 0x14, 0x0C, 0x13, 0x26, 0x35, 0x13, 0xEC, 0xC3, 0x2F, 0xEC
	.byte 0x5F, 0xBE, 0xE1, 0x5F, 0x97, 0x35, 0xA2, 0x97, 0x44, 0x88, 0xCC, 0x44, 0x17, 0x2E, 0x39, 0x17
	.byte 0xC4, 0x93, 0x57, 0xC4, 0xA7, 0x55, 0xF2, 0xA7, 0x7E, 0xFC, 0x82, 0x7E, 0x3D, 0x7A, 0x47, 0x3D
	.byte 0x64, 0xC8, 0xAC, 0x64, 0x5D, 0xBA, 0xE7, 0x5D, 0x19, 0x32, 0x2B, 0x19, 0x73, 0xE6, 0x95, 0x73
	.byte 0x60, 0xC0, 0xA0, 0x60, 0x81, 0x19, 0x98, 0x81, 0x4F, 0x9E, 0xD1, 0x4F, 0xDC, 0xA3, 0x7F, 0xDC
	.byte 0x22, 0x44, 0x66, 0x22, 0x2A, 0x54, 0x7E, 0x2A, 0x90, 0x3B, 0xAB, 0x90, 0x88, 0x0B, 0x83, 0x88
	.byte 0x46, 0x8C, 0xCA, 0x46, 0xEE, 0xC7, 0x29, 0xEE, 0xB8, 0x6B, 0xD3, 0xB8, 0x14, 0x28, 0x3C, 0x14
	.byte 0xDE, 0xA7, 0x79, 0xDE, 0x5E, 0xBC, 0xE2, 0x5E, 0x0B, 0x16, 0x1D, 0x0B, 0xDB, 0xAD, 0x76, 0xDB
	.byte 0xE0, 0xDB, 0x3B, 0xE0, 0x32, 0x64, 0x56, 0x32, 0x3A, 0x74, 0x4E, 0x3A, 0x0A, 0x14, 0x1E, 0x0A
	.byte 0x49, 0x92, 0xDB, 0x49, 0x06, 0x0C, 0x0A, 0x06, 0x24, 0x48, 0x6C, 0x24, 0x5C, 0xB8, 0xE4, 0x5C
	.byte 0xC2, 0x9F, 0x5D, 0xC2, 0xD3, 0xBD, 0x6E, 0xD3, 0xAC, 0x43, 0xEF, 0xAC, 0x62, 0xC4, 0xA6, 0x62
	.byte 0x91, 0x39, 0xA8, 0x91, 0x95, 0x31, 0xA4, 0x95, 0xE4, 0xD3, 0x37, 0xE4, 0x79, 0xF2, 0x8B, 0x79
	.byte 0xE7, 0xD5, 0x32, 0xE7, 0xC8, 0x8B, 0x43, 0xC8, 0x37, 0x6E, 0x59, 0x37, 0x6D, 0xDA, 0xB7, 0x6D
	.byte 0x8D, 0x01, 0x8C, 0x8D, 0xD5, 0xB1, 0x64, 0xD5, 0x4E, 0x9C, 0xD2, 0x4E, 0xA9, 0x49, 0xE0, 0xA9
	.byte 0x6C, 0xD8, 0xB4, 0x6C, 0x56, 0xAC, 0xFA, 0x56, 0xF4, 0xF3, 0x07, 0xF4, 0xEA, 0xCF, 0x25, 0xEA
	.byte 0x65, 0xCA, 0xAF, 0x65, 0x7A, 0xF4, 0x8E, 0x7A, 0xAE, 0x47, 0xE9, 0xAE, 0x08, 0x10, 0x18, 0x08
	.byte 0xBA, 0x6F, 0xD5, 0xBA, 0x78, 0xF0, 0x88, 0x78, 0x25, 0x4A, 0x6F, 0x25, 0x2E, 0x5C, 0x72, 0x2E
	.byte 0x1C, 0x38, 0x24, 0x1C, 0xA6, 0x57, 0xF1, 0xA6, 0xB4, 0x73, 0xC7, 0xB4, 0xC6, 0x97, 0x51, 0xC6
	.byte 0xE8, 0xCB, 0x23, 0xE8, 0xDD, 0xA1, 0x7C, 0xDD, 0x74, 0xE8, 0x9C, 0x74, 0x1F, 0x3E, 0x21, 0x1F
	.byte 0x4B, 0x96, 0xDD, 0x4B, 0xBD, 0x61, 0xDC, 0xBD, 0x8B, 0x0D, 0x86, 0x8B, 0x8A, 0x0F, 0x85, 0x8A
	.byte 0x70, 0xE0, 0x90, 0x70, 0x3E, 0x7C, 0x42, 0x3E, 0xB5, 0x71, 0xC4, 0xB5, 0x66, 0xCC, 0xAA, 0x66
	.byte 0x48, 0x90, 0xD8, 0x48, 0x03, 0x06, 0x05, 0x03, 0xF6, 0xF7, 0x01, 0xF6, 0x0E, 0x1C, 0x12, 0x0E
	.byte 0x61, 0xC2, 0xA3, 0x61, 0x35, 0x6A, 0x5F, 0x35, 0x57, 0xAE, 0xF9, 0x57, 0xB9, 0x69, 0xD0, 0xB9
	.byte 0x86, 0x17, 0x91, 0x86, 0xC1, 0x99, 0x58, 0xC1, 0x1D, 0x3A, 0x27, 0x1D, 0x9E, 0x27, 0xB9, 0x9E
	.byte 0xE1, 0xD9, 0x38, 0xE1, 0xF8, 0xEB, 0x13, 0xF8, 0x98, 0x2B, 0xB3, 0x98, 0x11, 0x22, 0x33, 0x11
	.byte 0x69, 0xD2, 0xBB, 0x69, 0xD9, 0xA9, 0x70, 0xD9, 0x8E, 0x07, 0x89, 0x8E, 0x94, 0x33, 0xA7, 0x94
	.byte 0x9B, 0x2D, 0xB6, 0x9B, 0x1E, 0x3C, 0x22, 0x1E, 0x87, 0x15, 0x92, 0x87, 0xE9, 0xC9, 0x20, 0xE9
	.byte 0xCE, 0x87, 0x49, 0xCE, 0x55, 0xAA, 0xFF, 0x55, 0x28, 0x50, 0x78, 0x28, 0xDF, 0xA5, 0x7A, 0xDF
	.byte 0x8C, 0x03, 0x8F, 0x8C, 0xA1, 0x59, 0xF8, 0xA1, 0x89, 0x09, 0x80, 0x89, 0x0D, 0x1A, 0x17, 0x0D
	.byte 0xBF, 0x65, 0xDA, 0xBF, 0xE6, 0xD7, 0x31, 0xE6, 0x42, 0x84, 0xC6, 0x42, 0x68, 0xD0, 0xB8, 0x68
	.byte 0x41, 0x82, 0xC3, 0x41, 0x99, 0x29, 0xB0, 0x99, 0x2D, 0x5A, 0x77, 0x2D, 0x0F, 0x1E, 0x11, 0x0F
	.byte 0xB0, 0x7B, 0xCB, 0xB0, 0x54, 0xA8, 0xFC, 0x54, 0xBB, 0x6D, 0xD6, 0xBB, 0x16, 0x2C, 0x3A, 0x16

ov13_02243EB0: ; 0x02243EB0
	.byte 0xC6, 0xA5, 0x63, 0x63, 0xF8, 0x84, 0x7C, 0x7C, 0xEE, 0x99, 0x77, 0x77, 0xF6, 0x8D, 0x7B, 0x7B
	.byte 0xFF, 0x0D, 0xF2, 0xF2, 0xD6, 0xBD, 0x6B, 0x6B, 0xDE, 0xB1, 0x6F, 0x6F, 0x91, 0x54, 0xC5, 0xC5
	.byte 0x60, 0x50, 0x30, 0x30, 0x02, 0x03, 0x01, 0x01, 0xCE, 0xA9, 0x67, 0x67, 0x56, 0x7D, 0x2B, 0x2B
	.byte 0xE7, 0x19, 0xFE, 0xFE, 0xB5, 0x62, 0xD7, 0xD7, 0x4D, 0xE6, 0xAB, 0xAB, 0xEC, 0x9A, 0x76, 0x76
	.byte 0x8F, 0x45, 0xCA, 0xCA, 0x1F, 0x9D, 0x82, 0x82, 0x89, 0x40, 0xC9, 0xC9, 0xFA, 0x87, 0x7D, 0x7D
	.byte 0xEF, 0x15, 0xFA, 0xFA, 0xB2, 0xEB, 0x59, 0x59, 0x8E, 0xC9, 0x47, 0x47, 0xFB, 0x0B, 0xF0, 0xF0
	.byte 0x41, 0xEC, 0xAD, 0xAD, 0xB3, 0x67, 0xD4, 0xD4, 0x5F, 0xFD, 0xA2, 0xA2, 0x45, 0xEA, 0xAF, 0xAF
	.byte 0x23, 0xBF, 0x9C, 0x9C, 0x53, 0xF7, 0xA4, 0xA4, 0xE4, 0x96, 0x72, 0x72, 0x9B, 0x5B, 0xC0, 0xC0
	.byte 0x75, 0xC2, 0xB7, 0xB7, 0xE1, 0x1C, 0xFD, 0xFD, 0x3D, 0xAE, 0x93, 0x93, 0x4C, 0x6A, 0x26, 0x26
	.byte 0x6C, 0x5A, 0x36, 0x36, 0x7E, 0x41, 0x3F, 0x3F, 0xF5, 0x02, 0xF7, 0xF7, 0x83, 0x4F, 0xCC, 0xCC
	.byte 0x68, 0x5C, 0x34, 0x34, 0x51, 0xF4, 0xA5, 0xA5, 0xD1, 0x34, 0xE5, 0xE5, 0xF9, 0x08, 0xF1, 0xF1
	.byte 0xE2, 0x93, 0x71, 0x71, 0xAB, 0x73, 0xD8, 0xD8, 0x62, 0x53, 0x31, 0x31, 0x2A, 0x3F, 0x15, 0x15
	.byte 0x08, 0x0C, 0x04, 0x04, 0x95, 0x52, 0xC7, 0xC7, 0x46, 0x65, 0x23, 0x23, 0x9D, 0x5E, 0xC3, 0xC3
	.byte 0x30, 0x28, 0x18, 0x18, 0x37, 0xA1, 0x96, 0x96, 0x0A, 0x0F, 0x05, 0x05, 0x2F, 0xB5, 0x9A, 0x9A
	.byte 0x0E, 0x09, 0x07, 0x07, 0x24, 0x36, 0x12, 0x12, 0x1B, 0x9B, 0x80, 0x80, 0xDF, 0x3D, 0xE2, 0xE2
	.byte 0xCD, 0x26, 0xEB, 0xEB, 0x4E, 0x69, 0x27, 0x27, 0x7F, 0xCD, 0xB2, 0xB2, 0xEA, 0x9F, 0x75, 0x75
	.byte 0x12, 0x1B, 0x09, 0x09, 0x1D, 0x9E, 0x83, 0x83, 0x58, 0x74, 0x2C, 0x2C, 0x34, 0x2E, 0x1A, 0x1A
	.byte 0x36, 0x2D, 0x1B, 0x1B, 0xDC, 0xB2, 0x6E, 0x6E, 0xB4, 0xEE, 0x5A, 0x5A, 0x5B, 0xFB, 0xA0, 0xA0
	.byte 0xA4, 0xF6, 0x52, 0x52, 0x76, 0x4D, 0x3B, 0x3B, 0xB7, 0x61, 0xD6, 0xD6, 0x7D, 0xCE, 0xB3, 0xB3
	.byte 0x52, 0x7B, 0x29, 0x29, 0xDD, 0x3E, 0xE3, 0xE3, 0x5E, 0x71, 0x2F, 0x2F, 0x13, 0x97, 0x84, 0x84
	.byte 0xA6, 0xF5, 0x53, 0x53, 0xB9, 0x68, 0xD1, 0xD1, 0x00, 0x00, 0x00, 0x00, 0xC1, 0x2C, 0xED, 0xED
	.byte 0x40, 0x60, 0x20, 0x20, 0xE3, 0x1F, 0xFC, 0xFC, 0x79, 0xC8, 0xB1, 0xB1, 0xB6, 0xED, 0x5B, 0x5B
	.byte 0xD4, 0xBE, 0x6A, 0x6A, 0x8D, 0x46, 0xCB, 0xCB, 0x67, 0xD9, 0xBE, 0xBE, 0x72, 0x4B, 0x39, 0x39
	.byte 0x94, 0xDE, 0x4A, 0x4A, 0x98, 0xD4, 0x4C, 0x4C, 0xB0, 0xE8, 0x58, 0x58, 0x85, 0x4A, 0xCF, 0xCF
	.byte 0xBB, 0x6B, 0xD0, 0xD0, 0xC5, 0x2A, 0xEF, 0xEF, 0x4F, 0xE5, 0xAA, 0xAA, 0xED, 0x16, 0xFB, 0xFB
	.byte 0x86, 0xC5, 0x43, 0x43, 0x9A, 0xD7, 0x4D, 0x4D, 0x66, 0x55, 0x33, 0x33, 0x11, 0x94, 0x85, 0x85
	.byte 0x8A, 0xCF, 0x45, 0x45, 0xE9, 0x10, 0xF9, 0xF9, 0x04, 0x06, 0x02, 0x02, 0xFE, 0x81, 0x7F, 0x7F
	.byte 0xA0, 0xF0, 0x50, 0x50, 0x78, 0x44, 0x3C, 0x3C, 0x25, 0xBA, 0x9F, 0x9F, 0x4B, 0xE3, 0xA8, 0xA8
	.byte 0xA2, 0xF3, 0x51, 0x51, 0x5D, 0xFE, 0xA3, 0xA3, 0x80, 0xC0, 0x40, 0x40, 0x05, 0x8A, 0x8F, 0x8F
	.byte 0x3F, 0xAD, 0x92, 0x92, 0x21, 0xBC, 0x9D, 0x9D, 0x70, 0x48, 0x38, 0x38, 0xF1, 0x04, 0xF5, 0xF5
	.byte 0x63, 0xDF, 0xBC, 0xBC, 0x77, 0xC1, 0xB6, 0xB6, 0xAF, 0x75, 0xDA, 0xDA, 0x42, 0x63, 0x21, 0x21
	.byte 0x20, 0x30, 0x10, 0x10, 0xE5, 0x1A, 0xFF, 0xFF, 0xFD, 0x0E, 0xF3, 0xF3, 0xBF, 0x6D, 0xD2, 0xD2
	.byte 0x81, 0x4C, 0xCD, 0xCD, 0x18, 0x14, 0x0C, 0x0C, 0x26, 0x35, 0x13, 0x13, 0xC3, 0x2F, 0xEC, 0xEC
	.byte 0xBE, 0xE1, 0x5F, 0x5F, 0x35, 0xA2, 0x97, 0x97, 0x88, 0xCC, 0x44, 0x44, 0x2E, 0x39, 0x17, 0x17
	.byte 0x93, 0x57, 0xC4, 0xC4, 0x55, 0xF2, 0xA7, 0xA7, 0xFC, 0x82, 0x7E, 0x7E, 0x7A, 0x47, 0x3D, 0x3D
	.byte 0xC8, 0xAC, 0x64, 0x64, 0xBA, 0xE7, 0x5D, 0x5D, 0x32, 0x2B, 0x19, 0x19, 0xE6, 0x95, 0x73, 0x73
	.byte 0xC0, 0xA0, 0x60, 0x60, 0x19, 0x98, 0x81, 0x81, 0x9E, 0xD1, 0x4F, 0x4F, 0xA3, 0x7F, 0xDC, 0xDC
	.byte 0x44, 0x66, 0x22, 0x22, 0x54, 0x7E, 0x2A, 0x2A, 0x3B, 0xAB, 0x90, 0x90, 0x0B, 0x83, 0x88, 0x88
	.byte 0x8C, 0xCA, 0x46, 0x46, 0xC7, 0x29, 0xEE, 0xEE, 0x6B, 0xD3, 0xB8, 0xB8, 0x28, 0x3C, 0x14, 0x14
	.byte 0xA7, 0x79, 0xDE, 0xDE, 0xBC, 0xE2, 0x5E, 0x5E, 0x16, 0x1D, 0x0B, 0x0B, 0xAD, 0x76, 0xDB, 0xDB
	.byte 0xDB, 0x3B, 0xE0, 0xE0, 0x64, 0x56, 0x32, 0x32, 0x74, 0x4E, 0x3A, 0x3A, 0x14, 0x1E, 0x0A, 0x0A
	.byte 0x92, 0xDB, 0x49, 0x49, 0x0C, 0x0A, 0x06, 0x06, 0x48, 0x6C, 0x24, 0x24, 0xB8, 0xE4, 0x5C, 0x5C
	.byte 0x9F, 0x5D, 0xC2, 0xC2, 0xBD, 0x6E, 0xD3, 0xD3, 0x43, 0xEF, 0xAC, 0xAC, 0xC4, 0xA6, 0x62, 0x62
	.byte 0x39, 0xA8, 0x91, 0x91, 0x31, 0xA4, 0x95, 0x95, 0xD3, 0x37, 0xE4, 0xE4, 0xF2, 0x8B, 0x79, 0x79
	.byte 0xD5, 0x32, 0xE7, 0xE7, 0x8B, 0x43, 0xC8, 0xC8, 0x6E, 0x59, 0x37, 0x37, 0xDA, 0xB7, 0x6D, 0x6D
	.byte 0x01, 0x8C, 0x8D, 0x8D, 0xB1, 0x64, 0xD5, 0xD5, 0x9C, 0xD2, 0x4E, 0x4E, 0x49, 0xE0, 0xA9, 0xA9
	.byte 0xD8, 0xB4, 0x6C, 0x6C, 0xAC, 0xFA, 0x56, 0x56, 0xF3, 0x07, 0xF4, 0xF4, 0xCF, 0x25, 0xEA, 0xEA
	.byte 0xCA, 0xAF, 0x65, 0x65, 0xF4, 0x8E, 0x7A, 0x7A, 0x47, 0xE9, 0xAE, 0xAE, 0x10, 0x18, 0x08, 0x08
	.byte 0x6F, 0xD5, 0xBA, 0xBA, 0xF0, 0x88, 0x78, 0x78, 0x4A, 0x6F, 0x25, 0x25, 0x5C, 0x72, 0x2E, 0x2E
	.byte 0x38, 0x24, 0x1C, 0x1C, 0x57, 0xF1, 0xA6, 0xA6, 0x73, 0xC7, 0xB4, 0xB4, 0x97, 0x51, 0xC6, 0xC6
	.byte 0xCB, 0x23, 0xE8, 0xE8, 0xA1, 0x7C, 0xDD, 0xDD, 0xE8, 0x9C, 0x74, 0x74, 0x3E, 0x21, 0x1F, 0x1F
	.byte 0x96, 0xDD, 0x4B, 0x4B, 0x61, 0xDC, 0xBD, 0xBD, 0x0D, 0x86, 0x8B, 0x8B, 0x0F, 0x85, 0x8A, 0x8A
	.byte 0xE0, 0x90, 0x70, 0x70, 0x7C, 0x42, 0x3E, 0x3E, 0x71, 0xC4, 0xB5, 0xB5, 0xCC, 0xAA, 0x66, 0x66
	.byte 0x90, 0xD8, 0x48, 0x48, 0x06, 0x05, 0x03, 0x03, 0xF7, 0x01, 0xF6, 0xF6, 0x1C, 0x12, 0x0E, 0x0E
	.byte 0xC2, 0xA3, 0x61, 0x61, 0x6A, 0x5F, 0x35, 0x35, 0xAE, 0xF9, 0x57, 0x57, 0x69, 0xD0, 0xB9, 0xB9
	.byte 0x17, 0x91, 0x86, 0x86, 0x99, 0x58, 0xC1, 0xC1, 0x3A, 0x27, 0x1D, 0x1D, 0x27, 0xB9, 0x9E, 0x9E
	.byte 0xD9, 0x38, 0xE1, 0xE1, 0xEB, 0x13, 0xF8, 0xF8, 0x2B, 0xB3, 0x98, 0x98, 0x22, 0x33, 0x11, 0x11
	.byte 0xD2, 0xBB, 0x69, 0x69, 0xA9, 0x70, 0xD9, 0xD9, 0x07, 0x89, 0x8E, 0x8E, 0x33, 0xA7, 0x94, 0x94
	.byte 0x2D, 0xB6, 0x9B, 0x9B, 0x3C, 0x22, 0x1E, 0x1E, 0x15, 0x92, 0x87, 0x87, 0xC9, 0x20, 0xE9, 0xE9
	.byte 0x87, 0x49, 0xCE, 0xCE, 0xAA, 0xFF, 0x55, 0x55, 0x50, 0x78, 0x28, 0x28, 0xA5, 0x7A, 0xDF, 0xDF
	.byte 0x03, 0x8F, 0x8C, 0x8C, 0x59, 0xF8, 0xA1, 0xA1, 0x09, 0x80, 0x89, 0x89, 0x1A, 0x17, 0x0D, 0x0D
	.byte 0x65, 0xDA, 0xBF, 0xBF, 0xD7, 0x31, 0xE6, 0xE6, 0x84, 0xC6, 0x42, 0x42, 0xD0, 0xB8, 0x68, 0x68
	.byte 0x82, 0xC3, 0x41, 0x41, 0x29, 0xB0, 0x99, 0x99, 0x5A, 0x77, 0x2D, 0x2D, 0x1E, 0x11, 0x0F, 0x0F
	.byte 0x7B, 0xCB, 0xB0, 0xB0, 0xA8, 0xFC, 0x54, 0x54, 0x6D, 0xD6, 0xBB, 0xBB, 0x2C, 0x3A, 0x16, 0x16

ov13_022442B0: ; 0x022442B0
	.byte 0x63, 0x63, 0x63, 0x63, 0x7C, 0x7C, 0x7C, 0x7C, 0x77, 0x77, 0x77, 0x77, 0x7B, 0x7B, 0x7B, 0x7B
	.byte 0xF2, 0xF2, 0xF2, 0xF2, 0x6B, 0x6B, 0x6B, 0x6B, 0x6F, 0x6F, 0x6F, 0x6F, 0xC5, 0xC5, 0xC5, 0xC5
	.byte 0x30, 0x30, 0x30, 0x30, 0x01, 0x01, 0x01, 0x01, 0x67, 0x67, 0x67, 0x67, 0x2B, 0x2B, 0x2B, 0x2B
	.byte 0xFE, 0xFE, 0xFE, 0xFE, 0xD7, 0xD7, 0xD7, 0xD7, 0xAB, 0xAB, 0xAB, 0xAB, 0x76, 0x76, 0x76, 0x76
	.byte 0xCA, 0xCA, 0xCA, 0xCA, 0x82, 0x82, 0x82, 0x82, 0xC9, 0xC9, 0xC9, 0xC9, 0x7D, 0x7D, 0x7D, 0x7D
	.byte 0xFA, 0xFA, 0xFA, 0xFA, 0x59, 0x59, 0x59, 0x59, 0x47, 0x47, 0x47, 0x47, 0xF0, 0xF0, 0xF0, 0xF0
	.byte 0xAD, 0xAD, 0xAD, 0xAD, 0xD4, 0xD4, 0xD4, 0xD4, 0xA2, 0xA2, 0xA2, 0xA2, 0xAF, 0xAF, 0xAF, 0xAF
	.byte 0x9C, 0x9C, 0x9C, 0x9C, 0xA4, 0xA4, 0xA4, 0xA4, 0x72, 0x72, 0x72, 0x72, 0xC0, 0xC0, 0xC0, 0xC0
	.byte 0xB7, 0xB7, 0xB7, 0xB7, 0xFD, 0xFD, 0xFD, 0xFD, 0x93, 0x93, 0x93, 0x93, 0x26, 0x26, 0x26, 0x26
	.byte 0x36, 0x36, 0x36, 0x36, 0x3F, 0x3F, 0x3F, 0x3F, 0xF7, 0xF7, 0xF7, 0xF7, 0xCC, 0xCC, 0xCC, 0xCC
	.byte 0x34, 0x34, 0x34, 0x34, 0xA5, 0xA5, 0xA5, 0xA5, 0xE5, 0xE5, 0xE5, 0xE5, 0xF1, 0xF1, 0xF1, 0xF1
	.byte 0x71, 0x71, 0x71, 0x71, 0xD8, 0xD8, 0xD8, 0xD8, 0x31, 0x31, 0x31, 0x31, 0x15, 0x15, 0x15, 0x15
	.byte 0x04, 0x04, 0x04, 0x04, 0xC7, 0xC7, 0xC7, 0xC7, 0x23, 0x23, 0x23, 0x23, 0xC3, 0xC3, 0xC3, 0xC3
	.byte 0x18, 0x18, 0x18, 0x18, 0x96, 0x96, 0x96, 0x96, 0x05, 0x05, 0x05, 0x05, 0x9A, 0x9A, 0x9A, 0x9A
	.byte 0x07, 0x07, 0x07, 0x07, 0x12, 0x12, 0x12, 0x12, 0x80, 0x80, 0x80, 0x80, 0xE2, 0xE2, 0xE2, 0xE2
	.byte 0xEB, 0xEB, 0xEB, 0xEB, 0x27, 0x27, 0x27, 0x27, 0xB2, 0xB2, 0xB2, 0xB2, 0x75, 0x75, 0x75, 0x75
	.byte 0x09, 0x09, 0x09, 0x09, 0x83, 0x83, 0x83, 0x83, 0x2C, 0x2C, 0x2C, 0x2C, 0x1A, 0x1A, 0x1A, 0x1A
	.byte 0x1B, 0x1B, 0x1B, 0x1B, 0x6E, 0x6E, 0x6E, 0x6E, 0x5A, 0x5A, 0x5A, 0x5A, 0xA0, 0xA0, 0xA0, 0xA0
	.byte 0x52, 0x52, 0x52, 0x52, 0x3B, 0x3B, 0x3B, 0x3B, 0xD6, 0xD6, 0xD6, 0xD6, 0xB3, 0xB3, 0xB3, 0xB3
	.byte 0x29, 0x29, 0x29, 0x29, 0xE3, 0xE3, 0xE3, 0xE3, 0x2F, 0x2F, 0x2F, 0x2F, 0x84, 0x84, 0x84, 0x84
	.byte 0x53, 0x53, 0x53, 0x53, 0xD1, 0xD1, 0xD1, 0xD1, 0x00, 0x00, 0x00, 0x00, 0xED, 0xED, 0xED, 0xED
	.byte 0x20, 0x20, 0x20, 0x20, 0xFC, 0xFC, 0xFC, 0xFC, 0xB1, 0xB1, 0xB1, 0xB1, 0x5B, 0x5B, 0x5B, 0x5B
	.byte 0x6A, 0x6A, 0x6A, 0x6A, 0xCB, 0xCB, 0xCB, 0xCB, 0xBE, 0xBE, 0xBE, 0xBE, 0x39, 0x39, 0x39, 0x39
	.byte 0x4A, 0x4A, 0x4A, 0x4A, 0x4C, 0x4C, 0x4C, 0x4C, 0x58, 0x58, 0x58, 0x58, 0xCF, 0xCF, 0xCF, 0xCF
	.byte 0xD0, 0xD0, 0xD0, 0xD0, 0xEF, 0xEF, 0xEF, 0xEF, 0xAA, 0xAA, 0xAA, 0xAA, 0xFB, 0xFB, 0xFB, 0xFB
	.byte 0x43, 0x43, 0x43, 0x43, 0x4D, 0x4D, 0x4D, 0x4D, 0x33, 0x33, 0x33, 0x33, 0x85, 0x85, 0x85, 0x85
	.byte 0x45, 0x45, 0x45, 0x45, 0xF9, 0xF9, 0xF9, 0xF9, 0x02, 0x02, 0x02, 0x02, 0x7F, 0x7F, 0x7F, 0x7F
	.byte 0x50, 0x50, 0x50, 0x50, 0x3C, 0x3C, 0x3C, 0x3C, 0x9F, 0x9F, 0x9F, 0x9F, 0xA8, 0xA8, 0xA8, 0xA8
	.byte 0x51, 0x51, 0x51, 0x51, 0xA3, 0xA3, 0xA3, 0xA3, 0x40, 0x40, 0x40, 0x40, 0x8F, 0x8F, 0x8F, 0x8F
	.byte 0x92, 0x92, 0x92, 0x92, 0x9D, 0x9D, 0x9D, 0x9D, 0x38, 0x38, 0x38, 0x38, 0xF5, 0xF5, 0xF5, 0xF5
	.byte 0xBC, 0xBC, 0xBC, 0xBC, 0xB6, 0xB6, 0xB6, 0xB6, 0xDA, 0xDA, 0xDA, 0xDA, 0x21, 0x21, 0x21, 0x21
	.byte 0x10, 0x10, 0x10, 0x10, 0xFF, 0xFF, 0xFF, 0xFF, 0xF3, 0xF3, 0xF3, 0xF3, 0xD2, 0xD2, 0xD2, 0xD2
	.byte 0xCD, 0xCD, 0xCD, 0xCD, 0x0C, 0x0C, 0x0C, 0x0C, 0x13, 0x13, 0x13, 0x13, 0xEC, 0xEC, 0xEC, 0xEC
	.byte 0x5F, 0x5F, 0x5F, 0x5F, 0x97, 0x97, 0x97, 0x97, 0x44, 0x44, 0x44, 0x44, 0x17, 0x17, 0x17, 0x17
	.byte 0xC4, 0xC4, 0xC4, 0xC4, 0xA7, 0xA7, 0xA7, 0xA7, 0x7E, 0x7E, 0x7E, 0x7E, 0x3D, 0x3D, 0x3D, 0x3D
	.byte 0x64, 0x64, 0x64, 0x64, 0x5D, 0x5D, 0x5D, 0x5D, 0x19, 0x19, 0x19, 0x19, 0x73, 0x73, 0x73, 0x73
	.byte 0x60, 0x60, 0x60, 0x60, 0x81, 0x81, 0x81, 0x81, 0x4F, 0x4F, 0x4F, 0x4F, 0xDC, 0xDC, 0xDC, 0xDC
	.byte 0x22, 0x22, 0x22, 0x22, 0x2A, 0x2A, 0x2A, 0x2A, 0x90, 0x90, 0x90, 0x90, 0x88, 0x88, 0x88, 0x88
	.byte 0x46, 0x46, 0x46, 0x46, 0xEE, 0xEE, 0xEE, 0xEE, 0xB8, 0xB8, 0xB8, 0xB8, 0x14, 0x14, 0x14, 0x14
	.byte 0xDE, 0xDE, 0xDE, 0xDE, 0x5E, 0x5E, 0x5E, 0x5E, 0x0B, 0x0B, 0x0B, 0x0B, 0xDB, 0xDB, 0xDB, 0xDB
	.byte 0xE0, 0xE0, 0xE0, 0xE0, 0x32, 0x32, 0x32, 0x32, 0x3A, 0x3A, 0x3A, 0x3A, 0x0A, 0x0A, 0x0A, 0x0A
	.byte 0x49, 0x49, 0x49, 0x49, 0x06, 0x06, 0x06, 0x06, 0x24, 0x24, 0x24, 0x24, 0x5C, 0x5C, 0x5C, 0x5C
	.byte 0xC2, 0xC2, 0xC2, 0xC2, 0xD3, 0xD3, 0xD3, 0xD3, 0xAC, 0xAC, 0xAC, 0xAC, 0x62, 0x62, 0x62, 0x62
	.byte 0x91, 0x91, 0x91, 0x91, 0x95, 0x95, 0x95, 0x95, 0xE4, 0xE4, 0xE4, 0xE4, 0x79, 0x79, 0x79, 0x79
	.byte 0xE7, 0xE7, 0xE7, 0xE7, 0xC8, 0xC8, 0xC8, 0xC8, 0x37, 0x37, 0x37, 0x37, 0x6D, 0x6D, 0x6D, 0x6D
	.byte 0x8D, 0x8D, 0x8D, 0x8D, 0xD5, 0xD5, 0xD5, 0xD5, 0x4E, 0x4E, 0x4E, 0x4E, 0xA9, 0xA9, 0xA9, 0xA9
	.byte 0x6C, 0x6C, 0x6C, 0x6C, 0x56, 0x56, 0x56, 0x56, 0xF4, 0xF4, 0xF4, 0xF4, 0xEA, 0xEA, 0xEA, 0xEA
	.byte 0x65, 0x65, 0x65, 0x65, 0x7A, 0x7A, 0x7A, 0x7A, 0xAE, 0xAE, 0xAE, 0xAE, 0x08, 0x08, 0x08, 0x08
	.byte 0xBA, 0xBA, 0xBA, 0xBA, 0x78, 0x78, 0x78, 0x78, 0x25, 0x25, 0x25, 0x25, 0x2E, 0x2E, 0x2E, 0x2E
	.byte 0x1C, 0x1C, 0x1C, 0x1C, 0xA6, 0xA6, 0xA6, 0xA6, 0xB4, 0xB4, 0xB4, 0xB4, 0xC6, 0xC6, 0xC6, 0xC6
	.byte 0xE8, 0xE8, 0xE8, 0xE8, 0xDD, 0xDD, 0xDD, 0xDD, 0x74, 0x74, 0x74, 0x74, 0x1F, 0x1F, 0x1F, 0x1F
	.byte 0x4B, 0x4B, 0x4B, 0x4B, 0xBD, 0xBD, 0xBD, 0xBD, 0x8B, 0x8B, 0x8B, 0x8B, 0x8A, 0x8A, 0x8A, 0x8A
	.byte 0x70, 0x70, 0x70, 0x70, 0x3E, 0x3E, 0x3E, 0x3E, 0xB5, 0xB5, 0xB5, 0xB5, 0x66, 0x66, 0x66, 0x66
	.byte 0x48, 0x48, 0x48, 0x48, 0x03, 0x03, 0x03, 0x03, 0xF6, 0xF6, 0xF6, 0xF6, 0x0E, 0x0E, 0x0E, 0x0E
	.byte 0x61, 0x61, 0x61, 0x61, 0x35, 0x35, 0x35, 0x35, 0x57, 0x57, 0x57, 0x57, 0xB9, 0xB9, 0xB9, 0xB9
	.byte 0x86, 0x86, 0x86, 0x86, 0xC1, 0xC1, 0xC1, 0xC1, 0x1D, 0x1D, 0x1D, 0x1D, 0x9E, 0x9E, 0x9E, 0x9E
	.byte 0xE1, 0xE1, 0xE1, 0xE1, 0xF8, 0xF8, 0xF8, 0xF8, 0x98, 0x98, 0x98, 0x98, 0x11, 0x11, 0x11, 0x11
	.byte 0x69, 0x69, 0x69, 0x69, 0xD9, 0xD9, 0xD9, 0xD9, 0x8E, 0x8E, 0x8E, 0x8E, 0x94, 0x94, 0x94, 0x94
	.byte 0x9B, 0x9B, 0x9B, 0x9B, 0x1E, 0x1E, 0x1E, 0x1E, 0x87, 0x87, 0x87, 0x87, 0xE9, 0xE9, 0xE9, 0xE9
	.byte 0xCE, 0xCE, 0xCE, 0xCE, 0x55, 0x55, 0x55, 0x55, 0x28, 0x28, 0x28, 0x28, 0xDF, 0xDF, 0xDF, 0xDF
	.byte 0x8C, 0x8C, 0x8C, 0x8C, 0xA1, 0xA1, 0xA1, 0xA1, 0x89, 0x89, 0x89, 0x89, 0x0D, 0x0D, 0x0D, 0x0D
	.byte 0xBF, 0xBF, 0xBF, 0xBF, 0xE6, 0xE6, 0xE6, 0xE6, 0x42, 0x42, 0x42, 0x42, 0x68, 0x68, 0x68, 0x68
	.byte 0x41, 0x41, 0x41, 0x41, 0x99, 0x99, 0x99, 0x99, 0x2D, 0x2D, 0x2D, 0x2D, 0x0F, 0x0F, 0x0F, 0x0F
	.byte 0xB0, 0xB0, 0xB0, 0xB0, 0x54, 0x54, 0x54, 0x54, 0xBB, 0xBB, 0xBB, 0xBB, 0x16, 0x16, 0x16, 0x16

ov13_022446B0: ; 0x022446B0
	.byte 0x50, 0xA7, 0xF4, 0x51, 0x53, 0x65, 0x41, 0x7E, 0xC3, 0xA4, 0x17, 0x1A, 0x96, 0x5E, 0x27, 0x3A
	.byte 0xCB, 0x6B, 0xAB, 0x3B, 0xF1, 0x45, 0x9D, 0x1F, 0xAB, 0x58, 0xFA, 0xAC, 0x93, 0x03, 0xE3, 0x4B
	.byte 0x55, 0xFA, 0x30, 0x20, 0xF6, 0x6D, 0x76, 0xAD, 0x91, 0x76, 0xCC, 0x88, 0x25, 0x4C, 0x02, 0xF5
	.byte 0xFC, 0xD7, 0xE5, 0x4F, 0xD7, 0xCB, 0x2A, 0xC5, 0x80, 0x44, 0x35, 0x26, 0x8F, 0xA3, 0x62, 0xB5
	.byte 0x49, 0x5A, 0xB1, 0xDE, 0x67, 0x1B, 0xBA, 0x25, 0x98, 0x0E, 0xEA, 0x45, 0xE1, 0xC0, 0xFE, 0x5D
	.byte 0x02, 0x75, 0x2F, 0xC3, 0x12, 0xF0, 0x4C, 0x81, 0xA3, 0x97, 0x46, 0x8D, 0xC6, 0xF9, 0xD3, 0x6B
	.byte 0xE7, 0x5F, 0x8F, 0x03, 0x95, 0x9C, 0x92, 0x15, 0xEB, 0x7A, 0x6D, 0xBF, 0xDA, 0x59, 0x52, 0x95
	.byte 0x2D, 0x83, 0xBE, 0xD4, 0xD3, 0x21, 0x74, 0x58, 0x29, 0x69, 0xE0, 0x49, 0x44, 0xC8, 0xC9, 0x8E
	.byte 0x6A, 0x89, 0xC2, 0x75, 0x78, 0x79, 0x8E, 0xF4, 0x6B, 0x3E, 0x58, 0x99, 0xDD, 0x71, 0xB9, 0x27
	.byte 0xB6, 0x4F, 0xE1, 0xBE, 0x17, 0xAD, 0x88, 0xF0, 0x66, 0xAC, 0x20, 0xC9, 0xB4, 0x3A, 0xCE, 0x7D
	.byte 0x18, 0x4A, 0xDF, 0x63, 0x82, 0x31, 0x1A, 0xE5, 0x60, 0x33, 0x51, 0x97, 0x45, 0x7F, 0x53, 0x62
	.byte 0xE0, 0x77, 0x64, 0xB1, 0x84, 0xAE, 0x6B, 0xBB, 0x1C, 0xA0, 0x81, 0xFE, 0x94, 0x2B, 0x08, 0xF9
	.byte 0x58, 0x68, 0x48, 0x70, 0x19, 0xFD, 0x45, 0x8F, 0x87, 0x6C, 0xDE, 0x94, 0xB7, 0xF8, 0x7B, 0x52
	.byte 0x23, 0xD3, 0x73, 0xAB, 0xE2, 0x02, 0x4B, 0x72, 0x57, 0x8F, 0x1F, 0xE3, 0x2A, 0xAB, 0x55, 0x66
	.byte 0x07, 0x28, 0xEB, 0xB2, 0x03, 0xC2, 0xB5, 0x2F, 0x9A, 0x7B, 0xC5, 0x86, 0xA5, 0x08, 0x37, 0xD3
	.byte 0xF2, 0x87, 0x28, 0x30, 0xB2, 0xA5, 0xBF, 0x23, 0xBA, 0x6A, 0x03, 0x02, 0x5C, 0x82, 0x16, 0xED
	.byte 0x2B, 0x1C, 0xCF, 0x8A, 0x92, 0xB4, 0x79, 0xA7, 0xF0, 0xF2, 0x07, 0xF3, 0xA1, 0xE2, 0x69, 0x4E
	.byte 0xCD, 0xF4, 0xDA, 0x65, 0xD5, 0xBE, 0x05, 0x06, 0x1F, 0x62, 0x34, 0xD1, 0x8A, 0xFE, 0xA6, 0xC4
	.byte 0x9D, 0x53, 0x2E, 0x34, 0xA0, 0x55, 0xF3, 0xA2, 0x32, 0xE1, 0x8A, 0x05, 0x75, 0xEB, 0xF6, 0xA4
	.byte 0x39, 0xEC, 0x83, 0x0B, 0xAA, 0xEF, 0x60, 0x40, 0x06, 0x9F, 0x71, 0x5E, 0x51, 0x10, 0x6E, 0xBD
	.byte 0xF9, 0x8A, 0x21, 0x3E, 0x3D, 0x06, 0xDD, 0x96, 0xAE, 0x05, 0x3E, 0xDD, 0x46, 0xBD, 0xE6, 0x4D
	.byte 0xB5, 0x8D, 0x54, 0x91, 0x05, 0x5D, 0xC4, 0x71, 0x6F, 0xD4, 0x06, 0x04, 0xFF, 0x15, 0x50, 0x60
	.byte 0x24, 0xFB, 0x98, 0x19, 0x97, 0xE9, 0xBD, 0xD6, 0xCC, 0x43, 0x40, 0x89, 0x77, 0x9E, 0xD9, 0x67
	.byte 0xBD, 0x42, 0xE8, 0xB0, 0x88, 0x8B, 0x89, 0x07, 0x38, 0x5B, 0x19, 0xE7, 0xDB, 0xEE, 0xC8, 0x79
	.byte 0x47, 0x0A, 0x7C, 0xA1, 0xE9, 0x0F, 0x42, 0x7C, 0xC9, 0x1E, 0x84, 0xF8, 0x00, 0x00, 0x00, 0x00
	.byte 0x83, 0x86, 0x80, 0x09, 0x48, 0xED, 0x2B, 0x32, 0xAC, 0x70, 0x11, 0x1E, 0x4E, 0x72, 0x5A, 0x6C
	.byte 0xFB, 0xFF, 0x0E, 0xFD, 0x56, 0x38, 0x85, 0x0F, 0x1E, 0xD5, 0xAE, 0x3D, 0x27, 0x39, 0x2D, 0x36
	.byte 0x64, 0xD9, 0x0F, 0x0A, 0x21, 0xA6, 0x5C, 0x68, 0xD1, 0x54, 0x5B, 0x9B, 0x3A, 0x2E, 0x36, 0x24
	.byte 0xB1, 0x67, 0x0A, 0x0C, 0x0F, 0xE7, 0x57, 0x93, 0xD2, 0x96, 0xEE, 0xB4, 0x9E, 0x91, 0x9B, 0x1B
	.byte 0x4F, 0xC5, 0xC0, 0x80, 0xA2, 0x20, 0xDC, 0x61, 0x69, 0x4B, 0x77, 0x5A, 0x16, 0x1A, 0x12, 0x1C
	.byte 0x0A, 0xBA, 0x93, 0xE2, 0xE5, 0x2A, 0xA0, 0xC0, 0x43, 0xE0, 0x22, 0x3C, 0x1D, 0x17, 0x1B, 0x12
	.byte 0x0B, 0x0D, 0x09, 0x0E, 0xAD, 0xC7, 0x8B, 0xF2, 0xB9, 0xA8, 0xB6, 0x2D, 0xC8, 0xA9, 0x1E, 0x14
	.byte 0x85, 0x19, 0xF1, 0x57, 0x4C, 0x07, 0x75, 0xAF, 0xBB, 0xDD, 0x99, 0xEE, 0xFD, 0x60, 0x7F, 0xA3
	.byte 0x9F, 0x26, 0x01, 0xF7, 0xBC, 0xF5, 0x72, 0x5C, 0xC5, 0x3B, 0x66, 0x44, 0x34, 0x7E, 0xFB, 0x5B
	.byte 0x76, 0x29, 0x43, 0x8B, 0xDC, 0xC6, 0x23, 0xCB, 0x68, 0xFC, 0xED, 0xB6, 0x63, 0xF1, 0xE4, 0xB8
	.byte 0xCA, 0xDC, 0x31, 0xD7, 0x10, 0x85, 0x63, 0x42, 0x40, 0x22, 0x97, 0x13, 0x20, 0x11, 0xC6, 0x84
	.byte 0x7D, 0x24, 0x4A, 0x85, 0xF8, 0x3D, 0xBB, 0xD2, 0x11, 0x32, 0xF9, 0xAE, 0x6D, 0xA1, 0x29, 0xC7
	.byte 0x4B, 0x2F, 0x9E, 0x1D, 0xF3, 0x30, 0xB2, 0xDC, 0xEC, 0x52, 0x86, 0x0D, 0xD0, 0xE3, 0xC1, 0x77
	.byte 0x6C, 0x16, 0xB3, 0x2B, 0x99, 0xB9, 0x70, 0xA9, 0xFA, 0x48, 0x94, 0x11, 0x22, 0x64, 0xE9, 0x47
	.byte 0xC4, 0x8C, 0xFC, 0xA8, 0x1A, 0x3F, 0xF0, 0xA0, 0xD8, 0x2C, 0x7D, 0x56, 0xEF, 0x90, 0x33, 0x22
	.byte 0xC7, 0x4E, 0x49, 0x87, 0xC1, 0xD1, 0x38, 0xD9, 0xFE, 0xA2, 0xCA, 0x8C, 0x36, 0x0B, 0xD4, 0x98
	.byte 0xCF, 0x81, 0xF5, 0xA6, 0x28, 0xDE, 0x7A, 0xA5, 0x26, 0x8E, 0xB7, 0xDA, 0xA4, 0xBF, 0xAD, 0x3F
	.byte 0xE4, 0x9D, 0x3A, 0x2C, 0x0D, 0x92, 0x78, 0x50, 0x9B, 0xCC, 0x5F, 0x6A, 0x62, 0x46, 0x7E, 0x54
	.byte 0xC2, 0x13, 0x8D, 0xF6, 0xE8, 0xB8, 0xD8, 0x90, 0x5E, 0xF7, 0x39, 0x2E, 0xF5, 0xAF, 0xC3, 0x82
	.byte 0xBE, 0x80, 0x5D, 0x9F, 0x7C, 0x93, 0xD0, 0x69, 0xA9, 0x2D, 0xD5, 0x6F, 0xB3, 0x12, 0x25, 0xCF
	.byte 0x3B, 0x99, 0xAC, 0xC8, 0xA7, 0x7D, 0x18, 0x10, 0x6E, 0x63, 0x9C, 0xE8, 0x7B, 0xBB, 0x3B, 0xDB
	.byte 0x09, 0x78, 0x26, 0xCD, 0xF4, 0x18, 0x59, 0x6E, 0x01, 0xB7, 0x9A, 0xEC, 0xA8, 0x9A, 0x4F, 0x83
	.byte 0x65, 0x6E, 0x95, 0xE6, 0x7E, 0xE6, 0xFF, 0xAA, 0x08, 0xCF, 0xBC, 0x21, 0xE6, 0xE8, 0x15, 0xEF
	.byte 0xD9, 0x9B, 0xE7, 0xBA, 0xCE, 0x36, 0x6F, 0x4A, 0xD4, 0x09, 0x9F, 0xEA, 0xD6, 0x7C, 0xB0, 0x29
	.byte 0xAF, 0xB2, 0xA4, 0x31, 0x31, 0x23, 0x3F, 0x2A, 0x30, 0x94, 0xA5, 0xC6, 0xC0, 0x66, 0xA2, 0x35
	.byte 0x37, 0xBC, 0x4E, 0x74, 0xA6, 0xCA, 0x82, 0xFC, 0xB0, 0xD0, 0x90, 0xE0, 0x15, 0xD8, 0xA7, 0x33
	.byte 0x4A, 0x98, 0x04, 0xF1, 0xF7, 0xDA, 0xEC, 0x41, 0x0E, 0x50, 0xCD, 0x7F, 0x2F, 0xF6, 0x91, 0x17
	.byte 0x8D, 0xD6, 0x4D, 0x76, 0x4D, 0xB0, 0xEF, 0x43, 0x54, 0x4D, 0xAA, 0xCC, 0xDF, 0x04, 0x96, 0xE4
	.byte 0xE3, 0xB5, 0xD1, 0x9E, 0x1B, 0x88, 0x6A, 0x4C, 0xB8, 0x1F, 0x2C, 0xC1, 0x7F, 0x51, 0x65, 0x46
	.byte 0x04, 0xEA, 0x5E, 0x9D, 0x5D, 0x35, 0x8C, 0x01, 0x73, 0x74, 0x87, 0xFA, 0x2E, 0x41, 0x0B, 0xFB
	.byte 0x5A, 0x1D, 0x67, 0xB3, 0x52, 0xD2, 0xDB, 0x92, 0x33, 0x56, 0x10, 0xE9, 0x13, 0x47, 0xD6, 0x6D
	.byte 0x8C, 0x61, 0xD7, 0x9A, 0x7A, 0x0C, 0xA1, 0x37, 0x8E, 0x14, 0xF8, 0x59, 0x89, 0x3C, 0x13, 0xEB
	.byte 0xEE, 0x27, 0xA9, 0xCE, 0x35, 0xC9, 0x61, 0xB7, 0xED, 0xE5, 0x1C, 0xE1, 0x3C, 0xB1, 0x47, 0x7A
	.byte 0x59, 0xDF, 0xD2, 0x9C, 0x3F, 0x73, 0xF2, 0x55, 0x79, 0xCE, 0x14, 0x18, 0xBF, 0x37, 0xC7, 0x73
	.byte 0xEA, 0xCD, 0xF7, 0x53, 0x5B, 0xAA, 0xFD, 0x5F, 0x14, 0x6F, 0x3D, 0xDF, 0x86, 0xDB, 0x44, 0x78
	.byte 0x81, 0xF3, 0xAF, 0xCA, 0x3E, 0xC4, 0x68, 0xB9, 0x2C, 0x34, 0x24, 0x38, 0x5F, 0x40, 0xA3, 0xC2
	.byte 0x72, 0xC3, 0x1D, 0x16, 0x0C, 0x25, 0xE2, 0xBC, 0x8B, 0x49, 0x3C, 0x28, 0x41, 0x95, 0x0D, 0xFF
	.byte 0x71, 0x01, 0xA8, 0x39, 0xDE, 0xB3, 0x0C, 0x08, 0x9C, 0xE4, 0xB4, 0xD8, 0x90, 0xC1, 0x56, 0x64
	.byte 0x61, 0x84, 0xCB, 0x7B, 0x70, 0xB6, 0x32, 0xD5, 0x74, 0x5C, 0x6C, 0x48, 0x42, 0x57, 0xB8, 0xD0

ov13_02244AB0: ; 0x02244AB0
	.byte 0xA7, 0xF4, 0x51, 0x50, 0x65, 0x41, 0x7E, 0x53, 0xA4, 0x17, 0x1A, 0xC3, 0x5E, 0x27, 0x3A, 0x96
	.byte 0x6B, 0xAB, 0x3B, 0xCB, 0x45, 0x9D, 0x1F, 0xF1, 0x58, 0xFA, 0xAC, 0xAB, 0x03, 0xE3, 0x4B, 0x93
	.byte 0xFA, 0x30, 0x20, 0x55, 0x6D, 0x76, 0xAD, 0xF6, 0x76, 0xCC, 0x88, 0x91, 0x4C, 0x02, 0xF5, 0x25
	.byte 0xD7, 0xE5, 0x4F, 0xFC, 0xCB, 0x2A, 0xC5, 0xD7, 0x44, 0x35, 0x26, 0x80, 0xA3, 0x62, 0xB5, 0x8F
	.byte 0x5A, 0xB1, 0xDE, 0x49, 0x1B, 0xBA, 0x25, 0x67, 0x0E, 0xEA, 0x45, 0x98, 0xC0, 0xFE, 0x5D, 0xE1
	.byte 0x75, 0x2F, 0xC3, 0x02, 0xF0, 0x4C, 0x81, 0x12, 0x97, 0x46, 0x8D, 0xA3, 0xF9, 0xD3, 0x6B, 0xC6
	.byte 0x5F, 0x8F, 0x03, 0xE7, 0x9C, 0x92, 0x15, 0x95, 0x7A, 0x6D, 0xBF, 0xEB, 0x59, 0x52, 0x95, 0xDA
	.byte 0x83, 0xBE, 0xD4, 0x2D, 0x21, 0x74, 0x58, 0xD3, 0x69, 0xE0, 0x49, 0x29, 0xC8, 0xC9, 0x8E, 0x44
	.byte 0x89, 0xC2, 0x75, 0x6A, 0x79, 0x8E, 0xF4, 0x78, 0x3E, 0x58, 0x99, 0x6B, 0x71, 0xB9, 0x27, 0xDD
	.byte 0x4F, 0xE1, 0xBE, 0xB6, 0xAD, 0x88, 0xF0, 0x17, 0xAC, 0x20, 0xC9, 0x66, 0x3A, 0xCE, 0x7D, 0xB4
	.byte 0x4A, 0xDF, 0x63, 0x18, 0x31, 0x1A, 0xE5, 0x82, 0x33, 0x51, 0x97, 0x60, 0x7F, 0x53, 0x62, 0x45
	.byte 0x77, 0x64, 0xB1, 0xE0, 0xAE, 0x6B, 0xBB, 0x84, 0xA0, 0x81, 0xFE, 0x1C, 0x2B, 0x08, 0xF9, 0x94
	.byte 0x68, 0x48, 0x70, 0x58, 0xFD, 0x45, 0x8F, 0x19, 0x6C, 0xDE, 0x94, 0x87, 0xF8, 0x7B, 0x52, 0xB7
	.byte 0xD3, 0x73, 0xAB, 0x23, 0x02, 0x4B, 0x72, 0xE2, 0x8F, 0x1F, 0xE3, 0x57, 0xAB, 0x55, 0x66, 0x2A
	.byte 0x28, 0xEB, 0xB2, 0x07, 0xC2, 0xB5, 0x2F, 0x03, 0x7B, 0xC5, 0x86, 0x9A, 0x08, 0x37, 0xD3, 0xA5
	.byte 0x87, 0x28, 0x30, 0xF2, 0xA5, 0xBF, 0x23, 0xB2, 0x6A, 0x03, 0x02, 0xBA, 0x82, 0x16, 0xED, 0x5C
	.byte 0x1C, 0xCF, 0x8A, 0x2B, 0xB4, 0x79, 0xA7, 0x92, 0xF2, 0x07, 0xF3, 0xF0, 0xE2, 0x69, 0x4E, 0xA1
	.byte 0xF4, 0xDA, 0x65, 0xCD, 0xBE, 0x05, 0x06, 0xD5, 0x62, 0x34, 0xD1, 0x1F, 0xFE, 0xA6, 0xC4, 0x8A
	.byte 0x53, 0x2E, 0x34, 0x9D, 0x55, 0xF3, 0xA2, 0xA0, 0xE1, 0x8A, 0x05, 0x32, 0xEB, 0xF6, 0xA4, 0x75
	.byte 0xEC, 0x83, 0x0B, 0x39, 0xEF, 0x60, 0x40, 0xAA, 0x9F, 0x71, 0x5E, 0x06, 0x10, 0x6E, 0xBD, 0x51
	.byte 0x8A, 0x21, 0x3E, 0xF9, 0x06, 0xDD, 0x96, 0x3D, 0x05, 0x3E, 0xDD, 0xAE, 0xBD, 0xE6, 0x4D, 0x46
	.byte 0x8D, 0x54, 0x91, 0xB5, 0x5D, 0xC4, 0x71, 0x05, 0xD4, 0x06, 0x04, 0x6F, 0x15, 0x50, 0x60, 0xFF
	.byte 0xFB, 0x98, 0x19, 0x24, 0xE9, 0xBD, 0xD6, 0x97, 0x43, 0x40, 0x89, 0xCC, 0x9E, 0xD9, 0x67, 0x77
	.byte 0x42, 0xE8, 0xB0, 0xBD, 0x8B, 0x89, 0x07, 0x88, 0x5B, 0x19, 0xE7, 0x38, 0xEE, 0xC8, 0x79, 0xDB
	.byte 0x0A, 0x7C, 0xA1, 0x47, 0x0F, 0x42, 0x7C, 0xE9, 0x1E, 0x84, 0xF8, 0xC9, 0x00, 0x00, 0x00, 0x00
	.byte 0x86, 0x80, 0x09, 0x83, 0xED, 0x2B, 0x32, 0x48, 0x70, 0x11, 0x1E, 0xAC, 0x72, 0x5A, 0x6C, 0x4E
	.byte 0xFF, 0x0E, 0xFD, 0xFB, 0x38, 0x85, 0x0F, 0x56, 0xD5, 0xAE, 0x3D, 0x1E, 0x39, 0x2D, 0x36, 0x27
	.byte 0xD9, 0x0F, 0x0A, 0x64, 0xA6, 0x5C, 0x68, 0x21, 0x54, 0x5B, 0x9B, 0xD1, 0x2E, 0x36, 0x24, 0x3A
	.byte 0x67, 0x0A, 0x0C, 0xB1, 0xE7, 0x57, 0x93, 0x0F, 0x96, 0xEE, 0xB4, 0xD2, 0x91, 0x9B, 0x1B, 0x9E
	.byte 0xC5, 0xC0, 0x80, 0x4F, 0x20, 0xDC, 0x61, 0xA2, 0x4B, 0x77, 0x5A, 0x69, 0x1A, 0x12, 0x1C, 0x16
	.byte 0xBA, 0x93, 0xE2, 0x0A, 0x2A, 0xA0, 0xC0, 0xE5, 0xE0, 0x22, 0x3C, 0x43, 0x17, 0x1B, 0x12, 0x1D
	.byte 0x0D, 0x09, 0x0E, 0x0B, 0xC7, 0x8B, 0xF2, 0xAD, 0xA8, 0xB6, 0x2D, 0xB9, 0xA9, 0x1E, 0x14, 0xC8
	.byte 0x19, 0xF1, 0x57, 0x85, 0x07, 0x75, 0xAF, 0x4C, 0xDD, 0x99, 0xEE, 0xBB, 0x60, 0x7F, 0xA3, 0xFD
	.byte 0x26, 0x01, 0xF7, 0x9F, 0xF5, 0x72, 0x5C, 0xBC, 0x3B, 0x66, 0x44, 0xC5, 0x7E, 0xFB, 0x5B, 0x34
	.byte 0x29, 0x43, 0x8B, 0x76, 0xC6, 0x23, 0xCB, 0xDC, 0xFC, 0xED, 0xB6, 0x68, 0xF1, 0xE4, 0xB8, 0x63
	.byte 0xDC, 0x31, 0xD7, 0xCA, 0x85, 0x63, 0x42, 0x10, 0x22, 0x97, 0x13, 0x40, 0x11, 0xC6, 0x84, 0x20
	.byte 0x24, 0x4A, 0x85, 0x7D, 0x3D, 0xBB, 0xD2, 0xF8, 0x32, 0xF9, 0xAE, 0x11, 0xA1, 0x29, 0xC7, 0x6D
	.byte 0x2F, 0x9E, 0x1D, 0x4B, 0x30, 0xB2, 0xDC, 0xF3, 0x52, 0x86, 0x0D, 0xEC, 0xE3, 0xC1, 0x77, 0xD0
	.byte 0x16, 0xB3, 0x2B, 0x6C, 0xB9, 0x70, 0xA9, 0x99, 0x48, 0x94, 0x11, 0xFA, 0x64, 0xE9, 0x47, 0x22
	.byte 0x8C, 0xFC, 0xA8, 0xC4, 0x3F, 0xF0, 0xA0, 0x1A, 0x2C, 0x7D, 0x56, 0xD8, 0x90, 0x33, 0x22, 0xEF
	.byte 0x4E, 0x49, 0x87, 0xC7, 0xD1, 0x38, 0xD9, 0xC1, 0xA2, 0xCA, 0x8C, 0xFE, 0x0B, 0xD4, 0x98, 0x36
	.byte 0x81, 0xF5, 0xA6, 0xCF, 0xDE, 0x7A, 0xA5, 0x28, 0x8E, 0xB7, 0xDA, 0x26, 0xBF, 0xAD, 0x3F, 0xA4
	.byte 0x9D, 0x3A, 0x2C, 0xE4, 0x92, 0x78, 0x50, 0x0D, 0xCC, 0x5F, 0x6A, 0x9B, 0x46, 0x7E, 0x54, 0x62
	.byte 0x13, 0x8D, 0xF6, 0xC2, 0xB8, 0xD8, 0x90, 0xE8, 0xF7, 0x39, 0x2E, 0x5E, 0xAF, 0xC3, 0x82, 0xF5
	.byte 0x80, 0x5D, 0x9F, 0xBE, 0x93, 0xD0, 0x69, 0x7C, 0x2D, 0xD5, 0x6F, 0xA9, 0x12, 0x25, 0xCF, 0xB3
	.byte 0x99, 0xAC, 0xC8, 0x3B, 0x7D, 0x18, 0x10, 0xA7, 0x63, 0x9C, 0xE8, 0x6E, 0xBB, 0x3B, 0xDB, 0x7B
	.byte 0x78, 0x26, 0xCD, 0x09, 0x18, 0x59, 0x6E, 0xF4, 0xB7, 0x9A, 0xEC, 0x01, 0x9A, 0x4F, 0x83, 0xA8
	.byte 0x6E, 0x95, 0xE6, 0x65, 0xE6, 0xFF, 0xAA, 0x7E, 0xCF, 0xBC, 0x21, 0x08, 0xE8, 0x15, 0xEF, 0xE6
	.byte 0x9B, 0xE7, 0xBA, 0xD9, 0x36, 0x6F, 0x4A, 0xCE, 0x09, 0x9F, 0xEA, 0xD4, 0x7C, 0xB0, 0x29, 0xD6
	.byte 0xB2, 0xA4, 0x31, 0xAF, 0x23, 0x3F, 0x2A, 0x31, 0x94, 0xA5, 0xC6, 0x30, 0x66, 0xA2, 0x35, 0xC0
	.byte 0xBC, 0x4E, 0x74, 0x37, 0xCA, 0x82, 0xFC, 0xA6, 0xD0, 0x90, 0xE0, 0xB0, 0xD8, 0xA7, 0x33, 0x15
	.byte 0x98, 0x04, 0xF1, 0x4A, 0xDA, 0xEC, 0x41, 0xF7, 0x50, 0xCD, 0x7F, 0x0E, 0xF6, 0x91, 0x17, 0x2F
	.byte 0xD6, 0x4D, 0x76, 0x8D, 0xB0, 0xEF, 0x43, 0x4D, 0x4D, 0xAA, 0xCC, 0x54, 0x04, 0x96, 0xE4, 0xDF
	.byte 0xB5, 0xD1, 0x9E, 0xE3, 0x88, 0x6A, 0x4C, 0x1B, 0x1F, 0x2C, 0xC1, 0xB8, 0x51, 0x65, 0x46, 0x7F
	.byte 0xEA, 0x5E, 0x9D, 0x04, 0x35, 0x8C, 0x01, 0x5D, 0x74, 0x87, 0xFA, 0x73, 0x41, 0x0B, 0xFB, 0x2E
	.byte 0x1D, 0x67, 0xB3, 0x5A, 0xD2, 0xDB, 0x92, 0x52, 0x56, 0x10, 0xE9, 0x33, 0x47, 0xD6, 0x6D, 0x13
	.byte 0x61, 0xD7, 0x9A, 0x8C, 0x0C, 0xA1, 0x37, 0x7A, 0x14, 0xF8, 0x59, 0x8E, 0x3C, 0x13, 0xEB, 0x89
	.byte 0x27, 0xA9, 0xCE, 0xEE, 0xC9, 0x61, 0xB7, 0x35, 0xE5, 0x1C, 0xE1, 0xED, 0xB1, 0x47, 0x7A, 0x3C
	.byte 0xDF, 0xD2, 0x9C, 0x59, 0x73, 0xF2, 0x55, 0x3F, 0xCE, 0x14, 0x18, 0x79, 0x37, 0xC7, 0x73, 0xBF
	.byte 0xCD, 0xF7, 0x53, 0xEA, 0xAA, 0xFD, 0x5F, 0x5B, 0x6F, 0x3D, 0xDF, 0x14, 0xDB, 0x44, 0x78, 0x86
	.byte 0xF3, 0xAF, 0xCA, 0x81, 0xC4, 0x68, 0xB9, 0x3E, 0x34, 0x24, 0x38, 0x2C, 0x40, 0xA3, 0xC2, 0x5F
	.byte 0xC3, 0x1D, 0x16, 0x72, 0x25, 0xE2, 0xBC, 0x0C, 0x49, 0x3C, 0x28, 0x8B, 0x95, 0x0D, 0xFF, 0x41
	.byte 0x01, 0xA8, 0x39, 0x71, 0xB3, 0x0C, 0x08, 0xDE, 0xE4, 0xB4, 0xD8, 0x9C, 0xC1, 0x56, 0x64, 0x90
	.byte 0x84, 0xCB, 0x7B, 0x61, 0xB6, 0x32, 0xD5, 0x70, 0x5C, 0x6C, 0x48, 0x74, 0x57, 0xB8, 0xD0, 0x42

	.data

_022459B0:
	.byte 0x09, 0x08, 0x00, 0x00

ov13_022459B4: ; 0x022459B4
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF

ov13_022459BC: ; 0x022459BC
	.byte 0x00, 0x00, 0x00, 0x01
	.word ov13_022228A4
	.word ov13_022228BC
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

	.balign 4, 0
ov13_02245A14: ; 0x02245A14
	.asciz "ESSID-AOSS"

	.balign 4, 0
ov13_02245A20: ; 0x02245A20
	.asciz "MELCO"

	.balign 4, 0
ov13_02245A28: ; 0x02245A28
	.byte 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x0B, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x10, 0x00, 0x12, 0x00, 0x20, 0x00, 0x16, 0x00
	.byte 0x40, 0x00, 0x18, 0x00, 0x80, 0x00, 0x24, 0x00, 0x00, 0x01, 0x30, 0x00, 0x00, 0x02, 0x48, 0x00
	.byte 0x00, 0x04, 0x60, 0x00, 0x00, 0x08, 0x6C, 0x00

ov13_02245A58: ; 0x02245A58
	.word ov13_0224E464 + 8
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00

ov13_02245A6C: ; 0x02245A6C
	.byte 0x00, 0x00, 0x00, 0x01
	.word ov13_02223DEC
	.word ov13_02223E1C
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0xA8, 0x00, 0xB0
	.byte 0xFF, 0xFF, 0xFF, 0x00, 0xC0, 0xA8, 0x00, 0xC8, 0xC0, 0xA8, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov13_02245ACC
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov13_02245AC4: ; 0x02245AC4
	.byte 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x2A, 0x00, 0x00

	.balign 4, 0
ov13_02245ACC:
	.asciz "NINTENDO-DS"

	.balign 4, 0
ov13_02245AD8: ; 0x02245AD8
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.balign 4, 0
ov13_02245B18: ; 0x02245B18
	.asciz "WARP"
	.balign 4, 0

	.bss

_0224CF98:
	.space 0x4

ov13_0224CF9C: ; 0x0224CF9C
	.space 0x1C

ov13_0224CFB8: ; 0x0224CFB8
	.space 0x4

ov13_0224CFBC: ; 0x0224CFBC
	.space 0x1C

ov13_0224CFD8: ; 0x0224CFD8
	.space 0x280

ov13_0224D258: ; 0x0224D258
	.space 0x400

ov13_0224D658: ; 0x0224D658
	.space 0x8

ov13_0224D660: ; 0x0224D660
	.space 0x130

ov13_0224D790: ; 0x0224D790
	.space 0x130

ov13_0224D8C0: ; 0x0224D8C0
	.space 0x70

ov13_0224D930: ; 0x0224D930
	.space 0x3C8

ov13_0224DCF8: ; 0x0224DCF8
	.space 0x8

ov13_0224DD00: ; 0x0224DD00
	.space 0x2

ov13_0224DD02: ; 0x0224DD02
	.space 0x7E

ov13_0224DD80: ; 0x0224DD80
	.space 0xC

ov13_0224DD8C: ; 0x0224DD8C
	.space 0x4

ov13_0224DD90: ; 0x0224DD90
	.space 0x10

ov13_0224DDA0: ; 0x0224DDA0
	.space 0x20

ov13_0224DDC0: ; 0x0224DDC0
	.space 0xC0

ov13_0224DE80: ; 0x0224DE80
	.space 0x60

ov13_0224DEE0: ; 0x0224DEE0
	.space 0x28

ov13_0224DF08: ; 0x0224DF08
	.space 0x8

ov13_0224DF10: ; 0x0224DF10
	.space 0x20

ov13_0224DF30: ; 0x0224DF30
	.space 0x50

ov13_0224DF80: ; 0x0224DF80
	.space 0x30

ov13_0224DFB0: ; 0x0224DFB0
	.space 0x4

ov13_0224DFB4: ; 0x0224DFB4
	.space 0x10

ov13_0224DFC4: ; 0x0224DFC4
	.space 0x18

ov13_0224DFDC: ; 0x0224DFDC
	.space 0xC0

ov13_0224E09C: ; 0x0224E09C
	.space 0x14

ov13_0224E0B0: ; 0x0224E0B0
	.space 0x14

ov13_0224E0C4: ; 0x0224E0C4
	.space 0x80

ov13_0224E144: ; 0x0224E144
	.space 0x40

ov13_0224E184: ; 0x0224E184
	.space 0xEC

ov13_0224E270: ; 0x0224E270
	.space 0x14

ov13_0224E284: ; 0x0224E284
	.space 0x2C

ov13_0224E2B0: ; 0x0224E2B0
	.space 0x38

ov13_0224E2E8: ; 0x0224E2E8
	.space 0x98

ov13_0224E380: ; 0x0224E380
	.space 0x58

ov13_0224E3D8: ; 0x0224E3D8
	.space 0x8

ov13_0224E3E0: ; 0x0224E3E0
	.space 0x8

ov13_0224E3E8: ; 0x0224E3E8
	.space 0x8

ov13_0224E3F0: ; 0x0224E3F0
	.space 0x10

ov13_0224E400: ; 0x0224E400
	.space 0x8

ov13_0224E408: ; 0x0224E408
	.space 0x18

ov13_0224E420: ; 0x0224E420
	.space 0x20

ov13_0224E440: ; 0x0224E440
	.space 0x24

ov13_0224E464: ; 0x0224E464
	.space 0x800

ov13_0224EC64: ; 0x0224EC64
	.space 0x800
