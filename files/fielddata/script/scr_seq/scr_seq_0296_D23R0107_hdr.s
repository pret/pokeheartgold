#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0107.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D23R0107_map_scripts_2
	InitScriptEntryEnd

scr_seq_D23R0107_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4125, 0, _EV_scr_seq_D23R0107_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
