#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0207.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D31R0207_006 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D31R0207_007 + 1
	InitScriptEntry_OnFrameTable scr_seq_D31R0207_map_scripts_2
	InitScriptEntryEnd

scr_seq_D31R0207_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4151, 1, _EV_scr_seq_D31R0207_008 + 1
	InitScriptGoToIfEqual VAR_UNK_4151, 2, _EV_scr_seq_D31R0207_009 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
