#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T26_012 + 1
	InitScriptEntry_OnFrameTable scr_seq_T26_map_scripts_2
	InitScriptEntryEnd

scr_seq_T26_map_scripts_2:
	InitScriptGoToIfEqual VAR_MIDGAME_BADGES, 4, _EV_scr_seq_T26_002 + 1
	InitScriptGoToIfEqual VAR_SCENE_LIGHTHOUSE_JASMINE, 2, _EV_scr_seq_T26_003 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
