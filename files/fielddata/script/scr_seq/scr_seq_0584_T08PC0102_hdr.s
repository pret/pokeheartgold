#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08PC0102.h"
	.rodata
	.option alignment off

	.byte 1
	.word scr_seq_T08PC0102_map_scripts_2-.-4
	.byte 4
	.short std_wifi_reset_state, 0
	.byte 0

scr_seq_T08PC0102_map_scripts_2:
	.short VAR_SCENE_POKECENTER_WIFI_BASEMENT, 0, std_teala_first_intro
	.short VAR_UNK_4137, 1, std_wifi_return
	.short 0

	.balign 4, 0
