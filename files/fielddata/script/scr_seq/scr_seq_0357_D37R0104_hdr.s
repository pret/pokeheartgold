#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0104.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D37R0104_005 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D37R0104_006 + 1
	InitScriptEntryEnd

	InitScriptEnd
