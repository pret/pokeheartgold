#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0858_T22FS0101_0016 ; 000
	scrdef scr_seq_0858_T22FS0101_0032 ; 001
	scrdef scr_seq_0858_T22FS0101_004E ; 002
	scrdef scr_seq_0858_T22FS0101_015C ; 003
	scrdef scr_seq_0858_T22FS0101_016F ; 004
	scrdef_end

scr_seq_0858_T22FS0101_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2048
	releaseall
	end

scr_seq_0858_T22FS0101_0032:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	callstd 2011
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 1
	callstd 2052
	releaseall
	end

scr_seq_0858_T22FS0101_004E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_06F
	gotoif TRUE, scr_seq_0858_T22FS0101_0115
	buffer_players_name 0
	gender_msgbox 2, 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0858_T22FS0101_00F7
scr_seq_0858_T22FS0101_007D:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0858_T22FS0101_0106
	give_togepi_egg
	setflag FLAG_UNK_070
	buffer_players_name 0
	npc_msg 4
	play_fanfare SEQ_ME_TAMAGO_GET
	wait_fanfare
	gender_msgbox 5, 6
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0858_T22FS0101_00C5
	apply_movement 4, scr_seq_0858_T22FS0101_014C
	goto scr_seq_0858_T22FS0101_00CD

scr_seq_0858_T22FS0101_00C5:
	apply_movement 4, scr_seq_0858_T22FS0101_0140
scr_seq_0858_T22FS0101_00CD:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 4
	wait_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_HIDE_VIOLET_SHOP_KIMONO_GIRL
	releaseall
	setvar VAR_SCENE_VIOLET_CITY_OW, 3
	clearflag FLAG_HIDE_VIOLET_KIMONO_GIRL
	clearflag FLAG_HIDE_ELMS_LAB_OFFICER
	setvar VAR_SCENE_ELMS_LAB, 7
	end

scr_seq_0858_T22FS0101_00F7:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_06F
	end

scr_seq_0858_T22FS0101_0106:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_06F
	end

scr_seq_0858_T22FS0101_0115:
	buffer_players_name 0
	gender_msgbox 9, 10
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0858_T22FS0101_007D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0858_T22FS0101_00F7
	end


scr_seq_0858_T22FS0101_0140:
	.short 14, 2
	.short 13, 3
	.short 254, 0

scr_seq_0858_T22FS0101_014C:
	.short 13, 2
	.short 14, 2
	.short 13, 1
	.short 254, 0
scr_seq_0858_T22FS0101_015C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0858_T22FS0101_016F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
