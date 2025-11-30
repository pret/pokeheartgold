#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnLoad _EV_scr_seq_T29_002 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_T29_000 + 1
	InitScriptEntryEnd

	InitScriptEnd
