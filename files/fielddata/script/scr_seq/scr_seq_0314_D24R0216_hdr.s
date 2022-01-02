#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0216.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_D24R0216_map_scripts_2-.-4
	.byte 2
	.short _EV_scr_seq_D24R0216_004 + 1, 0
	.byte 3
	.short _EV_scr_seq_D24R0216_006 + 1, 0
	.byte 0

scr_seq_D24R0216_map_scripts_2:
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 2, _EV_scr_seq_D24R0216_001 + 1
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 9, _EV_scr_seq_D24R0216_002 + 1
	.short VAR_SCENE_SINJOH_MYSTRI_ROOM, 11, _EV_scr_seq_D24R0216_003 + 1
	.short VAR_UNK_40CE, 1, _EV_scr_seq_D24R0216_005 + 1
	.short 0

	.balign 4, 0
