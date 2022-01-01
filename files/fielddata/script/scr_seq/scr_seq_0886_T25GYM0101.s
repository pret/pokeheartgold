#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25GYM0101.h"
#include "msgdata/msg/msg_0582_T25GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25GYM0101_000
	scrdef scr_seq_T25GYM0101_001
	scrdef scr_seq_T25GYM0101_002
	scrdef scr_seq_T25GYM0101_003
	scrdef scr_seq_T25GYM0101_004
	scrdef_end

scr_seq_T25GYM0101_004:
	get_phone_book_rematch 17, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _0106
	checkflag FLAG_GAME_CLEAR
	gotoif FALSE, _0100
	scrcmd_147 17, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00AF
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, _0062
	setflag FLAG_UNK_2EC
	goto _00AD

_0062:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, _0079
	setflag FLAG_UNK_2EC
	goto _00AD

_0079:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, _0090
	setflag FLAG_UNK_2EC
	goto _00AD

_0090:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, _00A7
	setflag FLAG_UNK_2EC
	goto _00AD

_00A7:
	goto _0100

_00AD:
	end

_00AF:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, _00CA
	setflag FLAG_UNK_2EC
	goto _00FE

_00CA:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, _00E1
	setflag FLAG_UNK_2EC
	goto _00FE

_00E1:
	comparevartovalue VAR_TEMP_x4000, 20
	gotoif ne, _00F8
	setflag FLAG_UNK_2EC
	goto _00FE

_00F8:
	goto _0100

_00FE:
	end

_0100:
	clearflag FLAG_UNK_2EC
	end

_0106:
	setflag FLAG_UNK_2EC
	end

scr_seq_T25GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0202
	checkflag FLAG_UNK_0B7
	gotoif TRUE, _01A0
	comparevartovalue VAR_UNK_410A, 1
	gotoif eq, _017D
	npc_msg msg_0582_T25GYM0101_00000
	closemsg
	trainer_battle TRAINER_LEADER_WHITNEY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0218
	settrainerflag TRAINER_LASS_CARRIE
	settrainerflag TRAINER_LASS_CATHY
	settrainerflag TRAINER_BEAUTY_VICTORIA
	settrainerflag TRAINER_BEAUTY_SAMANTHA
	add_special_game_stat 22
	move_person obj_T25GYM0101_gsgirl1, 13, 0, 15, 0
_017D:
	npc_msg msg_0582_T25GYM0101_00002
	waitbutton
	closemsg
	releaseall
	setvar VAR_UNK_410A, 1
	setflag FLAG_UNK_084
	setvar VAR_UNK_40DA, 1
	clearflag FLAG_UNK_223
	setflag FLAG_UNK_224
	end

_01A0:
	npc_msg msg_0582_T25GYM0101_00003
	buffer_players_name 0
	npc_msg msg_0582_T25GYM0101_00004
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge 2
	setvar VAR_UNK_410A, 2
	clearflag FLAG_UNK_084
	setflag FLAG_UNK_998
	npc_msg msg_0582_T25GYM0101_00005
_01C4:
	goto_if_no_item_space ITEM_TM45, 1, _01F8
	callstd std_give_item_verbose
	npc_msg msg_0582_T25GYM0101_00007
	waitbutton
	closemsg
	setflag FLAG_UNK_085
	releaseall
	end

_01F8:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

_0202:
	checkflag FLAG_UNK_085
	gotoif FALSE, _01C4
	npc_msg msg_0582_T25GYM0101_00008
	waitbutton
	closemsg
	releaseall
	end

_0218:
	white_out
	releaseall
	end

scr_seq_T25GYM0101_001:
	scrcmd_609
	lockall
	apply_movement obj_T25GYM0101_gsgirl1, _0260
	wait_movement
	npc_msg msg_0582_T25GYM0101_00009
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_T25GYM0101_gsgirl1, _026C
	apply_movement obj_player, _0278
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	setflag FLAG_UNK_0B7
	releaseall
	end
	.byte 0x00

_0260:
	step 75, 1
	step 12, 3
	step_end

_026C:
	step 13, 3
	step 32, 1
	step_end

_0278:
	step 63, 1
	step 12, 1
	step_end
scr_seq_T25GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 2, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02AA
	npc_msg msg_0582_T25GYM0101_00010
	waitbutton
	closemsg
	releaseall
	end

_02AA:
	npc_msg msg_0582_T25GYM0101_00011
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 2, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _02DC
	npc_msg msg_0582_T25GYM0101_00012
	goto _02DF

_02DC:
	npc_msg msg_0582_T25GYM0101_00013
_02DF:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
