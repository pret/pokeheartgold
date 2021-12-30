#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0090_D35R0103_012D ; 000
	scrdef scr_seq_0090_D35R0103_0360 ; 001
	scrdef scr_seq_0090_D35R0103_003E ; 002
	scrdef scr_seq_0090_D35R0103_03C4 ; 003
	scrdef scr_seq_0090_D35R0103_0770 ; 004
	scrdef scr_seq_0090_D35R0103_07D4 ; 005
	scrdef scr_seq_0090_D35R0103_0838 ; 006
	scrdef scr_seq_0090_D35R0103_00B2 ; 007
	scrdef scr_seq_0090_D35R0103_0A40 ; 008
	scrdef scr_seq_0090_D35R0103_0A74 ; 009
	scrdef scr_seq_0090_D35R0103_0AB8 ; 010
	scrdef scr_seq_0090_D35R0103_0288 ; 011
	scrdef scr_seq_0090_D35R0103_0344 ; 012
	scrdef scr_seq_0090_D35R0103_01CC ; 013
	scrdef scr_seq_0090_D35R0103_0238 ; 014
	scrdef_end

scr_seq_0090_D35R0103_003E:
	scrcmd_710
	comparevartovalue VAR_UNK_40A9, 3
	gotoif ge, scr_seq_0090_D35R0103_004F
	end

scr_seq_0090_D35R0103_004F:
	move_person 5, 29, 0, 22, 0
	move_person 6, 29, 0, 22, 0
	comparevartovalue VAR_UNK_40AC, 10
	gotoif ge, scr_seq_0090_D35R0103_00B0
	comparevartovalue VAR_UNK_40A9, 4
	gotoif ge, scr_seq_0090_D35R0103_0083
	end

scr_seq_0090_D35R0103_0083:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0090_D35R0103_00B0
	setvar VAR_TEMP_x4007, 77
	move_person 0, 39, 0, 18, 0
	move_person 1, 40, 0, 18, 0
	end

scr_seq_0090_D35R0103_00B0:
	end

scr_seq_0090_D35R0103_00B2:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0090_D35R0103_00BF
	end

scr_seq_0090_D35R0103_00BF:
	scrcmd_221 16384, 1
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0090_D35R0103_0127
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif ne, scr_seq_0090_D35R0103_00F4
	setflag FLAG_UNK_96B
	hide_person 9
	hide_person 12
	setflag FLAG_UNK_1F5
	goto scr_seq_0090_D35R0103_0127

scr_seq_0090_D35R0103_00F4:
	comparevartovalue VAR_TEMP_x400A, 2
	gotoif ne, scr_seq_0090_D35R0103_0117
	setflag FLAG_UNK_96C
	hide_person 10
	hide_person 13
	setflag FLAG_UNK_1F6
	goto scr_seq_0090_D35R0103_0127

scr_seq_0090_D35R0103_0117:
	setflag FLAG_UNK_96D
	hide_person 11
	hide_person 14
	setflag FLAG_UNK_1F7
scr_seq_0090_D35R0103_0127:
	clearflag FLAG_UNK_0A4
	end

scr_seq_0090_D35R0103_012D:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0090_D35R0103_01AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 0
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	buffer_players_name 0
	gender_msgbox 1, 2
	closemsg
	apply_movement 0, scr_seq_0090_D35R0103_01B8
	apply_movement 1, scr_seq_0090_D35R0103_01C0
	wait_movement
	hide_person 0
	hide_person 1
	setflag FLAG_UNK_1E5
	releaseall
	setvar VAR_UNK_40A9, 1
	end

scr_seq_0090_D35R0103_01A9:
	.byte 0x00, 0x00, 0x00

scr_seq_0090_D35R0103_01AC:
	step 15, 5
	step 12, 4
	step_end

scr_seq_0090_D35R0103_01B8:
	step 15, 11
	step_end

scr_seq_0090_D35R0103_01C0:
	step 61, 1
	step 15, 11
	step_end
scr_seq_0090_D35R0103_01CC:
	scrcmd_609
	lockall
	apply_movement 16, scr_seq_0090_D35R0103_0214
	wait_movement
	npc_msg 24
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 16, scr_seq_0090_D35R0103_021C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 5
	hide_person 16
	setflag FLAG_UNK_24B
	clearflag FLAG_UNK_24C
	releaseall
	end

scr_seq_0090_D35R0103_0213:
	.byte 0x00

scr_seq_0090_D35R0103_0214:
	step 50, 2
	step_end

scr_seq_0090_D35R0103_021C:
	step 3, 1
	step 51, 1
	step 19, 5
	step_end
	.byte 0x3f, 0x00, 0x01, 0x00
	.byte 0x0f, 0x00, 0x03, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0090_D35R0103_0238:
	scrcmd_609
	lockall
	apply_movement 17, scr_seq_0090_D35R0103_0270
	wait_movement
	npc_msg 25
	closemsg
	apply_movement 17, scr_seq_0090_D35R0103_0278
	wait_movement
	setvar VAR_UNK_40AC, 7
	hide_person 17
	setflag FLAG_UNK_24D
	clearflag FLAG_UNK_252
	show_person 18
	releaseall
	end

scr_seq_0090_D35R0103_026F:
	.byte 0x00

scr_seq_0090_D35R0103_0270:
	step 51, 2
	step_end

scr_seq_0090_D35R0103_0278:
	step 2, 1
	step 50, 1
	step 18, 10
	step_end
scr_seq_0090_D35R0103_0288:
	scrcmd_609
	lockall
	apply_movement 18, scr_seq_0090_D35R0103_0308
	wait_movement
	npc_msg 26
	closemsg
	npc_msg 27
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement 5, scr_seq_0090_D35R0103_03B0
	apply_movement 6, scr_seq_0090_D35R0103_03B8
	wait_movement
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 24
	gotoif ne, scr_seq_0090_D35R0103_02D7
	apply_movement 18, scr_seq_0090_D35R0103_0324
	goto scr_seq_0090_D35R0103_02DF

scr_seq_0090_D35R0103_02D7:
	apply_movement 18, scr_seq_0090_D35R0103_0310
scr_seq_0090_D35R0103_02DF:
	wait_movement
	setvar VAR_UNK_40AC, 8
	hide_person 18
	setflag FLAG_UNK_252
	setvar VAR_UNK_40A9, 3
	setflag FLAG_UNK_24B
	setflag FLAG_UNK_24C
	setflag FLAG_UNK_0D3
	releaseall
	end

scr_seq_0090_D35R0103_0305:
	.byte 0x00, 0x00, 0x00

scr_seq_0090_D35R0103_0308:
	step 48, 2
	step_end

scr_seq_0090_D35R0103_0310:
	step 48, 2
	step 2, 1
	step 63, 1
	step 18, 12
	step_end

scr_seq_0090_D35R0103_0324:
	step 48, 2
	step 2, 1
	step 63, 1
	step 18, 2
	step 50, 2
	step 17, 1
	step 18, 10
	step_end
scr_seq_0090_D35R0103_0344:
	goto scr_seq_0090_D35R0103_0288

scr_seq_0090_D35R0103_034A:
	.byte 0x02, 0x00, 0x4b, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x12, 0x00, 0x09, 0x00, 0x10, 0x00, 0x05, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0090_D35R0103_0360:
	comparevartovalue VAR_UNK_40AC, 8
	gotoif ge, scr_seq_0090_D35R0103_03A0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D3
	gotoif FALSE, scr_seq_0090_D35R0103_03A2
	buffer_players_name 0
	npc_msg 21
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement 5, scr_seq_0090_D35R0103_03B0
	apply_movement 6, scr_seq_0090_D35R0103_03B8
	wait_movement
	releaseall
scr_seq_0090_D35R0103_03A0:
	end

scr_seq_0090_D35R0103_03A2:
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0090_D35R0103_03AD:
	.byte 0x00, 0x00, 0x00

scr_seq_0090_D35R0103_03B0:
	step 14, 2
	step_end

scr_seq_0090_D35R0103_03B8:
	step 63, 1
	step 14, 1
	step_end
scr_seq_0090_D35R0103_03C4:
	scrcmd_609
	lockall
	npc_msg 3
	apply_movement 255, scr_seq_0090_D35R0103_0630
	wait_movement
	closemsg
	clearflag FLAG_UNK_1F3
	show_person 8
	show_person 7
	move_person 8, 32, 1, 30, 3
	move_person 7, 30, 1, 30, 0
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_ROCKET
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 30
	gotoif ne, scr_seq_0090_D35R0103_042E
	apply_movement 255, scr_seq_0090_D35R0103_065C
	goto scr_seq_0090_D35R0103_0436

scr_seq_0090_D35R0103_042E:
	apply_movement 255, scr_seq_0090_D35R0103_0668
scr_seq_0090_D35R0103_0436:
	apply_movement 8, scr_seq_0090_D35R0103_0638
	apply_movement 7, scr_seq_0090_D35R0103_0650
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 8, scr_seq_0090_D35R0103_0648
	wait_movement
	npc_msg 4
	closemsg
	clearflag FLAG_UNK_1E5
	show_person 0
	show_person 1
	move_person 0, 20, 1, 25, 3
	move_person 1, 19, 1, 25, 0
	apply_movement 0, scr_seq_0090_D35R0103_067C
	apply_movement 1, scr_seq_0090_D35R0103_0684
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 1, scr_seq_0090_D35R0103_0690
	scrcmd_076 149, 0
	scrcmd_077
	apply_movement 8, scr_seq_0090_D35R0103_0648
	wait_movement
	npc_msg 6
	closemsg
	apply_movement 8, scr_seq_0090_D35R0103_0698
	apply_movement 7, scr_seq_0090_D35R0103_06A0
	wait_movement
	scrcmd_562 675, 479, 499, 1
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0090_D35R0103_0620
	npc_msg 8
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	move_person 0, 28, 1, 24, 1
	move_person 1, 27, 1, 24, 3
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0090_D35R0103_06A8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 8
	hide_person 7
	hide_person 3
	hide_person 4
	hide_person 2
	setflag FLAG_UNK_1F3
	setflag FLAG_UNK_1F2
	setflag FLAG_UNK_1E8
	fade_screen 6, 1, 1, 0
	wait_fade
	apply_movement 0, scr_seq_0090_D35R0103_06BC
	apply_movement 1, scr_seq_0090_D35R0103_06C4
	wait_movement
	buffer_players_name 0
	gender_msgbox 10, 11
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0090_D35R0103_0738
	apply_movement 0, scr_seq_0090_D35R0103_06D0
	apply_movement 1, scr_seq_0090_D35R0103_070C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_076 149, 0
	scrcmd_077
	apply_movement 0, scr_seq_0090_D35R0103_06FC
	apply_movement 1, scr_seq_0090_D35R0103_072C
	wait_movement
	buffer_players_name 0
	gender_msgbox 12, 13
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0090_D35R0103_0744
	apply_movement 0, scr_seq_0090_D35R0103_0758
	apply_movement 1, scr_seq_0090_D35R0103_0760
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	move_person 0, 39, 0, 18, 0
	move_person 1, 40, 0, 18, 0
	releaseall
	setvar VAR_UNK_40AC, 9
	setvar VAR_UNK_40A9, 4
	setflag FLAG_UNK_998
	end

scr_seq_0090_D35R0103_0620:
	white_out
	setflag FLAG_UNK_1F3
	setflag FLAG_UNK_1E5
	releaseall
	end

scr_seq_0090_D35R0103_062E:
	.byte 0x00, 0x00

scr_seq_0090_D35R0103_0630:
	step 75, 1
	step_end

scr_seq_0090_D35R0103_0638:
	step 63, 1
	step 16, 6
	step 34, 1
	step_end

scr_seq_0090_D35R0103_0648:
	step 34, 1
	step_end

scr_seq_0090_D35R0103_0650:
	step 63, 2
	step 16, 3
	step_end

scr_seq_0090_D35R0103_065C:
	step 13, 5
	step 35, 1
	step_end

scr_seq_0090_D35R0103_0668:
	step 13, 2
	step 14, 1
	step 13, 3
	step 35, 1
	step_end

scr_seq_0090_D35R0103_067C:
	step 19, 10
	step_end

scr_seq_0090_D35R0103_0684:
	step 62, 1
	step 19, 10
	step_end

scr_seq_0090_D35R0103_0690:
	step 51, 1
	step_end

scr_seq_0090_D35R0103_0698:
	step 18, 1
	step_end

scr_seq_0090_D35R0103_06A0:
	step 16, 1
	step_end

scr_seq_0090_D35R0103_06A8:
	step 16, 2
	step 19, 1
	step 17, 2
	step 2, 1
	step_end

scr_seq_0090_D35R0103_06BC:
	step 15, 2
	step_end

scr_seq_0090_D35R0103_06C4:
	step 61, 1
	step 15, 2
	step_end

scr_seq_0090_D35R0103_06D0:
	step 12, 6
	step 63, 2
	step 14, 2
	step 32, 1
	step 63, 2
	step 35, 1
	step 15, 5
	step 32, 1
	step 63, 2
	step 35, 1
	step_end

scr_seq_0090_D35R0103_06FC:
	step 14, 2
	step 33, 1
	step 33, 1
	step_end

scr_seq_0090_D35R0103_070C:
	step 61, 1
	step 15, 1
	step 12, 5
	step 15, 8
	step 12, 1
	step 63, 4
	step 14, 4
	step_end

scr_seq_0090_D35R0103_072C:
	step 62, 1
	step 14, 2
	step_end

scr_seq_0090_D35R0103_0738:
	step 63, 4
	step 12, 5
	step_end

scr_seq_0090_D35R0103_0744:
	step 61, 1
	step 63, 1
	step 12, 1
	step 14, 5
	step_end

scr_seq_0090_D35R0103_0758:
	step 15, 6
	step_end

scr_seq_0090_D35R0103_0760:
	step 61, 1
	step 14, 1
	step 15, 5
	step_end
scr_seq_0090_D35R0103_0770:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 1
	setflag FLAG_UNK_0A4
	scrcmd_589 101, 23, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0090_D35R0103_089C
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0090_D35R0103_07D0
	setflag FLAG_UNK_0CB
	checkflag FLAG_UNK_0CC
	gotoif FALSE, scr_seq_0090_D35R0103_07D0
	checkflag FLAG_UNK_0CD
	gotoif FALSE, scr_seq_0090_D35R0103_07D0
	goto scr_seq_0090_D35R0103_08A2

scr_seq_0090_D35R0103_07D0:
	releaseall
	end

scr_seq_0090_D35R0103_07D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 2
	setflag FLAG_UNK_0A4
	scrcmd_589 101, 23, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0090_D35R0103_089C
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0090_D35R0103_0834
	setflag FLAG_UNK_0CC
	checkflag FLAG_UNK_0CB
	gotoif FALSE, scr_seq_0090_D35R0103_0834
	checkflag FLAG_UNK_0CD
	gotoif FALSE, scr_seq_0090_D35R0103_0834
	goto scr_seq_0090_D35R0103_08A2

scr_seq_0090_D35R0103_0834:
	releaseall
	end

scr_seq_0090_D35R0103_0838:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 3
	setflag FLAG_UNK_0A4
	scrcmd_589 101, 23, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0090_D35R0103_089C
	scrcmd_221 16384, 0
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, scr_seq_0090_D35R0103_0898
	setflag FLAG_UNK_0CD
	checkflag FLAG_UNK_0CB
	gotoif FALSE, scr_seq_0090_D35R0103_0898
	checkflag FLAG_UNK_0CC
	gotoif FALSE, scr_seq_0090_D35R0103_0898
	goto scr_seq_0090_D35R0103_08A2

scr_seq_0090_D35R0103_0898:
	releaseall
	end

scr_seq_0090_D35R0103_089C:
	white_out
	releaseall
	end

scr_seq_0090_D35R0103_08A2:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 16
	gotoif ne, scr_seq_0090_D35R0103_08CD
	apply_movement 255, scr_seq_0090_D35R0103_09E0
	goto scr_seq_0090_D35R0103_08F0

scr_seq_0090_D35R0103_08CD:
	comparevartovalue VAR_TEMP_x4001, 14
	gotoif ne, scr_seq_0090_D35R0103_08E8
	apply_movement 255, scr_seq_0090_D35R0103_09EC
	goto scr_seq_0090_D35R0103_08F0

scr_seq_0090_D35R0103_08E8:
	apply_movement 255, scr_seq_0090_D35R0103_09F8
scr_seq_0090_D35R0103_08F0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 0, scr_seq_0090_D35R0103_0A04
	apply_movement 1, scr_seq_0090_D35R0103_0A0C
	wait_movement
	npc_msg 15
	setvar VAR_SPECIAL_x8004, 424
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg 17
	closemsg
	apply_movement 0, scr_seq_0090_D35R0103_0A18
	wait_movement
	buffer_players_name 0
	gender_msgbox 18, 19
	closemsg
	apply_movement 0, scr_seq_0090_D35R0103_0A20
	apply_movement 1, scr_seq_0090_D35R0103_0A2C
	wait_movement
	hide_person 0
	hide_person 1
	setflag FLAG_UNK_1E5
	releaseall
	scrcmd_074 2141
	setflag FLAG_RED_GYARADOS_MEET
	clearflag FLAG_UNK_1FB
	setflag FLAG_UNK_1FA
	setflag FLAG_UNK_1F9
	setvar VAR_UNK_40AC, 10
	setvar VAR_UNK_410F, 1
	scrcmd_530 0, 1
	setvar VAR_UNK_40B2, 1
	setvar VAR_UNK_40B3, 1
	setvar VAR_UNK_40B4, 1
	setvar VAR_UNK_40B5, 1
	setvar VAR_UNK_40B6, 1
	setvar VAR_UNK_40B7, 1
	setvar VAR_UNK_40B8, 1
	setvar VAR_UNK_40B9, 1
	setvar VAR_UNK_40BA, 1
	setvar VAR_UNK_40BB, 1
	setvar VAR_UNK_40BC, 1
	setvar VAR_UNK_40BD, 1
	setvar VAR_UNK_40BE, 1
	setvar VAR_UNK_40BF, 1
	setvar VAR_UNK_40C0, 1
	setvar VAR_UNK_40C1, 1
	end


scr_seq_0090_D35R0103_09E0:
	step 13, 2
	step 15, 10
	step_end

scr_seq_0090_D35R0103_09EC:
	step 13, 4
	step 15, 10
	step_end

scr_seq_0090_D35R0103_09F8:
	step 13, 6
	step 15, 10
	step_end

scr_seq_0090_D35R0103_0A04:
	step 14, 8
	step_end

scr_seq_0090_D35R0103_0A0C:
	step 61, 1
	step 14, 8
	step_end

scr_seq_0090_D35R0103_0A18:
	step 33, 1
	step_end

scr_seq_0090_D35R0103_0A20:
	step 17, 6
	step 18, 12
	step_end

scr_seq_0090_D35R0103_0A2C:
	step 62, 1
	step 18, 1
	step 17, 6
	step 18, 12
	step_end
scr_seq_0090_D35R0103_0A40:
	scrcmd_609
	lockall
	npc_msg 14
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0090_D35R0103_0A6C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0090_D35R0103_0A6B:
	.byte 0x00

scr_seq_0090_D35R0103_0A6C:
	step 14, 1
	step_end
scr_seq_0090_D35R0103_0A74:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_0090_D35R0103_0AAC
	wait_movement
	npc_msg 14
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0090_D35R0103_0A6C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0090_D35R0103_0AA9:
	.byte 0x00, 0x00, 0x00

scr_seq_0090_D35R0103_0AAC:
	step 75, 1
	step 34, 1
	step_end
scr_seq_0090_D35R0103_0AB8:
	releaseall
	checkflag FLAG_UNK_0CB
	gotoif FALSE, scr_seq_0090_D35R0103_0AE4
	checkflag FLAG_UNK_0CC
	gotoif FALSE, scr_seq_0090_D35R0103_0AE4
	checkflag FLAG_UNK_0CD
	gotoif FALSE, scr_seq_0090_D35R0103_0AE4
	npc_msg 23
	closemsg
	releaseall
	end

scr_seq_0090_D35R0103_0AE4:
	npc_msg 22
	closemsg
	releaseall
	end
	.balign 4, 0
