#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0401.h"
#include "msgdata/msg/msg_0617_T27R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27R0401_000
	scrdef scr_seq_T27R0401_001
	scrdef_end

	.byte 0x02, 0x00
scr_seq_T27R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0617_T27R0401_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0401_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0617_T27R0401_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
