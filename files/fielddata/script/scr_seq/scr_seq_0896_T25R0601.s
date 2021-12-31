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
	checkflag FLAG_UNK_15D
	gotoif TRUE, _0058
	checkflag FLAG_UNK_0B5
	gotoif FALSE, _0058
	scrcmd_688 16384, 492
	comparevartovalue VAR_TEMP_x4000, 255
	gotoif eq, _0058
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif ne, _0058
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
	apply_movement 253, _014C
	wait_movement
	npc_msg msg_0589_T25R0601_00005
	closemsg
	apply_movement obj_T25R0601_gsgirl1, _012C
	wait_movement
	npc_msg msg_0589_T25R0601_00006
	setvar VAR_SPECIAL_x8004, 466
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, _00EA
	callstd std_give_item_verbose
	npc_msg msg_0589_T25R0601_00007
	waitbutton
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
	checkflag FLAG_UNK_0B5
	gotoif TRUE, _01E5
	check_badge 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif eq, _0185
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0589_T25R0601_00000
	waitbutton
	closemsg
	releaseall
	end

_0185:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	hasitem ITEM_SQUIRTBOTTLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01D0
	npc_msg msg_0589_T25R0601_00001
	setvar VAR_SPECIAL_x8004, 477
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01DB
	callstd std_give_item_verbose
	closemsg
	releaseall
	end

_01D0:
	npc_msg msg_0589_T25R0601_00002
	waitbutton
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
	scrcmd_113 20, 2
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 213, 470, 0
	menu_item_add 214, 472, 1
	menu_item_add 215, 471, 2
	menu_item_add 216, 473, 3
	menu_item_add 217, 474, 4
	menu_exec
	copyvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _033D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0349
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0355
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0361
	npc_msg msg_0589_T25R0601_00010
	goto _031F

_0276:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, _036D
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, _0377
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, _0381
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, _038B
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0334
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _032B
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, _0395
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, _039D
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, _03A5
	comparevartovalue VAR_SPECIAL_x8000, 3
	callif eq, _03AD
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	giveitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0589_T25R0601_00011
	npc_msg msg_0589_T25R0601_00009
	goto _031F

_031F:
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_114
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
	hasenoughmoneyimmediate 32780, 200
	return

_0377:
	hasenoughmoneyimmediate 32780, 200
	return

_0381:
	hasenoughmoneyimmediate 32780, 200
	return

_038B:
	hasenoughmoneyimmediate 32780, 200
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
	checkflag FLAG_UNK_15D
	gotoif TRUE, _03FD
	scrcmd_688 32780, 492
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _03F2
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif eq, _0432
_03F2:
	npc_msg msg_0589_T25R0601_00004
	waitbutton
	closemsg
	releaseall
	end

_03FD:
	scrcmd_688 32780, 492
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _03F2
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 492
	gotoif ne, _03F2
	npc_msg msg_0589_T25R0601_00007
	waitbutton
	closemsg
	releaseall
	end

_0432:
	apply_movement obj_T25R0601_gsgirl1, _04F0
	wait_movement
	npc_msg msg_0589_T25R0601_00005
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0460
	apply_movement obj_T25R0601_gsgirl1, _0134
	goto _049E

_0460:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _047B
	apply_movement obj_T25R0601_gsgirl1, _013C
	goto _049E

_047B:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0496
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
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, _04DD
	callstd std_give_item_verbose
	npc_msg msg_0589_T25R0601_00007
	waitbutton
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
