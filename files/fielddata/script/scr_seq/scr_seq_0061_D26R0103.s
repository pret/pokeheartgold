#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D26R0103.h"
#include "msgdata/msg/msg_0092_D26R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D26R0103_000
	scrdef_end

scr_seq_D26R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_07A
	gotoif TRUE, _004F
	npc_msg msg_0092_D26R0103_00000
	scrcmd_049
	closemsg
	setvar VAR_SPECIAL_x8004, 221
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _005A
	callstd std_give_item_verbose
	setflag FLAG_UNK_07A
	goto _004F

_004F:
	npc_msg msg_0092_D26R0103_00002
	waitbutton
	closemsg
	releaseall
	end

_005A:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
