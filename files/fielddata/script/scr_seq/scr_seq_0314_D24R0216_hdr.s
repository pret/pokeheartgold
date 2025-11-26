#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0216.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D24R0216_map_scripts_2
	InitScriptEntry_OnTransition _EV_scr_seq_D24R0216_004 + 1
	InitScriptEntry_OnResume _EV_scr_seq_D24R0216_006 + 1
	InitScriptEntryEnd

scr_seq_D24R0216_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 2, _EV_scr_seq_D24R0216_001 + 1
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 9, _EV_scr_seq_D24R0216_002 + 1
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 11, _EV_scr_seq_D24R0216_003 + 1
	InitScriptGoToIfEqual VAR_UNK_40CE, 1, _EV_scr_seq_D24R0216_005 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
