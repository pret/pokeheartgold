	.include "asm/macros.inc"
	.include "MSL_DPMath_w_pow.inc"
	.include "global.inc"

	.text

	arm_func_start pow
pow: ; 0x020EEDCC
	ldr ip, _020EEDD4 ; =__ieee754_pow
	bx ip
	.align 2, 0
_020EEDD4: .word __ieee754_pow
	arm_func_end pow

	exception pow, 0x000D, 0x00000000
