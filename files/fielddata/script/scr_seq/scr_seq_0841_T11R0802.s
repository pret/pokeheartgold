#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T11R0802.h"
#include "msgdata/msg/msg_0541_T11R0802.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T11R0802_000
	scrdef scr_seq_T11R0802_001
	scrdef scr_seq_T11R0802_002
	scrdef scr_seq_T11R0802_003
	scrdef scr_seq_T11R0802_004
	scrdef scr_seq_T11R0802_005
	scrdef scr_seq_T11R0802_006
	scrdef_end

scr_seq_T11R0802_004:
	get_player_gender VAR_TEMP_x4009
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif ne, _003B
	setvar VAR_OBJ_0, 0
	goto _0041

_003B:
	setvar VAR_OBJ_0, 97
_0041:
	end

scr_seq_T11R0802_005:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, _005A
	hide_person 3
	setvar VAR_TEMP_x400B, 1
_005A:
	end

scr_seq_T11R0802_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 480, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0125
	getitemquantity 479, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00E9
	checkflag FLAG_UNK_118
	gotoif TRUE, _00BD
	call _014D
	buffer_players_name 0
	gender_msgbox msg_0541_T11R0802_00000, msg_0541_T11R0802_00001
	closemsg
	call _01DB
	npc_msg msg_0541_T11R0802_00002
	closemsg
	apply_movement obj_T11R0802_gsgirl1, _026C
	wait_movement
	releaseall
	end

_00BD:
	setflag FLAG_UNK_119
	call _014D
	buffer_players_name 0
	gender_msgbox msg_0541_T11R0802_00003, msg_0541_T11R0802_00004
	closemsg
	call _01DB
	npc_msg msg_0541_T11R0802_00005
	closemsg
	apply_movement obj_T11R0802_gsgirl1, _026C
	wait_movement
	releaseall
	end

_00E9:
	takeitem ITEM_LOST_ITEM, 1, VAR_SPECIAL_x800C
	npc_msg msg_0541_T11R0802_00006
	clearflag FLAG_UNK_2FB
	show_person 1
	setvar VAR_SPECIAL_x8004, 480
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	npc_msg msg_0541_T11R0802_00008
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_087
	setflag FLAG_UNK_998
	setvar VAR_UNK_40FF, 2
	end

_0125:
	call _014D
	buffer_players_name 0
	gender_msgbox msg_0541_T11R0802_00009, msg_0541_T11R0802_00010
	closemsg
	call _01DB
	npc_msg msg_0541_T11R0802_00011
	closemsg
	apply_movement obj_T11R0802_gsgirl1, _026C
	wait_movement
	releaseall
	end

_014D:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _016C
	apply_movement obj_T11R0802_gsgirl1, _02B0
	goto _018F

_016C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0187
	apply_movement obj_T11R0802_gsgirl1, _0274
	goto _018F

_0187:
	apply_movement obj_T11R0802_gsgirl1, _0294
_018F:
	wait_movement
	show_person 3
	hide_person 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _01B4
	apply_movement obj_T11R0802_var_1, _0304
	goto _01D7

_01B4:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01CF
	apply_movement obj_T11R0802_var_1, _02C8
	goto _01D7

_01CF:
	apply_movement obj_T11R0802_var_1, _02EC
_01D7:
	wait_movement
	return

_01DB:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _01FA
	apply_movement obj_T11R0802_var_1, _02B0
	goto _021D

_01FA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0215
	apply_movement obj_T11R0802_var_1, _0274
	goto _021D

_0215:
	apply_movement obj_T11R0802_var_1, _0294
_021D:
	wait_movement
	show_person 0
	hide_person 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0242
	apply_movement obj_T11R0802_gsgirl1, _0304
	goto _0265

_0242:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _025D
	apply_movement obj_T11R0802_gsgirl1, _02C8
	goto _0265

_025D:
	apply_movement obj_T11R0802_gsgirl1, _02EC
_0265:
	wait_movement
	return
	.byte 0x00, 0x00, 0x00

_026C:
	step 34, 1
	step_end

_0274:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_0294:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_02B0:
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_02C8:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step_end

_02EC:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end

_0304:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step_end
scr_seq_T11R0802_003:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, _03A3
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0541_T11R0802_00012
	waitbutton
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0359
	apply_movement obj_T11R0802_jupetta, _03C8
	goto _0397

_0359:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0374
	apply_movement obj_T11R0802_jupetta, _03C0
	goto _0397

_0374:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _038F
	apply_movement obj_T11R0802_jupetta, _03D8
	goto _0397

_038F:
	apply_movement obj_T11R0802_jupetta, _03D0
_0397:
	wait_movement
	setvar VAR_TEMP_x400A, 1
	releaseall
	end

_03A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 354, 0
	npc_msg msg_0541_T11R0802_00013
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_03C0:
	step 0, 1
	step_end

_03C8:
	step 1, 1
	step_end

_03D0:
	step 2, 1
	step_end

_03D8:
	step 3, 1
	step_end
scr_seq_T11R0802_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0541_T11R0802_00015
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11R0802_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0541_T11R0802_00014
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T11R0802_006:
	checkflag FLAG_UNK_2FB
	gotoif TRUE, _0431
	comparevartovalue VAR_UNK_40FF, 2
	gotoif eq, _0433
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0541_T11R0802_00016
	waitbutton
	closemsg
	releaseall
	end

_0431:
	end

_0433:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0541_T11R0802_00017
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
