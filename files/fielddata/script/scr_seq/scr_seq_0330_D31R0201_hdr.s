#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0201.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D31R0201_021 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D31R0201_022 + 1
	InitScriptEntry_OnFrameTable scr_seq_D31R0201_map_scripts_2
	InitScriptEntryEnd

scr_seq_D31R0201_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_414B, 1, _EV_scr_seq_D31R0201_003 + 1
	InitScriptGoToIfEqual VAR_UNK_414B, 2, _EV_scr_seq_D31R0201_004 + 1
	InitScriptGoToIfEqual VAR_UNK_414B, 3, _EV_scr_seq_D31R0201_007 + 1
	InitScriptGoToIfEqual VAR_UNK_414B, 255, _EV_scr_seq_D31R0201_005 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
