#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R43R0201.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_R43R0201_map_scripts_2
	InitScriptEntry_OnTransition _EV_scr_seq_R43R0201_002 + 1
	InitScriptEntryEnd

scr_seq_R43R0201_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_410F, 0, _EV_scr_seq_R43R0201_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
