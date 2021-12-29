#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0804_T07R0501_0A5E ; 000
	scrdef scr_seq_0804_T07R0501_0A71 ; 001
	scrdef scr_seq_0804_T07R0501_0016 ; 002
	scrdef scr_seq_0804_T07R0501_0120 ; 003
	scrdef scr_seq_0804_T07R0501_07FC ; 004
	scrdef_end

scr_seq_0804_T07R0501_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_172
	gotoif TRUE, scr_seq_0804_T07R0501_004D
	setflag FLAG_UNK_172
	npc_msg 2
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_00F2
	goto scr_seq_0804_T07R0501_006D

scr_seq_0804_T07R0501_004B:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_004D:
	npc_msg 3
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_00F2
	goto scr_seq_0804_T07R0501_006D

scr_seq_0804_T07R0501_006B:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_006D:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0804_T07R0501_00F2
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_0804_T07R0501_00FD
	scrcmd_670 32768, 32772
	comparevartovalue VAR_SPECIAL_x8004, 65535
	gotoif eq, scr_seq_0804_T07R0501_00E7
	mon_has_move VAR_SPECIAL_x800C, MOVE_HIDDEN_POWER, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0108
	buffer_type_name 0, 32772
	npc_msg 5
	goto scr_seq_0804_T07R0501_0118

scr_seq_0804_T07R0501_00E5:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_00E7:
	npc_msg 8
	goto scr_seq_0804_T07R0501_0118

scr_seq_0804_T07R0501_00F0:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_00F2:
	npc_msg 6
	goto scr_seq_0804_T07R0501_0118

scr_seq_0804_T07R0501_00FB:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_00FD:
	npc_msg 7
	goto scr_seq_0804_T07R0501_0118

scr_seq_0804_T07R0501_0106:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_0108:
	buffer_type_name 0, 32772
	npc_msg 4
	goto scr_seq_0804_T07R0501_0118

scr_seq_0804_T07R0501_0116:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_0118:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0804_T07R0501_0120:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg 9
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
scr_seq_0804_T07R0501_0138:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 21, 255, 0
	scrcmd_751 22, 255, 1
	scrcmd_751 20, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0804_T07R0501_0180
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0804_T07R0501_021C
	goto scr_seq_0804_T07R0501_0A43

scr_seq_0804_T07R0501_0180:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 23, 255, 0
	scrcmd_751 24, 255, 1
	scrcmd_751 25, 255, 2
	scrcmd_751 26, 255, 3
	scrcmd_751 27, 255, 4
	scrcmd_751 28, 255, 5
	scrcmd_751 20, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0804_T07R0501_028E
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0804_T07R0501_0319
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0804_T07R0501_03A4
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0804_T07R0501_042F
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0804_T07R0501_04BA
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0804_T07R0501_0545
	goto scr_seq_0804_T07R0501_0138

scr_seq_0804_T07R0501_021C:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 29, 255, 0
	scrcmd_751 30, 255, 1
	scrcmd_751 31, 255, 2
	scrcmd_751 32, 255, 3
	scrcmd_751 20, 255, 4
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0804_T07R0501_05D0
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0804_T07R0501_065B
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0804_T07R0501_06E6
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0804_T07R0501_0771
	goto scr_seq_0804_T07R0501_0138

scr_seq_0804_T07R0501_028E:
	setvar VAR_SPECIAL_x8004, 385
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_02D7
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_0180
scr_seq_0804_T07R0501_02D7:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_0317:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_0319:
	setvar VAR_SPECIAL_x8004, 359
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0362
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_0180
scr_seq_0804_T07R0501_0362:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_03A2:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_03A4:
	setvar VAR_SPECIAL_x8004, 337
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_03ED
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_0180
scr_seq_0804_T07R0501_03ED:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_042D:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_042F:
	setvar VAR_SPECIAL_x8004, 356
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0478
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_0180
scr_seq_0804_T07R0501_0478:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_04B8:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_04BA:
	setvar VAR_SPECIAL_x8004, 401
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0503
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_0180
scr_seq_0804_T07R0501_0503:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_0543:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_0545:
	setvar VAR_SPECIAL_x8004, 395
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_058E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_0180
scr_seq_0804_T07R0501_058E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 15000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 15000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_05CE:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_05D0:
	setvar VAR_SPECIAL_x8004, 251
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0619
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_021C
scr_seq_0804_T07R0501_0619:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_021C

scr_seq_0804_T07R0501_0659:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_065B:
	setvar VAR_SPECIAL_x8004, 265
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_06A4
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_021C
scr_seq_0804_T07R0501_06A4:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_021C

scr_seq_0804_T07R0501_06E4:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_06E6:
	setvar VAR_SPECIAL_x8004, 276
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_072F
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_021C
scr_seq_0804_T07R0501_072F:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_021C

scr_seq_0804_T07R0501_076F:
	.byte 0x02
	.byte 0x00
scr_seq_0804_T07R0501_0771:
	setvar VAR_SPECIAL_x8004, 277
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 12
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_07BA
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0804_T07R0501_021C
scr_seq_0804_T07R0501_07BA:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, scr_seq_0804_T07R0501_0A31
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg 19
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto scr_seq_0804_T07R0501_021C

scr_seq_0804_T07R0501_07FA:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_07FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg 18
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
scr_seq_0804_T07R0501_0814:
	scrcmd_750 1, 1, 0, 1, VAR_TEMP_x4000
	scrcmd_751 33, 255, 0
	scrcmd_751 34, 255, 1
	scrcmd_751 35, 255, 2
	scrcmd_751 20, 255, 3
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0804_T07R0501_0871
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0804_T07R0501_087D
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0804_T07R0501_0889
	goto scr_seq_0804_T07R0501_0A43

scr_seq_0804_T07R0501_0871:
	setorcopyvar VAR_TEMP_x4002, 122
	goto scr_seq_0804_T07R0501_0895

scr_seq_0804_T07R0501_087D:
	setorcopyvar VAR_TEMP_x4002, 133
	goto scr_seq_0804_T07R0501_0895

scr_seq_0804_T07R0501_0889:
	setorcopyvar VAR_TEMP_x4002, 137
	goto scr_seq_0804_T07R0501_0895

scr_seq_0804_T07R0501_0895:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_0804_T07R0501_08B3
	npc_msg 15
	waitbutton
	closemsg
	goto scr_seq_0804_T07R0501_0A52

scr_seq_0804_T07R0501_08B3:
	buffer_species_name_custom 1, VAR_TEMP_x4002, 0, 0
	npc_msg 16
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0804_T07R0501_08D7
	closemsg
	goto scr_seq_0804_T07R0501_0814

scr_seq_0804_T07R0501_08D7:
	comparevartovalue VAR_TEMP_x4002, 122
	gotoif ne, scr_seq_0804_T07R0501_08FB
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 3333
	gotoif lt, scr_seq_0804_T07R0501_0A3A
	goto scr_seq_0804_T07R0501_0930

scr_seq_0804_T07R0501_08FB:
	comparevartovalue VAR_TEMP_x4002, 133
	gotoif ne, scr_seq_0804_T07R0501_091F
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6666
	gotoif lt, scr_seq_0804_T07R0501_0A3A
	goto scr_seq_0804_T07R0501_0930

scr_seq_0804_T07R0501_091F:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 9999
	gotoif lt, scr_seq_0804_T07R0501_0A3A
scr_seq_0804_T07R0501_0930:
	npc_msg 13
	play_se SEQ_SE_DP_REGI
	give_mon VAR_TEMP_x4002, 15, 0, 0, 0, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_species_name_custom 1, VAR_TEMP_x4002, 0, 0
	npc_msg 17
	comparevartovalue VAR_TEMP_x4002, 122
	gotoif ne, scr_seq_0804_T07R0501_096A
	scrcmd_121 3333
	goto scr_seq_0804_T07R0501_0985

scr_seq_0804_T07R0501_096A:
	comparevartovalue VAR_TEMP_x4002, 133
	gotoif ne, scr_seq_0804_T07R0501_0981
	scrcmd_121 6666
	goto scr_seq_0804_T07R0501_0985

scr_seq_0804_T07R0501_0981:
	scrcmd_121 9999
scr_seq_0804_T07R0501_0985:
	scrcmd_118 0
	goto scr_seq_0804_T07R0501_0814

scr_seq_0804_T07R0501_098E:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_0990:
	npc_msg 14
	closemsg
scr_seq_0804_T07R0501_0995:
	comparevartovalue VAR_SPECIAL_x8004, 385
	gotoif ne, scr_seq_0804_T07R0501_09AE
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_09A8:
	.byte 0x16, 0x00, 0x83, 0x00, 0x00, 0x00
scr_seq_0804_T07R0501_09AE:
	comparevartovalue VAR_SPECIAL_x8004, 359
	gotoif ne, scr_seq_0804_T07R0501_09C7
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_09C1:
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
scr_seq_0804_T07R0501_09C7:
	comparevartovalue VAR_SPECIAL_x8004, 337
	gotoif ne, scr_seq_0804_T07R0501_09E0
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_09DA:
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
scr_seq_0804_T07R0501_09E0:
	comparevartovalue VAR_SPECIAL_x8004, 356
	gotoif ne, scr_seq_0804_T07R0501_09F9
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_09F3:
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
scr_seq_0804_T07R0501_09F9:
	comparevartovalue VAR_SPECIAL_x8004, 401
	gotoif ne, scr_seq_0804_T07R0501_0A12
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_0A0C:
	.byte 0x16, 0x00, 0x1f, 0x00
	.byte 0x00, 0x00
scr_seq_0804_T07R0501_0A12:
	comparevartovalue VAR_SPECIAL_x8004, 395
	gotoif ne, scr_seq_0804_T07R0501_0A2B
	goto scr_seq_0804_T07R0501_0180

scr_seq_0804_T07R0501_0A25:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0804_T07R0501_0A2B:
	goto scr_seq_0804_T07R0501_021C

scr_seq_0804_T07R0501_0A31:
	npc_msg 11
	goto scr_seq_0804_T07R0501_0995

scr_seq_0804_T07R0501_0A3A:
	npc_msg 11
	goto scr_seq_0804_T07R0501_0814

scr_seq_0804_T07R0501_0A43:
	npc_msg 10
	waitbutton
	closemsg
	goto scr_seq_0804_T07R0501_0A52

scr_seq_0804_T07R0501_0A50:
	.byte 0x02, 0x00
scr_seq_0804_T07R0501_0A52:
	scrcmd_117
	touchscreen_menu_show
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_0804_T07R0501_0A5E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0804_T07R0501_0A71:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
