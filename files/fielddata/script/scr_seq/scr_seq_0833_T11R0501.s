#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0501.h"
#include "msgdata/msg/msg_0534_T11R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0501_000
	scrdef_end

scr_seq_T11R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_12F
	gotoif TRUE, _0045
	npc_msg msg_0534_T11R0501_00000
	setvar VAR_SPECIAL_x8004, 356
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0050
	callstd std_give_item_verbose
	setflag FLAG_UNK_12F
_0045:
	npc_msg msg_0534_T11R0501_00001
	waitbutton
	closemsg
	releaseall
	end

_0050:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.balign 4, 0
