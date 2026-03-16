#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0108.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D27R0108_map_scripts_2
	InitScriptEntryEnd

scr_seq_D27R0108_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4125, 0, _EV_scr_seq_D27R0108_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
