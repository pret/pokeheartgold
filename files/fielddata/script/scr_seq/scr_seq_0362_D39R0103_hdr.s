#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D39R0103.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D39R0103_map_scripts_2
	InitScriptEntry_OnResume _EV_scr_seq_D39R0103_001 + 1
	InitScriptEntryEnd

scr_seq_D39R0103_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40AB, 1, _EV_scr_seq_D39R0103_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
