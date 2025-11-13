#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_R34R0101_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_R34R0101_map_scripts_2
	InitScriptEntryEnd

scr_seq_R34R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_408E, 1, _EV_scr_seq_R34R0101_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
