#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D27R0107.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D27R0107_003 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D27R0107_004 + 1
	InitScriptEntryEnd

	InitScriptEnd
