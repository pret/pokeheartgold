#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D40R0107.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnLoad _EV_scr_seq_D40R0107_002 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D40R0107_004 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D40R0107_006 + 1
	InitScriptEntryEnd

	InitScriptEnd
