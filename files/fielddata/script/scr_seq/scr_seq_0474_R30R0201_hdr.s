#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30R0201.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnFrameTable scr_seq_R30R0201_map_scripts_2
	InitScriptEntry_OnResume _EV_scr_seq_R30R0201_003 + 1
	InitScriptEntryEnd

scr_seq_R30R0201_map_scripts_2:
	InitScriptGoToIfEqual VAR_SCENE_EMBEDDED_TOWER, 1, _EV_scr_seq_R30R0201_002 + 1
	InitScriptGoToIfEqual VAR_SCENE_MR_POKEMONS_HOUSE, 0, _EV_scr_seq_R30R0201_001 + 1
	InitScriptFrameTableEnd

	InitScriptEnd
