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
	checkflag FLAG_UNK_06D
	gotoif TRUE, _0041
	npc_msg msg_0376_R30R0101_00000
	setvar VAR_SPECIAL_x8004, 468
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_06D
	setvar VAR_UNK_408C, 1
	npc_msg msg_0376_R30R0101_00002
	waitbutton
	closemsg
	releaseall
	end

_0041:
	npc_msg msg_0376_R30R0101_00003
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
