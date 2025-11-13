#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0401.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnLoad _EV_scr_seq_D32R0401_020 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D32R0401_015 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D32R0401_021 + 1
	InitScriptEntry_OnFrameTable scr_seq_D32R0401_map_scripts_2
	InitScriptEntryEnd

scr_seq_D32R0401_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4145, 1, _EV_scr_seq_D32R0401_003 + 1
	InitScriptGoToIfEqual VAR_UNK_4145, 2, _EV_scr_seq_D32R0401_001 + 1
	InitScriptGoToIfEqual VAR_UNK_4145, 3, _EV_scr_seq_D32R0401_004 + 1
	InitScriptGoToIfEqual VAR_UNK_4145, 255, _EV_scr_seq_D32R0401_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
