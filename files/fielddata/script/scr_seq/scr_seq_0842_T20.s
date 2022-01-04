#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T20.h"
#include "msgdata/msg/msg_0542_T20.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T20_000
	scrdef scr_seq_T20_001
	scrdef scr_seq_T20_002
	scrdef scr_seq_T20_003
	scrdef scr_seq_T20_004
	scrdef scr_seq_T20_005
	scrdef scr_seq_T20_006
	scrdef scr_seq_T20_007
	scrdef scr_seq_T20_008
	scrdef scr_seq_T20_009
	scrdef scr_seq_T20_010
	scrdef scr_seq_T20_011
	scrdef scr_seq_T20_012
	scrdef scr_seq_T20_013
	scrdef scr_seq_T20_014
	scrdef scr_seq_T20_015
	scrdef scr_seq_T20_016
	scrdef scr_seq_T20_017
	scrdef_end

scr_seq_T20_006:
	get_friend_sprite VAR_OBJ_0
	checkflag FLAG_UNK_189
	gotoif FALSE, _005F
	clearflag FLAG_UNK_189
	end

_005F:
	setvar VAR_TEMP_x4007, 0
	check_badge 2, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, _0089
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, _008F
_0089:
	setflag FLAG_HIDE_CAMERON
	end

_008F:
	clearflag FLAG_HIDE_CAMERON
	end

scr_seq_T20_009:
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 1
	gotoif eq, _00A4
	end

_00A4:
	clearflag FLAG_HIDE_NEW_BARK_FRIEND
	show_person obj_T20_var_1
	clearflag FLAG_HIDE_NEW_BARK_MARILL
	show_person obj_T20_tsure_poke_611
	move_person obj_T20_var_1, 686, 0, 396, 2
	move_person obj_T20_tsure_poke_611, 685, 0, 396, 1
	end

scr_seq_T20_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0542_T20_00013
	closemsg
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _00F8
	apply_movement obj_T20_gsrivel, _024C
	goto _0128

_00F8:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0113
	apply_movement obj_T20_gsrivel, _0244
	goto _0128

_0113:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0128
	apply_movement obj_T20_gsrivel, _0254
_0128:
	wait_movement
	npc_msg msg_0542_T20_00014
	closemsg
	checkflag FLAG_GOT_STARTER
	gotoif FALSE, _0166
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0153
	goto _01BA
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
_0153:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0166
	goto _0192

_0166:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _017F
	goto _0202
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
_017F:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0192
	goto _01E2

_0192:
	apply_movement obj_T20_gsrivel, _0264
	apply_movement obj_partner_poke, _0224
	apply_movement obj_player, _0288
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end

_01BA:
	apply_movement obj_T20_gsrivel, _02A0
	apply_movement obj_partner_poke, _0234
	apply_movement obj_player, _02B8
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end

_01E2:
	apply_movement obj_T20_gsrivel, _0264
	apply_movement obj_player, _0288
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end

_0202:
	apply_movement obj_T20_gsrivel, _02A0
	apply_movement obj_player, _02B8
	wait_movement
	apply_movement obj_T20_gsrivel, _0274
	wait_movement
	releaseall
	end
	.byte 0x00, 0x00

_0224:
	step 71, 1
	step 77, 4
	step 72, 1
	step_end

_0234:
	step 71, 1
	step 77, 6
	step 72, 1
	step_end

_0244:
	step 32, 1
	step_end

_024C:
	step 33, 1
	step_end

_0254:
	step 34, 1
	step_end
	.byte 0x23, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00

_0264:
	step 78, 1
	step 1, 1
	step 77, 2
	step_end

_0274:
	step 0, 1
	step 12, 2
	step 3, 1
	step 15, 1
	step_end

_0288:
	step 0, 1
	step 71, 1
	step 77, 2
	step 57, 1
	step 72, 1
	step_end

_02A0:
	step 76, 1
	step 2, 1
	step 78, 1
	step 1, 1
	step 77, 3
	step_end

_02B8:
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
scr_seq_T20_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 0
	gotoif ne, _02FE
	npc_msg msg_0542_T20_00009
	goto _0347

_02FE:
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 1
	gotoif ne, _0314
	npc_msg msg_0542_T20_00005
	goto _0347

_0314:
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 2
	gotoif ne, _032A
	npc_msg msg_0542_T20_00005
	goto _0347

_032A:
	comparevartovalue VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	gotoif ne, _0340
	npc_msg msg_0542_T20_00000
	goto _0347

_0340:
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00006, msg_0542_T20_00007
_0347:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T20_002:
	scrcmd_609
	lockall
	checkflag FLAG_GOT_POKEGEAR
	gotoif TRUE, _075A
	apply_movement obj_T20_gswoman1, _09B8
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00001, msg_0542_T20_00002
	wait 20, VAR_SPECIAL_x800C
	closemsg
	apply_movement obj_player, _09D4
	wait_movement
	comparevartovalue VAR_SCENE_NEW_BARK_TOWN_OW, 2
	gotoif eq, _054E
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, _03AF
	apply_movement obj_T20_gswoman1, _0A1C
	goto _044B

_03AF:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, _03CA
	apply_movement obj_T20_gswoman1, _0A2C
	goto _044B

_03CA:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, _03E5
	apply_movement obj_T20_gswoman1, _0A3C
	goto _044B

_03E5:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, _0400
	apply_movement obj_T20_gswoman1, _0A4C
	goto _044B

_0400:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, _041B
	apply_movement obj_T20_gswoman1, _0A54
	goto _044B

_041B:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, _0436
	apply_movement obj_T20_gswoman1, _0A64
	goto _044B

_0436:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, _044B
	apply_movement obj_T20_gswoman1, _0A74
_044B:
	wait_movement
	npc_msg msg_0542_T20_00003
	closemsg
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, _0475
	apply_movement obj_T20_gswoman1, _0AEC
	apply_movement obj_player, _0BD4
	goto _0541

_0475:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, _0498
	apply_movement obj_T20_gswoman1, _0B00
	apply_movement obj_player, _0BE4
	goto _0541

_0498:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, _04BB
	apply_movement obj_T20_gswoman1, _0B14
	apply_movement obj_player, _0BF4
	goto _0541

_04BB:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, _04DE
	apply_movement obj_T20_gswoman1, _0B28
	apply_movement obj_player, _0C04
	goto _0541

_04DE:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, _0501
	apply_movement obj_T20_gswoman1, _0B34
	apply_movement obj_player, _0C0C
	goto _0541

_0501:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, _0524
	apply_movement obj_T20_gswoman1, _0B48
	apply_movement obj_player, _0C1C
	goto _0541

_0524:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, _0541
	apply_movement obj_T20_gswoman1, _0B58
	apply_movement obj_player, _0C2C
_0541:
	wait_movement
	npc_msg msg_0542_T20_00004
	waitbutton
	closemsg
	releaseall
	end

_054E:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, _0577
	apply_movement obj_player, _09E8
	apply_movement obj_T20_gswoman1, _0A84
	goto _0643

_0577:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, _059A
	apply_movement obj_player, _09E8
	apply_movement obj_T20_gswoman1, _0A90
	goto _0643

_059A:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, _05BD
	apply_movement obj_player, _09E8
	apply_movement obj_T20_gswoman1, _0A9C
	goto _0643

_05BD:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, _05E0
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0AA8
	goto _0643

_05E0:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, _0603
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0ABC
	goto _0643

_0603:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, _0626
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0AC8
	goto _0643

_0626:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, _0643
	apply_movement obj_player, _09DC
	apply_movement obj_T20_gswoman1, _0AD4
_0643:
	wait_movement
	npc_msg msg_0542_T20_00010
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, _0677
	apply_movement obj_T20_gswoman1, _0B68
	apply_movement obj_player, _0C3C
	goto _0743

_0677:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, _069A
	apply_movement obj_T20_gswoman1, _0B78
	apply_movement obj_player, _0C48
	goto _0743

_069A:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, _06BD
	apply_movement obj_T20_gswoman1, _0B88
	apply_movement obj_player, _0C54
	goto _0743

_06BD:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, _06E0
	apply_movement obj_T20_gswoman1, _0B94
	apply_movement obj_player, _0C60
	goto _0743

_06E0:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, _0703
	apply_movement obj_T20_gswoman1, _0BA8
	apply_movement obj_player, _0C74
	goto _0743

_0703:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, _0726
	apply_movement obj_T20_gswoman1, _0BB4
	apply_movement obj_player, _0C80
	goto _0743

_0726:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, _0743
	apply_movement obj_T20_gswoman1, _0BC4
	apply_movement obj_player, _0C8C
_0743:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg msg_0542_T20_00011
	waitbutton
	closemsg
	releaseall
	end

_075A:
	scrcmd_307 21, 12, 12, 9, 77
	scrcmd_310 77
	scrcmd_308 77
	show_person obj_T20_doctor
	move_person obj_T20_doctor, 684, 0, 393, 1
	apply_movement obj_T20_doctor, _0D08
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	npc_msg msg_0542_T20_00017
	closemsg
	apply_movement obj_player, _09C8
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, _07C6
	apply_movement obj_T20_doctor, _0C98
	apply_movement obj_player, _09FC
	goto _0892

_07C6:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, _07E9
	apply_movement obj_T20_doctor, _0CA8
	apply_movement obj_player, _0A0C
	goto _0892

_07E9:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, _080C
	apply_movement obj_T20_doctor, _0CB8
	apply_movement obj_player, _0A0C
	goto _0892

_080C:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, _082F
	apply_movement obj_T20_doctor, _0CC8
	apply_movement obj_player, _0A0C
	goto _0892

_082F:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, _0852
	apply_movement obj_T20_doctor, _0CD8
	apply_movement obj_player, _0A0C
	goto _0892

_0852:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, _0875
	apply_movement obj_T20_doctor, _0CE8
	apply_movement obj_player, _09F4
	goto _0892

_0875:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, _0892
	apply_movement obj_T20_doctor, _0CF8
	apply_movement obj_player, _09F4
_0892:
	wait_movement
	npc_msg msg_0542_T20_00018
	register_gear_number 1
	buffer_players_name 0
	npc_msg msg_0542_T20_00019
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg msg_0542_T20_00020
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 396
	gotoif ne, _08D5
	apply_movement obj_player, _09D4
	apply_movement obj_T20_doctor, _0D18
	goto _0981

_08D5:
	comparevartovalue VAR_TEMP_x4001, 397
	gotoif ne, _08F8
	apply_movement obj_player, _09D4
	apply_movement obj_T20_doctor, _0D24
	goto _0981

_08F8:
	comparevartovalue VAR_TEMP_x4001, 398
	gotoif ne, _091B
	apply_movement obj_player, _09F4
	apply_movement obj_T20_doctor, _0D30
	goto _0981

_091B:
	comparevartovalue VAR_TEMP_x4001, 399
	gotoif ne, _0936
	apply_movement obj_T20_doctor, _0D40
	goto _0981

_0936:
	comparevartovalue VAR_TEMP_x4001, 400
	gotoif ne, _0951
	apply_movement obj_T20_doctor, _0D50
	goto _0981

_0951:
	comparevartovalue VAR_TEMP_x4001, 401
	gotoif ne, _096C
	apply_movement obj_T20_doctor, _0D60
	goto _0981

_096C:
	comparevartovalue VAR_TEMP_x4001, 402
	gotoif ne, _0981
	apply_movement obj_T20_doctor, _0D70
_0981:
	wait_movement
	scrcmd_307 21, 12, 12, 9, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T20_doctor, _0D10
	wait_movement
	hide_person obj_T20_doctor
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	setvar VAR_SCENE_NEW_BARK_WEST_EXIT, 1
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_09B8:
	step 34, 1
	step 75, 1
	step 63, 1
	step_end

_09C8:
	step 75, 1
	step 63, 1
	step_end

_09D4:
	step 3, 1
	step_end

_09DC:
	step 66, 2
	step 32, 1
	step_end

_09E8:
	step 66, 2
	step 33, 1
	step_end

_09F4:
	step 0, 1
	step_end

_09FC:
	step 3, 1
	step 66, 2
	step 1, 1
	step_end

_0A0C:
	step 3, 1
	step 66, 2
	step 0, 1
	step_end

_0A1C:
	step 14, 3
	step 12, 3
	step 14, 3
	step_end

_0A2C:
	step 14, 3
	step 12, 2
	step 14, 3
	step_end

_0A3C:
	step 14, 3
	step 12, 1
	step 14, 3
	step_end

_0A4C:
	step 14, 6
	step_end

_0A54:
	step 14, 3
	step 13, 1
	step 14, 3
	step_end

_0A64:
	step 14, 6
	step 13, 2
	step 2, 1
	step_end

_0A74:
	step 14, 6
	step 13, 3
	step 2, 1
	step_end

_0A84:
	step 14, 7
	step 12, 2
	step_end

_0A90:
	step 14, 7
	step 12, 1
	step_end

_0A9C:
	step 14, 7
	step 32, 1
	step_end

_0AA8:
	step 14, 3
	step 12, 1
	step 14, 4
	step 33, 1
	step_end

_0ABC:
	step 14, 7
	step 33, 1
	step_end

_0AC8:
	step 14, 7
	step 13, 1
	step_end

_0AD4:
	step 14, 7
	step 13, 2
	step_end
	.byte 0x0f, 0x00, 0x06, 0x00, 0x22, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_0AEC:
	step 15, 3
	step 13, 3
	step 15, 3
	step 34, 1
	step_end

_0B00:
	step 15, 3
	step 13, 2
	step 15, 3
	step 34, 1
	step_end

_0B14:
	step 15, 3
	step 13, 1
	step 15, 3
	step 34, 1
	step_end

_0B28:
	step 15, 6
	step 34, 1
	step_end

_0B34:
	step 15, 3
	step 12, 1
	step 15, 3
	step 34, 1
	step_end

_0B48:
	step 12, 2
	step 15, 6
	step 34, 1
	step_end

_0B58:
	step 12, 3
	step 15, 6
	step 34, 1
	step_end

_0B68:
	step 13, 2
	step 15, 7
	step 34, 1
	step_end

_0B78:
	step 13, 1
	step 15, 7
	step 34, 1
	step_end

_0B88:
	step 15, 7
	step 34, 1
	step_end

_0B94:
	step 15, 3
	step 13, 1
	step 15, 4
	step 34, 1
	step_end

_0BA8:
	step 15, 7
	step 34, 1
	step_end

_0BB4:
	step 12, 1
	step 15, 7
	step 34, 1
	step_end

_0BC4:
	step 12, 2
	step 15, 7
	step 34, 1
	step_end

_0BD4:
	step 15, 4
	step 13, 3
	step 15, 2
	step_end

_0BE4:
	step 15, 4
	step 13, 2
	step 15, 2
	step_end

_0BF4:
	step 15, 4
	step 13, 1
	step 15, 2
	step_end

_0C04:
	step 15, 6
	step_end

_0C0C:
	step 15, 4
	step 12, 1
	step 15, 2
	step_end

_0C1C:
	step 15, 1
	step 12, 2
	step 15, 5
	step_end

_0C2C:
	step 15, 1
	step 12, 3
	step 15, 5
	step_end

_0C3C:
	step 13, 3
	step 15, 6
	step_end

_0C48:
	step 13, 2
	step 15, 6
	step_end

_0C54:
	step 13, 1
	step 15, 6
	step_end

_0C60:
	step 12, 1
	step 15, 3
	step 13, 1
	step 15, 3
	step_end

_0C74:
	step 12, 1
	step 15, 6
	step_end

_0C80:
	step 12, 2
	step 15, 6
	step_end

_0C8C:
	step 12, 3
	step 15, 6
	step_end

_0C98:
	step 13, 3
	step 14, 8
	step 32, 1
	step_end

_0CA8:
	step 13, 2
	step 14, 8
	step 33, 1
	step_end

_0CB8:
	step 13, 2
	step 14, 8
	step 13, 1
	step_end

_0CC8:
	step 13, 2
	step 14, 8
	step 13, 2
	step_end

_0CD8:
	step 13, 2
	step 14, 8
	step 13, 3
	step_end

_0CE8:
	step 13, 2
	step 14, 8
	step 13, 4
	step_end

_0CF8:
	step 13, 2
	step 14, 8
	step 13, 5
	step_end

_0D08:
	step 13, 1
	step_end

_0D10:
	step 12, 1
	step_end

_0D18:
	step 15, 8
	step 12, 3
	step_end

_0D24:
	step 15, 8
	step 12, 2
	step_end

_0D30:
	step 12, 1
	step 15, 8
	step 12, 2
	step_end

_0D40:
	step 12, 2
	step 15, 8
	step 12, 2
	step_end

_0D50:
	step 12, 2
	step 15, 8
	step 12, 3
	step_end

_0D60:
	step 12, 2
	step 15, 8
	step 12, 4
	step_end

_0D70:
	step 12, 5
	step 15, 8
	step 12, 2
	step_end
scr_seq_T20_003:
	scrcmd_609
	lockall
	release obj_T20_tsure_poke_611
	apply_movement obj_T20_tsure_poke_611, _0E08
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_HIDE_NEW_BARK_FRIEND
	show_person obj_T20_var_1
	wait_se SEQ_SE_DP_KAIDAN2
	callstd std_play_friend_music
	apply_movement obj_T20_var_1, _0EA4
	wait_movement
	apply_movement obj_T20_tsure_poke_611, _0E38
	wait_movement
	apply_movement obj_player, _0E9C
	apply_movement obj_T20_var_1, _0EB8
	wait_movement
	apply_movement obj_T20_tsure_poke_611, _0E60
	wait_movement
	apply_movement obj_T20_var_1, _0EC0
	apply_movement obj_T20_tsure_poke_611, _0E68
	wait_movement
	callstd std_fade_end_friend_music
	setvar VAR_SCENE_PLAYERS_HOUSE_1F, 2
	hide_person obj_T20_tsure_poke_611
	hide_person obj_T20_var_1
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	releaseall
	end
	.byte 0x00, 0x00

_0E08:
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

_0E38:
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

_0E60:
	step 50, 4
	step_end

_0E68:
	step 2, 1
	step 14, 1
	step 1, 1
	step 13, 4
	step 2, 1
	step 14, 2
	step_end
	.byte 0x01, 0x00, 0x02, 0x00, 0x4b, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x0e, 0x00, 0x06, 0x00, 0xfe, 0x00, 0x00, 0x00

_0E9C:
	step 2, 4
	step_end

_0EA4:
	step 65, 1
	step 13, 6
	step 3, 1
	step 75, 1
	step_end

_0EB8:
	step 39, 4
	step_end

_0EC0:
	step 1, 1
	step 13, 4
	step 2, 1
	step 14, 2
	step_end
scr_seq_T20_007:
	buffer_players_name 0
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0542_T20_00035, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T20_008:
	scrcmd_609
	lockall
	callstd std_play_friend_music
	apply_movement obj_T20_var_1, _0F84
	apply_movement obj_T20_tsure_poke_611, _0FBC
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0FE8
	apply_movement obj_T20_var_1, _0FF4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	buffer_party_mon_species_name_indef 1, 0
	gender_msgbox msg_0542_T20_00015, msg_0542_T20_00016
	closemsg
	apply_movement obj_T20_var_1, _1000
	apply_movement obj_T20_tsure_poke_611, _1014
	apply_movement obj_player, _1038
	wait_movement
	apply_movement obj_T20_var_1, _1044
	apply_movement obj_T20_tsure_poke_611, _104C
	wait_movement
	hide_person obj_T20_tsure_poke_611
	hide_person obj_T20_var_1
	setflag FLAG_HIDE_NEW_BARK_MARILL
	setflag FLAG_HIDE_NEW_BARK_FRIEND
	callstd std_fade_end_friend_music
	setvar VAR_SCENE_NEW_BARK_TOWN_OW, 2
	releaseall
	end


_0F84:
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

_0FBC:
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

_0FE8:
	step 13, 2
	step 15, 1
	step_end

_0FF4:
	step 63, 1
	step 34, 1
	step_end

_1000:
	step 13, 1
	step 14, 2
	step 13, 5
	step 32, 1
	step_end

_1014:
	step 14, 1
	step 13, 1
	step 14, 2
	step 32, 1
	step 63, 3
	step 33, 1
	step 17, 4
	step 49, 2
	step_end

_1038:
	step 63, 2
	step 33, 1
	step_end

_1044:
	step 13, 3
	step_end

_104C:
	step 13, 4
	step_end
scr_seq_T20_010:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _1078
	scrcmd_596 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _1078
	scrcmd_600
_1078:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_176 62, 0, 12, 6, 2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_582 60, 688, 393
	setvar VAR_UNK_407C, 1
	end
	.byte 0x0d, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_T20_016:
	buffer_friends_name 0
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0542_T20_00035, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T20_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _11FC
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _1224
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	get_player_facing VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _114D
	apply_movement obj_player, _1238
	apply_movement obj_T20_gsmiddleman1, _1284
	goto _119B

_114D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _1168
	apply_movement obj_player, _1250
	goto _119B

_1168:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _118B
	apply_movement obj_player, _1270
	apply_movement obj_T20_gsmiddleman1, _1284
	goto _119B

_118B:
	apply_movement obj_player, _125C
	apply_movement obj_T20_gsmiddleman1, _1284
_119B:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _11C2
	apply_movement obj_partner_poke, _1290
	wait_movement
_11C2:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 0
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

_11FC:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end
	.byte 0xb6, 0x01, 0x02, 0x00, 0x0c, 0x80, 0xb8, 0x01, 0x0c, 0x80, 0x04, 0x00, 0x32, 0x00, 0x35, 0x00
	.byte 0x61, 0x00, 0x02, 0x00
_1224:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


_1238:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_1250:
	step 12, 3
	step 33, 1
	step_end

_125C:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

_1270:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

_1284:
	step 63, 1
	step 32, 1
	step_end

_1290:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_T20_011:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, _144F
	scrcmd_307 21, 12, 23, 12, 77
	scrcmd_310 77
	scrcmd_308 77
	play_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_HIDE_NEW_BARK_MOM
	show_person obj_T20_gsmama
	wait_se SEQ_SE_DP_KAIDAN2
	apply_movement obj_T20_gsmama, _1478
	wait_movement
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, _12F1
	buffer_players_name 0
	npc_msg msg_0542_T20_00021
	closemsg
_12F1:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, _132D
	apply_movement obj_T20_gsmama, _1480
	apply_movement obj_player, _14A4
	goto _13A6

_132D:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _1350
	apply_movement obj_T20_gsmama, _148C
	apply_movement obj_player, _14B0
	goto _13A6

_1350:
	comparevartovalue VAR_SPECIAL_x8005, 400
	gotoif ne, _1373
	apply_movement obj_T20_gsmama, _1498
	apply_movement obj_player, _14BC
	goto _13A6

_1373:
	comparevartovalue VAR_SPECIAL_x8005, 401
	gotoif ne, _1396
	apply_movement obj_T20_gsmama, _1498
	apply_movement obj_player, _14C8
	goto _13A6

_1396:
	apply_movement obj_T20_gsmama, _1498
	apply_movement obj_player, _14D8
_13A6:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, _13C8
	npc_msg msg_0542_T20_00022
	goto _13CB

_13C8:
	npc_msg msg_0542_T20_00023
_13CB:
	closemsg
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, _13EA
	apply_movement obj_T20_gsmama, _14E8
	wait_movement
	goto _1411

_13EA:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _1407
	apply_movement obj_T20_gsmama, _14F0
	wait_movement
	goto _1411

_1407:
	apply_movement obj_T20_gsmama, _14F8
	wait_movement
_1411:
	scrcmd_307 21, 12, 23, 12, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement obj_T20_gsmama, _1500
	wait_movement
	setflag FLAG_HIDE_NEW_BARK_MOM
	play_se SEQ_SE_DP_KAIDAN2
	hide_person obj_T20_gsmama
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	addvar VAR_TEMP_x4007, 1
	releaseall
	end

_144F:
	npc_msg msg_0542_T20_00024
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _1508
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	releaseall
	end
	.byte 0x00, 0x00

_1478:
	step 13, 1
	step_end

_1480:
	step 13, 1
	step 35, 1
	step_end

_148C:
	step 13, 2
	step 35, 1
	step_end

_1498:
	step 13, 3
	step 35, 1
	step_end

_14A4:
	step 34, 1
	step 14, 4
	step_end

_14B0:
	step 34, 1
	step 14, 4
	step_end

_14BC:
	step 34, 1
	step 14, 4
	step_end

_14C8:
	step 14, 2
	step 12, 1
	step 14, 2
	step_end

_14D8:
	step 14, 2
	step 12, 2
	step 14, 2
	step_end

_14E8:
	step 12, 1
	step_end

_14F0:
	step 12, 2
	step_end

_14F8:
	step 12, 3
	step_end

_1500:
	step 12, 1
	step_end

_1508:
	step 14, 1
	step_end
scr_seq_T20_012:
	scrcmd_609
	lockall
	apply_movement obj_T20_var_1_2, _1644
	wait_movement
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00027, msg_0542_T20_00028
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, _1552
	apply_movement obj_T20_var_1_2, _1650
	goto _15AB

_1552:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _156D
	apply_movement obj_T20_var_1_2, _1658
	goto _15AB

_156D:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _1588
	apply_movement obj_T20_var_1_2, _1660
	goto _15AB

_1588:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _15A3
	apply_movement obj_T20_var_1_2, _1668
	goto _15AB

_15A3:
	apply_movement obj_T20_var_1_2, _1670
_15AB:
	apply_movement obj_player, _1678
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox msg_0542_T20_00029, msg_0542_T20_00030
	closemsg
	comparevartovalue VAR_SPECIAL_x8005, 398
	gotoif ne, _15E3
	apply_movement obj_T20_var_1_2, _1680
	goto _163C

_15E3:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _15FE
	apply_movement obj_T20_var_1_2, _1688
	goto _163C

_15FE:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _1619
	apply_movement obj_T20_var_1_2, _1690
	goto _163C

_1619:
	comparevartovalue VAR_SPECIAL_x8005, 399
	gotoif ne, _1634
	apply_movement obj_T20_var_1_2, _1698
	goto _163C

_1634:
	apply_movement obj_T20_var_1_2, _16A0
_163C:
	wait_movement
	releaseall
	end
	.byte 0x00, 0x00

_1644:
	step 3, 1
	step 75, 1
	step_end

_1650:
	step 35, 1
	step_end

_1658:
	step 35, 1
	step_end

_1660:
	step 15, 1
	step_end

_1668:
	step 35, 1
	step_end

_1670:
	step 35, 1
	step_end

_1678:
	step 14, 2
	step_end

_1680:
	step 34, 1
	step_end

_1688:
	step 34, 1
	step_end

_1690:
	step 34, 1
	step_end

_1698:
	step 34, 1
	step_end

_16A0:
	step 34, 1
	step_end
scr_seq_T20_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	gender_msgbox msg_0542_T20_00025, msg_0542_T20_00026
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T20_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_MARILL, 0
	npc_msg msg_0542_T20_00033
	wait_cry
	closemsg
	apply_movement obj_T20_tsure_poke_611_2, _16F4
	wait_movement
	apply_movement obj_T20_var_1_2, _1700
	wait_movement
	gender_msgbox msg_0542_T20_00031, msg_0542_T20_00032
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_16F4:
	step 47, 1
	step 47, 1
	step_end

_1700:
	step 34, 1
	step_end
scr_seq_T20_013:
	scrcmd_055 2, 0
	scrcmd_057 3
	scrcmd_058
	trainer_tips msg_0542_T20_00036, VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T20_014:
	direction_signpost msg_0542_T20_00034, 0, 11, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd std_signpost
	end

scr_seq_T20_015:
	buffer_players_name 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0542_T20_00012
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
