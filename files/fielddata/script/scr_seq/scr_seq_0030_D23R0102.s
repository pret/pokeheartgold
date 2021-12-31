#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0102.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0102_000
	scrdef scr_seq_D23R0102_001
	scrdef scr_seq_D23R0102_002
	scrdef scr_seq_D23R0102_003
	scrdef scr_seq_D23R0102_004
	scrdef scr_seq_D23R0102_005
	scrdef scr_seq_D23R0102_006
	scrdef scr_seq_D23R0102_007
	scrdef scr_seq_D23R0102_008
	scrdef scr_seq_D23R0102_009
	scrdef scr_seq_D23R0102_010
	scrdef_end

scr_seq_D23R0102_007:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _004D
	clearflag FLAG_UNK_1B7
	goto _0068

_004D:
	comparevartovalue VAR_UNK_4077, 2
	gotoif ge, _0064
	clearflag FLAG_UNK_1B8
	goto _0068

_0064:
	clearflag FLAG_UNK_1B8
_0068:
	end

scr_seq_D23R0102_008:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, _0083
	move_person 3, 2, 1, 7, 3
_0083:
	end

scr_seq_D23R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0066_D23R0102_00006
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0066_D23R0102_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0066_D23R0102_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_JIGGLYPUFF, 0
	npc_msg msg_0066_D23R0102_00003
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _00F7
	npc_msg msg_0066_D23R0102_00002
	goto _00FA

_00F7:
	npc_msg msg_0066_D23R0102_00001
_00FA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0066_D23R0102_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, _0133
	npc_msg msg_0066_D23R0102_00005
	goto _0136

_0133:
	npc_msg msg_0066_D23R0102_00004
_0136:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0102_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _015C
	npc_msg msg_0066_D23R0102_00009
	goto _0162

_015C:
	goto _016A

_0162:
	waitbutton
	closemsg
	releaseall
	end

_016A:
	hasitem ITEM_BLUE_CARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _01B5
	npc_msg msg_0066_D23R0102_00010
	closemsg
	setvar VAR_SPECIAL_x8004, 472
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0539
	callstd std_give_item_verbose
	closemsg
	addvar VAR_UNK_4115, 1
	releaseall
	end

_01B5:
	comparevartovalue VAR_UNK_4115, 2
	gotoif lt, _01CF
	buffer_players_name 0
	gender_msgbox msg_0066_D23R0102_00012, msg_0066_D23R0102_00013
	goto _01D2

_01CF:
	npc_msg msg_0066_D23R0102_00011
_01D2:
	closemsg
	checkflag FLAG_UNK_AB6
	gotoif TRUE, _01EA
	npc_msg msg_0066_D23R0102_00028
	waitbutton
	closemsg
	releaseall
	end

_01EA:
	checkflag FLAG_UNK_AA3
	gotoif TRUE, _0547
	npc_msg msg_0066_D23R0102_00014
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0552
	buffer_players_name 0
	comparevartovalue VAR_UNK_4115, 2
	gotoif lt, _0227
	gender_msgbox msg_0066_D23R0102_00017, msg_0066_D23R0102_00018
	goto _022B

_0227:
	gender_msgbox msg_0066_D23R0102_00015, msg_0066_D23R0102_00016
_022B:
	closemsg
	apply_movement obj_D23R0102_gswoman1, _0620
	wait_movement
	gender_msgbox msg_0066_D23R0102_00020, msg_0066_D23R0102_00021
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, _0295
	release obj_partner_poke
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _0279
	apply_movement obj_player, _05CC
	apply_movement obj_partner_poke, _05E0
	goto _0289

_0279:
	apply_movement obj_player, _05F0
	apply_movement obj_partner_poke, _0600
_0289:
	wait_movement
	lock obj_partner_poke
	goto _02BA

_0295:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _02B0
	apply_movement obj_player, _05CC
	goto _02B8

_02B0:
	apply_movement obj_player, _05F0
_02B8:
	wait_movement
_02BA:
	scrcmd_821 32768, 32769
	touchscreen_menu_hide
	menu_init 1, 1, 0, 0, VAR_SPECIAL_x800C
	menu_item_add 32768, 255, 0
	addvar VAR_SPECIAL_x8000, 1
	menu_item_add 32768, 255, 1
	addvar VAR_SPECIAL_x8000, 1
	menu_item_add 32768, 255, 2
	menu_exec
	touchscreen_menu_show
	setflag FLAG_UNK_102
	setflag FLAG_UNK_AA3
	apply_movement obj_D23R0102_gswoman1, _0628
	wait_movement
	comparevartovar VAR_SPECIAL_x800C, VAR_SPECIAL_x8001
	gotoif ne, _055D
	npc_msg msg_0066_D23R0102_00022
	apply_movement obj_D23R0102_gswoman1, _0630
	wait_movement
	apply_movement obj_player, _060C
	wait_movement
	play_se SEQ_SE_GS_OKOZUKAI
	comparevartovalue VAR_UNK_413A, 30
	gotoif ge, _033F
	addvar VAR_UNK_413A, 1
_033F:
	comparevartovalue VAR_UNK_413A, 30
	gotoif lt, _0387
	comparevartovalue VAR_UNK_4115, 2
	gotoif ge, _0387
	apply_movement obj_D23R0102_gswoman1, _0628
	wait_movement
	gender_msgbox msg_0066_D23R0102_00024, msg_0066_D23R0102_00025
	closemsg
	register_gear_number 8
	npc_msg msg_0066_D23R0102_00026
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	closemsg
	apply_movement obj_D23R0102_gswoman1, _0628
	wait_movement
	npc_msg msg_0066_D23R0102_00027
	closemsg
_0387:
	comparevartovalue VAR_UNK_413A, 1
	gotoif eq, _0499
	comparevartovalue VAR_UNK_413A, 3
	gotoif eq, _04AD
	comparevartovalue VAR_UNK_413A, 5
	gotoif eq, _04C1
	comparevartovalue VAR_UNK_413A, 10
	gotoif eq, _04D5
	comparevartovalue VAR_UNK_413A, 15
	gotoif eq, _04E9
	comparevartovalue VAR_UNK_413A, 20
	gotoif eq, _04FD
	comparevartovalue VAR_UNK_413A, 25
	gotoif eq, _0511
	comparevartovalue VAR_UNK_413A, 30
	gotoif eq, _0525
	goto _0568

_03F5:
	npc_msg msg_0066_D23R0102_00032
	closemsg
	apply_movement obj_D23R0102_gswoman1, _0638
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D23R0102_gswoman2_2, _0648
	apply_movement obj_player, _0614
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_int 0, VAR_UNK_413A
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg msg_0066_D23R0102_00035
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0539
	callstd std_give_item_verbose
_0450:
	comparevartovalue VAR_UNK_413A, 30
	gotoif lt, _0486
	npc_msg msg_0066_D23R0102_00036
	closemsg
	play_fanfare SEQ_ME_KEYITEM
	npc_msg msg_0066_D23R0102_00037
	wait_fanfare
	closemsg
	comparevartovalue VAR_UNK_4115, 255
	gotoif ge, _0480
	addvar VAR_UNK_4115, 1
_0480:
	setvar VAR_UNK_413A, 0
_0486:
	npc_msg msg_0066_D23R0102_00038
	closemsg
	apply_movement obj_D23R0102_gswoman2_2, _0654
	wait_movement
	releaseall
	end

_0499:
	setvar VAR_SPECIAL_x8004, 4
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02, 0x00
_04AD:
	setvar VAR_SPECIAL_x8004, 23
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02
	.byte 0x00
_04C1:
	setvar VAR_SPECIAL_x8004, 46
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02, 0x00
_04D5:
	setvar VAR_SPECIAL_x8004, 47
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02, 0x00
_04E9:
	setvar VAR_SPECIAL_x8004, 48
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02, 0x00
_04FD:
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02
	.byte 0x00
_0511:
	setvar VAR_SPECIAL_x8004, 50
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02, 0x00
_0525:
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	goto _03F5
	.byte 0x02, 0x00
_0539:
	callstd std_bag_is_full
	closemsg
	goto _0450
	.byte 0x02, 0x00
_0547:
	npc_msg msg_0066_D23R0102_00029
	waitbutton
	closemsg
	releaseall
	end

_0552:
	npc_msg msg_0066_D23R0102_00019
	waitbutton
	closemsg
	releaseall
	end

_055D:
	npc_msg msg_0066_D23R0102_00023
	waitbutton
	closemsg
	releaseall
	end

_0568:
	npc_msg msg_0066_D23R0102_00032
	closemsg
	apply_movement obj_D23R0102_gswoman1, _0638
	wait_movement
	releaseall
	end

scr_seq_D23R0102_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, _05C0
	hasitem ITEM_BLUE_CARD, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _05B0
	npc_msg msg_0066_D23R0102_00033
	waitbutton
	closemsg
	releaseall
	end

_05B0:
	buffer_int 0, VAR_UNK_413A
	npc_msg msg_0066_D23R0102_00034
	waitbutton
	closemsg
	releaseall
	end

_05C0:
	npc_msg msg_0066_D23R0102_00039
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00

_05CC:
	step 1, 1
	step 13, 2
	step 14, 1
	step 34, 1
	step_end

_05E0:
	step 13, 2
	step 14, 1
	step 32, 1
	step_end

_05F0:
	step 1, 1
	step 13, 1
	step 34, 1
	step_end

_0600:
	step 13, 1
	step 32, 1
	step_end

_060C:
	step 32, 1
	step_end

_0614:
	step 13, 1
	step 14, 2
	step_end

_0620:
	step 34, 1
	step_end

_0628:
	step 33, 1
	step_end

_0630:
	step 13, 1
	step_end

_0638:
	step 0, 1
	step 12, 1
	step 34, 1
	step_end

_0648:
	step 13, 2
	step 15, 3
	step_end

_0654:
	step 14, 3
	step 12, 2
	step 33, 1
	step_end
	.balign 4, 0
