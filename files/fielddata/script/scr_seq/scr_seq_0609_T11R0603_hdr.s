#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0603.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_T11R0603_map_scripts_2
	InitScriptEntryEnd

scr_seq_T11R0603_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_411F, 1, _EV_scr_seq_T11R0603_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
