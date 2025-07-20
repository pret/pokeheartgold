	.include "asm/macros.inc"
	.include "MSL_ARM_math.inc"
	.include "global.inc"

	.bss

	.public __cs_id
__cs_id: ; 0x021E54A0
	.space 0x24
	.size __cs_id,.-__cs_id

	.public __cs_ref
__cs_ref: ; 0x021E54E8
	.space 0x24
	.size __cs_ref,.-__cs_ref

	.public __cs
__cs: ; 021E54C4
	.space 0xD8
	.size __cs,.-__cs
