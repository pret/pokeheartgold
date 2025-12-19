#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_T20R0101_010 + 1
	InitScriptEntry_OnFrameTable scr_seq_T20R0101_map_scripts_2
	InitScriptEntryEnd

scr_seq_T20R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40FC, 2, _EV_scr_seq_T20R0101_015 + 1
	InitScriptGoToIfEqual VAR_SCENE_ELMS_LAB, 3, _EV_scr_seq_T20R0101_002 + 1
	InitScriptGoToIfEqual VAR_SCENE_ELMS_LAB, 8, _EV_scr_seq_T20R0101_014 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
