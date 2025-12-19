#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0701.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T11R0701_002 + 1
	InitScriptEntry_OnResume _EV_scr_seq_T11R0701_005 + 1
	InitScriptEntryEnd

	InitScriptEnd
