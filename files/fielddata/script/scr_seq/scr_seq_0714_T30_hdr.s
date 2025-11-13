#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T30_005 + 1
	InitScriptEntry_OnFrameTable scr_seq_T30_map_scripts_2
	InitScriptEntryEnd

scr_seq_T30_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_407B, 1, _EV_scr_seq_T30_007 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
