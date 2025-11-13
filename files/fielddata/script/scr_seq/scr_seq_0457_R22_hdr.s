#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_R22_001 + 1
	InitScriptEntry_OnResume _EV_scr_seq_R22_004 + 1
	InitScriptEntry_OnFrameTable scr_seq_R22_map_scripts_2
	InitScriptEntryEnd

scr_seq_R22_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40FE, 1, _EV_scr_seq_R22_003 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
