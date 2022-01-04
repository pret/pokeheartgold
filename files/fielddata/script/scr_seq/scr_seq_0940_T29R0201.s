#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29R0201.h"
#include "msgdata/msg/msg_0628_T29R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T29R0201_000
	scrdef_end

scr_seq_T29R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, _003A
	checkflag FLAG_UNK_0C8
	gotoif TRUE, _002F
	npc_msg msg_0628_T29R0201_00000
	waitbutton
	closemsg
	releaseall
	end

_002F:
	npc_msg msg_0628_T29R0201_00001
	waitbutton
	closemsg
	releaseall
	end

_003A:
	script_overlay_cmd 0, 0
	scrcmd_389 32780, 129
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _005A
	npc_msg msg_0628_T29R0201_00002
	goto _0146

_005A:
	npc_msg msg_0628_T29R0201_00003
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 VAR_SPECIAL_x8002
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8002, 255
	gotoif ne, _0095
	npc_msg msg_0628_T29R0201_00010
	goto _0146

_0095:
	get_partymon_species VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 129
	gotoif eq, _00B1
	npc_msg msg_0628_T29R0201_00008
	goto _0146

_00B1:
	scrcmd_390 32780, 32770
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00E3
	scrcmd_392 0, 1, 32770
	scrcmd_393 2, 3, 129
	npc_msg msg_0628_T29R0201_00007
	goto _0146
	.byte 0x16, 0x00, 0x1e
	.byte 0x00, 0x00, 0x00
_00E3:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0101
	scrcmd_393 0, 1, 129
	npc_msg msg_0628_T29R0201_00006
	goto _0146

_0101:
	scrcmd_392 0, 1, 32770
	npc_msg msg_0628_T29R0201_00004
	setvar VAR_SPECIAL_x8004, 38
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0137
	callstd std_bag_is_full
	goto _0148

_0137:
	callstd std_give_item_verbose
	scrcmd_391 32770
	setflag FLAG_UNK_139
	npc_msg msg_0628_T29R0201_00005
_0146:
	waitbutton
_0148:
	closemsg
	script_overlay_cmd 0, 1
	releaseall
	end
	.balign 4, 0
