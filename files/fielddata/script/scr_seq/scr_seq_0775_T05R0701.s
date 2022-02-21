#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0701.h"
#include "msgdata/msg/msg_0482_T05R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T05R0701_000
	scrdef scr_seq_T05R0701_001
	scrdef scr_seq_T05R0701_002
	scrdef scr_seq_T05R0701_003
	scrdef scr_seq_T05R0701_004
	scrdef scr_seq_T05R0701_005
	scrdef scr_seq_T05R0701_006
	scrdef_end

scr_seq_T05R0701_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_EXPN_CARD, _0069
	goto_if_set FLAG_RESTORED_POWER, _0047
	npc_msg msg_0482_T05R0701_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0047:
	buffer_players_name 0
	gender_msgbox msg_0482_T05R0701_00004, msg_0482_T05R0701_00005
	npc_msg msg_0482_T05R0701_00006
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	setflag FLAG_GOT_EXPN_CARD
	goto_if_set FLAG_GOT_RADIO_CARD, _0069
	register_pokegear_card 2
_0069:
	npc_msg msg_0482_T05R0701_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T05R0701_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_EXPN_CARD, _0092
	npc_msg msg_0482_T05R0701_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0092:
	npc_msg msg_0482_T05R0701_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T05R0701_000:
	simple_npc_msg msg_0482_T05R0701_00000
	end

scr_seq_T05R0701_001:
	simple_npc_msg msg_0482_T05R0701_00001
	end

scr_seq_T05R0701_002:
	simple_npc_msg msg_0482_T05R0701_00002
	end

scr_seq_T05R0701_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0482_T05R0701_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T05R0701_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0482_T05R0701_00011
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
