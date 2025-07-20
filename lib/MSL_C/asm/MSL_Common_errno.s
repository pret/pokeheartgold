	.include "asm/macros.inc"
#include <nitro/fs/overlay.h>
	.include "global.inc"

	.bss

	.public errno
errno: ; 0x021E58C0
	.space 0x4
	.size errno,.-errno
