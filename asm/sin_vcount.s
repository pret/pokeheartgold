	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02096594
sub_02096594: ; 0x02096594
	ldr r0, _0209659C ; =0x04000006
	ldr r3, _020965A0 ; =GF_SinDegNoWrap
	ldrh r0, [r0]
	bx r3
	.balign 4, 0
_0209659C: .word 0x04000006
_020965A0: .word GF_SinDegNoWrap
	thumb_func_end sub_02096594
