#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0003.h"
#include "msgdata/msg/msg_0040.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0003_000
	scrdef scr_seq_0003_001
	scrdef scr_seq_0003_002
	scrdef scr_seq_0003_003
	scrdef scr_seq_0003_004
	scrdef scr_seq_0003_005
	scrdef scr_seq_0003_006
	scrdef scr_seq_0003_007
	scrdef scr_seq_0003_008
	scrdef scr_seq_0003_009
	scrdef scr_seq_0003_010
	scrdef scr_seq_0003_011
	scrdef scr_seq_0003_012
	scrdef scr_seq_0003_013
	scrdef scr_seq_0003_014
	scrdef scr_seq_0003_015
	scrdef scr_seq_0003_016
	scrdef scr_seq_0003_017
	scrdef scr_seq_0003_018
	scrdef scr_seq_0003_019
	scrdef scr_seq_0003_020
	scrdef scr_seq_0003_021
	scrdef scr_seq_0003_022
	scrdef scr_seq_0003_023
	scrdef scr_seq_0003_024
	scrdef scr_seq_0003_025
	scrdef scr_seq_0003_026
	scrdef scr_seq_0003_027
	scrdef scr_seq_0003_028
	scrdef scr_seq_0003_029
	scrdef scr_seq_0003_030
	scrdef scr_seq_0003_031
	scrdef scr_seq_0003_032
	scrdef scr_seq_0003_033
	scrdef scr_seq_0003_034
	scrdef scr_seq_0003_035
	scrdef scr_seq_0003_036
	scrdef scr_seq_0003_037
	scrdef scr_seq_0003_038
	scrdef scr_seq_0003_039
	scrdef scr_seq_0003_040
	scrdef scr_seq_0003_041
	scrdef scr_seq_0003_042
	scrdef scr_seq_0003_043
	scrdef scr_seq_0003_044
	scrdef scr_seq_0003_045
	scrdef scr_seq_0003_046
	scrdef scr_seq_0003_047
	scrdef scr_seq_0003_048
	scrdef scr_seq_0003_049
	scrdef scr_seq_0003_050
	scrdef scr_seq_0003_051
	scrdef scr_seq_0003_052
	scrdef scr_seq_0003_053
	scrdef scr_seq_0003_054
	scrdef scr_seq_0003_055
	scrdef scr_seq_0003_056
	scrdef scr_seq_0003_057
	scrdef scr_seq_0003_058
	scrdef scr_seq_0003_059
	scrdef scr_seq_0003_060
	scrdef scr_seq_0003_061
	scrdef scr_seq_0003_062
	scrdef scr_seq_0003_063
	scrdef scr_seq_0003_064
	scrdef scr_seq_0003_065
	scrdef scr_seq_0003_066
	scrdef scr_seq_0003_067
	scrdef scr_seq_0003_068
	scrdef scr_seq_0003_069
	scrdef scr_seq_0003_070
	scrdef scr_seq_0003_071
	scrdef_end

scr_seq_0003_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, _03E3
	setvar VAR_SPECIAL_x8004, 0
	scrcmd_379 VAR_SPECIAL_x800C
	debugwatch VAR_SPECIAL_x800C
	setvar VAR_SPECIAL_x8004, 83
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0175
	setvar VAR_SPECIAL_x8004, 84
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0175
	setvar VAR_SPECIAL_x8004, 0
_0175:
	non_npc_msg_var VAR_SPECIAL_x8004
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01AA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _019B
	end

_019B:
	npc_msg msg_0040_00003
	waitbutton
	touchscreen_menu_show
	closemsg
	releaseall
	endstd
	end

_01AA:
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _01C5
	scrcmd_188 2048
	goto _01C9

_01C5:
	scrcmd_188 256
_01C9:
	scrcmd_189
	apply_movement obj_player, _0460
	wait_movement
	scrcmd_599
	get_trcard_stars VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 4
	callif ge, _0211
	comparevartovalue VAR_SPECIAL_x800C, 4
	callif lt, _020C
	call _0216
	checkflag FLAG_UNK_065
	gotoif FALSE, _034D
	goto _023A

_020C:
	npc_msg msg_0040_00001
	return

_0211:
	npc_msg msg_0040_00007
	return

_0216:
	apply_movement VAR_SPECIAL_x8007, _1064
	wait_movement
	party_count_not_egg VAR_SPECIAL_x8006
	pokecen_anim VAR_SPECIAL_x8006
	apply_movement VAR_SPECIAL_x8007, _107C
	wait_movement
	get_lead_mon_index VAR_SPECIAL_x8008
	heal_party
	return

_023A:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, _02CB
	npc_msg msg_0040_00002
	apply_movement obj_player, _0468
	wait_movement
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _026F
	scrcmd_188 1024
	goto _0273

_026F:
	scrcmd_188 1
_0273:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, _02B2
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	npc_msg msg_0040_00102
_02B2:
	apply_movement VAR_SPECIAL_x8007, _0454
	wait_movement
	npc_msg msg_0040_00003
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	endstd
	end

_02CB:
	npc_msg msg_0040_00008
	apply_movement obj_player, _0468
	wait_movement
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _02F3
	scrcmd_188 1024
	goto _02F7

_02F3:
	scrcmd_188 1
_02F7:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, _0336
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	npc_msg msg_0040_00102
_0336:
	apply_movement VAR_SPECIAL_x8007, _0454
	wait_movement
	npc_msg msg_0040_00009
	waitbutton
	closemsg
	releaseall
	endstd
	end

_034D:
	scrcmd_238 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8006, 1
	gotoif eq, _0364
	goto _023A

_0364:
	setflag FLAG_UNK_065
	scrcmd_148 1, 0
	apply_movement obj_player, _0468
	wait_movement
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0391
	scrcmd_188 1024
	goto _0395

_0391:
	scrcmd_188 1
_0395:
	scrcmd_189
	get_lead_mon_index VAR_SPECIAL_x8009
	comparevartovar VAR_SPECIAL_x8008, VAR_SPECIAL_x8009
	gotoif eq, _03D4
	wait 15, VAR_SPECIAL_x800A
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_436
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	bufferpartymonnick 0, VAR_SPECIAL_x8009
	npc_msg msg_0040_00102
_03D4:
	npc_msg msg_0040_00010
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	endstd
	end

_03E3:
	checkflag FLAG_NURSE_NOTICED_CARD
	gotoif TRUE, _041D
	setflag FLAG_NURSE_NOTICED_CARD
	npc_msg msg_0040_00004
	buffer_players_name 0
	npc_msg msg_0040_00005
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0445
	npc_msg msg_0040_00009
	waitbutton
	closemsg
	releaseall
	endstd
	end

_041D:
	buffer_players_name 0
	npc_msg msg_0040_00006
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0445
	npc_msg msg_0040_00009
	waitbutton
	closemsg
	releaseall
	endstd
	end

_0445:
	setvar VAR_SPECIAL_x8004, 1
	goto _01AA
	.byte 0x00, 0x00, 0x00

_0454:
	step 100, 1
	step 62, 1
	step_end

_0460:
	step 102, 1
	step_end

_0468:
	step 104, 1
	step_end
scr_seq_0003_069:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_436
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	endstd
	end

scr_seq_0003_000:
	switch VAR_SPECIAL_x800C
	case 0, _04D6
	case 1, _04DD
	scrcmd_060 VAR_SPECIAL_x800C
	switch VAR_SPECIAL_x800C
	case 1, _04DD
	scrcmd_057 2
	endstd
	end

_04D6:
	scrcmd_057 2
	endstd
	end

_04DD:
	scrcmd_057 4
	scrcmd_058
	scrcmd_061
	endstd
	end

scr_seq_0003_001:
	call _04F2
	endstd
	end

_04F2:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	switch VAR_SPECIAL_x800C
	case 7, _0574
	case 0, _0568
	case 4, _0568
	case 1, _0568
	case 2, _0568
	case 6, _0568
	case 5, _057A
	case 3, _056E
	end

_0568:
	play_fanfare SEQ_ME_ITEM
	return

_056E:
	play_fanfare SEQ_ME_WAZA
	return

_0574:
	play_fanfare SEQ_ME_KEYITEM
	return

_057A:
	play_fanfare SEQ_ME_HYOUKA2
	return
	.byte 0x15, 0x00, 0x02, 0x00
scr_seq_0003_003:
	scrcmd_609
	lockall
	get_party_count VAR_SPECIAL_x8004
	setvar VAR_SPECIAL_x8005, 0
_0592:
	survive_poisoning VAR_SPECIAL_x800C, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05AD
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0040_00053
_05AD:
	addvar VAR_SPECIAL_x8005, 1
	comparevartovar VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	gotoif ne, _0592
	count_alive_mons VAR_SPECIAL_x800C, 6
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _05F5
	closemsg
	releaseall
	end

scr_seq_0003_004:
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_049
	fade_screen 6, 1, 0, 0x00
	wait_fade
	end

_05F5:
	buffer_players_name 0
	npc_msg msg_0040_00011
	scrcmd_049
	closemsg
	fade_out_bgm 0, 10
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_436
	overworld_white_out
	end

scr_seq_0003_005:
	clearflag FLAG_UNK_020
	call _0646
	scrcmd_347 VAR_SPECIAL_x800C
	closemsg
	end

scr_seq_0003_024:
	npc_msg msg_0040_00020
	scrcmd_049
	closemsg
	end

scr_seq_0003_006:
	setflag FLAG_UNK_020
	call _0646
	copyvar VAR_TEMP_x4000, VAR_SPECIAL_x800C
	endstd
	end

_0646:
	scrcmd_593
	npc_msg msg_0040_00013
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0740
	scrcmd_253 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0698
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _06BD
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _06A9
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _06C6
	end

_0698:
	scrcmd_594
	touchscreen_menu_show
	npc_msg msg_0040_00020
	scrcmd_049
	setvar VAR_SPECIAL_x800C, 0
	return

_06A9:
	npc_msg msg_0040_00014
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0740
_06BD:
	npc_msg msg_0040_00021
	goto _06F2

_06C6:
	npc_msg msg_0040_00014
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0740
	checkflag FLAG_UNK_020
	gotoif FALSE, _076A
	checkflag FLAG_UNK_020
	gotoif TRUE, _0775
	end

_06F2:
	scrcmd_512
	wait 2, VAR_SPECIAL_x800C
	call _0708
	scrcmd_513
	goto _071D

_0708:
	scrcmd_345
	checkflag FLAG_UNK_020
	callif TRUE, _0762
	scrcmd_254 32780
	scrcmd_346
	return

_071D:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _074C
	buffer_players_name 0
	npc_msg msg_0040_00016
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	scrcmd_348 30
	scrcmd_594
	return

_0740:
	scrcmd_594
	touchscreen_menu_show
	setvar VAR_SPECIAL_x800C, 0
	return

_074C:
	npc_msg msg_0040_00018
	scrcmd_049
	scrcmd_594
	touchscreen_menu_show
	return

_0757:
	npc_msg msg_0040_00021
	goto _06F2
	.byte 0x02, 0x00
_0762:
	scrcmd_641
	clearflag FLAG_UNK_020
	return

_076A:
	npc_msg msg_0040_00015
	goto _06F2
	.byte 0x02, 0x00
_0775:
	scrcmd_642 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0757
	goto _076A
	.byte 0x02, 0x00
scr_seq_0003_007:
	call _07AA
	npc_msg msg_0040_00032
	scrcmd_049
	endstd
	end

scr_seq_0003_035:
	call _07AA
	npc_msg msg_0040_00090
	endstd
	end

_07AA:
	play_fanfare SEQ_ME_ACCE
	scrcmd_403 32772, 32773
	buffer_fashion_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0040_00025
	wait_fanfare
	buffer_players_name 0
	buffer_fashion_name 1, VAR_SPECIAL_x8004
	return

scr_seq_0003_026:
	call _07E4
	npc_msg msg_0040_00032
	scrcmd_049
	endstd
	end

scr_seq_0003_034:
	call _07E4
	npc_msg msg_0040_00090
	endstd
	end

_07E4:
	play_fanfare SEQ_ME_ACCE
	scrcmd_406 32772
	scrcmd_531 0, 32772
	npc_msg msg_0040_00025
	wait_fanfare
	buffer_players_name 0
	scrcmd_531 1, 32772
	return

scr_seq_0003_008:
	call _080A
	endstd
	end

_080A:
	call _04F2
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif eq, _0892
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif ne, _08A3
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, _084E
	npc_msg msg_0040_00030
	goto _0851

_084E:
	npc_msg msg_0040_00031
_0851:
	waitbutton
	return

scr_seq_0003_033:
	call _085F
	endstd
	end

_085F:
	call _04F2
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif eq, _0892
	comparevartovalue VAR_SPECIAL_x800C, 7
	callif ne, _08A3
	npc_msg msg_0040_00089
	return

_0892:
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg msg_0040_00028
	goto _08C9

_08A3:
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, _08BB
	buffer_item_name 0, VAR_SPECIAL_x8004
	goto _08C0

_08BB:
	buffer_item_name_plural 0, VAR_SPECIAL_x8004
_08C0:
	npc_msg msg_0040_00025
	goto _08C9

_08C9:
	wait_fanfare
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x8005, 1
	gotoif gt, _08E6
	buffer_item_name 1, VAR_SPECIAL_x8004
	goto _08EB

_08E6:
	buffer_item_name_plural 1, VAR_SPECIAL_x8004
_08EB:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	switch VAR_SPECIAL_x800C
	case 7, _0972
	case 0, _0961
	case 4, _09B6
	case 1, _09A5
	case 2, _09C7
	case 6, _0983
	case 5, _0994
	case 3, _09D8
	end

_0961:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_0972:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_0983:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_0994:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_09A5:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_09B6:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_09C7:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_09D8:
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	goto _09E9

_09E9:
	return

scr_seq_0003_009:
	call _09F5
	endstd
	end

_09F5:
	npc_msg msg_0040_00027
	waitbutton
	return

scr_seq_0003_010:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_PC_ON
	call _0A18
	buffer_players_name 0
	npc_msg msg_0040_00033
	touchscreen_menu_hide
	goto _0A2E

_0A18:
	scrcmd_500 90
	scrcmd_501 90
	scrcmd_308 90
	return

_0A23:
	scrcmd_502 90
	scrcmd_308 90
	scrcmd_309 90
	return

_0A2E:
	buffer_players_name 0
	npc_msg msg_0040_00034
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8006
	checkflag FLAG_UNK_976
	callif FALSE, _0A78
	checkflag FLAG_UNK_976
	callif TRUE, _0A82
	menu_item_add 63, 255, 1
	checkflag FLAG_GAME_CLEAR
	gotoif TRUE, _0A8C
	checkflag FLAG_GAME_CLEAR
	gotoif FALSE, _0AD1
	goto _0AD1
	.byte 0x02, 0x00
_0A78:
	menu_item_add 61, 255, 0
	return

_0A82:
	menu_item_add 62, 255, 0
	return

_0A8C:
	menu_item_add 64, 255, 2
	menu_item_add 66, 255, 3
	menu_exec
	switch VAR_SPECIAL_x8006
	case 0, _0B01
	case 1, _0C23
	case 2, _0DBA
	goto _0DF0

_0AD1:
	menu_item_add 66, 255, 2
	menu_exec
	switch VAR_SPECIAL_x8006
	case 0, _0B01
	case 1, _0C23
	goto _0DF0

_0B01:
	play_se SEQ_SE_DP_PC_LOGIN
	buffer_players_name 0
	npc_msg msg_0040_00035
	call _0B17
	goto _0B53

_0B17:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 67, 76, 0
	menu_item_add 68, 77, 1
	menu_item_add 69, 78, 2
	menu_item_add 70, 79, 3
	menu_item_add 72, 81, 5
	return
	.byte 0x46, 0x00, 0x47, 0x00, 0x50, 0x00, 0x04
	.byte 0x00, 0x1b, 0x00
_0B53:
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _0BA2
	case 1, _0BB5
	case 2, _0BC8
	case 3, _0BDB
	case 4, _0BEE
	goto _0A2E

_0BA2:
	closemsg
	call _0E16
	scrcmd_158 0
	scrcmd_150
	goto _0C01

_0BB5:
	closemsg
	call _0E16
	scrcmd_158 1
	scrcmd_150
	goto _0C01

_0BC8:
	closemsg
	call _0E16
	scrcmd_158 2
	scrcmd_150
	goto _0C01

_0BDB:
	closemsg
	call _0E16
	scrcmd_158 3
	scrcmd_150
	goto _0C01

_0BEE:
	closemsg
	call _0E16
	scrcmd_158 4
	scrcmd_150
	goto _0C01

_0C01:
	buffer_players_name 0
	non_npc_msg msg_0040_00034
	call _0B17
	call _0A18
	fade_screen 6, 1, 1, 0x00
	goto _0B53

_0C23:
	play_se SEQ_SE_DP_PC_LOGIN
	buffer_players_name 0
	npc_msg msg_0040_00036
	goto _0C33

_0C33:
	call _0CA7
_0C39:
	scrcmd_616 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0C72
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _0CEC
	case 1, _0D3A
	goto _0A2E

_0C72:
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _0CEC
	case 1, _0D3A
	case 2, _0D86
	goto _0A2E

_0CA7:
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 73, 82, 0
	menu_item_add 74, 83, 1
	scrcmd_616 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0CDA
	menu_item_add 75, 84, 2
	return

_0CDA:
	menu_item_add 65, 85, 2
	menu_item_add 75, 84, 3
	return

_0CEC:
	closemsg
	scrcmd_377 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0D0F
	call _0E16
	scrcmd_376
	scrcmd_150
	goto _0D18

_0D0F:
	npc_msg msg_0040_00047
	goto _0C33

_0D18:
	buffer_players_name 0
	non_npc_msg msg_0040_00034
	call _0CA7
	call _0A18
	fade_screen 6, 1, 1, 0x00
	goto _0C39

_0D3A:
	scrcmd_572 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0D5B
	closemsg
	call _0E16
	scrcmd_156
	goto _0D64

_0D5B:
	npc_msg msg_0040_00079
	goto _0C33

_0D64:
	buffer_players_name 0
	non_npc_msg msg_0040_00034
	call _0CA7
	call _0A18
	fade_screen 6, 1, 1, 0x00
	goto _0C39

_0D86:
	closemsg
	call _0E16
	scrcmd_617
	scrcmd_150
	goto _0D98

_0D98:
	buffer_players_name 0
	non_npc_msg msg_0040_00034
	call _0CA7
	call _0A18
	fade_screen 6, 1, 1, 0x00
	goto _0C39

_0DBA:
	play_se SEQ_SE_DP_PC_LOGIN
	closemsg
	scrcmd_706 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0DE7
	call _0E16
	scrcmd_164
	scrcmd_150
	call _0E02
	goto _0A2E

_0DE7:
	npc_msg msg_0040_00094
	goto _0A2E

_0DF0:
	closemsg
	play_se SEQ_SE_DP_PC_LOGOFF
	call _0A23
	touchscreen_menu_show
	releaseall
	end

_0E02:
	call _0A18
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return

_0E16:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_309 90
	return

scr_seq_0003_014:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_156
	fade_screen 6, 1, 1, 0x00
	wait_fade
	end

scr_seq_0003_011:
	npc_msg msg_0040_00038
	endstd
	end

scr_seq_0003_012:
	scrcmd_609
	lockall
	apply_movement obj_player, _1054
	apply_movement 0, _105C
	wait_movement
	fade_screen 6, 1, 1, 0x00
	wait_fade
	buffer_players_name 0
	npc_msg msg_0040_00041
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	heal_party
	fade_screen 6, 1, 1, 0x00
	wait_fade
	npc_msg msg_0040_00042
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x2d
	.byte 0x00, 0x2a, 0x1b, 0x00, 0x2d, 0x00, 0x2b, 0x1b, 0x00
scr_seq_0003_013:
	scrcmd_609
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0ED4
	scrcmd_188 2048
	goto _0ED8

_0ED4:
	scrcmd_188 256
_0ED8:
	scrcmd_189
	apply_movement obj_player, _0460
	wait_movement
	npc_msg msg_0040_00044
	call _0F89
	call _0216
	check_badge 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0F49
	npc_msg msg_0040_00045
	apply_movement obj_player, _0468
	wait_movement
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0F2E
	scrcmd_188 1024
	goto _0F32

_0F2E:
	scrcmd_188 1
_0F32:
	scrcmd_189
	apply_movement VAR_SPECIAL_x8007, _0454
	wait_movement
	npc_msg msg_0040_00046
	waitbutton
	closemsg
	releaseall
	end

_0F49:
	apply_movement obj_player, _0468
	wait_movement
	get_player_state VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, _0F6E
	scrcmd_188 1024
	goto _0F72

_0F6E:
	scrcmd_188 1
_0F72:
	scrcmd_189
	apply_movement VAR_SPECIAL_x8007, _0454
	wait_movement
	npc_msg msg_0040_00040
	waitbutton
	closemsg
	releaseall
	end

_0F89:
	scrcmd_446 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 69
	gotoif eq, _100A
	comparevartovalue VAR_SPECIAL_x8004, 158
	gotoif eq, _1012
	comparevartovalue VAR_SPECIAL_x8004, 166
	gotoif eq, _101A
	comparevartovalue VAR_SPECIAL_x8004, 236
	gotoif eq, _1022
	comparevartovalue VAR_SPECIAL_x8004, 185
	gotoif eq, _102A
	comparevartovalue VAR_SPECIAL_x8004, 81
	gotoif eq, _1032
	comparevartovalue VAR_SPECIAL_x8004, 246
	gotoif eq, _103A
	comparevartovalue VAR_SPECIAL_x8004, 293
	gotoif eq, _1042
	comparevartovalue VAR_SPECIAL_x8004, 169
	gotoif eq, _104A
	setvar VAR_SPECIAL_x8007, 0
	return

_100A:
	setvar VAR_SPECIAL_x8007, 0
	return

_1012:
	setvar VAR_SPECIAL_x8007, 3
	return

_101A:
	setvar VAR_SPECIAL_x8007, 6
	return

_1022:
	setvar VAR_SPECIAL_x8007, 3
	return

_102A:
	setvar VAR_SPECIAL_x8007, 0
	return

_1032:
	setvar VAR_SPECIAL_x8007, 0
	return

_103A:
	setvar VAR_SPECIAL_x8007, 2
	return

_1042:
	setvar VAR_SPECIAL_x8007, 3
	return

_104A:
	setvar VAR_SPECIAL_x8007, 3
	return
	.byte 0x00, 0x00

_1054:
	step 0, 1
	step_end

_105C:
	step 1, 1
	step_end

_1064:
	step 2, 1
	step_end
	.byte 0x00, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

_107C:
	step 1, 1
	step_end
scr_seq_0003_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_450
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0003_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_455
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0040_00054
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0040_00057
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0040_00058
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_020:
	hasitem ITEM_BICYCLE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _1163
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_SELECT
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _1140
	npc_msg msg_0040_00059
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _115D
	scrcmd_185 1
	closemsg
	releaseall
	end

_1140:
	npc_msg msg_0040_00060
	scrcmd_063 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _115D
	scrcmd_185 0
	closemsg
	releaseall
	end

_115D:
	closemsg
	releaseall
	end

_1163:
	end

scr_seq_0003_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0040_00062
	scrcmd_049
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	scrcmd_369
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0003_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0040_00065
	scrcmd_049
	closemsg
	releaseall
	end

scr_seq_0003_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0040_00103
	touchscreen_menu_hide
_11AE:
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 112, 255, 0
	menu_item_add 113, 255, 1
	menu_item_add 114, 255, 2
	menu_item_add 115, 255, 3
	menu_item_add 116, 255, 4
	menu_exec
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, _1277
	setvar VAR_SPECIAL_x8004, 104
	addvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	non_npc_msg_var VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, 0x00
	wait_fade
	closemsg
	setvar VAR_SPECIAL_x8000, 2
	addvar VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	scrcmd_492 VAR_SPECIAL_x8000, VAR_SPECIAL_x800C, VAR_SPECIAL_x8001
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _1277
	npc_msg msg_0040_00109
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _11AE
	comparevartovalue VAR_SPECIAL_x8001, 65535
	gotoif eq, _126A
	scrcmd_494 0, VAR_SPECIAL_x8001
	npc_msg msg_0040_00111
	goto _126D

_126A:
	npc_msg msg_0040_00110
_126D:
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

_1277:
	npc_msg msg_0040_00108
	goto _126D
	.byte 0x02, 0x00
scr_seq_0003_025:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0040_00068
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0003_027:
	end

scr_seq_0003_028:
	scrcmd_609
	lockall
	releaseall
	end
	.byte 0x2d
	.byte 0x00, 0x58, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00
scr_seq_0003_029:
	scrcmd_081 0
	get_player_gender VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, _12D6
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, _12DC
	endstd
	end

_12D6:
	temp_bgm SEQ_GS_E_SUPPORT_F
	return

_12DC:
	temp_bgm SEQ_GS_E_SUPPORT_M
	return

scr_seq_0003_031:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_RIVAL1
	endstd
	end

scr_seq_0003_070:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_RIVAL2
	endstd
	end

scr_seq_0003_042:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MINAKI
	endstd
	end

scr_seq_0003_044:
	scrcmd_081 0
	temp_bgm SEQ_GS_IBUKI
	endstd
	end

scr_seq_0003_036:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_TSURETEKE1
	endstd
	end

scr_seq_0003_037:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_TSURETEKE2
	endstd
	end

scr_seq_0003_065:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_G_PICHU
	endstd
	end

scr_seq_0003_067:
	scrcmd_081 0
	temp_bgm SEQ_GS_E_MAIKO_THEME
	endstd
	end

scr_seq_0003_030:
scr_seq_0003_032:
scr_seq_0003_038:
scr_seq_0003_043:
scr_seq_0003_045:
scr_seq_0003_066:
scr_seq_0003_068:
scr_seq_0003_071:
	fade_out_bgm 0, 30
	scrcmd_081 0
	reset_bgm
	endstd
	end

scr_seq_0003_039:
	set_phone_call VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	call _136C
	endstd
	end

scr_seq_0003_047:
	call _136C
	end

_136C:
	play_se SEQ_SE_GS_PHONE0
	wait_se SEQ_SE_GS_PHONE0
	play_se SEQ_SE_GS_PHONE0
	wait_se SEQ_SE_GS_PHONE0
	fade_screen 6, 1, 0, 0x00
	wait_fade
	run_phone_call
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	return

scr_seq_0003_040:
	checkflag FLAG_UNK_0FD
	gotoif TRUE, _13F6
	comparevartovalue VAR_UNK_404E, 4
	gotoif ne, _13F6
	comparevartovalue VAR_UNK_404F, 4
	gotoif ne, _13F6
	comparevartovalue VAR_UNK_4050, 4
	gotoif ne, _13F6
	comparevartovalue VAR_UNK_4051, 4
	gotoif ne, _13F6
	comparevartovalue VAR_UNK_404D, 4
	gotoif ne, _13F6
	setflag FLAG_UNK_0FD
	scrcmd_680 31
	goto _13F6
	.byte 0x02, 0x00
_13F6:
	endstd
	end

scr_seq_0003_041:
	npc_msg msg_0040_00093
	waitbutton
	closemsg
	releaseall
	endstd
	end

scr_seq_0003_046:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_166 VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_662 32773, 32772, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _1444
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	endstd
	end

_1444:
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	endstd
	end

scr_seq_0003_048:
	goto _145E
	.byte 0x02, 0x00
_145E:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 321, 255, 0
	menu_item_add 322, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, scr_seq_0003_049
	case 1, scr_seq_0003_050
	case 2, scr_seq_0003_051
	end

scr_seq_0003_049:
	scrcmd_275 32772
	goto _14DD
	.byte 0x02, 0x00
scr_seq_0003_050:
	scrcmd_782
	goto _14DD
	.byte 0x02, 0x00
scr_seq_0003_051:
	touchscreen_menu_show
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	waitbutton
	closemsg
	endstd
	end

_14DD:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 6
	scrcmd_054
	goto _145E
	.byte 0x02, 0x00
scr_seq_0003_052:
	goto _14FB
	.byte 0x02, 0x00
_14FB:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 321, 255, 0
	menu_item_add 322, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, scr_seq_0003_053
	case 1, scr_seq_0003_054
	case 2, scr_seq_0003_055
	end

scr_seq_0003_053:
	scrcmd_276 32772
	goto _15A6
	.byte 0x02, 0x00
scr_seq_0003_054:
	scrcmd_782
	goto _15A6
	.byte 0x02, 0x00
scr_seq_0003_055:
	touchscreen_menu_show
	checkflag FLAG_UNK_16F
	gotoif TRUE, _15E8
	checkflag FLAG_UNK_170
	gotoif TRUE, _160C
	checkflag FLAG_UNK_171
	gotoif TRUE, _1630
	checkflag FLAG_UNK_18A
	gotoif TRUE, _1654
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
_159E:
	waitbutton
	closemsg
	endstd
	end

_15A6:
	checkflag FLAG_UNK_16F
	gotoif TRUE, _15FA
	checkflag FLAG_UNK_170
	gotoif TRUE, _161E
	checkflag FLAG_UNK_171
	gotoif TRUE, _1642
	checkflag FLAG_UNK_18A
	gotoif TRUE, _1666
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 6
_15DE:
	scrcmd_054
	goto _14FB
	.byte 0x02, 0x00
_15E8:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	goto _159E

_15FA:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 7
	goto _15DE

_160C:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	goto _159E

_161E:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 8
	goto _15DE

_1630:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 4
	goto _159E

_1642:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 9
	goto _15DE

_1654:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	goto _159E

_1666:
	get_std_msg_naix 3, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 10
	goto _15DE

scr_seq_0003_056:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 321, 255, 0
	menu_item_add 324, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, scr_seq_0003_057
	case 1, scr_seq_0003_058
	case 2, scr_seq_0003_059
	end

scr_seq_0003_057:
	scrcmd_771
	endstd
	end

scr_seq_0003_058:
	touchscreen_menu_show
	endstd
	end

scr_seq_0003_059:
	touchscreen_menu_show
	endstd
	end

scr_seq_0003_060:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 321, 255, 0
	menu_item_add 324, 255, 1
	menu_item_add 323, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, scr_seq_0003_061
	case 1, scr_seq_0003_062
	case 2, scr_seq_0003_063
	end

scr_seq_0003_061:
	scrcmd_772
	endstd
	end

scr_seq_0003_062:
	touchscreen_menu_show
	endstd
	end

scr_seq_0003_063:
	touchscreen_menu_show
	endstd
	end

scr_seq_0003_064:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0040_00099
	closemsg
	scrcmd_806
	scrcmd_727 VAR_SPECIAL_x8005
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0040_00100
	scrcmd_049
	closemsg
	releaseall
	end
	.balign 4, 0
