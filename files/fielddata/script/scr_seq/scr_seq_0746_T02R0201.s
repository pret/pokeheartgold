#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02R0201.h"
#include "msgdata/msg/msg_0456_T02R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T02R0201_000
	scrdef scr_seq_T02R0201_001
	scrdef scr_seq_T02R0201_002
	scrdef scr_seq_T02R0201_003
	scrdef_end

scr_seq_T02R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0456_T02R0201_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T02R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0456_T02R0201_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T02R0201_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 21, 0
	npc_msg msg_0456_T02R0201_00002
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T02R0201_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 19, 0
	npc_msg msg_0456_T02R0201_00003
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
