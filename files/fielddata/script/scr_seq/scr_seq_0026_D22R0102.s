#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0102.h"
#include "msgdata/msg/msg_0063_D22R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D22R0102_000
	scrdef scr_seq_D22R0102_001
	scrdef scr_seq_D22R0102_002
	scrdef scr_seq_D22R0102_003
	scrdef scr_seq_D22R0102_004
	scrdef scr_seq_D22R0102_005
	scrdef scr_seq_D22R0102_006
	scrdef scr_seq_D22R0102_007
	scrdef scr_seq_D22R0102_008
	scrdef scr_seq_D22R0102_009
	scrdef scr_seq_D22R0102_010
	scrdef scr_seq_D22R0102_011
	scrdef scr_seq_D22R0102_012
	scrdef_end

scr_seq_D22R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00015
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00018
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00021
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00024
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00027
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0063_D22R0102_00030
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D22R0102_000:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 0, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D22R0102_001:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_D22R0102_002:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 2, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
