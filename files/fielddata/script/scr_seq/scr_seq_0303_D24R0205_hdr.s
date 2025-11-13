#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0205.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D24R0205_map_scripts_2
	InitScriptEntry_OnResume _EV_scr_seq_D24R0205_001 + 1
	InitScriptEntry_OnTransition _EV_scr_seq_D24R0205_008 + 1
	InitScriptEntryEnd

scr_seq_D24R0205_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_40CE, 1, _EV_scr_seq_D24R0205_000 + 1
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 2, _EV_scr_seq_D24R0205_006 + 1
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 9, _EV_scr_seq_D24R0205_007 + 1
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 11, _EV_scr_seq_D24R0205_009 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
