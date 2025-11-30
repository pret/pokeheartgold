#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R0110.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnLoad _EV_scr_seq_D17R0110_002 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D17R0110_003 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D17R0110_005 + 1
	InitScriptEntryEnd

	InitScriptEnd
