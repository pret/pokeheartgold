#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0201.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnTransition _EV_scr_seq_D51R0201_002 + 1
	InitScriptEntry_OnFrameTable scr_seq_D51R0201_map_scripts_2
	InitScriptEntryEnd

scr_seq_D51R0201_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 3, _EV_scr_seq_D51R0201_006 + 1
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 12, _EV_scr_seq_D51R0201_007 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
