#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D25R0103.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D25R0103_002 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_D25R0103_001 + 1
	InitScriptEntryEnd

	InitScriptEnd
