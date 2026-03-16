#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R22R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_R22R0101_007 + 1
	InitScriptEntry_OnResume _EV_scr_seq_R22R0101_006 + 1
	InitScriptEntryEnd

	InitScriptEnd
