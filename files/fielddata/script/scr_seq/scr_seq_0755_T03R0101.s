#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03R0101.h"
#include "msgdata/msg/msg_0464_T03R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T03R0101_000
	scrdef scr_seq_T03R0101_001
	scrdef scr_seq_T03R0101_002
	scrdef scr_seq_T03R0101_003
	scrdef scr_seq_T03R0101_004
	scrdef scr_seq_T03R0101_005
	scrdef scr_seq_T03R0101_006
	scrdef scr_seq_T03R0101_007
	scrdef scr_seq_T03R0101_008
	scrdef scr_seq_T03R0101_009
	scrdef scr_seq_T03R0101_010
	scrdef scr_seq_T03R0101_011
	scrdef scr_seq_T03R0101_012
	scrdef scr_seq_T03R0101_013
	scrdef scr_seq_T03R0101_014
	scrdef scr_seq_T03R0101_015
	scrdef scr_seq_T03R0101_016
	scrdef scr_seq_T03R0101_017
	scrdef scr_seq_T03R0101_018
	scrdef scr_seq_T03R0101_019
	scrdef_end

scr_seq_T03R0101_014:
	compare VAR_UNK_4083, 5
	goto_if_ge _00E8
	compare VAR_UNK_4083, 4
	goto_if_eq _00E8
	compare VAR_UNK_4083, 3
	goto_if_eq _00D8
	compare VAR_UNK_4083, 2
	goto_if_eq _00D8
	compare VAR_UNK_4083, 1
	goto_if_eq _00CE
	hasitem ITEM_ENIGMA_STONE, 1, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _00F4
	scrcmd_546 0, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 0
	goto_if_eq _00F4
	nop_var_490 VAR_TEMP_x4007
	setvar VAR_UNK_4083, 1
	clearflag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	setflag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	end

_00CE:
	clearflag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	setflag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	end

_00D8:
	setflag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	setflag FLAG_HIDE_STEVEN_IN_HOUSE_AFTER_LATIS
	goto _0104
	.byte 0x02, 0x00
_00E8:
	setflag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	goto _0104
	.byte 0x02, 0x00
_00F4:
	nop_var_490 VAR_TEMP_x4006
	setflag FLAG_HIDE_STEVEN_IN_HOUSE_BEFORE_LATIS
	goto _0104
	.byte 0x02, 0x00
_0104:
	goto_if_unset FLAG_UNK_189, _0115
	clearflag FLAG_UNK_189
	end

_0115:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0139
	compare VAR_TEMP_x4000, 0
	goto_if_eq _0139
	setflag FLAG_HIDE_CAMERON
	end

_0139:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T03R0101_017:
	end
	.byte 0xea, 0x01, 0x06, 0x40, 0x02, 0x00
scr_seq_T03R0101_000:
	simple_npc_msg msg_0464_T03R0101_00000
	end

scr_seq_T03R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	script_overlay_cmd 2, 0
	goto_if_set FLAG_MAPTEMP_001, _0530
	compare VAR_UNK_407F, 0
	goto_if_ne _0550
	npc_msg msg_0464_T03R0101_00001
	countfossils VAR_SPECIAL_x8000
	compare VAR_SPECIAL_x8000, 0
	goto_if_ne _019B
	npc_msg msg_0464_T03R0101_00006
	goto _05FC

_019B:
	compare VAR_SPECIAL_x8000, 1
	goto_if_eq _04F7
	setvar VAR_SPECIAL_x8001, 0
	hasitem ITEM_OLD_AMBER, 1, VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	hasitem ITEM_HELIX_FOSSIL, 1, VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	hasitem ITEM_DOME_FOSSIL, 1, VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	hasitem ITEM_ROOT_FOSSIL, 1, VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	hasitem ITEM_CLAW_FOSSIL, 1, VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	hasitem ITEM_ARMOR_FOSSIL, 1, VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	hasitem ITEM_SKULL_FOSSIL, 1, VAR_SPECIAL_RESULT
	addvar VAR_SPECIAL_x8001, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_x8001, 1
	goto_if_eq _04F7
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 0
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar VAR_TEMP_x4002, 0
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
_0263:
	compare VAR_SPECIAL_x8005, 0
	call_if_eq _0417
	compare VAR_SPECIAL_x8005, 1
	call_if_eq _0427
	compare VAR_SPECIAL_x8005, 2
	call_if_eq _0437
	compare VAR_SPECIAL_x8005, 3
	call_if_eq _0447
	compare VAR_SPECIAL_x8005, 4
	call_if_eq _0457
	compare VAR_SPECIAL_x8005, 5
	call_if_eq _0467
	compare VAR_SPECIAL_x8005, 6
	call_if_eq _0477
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0340
	compare VAR_SPECIAL_x8004, 0
	call_if_eq _0487
	compare VAR_SPECIAL_x8004, 1
	call_if_eq _048F
	compare VAR_SPECIAL_x8004, 2
	call_if_eq _0497
	compare VAR_SPECIAL_x8004, 3
	call_if_eq _049F
	compare VAR_SPECIAL_x8004, 4
	call_if_eq _04A7
	compare VAR_SPECIAL_x8004, 5
	call_if_eq _04AF
	compare VAR_SPECIAL_x8004, 6
	call_if_eq _04B7
	copyvar VAR_SPECIAL_x8006, VAR_SPECIAL_x8005
	addvar VAR_SPECIAL_x8006, 159
	menu_item_add VAR_SPECIAL_x8006, 255, VAR_SPECIAL_x8004
	goto _034C

_0340:
	addvar VAR_SPECIAL_x8005, 1
	goto _0263

_034C:
	addvar VAR_SPECIAL_x8004, 1
	addvar VAR_SPECIAL_x8005, 1
	compare VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	goto_if_ne _0263
	menu_item_add 45, 255, VAR_SPECIAL_x8004
	menu_exec
	touchscreen_menu_show
	compare VAR_SPECIAL_x8000, 255
	goto_if_eq _053F
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _04BF
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _04C7
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _04CF
	compare VAR_SPECIAL_x8000, 3
	call_if_eq _04D7
	compare VAR_SPECIAL_x8000, 4
	call_if_eq _04DF
	compare VAR_SPECIAL_x8000, 5
	call_if_eq _04E7
	compare VAR_SPECIAL_x8000, 6
	call_if_eq _04EF
	getfossilpokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	compare VAR_UNK_407F, 0
	goto_if_eq _053F
	buffer_item_name 0, VAR_SPECIAL_x8002
	npc_msg msg_0464_T03R0101_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _053F
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_RESULT
	goto _0530

_0417:
	setvar VAR_TEMP_x4000, 103
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	return

_0427:
	setvar VAR_TEMP_x4000, 101
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	return

_0437:
	setvar VAR_TEMP_x4000, 102
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	return

_0447:
	setvar VAR_TEMP_x4000, 99
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	return

_0457:
	setvar VAR_TEMP_x4000, 100
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	return

_0467:
	setvar VAR_TEMP_x4000, 104
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	return

_0477:
	setvar VAR_TEMP_x4000, 105
	hasitem VAR_TEMP_x4000, 1, VAR_SPECIAL_RESULT
	return

_0487:
	copyvar VAR_TEMP_x4001, VAR_TEMP_x4000
	return

_048F:
	copyvar VAR_TEMP_x4002, VAR_TEMP_x4000
	return

_0497:
	copyvar VAR_TEMP_x4003, VAR_TEMP_x4000
	return

_049F:
	copyvar VAR_TEMP_x4004, VAR_TEMP_x4000
	return

_04A7:
	copyvar VAR_TEMP_x4005, VAR_TEMP_x4000
	return

_04AF:
	copyvar VAR_TEMP_x4006, VAR_TEMP_x4000
	return

_04B7:
	copyvar VAR_TEMP_x4007, VAR_TEMP_x4000
	return

_04BF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4001
	return

_04C7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4002
	return

_04CF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4003
	return

_04D7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4004
	return

_04DF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4005
	return

_04E7:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4006
	return

_04EF:
	copyvar VAR_SPECIAL_x8002, VAR_TEMP_x4007
	return

_04F7:
	getfossilminimumamount VAR_SPECIAL_x8002, VAR_SPECIAL_x8004, 1
	buffer_item_name 0, VAR_SPECIAL_x8002
	npc_msg msg_0464_T03R0101_00007
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _053F
	getfossilpokemon VAR_UNK_407F, VAR_SPECIAL_x8002
	takeitem VAR_SPECIAL_x8002, 1, VAR_SPECIAL_RESULT
	goto _0530

_0530:
	setflag FLAG_MAPTEMP_001
	npc_msg msg_0464_T03R0101_00003
	goto _05FC
	.byte 0x02, 0x00
_053F:
	setvar VAR_UNK_407F, 0
	npc_msg msg_0464_T03R0101_00002
	goto _05FC
	.byte 0x02, 0x00
_0550:
	buffer_species_name 0, VAR_UNK_407F, 0, 0
	npc_msg msg_0464_T03R0101_00004
	get_party_count VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 6
	goto_if_ne _0575
	npc_msg msg_0464_T03R0101_00005
	goto _05FC

_0575:
	buffer_species_name 1, VAR_UNK_407F, 0, 0
	buffer_players_name 0
	play_fanfare SEQ_ME_POKEGET
	npc_msg msg_0464_T03R0101_00008
	wait_fanfare
	give_mon VAR_UNK_407F, 20, 0, 0, 0, VAR_SPECIAL_RESULT
	scrcmd_420 116
	setvar VAR_UNK_407F, 0
	npc_msg msg_0464_T03R0101_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	closemsg
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0600
	get_party_count VAR_TEMP_x4000
	subvar VAR_TEMP_x4000, 1
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	nickname_input VAR_TEMP_x4000, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _05E8
	scrcmd_420 50
_05E8:
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	script_overlay_cmd 2, 1
	releaseall
	end

_05FC:
	wait_button_or_walk_away
	closemsg
_0600:
	script_overlay_cmd 2, 1
	releaseall
	end

scr_seq_T03R0101_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _070D
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0721
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0681
	apply_movement obj_player, _0738
	apply_movement obj_T03R0101_gsmiddleman1, _0770
	goto _06AC

_0681:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _069C
	apply_movement obj_player, _0750
	goto _06AC

_069C:
	apply_movement obj_player, _075C
	apply_movement obj_T03R0101_gsmiddleman1, _0770
_06AC:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _06D3
	apply_movement obj_partner_poke, _077C
	wait_movement
_06D3:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 65
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

_070D:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0721:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0738:
	step 14, 1
	step 12, 2
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0750:
	step 12, 3
	step 33, 1
	step_end

_075C:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_0770:
	step 63, 1
	step 32, 1
	step_end

_077C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T03R0101_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00013
	wait_button_or_walk_away
	closemsg
	setvar VAR_UNK_4130, 5
	releaseall
	end

scr_seq_T03R0101_015:
	end

scr_seq_T03R0101_018:
	compare VAR_UNK_4083, 0
	goto_if_eq _07BF
	compare VAR_UNK_4083, 1
	goto_if_eq _07C1
_07BF:
	end

_07C1:
	nop_var_490 VAR_UNK_4083
	scrcmd_344 0, 0
	move_person_facing obj_T03R0101_daigo, 26, 0, 7, DIR_SOUTH
	goto _07BF
	.byte 0x02, 0x00
scr_seq_T03R0101_016:
	scrcmd_609
	lockall
	hasitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0963
	scrcmd_546 0, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0963
	apply_movement obj_T03R0101_daigo, _0968
	wait_movement
	npc_msg msg_0464_T03R0101_00014
	closemsg
	apply_movement obj_T03R0101_daigo, _0970
	wait_movement
	npc_msg msg_0464_T03R0101_00015
	npc_msg msg_0464_T03R0101_00016
	closemsg
	apply_movement obj_T03R0101_daigo, _097C
	apply_movement obj_T03R0101_gsassistantm, _09C8
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	compare VAR_TEMP_x4001, 6
	goto_if_ne _0868
	apply_movement obj_player, _0998
	goto _0870

_0868:
	apply_movement obj_player, _098C
_0870:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_player, _09A4
	wait_movement
	buffer_players_name 0
	npc_msg msg_0464_T03R0101_00017
	closemsg
	apply_movement obj_T03R0101_gsassistantm, _09D0
	wait_movement
	npc_msg msg_0464_T03R0101_00018
	closemsg
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	wait 30, VAR_SPECIAL_RESULT
	release obj_T03R0101_daigo
	move_person_facing obj_T03R0101_daigo, 25, 0, 7, DIR_SOUTH
	wait 10, VAR_SPECIAL_RESULT
	lock obj_T03R0101_daigo
	compare VAR_TEMP_x4001, 6
	goto_if_eq _08F1
	scrcmd_729 VAR_TEMP_x4009
	compare VAR_TEMP_x4009, 0
	goto_if_eq _08F1
	apply_movement obj_partner_poke, _09F0
	wait_movement
_08F1:
	fade_screen 6, 1, 1, RGB_BLACK
	wait_fade
	wait 10, VAR_SPECIAL_RESULT
	apply_movement obj_T03R0101_gsassistantm, _09D0
	wait_movement
	npc_msg msg_0464_T03R0101_00019
	closemsg
	apply_movement obj_T03R0101_gsassistantm, _09D8
	wait_movement
	takeitem ITEM_ENIGMA_STONE, 1, VAR_SPECIAL_RESULT
	setvar VAR_SPECIAL_x8004, 225
	setvar VAR_SPECIAL_x8005, 1
	callstd std_obtain_item_verbose
	closemsg
	apply_movement obj_T03R0101_daigo, _09B8
	wait_movement
	apply_movement obj_player, _0968
	wait_movement
	npc_msg msg_0464_T03R0101_00021
	closemsg
	apply_movement obj_T03R0101_daigo, _09C0
	wait_movement
	setvar VAR_UNK_4083, 2
	hide_person obj_T03R0101_daigo
_0963:
	releaseall
	end
	.byte 0x00

_0968:
	step 34, 1
	step_end

_0970:
	step 63, 1
	step 75, 1
	step_end

_097C:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_098C:
	step 15, 1
	step 1, 1
	step_end

_0998:
	step 15, 1
	step 13, 1
	step_end

_09A4:
	step 13, 1
	step 63, 1
	step 12, 1
	step 1, 1
	step_end

_09B8:
	step 3, 1
	step_end

_09C0:
	step 14, 8
	step_end

_09C8:
	step 32, 1
	step_end

_09D0:
	step 32, 1
	step_end

_09D8:
	step 12, 1
	step 32, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_09F0:
	step 20, 1
	step 23, 1
	step 1, 1
	step_end
scr_seq_T03R0101_002:
	simple_npc_msg msg_0464_T03R0101_00010
	end

scr_seq_T03R0101_003:
	simple_npc_msg msg_0464_T03R0101_00011
	end

scr_seq_T03R0101_004:
	simple_npc_msg msg_0464_T03R0101_00012
	end

scr_seq_T03R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00022
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03R0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00023
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03R0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00024
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03R0101_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00025
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03R0101_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00026
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00027
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03R0101_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00028
	wait_button_or_walk_away
	closemsg
	releaseall
	end

scr_seq_T03R0101_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0464_T03R0101_00029
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.balign 4, 0
