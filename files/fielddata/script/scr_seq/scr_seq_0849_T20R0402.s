#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0849_T20R0402_0027 ; 000
	scrdef scr_seq_0849_T20R0402_01A1 ; 001
	scrdef scr_seq_0849_T20R0402_0016 ; 002
	scrdef scr_seq_0849_T20R0402_01BC ; 003
	scrdef scr_seq_0849_T20R0402_01CD ; 004
	scrdef_end

scr_seq_0849_T20R0402_0016:
	checkflag FLAG_UNK_2E5
	gotoif TRUE, scr_seq_0849_T20R0402_0025
	get_friend_sprite VAR_OBJ_0
scr_seq_0849_T20R0402_0025:
	end

scr_seq_0849_T20R0402_0027:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0849_T20R0402_006D
	buffer_players_name 0
	checkflag FLAG_GOT_STARTER
	gotoif TRUE, scr_seq_0849_T20R0402_005C
	gender_msgbox 0, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_005C:
	buffer_mon_species_name 1, VAR_SPECIAL_x800C
	gender_msgbox 2, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_006D:
	get_lead_mon_index VAR_SPECIAL_x8006
	scrcmd_825 32774, 32780
	checkflag FLAG_UNK_161
	gotoif TRUE, scr_seq_0849_T20R0402_00B1
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0849_T20R0402_009E
scr_seq_0849_T20R0402_008F:
	buffer_players_name 0
	gender_msgbox 5, 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_009E:
	setflag FLAG_UNK_161
	buffer_players_name 0
	gender_msgbox 7, 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_00B1:
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_0849_T20R0402_00E4
	comparevartovalue VAR_SPECIAL_x8004, 5
	gotoif eq, scr_seq_0849_T20R0402_00FC
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ge, scr_seq_0849_T20R0402_0137
	goto scr_seq_0849_T20R0402_008F

scr_seq_0849_T20R0402_00E4:
	buffer_players_name 0
	scrcmd_727 32780
	bufferpartymonnick 1, VAR_SPECIAL_x800C
	gender_msgbox 15, 16
	closemsg
	goto scr_seq_0849_T20R0402_010D

scr_seq_0849_T20R0402_00FC:
	scrcmd_826 32774
	setflag FLAG_UNK_184
	buffer_players_name 0
	gender_msgbox 11, 12
	closemsg
scr_seq_0849_T20R0402_010D:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_425 2
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	gender_msgbox 13, 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_0137:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0849_T20R0402_0150
	setvar VAR_SPECIAL_x8005, 4
	goto scr_seq_0849_T20R0402_0188

scr_seq_0849_T20R0402_0150:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_0849_T20R0402_0169
	setvar VAR_SPECIAL_x8005, 3
	goto scr_seq_0849_T20R0402_0188

scr_seq_0849_T20R0402_0169:
	comparevartovalue VAR_SPECIAL_x8004, 3
	gotoif ne, scr_seq_0849_T20R0402_0182
	setvar VAR_SPECIAL_x8005, 2
	goto scr_seq_0849_T20R0402_0188

scr_seq_0849_T20R0402_0182:
	setvar VAR_SPECIAL_x8005, 1
scr_seq_0849_T20R0402_0188:
	buffer_players_name 0
	scrcmd_198 1, 32772
	scrcmd_198 2, 32773
	gender_msgbox 9, 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_01A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	scrcmd_076 183, 0
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_01BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0849_T20R0402_01CD:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
