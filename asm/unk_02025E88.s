	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start GetStringWidth
GetStringWidth: ; 0x020261CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	ldr r0, _02026210 ; =0x0000FFFF
	add r7, r2, #0
	mov r6, #0
	cmp r1, r0
	beq _0202620C
_020261DE:
	ldr r0, _02026214 ; =0x0000FFFE
	cmp r1, r0
	bne _020261F6
	add r0, r4, #0
	bl MsgArray_SkipControlCode
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _02026210 ; =0x0000FFFF
	cmp r1, r0
	bne _02026204
	b _0202620C
_020261F6:
	ldr r2, [r5, #0x70]
	add r0, r5, #0
	sub r1, r1, #1
	blx r2
	add r0, r7, r0
	add r6, r6, r0
	add r4, r4, #2
_02026204:
	ldrh r1, [r4]
	ldr r0, _02026210 ; =0x0000FFFF
	cmp r1, r0
	bne _020261DE
_0202620C:
	sub r0, r6, r7
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02026210: .word 0x0000FFFF
_02026214: .word 0x0000FFFE
	thumb_func_end GetStringWidth

	thumb_func_start GetStringWidthFirstLine
GetStringWidthFirstLine: ; 0x02026218
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	mov r6, #0
	b _02026252
_02026224:
	ldr r0, _02026268 ; =0x0000FFFE
	cmp r1, r0
	bne _02026244
	add r0, r4, #0
	bl MsgArray_SkipControlCode
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0202626C ; =0x0000FFFF
	cmp r1, r0
	beq _02026262
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02026252
	b _02026262
_02026244:
	ldr r2, [r5, #0x70]
	add r0, r5, #0
	sub r1, r1, #1
	blx r2
	add r0, r7, r0
	add r6, r6, r0
	add r4, r4, #2
_02026252:
	ldrh r1, [r4]
	ldr r0, _0202626C ; =0x0000FFFF
	cmp r1, r0
	beq _02026262
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02026224
_02026262:
	sub r0, r6, r7
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02026268: .word 0x0000FFFE
_0202626C: .word 0x0000FFFF
	thumb_func_end GetStringWidthFirstLine

	thumb_func_start StringAllCharsValid
StringAllCharsValid: ; 0x02026270
	push {r3, r4, r5, r6, r7, lr}
	ldrh r2, [r1]
	add r5, r0, #0
	ldr r0, _020262B0 ; =0x0000FFFF
	cmp r2, r0
	beq _020262AC
	add r6, r0, #0
	add r7, r0, #0
	sub r4, r0, #1
_02026282:
	cmp r2, r4
	bne _02026298
	add r0, r1, #0
	bl MsgArray_SkipControlCode
	add r1, r0, #0
	ldrh r2, [r1]
	cmp r2, r6
	bne _02026298
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02026298:
	ldr r0, [r5, #0x64]
	sub r2, r2, #1
	cmp r2, r0
	blo _020262A4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020262A4:
	add r1, r1, #2
	ldrh r2, [r1]
	cmp r2, r7
	bne _02026282
_020262AC:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020262B0: .word 0x0000FFFF
	thumb_func_end StringAllCharsValid

	thumb_func_start GetGlyphWidth_VariableWidth
GetGlyphWidth_VariableWidth: ; 0x020262B4
	ldr r2, [r0, #0x64]
	cmp r1, r2
	bhs _020262C0
	ldr r0, [r0, #0x74]
	ldrb r0, [r0, r1]
	bx lr
_020262C0:
	ldr r1, [r0, #0x74]
	ldr r0, _020262C8 ; =0x000001AB
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_020262C8: .word 0x000001AB
	thumb_func_end GetGlyphWidth_VariableWidth

	thumb_func_start GetGlyphWidth_FixedWidth
GetGlyphWidth_FixedWidth: ; 0x020262CC
	add r0, #0x68
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end GetGlyphWidth_FixedWidth

	thumb_func_start GetStringWidthMultiline
GetStringWidthMultiline: ; 0x020262D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldrh r1, [r5]
	add r7, r0, #0
	mov r4, #0
	ldr r0, _02026334 ; =0x0000FFFF
	add r6, r2, #0
	str r4, [sp]
	cmp r1, r0
	beq _02026326
_020262E8:
	ldr r0, _02026338 ; =0x0000FFFE
	cmp r1, r0
	bne _020262F8
	add r0, r5, #0
	bl MsgArray_SkipControlCode
	add r5, r0, #0
	b _0202631E
_020262F8:
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02026310
	ldr r0, [sp]
	sub r1, r4, r6
	cmp r0, r1
	bhs _0202630A
	str r1, [sp]
_0202630A:
	mov r4, #0
	add r5, r5, #2
	b _0202631E
_02026310:
	ldr r2, [r7, #0x70]
	add r0, r7, #0
	sub r1, r1, #1
	blx r2
	add r0, r6, r0
	add r4, r4, r0
	add r5, r5, #2
_0202631E:
	ldrh r1, [r5]
	ldr r0, _02026334 ; =0x0000FFFF
	cmp r1, r0
	bne _020262E8
_02026326:
	ldr r0, [sp]
	sub r1, r4, r6
	cmp r0, r1
	bhs _02026330
	str r1, [sp]
_02026330:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02026334: .word 0x0000FFFF
_02026338: .word 0x0000FFFE
	thumb_func_end GetStringWidthMultiline

	thumb_func_start GetGlyphWidth
GetGlyphWidth: ; 0x0202633C
	push {r3, lr}
	cmp r1, #0
	beq _0202634A
	ldr r2, [r0, #0x70]
	sub r1, r1, #1
	blx r2
	pop {r3, pc}
_0202634A:
	bne _02026350
	bl GF_AssertFail
_02026350:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end GetGlyphWidth
