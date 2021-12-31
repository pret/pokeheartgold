#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27R0501.h"
#include "msgdata/msg/msg_0618_T27R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T27R0501_000
	scrdef scr_seq_T27R0501_001
	scrdef scr_seq_T27R0501_002
	scrdef scr_seq_T27R0501_003
	scrdef scr_seq_T27R0501_004
	scrdef scr_seq_T27R0501_005
	scrdef scr_seq_T27R0501_006
	scrdef scr_seq_T27R0501_007
	scrdef scr_seq_T27R0501_008
	scrdef scr_seq_T27R0501_009
	scrdef scr_seq_T27R0501_010
	scrdef scr_seq_T27R0501_011
	scrdef scr_seq_T27R0501_012
	scrdef scr_seq_T27R0501_013
	scrdef scr_seq_T27R0501_014
	scrdef scr_seq_T27R0501_015
	scrdef scr_seq_T27R0501_016
	scrdef_end

scr_seq_T27R0501_013:
	comparevartovalue VAR_UNK_410C, 1
	gotoif gt, _0057
	scrcmd_375 12
_0057:
	comparevartovalue VAR_UNK_410C, 0
	gotoif ne, _007C
	move_person 9, 6, 0, 6, 3
	move_person 6, 8, 0, 6, 2
_007C:
	comparevartovalue VAR_TEMP_x4009, 222
	gotoif ne, _0110
	move_person 9, 29, 0, 29, 1
	scrcmd_375 9
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _00BC
	move_person 12, 7, 0, 6, 1
	goto _0106

_00BC:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _00DB
	move_person 12, 7, 0, 6, 0
	goto _0106

_00DB:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _00FA
	move_person 12, 7, 0, 6, 3
	goto _0106

_00FA:
	move_person 12, 7, 0, 6, 2
_0106:
	scrcmd_374 12
	setvar VAR_TEMP_x4009, 0
_0110:
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, _0136
	comparevartovalue VAR_UNK_410C, 3
	gotoif ne, _0136
	move_person 6, 7, 0, 6, 1
_0136:
	end

scr_seq_T27R0501_015:
	scrcmd_609
	lockall
	npc_msg msg_0618_T27R0501_00000
	closemsg
	apply_movement obj_T27R0501_rocketm, _01CC
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, _01D4
	wait_movement
	wait 10, VAR_SPECIAL_x800C
	apply_movement obj_T27R0501_rocketm, _01F0
	wait_movement
	npc_msg msg_0618_T27R0501_00001
	closemsg
	apply_movement obj_T27R0501_dancer_3, _01F8
	wait_movement
	npc_msg msg_0618_T27R0501_00002
	closemsg
	apply_movement obj_T27R0501_rocketm, _0200
	wait_movement
	npc_msg msg_0618_T27R0501_00003
	closemsg
	apply_movement obj_T27R0501_dancer_3, _0208
	wait_movement
	npc_msg msg_0618_T27R0501_00004
	closemsg
	apply_movement obj_T27R0501_rocketm, _0218
	wait_movement
	apply_movement obj_T27R0501_rocketm, _0220
	apply_movement 241, _01DC
	wait_movement
	scrcmd_103
	releaseall
	setvar VAR_UNK_410C, 1
	end
	.byte 0x00

_01CC:
	step 3, 1
	step_end

_01D4:
	step 76, 9
	step_end

_01DC:
	step 66, 1
	step 77, 9
	step_end
	.byte 0x0c, 0x00, 0x03, 0x00, 0xfe, 0x00, 0x00, 0x00

_01F0:
	step 15, 1
	step_end

_01F8:
	step 38, 1
	step_end

_0200:
	step 51, 2
	step_end

_0208:
	step 71, 1
	step 15, 2
	step 72, 1
	step_end

_0218:
	step 33, 1
	step_end

_0220:
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step_end
scr_seq_T27R0501_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_ROCKET
	npc_msg msg_0618_T27R0501_00005
	closemsg
	setvar VAR_TEMP_x4009, 222
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_26, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _040C
	npc_msg msg_0618_T27R0501_00006
	closemsg
	scrcmd_386 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, _0354
	apply_movement obj_T27R0501_rocketm_2, _0414
	goto _0392

_0354:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, _036F
	apply_movement obj_T27R0501_rocketm_2, _0424
	goto _0392

_036F:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, _038A
	apply_movement obj_T27R0501_rocketm_2, _0434
	goto _0392

_038A:
	apply_movement obj_T27R0501_rocketm_2, _0444
_0392:
	wait_movement
	npc_msg msg_0618_T27R0501_00007
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, _03B4
	apply_movement obj_T27R0501_rocketm_2, _0454
	goto _03F2

_03B4:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, _03CF
	apply_movement obj_T27R0501_rocketm_2, _0460
	goto _03F2

_03CF:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, _03EA
	apply_movement obj_T27R0501_rocketm_2, _046C
	goto _03F2

_03EA:
	apply_movement obj_T27R0501_rocketm_2, _0478
_03F2:
	wait_movement
	hide_person obj_T27R0501_rocketm_2
	setflag FLAG_UNK_23A
	releaseall
	setvar VAR_UNK_410C, 2
	setvar VAR_TEMP_x400A, 10
	end

_040C:
	white_out
	releaseall
	end
	.byte 0x00, 0x00

_0414:
	step 71, 1
	step 12, 1
	step 72, 1
	step_end

_0424:
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_0434:
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

_0444:
	step 71, 1
	step 15, 1
	step 72, 1
	step_end

_0454:
	step 18, 4
	step 17, 12
	step_end

_0460:
	step 18, 4
	step 17, 10
	step_end

_046C:
	step 18, 3
	step 17, 10
	step_end

_0478:
	step 17, 1
	step 19, 3
	step 17, 9
	step_end
scr_seq_T27R0501_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, _04B5
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, _04C0
	npc_msg msg_0618_T27R0501_00010
	waitbutton
	closemsg
	releaseall
	end

_04B5:
	npc_msg msg_0618_T27R0501_00008
	waitbutton
	closemsg
	releaseall
	end

_04C0:
	buffer_players_name 0
	npc_msg msg_0618_T27R0501_00009
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_011:
	scrcmd_609
	lockall
	apply_movement obj_T27R0501_gsgentleman, _05B4
	wait_movement
	npc_msg msg_0618_T27R0501_00026
	setvar VAR_SPECIAL_x8004, 422
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05A9
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_410C, 3
	setvar VAR_UNK_4090, 1
	npc_msg msg_0618_T27R0501_00028
	closemsg
	apply_movement obj_T27R0501_gsgentleman, _05C4
	wait_movement
	releaseall
	end

scr_seq_T27R0501_012:
	scrcmd_609
	lockall
	apply_movement obj_T27R0501_gsgentleman, _05D8
	wait_movement
	npc_msg msg_0618_T27R0501_00026
	setvar VAR_SPECIAL_x8004, 422
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05A9
	callstd std_give_item_verbose
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_4090, 1
	setvar VAR_UNK_410C, 3
	npc_msg msg_0618_T27R0501_00028
	closemsg
	apply_movement obj_T27R0501_gsgentleman, _05E8
	wait_movement
	releaseall
	end

scr_seq_T27R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A2
	gotoif TRUE, _059E
	npc_msg msg_0618_T27R0501_00025
	waitbutton
	closemsg
	releaseall
	end

_059E:
	npc_msg msg_0618_T27R0501_00029
	waitbutton
	closemsg
	releaseall
	end

_05A9:
	callstd std_bag_is_full
	closemsg
	releaseall
	end
	.byte 0x00

_05B4:
	step 12, 1
	step 14, 5
	step 12, 2
	step_end

_05C4:
	step 13, 2
	step 15, 5
	step 13, 1
	step 0, 1
	step_end

_05D8:
	step 12, 1
	step 15, 3
	step 12, 2
	step_end

_05E8:
	step 13, 2
	step 14, 3
	step 13, 1
	step 0, 1
	step_end
scr_seq_T27R0501_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_PSYDUCK, 0
	npc_msg msg_0618_T27R0501_00030
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, _0644
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, _064F
	npc_msg msg_0618_T27R0501_00031
	waitbutton
	closemsg
	releaseall
	end

_0644:
	npc_msg msg_0618_T27R0501_00033
	waitbutton
	closemsg
	releaseall
	end

_064F:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, _0665
	npc_msg msg_0618_T27R0501_00032
	goto _067E

_0665:
	comparevartovalue VAR_TEMP_x400B, 1
	gotoif ne, _067B
	npc_msg msg_0618_T27R0501_00034
	goto _067E

_067B:
	npc_msg msg_0618_T27R0501_00035
_067E:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_TEMP_x400B, 2
	gotoif ge, _069D
	addvar VAR_TEMP_x400B, 1
	goto _06A3

_069D:
	setvar VAR_TEMP_x400B, 0
_06A3:
	end

scr_seq_T27R0501_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, _06D2
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, _06DD
	npc_msg msg_0618_T27R0501_00036
	waitbutton
	closemsg
	releaseall
	end

_06D2:
	npc_msg msg_0618_T27R0501_00038
	waitbutton
	closemsg
	releaseall
	end

_06DD:
	npc_msg msg_0618_T27R0501_00037
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0618_T27R0501_00039
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, _0724
	checkflag FLAG_UNK_109
	gotoif TRUE, _0724
	npc_msg msg_0618_T27R0501_00019
	waitbutton
	closemsg
	releaseall
	end

_0724:
	npc_msg msg_0618_T27R0501_00040
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, _0758
	checkflag FLAG_UNK_109
	gotoif TRUE, _0758
	npc_msg msg_0618_T27R0501_00019
	waitbutton
	closemsg
	releaseall
	end

_0758:
	npc_msg msg_0618_T27R0501_00041
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 77
	checkflag FLAG_UNK_108
	gotoif TRUE, _0868
	checkflag FLAG_UNK_109
	gotoif TRUE, _0868
	npc_msg msg_0618_T27R0501_00013
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x8004
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, _0BD3
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, _07BA
	goto _0944
	.byte 0x02, 0x00
_07BA:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _07DF
	apply_movement obj_player, _0828
	goto _080F

_07DF:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, _07FA
	apply_movement obj_player, _083C
	goto _080F

_07FA:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _080F
	apply_movement obj_player, _084C
_080F:
	apply_movement obj_T27R0501_dancer_6, _085C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return
	.byte 0x00, 0x00, 0x00

_0828:
	step 15, 1
	step 13, 2
	step 14, 1
	step 32, 1
	step_end

_083C:
	step 13, 1
	step 14, 1
	step 32, 1
	step_end

_084C:
	step 13, 1
	step 15, 1
	step 32, 1
	step_end

_085C:
	step 63, 2
	step 33, 1
	step_end
_0868:
	buffer_players_name 0
	npc_msg msg_0618_T27R0501_00042
	waitbutton
	closemsg
	setflag FLAG_UNK_107
	releaseall
	end

scr_seq_T27R0501_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, _08A3
	checkflag FLAG_UNK_109
	gotoif TRUE, _08A3
	npc_msg msg_0618_T27R0501_00019
	waitbutton
	closemsg
	releaseall
	end

_08A3:
	npc_msg msg_0618_T27R0501_00043
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, _08D7
	checkflag FLAG_UNK_109
	gotoif TRUE, _08D7
	npc_msg msg_0618_T27R0501_00019
	waitbutton
	closemsg
	releaseall
	end

_08D7:
	npc_msg msg_0618_T27R0501_00044
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T27R0501_016:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x8000, 11
	setvar VAR_UNK_410C, 5
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0BF4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, _092A
	npc_msg msg_0618_T27R0501_00011
	goto _092D

_092A:
	npc_msg msg_0618_T27R0501_00012
_092D:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x8004
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, _0BD3
	closemsg
_0944:
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_6, _0D74
	wait_movement
	npc_msg msg_0618_T27R0501_00045
	closemsg
	wait 10, VAR_SPECIAL_x800C
	trainer_battle TRAINER_KIMONO_GIRL_ZUKI, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0BC9
	apply_movement obj_T27R0501_dancer_6, _0C0C
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer, _0C18
	wait_movement
	npc_msg msg_0618_T27R0501_00015
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_NAOKO, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0BC9
	apply_movement obj_T27R0501_dancer, _0C48
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_5, _0C54
	wait_movement
	npc_msg msg_0618_T27R0501_00016
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_MIKI, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0BC9
	apply_movement obj_T27R0501_dancer_5, _0C84
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_2, _0C90
	wait_movement
	npc_msg msg_0618_T27R0501_00017
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_SAYO, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0BC9
	apply_movement obj_T27R0501_dancer_2, _0CBC
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement obj_T27R0501_dancer_4, _0CCC
	wait_movement
	npc_msg msg_0618_T27R0501_00018
	closemsg
	trainer_battle TRAINER_KIMONO_GIRL_KUNI, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0BC9
	apply_movement obj_T27R0501_dancer_4, _0CF8
	wait_movement
	apply_movement obj_T27R0501_dancer_6, _0D08
	wait_movement
	npc_msg msg_0618_T27R0501_00020
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, _0AA4
	setvar VAR_SPECIAL_x8004, 474
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_103
	goto _0AB8

_0AA4:
	setvar VAR_SPECIAL_x8004, 503
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	setflag FLAG_UNK_104
_0AB8:
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 6
	wait_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_240
	show_person obj_T27R0501_gsbabygirl1
	apply_movement obj_T27R0501_gsbabygirl1, _0D10
	wait_movement
	apply_movement obj_T27R0501_dancer_6, _0BEC
	wait_movement
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, _0B02
	npc_msg msg_0618_T27R0501_00021
	goto _0B05

_0B02:
	npc_msg msg_0618_T27R0501_00022
_0B05:
	closemsg
	apply_movement obj_T27R0501_dancer_6, _0BE4
	wait_movement
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, _0B2A
	npc_msg msg_0618_T27R0501_00023
	goto _0B2D

_0B2A:
	npc_msg msg_0618_T27R0501_00024
_0B2D:
	closemsg
	apply_movement obj_T27R0501_dancer, _0D1C
	apply_movement obj_T27R0501_dancer_2, _0D28
	apply_movement obj_T27R0501_dancer_6, _0D38
	apply_movement obj_T27R0501_dancer_4, _0D48
	apply_movement obj_T27R0501_dancer_5, _0D58
	apply_movement obj_T27R0501_gsbabygirl1, _0D64
	wait_movement
	hide_person obj_T27R0501_dancer
	hide_person obj_T27R0501_dancer_2
	hide_person obj_T27R0501_dancer_6
	hide_person obj_T27R0501_dancer_4
	hide_person obj_T27R0501_dancer_5
	hide_person obj_T27R0501_gsbabygirl1
	setflag FLAG_UNK_23C
	setflag FLAG_UNK_240
	call _0BB0
	setvar VAR_UNK_410C, 6
	setvar VAR_UNK_40FA, 1
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, _0BAA
	clearflag FLAG_UNK_244
	goto _0BAE

_0BAA:
	clearflag FLAG_UNK_245
_0BAE:
	end

_0BB0:
	comparevartovalue VAR_SPECIAL_x8000, 77
	gotoif ne, _0BC5
	releaseall
	goto _0BC7

_0BC5:
	releaseall
_0BC7:
	return

_0BC9:
	white_out
	call _0BB0
	end

_0BD3:
	npc_msg msg_0618_T27R0501_00014
	waitbutton
	closemsg
	call _0BB0
	end
	.byte 0x00, 0x00

_0BE4:
	step 75, 1
	step_end

_0BEC:
	step 34, 1
	step_end

_0BF4:
	step 12, 5
	step 14, 4
	step 12, 5
	step 15, 4
	step 32, 1
	step_end

_0C0C:
	step 12, 1
	step 33, 1
	step_end

_0C18:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 35, 1
	step 15, 5
	step 33, 1
	step_end

_0C48:
	step 14, 5
	step 33, 1
	step_end

_0C54:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 34, 1
	step 14, 5
	step 33, 1
	step_end

_0C84:
	step 15, 5
	step 33, 1
	step_end

_0C90:
	step 3, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 33, 1
	step 13, 1
	step 15, 3
	step 33, 1
	step_end

_0CBC:
	step 14, 3
	step 12, 1
	step 33, 1
	step_end

_0CCC:
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 33, 1
	step 13, 1
	step 14, 3
	step 33, 1
	step_end

_0CF8:
	step 15, 3
	step 12, 1
	step 33, 1
	step_end

_0D08:
	step 13, 1
	step_end

_0D10:
	step 16, 10
	step 19, 3
	step_end

_0D1C:
	step 15, 1
	step 13, 11
	step_end

_0D28:
	step 63, 1
	step 14, 1
	step 13, 12
	step_end

_0D38:
	step 63, 1
	step 15, 4
	step 13, 11
	step_end

_0D48:
	step 63, 1
	step 15, 1
	step 13, 12
	step_end

_0D58:
	step 14, 1
	step 13, 11
	step_end

_0D64:
	step 63, 2
	step 15, 5
	step 13, 11
	step_end

_0D74:
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 62, 1
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 33, 1
	step_end
	.balign 4, 0
