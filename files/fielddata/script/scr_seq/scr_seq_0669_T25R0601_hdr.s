#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0601.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T25R0601_002 + 1
	InitScriptEntry_OnFrameTable scr_seq_T25R0601_map_scripts_2
	InitScriptEntryEnd

scr_seq_T25R0601_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4082, 1, _EV_scr_seq_T25R0601_003 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
