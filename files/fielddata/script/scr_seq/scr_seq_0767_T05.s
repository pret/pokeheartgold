#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T05.h"
#include "msgdata/msg/msg_0475_T05.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T05_000
	scrdef scr_seq_T05_001
	scrdef scr_seq_T05_002
	scrdef scr_seq_T05_003
	scrdef scr_seq_T05_004
	scrdef scr_seq_T05_005
	scrdef scr_seq_T05_006
	scrdef scr_seq_T05_007
	scrdef_end

scr_seq_T05_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00002
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0475_T05_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T05_004:
	scrcmd_055 4, 0, 5, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T05_005:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 5, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T05_006:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_T05_007:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 7, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
