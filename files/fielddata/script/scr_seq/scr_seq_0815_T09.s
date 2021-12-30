#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0815_T09_0108 ; 000
	scrdef scr_seq_0815_T09_04A0 ; 001
	scrdef scr_seq_0815_T09_04B5 ; 002
	scrdef scr_seq_0815_T09_0016 ; 003
	scrdef scr_seq_0815_T09_037B ; 004
	scrdef_end

scr_seq_0815_T09_0016:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0815_T09_0027
	clearflag FLAG_UNK_189
	end

scr_seq_0815_T09_0027:
	checkflag FLAG_UNK_129
	gotoif TRUE, scr_seq_0815_T09_0038
	setflag FLAG_UNK_27D
	end

scr_seq_0815_T09_0038:
	setflag FLAG_UNK_25A
	get_phone_book_rematch 31, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0815_T09_007B
	comparevartovalue VAR_UNK_40FD, 0
	gotoif eq, scr_seq_0815_T09_007B
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, scr_seq_0815_T09_0077
	clearflag FLAG_UNK_25A
	goto scr_seq_0815_T09_007B

scr_seq_0815_T09_0077:
	setflag FLAG_UNK_25A
scr_seq_0815_T09_007B:
	scrcmd_147 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0815_T09_00CC
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0815_T09_00A9
	goto scr_seq_0815_T09_0102

scr_seq_0815_T09_00A7:
	.byte 0x02, 0x00
scr_seq_0815_T09_00A9:
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_0815_T09_00C4
	clearflag FLAG_UNK_27D
	goto scr_seq_0815_T09_00CA

scr_seq_0815_T09_00C4:
	goto scr_seq_0815_T09_0102

scr_seq_0815_T09_00CA:
	end

scr_seq_0815_T09_00CC:
	get_phone_book_rematch 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0815_T09_0102
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, scr_seq_0815_T09_00FA
	clearflag FLAG_UNK_27D
	goto scr_seq_0815_T09_0100

scr_seq_0815_T09_00FA:
	goto scr_seq_0815_T09_0102

scr_seq_0815_T09_0100:
	end

scr_seq_0815_T09_0102:
	setflag FLAG_UNK_27D
	end

scr_seq_0815_T09_0108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	release 253
	apply_movement 253, scr_seq_0815_T09_02FC
	wait_movement
	lock 253
	comparevartovalue VAR_UNK_40FD, 0
	gotoif ne, scr_seq_0815_T09_0304
	checkflag FLAG_UNK_128
	gotoif TRUE, scr_seq_0815_T09_016F
	setflag FLAG_UNK_128
	npc_msg 0
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0815_T09_0162
	apply_movement 0, scr_seq_0815_T09_0268
	goto scr_seq_0815_T09_016A

scr_seq_0815_T09_0162:
	apply_movement 0, scr_seq_0815_T09_0280
scr_seq_0815_T09_016A:
	wait_movement
	npc_msg 1
scr_seq_0815_T09_016F:
	comparevartovalue VAR_UNK_4135, 7
	gotoif ge, scr_seq_0815_T09_018C
	buffer_int 0, VAR_UNK_4135
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_018C:
	npc_msg 2
	closemsg
	scrcmd_386 VAR_TEMP_x4000
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0815_T09_01C7
	comparevartovalue VAR_SPECIAL_x8004, 1035
	gotoif ne, scr_seq_0815_T09_01C1
	apply_movement 253, scr_seq_0815_T09_02D4
	wait_movement
scr_seq_0815_T09_01C1:
	goto scr_seq_0815_T09_01DE

scr_seq_0815_T09_01C7:
	comparevartovalue VAR_SPECIAL_x8005, 495
	gotoif ne, scr_seq_0815_T09_01DE
	apply_movement 253, scr_seq_0815_T09_02E4
	wait_movement
scr_seq_0815_T09_01DE:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0815_T09_01F9
	apply_movement 0, scr_seq_0815_T09_0298
	goto scr_seq_0815_T09_0201

scr_seq_0815_T09_01F9:
	apply_movement 0, scr_seq_0815_T09_02A4
scr_seq_0815_T09_0201:
	wait_movement
	npc_msg 3
	closemsg
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0815_T09_0233
	apply_movement 0, scr_seq_0815_T09_02B0
	apply_movement 255, scr_seq_0815_T09_02F4
	apply_movement 253, scr_seq_0815_T09_02F4
	goto scr_seq_0815_T09_024B

scr_seq_0815_T09_0233:
	apply_movement 0, scr_seq_0815_T09_02C0
	apply_movement 255, scr_seq_0815_T09_02F4
	apply_movement 253, scr_seq_0815_T09_02F4
scr_seq_0815_T09_024B:
	wait_movement
	hide_person 0
	setflag FLAG_UNK_25A
	setflag FLAG_UNK_129
	setflag FLAG_UNK_2F8
	clearflag FLAG_UNK_2F9
	releaseall
	end

scr_seq_0815_T09_0265:
	.byte 0x00, 0x00, 0x00

scr_seq_0815_T09_0268:
	step 35, 1
	step 63, 2
	step 32, 1
	step 63, 2
	step 33, 1
	step_end

scr_seq_0815_T09_0280:
	step 32, 1
	step 63, 2
	step 35, 1
	step 63, 2
	step 34, 1
	step_end

scr_seq_0815_T09_0298:
	step 14, 1
	step 13, 1
	step_end

scr_seq_0815_T09_02A4:
	step 13, 1
	step 14, 1
	step_end

scr_seq_0815_T09_02B0:
	step 13, 2
	step 14, 2
	step 13, 8
	step_end

scr_seq_0815_T09_02C0:
	step 13, 1
	step 13, 2
	step 14, 2
	step 13, 7
	step_end

scr_seq_0815_T09_02D4:
	step 13, 1
	step 15, 1
	step 34, 1
	step_end

scr_seq_0815_T09_02E4:
	step 14, 1
	step 12, 1
	step 35, 1
	step_end

scr_seq_0815_T09_02F4:
	step 33, 1
	step_end

scr_seq_0815_T09_02FC:
	step 60, 1
	step_end
scr_seq_0815_T09_0304:
	npc_msg 5
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0815_T09_0365
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0815_T09_0370
	npc_msg 6
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 92
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_0365:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_0370:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_037B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 30, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0815_T09_0429
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_0815_T09_041E
	npc_msg 10
scr_seq_0815_T09_03A6:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0815_T09_03CA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0815_T09_040D
	end

scr_seq_0815_T09_03CA:
	buffer_players_name 0
	npc_msg 11
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 30
	npc_msg 12
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_27D
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0815_T09_040D:
	setvar VAR_TEMP_x4004, 1
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_041E:
	npc_msg 14
	goto scr_seq_0815_T09_03A6

scr_seq_0815_T09_0427:
	.byte 0x02, 0x00
scr_seq_0815_T09_0429:
	npc_msg 15
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0815_T09_048A
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0815_T09_0495
	npc_msg 16
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	cameron_photo 85
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_048A:
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_0495:
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0815_T09_04A0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 20, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0815_T09_04B5:
	scrcmd_055 21, 0, 9, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
