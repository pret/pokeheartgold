#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0102.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D35R0102_030 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D35R0102_031 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_D35R0102_032 + 1
	InitScriptEntryEnd

	InitScriptEnd
