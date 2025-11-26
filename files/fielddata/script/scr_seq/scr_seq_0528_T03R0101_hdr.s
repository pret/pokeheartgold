#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T03R0101_014 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_T03R0101_017 + 1
	InitScriptEntry_OnResume _EV_scr_seq_T03R0101_018 + 1
	InitScriptEntryEnd

	InitScriptEnd
