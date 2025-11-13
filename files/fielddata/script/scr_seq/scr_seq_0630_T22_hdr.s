#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T22_map_scripts_2
	InitScriptEntryEnd

scr_seq_T22_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_VIOLET_CITY_OW, 1, _EV_scr_seq_T22_000 + 1
	InitScriptGoToIfEqual VAR_SCENE_VIOLET_CITY_OW, 3, _EV_scr_seq_T22_004 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
