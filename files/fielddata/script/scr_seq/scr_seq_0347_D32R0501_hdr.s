#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0501.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D32R0501_013 + 1
	InitScriptEntry_OnFrameTable scr_seq_D32R0501_map_scripts_2
	InitScriptEntryEnd

scr_seq_D32R0501_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4147, 1, _EV_scr_seq_D32R0501_003 + 1
	InitScriptGoToIfEqual VAR_UNK_4147, 2, _EV_scr_seq_D32R0501_001 + 1
	InitScriptGoToIfEqual VAR_UNK_4147, 3, _EV_scr_seq_D32R0501_004 + 1
	InitScriptGoToIfEqual VAR_UNK_4147, 255, _EV_scr_seq_D32R0501_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
