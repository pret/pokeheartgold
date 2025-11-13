#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D45R0102.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D45R0102_000 + 1
	InitScriptEntry_OnLoad _EV_scr_seq_D45R0102_002 + 1
	InitScriptEntry_OnFrameTable scr_seq_D45R0102_map_scripts_2
	InitScriptEntryEnd

scr_seq_D45R0102_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40FE, 2, _EV_scr_seq_D45R0102_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
