#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0087_D32R0601_0048 ; 000
	scrdef scr_seq_0087_D32R0601_06EA ; 001
	scrdef scr_seq_0087_D32R0601_0723 ; 002
	scrdef scr_seq_0087_D32R0601_075C ; 003
	scrdef scr_seq_0087_D32R0601_07D0 ; 004
	scrdef scr_seq_0087_D32R0601_0064 ; 005
	scrdef scr_seq_0087_D32R0601_07F8 ; 006
	scrdef scr_seq_0087_D32R0601_080B ; 007
	scrdef scr_seq_0087_D32R0601_081E ; 008
	scrdef scr_seq_0087_D32R0601_0831 ; 009
	scrdef scr_seq_0087_D32R0601_0844 ; 010
	scrdef scr_seq_0087_D32R0601_0857 ; 011
	scrdef scr_seq_0087_D32R0601_086A ; 012
	scrdef scr_seq_0087_D32R0601_087D ; 013
	scrdef scr_seq_0087_D32R0601_0046 ; 014
	scrdef scr_seq_0087_D32R0601_0890 ; 015
	scrdef scr_seq_0087_D32R0601_08A1 ; 016
	scrdef_end

scr_seq_0087_D32R0601_0046:
	end

scr_seq_0087_D32R0601_0048:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	goto scr_seq_0087_D32R0601_0080

scr_seq_0087_D32R0601_0062:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0064:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0087_D32R0601_0080

scr_seq_0087_D32R0601_007E:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0080:
	scrcmd_682 0
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0087_D32R0601_06A0
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0087_D32R0601_06A5
	goto scr_seq_0087_D32R0601_00A6

scr_seq_0087_D32R0601_00A4:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_00A6:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0087_D32R0601_06AA
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0087_D32R0601_06C9
	menu_item_add 41, 255, 2
	menu_item_add 42, 255, 3
	menu_exec
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0087_D32R0601_014B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0087_D32R0601_0178
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0087_D32R0601_0110
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0087_D32R0601_01A5
	touchscreen_menu_show
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_010E:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0110:
	comparevartovalue VAR_TEMP_x4004, 0
	callif eq, scr_seq_0087_D32R0601_06E0
	comparevartovalue VAR_TEMP_x4004, 1
	callif eq, scr_seq_0087_D32R0601_06E5
	goto scr_seq_0087_D32R0601_00A6

scr_seq_0087_D32R0601_0130:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0132:
	goto scr_seq_0087_D32R0601_013A

scr_seq_0087_D32R0601_0138:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_013A:
	setvar VAR_UNK_414A, 0
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_014B:
	setvar VAR_UNK_4149, 0
	scrcmd_643 0, 3, 32780
	buffer_int 0, 3
	buffer_int 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0087_D32R0601_01D2
	goto scr_seq_0087_D32R0601_01FC

scr_seq_0087_D32R0601_0176:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0178:
	setvar VAR_UNK_4149, 1
	scrcmd_643 0, 3, 32780
	buffer_int 0, 3
	buffer_int 1, 3
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0087_D32R0601_01D2
	goto scr_seq_0087_D32R0601_01FC

scr_seq_0087_D32R0601_01A3:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_01A5:
	setvar VAR_UNK_4149, 2
	scrcmd_643 0, 2, 32780
	buffer_int 0, 2
	buffer_int 1, 2
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0087_D32R0601_01E7
	goto scr_seq_0087_D32R0601_01FC

scr_seq_0087_D32R0601_01D0:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_01D2:
	npc_msg 8
	scrcmd_444 9, 3, 0, 0
	touchscreen_menu_show
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_01E5:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_01E7:
	npc_msg 8
	scrcmd_444 9, 2, 0, 0
	touchscreen_menu_show
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_01FA:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_01FC:
	npc_msg 7
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_643 4, 16713, 32780
	scrcmd_645 16386, 16389, 16390
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif ne, scr_seq_0087_D32R0601_022E
	scrcmd_815 0
scr_seq_0087_D32R0601_022E:
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x4002, 255
	gotoif eq, scr_seq_0087_D32R0601_0132
	scrcmd_690 16386, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0087_D32R0601_0607
	scrcmd_690 16389, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0087_D32R0601_0607
	comparevartovalue VAR_UNK_4149, 2
	gotoif eq, scr_seq_0087_D32R0601_028F
	scrcmd_690 16390, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0087_D32R0601_0607
scr_seq_0087_D32R0601_028F:
	get_partymon_species VAR_TEMP_x4002, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0087_D32R0601_02AA
	touchscreen_menu_show
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_02AA:
	goto scr_seq_0087_D32R0601_02B2

scr_seq_0087_D32R0601_02B0:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_02B2:
	goto scr_seq_0087_D32R0601_02BA

scr_seq_0087_D32R0601_02B8:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_02BA:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_0087_D32R0601_0476
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_0087_D32R0601_0476
	setvar VAR_TEMP_x4000, 0
	heal_party
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0087_D32R0601_0132
	touchscreen_menu_show
	comparevartovalue VAR_UNK_4149, 2
	gotoif eq, scr_seq_0087_D32R0601_030A
	goto scr_seq_0087_D32R0601_04D7

scr_seq_0087_D32R0601_0308:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_030A:
	npc_msg 43
	touchscreen_menu_hide
	menu_init_std_gmm 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 14, 255, 0
	menu_item_add 15, 255, 1
	menu_item_add 5, 255, 2
	menu_exec
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0087_D32R0601_035B
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0087_D32R0601_03B3
	touchscreen_menu_show
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_0359:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_035B:
	npc_msg 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0087_D32R0601_030A
	touchscreen_menu_show
	closemsg
	scrcmd_226 32, 0, 0, 32780
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0087_D32R0601_03A1
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0087_D32R0601_03A9
	goto scr_seq_0087_D32R0601_040B

scr_seq_0087_D32R0601_039F:
	.byte 0x02
	.byte 0x00
scr_seq_0087_D32R0601_03A1:
	goto scr_seq_0087_D32R0601_030A

scr_seq_0087_D32R0601_03A7:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_03A9:
	scrcmd_283
	goto scr_seq_0087_D32R0601_030A

scr_seq_0087_D32R0601_03B1:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_03B3:
	npc_msg 44
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0087_D32R0601_030A
	touchscreen_menu_show
	closemsg
	scrcmd_227 32, 0, 0, 32780
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0087_D32R0601_03F9
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0087_D32R0601_0401
	goto scr_seq_0087_D32R0601_040B

scr_seq_0087_D32R0601_03F7:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_03F9:
	goto scr_seq_0087_D32R0601_030A

scr_seq_0087_D32R0601_03FF:
	.byte 0x02
	.byte 0x00
scr_seq_0087_D32R0601_0401:
	scrcmd_283
	goto scr_seq_0087_D32R0601_030A

scr_seq_0087_D32R0601_0409:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_040B:
	scrcmd_258
	scrcmd_257 154
	get_partymon_species VAR_TEMP_x4002, VAR_SPECIAL_x8000
	get_partymon_species VAR_TEMP_x4005, VAR_SPECIAL_x8001
	scrcmd_644 32768, 32769, 32780
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0087_D32R0601_047E
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0087_D32R0601_0494
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0087_D32R0601_04AA
	scrcmd_258
	scrcmd_257 156
	npc_msg 45
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_0087_D32R0601_0476
	call scr_seq_0087_D32R0601_0711
	goto scr_seq_0087_D32R0601_04D7

scr_seq_0087_D32R0601_0474:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0476:
	setvar VAR_UNK_414A, 255
	return

scr_seq_0087_D32R0601_047E:
	call scr_seq_0087_D32R0601_04CD
	buffer_mon_species_name 0, VAR_TEMP_x4002
	npc_msg 29
	goto scr_seq_0087_D32R0601_04C5

scr_seq_0087_D32R0601_0492:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0494:
	call scr_seq_0087_D32R0601_04CD
	buffer_mon_species_name 0, VAR_TEMP_x4005
	npc_msg 29
	goto scr_seq_0087_D32R0601_04C5

scr_seq_0087_D32R0601_04A8:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_04AA:
	call scr_seq_0087_D32R0601_04CD
	buffer_mon_species_name 0, VAR_TEMP_x4002
	buffer_mon_species_name 1, VAR_TEMP_x4005
	npc_msg 30
	goto scr_seq_0087_D32R0601_04C5

scr_seq_0087_D32R0601_04C3:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_04C5:
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_04CB:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_04CD:
	scrcmd_258
	scrcmd_257 157
	scrcmd_283
	return

scr_seq_0087_D32R0601_04D7:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_0087_D32R0601_056F
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_0087_D32R0601_058A
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_0087_D32R0601_05A5
	play_se SEQ_SE_DP_KAIDAN2
	goto scr_seq_0087_D32R0601_050A

scr_seq_0087_D32R0601_0508:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_050A:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_815 0
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_0087_D32R0601_05CB
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_0087_D32R0601_05DF
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_0087_D32R0601_05F3
	scrcmd_420 59
	scrcmd_436
	scrcmd_627 15
	comparevartovalue VAR_UNK_4149, 2
	callif eq, scr_seq_0087_D32R0601_056B
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_682 1
	end

scr_seq_0087_D32R0601_056B:
	scrcmd_283
	return

scr_seq_0087_D32R0601_056F:
	npc_msg 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0087_D32R0601_0618
	apply_movement VAR_SPECIAL_x800D, scr_seq_0087_D32R0601_0638
	wait_movement
	return

scr_seq_0087_D32R0601_058A:
	npc_msg 32
	scrcmd_049
	closemsg
	apply_movement 255, scr_seq_0087_D32R0601_0618
	apply_movement VAR_SPECIAL_x800D, scr_seq_0087_D32R0601_0638
	wait_movement
	return

scr_seq_0087_D32R0601_05A5:
	scrcmd_047 32
	wait 10, VAR_SPECIAL_x800C
	scrcmd_258
	scrcmd_257 155
	closemsg
	apply_movement 255, scr_seq_0087_D32R0601_062C
	apply_movement VAR_SPECIAL_x800D, scr_seq_0087_D32R0601_064C
	wait_movement
	return

scr_seq_0087_D32R0601_05CB:
	apply_movement 255, scr_seq_0087_D32R0601_0658
	apply_movement VAR_SPECIAL_x800D, scr_seq_0087_D32R0601_0680
	wait_movement
	return

scr_seq_0087_D32R0601_05DF:
	apply_movement 255, scr_seq_0087_D32R0601_0658
	apply_movement VAR_SPECIAL_x800D, scr_seq_0087_D32R0601_0680
	wait_movement
	return

scr_seq_0087_D32R0601_05F3:
	apply_movement 255, scr_seq_0087_D32R0601_0670
	apply_movement VAR_SPECIAL_x800D, scr_seq_0087_D32R0601_0694
	wait_movement
	return

scr_seq_0087_D32R0601_0607:
	touchscreen_menu_show
	setvar VAR_UNK_414A, 0
	callstd 2041
	end

scr_seq_0087_D32R0601_0615:
	.byte 0x00, 0x00, 0x00

scr_seq_0087_D32R0601_0618:
	step 12, 2
	step 15, 1
	step 12, 2
	step 69, 1
	step_end

scr_seq_0087_D32R0601_062C:
	step 12, 4
	step 69, 1
	step_end

scr_seq_0087_D32R0601_0638:
	step 12, 1
	step 15, 1
	step 12, 2
	step 69, 1
	step_end

scr_seq_0087_D32R0601_064C:
	step 12, 3
	step 69, 1
	step_end

scr_seq_0087_D32R0601_0658:
	step 21, 2
	step 22, 1
	step 21, 2
	step 0, 1
	step 70, 1
	step_end

scr_seq_0087_D32R0601_0670:
	step 21, 4
	step 0, 1
	step 70, 1
	step_end

scr_seq_0087_D32R0601_0680:
	step 21, 1
	step 22, 1
	step 21, 2
	step 70, 1
	step_end

scr_seq_0087_D32R0601_0694:
	step 21, 3
	step 70, 1
	step_end
scr_seq_0087_D32R0601_06A0:
	npc_msg 0
	return

scr_seq_0087_D32R0601_06A5:
	npc_msg 3
	return

scr_seq_0087_D32R0601_06AA:
	npc_msg 1
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 38, 255, 0
	menu_item_add 39, 255, 1
	return

scr_seq_0087_D32R0601_06C9:
	npc_msg 4
	touchscreen_menu_hide
	menu_init 1, 1, 0, 1, VAR_SPECIAL_x800C
	menu_item_add 40, 255, 4
	return

scr_seq_0087_D32R0601_06E0:
	npc_msg 2
	return

scr_seq_0087_D32R0601_06E5:
	npc_msg 5
	return

scr_seq_0087_D32R0601_06EA:
	scrcmd_682 0
	setvar VAR_TEMP_x4003, 1
	setvar VAR_UNK_414A, 0
	npc_msg 33
	call scr_seq_0087_D32R0601_0476
	call scr_seq_0087_D32R0601_0711
	goto scr_seq_0087_D32R0601_04D7

scr_seq_0087_D32R0601_070F:
	.byte 0x02
	.byte 0x00
scr_seq_0087_D32R0601_0711:
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	return

scr_seq_0087_D32R0601_0723:
	npc_msg 34
	scrcmd_646 16713
	comparevartovalue VAR_UNK_4051, 1
	callif eq, scr_seq_0087_D32R0601_074C
	comparevartovalue VAR_UNK_4051, 3
	callif eq, scr_seq_0087_D32R0601_0754
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_074A:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_074C:
	setvar VAR_UNK_4051, 0
	return

scr_seq_0087_D32R0601_0754:
	setvar VAR_UNK_4051, 2
	return

scr_seq_0087_D32R0601_075C:
	comparevartovalue VAR_UNK_4149, 0
	callif eq, scr_seq_0087_D32R0601_0798
	comparevartovalue VAR_UNK_4149, 1
	callif eq, scr_seq_0087_D32R0601_0798
	comparevartovalue VAR_UNK_4051, 1
	callif eq, scr_seq_0087_D32R0601_079E
	comparevartovalue VAR_UNK_4051, 3
	callif eq, scr_seq_0087_D32R0601_07B5
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_0796:
	.byte 0x02, 0x00
scr_seq_0087_D32R0601_0798:
	scrcmd_680 30
	return

scr_seq_0087_D32R0601_079E:
	npc_msg 35
	buffer_players_name 0
	npc_msg 37
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4051, 2
	return

scr_seq_0087_D32R0601_07B5:
	npc_msg 35
	buffer_players_name 0
	npc_msg 36
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setvar VAR_UNK_4051, 4
	callstd 2040
	return

scr_seq_0087_D32R0601_07D0:
	goto scr_seq_0087_D32R0601_0132

scr_seq_0087_D32R0601_07D6:
	.byte 0x02, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x3f, 0x00, 0x01, 0x00
	.byte 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0087_D32R0601_07F8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 46
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_080B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 47
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_081E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 48
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_0831:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 49
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_0844:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 50
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_0857:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 51
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_086A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 52
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_087D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_0890:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 54
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0087_D32R0601_08A1:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 55
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
