#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D48R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D48R0101_map_scripts_2
	InitScriptEntry_OnTransition _EV_scr_seq_D48R0101_005 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D48R0101_006 + 1
	InitScriptEntryEnd

scr_seq_D48R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_EMBEDDED_TOWER, 2, _EV_scr_seq_D48R0101_004 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
