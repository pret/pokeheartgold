#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_P01R0101_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_P01R0101_map_scripts_2
	InitScriptEntryEnd

scr_seq_P01R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_411A, 1, _EV_scr_seq_P01R0101_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
