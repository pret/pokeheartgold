#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0601.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D32R0601_014 + 1
	InitScriptEntry_OnFrameTable scr_seq_D32R0601_map_scripts_2
	InitScriptEntryEnd

scr_seq_D32R0601_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_414A, 1, _EV_scr_seq_D32R0601_003 + 1
	InitScriptGoToIfEqual VAR_UNK_414A, 2, _EV_scr_seq_D32R0601_001 + 1
	InitScriptGoToIfEqual VAR_UNK_414A, 3, _EV_scr_seq_D32R0601_004 + 1
	InitScriptGoToIfEqual VAR_UNK_414A, 255, _EV_scr_seq_D32R0601_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
