#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0102.h"
#include "msgdata/msg/msg_0117_D37R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0102_000
	scrdef scr_seq_D37R0102_001
	scrdef scr_seq_D37R0102_002
	scrdef scr_seq_D37R0102_003
	scrdef scr_seq_D37R0102_004
	scrdef scr_seq_D37R0102_005
	scrdef scr_seq_D37R0102_006
	scrdef scr_seq_D37R0102_007
	scrdef scr_seq_D37R0102_008
	scrdef scr_seq_D37R0102_009
	scrdef scr_seq_D37R0102_010
	scrdef scr_seq_D37R0102_011
	scrdef scr_seq_D37R0102_012
	scrdef scr_seq_D37R0102_013
	scrdef scr_seq_D37R0102_014
	scrdef scr_seq_D37R0102_015
	scrdef scr_seq_D37R0102_016
	scrdef scr_seq_D37R0102_017
	scrdef scr_seq_D37R0102_018
	scrdef scr_seq_D37R0102_019
	scrdef scr_seq_D37R0102_020
	scrdef scr_seq_D37R0102_021
	scrdef scr_seq_D37R0102_022
	scrdef scr_seq_D37R0102_023
	scrdef_end

scr_seq_D37R0102_008:
	setflag FLAG_UNK_1B0
	setflag FLAG_UNK_1B1
	setflag FLAG_UNK_1B2
	setflag FLAG_UNK_1B3
	setflag FLAG_UNK_1B4
	setflag FLAG_HIDE_ROCKET_TAKEOVER_2
	compare VAR_SCENE_ROCKET_TAKEOVER, 2
	goto_if_eq _0144
	compare VAR_SCENE_ROCKET_TAKEOVER, 4
	goto_if_eq _0144
	compare VAR_SCENE_ROCKET_TAKEOVER, 3
	goto_if_eq _0144
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _00C0
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B3
	goto _0131

_00C0:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00D7
	clearflag FLAG_UNK_1B2
	goto _0131

_00D7:
	compare VAR_TEMP_x4000, 3
	goto_if_ne _00EE
	clearflag FLAG_UNK_1B3
	goto _0131

_00EE:
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0105
	clearflag FLAG_UNK_1B2
	goto _0131

_0105:
	compare VAR_TEMP_x4000, 5
	goto_if_ne _011C
	clearflag FLAG_UNK_1B3
	goto _0131

_011C:
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0131
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B2
_0131:
	compare VAR_TEMP_x4000, 1
	call_if_eq _0161
	clearflag FLAG_HIDE_ROCKET_TAKEOVER_2
	end

_0144:
	compare VAR_UNK_409F, 1
	goto_if_ne _015B
	setflag FLAG_UNK_1B4
	goto _015F

_015B:
	clearflag FLAG_UNK_1B4
_015F:
	end

_0161:
	scrcmd_522 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 4
	goto_if_ge _017C
	setflag FLAG_UNK_1B0
	goto _0197

_017C:
	compare VAR_TEMP_x4001, 9
	goto_if_le _0193
	setflag FLAG_UNK_1B0
	goto _0197

_0193:
	clearflag FLAG_UNK_1B0
_0197:
	return

scr_seq_D37R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_SPECIAL_MART_BITTER
	npc_msg msg_0117_D37R0102_00000
	holdmsg
	setvar VAR_SPECIAL_x8004, 8
	callstd std_special_mart
	clearflag FLAG_SPECIAL_MART_BITTER
	releaseall
	end

scr_seq_D37R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_DAILY_GOT_HAIRCUT, _0331
	show_money_box 20, 2
	npc_msg msg_0117_D37R0102_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _01F5
	goto _030C
	.byte 0x02, 0x00
_01F5:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 500
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0324
	npc_msg msg_0117_D37R0102_00011
	wait_button
	closemsg
	hide_money_box
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _0319
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0319
	show_money_box 20, 2
	submoneyimmediate 500
	update_money_box
	npc_msg msg_0117_D37R0102_00012
	wait_button
	closemsg
	fade_screen 6, 1, 0, RGB_WHITE
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	hide_money_box
	fade_screen 6, 1, 1, RGB_WHITE
	wait_fade
	npc_msg msg_0117_D37R0102_00013
	wait_button
	setflag FLAG_DAILY_GOT_HAIRCUT
	call _04C8
	random VAR_SPECIAL_RESULT, 100
	compare VAR_SPECIAL_RESULT, 40
	goto_if_ge _02F6
	compare VAR_SPECIAL_RESULT, 10
	goto_if_ge _02E0
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ge _02CA
_02CA:
	mon_add_friendship 1, VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02E0:
	mon_add_friendship 5, VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02F6:
	mon_add_friendship 10, VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_030C:
	npc_msg msg_0117_D37R0102_00014
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_0319:
	npc_msg msg_0117_D37R0102_00014
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0324:
	npc_msg msg_0117_D37R0102_00015
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_0331:
	npc_msg msg_0117_D37R0102_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D37R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_DAILY_GOT_HAIRCUT, _04BD
	show_money_box 20, 2
	npc_msg msg_0117_D37R0102_00017
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0375
	goto _0498
	.byte 0x02, 0x00
_0375:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 300
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04B0
	npc_msg msg_0117_D37R0102_00018
	wait_button
	closemsg
	hide_money_box
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _04A5
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04A5
	show_money_box 20, 2
	submoneyimmediate 300
	update_money_box
	npc_msg msg_0117_D37R0102_00019
	wait_button
	closemsg
	fade_screen 6, 1, 0, RGB_WHITE
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	hide_money_box
	fade_screen 6, 1, 1, RGB_WHITE
	wait_fade
	npc_msg msg_0117_D37R0102_00020
	wait_button
	setflag FLAG_DAILY_GOT_HAIRCUT
	random VAR_SPECIAL_RESULT, 100
	compare VAR_SPECIAL_RESULT, 40
	goto_if_ge _0444
	compare VAR_SPECIAL_RESULT, 10
	goto_if_ge _0460
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ge _047C
_0444:
	call _04C8
	mon_add_friendship 1, VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0460:
	call _04C8
	mon_add_friendship 5, VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_047C:
	call _04D8
	mon_add_friendship 10, VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0498:
	npc_msg msg_0117_D37R0102_00021
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_04A5:
	npc_msg msg_0117_D37R0102_00021
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04B0:
	npc_msg msg_0117_D37R0102_00022
	wait_button_or_walk_away
	closemsg
	hide_money_box
	releaseall
	end

_04BD:
	npc_msg msg_0117_D37R0102_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04C8:
	mon_add_contest_value VAR_SPECIAL_x8005, 1, 16
	mon_add_contest_value VAR_SPECIAL_x8005, 5, 11
	return

_04D8:
	mon_add_contest_value VAR_SPECIAL_x8005, 1, 24
	mon_add_contest_value VAR_SPECIAL_x8005, 5, 18
	return

scr_seq_D37R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_AB7, _0895
	show_money_box 20, 2
	npc_msg msg_0117_D37R0102_00001
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
_0522:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 445, 255, 0
	menu_item_add 446, 255, 1
	menu_item_add 447, 255, 2
	menu_item_add 448, 255, 3
	menu_item_add 449, 255, 4
	menu_item_add 450, 255, 7
	menu_exec
	switch VAR_SPECIAL_RESULT
	case 0, _05AB
	case 1, _05D0
	case 2, _05F5
	case 3, _061A
	case 4, _063F
	goto _0886

_05AB:
	compare VAR_TEMP_x4003, 1
	goto_if_eq _086B
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4500
	goto _0664

_05D0:
	compare VAR_TEMP_x4004, 1
	goto_if_eq _086B
	setvar VAR_SPECIAL_x8004, 88
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 650
	goto _0664

_05F5:
	compare VAR_TEMP_x4005, 1
	goto_if_eq _086B
	setvar VAR_SPECIAL_x8004, 89
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 3500
	goto _0664

_061A:
	compare VAR_TEMP_x4006, 1
	goto_if_eq _086B
	setvar VAR_SPECIAL_x8004, 90
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 900
	goto _0664

_063F:
	compare VAR_TEMP_x4007, 1
	goto_if_eq _086B
	setvar VAR_SPECIAL_x8004, 91
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4600
	goto _0664

_0664:
	buffer_item_name 0, VAR_SPECIAL_x8004
	buffer_int 1, VAR_SPECIAL_x8006
	npc_msg msg_0117_D37R0102_00002
	getmenuchoice VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _068A
	closemsg
	goto _0522

_068A:
	compare VAR_SPECIAL_x8004, 92
	goto_if_ne _06CD
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 4500
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _087D
	submoneyimmediate 4500
	goto _07C6

_06CD:
	compare VAR_SPECIAL_x8004, 88
	goto_if_ne _0710
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 650
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _087D
	submoneyimmediate 650
	goto _07C6

_0710:
	compare VAR_SPECIAL_x8004, 89
	goto_if_ne _0753
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 3500
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _087D
	submoneyimmediate 3500
	goto _07C6

_0753:
	compare VAR_SPECIAL_x8004, 90
	goto_if_ne _0796
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 900
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _087D
	submoneyimmediate 900
	goto _07C6

_0796:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 4600
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _087D
	submoneyimmediate 4600
_07C6:
	update_money_box
	play_se SEQ_SE_DP_REGI
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 1, VAR_SPECIAL_RESULT
	npc_msg msg_0117_D37R0102_00003
	npc_msg msg_0117_D37R0102_00004
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8004, 92
	goto_if_ne _0803
	setvar VAR_TEMP_x4003, 1
	goto _0861

_0803:
	compare VAR_SPECIAL_x8004, 88
	goto_if_ne _081C
	setvar VAR_TEMP_x4004, 1
	goto _0861

_081C:
	compare VAR_SPECIAL_x8004, 89
	goto_if_ne _0835
	setvar VAR_TEMP_x4005, 1
	goto _0861

_0835:
	compare VAR_SPECIAL_x8004, 90
	goto_if_ne _084E
	setvar VAR_TEMP_x4006, 1
	goto _0861

_084E:
	compare VAR_SPECIAL_x8004, 91
	goto_if_ne _0861
	setvar VAR_TEMP_x4007, 1
_0861:
	setflag FLAG_UNK_AB7
	goto _0522

_086B:
	npc_msg msg_0117_D37R0102_00005
	goto _0522

_0874:
	npc_msg msg_0117_D37R0102_00006
	goto _0522

_087D:
	npc_msg msg_0117_D37R0102_00007
	goto _0522

_0886:
	touchscreen_menu_show
	hide_money_box
	npc_msg msg_0117_D37R0102_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0895:
	npc_msg msg_0117_D37R0102_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D37R0102_004:
	scrcmd_609
	lockall
	apply_movement obj_D37R0102_rocketm, _0AC4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 7
	goto_if_ne _08CF
	apply_movement obj_D37R0102_rocketm, _0ACC
	goto _096B

_08CF:
	compare VAR_TEMP_x4001, 8
	goto_if_ne _08EA
	apply_movement obj_D37R0102_rocketm, _0AD4
	goto _096B

_08EA:
	compare VAR_TEMP_x4001, 9
	goto_if_ne _0905
	apply_movement obj_D37R0102_rocketm, _0ADC
	goto _096B

_0905:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _0920
	apply_movement obj_D37R0102_rocketm, _0AE4
	goto _096B

_0920:
	compare VAR_TEMP_x4001, 11
	goto_if_ne _093B
	apply_movement obj_D37R0102_rocketm, _0AEC
	goto _096B

_093B:
	compare VAR_TEMP_x4001, 12
	goto_if_ne _0956
	apply_movement obj_D37R0102_rocketm, _0AF4
	goto _096B

_0956:
	compare VAR_TEMP_x4001, 13
	goto_if_ne _096B
	apply_movement obj_D37R0102_rocketm, _0AFC
_096B:
	wait_movement
	npc_msg msg_0117_D37R0102_00036
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_TEMP_x4001, 7
	goto_if_ne _09A5
	apply_movement obj_D37R0102_rocketm, _0B04
	apply_movement obj_player, _0B70
	goto _0A71

_09A5:
	compare VAR_TEMP_x4001, 8
	goto_if_ne _09C8
	apply_movement obj_D37R0102_rocketm, _0B10
	apply_movement obj_player, _0B7C
	goto _0A71

_09C8:
	compare VAR_TEMP_x4001, 9
	goto_if_ne _09EB
	apply_movement obj_D37R0102_rocketm, _0B20
	apply_movement obj_player, _0B88
	goto _0A71

_09EB:
	compare VAR_TEMP_x4001, 10
	goto_if_ne _0A0E
	apply_movement obj_D37R0102_rocketm, _0B30
	apply_movement obj_player, _0B94
	goto _0A71

_0A0E:
	compare VAR_TEMP_x4001, 11
	goto_if_ne _0A31
	apply_movement obj_D37R0102_rocketm, _0B40
	apply_movement obj_player, _0BA0
	goto _0A71

_0A31:
	compare VAR_TEMP_x4001, 12
	goto_if_ne _0A54
	apply_movement obj_D37R0102_rocketm, _0B50
	apply_movement obj_player, _0BAC
	goto _0A71

_0A54:
	compare VAR_TEMP_x4001, 13
	goto_if_ne _0A71
	apply_movement obj_D37R0102_rocketm, _0B60
	apply_movement obj_player, _0BB8
_0A71:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	set_avatar_bits PLAYER_TRANSITION_ROCKET
	update_avatar_state
	rocket_costume_flag_action 1
	play_se SEQ_SE_DP_CARD2
	wait 24, VAR_SPECIAL_RESULT
	play_se SEQ_SE_DP_CARD2
	wait_se SEQ_SE_DP_CARD2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	setvar VAR_SCENE_ROCKET_TAKEOVER, 3
	npc_msg msg_0117_D37R0102_00037
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0AC4:
	step 75, 1
	step_end

_0ACC:
	step 61, 1
	step_end

_0AD4:
	step 13, 1
	step_end

_0ADC:
	step 13, 2
	step_end

_0AE4:
	step 13, 3
	step_end

_0AEC:
	step 13, 4
	step_end

_0AF4:
	step 13, 5
	step_end

_0AFC:
	step 13, 6
	step_end

_0B04:
	step 15, 1
	step 34, 1
	step_end

_0B10:
	step 12, 1
	step 15, 1
	step 34, 1
	step_end

_0B20:
	step 12, 2
	step 15, 1
	step 34, 1
	step_end

_0B30:
	step 12, 3
	step 15, 1
	step 34, 1
	step_end

_0B40:
	step 12, 4
	step 15, 1
	step 34, 1
	step_end

_0B50:
	step 12, 5
	step 15, 1
	step 34, 1
	step_end

_0B60:
	step 12, 6
	step 15, 1
	step 34, 1
	step_end

_0B70:
	step 12, 1
	step 35, 1
	step_end

_0B7C:
	step 12, 2
	step 35, 1
	step_end

_0B88:
	step 12, 3
	step 35, 1
	step_end

_0B94:
	step 12, 4
	step 35, 1
	step_end

_0BA0:
	step 12, 5
	step 35, 1
	step_end

_0BAC:
	step 12, 6
	step 35, 1
	step_end

_0BB8:
	step 12, 7
	step 35, 1
	step_end
scr_seq_D37R0102_009:
	simple_npc_msg msg_0117_D37R0102_00037
	end

scr_seq_D37R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8007, 0
	call_if_unset FLAG_UNK_08C, _0C0E
	compare VAR_TEMP_x400A, 0
	goto_if_eq _0C16
	compare VAR_TEMP_x400A, 1
	goto_if_ge _0C1F
	releaseall
	end

_0C0E:
	setvar VAR_SPECIAL_x8007, 1
	return

_0C16:
	npc_msg msg_0117_D37R0102_00039
	goto _0C58

_0C1F:
	npc_msg msg_0117_D37R0102_00049
	goto _0C58

_0C28:
	npc_msg msg_0117_D37R0102_00041
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C4F
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0CA0
	end

_0C4F:
	npc_msg msg_0117_D37R0102_00044
	goto _0C7C

_0C58:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0C28
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0DDA
	end

_0C7C:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0CA0
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0DDA
	end

_0CA0:
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0CC0
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0CCC
	end

_0CC0:
	setvar VAR_TEMP_x4002, 0
	goto _0D17

_0CCC:
	npc_msg msg_0117_D37R0102_00042
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	party_select_ui
	get_party_selection VAR_TEMP_x4002
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_TEMP_x4002, 255
	goto_if_eq _0DDA
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0DE5
	goto _0D17

_0D17:
	npc_msg msg_0117_D37R0102_00043
	closemsg
	get_player_facing VAR_SPECIAL_x8006
	compare VAR_SPECIAL_x8006, 0
	goto_if_eq _0D49
	compare VAR_SPECIAL_x8006, 2
	goto_if_eq _0D4F
	compare VAR_SPECIAL_x8006, 3
	goto_if_eq _0D55
	end

_0D49:
	goto _0D5B

_0D4F:
	goto _0D5B

_0D55:
	goto _0D5B

_0D5B:
	setflag FLAG_UNK_08C
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_154 VAR_TEMP_x4002, VAR_SPECIAL_x8005, VAR_SPECIAL_x8007
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_x8006, 0
	goto_if_eq _0DAA
	compare VAR_SPECIAL_x8006, 2
	goto_if_eq _0DB0
	compare VAR_SPECIAL_x8006, 3
	goto_if_eq _0DB6
	end

_0DAA:
	goto _0DBC

_0DB0:
	goto _0DBC

_0DB6:
	goto _0DBC

_0DBC:
	compare VAR_SPECIAL_x8005, 0
	goto_if_eq _0E40
	setvar VAR_TEMP_x400A, 1
	npc_msg msg_0117_D37R0102_00045
	closemsg
	goto _0DEE

_0DDA:
	npc_msg msg_0117_D37R0102_00040
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0DE5:
	npc_msg msg_0117_D37R0102_00051
	goto _0CCC

_0DEE:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_492 0, VAR_SPECIAL_RESULT, VAR_SPECIAL_x8004
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0E35
	scrcmd_256 VAR_SPECIAL_x8004
	scrcmd_494 0, VAR_SPECIAL_x8004
	npc_msg msg_0117_D37R0102_00046
	npc_msg msg_0117_D37R0102_00052
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0E35:
	npc_msg msg_0117_D37R0102_00047
	closemsg
	goto _0DEE

_0E40:
	npc_msg msg_0117_D37R0102_00048
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x08, 0x00, 0x02, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0b, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x09, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0e, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_D37R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0117_D37R0102_00029
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0F05
	npc_msg msg_0117_D37R0102_00034
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0F05:
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0FDA
	npc_msg msg_0117_D37R0102_00030
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	set_avatar_bits PLAYER_TRANSITION_ROCKET
	update_avatar_state
	rocket_costume_flag_action 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0FE8
	apply_movement obj_D37R0102_gsmiddleman1, _1000
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0F79
	release obj_partner_poke
	apply_movement obj_partner_poke, _0FF8
	lock obj_partner_poke
	wait_movement
_0F79:
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0117_D37R0102_00031
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 10
	lockall
	set_avatar_bits PLAYER_TRANSITION_WALKING
	update_avatar_state
	rocket_costume_flag_action 0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _1010
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	npc_msg msg_0117_D37R0102_00032
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0FDA:
	npc_msg msg_0117_D37R0102_00035
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0FE8:
	step 20, 3
	step 22, 2
	step 1, 1
	step_end

_0FF8:
	step 1, 1
	step_end

_1000:
	step 21, 2
	step 22, 4
	step 0, 1
	step_end

_1010:
	step 21, 3
	step 23, 2
	step_end
	.byte 0x14, 0x00, 0x02, 0x00
	.byte 0x17, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D37R0102_011:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 31
	goto_if_ne _1055
	apply_movement obj_D37R0102_dancer, _10B4
	goto _105D

_1055:
	apply_movement obj_D37R0102_dancer, _10C8
_105D:
	wait_movement
	npc_msg msg_0117_D37R0102_00055
	closemsg
	apply_movement obj_D37R0102_dancer, _10E4
	wait_movement
	npc_msg msg_0117_D37R0102_00056
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	compare VAR_SPECIAL_x8005, 31
	goto_if_ne _1094
	apply_movement obj_D37R0102_dancer, _10F0
	goto _109C

_1094:
	apply_movement obj_D37R0102_dancer, _1120
_109C:
	wait_movement
	hide_person obj_D37R0102_dancer
	setflag FLAG_HIDE_UNDERGROUND_KIMONO_GIRL
	callstd std_fade_end_kimono_girl_music
	releaseall
	setvar VAR_UNK_40E7, 3
	end


_10B4:
	step 75, 1
	step 34, 1
	step 63, 1
	step 14, 2
	step_end

_10C8:
	step 75, 1
	step 34, 1
	step 63, 1
	step 14, 1
	step 13, 1
	step 14, 1
	step_end

_10E4:
	step 75, 1
	step 65, 1
	step_end

_10F0:
	step 13, 1
	step 14, 3
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 14, 7
	step_end

_1120:
	step 12, 1
	step 14, 3
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 14, 7
	step_end
scr_seq_D37R0102_007:
	simple_npc_msg msg_0117_D37R0102_00027
	end

scr_seq_D37R0102_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity ITEM_BASEMENT_KEY, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _1189
	npc_msg msg_0117_D37R0102_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_1189:
	buffer_players_name 0
	npc_msg msg_0117_D37R0102_00028
	closemsg
	apply_movement obj_D37R0102_babyboy1_8, _11A4
	wait_movement
	releaseall
	setflag FLAG_UNK_1C0
	end
	.byte 0x00

_11A4:
	step 15, 2
	step_end
scr_seq_D37R0102_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 0, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 1, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 2, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 2, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 3, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 3, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 4, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 4, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 5, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 6, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 6, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 7, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 7, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 8, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 8, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 9, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 9, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

scr_seq_D37R0102_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 10, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _144B
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	scrcmd_155 10, VAR_SPECIAL_RESULT
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_144B:
	npc_msg msg_0117_D37R0102_00053
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D37R0102_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_830 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _1480
	scrcmd_832 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1521
_1480:
	npc_msg msg_0117_D37R0102_00057
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1530
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 100
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _153F
	submoneyimmediate 100
	scrcmd_553 5, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _154E
	scrcmd_831 VAR_SPECIAL_x8004
	scrcmd_404 VAR_SPECIAL_x8004, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _155B
	npc_msg msg_0117_D37R0102_00061
	setvar VAR_SPECIAL_x8005, 1
	callstd std_receive_accessory
_14EB:
	scrcmd_832 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1530
	scrcmd_553 95, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _1530
	scrcmd_833 VAR_SPECIAL_x8004
	npc_msg msg_0117_D37R0102_00062
	callstd std_receive_background
	goto _1530
	.byte 0x02
	.byte 0x00
_1521:
	npc_msg msg_0117_D37R0102_00058
	wait_button_or_walk_away
	closemsg
	goto _1568
	.byte 0x02, 0x00
_1530:
	npc_msg msg_0117_D37R0102_00059
	wait_button_or_walk_away
	closemsg
	goto _1568
	.byte 0x02, 0x00
_153F:
	npc_msg msg_0117_D37R0102_00060
	wait_button_or_walk_away
	closemsg
	goto _1568
	.byte 0x02, 0x00
_154E:
	npc_msg msg_0117_D37R0102_00064
	closemsg
	goto _1530
	.byte 0x02, 0x00
_155B:
	npc_msg msg_0117_D37R0102_00064
	closemsg
	goto _14EB
	.byte 0x02, 0x00
_1568:
	releaseall
	end
	.balign 4, 0
