#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D35R0101_001 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_D35R0101_008 + 1
	InitScriptEntry_OnFrameTable scr_seq_D35R0101_map_scripts_2
	InitScriptEntryEnd

scr_seq_D35R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40A8, 1, _EV_scr_seq_D35R0101_006 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
