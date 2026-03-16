#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0104.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D02R0104_000 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_D02R0104_005 + 1
	InitScriptEntryEnd

	InitScriptEnd
