#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0103.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D35R0103_002 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_D35R0103_007 + 1
	InitScriptEntry_OnFrameTable scr_seq_D35R0103_map_scripts_2
	InitScriptEntryEnd

scr_seq_D35R0103_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40A9, 0, _EV_scr_seq_D35R0103_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
