#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0104.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D35R0104_006 + 1
	InitScriptEntry_OnFrameTable scr_seq_D35R0104_map_scripts_2
	InitScriptEntry_OnResume _EV_scr_seq_D35R0104_008 + 1
	InitScriptEntryEnd

scr_seq_D35R0104_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40AC, 0, _EV_scr_seq_D35R0104_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
