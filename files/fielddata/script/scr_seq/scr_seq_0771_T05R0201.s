#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05R0201.h"
#include "msgdata/msg/msg_0478_T05R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T05R0201_000
	scrdef scr_seq_T05R0201_001
	scrdef scr_seq_T05R0201_002
	scrdef scr_seq_T05R0201_003
	scrdef scr_seq_T05R0201_004
	scrdef_end

scr_seq_T05R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05R0201_002:
	scrcmd_076 54, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00002
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end

scr_seq_T05R0201_003:
	scrcmd_076 33, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00003
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end

scr_seq_T05R0201_004:
	scrcmd_076 16, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0478_T05R0201_00004
	waitbutton
	closemsg
	releaseall
	scrcmd_077
	end
	.balign 4, 0
