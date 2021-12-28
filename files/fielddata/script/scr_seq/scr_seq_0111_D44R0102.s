#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0111_D44R0102_019C ; 000
	scrdef scr_seq_0111_D44R0102_0318 ; 001
	scrdef scr_seq_0111_D44R0102_001A ; 002
	scrdef scr_seq_0111_D44R0102_034E ; 003
	scrdef scr_seq_0111_D44R0102_0473 ; 004
	scrdef scr_seq_0111_D44R0102_0788 ; 005
	scrdef_end

scr_seq_0111_D44R0102_001A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0111_D44R0102_002B
	clearflag FLAG_UNK_189
	end

scr_seq_0111_D44R0102_002B:
	comparevartovalue VAR_UNK_40FC, 2
	gotoif ge, scr_seq_0111_D44R0102_0047
	comparevartovalue VAR_UNK_40FC, 1
	callif eq, scr_seq_0111_D44R0102_015E
	end

scr_seq_0111_D44R0102_0047:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0111_D44R0102_0062
	clearflag FLAG_UNK_20F
	goto scr_seq_0111_D44R0102_007D

scr_seq_0111_D44R0102_0062:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0111_D44R0102_0079
	clearflag FLAG_UNK_20F
	goto scr_seq_0111_D44R0102_007D

scr_seq_0111_D44R0102_0079:
	setflag FLAG_UNK_20F
scr_seq_0111_D44R0102_007D:
	scrcmd_147 27, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0111_D44R0102_00F6
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0111_D44R0102_00AB
	clearflag FLAG_UNK_209
	goto scr_seq_0111_D44R0102_00F4

scr_seq_0111_D44R0102_00AB:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0111_D44R0102_00C2
	clearflag FLAG_UNK_209
	goto scr_seq_0111_D44R0102_00F4

scr_seq_0111_D44R0102_00C2:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0111_D44R0102_00D9
	clearflag FLAG_UNK_209
	goto scr_seq_0111_D44R0102_00F4

scr_seq_0111_D44R0102_00D9:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0111_D44R0102_00F0
	clearflag FLAG_UNK_209
	goto scr_seq_0111_D44R0102_00F4

scr_seq_0111_D44R0102_00F0:
	setflag FLAG_UNK_209
scr_seq_0111_D44R0102_00F4:
	end

scr_seq_0111_D44R0102_00F6:
	scrcmd_142 27, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0111_D44R0102_0158
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0111_D44R0102_0124
	clearflag FLAG_UNK_209
	goto scr_seq_0111_D44R0102_0156

scr_seq_0111_D44R0102_0124:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_0111_D44R0102_013B
	clearflag FLAG_UNK_209
	goto scr_seq_0111_D44R0102_0156

scr_seq_0111_D44R0102_013B:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0111_D44R0102_0152
	clearflag FLAG_UNK_209
	goto scr_seq_0111_D44R0102_0156

scr_seq_0111_D44R0102_0152:
	setflag FLAG_UNK_209
scr_seq_0111_D44R0102_0156:
	end

scr_seq_0111_D44R0102_0158:
	setflag FLAG_UNK_209
	end

scr_seq_0111_D44R0102_015E:
	get_starter_choice VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 152
	gotoif ne, scr_seq_0111_D44R0102_017B
	setvar VAR_OBJ_0, 1048
	goto scr_seq_0111_D44R0102_019A

scr_seq_0111_D44R0102_017B:
	comparevartovalue VAR_TEMP_x4000, 155
	gotoif ne, scr_seq_0111_D44R0102_0194
	setvar VAR_OBJ_0, 1049
	goto scr_seq_0111_D44R0102_019A

scr_seq_0111_D44R0102_0194:
	setvar VAR_OBJ_0, 1047
scr_seq_0111_D44R0102_019A:
	return

scr_seq_0111_D44R0102_019C:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0111_D44R0102_02C0
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 26
	gotoif ne, scr_seq_0111_D44R0102_01D5
	apply_movement 0, scr_seq_0111_D44R0102_02C8
	goto scr_seq_0111_D44R0102_01F8

scr_seq_0111_D44R0102_01D5:
	comparevartovalue VAR_TEMP_x4000, 27
	gotoif ne, scr_seq_0111_D44R0102_01F0
	apply_movement 0, scr_seq_0111_D44R0102_02D0
	goto scr_seq_0111_D44R0102_01F8

scr_seq_0111_D44R0102_01F0:
	apply_movement 0, scr_seq_0111_D44R0102_02D8
scr_seq_0111_D44R0102_01F8:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 0
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 386
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0111_D44R0102_02A7
	callstd std_give_item_verbose
	setflag FLAG_UNK_0DA
	npc_msg 3
scr_seq_0111_D44R0102_0236:
	npc_msg 5
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 26
	gotoif ne, scr_seq_0111_D44R0102_0264
	apply_movement 0, scr_seq_0111_D44R0102_02E0
	apply_movement 255, scr_seq_0111_D44R0102_0310
	goto scr_seq_0111_D44R0102_0297

scr_seq_0111_D44R0102_0264:
	comparevartovalue VAR_TEMP_x4000, 27
	gotoif ne, scr_seq_0111_D44R0102_0287
	apply_movement 0, scr_seq_0111_D44R0102_02F0
	apply_movement 255, scr_seq_0111_D44R0102_0310
	goto scr_seq_0111_D44R0102_0297

scr_seq_0111_D44R0102_0287:
	apply_movement 0, scr_seq_0111_D44R0102_0300
	apply_movement 255, scr_seq_0111_D44R0102_0310
scr_seq_0111_D44R0102_0297:
	wait_movement
	hide_person 0
	setvar VAR_UNK_40C4, 2
	releaseall
	end

scr_seq_0111_D44R0102_02A7:
	npc_msg 4
	closemsg
	goto scr_seq_0111_D44R0102_0236

scr_seq_0111_D44R0102_02B2:
	.byte 0x02, 0x00, 0x4b, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0111_D44R0102_02C0:
	.short 14, 1
	.short 254, 0

scr_seq_0111_D44R0102_02C8:
	.short 15, 1
	.short 254, 0

scr_seq_0111_D44R0102_02D0:
	.short 15, 2
	.short 254, 0

scr_seq_0111_D44R0102_02D8:
	.short 15, 3
	.short 254, 0

scr_seq_0111_D44R0102_02E0:
	.short 12, 1
	.short 15, 3
	.short 12, 7
	.short 254, 0

scr_seq_0111_D44R0102_02F0:
	.short 12, 1
	.short 15, 2
	.short 12, 7
	.short 254, 0

scr_seq_0111_D44R0102_0300:
	.short 12, 1
	.short 15, 1
	.short 12, 7
	.short 254, 0

scr_seq_0111_D44R0102_0310:
	.short 0, 1
	.short 254, 0
scr_seq_0111_D44R0102_0318:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0E2
	gotoif TRUE, scr_seq_0111_D44R0102_0340
	buffer_players_name 0
	scrcmd_191 1
	npc_msg 7
	waitbutton
	closemsg
	setflag FLAG_UNK_0E2
	releaseall
	end

scr_seq_0111_D44R0102_0340:
	scrcmd_191 1
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0111_D44R0102_034E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 27, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0111_D44R0102_03FC
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0111_D44R0102_03F1
	npc_msg 9
scr_seq_0111_D44R0102_0379:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0111_D44R0102_039D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0111_D44R0102_03E0
	end

scr_seq_0111_D44R0102_039D:
	buffer_players_name 0
	npc_msg 10
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 27
	npc_msg 11
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_209
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0111_D44R0102_03E0:
	setvar VAR_TEMP_x4002, 1
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0111_D44R0102_03F1:
	npc_msg 13
	goto scr_seq_0111_D44R0102_0379

scr_seq_0111_D44R0102_03FA:
	.byte 0x02, 0x00
scr_seq_0111_D44R0102_03FC:
	npc_msg 29
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0111_D44R0102_045D
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0111_D44R0102_0468
	npc_msg 30
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 83
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0111_D44R0102_045D:
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0111_D44R0102_0468:
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0111_D44R0102_0473:
	scrcmd_609
	lockall
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 9, scr_seq_0111_D44R0102_0674
	comparevartovalue VAR_TEMP_x4000, 24
	gotoif ne, scr_seq_0111_D44R0102_04AA
	apply_movement 255, scr_seq_0111_D44R0102_0688
	goto scr_seq_0111_D44R0102_04B2

scr_seq_0111_D44R0102_04AA:
	apply_movement 255, scr_seq_0111_D44R0102_0694
scr_seq_0111_D44R0102_04B2:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	callstd std_play_rival_intro_music
	scrcmd_191 1
	npc_msg 14
	closemsg
	move_person 11, 28, 0, 34, 1
	move_person 12, 28, 0, 33, 1
	callstd 2032
	apply_movement 9, scr_seq_0111_D44R0102_0674
	apply_movement 255, scr_seq_0111_D44R0102_06A8
	apply_movement 11, scr_seq_0111_D44R0102_06E4
	apply_movement 12, scr_seq_0111_D44R0102_0704
	apply_movement 253, scr_seq_0111_D44R0102_06C8
	wait_movement
	buffer_players_name 0
	gender_msgbox 15, 16
	apply_movement 9, scr_seq_0111_D44R0102_0680
	wait_movement
	scrcmd_191 1
	npc_msg 17
	npc_msg 18
	apply_movement 9, scr_seq_0111_D44R0102_073C
	wait_movement
	buffer_players_name 0
	scrcmd_191 1
	npc_msg 19
	gender_msgbox 20, 21
	apply_movement 12, scr_seq_0111_D44R0102_0718
	wait_movement
	npc_msg 22
	scrcmd_191 1
	npc_msg 23
	apply_movement 9, scr_seq_0111_D44R0102_0744
	apply_movement 12, scr_seq_0111_D44R0102_0758
	apply_movement 255, scr_seq_0111_D44R0102_0764
	wait_movement
	buffer_players_name 0
	npc_msg 24
	closemsg
	apply_movement 9, scr_seq_0111_D44R0102_0770
	apply_movement 255, scr_seq_0111_D44R0102_0770
	apply_movement 12, scr_seq_0111_D44R0102_0718
	wait_movement
	comparevartovalue VAR_OBJ_0, 1048
	gotoif ne, scr_seq_0111_D44R0102_05AC
	scrcmd_562 736, 733, 734, 1
	goto scr_seq_0111_D44R0102_05D1

scr_seq_0111_D44R0102_05AC:
	comparevartovalue VAR_OBJ_0, 1049
	gotoif ne, scr_seq_0111_D44R0102_05C8
	scrcmd_562 737, 733, 734, 1
	goto scr_seq_0111_D44R0102_05D1

scr_seq_0111_D44R0102_05C8:
	scrcmd_562 735, 733, 734, 1
scr_seq_0111_D44R0102_05D1:
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0111_D44R0102_066C
	buffer_players_name 0
	gender_msgbox 25, 26
	closemsg
	apply_movement 11, scr_seq_0111_D44R0102_06F4
	wait_movement
	hide_person 11
	buffer_players_name 0
	npc_msg 27
	closemsg
	apply_movement 12, scr_seq_0111_D44R0102_0720
	wait_movement
	hide_person 12
	apply_movement 9, scr_seq_0111_D44R0102_0778
	apply_movement 255, scr_seq_0111_D44R0102_0780
	wait_movement
	buffer_players_name 0
	scrcmd_191 1
	npc_msg 28
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	hide_person 9
	hide_person 10
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 1, 0
	wait_fade
	apply_movement 253, scr_seq_0111_D44R0102_06DC
	wait_movement
	setvar VAR_UNK_40FC, 2
	setvar VAR_UNK_4119, 1
	releaseall
	end

scr_seq_0111_D44R0102_066C:
	white_out
	releaseall
	end

scr_seq_0111_D44R0102_0672:
	.byte 0x00, 0x00

scr_seq_0111_D44R0102_0674:
	.short 0, 1
	.short 75, 1
	.short 254, 0

scr_seq_0111_D44R0102_0680:
	.short 75, 1
	.short 254, 0

scr_seq_0111_D44R0102_0688:
	.short 65, 2
	.short 13, 2
	.short 254, 0

scr_seq_0111_D44R0102_0694:
	.short 65, 1
	.short 13, 1
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_0111_D44R0102_06A8:
	.short 65, 1
	.short 0, 1
	.short 75, 1
	.short 65, 2
	.short 15, 1
	.short 13, 2
	.short 0, 1
	.short 254, 0

scr_seq_0111_D44R0102_06C8:
	.short 65, 4
	.short 19, 1
	.short 17, 5
	.short 0, 1
	.short 254, 0

scr_seq_0111_D44R0102_06DC:
	.short 12, 1
	.short 254, 0

scr_seq_0111_D44R0102_06E4:
	.short 13, 7
	.short 14, 3
	.short 13, 3
	.short 254, 0

scr_seq_0111_D44R0102_06F4:
	.short 12, 4
	.short 15, 3
	.short 12, 7
	.short 254, 0

scr_seq_0111_D44R0102_0704:
	.short 63, 1
	.short 13, 7
	.short 14, 4
	.short 13, 4
	.short 254, 0

scr_seq_0111_D44R0102_0718:
	.short 13, 1
	.short 254, 0

scr_seq_0111_D44R0102_0720:
	.short 71, 1
	.short 8, 1
	.short 72, 1
	.short 16, 2
	.short 19, 4
	.short 16, 7
	.short 254, 0

scr_seq_0111_D44R0102_073C:
	.short 36, 2
	.short 254, 0

scr_seq_0111_D44R0102_0744:
	.short 20, 1
	.short 63, 1
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_0111_D44R0102_0758:
	.short 71, 1
	.short 20, 2
	.short 254, 0

scr_seq_0111_D44R0102_0764:
	.short 65, 2
	.short 34, 1
	.short 254, 0

scr_seq_0111_D44R0102_0770:
	.short 32, 1
	.short 254, 0

scr_seq_0111_D44R0102_0778:
	.short 3, 1
	.short 254, 0

scr_seq_0111_D44R0102_0780:
	.short 2, 1
	.short 254, 0
scr_seq_0111_D44R0102_0788:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
