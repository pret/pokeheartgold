	.include "asm/macros.inc"
	.include "unk_02026E30.inc"
	.include "global.inc"

	.bss

_021D221C:
	.space 0xC

	.text

	thumb_func_start sub_02026E30
sub_02026E30: ; 0x02026E30
	ldr r0, _02026E40 ; =_021D221C
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	ldr r0, _02026E44 ; =_021D221C
	str r1, [r0]
	bx lr
	.balign 4, 0
_02026E40: .word _021D221C
_02026E44: .word _021D221C
	thumb_func_end sub_02026E30

	thumb_func_start Thunk_G3X_Reset
Thunk_G3X_Reset: ; 0x02026E48
	ldr r3, _02026E4C ; =G3X_Reset
	bx r3
	.balign 4, 0
_02026E4C: .word G3X_Reset
	thumb_func_end Thunk_G3X_Reset

	thumb_func_start sub_02026E50
sub_02026E50: ; 0x02026E50
	ldr r2, _02026E5C ; =_021D221C
	str r0, [r2, #4]
	str r1, [r2, #8]
	mov r0, #1
	str r0, [r2]
	bx lr
	.balign 4, 0
_02026E5C: .word _021D221C
	thumb_func_end sub_02026E50

	thumb_func_start sub_02026E60
sub_02026E60: ; 0x02026E60
	ldr r0, _02026E7C ; =_021D221C
	ldr r1, [r0]
	cmp r1, #0
	beq _02026E78
	ldr r1, [r0, #8]
	ldr r2, [r0, #4]
	lsl r1, r1, #1
	orr r2, r1
	ldr r1, _02026E80 ; =0x04000540
	str r2, [r1]
	mov r1, #0
	str r1, [r0]
_02026E78:
	bx lr
	nop
_02026E7C: .word _021D221C
_02026E80: .word 0x04000540
	thumb_func_end sub_02026E60
