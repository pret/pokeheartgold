#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30GYM0101.h"
#include "msgdata/msg/msg_0631_T30GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T30GYM0101_000
	scrdef scr_seq_T30GYM0101_001
	scrdef scr_seq_T30GYM0101_002
	scrdef scr_seq_T30GYM0101_003
	scrdef scr_seq_T30GYM0101_004
	scrdef scr_seq_T30GYM0101_005
	scrdef_end

scr_seq_T30GYM0101_001:
	scrcmd_329
	setvar VAR_UNK_4120, 0
	get_phone_book_rematch 27, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _010C
	comparevartovalue VAR_UNK_40FC, 2
	gotoif ge, _0044
	end

_0044:
	scrcmd_147 27, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00BD
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, _0072
	setflag FLAG_UNK_2EF
	goto _00BB

_0072:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, _0089
	setflag FLAG_UNK_2EF
	goto _00BB

_0089:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, _00A0
	setflag FLAG_UNK_2EF
	goto _00BB

_00A0:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, _00B7
	setflag FLAG_UNK_2EF
	goto _00BB

_00B7:
	clearflag FLAG_UNK_2EF
_00BB:
	end

_00BD:
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, _00D8
	setflag FLAG_UNK_2EF
	goto _010A

_00D8:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, _00EF
	setflag FLAG_UNK_2EF
	goto _010A

_00EF:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, _0106
	setflag FLAG_UNK_2EF
	goto _010A

_0106:
	clearflag FLAG_UNK_2EF
_010A:
	end

_010C:
	setflag FLAG_UNK_2EF
	end

scr_seq_T30GYM0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0EA
	gotoif TRUE, _018E
	checkflag FLAG_UNK_0D1
	gotoif TRUE, _017D
	npc_msg msg_0631_T30GYM0101_00003
	closemsg
	trainer_battle TRAINER_LEADER_CLAIR_CLAIR, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0188
	settrainerflag TRAINER_ACE_TRAINER_M_PAULO
	settrainerflag TRAINER_ACE_TRAINER_M_CODY
	settrainerflag TRAINER_ACE_TRAINER_M_MIKE
	settrainerflag TRAINER_ACE_TRAINER_F_FRAN
	settrainerflag TRAINER_ACE_TRAINER_F_LOLA
	add_special_game_stat 22
	setflag FLAG_UNK_0D1
	setflag FLAG_HIDE_BLACKTHORN_DEN_GUARD_INFRONT
	clearflag FLAG_HIDE_BLACKTHRON_DEN_GUARD_ASIDE
	npc_msg msg_0631_T30GYM0101_00004
	waitbutton
	closemsg
	releaseall
	end

_017D:
	npc_msg msg_0631_T30GYM0101_00005
	waitbutton
	closemsg
	releaseall
	end

_0188:
	white_out
	releaseall
	end

_018E:
	checkflag FLAG_UNK_0DA
	gotoif TRUE, _01C8
	npc_msg msg_0631_T30GYM0101_00006
	goto_if_no_item_space ITEM_TM59, 1, _01D3
	callstd std_give_item_verbose
	setflag FLAG_UNK_0DA
	npc_msg msg_0631_T30GYM0101_00007
_01C8:
	npc_msg msg_0631_T30GYM0101_00009
	waitbutton
	closemsg
	releaseall
	end

_01D3:
	npc_msg msg_0631_T30GYM0101_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30GYM0101_002:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_GYURU
	apply_movement obj_player, _0218
	wait_movement
	fade_screen 6, 1, 0, 0x0000
	wait_fade
	scrcmd_176 141, 0, 8, 83, 0
	fade_screen 6, 1, 1, 0x0000
	wait_fade
	releaseall
	end


_0218:
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 2
	step 1, 2
	step 2, 2
	step 0, 2
	step 3, 1
	step 69, 0
	step_end
scr_seq_T30GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D1
	gotoif TRUE, _0291
	npc_msg msg_0631_T30GYM0101_00000
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4120, 1
	waitbutton
	closemsg
	releaseall
	end

_0291:
	npc_msg msg_0631_T30GYM0101_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T30GYM0101_004:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_138
	gotoif TRUE, _0352
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, _02D4
	apply_movement obj_T30GYM0101_sunglasses, _0370
	apply_movement obj_player, _039C
	goto _0307

_02D4:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, _02F7
	apply_movement obj_T30GYM0101_sunglasses, _0380
	apply_movement obj_player, _03A8
	goto _0307

_02F7:
	apply_movement obj_T30GYM0101_sunglasses, _0390
	apply_movement obj_player, _03B4
_0307:
	wait_movement
	npc_msg msg_0631_T30GYM0101_00002
	closemsg
	setflag FLAG_UNK_138
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, _032D
	apply_movement obj_T30GYM0101_sunglasses, _03C0
	goto _0350

_032D:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, _0348
	apply_movement obj_T30GYM0101_sunglasses, _03CC
	goto _0350

_0348:
	apply_movement obj_T30GYM0101_sunglasses, _03D8
_0350:
	wait_movement
_0352:
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4120, 1
	setvar VAR_UNK_4120, 1
	releaseall
	end
	.byte 0x00

_0370:
	step 2, 1
	step 75, 1
	step 14, 2
	step_end

_0380:
	step 2, 1
	step 75, 1
	step 14, 1
	step_end

_0390:
	step 2, 1
	step 75, 1
	step_end

_039C:
	step 63, 5
	step 3, 1
	step_end

_03A8:
	step 63, 4
	step 3, 1
	step_end

_03B4:
	step 63, 2
	step 3, 1
	step_end

_03C0:
	step 15, 2
	step 1, 1
	step_end

_03CC:
	step 15, 1
	step 1, 1
	step_end

_03D8:
	step 1, 1
	step_end
scr_seq_T30GYM0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 7, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0407
	npc_msg msg_0631_T30GYM0101_00010
	goto _040A

_0407:
	npc_msg msg_0631_T30GYM0101_00011
_040A:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
