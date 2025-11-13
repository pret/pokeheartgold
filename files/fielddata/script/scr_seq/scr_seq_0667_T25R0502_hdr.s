#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0502.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T25R0502_map_scripts_2
	InitScriptEntryEnd

scr_seq_T25R0502_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_411E, 0, _EV_scr_seq_T25R0502_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
