#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R14.h"
#include "msgdata/msg/msg_0351_R14.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_R14_000
	scrdef scr_seq_R14_001
	scrdef scr_seq_R14_002
	scrdef scr_seq_R14_003
	scrdef scr_seq_R14_004
	scrdef scr_seq_R14_005
	scrdef_end

scr_seq_R14_001:
	goto_if_unset FLAG_UNK_189, _002B
	clearflag FLAG_UNK_189
	end

_002B:
	get_weekday VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 4
	goto_if_eq _004F
	compare VAR_TEMP_x4000, 0
	goto_if_eq _004F
	setflag FLAG_HIDE_CAMERON
	end

_004F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_R14_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _017D
	photo_album_is_full VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0191
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _00CE
	apply_movement obj_player, _01A8
	apply_movement obj_R14_gsmiddleman1_3, _01F4
	goto _011C

_00CE:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _00E9
	apply_movement obj_player, _01C0
	goto _011C

_00E9:
	compare VAR_SPECIAL_RESULT, 3
	goto_if_ne _010C
	apply_movement obj_player, _01E0
	apply_movement obj_R14_gsmiddleman1_3, _01F4
	goto _011C

_010C:
	apply_movement obj_player, _01CC
	apply_movement obj_R14_gsmiddleman1_3, _01F4
_011C:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0143
	apply_movement obj_partner_poke, _0200
	wait_movement
_0143:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, RGB_BLACK
	wait_fade
	cameron_photo 60
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

_017D:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 5
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0191:
	get_std_msg_naix 2, VAR_SPECIAL_RESULT
	msgbox_extern VAR_SPECIAL_RESULT, 3
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_01A8:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01C0:
	step 12, 3
	step 33, 1
	step_end

_01CC:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_01E0:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_01F4:
	step 63, 1
	step 32, 1
	step_end

_0200:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_R14_002:
	scrcmd_609
	lockall
	clearflag FLAG_HIDE_ROUTE_14_EUSINE
	show_person obj_R14_minaki
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4000, 1358
	goto_if_ne _024F
	apply_movement obj_player, _0450
	wait_movement
	goto _027C
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_024F:
	goto _0255

_0255:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _0272
	apply_movement obj_player, _0450
	wait_movement
	goto _027C

_0272:
	apply_movement obj_player, _0450
	wait_movement
_027C:
	play_cry SPECIES_SUICUNE, 0
	release obj_R14_tsure_poke_static_suicune
	scrcmd_523 obj_R14_tsure_poke_static_suicune, 2, 90, 2, 0
	lock obj_R14_tsure_poke_static_suicune
	wait_cry
	compare VAR_TEMP_x4000, 1358
	goto_if_ne _02B1
	goto _02D0
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00
	.byte 0x00
_02B1:
	compare VAR_TEMP_x4000, 1359
	goto_if_ne _02CA
	goto _0382
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_02CA:
	goto _03AD

_02D0:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _02EB
	apply_movement obj_player, _04AC
	goto _037A

_02EB:
	compare VAR_TEMP_x4001, 410
	goto_if_ne _0306
	apply_movement obj_player, _04C0
	goto _037A

_0306:
	compare VAR_TEMP_x4001, 411
	goto_if_ne _0321
	apply_movement obj_player, _04D0
	goto _037A

_0321:
	compare VAR_TEMP_x4001, 412
	goto_if_ne _033C
	apply_movement obj_player, _04E0
	goto _037A

_033C:
	compare VAR_TEMP_x4001, 413
	goto_if_ne _0357
	apply_movement obj_player, _04E8
	goto _037A

_0357:
	compare VAR_TEMP_x4001, 414
	goto_if_ne _0372
	apply_movement obj_player, _04F8
	goto _037A

_0372:
	apply_movement obj_player, _0508
_037A:
	wait_movement
	goto _03D2

_0382:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _039D
	apply_movement obj_player, _051C
	goto _03A5

_039D:
	apply_movement obj_player, _0530
_03A5:
	wait_movement
	goto _03D2

_03AD:
	compare VAR_TEMP_x4001, 409
	goto_if_ne _03C8
	apply_movement obj_player, _0544
	goto _03D0

_03C8:
	apply_movement obj_player, _0550
_03D0:
	wait_movement
_03D2:
	apply_movement obj_R14_tsure_poke_static_suicune, _0488
	apply_movement obj_player, _055C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd std_play_eusine_music
	apply_movement obj_R14_minaki, _057C
	apply_movement obj_player, _056C
	wait_movement
	buffer_players_name 0
	npc_msg msg_0351_R14_00006
	wait_button_or_walk_away
	closemsg
	callstd std_fade_end_eusine_music
	hide_person obj_R14_tsure_poke_static_suicune
	setflag FLAG_HIDE_ROUTE_14_SUICUNE
	setflag FLAG_HIDE_ROUTE_14_EUSINE
	clearflag FLAG_HIDE_ROUTE_14_EUSINE_2
	setvar VAR_UNK_4086, 0
	setflag FLAG_UNK_14D
	check_badge BADGE_CASCADE, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _0449
	clearflag FLAG_HIDE_ROUTE_25_SUICUNE
	setvar VAR_SCENE_ROUTE_25, 1
_0449:
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0450:
	step 75, 1
	step_end
	.byte 0x3e, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x3e, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x3e, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_0488:
	step 20, 2
	step 52, 1
	step 56, 1
	step 20, 2
	step 52, 1
	step 56, 2
	step 20, 2
	step 52, 1
	step_end

_04AC:
	step 13, 1
	step 15, 3
	step 13, 2
	step 3, 1
	step_end

_04C0:
	step 15, 3
	step 13, 2
	step 3, 1
	step_end

_04D0:
	step 15, 3
	step 13, 1
	step 3, 1
	step_end

_04E0:
	step 15, 3
	step_end

_04E8:
	step 15, 3
	step 12, 1
	step 3, 1
	step_end

_04F8:
	step 15, 3
	step 12, 2
	step 3, 1
	step_end

_0508:
	step 12, 1
	step 15, 3
	step 12, 2
	step 3, 1
	step_end

_051C:
	step 13, 1
	step 15, 2
	step 13, 2
	step 3, 1
	step_end

_0530:
	step 12, 1
	step 15, 2
	step 12, 2
	step 3, 1
	step_end

_0544:
	step 13, 3
	step 3, 1
	step_end

_0550:
	step 12, 3
	step 3, 1
	step_end

_055C:
	step 63, 1
	step 0, 1
	step 12, 1
	step_end

_056C:
	step 65, 5
	step 2, 1
	step_end
	.byte 0xfe, 0x00, 0x00, 0x00

_057C:
	step 16, 11
	step 12, 2
	step 4, 1
	step 63, 3
	step 9, 1
	step 3, 1
	step_end
scr_seq_R14_003:
	buffer_players_name 0
	simple_npc_msg msg_0351_R14_00007
	end

scr_seq_R14_004:
	buffer_players_name 0
	simple_npc_msg msg_0351_R14_00007
	end

scr_seq_R14_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_GOT_LUCKY_PUNCH, _0658
	npc_msg msg_0351_R14_00000
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0602
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 113
	goto_if_eq _060D
_0602:
	npc_msg msg_0351_R14_00001
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_060D:
	apply_movement obj_R14_gswoman1, _0698
	wait_movement
	npc_msg msg_0351_R14_00002
	goto_if_no_item_space ITEM_LUCKY_PUNCH, 1, _064E
	callstd std_give_item_verbose
	setflag FLAG_GOT_LUCKY_PUNCH
	npc_msg msg_0351_R14_00003
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_064E:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0658:
	player_on_bike_check VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0680
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 113
	goto_if_eq _068B
_0680:
	npc_msg msg_0351_R14_00005
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_068B:
	npc_msg msg_0351_R14_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0698:
	step 75, 1
	step 62, 1
	step_end
	.balign 4, 0
