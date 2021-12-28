#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0917_T26R0501_000E ; 000
	scrdef scr_seq_0917_T26R0501_0021 ; 001
	scrdef scr_seq_0917_T26R0501_0034 ; 002
	scrdef_end

scr_seq_0917_T26R0501_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0917_T26R0501_0021:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0917_T26R0501_0034:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AB9
	gotoif FALSE, scr_seq_0917_T26R0501_0050
	npc_msg 4
	goto scr_seq_0917_T26R0501_00E3

scr_seq_0917_T26R0501_0050:
	npc_msg 2
	hasitem ITEM_SEAL_CASE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0917_T26R0501_0071
	npc_msg 5
	goto scr_seq_0917_T26R0501_00E3

scr_seq_0917_T26R0501_0071:
	scrcmd_135 32768, 32769, 32770
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, scr_seq_0917_T26R0501_008F
	npc_msg 3
	goto scr_seq_0917_T26R0501_00E3

scr_seq_0917_T26R0501_008F:
	setflag FLAG_UNK_AB9
	scrcmd_580 0, 32768
	npc_msg 6
	play_fanfare SEQ_ME_ITEM
	npc_msg 11
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_0917_T26R0501_00EB
	scrcmd_580 0, 32769
	npc_msg 7
	play_fanfare SEQ_ME_ITEM
	npc_msg 11
	wait_fanfare
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_0917_T26R0501_00EB
	scrcmd_580 0, 32770
	npc_msg 8
	play_fanfare SEQ_ME_ITEM
	npc_msg 11
	wait_fanfare
	npc_msg 9
scr_seq_0917_T26R0501_00E3:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0917_T26R0501_00EB:
	npc_msg 10
	goto scr_seq_0917_T26R0501_00E3

scr_seq_0917_T26R0501_00F4:
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
