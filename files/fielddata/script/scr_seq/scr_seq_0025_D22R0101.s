#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0101.h"
#include "msgdata/msg/msg_0062_D22R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D22R0101_000
	scrdef scr_seq_D22R0101_001
	scrdef scr_seq_D22R0101_002
	scrdef scr_seq_D22R0101_003
	scrdef scr_seq_D22R0101_004
	scrdef scr_seq_D22R0101_005
	scrdef scr_seq_D22R0101_006
	scrdef scr_seq_D22R0101_007
	scrdef scr_seq_D22R0101_008
	scrdef scr_seq_D22R0101_009
	scrdef scr_seq_D22R0101_010
	scrdef scr_seq_D22R0101_011
	scrdef scr_seq_D22R0101_012
	scrdef scr_seq_D22R0101_013
	scrdef scr_seq_D22R0101_014
	scrdef scr_seq_D22R0101_015
	scrdef scr_seq_D22R0101_016
	scrdef scr_seq_D22R0101_017
	scrdef scr_seq_D22R0101_018
	scrdef scr_seq_D22R0101_019
	scrdef scr_seq_D22R0101_020
	scrdef scr_seq_D22R0101_021
	scrdef scr_seq_D22R0101_022
	scrdef scr_seq_D22R0101_023
	scrdef scr_seq_D22R0101_024
	scrdef scr_seq_D22R0101_025
	scrdef scr_seq_D22R0101_026
	scrdef_end

scr_seq_D22R0101_011:
	compare VAR_UNK_40F7, 1
	call_if_eq _007D
	end

_007D:
	move_person_facing obj_D22R0101_counterm, 51, 0, 48, DIR_SOUTH
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 10
	setvar VAR_TEMP_x4002, 48
	script_overlay_cmd 1, 0
_009F:
	is_npc_bug_contestant_registered VAR_TEMP_x4000, VAR_TEMP_x4004
	compare VAR_TEMP_x4004, 1
	goto_if_ne _00C4
	move_person_facing VAR_TEMP_x4001, VAR_TEMP_x4002, 0, 50, DIR_NORTH
	addvar VAR_TEMP_x4002, 2
_00C4:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	compare VAR_TEMP_x4000, 10
	goto_if_lt _009F
	script_overlay_cmd 1, 1
	return

scr_seq_D22R0101_025:
	goto_if_unset FLAG_UNK_189, _00F4
	clearflag FLAG_UNK_189
	end

_00F4:
	compare VAR_UNK_40F7, 1
	goto_if_eq _0162
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0154
	compare VAR_TEMP_x4000, 3
	goto_if_eq _0154
	compare VAR_TEMP_x4000, 2
	goto_if_eq _0162
	compare VAR_TEMP_x4000, 4
	goto_if_eq _0162
	compare VAR_TEMP_x4000, 5
	goto_if_eq _0162
	setflag FLAG_HIDE_CAMERON
	clearflag FLAG_UNK_27F
	goto _016E

_0154:
	clearflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	goto _016E

_0162:
	setflag FLAG_HIDE_CAMERON
	setflag FLAG_UNK_27F
	clearflag FLAG_UNK_996
_016E:
	goto_if_set FLAG_GAME_CLEAR, _017F
	setflag FLAG_UNK_288
	end

_017F:
	get_phone_book_rematch PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 0
	goto_if_ne _01C9
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _01C3
	compare VAR_TEMP_x4000, 3
	goto_if_eq _01C3
	compare VAR_TEMP_x4000, 5
	goto_if_eq _01C3
	setflag FLAG_UNK_288
	end

_01C3:
	clearflag FLAG_UNK_288
	end

_01C9:
	setflag FLAG_UNK_288
	end

scr_seq_D22R0101_012:
	simple_npc_msg msg_0062_D22R0101_00045
	end

scr_seq_D22R0101_013:
	simple_npc_msg msg_0062_D22R0101_00048
	end

scr_seq_D22R0101_014:
	simple_npc_msg msg_0062_D22R0101_00051
	end

scr_seq_D22R0101_015:
	simple_npc_msg msg_0062_D22R0101_00054
	end

scr_seq_D22R0101_016:
	simple_npc_msg msg_0062_D22R0101_00057
	end

scr_seq_D22R0101_017:
	simple_npc_msg msg_0062_D22R0101_00060
	end

scr_seq_D22R0101_018:
	simple_npc_msg msg_0062_D22R0101_00063
	end

scr_seq_D22R0101_019:
	simple_npc_msg msg_0062_D22R0101_00066
	end

scr_seq_D22R0101_020:
	simple_npc_msg msg_0062_D22R0101_00069
	end

scr_seq_D22R0101_021:
	simple_npc_msg msg_0062_D22R0101_00072
	end

scr_seq_D22R0101_022:
	simple_npc_msg msg_0062_D22R0101_00042
	end

scr_seq_D22R0101_026:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 5
	goto_if_eq _02C7
	buffer_players_name 0
	npc_msg msg_0062_D22R0101_00084
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_02C7:
	buffer_players_name 0
	npc_msg msg_0062_D22R0101_00085
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _032B
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0336
	npc_msg msg_0062_D22R0101_00086
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 7
	faceplayer
	lockall
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0062_D22R0101_00087
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_032B:
	npc_msg msg_0062_D22R0101_00088
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0336:
	npc_msg msg_0062_D22R0101_00089
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_D22R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_10E, _0380
	npc_msg msg_0062_D22R0101_00002
	goto_if_no_item_space ITEM_QUICK_CLAW, 1, _038B
	callstd std_give_item_verbose
	setflag FLAG_UNK_10E
_0380:
	npc_msg msg_0062_D22R0101_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_038B:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_D22R0101_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0650
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0664
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _040E
	apply_movement obj_player, _04C0
	apply_movement obj_D22R0101_gsmiddleman1_3, _050C
	goto _045C

_040E:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0429
	apply_movement obj_player, _04D8
	goto _045C

_0429:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _044C
	apply_movement obj_player, _04F8
	apply_movement obj_D22R0101_gsmiddleman1_3, _050C
	goto _045C

_044C:
	apply_movement obj_player, _04E4
	apply_movement obj_D22R0101_gsmiddleman1_3, _050C
_045C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0483
	apply_movement obj_partner_poke, _0518
	wait_movement
_0483:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 16
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
	.byte 0x00, 0x00, 0x00

_04C0:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_04D8:
	step 12, 3
	step 33, 1
	step_end

_04E4:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_04F8:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_050C:
	step 63, 1
	step 32, 1
	step_end

_0518:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_D22R0101_024:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0650
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0664
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _05A1
	apply_movement obj_player, _04C0
	apply_movement obj_D22R0101_gsmiddleman1_4, _050C
	goto _05EF

_05A1:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _05BC
	apply_movement obj_player, _04D8
	goto _05EF

_05BC:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _05DF
	apply_movement obj_player, _0678
	apply_movement obj_D22R0101_gsmiddleman1_4, _050C
	goto _05EF

_05DF:
	apply_movement obj_player, _04E4
	apply_movement obj_D22R0101_gsmiddleman1_4, _050C
_05EF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0616
	apply_movement obj_partner_poke, _0518
	wait_movement
_0616:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 17
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

_0650:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0664:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end


_0678:
	step 13, 1
	step 15, 2
	step 12, 2
	step 14, 1
	step 12, 2
	step 33, 1
	step_end
scr_seq_D22R0101_001:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0062_D22R0101_00022, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D22R0101_002:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0062_D22R0101_00023, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D22R0101_003:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0062_D22R0101_00024, VAR_SPECIAL_RESULT
	callstd std_signpost
	end

scr_seq_D22R0101_004:
	simple_npc_msg msg_0062_D22R0101_00000
	end

scr_seq_D22R0101_005:
	simple_npc_msg msg_0062_D22R0101_00001
	end

scr_seq_D22R0101_006:
	simple_npc_msg msg_0062_D22R0101_00005
	end

scr_seq_D22R0101_007:
	simple_npc_msg msg_0062_D22R0101_00006
	end

scr_seq_D22R0101_008:
	simple_npc_msg msg_0062_D22R0101_00009
	end

scr_seq_D22R0101_009:
	simple_npc_msg msg_0062_D22R0101_00007
	end

scr_seq_D22R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0062_D22R0101_00008
	play_cry SPECIES_PERSIAN, 0
	wait_cry
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x02, 0x00, 0x00, 0x00
	.balign 4, 0
