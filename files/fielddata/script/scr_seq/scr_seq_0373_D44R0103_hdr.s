#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D44R0103.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D44R0103_map_scripts_2
	InitScriptEntry_OnTransition _EV_scr_seq_D44R0103_004 + 1
	InitScriptEntryEnd

scr_seq_D44R0103_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40C3, 0, _EV_scr_seq_D44R0103_003 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
