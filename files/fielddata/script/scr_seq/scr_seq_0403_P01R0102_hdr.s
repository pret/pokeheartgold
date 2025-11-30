#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0102.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_P01R0102_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_P01R0102_map_scripts_2
	InitScriptEntry_OnTransition _EV_scr_seq_P01R0102_005 + 1
	InitScriptEntryEnd

scr_seq_P01R0102_map_scripts_2:
	InitScriptGoToIfEqual VAR_BOAT_DIRECTION, 2, _EV_scr_seq_P01R0102_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
