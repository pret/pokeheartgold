	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F56C0:
	.short 0x0000, 0x0000
	.short 0x0001, 0x0000
	.short 0x0002, 0x0000
	.short 0x0003, 0x0000
	.short 0x0004, 0x0000
	.short 0x000A, 0x0000
_020F56D8:
	.byte 0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02
	.byte 0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02
	.byte 0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02
	.byte 0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02
	.byte 0x0B, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02
	.byte 0x0A, 0x10, 0x00, 0x00, 0x00, 0x01, 0x0F, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0211188C:
	.space 4

_02111890:
	.space 0xBC

	.text

	thumb_func_start sub_02002CA8
sub_02002CA8: ; 0x02002CA8
	push {r4, lr}
	ldr r0, _02002CE0 ; =_02111890
	ldr r4, _02002CE4 ; =_0211188C
	mov r1, #0
	str r0, [r4]
	add r2, r1, #0
	add r0, r1, #0
_02002CB6:
	ldr r3, [r4]
	add r3, r3, r2
	add r3, #0x84
	str r0, [r3]
	ldr r3, [r4]
	add r3, r3, r2
	add r3, #0x9c
	str r0, [r3]
	ldr r3, [r4]
	add r2, r2, #4
	add r3, r3, r1
	add r3, #0xb4
	add r1, r1, #1
	strb r0, [r3]
	cmp r1, #6
	blo _02002CB6
	ldr r0, _02002CE8 ; =_020F56D8
	bl sub_0201FFE0
	pop {r4, pc}
	nop
_02002CE0: .word _02111890
_02002CE4: .word _0211188C
_02002CE8: .word _020F56D8
	thumb_func_end sub_02002CA8

	thumb_func_start sub_02002CEC
sub_02002CEC: ; 0x02002CEC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02002D34 ; =_0211188C
	lsl r4, r5, #2
	ldr r0, [r0]
	add r2, r0, r4
	add r2, #0x9c
	ldr r2, [r2]
	cmp r2, #0
	bne _02002D28
	str r1, [sp]
	ldr r1, _02002D38 ; =_020F56C0
	ldr r3, _02002D3C ; =_020F56C0 + 2
	ldrh r1, [r1, r4]
	ldrh r3, [r3, r4]
	mov r0, #0x10  ; graphic/font.narc
	mov r2, #1
	bl FontData_new
	ldr r2, _02002D34 ; =_0211188C
	ldr r1, [r2]
	add r1, r1, r4
	add r1, #0x9c
	str r0, [r1]
	ldr r0, [r2]
	mov r1, #1
	add r0, r0, r5
	add r0, #0xb4
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02002D28:
	add r0, #0xb4
	ldrsb r1, [r0, r5]
	add r1, r1, #1
	strb r1, [r0, r5]
	pop {r3, r4, r5, pc}
	nop
_02002D34: .word _0211188C
_02002D38: .word _020F56C0
_02002D3C: .word _020F56C0 + 2
	thumb_func_end sub_02002CEC

	thumb_func_start sub_02002D40
sub_02002D40: ; 0x02002D40
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #6
	blt _02002D4E
	bl GF_AssertFail
_02002D4E:
	ldr r0, _02002D78 ; =_0211188C
	lsl r4, r4, #2
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002D62
	bl GF_AssertFail
_02002D62:
	ldr r0, _02002D78 ; =_0211188C
	mov r1, #0
	ldr r0, [r0]
	add r2, r5, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl FontData_ModeSwitch
	pop {r3, r4, r5, pc}
	nop
_02002D78: .word _0211188C
	thumb_func_end sub_02002D40

	thumb_func_start sub_02002D7C
sub_02002D7C: ; 0x02002D7C
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #6
	blt _02002D88
	bl GF_AssertFail
_02002D88:
	ldr r0, _02002DB0 ; =_0211188C
	lsl r4, r4, #2
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002D9C
	bl GF_AssertFail
_02002D9C:
	ldr r0, _02002DB0 ; =_0211188C
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl FontData_ModeSwitch
	pop {r4, pc}
	.balign 4, 0
_02002DB0: .word _0211188C
	thumb_func_end sub_02002D7C

	thumb_func_start sub_02002DB4
sub_02002DB4: ; 0x02002DB4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	cmp r4, #6
	blt _02002DC0
	bl GF_AssertFail
_02002DC0:
	ldr r0, _02002E74 ; =_0211188C
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0xb4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _02002DD2
	bl GF_AssertFail
_02002DD2:
	ldr r0, _02002E74 ; =_0211188C
	ldr r1, [r0]
	add r1, #0xb4
	ldrsb r0, [r1, r4]
	cmp r0, #0
	ble _02002DE2
	sub r0, r0, #1
	strb r0, [r1, r4]
_02002DE2:
	ldr r0, _02002E74 ; =_0211188C
	ldr r6, [r0]
	mov r0, #0xb4
	add r1, r6, r4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _02002E70
	lsl r7, r4, #2
	add r0, r6, r7
	add r0, #0x84
	ldr r0, [r0]
	mov ip, r0
	cmp r0, #0
	beq _02002E50
	ldr r2, _02002E78 ; =_020F56C0
	mov r1, #0
	ldrh r0, [r2, r7]
	add r3, r6, #0
_02002E06:
	cmp r1, r4
	beq _02002E26
	ldrh r5, [r2]
	cmp r5, r0
	bne _02002E26
	add r5, r3, #0
	add r5, #0x9c
	ldr r5, [r5]
	cmp r5, #0
	beq _02002E26
	lsl r0, r1, #2
	add r2, r6, r0
	add r2, #0x84
	mov r0, ip
	str r0, [r2]
	b _02002E30
_02002E26:
	add r1, r1, #1
	add r2, r2, #4
	add r3, r3, #4
	cmp r1, #6
	blo _02002E06
_02002E30:
	cmp r1, #6
	bne _02002E50
	ldr r0, _02002E74 ; =_0211188C
	lsl r5, r4, #2
	ldr r0, [r0]
	add r0, r0, r5
	add r0, #0x84
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02002E74 ; =_0211188C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r5
	add r0, #0x84
	str r1, [r0]
_02002E50:
	ldr r0, _02002E74 ; =_0211188C
	ldr r0, [r0]
	add r0, r0, r7
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	beq _02002E70
	bl FontData_delete
	ldr r0, _02002E74 ; =_0211188C
	mov r2, #0
	ldr r1, [r0]
	lsl r0, r4, #2
	add r0, r1, r0
	add r0, #0x9c
	str r2, [r0]
_02002E70:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02002E74: .word _0211188C
_02002E78: .word _020F56C0
	thumb_func_end sub_02002DB4

	thumb_func_start sub_02002E7C
sub_02002E7C: ; 0x02002E7C
	push {r3, lr}
	ldr r2, _02002E94 ; =_0211188C
	lsl r0, r0, #2
	ldr r2, [r2]
	add r0, r2, r0
	add r0, #0x9c
	ldr r0, [r0]
	bl TryLoadGlyph
	ldr r0, _02002E94 ; =_0211188C
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
_02002E94: .word _0211188C
	thumb_func_end sub_02002E7C

	thumb_func_start sub_02002E98
sub_02002E98: ; 0x02002E98
	push {r4, lr}
	add r3, r1, #0
	add r3, #0x20
	ldrb r2, [r3, #1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	bne _02002EC0
	ldrb r2, [r3]
	mov r4, #0xf
	lsl r0, r0, #0x18
	bic r2, r4
	lsr r4, r0, #0x18
	mov r0, #0xf
	and r0, r4
	orr r0, r2
	strb r0, [r3]
	ldrb r2, [r3, #1]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r3, #1]
_02002EC0:
	add r0, r1, #0
	bl RenderText
	pop {r4, pc}
	thumb_func_end sub_02002E98

	thumb_func_start sub_02002EC8
sub_02002EC8: ; 0x02002EC8
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002EF8 ; =_0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002EE2
	bl GF_AssertFail
_02002EE2:
	ldr r0, _02002EF8 ; =_0211188C
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r6, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl GetStringWidth
	pop {r4, r5, r6, pc}
	nop
_02002EF8: .word _0211188C
	thumb_func_end sub_02002EC8

	thumb_func_start sub_02002EFC
sub_02002EFC: ; 0x02002EFC
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002F2C ; =_0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002F16
	bl GF_AssertFail
_02002F16:
	ldr r0, _02002F2C ; =_0211188C
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r6, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl GetStringWidthFirstLine
	pop {r4, r5, r6, pc}
	nop
_02002F2C: .word _0211188C
	thumb_func_end sub_02002EFC

	thumb_func_start sub_02002F30
sub_02002F30: ; 0x02002F30
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002F64 ; =_0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002F4A
	bl GF_AssertFail
_02002F4A:
	add r0, r5, #0
	bl String_c_str
	add r1, r0, #0
	ldr r0, _02002F64 ; =_0211188C
	add r2, r6, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl GetStringWidth
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02002F64: .word _0211188C
	thumb_func_end sub_02002F30

	thumb_func_start sub_02002F68
sub_02002F68: ; 0x02002F68
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002FA8 ; =_0211188C
	add r6, r1, #0
	ldr r0, [r0]
	add r5, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002F82
	bl GF_AssertFail
_02002F82:
	add r0, r5, #0
	bl StringSetEmpty
	add r0, r5, #0
	add r1, r6, #0
	bl StringCat_HandleTrainerName
	add r0, r5, #0
	bl String_c_str
	add r1, r0, #0
	ldr r0, _02002FA8 ; =_0211188C
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl StringAllCharsValid
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02002FA8: .word _0211188C
	thumb_func_end sub_02002F68

	thumb_func_start GetFontAttribute
GetFontAttribute: ; 0x02002FAC
	mov r2, #0
	cmp r1, #7
	bhi _0200300C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02002FBE: ; jump table
	.short _02002FCE - _02002FBE - 2 ; case 0
	.short _02002FD6 - _02002FBE - 2 ; case 1
	.short _02002FDE - _02002FBE - 2 ; case 2
	.short _02002FE6 - _02002FBE - 2 ; case 3
	.short _02002FEE - _02002FBE - 2 ; case 4
	.short _02002FF6 - _02002FBE - 2 ; case 5
	.short _02002FFE - _02002FBE - 2 ; case 6
	.short _02003006 - _02002FBE - 2 ; case 7
_02002FCE:
	lsl r1, r0, #3
	ldr r0, _02003010 ; =_020F56D8
	ldrb r2, [r0, r1]
	b _0200300C
_02002FD6:
	lsl r1, r0, #3
	ldr r0, _02003014 ; =_020F56D8 + 1
	ldrb r2, [r0, r1]
	b _0200300C
_02002FDE:
	lsl r1, r0, #3
	ldr r0, _02003018 ; =_020F56D8 + 2
	ldrb r2, [r0, r1]
	b _0200300C
_02002FE6:
	lsl r1, r0, #3
	ldr r0, _0200301C ; =_020F56D8 + 3
	ldrb r2, [r0, r1]
	b _0200300C
_02002FEE:
	lsl r1, r0, #3
	ldr r0, _02003020 ; =_020F56D8 + 4
	ldrb r2, [r0, r1]
	b _0200300C
_02002FF6:
	lsl r1, r0, #3
	ldr r0, _02003024 ; =_020F56D8 + 5
	ldrb r2, [r0, r1]
	b _0200300C
_02002FFE:
	lsl r1, r0, #3
	ldr r0, _02003028 ; =_020F56D8 + 6
	ldrb r2, [r0, r1]
	b _0200300C
_02003006:
	lsl r1, r0, #3
	ldr r0, _0200302C ; =_020F56D8 + 7
	ldrb r2, [r0, r1]
_0200300C:
	add r0, r2, #0
	bx lr
	.balign 4, 0
_02003010: .word _020F56D8
_02003014: .word _020F56D8 + 1
_02003018: .word _020F56D8 + 2
_0200301C: .word _020F56D8 + 3
_02003020: .word _020F56D8 + 4
_02003024: .word _020F56D8 + 5
_02003028: .word _020F56D8 + 6
_0200302C: .word _020F56D8 + 7
	thumb_func_end GetFontAttribute

	thumb_func_start sub_02003030
sub_02003030: ; 0x02003030
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	add r3, r1, #0
	str r2, [sp, #4]
	mov r0, #0x10
	mov r1, #7
	add r2, r4, #0
	bl GfGfxLoader_GXLoadPal
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02003030

	thumb_func_start sub_0200304C
sub_0200304C: ; 0x0200304C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	add r3, r1, #0
	str r2, [sp, #4]
	mov r0, #0x10
	mov r1, #8
	add r2, r4, #0
	bl GfGfxLoader_GXLoadPal
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_0200304C

	thumb_func_start sub_02003068
sub_02003068: ; 0x02003068
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _0200309C ; =_0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02003082
	bl GF_AssertFail
_02003082:
	add r0, r5, #0
	bl String_c_str
	add r1, r0, #0
	ldr r0, _0200309C ; =_0211188C
	add r2, r6, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl GetStringWidthMultiline
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0200309C: .word _0211188C
	thumb_func_end sub_02003068

	thumb_func_start sub_020030A0
sub_020030A0: ; 0x020030A0
	push {r4, lr}
	add r4, r3, #0
	bl sub_02002F30
	cmp r0, r4
	bhs _020030B2
	sub r0, r4, r0
	lsr r0, r0, #1
	pop {r4, pc}
_020030B2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020030A0

	thumb_func_start FontI_GetGlyphWidth
FontI_GetGlyphWidth: ; 0x020030B8
	push {r3, r4, r5, lr}
	lsl r4, r0, #2
	ldr r0, _020030E4 ; =_0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _020030D0
	bl GF_AssertFail
_020030D0:
	ldr r0, _020030E4 ; =_0211188C
	add r1, r5, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl GetGlyphWidth
	pop {r3, r4, r5, pc}
	nop
_020030E4: .word _0211188C
	thumb_func_end FontI_GetGlyphWidth
