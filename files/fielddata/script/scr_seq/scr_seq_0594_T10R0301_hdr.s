#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0301.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T10R0301_map_scripts_2
	InitScriptEntry_OnLoad _EV_scr_seq_T10R0301_002 + 1
	InitScriptEntryEnd

scr_seq_T10R0301_map_scripts_2:
	InitScriptGoToIfEqual VAR_TEMP_x4001, 0, _EV_scr_seq_T10R0301_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
