#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03R0201.h"
#include "msgdata/msg/msg_0465_T03R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T03R0201_000
	scrdef scr_seq_T03R0201_001
	scrdef_end

scr_seq_T03R0201_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0465_T03R0201_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03R0201_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 32, 0
	npc_msg msg_0465_T03R0201_00001
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
