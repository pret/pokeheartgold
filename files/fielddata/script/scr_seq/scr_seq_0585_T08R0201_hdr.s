#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08R0201.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T08R0201_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_T08R0201_map_scripts_2
	InitScriptEntryEnd

scr_seq_T08R0201_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4124, 1, _EV_scr_seq_T08R0201_001 + 1
	InitScriptGoToIfEqual VAR_UNK_4124, 2, _EV_scr_seq_T08R0201_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
