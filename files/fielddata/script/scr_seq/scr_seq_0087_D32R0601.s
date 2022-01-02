#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0601.h"
#include "msgdata/msg/msg_0110_D32R0601.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D32R0601_000
	scrdef scr_seq_D32R0601_001
	scrdef scr_seq_D32R0601_002
	scrdef scr_seq_D32R0601_003
	scrdef scr_seq_D32R0601_004
	scrdef scr_seq_D32R0601_005
	scrdef scr_seq_D32R0601_006
	scrdef scr_seq_D32R0601_007
	scrdef scr_seq_D32R0601_008
	scrdef scr_seq_D32R0601_009
	scrdef scr_seq_D32R0601_010
	scrdef scr_seq_D32R0601_011
	scrdef scr_seq_D32R0601_012
	scrdef scr_seq_D32R0601_013
	scrdef scr_seq_D32R0601_014
	scrdef scr_seq_D32R0601_015
	scrdef scr_seq_D32R0601_016
	scrdef_end

scr_seq_D32R0601_014:
	end

scr_seq_D32R0601_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto _0080
	.byte 0x02, 0x00
scr_seq_D32R0601_005:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto _0080
	.byte 0x02, 0x00
_0080:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _06A0
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _06A5
	goto _00A6
	.byte 0x02, 0x00
_00A6:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _06AA
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _06C9
	menu_item_add 41, 255, 2
	menu_item_add 42, 255, 3
	menu_exec
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _014B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0178
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, _0110
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, _01A5
	touchscreen_menu_show
	goto _0132
	.byte 0x02, 0x00
_0110:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, _06E0
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, _06E5
	goto _00A6
	.byte 0x02, 0x00
_0132:
	goto _013A
	.byte 0x02, 0x00
_013A:
	setvar VAR_UNK_414A, 0
	npc_msg msg_0110_D32R0601_00006
	waitbutton
	closemsg
	releaseall
	end

_014B:
	setvar VAR_UNK_4149, 0
	scrcmd_643 0, 3, 32780
	buffer_int 0, 3
	buffer_int 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01D2
	goto _01FC
	.byte 0x02, 0x00
_0178:
	setvar VAR_UNK_4149, 1
	scrcmd_643 0, 3, 32780
	buffer_int 0, 3
	buffer_int 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01D2
	goto _01FC
	.byte 0x02, 0x00
_01A5:
	setvar VAR_UNK_4149, 2
	scrcmd_643 0, 2, 32780
	buffer_int 0, 2
	buffer_int 1, 2
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _01E7
	goto _01FC
	.byte 0x02, 0x00
_01D2:
	npc_msg msg_0110_D32R0601_00008
	scrcmd_444 9, 3, 0, 0
	touchscreen_menu_show
	goto _0132
	.byte 0x02, 0x00
_01E7:
	npc_msg msg_0110_D32R0601_00008
	scrcmd_444 9, 2, 0, 0
	touchscreen_menu_show
	goto _0132
	.byte 0x02, 0x00
_01FC:
	npc_msg msg_0110_D32R0601_00007
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_643 4, 16713, 32780
	scrcmd_645 16386, 16389, 16390
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, _022E
	scrcmd_815 0
_022E:
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, _0132
	scrcmd_690 VAR_TEMP_x4002, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0607
	scrcmd_690 VAR_TEMP_x4005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0607
	comparevartovalue VAR_UNK_4149, 2
	gotoif eq, _028F
	scrcmd_690 VAR_TEMP_x4006, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _0607
_028F:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, _02AA
	touchscreen_menu_show
	goto _0132

_02AA:
	goto _02B2
	.byte 0x02, 0x00
_02B2:
	goto _02BA
	.byte 0x02, 0x00
_02BA:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, _0476
	comparevartovalue VAR_UNK_4149, 1
	callif eq, _0476
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0132
	touchscreen_menu_show
	comparevartovalue VAR_UNK_4149, 2
	gotoif eq, _030A
	goto _04D7
	.byte 0x02, 0x00
_030A:
	npc_msg msg_0110_D32R0601_00043
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	switch VAR_SPECIAL_x800C
	case 0, _035B
	case 1, _03B3
	touchscreen_menu_show
	goto _0132
	.byte 0x02, 0x00
_035B:
	npc_msg msg_0110_D32R0601_00044
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _030A
	touchscreen_menu_show
	closemsg
	scrcmd_226 32, 0, 0, VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03A1
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _03A9
	goto _040B
	.byte 0x02
	.byte 0x00
_03A1:
	goto _030A
	.byte 0x02, 0x00
_03A9:
	scrcmd_283
	goto _030A
	.byte 0x02, 0x00
_03B3:
	npc_msg msg_0110_D32R0601_00044
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _030A
	touchscreen_menu_show
	closemsg
	scrcmd_227 32, 0, 0, VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _03F9
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, _0401
	goto _040B
	.byte 0x02, 0x00
_03F9:
	goto _030A
	.byte 0x02
	.byte 0x00
_0401:
	scrcmd_283
	goto _030A
	.byte 0x02, 0x00
_040B:
	scrcmd_258
	scrcmd_257 154
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x8000
	get_partymon_species VAR_TEMP_x4005, VAR_SPECIAL_x8001
	scrcmd_644 32768, 32769, 32780
	switch VAR_SPECIAL_x800C
	case 1, _047E
	case 2, _0494
	case 3, _04AA
	scrcmd_258
	scrcmd_257 156
	npc_msg msg_0110_D32R0601_00045
	comparevartovalue VAR_UNK_4149, 2
	callif eq, _0476
	call _0711
	goto _04D7
	.byte 0x02, 0x00
_0476:
	setvar VAR_UNK_414A, 255
	return

_047E:
	call _04CD
	buffer_mon_species_name 0, VAR_TEMP_x4002
	npc_msg msg_0110_D32R0601_00029
	goto _04C5
	.byte 0x02, 0x00
_0494:
	call _04CD
	buffer_mon_species_name 0, VAR_TEMP_x4005
	npc_msg msg_0110_D32R0601_00029
	goto _04C5
	.byte 0x02, 0x00
_04AA:
	call _04CD
	buffer_mon_species_name 0, VAR_TEMP_x4002
	buffer_mon_species_name 1, VAR_TEMP_x4005
	npc_msg msg_0110_D32R0601_00030
	goto _04C5
	.byte 0x02, 0x00
_04C5:
	goto _0132
	.byte 0x02, 0x00
_04CD:
	scrcmd_258
	scrcmd_257 157
	scrcmd_283
	return

_04D7:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, _056F
	comparevartovalue VAR_UNK_4149, 1
	callif eq, _058A
	comparevartovalue VAR_UNK_4149, 2
	callif eq, _05A5
	play_se SEQ_SE_DP_KAIDAN2
	goto _050A
	.byte 0x02, 0x00
_050A:
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4149, 0
	callif eq, _05CB
	comparevartovalue VAR_UNK_4149, 1
	callif eq, _05DF
	comparevartovalue VAR_UNK_4149, 2
	callif eq, _05F3
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 15
	comparevartovalue VAR_UNK_4149, 2
	callif eq, _056B
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_682 1
	end

_056B:
	scrcmd_283
	return

_056F:
	npc_msg msg_0110_D32R0601_00032
	scrcmd_049
	closemsg
	apply_movement obj_player, _0618
	apply_movement VAR_SPECIAL_x800D, _0638
	wait_movement
	return

_058A:
	npc_msg msg_0110_D32R0601_00032
	scrcmd_049
	closemsg
	apply_movement obj_player, _0618
	apply_movement VAR_SPECIAL_x800D, _0638
	wait_movement
	return

_05A5:
	npc_msg_var msg_0110_D32R0601_00032
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 155
	closemsg
	apply_movement obj_player, _062C
	apply_movement VAR_SPECIAL_x800D, _064C
	wait_movement
	return

_05CB:
	apply_movement obj_player, _0658
	apply_movement VAR_SPECIAL_x800D, _0680
	wait_movement
	return

_05DF:
	apply_movement obj_player, _0658
	apply_movement VAR_SPECIAL_x800D, _0680
	wait_movement
	return

_05F3:
	apply_movement obj_player, _0670
	apply_movement VAR_SPECIAL_x800D, _0694
	wait_movement
	return

_0607:
	touchscreen_menu_show
	setvar VAR_UNK_414A, 0
	callstd 2041
	end
	.byte 0x00, 0x00, 0x00

_0618:
	step 12, 2
	step 15, 1
	step 12, 2
	step 69, 1
	step_end

_062C:
	step 12, 4
	step 69, 1
	step_end

_0638:
	step 12, 1
	step 15, 1
	step 12, 2
	step 69, 1
	step_end

_064C:
	step 12, 3
	step 69, 1
	step_end

_0658:
	step 21, 2
	step 22, 1
	step 21, 2
	step 0, 1
	step 70, 1
	step_end

_0670:
	step 21, 4
	step 0, 1
	step 70, 1
	step_end

_0680:
	step 21, 1
	step 22, 1
	step 21, 2
	step 70, 1
	step_end

_0694:
	step 21, 3
	step 70, 1
	step_end
_06A0:
	npc_msg msg_0110_D32R0601_00000
	return

_06A5:
	npc_msg msg_0110_D32R0601_00003
	return

_06AA:
	npc_msg msg_0110_D32R0601_00001
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 38, 255, 0
	menu_item_add 39, 255, 1
	return

_06C9:
	npc_msg msg_0110_D32R0601_00004
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 40, 255, 4
	return

_06E0:
	npc_msg msg_0110_D32R0601_00002
	return

_06E5:
	npc_msg msg_0110_D32R0601_00005
	return

scr_seq_D32R0601_001:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_414A, 0
	npc_msg msg_0110_D32R0601_00033
	call _0476
	call _0711
	goto _04D7
	.byte 0x02
	.byte 0x00
_0711:
	scrcmd_345
	scrcmd_254 VAR_SPECIAL_x800C
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_D32R0601_002:
	npc_msg msg_0110_D32R0601_00034
	scrcmd_646 16713
	comparevartovalue VAR_UNK_4051, 1
	callif eq, _074C
	comparevartovalue VAR_UNK_4051, 3
	callif eq, _0754
	goto _0132
	.byte 0x02, 0x00
_074C:
	setvar VAR_UNK_4051, 0
	return

_0754:
	setvar VAR_UNK_4051, 2
	return

scr_seq_D32R0601_003:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, _0798
	comparevartovalue VAR_UNK_4149, 1
	callif eq, _0798
	comparevartovalue VAR_UNK_4051, 1
	callif eq, _079E
	comparevartovalue VAR_UNK_4051, 3
	callif eq, _07B5
	goto _0132
	.byte 0x02, 0x00
_0798:
	scrcmd_680 30
	return

_079E:
	npc_msg msg_0110_D32R0601_00035
	buffer_players_name 0
	npc_msg msg_0110_D32R0601_00037
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4051, 2
	return

_07B5:
	npc_msg msg_0110_D32R0601_00035
	buffer_players_name 0
	npc_msg msg_0110_D32R0601_00036
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4051, 4
	callstd 2040
	return

scr_seq_D32R0601_004:
	goto _0132
	.byte 0x02, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_D32R0601_006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00046
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_007:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00047
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_008:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00048
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_009:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00049
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_010:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00050
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_011:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00051
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_012:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00052
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_013:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0110_D32R0601_00053
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_015:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0110_D32R0601_00054
	waitbutton
	closemsg
	releaseall
	end

scr_seq_D32R0601_016:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg msg_0110_D32R0601_00055
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
