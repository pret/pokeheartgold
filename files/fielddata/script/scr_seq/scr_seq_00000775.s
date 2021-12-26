#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000775_0000009D ; 000
	scrdef scr_seq_00000775_000000B0 ; 001
	scrdef scr_seq_00000775_000000C3 ; 002
	scrdef scr_seq_00000775_0000001E ; 003
	scrdef scr_seq_00000775_00000074 ; 004
	scrdef scr_seq_00000775_000000D6 ; 005
	scrdef scr_seq_00000775_000000E7 ; 006
	scrdef_end

scr_seq_00000775_0000001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_11F
	gotoif TRUE, scr_seq_00000775_00000069
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_00000775_00000047
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_00000047:
	buffer_players_name 0
	gender_msgbox 4, 5
	msgbox 6
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	setflag FLAG_UNK_11F
	checkflag FLAG_UNK_08A
	gotoif TRUE, scr_seq_00000775_00000069
	register_pokegear_card 2
scr_seq_00000775_00000069:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_00000074:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_11F
	gotoif TRUE, scr_seq_00000775_00000092
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_00000092:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_0000009D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_000000B0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_000000C3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_000000D6:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000775_000000E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
