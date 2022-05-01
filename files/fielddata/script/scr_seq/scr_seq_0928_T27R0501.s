#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0501.h"
#include "msgdata/msg/msg_0618_T27R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27R0501_000
	scrdef scr_seq_T27R0501_001
	scrdef scr_seq_T27R0501_002
	scrdef scr_seq_T27R0501_003
	scrdef scr_seq_T27R0501_004
	scrdef scr_seq_T27R0501_005
	scrdef scr_seq_T27R0501_006
	scrdef scr_seq_T27R0501_007
	scrdef scr_seq_T27R0501_008
	scrdef scr_seq_T27R0501_009
	scrdef scr_seq_T27R0501_010
	scrdef scr_seq_T27R0501_011
	scrdef scr_seq_T27R0501_012
	scrdef scr_seq_T27R0501_013
	scrdef scr_seq_T27R0501_014
	scrdef scr_seq_T27R0501_015
	scrdef scr_seq_T27R0501_016
	scrdef_end

scr_seq_T27R0501_013:
	compare VAR_UNK_410C, 1
	goto_if_gt _0057
	scrcmd_375 obj_T27R0501_rocketm_2
_0057:
	compare VAR_UNK_410C, 0
	goto_if_ne _007C
	move_person_facing obj_T27R0501_rocketm, 6, 0, 6, DIR_EAST
	move_person_facing obj_T27R0501_dancer_3, 8, 0, 6, DIR_WEST
_007C:
	compare VAR_TEMP_x4009, 222
	goto_if_ne _0110
	move_person_facing obj_T27R0501_rocketm, 29, 0, 29, DIR_SOUTH
	scrcmd_375 obj_T27R0501_rocketm
	get_player_facing VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_ne _00BC
	move_person_facing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_SOUTH
	goto _0106

_00BC:
	compare VAR_TEMP_x4000, 1
	goto_if_ne _00DB
	move_person_facing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_NORTH
	goto _0106

_00DB:
	compare VAR_TEMP_x4000, 2
	goto_if_ne _00FA
	move_person_facing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_EAST
	goto _0106

_00FA:
	move_person_facing obj_T27R0501_rocketm_2, 7, 0, 6, DIR_WEST
_0106:
	scrcmd_374 obj_T27R0501_rocketm_2
	setvar VAR_TEMP_x4009, 0
_0110:
	compare VAR_TEMP_x400A, 10
	goto_if_eq _0136
	compare VAR_UNK_410C, 3
	goto_if_ne _0136
	move_person_facing obj_T27R0501_dancer_3, 7, 0, 6, DIR_SOUTH
_0136:
	end

scr_seq_T27R0501_015:
	scrcmd_609
	lockall
	npc_msg msg_0618_T27R0501_00000
	closemsg
	apply_movement obj_T27R0501_rocketm, _01CC
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, _01D4
	wait_movement
	wait 10, VAR_SPECIAL_RESULT
	apply_movement obj_T27R0501_rocketm, _01F0
	wait_movement
	npc_msg msg_0618_T27R0501_00001
	closemsg
	apply_movement obj_T27R0501_dancer_3, _01F8
	wait_movement
	npc_msg msg_0618_T27R0501_00002
	closemsg
	apply_movement obj_T27R0501_rocketm, _0200
	wait_movement
	npc_msg msg_0618_T27R0501_00003
	closemsg
	apply_movement obj_T27R0501_dancer_3, _0208
	wait_movement
	npc_msg msg_0618_T27R0501_00004
	closemsg
	apply_movement obj_T27R0501_rocketm, _0218
	wait_movement
	apply_movement obj_T27R0501_rocketm, _0220
	apply_movement 241, _01DC
	wait_movement
	scrcmd_103
	releaseall
	setvar VAR_UNK_410C, 1
	end
	.byte 0x00

_01CC:
	step 3, 1
	step_end

_01D4:
	step 76, 9
	step_end

_01DC:
	step 66, 1
	step 77, 9
	step_end
	.byte 0x0c, 0x00, 0x03, 0x00, 0xfe, 0x00, 0x00, 0x00

_01F0:
	step 15, 1
	step_end

_01F8:
	step 38, 1
	step_end

_0200:
	step 51, 2
	step_end

_0208:
	step 71, 1
	step 15, 2
	step 72, 1
	step_end

_0218:
	step 33, 1
	step_end

_0220:
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step_end
scr_seq_T27R0501_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_ROCKET
	npc_msg msg_0618_T27R0501_00005
	closemsg
	setvar VAR_TEMP_x4009, 222
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_26, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _040C
	npc_msg msg_0618_T27R0501_00006
	closemsg
	get_player_facing VAR_SPECIAL_x8004
	compare VAR_SPECIAL_x8004, 0
	goto_if_ne _0354
	apply_movement obj_T27R0501_rocketm_2, _0414
	goto _0392

_0354:
	compare VAR_SPECIAL_x8004, 1
	goto_if_ne _036F
	apply_movement obj_T27R0501_rocketm_2, _0424
	goto _0392

_036F:
	compare VAR_SPECIAL_x8004, 2
	goto_if_ne _038A
	apply_movement obj_T27R0501_rocketm_2, _0434
	goto _0392

_038A:
	apply_movement obj_T27R0501_rocketm_2, _0444
_0392:
	wait_movement
	npc_msg msg_0618_T27R0501_00007
	closemsg
	compare VAR_SPECIAL_x8004, 0
	goto_if_ne _03B4
	apply_movement obj_T27R0501_rocketm_2, _0454
	goto _03F2

_03B4:
	compare VAR_SPECIAL_x8004, 1
	goto_if_ne _03CF
	apply_movement obj_T27R0501_rocketm_2, _0460
	goto _03F2

_03CF:
	compare VAR_SPECIAL_x8004, 2
	goto_if_ne _03EA
	apply_movement obj_T27R0501_rocketm_2, _046C
	goto _03F2

_03EA:
	apply_movement obj_T27R0501_rocketm_2, _0478
_03F2:
	wait_movement
	hide_person obj_T27R0501_rocketm_2
	setflag FLAG_UNK_23A
	releaseall
	setvar VAR_UNK_410C, 2
	setvar VAR_TEMP_x400A, 10
	end

_040C:
	white_out
	releaseall
	end
	.byte 0x00, 0x00

_0414:
	step 71, 1
	step 12, 1
	step 72, 1
	step_end

_0424:
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_0434:
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

_0444:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_0454:
	step 18, 4
	step 17, 12
	step_end

_0460:
	step 18, 4
	step 17, 10
	step_end

_046C:
	step 18, 3
	step 17, 10
	step_end

_0478:
	step 17, 1
	step 19, 3
	step 17, 9
	step_end
scr_seq_T27R0501_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_410C, 1
	goto_if_eq _04B5
	compare VAR_TEMP_x400A, 10
	goto_if_eq _04C0
	npc_msg msg_0618_T27R0501_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04B5:
	npc_msg msg_0618_T27R0501_00008
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04C0:
	buffer_players_name 0
	npc_msg msg_0618_T27R0501_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0501_011:
	scrcmd_609
	lockall
	apply_movement obj_T27R0501_gsgentleman, _05B4
	wait_movement
	npc_msg msg_0618_T27R0501_00026
	goto_if_no_item_space ITEM_HM03, 1, _05A9
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_410C, 3
	setvar VAR_UNK_4090, 1
	npc_msg msg_0618_T27R0501_00028
	closemsg
	apply_movement obj_T27R0501_gsgentleman, _05C4
	wait_movement
	releaseall
	end

scr_seq_T27R0501_012:
	scrcmd_609
	lockall
	apply_movement obj_T27R0501_gsgentleman, _05D8
	wait_movement
	npc_msg msg_0618_T27R0501_00026
	goto_if_no_item_space ITEM_HM03, 1, _05A9
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_4090, 1
	setvar VAR_UNK_410C, 3
	npc_msg msg_0618_T27R0501_00028
	closemsg
	apply_movement obj_T27R0501_gsgentleman, _05E8
	wait_movement
	releaseall
	end

scr_seq_T27R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_0A2, _059E
	npc_msg msg_0618_T27R0501_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_059E:
	npc_msg msg_0618_T27R0501_00029
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_05A9:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.byte 0x00

_05B4:
	step 12, 1
	step 14, 5
	step 12, 2
	step_end

_05C4:
	step 13, 2
	step 15, 5
	step 13, 1
	step 0, 1
	step_end

_05D8:
	step 12, 1
	step 15, 3
	step 12, 2
	step_end

_05E8:
	step 13, 2
	step 14, 3
	step 13, 1
	step 0, 1
	step_end
scr_seq_T27R0501_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_PSYDUCK, 0
	npc_msg msg_0618_T27R0501_00030
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0501_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x400A, 10
	goto_if_eq _0644
	compare VAR_UNK_410C, 1
	goto_if_eq _064F
	npc_msg msg_0618_T27R0501_00031
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0644:
	npc_msg msg_0618_T27R0501_00033
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_064F:
	compare VAR_TEMP_x400B, 0
	goto_if_ne _0665
	npc_msg msg_0618_T27R0501_00032
	goto _067E

_0665:
	compare VAR_TEMP_x400B, 1
	goto_if_ne _067B
	npc_msg msg_0618_T27R0501_00034
	goto _067E

_067B:
	npc_msg msg_0618_T27R0501_00035
_067E:
	wait_button_or_walk_away
	closemsg
	releaseall
	compare VAR_TEMP_x400B, 2
	goto_if_ge _069D
	addvar VAR_TEMP_x400B, 1
	goto _06A3

_069D:
	setvar VAR_TEMP_x400B, 0
_06A3:
	end

scr_seq_T27R0501_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x400A, 10
	goto_if_eq _06D2
	compare VAR_UNK_410C, 1
	goto_if_eq _06DD
	npc_msg msg_0618_T27R0501_00036
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_06D2:
	npc_msg msg_0618_T27R0501_00038
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_06DD:
	npc_msg msg_0618_T27R0501_00037
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0501_010:
	simple_npc_msg msg_0618_T27R0501_00039
	end

scr_seq_T27R0501_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _0724
	goto_if_set FLAG_UNK_109, _0724
	npc_msg msg_0618_T27R0501_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0724:
	npc_msg msg_0618_T27R0501_00040
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0501_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _0758
	goto_if_set FLAG_UNK_109, _0758
	npc_msg msg_0618_T27R0501_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0758:
	npc_msg msg_0618_T27R0501_00041
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0501_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 77
	goto_if_set FLAG_UNK_108, _0868
	goto_if_set FLAG_UNK_109, _0868
	npc_msg msg_0618_T27R0501_00013
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x8004
	touchscreen_menu_show
	compare VAR_SPECIAL_x8004, 1
	goto_if_eq _0BD3
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	call_if_ne _07BA
	goto _0944
	.byte 0x02, 0x00
_07BA:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _07DF
	apply_movement obj_player, _0828
	goto _080F

_07DF:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _07FA
	apply_movement obj_player, _083C
	goto _080F

_07FA:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _080F
	apply_movement obj_player, _084C
_080F:
	apply_movement obj_T27R0501_dancer_6, _085C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return
	.byte 0x00, 0x00, 0x00

_0828:
	step 15, 1
	step 13, 2
	step 14, 1
	step 32, 1
	step_end

_083C:
	step 13, 1
	step 14, 1
	step 32, 1
	step_end

_084C:
	step 13, 1
	step 15, 1
	step 32, 1
	step_end

_085C:
	step 63, 2
	step 33, 1
	step_end
_0868:
	buffer_players_name 0
	npc_msg msg_0618_T27R0501_00042
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_107
	releaseall
	end

scr_seq_T27R0501_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _08A3
	goto_if_set FLAG_UNK_109, _08A3
	npc_msg msg_0618_T27R0501_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_08A3:
	npc_msg msg_0618_T27R0501_00043
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0501_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_108, _08D7
	goto_if_set FLAG_UNK_109, _08D7
	npc_msg msg_0618_T27R0501_00019
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_08D7:
	npc_msg msg_0618_T27R0501_00044
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T27R0501_016:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x8000, 11
	setvar VAR_UNK_410C, 5
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0BF4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _092A
	npc_msg msg_0618_T27R0501_00011
	goto _092D

_092A:
	npc_msg msg_0618_T27R0501_00012
_092D:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x8004
	touchscreen_menu_show
	compare VAR_SPECIAL_x8004, 1
	goto_if_eq _0BD3
	closemsg
_0944:
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_6, _0D74
	wait_movement
	npc_msg msg_0618_T27R0501_00045
	closemsg
	wait 10, VAR_SPECIAL_RESULT
	trainer_battle TRAINER_KIMONO_GIRL_ZUKI, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0BC9
	apply_movement obj_T27R0501_dancer_6, _0C0C
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer, _0C18
	wait_movement
	npc_msg msg_0618_T27R0501_00015
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_NAOKO, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0BC9
	apply_movement obj_T27R0501_dancer, _0C48
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_5, _0C54
	wait_movement
	npc_msg msg_0618_T27R0501_00016
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_MIKI, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0BC9
	apply_movement obj_T27R0501_dancer_5, _0C84
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_2, _0C90
	wait_movement
	npc_msg msg_0618_T27R0501_00017
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_SAYO, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0BC9
	apply_movement obj_T27R0501_dancer_2, _0CBC
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_4, _0CCC
	wait_movement
	npc_msg msg_0618_T27R0501_00018
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_KUNI, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0BC9
	apply_movement obj_T27R0501_dancer_4, _0CF8
	wait_movement
	apply_movement obj_T27R0501_dancer_6, _0D08
	wait_movement
	npc_msg msg_0618_T27R0501_00020
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _0AA4
	giveitem_no_check ITEM_CLEAR_BELL, 1
	setflag FLAG_UNK_103
	goto _0AB8

_0AA4:
	giveitem_no_check ITEM_TIDAL_BELL, 1
	setflag FLAG_UNK_104
_0AB8:
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 6
	wait_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_HIDE_DANCE_STUDIO_LITTLE_GIRL
	show_person obj_T27R0501_gsbabygirl1
	apply_movement obj_T27R0501_gsbabygirl1, _0D10
	wait_movement
	apply_movement obj_T27R0501_dancer_6, _0BEC
	wait_movement
	get_game_version VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _0B02
	npc_msg msg_0618_T27R0501_00021
	goto _0B05

_0B02:
	npc_msg msg_0618_T27R0501_00022
_0B05:
	closemsg
	apply_movement obj_T27R0501_dancer_6, _0BE4
	wait_movement
	buffer_players_name 0
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _0B2A
	npc_msg msg_0618_T27R0501_00023
	goto _0B2D

_0B2A:
	npc_msg msg_0618_T27R0501_00024
_0B2D:
	closemsg
	apply_movement obj_T27R0501_dancer, _0D1C
	apply_movement obj_T27R0501_dancer_2, _0D28
	apply_movement obj_T27R0501_dancer_6, _0D38
	apply_movement obj_T27R0501_dancer_4, _0D48
	apply_movement obj_T27R0501_dancer_5, _0D58
	apply_movement obj_T27R0501_gsbabygirl1, _0D64
	wait_movement
	hide_person obj_T27R0501_dancer
	hide_person obj_T27R0501_dancer_2
	hide_person obj_T27R0501_dancer_6
	hide_person obj_T27R0501_dancer_4
	hide_person obj_T27R0501_dancer_5
	hide_person obj_T27R0501_gsbabygirl1
	setflag FLAG_HIDE_DANCE_STUDIO_KIMONO_GIRLS
	setflag FLAG_HIDE_DANCE_STUDIO_LITTLE_GIRL
	call _0BB0
	setvar VAR_UNK_410C, 6
	setvar VAR_UNK_40FA, 1
	compare VAR_SPECIAL_RESULT, 7
	goto_if_ne _0BAA
	clearflag FLAG_HIDE_BELL_TOWER_SUMMIT_KIMONO_GIRLS
	goto _0BAE

_0BAA:
	clearflag FLAG_HIDE_WHIRL_ISLANDS_BOTTOM_KIMONO_GIRLS
_0BAE:
	end

_0BB0:
	compare VAR_SPECIAL_x8000, 77
	goto_if_ne _0BC5
	releaseall
	goto _0BC7

_0BC5:
	releaseall
_0BC7:
	return

_0BC9:
	white_out
	call _0BB0
	end

_0BD3:
	npc_msg msg_0618_T27R0501_00014
	wait_button_or_walk_away
	closemsg
	call _0BB0
	end
	.byte 0x00, 0x00

_0BE4:
	step 75, 1
	step_end

_0BEC:
	step 34, 1
	step_end

_0BF4:
	step 12, 5
	step 14, 4
	step 12, 5
	step 15, 4
	step 32, 1
	step_end

_0C0C:
	step 12, 1
	step 33, 1
	step_end

_0C18:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 35, 1
	step 15, 5
	step 33, 1
	step_end

_0C48:
	step 14, 5
	step 33, 1
	step_end

_0C54:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 34, 1
	step 14, 5
	step 33, 1
	step_end

_0C84:
	step 15, 5
	step 33, 1
	step_end

_0C90:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 33, 1
	step 13, 1
	step 15, 3
	step 33, 1
	step_end

_0CBC:
	step 14, 3
	step 12, 1
	step 33, 1
	step_end

_0CCC:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 33, 1
	step 13, 1
	step 14, 3
	step 33, 1
	step_end

_0CF8:
	step 15, 3
	step 12, 1
	step 33, 1
	step_end

_0D08:
	step 13, 1
	step_end

_0D10:
	step 16, 10
	step 19, 3
	step_end

_0D1C:
	step 15, 1
	step 13, 11
	step_end

_0D28:
	step 63, 1
	step 14, 1
	step 13, 12
	step_end

_0D38:
	step 63, 1
	step 15, 4
	step 13, 11
	step_end

_0D48:
	step 63, 1
	step 15, 1
	step 13, 12
	step_end

_0D58:
	step 14, 1
	step 13, 11
	step_end

_0D64:
	step 63, 2
	step 15, 5
	step 13, 11
	step_end

_0D74:
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 62, 1
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 33, 1
	step_end
	.balign 4, 0
