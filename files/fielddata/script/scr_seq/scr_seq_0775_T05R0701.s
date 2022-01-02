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
	checkflag FLAG_GOT_EXPN_CARD
	gotoif TRUE, _0069
	checkflag FLAG_RESTORED_POWER
	gotoif TRUE, _0047
	npc_msg msg_0482_T05R0701_00003
	waitbutton
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
	checkflag FLAG_GOT_RADIO_CARD
	gotoif TRUE, _0069
	register_pokegear_card 2
_0069:
	npc_msg msg_0482_T05R0701_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0701_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_GOT_EXPN_CARD
	gotoif TRUE, _0092
	npc_msg msg_0482_T05R0701_00008
	waitbutton
	closemsg
	releaseall
	end

_0092:
	npc_msg msg_0482_T05R0701_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0701_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0482_T05R0701_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0701_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0482_T05R0701_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0701_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0482_T05R0701_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0701_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0482_T05R0701_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0701_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0482_T05R0701_00011
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
