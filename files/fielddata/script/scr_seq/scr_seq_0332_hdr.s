#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0071.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_0071_000 + 1
	InitScriptEntry_OnResume _EV_scr_seq_0071_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_0071_map_scripts_2
	InitScriptEntryEnd

scr_seq_0071_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_414E, 1, _EV_scr_seq_0071_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
