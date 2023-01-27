	.include "asm/macros.inc"
	.include "fx.inc"
	.include "global.inc"
	.text

	arm_func_start FX_Init
FX_Init: ; 0x020CD784
	bx lr
	arm_func_end FX_Init

	arm_func_start FX_Modf
FX_Modf: ; 0x020CD788
	cmp r0, #0
	ldr r2, _020CD7C0 ; =0x7FFFF000
	blt _020CD7A4
	and r3, r0, r2
	str r3, [r1]
	and r0, r0, r2, lsr #19
	bx lr
_020CD7A4:
	rsb ip, r0, #0
	and r0, ip, r2
	rsb r3, r0, #0
	and r0, ip, r2, lsr #19
	str r3, [r1]
	rsb r0, r0, #0
	bx lr
	.align 2, 0
_020CD7C0: .word 0x7FFFF000
	arm_func_end FX_Modf
