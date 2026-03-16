#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0501.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_T27R0501_013 + 1
	InitScriptEntry_OnFrameTable scr_seq_T27R0501_map_scripts_2
	InitScriptEntryEnd

scr_seq_T27R0501_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_410C, 0, _EV_scr_seq_T27R0501_015 + 1
	InitScriptGoToIfEqual VAR_UNK_410C, 4, _EV_scr_seq_T27R0501_016 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
