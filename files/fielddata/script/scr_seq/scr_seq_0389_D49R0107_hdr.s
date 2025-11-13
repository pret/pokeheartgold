#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0107.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume _EV_scr_seq_D49R0107_006 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D49R0107_007 + 1
	InitScriptEntry_OnFrameTable scr_seq_D49R0107_map_scripts_2
	InitScriptEntryEnd

scr_seq_D49R0107_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40D3, 0, _EV_scr_seq_D49R0107_005 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
