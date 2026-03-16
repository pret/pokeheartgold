#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_W40.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_W40_000 + 1
	InitScriptEntryEnd

	InitScriptEnd
