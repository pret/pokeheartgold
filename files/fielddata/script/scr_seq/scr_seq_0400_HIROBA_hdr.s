#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_HIROBA.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_HIROBA_map_scripts_2
	InitScriptEntryEnd

scr_seq_HIROBA_map_scripts_2:
	InitScriptGoToIfEqual VAR_TEMP_x4003, 0, _EV_scr_seq_HIROBA_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
