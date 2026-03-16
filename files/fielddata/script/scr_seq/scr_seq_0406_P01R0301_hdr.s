#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0301.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_P01R0301_006 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_P01R0301_007 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_P01R0301_008 + 1
	InitScriptEntry_OnFrameTable scr_seq_P01R0301_map_scripts_2
	InitScriptEntryEnd

scr_seq_P01R0301_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40DC, 0, _EV_scr_seq_P01R0301_005 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
