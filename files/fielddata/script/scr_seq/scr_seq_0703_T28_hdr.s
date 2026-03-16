#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T28_map_scripts_2
	InitScriptEntryEnd

scr_seq_T28_map_scripts_2:
	InitScriptGoToIfEqual VAR_MIDGAME_BADGES, 4, _EV_scr_seq_T28_005 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
