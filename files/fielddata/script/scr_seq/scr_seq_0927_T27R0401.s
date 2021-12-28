#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0927_T27R0401_000C ; 000
	scrdef scr_seq_0927_T27R0401_001F ; 001
	scrdef_end


scr_seq_0927_T27R0401_000A:
	.byte 0x02, 0x00
scr_seq_0927_T27R0401_000C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0927_T27R0401_001F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
