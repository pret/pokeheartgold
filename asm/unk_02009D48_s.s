	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02009E84
sub_02009E84: ; 0x02009E84
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r0, [sp, #0x48]
	add r7, r1, #0
	str r0, [sp, #0x48]
	ldr r0, [sp, #0x4c]
	mov r4, #0
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x50]
	ldr r1, [r5]
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x54]
	str r2, [sp, #0x2c]
	str r0, [sp, #0x54]
	sub r0, r4, #2
	str r3, [sp, #0x30]
	cmp r1, r0
	beq _02009EB8
	add r2, r5, #0
	sub r0, r4, #2
_02009EAE:
	add r2, #0x20
	ldr r1, [r2]
	add r4, r4, #1
	cmp r1, r0
	bne _02009EAE
_02009EB8:
	add r0, r7, #0
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0x24
	add r6, r0, #0
	add r0, r7, #0
	mul r1, r4
	bl AllocFromHeap
	str r0, [r6]
	mov r7, #0
	str r4, [r6, #4]
	cmp r4, #0
	ble _02009F1E
	add r4, r7, #0
_02009ED8:
	ldr r0, [r5, #0xc]
	str r0, [sp]
	ldr r0, [r5, #0x10]
	str r0, [sp, #4]
	ldr r0, [r5, #0x14]
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0x28]
	ldr r0, [r6]
	ldr r1, [r5]
	ldr r2, [r5, #4]
	ldr r3, [r5, #8]
	add r0, r0, r4
	bl sub_02009D48
	ldr r0, [r6, #4]
	add r7, r7, #1
	add r5, #0x20
	add r4, #0x24
	cmp r7, r0
	blt _02009ED8
_02009F1E:
	add r0, r6, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02009E84

	thumb_func_start sub_02009F24
sub_02009F24: ; 0x02009F24
	push {r4, lr}
	add r4, r0, #0
	bne _02009F2E
	bl GF_AssertFail
_02009F2E:
	ldr r0, [r4]
	cmp r0, #0
	beq _02009F38
	bl FreeToHeap
_02009F38:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02009F24

	thumb_func_start sub_02009F40
sub_02009F40: ; 0x02009F40
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _02009FA4 ; =0xFFFFF000
	add r0, r4, #0
	add r6, r2, #0
	bl sub_02025C44
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xff
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	mov r0, #3
	lsl r0, r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x98
	add r1, sp, #0
	mov r2, #1
	add r3, r4, #0
	bl sub_0200B27C
	mov r0, #0
	str r0, [sp]
	mov r0, #0xff
	mov r1, #3
	lsl r1, r1, #0x12
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	add r0, r4, #0
	str r1, [sp, #4]
	str r1, [sp, #0xc]
	add r0, #0xe0
	add r1, sp, #0
	mov r2, #2
	add r3, r4, #0
	bl sub_0200B27C
	add r0, sp, #0x10
	str r5, [sp, #0x10]
	str r4, [sp, #0x14]
	str r6, [sp, #0x18]
	bl sub_0202445C
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	nop
_02009FA4: .word 0xFFFFF000
	thumb_func_end sub_02009F40

	thumb_func_start sub_02009FA8
sub_02009FA8: ; 0x02009FA8
	push {r3, lr}
	sub sp, #0x10
	str r1, [sp]
	mov r1, #0xff
	lsl r1, r1, #0xc
	str r1, [sp, #8]
	mov r1, #3
	lsl r1, r1, #0x12
	str r1, [sp, #0xc]
	add r0, #0x98
	add r1, sp, #0
	str r2, [sp, #4]
	bl sub_02025C88
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end sub_02009FA8

	thumb_func_start sub_02009FC8
sub_02009FC8: ; 0x02009FC8
	push {r3, lr}
	sub sp, #0x10
	str r1, [sp]
	mov r1, #0xff
	lsl r1, r1, #0xc
	str r1, [sp, #8]
	mov r1, #3
	lsl r1, r1, #0x12
	str r1, [sp, #0xc]
	add r0, #0xe0
	add r1, sp, #0
	str r2, [sp, #4]
	bl sub_02025C88
	add sp, #0x10
	pop {r3, pc}
	thumb_func_end sub_02009FC8

	thumb_func_start sub_02009FE8
sub_02009FE8: ; 0x02009FE8
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0x10
	beq _02009FFE
	ldr r2, _0200A070 ; =0x00100010
	cmp r1, r2
	beq _0200A02E
	ldr r0, _0200A074 ; =0x00200010
	cmp r1, r0
	beq _0200A03C
	b _0200A068
_02009FFE:
	bl GX_GetBankForOBJ
	cmp r0, #0x40
	beq _0200A00E
	bl GX_GetBankForOBJ
	cmp r0, #0x20
	bne _0200A01E
_0200A00E:
	mov r0, #0x3e
	mov r1, #2
	lsl r0, r0, #8
	lsl r1, r1, #8
	add r2, r4, #0
	bl sub_020216F4
	pop {r4, pc}
_0200A01E:
	mov r0, #0x7e
	mov r1, #2
	lsl r0, r0, #8
	lsl r1, r1, #8
	add r2, r4, #0
	bl sub_020216F4
	pop {r4, pc}
_0200A02E:
	mov r0, #0xfe
	lsr r1, r2, #0xb
	lsl r0, r0, #8
	add r2, r4, #0
	bl sub_020216F4
	pop {r4, pc}
_0200A03C:
	bl GX_GetBankForOBJ
	cmp r0, #0x30
	beq _0200A04C
	bl GX_GetBankForOBJ
	cmp r0, #0x50
	bne _0200A05A
_0200A04C:
	mov r1, #2
	ldr r0, _0200A078 ; =0x00013E00
	lsl r1, r1, #8
	add r2, r4, #0
	bl sub_020216F4
	pop {r4, pc}
_0200A05A:
	mov r1, #2
	ldr r0, _0200A07C ; =0x0001FE00
	lsl r1, r1, #8
	add r2, r4, #0
	bl sub_020216F4
	pop {r4, pc}
_0200A068:
	bl GF_AssertFail
	pop {r4, pc}
	nop
_0200A070: .word 0x00100010
_0200A074: .word 0x00200010
_0200A078: .word 0x00013E00
_0200A07C: .word 0x0001FE00
	thumb_func_end sub_02009FE8

	thumb_func_start sub_0200A080
sub_0200A080: ; 0x0200A080
	ldr r3, _0200A08C ; =sub_020225E4
	add r1, r0, #0
	mov r0, #3
	lsl r0, r0, #0xe
	bx r3
	nop
_0200A08C: .word sub_020225E4
	thumb_func_end sub_0200A080
