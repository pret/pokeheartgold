#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T04GYM0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T04GYM0101_map_scripts_2
	InitScriptEntry_OnLoad _EV_scr_seq_T04GYM0101_006 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_T04GYM0101_007 + 1
	InitScriptEntryEnd

scr_seq_T04GYM0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_411C, 1, _EV_scr_seq_T04GYM0101_004 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
