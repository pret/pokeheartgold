#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0102.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D32R0102_002 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D32R0102_004 + 1
	InitScriptEntryEnd

	InitScriptEnd
