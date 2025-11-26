#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D31R0202.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D31R0202_000 + 1
	InitScriptEntry_OnFrameTable scr_seq_D31R0202_map_scripts_2
	InitScriptEntryEnd

scr_seq_D31R0202_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_414D, 1, _EV_scr_seq_D31R0202_001 + 1
	InitScriptGoToIfEqual VAR_UNK_414D, 2, _EV_scr_seq_D31R0202_002 + 1
	InitScriptGoToIfEqual VAR_UNK_414D, 3, _EV_scr_seq_D31R0202_003 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
