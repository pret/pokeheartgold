#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23R0501.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T23R0501_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_T23R0501_map_scripts_2
	InitScriptEntryEnd

scr_seq_T23R0501_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4080, 2, _EV_scr_seq_T23R0501_005 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
