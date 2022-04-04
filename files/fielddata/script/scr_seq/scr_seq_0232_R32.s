#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R32.h"
#include "msgdata/msg/msg_0380_R32.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R32_000
	scrdef scr_seq_R32_001
	scrdef scr_seq_R32_002
	scrdef scr_seq_R32_003
	scrdef scr_seq_R32_004
	scrdef scr_seq_R32_005
	scrdef scr_seq_R32_006
	scrdef scr_seq_R32_007
	scrdef scr_seq_R32_008
	scrdef scr_seq_R32_009
	scrdef_end

scr_seq_R32_004:
	goto_if_unset FLAG_UNK_189, _003B
	clearflag FLAG_UNK_189
	end

_003B:
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0079
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 2
	goto_if_eq _0083
	compare VAR_TEMP_x4000, 4
	goto_if_eq _0083
	compare VAR_TEMP_x4000, 6
	goto_if_eq _0083
_0079:
	setflag FLAG_HIDE_CAMERON
	goto _008D

_0083:
	clearflag FLAG_HIDE_CAMERON
	goto _008D

_008D:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_ne _00A8
	clearflag FLAG_UNK_208
	goto _00AC

_00A8:
	setflag FLAG_UNK_208
_00AC:
	end

scr_seq_R32_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_party_lead_alive VAR_SPECIAL_x8002
	mon_has_ribbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_RELAX
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01D4
	goto_if_set FLAG_DAILY_GOT_SHOCK_RIBBON, _01E8
	compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	goto_if_eq _0182
	goto_if_set FLAG_UNK_0D9, _0164
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _0115
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 19
	goto _015C

_0115:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 16
	goto_if_no_item_space ITEM_POISON_BARB, 1, _0178
	callstd std_give_item_verbose
	setflag FLAG_UNK_0D9
	addvar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 17
_015C:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0164:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 18
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0178:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0182:
	get_weekday VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 5
	goto_if_eq _01A5
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 19
	goto _015C

_01A5:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 44
	buffer_mon_species_name 0, VAR_SPECIAL_x8002
	msgbox_extern VAR_SPECIAL_RESULT, 46
	give_ribbon VAR_SPECIAL_x8002, RIBBON_RELAX
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_DAILY_GOT_SHOCK_RIBBON
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01D4:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 45
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01E8:
	get_std_msg_naix 0, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 47
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R32_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_06E, _023B
	npc_msg msg_0380_R32_00010
	goto_if_no_item_space ITEM_TM05, 1, _0246
	callstd std_give_item_verbose
	setflag FLAG_UNK_06E
_023B:
	npc_msg msg_0380_R32_00012
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0246:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_R32_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _028C
	goto_if_unset FLAG_UNK_070, _0297
	goto_if_unset FLAG_UNK_074, _02A5
	npc_msg msg_0380_R32_00007
_0284:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_028C:
	npc_msg msg_0380_R32_00003
	goto _0284
	.byte 0x02, 0x00
_0297:
	buffer_players_name 0
	npc_msg msg_0380_R32_00001
	goto _0284
	.byte 0x02, 0x00
_02A5:
	setvar VAR_TEMP_x4002, 0
	call _02B5
	releaseall
	end

_02B5:
	compare VAR_UNK_408D, 0
	goto_if_ne _02C8
	setvar VAR_UNK_408D, 1
_02C8:
	npc_msg msg_0380_R32_00005
	setvar VAR_SPECIAL_x8004, 239
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _030D
	compare VAR_TEMP_x4002, 0
	goto_if_ne _0304
	npc_msg msg_0380_R32_00008
	wait_button_or_walk_away
	goto _0307

_0304:
	npc_msg msg_0380_R32_00009
_0307:
	goto _032C

_030D:
	compare VAR_TEMP_x4002, 0
	goto_if_ne _0324
	callstd std_obtain_item_verbose
	goto _0328

_0324:
	callstd std_give_item_verbose
_0328:
	setflag FLAG_UNK_074
_032C:
	closemsg
	return

scr_seq_R32_002:
	scrcmd_609
	lockall
	apply_movement obj_R32_gsmiddleman1, _046C
	wait_movement
	npc_msg msg_0380_R32_00000
	closemsg
	goto_if_set FLAG_UNK_070, _03F0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 475
	goto_if_ne _0381
	apply_movement obj_R32_gsmiddleman1, _0478
	apply_movement obj_player, _0494
	goto _0391

_0381:
	apply_movement obj_R32_gsmiddleman1, _0484
	apply_movement obj_player, _04A4
_0391:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	check_badge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _03B9
	npc_msg msg_0380_R32_00004
	goto _03BF

_03B9:
	buffer_players_name 0
	npc_msg msg_0380_R32_00002
_03BF:
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 475
	goto_if_ne _03E2
	apply_movement obj_R32_gsmiddleman1, _04B4
	goto _03EA

_03E2:
	apply_movement obj_R32_gsmiddleman1, _04C4
_03EA:
	wait_movement
	releaseall
	end

_03F0:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 475
	goto_if_ne _0429
	apply_movement obj_R32_gsmiddleman1, _04D4
	apply_movement obj_player, _04E4
	setvar VAR_TEMP_x4002, 1
	goto _043F

_0429:
	apply_movement obj_R32_gsmiddleman1, _04DC
	apply_movement obj_player, _04F0
	setvar VAR_TEMP_x4002, 0
_043F:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call _02B5
	compare VAR_TEMP_x4000, 475
	goto_if_ne _0468
	apply_movement obj_R32_gsmiddleman1, _04F8
	wait_movement
_0468:
	releaseall
	end


_046C:
	step 2, 1
	step 75, 1
	step_end

_0478:
	step 14, 2
	step 12, 1
	step_end

_0484:
	step 62, 1
	step 14, 1
	step 12, 1
	step_end

_0494:
	step 63, 1
	step 12, 2
	step 1, 1
	step_end

_04A4:
	step 62, 1
	step 12, 2
	step 1, 1
	step_end

_04B4:
	step 13, 1
	step 15, 2
	step 2, 1
	step_end

_04C4:
	step 13, 1
	step 15, 1
	step 2, 1
	step_end

_04D4:
	step 14, 1
	step_end

_04DC:
	step 62, 1
	step_end

_04E4:
	step 63, 1
	step 3, 1
	step_end

_04F0:
	step 3, 1
	step_end

_04F8:
	step 15, 1
	step 2, 1
	step_end
scr_seq_R32_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0380_R32_00014
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _052D
	npc_msg msg_0380_R32_00015
	goto _0530

_052D:
	npc_msg msg_0380_R32_00016
_0530:
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_R32_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0660
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0674
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _05B1
	apply_movement obj_player, _0688
	apply_movement obj_R32_gsmiddleman1_2, _06D4
	goto _05FF

_05B1:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _05CC
	apply_movement obj_player, _06A0
	goto _05FF

_05CC:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _05EF
	apply_movement obj_player, _06C0
	apply_movement obj_R32_gsmiddleman1_2, _06D4
	goto _05FF

_05EF:
	apply_movement obj_player, _06AC
	apply_movement obj_R32_gsmiddleman1_2, _06D4
_05FF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0626
	apply_movement obj_partner_poke, _06E0
	wait_movement
_0626:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 5
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

_0660:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0674:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_0688:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_06A0:
	step 12, 3
	step 33, 1
	step_end

_06AC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_06C0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_06D4:
	step 63, 1
	step 32, 1
	step_end

_06E0:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R32_006:
	direction_signpost msg_0380_R32_00018, 1, 2, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R32_007:
	direction_signpost msg_0380_R32_00017, 1, 4, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_R32_008:
	direction_signpost msg_0380_R32_00019, 1, 13, VAR_SPECIAL_RESULT
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_RESULT
	callstd std_signpost
	end
	.balign 4, 0
