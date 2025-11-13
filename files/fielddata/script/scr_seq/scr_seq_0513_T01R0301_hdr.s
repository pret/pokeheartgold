#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T01R0301.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T01R0301_010 + 1
	InitScriptEntry_OnFrameTable scr_seq_T01R0301_map_scripts_2
	InitScriptEntryEnd

scr_seq_T01R0301_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4131, 1, _EV_scr_seq_T01R0301_006 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
