#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_0630_T22_hdr_0006-.-4
	.byte 0

scr_seq_0630_T22_hdr_0006:
	.short VAR_SCENE_VIOLET_CITY_OW, 1, 1
	.short VAR_SCENE_VIOLET_CITY_OW, 3, 5
	.short 0

	.balign 4, 0
