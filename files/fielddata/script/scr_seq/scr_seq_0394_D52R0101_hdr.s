#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D52R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D52R0101_001 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_D52R0101_002 + 1
	InitScriptEntryEnd

	InitScriptEnd
