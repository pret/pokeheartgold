#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T29.h"
#include "msgdata/msg/msg_0626_T29.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T29_000
	scrdef scr_seq_T29_001
	scrdef scr_seq_T29_002
	scrdef scr_seq_T29_003
	scrdef scr_seq_T29_004
	scrdef scr_seq_T29_005
	scrdef scr_seq_T29_006
	scrdef scr_seq_T29_007
	scrdef scr_seq_T29_008
	scrdef scr_seq_T29_009
	scrdef scr_seq_T29_010
	scrdef scr_seq_T29_011
	scrdef scr_seq_T29_012
	scrdef scr_seq_T29_013
	scrdef scr_seq_T29_014
	scrdef scr_seq_T29_015
	scrdef scr_seq_T29_016
	scrdef scr_seq_T29_017
	scrdef scr_seq_T29_018
	scrdef_end

scr_seq_T29_000:
	goto_if_set FLAG_GOT_RED_SCALE, _007F
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	setflag FLAG_MAPTEMP_011
	setflag FLAG_MAPTEMP_013
	setflag FLAG_MAPTEMP_014
	setflag FLAG_MAPTEMP_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

_007F:
	goto _0115

_0085:
	compare VAR_UNK_4037, 61993
	goto_if_eq _00BC
	setflag FLAG_UNK_1FC
	setflag FLAG_UNK_1FE
	clearflag FLAG_HIDE_LAKE_OF_RAGE_FISHERMEN
	setflag FLAG_MAPTEMP_011
	setflag FLAG_MAPTEMP_013
	setflag FLAG_MAPTEMP_014
	setflag FLAG_MAPTEMP_015
	setflag FLAG_UNK_289
	setflag FLAG_UNK_28B
	setflag FLAG_UNK_28C
	end

_00BC:
	clearflag FLAG_UNK_1FC
	clearflag FLAG_UNK_1FE
	setflag FLAG_HIDE_LAKE_OF_RAGE_FISHERMEN
	clearflag FLAG_UNK_289
	clearflag FLAG_UNK_28B
	clearflag FLAG_UNK_28C
	goto_if_set FLAG_UNK_146, _00E5
	goto _00E9

_00E5:
	setflag FLAG_UNK_289
_00E9:
	goto_if_set FLAG_UNK_147, _00FA
	goto _00FE

_00FA:
	setflag FLAG_UNK_28B
_00FE:
	goto_if_set FLAG_UNK_148, _010F
	goto _0113

_010F:
	setflag FLAG_UNK_28C
_0113:
	end

_0115:
	check_registered_phone_number PHONE_CONTACT_PRYCE, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 1
	goto_if_eq _01A7
	goto_if_set FLAG_GAME_CLEAR, _0139
	goto _01A7

_0139:
	scrcmd_522 VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 6
	goto_if_ne _0154
	clearflag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	goto _019F

_0154:
	compare VAR_TEMP_x4000, 7
	goto_if_ne _016B
	clearflag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	goto _019F

_016B:
	compare VAR_TEMP_x4000, 8
	goto_if_ne _0182
	clearflag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	goto _019F

_0182:
	compare VAR_TEMP_x4000, 9
	goto_if_ne _0199
	clearflag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	goto _019F

_0199:
	goto _01A7

_019F:
	goto _0085
	.byte 0x02, 0x00
_01A7:
	setflag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	goto _0085
	.byte 0x02, 0x00
scr_seq_T29_002:
	goto_if_set FLAG_ENGAGING_STATIC_POKEMON, _01C0
	end

_01C0:
	setflag FLAG_HIDE_LAKE_OF_RAGE_RED_GYARADOS
	hide_person obj_T29_rgyaradosu
	clearflag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	show_person obj_T29_wataru
	show_person obj_T29_tsure_poke_static_dragonite
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	end

scr_seq_T29_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	compare VAR_TEMP_x4004, 1
	goto_if_ge _026A
	npc_msg msg_0626_T29_00013
_01F2:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0216
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ge _0259
	end

_0216:
	buffer_players_name 0
	npc_msg msg_0626_T29_00014
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number PHONE_CONTACT_PRYCE
	npc_msg msg_0626_T29_00015
	wait_button_or_walk_away
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	setflag FLAG_HIDE_LAKE_OF_RAGE_PRYCE
	hide_person obj_T29_gsleader7
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	releaseall
	end

_0259:
	setvar VAR_TEMP_x4004, 1
	npc_msg msg_0626_T29_00016
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_026A:
	npc_msg msg_0626_T29_00017
	goto _01F2
	.byte 0x02, 0x00
scr_seq_T29_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_lead_alive VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_DOWNCAST
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _039B
	goto_if_set FLAG_DAILY_GOT_SHOCK_RIBBON, _03AF
	compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	goto_if_eq _0349
	goto_if_set FLAG_UNK_0D5, _032B
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _02DC
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 11
	goto _0323

_02DC:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 8
	goto_if_no_item_space ITEM_BLACK_BELT, 1, _033F
	callstd std_give_item_verbose
	setflag FLAG_UNK_0D5
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 9
_0323:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_032B:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 10
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_033F:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0349:
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 3
	goto_if_eq _036C
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 11
	goto _0323

_036C:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 36
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_RESULT, 38
	give_ribbon VAR_SPECIAL_x8002, RIBBON_DOWNCAST
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_DAILY_GOT_SHOCK_RIBBON
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_039B:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 37
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03AF:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 39
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T29_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_GYARADOS, 0
	npc_msg msg_0626_T29_00000
	wait_cry
	closemsg
	setflag FLAG_ENGAGING_STATIC_POKEMON
	wild_battle SPECIES_GYARADOS, 30, 1
	clearflag FLAG_ENGAGING_STATIC_POKEMON
	check_battle_won VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0456
	scrcmd_683 VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 3
	goto_if_eq _0452
	compare VAR_TEMP_x4002, 4
	call_if_eq _0466
	goto_if_set FLAG_GOT_RED_SCALE, _046C
	openmsg
	goto_if_no_item_space ITEM_RED_SCALE, 1, _045C
	callstd std_give_item_verbose
	setflag FLAG_GOT_RED_SCALE
	clearflag FLAG_HIDE_LAKE_OF_RAGE_ACE_TRAINER_LOIS
	closemsg
_0452:
	releaseall
	end

_0456:
	white_out
	releaseall
	end

_045C:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0466:
	setflag FLAG_CAUGHT_RED_GYARADOS
	return

_046C:
	clearflag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	hide_person obj_T29_wataru
	hide_person obj_T29_tsure_poke_static_dragonite
	releaseall
	end

scr_seq_T29_003:
	goto_if_set FLAG_UNK_0C3, _0509
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0626_T29_00002
	faceplayer
	buffer_players_name 0
	gender_msgbox msg_0626_T29_00003, msg_0626_T29_00004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04BB
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04FA
_04BB:
	buffer_players_name 0
	gender_msgbox msg_0626_T29_00005, msg_0626_T29_00006
	wait_button_or_walk_away
	closemsg
	apply_movement obj_T29_tsure_poke_static_dragonite, _0538
	wait_movement
	apply_movement obj_T29_wataru, _0544
	wait_movement
	scrcmd_775 8, 10
	setflag FLAG_HIDE_LAKE_OF_RAGE_LANCE
	hide_person obj_T29_wataru
	hide_person obj_T29_tsure_poke_static_dragonite
	clearflag FLAG_HIDE_MAHOGANY_SHOP_LANCE
	setvar VAR_UNK_40A8, 1
	releaseall
	end

_04FA:
	setflag FLAG_UNK_0C3
	npc_msg msg_0626_T29_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0509:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0626_T29_00008
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _04BB
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _04FA
	end


_0538:
	step 34, 1
	step 50, 2
	step_end

_0544:
	step 33, 1
	step_end
scr_seq_T29_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_RED_GYARADOS_MEET, _056A
	npc_msg msg_0626_T29_00009
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_056A:
	npc_msg msg_0626_T29_00010
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x02, 0x00
scr_seq_T29_006:
	goto_if_set FLAG_UNK_139, _0597
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0626_T29_00031, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

_0597:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	script_overlay_cmd 0, 0
	buffer_record_size 0, 1, SPECIES_MAGIKARP
	script_overlay_cmd 0, 1
	buffer_players_name 2
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0626_T29_00032, VAR_SPECIAL_RESULT
	callstd std_signpost
	dummy_486
	dummy_486
	releaseall
	end

scr_seq_T29_014:
	setvar VAR_TEMP_x4001, 1
	setvar VAR_SPECIAL_x8008, 27
	setvar VAR_SPECIAL_x8009, 1
	goto _061B
	.byte 0x02, 0x00
scr_seq_T29_015:
	setvar VAR_TEMP_x4001, 2
	setvar VAR_SPECIAL_x8008, 29
	setvar VAR_SPECIAL_x8009, 1
	goto _061B
	.byte 0x02
	.byte 0x00
scr_seq_T29_016:
	setvar VAR_TEMP_x4001, 3
	setvar VAR_SPECIAL_x8008, 23
	setvar VAR_SPECIAL_x8009, 1
	goto _061B
	.byte 0x02, 0x00
_061B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0657
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _06CA
	end

_0657:
	callstd std_hidden_item_fanfare
	hide_person VAR_SPECIAL_LAST_TALKED
	compare VAR_TEMP_x4001, 1
	goto_if_ne _0676
	setflag FLAG_UNK_146
	goto _0691

_0676:
	compare VAR_TEMP_x4001, 2
	goto_if_ne _068D
	setflag FLAG_UNK_147
	goto _0691

_068D:
	setflag FLAG_UNK_148
_0691:
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg msg_0626_T29_00033
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_RESULT
	buffer_pocket_name 2, VAR_SPECIAL_RESULT
	npc_msg msg_0626_T29_00034
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 1
_06C4:
	closemsg
	releaseall
	end

_06CA:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0626_T29_00035
	wait_button_or_walk_away
	setvar VAR_SPECIAL_RESULT, 0
	goto _06C4
	.byte 0x02, 0x00
scr_seq_T29_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_DRAGONITE, 0
	npc_msg msg_0626_T29_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T29_007:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0626_T29_00030, VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d, 0x00, 0x09, 0x32, 0x00, 0x35, 0x00, 0x61
	.byte 0x00, 0x02, 0x00
scr_seq_T29_008:
	simple_npc_msg msg_0626_T29_00012
	end

scr_seq_T29_009:
	simple_npc_msg msg_0626_T29_00011
	end
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68
	.byte 0x00, 0x2d, 0x00, 0x00, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_T29_010:
	simple_npc_msg msg_0626_T29_00018
	end

scr_seq_T29_011:
	simple_npc_msg msg_0626_T29_00021
	end

scr_seq_T29_012:
	simple_npc_msg msg_0626_T29_00024
	end

scr_seq_T29_013:
	simple_npc_msg msg_0626_T29_00027
	end
	.balign 4, 0
