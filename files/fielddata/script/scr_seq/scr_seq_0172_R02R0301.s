#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R02R0301.h"
#include "msgdata/msg/msg_0323_R02R0301.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R02R0301_000
	scrdef scr_seq_R02R0301_001
	scrdef_end

scr_seq_R02R0301_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_135, _004D
	buffer_players_name 0
	gender_msgbox msg_0323_R02R0301_00000, msg_0323_R02R0301_00001
	goto_if_no_item_space ITEM_SACRED_ASH, 1, _0058
	callstd std_give_item_verbose
	setflag FLAG_UNK_135
_004D:
	npc_msg msg_0323_R02R0301_00002
	waitbutton
	closemsg
	releaseall
	end

_0058:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_R02R0301_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0323_R02R0301_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
