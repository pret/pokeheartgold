#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0878_T24PC0101_0012 ; 000
	scrdef scr_seq_0878_T24PC0101_001E ; 001
	scrdef scr_seq_0878_T24PC0101_0031 ; 002
	scrdef scr_seq_0878_T24PC0101_00EF ; 003
	scrdef_end

scr_seq_0878_T24PC0101_0012:
	setvar VAR_SPECIAL_x8007, 3
	callstd std_nurse_joy
	end

scr_seq_0878_T24PC0101_001E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0878_T24PC0101_0031:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	count_pc_empty_space VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 540
	gotoif ne, scr_seq_0878_T24PC0101_0056
	goto scr_seq_0878_T24PC0101_005C

scr_seq_0878_T24PC0101_0050:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0878_T24PC0101_0056:
	goto scr_seq_0878_T24PC0101_00E4

scr_seq_0878_T24PC0101_005C:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0878_T24PC0101_0079
	goto scr_seq_0878_T24PC0101_007F

scr_seq_0878_T24PC0101_0073:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0878_T24PC0101_0079:
	goto scr_seq_0878_T24PC0101_00E4

scr_seq_0878_T24PC0101_007F:
	npc_msg 4
	buffer_players_name 0
	npc_msg 5
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	give_mon SPECIES_TENTACOOL, 15, 0, 0, 0, VAR_SPECIAL_x800C
	npc_msg 6
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0878_T24PC0101_00BC
	touchscreen_menu_show
	closemsg
	goto scr_seq_0878_T24PC0101_00E0

scr_seq_0878_T24PC0101_00BC:
	closemsg
	scrcmd_815 0
	fade_screen 6, 1, 0, 0
	wait_fade
	nickname_input 1, VAR_SPECIAL_x800C
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0878_T24PC0101_00E0:
	releaseall
	end

scr_seq_0878_T24PC0101_00E4:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0878_T24PC0101_00EF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 4, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0878_T24PC0101_0115
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0878_T24PC0101_0115:
	buffer_players_name 0
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
