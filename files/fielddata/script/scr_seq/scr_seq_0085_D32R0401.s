#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0401.h"
#include "msgdata/msg/msg_0108_D32R0401.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0401_000
	scrdef scr_seq_D32R0401_001
	scrdef scr_seq_D32R0401_002
	scrdef scr_seq_D32R0401_003
	scrdef scr_seq_D32R0401_004
	scrdef scr_seq_D32R0401_005
	scrdef scr_seq_D32R0401_006
	scrdef scr_seq_D32R0401_007
	scrdef scr_seq_D32R0401_008
	scrdef scr_seq_D32R0401_009
	scrdef scr_seq_D32R0401_010
	scrdef scr_seq_D32R0401_011
	scrdef scr_seq_D32R0401_012
	scrdef scr_seq_D32R0401_013
	scrdef scr_seq_D32R0401_014
	scrdef scr_seq_D32R0401_015
	scrdef scr_seq_D32R0401_016
	scrdef scr_seq_D32R0401_017
	scrdef scr_seq_D32R0401_018
	scrdef scr_seq_D32R0401_019
	scrdef scr_seq_D32R0401_020
	scrdef scr_seq_D32R0401_021
	scrdef_end

scr_seq_D32R0401_021:
	scrcmd_693 16384
	comparevartovalue VAR_TEMP_x4000, 11
	callif ge, _0090
	comparevartovalue VAR_TEMP_x4000, 101
	callif ge, _007A
	end

_007A:
	scrcmd_338 11, 8, 11
	move_person 11, 8, 0, 11, 2
	return

_0090:
	scrcmd_338 11, 13, 11
	move_person 11, 13, 0, 11, 2
	return

scr_seq_D32R0401_020:
	comparevartovalue VAR_UNK_4145, 1
	gotoif eq, _00B5
	end

_00B5:
	scrcmd_380 VAR_TEMP_x4007, 100
	checkflag FLAG_UNK_234
	callif FALSE, _00D5
	comparevartovalue VAR_TEMP_x4007, 30
	gotoif lt, _00DF
	end

_00D5:
	hide_person obj_D32R0401_var_2
	setflag FLAG_UNK_234
	return

_00DF:
	checkflag FLAG_UNK_AA1
	gotoif FALSE, _00EC
	end

_00EC:
	setflag FLAG_UNK_AA1
	scrcmd_694 16392
	comparevartovalue VAR_TEMP_x4008, 10000
	gotoif ge, _011D
	comparevartovalue VAR_TEMP_x4008, 1000
	gotoif ge, _012B
	comparevartovalue VAR_TEMP_x4008, 500
	gotoif ge, _0139
	end

_011D:
	scrcmd_380 VAR_UNK_4053, 4
	goto _0147
	.byte 0x02, 0x00
_012B:
	scrcmd_380 VAR_UNK_4053, 2
	goto _0147
	.byte 0x02, 0x00
_0139:
	setvar VAR_UNK_4053, 0
	goto _0147
	.byte 0x02, 0x00
_0147:
	clearflag FLAG_UNK_234
	call _017D
	show_person obj_D32R0401_var_2
	end

scr_seq_D32R0401_015:
	get_player_gender VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	callif eq, _01FB
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, _0203
	call _017D
	end

_017D:
	comparevartovalue VAR_UNK_4053, 0
	callif eq, _01B3
	comparevartovalue VAR_UNK_4053, 1
	callif eq, _01E3
	comparevartovalue VAR_UNK_4053, 2
	callif eq, _01EB
	comparevartovalue VAR_UNK_4053, 3
	callif eq, _01F3
	return

_01B3:
	get_player_gender VAR_TEMP_x4009
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif eq, _01D3
	comparevartovalue VAR_TEMP_x4009, 1
	gotoif eq, _01DB
	return

_01D3:
	setvar VAR_OBJ_1, 97
	return

_01DB:
	setvar VAR_OBJ_1, 0
	return

_01E3:
	setvar VAR_OBJ_1, 365
	return

_01EB:
	setvar VAR_OBJ_1, 366
	return

_01F3:
	setvar VAR_OBJ_1, 354
	return

_01FB:
	setvar VAR_OBJ_9, 320
	return

_0203:
	setvar VAR_OBJ_9, 317
	return

scr_seq_D32R0401_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto _0243
	.byte 0x02, 0x00
scr_seq_D32R0401_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto _0243
	.byte 0x02, 0x00
_0243:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _0868
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _086D
	goto _0269
	.byte 0x02, 0x00
_0269:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _0872
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _0891
	menu_item_add 19, 255, 2
	menu_item_add 20, 255, 3
	menu_exec
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _030E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0331
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _02D3
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, _0354
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_02D3:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _08A8
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _08AD
	goto _0269
	.byte 0x02, 0x00
_02F5:
	goto _02FD
	.byte 0x02, 0x00
_02FD:
	setvar VAR_UNK_4145, 0
	npc_msg msg_0108_D32R0401_00006
	waitbutton
	closemsg
	releaseall
	end

_030E:
	setvar VAR_UNK_4146, 0
	scrcmd_633 0, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0377
	goto _03A1
	.byte 0x02
	.byte 0x00
_0331:
	setvar VAR_UNK_4146, 1
	scrcmd_633 0, 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _038C
	goto _03A1
	.byte 0x02, 0x00
_0354:
	setvar VAR_UNK_4146, 2
	scrcmd_633 0, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0377
	goto _03A1
	.byte 0x02, 0x00
_0377:
	npc_msg msg_0108_D32R0401_00035
	scrcmd_444 37, 1, 0, 0
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_038C:
	npc_msg msg_0108_D32R0401_00036
	scrcmd_444 37, 2, 0, 0
	touchscreen_menu_show
	goto _02F5
	.byte 0x02
	.byte 0x00
_03A1:
	npc_msg msg_0108_D32R0401_00033
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_633 4, 16710, 32780
	scrcmd_635 16386, 16389
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, _03D1
	scrcmd_815 0
_03D1:
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, _02F5
	scrcmd_690 VAR_TEMP_x4002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _07B9
	comparevartovalue VAR_UNK_4146, 1
	gotoif eq, _0414
	goto _042F
	.byte 0x02, 0x00
_0414:
	scrcmd_690 VAR_TEMP_x4005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _07B9
	goto _042F
	.byte 0x02, 0x00
_042F:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _044A
	touchscreen_menu_show
	goto _02F5

_044A:
	scrcmd_633 1, 16710, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04D8
	scrcmd_633 2, 16710, 32780
	buffer_species_name 0, VAR_SPECIAL_x800C, 0, 0
	comparevartovar VAR_SPECIAL_x800C, VAR_TEMP_x4001
	gotoif eq, _04D8
	goto _0484
	.byte 0x02, 0x00
_0484:
	buffer_species_name 1, VAR_TEMP_x4001, 0, 0
	npc_msg msg_0108_D32R0401_00034
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 1, 1, VAR_SPECIAL_x800C
	menu_item_add 42, 255, 0
	menu_item_add 43, 255, 1
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _04C8
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_04C8:
	scrcmd_633 3, 16710, 32780
	goto _04D8
	.byte 0x02, 0x00
_04D8:
	goto _04E0
	.byte 0x02, 0x00
_04E0:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, _066C
	comparevartovalue VAR_UNK_4146, 1
	callif eq, _066C
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02F5
	comparevartovalue VAR_UNK_4146, 2
	gotoif eq, _052E
	goto _0689
	.byte 0x02, 0x00
_052E:
	npc_msg msg_0108_D32R0401_00030
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _057F
	case 1, _05D7
	touchscreen_menu_show
	goto _02F5
	.byte 0x02, 0x00
_057F:
	npc_msg msg_0108_D32R0401_00031
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _052E
	touchscreen_menu_show
	closemsg
	scrcmd_226 30, 0, 0, 32780
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _05C5
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _05CD
	goto _062F
	.byte 0x02, 0x00
_05C5:
	goto _052E
	.byte 0x02, 0x00
_05CD:
	scrcmd_283
	goto _052E
	.byte 0x02, 0x00
_05D7:
	npc_msg msg_0108_D32R0401_00031
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _052E
	touchscreen_menu_show
	closemsg
	scrcmd_227 30, 0, 0, 32780
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _061D
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0625
	goto _062F
	.byte 0x02, 0x00
_061D:
	goto _052E
	.byte 0x02, 0x00
_0625:
	scrcmd_283
	goto _052E
	.byte 0x02, 0x00
_062F:
	scrcmd_258
	scrcmd_257 108
	scrcmd_634 16385, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0674
	scrcmd_258
	scrcmd_257 110
	npc_msg msg_0108_D32R0401_00032
	comparevartovalue VAR_UNK_4146, 2
	callif eq, _066C
	call _08D9
	goto _0689
	.byte 0x02, 0x00
_066C:
	setvar VAR_UNK_4145, 255
	return

_0674:
	call _0685
	npc_msg msg_0108_D32R0401_00057
	goto _02F5
	.byte 0x02, 0x00
_0685:
	scrcmd_283
	return

_0689:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, _0721
	comparevartovalue VAR_UNK_4146, 1
	callif eq, _073C
	comparevartovalue VAR_UNK_4146, 2
	callif eq, _0757
	play_se SEQ_SE_DP_KAIDAN2
	goto _06BC
	.byte 0x02, 0x00
_06BC:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4146, 0
	callif eq, _077D
	comparevartovalue VAR_UNK_4146, 1
	callif eq, _0791
	comparevartovalue VAR_UNK_4146, 2
	callif eq, _07A5
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 9
	comparevartovalue VAR_UNK_4146, 2
	callif eq, _071D
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_682 1
	end

_071D:
	scrcmd_283
	return

_0721:
	npc_msg msg_0108_D32R0401_00009
	scrcmd_049
	closemsg
	apply_movement obj_player, _07C8
	apply_movement VAR_SPECIAL_x800D, _07F0
	wait_movement
	return

_073C:
	npc_msg msg_0108_D32R0401_00009
	scrcmd_049
	closemsg
	apply_movement obj_player, _07C8
	apply_movement VAR_SPECIAL_x800D, _07F0
	wait_movement
	return

_0757:
	npc_msg_var msg_0108_D32R0401_00009
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 109
	closemsg
	apply_movement obj_player, _07D8
	apply_movement VAR_SPECIAL_x800D, _0800
	wait_movement
	return

_077D:
	apply_movement obj_player, _0818
	apply_movement VAR_SPECIAL_x800D, _0848
	wait_movement
	return

_0791:
	apply_movement obj_player, _0818
	apply_movement VAR_SPECIAL_x800D, _0848
	wait_movement
	return

_07A5:
	apply_movement obj_player, _082C
	apply_movement VAR_SPECIAL_x800D, _0858
	wait_movement
	return

_07B9:
	touchscreen_menu_show
	setvar VAR_UNK_4145, 0
	callstd 2041
	end
	.byte 0x00

_07C8:
	step 14, 4
	step 13, 3
	step 69, 1
	step_end

_07D8:
	step 14, 2
	step 12, 1
	step 14, 2
	step 13, 3
	step 69, 1
	step_end

_07F0:
	step 14, 3
	step 13, 3
	step 69, 1
	step_end

_0800:
	step 14, 1
	step 12, 1
	step 14, 2
	step 13, 3
	step 69, 1
	step_end

_0818:
	step 23, 4
	step 20, 3
	step 2, 1
	step 70, 1
	step_end

_082C:
	step 23, 2
	step 21, 1
	step 23, 2
	step 20, 3
	step 2, 1
	step 70, 1
	step_end

_0848:
	step 20, 3
	step 23, 3
	step 70, 1
	step_end

_0858:
	step 20, 2
	step 23, 3
	step 70, 1
	step_end
_0868:
	npc_msg msg_0108_D32R0401_00000
	return

_086D:
	npc_msg msg_0108_D32R0401_00003
	return

_0872:
	npc_msg msg_0108_D32R0401_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 16, 255, 0
	menu_item_add 17, 255, 1
	return

_0891:
	npc_msg msg_0108_D32R0401_00004
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 18, 255, 4
	return

_08A8:
	npc_msg msg_0108_D32R0401_00002
	return

_08AD:
	npc_msg msg_0108_D32R0401_00005
	return

scr_seq_D32R0401_001:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4145, 0
	npc_msg msg_0108_D32R0401_00011
	call _066C
	call _08D9
	goto _0689
	.byte 0x02, 0x00
_08D9:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_D32R0401_002:
	npc_msg msg_0108_D32R0401_00012
	scrcmd_636 16710
	comparevartovalue VAR_UNK_404F, 1
	callif eq, _0914
	comparevartovalue VAR_UNK_404F, 3
	callif eq, _091C
	goto _02F5
	.byte 0x02, 0x00
_0914:
	setvar VAR_UNK_404F, 0
	return

_091C:
	setvar VAR_UNK_404F, 2
	return

scr_seq_D32R0401_003:
	comparevartovalue VAR_UNK_4146, 0
	callif eq, _0960
	comparevartovalue VAR_UNK_4146, 1
	callif eq, _0960
	comparevartovalue VAR_UNK_404F, 1
	callif eq, _0966
	comparevartovalue VAR_UNK_404F, 3
	callif eq, _097D
	goto _02F5
	.byte 0x02, 0x00
_0960:
	scrcmd_680 29
	return

_0966:
	npc_msg msg_0108_D32R0401_00013
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00015
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404F, 2
	return

_097D:
	npc_msg msg_0108_D32R0401_00013
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00014
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_404F, 4
	callstd 2040
	return

scr_seq_D32R0401_004:
	goto _02F5
	.byte 0x02, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D32R0401_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00059
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00060
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00061
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	play_cry SPECIES_SLOWBRO, 0
	npc_msg msg_0108_D32R0401_00062
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00063
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00064
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00065
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00066
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0108_D32R0401_00067
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0FE
	gotoif FALSE, _0AFF
	scrcmd_692 1, 2, 3, 4, VAR_UNK_4054, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0AD5
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _0AE0
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0AF1
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00069
	npc_msg msg_0108_D32R0401_00070
	play_fanfare SEQ_ME_BPGET
	npc_msg msg_0108_D32R0401_00072
	wait_fanfare
	goto _0B0E
	.byte 0x02, 0x00
_0AD5:
	npc_msg msg_0108_D32R0401_00068
	goto _0B0E
	.byte 0x02, 0x00
_0AE0:
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00073
	npc_msg msg_0108_D32R0401_00071
	goto _0B0E
	.byte 0x02
	.byte 0x00
_0AF1:
	buffer_players_name 0
	npc_msg msg_0108_D32R0401_00074
	goto _0B0E
	.byte 0x02, 0x00
_0AFF:
	setflag FLAG_UNK_0FE
	npc_msg msg_0108_D32R0401_00068
	goto _0B0E
	.byte 0x02, 0x00
_0B0E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0C4A
	goto _0B37
	.byte 0x02, 0x00
_0B37:
	buffer_players_name 0
	scrcmd_693 32773
	comparevartovalue VAR_SPECIAL_x8005, 475
	gotoif ge, _0BBE
	comparevartovalue VAR_SPECIAL_x8005, 351
	gotoif ge, _0BC9
	comparevartovalue VAR_SPECIAL_x8005, 251
	gotoif ge, _0BD4
	comparevartovalue VAR_SPECIAL_x8005, 151
	gotoif ge, _0BDF
	comparevartovalue VAR_SPECIAL_x8005, 101
	gotoif ge, _0BEA
	comparevartovalue VAR_SPECIAL_x8005, 51
	gotoif ge, _0BF5
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ge, _0C00
	comparevartovalue VAR_SPECIAL_x8005, 11
	gotoif ge, _0C0B
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ge, _0C16
	npc_msg msg_0108_D32R0401_00075
	goto _0C21
	.byte 0x02, 0x00
_0BBE:
	npc_msg msg_0108_D32R0401_00084
	goto _0C21
	.byte 0x02, 0x00
_0BC9:
	npc_msg msg_0108_D32R0401_00083
	goto _0C21
	.byte 0x02, 0x00
_0BD4:
	npc_msg msg_0108_D32R0401_00082
	goto _0C21
	.byte 0x02, 0x00
_0BDF:
	npc_msg msg_0108_D32R0401_00081
	goto _0C21
	.byte 0x02, 0x00
_0BEA:
	npc_msg msg_0108_D32R0401_00080
	goto _0C21
	.byte 0x02, 0x00
_0BF5:
	npc_msg msg_0108_D32R0401_00079
	goto _0C21
	.byte 0x02, 0x00
_0C00:
	npc_msg msg_0108_D32R0401_00078
	goto _0C21
	.byte 0x02, 0x00
_0C0B:
	npc_msg msg_0108_D32R0401_00077
	goto _0C21
	.byte 0x02, 0x00
_0C16:
	npc_msg msg_0108_D32R0401_00076
	goto _0C21
	.byte 0x02
	.byte 0x00
_0C21:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0B37
	goto _0C4A
	.byte 0x02, 0x00
_0C4A:
	buffer_players_name 0
	scrcmd_693 32773
	comparevartovalue VAR_SPECIAL_x8005, 475
	gotoif ge, _0CD1
	comparevartovalue VAR_SPECIAL_x8005, 351
	gotoif ge, _0CDC
	comparevartovalue VAR_SPECIAL_x8005, 251
	gotoif ge, _0CE7
	comparevartovalue VAR_SPECIAL_x8005, 151
	gotoif ge, _0CF2
	comparevartovalue VAR_SPECIAL_x8005, 101
	gotoif ge, _0CFD
	comparevartovalue VAR_SPECIAL_x8005, 51
	gotoif ge, _0D08
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ge, _0D13
	comparevartovalue VAR_SPECIAL_x8005, 11
	gotoif ge, _0D1E
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif ge, _0D29
	npc_msg msg_0108_D32R0401_00085
	goto _0D34
	.byte 0x02
	.byte 0x00
_0CD1:
	npc_msg msg_0108_D32R0401_00094
	goto _0D34
	.byte 0x02, 0x00
_0CDC:
	npc_msg msg_0108_D32R0401_00093
	goto _0D34
	.byte 0x02, 0x00
_0CE7:
	npc_msg msg_0108_D32R0401_00092
	goto _0D34
	.byte 0x02, 0x00
_0CF2:
	npc_msg msg_0108_D32R0401_00091
	goto _0D34
	.byte 0x02, 0x00
_0CFD:
	npc_msg msg_0108_D32R0401_00090
	goto _0D34
	.byte 0x02, 0x00
_0D08:
	npc_msg msg_0108_D32R0401_00089
	goto _0D34
	.byte 0x02, 0x00
_0D13:
	npc_msg msg_0108_D32R0401_00088
	goto _0D34
	.byte 0x02, 0x00
_0D1E:
	npc_msg msg_0108_D32R0401_00087
	goto _0D34
	.byte 0x02, 0x00
_0D29:
	npc_msg msg_0108_D32R0401_00086
	goto _0D34
	.byte 0x02, 0x00
_0D34:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0401_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	copyvar VAR_TEMP_x4001, VAR_OBJ_1
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, _0D90
	comparevartovalue VAR_TEMP_x4001, 97
	gotoif eq, _0D9B
	comparevartovalue VAR_TEMP_x4001, 365
	gotoif eq, _0DA6
	comparevartovalue VAR_TEMP_x4001, 366
	gotoif eq, _0DB1
	comparevartovalue VAR_TEMP_x4001, 354
	gotoif eq, _0DBC
	end

_0D90:
	npc_msg msg_0108_D32R0401_00096
	goto _0DC7
	.byte 0x02, 0x00
_0D9B:
	npc_msg msg_0108_D32R0401_00095
	goto _0DC7
	.byte 0x02, 0x00
_0DA6:
	npc_msg msg_0108_D32R0401_00097
	goto _0DC7
	.byte 0x02
	.byte 0x00
_0DB1:
	npc_msg msg_0108_D32R0401_00098
	goto _0DC7
	.byte 0x02, 0x00
_0DBC:
	npc_msg msg_0108_D32R0401_00099
	goto _0DC7
	.byte 0x02, 0x00
_0DC7:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
