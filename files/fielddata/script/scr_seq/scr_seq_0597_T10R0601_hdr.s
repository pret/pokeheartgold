#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0601.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T10R0601_map_scripts_2
	InitScriptEntry_OnTransition _EV_scr_seq_T10R0601_002 + 1
	InitScriptEntryEnd

scr_seq_T10R0601_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40C8, 0, _EV_scr_seq_T10R0601_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
