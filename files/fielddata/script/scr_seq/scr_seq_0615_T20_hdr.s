#include "constants/scrcmd.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_0615_T20_hdr_0010-.-4
	.byte 2
	.short 7, 0
	.byte 3
	.short 10, 0
	.byte 0

scr_seq_0615_T20_hdr_0010:
	.short VAR_SCENE_PLAYERS_HOUSE_1F, 1, 4
	.short VAR_SCENE_NEW_BARK_TOWN_OW, 1, 9
	.short 0

	.balign 4, 0
