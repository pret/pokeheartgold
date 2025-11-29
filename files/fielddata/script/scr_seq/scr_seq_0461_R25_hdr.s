#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R25.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_R25_003 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_R25_008 + 1
	InitScriptEntryEnd

	InitScriptEnd
