#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0782_0022 ; 000
	scrdef scr_seq_0782_00A9 ; 001
	scrdef scr_seq_0782_00BC ; 002
	scrdef scr_seq_0782_014C ; 003
	scrdef scr_seq_0782_015F ; 004
	scrdef scr_seq_0782_019A ; 005
	scrdef scr_seq_0782_01AD ; 006
	scrdef scr_seq_0782_017A ; 007
	scrdef_end

scr_seq_0782_0022:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F8
	gotoif FALSE, scr_seq_0782_0044
	buffer_players_name 0
	gender_msgbox 4, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_0044:
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0782_009E
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0782_0093
	callstd 2033
	setflag FLAG_UNK_0F8
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_0093:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_009E:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_00A9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_00BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 479, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0782_0141
	getitemquantity 480, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0782_0141
	checkflag FLAG_UNK_119
	gotoif TRUE, scr_seq_0782_0116
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0782_010B
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_010B:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_0116:
	npc_msg 11
	hide_person 5
	setflag FLAG_UNK_2FC
	setvar VAR_SPECIAL_x8004, 479
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setvar VAR_UNK_4130, 1
	clearflag FLAG_UNK_2FD
	closemsg
	releaseall
	end

scr_seq_0782_0141:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_014C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_015F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 153, 0
	npc_msg 16
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_017A:
	checkflag FLAG_UNK_2FC
	gotoif TRUE, scr_seq_0782_0198
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_0198:
	end

scr_seq_0782_019A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0782_01AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
