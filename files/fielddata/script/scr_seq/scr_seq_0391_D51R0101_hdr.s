#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D51R0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_D51R0101_map_scripts_2
	InitScriptEntry_OnResume _EV_scr_seq_D51R0101_002 + 1
	InitScriptEntryEnd

scr_seq_D51R0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_SINJOH_MYSTRI_ROOM, 4, _EV_scr_seq_D51R0101_000 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
