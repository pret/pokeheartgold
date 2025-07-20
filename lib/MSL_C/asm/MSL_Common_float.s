	.include "asm/macros.inc"
#include <nitro/fs/overlay.h>
	.include "global.inc"

	.data

	.public __float_huge
__float_huge: ; 0x021110E8
	.word 0x7F800000 ; inf
	.size __float_huge,.-__float_huge

	.public __float_nan
__float_nan: ; 0x021110EC
	.word 0x7FFFFFFF ; nan
	.size __float_nan,.-__float_nan

	.public __double_huge
__double_huge: ; 0x021110F0
	.word 0x00000000, 0x7FF00000 ; inf
	.size __double_huge,.-__double_huge
