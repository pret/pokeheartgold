#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25.h"
#include "msgdata/msg/msg_0581_T25.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25_000
	scrdef scr_seq_T25_001
	scrdef scr_seq_T25_002
	scrdef scr_seq_T25_003
	scrdef scr_seq_T25_004
	scrdef scr_seq_T25_005
	scrdef scr_seq_T25_006
	scrdef scr_seq_T25_007
	scrdef scr_seq_T25_008
	scrdef scr_seq_T25_009
	scrdef scr_seq_T25_010
	scrdef scr_seq_T25_011
	scrdef scr_seq_T25_012
	scrdef scr_seq_T25_013
	scrdef scr_seq_T25_014
	scrdef scr_seq_T25_015
	scrdef scr_seq_T25_016
	scrdef scr_seq_T25_017
	scrdef scr_seq_T25_018
	scrdef scr_seq_T25_019
	scrdef scr_seq_T25_020
	scrdef scr_seq_T25_021
	scrdef scr_seq_T25_022
	scrdef scr_seq_T25_023
	scrdef scr_seq_T25_024
	scrdef scr_seq_T25_025
	scrdef scr_seq_T25_026
	scrdef scr_seq_T25_027
	scrdef scr_seq_T25_028
	scrdef scr_seq_T25_029
	scrdef scr_seq_T25_030
	scrdef scr_seq_T25_031
	scrdef scr_seq_T25_032
	scrdef_end

scr_seq_T25_018:
	setflag FLAG_UNK_1B9
	setflag FLAG_UNK_1BA
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1BB
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 0
	gotoif ne, _00B5
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	goto _011A

_00B5:
	comparevartovalue VAR_UNK_4077, 1
	gotoif ne, _00D4
	clearflag FLAG_UNK_1B8
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	goto _011A

_00D4:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _00F7
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1BB
	goto _011A

_00F7:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, _010E
	clearflag FLAG_UNK_1B8
	goto _011A

_010E:
	clearflag FLAG_UNK_1B9
	clearflag FLAG_UNK_1BA
	clearflag FLAG_UNK_1B7
_011A:
	end

scr_seq_T25_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, _013E
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, _0149
_013E:
	npc_msg msg_0581_T25_00009
	waitbutton
	closemsg
	releaseall
	end

_0149:
	npc_msg msg_0581_T25_00010
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ge, _0172
	npc_msg msg_0581_T25_00004
	goto _0175

_0172:
	npc_msg msg_0581_T25_00005
_0175:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif TRUE, _019B
	npc_msg msg_0581_T25_00006
	waitbutton
	closemsg
	releaseall
	end

_019B:
	npc_msg msg_0581_T25_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0581_T25_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _01DD
	npc_msg msg_0581_T25_00002
	waitbutton
	closemsg
	releaseall
	end

_01DD:
	npc_msg msg_0581_T25_00003
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, _020A
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, _0215
_020A:
	npc_msg msg_0581_T25_00000
	waitbutton
	closemsg
	releaseall
	end

_0215:
	npc_msg msg_0581_T25_00001
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40DA, 1
	gotoif ne, _0242
	comparevartovalue VAR_UNK_40DB, 0
	gotoif eq, _024D
_0242:
	npc_msg msg_0581_T25_00011
	waitbutton
	closemsg
	releaseall
	end

_024D:
	npc_msg msg_0581_T25_00012
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0581_T25_00013
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0284
	apply_movement obj_T25_rocketm, _02F8
	wait_movement
	goto _02B8

_0284:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _02A1
	apply_movement obj_T25_rocketm, _0308
	wait_movement
	goto _02B8

_02A1:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _02B8
	apply_movement obj_T25_rocketm, _0300
	wait_movement
_02B8:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _02CE
	npc_msg msg_0581_T25_00015
	goto _02D1

_02CE:
	npc_msg msg_0581_T25_00014
_02D1:
	closemsg
	comparevartovalue VAR_TEMP_x4001, 350
	gotoif eq, _02EA
	apply_movement obj_T25_rocketm, _02F0
	wait_movement
_02EA:
	releaseall
	end
	.byte 0x00, 0x00

_02F0:
	step 32, 1
	step_end

_02F8:
	step 33, 1
	step_end

_0300:
	step 34, 1
	step_end

_0308:
	step 35, 1
	step_end
scr_seq_T25_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _032E
	npc_msg msg_0581_T25_00017
	goto _0331

_032E:
	npc_msg msg_0581_T25_00016
_0331:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0357
	npc_msg msg_0581_T25_00019
	goto _035A

_0357:
	npc_msg msg_0581_T25_00018
_035A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0380
	npc_msg msg_0581_T25_00021
	goto _0383

_0380:
	npc_msg msg_0581_T25_00020
_0383:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _03A9
	npc_msg msg_0581_T25_00023
	goto _03AC

_03A9:
	npc_msg msg_0581_T25_00022
_03AC:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _03D2
	npc_msg msg_0581_T25_00025
	goto _03D5

_03D2:
	npc_msg msg_0581_T25_00024
_03D5:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _03FB
	npc_msg msg_0581_T25_00030
	goto _03FE

_03FB:
	npc_msg msg_0581_T25_00029
_03FE:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_030:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0581_T25_00026
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_032:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0581_T25_00028
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_031:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0581_T25_00027
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0581_T25_00031
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0581_T25_00032
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _047F
	npc_msg msg_0581_T25_00034
	goto _0482

_047F:
	npc_msg msg_0581_T25_00033
_0482:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25_017:
	scrcmd_609
	lockall
	apply_movement obj_T25_rocketm_9, _06E4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, _04B9
	apply_movement obj_T25_rocketm_9, _06EC
	goto _05A6

_04B9:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, _04D4
	apply_movement obj_T25_rocketm_9, _06F4
	goto _05A6

_04D4:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, _04EF
	apply_movement obj_T25_rocketm_9, _06FC
	goto _05A6

_04EF:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, _050A
	apply_movement obj_T25_rocketm_9, _0704
	goto _05A6

_050A:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, _0525
	apply_movement obj_T25_rocketm_9, _070C
	goto _05A6

_0525:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, _0540
	apply_movement obj_T25_rocketm_9, _0714
	goto _05A6

_0540:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, _055B
	apply_movement obj_T25_rocketm_9, _071C
	goto _05A6

_055B:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, _0576
	apply_movement obj_T25_rocketm_9, _0724
	goto _05A6

_0576:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, _0591
	apply_movement obj_T25_rocketm_9, _072C
	goto _05A6

_0591:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, _05A6
	apply_movement obj_T25_rocketm_9, _0734
_05A6:
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement obj_T25_rocketm_9, _073C
	apply_movement obj_player, _0744
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0581_T25_00035
	closemsg
	comparevartovalue VAR_TEMP_x4000, 354
	gotoif ne, _05EE
	apply_movement obj_T25_rocketm_9, _0754
	goto _06DB

_05EE:
	comparevartovalue VAR_TEMP_x4000, 355
	gotoif ne, _0609
	apply_movement obj_T25_rocketm_9, _0764
	goto _06DB

_0609:
	comparevartovalue VAR_TEMP_x4000, 356
	gotoif ne, _0624
	apply_movement obj_T25_rocketm_9, _0774
	goto _06DB

_0624:
	comparevartovalue VAR_TEMP_x4000, 357
	gotoif ne, _063F
	apply_movement obj_T25_rocketm_9, _0784
	goto _06DB

_063F:
	comparevartovalue VAR_TEMP_x4000, 358
	gotoif ne, _065A
	apply_movement obj_T25_rocketm_9, _0794
	goto _06DB

_065A:
	comparevartovalue VAR_TEMP_x4000, 359
	gotoif ne, _0675
	apply_movement obj_T25_rocketm_9, _07A4
	goto _06DB

_0675:
	comparevartovalue VAR_TEMP_x4000, 360
	gotoif ne, _0690
	apply_movement obj_T25_rocketm_9, _07B0
	goto _06DB

_0690:
	comparevartovalue VAR_TEMP_x4000, 361
	gotoif ne, _06AB
	apply_movement obj_T25_rocketm_9, _07C0
	goto _06DB

_06AB:
	comparevartovalue VAR_TEMP_x4000, 362
	gotoif ne, _06C6
	apply_movement obj_T25_rocketm_9, _07D0
	goto _06DB

_06C6:
	comparevartovalue VAR_TEMP_x4000, 363
	gotoif ne, _06DB
	apply_movement obj_T25_rocketm_9, _07E0
_06DB:
	wait_movement
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_06E4:
	step 75, 1
	step_end

_06EC:
	step 14, 5
	step_end

_06F4:
	step 14, 4
	step_end

_06FC:
	step 14, 3
	step_end

_0704:
	step 14, 2
	step_end

_070C:
	step 14, 1
	step_end

_0714:
	step 60, 1
	step_end

_071C:
	step 15, 1
	step_end

_0724:
	step 15, 2
	step_end

_072C:
	step 15, 3
	step_end

_0734:
	step 15, 4
	step_end

_073C:
	step 12, 1
	step_end

_0744:
	step 71, 1
	step 12, 1
	step 72, 1
	step_end

_0754:
	step 13, 1
	step 15, 5
	step 32, 1
	step_end

_0764:
	step 13, 1
	step 15, 4
	step 32, 1
	step_end

_0774:
	step 13, 1
	step 15, 3
	step 32, 1
	step_end

_0784:
	step 13, 1
	step 15, 2
	step 32, 1
	step_end

_0794:
	step 13, 1
	step 15, 1
	step 32, 1
	step_end

_07A4:
	step 13, 1
	step 32, 1
	step_end

_07B0:
	step 13, 1
	step 14, 1
	step 32, 1
	step_end

_07C0:
	step 13, 1
	step 14, 2
	step 32, 1
	step_end

_07D0:
	step 13, 1
	step 14, 3
	step 32, 1
	step_end

_07E0:
	step 13, 1
	step 14, 4
	step 32, 1
	step_end
scr_seq_T25_019:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00036, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_020:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00037, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_021:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00038, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_022:
	direction_signpost msg_0581_T25_00039, 0, 16, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_023:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00040, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_024:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00041, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_025:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00042, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_026:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00043, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_027:
	scrcmd_055 3, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00044, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_028:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00045, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T25_029:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0581_T25_00046, VAR_SPECIAL_x800C
	callstd std_signpost
	end
	.balign 4, 0
