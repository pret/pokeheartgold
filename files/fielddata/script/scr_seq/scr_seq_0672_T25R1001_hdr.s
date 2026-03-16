#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1001.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition std_hide_show_deliverymen
	InitScriptEntryEnd

	InitScriptEnd
