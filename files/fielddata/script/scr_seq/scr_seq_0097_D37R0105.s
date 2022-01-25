#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0105.h"
#include "msgdata/msg/msg_0120_D37R0105.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0105_000
	scrdef scr_seq_D37R0105_001
	scrdef_end

scr_seq_D37R0105_000:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	compare VAR_UNK_4077, 4
	goto_if_ne _0027
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1B8
_0027:
	end

scr_seq_D37R0105_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity ITEM_CARD_KEY, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _005B
	npc_msg msg_0120_D37R0105_00000
	setflag FLAG_UNK_1C1
	giveitem_no_check ITEM_CARD_KEY, 1
_005B:
	npc_msg msg_0120_D37R0105_00002
	npc_msg msg_0120_D37R0105_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
