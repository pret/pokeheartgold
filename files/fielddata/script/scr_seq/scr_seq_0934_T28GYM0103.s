#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T28GYM0103.h"
#include "msgdata/msg/msg_0623_T28GYM0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T28GYM0103_000
	scrdef scr_seq_T28GYM0103_001
	scrdef_end

scr_seq_T28GYM0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 6, VAR_SPECIAL_x800C
	compare VAR_SPECIAL_x800C, 1
	goto_if_eq _0030
	npc_msg msg_0623_T28GYM0103_00000
	waitbutton
	closemsg
	releaseall
	end

_0030:
	npc_msg msg_0623_T28GYM0103_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T28GYM0103_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 6, VAR_SPECIAL_x800C
	buffer_players_name 0
	compare VAR_SPECIAL_x800C, 0
	goto_if_ne _0062
	npc_msg msg_0623_T28GYM0103_00002
	goto _0065

_0062:
	npc_msg msg_0623_T28GYM0103_00003
_0065:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
