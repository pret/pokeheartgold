#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D36R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D36R0101_000 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D36R0101_021 + 1
	InitScriptEntry_OnFrameTable scr_seq_D36R0101_map_scripts_2
	InitScriptEntryEnd

scr_seq_D36R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40FE, 4, _EV_scr_seq_D36R0101_022 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
