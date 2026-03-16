#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0201.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T20R0201_map_scripts_2
	InitScriptEntryEnd

scr_seq_T20R0201_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_PLAYERS_HOUSE_1F, 3, _EV_scr_seq_T20R0201_006 + 1
	InitScriptGoToIfEqual VAR_SCENE_PLAYERS_HOUSE_1F, 0, _EV_scr_seq_T20R0201_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
