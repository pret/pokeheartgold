#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0106.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D11R0106_008 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D11R0106_009 + 1
	InitScriptEntryEnd

	InitScriptEnd
