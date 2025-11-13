#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1201.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_T25R1201_001 + 1
	InitScriptEntry_OnFrameTable scr_seq_T25R1201_map_scripts_2
	InitScriptEntryEnd

scr_seq_T25R1201_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4133, 6, _EV_scr_seq_T25R1201_002 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
