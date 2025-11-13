#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0203.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D24R0203_map_scripts_2
	InitScriptEntry_OnResume _EV_scr_seq_D24R0203_001 + 1
	InitScriptEntryEnd

scr_seq_D24R0203_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40CD, 1, _EV_scr_seq_D24R0203_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
