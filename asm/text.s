	.include "asm/macros.inc"
	.include "global.inc"

	.data

	.public _0210F6D8
_0210F6D8:
	.byte 0x00, 0x00, 0x00, 0x00

	.bss

_021D1F6C:
	.space 0x8

_021D1F74:
	.space 0x20

_021D1F94:
	.space 0x200

	.text

	thumb_func_start sub_0201FFE0
sub_0201FFE0: ; 0x0201FFE0
	ldr r1, _0201FFE8 ; =_0210F6D8
	str r0, [r1]
	bx lr
	nop
_0201FFE8: .word _0210F6D8
	thumb_func_end sub_0201FFE0

	thumb_func_start sub_0201FFEC
sub_0201FFEC: ; 0x0201FFEC
	push {r4, r5, r6, lr}
	ldr r4, _0202001C ; =_021D1F74
	mov r5, #0
_0201FFF2:
	ldr r3, [r4]
	cmp r3, #0
	bne _0202000C
	ldr r6, _0202001C ; =_021D1F74
	lsl r4, r5, #2
	bl sub_0200E358
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	cmp r0, #0
	bne _02020014
	mov r5, #8
	b _02020014
_0202000C:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	blt _0201FFF2
_02020014:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	pop {r4, r5, r6, pc}
	nop
_0202001C: .word _021D1F74
	thumb_func_end sub_0201FFEC

	thumb_func_start sub_02020020
sub_02020020: ; 0x02020020
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r5, #8
	blo _0202002C
	bl GF_AssertFail
_0202002C:
	ldr r6, _02020064 ; =_021D1F74
	lsl r4, r5, #2
	ldr r0, [r6, r4]
	cmp r0, #0
	bne _0202003A
	bl GF_AssertFail
_0202003A:
	cmp r5, #8
	bhs _02020060
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _02020060
	bl sub_0201F988
	add r5, r0, #0
	beq _02020056
	bl sub_02020548
	add r0, r5, #0
	bl FreeToHeap
_02020056:
	ldr r0, [r6, r4]
	bl DestroySysTask
	mov r0, #0
	str r0, [r6, r4]
_02020060:
	pop {r4, r5, r6, pc}
	nop
_02020064: .word _021D1F74
	thumb_func_end sub_02020020

	thumb_func_start sub_02020068
sub_02020068: ; 0x02020068
	lsl r1, r0, #2
	ldr r0, _0202007C ; =_021D1F74
	ldr r0, [r0, r1]
	cmp r0, #0
	beq _02020076
	mov r0, #1
	bx lr
_02020076:
	mov r0, #0
	bx lr
	nop
_0202007C: .word _021D1F74
	thumb_func_end sub_02020068

	thumb_func_start ResetAllTextPrinters
ResetAllTextPrinters: ; 0x02020080
	mov r1, #0
	ldr r2, _02020090 ; =_021D1F74
	add r0, r1, #0
_02020086:
	add r1, r1, #1
	stmia r2!, {r0}
	cmp r1, #8
	blt _02020086
	bx lr
	.balign 4, 0
_02020090: .word _021D1F74
	thumb_func_end ResetAllTextPrinters

	thumb_func_start TextPrinterCheckActive
TextPrinterCheckActive: ; 0x02020094
	push {r3, lr}
	bl sub_02020068
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end TextPrinterCheckActive

	thumb_func_start sub_020200A0
sub_020200A0: ; 0x020200A0
	ldr r3, _020200A4 ; =sub_02020020
	bx r3
	.balign 4, 0
_020200A4: .word sub_02020020
	thumb_func_end sub_020200A0

	thumb_func_start AddTextPrinterParameterized
AddTextPrinterParameterized: ; 0x020200A8
	push {lr}
	sub sp, #0x1c
	str r2, [sp]
	str r0, [sp, #4]
	add r2, sp, #0
	strb r1, [r2, #9]
	ldr r0, [sp, #0x20]
	strb r3, [r2, #0xa]
	strb r0, [r2, #0xb]
	strh r3, [r2, #0xc]
	strh r0, [r2, #0xe]
	ldr r0, _020200F8 ; =_0210F6D8
	lsl r1, r1, #3
	ldr r0, [r0]
	add r1, r0, r1
	ldrb r0, [r1, #2]
	strh r0, [r2, #0x10]
	ldrb r0, [r1, #3]
	strh r0, [r2, #0x12]
	ldrb r0, [r1, #4]
	strb r0, [r2, #0x14]
	ldrb r0, [r1, #5]
	strb r0, [r2, #0x15]
	ldrb r0, [r1, #6]
	strb r0, [r2, #0x16]
	ldrb r0, [r1, #7]
	ldr r1, [sp, #0x24]
	strb r0, [r2, #0x17]
	mov r0, #0
	strh r0, [r2, #0x18]
	strb r0, [r2, #0x1a]
	mov r0, #0xff
	strb r0, [r2, #0x1b]
	ldr r2, [sp, #0x28]
	add r0, sp, #0
	bl AddTextPrinter
	add sp, #0x1c
	pop {pc}
	nop
_020200F8: .word _0210F6D8
	thumb_func_end AddTextPrinterParameterized

	thumb_func_start AddTextPrinterParameterized2
AddTextPrinterParameterized2: ; 0x020200FC
	push {lr}
	sub sp, #0x1c
	str r2, [sp]
	str r0, [sp, #4]
	add r2, sp, #0
	strb r1, [r2, #9]
	ldr r0, [sp, #0x20]
	strb r3, [r2, #0xa]
	strb r0, [r2, #0xb]
	strh r3, [r2, #0xc]
	strh r0, [r2, #0xe]
	ldr r0, _0202014C ; =_0210F6D8
	lsl r1, r1, #3
	ldr r0, [r0]
	add r1, r0, r1
	ldrb r0, [r1, #2]
	strh r0, [r2, #0x10]
	ldrb r0, [r1, #3]
	strh r0, [r2, #0x12]
	ldrb r0, [r1, #4]
	ldr r1, [sp, #0x28]
	strb r0, [r2, #0x14]
	lsr r0, r1, #0x10
	strb r0, [r2, #0x15]
	lsr r0, r1, #8
	strb r0, [r2, #0x17]
	strb r1, [r2, #0x16]
	mov r0, #0
	strh r0, [r2, #0x18]
	strb r0, [r2, #0x1a]
	mov r0, #0xff
	strb r0, [r2, #0x1b]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x2c]
	add r0, sp, #0
	bl AddTextPrinter
	add sp, #0x1c
	pop {pc}
	nop
_0202014C: .word _0210F6D8
	thumb_func_end AddTextPrinterParameterized2

	thumb_func_start AddTextPrinterParameterized3
AddTextPrinterParameterized3: ; 0x02020150
	push {lr}
	sub sp, #0x1c
	str r2, [sp]
	str r0, [sp, #4]
	add r2, sp, #0
	strb r1, [r2, #9]
	ldr r0, [sp, #0x20]
	strb r3, [r2, #0xa]
	strb r0, [r2, #0xb]
	strh r3, [r2, #0xc]
	strh r0, [r2, #0xe]
	ldr r0, [sp, #0x2c]
	strh r0, [r2, #0x10]
	ldr r0, [sp, #0x30]
	strh r0, [r2, #0x12]
	ldr r0, _020201A0 ; =_0210F6D8
	ldr r3, [r0]
	lsl r0, r1, #3
	add r0, r3, r0
	ldrb r0, [r0, #4]
	ldr r1, [sp, #0x28]
	strb r0, [r2, #0x14]
	lsr r0, r1, #0x10
	strb r0, [r2, #0x15]
	lsr r0, r1, #8
	strb r0, [r2, #0x17]
	strb r1, [r2, #0x16]
	mov r0, #0
	strh r0, [r2, #0x18]
	strb r0, [r2, #0x1a]
	mov r0, #0xff
	strb r0, [r2, #0x1b]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x34]
	add r0, sp, #0
	bl AddTextPrinter
	add sp, #0x1c
	pop {pc}
	nop
_020201A0: .word _0210F6D8
	thumb_func_end AddTextPrinterParameterized3

	thumb_func_start AddTextPrinter
AddTextPrinter: ; 0x020201A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, _020202E0 ; =_0210F6D8
	add r6, r1, #0
	ldr r0, [r0]
	add r5, r2, #0
	cmp r0, #0
	bne _020201B8
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
_020201B8:
	mov r0, #0
	mov r1, #0x34
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #1
	add r0, #0x27
	strb r1, [r0]
	add r0, r4, #0
	mov r3, #0
	add r0, #0x28
	strb r3, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r2, [r0]
	mov r0, #0x7f
	bic r2, r0
	lsl r0, r6, #0x18
	lsr r1, r0, #0x18
	mov r0, #0x7f
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x2a
	strb r3, [r0]
	add r0, r4, #0
	add r0, #0x2b
	strb r3, [r0]
	add r0, r4, #0
	add r0, #0x2d
	strb r3, [r0]
	add r1, r3, #0
_02020200:
	add r0, r4, r3
	add r0, #0x20
	add r3, r3, #1
	strb r1, [r0]
	cmp r3, #7
	blt _02020200
	add r3, r7, #0
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4]
	bl String_c_str
	str r0, [r4]
	ldr r0, _020202E4 ; =_021D1F6C
	str r5, [r4, #0x1c]
	mov r1, #0
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020204B8
	cmp r6, #0xff
	beq _02020286
	cmp r6, #0
	beq _02020286
	add r0, r4, #0
	add r0, #0x29
	ldrb r2, [r0]
	mov r1, #0x7f
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x19
	lsr r1, r1, #0x19
	add r1, #0xff
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x7f
	and r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r1, [r0]
	mov r0, #0x80
	mov r2, #1
	orr r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	ldr r0, _020202E8 ; =sub_020202EC
	add r1, r4, #0
	bl sub_0201FFEC
	add r1, r4, #0
	add r1, #0x2c
	strb r0, [r1]
	add r4, #0x2c
	ldrb r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_02020286:
	add r0, r4, #0
	add r0, #0x29
	ldrb r1, [r0]
	mov r0, #0x7f
	mov r5, #0
	bic r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r1, [r0]
	mov r0, #0x80
	bic r1, r0
	add r0, r4, #0
	add r0, #0x29
	strb r1, [r0]
	ldrb r0, [r7, #0x15]
	ldrb r1, [r7, #0x16]
	ldrb r2, [r7, #0x17]
	bl sub_0202036C
	mov r7, #1
	lsl r7, r7, #0xa
_020202B6:
	add r0, r4, #0
	bl sub_02020358
	cmp r0, #1
	beq _020202C6
	add r5, r5, #1
	cmp r5, r7
	blo _020202B6
_020202C6:
	cmp r6, #0xff
	beq _020202D0
	ldr r0, [r4, #4]
	bl CopyWindowToVram
_020202D0:
	add r0, r4, #0
	bl sub_02020548
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020202E0: .word _0210F6D8
_020202E4: .word _021D1F6C
_020202E8: .word sub_020202EC
	thumb_func_end AddTextPrinter

	thumb_func_start sub_020202EC
sub_020202EC: ; 0x020202EC
	push {r4, lr}
	ldr r0, _02020354 ; =_021D1F6C
	add r4, r1, #0
	ldrb r0, [r0]
	cmp r0, #0
	bne _02020352
	add r0, r4, #0
	add r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0
	bne _02020346
	mov r0, #0
	strh r0, [r4, #0x2e]
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x16]
	ldrb r2, [r4, #0x17]
	bl sub_0202036C
	add r0, r4, #0
	bl sub_02020358
	cmp r0, #0
	beq _02020324
	cmp r0, #1
	beq _0202033C
	cmp r0, #3
	beq _0202032A
	pop {r4, pc}
_02020324:
	ldr r0, [r4, #4]
	bl CopyWindowToVram
_0202032A:
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	beq _02020352
	ldrh r1, [r4, #0x2e]
	add r0, r4, #0
	blx r2
	add r4, #0x2d
	strb r0, [r4]
	pop {r4, pc}
_0202033C:
	add r4, #0x2c
	ldrb r0, [r4]
	bl sub_02020020
	pop {r4, pc}
_02020346:
	ldrh r1, [r4, #0x2e]
	ldr r2, [r4, #0x1c]
	add r0, r4, #0
	blx r2
	add r4, #0x2d
	strb r0, [r4]
_02020352:
	pop {r4, pc}
	.balign 4, 0
_02020354: .word _021D1F6C
	thumb_func_end sub_020202EC

	thumb_func_start sub_02020358
sub_02020358: ; 0x02020358
	push {r4, lr}
	add r4, r0, #0
_0202035C:
	ldrb r0, [r4, #9]
	add r1, r4, #0
	bl FontID_RenderText
	cmp r0, #2
	beq _0202035C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02020358

	thumb_func_start sub_0202036C
sub_0202036C: ; 0x0202036C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	ldr r3, _02020408 ; =_021D1F6C
	mov r5, #0
	str r5, [sp, #0x20]
	str r0, [sp, #0x24]
	str r2, [sp, #0x28]
	str r1, [sp, #0x2c]
	strh r1, [r3, #6]
	strh r0, [r3, #2]
	add r0, sp, #0x20
	strh r2, [r3, #4]
	str r5, [sp, #0x14]
	str r0, [sp, #8]
	mov ip, r0
	mov lr, r0
	str r0, [sp, #0x18]
_0202038E:
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	ldr r0, [r0]
	str r0, [sp, #0x1c]
_0202039C:
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, lr
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	lsl r7, r0, #4
_020203AA:
	ldr r0, [sp]
	mov r3, #0
	ldr r0, [r0]
	mov r4, ip
	lsl r6, r0, #8
_020203B4:
	ldr r0, [r4]
	add r1, r7, #0
	lsl r0, r0, #0xc
	orr r0, r6
	orr r1, r0
	ldr r0, [sp, #0x1c]
	add r3, r3, #1
	add r2, r0, #0
	orr r2, r1
	lsl r1, r5, #1
	ldr r0, _0202040C ; =_021D1F94
	add r5, r5, #1
	add r4, r4, #4
	strh r2, [r0, r1]
	cmp r3, #4
	blt _020203B4
	ldr r0, [sp]
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #4
	blt _020203AA
	ldr r0, [sp, #4]
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0202039C
	ldr r0, [sp, #8]
	add r0, r0, #4
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _0202038E
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020408: .word _021D1F6C
_0202040C: .word _021D1F94
	thumb_func_end sub_0202036C

	thumb_func_start DecompressGlyphTile
DecompressGlyphTile: ; 0x02020410
	ldrh r2, [r0]
	lsr r2, r2, #8
	lsl r3, r2, #1
	ldr r2, _020204B4 ; =_021D1F94
	ldrh r3, [r2, r3]
	strh r3, [r1]
	ldrh r3, [r0]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #2]
	ldrh r3, [r0, #2]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #4]
	ldrh r3, [r0, #2]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #6]
	ldrh r3, [r0, #4]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #8]
	ldrh r3, [r0, #4]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0xa]
	ldrh r3, [r0, #6]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0xc]
	ldrh r3, [r0, #6]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0xe]
	ldrh r3, [r0, #8]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x10]
	ldrh r3, [r0, #8]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x12]
	ldrh r3, [r0, #0xa]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x14]
	ldrh r3, [r0, #0xa]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x16]
	ldrh r3, [r0, #0xc]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x18]
	ldrh r3, [r0, #0xc]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x17
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x1a]
	ldrh r3, [r0, #0xe]
	lsr r3, r3, #8
	lsl r3, r3, #1
	ldrh r3, [r2, r3]
	strh r3, [r1, #0x1c]
	ldrh r0, [r0, #0xe]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x17
	ldrh r0, [r2, r0]
	strh r0, [r1, #0x1e]
	bx lr
	.balign 4, 0
_020204B4: .word _021D1F94
	thumb_func_end DecompressGlyphTile

	thumb_func_start sub_020204B8
sub_020204B8: ; 0x020204B8
	mov r1, #0
	str r1, [r0, #0x30]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020204B8

	thumb_func_start sub_020204C0
sub_020204C0: ; 0x020204C0
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #6
	mov r0, #0
	lsl r1, r1, #8
	bl AllocFromHeap
	mov r2, #0
	add r5, r0, #0
	str r2, [sp]
	mov r0, #0x10
	mov r1, #6
	add r3, sp, #4
	bl GfGfxLoader_GetCharData
	add r4, r0, #0
	ldr r0, [sp, #4]
	mov r2, #6
	ldr r0, [r0, #0x14]
	add r1, r5, #0
	lsl r2, r2, #8
	bl MIi_CpuCopy32
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020204C0

	thumb_func_start sub_020204FC
sub_020204FC: ; 0x020204FC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	add r7, r3, #0
	ldr r5, [r4, #4]
	cmp r0, #0
	bne _02020512
	bl sub_020204C0
	str r0, [r4, #0x30]
_02020512:
	mov r0, #6
	lsl r0, r0, #6
	add r6, r7, #0
	mul r6, r0
	add r0, r5, #0
	ldr r4, [r4, #0x30]
	bl GetWindowWidth
	sub r0, r0, #3
	lsl r0, r0, #0x13
	mov r1, #0x18
	lsr r2, r0, #0x10
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r2, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, r4, r6
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020204FC

	thumb_func_start sub_02020548
sub_02020548: ; 0x02020548
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _0202055A
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x30]
_0202055A:
	pop {r4, pc}
	thumb_func_end sub_02020548
