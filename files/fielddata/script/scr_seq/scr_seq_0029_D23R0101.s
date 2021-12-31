#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D23R0101.h"
#include "msgdata/msg/msg_0065_D23R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D23R0101_000
	scrdef scr_seq_D23R0101_001
	scrdef scr_seq_D23R0101_002
	scrdef scr_seq_D23R0101_003
	scrdef scr_seq_D23R0101_004
	scrdef scr_seq_D23R0101_005
	scrdef scr_seq_D23R0101_006
	scrdef scr_seq_D23R0101_007
	scrdef scr_seq_D23R0101_008
	scrdef scr_seq_D23R0101_009
	scrdef scr_seq_D23R0101_010
	scrdef_end

scr_seq_D23R0101_008:
	setflag FLAG_UNK_1BC
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, _004D
	clearflag FLAG_UNK_1BC
	goto _0085

_004D:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _0066
	goto _008B
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
_0066:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0081
	clearflag FLAG_UNK_1BC
	clearflag FLAG_UNK_1BD
	goto _0085

_0081:
	clearflag FLAG_UNK_1B8
_0085:
	setvar VAR_TEMP_x400A, 0
_008B:
	end

scr_seq_D23R0101_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, _00AB
	npc_msg msg_0065_D23R0101_00001
	goto _00DA

_00AB:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, _00C1
	npc_msg msg_0065_D23R0101_00001
	goto _00DA

_00C1:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _00D7
	npc_msg msg_0065_D23R0101_00002
	goto _00DA

_00D7:
	npc_msg msg_0065_D23R0101_00000
_00DA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0101_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0065_D23R0101_00014
	apply_movement obj_D23R0101_gsleader3, _036C
	wait_movement
	closemsg
	releaseall
	end

scr_seq_D23R0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif TRUE, _0243
	npc_msg msg_0065_D23R0101_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0221
	npc_msg msg_0065_D23R0101_00004
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00005
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00006
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00007
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg msg_0065_D23R0101_00008
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _022E
	wait 30, VAR_SPECIAL_x800C
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	touchscreen_menu_show
	npc_msg msg_0065_D23R0101_00009
	buffer_players_name 0
	npc_msg msg_0065_D23R0101_00010
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	closemsg
	register_pokegear_card 2
	setflag FLAG_UNK_08A
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_D23R0101_gsleader3, _0250
	apply_movement obj_player, _0270
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0065_D23R0101_00015
	closemsg
	apply_movement obj_D23R0101_gsleader3, _0264
	wait 24, VAR_SPECIAL_x800C
	apply_movement obj_player, _036C
	wait_movement
	hide_person obj_D23R0101_gsleader3
	setflag FLAG_UNK_318
	releaseall
	end

_0221:
	npc_msg msg_0065_D23R0101_00013
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_022E:
	play_se SEQ_SE_DP_BOX03
	wait_se SEQ_SE_DP_BOX03
	npc_msg msg_0065_D23R0101_00012
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_0243:
	npc_msg msg_0065_D23R0101_00011
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00

_0250:
	step 75, 1
	step 50, 2
	step 76, 3
	step 78, 1
	step_end

_0264:
	step 76, 1
	step 78, 10
	step_end

_0270:
	step 63, 6
	step 76, 1
	step 3, 1
	step_end
scr_seq_D23R0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0065_D23R0101_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0065_D23R0101_00017
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0101_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif eq, _02C2
	npc_msg msg_0065_D23R0101_00018
	waitbutton
	closemsg
	releaseall
	end

_02C2:
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif eq, _0316
	npc_msg msg_0065_D23R0101_00019
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _02F5
	apply_movement obj_D23R0101_rocketm, _0354
	goto _030A

_02F5:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _030A
	apply_movement obj_D23R0101_rocketm, _0360
_030A:
	wait_movement
	releaseall
	setvar VAR_TEMP_x400A, 1
	end

_0316:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0333
	setvar VAR_TEMP_x400B, 33
	goto _0346

_0333:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _0346
	setvar VAR_TEMP_x400B, 11
_0346:
	npc_msg msg_0065_D23R0101_00020
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0354:
	step 13, 1
	step 34, 1
	step_end

_0360:
	step 14, 1
	step 33, 1
	step_end

_036C:
	step 34, 1
	step_end
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x21, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_D23R0101_009:
	scrcmd_609
	lockall
	move_person 5, 13, 1, 6, 3
	callstd std_play_rival_intro_music
	get_person_coords 6, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _03D0
	apply_movement obj_D23R0101_gsrivel, _0670
	comparevartovalue VAR_TEMP_x400B, 33
	gotoif ne, _03CA
	apply_movement obj_D23R0101_rocketm, _069C
_03CA:
	goto _03FA

_03D0:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _03FA
	apply_movement obj_D23R0101_gsrivel, _067C
	comparevartovalue VAR_TEMP_x400B, 11
	gotoif ne, _03FA
	apply_movement obj_D23R0101_rocketm, _06A8
_03FA:
	wait_movement
	buffer_rivals_name 1
	npc_msg msg_0065_D23R0101_00021
	closemsg
	apply_movement obj_D23R0101_gsrivel, _0664
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _0431
	apply_movement obj_D23R0101_gsrivel, _0684
	apply_movement obj_D23R0101_rocketm, _06B4
	goto _044E

_0431:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _044E
	apply_movement obj_D23R0101_gsrivel, _0690
	apply_movement obj_D23R0101_rocketm, _06C8
_044E:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _046B
	apply_movement obj_player, _06E4
	goto _0480

_046B:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _0480
	apply_movement obj_player, _06EC
_0480:
	wait_movement
	buffer_players_name 0
	buffer_rivals_name 1
	npc_msg msg_0065_D23R0101_00022
	closemsg
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _04A8
	apply_movement obj_player, _06FC
	goto _04BD

_04A8:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _04BD
	apply_movement obj_player, _07BC
_04BD:
	wait 50, VAR_SPECIAL_x800C
	scrcmd_188 1
	scrcmd_189
	scrcmd_620 0
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _04E9
	apply_movement obj_D23R0101_rocketm, _0874
	goto _04FE

_04E9:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _04FE
	apply_movement obj_D23R0101_rocketm, _0890
_04FE:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _0523
	apply_movement obj_D23R0101_rocketm, _08AC
	apply_movement obj_D23R0101_gsrivel, _08BC
	goto _0540

_0523:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _0540
	apply_movement obj_D23R0101_rocketm, _08B4
	apply_movement obj_D23R0101_gsrivel, _08D4
_0540:
	wait_movement
	npc_msg msg_0065_D23R0101_00023
	closemsg
	trainer_battle TRAINER_TEAM_ROCKET_GRUNT_3, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0655
	npc_msg msg_0065_D23R0101_00024
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _0592
	apply_movement obj_D23R0101_rocketm, _08EC
	apply_movement obj_player, _0900
	goto _05AF

_0592:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _05AF
	apply_movement obj_D23R0101_rocketm, _08F4
	apply_movement obj_player, _0914
_05AF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person obj_D23R0101_rocketm
	callstd std_play_rival_outro_music
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _05DE
	apply_movement obj_D23R0101_gsrivel, _0928
	goto _05F3

_05DE:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _05F3
	apply_movement obj_D23R0101_gsrivel, _0930
_05F3:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, _0610
	apply_movement obj_player, _06DC
	goto _0625

_0610:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, _0625
	apply_movement obj_player, _06F4
_0625:
	wait_movement
	buffer_rivals_name 1
	npc_msg msg_0065_D23R0101_00025
	closemsg
	apply_movement obj_D23R0101_gsrivel, _0938
	wait_movement
	hide_person obj_D23R0101_gsrivel
	callstd std_fade_end_rival_outro_music
	releaseall
	setvar VAR_UNK_4077, 4
	setflag FLAG_UNK_1BD
	setvar VAR_UNK_409F, 1
	end

_0655:
	setvar VAR_UNK_4077, 2
	white_out
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0664:
	step 65, 1
	step 75, 1
	step_end

_0670:
	step 19, 9
	step 32, 1
	step_end

_067C:
	step 19, 9
	step_end

_0684:
	step 12, 1
	step 35, 1
	step_end

_0690:
	step 15, 1
	step 32, 1
	step_end

_069C:
	step 62, 9
	step 33, 1
	step_end

_06A8:
	step 62, 9
	step 34, 1
	step_end

_06B4:
	step 3, 1
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

_06C8:
	step 0, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_06DC:
	step 34, 1
	step_end

_06E4:
	step 35, 1
	step_end

_06EC:
	step 32, 1
	step_end

_06F4:
	step 33, 1
	step_end

_06FC:
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 62, 1
	step 2, 1
	step 62, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 60, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 60, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
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
	step 61, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 62, 1
	step 2, 1
	step_end

_07BC:
	step 62, 1
	step 2, 1
	step 62, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 0, 1
	step 61, 1
	step 3, 1
	step 60, 1
	step 1, 1
	step 60, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
	step 1, 1
	step 2, 1
	step 0, 1
	step 3, 1
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
	step 61, 1
	step 0, 1
	step 62, 1
	step 3, 1
	step 62, 1
	step 1, 1
	step_end

_0874:
	step 65, 1
	step 3, 1
	step 71, 1
	step 18, 2
	step 72, 1
	step 75, 1
	step_end

_0890:
	step 65, 1
	step 0, 1
	step 71, 1
	step 17, 2
	step 72, 1
	step 75, 1
	step_end

_08AC:
	step 19, 3
	step_end

_08B4:
	step 16, 3
	step_end

_08BC:
	step 62, 1
	step 0, 1
	step 71, 1
	step 17, 1
	step 72, 1
	step_end

_08D4:
	step 62, 1
	step 3, 1
	step 71, 1
	step 18, 1
	step 72, 1
	step_end

_08EC:
	step 15, 2
	step_end

_08F4:
	step 12, 1
	step 15, 1
	step_end

_0900:
	step 0, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step_end

_0914:
	step 3, 1
	step 71, 1
	step 14, 1
	step 72, 1
	step_end

_0928:
	step 35, 1
	step_end

_0930:
	step 32, 1
	step_end

_0938:
	step 14, 9
	step_end
scr_seq_D23R0101_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0065_D23R0101_00026
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0101_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0065_D23R0101_00027
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D23R0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4136, 0
	gotoif ne, _0B86
	checkflag FLAG_UNK_AA6
	gotoif TRUE, _09CF
	checkflag FLAG_UNK_AA5
	gotoif TRUE, _09AF
	npc_msg msg_0065_D23R0101_00028
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _09E5
	goto _09DA

_09AF:
	npc_msg msg_0065_D23R0101_00045
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _09E5
	goto _09DA
	.byte 0x02, 0x00
_09CF:
	npc_msg msg_0065_D23R0101_00029
	waitbutton
	closemsg
	releaseall
	end

_09DA:
	npc_msg msg_0065_D23R0101_00030
	waitbutton
	closemsg
	releaseall
	end

_09E5:
	setflag FLAG_UNK_AA5
	npc_msg msg_0065_D23R0101_00031
	scrcmd_503 32768
	scrcmd_541 0, VAR_SPECIAL_x8000, 2, 5
	npc_msg msg_0065_D23R0101_00032
	scrcmd_504 32769, 32770, 32771, 32768
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, _0A24
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif eq, _0A2F
	goto _0A3D

_0A24:
	npc_msg msg_0065_D23R0101_00035
	waitbutton
	closemsg
	releaseall
	end

_0A2F:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	npc_msg msg_0065_D23R0101_00033
	goto _0A4B

_0A3D:
	scrcmd_506 0, 32769
	npc_msg msg_0065_D23R0101_00034
	goto _0A4B

_0A4B:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0A94
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0A9F
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0AA8
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _0AB1
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _0ABA
	end

_0A94:
	npc_msg msg_0065_D23R0101_00036
	goto _0AC3
	.byte 0x02, 0x00
_0A9F:
	npc_msg msg_0065_D23R0101_00038
	goto _0AC3

_0AA8:
	npc_msg msg_0065_D23R0101_00039
	goto _0AC3

_0AB1:
	npc_msg msg_0065_D23R0101_00040
	goto _0AC3

_0ABA:
	npc_msg msg_0065_D23R0101_00041
	goto _0AC3

_0AC3:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _0B0C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _0B1A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _0B26
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _0B32
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, _0B3E
	end

_0B0C:
	setvar VAR_SPECIAL_x8003, 2
	goto _0B4A
	.byte 0x02, 0x00
_0B1A:
	setvar VAR_SPECIAL_x8003, 51
	goto _0B4A

_0B26:
	setvar VAR_SPECIAL_x8003, 216
	goto _0B4A

_0B32:
	setvar VAR_SPECIAL_x8003, 29
	goto _0B4A

_0B3E:
	setvar VAR_SPECIAL_x8003, 1
	goto _0B4A

_0B4A:
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8003
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0B75
	callstd std_give_item_verbose
	goto _0B98

_0B75:
	copyvar VAR_UNK_4136, VAR_SPECIAL_x8002
	npc_msg msg_0065_D23R0101_00042
	waitbutton
	closemsg
	releaseall
	end

_0B86:
	buffer_players_name 0
	npc_msg msg_0065_D23R0101_00043
	copyvar VAR_SPECIAL_x8002, VAR_UNK_4136
	goto _0AC3

_0B98:
	setvar VAR_UNK_4136, 0
	setflag FLAG_UNK_AA6
	npc_msg msg_0065_D23R0101_00044
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
