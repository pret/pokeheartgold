#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T02_008 + 1
	InitScriptEntry_OnFrameTable scr_seq_T02_map_scripts_2
	InitScriptEntryEnd

scr_seq_T02_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4096, 1, _EV_scr_seq_T02_011 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
