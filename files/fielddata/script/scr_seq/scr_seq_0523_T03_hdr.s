#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T03_008 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_T03_013 + 1
	InitScriptEntry_OnResume _EV_scr_seq_T03_011 + 1
	InitScriptEntry_OnFrameTable scr_seq_T03_map_scripts_2
	InitScriptEntryEnd

scr_seq_T03_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4083, 2, _EV_scr_seq_T03_012 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
