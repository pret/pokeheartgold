	.include "asm/macros.inc"
	.include "overlay_80_0222BDF4.inc"
	.include "global.inc"

	.text

	thumb_func_start ov80_0222BDF4
ov80_0222BDF4: ; 0x0222BDF4
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222BE24
	add r4, r0, #0
	bne _0222BE0C
	bl GF_AssertFail
_0222BE0C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov80_0222BDF4

	thumb_func_start ov80_0222BE10
ov80_0222BE10: ; 0x0222BE10
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222BE9C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BE10

	thumb_func_start ov80_0222BE24
ov80_0222BE24: ; 0x0222BE24
	push {r3, lr}
	mov r3, #2
	lsl r3, r3, #0xe
	cmp r1, r3
	bhs _0222BE32
	mov r0, #0
	pop {r3, pc}
_0222BE32:
	add r2, r3, #0
	add r2, #8
	cmp r1, r2
	bhs _0222BE44
	sub r1, r1, r3
	add r0, #8
	lsl r1, r1, #1
	add r0, r0, r1
	pop {r3, pc}
_0222BE44:
	add r2, r3, #0
	add r2, #0x10
	cmp r1, r2
	bhs _0222BE58
	add r3, #8
	ldr r0, [r0]
	sub r1, r1, r3
	bl ov80_0222AB2C
	pop {r3, pc}
_0222BE58:
	add r2, r3, #0
	add r2, #0x14
	cmp r1, r2
	bhs _0222BE6C
	add r3, #0x10
	sub r1, r1, r3
	add r0, #0x78
	lsl r1, r1, #1
	add r0, r0, r1
	pop {r3, pc}
_0222BE6C:
	ldr r0, _0222BE94 ; =0x0000FD13
	cmp r1, r0
	bne _0222BE76
	mov r0, #0
	pop {r3, pc}
_0222BE76:
	ldr r0, _0222BE98 ; =0x0000EEEE
	cmp r1, r0
	bne _0222BE80
	mov r0, #0
	pop {r3, pc}
_0222BE80:
	add r0, r0, #1
	cmp r1, r0
	bne _0222BE8A
	mov r0, #0
	pop {r3, pc}
_0222BE8A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_0222BE94: .word 0x0000FD13
_0222BE98: .word 0x0000EEEE
	thumb_func_end ov80_0222BE24

	thumb_func_start ov80_0222BE9C
ov80_0222BE9C: ; 0x0222BE9C
	push {r4, lr}
	add r4, r1, #0
	bl ov80_0222BE24
	cmp r0, #0
	beq _0222BEAA
	ldrh r4, [r0]
_0222BEAA:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BE9C

	thumb_func_start ov80_0222BEB0
ov80_0222BEB0: ; 0x0222BEB0
	mov r0, #0
	bx lr
	thumb_func_end ov80_0222BEB0

	thumb_func_start ov80_0222BEB4
ov80_0222BEB4: ; 0x0222BEB4
	push {r3, lr}
	bl ov80_0222AB90
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BEB4

	thumb_func_start ov80_0222BEC0
ov80_0222BEC0: ; 0x0222BEC0
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AB90
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209684C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222BEC0

	thumb_func_start ov80_0222BED4
ov80_0222BED4: ; 0x0222BED4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222BE10
	add r1, r0, #0
	ldr r0, [r4]
	ldr r2, _0222BEF4 ; =0x0000FFFF
	bl sub_02096854
	ldr r1, _0222BEF8 ; =ov80_0222BEFC
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222BEF4: .word 0x0000FFFF
_0222BEF8: .word ov80_0222BEFC
	thumb_func_end ov80_0222BED4

	thumb_func_start ov80_0222BEFC
ov80_0222BEFC: ; 0x0222BEFC
	mov r0, #1
	bx lr
	thumb_func_end ov80_0222BEFC

	thumb_func_start ov80_0222BF00
ov80_0222BF00: ; 0x0222BF00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_02096854
	add r0, r5, #0
	bl ov80_0222AB90
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BF00

	thumb_func_start ov80_0222BF28
ov80_0222BF28: ; 0x0222BF28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov80_0222BE24
	strh r4, [r0]
	add r0, r5, #0
	add r0, #0x78
	strh r6, [r0]
	ldr r1, _0222BF58 ; =ov80_0222BF5C
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0222BF58: .word ov80_0222BF5C
	thumb_func_end ov80_0222BF28

	thumb_func_start ov80_0222BF5C
ov80_0222BF5C: ; 0x0222BF5C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE24
	ldrh r1, [r0]
	sub r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	bne _0222BF78
	mov r0, #1
	pop {r3, pc}
_0222BF78:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222BF5C

	thumb_func_start ov80_0222BF7C
ov80_0222BF7C: ; 0x0222BF7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BF7C

	thumb_func_start ov80_0222BF94
ov80_0222BF94: ; 0x0222BF94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	ldrh r0, [r0]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222BF94

	thumb_func_start ov80_0222BFAC
ov80_0222BFAC: ; 0x0222BFAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldrh r1, [r4]
	add r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BFAC

	thumb_func_start ov80_0222BFC8
ov80_0222BFC8: ; 0x0222BFC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldrh r1, [r4]
	sub r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BFC8

	thumb_func_start ov80_0222BFE4
ov80_0222BFE4: ; 0x0222BFE4
	cmp r0, r1
	bhs _0222BFEC
	mov r0, #0
	bx lr
_0222BFEC:
	cmp r0, r1
	bne _0222BFF4
	mov r0, #1
	bx lr
_0222BFF4:
	mov r0, #2
	bx lr
	thumb_func_end ov80_0222BFE4

	thumb_func_start ov80_0222BFF8
ov80_0222BFF8: ; 0x0222BFF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222BFE4
	add r5, #0x8c
	strb r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222BFF8

	thumb_func_start ov80_0222C018
ov80_0222C018: ; 0x0222C018
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r1, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r1]
	bl ov80_0222BFE4
	add r5, #0x8c
	strb r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C018

	thumb_func_start ov80_0222C03C
ov80_0222C03C: ; 0x0222C03C
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov80_0222C03C

	thumb_func_start ov80_0222C040
ov80_0222C040: ; 0x0222C040
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC70
	add r2, r0, #0
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	add r1, r1, r2
	bl ov80_0222C03C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222C040

	thumb_func_start ov80_0222C058
ov80_0222C058: ; 0x0222C058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222AC70
	add r1, r0, #0
	lsl r0, r4, #1
	add r4, r4, r0
	add r0, r5, #0
	add r0, #0x8c
	ldr r3, _0222C08C ; =ov80_0223B9D8
	ldrb r2, [r0]
	add r0, r3, r4
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0222C088
	ldr r2, [r5, #0x1c]
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222C03C
_0222C088:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C08C: .word ov80_0223B9D8
	thumb_func_end ov80_0222C058

	thumb_func_start ov80_0222C090
ov80_0222C090: ; 0x0222C090
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC70
	add r2, r0, #0
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	add r1, r1, r2
	bl ov80_0222AC3C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222C090

	thumb_func_start ov80_0222C0A8
ov80_0222C0A8: ; 0x0222C0A8
	push {r3, lr}
	bl ov80_0222AC4C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C0A8

	thumb_func_start ov80_0222C0B4
ov80_0222C0B4: ; 0x0222C0B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222AC70
	add r1, r0, #0
	lsl r0, r4, #1
	add r4, r4, r0
	add r0, r5, #0
	add r0, #0x8c
	ldr r3, _0222C0E8 ; =ov80_0223B9D8
	ldrb r2, [r0]
	add r0, r3, r4
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0222C0E4
	ldr r2, [r5, #0x1c]
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222AC3C
_0222C0E4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C0E8: .word ov80_0223B9D8
	thumb_func_end ov80_0222C0B4

	thumb_func_start ov80_0222C0EC
ov80_0222C0EC: ; 0x0222C0EC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov80_0222AC58
	add r2, r0, #0
	mov r3, #0
	add r0, sp, #4
	strb r3, [r0]
	strb r3, [r0, #1]
	mov r1, #1
	strb r1, [r0, #2]
	strb r3, [r0, #3]
	add r0, sp, #4
	str r0, [sp]
	ldr r0, [r4]
	add r4, #0x80
	ldr r1, [r4]
	bl ov80_0222E268
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C0EC

	thumb_func_start ov80_0222C11C
ov80_0222C11C: ; 0x0222C11C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov80_0222AC58
	mov r3, #0
	add r1, r4, #0
	str r3, [sp]
	add r1, #0x80
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_0222E268
	ldr r1, _0222C148 ; =ov80_0222C17C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_0222C148: .word ov80_0222C17C
	thumb_func_end ov80_0222C11C

	thumb_func_start ov80_0222C14C
ov80_0222C14C: ; 0x0222C14C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov80_0222AC58
	add r2, r0, #0
	mov r0, #0
	add r1, r4, #0
	str r0, [sp]
	add r1, #0x80
	ldr r0, [r4]
	ldr r1, [r1]
	mov r3, #1
	bl ov80_0222E268
	ldr r1, _0222C178 ; =ov80_0222C17C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0222C178: .word ov80_0222C17C
	thumb_func_end ov80_0222C14C

	thumb_func_start ov80_0222C17C
ov80_0222C17C: ; 0x0222C17C
	push {r3, lr}
	ldr r0, [r0]
	add r0, #0x50
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222C196
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r3, pc}
_0222C196:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C17C

	thumb_func_start ov80_0222C19C
ov80_0222C19C: ; 0x0222C19C
	push {r3, lr}
	ldr r0, [r0]
	bl ov80_0222E38C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222C19C

	thumb_func_start ov80_0222C1A8
ov80_0222C1A8: ; 0x0222C1A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	str r4, [sp]
	add r3, r0, #0
	str r6, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r1, r7, #0
	add r2, r7, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222C1A8

	thumb_func_start ov80_0222C1F0
ov80_0222C1F0: ; 0x0222C1F0
	push {r3, lr}
	ldr r1, _0222C1FC ; =ov80_0222C200
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222C1FC: .word ov80_0222C200
	thumb_func_end ov80_0222C1F0

	thumb_func_start ov80_0222C200
ov80_0222C200: ; 0x0222C200
	push {r3, lr}
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222C20E
	mov r0, #1
	pop {r3, pc}
_0222C20E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C200

	thumb_func_start ov80_0222C214
ov80_0222C214: ; 0x0222C214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E558
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C214

	thumb_func_start ov80_0222C270
ov80_0222C270: ; 0x0222C270
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E558
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C270

	thumb_func_start ov80_0222C2D0
ov80_0222C2D0: ; 0x0222C2D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r3, r0, #0
	ldr r0, [r4, #0x60]
	add r1, r6, #0
	mov r2, #0xff
	bl ov80_0222E5A8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C2D0

	thumb_func_start ov80_0222C2F4
ov80_0222C2F4: ; 0x0222C2F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r3, r0, #0
	ldr r0, [r4, #0x60]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_0222E5A8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C2F4

	thumb_func_start ov80_0222C320
ov80_0222C320: ; 0x0222C320
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x60]
	bl ov80_0222E5B0
	ldr r1, _0222C338 ; =ov80_0222C33C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222C338: .word ov80_0222C33C
	thumb_func_end ov80_0222C320

	thumb_func_start ov80_0222C33C
ov80_0222C33C: ; 0x0222C33C
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x78
	ldrh r1, [r1]
	ldr r4, [r0]
	bl ov80_0222BE24
	ldr r1, [r4, #0x60]
	cmp r1, #0
	beq _0222C354
	mov r0, #0
	pop {r4, pc}
_0222C354:
	ldrh r1, [r0]
	ldr r0, _0222C364 ; =0x0000EEEE
	cmp r1, r0
	beq _0222C360
	mov r0, #1
	pop {r4, pc}
_0222C360:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222C364: .word 0x0000EEEE
	thumb_func_end ov80_0222C33C

	thumb_func_start ov80_0222C368
ov80_0222C368: ; 0x0222C368
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E920
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C368

	thumb_func_start ov80_0222C3C4
ov80_0222C3C4: ; 0x0222C3C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E920
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C3C4

	thumb_func_start ov80_0222C424
ov80_0222C424: ; 0x0222C424
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r3, r0, #0
	ldr r0, [r4, #0x60]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_0222E940
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C424

	thumb_func_start ov80_0222C450
ov80_0222C450: ; 0x0222C450
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x60]
	bl ov80_0222E948
	ldr r1, _0222C468 ; =ov80_0222C33C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222C468: .word ov80_0222C33C
	thumb_func_end ov80_0222C450

	thumb_func_start ov80_0222C46C
ov80_0222C46C: ; 0x0222C46C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x60]
	bl ov80_0222EEAC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C46C

	thumb_func_start ov80_0222C47C
ov80_0222C47C: ; 0x0222C47C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5]
	add r0, r4, #0
	bl ov80_0222AB34
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	ldr r1, [r5, #0x1c]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r0, [r1]
	ldr r1, _0222C4C4 ; =ov80_0223B9D0
	ldr r2, _0222C4C8 ; =0x000003D9
	str r0, [sp]
	ldr r0, [r4, #0x34]
	mov r3, #0xc
	str r0, [sp, #4]
	ldr r0, [r6]
	bl CreateYesNoMenu
	str r0, [r4, #0x74]
	add r0, r5, #0
	add r0, #0x78
	strh r7, [r0]
	ldr r1, _0222C4CC ; =ov80_0222C4D0
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C4C4: .word ov80_0223B9D0
_0222C4C8: .word 0x000003D9
_0222C4CC: .word ov80_0222C4D0
	thumb_func_end ov80_0222C47C

	thumb_func_start ov80_0222C4D0
ov80_0222C4D0: ; 0x0222C4D0
	push {r4, r5, r6, lr}
	add r1, r0, #0
	add r1, #0x78
	ldrh r1, [r1]
	ldr r4, [r0]
	bl ov80_0222BE24
	add r5, r0, #0
	ldr r0, [r4, #0x74]
	ldr r1, [r4, #0x34]
	bl Handle2dMenuInput_DeleteOnFinish
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _0222C516
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222C512
	ldr r0, _0222C528 ; =0x000005DC
	bl PlaySE
	ldr r0, [r4, #0x74]
	bl Get2dMenuSelection
	add r6, r0, #0
	ldr r0, [r4, #0x74]
	ldr r1, [r4, #0x34]
	bl Clear2dMenuWindowAndDelete
	b _0222C516
_0222C512:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222C516:
	cmp r6, #0
	bne _0222C51E
	mov r0, #0
	b _0222C520
_0222C51E:
	mov r0, #1
_0222C520:
	strh r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0222C528: .word 0x000005DC
	thumb_func_end ov80_0222C4D0

	thumb_func_start ov80_0222C52C
ov80_0222C52C: ; 0x0222C52C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	ldr r0, [sp]
	bl ov80_0222AC70
	ldr r1, [sp]
	ldr r1, [r1, #0x1c]
	str r1, [sp, #4]
	add r1, r1, r0
	ldr r0, [sp]
	str r1, [r0, #0x1c]
_0222C550:
	ldr r0, [sp]
	bl ov80_0222BE10
	add r1, sp, #0xc
	strh r0, [r1]
	ldrh r2, [r1]
	ldr r0, _0222C5E4 ; =0x0000FD13
	cmp r2, r0
	beq _0222C5D8
	ldr r0, [sp]
	ldr r3, [r0, #0x1c]
	add r2, r3, #1
	str r2, [r0, #0x1c]
	ldrb r0, [r3]
	strb r0, [r1, #2]
	ldrh r1, [r1]
	ldr r0, _0222C5E8 ; =0x0000EEEE
	cmp r1, r0
	bne _0222C596
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_PlayerData_GetProfileAddr
	bl ov80_0222A7EC
	add r1, sp, #0xc
	strh r0, [r1]
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	b _0222C550
_0222C596:
	add r0, r0, #1
	cmp r1, r0
	bne _0222C5CE
	bl sub_02037474
	cmp r0, #1
	bne _0222C550
	bl sub_02037454
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _0222C550
	add r7, sp, #0xc
_0222C5B2:
	add r0, r5, #0
	bl sub_02034818
	bl ov80_0222A7EC
	strh r0, [r7]
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	add r5, r5, #1
	cmp r5, r6
	blt _0222C5B2
	b _0222C550
_0222C5CE:
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	b _0222C550
_0222C5D8:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	str r1, [r0, #0x1c]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C5E4: .word 0x0000FD13
_0222C5E8: .word 0x0000EEEE
	thumb_func_end ov80_0222C52C

	thumb_func_start ov80_0222C5EC
ov80_0222C5EC: ; 0x0222C5EC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_022394D8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C5EC

	thumb_func_start ov80_0222C60C
ov80_0222C60C: ; 0x0222C60C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5]
	str r0, [sp, #8]
	ldr r0, [r0]
	bl sub_0209680C
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov80_0222AC70
	ldr r1, [r5, #0x1c]
	add r4, r5, #0
	add r0, r1, r0
	str r1, [sp]
	str r0, [r5, #0x1c]
	add r4, #0x1c
	add r6, sp, #0xc
_0222C632:
	mov r7, #0
	add r0, r5, #0
	mvn r7, r7
	bl ov80_0222BE10
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	ldr r0, _0222C6DC ; =0x0000FD13
	cmp r1, r0
	beq _0222C6D0
	add r0, r5, #0
	bl ov80_0222BE10
	strh r0, [r6]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xa]
	add r0, r5, #0
	bl ov80_0222AC58
	sub r0, #8
	strh r0, [r6, #6]
	add r0, r5, #0
	bl ov80_0222AC58
	sub r0, #0x10
	strh r0, [r6, #8]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xb]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xc]
	mov r0, #0
	strh r0, [r6, #2]
	ldrh r1, [r6]
	ldr r0, _0222C6E0 ; =0x0000EEEE
	cmp r1, r0
	bne _0222C6AA
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_PlayerData_GetProfileAddr
	bl ov80_0222A7EC
	strh r0, [r6]
	mov r7, #0x1f
	b _0222C6C4
_0222C6AA:
	add r0, r0, #1
	cmp r1, r0
	bne _0222C6C4
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	bl sub_02034818
	bl ov80_0222A7EC
	strh r0, [r6]
_0222C6C4:
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	add r2, r7, #0
	bl ov80_02239510
	b _0222C632
_0222C6D0:
	ldr r0, [sp]
	str r0, [r5, #0x1c]
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0222C6DC: .word 0x0000FD13
_0222C6E0: .word 0x0000EEEE
	thumb_func_end ov80_0222C60C

	thumb_func_start ov80_0222C6E4
ov80_0222C6E4: ; 0x0222C6E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	ldr r0, [r5, #0x14]
	bl ov42_02228110
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_02239590
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C6E4

	thumb_func_start ov80_0222C70C
ov80_0222C70C: ; 0x0222C70C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldr r2, [r5, #0x1c]
	add r1, r0, #0
	add r0, r2, #1
	str r0, [r5, #0x1c]
	ldrb r5, [r2]
	mov r2, #0
	add r0, r4, #0
	str r2, [sp]
	add r3, sp, #0
	bl ov80_022395E8
	ldr r0, [sp]
	cmp r0, #0
	bne _0222C740
	bl GF_AssertFail
_0222C740:
	ldr r0, [sp]
	add r1, r5, #0
	bl ov42_02229200
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C70C

	thumb_func_start ov80_0222C74C
ov80_0222C74C: ; 0x0222C74C
	mov r0, #0
	bx lr
	thumb_func_end ov80_0222C74C

	thumb_func_start ov80_0222C750
ov80_0222C750: ; 0x0222C750
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl sub_0209680C
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC70
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r7, #0
	bl ov80_02239938
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222C782
	bl GF_AssertFail
_0222C782:
	add r0, r4, #0
	add r0, #0x59
	str r0, [sp]
	ldr r0, [r4, #0x34]
	ldr r3, [sp, #0xc]
	str r0, [sp, #4]
	ldr r2, [r5, #0x1c]
	ldr r1, [sp, #8]
	ldr r3, [r3, #0x30]
	add r0, r7, #0
	add r2, r2, r6
	bl ov80_0222C7B0
	add r0, r4, #0
	add r0, #0x59
	ldrb r0, [r0]
	add r4, #0x59
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C750

	thumb_func_start ov80_0222C7B0
ov80_0222C7B0: ; 0x0222C7B0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x1c]
	mov r1, #0x18
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	str r5, [r4, #0x14]
	ldr r0, [sp]
	str r7, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x18]
	strh r6, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #0x38]
	cmp r0, #0
	beq _0222C7E4
	bl GF_AssertFail
_0222C7E4:
	ldr r0, _0222C7F4 ; =ov80_0222EEC8
	ldr r2, _0222C7F8 ; =0x0000EAC4
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r5, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C7F4: .word ov80_0222EEC8
_0222C7F8: .word 0x0000EAC4
	thumb_func_end ov80_0222C7B0

	thumb_func_start ov80_0222C7FC
ov80_0222C7FC: ; 0x0222C7FC
	push {r3, lr}
	ldr r1, _0222C808 ; =ov80_0222C80C
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222C808: .word ov80_0222C80C
	thumb_func_end ov80_0222C7FC

	thumb_func_start ov80_0222C80C
ov80_0222C80C: ; 0x0222C80C
	ldr r0, [r0]
	add r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222C81A
	mov r0, #1
	bx lr
_0222C81A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222C80C

	thumb_func_start ov80_0222C820
ov80_0222C820: ; 0x0222C820
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r4, [r6]
	ldr r0, [r4]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r6, #0
	bl ov80_0222AC70
	ldr r1, [r6, #0x1c]
	add r0, r1, r0
	str r0, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r1, [r4, #0x34]
	mov r0, #0xb8
	bl NARC_New
	add r7, r0, #0
_0222C848:
	add r0, r6, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, _0222C880 ; =0x0000FD13
	cmp r4, r0
	beq _0222C86E
	str r4, [sp]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r3, [r5, #4]
	add r2, r7, #0
	bl ov80_02239AF8
	add r0, r5, #0
	add r1, r4, #0
	bl ov80_0223962C
	b _0222C848
_0222C86E:
	add r0, r7, #0
	bl NARC_Delete
	ldr r0, [sp, #4]
	str r0, [r6, #0x1c]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C880: .word 0x0000FD13
	thumb_func_end ov80_0222C820

	thumb_func_start ov80_0222C884
ov80_0222C884: ; 0x0222C884
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	ldr r0, [r4, #0x38]
	add r1, r5, #0
	bl ov80_02239B7C
	add r0, r4, #0
	add r1, r5, #0
	bl ov80_0223965C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C884

	thumb_func_start ov80_0222C8B0
ov80_0222C8B0: ; 0x0222C8B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC70
	ldr r1, [r5, #0x1c]
	add r4, r5, #0
	add r0, r1, r0
	str r1, [sp]
	str r0, [r5, #0x1c]
	add r4, #0x1c
_0222C8D2:
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	ldr r0, _0222C948 ; =0x0000FD13
	cmp r7, r0
	beq _0222C93E
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x14]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r2, r0, #1
	str r2, [r4]
	ldrb r0, [r1]
	str r0, [sp, #8]
	add r0, r2, #1
	ldr r1, [r5, #0x1c]
	add r2, r7, #0
	str r0, [r4]
	ldrb r0, [r1]
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ov80_0223968C
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	add r7, r0, #0
	bl sub_0200DDB8
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl sub_0200DCE8
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	add r0, r6, #0
	bl ov80_02239708
	b _0222C8D2
_0222C93E:
	ldr r0, [sp]
	str r0, [r5, #0x1c]
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C948: .word 0x0000FD13
	thumb_func_end ov80_0222C8B0

	thumb_func_start ov80_0222C94C
ov80_0222C94C: ; 0x0222C94C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_022396D8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C94C

	thumb_func_start ov80_0222C96C
ov80_0222C96C: ; 0x0222C96C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldr r2, [r5, #0x1c]
	add r1, r0, #0
	add r0, r2, #1
	str r0, [r5, #0x1c]
	add r0, r4, #0
	ldrb r5, [r2]
	bl ov80_02239700
	add r4, r0, #0
	bne _0222C998
	bl GF_AssertFail
_0222C998:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0200DCE8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C96C

	thumb_func_start ov80_0222C9A4
ov80_0222C9A4: ; 0x0222C9A4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_02239700
	add r4, r0, #0
	bne _0222C9C8
	bl GF_AssertFail
_0222C9C8:
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200E0B8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C9A4

	thumb_func_start ov80_0222C9D4
ov80_0222C9D4: ; 0x0222C9D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_02239700
	add r4, r0, #0
	bne _0222CA02
	bl GF_AssertFail
_0222CA02:
	cmp r5, #0
	ldr r0, [r4]
	bne _0222CA10
	mov r1, #0
	bl sub_0200E0F4
	b _0222CA16
_0222CA10:
	mov r1, #1
	bl sub_0200E0F4
_0222CA16:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C9D4

	thumb_func_start ov80_0222CA1C
ov80_0222CA1C: ; 0x0222CA1C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r1, r5, #0
	add r4, r0, #0
	bl ov80_02239700
	add r1, r6, #0
	bl sub_0200DC4C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov80_02239708
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CA1C

	thumb_func_start ov80_0222CA54
ov80_0222CA54: ; 0x0222CA54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r1, r4, #0
	mov r2, #0
	bl ov80_02239708
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CA54

	thumb_func_start ov80_0222CA74
ov80_0222CA74: ; 0x0222CA74
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222CA90 ; =ov80_0222CA94
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222CA90: .word ov80_0222CA94
	thumb_func_end ov80_0222CA74

	thumb_func_start ov80_0222CA94
ov80_0222CA94: ; 0x0222CA94
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r1, r5, #0
	add r1, #0x78
	ldrh r1, [r1]
	add r4, r0, #0
	bl ov80_02239700
	add r5, #0x78
	add r6, r0, #0
	ldrh r1, [r5]
	add r0, r4, #0
	bl ov80_02239734
	cmp r0, #0
	beq _0222CAC6
	add r0, r6, #0
	bl sub_0200DCA0
	cmp r0, #0
	bne _0222CACA
_0222CAC6:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222CACA:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CA94

	thumb_func_start ov80_0222CAD0
ov80_0222CAD0: ; 0x0222CAD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r4, r2, #0
	ldr r7, [r6]
	cmp r4, #7
	ble _0222CAE2
	bl GF_AssertFail
_0222CAE2:
	ldr r0, [r7, #0x34]
	lsl r1, r4, #1
	bl AllocFromHeap
	str r0, [sp, #8]
	add r0, r6, #0
	bl ov80_0222BE10
	ldr r5, [sp, #8]
	str r0, [sp, #4]
	mov r4, #0
_0222CAF8:
	add r0, r6, #0
	bl ov80_0222BE10
	strh r0, [r5]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #3
	blt _0222CAF8
	mov r0, #3
	str r0, [sp]
	ldr r0, [r7]
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	mov r2, #1
	bl ov80_02239BF0
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CAD0

	thumb_func_start ov80_0222CB24
ov80_0222CB24: ; 0x0222CB24
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov80_0222BE10
	mov r2, #0
	str r2, [sp]
	add r1, r0, #0
	ldr r0, [r4]
	add r3, r2, #0
	ldr r0, [r0]
	bl ov80_02239BF0
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov80_0222CB24

	thumb_func_start ov80_0222CB44
ov80_0222CB44: ; 0x0222CB44
	push {r3, lr}
	mov r1, #1
	mov r2, #3
	bl ov80_0222CAD0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CB44

	thumb_func_start ov80_0222CB54
ov80_0222CB54: ; 0x0222CB54
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #4]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xb
	add r2, r1, #0
	mov r3, #8
	str r1, [sp, #4]
	bl sub_020830D8
	add r2, r0, #0
	ldr r0, _0222CB8C ; =ov80_0222CB94
	ldr r1, _0222CB90 ; =_02102610
	str r0, [sp]
	ldr r0, [r4]
	mov r3, #0
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0222CB8C: .word ov80_0222CB94
_0222CB90: .word _02102610
	thumb_func_end ov80_0222CB54

	thumb_func_start ov80_0222CB94
ov80_0222CB94: ; 0x0222CB94
	ldr r3, _0222CB98 ; =sub_0208311C
	bx r3
	.balign 4, 0
_0222CB98: .word sub_0208311C
	thumb_func_end ov80_0222CB94

	thumb_func_start ov80_0222CB9C
ov80_0222CB9C: ; 0x0222CB9C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	mov r1, #0xb
	add r2, sp, #0
	bl sub_0202FBF0
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CB9C

	thumb_func_start ov80_0222CBB4
ov80_0222CBB4: ; 0x0222CBB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp]
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r7, r0, #0
	ldr r0, _0222CC18 ; =0x0000270F
	cmp r6, r0
	bls _0222CBE2
	add r6, r0, #0
_0222CBE2:
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb0
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xb2
	strh r1, [r0]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl ov80_0222CC70
	add r1, r4, #0
	add r1, #0xb4
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0xb6
	strh r6, [r0]
	add r4, #0xb8
	ldr r1, _0222CC1C ; =ov80_0222CC20
	add r0, r5, #0
	str r7, [r4]
	bl ov80_0222AB84
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CC18: .word 0x0000270F
_0222CC1C: .word ov80_0222CC20
	thumb_func_end ov80_0222CBB4

	thumb_func_start ov80_0222CC20
ov80_0222CC20: ; 0x0222CC20
	push {r4, lr}
	sub sp, #8
	ldr r4, [r0]
	ldr r0, [r4]
	bl sub_02096808
	add r1, r4, #0
	add r1, #0xb0
	str r1, [sp]
	add r1, r4, #0
	add r1, #0xb2
	str r1, [sp, #4]
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0xb4
	add r2, #0xb6
	ldrh r1, [r1]
	ldrh r2, [r2]
	ldr r0, [r0, #8]
	mov r3, #0
	bl sub_0202FE14
	sub r1, r0, #2
	cmp r1, #1
	bhi _0222CC68
	cmp r0, #2
	bne _0222CC5A
	mov r1, #1
	b _0222CC5C
_0222CC5A:
	mov r1, #0
_0222CC5C:
	add r4, #0xb8
	ldr r0, [r4]
	add sp, #8
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0222CC68:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CC20

	thumb_func_start ov80_0222CC70
ov80_0222CC70: ; 0x0222CC70
	push {r4, lr}
	mov r4, #0xf
	cmp r0, #6
	bhi _0222CCB0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CC84: ; jump table
	.short _0222CD90 - _0222CC84 - 2 ; case 0
	.short _0222CC92 - _0222CC84 - 2 ; case 1
	.short _0222CCC0 - _0222CC84 - 2 ; case 2
	.short _0222CCEA - _0222CC84 - 2 ; case 3
	.short _0222CD14 - _0222CC84 - 2 ; case 4
	.short _0222CD3E - _0222CC84 - 2 ; case 5
	.short _0222CD68 - _0222CC84 - 2 ; case 6
_0222CC92:
	cmp r1, #6
	bhi _0222CCBA
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CCA2: ; jump table
	.short _0222CCB0 - _0222CCA2 - 2 ; case 0
	.short _0222CCB2 - _0222CCA2 - 2 ; case 1
	.short _0222CCB6 - _0222CCA2 - 2 ; case 2
	.short _0222CCB6 - _0222CCA2 - 2 ; case 3
	.short _0222CCB8 - _0222CCA2 - 2 ; case 4
	.short _0222CCB8 - _0222CCA2 - 2 ; case 5
	.short _0222CCB6 - _0222CCA2 - 2 ; case 6
_0222CCB0:
	b _0222CD90
_0222CCB2:
	mov r4, #0x10
	b _0222CD90
_0222CCB6:
	mov r4, #0x11
_0222CCB8:
	b _0222CD90
_0222CCBA:
	bl GF_AssertFail
	b _0222CD90
_0222CCC0:
	cmp r1, #3
	bhi _0222CCE4
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CCD0: ; jump table
	.short _0222CCD8 - _0222CCD0 - 2 ; case 0
	.short _0222CCDC - _0222CCD0 - 2 ; case 1
	.short _0222CCE0 - _0222CCD0 - 2 ; case 2
	.short _0222CCE0 - _0222CCD0 - 2 ; case 3
_0222CCD8:
	mov r4, #0x12
	b _0222CD90
_0222CCDC:
	mov r4, #0x13
	b _0222CD90
_0222CCE0:
	mov r4, #0x14
	b _0222CD90
_0222CCE4:
	bl GF_AssertFail
	b _0222CD90
_0222CCEA:
	cmp r1, #3
	bhi _0222CD0E
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CCFA: ; jump table
	.short _0222CD02 - _0222CCFA - 2 ; case 0
	.short _0222CD06 - _0222CCFA - 2 ; case 1
	.short _0222CD0A - _0222CCFA - 2 ; case 2
	.short _0222CD0A - _0222CCFA - 2 ; case 3
_0222CD02:
	mov r4, #0x15
	b _0222CD90
_0222CD06:
	mov r4, #0x16
	b _0222CD90
_0222CD0A:
	mov r4, #0x17
	b _0222CD90
_0222CD0E:
	bl GF_AssertFail
	b _0222CD90
_0222CD14:
	cmp r1, #3
	bhi _0222CD38
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CD24: ; jump table
	.short _0222CD2C - _0222CD24 - 2 ; case 0
	.short _0222CD30 - _0222CD24 - 2 ; case 1
	.short _0222CD34 - _0222CD24 - 2 ; case 2
	.short _0222CD34 - _0222CD24 - 2 ; case 3
_0222CD2C:
	mov r4, #0x1b
	b _0222CD90
_0222CD30:
	mov r4, #0x1c
	b _0222CD90
_0222CD34:
	mov r4, #0x1d
	b _0222CD90
_0222CD38:
	bl GF_AssertFail
	b _0222CD90
_0222CD3E:
	cmp r1, #3
	bhi _0222CD62
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CD4E: ; jump table
	.short _0222CD56 - _0222CD4E - 2 ; case 0
	.short _0222CD5A - _0222CD4E - 2 ; case 1
	.short _0222CD5E - _0222CD4E - 2 ; case 2
	.short _0222CD5E - _0222CD4E - 2 ; case 3
_0222CD56:
	mov r4, #0x18
	b _0222CD90
_0222CD5A:
	mov r4, #0x19
	b _0222CD90
_0222CD5E:
	mov r4, #0x1a
	b _0222CD90
_0222CD62:
	bl GF_AssertFail
	b _0222CD90
_0222CD68:
	cmp r1, #3
	bhi _0222CD8C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CD78: ; jump table
	.short _0222CD80 - _0222CD78 - 2 ; case 0
	.short _0222CD84 - _0222CD78 - 2 ; case 1
	.short _0222CD88 - _0222CD78 - 2 ; case 2
	.short _0222CD88 - _0222CD78 - 2 ; case 3
_0222CD80:
	mov r4, #0x1e
	b _0222CD90
_0222CD84:
	mov r4, #0x1f
	b _0222CD90
_0222CD88:
	mov r4, #0x20
	b _0222CD90
_0222CD8C:
	bl GF_AssertFail
_0222CD90:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov80_0222CC70

	thumb_func_start ov80_0222CD94
ov80_0222CD94: ; 0x0222CD94
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	mov r1, #0x75
	add r4, r0, #0
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x75
	mov r1, #0
	lsl r2, r2, #2
	add r6, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xb
	add r2, sp, #4
	add r3, r6, #0
	bl sub_0202FC90
	ldr r1, _0222CDEC ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, _0222CDF0 ; =_020FA484
	ldr r0, [r0]
	add r2, r6, #0
	mov r3, #1
	bl sub_02096820
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222CDEC: .word 0x0000045D
_0222CDF0: .word _020FA484
	thumb_func_end ov80_0222CD94

	thumb_func_start ov80_0222CDF4
ov80_0222CDF4: ; 0x0222CDF4
	push {r3, lr}
	bl sub_0202FC24
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CDF4

	thumb_func_start ov80_0222CE00
ov80_0222CE00: ; 0x0222CE00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0xb
	add r2, sp, #0
	mov r3, #0
	bl sub_0202FD28
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222CE00

	thumb_func_start ov80_0222CE28
ov80_0222CE28: ; 0x0222CE28
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BDF4
	ldr r0, [r5, #8]
	bl SaveGameNormal
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CE28

	thumb_func_start ov80_0222CE48
ov80_0222CE48: ; 0x0222CE48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl sub_02096808
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	mov r0, #4
	bl sub_0201A728
	ldr r0, [r4, #0x34]
	bl sub_0201A748
	ldr r0, [r6, #8]
	mov r1, #2
	bl Save_PrepareForAsyncWrite
	ldr r1, _0222CE7C ; =ov80_0222CE80
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222CE7C: .word ov80_0222CE80
	thumb_func_end ov80_0222CE48

	thumb_func_start ov80_0222CE80
ov80_0222CE80: ; 0x0222CE80
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_WriteFileAsync
	cmp r0, #2
	bne _0222CEA2
	bl sub_0201A774
	mov r0, #4
	bl sub_0201A738
	mov r0, #1
	pop {r3, pc}
_0222CEA2:
	cmp r0, #3
	bne _0222CEB4
	bl sub_0201A774
	mov r0, #4
	bl sub_0201A738
	mov r0, #1
	pop {r3, pc}
_0222CEB4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CE80

	thumb_func_start ov80_0222CEB8
ov80_0222CEB8: ; 0x0222CEB8
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_WipeExtraChunks
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CEB8

	thumb_func_start ov80_0222CECC
ov80_0222CECC: ; 0x0222CECC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Save_CheckExtraChunksExist
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CECC

	thumb_func_start ov80_0222CEF0
ov80_0222CEF0: ; 0x0222CEF0
	push {r4, lr}
	ldr r4, [r0]
	ldr r1, _0222CF04 ; =0x000003E2
	add r0, r4, #0
	add r0, #0x64
	bl WaitingIcon_New
	str r0, [r4, #0x7c]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222CF04: .word 0x000003E2
	thumb_func_end ov80_0222CEF0

	thumb_func_start ov80_0222CF08
ov80_0222CF08: ; 0x0222CF08
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x7c]
	bl sub_0200F450
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CF08

	thumb_func_start ov80_0222CF18
ov80_0222CF18: ; 0x0222CF18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferItemName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222CF18

	thumb_func_start ov80_0222CF38
ov80_0222CF38: ; 0x0222CF38
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r6, r0, #0
	bl ov80_0222CF6C
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	add r2, r6, #0
	bl BufferIntegerAsString
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CF38

	thumb_func_start ov80_0222CF6C
ov80_0222CF6C: ; 0x0222CF6C
	push {r4, lr}
	mov r1, #0xa
	add r4, r0, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CF7E
	mov r0, #1
	pop {r4, pc}
_0222CF7E:
	add r0, r4, #0
	mov r1, #0x64
	bl _u32_div_f
	cmp r0, #0
	bne _0222CF8E
	mov r0, #2
	pop {r4, pc}
_0222CF8E:
	mov r1, #0xfa
	add r0, r4, #0
	lsl r1, r1, #2
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFA0
	mov r0, #3
	pop {r4, pc}
_0222CFA0:
	ldr r1, _0222CFF4 ; =0x00002710
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFB0
	mov r0, #4
	pop {r4, pc}
_0222CFB0:
	ldr r1, _0222CFF8 ; =0x000186A0
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFC0
	mov r0, #5
	pop {r4, pc}
_0222CFC0:
	ldr r1, _0222CFFC ; =0x000F4240
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFD0
	mov r0, #6
	pop {r4, pc}
_0222CFD0:
	ldr r1, _0222D000 ; =0x00989680
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFE0
	mov r0, #7
	pop {r4, pc}
_0222CFE0:
	ldr r1, _0222D004 ; =0x05F5E100
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFF0
	mov r0, #8
	pop {r4, pc}
_0222CFF0:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222CFF4: .word 0x00002710
_0222CFF8: .word 0x000186A0
_0222CFFC: .word 0x000F4240
_0222D000: .word 0x00989680
_0222D004: .word 0x05F5E100
	thumb_func_end ov80_0222CF6C

	thumb_func_start ov80_0222D008
ov80_0222D008: ; 0x0222D008
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldr r0, [r0, #8]
	ldrb r4, [r2]
	bl Save_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferPlayersName
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D008

	thumb_func_start ov80_0222D034
ov80_0222D034: ; 0x0222D034
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r5, #0x1c]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r4, [r1]
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferPlayersName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D034

	thumb_func_start ov80_0222D064
ov80_0222D064: ; 0x0222D064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferMoveName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D064

	thumb_func_start ov80_0222D084
ov80_0222D084: ; 0x0222D084
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	ldr r1, [r5, #0x1c]
	str r0, [sp, #8]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r4, [r1]
	add r0, r7, #0
	mov r1, #0xb
	bl ov80_0222D0D4
	add r7, r0, #0
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, [sp, #8]
	ldr r0, [r0, #0x44]
	add r1, r6, #0
	add r2, r7, #0
	bl BufferString
	add r0, r7, #0
	bl String_Delete
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D084

	thumb_func_start ov80_0222D0D4
ov80_0222D0D4: ; 0x0222D0D4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r3, r1, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D0D4

	thumb_func_start ov80_0222D0F8
ov80_0222D0F8: ; 0x0222D0F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferTypeName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D0F8

	thumb_func_start ov80_0222D118
ov80_0222D118: ; 0x0222D118
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r4, #0x1c]
	add r2, r0, #0
	add r0, r1, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	ldrb r1, [r1]
	ldr r0, [r0, #0x44]
	ldr r2, [r2, #8]
	bl BufferRivalsName
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222D118

	thumb_func_start ov80_0222D13C
ov80_0222D13C: ; 0x0222D13C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Save_FrontierData_Get
	mov r1, #0
	add r2, r1, #0
	bl FrontierData_BattlePointAction
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D13C

	thumb_func_start ov80_0222D168
ov80_0222D168: ; 0x0222D168
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Save_GameStats_Get
	mov r1, #0x45
	add r2, r5, #0
	bl GameStats_Add
	ldr r0, [r4, #8]
	bl Save_FrontierData_Get
	add r1, r5, #0
	mov r2, #5
	bl FrontierData_BattlePointAction
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D168

	thumb_func_start ov80_0222D1A0
ov80_0222D1A0: ; 0x0222D1A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Save_GameStats_Get
	mov r1, #0x46
	add r2, r5, #0
	bl GameStats_Add
	ldr r0, [r4, #8]
	bl Save_FrontierData_Get
	add r1, r5, #0
	mov r2, #6
	bl FrontierData_BattlePointAction
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D1A0

	thumb_func_start ov80_0222D1D8
ov80_0222D1D8: ; 0x0222D1D8
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037AC0
	ldr r1, _0222D1FC ; =ov80_0222D200
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222D1FC: .word ov80_0222D200
	thumb_func_end ov80_0222D1D8

	thumb_func_start ov80_0222D200
ov80_0222D200: ; 0x0222D200
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037454
	cmp r0, #2
	bge _0222D210
	mov r0, #1
	pop {r4, pc}
_0222D210:
	add r4, #0x78
	ldrh r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D200

	thumb_func_start ov80_0222D220
ov80_0222D220: ; 0x0222D220
	push {r3, lr}
	bl sub_02037BEC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D220

	thumb_func_start ov80_0222D22C
ov80_0222D22C: ; 0x0222D22C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02058284
	ldr r1, _0222D240 ; =ov80_0222D244
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222D240: .word ov80_0222D244
	thumb_func_end ov80_0222D22C

	thumb_func_start ov80_0222D244
ov80_0222D244: ; 0x0222D244
	push {r3, lr}
	bl sub_02037D78
	cmp r0, #1
	beq _0222D25A
	bl sub_02035650
	cmp r0, #1
	beq _0222D25A
	mov r0, #1
	pop {r3, pc}
_0222D25A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D244

	thumb_func_start ov80_0222D260
ov80_0222D260: ; 0x0222D260
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r4, r0, #0
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	strh r1, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D260

	thumb_func_start ov80_0222D284
ov80_0222D284: ; 0x0222D284
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl SaveArray_Party_Get
	bl HealParty
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222D284

	thumb_func_start ov80_0222D29C
ov80_0222D29C: ; 0x0222D29C
	push {r3, lr}
	ldr r1, _0222D2A8 ; =ov80_0222D2AC
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222D2A8: .word ov80_0222D2AC
	thumb_func_end ov80_0222D29C

	thumb_func_start ov80_0222D2AC
ov80_0222D2AC: ; 0x0222D2AC
	push {r3, lr}
	ldr r0, _0222D2C8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222D2C0
	bl System_GetTouchNew
	cmp r0, #0
	beq _0222D2C4
_0222D2C0:
	mov r0, #1
	pop {r3, pc}
_0222D2C4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0222D2C8: .word gSystem
	thumb_func_end ov80_0222D2AC

	thumb_func_start ov80_0222D2CC
ov80_0222D2CC: ; 0x0222D2CC
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222D2E8 ; =ov80_0222D2EC
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222D2E8: .word ov80_0222D2EC
	thumb_func_end ov80_0222D2CC

	thumb_func_start ov80_0222D2EC
ov80_0222D2EC: ; 0x0222D2EC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222D324 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222D302
	bl System_GetTouchNew
	cmp r0, #0
	beq _0222D306
_0222D302:
	mov r0, #1
	pop {r4, pc}
_0222D306:
	add r0, r4, #0
	add r0, #0x78
	ldrh r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x78
	add r4, #0x78
	strh r1, [r0]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0222D320
	mov r0, #1
	pop {r4, pc}
_0222D320:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222D324: .word gSystem
	thumb_func_end ov80_0222D2EC

	thumb_func_start ov80_0222D328
ov80_0222D328: ; 0x0222D328
	push {r3, lr}
	bl ov80_0222BDF4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D328

	thumb_func_start ov80_0222D334
ov80_0222D334: ; 0x0222D334
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_VarsFlags_Get
	add r1, r6, #0
	bl GetVarAddr
	strh r4, [r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222D334

	thumb_func_start ov80_0222D360
ov80_0222D360: ; 0x0222D360
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_VarsFlags_Get
	add r1, r6, #0
	bl GetVarAddr
	ldrh r0, [r0]
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D360

	thumb_func_start ov80_0222D390
ov80_0222D390: ; 0x0222D390
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222D3A2
	cmp r0, #1
	beq _0222D3BE
	b _0222D3F0
_0222D3A2:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r4, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D3FE
_0222D3BE:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D3FE
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #0xc
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x20
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D3FE
_0222D3F0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222D3FE
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0222D3FE:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov80_0222D390

	thumb_func_start ov80_0222D404
ov80_0222D404: ; 0x0222D404
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _0222D4CC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D41C: ; jump table
	.short _0222D424 - _0222D41C - 2 ; case 0
	.short _0222D440 - _0222D41C - 2 ; case 1
	.short _0222D49A - _0222D41C - 2 ; case 2
	.short _0222D4B2 - _0222D41C - 2 ; case 3
_0222D424:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r4, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D440:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D51A
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	str r0, [r4, #0x28]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	mov r2, #1
	bl AddWindowParameterized
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r2, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	bl sub_02003D5C
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	mov r0, #0xb
	bl ov80_0223AF30
	str r0, [r4, #0x2c]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0222D49A:
	mov r0, #0xf
	str r0, [sp]
	mov r1, #1
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x28]
	add r2, r1, #0
	bl ov80_0223AF80
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D4B2:
	ldr r0, [r4, #0x2c]
	bl ov80_0223AFC4
	add r5, r0, #0
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	cmp r5, #0
	beq _0222D51A
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D4CC:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222D51A
	ldr r0, [r4, #0x2c]
	bl ov80_0223AF60
	ldr r0, [r4, #0x28]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r4, #0x28]
	bl RemoveWindow
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl WindowArray_Delete
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xb
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, pc}
_0222D51A:
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_0222D404

	thumb_func_start ov80_0222D520
ov80_0222D520: ; 0x0222D520
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _0222D5E8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D538: ; jump table
	.short _0222D540 - _0222D538 - 2 ; case 0
	.short _0222D55C - _0222D538 - 2 ; case 1
	.short _0222D5B6 - _0222D538 - 2 ; case 2
	.short _0222D5CE - _0222D538 - 2 ; case 3
_0222D540:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r4, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D55C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D636
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	str r0, [r4, #0x28]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	mov r2, #1
	bl AddWindowParameterized
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r2, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	bl sub_02003D5C
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	mov r0, #0xb
	bl ov80_0223AF30
	str r0, [r4, #0x2c]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0222D5B6:
	mov r0, #0xf
	str r0, [sp]
	mov r1, #1
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x28]
	add r2, r1, #0
	bl ov80_0223AF80
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D5CE:
	ldr r0, [r4, #0x2c]
	bl ov80_0223B1D4
	add r5, r0, #0
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	cmp r5, #0
	beq _0222D636
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D5E8:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222D636
	ldr r0, [r4, #0x2c]
	bl ov80_0223AF60
	ldr r0, [r4, #0x28]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r4, #0x28]
	bl RemoveWindow
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl WindowArray_Delete
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xb
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, pc}
_0222D636:
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_0222D520

	thumb_func_start ov80_0222D63C
ov80_0222D63C: ; 0x0222D63C
	lsl r1, r1, #0x10
	orr r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222D63C

	thumb_func_start ov80_0222D644
ov80_0222D644: ; 0x0222D644
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r1, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0]
	ldr r7, [r4, #0x24]
	bl GetBgHOffset
	str r0, [sp, #0x20]
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0]
	bl GetBgHOffset
	str r0, [sp, #0x1c]
	ldr r0, [r4]
	mov r1, #3
	ldr r0, [r0]
	bl GetBgHOffset
	str r0, [sp, #0x18]
	ldr r0, [r4]
	mov r1, #3
	ldr r0, [r0]
	bl GetBgHOffset
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x10]
	cmp r0, #1
	beq _0222D686
	b _0222D7F6
_0222D686:
	mov r0, #6
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B60C
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x28]
	add r4, r7, #0
_0222D698:
	mov r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	ldrsh r6, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	blt _0222D6AA
	b _0222D7CE
_0222D6AA:
	ldr r0, [sp, #0x24]
	lsl r1, r6, #5
	add r5, r0, r1
_0222D6B0:
	mov r2, #1
	mov r0, #0
	lsl r2, r2, #0xc
	str r0, [sp]
	add r0, sp, #0x2c
	mov r1, #0
	add r3, r2, #0
	bl MTX22_2DAffine
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x20]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D704
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D730
_0222D704:
	cmp r2, #1
	bne _0222D730
	cmp r0, #0
	bge _0222D716
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D716:
	cmp r1, #0
	bge _0222D720
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D720:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D730:
	str r0, [sp]
	mov r2, #0
	str r1, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D782
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D7AE
_0222D782:
	cmp r2, #1
	bne _0222D7AE
	cmp r0, #0
	bge _0222D794
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D794:
	cmp r1, #0
	bge _0222D79E
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D79E:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D7AE:
	str r0, [sp]
	add r0, r5, #0
	mov r2, #0
	str r1, [sp, #4]
	add r0, #0x10
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #2
	ldrsh r0, [r4, r0]
	add r6, r6, #1
	add r5, #0x20
	cmp r6, r0
	bge _0222D7CE
	b _0222D6B0
_0222D7CE:
	ldr r0, [sp, #0x28]
	add r4, #0x10
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #0x60
	bge _0222D7DC
	b _0222D698
_0222D7DC:
	mov r0, #6
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B5E8
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, [sp, #8]
	bl DestroySysTask
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_0222D7F6:
	mov r0, #6
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B60C
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
	add r4, r7, #0
_0222D808:
	mov r0, #8
	ldrsh r1, [r4, r0]
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #8]
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	mov r0, #6
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #0xa]
	mov r0, #0
	ldrsh r6, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	blt _0222D82E
	b _0222D952
_0222D82E:
	ldr r0, [sp, #0x10]
	lsl r1, r6, #5
	add r5, r0, r1
_0222D834:
	mov r2, #1
	mov r0, #0
	lsl r2, r2, #0xc
	str r0, [sp]
	add r0, sp, #0x2c
	mov r1, #0
	add r3, r2, #0
	bl MTX22_2DAffine
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x20]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D888
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D8B4
_0222D888:
	cmp r2, #1
	bne _0222D8B4
	cmp r0, #0
	bge _0222D89A
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D89A:
	cmp r1, #0
	bge _0222D8A4
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D8A4:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D8B4:
	str r0, [sp]
	mov r2, #0
	str r1, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D906
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D932
_0222D906:
	cmp r2, #1
	bne _0222D932
	cmp r0, #0
	bge _0222D918
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D918:
	cmp r1, #0
	bge _0222D922
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D922:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D932:
	str r0, [sp]
	add r0, r5, #0
	mov r2, #0
	str r1, [sp, #4]
	add r0, #0x10
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #2
	ldrsh r0, [r4, r0]
	add r6, r6, #1
	add r5, #0x20
	cmp r6, r0
	bge _0222D952
	b _0222D834
_0222D952:
	ldr r0, [sp, #0xc]
	add r4, #0x10
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x60
	bge _0222D960
	b _0222D808
_0222D960:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D964: .word 0x00000604
	thumb_func_end ov80_0222D644

	thumb_func_start ov80_0222D968
ov80_0222D968: ; 0x0222D968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222D97E
	cmp r0, #1
	beq _0222D99A
	cmp r0, #2
	beq _0222DA54
	b _0222DA8E
_0222D97E:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r5, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222D99A:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0222DA94
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r5, #0x10]
	ldr r1, _0222DA9C ; =0x00000608
	mov r0, #0x65
	bl AllocFromHeap
	ldr r1, _0222DAA0 ; =0x00000604
	str r0, [r5, #0x24]
	mov r2, #1
	str r2, [r0, r1]
	ldr r0, _0222DAA4 ; =0x04000020
	add r1, sp, #4
	mov r2, #0x65
	bl ov80_0223B544
	mov r7, #0
	mov r1, #6
	ldr r2, [r5, #0x24]
	lsl r1, r1, #8
	str r0, [r2, r1]
	add r6, r7, #0
	add r4, r7, #0
_0222D9D6:
	ldr r0, [r5, #0x24]
	strh r6, [r0, r4]
	ldr r1, [r5, #0x24]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	add r1, r1, #2
	strh r1, [r0, #2]
	mov r0, #0x31
	sub r2, r0, r7
	lsr r1, r2, #0x1f
	lsl r3, r2, #0x1d
	sub r3, r3, r1
	mov r0, #0x1d
	ror r3, r0
	add r0, r1, r3
	ldr r1, [r5, #0x24]
	add r1, r1, r4
	strh r0, [r1, #4]
	asr r0, r2, #1
	lsr r0, r0, #0x1e
	add r0, r2, r0
	asr r1, r0, #2
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r1, [r0, #6]
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #8]
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #0xa]
	add r1, r0, #0
	bl ov80_0222D63C
	ldr r1, [r5, #0x24]
	add r7, r7, #1
	add r1, r1, r4
	str r0, [r1, #0xc]
	add r6, r6, #2
	add r4, #0x10
	cmp r7, #0x60
	blt _0222D9D6
	mov r0, #1
	str r0, [sp]
	mov r0, #0x28
	add r1, r0, #0
	sub r1, #0x38
	mov r2, #0
	mov r3, #0x1e
	bl StartBrightnessTransition
	mov r2, #1
	ldr r0, _0222DAA8 ; =ov80_0222D644
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222DA54:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #0
	beq _0222DA94
	mov r0, #1
	str r0, [r5, #0x10]
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r5]
	mov r2, #0
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	mov r1, #3
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222DA8E:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222DA94:
	mov r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222DA9C: .word 0x00000608
_0222DAA0: .word 0x00000604
_0222DAA4: .word 0x04000020
_0222DAA8: .word ov80_0222D644
	thumb_func_end ov80_0222D968

	thumb_func_start ov80_0222DAAC
ov80_0222DAAC: ; 0x0222DAAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222DAC2
	cmp r0, #1
	beq _0222DADE
	cmp r0, #2
	beq _0222DBBC
	b _0222DBF6
_0222DAC2:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r5, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DADE:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0222DAE6
	b _0222DBFC
_0222DAE6:
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r5, #0x10]
	ldr r1, _0222DC04 ; =0x00000608
	mov r0, #0x65
	bl AllocFromHeap
	ldr r1, _0222DC08 ; =0x00000604
	str r0, [r5, #0x24]
	mov r2, #2
	str r2, [r0, r1]
	ldr r0, _0222DC0C ; =0x04000020
	add r1, sp, #4
	mov r2, #0x65
	bl ov80_0223B544
	mov r6, #0
	mov r1, #6
	ldr r2, [r5, #0x24]
	lsl r1, r1, #8
	str r0, [r2, r1]
	add r7, r6, #0
	add r4, r6, #0
_0222DB1C:
	ldr r0, [r5, #0x24]
	lsr r2, r6, #0x1f
	strh r7, [r0, r4]
	ldr r1, [r5, #0x24]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	add r1, r1, #2
	strh r1, [r0, #2]
	mov r0, #0x30
	sub r1, r0, r6
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	add r1, r0, #1
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r1, [r0, #4]
	lsl r1, r6, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _0222DB5A
	ldr r0, [r5, #0x24]
	mov r1, #4
	add r0, r0, r4
	ldrsh r2, [r0, r1]
	sub r1, r1, #5
	mul r1, r2
	strh r1, [r0, #4]
_0222DB5A:
	cmp r6, #0x30
	bge _0222DB66
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r6, [r0, #6]
	b _0222DB70
_0222DB66:
	mov r0, #0x60
	sub r1, r0, r6
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r1, [r0, #6]
_0222DB70:
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #8]
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #0xa]
	add r1, r0, #0
	bl ov80_0222D63C
	ldr r1, [r5, #0x24]
	add r6, r6, #1
	add r1, r1, r4
	str r0, [r1, #0xc]
	add r7, r7, #2
	add r4, #0x10
	cmp r6, #0x60
	blt _0222DB1C
	mov r0, #1
	str r0, [sp]
	mov r0, #0x28
	add r1, r0, #0
	sub r1, #0x38
	mov r2, #0
	mov r3, #0x1c
	bl StartBrightnessTransition
	mov r2, #1
	ldr r0, _0222DC10 ; =ov80_0222D644
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DBBC:
	mov r0, #1
	bl IsBrightnessTransitionActive
	cmp r0, #0
	beq _0222DBFC
	mov r0, #1
	str r0, [r5, #0x10]
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r5]
	mov r2, #0
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	mov r1, #3
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DBF6:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222DBFC:
	mov r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222DC04: .word 0x00000608
_0222DC08: .word 0x00000604
_0222DC0C: .word 0x04000020
_0222DC10: .word ov80_0222D644
	thumb_func_end ov80_0222DAAC

	thumb_func_start ov80_0222DC14
ov80_0222DC14: ; 0x0222DC14
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222DC26
	cmp r0, #1
	beq _0222DC38
	b _0222DC62
_0222DC26:
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0x65
	bl ov80_0223B424
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222DC62
_0222DC38:
	mov r0, #0x12
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0x19
	lsl r0, r0, #4
	str r0, [sp, #4]
	ldr r0, _0222DC68 ; =0x0400001C
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	add r0, r4, #0
	ldr r3, _0222DC6C ; =0x000002AA
	add r0, #0x18
	mov r2, #0xbf
	bl ov80_0223B440
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0222DC62:
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0222DC68: .word 0x0400001C
_0222DC6C: .word 0x000002AA
	thumb_func_end ov80_0222DC14

	thumb_func_start ov80_0222DC70
ov80_0222DC70: ; 0x0222DC70
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r0, r5, #0
	bl ov80_0222BE10
	add r1, r5, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222DCE8 ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r0, #0xb
	mov r1, #0x30
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0x78
	ldrh r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r5]
	bl ov80_0222AB34
	str r0, [r4]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	bl sub_02096818
	ldr r1, _0222DCEC ; =ov80_0222DCF0
	add r0, r5, #0
	bl ov80_0222AB84
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r2, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	bl sub_02003D5C
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222DCE8: .word 0x0000045D
_0222DCEC: .word ov80_0222DCF0
	thumb_func_end ov80_0222DC70

	thumb_func_start ov80_0222DCF0
ov80_0222DCF0: ; 0x0222DCF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r1, [r4, #8]
	lsl r2, r1, #2
	ldr r1, _0222DD38 ; =ov80_0223B9EC
	ldr r1, [r1, r2]
	blx r1
	add r6, r0, #0
	bne _0222DD2C
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [r5]
	ldr r1, [r4, #0x14]
	ldr r0, [r0]
	bl sub_02096818
	add r0, r4, #0
	bl FreeToHeap
_0222DD2C:
	cmp r6, #0
	bne _0222DD34
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222DD34:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222DD38: .word ov80_0223B9EC
	thumb_func_end ov80_0222DCF0

	thumb_func_start ov80_0222DD3C
ov80_0222DD3C: ; 0x0222DD3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _0222DD60
	mov r0, #0
	b _0222DD62
_0222DD60:
	mov r0, #0x61
_0222DD62:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222DD3C

	thumb_func_start ov80_0222DD68
ov80_0222DD68: ; 0x0222DD68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r3, r0, #0
	ldr r0, [r4, #0x10]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_022399A4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222DD68

	thumb_func_start ov80_0222DD9C
ov80_0222DD9C: ; 0x0222DD9C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	ldr r0, [r5, #0x10]
	bl ov80_02239A1C
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222DD9C

	thumb_func_start ov80_0222DDBC
ov80_0222DDBC: ; 0x0222DDBC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	bl ov80_02239A60
	mov r2, #0
	add r1, r4, #0
	add r3, r2, #0
	bl sub_02015494
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222DDBC

	thumb_func_start ov80_0222DDF0
ov80_0222DDF0: ; 0x0222DDF0
	push {r3, lr}
	ldr r1, _0222DDFC ; =ov80_0222DE00
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222DDFC: .word ov80_0222DE00
	thumb_func_end ov80_0222DDF0

	thumb_func_start ov80_0222DE00
ov80_0222DE00: ; 0x0222DE00
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0209680C
	ldr r0, [r0, #0x10]
	bl ov80_02239A74
	cmp r0, #1
	bne _0222DE18
	mov r0, #1
	pop {r3, pc}
_0222DE18:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222DE00

	thumb_func_start ov80_0222DE1C
ov80_0222DE1C: ; 0x0222DE1C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, #0xa4
	ldr r0, [r0]
	add r5, #0xa4
	cmp r0, #0
	beq _0222DE3E
	bl GF_AssertFail
	ldr r0, [r5]
	bl DestroySysTask
_0222DE3E:
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	str r0, [sp]
	add r0, r4, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	strh r6, [r5, #4]
	ldr r0, [sp]
	strh r7, [r5, #6]
	strb r0, [r5, #9]
	ldr r0, _0222DE84 ; =ov80_0222F4F0
	ldr r2, _0222DE88 ; =0x00011170
	add r1, r5, #0
	strb r4, [r5, #0xa]
	bl CreateSysTask
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DE84: .word ov80_0222F4F0
_0222DE88: .word 0x00011170
	thumb_func_end ov80_0222DE1C

	thumb_func_start ov80_0222DE8C
ov80_0222DE8C: ; 0x0222DE8C
	push {r3, lr}
	ldr r1, _0222DE98 ; =ov80_0222DE9C
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222DE98: .word ov80_0222DE9C
	thumb_func_end ov80_0222DE8C

	thumb_func_start ov80_0222DE9C
ov80_0222DE9C: ; 0x0222DE9C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0209680C
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _0222DEB2
	mov r0, #1
	pop {r3, pc}
_0222DEB2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DE9C

	thumb_func_start ov80_0222DEB8
ov80_0222DEB8: ; 0x0222DEB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, #0xb0
	ldr r0, [r0]
	add r4, #0xb0
	cmp r0, #0
	beq _0222DEDA
	bl GF_AssertFail
	ldr r0, [r4]
	bl DestroySysTask
_0222DEDA:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #4]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #6]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #7]
	add r0, r5, #0
	bl ov80_0222BE10
	strh r0, [r4, #8]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #0xa]
	mov r2, #0x4b
	ldr r0, _0222DF28 ; =ov80_0222F53C
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222DF28: .word ov80_0222F53C
	thumb_func_end ov80_0222DEB8

	thumb_func_start ov80_0222DF2C
ov80_0222DF2C: ; 0x0222DF2C
	push {r3, lr}
	ldr r1, _0222DF38 ; =ov80_0222DF3C
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222DF38: .word ov80_0222DF3C
	thumb_func_end ov80_0222DF2C

	thumb_func_start ov80_0222DF3C
ov80_0222DF3C: ; 0x0222DF3C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0209680C
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222DF52
	mov r0, #1
	pop {r3, pc}
_0222DF52:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DF3C

	thumb_func_start ov80_0222DF58
ov80_0222DF58: ; 0x0222DF58
	push {r3, lr}
	bl ov80_0222AC58
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DF58

	thumb_func_start ov80_0222DF64
ov80_0222DF64: ; 0x0222DF64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ov80_0222AC58
	add r0, r5, #0
	bl ov80_0222AC58
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl SaveArray_Party_Get
	ldr r1, [sp, #0x18]
	bl Party_GetMonByIndex
	str r4, [sp]
	add r1, r0, #0
	str r6, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	add r0, r7, #0
	mov r2, #0xb
	bl ov80_0222F030
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222DF64

	thumb_func_start ov80_0222DFD4
ov80_0222DFD4: ; 0x0222DFD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222F1D0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DFD4

	thumb_func_start ov80_0222DFF4
ov80_0222DFF4: ; 0x0222DFF4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, sp, #0x10
	add r6, r0, #0
	add r0, r4, #0
	add r1, #2
	add r2, sp, #0x10
	bl ov80_022398E4
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x78
	str r0, [sp, #4]
	mov r0, #2
	ldrsh r0, [r1, r0]
	str r0, [sp, #8]
	mov r0, #0
	ldrsh r0, [r1, r0]
	str r0, [sp, #0xc]
	ldr r1, [r4]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	add r0, r6, #0
	bl ov80_0223A00C
	ldr r1, _0222E054 ; =0x0000047B
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	ldr r1, _0222E058 ; =ov80_0222E05C
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222E054: .word 0x0000047B
_0222E058: .word ov80_0222E05C
	thumb_func_end ov80_0222DFF4

	thumb_func_start ov80_0222E05C
ov80_0222E05C: ; 0x0222E05C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, #0x78
	ldrh r0, [r4]
	cmp r0, #1
	bne _0222E074
	mov r0, #1
	pop {r4, pc}
_0222E074:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222E05C

	thumb_func_start ov80_0222E078
ov80_0222E078: ; 0x0222E078
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_GameStats_Get
	add r1, r4, #0
	bl GameStats_Inc
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E078

	thumb_func_start ov80_0222E09C
ov80_0222E09C: ; 0x0222E09C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_GameStats_Get
	add r1, r4, #0
	add r2, r6, #0
	bl GameStats_Add
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222E09C

	thumb_func_start ov80_0222E0C8
ov80_0222E0C8: ; 0x0222E0C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_GameStats_Get
	add r1, r4, #0
	bl GameStats_AddSpecial
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E0C8

	thumb_func_start ov80_0222E0EC
ov80_0222E0EC: ; 0x0222E0EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_0205C298
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E0EC

	thumb_func_start ov80_0222E10C
ov80_0222E10C: ; 0x0222E10C
	push {r4, lr}
	bl ov80_0222BDF4
	add r4, r0, #0
	bl sub_020304B4
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E10C

	thumb_func_start ov80_0222E120
ov80_0222E120: ; 0x0222E120
	push {r4, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_0202C6F4
	add r4, r0, #0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202C4B0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E120

	thumb_func_start ov80_0222E144
ov80_0222E144: ; 0x0222E144
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_020270C4
	add r0, r4, #0
	bl ov80_0222BE10
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222E144

	thumb_func_start ov80_0222E160
ov80_0222E160: ; 0x0222E160
	push {r3, lr}
	bl ov80_0222BE10
	bl sub_020378E4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E160

	thumb_func_start ov80_0222E170
ov80_0222E170: ; 0x0222E170
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037AC0
	ldr r1, _0222E194 ; =ov80_0222E198
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222E194: .word ov80_0222E198
	thumb_func_end ov80_0222E170

	thumb_func_start ov80_0222E198
ov80_0222E198: ; 0x0222E198
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02037454
	cmp r0, #2
	bge _0222E1A8
	mov r4, #1
	b _0222E1B8
_0222E1A8:
	add r0, r5, #0
	add r0, #0x78
	ldrh r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	add r4, r0, #0
_0222E1B8:
	cmp r4, #0
	bne _0222E210
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r6, r0, #0
	beq _0222E210
	add r0, #0x6f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222E210
	add r0, r6, #0
	add r0, #0x74
	ldrh r1, [r0]
	cmp r1, #1
	beq _0222E1E0
	ldr r0, _0222E214 ; =0x0000FFFE
	cmp r1, r0
	bne _0222E1EA
_0222E1E0:
	ldr r0, [r5]
	mov r4, #1
	add r0, #0x39
	strb r4, [r0]
	b _0222E210
_0222E1EA:
	cmp r1, #0
	bne _0222E210
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	bl PlayerProfile_GetVersion
	cmp r0, #0xc
	bne _0222E210
	add r0, r6, #0
	mov r1, #0
	add r0, #0x6f
	strb r1, [r0]
	add r0, r6, #0
	bl sub_02096BF8
_0222E210:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222E214: .word 0x0000FFFE
	thumb_func_end ov80_0222E198

	thumb_func_start ov80_0222E218
ov80_0222E218: ; 0x0222E218
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BDF4
	ldr r1, [r4]
	add r1, #0x39
	ldrb r1, [r1]
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0222E218

	thumb_func_start ov80_0222E22C
ov80_0222E22C: ; 0x0222E22C
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x39
	strb r1, [r0]
	mov r0, #1
	bx lr
	thumb_func_end ov80_0222E22C

	thumb_func_start ov80_0222E238
ov80_0222E238: ; 0x0222E238
	push {r3, lr}
	ldr r2, [r0, #0x1c]
	ldr r3, [r0]
	add r1, r2, #1
	str r1, [r0, #0x1c]
	ldrb r1, [r2]
	ldr r0, [r3, #0x60]
	bl ov80_0222F5D0
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E238

	thumb_func_start ov80_0222E250
ov80_0222E250: ; 0x0222E250
	push {r3, lr}
	ldr r2, [r0, #0x1c]
	ldr r3, [r0]
	add r1, r2, #1
	str r1, [r0, #0x1c]
	ldrb r1, [r2]
	ldr r0, [r3, #0x60]
	bl ov80_0222F5EC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E250

	thumb_func_start ov80_0222E268
ov80_0222E268: ; 0x0222E268
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	ldr r4, [sp, #0x20]
	bl ov80_0222E2B8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_0222E328
	cmp r4, #0
	bne _0222E2A2
	add r0, r5, #0
	bl ov80_0222AB34
	ldr r0, [r0, #8]
	bl sub_02096808
	ldr r0, [r0, #4]
	bl Options_GetTextFrameDelay
	add r2, r0, #0
	mov r0, #0
	mov r1, #1
	b _0222E2A8
_0222E2A2:
	ldrb r2, [r4]
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
_0222E2A8:
	str r0, [sp]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov80_0222E344
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E268

	thumb_func_start ov80_0222E2B8
ov80_0222E2B8: ; 0x0222E2B8
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl ov80_0222AB34
	add r1, r4, #0
	add r1, #0x5a
	ldrb r1, [r1]
	cmp r1, #0
	bne _0222E310
	mov r1, #0x13
	str r1, [sp]
	mov r1, #0x1b
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r1, #0xd
	str r1, [sp, #0xc]
	ldr r1, _0222E320 ; =0x0000036D
	mov r2, #1
	str r1, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r0]
	add r1, #0x64
	mov r3, #2
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	ldr r2, _0222E324 ; =0x000003E2
	add r0, #0x64
	mov r1, #0
	mov r3, #0xb
	bl DrawFrameAndWindow2
	mov r0, #1
	add r4, #0x5a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, pc}
_0222E310:
	add r4, #0x64
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0222E320: .word 0x0000036D
_0222E324: .word 0x000003E2
	thumb_func_end ov80_0222E2B8

	thumb_func_start ov80_0222E328
ov80_0222E328: ; 0x0222E328
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, [r4, #0x4c]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	ldr r2, [r4, #0x4c]
	bl StringExpandPlaceholders
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E328

	thumb_func_start ov80_0222E344
ov80_0222E344: ; 0x0222E344
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r3, #0
	add r6, r1, #0
	add r4, r2, #0
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [sp, #0x20]
	bl sub_02002B50
	cmp r4, #0
	beq _0222E362
	cmp r4, #0xff
	bne _0222E36A
_0222E362:
	mov r0, #0
	bl sub_02002B8C
	b _0222E370
_0222E36A:
	mov r0, #1
	bl sub_02002B8C
_0222E370:
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x48]
	add r0, #0x64
	add r1, r6, #0
	bl AddTextPrinterParameterized
	add r5, #0x50
	strb r0, [r5]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov80_0222E344

	thumb_func_start ov80_0222E38C
ov80_0222E38C: ; 0x0222E38C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0222E39C
	bl GF_AssertFail
_0222E39C:
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x64
	bl RemoveWindow
	mov r0, #0
	add r4, #0x5a
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E38C

	thumb_func_start ov80_0222E3B8
ov80_0222E3B8: ; 0x0222E3B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov80_0222E2B8
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r6, #0
	add r2, r7, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	ldr r0, [r5, #0x48]
	bl ov80_0222E400
	add r0, sp, #8
	ldrb r3, [r0, #0x18]
	cmp r3, #0xff
	beq _0222E3F0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl ov80_0222E344
	pop {r3, r4, r5, r6, r7, pc}
_0222E3F0:
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	str r2, [sp]
	bl ov80_0222E344
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E3B8

	thumb_func_start ov80_0222E400
ov80_0222E400: ; 0x0222E400
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r0, sp, #0
	add r7, r3, #0
	bl MailMsg_Init
	add r0, sp, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MailMsg_SetMsgBankAndNum
	add r0, sp, #0
	mov r1, #0
	add r2, r7, #0
	bl MailMsg_SetFieldI
	add r2, sp, #0x10
	ldrh r2, [r2, #0x10]
	add r0, sp, #0
	mov r1, #1
	bl MailMsg_SetFieldI
	add r0, sp, #0
	mov r1, #0x20
	bl MailMsg_GetExpandedString
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl String_Copy
	add r0, r4, #0
	bl String_Delete
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E400

	thumb_func_start ov80_0222E450
ov80_0222E450: ; 0x0222E450
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldr r1, [sp, #0x28]
	add r7, r0, #0
	add r4, r2, #0
	add r5, r3, #0
	cmp r1, #0
	bne _0222E47E
	ldr r3, [r7, #0x34]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbf
	bl NewMsgDataFromNarc
	add r1, r6, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r6, #0
	add r0, #0x97
	ldrb r1, [r0]
	mov r0, #2
	orr r1, r0
	b _0222E48E
_0222E47E:
	add r0, r6, #0
	add r0, #0x8c
	str r1, [r0]
	add r0, r6, #0
	add r0, #0x97
	ldrb r1, [r0]
	mov r0, #2
	bic r1, r0
_0222E48E:
	add r0, r6, #0
	add r0, #0x97
	strb r1, [r0]
	add r0, r6, #0
	ldr r1, [sp, #0x24]
	add r0, #0x90
	str r1, [r0]
	add r0, r6, #0
	ldr r1, [sp, #0x20]
	str r7, [r6]
	add r0, #0xa0
	str r1, [r0]
	add r1, r6, #0
	add r1, #0xa0
	ldr r1, [r1]
	mov r0, #0
	strh r0, [r1]
	add r1, r6, #0
	add r1, #0x97
	ldrb r3, [r1]
	mov r1, #1
	bic r3, r1
	add r1, sp, #8
	ldrb r2, [r1, #0x14]
	mov r1, #1
	and r1, r2
	add r2, r3, #0
	orr r2, r1
	add r1, r6, #0
	add r1, #0x97
	strb r2, [r1]
	add r1, sp, #8
	add r2, r6, #0
	ldrb r1, [r1, #0x10]
	add r2, #0x96
	mov r3, #3
	strb r1, [r2]
	add r2, r6, #0
	add r2, #0x98
	strb r4, [r2]
	add r2, r6, #0
	add r2, #0x99
	strb r5, [r2]
	add r2, r6, #0
	add r2, #0x9b
	strb r0, [r2]
	add r2, r7, #0
	add r2, #0x64
	str r2, [r6, #0x18]
	add r2, r6, #0
	add r2, #0x94
	strb r3, [r2]
	mov r2, #0xb5
	lsl r2, r2, #2
	strh r1, [r6, r2]
	add r3, r6, #0
	add r2, r0, #0
_0222E500:
	add r1, r3, #0
	add r1, #0xb4
	str r2, [r1]
	add r1, r3, #0
	add r1, #0xb8
	add r0, r0, #1
	add r3, #8
	str r2, [r1]
	cmp r0, #0x1c
	blt _0222E500
	add r0, r6, #0
	add r1, r6, #0
	mov r5, #0
	mov r4, #0xff
_0222E51C:
	mov r3, #0x6f
	lsl r3, r3, #2
	str r5, [r0, r3]
	add r3, r3, #4
	str r5, [r0, r3]
	mov r3, #0xa7
	lsl r3, r3, #2
	strh r4, [r1, r3]
	add r2, r2, #1
	add r0, #8
	add r1, r1, #2
	cmp r2, #0x1c
	blt _0222E51C
	add r4, r6, #0
_0222E538:
	ldr r1, [r7, #0x34]
	mov r0, #0x50
	bl String_New
	str r0, [r4, #0x1c]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x1c
	blt _0222E538
	add r6, #0xa0
	ldr r1, _0222E554 ; =0x0000EEEE
	ldr r0, [r6]
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E554: .word 0x0000EEEE
	thumb_func_end ov80_0222E450

	thumb_func_start ov80_0222E558
ov80_0222E558: ; 0x0222E558
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	str r2, [sp, #0x14]
	add r7, r1, #0
	mov r1, #0xb6
	ldr r0, [r5, #0x34]
	lsl r1, r1, #2
	add r4, r3, #0
	bl AllocFromHeap
	add r6, r0, #0
	bne _0222E578
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E578:
	mov r2, #0xb6
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	str r4, [sp]
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	add r1, r6, #0
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl ov80_0222E450
	add r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222E558

	thumb_func_start ov80_0222E5A8
ov80_0222E5A8: ; 0x0222E5A8
	push {r3, lr}
	bl ov80_0222E690
	pop {r3, pc}
	thumb_func_end ov80_0222E5A8

	thumb_func_start ov80_0222E5B0
ov80_0222E5B0: ; 0x0222E5B0
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222E714
	mov r1, #7
	tst r1, r0
	bne _0222E5CE
	lsr r0, r0, #3
	b _0222E5D2
_0222E5CE:
	lsr r0, r0, #3
	add r0, r0, #1
_0222E5D2:
	add r1, r5, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	beq _0222E5EC
	add r1, r5, #0
	add r1, #0x98
	ldrb r1, [r1]
	sub r2, r1, r0
	add r1, r5, #0
	add r1, #0x98
	strb r2, [r1]
_0222E5EC:
	add r1, r5, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	beq _0222E60E
	add r1, r5, #0
	add r1, #0x99
	ldrb r2, [r1]
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	lsl r1, r1, #1
	sub r2, r2, r1
	add r1, r5, #0
	add r1, #0x99
	strb r2, [r1]
_0222E60E:
	add r1, r5, #0
	add r1, #0x99
	ldrb r1, [r1]
	lsl r0, r0, #0x18
	add r3, r5, #0
	str r1, [sp]
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r1, r5, #0
	mov r2, #1
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	add r3, #0x98
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #8
	bl AddWindowParameterized
	add r0, r5, #0
	ldr r2, _0222E688 ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow1
	add r0, r5, #0
	bl ov80_0222E754
	ldr r2, [r5]
	add r1, r5, #0
	add r1, #0x96
	ldr r2, [r2, #0x34]
	add r0, r5, #0
	lsl r2, r2, #0x18
	ldrb r1, [r1]
	add r0, #0xa4
	lsr r2, r2, #0x18
	bl Create2dMenu
	add r1, r5, #0
	add r1, #0xb0
	str r0, [r1]
	add r0, r5, #0
	bl ov80_0222E8FC
	ldr r0, _0222E68C ; =ov80_0222E7C8
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #4]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0222E688: .word 0x000003D9
_0222E68C: .word ov80_0222E7C8
	thumb_func_end ov80_0222E5B0

	thumb_func_start ov80_0222E690
ov80_0222E690: ; 0x0222E690
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	mov r0, #0x50
	ldr r1, [r1, #0x34]
	add r6, r2, #0
	add r7, r3, #0
	bl String_New
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	add r0, r5, #0
	add r0, #0x90
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0x9b
	ldrb r1, [r0]
	lsl r0, r1, #2
	add r0, r5, r0
	lsl r1, r1, #3
	add r1, r5, r1
	ldr r0, [r0, #0x1c]
	add r1, #0xb4
	str r0, [r1]
	add r0, r4, #0
	bl String_Delete
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0xa7
	lsl r0, r0, #2
	strh r6, [r1, r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #3
	add r0, r5, r0
	add r0, #0xb8
	str r7, [r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r5, #0x9b
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E690

	thumb_func_start ov80_0222E714
ov80_0222E714: ; 0x0222E714
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	ble _0222E74C
	add r5, r7, #0
_0222E726:
	add r0, r5, #0
	add r0, #0xb4
	ldr r1, [r0]
	cmp r1, #0
	beq _0222E74C
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	cmp r6, r0
	bhs _0222E73E
	add r6, r0, #0
_0222E73E:
	add r0, r7, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _0222E726
_0222E74C:
	add r6, #0xc
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E714

	thumb_func_start ov80_0222E754
ov80_0222E754: ; 0x0222E754
	add r2, r0, #0
	add r1, r0, #0
	add r2, #0xb4
	add r1, #0xa4
	str r2, [r1]
	add r2, r0, #0
	add r1, r0, #0
	add r2, #8
	add r1, #0xa8
	str r2, [r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xac
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #1
	add r1, #0xad
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x9b
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0xae
	strb r2, [r1]
	add r2, r0, #0
	add r2, #0xaf
	ldrb r3, [r2]
	mov r2, #0xf
	add r1, r0, #0
	bic r3, r2
	add r2, r0, #0
	add r2, #0xaf
	strb r3, [r2]
	add r2, r0, #0
	add r2, #0xaf
	ldrb r3, [r2]
	mov r2, #0x30
	add r1, #0xaf
	bic r3, r2
	add r2, r0, #0
	add r2, #0xaf
	strb r3, [r2]
	add r0, #0x9b
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, #4
	blo _0222E7BE
	mov r0, #0xc0
	bic r2, r0
	mov r0, #0x40
	orr r0, r2
	strb r0, [r1]
	bx lr
_0222E7BE:
	mov r0, #0xc0
	bic r2, r0
	strb r2, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222E754

	thumb_func_start ov80_0222E7C8
ov80_0222E7C8: ; 0x0222E7C8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222E7E4
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	add r5, #0x94
	sub r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
_0222E7E4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222E87E
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl Handle2dMenuInput
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222E814
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222E814
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl Get2dMenuSelection
	add r4, r0, #0
_0222E814:
	ldr r0, _0222E880 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	bne _0222E830
	mov r1, #0x80
	tst r1, r0
	bne _0222E830
	mov r1, #0x20
	tst r1, r0
	bne _0222E830
	mov r1, #0x10
	tst r0, r1
	beq _0222E836
_0222E830:
	add r0, r5, #0
	bl ov80_0222E8FC
_0222E836:
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0222E884 ; =0x0000EEDD
	ldrh r2, [r0]
	cmp r2, r1
	bne _0222E84C
	add r0, r5, #0
	bl ov80_0222E88C
	pop {r3, r4, r5, pc}
_0222E84C:
	mov r1, #1
	mvn r1, r1
	cmp r4, r1
	beq _0222E85C
	add r1, r1, #1
	cmp r4, r1
	beq _0222E87E
	b _0222E876
_0222E85C:
	add r1, r5, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0222E87E
	ldr r1, _0222E888 ; =0x0000FFFE
	strh r1, [r0]
	add r0, r5, #0
	bl ov80_0222E88C
	pop {r3, r4, r5, pc}
_0222E876:
	strh r4, [r0]
	add r0, r5, #0
	bl ov80_0222E88C
_0222E87E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222E880: .word gSystem
_0222E884: .word 0x0000EEDD
_0222E888: .word 0x0000FFFE
	thumb_func_end ov80_0222E7C8

	thumb_func_start ov80_0222E88C
ov80_0222E88C: ; 0x0222E88C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0222E8F8 ; =0x000005DC
	ldr r7, [r6]
	bl PlaySE
	add r0, r6, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #0
	bl Delete2dMenu
	add r0, r6, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_0222E8BE:
	ldr r0, [r5, #0x1c]
	bl String_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x1c
	blt _0222E8BE
	add r0, r6, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222E8E4
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl DestroyMsgData
_0222E8E4:
	ldr r0, [r6, #4]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E8F8: .word 0x000005DC
	thumb_func_end ov80_0222E88C

	thumb_func_start ov80_0222E8FC
ov80_0222E8FC: ; 0x0222E8FC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl Get2dMenuSelection
	lsl r0, r0, #1
	add r1, r4, r0
	mov r0, #0xa7
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	cmp r1, #0xff
	beq _0222E91E
	add r0, r4, #0
	mov r2, #0
	bl ov80_0222EE14
_0222E91E:
	pop {r4, pc}
	thumb_func_end ov80_0222E8FC

	thumb_func_start ov80_0222E920
ov80_0222E920: ; 0x0222E920
	push {r4, lr}
	sub sp, #0x10
	add r4, sp, #8
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #4]
	ldr r4, [sp, #0x20]
	str r4, [sp, #8]
	ldr r4, [sp, #0x24]
	str r4, [sp, #0xc]
	bl ov80_0222E558
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E920

	thumb_func_start ov80_0222E940
ov80_0222E940: ; 0x0222E940
	push {r3, lr}
	bl ov80_0222EA74
	pop {r3, pc}
	thumb_func_end ov80_0222E940

	thumb_func_start ov80_0222E948
ov80_0222E948: ; 0x0222E948
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222EB14
	mov r1, #7
	tst r1, r0
	bne _0222E966
	lsr r1, r0, #3
	b _0222E96A
_0222E966:
	lsr r0, r0, #3
	add r1, r0, #1
_0222E96A:
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _0222E984
	add r0, r5, #0
	add r0, #0x98
	ldrb r0, [r0]
	sub r2, r0, r1
	add r0, r5, #0
	add r0, #0x98
	strb r2, [r0]
_0222E984:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	cmp r0, #8
	bls _0222E9D4
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0222E9A8
	add r0, r5, #0
	add r0, #0x99
	ldrb r2, [r0]
	add r0, r5, #0
	add r0, #0x99
	sub r2, #0x10
	strb r2, [r0]
_0222E9A8:
	add r0, r5, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r5, #0
	mov r2, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	add r3, #0x98
	add r1, r5, #0
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #8
	bl AddWindowParameterized
	b _0222EA22
_0222E9D4:
	add r2, r5, #0
	add r2, #0x97
	ldrb r2, [r2]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	beq _0222E9F0
	add r2, r5, #0
	add r2, #0x99
	ldrb r2, [r2]
	lsl r0, r0, #1
	sub r2, r2, r0
	add r0, r5, #0
	add r0, #0x99
	strb r2, [r0]
_0222E9F0:
	add r0, r5, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r5, #0
	mov r2, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r1, r5, #0
	add r3, #0x98
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #8
	bl AddWindowParameterized
_0222EA22:
	add r0, r5, #0
	ldr r2, _0222EA6C ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow1
	add r0, r5, #0
	bl ov80_0222EB54
	ldr r3, [r5]
	add r2, r5, #0
	add r2, #0x96
	ldr r3, [r3, #0x34]
	mov r0, #0x65
	lsl r0, r0, #2
	lsl r3, r3, #0x18
	ldrb r2, [r2]
	add r0, r5, r0
	mov r1, #0
	lsr r3, r3, #0x18
	bl ListMenuInit
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov80_0222EE7C
	ldr r0, _0222EA70 ; =ov80_0222EC90
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #4]
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_0222EA6C: .word 0x000003D9
_0222EA70: .word ov80_0222EC90
	thumb_func_end ov80_0222E948

	thumb_func_start ov80_0222EA74
ov80_0222EA74: ; 0x0222EA74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	mov r0, #0x50
	ldr r1, [r1, #0x34]
	add r7, r2, #0
	add r4, r3, #0
	bl String_New
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	add r0, r5, #0
	add r0, #0x90
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0x9b
	ldrb r1, [r0]
	lsl r0, r1, #2
	add r0, r5, r0
	lsl r1, r1, #3
	add r2, r5, r1
	mov r1, #0x6f
	ldr r0, [r0, #0x1c]
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r0, r6, #0
	bl String_Delete
	cmp r4, #0xfa
	bne _0222EAE6
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r2, #2
	mvn r2, r2
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #7
	lsl r0, r0, #6
	str r2, [r1, r0]
	b _0222EAF6
_0222EAE6:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #7
	lsl r0, r0, #6
	str r4, [r1, r0]
_0222EAF6:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0xa7
	lsl r0, r0, #2
	strh r7, [r1, r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r5, #0x9b
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222EA74

	thumb_func_start ov80_0222EB14
ov80_0222EB14: ; 0x0222EB14
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	ble _0222EB4C
	add r5, r7, #0
_0222EB26:
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222EB4C
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	cmp r6, r0
	bhs _0222EB3E
	add r6, r0, #0
_0222EB3E:
	add r0, r7, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _0222EB26
_0222EB4C:
	add r6, #0xc
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222EB14

	thumb_func_start ov80_0222EB54
ov80_0222EB54: ; 0x0222EB54
	push {r4, r5}
	mov r3, #0x6f
	lsl r3, r3, #2
	add r1, r3, #0
	add r2, r0, r3
	sub r1, #0x28
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _0222EC4C ; =ov80_0222EC84
	sub r1, #0x24
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _0222EC50 ; =ov80_0222EC60
	sub r1, #0x20
	str r2, [r0, r1]
	add r2, r0, #0
	add r1, r3, #0
	add r2, #8
	sub r1, #0x1c
	str r2, [r0, r1]
	add r1, r0, #0
	add r1, #0x9b
	ldrb r2, [r1]
	add r1, r3, #0
	sub r1, #0x18
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #8
	sub r1, #0x16
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #1
	sub r1, #0x14
	strb r2, [r0, r1]
	add r1, r3, #0
	mov r4, #0xc
	sub r1, #0x13
	strb r4, [r0, r1]
	add r1, r3, #0
	mov r4, #2
	sub r1, #0x12
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x11
	ldrb r4, [r0, r1]
	mov r1, #0xf
	bic r4, r1
	orr r4, r2
	add r2, r3, #0
	sub r2, #0x11
	strb r4, [r0, r2]
	add r2, r3, #0
	sub r2, #0x11
	ldrb r5, [r0, r2]
	mov r2, #0xf0
	mov r4, #0x10
	bic r5, r2
	orr r5, r4
	add r4, r3, #0
	sub r4, #0x11
	strb r5, [r0, r4]
	add r4, r3, #0
	sub r4, #0x10
	ldrb r4, [r0, r4]
	bic r4, r1
	mov r1, #0xf
	orr r4, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x10
	ldrb r4, [r0, r1]
	mov r1, #0x20
	bic r4, r2
	add r2, r4, #0
	orr r2, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #7
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #0x78
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC54 ; =0xFFFFFE7F
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC58 ; =0xFFFF81FF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC5C ; =0xFFFF7FFF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	sub r3, #0xc
	str r0, [r0, r3]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0222EC4C: .word ov80_0222EC84
_0222EC50: .word ov80_0222EC60
_0222EC54: .word 0xFFFFFE7F
_0222EC58: .word 0xFFFF81FF
_0222EC5C: .word 0xFFFF7FFF
	thumb_func_end ov80_0222EB54

	thumb_func_start ov80_0222EC60
ov80_0222EC60: ; 0x0222EC60
	push {r3, lr}
	mov r2, #2
	mvn r2, r2
	cmp r1, r2
	bne _0222EC76
	mov r1, #3
	mov r2, #0xf
	mov r3, #4
	bl ListMenuOverrideSetColors
	pop {r3, pc}
_0222EC76:
	mov r1, #1
	mov r2, #0xf
	mov r3, #2
	bl ListMenuOverrideSetColors
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222EC60

	thumb_func_start ov80_0222EC84
ov80_0222EC84: ; 0x0222EC84
	ldr r3, _0222EC8C ; =ListMenuGetTemplateField
	mov r1, #0x13
	bx r3
	nop
_0222EC8C: .word ListMenuGetTemplateField
	thumb_func_end ov80_0222EC84

	thumb_func_start ov80_0222EC90
ov80_0222EC90: ; 0x0222EC90
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222ECAC
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	add r5, #0x94
	sub r0, r0, #1
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_0222ECAC:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222ED8C
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #0x6d
	mov r1, #0xb5
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldrh r6, [r5, r1]
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl ListMenuGetCurrentItemArrayId
	mov r0, #0xb5
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r6, r0
	beq _0222ECE2
	ldr r0, _0222ED90 ; =0x000005DC
	bl PlaySE
_0222ECE2:
	ldr r0, _0222ED94 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	bne _0222ECFE
	mov r1, #0x80
	tst r1, r0
	bne _0222ECFE
	mov r1, #0x20
	tst r1, r0
	bne _0222ECFE
	mov r1, #0x10
	tst r0, r1
	beq _0222ED04
_0222ECFE:
	add r0, r5, #0
	bl ov80_0222EE7C
_0222ED04:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222ED26
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222ED26
	mov r1, #0xb5
	mov r0, #0x6d
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ListMenuGetValueByArrayId
	add r4, r0, #0
_0222ED26:
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldrh r1, [r0]
	ldr r0, _0222ED98 ; =0x0000EEDD
	cmp r1, r0
	bne _0222ED3E
	add r0, r5, #0
	mov r1, #0
	bl ov80_0222EDA0
	pop {r4, r5, r6, pc}
_0222ED3E:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222ED4E
	add r0, r0, #1
	cmp r4, r0
	beq _0222ED8C
	b _0222ED76
_0222ED4E:
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222ED8C
	ldr r0, _0222ED90 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	add r0, #0xa0
	ldr r1, _0222ED9C ; =0x0000FFFE
	ldr r0, [r0]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #1
	bl ov80_0222EDA0
	pop {r4, r5, r6, pc}
_0222ED76:
	ldr r0, _0222ED90 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	strh r4, [r0]
	add r0, r5, #0
	bl ov80_0222EDA0
_0222ED8C:
	pop {r4, r5, r6, pc}
	nop
_0222ED90: .word 0x000005DC
_0222ED94: .word gSystem
_0222ED98: .word 0x0000EEDD
_0222ED9C: .word 0x0000FFFE
	thumb_func_end ov80_0222EC90

	thumb_func_start ov80_0222EDA0
ov80_0222EDA0: ; 0x0222EDA0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, [r6]
	cmp r1, #1
	bne _0222EDB0
	ldr r0, _0222EE10 ; =0x000005DC
	bl PlaySE
_0222EDB0:
	mov r0, #0x6d
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r6, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	add r0, #8
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_0222EDD6:
	ldr r0, [r5, #0x1c]
	bl String_Delete
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x1c
	blt _0222EDD6
	add r0, r6, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222EDFC
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl DestroyMsgData
_0222EDFC:
	ldr r0, [r6, #4]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EE10: .word 0x000005DC
	thumb_func_end ov80_0222EDA0

	thumb_func_start ov80_0222EE14
ov80_0222EE14: ; 0x0222EE14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	str r1, [sp, #0xc]
	ldr r1, [r5]
	mov r0, #0x50
	ldr r1, [r1, #0x34]
	add r7, r2, #0
	bl String_New
	ldr r1, [r5]
	add r4, r0, #0
	ldr r1, [r1, #0x34]
	mov r0, #0x50
	bl String_New
	add r6, r0, #0
	ldr r0, [r5, #0x18]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #0x18]
	mov r1, #1
	add r2, r6, #0
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_Delete
	add r0, r6, #0
	bl String_Delete
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222EE14

	thumb_func_start ov80_0222EE7C
ov80_0222EE7C: ; 0x0222EE7C
	push {r4, lr}
	mov r1, #0x6d
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #6
	add r1, r4, r1
	bl ListMenuGetCurrentItemArrayId
	ldr r0, _0222EEA8 ; =0x000001BA
	ldrh r1, [r4, r0]
	add r0, #0xe2
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, r0]
	cmp r1, #0xff
	beq _0222EEA6
	add r0, r4, #0
	mov r2, #0
	bl ov80_0222EE14
_0222EEA6:
	pop {r4, pc}
	.balign 4, 0
_0222EEA8: .word 0x000001BA
	thumb_func_end ov80_0222EE7C

	thumb_func_start ov80_0222EEAC
ov80_0222EEAC: ; 0x0222EEAC
	push {r3, lr}
	cmp r0, #0
	beq _0222EEC2
	add r1, r0, #0
	add r1, #0xa0
	ldr r2, _0222EEC4 ; =0x0000FFFE
	ldr r1, [r1]
	strh r2, [r1]
	mov r1, #0
	bl ov80_0222EDA0
_0222EEC2:
	pop {r3, pc}
	.balign 4, 0
_0222EEC4: .word 0x0000FFFE
	thumb_func_end ov80_0222EEAC

	thumb_func_start ov80_0222EEC8
ov80_0222EEC8: ; 0x0222EEC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	ldrh r4, [r0]
	ldrh r6, [r0, #2]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0222EEE8
	cmp r0, #1
	beq _0222EEF6
	cmp r0, #2
	beq _0222EF9A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222EEE8:
	ldr r0, _0222EFC8 ; =0x0000FD13
	cmp r4, r0
	bne _0222EEF6
	mov r0, #2
	add sp, #8
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222EEF6:
	ldr r0, [r5, #0x14]
	mov r1, #5
	ldr r0, [r0]
	bl ov42_02228188
	cmp r0, #0
	bne _0222EFC2
	cmp r4, #0x20
	blo _0222EF2E
	cmp r4, #0x26
	bhi _0222EF2E
	mov r0, #2
	ldrsh r1, [r5, r0]
	sub r4, #0x20
	add r1, r1, #1
	strh r1, [r5, #2]
	ldrsh r1, [r5, r0]
	ldr r0, _0222EFCC ; =ov80_0223BD44
	ldrb r0, [r0, r4]
	cmp r1, r0
	blt _0222EFC2
	mov r0, #0
	strh r0, [r5, #2]
	ldr r0, [r5, #0xc]
	add sp, #8
	add r0, r0, #4
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF2E:
	cmp r4, #0x27
	blo _0222EF66
	cmp r4, #0x29
	bhs _0222EF66
	cmp r4, #0x27
	beq _0222EF40
	cmp r4, #0x28
	beq _0222EF4C
	b _0222EF58
_0222EF40:
	ldr r0, [r5, #0x14]
	mov r1, #1
	ldr r0, [r0, #4]
	bl ov42_02229200
	b _0222EF5C
_0222EF4C:
	ldr r0, [r5, #0x14]
	mov r1, #0
	ldr r0, [r0, #4]
	bl ov42_02229200
	b _0222EF5C
_0222EF58:
	bl GF_AssertFail
_0222EF5C:
	ldr r0, [r5, #0xc]
	add sp, #8
	add r0, r0, #4
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF66:
	ldr r1, [r5, #0x14]
	ldrh r2, [r5, #4]
	ldr r1, [r1]
	add r0, sp, #0
	add r3, r4, #0
	bl ov80_0222EFD0
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl ov42_022299C0
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
	ldrb r0, [r5, #1]
	cmp r0, r6
	blt _0222EF92
	mov r0, #0
	strb r0, [r5, #1]
	ldr r0, [r5, #0xc]
	add r0, r0, #4
	str r0, [r5, #0xc]
_0222EF92:
	mov r0, #0
	add sp, #8
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF9A:
	ldr r0, [r5, #0x14]
	mov r1, #5
	ldr r0, [r0]
	bl ov42_02228188
	cmp r0, #0
	bne _0222EFC2
	ldr r1, [r5, #8]
	ldrb r0, [r1]
	sub r0, r0, #1
	strb r0, [r1]
	ldr r0, [r5, #0x14]
	mov r1, #0
	str r1, [r0, #0x38]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
_0222EFC2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EFC8: .word 0x0000FD13
_0222EFCC: .word ov80_0223BD44
	thumb_func_end ov80_0222EEC8

	thumb_func_start ov80_0222EFD0
ov80_0222EFD0: ; 0x0222EFD0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	strb r2, [r4, #7]
	ldr r0, _0222F028 ; =ov80_0223DC22
	lsl r2, r3, #2
	ldrh r0, [r0, r2]
	strb r0, [r4, #6]
	ldr r0, _0222F02C ; =_0223DC20
	ldrh r0, [r0, r2]
	strh r0, [r4, #4]
	cmp r0, #2
	beq _0222EFF2
	cmp r0, #3
	beq _0222EFF2
	cmp r0, #6
	bne _0222F00C
_0222EFF2:
	add r0, r1, #0
	bl ov42_022282E8
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	add sp, #8
	strh r0, [r4]
	ldrh r0, [r1, #6]
	strh r0, [r4, #2]
	pop {r4, pc}
_0222F00C:
	add r0, r1, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	add sp, #8
	pop {r4, pc}
	nop
_0222F028: .word ov80_0223DC22
_0222F02C: .word _0223DC20
	thumb_func_end ov80_0222EFD0

	thumb_func_start ov80_0222F030
ov80_0222F030: ; 0x0222F030
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r5, r0, #0
	ldr r0, [r5, #4]
	str r1, [sp, #0x20]
	str r0, [sp, #0x2c]
	ldr r7, [r5, #0x34]
	ldr r6, [r5, #0x38]
	mov r0, #8
	add r1, r2, #0
	str r2, [sp, #0x24]
	add r4, r3, #0
	bl NARC_New
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0x70
	str r4, [sp, #8]
	bl sub_0200D504
	ldr r0, [sp, #0x30]
	mov r1, #2
	str r0, [sp]
	mov r0, #0x6f
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	add r2, r7, #0
	add r3, r6, #0
	str r4, [sp, #0x14]
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0x71
	str r4, [sp, #4]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0x72
	str r4, [sp, #4]
	bl sub_0200D71C
	ldr r0, [sp, #0x30]
	bl NARC_Delete
	add r0, sp, #0x38
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	ldr r0, [sp, #0x90]
	add r1, sp, #0x38
	strh r0, [r1]
	ldr r0, [sp, #0x94]
	strh r0, [r1, #2]
	mov r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	ldr r1, [sp, #0x98]
	str r0, [sp, #0x44]
	str r1, [sp, #0x40]
	mov r1, #1
	str r1, [sp, #0x48]
	ldr r1, [sp, #0x9c]
	str r0, [sp, #0x68]
	str r1, [sp, #0x64]
	add r1, sp, #0x38
_0222F0DA:
	add r0, r0, #1
	str r4, [r1, #0x14]
	add r1, r1, #4
	cmp r0, #6
	blt _0222F0DA
	add r0, r7, #0
	add r1, r6, #0
	add r2, sp, #0x38
	bl sub_0200D734
	add r6, r0, #0
	bl sub_0200DC18
	mov r1, #0x32
	ldr r0, [sp, #0x24]
	lsl r1, r1, #6
	bl AllocFromHeap
	str r0, [sp, #0x28]
	mov r1, #0
	ldr r0, [sp, #0x20]
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x20]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r1, [sp, #0x20]
	add r0, sp, #0x6c
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, sp, #0x38
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x24]
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, #2
	str r0, [sp, #0x18]
	str r7, [sp, #0x1c]
	ldrh r0, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	bl sub_02014494
	ldr r0, [r6]
	bl sub_02024B1C
	add r7, r0, #0
	ldr r0, [sp, #0x28]
	mov r1, #4
	bl DC_FlushRange
	mov r2, #0x32
	ldr r0, [sp, #0x28]
	ldr r1, [r7, #4]
	lsl r2, r2, #6
	bl GX_LoadOBJ
	ldr r0, [r6]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	lsl r7, r0, #4
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r2, sp, #0x38
	ldrh r1, [r2, #0x34]
	ldrh r2, [r2, #0x38]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	bl PaletteData_LoadNarc
	ldr r0, [sp, #0xa0]
	cmp r0, #0
	ble _0222F1AE
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x80
	ldrh r0, [r0, #0x24]
	lsl r2, r7, #0x10
	mov r1, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
_0222F1AE:
	ldr r0, [sp, #0x28]
	bl FreeToHeap
	ldr r0, _0222F1CC ; =0x0000C350
	add r5, #0x80
	sub r0, r4, r0
	lsl r4, r0, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _0222F1C6
	bl GF_AssertFail
_0222F1C6:
	str r6, [r5, r4]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F1CC: .word 0x0000C350
	thumb_func_end ov80_0222F030

	thumb_func_start ov80_0222F1D0
ov80_0222F1D0: ; 0x0222F1D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222F20C ; =0x0000C350
	add r6, r1, #0
	add r4, r5, #0
	sub r0, r6, r0
	add r4, #0x80
	lsl r7, r0, #2
	ldr r0, [r4, r7]
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4, r7]
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D958
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D968
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D978
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D988
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F20C: .word 0x0000C350
	thumb_func_end ov80_0222F1D0

	thumb_func_start ov80_0222F210
ov80_0222F210: ; 0x0222F210
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	bl sub_02074490
	mov r1, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	mov r1, #2
	bl sub_0200D644
	bl sub_02074498
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	mov r2, #0x14
	bl sub_0200D704
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F210

	thumb_func_start ov80_0222F278
ov80_0222F278: ; 0x0222F278
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x7d
	ldr r0, [r4, #0x38]
	lsl r1, r1, #4
	bl sub_0200D978
	mov r1, #0x7d
	ldr r0, [r4, #0x38]
	lsl r1, r1, #4
	bl sub_0200D988
	mov r1, #0x7d
	ldr r0, [r4, #0x38]
	lsl r1, r1, #4
	bl sub_0200D968
	pop {r4, pc}
	thumb_func_end ov80_0222F278

	thumb_func_start ov80_0222F29C
ov80_0222F29C: ; 0x0222F29C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r2, #0
	add r5, r0, #0
	add r7, r1, #0
	str r3, [sp, #0xc]
	cmp r4, #8
	blt _0222F2B0
	bl GF_AssertFail
_0222F2B0:
	add r0, r7, #0
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x7d
	lsl r0, r0, #4
	add r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	mov r2, #0x14
	bl sub_0200E188
	ldr r6, _0222F320 ; =ov80_0223BD80
	add r3, sp, #0x10
	mov r2, #6
_0222F2D8:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222F2D8
	ldr r0, [r6]
	add r1, sp, #0x10
	str r0, [r3]
	ldr r0, [sp, #0x24]
	add r2, sp, #0x10
	add r0, r0, r4
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	strh r0, [r1]
	ldr r0, [sp, #0x58]
	strh r0, [r1, #2]
	mov r0, #0xc8
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D734
	add r4, r0, #0
	add r0, r7, #0
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02024AA8
	add r0, r4, #0
	bl sub_0200DC18
	add r0, r4, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0222F320: .word ov80_0223BD80
	thumb_func_end ov80_0222F29C

	thumb_func_start ov80_0222F324
ov80_0222F324: ; 0x0222F324
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x7d
	lsl r1, r1, #4
	ldr r0, [r0, #0x38]
	add r1, r2, r1
	bl sub_0200D958
	add r0, r4, #0
	bl sub_0200D9DC
	pop {r4, pc}
	thumb_func_end ov80_0222F324

	thumb_func_start ov80_0222F33C
ov80_0222F33C: ; 0x0222F33C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x15
	mov r1, #0x65
	bl NARC_New
	add r4, r0, #0
	bl sub_0207CAA0
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0222F3C4 ; =0x000007D1
	mov r1, #2
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x34]
	ldr r3, [r5, #0x38]
	bl sub_0200D68C
	bl sub_0207CAA4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222F3C4 ; =0x000007D1
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D6EC
	bl sub_0207CAA8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222F3C4 ; =0x000007D1
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D71C
	bl sub_0207CA9C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0222F3C8 ; =0x000007D9
	mov r2, #0x15
	str r0, [sp, #8]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200E188
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222F3C4: .word 0x000007D1
_0222F3C8: .word 0x000007D9
	thumb_func_end ov80_0222F33C

	thumb_func_start ov80_0222F3CC
ov80_0222F3CC: ; 0x0222F3CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F4 ; =0x000007D9
	bl sub_0200D958
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 ; =0x000007D1
	bl sub_0200D978
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 ; =0x000007D1
	bl sub_0200D988
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 ; =0x000007D1
	bl sub_0200D968
	pop {r4, pc}
	nop
_0222F3F4: .word 0x000007D9
_0222F3F8: .word 0x000007D1
	thumb_func_end ov80_0222F3CC

	thumb_func_start ov80_0222F3FC
ov80_0222F3FC: ; 0x0222F3FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r5, _0222F43C ; =ov80_0223BD4C
	add r6, r2, #0
	add r3, r0, #0
	add r7, r1, #0
	add r4, sp, #0
	mov r2, #6
_0222F40C:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _0222F40C
	ldr r0, [r5]
	add r2, sp, #0
	str r0, [r4]
	add r0, sp, #0
	strh r7, [r0]
	strh r6, [r0, #2]
	mov r0, #0x4b
	lsl r0, r0, #2
	str r0, [sp, #8]
	ldr r0, [r3, #0x34]
	ldr r1, [r3, #0x38]
	bl sub_0200D734
	add r4, r0, #0
	bl sub_0200DC18
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222F43C: .word ov80_0223BD4C
	thumb_func_end ov80_0222F3FC

	thumb_func_start ov80_0222F440
ov80_0222F440: ; 0x0222F440
	ldr r3, _0222F448 ; =sub_0200D9DC
	add r0, r1, #0
	bx r3
	nop
_0222F448: .word sub_0200D9DC
	thumb_func_end ov80_0222F440

	thumb_func_start ov80_0222F44C
ov80_0222F44C: ; 0x0222F44C
	ldr r3, _0222F454 ; =ov80_0222F458
	mov r2, #0xb5
	lsl r2, r2, #2
	bx r3
	.balign 4, 0
_0222F454: .word ov80_0222F458
	thumb_func_end ov80_0222F44C

	thumb_func_start ov80_0222F458
ov80_0222F458: ; 0x0222F458
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	bl sub_02096808
	ldrh r2, [r4]
	ldr r1, _0222F4C8 ; =0x0000FFFF
	cmp r2, r1
	bne _0222F498
	mov r0, #1
	mov r1, #0x1b
	add r2, r6, #0
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r4, #2]
	ldr r0, [r5]
	add r1, r6, #0
	mov r3, #1
	bl ov80_0222E268
	add r0, r6, #0
	bl DestroyMsgData
	b _0222F4BC
_0222F498:
	ldr r0, [r0, #8]
	bl Save_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	add r1, r0, #0
	ldrh r0, [r4, #4]
	str r0, [sp]
	mov r0, #6
	ldrsh r0, [r4, r0]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrh r2, [r4]
	ldrh r3, [r4, #2]
	ldr r0, [r5]
	bl ov80_0222E3B8
_0222F4BC:
	ldr r1, _0222F4CC ; =ov80_0222F4D0
	add r0, r5, #0
	bl ov80_0222AB84
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222F4C8: .word 0x0000FFFF
_0222F4CC: .word ov80_0222F4D0
	thumb_func_end ov80_0222F458

	thumb_func_start ov80_0222F4D0
ov80_0222F4D0: ; 0x0222F4D0
	push {r3, lr}
	ldr r0, [r0]
	add r0, #0x50
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222F4EA
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r3, pc}
_0222F4EA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F4D0

	thumb_func_start ov80_0222F4F0
ov80_0222F4F0: ; 0x0222F4F0
	push {r4, lr}
	add r4, r1, #0
	mov r1, #8
	ldrsb r2, [r4, r1]
	add r2, r2, #1
	strb r2, [r4, #8]
	ldrsb r2, [r4, r1]
	mov r1, #9
	ldrsb r1, [r4, r1]
	cmp r2, r1
	ble _0222F538
	mov r1, #0
	strb r1, [r4, #8]
	mov r1, #0xa
	ldrsb r2, [r4, r1]
	sub r2, r2, #1
	strb r2, [r4, #0xa]
	ldrsb r1, [r4, r1]
	cmp r1, #0
	bge _0222F528
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	pop {r4, pc}
_0222F528:
	mov r0, #4
	ldrsh r0, [r4, r0]
	neg r0, r0
	strh r0, [r4, #4]
	mov r0, #6
	ldrsh r0, [r4, r0]
	neg r0, r0
	strh r0, [r4, #6]
_0222F538:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F4F0

	thumb_func_start ov80_0222F53C
ov80_0222F53C: ; 0x0222F53C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #8
	add r7, r0, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0222F5C2
	mov r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0222F5A6
	ldr r2, _0222F5C8 ; =0x04000048
	mov r1, #0x3f
	ldrh r3, [r2]
	mov r0, #0xf
	mov r5, #0x20
	bic r3, r1
	orr r0, r3
	orr r0, r5
	strh r0, [r2]
	ldrh r3, [r2, #2]
	mov r0, #0x1f
	bic r3, r1
	orr r0, r3
	orr r0, r5
	strh r0, [r2, #2]
	ldrb r3, [r4, #4]
	ldrb r1, [r4, #7]
	ldrb r0, [r4, #5]
	lsl r6, r3, #8
	mov r3, #0xff
	lsl r3, r3, #8
	and r6, r3
	ldrb r3, [r4, #6]
	orr r6, r3
	add r3, r2, #0
	sub r3, #8
	strh r6, [r3]
	lsl r3, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	and r0, r3
	orr r1, r0
	sub r0, r2, #4
	strh r1, [r0]
	lsl r2, r5, #0x15
	ldr r1, [r2]
	ldr r0, _0222F5CC ; =0xFFFF1FFF
	and r1, r0
	lsl r0, r5, #8
	orr r0, r1
	str r0, [r2]
	b _0222F5B0
_0222F5A6:
	lsl r2, r1, #0x17
	ldr r1, [r2]
	ldr r0, _0222F5CC ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
_0222F5B0:
	add r0, r7, #0
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	pop {r3, r4, r5, r6, r7, pc}
_0222F5C2:
	sub r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F5C8: .word 0x04000048
_0222F5CC: .word 0xFFFF1FFF
	thumb_func_end ov80_0222F53C

	thumb_func_start ov80_0222F5D0
ov80_0222F5D0: ; 0x0222F5D0
	add r2, r0, #0
	add r2, #0x97
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0x40
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x19
	orr r1, r3
	add r0, #0x97
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222F5D0

	thumb_func_start ov80_0222F5EC
ov80_0222F5EC: ; 0x0222F5EC
	add r2, r0, #0
	add r2, #0x97
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0x80
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x18
	orr r1, r3
	add r0, #0x97
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222F5EC

	.rodata

ov80_0223B9CC: ; 0x0223B9CC
	.byte 0xD0, 0x00, 0x00, 0x00

ov80_0223B9D0: ; 0x0223B9D0
	.byte 0x01, 0x19, 0x0D, 0x06, 0x04, 0x0E, 0x55, 0x03

ov80_0223B9D8: ; 0x0223B9D8
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00

ov80_0223B9EC: ; 0x0223B9EC
	.word ov80_0222D390
	.word ov80_0222D404
	.word ov80_0222D520
	.word ov80_0222D968
	.word ov80_0222DAAC
	.word ov80_0222DC14

ov80_0223BA04: ; 0x0223BA04
	.word ov80_0222BEB0
	.word ov80_0222BEB4
	.word ov80_0222BEC0
	.word ov80_0222BED4
	.word ov80_0222BF00
	.word ov80_0222BF28
	.word ov80_0222BF7C
	.word ov80_0222BF94
	.word ov80_0222BFAC
	.word ov80_0222BFC8
	.word ov80_0222C040
	.word ov80_0222C058
	.word ov80_0222C090
	.word ov80_0222C0A8
	.word ov80_0222C0B4
	.word ov80_0222C0EC
	.word ov80_0222C11C
	.word ov80_0222C14C
	.word ov80_0222C19C
	.word ov80_0222C1A8
	.word ov80_0222C1F0
	.word ov80_0222C214
	.word ov80_0222C270
	.word ov80_0222C2D0
	.word ov80_0222C2F4
	.word ov80_0222C320
	.word ov80_0222C368
	.word ov80_0222C3C4
	.word ov80_0222C424
	.word ov80_0222C450
	.word ov80_0222C46C
	.word ov80_0222C47C
	.word ov80_0222BFF8
	.word ov80_0222C018
	.word ov80_0222C52C
	.word ov80_0222C5EC
	.word ov80_0222C60C
	.word ov80_0222C6E4
	.word ov80_0222C70C
	.word ov80_0222C74C
	.word ov80_0222C750
	.word ov80_0222C7FC
	.word ov80_0222C820
	.word ov80_0222C884
	.word ov80_0222C8B0
	.word ov80_0222C94C
	.word ov80_0222C96C
	.word ov80_0222C9A4
	.word ov80_0222C9D4
	.word ov80_0222CA1C
	.word ov80_0222CA54
	.word ov80_0222CA74
	.word ov80_0222CB54
	.word ov80_0222D1D8
	.word ov80_0222D220
	.word ov80_0222D22C
	.word ov80_0222D260
	.word ov80_0222D284
	.word ov80_0222D29C
	.word ov80_0222D2CC
	.word ov80_0222D328
	.word ov80_0222D334
	.word ov80_0222D360
	.word ov80_0222DC70
	.word ov80_0222DD3C
	.word ov80_0222DD68
	.word ov80_0222DD9C
	.word ov80_0222DDBC
	.word ov80_0222DDF0
	.word ov80_0222DF64
	.word ov80_0222DFD4
	.word ov80_0222DFF4
	.word ov80_0222E078
	.word ov80_0222E09C
	.word ov80_0222E0C8
	.word ov80_0222E0EC
	.word ov80_0222DE1C
	.word ov80_0222DE8C
	.word ov80_0222DEB8
	.word ov80_0222DF2C
	.word ov80_022323A0
	.word ov80_022323B8
	.word ov80_022323D0
	.word ov80_0222CB24
	.word ov80_0222CB44
	.word ov80_02235390
	.word ov80_022353A0
	.word ov80_022353B0
	.word ov80_022353E8
	.word ov80_022353F8
	.word ov80_0223541C
	.word ov80_02235438
	.word ov80_0222F608
	.word ov80_0222F648
	.word ov80_0222F664
	.word ov80_0222F678
	.word ov80_0222F6E0
	.word ov80_0222F708
	.word ov80_0222F74C
	.word ov80_0222F7E0
	.word ov80_0222F7F4
	.word ov80_0222F808
	.word ov80_0222F81C
	.word ov80_0222F830
	.word ov80_0222FC34
	.word ov80_0222FC50
	.word ov80_0222FC80
	.word ov80_0222FCD0
	.word ov80_0222CB9C
	.word ov80_0222CBB4
	.word ov80_0222CD94
	.word ov80_0222CDF4
	.word ov80_0222CE00
	.word ov80_0222E10C
	.word ov80_0222CE28
	.word ov80_0222CE48
	.word ov80_0222CEB8
	.word ov80_0222CECC
	.word ov80_022310A4
	.word ov80_0222CEF0
	.word ov80_0222CF08
	.word ov80_0222CF18
	.word ov80_0222CF38
	.word ov80_0222D008
	.word ov80_0222D034
	.word ov80_0222D064
	.word ov80_0222D084
	.word ov80_0222D0F8
	.word ov80_0222D118
	.word ov80_0222D13C
	.word ov80_0222D168
	.word ov80_0222D1A0
	.word ov80_0223544C
	.word ov80_022355D0
	.word ov80_02235610
	.word ov80_02235624
	.word ov80_02235674
	.word ov80_022356AC
	.word ov80_02235710
	.word ov80_02230B8C
	.word ov80_02230BE0
	.word ov80_02230BFC
	.word ov80_02230C10
	.word ov80_02230CE8
	.word ov80_02230D0C
	.word ov80_02230D70
	.word ov80_02230FD4
	.word ov80_02230FF0
	.word ov80_02231020
	.word ov80_0223106C
	.word ov80_0222DF58
	.word ov80_02231BF8
	.word ov80_02231C5C
	.word ov80_02231C78
	.word ov80_02231C8C
	.word ov80_02231D34
	.word ov80_02231DBC
	.word ov80_02231DF8
	.word ov80_02231EA8
	.word ov80_02231EBC
	.word ov80_02231ED0
	.word ov80_022322AC
	.word ov80_022322C8
	.word ov80_022322F8
	.word ov80_02231CE0
	.word ov80_02232348
	.word ov80_022323E8
	.word ov80_02232430
	.word ov80_02232460
	.word ov80_0223248C
	.word ov80_02235900
	.word ov80_02235920
	.word ov80_02235934
	.word ov80_02235970
	.word ov80_02235A14
	.word ov80_02235A44
	.word ov80_02235A8C
	.word ov80_02235B04
	.word ov80_02235B20
	.word ov80_02235E84
	.word ov80_02235F64
	.word ov80_02235F80
	.word ov80_02235FB4
	.word ov80_0222E120
	.word ov80_02233688
	.word ov80_022336EC
	.word ov80_02233708
	.word ov80_02233770
	.word ov80_02233908
	.word ov80_02233A30
	.word ov80_02233A44
	.word ov80_02233A58
	.word ov80_02233FBC
	.word ov80_02233FD8
	.word ov80_02234008
	.word ov80_0223371C
	.word ov80_02234058
	.word ov80_02234094
	.word ov80_022340A8
	.word ov80_022310C0
	.word ov80_0222E144
	.word ov80_0222E160
	.word ov80_022359B4
	.word ov80_0222E170
	.word ov80_0222E218
	.word ov80_0222E22C
	.word ov80_0222E238
	.word ov80_0222E250

ov80_0223BD44: ; 0x0223BD44
	.byte 0x01, 0x02, 0x04, 0x08, 0x0F, 0x10, 0x20, 0x00

ov80_0223BD4C: ; 0x0223BD4C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD9, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BD80: ; 0x0223BD80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00
	.byte 0xD0, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223BDB4: ; 0x0223BDB4
	.word ov81_0223DD60
	.word ov81_0223DEA8
	.word ov81_0223E234
	.word FS_OVERLAY_ID(OVY_81)

ov80_0223BDC4: ; 0x0223BDC4
	.word ov81_0223DD60
	.word ov81_0223DEA8
	.word ov81_0223E234
	.word FS_OVERLAY_ID(OVY_81)

ov80_0223BDD4: ; 0x0223BDD4
	.byte 0x00, 0x05, 0x05, 0x05, 0x05, 0x07, 0x07, 0x08, 0x09, 0x00, 0x00, 0x00

ov80_0223BDE0: ; 0x0223BDE0
	.byte 0x00, 0x0A, 0x0B, 0x0C, 0x0D, 0x10, 0x11, 0x13, 0x15, 0x00, 0x00, 0x00

ov80_0223BDEC: ; 0x0223BDEC
	.word ov82_0223DD60
	.word ov82_0223DE20
	.word ov82_0223DF74
	.word FS_OVERLAY_ID(OVY_82)

ov80_0223BDFC: ; 0x0223BDFC
	.byte 0x00, 0x01, 0x01, 0x01
	.byte 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x04, 0x04, 0x06, 0x06, 0x08, 0x08, 0x0A, 0x0A, 0x0C, 0x00

ov80_0223BE10: ; 0x0223BE10
	.byte 0x00, 0x06, 0x06, 0x06, 0x08, 0x08, 0x08, 0x0A, 0x0A, 0x0A, 0x0C, 0x0C, 0x0E, 0x0F, 0x11, 0x11
	.byte 0x14, 0x14, 0x17, 0x00

ov80_0223BE24: ; 0x0223BE24
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00

ov80_0223BE34: ; 0x0223BE34
	.word ov83_0223DD60
	.word ov83_0223DE60
	.word ov83_0223DFBC
	.word FS_OVERLAY_ID(OVY_83)

ov80_0223BE44: ; 0x0223BE44
	.word ov83_02242FE8
	.word ov83_02243108
	.word ov83_02243268
	.word FS_OVERLAY_ID(OVY_83)

ov80_0223BE54: ; 0x0223BE54
	.byte 0x00, 0x03, 0x03, 0x04, 0x04, 0x05, 0x05, 0x07, 0x07, 0x00, 0x00, 0x00

ov80_0223BE60: ; 0x0223BE60
	.byte 0x00, 0x08, 0x09, 0x0B, 0x0C, 0x0E, 0x0F, 0x12, 0x12, 0x00, 0x00, 0x00

ov80_0223BE6C: ; 0x0223BE6C
	.byte 0x00, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BE78: ; 0x0223BE78
	.word BattleArcadeGameBoard_InitOverlay
	.word BattleArcadeGameBoard_Main
	.word ov84_0223DFF0
	.word FS_OVERLAY_ID(OVY_84)

ov80_0223BE88: ; 0x0223BE88
	.byte 0x06, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BE90: ; 0x0223BE90
	.byte 0x08, 0x06, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BE98: ; 0x0223BE98
	.byte 0x07, 0x05, 0x04, 0x04, 0x00, 0x03

ov80_0223BE9E: ; 0x0223BE9E
	.byte 0x03

ov80_0223BE9F: ; 0x0223BE9F
	.byte 0x0A
	.byte 0x05, 0x06, 0x07, 0x04, 0x09, 0x02, 0x0A, 0x00

ov80_0223BEA8:
	.byte 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00

ov80_0223BEB8: ; 0x0223BEB8
	.byte 0x21, 0x00, 0x14, 0x00, 0x27, 0x00, 0x2B, 0x00
	.byte 0x2B, 0x00, 0x42, 0x00, 0x2E, 0x00, 0x59, 0x00

ov80_0223BEC8: ; 0x0223BEC8
	.byte 0xDE, 0x00, 0x14, 0x00, 0xD8, 0x00, 0x2B, 0x00
	.byte 0xD5, 0x00, 0x42, 0x00, 0xD2, 0x00, 0x59, 0x00

ov80_0223BED8:
	.byte 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00, 0xC9, 0x00
	.byte 0xCA, 0x00, 0xCB, 0x00, 0xCC, 0x00, 0xCD, 0x00, 0xCE, 0x00, 0xCF, 0x00

ov80_0223BEEC:
	.byte 0xDD, 0x00, 0xD9, 0x00
	.byte 0xD5, 0x00, 0x15, 0x01, 0x28, 0x01, 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00, 0x16, 0x01, 0x17, 0x01
	.byte 0x19, 0x01

ov80_0223BF02:
	.byte 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0x0C, 0x01
	.byte 0x0E, 0x01, 0xDC, 0x00, 0x29, 0x01, 0x1F, 0x01

ov80_0223BF18:
	.byte 0xD6, 0x00, 0x0F, 0x01, 0x0A, 0x01, 0x0B, 0x01
	.byte 0xFD, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0x0C, 0x01, 0x0E, 0x01, 0x16, 0x01, 0x17, 0x01
	.byte 0x19, 0x01

ov80_0223BF32:
	.byte 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00, 0xBE, 0x00
	.byte 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00, 0xC5, 0x00, 0xC6, 0x00
	.byte 0xC7, 0x00, 0xC8, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00

ov80_0223BF5A: ; 0x0223BF5A
	.byte 0x5D, 0x00

ov80_0223BF5C: ; 0x0223BF5C
	.byte 0x3E, 0x00

ov80_0223BF5E: ; 0x0223BF5E
	.byte 0xA3, 0x00
	.byte 0x5E, 0x00, 0x40, 0x00, 0xA4, 0x00, 0x5F, 0x00, 0x42, 0x00, 0xA5, 0x00, 0x60, 0x00, 0x44, 0x00
	.byte 0xA6, 0x00, 0x61, 0x00, 0x46, 0x00, 0xA7, 0x00, 0x62, 0x00, 0x48, 0x00, 0xA8, 0x00, 0x63, 0x00
	.byte 0x4A, 0x00, 0xA9, 0x00, 0x64, 0x00, 0x4C, 0x00, 0xAA, 0x00, 0x65, 0x00, 0x4E, 0x00, 0xAB, 0x00
	.byte 0x5D, 0x00, 0x3D, 0x00, 0xA3, 0x00, 0x5E, 0x00, 0x3F, 0x00, 0xA4, 0x00, 0x5F, 0x00, 0x41, 0x00
	.byte 0xA5, 0x00, 0x60, 0x00, 0x43, 0x00, 0xA6, 0x00, 0x61, 0x00, 0x45, 0x00, 0xA7, 0x00, 0x62, 0x00
	.byte 0x47, 0x00, 0xA8, 0x00, 0x63, 0x00, 0x49, 0x00, 0xA9, 0x00, 0x64, 0x00, 0x4B, 0x00, 0xAA, 0x00
	.byte 0x65, 0x00, 0x4D, 0x00, 0xAB, 0x00, 0x66, 0x00, 0x4F, 0x00, 0xAC, 0x00, 0x67, 0x00, 0x50, 0x00
	.byte 0xAD, 0x00, 0x68, 0x00, 0x51, 0x00, 0xAE, 0x00, 0x69, 0x00, 0x52, 0x00, 0xAF, 0x00, 0x6A, 0x00
	.byte 0x53, 0x00, 0xB0, 0x00, 0x6B, 0x00, 0x54, 0x00, 0xB1, 0x00, 0x6D, 0x00, 0x56, 0x00, 0xB3, 0x00
	.byte 0x6E, 0x00, 0x57, 0x00, 0xB4, 0x00, 0x6F, 0x00, 0x58, 0x00, 0xB5, 0x00, 0x6C, 0x00, 0x55, 0x00
	.byte 0xB2, 0x00, 0x71, 0x00, 0x5A, 0x00, 0xB7, 0x00, 0x70, 0x00, 0x59, 0x00, 0xB6, 0x00, 0x72, 0x00
	.byte 0x5B, 0x00, 0xB8, 0x00, 0x73, 0x00, 0x5C, 0x00, 0xB9, 0x00, 0x00, 0x00

ov80_0223C01C: ; 0x0223C01C
	.byte 0x00, 0x02, 0x02, 0x02
	.byte 0x02, 0x04, 0x04, 0x05, 0x06, 0x00, 0x00, 0x00

ov80_0223C028: ; 0x0223C028
	.byte 0x00, 0x07, 0x08, 0x09, 0x0A, 0x0D, 0x0E, 0x10
	.byte 0x11, 0x00, 0x00, 0x00

ov80_0223C034: ; 0x0223C034
	.byte 0x8D, 0x00, 0x91, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00, 0x00, 0x00

ov80_0223C040: ; 0x0223C040
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00

ov80_0223C048: ; 0x0223C048
	.byte 0xD5, 0x00, 0x9D, 0x00, 0xEA, 0x00, 0xD9, 0x00

ov80_0223C050: ; 0x0223C050
	.byte 0x04, 0x00, 0x00, 0x01, 0x02, 0x03, 0x14, 0x00, 0x02, 0x03, 0x04, 0x05, 0x09, 0x00, 0x04, 0x06
	.byte 0x06, 0x07, 0x0A, 0x00, 0x06, 0x07, 0x08, 0x09, 0x23, 0x00, 0x08, 0x09, 0x0A, 0x0B, 0x0D, 0x00
	.byte 0x0B, 0x0C, 0x0D, 0x0E, 0x11, 0x00, 0x0D, 0x0E, 0x0F, 0x10, 0x00, 0x00

ov80_0223C07C: ; 0x0223C07C
	.byte 0x78, 0x56, 0x34, 0x12
	.byte 0x00, 0x00, 0x00, 0x00, 0x71, 0x00, 0x90, 0x00, 0xF1, 0x00, 0xA2, 0x00, 0xA3, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223C0AC: ; 0x0223C0AC
	.byte 0x01, 0x00, 0xEA, 0x00
	.byte 0x16, 0x00, 0x4B, 0x00, 0xEB, 0x00, 0x4C, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x86, 0x00
	.byte 0x68, 0x00, 0x5F, 0x00, 0x71, 0x00, 0x7E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0xFD, 0x00, 0x34, 0x00, 0x53, 0x00, 0x35, 0x00, 0x7E, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x83, 0x00, 0x79, 0x00, 0x5C, 0x00, 0x63, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x07, 0x00, 0xF3, 0x00
	.byte 0x37, 0x00, 0x39, 0x00, 0x60, 0x01, 0x38, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6D, 0x00
	.byte 0x7C, 0x00, 0x5D, 0x00, 0x92, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x7B, 0x00, 0xDD, 0x00, 0x3E, 0x01, 0xD3, 0x00, 0x68, 0x00, 0x3A, 0x01
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6A, 0x00, 0x79, 0x00, 0x9A, 0x00, 0x55, 0x00, 0x60, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x6B, 0x01, 0xF6, 0x00
	.byte 0x2D, 0x01, 0x60, 0x01, 0x02, 0x01, 0xBD, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00
	.byte 0x8F, 0x00, 0x67, 0x00, 0x9A, 0x00, 0x68, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x51, 0x00, 0x99, 0x00, 0x5F, 0x01, 0x30, 0x00, 0x3F, 0x01, 0x73, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x64, 0x00, 0x55, 0x00, 0x9C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x2C, 0x01, 0xD9, 0x00
	.byte 0x2F, 0x00, 0x39, 0x01, 0xCC, 0x00, 0x03, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x59, 0x00
	.byte 0x7E, 0x00, 0x64, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x28, 0x01, 0xE8, 0x00, 0xFC, 0x00, 0x45, 0x00, 0xC5, 0x00, 0x12, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x8F, 0x00, 0x60, 0x00, 0x7F, 0x00, 0x68, 0x00, 0x70, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xA7, 0x00, 0xC9, 0x00
	.byte 0x44, 0x01, 0x65, 0x00, 0xA9, 0x00, 0xB8, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x55, 0x00
	.byte 0x79, 0x00, 0x8F, 0x00, 0x9C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x1B, 0x00, 0xED, 0x00, 0x5B, 0x00, 0x3D, 0x01, 0xC9, 0x00, 0x1C, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x66, 0x00, 0xA1, 0x00, 0x7A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x14, 0x01, 0xCB, 0x00
	.byte 0x13, 0x00, 0x62, 0x00, 0x1B, 0x01, 0x74, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6A, 0x00
	.byte 0x81, 0x00, 0x92, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x66, 0x00, 0x97, 0x00, 0x5D, 0x00, 0xF6, 0x00, 0x49, 0x00, 0x71, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00, 0x8F, 0x00, 0x70, 0x00, 0x8F, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x4A, 0x00, 0xE6, 0x00
	.byte 0xDE, 0x00, 0x5E, 0x01, 0x46, 0x00, 0xB6, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x55, 0x00
	.byte 0x68, 0x00, 0x75, 0x00, 0x87, 0x00, 0x77, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xC8, 0x00, 0xD5, 0x00, 0xDC, 0x00, 0xF7, 0x00, 0x6D, 0x00, 0x56, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x91, 0x00, 0x57, 0x00, 0x8F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x73, 0x01, 0x9D, 0x00
	.byte 0xE1, 0x00, 0x1D, 0x00, 0x18, 0x01, 0xB8, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00
	.byte 0x75, 0x00, 0x8A, 0x00, 0x55, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xE4, 0x00, 0xF9, 0x00, 0xF2, 0x00, 0x34, 0x00, 0x2E, 0x00, 0xB6, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x78, 0x00, 0x9C, 0x00, 0x84, 0x00, 0x9C, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x31, 0x01, 0x9E, 0x00
	.byte 0xE8, 0x00, 0x3D, 0x01, 0x4E, 0x01, 0x6A, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x64, 0x00
	.byte 0x7A, 0x00, 0x9A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF

ov80_0223C464: ; 0x0223C464
	.byte 0x06, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00

ov80_0223C478: ; 0x0223C478
	.byte 0x00, 0x00

ov80_0223C47A: ; 0x0223C47A
	.byte 0x63, 0x00

ov80_0223C47C: ; 0x0223C47C
	.byte 0x64, 0x00

ov80_0223C47E: ; 0x0223C47E
	.byte 0x77, 0x00
	.byte 0x50, 0x00, 0x77, 0x00, 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00
	.byte 0x78, 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00
	.byte 0xA0, 0x00, 0xC7, 0x00, 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00
	.byte 0xC8, 0x00, 0x2B, 0x01, 0xC8, 0x00, 0x2B, 0x01

ov80_0223C4B8: ; 0x0223C4B8
	.byte 0x64, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x00, 0x01
	.byte 0x78, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x04, 0x01, 0x8C, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x08, 0x01
	.byte 0xA0, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x0C, 0x01, 0xB4, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x10, 0x01
	.byte 0xC8, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x14, 0x01, 0xDC, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00

ov80_0223C508: ; 0x0223C508
	.byte 0x64, 0x00, 0x01, 0x00, 0x96, 0x00, 0x00, 0x01
	.byte 0x78, 0x00, 0x97, 0x00, 0xFA, 0x00, 0x04, 0x01, 0x8C, 0x00, 0xFB, 0x00, 0x5E, 0x01, 0x08, 0x01
	.byte 0xA0, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x01, 0xB4, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x10, 0x01
	.byte 0xC8, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x14, 0x01, 0xDC, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00

ov80_0223C558: ; 0x0223C558
	.byte 0x64, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x00, 0x01
	.byte 0x78, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x04, 0x01, 0x8C, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x08, 0x01
	.byte 0xA0, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x0C, 0x01, 0xB4, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x10, 0x01
	.byte 0xC8, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x14, 0x01, 0xDC, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00

ov80_0223C5A8: ; 0x0223C5A8
	.byte 0x01, 0x00, 0x9A, 0x00, 0x9B, 0x00, 0x0E, 0x01
	.byte 0x0F, 0x01, 0x77, 0x01

ov80_0223C5B4: ; 0x0223C5B4
	.byte 0x78, 0x01, 0xDD, 0x01, 0x00

ov80_0223C5B8: ; 0x0223C5B9
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00
	.byte 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00

ov80_0223C5E0: ; 0x0223C5E0
	.byte 0x01, 0x00, 0x9A, 0x00, 0x01, 0x00, 0x9A, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x01, 0x00, 0x0E, 0x01
	.byte 0x01, 0x00, 0x0E, 0x01, 0x9B, 0x00, 0x77, 0x01, 0x9B, 0x00, 0x77, 0x01, 0x9B, 0x00, 0x77, 0x01
	.byte 0x0F, 0x01, 0xDD, 0x01, 0x0F, 0x01, 0xDD, 0x01

ov80_0223C608: ; 0x0223C608
	.byte 0x14, 0x00, 0x15, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x1B, 0x00, 0x1B, 0x00, 0x26, 0x00, 0x26, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x0B, 0x00
	.byte 0x16, 0x00, 0x16, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x07, 0x00, 0x07, 0x00, 0x04, 0x00, 0x05, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x1C, 0x00, 0x1C, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00
	.byte 0x45, 0x00, 0x45, 0x00, 0x45, 0x00, 0x45, 0x00, 0x31, 0x00, 0x31, 0x00, 0x32, 0x00, 0x32, 0x00
	.byte 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00
	.byte 0x31, 0x00, 0x31, 0x00, 0x32, 0x00, 0x32, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x39, 0x00, 0x39, 0x00, 0x34, 0x00, 0x34, 0x00, 0x54, 0x00, 0x53, 0x00, 0x0C, 0x00, 0x0D, 0x00
	.byte 0x55, 0x00, 0x3A, 0x00, 0x51, 0x00, 0x1A, 0x00

ov80_0223C698: ; 0x0223C698
	.byte 0x02, 0x00, 0x03, 0x00, 0x14, 0x00, 0x15, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0x16, 0x00, 0x1C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x51, 0x00, 0x1A, 0x00
	.byte 0x13, 0x00, 0x50, 0x00, 0x16, 0x00, 0x1C, 0x00, 0x20, 0x00, 0x21, 0x00, 0x14, 0x00, 0x15, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0x3A, 0x00, 0x55, 0x00, 0x20, 0x00, 0x21, 0x00, 0x51, 0x00, 0x1A, 0x00
	.byte 0x13, 0x00, 0x50, 0x00, 0x3A, 0x00, 0x55, 0x00, 0x04, 0x00, 0x05, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x25, 0x00, 0x24, 0x00, 0x04, 0x00, 0x05, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x39, 0x00, 0x34, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x13, 0x00, 0x50, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x39, 0x00, 0x34, 0x00, 0x18, 0x00, 0x19, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x33, 0x00, 0x1B, 0x00, 0x18, 0x00, 0x19, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x33, 0x00, 0x1B, 0x00

ov80_0223C738: ; 0x0223C738
	.byte 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x3D, 0x00
	.byte 0x20, 0x00, 0x20, 0x00, 0x20, 0x00, 0x21, 0x00, 0x21, 0x00, 0x21, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2D, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x55, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x15, 0x00, 0x15, 0x00, 0x15, 0x00, 0x51, 0x00, 0x51, 0x00
	.byte 0x51, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x1C, 0x00
	.byte 0x1C, 0x00, 0x1C, 0x00, 0x16, 0x00, 0x16, 0x00, 0x16, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x30, 0x00
	.byte 0x30, 0x00, 0x25, 0x00, 0x25, 0x00, 0x50, 0x00, 0x50, 0x00, 0x50, 0x00, 0x24, 0x00, 0x24, 0x00
	.byte 0x24, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x34, 0x00, 0x34, 0x00, 0x45, 0x00, 0x45, 0x00
	.byte 0x45, 0x00, 0x2E, 0x00, 0x2E, 0x00, 0x09, 0x00, 0x09, 0x00, 0x55, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x13, 0x00, 0x13, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x47, 0x00, 0x47, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x12, 0x00, 0x12, 0x00, 0x53, 0x00, 0x53, 0x00, 0x53, 0x00, 0x54, 0x00, 0x54, 0x00, 0x54, 0x00
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x1B, 0x00, 0x1B, 0x00
	.byte 0x1B, 0x00, 0x23, 0x00, 0x23, 0x00, 0x23, 0x00, 0x31, 0x00, 0x31, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x32, 0x00, 0x32, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x22, 0x00, 0x22, 0x00, 0x39, 0x00, 0x39, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x3A, 0x00, 0x3A, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x19, 0x00, 0x27, 0x00, 0x27, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x28, 0x00, 0x28, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00
	.byte 0x3C, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x20, 0x00, 0x20, 0x00, 0x21, 0x00, 0x21, 0x00
	.byte 0x06, 0x00, 0x06, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x16, 0x00, 0x16, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x13, 0x00, 0x13, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x30, 0x00, 0x30, 0x00, 0x25, 0x00, 0x25, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x45, 0x00, 0x45, 0x00, 0x2E, 0x00, 0x2E, 0x00, 0x09, 0x00, 0x09, 0x00
	.byte 0x26, 0x00, 0x26, 0x00, 0x33, 0x00, 0x33, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x55, 0x00, 0x55, 0x00, 0x14, 0x00, 0x14, 0x00, 0x15, 0x00, 0x15, 0x00
	.byte 0x47, 0x00, 0x47, 0x00, 0x12, 0x00, 0x12, 0x00, 0x10, 0x00, 0x10, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00
	.byte 0x27, 0x00, 0x27, 0x00, 0x28, 0x00, 0x28, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x0E, 0x00, 0x0E, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x1B, 0x00, 0x1B, 0x00, 0x23, 0x00, 0x23, 0x00, 0x31, 0x00, 0x31, 0x00
	.byte 0x32, 0x00, 0x32, 0x00, 0x51, 0x00, 0x51, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x53, 0x00, 0x53, 0x00
	.byte 0x54, 0x00, 0x54, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x33, 0x00, 0x33, 0x00
	.byte 0x55, 0x00, 0x55, 0x00, 0x13, 0x00, 0x13, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x2E, 0x00, 0x2E, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00, 0x34, 0x00, 0x34, 0x00, 0x25, 0x00, 0x25, 0x00
	.byte 0x39, 0x00, 0x39, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x22, 0x00, 0x22, 0x00, 0x3B, 0x00, 0x3B, 0x00
	.byte 0x3A, 0x00, 0x3A, 0x00, 0x26, 0x00, 0x26, 0x00, 0x33, 0x00, 0x33, 0x00, 0x45, 0x00, 0x45, 0x00
	.byte 0x50, 0x00, 0x50, 0x00, 0x24, 0x00, 0x24, 0x00, 0x07, 0x00, 0x07, 0x00, 0x55, 0x00, 0x55, 0x00

ov80_0223C990: ; 0x0223C990
	.byte 0x01, 0x00, 0x04, 0x00, 0x07, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x13, 0x00, 0x15, 0x00, 0x17, 0x00, 0x19, 0x00, 0x1B, 0x00, 0x1D, 0x00, 0x20, 0x00, 0x23, 0x00
	.byte 0x25, 0x00, 0x27, 0x00, 0x29, 0x00, 0x2B, 0x00, 0x2E, 0x00, 0x30, 0x00, 0x32, 0x00, 0x34, 0x00
	.byte 0x36, 0x00, 0x38, 0x00, 0x3C, 0x00, 0x3F, 0x00, 0x42, 0x00, 0x45, 0x00, 0x48, 0x00, 0x4A, 0x00
	.byte 0x4F, 0x00, 0x51, 0x00, 0x54, 0x00, 0x56, 0x00, 0x58, 0x00, 0x5A, 0x00, 0x5C, 0x00, 0x60, 0x00
	.byte 0x62, 0x00, 0x64, 0x00, 0x66, 0x00, 0x68, 0x00, 0x74, 0x00, 0x76, 0x00, 0x81, 0x00, 0x84, 0x00
	.byte 0x85, 0x00, 0x93, 0x00, 0x98, 0x00, 0x9B, 0x00, 0x9E, 0x00, 0xA1, 0x00, 0xA3, 0x00, 0xA5, 0x00
	.byte 0xA7, 0x00, 0xAA, 0x00, 0xAC, 0x00, 0xAD, 0x00, 0xAE, 0x00, 0xAF, 0x00, 0xB1, 0x00, 0xB3, 0x00
	.byte 0xB7, 0x00, 0xBB, 0x00, 0xBF, 0x00, 0xC2, 0x00, 0xC9, 0x00, 0xCC, 0x00, 0xD1, 0x00, 0xD8, 0x00
	.byte 0xDA, 0x00, 0xDC, 0x00, 0xDF, 0x00, 0xE1, 0x00, 0xE4, 0x00, 0xE7, 0x00, 0xEB, 0x00, 0xEC, 0x00
	.byte 0xEE, 0x00, 0xF6, 0x00, 0xFC, 0x00, 0xFF, 0x00, 0x02, 0x01, 0x05, 0x01, 0x07, 0x01, 0x09, 0x01
	.byte 0x0A, 0x01, 0x0C, 0x01, 0x0E, 0x01, 0x11, 0x01, 0x14, 0x01, 0x16, 0x01, 0x18, 0x01, 0x19, 0x01
	.byte 0x1B, 0x01, 0x1D, 0x01, 0x1F, 0x01, 0x22, 0x01, 0x24, 0x01, 0x25, 0x01, 0x28, 0x01, 0x2A, 0x01
	.byte 0x2C, 0x01, 0x30, 0x01, 0x33, 0x01, 0x35, 0x01, 0x3C, 0x01, 0x3E, 0x01, 0x42, 0x01, 0x45, 0x01
	.byte 0x48, 0x01, 0x4B, 0x01, 0x4D, 0x01, 0x53, 0x01, 0x55, 0x01, 0x57, 0x01, 0x5D, 0x01, 0x61, 0x01
	.byte 0x63, 0x01, 0x68, 0x01, 0x69, 0x01, 0x6B, 0x01, 0x72, 0x01, 0x73, 0x01, 0x76, 0x01, 0x83, 0x01
	.byte 0x86, 0x01, 0x89, 0x01, 0x8C, 0x01, 0x8F, 0x01, 0x91, 0x01, 0x93, 0x01, 0x96, 0x01, 0x9C, 0x01
	.byte 0x9F, 0x01, 0xA2, 0x01, 0xA4, 0x01, 0xA6, 0x01, 0xAF, 0x01, 0xB1, 0x01, 0xB2, 0x01, 0xB4, 0x01
	.byte 0xB6, 0x01, 0xB7, 0x01, 0xB8, 0x01, 0xBB, 0x01, 0xBF, 0x01, 0xC1, 0x01, 0xC3, 0x01, 0xC5, 0x01
	.byte 0xC8, 0x01, 0xCB, 0x01, 0x02, 0x00, 0x05, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x11, 0x00
	.byte 0x14, 0x00, 0x18, 0x00, 0x1E, 0x00, 0x21, 0x00, 0x28, 0x00, 0x2C, 0x00, 0x2F, 0x00, 0x33, 0x00
	.byte 0x3A, 0x00, 0x3D, 0x00, 0x40, 0x00, 0x43, 0x00, 0x46, 0x00, 0x4B, 0x00, 0x4D, 0x00, 0x53, 0x00
	.byte 0x5D, 0x00, 0x5F, 0x00, 0x69, 0x00, 0x6C, 0x00, 0x6D, 0x00, 0x6F, 0x00, 0x72, 0x00, 0x78, 0x00
	.byte 0x89, 0x00, 0x8A, 0x00, 0x8C, 0x00, 0x94, 0x00, 0x99, 0x00, 0x9C, 0x00, 0x9F, 0x00, 0xA2, 0x00
	.byte 0xA6, 0x00, 0xA8, 0x00, 0xB0, 0x00, 0xB4, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBC, 0x00, 0xBE, 0x00
	.byte 0xC0, 0x00, 0xC1, 0x00, 0xC3, 0x00, 0xC6, 0x00, 0xC8, 0x00, 0xCA, 0x00, 0xCE, 0x00, 0xCF, 0x00
	.byte 0xD3, 0x00, 0xD7, 0x00, 0xDB, 0x00, 0xDE, 0x00, 0xEF, 0x00, 0xF0, 0x00, 0xF7, 0x00, 0xFD, 0x00
	.byte 0x00, 0x01, 0x03, 0x01, 0x06, 0x01, 0x08, 0x01, 0x0B, 0x01, 0x0D, 0x01, 0x0F, 0x01, 0x12, 0x01
	.byte 0x15, 0x01, 0x17, 0x01, 0x1C, 0x01, 0x26, 0x01, 0x2B, 0x01, 0x2D, 0x01, 0x2E, 0x01, 0x2F, 0x01
	.byte 0x31, 0x01, 0x34, 0x01, 0x37, 0x01, 0x38, 0x01, 0x39, 0x01, 0x3A, 0x01, 0x3B, 0x01, 0x40, 0x01
	.byte 0x47, 0x01, 0x49, 0x01, 0x59, 0x01, 0x5B, 0x01, 0x5F, 0x01, 0x66, 0x01, 0x6C, 0x01, 0x6E, 0x01
	.byte 0x74, 0x01, 0x77, 0x01, 0x84, 0x01, 0x87, 0x01, 0x8A, 0x01, 0x8D, 0x01, 0x90, 0x01, 0x92, 0x01
	.byte 0x94, 0x01, 0x98, 0x01, 0x9A, 0x01, 0x9D, 0x01, 0x9E, 0x01, 0xA1, 0x01, 0xA9, 0x01, 0xAB, 0x01
	.byte 0xB9, 0x01, 0xBC, 0x01, 0xBE, 0x01, 0xCA, 0x01, 0x9D, 0x01, 0x9D, 0x01, 0x1A, 0x00, 0x1C, 0x00
	.byte 0x1F, 0x00, 0x22, 0x00, 0x24, 0x00, 0x2A, 0x00, 0x2D, 0x00, 0x31, 0x00, 0x35, 0x00, 0x39, 0x00
	.byte 0x41, 0x00, 0x47, 0x00, 0x4C, 0x00, 0x50, 0x00, 0x52, 0x00, 0x55, 0x00, 0x57, 0x00, 0x61, 0x00
	.byte 0x63, 0x00, 0x65, 0x00, 0x6A, 0x00, 0x6B, 0x00, 0x6E, 0x00, 0x70, 0x00, 0x71, 0x00, 0x73, 0x00
	.byte 0x75, 0x00, 0x77, 0x00, 0x7A, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x80, 0x00, 0x8B, 0x00
	.byte 0x8D, 0x00, 0xA4, 0x00, 0xAB, 0x00, 0xB2, 0x00, 0xB6, 0x00, 0xBD, 0x00, 0xC7, 0x00, 0xCB, 0x00
	.byte 0xCD, 0x00, 0xD2, 0x00, 0xDD, 0x00, 0xE0, 0x00, 0xE2, 0x00, 0xE3, 0x00, 0xEA, 0x00, 0xED, 0x00
	.byte 0xF1, 0x00, 0x10, 0x01, 0x13, 0x01, 0x1E, 0x01, 0x20, 0x01, 0x23, 0x01, 0x27, 0x01, 0x29, 0x01
	.byte 0x36, 0x01, 0x3D, 0x01, 0x3F, 0x01, 0x43, 0x01, 0x44, 0x01, 0x46, 0x01, 0x4C, 0x01, 0x4E, 0x01
	.byte 0x4F, 0x01, 0x50, 0x01, 0x51, 0x01, 0x52, 0x01, 0x54, 0x01, 0x56, 0x01, 0x5A, 0x01, 0x5C, 0x01
	.byte 0x60, 0x01, 0x62, 0x01, 0x64, 0x01, 0x65, 0x01, 0x67, 0x01, 0x6A, 0x01, 0x6F, 0x01, 0x70, 0x01
	.byte 0x71, 0x01, 0x8E, 0x01, 0x99, 0x01, 0x9B, 0x01, 0xA0, 0x01, 0xA3, 0x01, 0xA5, 0x01, 0xA7, 0x01
	.byte 0xA8, 0x01, 0xAA, 0x01, 0xAC, 0x01, 0xAD, 0x01, 0xB0, 0x01, 0xB3, 0x01, 0xBA, 0x01, 0xC6, 0x01
	.byte 0xC7, 0x01, 0xC9, 0x01, 0xCC, 0x01, 0xDE, 0x01, 0xDF, 0x01, 0x12, 0x00, 0x16, 0x00, 0x09, 0x00
	.byte 0x26, 0x00, 0x37, 0x00, 0x3B, 0x00, 0x3E, 0x00, 0x44, 0x00, 0x49, 0x00, 0x4E, 0x00, 0x59, 0x00
	.byte 0x5B, 0x00, 0x5E, 0x00, 0x67, 0x00, 0x79, 0x00, 0x7B, 0x00, 0x7F, 0x00, 0x82, 0x00, 0x83, 0x00
	.byte 0x86, 0x00, 0x87, 0x00, 0x88, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00, 0x91, 0x00, 0x92, 0x00
	.byte 0x95, 0x00, 0x9A, 0x00, 0x9D, 0x00, 0xA0, 0x00, 0xA9, 0x00, 0xB5, 0x00, 0xBA, 0x00, 0xC4, 0x00
	.byte 0xC5, 0x00, 0xD0, 0x00, 0xD4, 0x00, 0xD5, 0x00, 0xD6, 0x00, 0xD9, 0x00, 0xE5, 0x00, 0xE6, 0x00
	.byte 0xE8, 0x00, 0xE9, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0xF4, 0x00, 0xF5, 0x00, 0xF8, 0x00, 0xFE, 0x00
	.byte 0x01, 0x01, 0x04, 0x01, 0x1A, 0x01, 0x21, 0x01, 0x32, 0x01, 0x41, 0x01, 0x4A, 0x01, 0x58, 0x01
	.byte 0x5E, 0x01, 0x6D, 0x01, 0xE8, 0x01, 0x75, 0x01, 0x78, 0x01, 0x79, 0x01, 0x7A, 0x01, 0x7B, 0x01
	.byte 0x7C, 0x01, 0x7D, 0x01, 0x85, 0x01, 0x88, 0x01, 0x8B, 0x01, 0x95, 0x01, 0x97, 0x01, 0xAE, 0x01
	.byte 0xB5, 0x01, 0xBD, 0x01, 0xC0, 0x01, 0xC2, 0x01, 0xC4, 0x01, 0xCD, 0x01, 0xCE, 0x01, 0xCF, 0x01
	.byte 0xD0, 0x01, 0xD1, 0x01, 0xD2, 0x01, 0xD3, 0x01, 0xD4, 0x01, 0xD5, 0x01, 0xD6, 0x01, 0xD7, 0x01
	.byte 0xD8, 0x01, 0xD9, 0x01, 0xDA, 0x01, 0xDB, 0x01, 0xDC, 0x01, 0xDD, 0x01, 0xE0, 0x01, 0xE1, 0x01
	.byte 0xE2, 0x01, 0xE5, 0x01, 0x03, 0x00, 0x06, 0x00, 0xE6, 0x01

ov80_0223CD4A: ; 0x0223CD4A
	.byte 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0D, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x07, 0x00, 0x03, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0E, 0x00, 0x02, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0F, 0x00
	.byte 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x02, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x11, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x02, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x05, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x04, 0x00
	.byte 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x06, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x03, 0x00, 0x11, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x05, 0x00, 0x05, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x04, 0x00, 0x01, 0x00, 0x01, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x03, 0x00, 0x06, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0F, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x07, 0x00, 0x03, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x0B, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x11, 0x00, 0x02, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x11, 0x00
	.byte 0x0F, 0x00, 0x0A, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x04, 0x00, 0x11, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x02, 0x00, 0x06, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x00, 0x07, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x00, 0x05, 0x00, 0x01, 0x00
	.byte 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x10, 0x00, 0x05, 0x00, 0x0C, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x10, 0x00, 0x08, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x06, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x08, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x07, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00
	.byte 0x08, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0F, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x08, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x10, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x05, 0x00, 0x0E, 0x00, 0x05, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0B, 0x00
	.byte 0x11, 0x00, 0x05, 0x00, 0x0C, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x11, 0x00, 0x11, 0x00, 0x0F, 0x00
	.byte 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x08, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x11, 0x00, 0x07, 0x00, 0x11, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x07, 0x00, 0x0D, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x07, 0x00
	.byte 0x03, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00
	.byte 0x02, 0x00, 0x0D, 0x00, 0x02, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x10, 0x00, 0x02, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x11, 0x00, 0x11, 0x00, 0x08, 0x00
	.byte 0x04, 0x00, 0x06, 0x00, 0x08, 0x00, 0x06, 0x00, 0x05, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x05, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x05, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x04, 0x00, 0x10, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0F, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x10, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x08, 0x00, 0x08, 0x00, 0x10, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x08, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x11, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x04, 0x00, 0x01, 0x00, 0x08, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x0F, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x05, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x04, 0x00, 0x02, 0x00, 0x0F, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x05, 0x00, 0x08, 0x00, 0x07, 0x00
	.byte 0x07, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00
	.byte 0x08, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_0223DC20: ; 0x0223DC20
	.byte 0x00, 0x00

ov80_0223DC22: ; 0x0223DC22
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00, 0x03, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x07, 0x00, 0x02, 0x00, 0x07, 0x00, 0x03, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x0A, 0x00, 0x03, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x03, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x08, 0x00, 0x03, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x09, 0x00, 0x03, 0x00
