#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0301.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D32R0301_013 + 1
	InitScriptEntry_OnFrameTable scr_seq_D32R0301_map_scripts_2
	InitScriptEntryEnd

scr_seq_D32R0301_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4142, 1, _EV_scr_seq_D32R0301_003 + 1
	InitScriptGoToIfEqual VAR_UNK_4142, 2, _EV_scr_seq_D32R0301_001 + 1
	InitScriptGoToIfEqual VAR_UNK_4142, 3, _EV_scr_seq_D32R0301_004 + 1
	InitScriptGoToIfEqual VAR_UNK_4142, 255, _EV_scr_seq_D32R0301_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
