#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D37R0102.h"
#include "msgdata/msg/msg_0117_D37R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D37R0102_000
	scrdef scr_seq_D37R0102_001
	scrdef scr_seq_D37R0102_002
	scrdef scr_seq_D37R0102_003
	scrdef scr_seq_D37R0102_004
	scrdef scr_seq_D37R0102_005
	scrdef scr_seq_D37R0102_006
	scrdef scr_seq_D37R0102_007
	scrdef scr_seq_D37R0102_008
	scrdef scr_seq_D37R0102_009
	scrdef scr_seq_D37R0102_010
	scrdef scr_seq_D37R0102_011
	scrdef scr_seq_D37R0102_012
	scrdef scr_seq_D37R0102_013
	scrdef scr_seq_D37R0102_014
	scrdef scr_seq_D37R0102_015
	scrdef scr_seq_D37R0102_016
	scrdef scr_seq_D37R0102_017
	scrdef scr_seq_D37R0102_018
	scrdef scr_seq_D37R0102_019
	scrdef scr_seq_D37R0102_020
	scrdef scr_seq_D37R0102_021
	scrdef scr_seq_D37R0102_022
	scrdef scr_seq_D37R0102_023
	scrdef_end

scr_seq_D37R0102_008:
	setflag FLAG_UNK_1B0
	setflag FLAG_UNK_1B1
	setflag FLAG_UNK_1B2
	setflag FLAG_UNK_1B3
	setflag FLAG_UNK_1B4
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 2
	gotoif eq, _0144
	comparevartovalue VAR_UNK_4077, 4
	gotoif eq, _0144
	comparevartovalue VAR_UNK_4077, 3
	gotoif eq, _0144
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, _00C0
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B3
	goto _0131

_00C0:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, _00D7
	clearflag FLAG_UNK_1B2
	goto _0131

_00D7:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, _00EE
	clearflag FLAG_UNK_1B3
	goto _0131

_00EE:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, _0105
	clearflag FLAG_UNK_1B2
	goto _0131

_0105:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _011C
	clearflag FLAG_UNK_1B3
	goto _0131

_011C:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, _0131
	clearflag FLAG_UNK_1B1
	clearflag FLAG_UNK_1B2
_0131:
	comparevartovalue VAR_TEMP_x4000, 1
	callif eq, _0161
	clearflag FLAG_UNK_1B8
	end

_0144:
	comparevartovalue VAR_UNK_409F, 1
	gotoif ne, _015B
	setflag FLAG_UNK_1B4
	goto _015F

_015B:
	clearflag FLAG_UNK_1B4
_015F:
	end

_0161:
	scrcmd_522 16385
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif ge, _017C
	setflag FLAG_UNK_1B0
	goto _0197

_017C:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif le, _0193
	setflag FLAG_UNK_1B0
	goto _0197

_0193:
	clearflag FLAG_UNK_1B0
_0197:
	return

scr_seq_D37R0102_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setflag FLAG_UNK_170
	npc_msg msg_0117_D37R0102_00000
	scrcmd_054
	setvar VAR_SPECIAL_x8004, 8
	callstd 2052
	clearflag FLAG_UNK_170
	releaseall
	end

scr_seq_D37R0102_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AA0
	gotoif TRUE, _0331
	scrcmd_113 20, 2
	npc_msg msg_0117_D37R0102_00010
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01F5
	goto _030C
	.byte 0x02, 0x00
_01F5:
	hasenoughmoneyimmediate 32780, 500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0324
	npc_msg msg_0117_D37R0102_00011
	scrcmd_049
	closemsg
	scrcmd_114
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0319
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0319
	scrcmd_113 20, 2
	submoneyimmediate 500
	scrcmd_115
	npc_msg msg_0117_D37R0102_00012
	scrcmd_049
	closemsg
	fade_screen 6, 1, 0, 0x7FFF
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_114
	fade_screen 6, 1, 1, 0x7FFF
	wait_fade
	npc_msg msg_0117_D37R0102_00013
	scrcmd_049
	setflag FLAG_UNK_AA0
	call _04C8
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, _02F6
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, _02E0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, _02CA
_02CA:
	scrcmd_383 1, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00024
	waitbutton
	closemsg
	releaseall
	end

_02E0:
	scrcmd_383 5, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00025
	waitbutton
	closemsg
	releaseall
	end

_02F6:
	scrcmd_383 10, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00026
	waitbutton
	closemsg
	releaseall
	end

_030C:
	npc_msg msg_0117_D37R0102_00014
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_0319:
	npc_msg msg_0117_D37R0102_00014
	waitbutton
	closemsg
	releaseall
	end

_0324:
	npc_msg msg_0117_D37R0102_00015
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_0331:
	npc_msg msg_0117_D37R0102_00016
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D37R0102_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AA0
	gotoif TRUE, _04BD
	scrcmd_113 20, 2
	npc_msg msg_0117_D37R0102_00017
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0375
	goto _0498
	.byte 0x02, 0x00
_0375:
	hasenoughmoneyimmediate 32780, 300
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04B0
	npc_msg msg_0117_D37R0102_00018
	scrcmd_049
	closemsg
	scrcmd_114
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _04A5
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _04A5
	scrcmd_113 20, 2
	submoneyimmediate 300
	scrcmd_115
	npc_msg msg_0117_D37R0102_00019
	scrcmd_049
	closemsg
	fade_screen 6, 1, 0, 0x7FFF
	wait_fade
	play_fanfare SEQ_ME_ASA
	wait_fanfare
	scrcmd_114
	fade_screen 6, 1, 1, 0x7FFF
	wait_fade
	npc_msg msg_0117_D37R0102_00020
	scrcmd_049
	setflag FLAG_UNK_AA0
	scrcmd_380 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 40
	gotoif ge, _0444
	comparevartovalue VAR_SPECIAL_x800C, 10
	gotoif ge, _0460
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ge, _047C
_0444:
	call _04C8
	scrcmd_383 1, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00024
	waitbutton
	closemsg
	releaseall
	end

_0460:
	call _04C8
	scrcmd_383 5, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00025
	waitbutton
	closemsg
	releaseall
	end

_047C:
	call _04D8
	scrcmd_383 10, 32773
	bufferpartymonnick 0, VAR_SPECIAL_x8005
	npc_msg msg_0117_D37R0102_00026
	waitbutton
	closemsg
	releaseall
	end

_0498:
	npc_msg msg_0117_D37R0102_00021
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_04A5:
	npc_msg msg_0117_D37R0102_00021
	waitbutton
	closemsg
	releaseall
	end

_04B0:
	npc_msg msg_0117_D37R0102_00022
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

_04BD:
	npc_msg msg_0117_D37R0102_00023
	waitbutton
	closemsg
	releaseall
	end

_04C8:
	scrcmd_828 32773, 1, 16
	scrcmd_828 32773, 5, 11
	return

_04D8:
	scrcmd_828 32773, 1, 24
	scrcmd_828 32773, 5, 18
	return

scr_seq_D37R0102_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_AB7
	gotoif TRUE, _0895
	scrcmd_113 20, 2
	npc_msg msg_0117_D37R0102_00001
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	setvar VAR_TEMP_x4005, 0
	setvar VAR_TEMP_x4006, 0
	setvar VAR_TEMP_x4007, 0
_0522:
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 445, 255, 0
	menu_item_add 446, 255, 1
	menu_item_add 447, 255, 2
	menu_item_add 448, 255, 3
	menu_item_add 449, 255, 4
	menu_item_add 450, 255, 7
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, _05AB
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, _05D0
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, _05F5
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, _061A
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, _063F
	goto _0886

_05AB:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, _086B
	setvar VAR_SPECIAL_x8004, 92
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4500
	goto _0664

_05D0:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, _086B
	setvar VAR_SPECIAL_x8004, 88
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 650
	goto _0664

_05F5:
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif eq, _086B
	setvar VAR_SPECIAL_x8004, 89
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 3500
	goto _0664

_061A:
	comparevartovalue VAR_TEMP_x4006, 1
	gotoif eq, _086B
	setvar VAR_SPECIAL_x8004, 90
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 900
	goto _0664

_063F:
	comparevartovalue VAR_TEMP_x4007, 1
	gotoif eq, _086B
	setvar VAR_SPECIAL_x8004, 91
	setvar VAR_SPECIAL_x8005, 1
	setvar VAR_SPECIAL_x8006, 4600
	goto _0664

_0664:
	buffer_item_name 0, VAR_SPECIAL_x8004
	buffer_int 1, VAR_SPECIAL_x8006
	npc_msg msg_0117_D37R0102_00002
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _068A
	closemsg
	goto _0522

_068A:
	comparevartovalue VAR_SPECIAL_x8004, 92
	gotoif ne, _06CD
	hasenoughmoneyimmediate 32780, 4500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _087D
	submoneyimmediate 4500
	goto _07C6

_06CD:
	comparevartovalue VAR_SPECIAL_x8004, 88
	gotoif ne, _0710
	hasenoughmoneyimmediate 32780, 650
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _087D
	submoneyimmediate 650
	goto _07C6

_0710:
	comparevartovalue VAR_SPECIAL_x8004, 89
	gotoif ne, _0753
	hasenoughmoneyimmediate 32780, 3500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _087D
	submoneyimmediate 3500
	goto _07C6

_0753:
	comparevartovalue VAR_SPECIAL_x8004, 90
	gotoif ne, _0796
	hasenoughmoneyimmediate 32780, 900
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _087D
	submoneyimmediate 900
	goto _07C6

_0796:
	hasenoughmoneyimmediate 32780, 4600
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0874
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _087D
	submoneyimmediate 4600
_07C6:
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0117_D37R0102_00003
	npc_msg msg_0117_D37R0102_00004
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8004, 92
	gotoif ne, _0803
	setvar VAR_TEMP_x4003, 1
	goto _0861

_0803:
	comparevartovalue VAR_SPECIAL_x8004, 88
	gotoif ne, _081C
	setvar VAR_TEMP_x4004, 1
	goto _0861

_081C:
	comparevartovalue VAR_SPECIAL_x8004, 89
	gotoif ne, _0835
	setvar VAR_TEMP_x4005, 1
	goto _0861

_0835:
	comparevartovalue VAR_SPECIAL_x8004, 90
	gotoif ne, _084E
	setvar VAR_TEMP_x4006, 1
	goto _0861

_084E:
	comparevartovalue VAR_SPECIAL_x8004, 91
	gotoif ne, _0861
	setvar VAR_TEMP_x4007, 1
_0861:
	setflag FLAG_UNK_AB7
	goto _0522

_086B:
	npc_msg msg_0117_D37R0102_00005
	goto _0522

_0874:
	npc_msg msg_0117_D37R0102_00006
	goto _0522

_087D:
	npc_msg msg_0117_D37R0102_00007
	goto _0522

_0886:
	touchscreen_menu_show
	scrcmd_114
	npc_msg msg_0117_D37R0102_00009
	waitbutton
	closemsg
	releaseall
	end

_0895:
	npc_msg msg_0117_D37R0102_00008
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D37R0102_004:
	scrcmd_609
	lockall
	apply_movement obj_D37R0102_rocketm, _0AC4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, _08CF
	apply_movement obj_D37R0102_rocketm, _0ACC
	goto _096B

_08CF:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, _08EA
	apply_movement obj_D37R0102_rocketm, _0AD4
	goto _096B

_08EA:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif ne, _0905
	apply_movement obj_D37R0102_rocketm, _0ADC
	goto _096B

_0905:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, _0920
	apply_movement obj_D37R0102_rocketm, _0AE4
	goto _096B

_0920:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, _093B
	apply_movement obj_D37R0102_rocketm, _0AEC
	goto _096B

_093B:
	comparevartovalue VAR_TEMP_x4001, 12
	gotoif ne, _0956
	apply_movement obj_D37R0102_rocketm, _0AF4
	goto _096B

_0956:
	comparevartovalue VAR_TEMP_x4001, 13
	gotoif ne, _096B
	apply_movement obj_D37R0102_rocketm, _0AFC
_096B:
	wait_movement
	npc_msg msg_0117_D37R0102_00036
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, _09A5
	apply_movement obj_D37R0102_rocketm, _0B04
	apply_movement obj_player, _0B70
	goto _0A71

_09A5:
	comparevartovalue VAR_TEMP_x4001, 8
	gotoif ne, _09C8
	apply_movement obj_D37R0102_rocketm, _0B10
	apply_movement obj_player, _0B7C
	goto _0A71

_09C8:
	comparevartovalue VAR_TEMP_x4001, 9
	gotoif ne, _09EB
	apply_movement obj_D37R0102_rocketm, _0B20
	apply_movement obj_player, _0B88
	goto _0A71

_09EB:
	comparevartovalue VAR_TEMP_x4001, 10
	gotoif ne, _0A0E
	apply_movement obj_D37R0102_rocketm, _0B30
	apply_movement obj_player, _0B94
	goto _0A71

_0A0E:
	comparevartovalue VAR_TEMP_x4001, 11
	gotoif ne, _0A31
	apply_movement obj_D37R0102_rocketm, _0B40
	apply_movement obj_player, _0BA0
	goto _0A71

_0A31:
	comparevartovalue VAR_TEMP_x4001, 12
	gotoif ne, _0A54
	apply_movement obj_D37R0102_rocketm, _0B50
	apply_movement obj_player, _0BAC
	goto _0A71

_0A54:
	comparevartovalue VAR_TEMP_x4001, 13
	gotoif ne, _0A71
	apply_movement obj_D37R0102_rocketm, _0B60
	apply_movement obj_player, _0BB8
_0A71:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_188 1024
	scrcmd_189
	scrcmd_620 1
	play_se SEQ_SE_DP_CARD2
	wait 24, VAR_SPECIAL_x800C
	play_se SEQ_SE_DP_CARD2
	wait_se SEQ_SE_DP_CARD2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	setvar VAR_UNK_4077, 3
	npc_msg msg_0117_D37R0102_00037
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0AC4:
	step 75, 1
	step_end

_0ACC:
	step 61, 1
	step_end

_0AD4:
	step 13, 1
	step_end

_0ADC:
	step 13, 2
	step_end

_0AE4:
	step 13, 3
	step_end

_0AEC:
	step 13, 4
	step_end

_0AF4:
	step 13, 5
	step_end

_0AFC:
	step 13, 6
	step_end

_0B04:
	step 15, 1
	step 34, 1
	step_end

_0B10:
	step 12, 1
	step 15, 1
	step 34, 1
	step_end

_0B20:
	step 12, 2
	step 15, 1
	step 34, 1
	step_end

_0B30:
	step 12, 3
	step 15, 1
	step 34, 1
	step_end

_0B40:
	step 12, 4
	step 15, 1
	step 34, 1
	step_end

_0B50:
	step 12, 5
	step 15, 1
	step 34, 1
	step_end

_0B60:
	step 12, 6
	step 15, 1
	step 34, 1
	step_end

_0B70:
	step 12, 1
	step 35, 1
	step_end

_0B7C:
	step 12, 2
	step 35, 1
	step_end

_0B88:
	step 12, 3
	step 35, 1
	step_end

_0B94:
	step 12, 4
	step 35, 1
	step_end

_0BA0:
	step 12, 5
	step 35, 1
	step_end

_0BAC:
	step 12, 6
	step 35, 1
	step_end

_0BB8:
	step 12, 7
	step 35, 1
	step_end
scr_seq_D37R0102_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0117_D37R0102_00037
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D37R0102_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8007, 0
	checkflag FLAG_UNK_08C
	callif FALSE, _0C0E
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif eq, _0C16
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif ge, _0C1F
	releaseall
	end

_0C0E:
	setvar VAR_SPECIAL_x8007, 1
	return

_0C16:
	npc_msg msg_0117_D37R0102_00039
	goto _0C58

_0C1F:
	npc_msg msg_0117_D37R0102_00049
	goto _0C58

_0C28:
	npc_msg msg_0117_D37R0102_00041
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0C4F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0CA0
	end

_0C4F:
	npc_msg msg_0117_D37R0102_00044
	goto _0C7C

_0C58:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0C28
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0DDA
	end

_0C7C:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0CA0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0DDA
	end

_0CA0:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0CC0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0CCC
	end

_0CC0:
	setvar VAR_TEMP_x4002, 0
	goto _0D17

_0CCC:
	npc_msg msg_0117_D37R0102_00042
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 16386
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, _0DDA
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0DE5
	goto _0D17

_0D17:
	npc_msg msg_0117_D37R0102_00043
	closemsg
	scrcmd_386 VAR_SPECIAL_x8006
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, _0D49
	comparevartovalue VAR_SPECIAL_x8006, 2
	gotoif eq, _0D4F
	comparevartovalue VAR_SPECIAL_x8006, 3
	gotoif eq, _0D55
	end

_0D49:
	goto _0D5B

_0D4F:
	goto _0D5B

_0D55:
	goto _0D5B

_0D5B:
	setflag FLAG_UNK_08C
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_154 16386, 32773, 32775
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, _0DAA
	comparevartovalue VAR_SPECIAL_x8006, 2
	gotoif eq, _0DB0
	comparevartovalue VAR_SPECIAL_x8006, 3
	gotoif eq, _0DB6
	end

_0DAA:
	goto _0DBC

_0DB0:
	goto _0DBC

_0DB6:
	goto _0DBC

_0DBC:
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, _0E40
	setvar VAR_TEMP_x400A, 1
	npc_msg msg_0117_D37R0102_00045
	closemsg
	goto _0DEE

_0DDA:
	npc_msg msg_0117_D37R0102_00040
	waitbutton
	closemsg
	releaseall
	end

_0DE5:
	npc_msg msg_0117_D37R0102_00051
	goto _0CCC

_0DEE:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_492 0, VAR_SPECIAL_x800C, VAR_SPECIAL_x8004
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0E35
	scrcmd_256 32772
	scrcmd_494 0, VAR_SPECIAL_x8004
	npc_msg msg_0117_D37R0102_00046
	npc_msg msg_0117_D37R0102_00052
	waitbutton
	closemsg
	releaseall
	end

_0E35:
	npc_msg msg_0117_D37R0102_00047
	closemsg
	goto _0DEE

_0E40:
	npc_msg msg_0117_D37R0102_00048
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x08, 0x00, 0x02, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0a, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0b, 0x00, 0x01, 0x00, 0x08, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x09, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0e, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0f, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x02, 0x00
scr_seq_D37R0102_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0117_D37R0102_00029
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0F05
	npc_msg msg_0117_D37R0102_00034
	waitbutton
	closemsg
	releaseall
	end

_0F05:
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0FDA
	npc_msg msg_0117_D37R0102_00030
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_188 1024
	scrcmd_189
	scrcmd_620 1
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _0FE8
	apply_movement obj_D37R0102_gsmiddleman1, _1000
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _0F79
	release 253
	apply_movement 253, _0FF8
	lock 253
	wait_movement
_0F79:
	fade_screen 6, 1, 1, 0x00
	wait_fade
	npc_msg msg_0117_D37R0102_00031
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 10
	lockall
	scrcmd_188 1
	scrcmd_189
	scrcmd_620 0
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement obj_player, _1010
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	fade_screen 6, 1, 1, 0x00
	wait_fade
	npc_msg msg_0117_D37R0102_00032
	waitbutton
	closemsg
	releaseall
	end

_0FDA:
	npc_msg msg_0117_D37R0102_00035
	waitbutton
	closemsg
	releaseall
	end
	.byte 0x00, 0x00, 0x00

_0FE8:
	step 20, 3
	step 22, 2
	step 1, 1
	step_end

_0FF8:
	step 1, 1
	step_end

_1000:
	step 21, 2
	step 22, 4
	step 0, 1
	step_end

_1010:
	step 21, 3
	step 23, 2
	step_end
	.byte 0x14, 0x00, 0x02, 0x00
	.byte 0x17, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D37R0102_011:
	scrcmd_609
	lockall
	callstd std_play_kimono_girl_music
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ne, _1055
	apply_movement obj_D37R0102_dancer, _10B4
	goto _105D

_1055:
	apply_movement obj_D37R0102_dancer, _10C8
_105D:
	wait_movement
	npc_msg msg_0117_D37R0102_00055
	closemsg
	apply_movement obj_D37R0102_dancer, _10E4
	wait_movement
	npc_msg msg_0117_D37R0102_00056
	closemsg
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 31
	gotoif ne, _1094
	apply_movement obj_D37R0102_dancer, _10F0
	goto _109C

_1094:
	apply_movement obj_D37R0102_dancer, _1120
_109C:
	wait_movement
	hide_person 12
	setflag FLAG_UNK_237
	callstd std_fade_end_kimono_girl_music
	releaseall
	setvar VAR_UNK_40E7, 3
	end


_10B4:
	step 75, 1
	step 34, 1
	step 63, 1
	step 14, 2
	step_end

_10C8:
	step 75, 1
	step 34, 1
	step 63, 1
	step 14, 1
	step 13, 1
	step 14, 1
	step_end

_10E4:
	step 75, 1
	step 65, 1
	step_end

_10F0:
	step 13, 1
	step 14, 3
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 14, 7
	step_end

_1120:
	step 12, 1
	step 14, 3
	step 0, 1
	step 61, 1
	step 3, 1
	step 61, 1
	step 1, 1
	step 61, 1
	step 2, 1
	step 61, 1
	step 14, 7
	step_end
scr_seq_D37R0102_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0117_D37R0102_00027
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D37R0102_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 476, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, _1189
	npc_msg msg_0117_D37R0102_00027
	waitbutton
	closemsg
	releaseall
	end

_1189:
	buffer_players_name 0
	npc_msg msg_0117_D37R0102_00028
	closemsg
	apply_movement obj_D37R0102_babyboy1_8, _11A4
	wait_movement
	releaseall
	setflag FLAG_UNK_1C0
	end
	.byte 0x00

_11A4:
	step 15, 2
	step_end
scr_seq_D37R0102_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 0, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 1, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_014:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 2, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 2, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 3, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 3, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 4, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 4, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_017:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 5, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_018:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 6, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 6, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_019:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 7, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 7, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_020:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 8, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 8, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_021:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 9, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 9, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_D37R0102_022:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_255 10, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _144B
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_155 10, 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

_144B:
	npc_msg msg_0117_D37R0102_00053
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D37R0102_023:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_830 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, _1480
	scrcmd_832 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _1521
_1480:
	npc_msg msg_0117_D37R0102_00057
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _1530
	hasenoughmoneyimmediate 32780, 100
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _153F
	submoneyimmediate 100
	scrcmd_553 5, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _154E
	scrcmd_831 32772
	scrcmd_404 32772, 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _155B
	npc_msg msg_0117_D37R0102_00061
	setvar VAR_SPECIAL_x8005, 1
	callstd 2007
_14EB:
	scrcmd_832 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _1530
	scrcmd_553 95, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _1530
	scrcmd_833 32772
	npc_msg msg_0117_D37R0102_00062
	callstd 2026
	goto _1530
	.byte 0x02
	.byte 0x00
_1521:
	npc_msg msg_0117_D37R0102_00058
	waitbutton
	closemsg
	goto _1568
	.byte 0x02, 0x00
_1530:
	npc_msg msg_0117_D37R0102_00059
	waitbutton
	closemsg
	goto _1568
	.byte 0x02, 0x00
_153F:
	npc_msg msg_0117_D37R0102_00060
	waitbutton
	closemsg
	goto _1568
	.byte 0x02, 0x00
_154E:
	npc_msg msg_0117_D37R0102_00064
	closemsg
	goto _1530
	.byte 0x02, 0x00
_155B:
	npc_msg msg_0117_D37R0102_00064
	closemsg
	goto _14EB
	.byte 0x02, 0x00
_1568:
	releaseall
	end
	.balign 4, 0
