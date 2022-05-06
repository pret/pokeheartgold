#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30R0201.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_R30R0201_map_scripts_2-.-4
	.byte 3
	.short _EV_scr_seq_R30R0201_003 + 1, 0
	.byte 0

scr_seq_R30R0201_map_scripts_2:
	.short VAR_SCENE_EMBEDDED_TOWER, 1, _EV_scr_seq_R30R0201_002 + 1
	.short VAR_SCENE_MR_POKEMONS_HOUSE, 0, _EV_scr_seq_R30R0201_001 + 1
	.short 0

	.balign 4, 0
