#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0203.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T07R0203_008 + 1
	InitScriptEntry_OnResume _EV_scr_seq_T07R0203_011 + 1
	InitScriptEntry_OnFrameTable scr_seq_T07R0203_map_scripts_2
	InitScriptEntryEnd

scr_seq_T07R0203_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_412C, 0, _EV_scr_seq_T07R0203_010 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
