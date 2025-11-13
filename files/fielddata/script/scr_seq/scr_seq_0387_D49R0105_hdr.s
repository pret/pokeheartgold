#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0105.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D49R0105_011 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D49R0105_012 + 1
	InitScriptEntryEnd

	InitScriptEnd
