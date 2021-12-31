#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R46.h"
#include "msgdata/msg/msg_0406_R46.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R46_000
	scrdef scr_seq_R46_001
	scrdef scr_seq_R46_002
	scrdef_end

scr_seq_R46_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_079
	gotoif TRUE, _002C
	npc_msg msg_0406_R46_00002
	waitbutton
	closemsg
	releaseall
	end

_002C:
	npc_msg msg_0406_R46_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_R46_001:
	scrcmd_055 0, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_R46_002:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
