#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D22R0101_map_scripts_2
	InitScriptEntry_OnResume _EV_scr_seq_D22R0101_011 + 1, 0
	InitScriptEntry_OnTransition _EV_scr_seq_D22R0101_025 + 1, 0
	InitScriptEntryEnd

scr_seq_D22R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40F7, 1, std_bug_contest_judging
	InitScriptFrameTableEnd

	InitScriptEnd
