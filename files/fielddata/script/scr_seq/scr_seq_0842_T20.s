#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0842_T20_00CE ; 000
	scrdef scr_seq_0842_T20_02E0 ; 001
	scrdef scr_seq_0842_T20_034F ; 002
	scrdef scr_seq_0842_T20_0D80 ; 003
	scrdef scr_seq_0842_T20_16A8 ; 004
	scrdef scr_seq_0842_T20_16BC ; 005
	scrdef scr_seq_0842_T20_004A ; 006
	scrdef scr_seq_0842_T20_0ED4 ; 007
	scrdef scr_seq_0842_T20_0EEC ; 008
	scrdef scr_seq_0842_T20_0095 ; 009
	scrdef scr_seq_0842_T20_1054 ; 010
	scrdef scr_seq_0842_T20_12A0 ; 011
	scrdef scr_seq_0842_T20_1510 ; 012
	scrdef scr_seq_0842_T20_1708 ; 013
	scrdef scr_seq_0842_T20_171D ; 014
	scrdef scr_seq_0842_T20_1734 ; 015
	scrdef scr_seq_0842_T20_10BC ; 016
	scrdef scr_seq_0842_T20_10D4 ; 017
	scrdef_end

scr_seq_0842_T20_004A:
	get_friend_sprite VAR_OBJ_0
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0842_T20_005F
	clearflag FLAG_UNK_189
	end

scr_seq_0842_T20_005F:
	setvar VAR_TEMP_x4007, 0
	check_badge 2, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_0842_T20_0089
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0842_T20_008F
scr_seq_0842_T20_0089:
	setflag FLAG_HIDE_CAMERON
	end

scr_seq_0842_T20_008F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_0842_T20_0095:
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 1
	gotoif eq, scr_seq_0842_T20_00A4
	end

scr_seq_0842_T20_00A4:
	clearflag FLAG_HIDE_NEW_BARK_FRIEND
	show_person 4
	clearflag FLAG_HIDE_NEW_BARK_MARILL
	show_person 3
	move_person 4, 686, 0, 396, 2
	move_person 3, 685, 0, 396, 1
	end

scr_seq_0842_T20_00CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 13
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0842_T20_00F8
	apply_movement 0, scr_seq_0842_T20_024C
	goto scr_seq_0842_T20_0128

scr_seq_0842_T20_00F8:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0842_T20_0113
	apply_movement 0, scr_seq_0842_T20_0244
	goto scr_seq_0842_T20_0128

scr_seq_0842_T20_0113:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0842_T20_0128
	apply_movement 0, scr_seq_0842_T20_0254
scr_seq_0842_T20_0128:
	wait_movement
	npc_msg 14
	closemsg
	checkflag FLAG_GOT_STARTER
	gotoif FALSE, scr_seq_0842_T20_0166
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0842_T20_0153
	goto scr_seq_0842_T20_01BA

scr_seq_0842_T20_014D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_0842_T20_0153:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0842_T20_0166
	goto scr_seq_0842_T20_0192

scr_seq_0842_T20_0166:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0842_T20_017F
	goto scr_seq_0842_T20_0202

scr_seq_0842_T20_0179:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0842_T20_017F:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0842_T20_0192
	goto scr_seq_0842_T20_01E2

scr_seq_0842_T20_0192:
	apply_movement 0, scr_seq_0842_T20_0264
	apply_movement 253, scr_seq_0842_T20_0224
	apply_movement 255, scr_seq_0842_T20_0288
	wait_movement
	apply_movement 0, scr_seq_0842_T20_0274
	wait_movement
	releaseall
	end

scr_seq_0842_T20_01BA:
	apply_movement 0, scr_seq_0842_T20_02A0
	apply_movement 253, scr_seq_0842_T20_0234
	apply_movement 255, scr_seq_0842_T20_02B8
	wait_movement
	apply_movement 0, scr_seq_0842_T20_0274
	wait_movement
	releaseall
	end

scr_seq_0842_T20_01E2:
	apply_movement 0, scr_seq_0842_T20_0264
	apply_movement 255, scr_seq_0842_T20_0288
	wait_movement
	apply_movement 0, scr_seq_0842_T20_0274
	wait_movement
	releaseall
	end

scr_seq_0842_T20_0202:
	apply_movement 0, scr_seq_0842_T20_02A0
	apply_movement 255, scr_seq_0842_T20_02B8
	wait_movement
	apply_movement 0, scr_seq_0842_T20_0274
	wait_movement
	releaseall
	end

scr_seq_0842_T20_0222:
	.byte 0x00, 0x00

scr_seq_0842_T20_0224:
	step 71, 1
	step 77, 4
	step 72, 1
	step_end

scr_seq_0842_T20_0234:
	step 71, 1
	step 77, 6
	step 72, 1
	step_end

scr_seq_0842_T20_0244:
	step 32, 1
	step_end

scr_seq_0842_T20_024C:
	step 33, 1
	step_end

scr_seq_0842_T20_0254:
	step 34, 1
	step_end
	.byte 0x23, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

scr_seq_0842_T20_0264:
	step 78, 1
	step 1, 1
	step 77, 2
	step_end

scr_seq_0842_T20_0274:
	step 0, 1
	step 12, 2
	step 3, 1
	step 15, 1
	step_end

scr_seq_0842_T20_0288:
	step 0, 1
	step 71, 1
	step 77, 2
	step 57, 1
	step 72, 1
	step_end

scr_seq_0842_T20_02A0:
	step 76, 1
	step 2, 1
	step 78, 1
	step 1, 1
	step 77, 3
	step_end

scr_seq_0842_T20_02B8:
	step 3, 1
	step 71, 1
	step 78, 1
	step 72, 1
	step 0, 1
	step 71, 1
	step 77, 3
	step 57, 1
	step 72, 1
	step_end
scr_seq_0842_T20_02E0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 0
	gotoif ne, scr_seq_0842_T20_02FE
	npc_msg 9
	goto scr_seq_0842_T20_0347

scr_seq_0842_T20_02FE:
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 1
	gotoif ne, scr_seq_0842_T20_0314
	npc_msg 5
	goto scr_seq_0842_T20_0347

scr_seq_0842_T20_0314:
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 2
	gotoif ne, scr_seq_0842_T20_032A
	npc_msg 5
	goto scr_seq_0842_T20_0347

scr_seq_0842_T20_032A:
	comparevartovalue VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	gotoif ne, scr_seq_0842_T20_0340
	npc_msg 0
	goto scr_seq_0842_T20_0347

scr_seq_0842_T20_0340:
	buffer_players_name 0
	gender_msgbox 6, 7
scr_seq_0842_T20_0347:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0842_T20_034F:
	scrcmd_609
	lockall
	checkflag FLAG_GOT_POKEGEAR
	gotoif TRUE, scr_seq_0842_T20_075A
	apply_movement 1, scr_seq_0842_T20_09B8
	wait_movement
	buffer_players_name 0
	gender_msgbox 1, 2
	wait 20, VAR_SPECIAL_x800C
	closemsg
	apply_movement 255, scr_seq_0842_T20_09D4
	wait_movement
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 2
	gotoif eq, scr_seq_0842_T20_054E
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0842_T20_03AF
	apply_movement 1, scr_seq_0842_T20_0A1C
	goto scr_seq_0842_T20_044B

scr_seq_0842_T20_03AF:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0842_T20_03CA
	apply_movement 1, scr_seq_0842_T20_0A2C
	goto scr_seq_0842_T20_044B

scr_seq_0842_T20_03CA:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0842_T20_03E5
	apply_movement 1, scr_seq_0842_T20_0A3C
	goto scr_seq_0842_T20_044B

scr_seq_0842_T20_03E5:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0842_T20_0400
	apply_movement 1, scr_seq_0842_T20_0A4C
	goto scr_seq_0842_T20_044B

scr_seq_0842_T20_0400:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0842_T20_041B
	apply_movement 1, scr_seq_0842_T20_0A54
	goto scr_seq_0842_T20_044B

scr_seq_0842_T20_041B:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0842_T20_0436
	apply_movement 1, scr_seq_0842_T20_0A64
	goto scr_seq_0842_T20_044B

scr_seq_0842_T20_0436:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0842_T20_044B
	apply_movement 1, scr_seq_0842_T20_0A74
scr_seq_0842_T20_044B:
	wait_movement
	npc_msg 3
	closemsg
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0842_T20_0475
	apply_movement 1, scr_seq_0842_T20_0AEC
	apply_movement 255, scr_seq_0842_T20_0BD4
	goto scr_seq_0842_T20_0541

scr_seq_0842_T20_0475:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0842_T20_0498
	apply_movement 1, scr_seq_0842_T20_0B00
	apply_movement 255, scr_seq_0842_T20_0BE4
	goto scr_seq_0842_T20_0541

scr_seq_0842_T20_0498:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0842_T20_04BB
	apply_movement 1, scr_seq_0842_T20_0B14
	apply_movement 255, scr_seq_0842_T20_0BF4
	goto scr_seq_0842_T20_0541

scr_seq_0842_T20_04BB:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0842_T20_04DE
	apply_movement 1, scr_seq_0842_T20_0B28
	apply_movement 255, scr_seq_0842_T20_0C04
	goto scr_seq_0842_T20_0541

scr_seq_0842_T20_04DE:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0842_T20_0501
	apply_movement 1, scr_seq_0842_T20_0B34
	apply_movement 255, scr_seq_0842_T20_0C0C
	goto scr_seq_0842_T20_0541

scr_seq_0842_T20_0501:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0842_T20_0524
	apply_movement 1, scr_seq_0842_T20_0B48
	apply_movement 255, scr_seq_0842_T20_0C1C
	goto scr_seq_0842_T20_0541

scr_seq_0842_T20_0524:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0842_T20_0541
	apply_movement 1, scr_seq_0842_T20_0B58
	apply_movement 255, scr_seq_0842_T20_0C2C
scr_seq_0842_T20_0541:
	wait_movement
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0842_T20_054E:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0842_T20_0577
	apply_movement 255, scr_seq_0842_T20_09E8
	apply_movement 1, scr_seq_0842_T20_0A84
	goto scr_seq_0842_T20_0643

scr_seq_0842_T20_0577:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0842_T20_059A
	apply_movement 255, scr_seq_0842_T20_09E8
	apply_movement 1, scr_seq_0842_T20_0A90
	goto scr_seq_0842_T20_0643

scr_seq_0842_T20_059A:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0842_T20_05BD
	apply_movement 255, scr_seq_0842_T20_09E8
	apply_movement 1, scr_seq_0842_T20_0A9C
	goto scr_seq_0842_T20_0643

scr_seq_0842_T20_05BD:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0842_T20_05E0
	apply_movement 255, scr_seq_0842_T20_09DC
	apply_movement 1, scr_seq_0842_T20_0AA8
	goto scr_seq_0842_T20_0643

scr_seq_0842_T20_05E0:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0842_T20_0603
	apply_movement 255, scr_seq_0842_T20_09DC
	apply_movement 1, scr_seq_0842_T20_0ABC
	goto scr_seq_0842_T20_0643

scr_seq_0842_T20_0603:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0842_T20_0626
	apply_movement 255, scr_seq_0842_T20_09DC
	apply_movement 1, scr_seq_0842_T20_0AC8
	goto scr_seq_0842_T20_0643

scr_seq_0842_T20_0626:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0842_T20_0643
	apply_movement 255, scr_seq_0842_T20_09DC
	apply_movement 1, scr_seq_0842_T20_0AD4
scr_seq_0842_T20_0643:
	wait_movement
	npc_msg 10
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0842_T20_0677
	apply_movement 1, scr_seq_0842_T20_0B68
	apply_movement 255, scr_seq_0842_T20_0C3C
	goto scr_seq_0842_T20_0743

scr_seq_0842_T20_0677:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0842_T20_069A
	apply_movement 1, scr_seq_0842_T20_0B78
	apply_movement 255, scr_seq_0842_T20_0C48
	goto scr_seq_0842_T20_0743

scr_seq_0842_T20_069A:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0842_T20_06BD
	apply_movement 1, scr_seq_0842_T20_0B88
	apply_movement 255, scr_seq_0842_T20_0C54
	goto scr_seq_0842_T20_0743

scr_seq_0842_T20_06BD:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0842_T20_06E0
	apply_movement 1, scr_seq_0842_T20_0B94
	apply_movement 255, scr_seq_0842_T20_0C60
	goto scr_seq_0842_T20_0743

scr_seq_0842_T20_06E0:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0842_T20_0703
	apply_movement 1, scr_seq_0842_T20_0BA8
	apply_movement 255, scr_seq_0842_T20_0C74
	goto scr_seq_0842_T20_0743

scr_seq_0842_T20_0703:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0842_T20_0726
	apply_movement 1, scr_seq_0842_T20_0BB4
	apply_movement 255, scr_seq_0842_T20_0C80
	goto scr_seq_0842_T20_0743

scr_seq_0842_T20_0726:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0842_T20_0743
	apply_movement 1, scr_seq_0842_T20_0BC4
	apply_movement 255, scr_seq_0842_T20_0C8C
scr_seq_0842_T20_0743:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0842_T20_075A:
	scrcmd_307 21, 12, 12, 9, 77
	scrcmd_310 77
	scrcmd_308 77
	show_person 5
	move_person 5, 684, 0, 393, 1
	apply_movement 5, scr_seq_0842_T20_0D08
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	npc_msg 17
	closemsg
	apply_movement 255, scr_seq_0842_T20_09C8
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0842_T20_07C6
	apply_movement 5, scr_seq_0842_T20_0C98
	apply_movement 255, scr_seq_0842_T20_09FC
	goto scr_seq_0842_T20_0892

scr_seq_0842_T20_07C6:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0842_T20_07E9
	apply_movement 5, scr_seq_0842_T20_0CA8
	apply_movement 255, scr_seq_0842_T20_0A0C
	goto scr_seq_0842_T20_0892

scr_seq_0842_T20_07E9:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0842_T20_080C
	apply_movement 5, scr_seq_0842_T20_0CB8
	apply_movement 255, scr_seq_0842_T20_0A0C
	goto scr_seq_0842_T20_0892

scr_seq_0842_T20_080C:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0842_T20_082F
	apply_movement 5, scr_seq_0842_T20_0CC8
	apply_movement 255, scr_seq_0842_T20_0A0C
	goto scr_seq_0842_T20_0892

scr_seq_0842_T20_082F:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0842_T20_0852
	apply_movement 5, scr_seq_0842_T20_0CD8
	apply_movement 255, scr_seq_0842_T20_0A0C
	goto scr_seq_0842_T20_0892

scr_seq_0842_T20_0852:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0842_T20_0875
	apply_movement 5, scr_seq_0842_T20_0CE8
	apply_movement 255, scr_seq_0842_T20_09F4
	goto scr_seq_0842_T20_0892

scr_seq_0842_T20_0875:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0842_T20_0892
	apply_movement 5, scr_seq_0842_T20_0CF8
	apply_movement 255, scr_seq_0842_T20_09F4
scr_seq_0842_T20_0892:
	wait_movement
	npc_msg 18
	register_gear_number 1
	buffer_players_name 0
	npc_msg 19
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg 20
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, scr_seq_0842_T20_08D5
	apply_movement 255, scr_seq_0842_T20_09D4
	apply_movement 5, scr_seq_0842_T20_0D18
	goto scr_seq_0842_T20_0981

scr_seq_0842_T20_08D5:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, scr_seq_0842_T20_08F8
	apply_movement 255, scr_seq_0842_T20_09D4
	apply_movement 5, scr_seq_0842_T20_0D24
	goto scr_seq_0842_T20_0981

scr_seq_0842_T20_08F8:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, scr_seq_0842_T20_091B
	apply_movement 255, scr_seq_0842_T20_09F4
	apply_movement 5, scr_seq_0842_T20_0D30
	goto scr_seq_0842_T20_0981

scr_seq_0842_T20_091B:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, scr_seq_0842_T20_0936
	apply_movement 5, scr_seq_0842_T20_0D40
	goto scr_seq_0842_T20_0981

scr_seq_0842_T20_0936:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, scr_seq_0842_T20_0951
	apply_movement 5, scr_seq_0842_T20_0D50
	goto scr_seq_0842_T20_0981

scr_seq_0842_T20_0951:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, scr_seq_0842_T20_096C
	apply_movement 5, scr_seq_0842_T20_0D60
	goto scr_seq_0842_T20_0981

scr_seq_0842_T20_096C:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, scr_seq_0842_T20_0981
	apply_movement 5, scr_seq_0842_T20_0D70
scr_seq_0842_T20_0981:
	wait_movement
	scrcmd_307 21, 12, 12, 9, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 5, scr_seq_0842_T20_0D10
	wait_movement
	hide_person 5
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	setvar VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	releaseall
	end

scr_seq_0842_T20_09B5:
	.byte 0x00, 0x00, 0x00

scr_seq_0842_T20_09B8:
	step 34, 1
	step 75, 1
	step 63, 1
	step_end

scr_seq_0842_T20_09C8:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0842_T20_09D4:
	step 3, 1
	step_end

scr_seq_0842_T20_09DC:
	step 66, 2
	step 32, 1
	step_end

scr_seq_0842_T20_09E8:
	step 66, 2
	step 33, 1
	step_end

scr_seq_0842_T20_09F4:
	step 0, 1
	step_end

scr_seq_0842_T20_09FC:
	step 3, 1
	step 66, 2
	step 1, 1
	step_end

scr_seq_0842_T20_0A0C:
	step 3, 1
	step 66, 2
	step 0, 1
	step_end

scr_seq_0842_T20_0A1C:
	step 14, 3
	step 12, 3
	step 14, 3
	step_end

scr_seq_0842_T20_0A2C:
	step 14, 3
	step 12, 2
	step 14, 3
	step_end

scr_seq_0842_T20_0A3C:
	step 14, 3
	step 12, 1
	step 14, 3
	step_end

scr_seq_0842_T20_0A4C:
	step 14, 6
	step_end

scr_seq_0842_T20_0A54:
	step 14, 3
	step 13, 1
	step 14, 3
	step_end

scr_seq_0842_T20_0A64:
	step 14, 6
	step 13, 2
	step 2, 1
	step_end

scr_seq_0842_T20_0A74:
	step 14, 6
	step 13, 3
	step 2, 1
	step_end

scr_seq_0842_T20_0A84:
	step 14, 7
	step 12, 2
	step_end

scr_seq_0842_T20_0A90:
	step 14, 7
	step 12, 1
	step_end

scr_seq_0842_T20_0A9C:
	step 14, 7
	step 32, 1
	step_end

scr_seq_0842_T20_0AA8:
	step 14, 3
	step 12, 1
	step 14, 4
	step 33, 1
	step_end

scr_seq_0842_T20_0ABC:
	step 14, 7
	step 33, 1
	step_end

scr_seq_0842_T20_0AC8:
	step 14, 7
	step 13, 1
	step_end

scr_seq_0842_T20_0AD4:
	step 14, 7
	step 13, 2
	step_end
	.byte 0x0f, 0x00, 0x06, 0x00, 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0842_T20_0AEC:
	step 15, 3
	step 13, 3
	step 15, 3
	step 34, 1
	step_end

scr_seq_0842_T20_0B00:
	step 15, 3
	step 13, 2
	step 15, 3
	step 34, 1
	step_end

scr_seq_0842_T20_0B14:
	step 15, 3
	step 13, 1
	step 15, 3
	step 34, 1
	step_end

scr_seq_0842_T20_0B28:
	step 15, 6
	step 34, 1
	step_end

scr_seq_0842_T20_0B34:
	step 15, 3
	step 12, 1
	step 15, 3
	step 34, 1
	step_end

scr_seq_0842_T20_0B48:
	step 12, 2
	step 15, 6
	step 34, 1
	step_end

scr_seq_0842_T20_0B58:
	step 12, 3
	step 15, 6
	step 34, 1
	step_end

scr_seq_0842_T20_0B68:
	step 13, 2
	step 15, 7
	step 34, 1
	step_end

scr_seq_0842_T20_0B78:
	step 13, 1
	step 15, 7
	step 34, 1
	step_end

scr_seq_0842_T20_0B88:
	step 15, 7
	step 34, 1
	step_end

scr_seq_0842_T20_0B94:
	step 15, 3
	step 13, 1
	step 15, 4
	step 34, 1
	step_end

scr_seq_0842_T20_0BA8:
	step 15, 7
	step 34, 1
	step_end

scr_seq_0842_T20_0BB4:
	step 12, 1
	step 15, 7
	step 34, 1
	step_end

scr_seq_0842_T20_0BC4:
	step 12, 2
	step 15, 7
	step 34, 1
	step_end

scr_seq_0842_T20_0BD4:
	step 15, 4
	step 13, 3
	step 15, 2
	step_end

scr_seq_0842_T20_0BE4:
	step 15, 4
	step 13, 2
	step 15, 2
	step_end

scr_seq_0842_T20_0BF4:
	step 15, 4
	step 13, 1
	step 15, 2
	step_end

scr_seq_0842_T20_0C04:
	step 15, 6
	step_end

scr_seq_0842_T20_0C0C:
	step 15, 4
	step 12, 1
	step 15, 2
	step_end

scr_seq_0842_T20_0C1C:
	step 15, 1
	step 12, 2
	step 15, 5
	step_end

scr_seq_0842_T20_0C2C:
	step 15, 1
	step 12, 3
	step 15, 5
	step_end

scr_seq_0842_T20_0C3C:
	step 13, 3
	step 15, 6
	step_end

scr_seq_0842_T20_0C48:
	step 13, 2
	step 15, 6
	step_end

scr_seq_0842_T20_0C54:
	step 13, 1
	step 15, 6
	step_end

scr_seq_0842_T20_0C60:
	step 12, 1
	step 15, 3
	step 13, 1
	step 15, 3
	step_end

scr_seq_0842_T20_0C74:
	step 12, 1
	step 15, 6
	step_end

scr_seq_0842_T20_0C80:
	step 12, 2
	step 15, 6
	step_end

scr_seq_0842_T20_0C8C:
	step 12, 3
	step 15, 6
	step_end

scr_seq_0842_T20_0C98:
	step 13, 3
	step 14, 8
	step 32, 1
	step_end

scr_seq_0842_T20_0CA8:
	step 13, 2
	step 14, 8
	step 33, 1
	step_end

scr_seq_0842_T20_0CB8:
	step 13, 2
	step 14, 8
	step 13, 1
	step_end

scr_seq_0842_T20_0CC8:
	step 13, 2
	step 14, 8
	step 13, 2
	step_end

scr_seq_0842_T20_0CD8:
	step 13, 2
	step 14, 8
	step 13, 3
	step_end

scr_seq_0842_T20_0CE8:
	step 13, 2
	step 14, 8
	step 13, 4
	step_end

scr_seq_0842_T20_0CF8:
	step 13, 2
	step 14, 8
	step 13, 5
	step_end

scr_seq_0842_T20_0D08:
	step 13, 1
	step_end

scr_seq_0842_T20_0D10:
	step 12, 1
	step_end

scr_seq_0842_T20_0D18:
	step 15, 8
	step 12, 3
	step_end

scr_seq_0842_T20_0D24:
	step 15, 8
	step 12, 2
	step_end

scr_seq_0842_T20_0D30:
	step 12, 1
	step 15, 8
	step 12, 2
	step_end

scr_seq_0842_T20_0D40:
	step 12, 2
	step 15, 8
	step 12, 2
	step_end

scr_seq_0842_T20_0D50:
	step 12, 2
	step 15, 8
	step 12, 3
	step_end

scr_seq_0842_T20_0D60:
	step 12, 2
	step 15, 8
	step 12, 4
	step_end

scr_seq_0842_T20_0D70:
	step 12, 5
	step 15, 8
	step 12, 2
	step_end
scr_seq_0842_T20_0D80:
	scrcmd_609
	lockall
	release 3
	apply_movement 3, scr_seq_0842_T20_0E08
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_HIDE_NEW_BARK_FRIEND
	show_person 4
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_play_friend_music
	apply_movement 4, scr_seq_0842_T20_0EA4
	wait_movement
	apply_movement 3, scr_seq_0842_T20_0E38
	wait_movement
	apply_movement 255, scr_seq_0842_T20_0E9C
	apply_movement 4, scr_seq_0842_T20_0EB8
	wait_movement
	apply_movement 3, scr_seq_0842_T20_0E60
	wait_movement
	apply_movement 4, scr_seq_0842_T20_0EC0
	apply_movement 3, scr_seq_0842_T20_0E68
	wait_movement
	callstd std_fade_end_friend_music
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 2
	hide_person 3
	hide_person 4
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	releaseall
	end

scr_seq_0842_T20_0E06:
	.byte 0x00, 0x00

scr_seq_0842_T20_0E08:
	step 66, 1
	step 16, 8
	step 71, 1
	step 53, 1
	step 72, 1
	step 3, 5
	step 0, 5
	step 2, 5
	step 0, 5
	step 12, 1
	step 66, 1
	step_end

scr_seq_0842_T20_0E38:
	step 2, 1
	step 75, 1
	step 36, 4
	step 1, 2
	step 3, 2
	step 0, 2
	step 2, 2
	step 38, 4
	step 18, 6
	step_end

scr_seq_0842_T20_0E60:
	step 50, 4
	step_end

scr_seq_0842_T20_0E68:
	step 2, 1
	step 14, 1
	step 1, 1
	step 13, 4
	step 2, 1
	step 14, 2
	step_end
	.byte 0x01, 0x00, 0x02, 0x00, 0x4b, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x0e, 0x00, 0x06, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0842_T20_0E9C:
	step 2, 4
	step_end

scr_seq_0842_T20_0EA4:
	step 65, 1
	step 13, 6
	step 3, 1
	step 75, 1
	step_end

scr_seq_0842_T20_0EB8:
	step 39, 4
	step_end

scr_seq_0842_T20_0EC0:
	step 1, 1
	step 13, 4
	step 2, 1
	step 14, 2
	step_end
scr_seq_0842_T20_0ED4:
	buffer_players_name 0
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0842_T20_0EEC:
	scrcmd_609
	lockall
	callstd std_play_friend_music
	apply_movement 4, scr_seq_0842_T20_0F84
	apply_movement 3, scr_seq_0842_T20_0FBC
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0842_T20_0FE8
	apply_movement 4, scr_seq_0842_T20_0FF4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	buffer_party_mon_species_name_indef 1, 0
	gender_msgbox 15, 16
	closemsg
	apply_movement 4, scr_seq_0842_T20_1000
	apply_movement 3, scr_seq_0842_T20_1014
	apply_movement 255, scr_seq_0842_T20_1038
	wait_movement
	apply_movement 4, scr_seq_0842_T20_1044
	apply_movement 3, scr_seq_0842_T20_104C
	wait_movement
	hide_person 3
	hide_person 4
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	callstd std_fade_end_friend_music
	setvar VAR_SCENE_NEW_BARK_TOWN_OW, 2
	releaseall
	end


scr_seq_0842_T20_0F84:
	step 62, 4
	step 62, 2
	step 37, 1
	step 62, 2
	step 39, 1
	step 62, 1
	step 36, 1
	step 62, 1
	step 37, 1
	step 62, 1
	step 36, 1
	step 62, 1
	step 75, 1
	step_end

scr_seq_0842_T20_0FBC:
	step 51, 3
	step 17, 1
	step 19, 2
	step 16, 2
	step 18, 2
	step 17, 2
	step 16, 2
	step 19, 2
	step 17, 1
	step 34, 1
	step_end

scr_seq_0842_T20_0FE8:
	step 13, 2
	step 15, 1
	step_end

scr_seq_0842_T20_0FF4:
	step 63, 1
	step 34, 1
	step_end

scr_seq_0842_T20_1000:
	step 13, 1
	step 14, 2
	step 13, 5
	step 32, 1
	step_end

scr_seq_0842_T20_1014:
	step 14, 1
	step 13, 1
	step 14, 2
	step 32, 1
	step 63, 3
	step 33, 1
	step 17, 4
	step 49, 2
	step_end

scr_seq_0842_T20_1038:
	step 63, 2
	step 33, 1
	step_end

scr_seq_0842_T20_1044:
	step 13, 3
	step_end

scr_seq_0842_T20_104C:
	step 13, 4
	step_end
scr_seq_0842_T20_1054:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0842_T20_1078
	scrcmd_596 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0842_T20_1078
	scrcmd_600
scr_seq_0842_T20_1078:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 62, 0, 12, 6, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_582 60, 688, 393
	setvar VAR_UNK_407C, 1
	end

scr_seq_0842_T20_10B4:
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0842_T20_10BC:
	scrcmd_192 0
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0842_T20_10D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0842_T20_11FC
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0842_T20_1224
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0842_T20_114D
	apply_movement 255, scr_seq_0842_T20_1238
	apply_movement 6, scr_seq_0842_T20_1284
	goto scr_seq_0842_T20_119B

scr_seq_0842_T20_114D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0842_T20_1168
	apply_movement 255, scr_seq_0842_T20_1250
	goto scr_seq_0842_T20_119B

scr_seq_0842_T20_1168:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0842_T20_118B
	apply_movement 255, scr_seq_0842_T20_1270
	apply_movement 6, scr_seq_0842_T20_1284
	goto scr_seq_0842_T20_119B

scr_seq_0842_T20_118B:
	apply_movement 255, scr_seq_0842_T20_125C
	apply_movement 6, scr_seq_0842_T20_1284
scr_seq_0842_T20_119B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0842_T20_11C2
	apply_movement 253, scr_seq_0842_T20_1290
	wait_movement
scr_seq_0842_T20_11C2:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 0
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0842_T20_11FC:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0842_T20_1210:
	.byte 0xb6, 0x01, 0x02, 0x00, 0x0c, 0x80, 0xb8, 0x01, 0x0c, 0x80, 0x04, 0x00, 0x32, 0x00, 0x35, 0x00
	.byte 0x61, 0x00, 0x02, 0x00
scr_seq_0842_T20_1224:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0842_T20_1238:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0842_T20_1250:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0842_T20_125C:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0842_T20_1270:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0842_T20_1284:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0842_T20_1290:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0842_T20_12A0:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, scr_seq_0842_T20_144F
	scrcmd_307 21, 12, 23, 12, 77
	scrcmd_310 77
	scrcmd_308 77
	play_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_HIDE_NEW_BARK_MOM
	show_person 7
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement 7, scr_seq_0842_T20_1478
	wait_movement
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0842_T20_12F1
	buffer_players_name 0
	npc_msg 21
	closemsg
scr_seq_0842_T20_12F1:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_0842_T20_132D
	apply_movement 7, scr_seq_0842_T20_1480
	apply_movement 255, scr_seq_0842_T20_14A4
	goto scr_seq_0842_T20_13A6

scr_seq_0842_T20_132D:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_1350
	apply_movement 7, scr_seq_0842_T20_148C
	apply_movement 255, scr_seq_0842_T20_14B0
	goto scr_seq_0842_T20_13A6

scr_seq_0842_T20_1350:
	comparevartovalue VAR_SPECIAL_x8005, 400
	gotoif ne, scr_seq_0842_T20_1373
	apply_movement 7, scr_seq_0842_T20_1498
	apply_movement 255, scr_seq_0842_T20_14BC
	goto scr_seq_0842_T20_13A6

scr_seq_0842_T20_1373:
	comparevartovalue VAR_SPECIAL_x8005, 401
	gotoif ne, scr_seq_0842_T20_1396
	apply_movement 7, scr_seq_0842_T20_1498
	apply_movement 255, scr_seq_0842_T20_14C8
	goto scr_seq_0842_T20_13A6

scr_seq_0842_T20_1396:
	apply_movement 7, scr_seq_0842_T20_1498
	apply_movement 255, scr_seq_0842_T20_14D8
scr_seq_0842_T20_13A6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0842_T20_13C8
	npc_msg 22
	goto scr_seq_0842_T20_13CB

scr_seq_0842_T20_13C8:
	npc_msg 23
scr_seq_0842_T20_13CB:
	closemsg
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_0842_T20_13EA
	apply_movement 7, scr_seq_0842_T20_14E8
	wait_movement
	goto scr_seq_0842_T20_1411

scr_seq_0842_T20_13EA:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_1407
	apply_movement 7, scr_seq_0842_T20_14F0
	wait_movement
	goto scr_seq_0842_T20_1411

scr_seq_0842_T20_1407:
	apply_movement 7, scr_seq_0842_T20_14F8
	wait_movement
scr_seq_0842_T20_1411:
	scrcmd_307 21, 12, 23, 12, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 7, scr_seq_0842_T20_1500
	wait_movement
	setflag FLAG_HIDE_NEW_BARK_MOM
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 7
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	addvar VAR_TEMP_x4007, 1
	releaseall
	end

scr_seq_0842_T20_144F:
	npc_msg 24
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0842_T20_1508
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end

scr_seq_0842_T20_1476:
	.byte 0x00, 0x00

scr_seq_0842_T20_1478:
	step 13, 1
	step_end

scr_seq_0842_T20_1480:
	step 13, 1
	step 35, 1
	step_end

scr_seq_0842_T20_148C:
	step 13, 2
	step 35, 1
	step_end

scr_seq_0842_T20_1498:
	step 13, 3
	step 35, 1
	step_end

scr_seq_0842_T20_14A4:
	step 34, 1
	step 14, 4
	step_end

scr_seq_0842_T20_14B0:
	step 34, 1
	step 14, 4
	step_end

scr_seq_0842_T20_14BC:
	step 34, 1
	step 14, 4
	step_end

scr_seq_0842_T20_14C8:
	step 14, 2
	step 12, 1
	step 14, 2
	step_end

scr_seq_0842_T20_14D8:
	step 14, 2
	step 12, 2
	step 14, 2
	step_end

scr_seq_0842_T20_14E8:
	step 12, 1
	step_end

scr_seq_0842_T20_14F0:
	step 12, 2
	step_end

scr_seq_0842_T20_14F8:
	step 12, 3
	step_end

scr_seq_0842_T20_1500:
	step 12, 1
	step_end

scr_seq_0842_T20_1508:
	step 14, 1
	step_end
scr_seq_0842_T20_1510:
	scrcmd_609
	lockall
	apply_movement 8, scr_seq_0842_T20_1644
	wait_movement
	buffer_players_name 0
	gender_msgbox 27, 28
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_0842_T20_1552
	apply_movement 8, scr_seq_0842_T20_1650
	goto scr_seq_0842_T20_15AB

scr_seq_0842_T20_1552:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_156D
	apply_movement 8, scr_seq_0842_T20_1658
	goto scr_seq_0842_T20_15AB

scr_seq_0842_T20_156D:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_1588
	apply_movement 8, scr_seq_0842_T20_1660
	goto scr_seq_0842_T20_15AB

scr_seq_0842_T20_1588:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_15A3
	apply_movement 8, scr_seq_0842_T20_1668
	goto scr_seq_0842_T20_15AB

scr_seq_0842_T20_15A3:
	apply_movement 8, scr_seq_0842_T20_1670
scr_seq_0842_T20_15AB:
	apply_movement 255, scr_seq_0842_T20_1678
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox 29, 30
	closemsg
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, scr_seq_0842_T20_15E3
	apply_movement 8, scr_seq_0842_T20_1680
	goto scr_seq_0842_T20_163C

scr_seq_0842_T20_15E3:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_15FE
	apply_movement 8, scr_seq_0842_T20_1688
	goto scr_seq_0842_T20_163C

scr_seq_0842_T20_15FE:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_1619
	apply_movement 8, scr_seq_0842_T20_1690
	goto scr_seq_0842_T20_163C

scr_seq_0842_T20_1619:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, scr_seq_0842_T20_1634
	apply_movement 8, scr_seq_0842_T20_1698
	goto scr_seq_0842_T20_163C

scr_seq_0842_T20_1634:
	apply_movement 8, scr_seq_0842_T20_16A0
scr_seq_0842_T20_163C:
	wait_movement
	releaseall
	end

scr_seq_0842_T20_1642:
	.byte 0x00, 0x00

scr_seq_0842_T20_1644:
	step 3, 1
	step 75, 1
	step_end

scr_seq_0842_T20_1650:
	step 35, 1
	step_end

scr_seq_0842_T20_1658:
	step 35, 1
	step_end

scr_seq_0842_T20_1660:
	step 15, 1
	step_end

scr_seq_0842_T20_1668:
	step 35, 1
	step_end

scr_seq_0842_T20_1670:
	step 35, 1
	step_end

scr_seq_0842_T20_1678:
	step 14, 2
	step_end

scr_seq_0842_T20_1680:
	step 34, 1
	step_end

scr_seq_0842_T20_1688:
	step 34, 1
	step_end

scr_seq_0842_T20_1690:
	step 34, 1
	step_end

scr_seq_0842_T20_1698:
	step 34, 1
	step_end

scr_seq_0842_T20_16A0:
	step 34, 1
	step_end
scr_seq_0842_T20_16A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	gender_msgbox 25, 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0842_T20_16BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 183, 0
	npc_msg 33
	scrcmd_077
	closemsg
	apply_movement 9, scr_seq_0842_T20_16F4
	wait_movement
	apply_movement 8, scr_seq_0842_T20_1700
	wait_movement
	gender_msgbox 31, 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0842_T20_16F1:
	.byte 0x00, 0x00, 0x00

scr_seq_0842_T20_16F4:
	step 47, 1
	step 47, 1
	step_end

scr_seq_0842_T20_1700:
	step 34, 1
	step_end
scr_seq_0842_T20_1708:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 36, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0842_T20_171D:
	scrcmd_055 34, 0, 11, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0842_T20_1734:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
