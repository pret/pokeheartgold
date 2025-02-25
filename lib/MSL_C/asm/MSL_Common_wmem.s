	.include "asm/macros.inc"
	.include "MSL_Common_wmem.inc"
	.include "global.inc"

	.text

	arm_func_start wmemcpy
wmemcpy: ; 0x020EB8B4
	ldr ip, _020EB8C0 ; =memcpy
	mov r2, r2, lsl #1
	bx ip
	.align 2, 0
_020EB8C0: .word memcpy
	arm_func_end wmemcpy

	arm_func_start wmemchr
wmemchr: ; 0x020EB8C4
	cmp r2, #0
	beq _020EB8E4
_020EB8CC:
	ldrh r3, [r0]
	cmp r3, r1
	bxeq lr
	add r0, r0, #2
	subs r2, r2, #1
	bne _020EB8CC
_020EB8E4:
	mov r0, #0
	bx lr
	arm_func_end wmemchr

	exception wmemcpy, 0x0011, 0x00000000
