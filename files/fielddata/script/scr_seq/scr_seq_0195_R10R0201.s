#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0195_R10R0201_0026 ; 000
	scrdef scr_seq_0195_R10R0201_0039 ; 001
	scrdef scr_seq_0195_R10R0201_004C ; 002
	scrdef scr_seq_0195_R10R0201_005F ; 003
	scrdef scr_seq_0195_R10R0201_0072 ; 004
	scrdef scr_seq_0195_R10R0201_0085 ; 005
	scrdef scr_seq_0195_R10R0201_0098 ; 006
	scrdef scr_seq_0195_R10R0201_014A ; 007
	scrdef scr_seq_0195_R10R0201_015B ; 008
	scrdef_end

scr_seq_0195_R10R0201_0026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_0039:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_004C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_005F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_0072:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_0085:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_0098:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_121
	gotoif TRUE, scr_seq_0195_R10R0201_013F
	npc_msg 9
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0195_R10R0201_0134
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0195_R10R0201_0134
	scrcmd_470 8
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0195_R10R0201_0127
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_121
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_0127:
	scrcmd_474
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_0134:
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_013F:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_014A:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0195_R10R0201_015B:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
