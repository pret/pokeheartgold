#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0775_T05R0701_009D ; 000
	scrdef scr_seq_0775_T05R0701_00B0 ; 001
	scrdef scr_seq_0775_T05R0701_00C3 ; 002
	scrdef scr_seq_0775_T05R0701_001E ; 003
	scrdef scr_seq_0775_T05R0701_0074 ; 004
	scrdef scr_seq_0775_T05R0701_00D6 ; 005
	scrdef scr_seq_0775_T05R0701_00E7 ; 006
	scrdef_end

scr_seq_0775_T05R0701_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_11F
	gotoif TRUE, scr_seq_0775_T05R0701_0069
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0775_T05R0701_0047
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_0047:
	buffer_players_name 0
	gender_msgbox 4, 5
	npc_msg 6
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	setflag FLAG_UNK_11F
	checkflag FLAG_UNK_08A
	gotoif TRUE, scr_seq_0775_T05R0701_0069
	register_pokegear_card 2
scr_seq_0775_T05R0701_0069:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_0074:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_11F
	gotoif TRUE, scr_seq_0775_T05R0701_0092
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_0092:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_009D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_00B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_00C3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_00D6:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0775_T05R0701_00E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
