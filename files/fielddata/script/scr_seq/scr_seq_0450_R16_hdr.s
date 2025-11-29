#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_R16_000 + 1
	InitScriptEntryEnd

	InitScriptEnd
