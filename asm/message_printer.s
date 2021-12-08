	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F5C24:
	.short 0x0140, 0x0008
	.short 0x0160, 0x0010
	.short 0x01A0, 0x0010
	.short 0x01E0, 0x0010
	.short 0x0220, 0x0010
	.short 0x0260, 0x0010
	.short 0x02A0, 0x0010

	.text

	thumb_func_start MessagePrinter_new
MessagePrinter_new: ; 0x0200CC74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r3, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r4, #0
	mov r1, #0x2c
	str r2, [sp, #4]
	bl AllocFromHeap
	str r0, [sp, #8]
	cmp r0, #0
	beq _0200CD8E
	ldr r3, [sp, #8]
	mov r0, #0x10
	mov r1, #5
	mov r2, #1
	add r3, r3, #4
	str r4, [sp]
	bl GfGfxLoader_GetCharData
	ldr r1, [sp, #8]
	mov r3, #0
	str r0, [r1]
	add r0, r1, #0
	ldr r0, [r0, #4]
	ldr r4, [r0, #0x14]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	bls _0200CD88
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	lsl r0, r0, #4
	orr r1, r0
	str r1, [sp, #0xc]
	add r1, r0, #0
	orr r1, r5
	str r1, [sp, #0x10]
	orr r0, r6
	str r0, [sp, #0x14]
	ldr r1, [sp, #4]
	lsl r0, r5, #4
	orr r1, r0
	str r1, [sp, #0x18]
	add r1, r5, #0
	orr r1, r0
	str r1, [sp, #0x1c]
	orr r0, r6
	lsl r2, r6, #4
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #4]
	add r7, r2, #0
	orr r7, r1
	add r1, r2, #0
	orr r1, r5
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	orr r2, r6
	str r1, [sp, #0x28]
	lsl r1, r7, #0x18
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #0x18]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	lsr r1, r1, #0x18
	lsl r0, r0, #0x18
	mov ip, r2
	str r1, [sp, #0x24]
	lsr r6, r0, #0x18
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
_0200CD18:
	ldrb r5, [r4, r3]
	cmp r5, #0x12
	bgt _0200CD40
	bge _0200CD66
	cmp r5, #0x10
	bgt _0200CD3A
	bge _0200CD5E
	cmp r5, #2
	bgt _0200CD7C
	cmp r5, #0
	blt _0200CD7C
	beq _0200CD52
	cmp r5, #1
	beq _0200CD56
	cmp r5, #2
	beq _0200CD5A
	b _0200CD7C
_0200CD3A:
	cmp r5, #0x11
	beq _0200CD62
	b _0200CD7C
_0200CD40:
	cmp r5, #0x21
	bgt _0200CD4C
	bge _0200CD72
	cmp r5, #0x20
	beq _0200CD6C
	b _0200CD7C
_0200CD4C:
	cmp r5, #0x22
	beq _0200CD78
	b _0200CD7C
_0200CD52:
	strb r2, [r4, r3]
	b _0200CD7C
_0200CD56:
	strb r1, [r4, r3]
	b _0200CD7C
_0200CD5A:
	strb r0, [r4, r3]
	b _0200CD7C
_0200CD5E:
	strb r6, [r4, r3]
	b _0200CD7C
_0200CD62:
	strb r7, [r4, r3]
	b _0200CD7C
_0200CD66:
	ldr r5, [sp, #0x20]
	strb r5, [r4, r3]
	b _0200CD7C
_0200CD6C:
	ldr r5, [sp, #0x24]
	strb r5, [r4, r3]
	b _0200CD7C
_0200CD72:
	ldr r5, [sp, #0x28]
	strb r5, [r4, r3]
	b _0200CD7C
_0200CD78:
	mov r5, ip
	strb r5, [r4, r3]
_0200CD7C:
	ldr r5, [sp, #8]
	add r3, r3, #1
	ldr r5, [r5, #4]
	ldr r5, [r5, #0x10]
	cmp r3, r5
	blo _0200CD18
_0200CD88:
	ldr r1, [sp, #4]
	ldr r0, [sp, #8]
	str r1, [r0, #0x28]
_0200CD8E:
	ldr r0, [sp, #8]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end MessagePrinter_new

	thumb_func_start MessagePrinter_delete
MessagePrinter_delete: ; 0x0200CD94
	push {r4, lr}
	add r4, r0, #0
	beq _0200CDAA
	ldr r0, [r4]
	cmp r0, #0
	beq _0200CDA4
	bl FreeToHeap
_0200CDA4:
	add r0, r4, #0
	bl FreeToHeap
_0200CDAA:
	pop {r4, pc}
	thumb_func_end MessagePrinter_delete

	thumb_func_start sub_0200CDAC
sub_0200CDAC: ; 0x0200CDAC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, _0200CDE8 ; =_020F5C24 + 2
	lsl r5, r1, #2
	ldrh r1, [r0, r5]
	lsl r3, r3, #0x10
	mov r0, #8
	str r1, [sp]
	str r0, [sp, #4]
	lsr r3, r3, #0x10
	str r3, [sp, #8]
	ldr r3, [sp, #0x28]
	lsl r3, r3, #0x10
	lsr r3, r3, #0x10
	str r3, [sp, #0xc]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r4, #4]
	add r0, r2, #0
	ldr r2, [r1, #0x14]
	ldr r1, _0200CDEC ; =_020F5C24
	ldrh r1, [r1, r5]
	add r1, r2, r1
	mov r2, #0
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0200CDE8: .word _020F5C24 + 2
_0200CDEC: .word _020F5C24
	thumb_func_end sub_0200CDAC

	thumb_func_start sub_0200CDF0
sub_0200CDF0: ; 0x0200CDF0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	ldr r0, [sp, #0x30]
	add r4, r2, #0
	str r0, [sp, #0x30]
	add r0, r6, #0
	add r2, r3, #0
	add r0, #8
	add r3, r4, #0
	ldr r5, [sp, #0x34]
	ldr r7, [sp, #0x38]
	bl ConvertUIntToDecimalString
	ldrh r1, [r6, #8]
	ldr r0, _0200CE78 ; =0x0000FFFF
	cmp r1, r0
	beq _0200CE72
	lsl r0, r7, #0x10
	add r4, r6, #0
	lsr r7, r0, #0x10
_0200CE1A:
	ldrh r2, [r4, #8]
	cmp r2, #0xa2
	blo _0200CE4E
	cmp r2, #0xab
	bhi _0200CE4E
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	str r7, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [r6, #4]
	sub r2, #0xa2
	ldr r1, [r1, #0x14]
	lsl r2, r2, #5
	add r1, r1, r2
	mov r2, #0
	ldr r0, [sp, #0x30]
	add r3, r2, #0
	bl BlitBitmapRectToWindow
	b _0200CE66
_0200CE4E:
	mov r0, #8
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, [r6, #0x28]
	lsl r2, r5, #0x10
	lsl r1, r1, #0x18
	ldr r0, [sp, #0x30]
	lsr r1, r1, #0x18
	lsr r2, r2, #0x10
	add r3, r7, #0
	bl FillWindowPixelRect
_0200CE66:
	add r4, r4, #2
	ldrh r1, [r4, #8]
	ldr r0, _0200CE78 ; =0x0000FFFF
	add r5, #8
	cmp r1, r0
	bne _0200CE1A
_0200CE72:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200CE78: .word 0x0000FFFF
	thumb_func_end sub_0200CDF0
