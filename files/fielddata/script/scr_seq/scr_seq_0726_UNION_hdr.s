#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_UNION.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_UNION_000 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_UNION_001 + 1
	InitScriptEntry_OnResume _EV_scr_seq_UNION_002 + 1
	InitScriptEntryEnd

	InitScriptEnd
