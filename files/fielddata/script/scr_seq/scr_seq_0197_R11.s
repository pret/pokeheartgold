#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R11.h"
#include "msgdata/msg/msg_0346_R11.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R11_000
	scrdef scr_seq_R11_001
	scrdef scr_seq_R11_002
	scrdef scr_seq_R11_003
	scrdef_end

scr_seq_R11_001:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, _002A
	checkflag FLAG_UNK_0F9
	gotoif TRUE, _0044
	end

_002A:
	setflag FLAG_UNK_261
	hide_person 4
	hide_person 8
	hide_person 7
	hide_person 9
	clearflag FLAG_UNK_0A4
	end

_0044:
	end

scr_seq_R11_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_779 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _006A
	npc_msg msg_0346_R11_00002
	waitbutton
	closemsg
	releaseall
	end

_006A:
	scrcmd_076 143, 0
	npc_msg msg_0346_R11_00003
	scrcmd_077
	closemsg
	setflag FLAG_UNK_0A4
	scrcmd_589 143, 50, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _00B4
	scrcmd_683 16389
	comparevartovalue VAR_TEMP_x4005, 4
	callif eq, _00BA
	setflag FLAG_UNK_998
	setflag FLAG_UNK_0F9
	releaseall
	end

_00B4:
	white_out
	releaseall
	end

_00BA:
	setflag FLAG_UNK_173
	return

scr_seq_R11_002:
	scrcmd_055 0, 1, 2, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R11_003:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
