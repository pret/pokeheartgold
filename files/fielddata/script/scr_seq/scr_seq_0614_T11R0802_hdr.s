#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0802.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_T11R0802_004 + 1
	InitScriptEntry_OnResume _EV_scr_seq_T11R0802_005 + 1
	InitScriptEntryEnd

	InitScriptEnd
