#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R36.h"
#include "msgdata/msg/msg_0390_R36.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R36_000
	scrdef scr_seq_R36_001
	scrdef scr_seq_R36_002
	scrdef scr_seq_R36_003
	scrdef scr_seq_R36_004
	scrdef scr_seq_R36_005
	scrdef scr_seq_R36_006
	scrdef scr_seq_R36_007
	scrdef scr_seq_R36_008
	scrdef scr_seq_R36_009
	scrdef scr_seq_R36_010
	scrdef_end

scr_seq_R36_002:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_ne _0049
	clearflag FLAG_UNK_1C4
	goto _004D

_0049:
	setflag FLAG_UNK_1C4
_004D:
	end

scr_seq_R36_010:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _005C
	end

_005C:
	setflag FLAG_HIDE_ROUTE_36_SUDOWOODO
	hide_person obj_R36_usokky
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_R36_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	goto_if_unset FLAG_HIDE_GOLDENROD_FLOWERSHOP_GIRL, _0261
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _009A
	apply_movement obj_R36_gsgirl1_2, _053C
	wait_movement
_009A:
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement obj_R36_usokky, _038C
	wait_movement
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _00B9
	releaseall
	end

_00B9:
	npc_msg msg_0390_R36_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _00E0
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _025B
	end

_00E0:
	buffer_players_name 0
	npc_msg msg_0390_R36_00001
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0109
	apply_movement obj_player, _039C
	goto _012C

_0109:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0124
	apply_movement obj_player, _03AC
	goto _012C

_0124:
	apply_movement obj_player, _03A4
_012C:
	wait_movement
	setflag FLAG_UNK_0B4
	npc_msg msg_0390_R36_00002
	closemsg
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement obj_R36_usokky, _0394
	wait_movement
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_SUDOWOODO, 20, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0255
	scrcmd_683 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 3
	goto_if_eq _0251
	compare VAR_TEMP_x4001, 4
	call_if_eq _023F
	setflag FLAG_UNK_0B5
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _01BC
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _03B4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto _01C6

_01BC:
	apply_movement obj_R36_gsgirl1_2, _0360
	wait_movement
_01C6:
	npc_msg msg_0390_R36_00015
	giveitem_no_check ITEM_BERRY_POTS, 1
	npc_msg msg_0390_R36_00016
	npc_msg msg_0390_R36_00017
	giveitem_no_check ITEM_ORAN_BERRY, 3
	giveitem_no_check ITEM_PECHA_BERRY, 3
	npc_msg msg_0390_R36_00018
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0225
	apply_movement obj_R36_gsgirl1_2, _0378
	wait_movement
	goto _022F

_0225:
	apply_movement obj_R36_gsgirl1_2, _0380
	wait_movement
_022F:
	hide_person obj_R36_gsgirl1_2
	setflag FLAG_UNK_1CF
	clearflag FLAG_HIDE_GOLDENROD_FLOWERSHOP_GIRL
	releaseall
	end

_023F:
	setflag FLAG_CAUGHT_SUDOWOODO
	return
	.byte 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x16, 0x00, 0xb3, 0xff, 0xff
	.byte 0xff
_0251:
	releaseall
	end

_0255:
	white_out
	releaseall
	end

_025B:
	closemsg
	releaseall
	end

_0261:
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement obj_R36_usokky, _038C
	wait_movement
	npc_msg msg_0390_R36_00000
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0296
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _025B
	end

_0296:
	buffer_players_name 0
	npc_msg msg_0390_R36_00001
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _02BF
	apply_movement obj_player, _039C
	goto _02E2

_02BF:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _02DA
	apply_movement obj_player, _03AC
	goto _02E2

_02DA:
	apply_movement obj_player, _03A4
_02E2:
	wait_movement
	npc_msg msg_0390_R36_00002
	closemsg
	play_se SEQ_SE_GS_KI_UGOKU
	apply_movement obj_R36_usokky, _0394
	wait_movement
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_SUDOWOODO, 20, 0
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0255
	scrcmd_683 VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 4
	call_if_eq _023F
	scrcmd_221 VAR_TEMP_x4000, 0
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0251
	releaseall
	end
	.byte 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x05, 0x00
	.byte 0x24, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_0360:
	step 12, 3
	step 3, 1
	step_end
	.byte 0x3f, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_0378:
	step 14, 10
	step_end

_0380:
	step 13, 2
	step 14, 10
	step_end

_038C:
	step 32, 3
	step_end

_0394:
	step 36, 6
	step_end

_039C:
	step 30, 4
	step_end

_03A4:
	step 28, 4
	step_end

_03AC:
	step 29, 4
	step_end

_03B4:
	step 13, 1
	step_end
scr_seq_R36_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_lead_alive VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_CARELESS
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04E2
	goto_if_set FLAG_DAILY_GOT_SHOCK_RIBBON, _04F6
	compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	goto_if_eq _0490
	goto_if_set FLAG_UNK_0B1, _0472
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _0423
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 15
	goto _046A

_0423:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 12
	goto_if_no_item_space ITEM_HARD_STONE, 1, _0486
	callstd std_give_item_verbose
	setflag FLAG_UNK_0B1
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 13
_046A:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0472:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 14
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0486:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0490:
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 4
	goto_if_eq _04B3
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 15
	goto _046A

_04B3:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 40
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_RESULT, 42
	give_ribbon VAR_SPECIAL_x8002, RIBBON_CARELESS
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_DAILY_GOT_SHOCK_RIBBON
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04E2:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 41
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_04F6:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 43
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R36_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0530
	npc_msg msg_0390_R36_00013
	goto _0533

_0530:
	npc_msg msg_0390_R36_00014
_0533:
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00

_053C:
	step 0, 1
	step_end
scr_seq_R36_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity ITEM_HM06, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0572
	npc_msg msg_0390_R36_00003
	giveitem_no_check ITEM_HM06, 1
_0572:
	npc_msg msg_0390_R36_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x2d, 0x00, 0x05
	.byte 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x14, 0x00, 0xd9, 0x07, 0x35, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
scr_seq_R36_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_HIDE_ROUTE_36_SUDOWOODO, _05AE
	npc_msg msg_0390_R36_00007
	goto _05B1

_05AE:
	npc_msg msg_0390_R36_00008
_05B1:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R36_003:
	direction_signpost msg_0390_R36_00009, 1, 15, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R36_004:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0390_R36_00010, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R36_005:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0390_R36_00011, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R36_006:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0390_R36_00012, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
