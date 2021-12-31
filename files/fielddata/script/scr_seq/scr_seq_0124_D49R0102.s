#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D49R0102.h"
#include "msgdata/msg/msg_0139_D49R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D49R0102_000
	scrdef scr_seq_D49R0102_001
	scrdef scr_seq_D49R0102_002
	scrdef scr_seq_D49R0102_003
	scrdef scr_seq_D49R0102_004
	scrdef scr_seq_D49R0102_005
	scrdef scr_seq_D49R0102_006
	scrdef scr_seq_D49R0102_007
	scrdef scr_seq_D49R0102_008
	scrdef scr_seq_D49R0102_009
	scrdef scr_seq_D49R0102_010
	scrdef scr_seq_D49R0102_011
	scrdef scr_seq_D49R0102_012
	scrdef scr_seq_D49R0102_013
	scrdef scr_seq_D49R0102_014
	scrdef scr_seq_D49R0102_015
	scrdef scr_seq_D49R0102_016
	scrdef_end

scr_seq_D49R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_074 2147
	callstd std_play_mom_music
	checkflag FLAG_UNK_0FA
	gotoif FALSE, _006A
	npc_msg msg_0139_D49R0102_00001
	goto _0071

_006A:
	npc_msg msg_0139_D49R0102_00000
	setflag FLAG_UNK_0FA
_0071:
	npc_msg msg_0139_D49R0102_00002
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 272, 255, 0
	menu_item_add 296, 255, 1
	menu_item_add 297, 255, 2
	menu_item_add 12, 255, 3
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _03C5
	case 1, _00D5
	case 2, _03D0
	goto _03DB
	.byte 0x02, 0x00
_00D5:
	npc_msg msg_0139_D49R0102_00003
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 308, 255, 0
	menu_item_add 309, 255, 1
	menu_item_add 310, 255, 2
	menu_item_add 311, 255, 3
	menu_item_add 312, 255, 4
	menu_item_add 13, 255, 5
	menu_exec
	switch VAR_SPECIAL_x800C
	case 5, _0071
	npc_msg msg_0139_D49R0102_00004
	case 0, _0166
	case 1, _01A0
	case 2, _01DA
	case 3, _0214
	goto _024E
	.byte 0x02, 0x00
_0166:
	setvar VAR_TEMP_x4007, 0
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 298, 255, 0
	menu_item_add 299, 255, 1
	menu_item_add 304, 255, 6
	menu_item_add 13, 255, 10
	menu_exec
	goto _0288
	.byte 0x02, 0x00
_01A0:
	setvar VAR_TEMP_x4007, 1
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 301, 255, 3
	menu_item_add 300, 255, 2
	menu_item_add 307, 255, 9
	menu_item_add 13, 255, 10
	menu_exec
	goto _0288
	.byte 0x02, 0x00
_01DA:
	setvar VAR_TEMP_x4007, 2
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 306, 255, 8
	menu_item_add 307, 255, 9
	menu_item_add 299, 255, 1
	menu_item_add 13, 255, 10
	menu_exec
	goto _0288
	.byte 0x02, 0x00
_0214:
	setvar VAR_TEMP_x4007, 3
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 305, 255, 7
	menu_item_add 304, 255, 6
	menu_item_add 301, 255, 3
	menu_item_add 13, 255, 10
	menu_exec
	goto _0288
	.byte 0x02, 0x00
_024E:
	setvar VAR_TEMP_x4007, 4
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 303, 255, 5
	menu_item_add 302, 255, 4
	menu_item_add 298, 255, 0
	menu_item_add 13, 255, 10
	menu_exec
	goto _0288
	.byte 0x02, 0x00
_0288:
	switch VAR_SPECIAL_x800C
	case 0, _0318
	case 1, _0323
	case 2, _032E
	case 3, _0339
	case 4, _0344
	case 5, _034F
	case 6, _035A
	case 7, _0365
	case 8, _0370
	case 9, _037B
	goto _00D5
	.byte 0x02, 0x00
_0318:
	npc_msg msg_0139_D49R0102_00006
	goto _0386
	.byte 0x02, 0x00
_0323:
	npc_msg msg_0139_D49R0102_00007
	goto _0386
	.byte 0x02, 0x00
_032E:
	npc_msg msg_0139_D49R0102_00008
	goto _0386
	.byte 0x02, 0x00
_0339:
	npc_msg msg_0139_D49R0102_00009
	goto _0386
	.byte 0x02, 0x00
_0344:
	npc_msg msg_0139_D49R0102_00010
	goto _0386
	.byte 0x02, 0x00
_034F:
	npc_msg msg_0139_D49R0102_00011
	goto _0386
	.byte 0x02, 0x00
_035A:
	npc_msg msg_0139_D49R0102_00012
	goto _0386
	.byte 0x02, 0x00
_0365:
	npc_msg msg_0139_D49R0102_00013
	goto _0386
	.byte 0x02, 0x00
_0370:
	npc_msg msg_0139_D49R0102_00014
	goto _0386
	.byte 0x02, 0x00
_037B:
	npc_msg msg_0139_D49R0102_00015
	goto _0386
	.byte 0x02, 0x00
_0386:
	npc_msg msg_0139_D49R0102_00004
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif eq, _0166
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, _01A0
	comparevartovalue VAR_TEMP_x4007, 2
	gotoif eq, _01DA
	comparevartovalue VAR_TEMP_x4007, 3
	gotoif eq, _0214
	goto _024E
	.byte 0x02, 0x00
_03C5:
	npc_msg msg_0139_D49R0102_00005
	goto _0071
	.byte 0x02, 0x00
_03D0:
	npc_msg msg_0139_D49R0102_00017
	goto _0071
	.byte 0x02, 0x00
_03DB:
	npc_msg msg_0139_D49R0102_00016
	waitbutton
	closemsg
	touchscreen_menu_show
	scrcmd_081 0
	reset_bgm
	scrcmd_726
	releaseall
	end

scr_seq_D49R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 500
	gotoif lt, _0417
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00025
	goto _041A

_0417:
	npc_msg msg_0139_D49R0102_00024
_041A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 51
	gotoif lt, _0449
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00027
	goto _044C

_0449:
	npc_msg msg_0139_D49R0102_00026
_044C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 150
	gotoif lt, _047B
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00029
	goto _047E

_047B:
	npc_msg msg_0139_D49R0102_00028
_047E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 1000
	gotoif lt, _04AD
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00031
	goto _04B0

_04AD:
	npc_msg msg_0139_D49R0102_00030
_04B0:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 10001
	gotoif lt, _04DF
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00033
	goto _04E2

_04DF:
	npc_msg msg_0139_D49R0102_00032
_04E2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 75
	gotoif lt, _0511
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00035
	goto _0514

_0511:
	npc_msg msg_0139_D49R0102_00034
_0514:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 26
	gotoif lt, _0544
	buffer_players_name 0
	gender_msgbox msg_0139_D49R0102_00037, msg_0139_D49R0102_00038
	goto _0547

_0544:
	npc_msg msg_0139_D49R0102_00036
_0547:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 20001
	gotoif lt, _0576
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00040
	goto _0579

_0576:
	npc_msg msg_0139_D49R0102_00039
_0579:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, _05A5
	npc_msg msg_0139_D49R0102_00043
	goto _05A8

_05A5:
	npc_msg msg_0139_D49R0102_00041
_05A8:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, _05D7
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00046
	goto _05DA

_05D7:
	npc_msg msg_0139_D49R0102_00045
_05DA:
	closemsg
	apply_movement obj_D49R0102_gsmiddleman1, _0610
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 800
	gotoif lt, _05FC
	npc_msg msg_0139_D49R0102_00044
	goto _05FF

_05FC:
	npc_msg msg_0139_D49R0102_00042
_05FF:
	closemsg
	apply_movement obj_D49R0102_gsmiddleman1, _0618
	wait_movement
	releaseall
	end
	.byte 0x00

_0610:
	step 35, 1
	step_end

_0618:
	step 32, 1
	step_end
scr_seq_D49R0102_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 201
	gotoif lt, _0647
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00048
	goto _064A

_0647:
	npc_msg msg_0139_D49R0102_00047
_064A:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 250
	gotoif lt, _0679
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00050
	goto _067C

_0679:
	npc_msg msg_0139_D49R0102_00049
_067C:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	comparevartovalue VAR_TEMP_x4000, 101
	gotoif lt, _06AB
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00052
	goto _06AE

_06AB:
	npc_msg msg_0139_D49R0102_00051
_06AE:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	play_cry SPECIES_RATTATA, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, _06E3
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00019
	goto _06E6

_06E3:
	npc_msg msg_0139_D49R0102_00018
_06E6:
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	play_cry SPECIES_MACHOP, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, _071D
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00021
	goto _0720

_071D:
	npc_msg msg_0139_D49R0102_00020
_0720:
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D49R0102_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_724 11, 16384
	play_cry SPECIES_BUTTERFREE, 0
	comparevartovalue VAR_TEMP_x4000, 15000
	gotoif lt, _0757
	buffer_players_name 0
	npc_msg msg_0139_D49R0102_00023
	goto _075A

_0757:
	npc_msg msg_0139_D49R0102_00022
_075A:
	wait_cry
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
