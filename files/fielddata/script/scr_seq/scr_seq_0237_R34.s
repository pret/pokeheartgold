#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R34.h"
#include "msgdata/msg/msg_0384_R34.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R34_000
	scrdef scr_seq_R34_001
	scrdef scr_seq_R34_002
	scrdef scr_seq_R34_003
	scrdef scr_seq_R34_004
	scrdef scr_seq_R34_005
	scrdef scr_seq_R34_006
	scrdef scr_seq_R34_007
	scrdef scr_seq_R34_008
	scrdef scr_seq_R34_009
	scrdef scr_seq_R34_010
	scrdef scr_seq_R34_011
	scrdef scr_seq_R34_012
	scrdef_end

scr_seq_R34_000:
	get_friend_sprite VAR_OBJ_0
	check_day_care_egg VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0057
	set_object_movement_type obj_R34_gsoldman1, 16
	goto _005D

_0057:
	set_object_movement_type obj_R34_gsoldman1, 15
_005D:
	goto_if_unset FLAG_UNK_189, _006E
	clearflag FLAG_UNK_189
	end

_006E:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _009F
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _00A9
	compare VAR_TEMP_x4000, 4
	goto_if_eq _00A9
_009F:
	setflag FLAG_HIDE_CAMERON
	goto _00AD

_00A9:
	clearflag FLAG_HIDE_CAMERON
_00AD:
	scrcmd_379 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 3
	goto_if_eq _00D5
	compare VAR_TEMP_x4000, 4
	goto_if_eq _00D5
	clearflag FLAG_UNK_1D1
	setflag FLAG_UNK_1D2
	end

_00D5:
	clearflag FLAG_UNK_1D2
	setflag FLAG_UNK_1D1
	end

scr_seq_R34_001:
	scrcmd_609
	lockall
	apply_movement obj_R34_gsoldman1, _0130
	apply_movement obj_player, _0140
	wait_movement
	npc_msg msg_0384_R34_00046
	buffer_players_name 0
	register_gear_number PHONE_CONTACT_DAY_C_MAN
	npc_msg msg_0384_R34_00047
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_DAY_C_LADY
	npc_msg msg_0384_R34_00048
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0384_R34_00049
	closemsg
	apply_movement obj_R34_gsoldman1, _014C
	wait_movement
	setvar VAR_UNK_408E, 3
	releaseall
	end
	.byte 0x00, 0x00

_0130:
	step 75, 1
	step 13, 1
	step 15, 2
	step_end

_0140:
	step 63, 3
	step 34, 1
	step_end

_014C:
	step 14, 2
	step 12, 1
	step 33, 1
	step_end
scr_seq_R34_003:
	scrcmd_609
	lockall
	gender_msgbox msg_0384_R34_00036, msg_0384_R34_00041
	closemsg
	apply_movement obj_R34_gsoldman1, _0510
	wait_movement
	callstd std_play_friend_music
	apply_movement obj_R34_var_1, _049C
	apply_movement obj_R34_tsure_poke_static_marill, _04B0
	wait_movement
	apply_movement obj_R34_gsoldman1, _0500
	wait_movement
	gender_msgbox msg_0384_R34_00037, msg_0384_R34_00042
	closemsg
	apply_movement obj_R34_var_1, _04F8
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	buffer_players_name 0
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _01D4
	apply_movement obj_R34_var_1, _04C0
	apply_movement obj_R34_tsure_poke_static_marill, _04CC
	apply_movement obj_R34_gsoldman1, _0494
	goto _0207

_01D4:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _01FF
	apply_movement obj_R34_var_1, _04C0
	apply_movement obj_R34_tsure_poke_static_marill, _04CC
	apply_movement obj_R34_gsoldman1, _0494
	goto _0207

_01FF:
	apply_movement obj_R34_var_1, _0518
_0207:
	wait_movement
	gender_msgbox msg_0384_R34_00038, msg_0384_R34_00043
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_SPECIAL_x8004, 363
	goto_if_ne _0234
	apply_movement obj_player, _0528
	goto _02C3

_0234:
	compare VAR_SPECIAL_x8004, 364
	goto_if_ne _024F
	apply_movement obj_player, _0534
	goto _02C3

_024F:
	compare VAR_SPECIAL_x8004, 365
	goto_if_ne _026A
	apply_movement obj_player, _053C
	goto _02C3

_026A:
	compare VAR_SPECIAL_x8004, 366
	goto_if_ne _0285
	apply_movement obj_player, _0548
	goto _02C3

_0285:
	compare VAR_SPECIAL_x8004, 367
	goto_if_ne _02A0
	apply_movement obj_player, _0554
	goto _02C3

_02A0:
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _02BB
	apply_movement obj_player, _0560
	goto _02C3

_02BB:
	apply_movement obj_player, _056C
_02C3:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _02EA
	apply_movement obj_R34_var_1, _0510
	goto _030D

_02EA:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _0305
	apply_movement obj_R34_var_1, _0510
	goto _030D

_0305:
	apply_movement obj_R34_var_1, _0508
_030D:
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0384_R34_00039, msg_0384_R34_00044
	closemsg
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _033B
	apply_movement obj_R34_var_1, _04D4
	apply_movement obj_R34_tsure_poke_static_marill, _04E8
	goto _036E

_033B:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _035E
	apply_movement obj_R34_var_1, _04D4
	apply_movement obj_R34_tsure_poke_static_marill, _04E8
	goto _036E

_035E:
	apply_movement obj_R34_var_1, _04E0
	apply_movement obj_R34_tsure_poke_static_marill, _04F0
_036E:
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0384_R34_00040, msg_0384_R34_00045
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_SPECIAL_x8004, 368
	goto_if_ne _03AE
	apply_movement obj_R34_var_1, _0578
	apply_movement obj_R34_tsure_poke_static_marill, _0590
	apply_movement obj_player, _05A4
	goto _03F1

_03AE:
	compare VAR_SPECIAL_x8004, 369
	goto_if_ne _03D9
	apply_movement obj_R34_var_1, _0578
	apply_movement obj_R34_tsure_poke_static_marill, _0590
	apply_movement obj_player, _05A4
	goto _03F1

_03D9:
	apply_movement obj_R34_var_1, _0584
	apply_movement obj_R34_tsure_poke_static_marill, _0598
	apply_movement obj_player, _05B4
_03F1:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_307 11, 12, 16, 26, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_R34_var_1, _05C4
	apply_movement obj_R34_tsure_poke_static_marill, _05D0
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _05E0
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_596 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0455
	scrcmd_600
_0455:
	fade_screen 6, 1, 0, RGB_BLACK
	wait_se SEQ_SE_DP_KAIDAN2
	wait_fade
	scrcmd_309 77
	setvar VAR_UNK_408E, 1
	warp MAP_R34R0101, 0, 3, 12, DIR_NORTH
	scrcmd_582 MAP_R34, 368, 411
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end
	.byte 0x00, 0x00

_0494:
	step 33, 1
	step_end

_049C:
	step 13, 6
	step 15, 3
	step 13, 2
	step 35, 1
	step_end

_04B0:
	step 13, 7
	step 15, 3
	step 13, 1
	step_end

_04C0:
	step 13, 1
	step 35, 1
	step_end

_04CC:
	step 13, 1
	step_end

_04D4:
	step 15, 1
	step 33, 1
	step_end

_04E0:
	step 13, 1
	step_end

_04E8:
	step 13, 1
	step_end

_04F0:
	step 13, 1
	step_end

_04F8:
	step 75, 1
	step_end

_0500:
	step 34, 1
	step_end

_0508:
	step 35, 1
	step_end

_0510:
	step 32, 1
	step_end

_0518:
	step 33, 1
	step_end
	.byte 0x45, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_0528:
	step 15, 1
	step 12, 1
	step_end

_0534:
	step 12, 1
	step_end

_053C:
	step 14, 1
	step 12, 1
	step_end

_0548:
	step 14, 2
	step 12, 1
	step_end

_0554:
	step 14, 3
	step 12, 1
	step_end

_0560:
	step 14, 3
	step 12, 1
	step_end

_056C:
	step 14, 4
	step 12, 1
	step_end

_0578:
	step 15, 3
	step 32, 1
	step_end

_0584:
	step 15, 4
	step 32, 1
	step_end

_0590:
	step 15, 3
	step_end

_0598:
	step 13, 1
	step 15, 3
	step_end

_05A4:
	step 63, 1
	step 15, 3
	step 32, 1
	step_end

_05B4:
	step 63, 1
	step 15, 4
	step 32, 1
	step_end

_05C4:
	step 12, 1
	step 69, 1
	step_end

_05D0:
	step 15, 1
	step 12, 1
	step 69, 1
	step_end

_05E0:
	step 12, 2
	step 69, 1
	step_end
scr_seq_R34_002:
	simple_npc_msg msg_0384_R34_00018
	end

scr_seq_R34_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0727
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _073B
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0678
	apply_movement obj_player, _0750
	apply_movement obj_R34_gsmiddleman1_2, _079C
	goto _06C6

_0678:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0693
	apply_movement obj_player, _0768
	goto _06C6

_0693:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _06B6
	apply_movement obj_player, _0788
	apply_movement obj_R34_gsmiddleman1_2, _079C
	goto _06C6

_06B6:
	apply_movement obj_player, _0774
	apply_movement obj_R34_gsmiddleman1_2, _079C
_06C6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _06ED
	apply_movement obj_partner_poke, _07A8
	wait_movement
_06ED:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 9
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 2
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0727:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_073B:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_0750:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0768:
	step 12, 3
	step 33, 1
	step_end

_0774:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_0788:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_079C:
	step 63, 1
	step 32, 1
	step_end

_07A8:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R34_004:
	scrcmd_609
	lockall
	count_alive_mons VAR_TEMP_x4003, 6
	compare VAR_TEMP_x4003, 1
	goto_if_ne _07DB
	goto _07E1
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_07DB:
	goto _087D

_07E1:
	apply_movement obj_R34_gswoman3, _0918
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _0944
	wait_movement
	npc_msg msg_0384_R34_00019
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_IRENE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	apply_movement obj_R34_gswoman3, _094C
	wait_movement
	npc_msg msg_0384_R34_00021
	closemsg
	apply_movement obj_R34_gswoman3_2, _0924
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _093C
	wait_movement
	npc_msg msg_0384_R34_00024
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_JENN, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	apply_movement obj_R34_gswoman3_2, _0954
	wait_movement
	npc_msg msg_0384_R34_00026
	wait_button_or_walk_away
	closemsg
	goto _0908
	.byte 0x02, 0x00
_087D:
	apply_movement obj_R34_gswoman3, _0918
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _0944
	wait_movement
	npc_msg msg_0384_R34_00019
	closemsg
	apply_movement obj_R34_gswoman3_2, _0924
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	apply_movement obj_player, _093C
	wait_movement
	npc_msg msg_0384_R34_00024
	closemsg
	trainer_battle TRAINER_ACE_TRAINER_F_JENN, 120, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	apply_movement obj_R34_gswoman3, _094C
	wait_movement
	apply_movement obj_player, _0944
	wait_movement
	npc_msg msg_0384_R34_00021
	closemsg
	apply_movement obj_R34_gswoman3_2, _0954
	wait_movement
	apply_movement obj_player, _093C
	wait_movement
	npc_msg msg_0384_R34_00026
	wait_button_or_walk_away
	closemsg
_0908:
	setvar VAR_UNK_4097, 1
	releaseall
	end

_0912:
	white_out
	releaseall
	end


_0918:
	step 75, 1
	step 14, 4
	step_end

_0924:
	step 75, 1
	step 15, 4
	step_end

_0930:
	step 75, 1
	step 12, 2
	step_end

_093C:
	step 2, 1
	step_end

_0944:
	step 3, 1
	step_end

_094C:
	step 50, 2
	step_end

_0954:
	step 51, 2
	step_end
scr_seq_R34_005:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4004, 777
	apply_movement obj_R34_gswoman3_3, _0930
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_J_SHOUJO
	wait_movement
	npc_msg msg_0384_R34_00028
	closemsg
	scrcmd_081 0
	trainer_battle TRAINER_ACE_TRAINER_F_KATE, 0, 0, 0
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0912
	setvar VAR_UNK_4097, 2
_09A0:
	npc_msg msg_0384_R34_00030
	goto_if_no_item_space ITEM_POWER_HERB, 1, _09EE
	callstd std_give_item_verbose
	setvar VAR_UNK_4097, 3
	npc_msg msg_0384_R34_00032
	wait_button_or_walk_away
	closemsg
_09D5:
	compare VAR_TEMP_x4004, 777
	goto_if_ne _09EA
	releaseall
	goto _09EC

_09EA:
	releaseall
_09EC:
	end

_09EE:
	callstd std_bag_is_full
	closemsg
	goto _09D5
	.byte 0x02, 0x00
scr_seq_R34_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4097, 1
	goto_if_ne _0A1A
	npc_msg msg_0384_R34_00022
	goto _0A1D

_0A1A:
	npc_msg msg_0384_R34_00023
_0A1D:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R34_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_UNK_4097, 1
	goto_if_ne _0A43
	npc_msg msg_0384_R34_00026
	goto _0A46

_0A43:
	npc_msg msg_0384_R34_00027
_0A46:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R34_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4004, 555
	compare VAR_UNK_4097, 2
	goto_if_eq _09A0
	npc_msg msg_0384_R34_00032
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R34_009:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0384_R34_00034, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R34_010:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0384_R34_00035, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R34_011:
	direction_signpost msg_0384_R34_00033, 1, 4, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
