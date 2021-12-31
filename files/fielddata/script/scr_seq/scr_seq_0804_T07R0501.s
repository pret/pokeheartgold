#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0501.h"
#include "msgdata/msg/msg_0509_T07R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T07R0501_000
	scrdef scr_seq_T07R0501_001
	scrdef scr_seq_T07R0501_002
	scrdef scr_seq_T07R0501_003
	scrdef scr_seq_T07R0501_004
	scrdef_end

scr_seq_T07R0501_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_172
	gotoif TRUE, _004D
	setflag FLAG_UNK_172
	npc_msg msg_0509_T07R0501_00002
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00F2
	goto _006D
	.byte 0x02, 0x00
_004D:
	npc_msg msg_0509_T07R0501_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00F2
	goto _006D
	.byte 0x02, 0x00
_006D:
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, _00F2
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, _00FD
	scrcmd_670 32768, 32772
	comparevartovalue VAR_SPECIAL_x8004, 65535
	gotoif eq, _00E7
	mon_has_move VAR_SPECIAL_x800C, MOVE_HIDDEN_POWER, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0108
	buffer_type_name 0, 32772
	npc_msg msg_0509_T07R0501_00005
	goto _0118
	.byte 0x02, 0x00
_00E7:
	npc_msg msg_0509_T07R0501_00008
	goto _0118
	.byte 0x02, 0x00
_00F2:
	npc_msg msg_0509_T07R0501_00006
	goto _0118
	.byte 0x02, 0x00
_00FD:
	npc_msg msg_0509_T07R0501_00007
	goto _0118
	.byte 0x02, 0x00
_0108:
	buffer_type_name 0, 32772
	npc_msg msg_0509_T07R0501_00004
	goto _0118
	.byte 0x02, 0x00
_0118:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0501_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg msg_0509_T07R0501_00009
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
_0138:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 21, 255, 0
	menu_item_add 22, 255, 1
	menu_item_add 20, 255, 2
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0180
	case 1, _021C
	goto _0A43

_0180:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 23, 255, 0
	menu_item_add 24, 255, 1
	menu_item_add 25, 255, 2
	menu_item_add 26, 255, 3
	menu_item_add 27, 255, 4
	menu_item_add 28, 255, 5
	menu_item_add 20, 255, 6
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _028E
	case 1, _0319
	case 2, _03A4
	case 3, _042F
	case 4, _04BA
	case 5, _0545
	goto _0138

_021C:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 29, 255, 0
	menu_item_add 30, 255, 1
	menu_item_add 31, 255, 2
	menu_item_add 32, 255, 3
	menu_item_add 20, 255, 4
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _05D0
	case 1, _065B
	case 2, _06E6
	case 3, _0771
	goto _0138

_028E:
	goto_if_no_item_space ITEM_TM58, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _02D7
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0180
_02D7:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 2000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 2000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0180
	.byte 0x02, 0x00
_0319:
	goto_if_no_item_space ITEM_TM32, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0362
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0180
_0362:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 4000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 4000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0180
	.byte 0x02, 0x00
_03A4:
	goto_if_no_item_space ITEM_TM10, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _03ED
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0180
_03ED:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 6000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0180
	.byte 0x02, 0x00
_042F:
	goto_if_no_item_space ITEM_TM29, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0478
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0180
_0478:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0180
	.byte 0x02, 0x00
_04BA:
	goto_if_no_item_space ITEM_TM74, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0503
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0180
_0503:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 10000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 10000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0180
	.byte 0x02, 0x00
_0545:
	goto_if_no_item_space ITEM_TM68, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _058E
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0180
_058E:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 15000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 15000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _0180
	.byte 0x02, 0x00
_05D0:
	goto_if_no_item_space ITEM_SILK_SCARF, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0619
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _021C
_0619:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _021C
	.byte 0x02, 0x00
_065B:
	goto_if_no_item_space ITEM_WIDE_LENS, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _06A4
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _021C
_06A4:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _021C
	.byte 0x02, 0x00
_06E6:
	goto_if_no_item_space ITEM_ZOOM_LENS, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _072F
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _021C
_072F:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _021C
	.byte 0x02
	.byte 0x00
_0771:
	goto_if_no_item_space ITEM_METRONOME, 1, _0990
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg msg_0509_T07R0501_00012
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _07BA
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _021C
_07BA:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 1000
	gotoif lt, _0A31
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	scrcmd_121 1000
	scrcmd_118 0
	buffer_item_name 0, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 1, VAR_SPECIAL_x800C
	npc_msg msg_0509_T07R0501_00019
	giveitem VAR_SPECIAL_x8004, 1, VAR_SPECIAL_x800C
	goto _021C
	.byte 0x02, 0x00
scr_seq_T07R0501_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_784 3, 0
	npc_msg msg_0509_T07R0501_00018
	touchscreen_menu_hide
	scrcmd_116 0, 20, 2
_0814:
	menu_init 1, 1, 0, 1, VAR_TEMP_x4000
	menu_item_add 33, 255, 0
	menu_item_add 34, 255, 1
	menu_item_add 35, 255, 2
	menu_item_add 20, 255, 3
	menu_exec
	switch VAR_TEMP_x4000
	case 0, _0871
	case 1, _087D
	case 2, _0889
	goto _0A43

_0871:
	setorcopyvar VAR_TEMP_x4002, 122
	goto _0895

_087D:
	setorcopyvar VAR_TEMP_x4002, 133
	goto _0895

_0889:
	setorcopyvar VAR_TEMP_x4002, 137
	goto _0895

_0895:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, _08B3
	npc_msg msg_0509_T07R0501_00015
	waitbutton
	closemsg
	goto _0A52

_08B3:
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg msg_0509_T07R0501_00016
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _08D7
	closemsg
	goto _0814

_08D7:
	comparevartovalue VAR_TEMP_x4002, 122
	gotoif ne, _08FB
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 3333
	gotoif lt, _0A3A
	goto _0930

_08FB:
	comparevartovalue VAR_TEMP_x4002, 133
	gotoif ne, _091F
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 6666
	gotoif lt, _0A3A
	goto _0930

_091F:
	scrcmd_119 32774
	comparevartovalue VAR_SPECIAL_x8006, 9999
	gotoif lt, _0A3A
_0930:
	npc_msg msg_0509_T07R0501_00013
	play_se SEQ_SE_DP_REGI
	give_mon VAR_TEMP_x4002, 15, 0, 0, 0, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_species_name 1, VAR_TEMP_x4002, 0, 0
	npc_msg msg_0509_T07R0501_00017
	comparevartovalue VAR_TEMP_x4002, 122
	gotoif ne, _096A
	scrcmd_121 3333
	goto _0985

_096A:
	comparevartovalue VAR_TEMP_x4002, 133
	gotoif ne, _0981
	scrcmd_121 6666
	goto _0985

_0981:
	scrcmd_121 9999
_0985:
	scrcmd_118 0
	goto _0814
	.byte 0x02, 0x00
_0990:
	npc_msg msg_0509_T07R0501_00014
	closemsg
_0995:
	comparevartovalue VAR_SPECIAL_x8004, 385
	gotoif ne, _09AE
	goto _0180
	.byte 0x16, 0x00, 0x83, 0x00, 0x00, 0x00
_09AE:
	comparevartovalue VAR_SPECIAL_x8004, 359
	gotoif ne, _09C7
	goto _0180
	.byte 0x16, 0x00, 0x6a, 0x00, 0x00, 0x00
_09C7:
	comparevartovalue VAR_SPECIAL_x8004, 337
	gotoif ne, _09E0
	goto _0180
	.byte 0x16, 0x00, 0x51, 0x00, 0x00, 0x00
_09E0:
	comparevartovalue VAR_SPECIAL_x8004, 356
	gotoif ne, _09F9
	goto _0180
	.byte 0x16, 0x00, 0x38, 0x00, 0x00, 0x00
_09F9:
	comparevartovalue VAR_SPECIAL_x8004, 401
	gotoif ne, _0A12
	goto _0180
	.byte 0x16, 0x00, 0x1f, 0x00
	.byte 0x00, 0x00
_0A12:
	comparevartovalue VAR_SPECIAL_x8004, 395
	gotoif ne, _0A2B
	goto _0180
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
_0A2B:
	goto _021C

_0A31:
	npc_msg msg_0509_T07R0501_00011
	goto _0995

_0A3A:
	npc_msg msg_0509_T07R0501_00011
	goto _0814

_0A43:
	npc_msg msg_0509_T07R0501_00010
	waitbutton
	closemsg
	goto _0A52
	.byte 0x02, 0x00
_0A52:
	scrcmd_117
	touchscreen_menu_show
	scrcmd_784 3, 1
	releaseall
	end

scr_seq_T07R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0509_T07R0501_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T07R0501_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0509_T07R0501_00001
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
