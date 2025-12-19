#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0801.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T10R0801_map_scripts_2
	InitScriptEntry_OnLoad std_wifi_reset_state
	InitScriptEntryEnd

scr_seq_T10R0801_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_POKECENTER_WIFI_BASEMENT, 0, std_teala_first_intro
	InitScriptGoToIfEqual VAR_UNK_4137, 1, std_wifi_return
	InitScriptFrameTableEnd

	InitScriptEnd
