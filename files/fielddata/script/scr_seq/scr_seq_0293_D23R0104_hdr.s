#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0104.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D23R0104_000 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D23R0104_008 + 1
	InitScriptEntryEnd

	InitScriptEnd
