#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T25R1006.h"
#include "msgdata/msg/msg_0597_T25R1006.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T25R1006_000
	scrdef scr_seq_T25R1006_001
	scrdef scr_seq_T25R1006_002
	scrdef scr_seq_T25R1006_003
	scrdef scr_seq_T25R1006_004
	scrdef scr_seq_T25R1006_005
	scrdef scr_seq_T25R1006_006
	scrdef scr_seq_T25R1006_007
	scrdef_end

scr_seq_T25R1006_006:
	checkflag FLAG_UNK_189
	gotoif FALSE, _0033
	clearflag FLAG_UNK_189
	end

_0033:
	checkflag FLAG_GAME_CLEAR
	gotoif FALSE, _011D
	get_phone_book_rematch 17, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _011D
	scrcmd_147 17, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _00CC
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, _007F
	clearflag FLAG_UNK_26F
	goto _00CA

_007F:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, _0096
	clearflag FLAG_UNK_26F
	goto _00CA

_0096:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, _00AD
	clearflag FLAG_UNK_26F
	goto _00CA

_00AD:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, _00C4
	clearflag FLAG_UNK_26F
	goto _00CA

_00C4:
	goto _011D

_00CA:
	end

_00CC:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, _00E7
	clearflag FLAG_UNK_26F
	goto _011B

_00E7:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, _00FE
	clearflag FLAG_UNK_26F
	goto _011B

_00FE:
	comparevartovalue VAR_TEMP_x4000, 20
	gotoif ne, _0115
	clearflag FLAG_UNK_26F
	goto _011B

_0115:
	goto _011D

_011B:
	end

_011D:
	setflag FLAG_UNK_26F
	end

scr_seq_T25R1006_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_113 20, 2
	npc_msg msg_0597_T25R1006_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0156
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _04A3
_0156:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04D2
	submoneyimmediate 300
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0597_T25R1006_00011
	scrcmd_380 VAR_SPECIAL_x800C, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, _01AD
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif ge, _02B5
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, _03AC
	end

_01AD:
	play_se SEQ_SE_GS_KUJI_ATARI
	buffer_int 0, 3
	npc_msg msg_0597_T25R1006_00012
	scrcmd_380 VAR_SPECIAL_x800C, 70
	comparevartovalue VAR_SPECIAL_x800C, 60
	gotoif ge, _021C
	comparevartovalue VAR_SPECIAL_x800C, 50
	gotoif ge, _022E
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, _0240
	comparevartovalue VAR_SPECIAL_x800C, 30
	gotoif ge, _0252
	comparevartovalue VAR_SPECIAL_x800C, 20
	gotoif ge, _0264
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, _0276
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, _0288
	end

_021C:
	setvar VAR_SPECIAL_x8004, 155
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_022E:
	setvar VAR_SPECIAL_x8004, 150
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0240:
	setvar VAR_SPECIAL_x8004, 151
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0252:
	setvar VAR_SPECIAL_x8004, 152
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0264:
	setvar VAR_SPECIAL_x8004, 153
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0276:
	setvar VAR_SPECIAL_x8004, 156
	setvar VAR_SPECIAL_x8005, 1
	goto _0294

_0288:
	setvar VAR_SPECIAL_x8004, 149
	setvar VAR_SPECIAL_x8005, 1
_0294:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04B0
	callstd std_obtain_item_verbose
	closemsg
	scrcmd_114
	releaseall
	end

_02B5:
	play_se SEQ_SE_GS_KUJI_ATARI
	buffer_int 0, 2
	npc_msg msg_0597_T25R1006_00012
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _02E4
	setvar VAR_SPECIAL_x8004, 11
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_02E4:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _0303
	setvar VAR_SPECIAL_x8004, 8
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0303:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _0322
	setvar VAR_SPECIAL_x8004, 9
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0322:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, _0341
	setvar VAR_SPECIAL_x8004, 6
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0341:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, _0360
	setvar VAR_SPECIAL_x8004, 15
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_0360:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _037F
	setvar VAR_SPECIAL_x8004, 13
	setvar VAR_SPECIAL_x8005, 1
	goto _038B

_037F:
	setvar VAR_SPECIAL_x8004, 10
	setvar VAR_SPECIAL_x8005, 1
_038B:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04B0
	callstd std_obtain_item_verbose
	closemsg
	scrcmd_114
	releaseall
	end

_03AC:
	play_se SEQ_SE_GS_KUJI_OOATARI
	buffer_int 0, 1
	npc_msg msg_0597_T25R1006_00012
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _03DB
	setvar VAR_SPECIAL_x8004, 329
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_03DB:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _03FA
	setvar VAR_SPECIAL_x8004, 392
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_03FA:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _0419
	setvar VAR_SPECIAL_x8004, 418
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0419:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, _0438
	setvar VAR_SPECIAL_x8004, 384
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0438:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, _0457
	setvar VAR_SPECIAL_x8004, 387
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0457:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _0476
	setvar VAR_SPECIAL_x8004, 369
	setvar VAR_SPECIAL_x8005, 1
	goto _0482

_0476:
	setvar VAR_SPECIAL_x8004, 389
	setvar VAR_SPECIAL_x8005, 1
_0482:
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04B0
	callstd std_obtain_item_verbose
	closemsg
	scrcmd_114
	releaseall
	end

_04A3:
	npc_msg msg_0597_T25R1006_00014
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_04B0:
	npc_msg msg_0597_T25R1006_00015
	closemsg
	addmoney 300
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg msg_0597_T25R1006_00017
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_04D2:
	npc_msg msg_0597_T25R1006_00016
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_T25R1006_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _0501
	npc_msg msg_0597_T25R1006_00018
	goto _0572

_0501:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, _0517
	npc_msg msg_0597_T25R1006_00019
	goto _0572

_0517:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _052D
	npc_msg msg_0597_T25R1006_00020
	goto _0572

_052D:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, _0543
	npc_msg msg_0597_T25R1006_00021
	goto _0572

_0543:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, _0559
	npc_msg msg_0597_T25R1006_00022
	goto _0572

_0559:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _056F
	npc_msg msg_0597_T25R1006_00023
	goto _0572

_056F:
	npc_msg msg_0597_T25R1006_00024
_0572:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1006_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _0598
	npc_msg msg_0597_T25R1006_00003
	goto _059B

_0598:
	npc_msg msg_0597_T25R1006_00002
_059B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1006_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, _05C1
	npc_msg msg_0597_T25R1006_00001
	goto _05C4

_05C1:
	npc_msg msg_0597_T25R1006_00000
_05C4:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1006_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 17, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, _067A
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, _066F
	npc_msg msg_0597_T25R1006_00025
_05F7:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _061B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, _065E
	end

_061B:
	buffer_players_name 0
	npc_msg msg_0597_T25R1006_00026
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 17
	npc_msg msg_0597_T25R1006_00027
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	setflag FLAG_UNK_26F
	hide_person obj_T25R1006_gsleader3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_065E:
	setvar VAR_TEMP_x4002, 1
	npc_msg msg_0597_T25R1006_00028
	waitbutton
	closemsg
	releaseall
	end

_066F:
	npc_msg msg_0597_T25R1006_00029
	goto _05F7
	.byte 0x02, 0x00
_067A:
	npc_msg msg_0597_T25R1006_00030
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _06DB
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _06E6
	npc_msg msg_0597_T25R1006_00031
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 15
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg msg_0597_T25R1006_00032
	waitbutton
	closemsg
	releaseall
	end

_06DB:
	npc_msg msg_0597_T25R1006_00033
	waitbutton
	closemsg
	releaseall
	end

_06E6:
	npc_msg msg_0597_T25R1006_00034
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1006_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0597_T25R1006_00004
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T25R1006_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0597_T25R1006_00005
	scrcmd_113 20, 2
	goto _0717

_0717:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x8000
	menu_item_add 209, 255, 0
	menu_item_add 210, 255, 1
	menu_item_add 211, 255, 2
	menu_item_add 212, 255, 3
	menu_exec
	touchscreen_menu_show
	switch VAR_SPECIAL_x8000
	case 0, _077B
	case 1, _0787
	case 2, _0793
	npc_msg msg_0597_T25R1006_00009
	goto _08BE

_077B:
	setvar VAR_SPECIAL_x8001, 30
	goto _07D5

_0787:
	setvar VAR_SPECIAL_x8001, 31
	goto _07D5

_0793:
	setvar VAR_SPECIAL_x8001, 32
	goto _07D5

_079F:
	hasenoughmoneyimmediate 32780, 200
	return

_07A9:
	hasenoughmoneyimmediate 32780, 300
	return

_07B3:
	hasenoughmoneyimmediate 32780, 350
	return

_07BD:
	submoneyimmediate 200
	return

_07C5:
	submoneyimmediate 300
	return

_07CD:
	submoneyimmediate 350
	return

_07D5:
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, _079F
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, _07A9
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, _07B3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _08A9
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _08B2
	comparevartovalue VAR_SPECIAL_x8000, 0
	callif eq, _07BD
	comparevartovalue VAR_SPECIAL_x8000, 1
	callif eq, _07C5
	comparevartovalue VAR_SPECIAL_x8000, 2
	callif eq, _07CD
	scrcmd_115
	buffer_item_name 0, VAR_SPECIAL_x8001
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0597_T25R1006_00006
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8001
	setvar VAR_SPECIAL_x8005, 1
	callstd std_give_item_verbose
	scrcmd_380 VAR_SPECIAL_x800C, 64
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _08A0
	play_se SEQ_SE_DP_JIHANKI
	buffer_item_name 0, VAR_SPECIAL_x8001
	npc_msg msg_0597_T25R1006_00007
	hasspaceforitem VAR_SPECIAL_x8001, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _08B2
	callstd std_give_item_verbose
_08A0:
	npc_msg msg_0597_T25R1006_00005
	goto _0717

_08A9:
	npc_msg msg_0597_T25R1006_00008
	goto _08BE

_08B2:
	callstd std_bag_is_full
	closemsg
	scrcmd_114
	releaseall
	end

_08BE:
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end
	.balign 4, 0
