#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0209.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D24R0209_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_D24R0209_map_scripts_2
	InitScriptEntryEnd

scr_seq_D24R0209_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40D8, 1, _EV_scr_seq_D24R0209_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
