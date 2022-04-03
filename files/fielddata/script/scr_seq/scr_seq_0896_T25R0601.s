#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R0601.h"
#include "msgdata/msg/msg_0589_T25R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R0601_000
	scrdef scr_seq_T25R0601_001
	scrdef scr_seq_T25R0601_002
	scrdef scr_seq_T25R0601_003
	scrdef_end

scr_seq_T25R0601_002:
	goto_if_set FLAG_UNK_15D, _0058
	goto_if_unset FLAG_UNK_0B5, _0058
	get_party_slot_with_fateful_encounter VAR_TEMP_x4000, 492
	compare VAR_TEMP_x4000, 255
	goto_if_eq _0058
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 492
	goto_if_ne _0058
	setvar VAR_UNK_4082, 1
_0058:
	end

scr_seq_T25R0601_003:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _00FC
	apply_movement obj_T25R0601_gsgirl1, _0110
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement obj_T25R0601_gsgirl1, _0120
	apply_movement obj_player, _0108
	apply_movement obj_partner_poke, _014C
	wait_movement
	npc_msg msg_0589_T25R0601_00005
	closemsg
	apply_movement obj_T25R0601_gsgirl1, _012C
	wait_movement
	npc_msg msg_0589_T25R0601_00006
	setvar VAR_SPECIAL_x8004, 466
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_eq _00EA
	callstd std_give_item_verbose
	npc_msg msg_0589_T25R0601_00007
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_15D
	setvar VAR_UNK_4082, 0
	releaseall
	end

_00EA:
	callstd std_bag_is_full
	closemsg
	releaseall
	setvar VAR_UNK_4082, 0
	releaseall
	end


_00FC:
	step 12, 1
	step 63, 1
	step_end

_0108:
	step 3, 1
	step_end

_0110:
	step 63, 1
	step 2, 1
	step 75, 1
	step_end

_0120:
	step 13, 1
	step 14, 1
	step_end

_012C:
	step 38, 4
	step_end

_0134:
	step 37, 4
	step_end

_013C:
	step 36, 4
	step_end

_0144:
	step 39, 4
	step_end

_014C:
	step 3, 1
	step_end
scr_seq_T25R0601_000:
	goto_if_set FLAG_UNK_0B5, _01E5
	check_badge BADGE_PLAIN, VAR_TEMP_x4000
	compare VAR_TEMP_x4000, 1
	goto_if_eq _0185
	simple_npc_msg msg_0589_T25R0601_00000
	end

_0185:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _01D0
	npc_msg msg_0589_T25R0601_00001
	goto_if_no_item_space ITEM_SQUIRTBOTTLE, 1, _01DB
	callstd std_give_item_verbose
	closemsg
	releaseall
	end

_01D0:
	npc_msg msg_0589_T25R0601_00002
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_01DB:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_01E5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0589_T25R0601_00003
	npc_msg msg_0589_T25R0601_00008
	touchscreen_menu_hide
	show_money_box 20, 2
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	menu_item_add 213, 470, 0
	menu_item_add 214, 472, 1
	menu_item_add 215, 471, 2
	menu_item_add 216, 473, 3
	menu_item_add 217, 474, 4
	menu_exec
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	switch VAR_SPECIAL_x8000
	case 0, _033D
	case 1, _0349
	case 2, _0355
	case 3, _0361
	npc_msg msg_0589_T25R0601_00010
	goto _031F

_0276:
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _036D
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _0377
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _0381
	compare VAR_SPECIAL_x8000, 3
	call_if_eq _038B
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0334
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _032B
	compare VAR_SPECIAL_x8000, 0
	call_if_eq _0395
	compare VAR_SPECIAL_x8000, 1
	call_if_eq _039D
	compare VAR_SPECIAL_x8000, 2
	call_if_eq _03A5
	compare VAR_SPECIAL_x8000, 3
	call_if_eq _03AD
	update_money_box
	play_se SEQ_SE_DP_REGI
	giveitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_RESULT
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0589_T25R0601_00011
	npc_msg msg_0589_T25R0601_00009
	goto _031F

_031F:
	wait_button_or_walk_away
	closemsg
	touchscreen_menu_show
	hide_money_box
	releaseall
	end

_032B:
	npc_msg msg_0589_T25R0601_00012
	goto _031F

_0334:
	npc_msg msg_0589_T25R0601_00013
	goto _031F

_033D:
	setvar VAR_SPECIAL_x8001, 95
	goto _0276

_0349:
	setvar VAR_SPECIAL_x8001, 96
	goto _0276

_0355:
	setvar VAR_SPECIAL_x8001, 97
	goto _0276

_0361:
	setvar VAR_SPECIAL_x8001, 98
	goto _0276

_036D:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 200
	return

_0377:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 200
	return

_0381:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 200
	return

_038B:
	hasenoughmoneyimmediate VAR_SPECIAL_RESULT, 200
	return

_0395:
	submoneyimmediate 200
	return

_039D:
	submoneyimmediate 200
	return

_03A5:
	submoneyimmediate 200
	return

_03AD:
	submoneyimmediate 200
	return

scr_seq_T25R0601_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	goto_if_set FLAG_UNK_15D, _03FD
	get_party_slot_with_fateful_encounter VAR_SPECIAL_RESULT, 492
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _03F2
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 492
	goto_if_eq _0432
_03F2:
	npc_msg msg_0589_T25R0601_00004
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_03FD:
	get_party_slot_with_fateful_encounter VAR_SPECIAL_RESULT, 492
	compare VAR_SPECIAL_RESULT, 255
	goto_if_eq _03F2
	get_party_lead_alive VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	compare VAR_TEMP_x4001, 492
	goto_if_ne _03F2
	npc_msg msg_0589_T25R0601_00007
	wait_button_or_walk_away
	closemsg
	releaseall
	end

_0432:
	apply_movement obj_T25R0601_gsgirl1, _04F0
	wait_movement
	npc_msg msg_0589_T25R0601_00005
	closemsg
	get_player_facing VAR_SPECIAL_RESULT
	compare VAR_SPECIAL_RESULT, 0
	goto_if_ne _0460
	apply_movement obj_T25R0601_gsgirl1, _0134
	goto _049E

_0460:
	compare VAR_SPECIAL_RESULT, 1
	goto_if_ne _047B
	apply_movement obj_T25R0601_gsgirl1, _013C
	goto _049E

_047B:
	compare VAR_SPECIAL_RESULT, 2
	goto_if_ne _0496
	apply_movement obj_T25R0601_gsgirl1, _0144
	goto _049E

_0496:
	apply_movement obj_T25R0601_gsgirl1, _012C
_049E:
	wait_movement
	npc_msg msg_0589_T25R0601_00006
	setvar VAR_SPECIAL_x8004, 466
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	compare VAR_TEMP_x4002, 0
	goto_if_eq _04DD
	callstd std_give_item_verbose
	npc_msg msg_0589_T25R0601_00007
	wait_button_or_walk_away
	closemsg
	setflag FLAG_UNK_15D
	setvar VAR_UNK_4082, 0
	releaseall
	end

_04DD:
	callstd std_bag_is_full
	closemsg
	releaseall
	setvar VAR_UNK_4082, 0
	releaseall
	end
	.byte 0x00

_04F0:
	step 75, 1
	step_end
	.balign 4, 0
