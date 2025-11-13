#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_T27_000 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_T27_015 + 1
	InitScriptEntry_OnFrameTable scr_seq_T27_map_scripts_2
	InitScriptEntryEnd

scr_seq_T27_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4079, 1, _EV_scr_seq_T27_012 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
