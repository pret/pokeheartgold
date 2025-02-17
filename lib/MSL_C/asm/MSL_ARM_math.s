	.include "asm/macros.inc"
	.include "MSL_ARM_math.inc"
	.include "global.inc"

	.text

	arm_func_start nan
nan: ; 0x020E4958
	ldr r0, _020E4968 ; =__float_nan
	ldr ip, _020E496C ; =_f2d
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020E4968: .word __float_nan
_020E496C: .word _f2d
	arm_func_end nan

	exception nan, 0x0019, 0x00000000
