#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T09PC0101.h"
#include "constants/init_script_types.h"
	.include "asm/macros/script.inc"

	.rodata
	.option alignment off

	InitScriptEntry_OnResume std_wireless_reset_state
	InitScriptEntry_OnFrameTable scr_seq_T09PC0101_map_scripts_2
	InitScriptEntryEnd

scr_seq_T09PC0101_map_scripts_2:
	InitScriptGoToIfEqual VAR_UNK_4133, 2, std_union_room_return
	InitScriptGoToIfEqual VAR_UNK_4133, 1, std_wireless_colosseum_return
	InitScriptFrameTableEnd

	InitScriptEnd
