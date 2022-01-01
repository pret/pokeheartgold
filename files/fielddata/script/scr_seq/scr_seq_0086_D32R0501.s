#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0501.h"
#include "msgdata/msg/msg_0109_D32R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0501_000
	scrdef scr_seq_D32R0501_001
	scrdef scr_seq_D32R0501_002
	scrdef scr_seq_D32R0501_003
	scrdef scr_seq_D32R0501_004
	scrdef scr_seq_D32R0501_005
	scrdef scr_seq_D32R0501_006
	scrdef scr_seq_D32R0501_007
	scrdef scr_seq_D32R0501_008
	scrdef scr_seq_D32R0501_009
	scrdef scr_seq_D32R0501_010
	scrdef scr_seq_D32R0501_011
	scrdef scr_seq_D32R0501_012
	scrdef scr_seq_D32R0501_013
	scrdef_end

scr_seq_D32R0501_013:
	end

scr_seq_D32R0501_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto _0074
	.byte 0x02, 0x00
scr_seq_D32R0501_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto _0074
	.byte 0x02, 0x00
_0074:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _068C
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _0691
	goto _009A
	.byte 0x02, 0x00
_009A:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _0696
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _06B5
	menu_item_add 41, 255, 2
	menu_item_add 42, 255, 3
	menu_exec
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _013F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _016C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _0104
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, _0199
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_0104:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _06CC
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _06D1
	goto _009A
	.byte 0x02, 0x00
_0126:
	goto _012E
	.byte 0x02, 0x00
_012E:
	setvar VAR_UNK_4147, 0
	npc_msg msg_0109_D32R0501_00006
	waitbutton
	closemsg
	releaseall
	end

_013F:
	setvar VAR_UNK_4148, 0
	scrcmd_637 0, 3, 32780
	buffer_int 0, 3
	buffer_int 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01C6
	goto _01F0
	.byte 0x02, 0x00
_016C:
	setvar VAR_UNK_4148, 1
	scrcmd_637 0, 3, 32780
	buffer_int 0, 3
	buffer_int 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01C6
	goto _01F0
	.byte 0x02, 0x00
_0199:
	setvar VAR_UNK_4148, 2
	scrcmd_637 0, 2, 32780
	buffer_int 0, 2
	buffer_int 1, 2
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01DB
	goto _01F0
	.byte 0x02, 0x00
_01C6:
	npc_msg msg_0109_D32R0501_00008
	scrcmd_444 9, 3, 0, 0
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_01DB:
	npc_msg msg_0109_D32R0501_00008
	scrcmd_444 9, 2, 0, 0
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_01F0:
	npc_msg msg_0109_D32R0501_00007
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_637 4, 16712, 32780
	scrcmd_639 16386, 16389, 16390
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, _0222
	scrcmd_815 0
_0222:
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, _0126
	scrcmd_690 VAR_TEMP_x4002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _05FB
	scrcmd_690 VAR_TEMP_x4005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _05FB
	comparevartovalue VAR_UNK_4148, 2
	gotoif eq, _0283
	scrcmd_690 VAR_TEMP_x4006, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _05FB
_0283:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _029E
	touchscreen_menu_show
	goto _0126

_029E:
	goto _02A6
	.byte 0x02, 0x00
_02A6:
	goto _02AE
	.byte 0x02, 0x00
_02AE:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, _046A
	comparevartovalue VAR_UNK_4148, 1
	callif eq, _046A
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0126
	touchscreen_menu_show
	comparevartovalue VAR_UNK_4148, 2
	gotoif eq, _02FE
	goto _04CB
	.byte 0x02, 0x00
_02FE:
	npc_msg msg_0109_D32R0501_00043
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _034F
	case 1, _03A7
	touchscreen_menu_show
	goto _0126
	.byte 0x02, 0x00
_034F:
	npc_msg msg_0109_D32R0501_00044
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02FE
	touchscreen_menu_show
	closemsg
	scrcmd_226 31, 0, 0, 32780
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0395
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _039D
	goto _03FF
	.byte 0x02, 0x00
_0395:
	goto _02FE
	.byte 0x02, 0x00
_039D:
	scrcmd_283
	goto _02FE
	.byte 0x02, 0x00
_03A7:
	npc_msg msg_0109_D32R0501_00044
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _02FE
	touchscreen_menu_show
	closemsg
	scrcmd_227 31, 0, 0, 32780
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03ED
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _03F5
	goto _03FF
	.byte 0x02, 0x00
_03ED:
	goto _02FE
	.byte 0x02, 0x00
_03F5:
	scrcmd_283
	goto _02FE
	.byte 0x02, 0x00
_03FF:
	scrcmd_258
	scrcmd_257 136
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x8000
	get_partymon_species VAR_TEMP_x4005, VAR_SPECIAL_x8001
	scrcmd_638 32768, 32769, 32780
	switch VAR_SPECIAL_x800C
	case 1, _0472
	case 2, _0488
	case 3, _049E
	scrcmd_258
	scrcmd_257 138
	npc_msg msg_0109_D32R0501_00045
	comparevartovalue VAR_UNK_4148, 2
	callif eq, _046A
	call _06FD
	goto _04CB
	.byte 0x02, 0x00
_046A:
	setvar VAR_UNK_4147, 255
	return

_0472:
	call _04C1
	buffer_mon_species_name 0, VAR_TEMP_x4002
	npc_msg msg_0109_D32R0501_00029
	goto _04B9
	.byte 0x02, 0x00
_0488:
	call _04C1
	buffer_mon_species_name 0, VAR_TEMP_x4005
	npc_msg msg_0109_D32R0501_00029
	goto _04B9
	.byte 0x02, 0x00
_049E:
	call _04C1
	buffer_mon_species_name 0, VAR_TEMP_x4002
	buffer_mon_species_name 1, VAR_TEMP_x4005
	npc_msg msg_0109_D32R0501_00030
	goto _04B9
	.byte 0x02, 0x00
_04B9:
	goto _0126
	.byte 0x02
	.byte 0x00
_04C1:
	scrcmd_258
	scrcmd_257 139
	scrcmd_283
	return

_04CB:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, _0563
	comparevartovalue VAR_UNK_4148, 1
	callif eq, _057E
	comparevartovalue VAR_UNK_4148, 2
	callif eq, _0599
	play_se SEQ_SE_DP_KAIDAN2
	goto _04FE
	.byte 0x02, 0x00
_04FE:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4148, 0
	callif eq, _05BF
	comparevartovalue VAR_UNK_4148, 1
	callif eq, _05D3
	comparevartovalue VAR_UNK_4148, 2
	callif eq, _05E7
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 11
	comparevartovalue VAR_UNK_4148, 2
	callif eq, _055F
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_682 1
	end

_055F:
	scrcmd_283
	return

_0563:
	npc_msg msg_0109_D32R0501_00032
	scrcmd_049
	closemsg
	apply_movement obj_player, _060C
	apply_movement VAR_SPECIAL_x800D, _062C
	wait_movement
	return

_057E:
	npc_msg msg_0109_D32R0501_00032
	scrcmd_049
	closemsg
	apply_movement obj_player, _060C
	apply_movement VAR_SPECIAL_x800D, _062C
	wait_movement
	return

_0599:
	npc_msg_var msg_0109_D32R0501_00032
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 137
	closemsg
	apply_movement obj_player, _0618
	apply_movement VAR_SPECIAL_x800D, _0638
	wait_movement
	return

_05BF:
	apply_movement obj_player, _064C
	apply_movement VAR_SPECIAL_x800D, _0670
	wait_movement
	return

_05D3:
	apply_movement obj_player, _064C
	apply_movement VAR_SPECIAL_x800D, _0670
	wait_movement
	return

_05E7:
	apply_movement obj_player, _065C
	apply_movement VAR_SPECIAL_x800D, _067C
	wait_movement
	return

_05FB:
	touchscreen_menu_show
	setvar VAR_UNK_4147, 0
	callstd 2041
	end
	.byte 0x00, 0x00, 0x00

_060C:
	step 14, 6
	step 69, 1
	step_end

_0618:
	step 14, 3
	step 12, 1
	step 14, 3
	step 69, 1
	step_end

_062C:
	step 14, 5
	step 69, 1
	step_end

_0638:
	step 14, 2
	step 12, 1
	step 14, 3
	step 69, 1
	step_end

_064C:
	step 23, 6
	step 70, 1
	step 2, 1
	step_end

_065C:
	step 23, 6
	step 21, 1
	step 70, 1
	step 2, 1
	step_end

_0670:
	step 23, 5
	step 70, 1
	step_end

_067C:
	step 21, 1
	step 23, 5
	step 70, 1
	step_end
_068C:
	npc_msg msg_0109_D32R0501_00000
	return

_0691:
	npc_msg msg_0109_D32R0501_00003
	return

_0696:
	npc_msg msg_0109_D32R0501_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 38, 255, 0
	menu_item_add 39, 255, 1
	return

_06B5:
	npc_msg msg_0109_D32R0501_00004
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 40, 255, 4
	return

_06CC:
	npc_msg msg_0109_D32R0501_00002
	return

_06D1:
	npc_msg msg_0109_D32R0501_00005
	return

scr_seq_D32R0501_001:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_4147, 0
	npc_msg msg_0109_D32R0501_00033
	call _046A
	call _06FD
	goto _04CB
	.byte 0x02, 0x00
_06FD:
	scrcmd_345
	scrcmd_254 VAR_SPECIAL_x800C
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_D32R0501_002:
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00034
	scrcmd_640 16712
	comparevartovalue VAR_UNK_4050, 1
	callif eq, _073C
	comparevartovalue VAR_UNK_4050, 3
	callif eq, _0744
	goto _0126
	.byte 0x02, 0x00
_073C:
	setvar VAR_UNK_4050, 0
	return

_0744:
	setvar VAR_UNK_4050, 2
	return

scr_seq_D32R0501_003:
	comparevartovalue VAR_UNK_4148, 0
	callif eq, _0788
	comparevartovalue VAR_UNK_4148, 1
	callif eq, _0788
	comparevartovalue VAR_UNK_4050, 1
	callif eq, _078E
	comparevartovalue VAR_UNK_4050, 3
	callif eq, _07A5
	goto _0126
	.byte 0x02, 0x00
_0788:
	scrcmd_680 28
	return

_078E:
	npc_msg msg_0109_D32R0501_00035
	buffer_players_name 0
	npc_msg msg_0109_D32R0501_00037
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4050, 2
	return

_07A5:
	npc_msg msg_0109_D32R0501_00035
	buffer_players_name 0
	npc_msg msg_0109_D32R0501_00036
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4050, 4
	callstd 2040
	return

scr_seq_D32R0501_004:
	goto _0126
	.byte 0x02, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D32R0501_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00046
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0501_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00047
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0501_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00048
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0501_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00049
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0501_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00050
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0501_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00051
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0501_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0109_D32R0501_00052
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
