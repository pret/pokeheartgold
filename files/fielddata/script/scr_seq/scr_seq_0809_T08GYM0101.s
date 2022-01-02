#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08GYM0101.h"
#include "msgdata/msg/msg_0514_T08GYM0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T08GYM0101_000
	scrdef scr_seq_T08GYM0101_001
	scrdef scr_seq_T08GYM0101_002
	scrdef scr_seq_T08GYM0101_003
	scrdef scr_seq_T08GYM0101_004
	scrdef scr_seq_T08GYM0101_005
	scrdef scr_seq_T08GYM0101_006
	scrdef scr_seq_T08GYM0101_007
	scrdef scr_seq_T08GYM0101_008
	scrdef_end

scr_seq_T08GYM0101_000:
	scrcmd_330
	get_phone_book_rematch 26, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _00EF
	scrcmd_147 26, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00AF
	check_badge 12, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, _006D
	goto _00E9
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_006D:
	goto _0075
	.byte 0x02, 0x00
_0075:
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, _0090
	setflag FLAG_UNK_2F3
	goto _00AD

_0090:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, _00A7
	setflag FLAG_UNK_2F3
	goto _00AD

_00A7:
	goto _00E9

_00AD:
	end

_00AF:
	scrcmd_522 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, _00CA
	setflag FLAG_UNK_2F3
	goto _00E7

_00CA:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, _00E1
	setflag FLAG_UNK_2F3
	goto _00E7

_00E1:
	goto _00E9

_00E7:
	end

_00E9:
	clearflag FLAG_UNK_2F3
	end

_00EF:
	setflag FLAG_UNK_2F3
	end

scr_seq_T08GYM0101_008:
	comparevartovalue VAR_TEMP_x400B, 111
	gotoif ne, _012E
	checktrainerflag TRAINER_LASS_LINDA
	callif FALSE, _0130
	checktrainerflag TRAINER_CAMPER_BARRY
	callif FALSE, _0142
	checktrainerflag TRAINER_LASS_ALICE
	callif FALSE, _0154
	checktrainerflag TRAINER_PICNICKER_CINDY
	callif FALSE, _0166
_012E:
	end

_0130:
	clearflag FLAG_UNK_266
	show_person obj_T08GYM0101_gsgirl1
	setflag FLAG_UNK_26A
	hide_person obj_T08GYM0101_gsleader13_4
	return

_0142:
	clearflag FLAG_UNK_267
	show_person obj_T08GYM0101_campboy_2
	setflag FLAG_UNK_26B
	hide_person obj_T08GYM0101_gsleader13_3
	return

_0154:
	clearflag FLAG_UNK_268
	show_person obj_T08GYM0101_gsgirl1_2
	setflag FLAG_UNK_26C
	hide_person obj_T08GYM0101_gsleader13_5
	return

_0166:
	clearflag FLAG_UNK_269
	show_person obj_T08GYM0101_picnicgirl_2
	setflag FLAG_UNK_26D
	hide_person obj_T08GYM0101_gsleader13_2
	return

scr_seq_T08GYM0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_LASS_LINDA
	gotoif TRUE, _0277
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _01AA
	apply_movement obj_T08GYM0101_gsleader13_4, _0620
	goto _01E8

_01AA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _01C5
	apply_movement obj_T08GYM0101_gsleader13_4, _05E4
	goto _01E8

_01C5:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _01E0
	apply_movement obj_T08GYM0101_gsleader13_4, _0604
	goto _01E8

_01E0:
	apply_movement obj_T08GYM0101_gsleader13_4, _0638
_01E8:
	wait_movement
	clearflag FLAG_UNK_266
	show_person obj_T08GYM0101_gsgirl1
	setflag FLAG_UNK_26A
	hide_person obj_T08GYM0101_gsleader13_4
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0215
	apply_movement obj_T08GYM0101_gsgirl1, _0698
	goto _0253

_0215:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0230
	apply_movement obj_T08GYM0101_gsgirl1, _065C
	goto _0253

_0230:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _024B
	apply_movement obj_T08GYM0101_gsgirl1, _0680
	goto _0253

_024B:
	apply_movement obj_T08GYM0101_gsgirl1, _06B4
_0253:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00007
	closemsg
	trainer_battle TRAINER_LASS_LINDA, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0282
	settrainerflag TRAINER_LASS_LINDA
_0277:
	npc_msg msg_0514_T08GYM0101_00008
	waitbutton
	closemsg
	releaseall
	end

_0282:
	white_out
	releaseall
	setflag FLAG_UNK_266
	clearflag FLAG_UNK_26A
	end

scr_seq_T08GYM0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_CAMPER_BARRY
	gotoif TRUE, _038F
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _02C2
	apply_movement obj_T08GYM0101_gsleader13_3, _0620
	goto _0300

_02C2:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _02DD
	apply_movement obj_T08GYM0101_gsleader13_3, _05E4
	goto _0300

_02DD:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _02F8
	apply_movement obj_T08GYM0101_gsleader13_3, _0604
	goto _0300

_02F8:
	apply_movement obj_T08GYM0101_gsleader13_3, _0638
_0300:
	wait_movement
	clearflag FLAG_UNK_267
	show_person obj_T08GYM0101_campboy_2
	setflag FLAG_UNK_26B
	hide_person obj_T08GYM0101_gsleader13_3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _032D
	apply_movement obj_T08GYM0101_campboy_2, _0698
	goto _036B

_032D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0348
	apply_movement obj_T08GYM0101_campboy_2, _065C
	goto _036B

_0348:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0363
	apply_movement obj_T08GYM0101_campboy_2, _0680
	goto _036B

_0363:
	apply_movement obj_T08GYM0101_campboy_2, _06B4
_036B:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00009
	closemsg
	trainer_battle TRAINER_CAMPER_BARRY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _039A
	settrainerflag TRAINER_CAMPER_BARRY
_038F:
	npc_msg msg_0514_T08GYM0101_00010
	waitbutton
	closemsg
	releaseall
	end

_039A:
	white_out
	releaseall
	setflag FLAG_UNK_267
	clearflag FLAG_UNK_26B
	end

scr_seq_T08GYM0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_LASS_ALICE
	gotoif TRUE, _04AC
	npc_msg msg_0514_T08GYM0101_00011
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _03DF
	apply_movement obj_T08GYM0101_gsleader13_5, _0620
	goto _041D

_03DF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _03FA
	apply_movement obj_T08GYM0101_gsleader13_5, _05E4
	goto _041D

_03FA:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0415
	apply_movement obj_T08GYM0101_gsleader13_5, _0604
	goto _041D

_0415:
	apply_movement obj_T08GYM0101_gsleader13_5, _0638
_041D:
	wait_movement
	clearflag FLAG_UNK_268
	show_person obj_T08GYM0101_gsgirl1_2
	setflag FLAG_UNK_26C
	hide_person obj_T08GYM0101_gsleader13_5
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _044A
	apply_movement obj_T08GYM0101_gsgirl1_2, _0698
	goto _0488

_044A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0465
	apply_movement obj_T08GYM0101_gsgirl1_2, _065C
	goto _0488

_0465:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0480
	apply_movement obj_T08GYM0101_gsgirl1_2, _0680
	goto _0488

_0480:
	apply_movement obj_T08GYM0101_gsgirl1_2, _06B4
_0488:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00012
	closemsg
	trainer_battle TRAINER_LASS_ALICE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04B7
	settrainerflag TRAINER_LASS_ALICE
_04AC:
	npc_msg msg_0514_T08GYM0101_00013
	waitbutton
	closemsg
	releaseall
	end

_04B7:
	white_out
	releaseall
	setflag FLAG_UNK_268
	clearflag FLAG_UNK_26C
	end

scr_seq_T08GYM0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag TRAINER_PICNICKER_CINDY
	gotoif TRUE, _05C9
	npc_msg msg_0514_T08GYM0101_00014
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _04FC
	apply_movement obj_T08GYM0101_gsleader13_2, _0620
	goto _053A

_04FC:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0517
	apply_movement obj_T08GYM0101_gsleader13_2, _05E4
	goto _053A

_0517:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _0532
	apply_movement obj_T08GYM0101_gsleader13_2, _0604
	goto _053A

_0532:
	apply_movement obj_T08GYM0101_gsleader13_2, _0638
_053A:
	wait_movement
	clearflag FLAG_UNK_269
	show_person obj_T08GYM0101_picnicgirl_2
	setflag FLAG_UNK_26D
	hide_person obj_T08GYM0101_gsleader13_2
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0567
	apply_movement obj_T08GYM0101_picnicgirl_2, _0698
	goto _05A5

_0567:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0582
	apply_movement obj_T08GYM0101_picnicgirl_2, _065C
	goto _05A5

_0582:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _059D
	apply_movement obj_T08GYM0101_picnicgirl_2, _0680
	goto _05A5

_059D:
	apply_movement obj_T08GYM0101_picnicgirl_2, _06B4
_05A5:
	wait_movement
	npc_msg msg_0514_T08GYM0101_00015
	closemsg
	trainer_battle TRAINER_PICNICKER_CINDY, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05D4
	settrainerflag TRAINER_PICNICKER_CINDY
_05C9:
	npc_msg msg_0514_T08GYM0101_00016
	waitbutton
	closemsg
	releaseall
	end

_05D4:
	white_out
	releaseall
	setflag FLAG_UNK_269
	clearflag FLAG_UNK_26D
	end
	.byte 0x00, 0x00

_05E4:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_0604:
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_0620:
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_0638:
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end

_065C:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step_end

_0680:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step_end

_0698:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step_end

_06B4:
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step_end
scr_seq_T08GYM0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0778
	npc_msg msg_0514_T08GYM0101_00000
	closemsg
	setvar VAR_TEMP_x400B, 111
	trainer_battle TRAINER_LEADER_JANINE_JANINE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _078E
	setvar VAR_TEMP_x400B, 0
	give_badge 12
	addvar VAR_UNK_4135, 1
	add_special_game_stat 22
	settrainerflag TRAINER_PICNICKER_CINDY
	settrainerflag TRAINER_CAMPER_BARRY
	settrainerflag TRAINER_LASS_LINDA
	settrainerflag TRAINER_LASS_ALICE
	npc_msg msg_0514_T08GYM0101_00001
	buffer_players_name 0
	npc_msg msg_0514_T08GYM0101_00002
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg msg_0514_T08GYM0101_00003
	goto _074F

_074F:
	goto_if_no_item_space ITEM_TM84, 1, _0794
	callstd std_give_item_verbose
	setflag FLAG_UNK_12D
_0778:
	checkflag FLAG_UNK_12D
	gotoif FALSE, _074F
	npc_msg msg_0514_T08GYM0101_00004
	waitbutton
	closemsg
	releaseall
	end

_078E:
	white_out
	releaseall
	end

_0794:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_T08GYM0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _07C4
	npc_msg msg_0514_T08GYM0101_00005
	waitbutton
	closemsg
	releaseall
	end

_07C4:
	npc_msg msg_0514_T08GYM0101_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T08GYM0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 12, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _07F6
	npc_msg msg_0514_T08GYM0101_00017
	goto _07F9

_07F6:
	npc_msg msg_0514_T08GYM0101_00018
_07F9:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
