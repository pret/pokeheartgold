#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_R30_map_scripts_2
	InitScriptEntryEnd

scr_seq_R30_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_ROUTE_30_OW, 2, _EV_scr_seq_R30_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
