#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D47R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D47R0101_map_scripts_2
	InitScriptEntryEnd

scr_seq_D47R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_SAFARI_ZONE_ENTRANCE, 1, _EV_scr_seq_D47R0101_006 + 1
	InitScriptGoToIfEqual VAR_SCENE_SAFARI_ZONE_ENTRANCE, 3, _EV_scr_seq_D47R0101_006 + 1
	InitScriptGoToIfEqual VAR_SCENE_SAFARI_ZONE_ENTRANCE, 2, _EV_scr_seq_D47R0101_007 + 1
	InitScriptGoToIfEqual VAR_UNK_4057, 1, _EV_scr_seq_D47R0101_008 + 1
	InitScriptGoToIfEqual VAR_UNK_4057, 4, _EV_scr_seq_D47R0101_009 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
