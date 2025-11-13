#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D52R0103.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D52R0103_map_scripts_2
	InitScriptEntry_OnLoad _EV_scr_seq_D52R0103_002 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D52R0103_003 + 1
	InitScriptEntryEnd

scr_seq_D52R0103_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_EMBEDDED_TOWER, 5, _EV_scr_seq_D52R0103_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
