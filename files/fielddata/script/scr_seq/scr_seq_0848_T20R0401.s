#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0848_T20R0401_0006 ; 000
	scrdef_end

scr_seq_0848_T20R0401_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_2E5
	gotoif TRUE, scr_seq_0848_T20R0401_0035
	comparevartovalue VAR_SCENE_ELMS_LAB, 1
	gotoif ge, scr_seq_0848_T20R0401_0044
	buffer_players_name 0
	gender_msgbox 0, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0848_T20R0401_0035:
	buffer_players_name 0
	gender_msgbox 2, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0848_T20R0401_0044:
	buffer_players_name 0
	gender_msgbox 4, 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
