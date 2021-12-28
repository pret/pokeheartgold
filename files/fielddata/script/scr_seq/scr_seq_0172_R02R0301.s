#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0172_R02R0301_000A ; 000
	scrdef scr_seq_0172_R02R0301_0062 ; 001
	scrdef_end

scr_seq_0172_R02R0301_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_135
	gotoif TRUE, scr_seq_0172_R02R0301_004D
	buffer_players_name 0
	gender_msgbox 0, 1
	setvar VAR_SPECIAL_x8004, 44
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0172_R02R0301_0058
	callstd std_give_item_verbose
	setflag FLAG_UNK_135
scr_seq_0172_R02R0301_004D:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0172_R02R0301_0058:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0172_R02R0301_0062:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
