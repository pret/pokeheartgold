#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D01R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D01R0101_000 + 1
	InitScriptEntryEnd

	InitScriptEnd
