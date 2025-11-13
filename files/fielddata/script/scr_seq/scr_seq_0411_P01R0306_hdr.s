#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0306.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_P01R0306_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_P01R0306_map_scripts_2
	InitScriptEntryEnd

scr_seq_P01R0306_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40CB, 5, _EV_scr_seq_P01R0306_003 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
