#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R16R0101.h"
#include "msgdata/msg/msg_0355_R16R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R16R0101_000
	scrdef scr_seq_R16R0101_001
	scrdef_end

scr_seq_R16R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_ABA, _0068
	scrcmd_540 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _007E
	npc_msg msg_0355_R16R0101_00001
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0073
	scrcmd_538 VAR_SPECIAL_RESULT, 0
	compare VAR_SPECIAL_RESULT, 65535
	goto_if_eq _007E
	setflag FLAG_UNK_ABA
	npc_msg msg_0355_R16R0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0068:
	npc_msg msg_0355_R16R0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0073:
	npc_msg msg_0355_R16R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_007E:
	npc_msg msg_0355_R16R0101_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R16R0101_000:
	simple_npc_msg msg_0355_R16R0101_00000
	end
	.balign 4, 0
