#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T22R0701.h"
#include "msgdata/msg/msg_0563_T22R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T22R0701_000
	scrdef scr_seq_T22R0701_001
	scrdef_end

scr_seq_T22R0701_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_1C2, _0026
	npc_msg msg_0563_T22R0701_00000
	goto _0029

_0026:
	npc_msg msg_0563_T22R0701_00001
_0029:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T22R0701_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0563_T22R0701_00002
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
