#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R30R0101.h"
#include "msgdata/msg/msg_0376_R30R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R30R0101_000
	scrdef_end

scr_seq_R30R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_APRICORN_BOX, _0041
	npc_msg msg_0376_R30R0101_00000
	giveitem_no_check ITEM_APRICORN_BOX, 1
	setflag FLAG_GOT_APRICORN_BOX
	setvar VAR_SCENE_ROUTE_30_OW, 1
	npc_msg msg_0376_R30R0101_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0041:
	npc_msg msg_0376_R30R0101_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
