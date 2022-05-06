#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0103.h"
#include "msgdata/msg/msg_0113_D35R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D35R0103_000
	scrdef scr_seq_D35R0103_001
	scrdef scr_seq_D35R0103_002
	scrdef scr_seq_D35R0103_003
	scrdef scr_seq_D35R0103_004
	scrdef scr_seq_D35R0103_005
	scrdef scr_seq_D35R0103_006
	scrdef scr_seq_D35R0103_007
	scrdef scr_seq_D35R0103_008
	scrdef scr_seq_D35R0103_009
	scrdef scr_seq_D35R0103_010
	scrdef scr_seq_D35R0103_011
	scrdef scr_seq_D35R0103_012
	scrdef scr_seq_D35R0103_013
	scrdef scr_seq_D35R0103_014
	scrdef_end

scr_seq_D35R0103_002:
	scrcmd_710
	compare VAR_UNK_40A9, 3
	goto_if_ge _004F
	end

_004F:
	move_person_facing obj_D35R0103_babyboy1_9, 29, 0, 22, DIR_NORTH
	move_person_facing obj_D35R0103_babyboy1_9_2, 29, 0, 22, DIR_NORTH
	compare VAR_UNK_40AC, 10
	goto_if_ge _00B0
	compare VAR_UNK_40A9, 4
	goto_if_ge _0083
	end

_0083:
	compare VAR_TEMP_x4007, 0
	goto_if_ne _00B0
	setvar VAR_TEMP_x4007, 77
	move_person_facing obj_D35R0103_wataru, 39, 0, 18, DIR_NORTH
	move_person_facing obj_D35R0103_tsure_poke_static_dragonite, 40, 0, 18, DIR_NORTH
	end

_00B0:
	end

scr_seq_D35R0103_007:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _00BF
	end

_00BF:
	scrcmd_221 VAR_TEMP_x4000, 1
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0127
	compare VAR_TEMP_x400A, 1
	goto_if_ne _00F4
	setflag FLAG_UNK_96B
	hide_person obj_D35R0103_tsure_poke_static_electrode
	hide_person obj_D35R0103_tsure_poke_static_electrode_4
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_ELECTRODE_1_AND_4
	goto _0127

_00F4:
	compare VAR_TEMP_x400A, 2
	goto_if_ne _0117
	setflag FLAG_UNK_96C
	hide_person obj_D35R0103_tsure_poke_static_electrode_2
	hide_person obj_D35R0103_tsure_poke_static_electrode_5
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_ELECTRODE_2_AND_5
	goto _0127

_0117:
	setflag FLAG_UNK_96D
	hide_person obj_D35R0103_tsure_poke_static_electrode_3
	hide_person obj_D35R0103_tsure_poke_static_electrode_6
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_ELECTRODE_3_AND_6
_0127:
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_D35R0103_000:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _01AC
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0113_D35R0103_00000
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	buffer_players_name 0
	gender_msgbox msg_0113_D35R0103_00001, msg_0113_D35R0103_00002
	closemsg
	apply_movement obj_D35R0103_wataru, _01B8
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _01C0
	wait_movement
	hide_person obj_D35R0103_wataru
	hide_person obj_D35R0103_tsure_poke_static_dragonite
	setflag FLAG_UNK_1E5
	releaseall
	setvar VAR_UNK_40A9, 1
	end
	.byte 0x00, 0x00, 0x00

_01AC:
	step 15, 5
	step 12, 4
	step_end

_01B8:
	step 15, 11
	step_end

_01C0:
	step 61, 1
	step 15, 11
	step_end
scr_seq_D35R0103_013:
	scrcmd_609
	lockall
	apply_movement obj_D35R0103_tsure_poke_static_murkrow, _0214
	wait_movement
	npc_msg msg_0113_D35R0103_00024
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D35R0103_tsure_poke_static_murkrow, _021C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setvar VAR_UNK_40AC, 5
	hide_person obj_D35R0103_tsure_poke_static_murkrow
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	releaseall
	end
	.byte 0x00

_0214:
	step 50, 2
	step_end

_021C:
	step 3, 1
	step 51, 1
	step 19, 5
	step_end
	.byte 0x3f, 0x00, 0x01, 0x00
	.byte 0x0f, 0x00, 0x03, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D35R0103_014:
	scrcmd_609
	lockall
	apply_movement obj_D35R0103_tsure_poke_static_murkrow_2, _0270
	wait_movement
	npc_msg msg_0113_D35R0103_00025
	closemsg
	apply_movement obj_D35R0103_tsure_poke_static_murkrow_2, _0278
	wait_movement
	setvar VAR_UNK_40AC, 7
	hide_person obj_D35R0103_tsure_poke_static_murkrow_2
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_2
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_3
	show_person obj_D35R0103_tsure_poke_static_murkrow_3
	releaseall
	end
	.byte 0x00

_0270:
	step 51, 2
	step_end

_0278:
	step 2, 1
	step 50, 1
	step 18, 10
	step_end
scr_seq_D35R0103_011:
	scrcmd_609
	lockall
	apply_movement obj_D35R0103_tsure_poke_static_murkrow_3, _0308
	wait_movement
	npc_msg msg_0113_D35R0103_00026
	closemsg
	npc_msg msg_0113_D35R0103_00027
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement obj_D35R0103_babyboy1_9, _03B0
	apply_movement obj_D35R0103_babyboy1_9_2, _03B8
	wait_movement
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	compare VAR_SPECIAL_x8001, 24
	goto_if_ne _02D7
	apply_movement obj_D35R0103_tsure_poke_static_murkrow_3, _0324
	goto _02DF

_02D7:
	apply_movement obj_D35R0103_tsure_poke_static_murkrow_3, _0310
_02DF:
	wait_movement
	setvar VAR_UNK_40AC, 8
	hide_person obj_D35R0103_tsure_poke_static_murkrow_3
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_3
	setvar VAR_UNK_40A9, 3
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	setflag FLAG_UNK_0D3
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0308:
	step 48, 2
	step_end

_0310:
	step 48, 2
	step 2, 1
	step 63, 1
	step 18, 12
	step_end

_0324:
	step 48, 2
	step 2, 1
	step 63, 1
	step 18, 2
	step 50, 2
	step 17, 1
	step 18, 10
	step_end
scr_seq_D35R0103_012:
	goto scr_seq_D35R0103_011
	.byte 0x02, 0x00, 0x4b, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x12, 0x00, 0x09, 0x00, 0x10, 0x00, 0x05, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D35R0103_001:
	compare VAR_UNK_40AC, 8
	goto_if_ge _03A0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_unset FLAG_UNK_0D3, _03A2
	buffer_players_name 0
	npc_msg msg_0113_D35R0103_00021
	closemsg
	play_se SEQ_SE_DP_DOOR10
	apply_movement obj_D35R0103_babyboy1_9, _03B0
	apply_movement obj_D35R0103_babyboy1_9_2, _03B8
	wait_movement
	releaseall
_03A0:
	end

_03A2:
	npc_msg msg_0113_D35R0103_00020
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_03B0:
	step 14, 2
	step_end

_03B8:
	step 63, 1
	step 14, 1
	step_end
scr_seq_D35R0103_003:
	scrcmd_609
	lockall
	npc_msg msg_0113_D35R0103_00003
	apply_movement obj_player, _0630
	wait_movement
	closemsg
	clearflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	show_person obj_D35R0103_rkanbuw
	show_person obj_D35R0103_rocketm_4
	move_person_facing obj_D35R0103_rkanbuw, 32, 1, 30, DIR_EAST
	move_person_facing obj_D35R0103_rocketm_4, 30, 1, 30, DIR_NORTH
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_ROCKET
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 30
	goto_if_ne _042E
	apply_movement obj_player, _065C
	goto _0436

_042E:
	apply_movement obj_player, _0668
_0436:
	apply_movement obj_D35R0103_rkanbuw, _0638
	apply_movement obj_D35R0103_rocketm_4, _0650
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_D35R0103_rkanbuw, _0648
	wait_movement
	npc_msg msg_0113_D35R0103_00004
	closemsg
	clearflag FLAG_UNK_1E5
	show_person obj_D35R0103_wataru
	show_person obj_D35R0103_tsure_poke_static_dragonite
	move_person_facing obj_D35R0103_wataru, 20, 1, 25, DIR_EAST
	move_person_facing obj_D35R0103_tsure_poke_static_dragonite, 19, 1, 25, DIR_NORTH
	apply_movement obj_D35R0103_wataru, _067C
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _0684
	wait_movement
	npc_msg msg_0113_D35R0103_00005
	closemsg
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _0690
	play_cry SPECIES_DRAGONITE, 0
	wait_cry
	apply_movement obj_D35R0103_rkanbuw, _0648
	wait_movement
	npc_msg msg_0113_D35R0103_00006
	closemsg
	apply_movement obj_D35R0103_rkanbuw, _0698
	apply_movement obj_D35R0103_rocketm_4, _06A0
	wait_movement
	multi_battle TRAINER_PKMN_TRAINER_LANCE_LANCE, TRAINER_EXECUTIVE_ARIANA_ARIANA_2, TRAINER_TEAM_ROCKET_GRUNT_25, 1
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0620
	npc_msg msg_0113_D35R0103_00008
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	move_person_facing obj_D35R0103_wataru, 28, 1, 24, DIR_SOUTH
	move_person_facing obj_D35R0103_tsure_poke_static_dragonite, 27, 1, 24, DIR_EAST
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _06A8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person obj_D35R0103_rkanbuw
	hide_person obj_D35R0103_rocketm_4
	hide_person obj_D35R0103_rocketm_2
	hide_person obj_D35R0103_rocketm_3
	hide_person obj_D35R0103_rocketm
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	setflag FLAG_HIDE_MAHOGANY_SHOP_SHADY_SALESMAN
	setflag FLAG_UNK_1E8
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	apply_movement obj_D35R0103_wataru, _06BC
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _06C4
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0113_D35R0103_00010, msg_0113_D35R0103_00011
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0738
	apply_movement obj_D35R0103_wataru, _06D0
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _070C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_cry SPECIES_DRAGONITE, 0
	wait_cry
	apply_movement obj_D35R0103_wataru, _06FC
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _072C
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0113_D35R0103_00012, msg_0113_D35R0103_00013
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0744
	apply_movement obj_D35R0103_wataru, _0758
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _0760
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	move_person_facing obj_D35R0103_wataru, 39, 0, 18, DIR_NORTH
	move_person_facing obj_D35R0103_tsure_poke_static_dragonite, 40, 0, 18, DIR_NORTH
	releaseall
	setvar VAR_UNK_40AC, 9
	setvar VAR_UNK_40A9, 4
	setflag FLAG_UNK_998
	end

_0620:
	white_out
	setflag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	setflag FLAG_UNK_1E5
	releaseall
	end
	.byte 0x00, 0x00

_0630:
	step 75, 1
	step_end

_0638:
	step 63, 1
	step 16, 6
	step 34, 1
	step_end

_0648:
	step 34, 1
	step_end

_0650:
	step 63, 2
	step 16, 3
	step_end

_065C:
	step 13, 5
	step 35, 1
	step_end

_0668:
	step 13, 2
	step 14, 1
	step 13, 3
	step 35, 1
	step_end

_067C:
	step 19, 10
	step_end

_0684:
	step 62, 1
	step 19, 10
	step_end

_0690:
	step 51, 1
	step_end

_0698:
	step 18, 1
	step_end

_06A0:
	step 16, 1
	step_end

_06A8:
	step 16, 2
	step 19, 1
	step 17, 2
	step 2, 1
	step_end

_06BC:
	step 15, 2
	step_end

_06C4:
	step 61, 1
	step 15, 2
	step_end

_06D0:
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

_06FC:
	step 14, 2
	step 33, 1
	step 33, 1
	step_end

_070C:
	step 61, 1
	step 15, 1
	step 12, 5
	step 15, 8
	step 12, 1
	step 63, 4
	step 14, 4
	step_end

_072C:
	step 62, 1
	step 14, 2
	step_end

_0738:
	step 63, 4
	step 12, 5
	step_end

_0744:
	step 61, 1
	step 63, 1
	step 12, 1
	step 14, 5
	step_end

_0758:
	step 15, 6
	step_end

_0760:
	step 61, 1
	step 14, 1
	step 15, 5
	step_end
scr_seq_D35R0103_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 1
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_ELECTRODE, 23, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _089C
	scrcmd_221 VAR_TEMP_x4000, 0
	compare VAR_TEMP_x4000, 1
	goto_if_eq _07D0
	setflag FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2, _07D0
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3, _07D0
	goto _08A2

_07D0:
	releaseall
	end

scr_seq_D35R0103_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 2
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_ELECTRODE, 23, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _089C
	scrcmd_221 VAR_TEMP_x4000, 0
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0834
	setflag FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1, _0834
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3, _0834
	goto _08A2

_0834:
	releaseall
	end

scr_seq_D35R0103_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x400A, 3
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_ELECTRODE, 23, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _089C
	scrcmd_221 VAR_TEMP_x4000, 0
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0898
	setflag FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1, _0898
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2, _0898
	goto _08A2

_0898:
	releaseall
	end

_089C:
	white_out
	releaseall
	end

_08A2:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_TEMP_x4001, 16
	goto_if_ne _08CD
	apply_movement obj_player, _09E0
	goto _08F0

_08CD:
	compare VAR_TEMP_x4001, 14
	goto_if_ne _08E8
	apply_movement obj_player, _09EC
	goto _08F0

_08E8:
	apply_movement obj_player, _09F8
_08F0:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_D35R0103_wataru, _0A04
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _0A0C
	wait_movement
	npc_msg msg_0113_D35R0103_00015
	giveitem_no_check ITEM_HM05, 1
	npc_msg msg_0113_D35R0103_00017
	closemsg
	apply_movement obj_D35R0103_wataru, _0A18
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0113_D35R0103_00018, msg_0113_D35R0103_00019
	closemsg
	apply_movement obj_D35R0103_wataru, _0A20
	apply_movement obj_D35R0103_tsure_poke_static_dragonite, _0A2C
	wait_movement
	hide_person obj_D35R0103_wataru
	hide_person obj_D35R0103_tsure_poke_static_dragonite
	setflag FLAG_UNK_1E5
	releaseall
	stop_se SEQ_SE_GS_N_MOTER
	setflag FLAG_RED_GYARADOS_MEET
	clearflag FLAG_HIDE_ROUTE_43_GATE_GUARD
	setflag FLAG_HIDE_ROUTE_43_GATE_ROCKETS
	setflag FLAG_UNK_1F9
	setvar VAR_UNK_40AC, 10
	setvar VAR_UNK_410F, 1
	scrcmd_530 0, 1
	setvar VAR_ROCKET_TRAP_KOFFING_1, 1
	setvar VAR_ROCKET_TRAP_VOLTORB_1, 1
	setvar VAR_ROCKET_TRAP_GEODUDE_1, 1
	setvar VAR_ROCKET_TRAP_VOLTORB_2, 1
	setvar VAR_ROCKET_TRAP_GEODUDE_2, 1
	setvar VAR_ROCKET_TRAP_VOLTORB_3, 1
	setvar VAR_ROCKET_TRAP_VOLTORB_4, 1
	setvar VAR_ROCKET_TRAP_KOFFING_2, 1
	setvar VAR_ROCKET_TRAP_KOFFING_3, 1
	setvar VAR_ROCKET_TRAP_GEODUDE_3, 1
	setvar VAR_ROCKET_TRAP_GEODUDE_4, 1
	setvar VAR_ROCKET_TRAP_KOFFING_4, 1
	setvar VAR_ROCKET_TRAP_VOLTORB_5, 1
	setvar VAR_ROCKET_TRAP_VOLTORB_6, 1
	setvar VAR_ROCKET_TRAP_KOFFING_5, 1
	setvar VAR_ROCKET_TRAP_GEODUDE_5, 1
	end


_09E0:
	step 13, 2
	step 15, 10
	step_end

_09EC:
	step 13, 4
	step 15, 10
	step_end

_09F8:
	step 13, 6
	step 15, 10
	step_end

_0A04:
	step 14, 8
	step_end

_0A0C:
	step 61, 1
	step 14, 8
	step_end

_0A18:
	step 33, 1
	step_end

_0A20:
	step 17, 6
	step 18, 12
	step_end

_0A2C:
	step 62, 1
	step 18, 1
	step 17, 6
	step 18, 12
	step_end
scr_seq_D35R0103_008:
	scrcmd_609
	lockall
	npc_msg msg_0113_D35R0103_00014
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0A6C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end
	.byte 0x00

_0A6C:
	step 14, 1
	step_end
scr_seq_D35R0103_009:
	scrcmd_609
	lockall
	apply_movement obj_D35R0103_wataru, _0AAC
	wait_movement
	npc_msg msg_0113_D35R0103_00014
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0A6C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0AAC:
	step 75, 1
	step 34, 1
	step_end
scr_seq_D35R0103_010:
	releaseall
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_1, _0AE4
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_2, _0AE4
	goto_if_unset FLAG_REMOVED_ROCKET_HIDEOUT_B3F_ELECTRODE_3, _0AE4
	npc_msg msg_0113_D35R0103_00023
	closemsg
	releaseall
	end

_0AE4:
	npc_msg msg_0113_D35R0103_00022
	closemsg
	releaseall
	end
	.balign 4, 0
