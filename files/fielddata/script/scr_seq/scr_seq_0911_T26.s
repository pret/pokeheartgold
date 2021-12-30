#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0911_T26_00F4 ; 000
	scrdef scr_seq_0911_T26_00F6 ; 001
	scrdef scr_seq_0911_T26_0036 ; 002
	scrdef scr_seq_0911_T26_0075 ; 003
	scrdef scr_seq_0911_T26_05AC ; 004
	scrdef scr_seq_0911_T26_05C1 ; 005
	scrdef scr_seq_0911_T26_05D8 ; 006
	scrdef scr_seq_0911_T26_05ED ; 007
	scrdef scr_seq_0911_T26_0602 ; 008
	scrdef scr_seq_0911_T26_0615 ; 009
	scrdef scr_seq_0911_T26_0628 ; 010
	scrdef scr_seq_0911_T26_03F4 ; 011
	scrdef scr_seq_0911_T26_00A1 ; 012
	scrdef_end

scr_seq_0911_T26_0036:
	setvar VAR_UNK_4077, 2
	setflag FLAG_UNK_0C5
	setflag FLAG_UNK_99B
	comparevartovalue VAR_UNK_40F8, 0
	gotoif ne, scr_seq_0911_T26_0057
	setvar VAR_UNK_40F8, 2
scr_seq_0911_T26_0057:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 2
	callstd std_phone_call
	setvar VAR_UNK_4134, 5
	end

scr_seq_0911_T26_0075:
	setflag FLAG_UNK_0F5
	setvar VAR_UNK_4057, 1
	setvar VAR_SPECIAL_x8004, 24
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd std_phone_call
	setflag FLAG_UNK_249
	setvar VAR_UNK_40A5, 3
	end

scr_seq_0911_T26_00A1:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0911_T26_00B2
	clearflag FLAG_UNK_189
	end

scr_seq_0911_T26_00B2:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0911_T26_00CD
	clearflag FLAG_HIDE_CAMERON
	goto scr_seq_0911_T26_00E8

scr_seq_0911_T26_00CD:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0911_T26_00E4
	clearflag FLAG_HIDE_CAMERON
	goto scr_seq_0911_T26_00E8

scr_seq_0911_T26_00E4:
	setflag FLAG_HIDE_CAMERON
scr_seq_0911_T26_00E8:
	end

scr_seq_0911_T26_00EA:
	.byte 0x00, 0x00, 0x4b, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_0911_T26_00F4:
	end

scr_seq_0911_T26_00F6:
	scrcmd_609
	lockall
	fade_out_bgm 0, 3
	scrcmd_307 8, 7, 13, 14, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_UNK_1D6
	show_person 3
	apply_movement 3, scr_seq_0911_T26_02B4
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement 255, scr_seq_0911_T26_02C0
	wait_movement
	callstd std_play_rival_intro_music
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 239
	gotoif ne, scr_seq_0911_T26_015B
	apply_movement 3, scr_seq_0911_T26_02CC
	goto scr_seq_0911_T26_01C1

scr_seq_0911_T26_015B:
	comparevartovalue VAR_TEMP_x4001, 240
	gotoif ne, scr_seq_0911_T26_0176
	apply_movement 3, scr_seq_0911_T26_02DC
	goto scr_seq_0911_T26_01C1

scr_seq_0911_T26_0176:
	comparevartovalue VAR_TEMP_x4001, 241
	gotoif ne, scr_seq_0911_T26_0191
	apply_movement 3, scr_seq_0911_T26_02F0
	goto scr_seq_0911_T26_01C1

scr_seq_0911_T26_0191:
	comparevartovalue VAR_TEMP_x4001, 242
	gotoif ne, scr_seq_0911_T26_01AC
	apply_movement 3, scr_seq_0911_T26_0304
	goto scr_seq_0911_T26_01C1

scr_seq_0911_T26_01AC:
	comparevartovalue VAR_TEMP_x4001, 243
	gotoif ne, scr_seq_0911_T26_01C1
	apply_movement 3, scr_seq_0911_T26_0318
scr_seq_0911_T26_01C1:
	wait_movement
	buffer_rivals_name 0
	npc_msg 0
	closemsg
	comparevartovalue VAR_TEMP_x4001, 239
	gotoif ne, scr_seq_0911_T26_01F6
	apply_movement 3, scr_seq_0911_T26_032C
	apply_movement 255, scr_seq_0911_T26_037C
	apply_movement 253, scr_seq_0911_T26_03C4
	goto scr_seq_0911_T26_029C

scr_seq_0911_T26_01F6:
	comparevartovalue VAR_TEMP_x4001, 240
	gotoif ne, scr_seq_0911_T26_0221
	apply_movement 3, scr_seq_0911_T26_033C
	apply_movement 255, scr_seq_0911_T26_037C
	apply_movement 253, scr_seq_0911_T26_03C4
	goto scr_seq_0911_T26_029C

scr_seq_0911_T26_0221:
	comparevartovalue VAR_TEMP_x4001, 241
	gotoif ne, scr_seq_0911_T26_024C
	apply_movement 3, scr_seq_0911_T26_034C
	apply_movement 255, scr_seq_0911_T26_037C
	apply_movement 253, scr_seq_0911_T26_03C4
	goto scr_seq_0911_T26_029C

scr_seq_0911_T26_024C:
	comparevartovalue VAR_TEMP_x4001, 242
	gotoif ne, scr_seq_0911_T26_0277
	apply_movement 3, scr_seq_0911_T26_035C
	apply_movement 255, scr_seq_0911_T26_037C
	apply_movement 253, scr_seq_0911_T26_03C4
	goto scr_seq_0911_T26_029C

scr_seq_0911_T26_0277:
	comparevartovalue VAR_TEMP_x4001, 243
	gotoif ne, scr_seq_0911_T26_029C
	apply_movement 3, scr_seq_0911_T26_036C
	apply_movement 255, scr_seq_0911_T26_03A0
	apply_movement 253, scr_seq_0911_T26_03E0
scr_seq_0911_T26_029C:
	wait_movement
	setvar VAR_UNK_4078, 1
	hide_person 3
	setflag FLAG_UNK_1D6
	callstd 2032
	releaseall
	end


scr_seq_0911_T26_02B4:
	step 13, 1
	step 64, 1
	step_end

scr_seq_0911_T26_02C0:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0911_T26_02CC:
	step 1, 2
	step 15, 2
	step 64, 1
	step_end

scr_seq_0911_T26_02DC:
	step 13, 1
	step 1, 2
	step 15, 2
	step 64, 1
	step_end

scr_seq_0911_T26_02F0:
	step 13, 2
	step 1, 2
	step 15, 2
	step 64, 1
	step_end

scr_seq_0911_T26_0304:
	step 13, 3
	step 1, 2
	step 15, 2
	step 64, 1
	step_end

scr_seq_0911_T26_0318:
	step 13, 4
	step 1, 2
	step 15, 2
	step 64, 1
	step_end

scr_seq_0911_T26_032C:
	step 15, 6
	step 0, 2
	step 12, 10
	step_end

scr_seq_0911_T26_033C:
	step 15, 6
	step 0, 2
	step 12, 11
	step_end

scr_seq_0911_T26_034C:
	step 15, 6
	step 0, 2
	step 12, 12
	step_end

scr_seq_0911_T26_035C:
	step 15, 6
	step 0, 2
	step 12, 13
	step_end

scr_seq_0911_T26_036C:
	step 15, 6
	step 0, 2
	step 12, 14
	step_end

scr_seq_0911_T26_037C:
	step 0, 2
	step 71, 1
	step 77, 1
	step 72, 1
	step 64, 1
	step 35, 1
	step 64, 1
	step 32, 1
	step_end

scr_seq_0911_T26_03A0:
	step 1, 2
	step 71, 1
	step 76, 1
	step 72, 1
	step 64, 1
	step 35, 1
	step 64, 1
	step 32, 1
	step_end

scr_seq_0911_T26_03C4:
	step 0, 2
	step 71, 1
	step 77, 1
	step 72, 1
	step 66, 2
	step 34, 1
	step_end

scr_seq_0911_T26_03E0:
	step 1, 2
	step 71, 1
	step 76, 1
	step 72, 1
	step_end
scr_seq_0911_T26_03F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0911_T26_051C
	photo_album_is_full VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0911_T26_0530
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0911_T26_046D
	apply_movement 255, scr_seq_0911_T26_0544
	apply_movement 7, scr_seq_0911_T26_0590
	goto scr_seq_0911_T26_04BB

scr_seq_0911_T26_046D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0911_T26_0488
	apply_movement 255, scr_seq_0911_T26_055C
	goto scr_seq_0911_T26_04BB

scr_seq_0911_T26_0488:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0911_T26_04AB
	apply_movement 255, scr_seq_0911_T26_057C
	apply_movement 7, scr_seq_0911_T26_0590
	goto scr_seq_0911_T26_04BB

scr_seq_0911_T26_04AB:
	apply_movement 255, scr_seq_0911_T26_0568
	apply_movement 7, scr_seq_0911_T26_0590
scr_seq_0911_T26_04BB:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0911_T26_04E2
	apply_movement 253, scr_seq_0911_T26_059C
	wait_movement
scr_seq_0911_T26_04E2:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0x00
	wait_fade
	cameron_photo 23
	lockall
	fade_screen 6, 1, 1, 0x00
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0911_T26_051C:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0911_T26_0530:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0911_T26_0544:
	step 15, 1
	step 12, 2
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0911_T26_055C:
	step 12, 3
	step 33, 1
	step_end

scr_seq_0911_T26_0568:
	step 12, 1
	step 14, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0911_T26_057C:
	step 12, 1
	step 15, 1
	step 12, 3
	step 33, 1
	step_end

scr_seq_0911_T26_0590:
	step 63, 1
	step 32, 1
	step_end

scr_seq_0911_T26_059C:
	step 15, 1
	step 12, 1
	step 1, 1
	step_end
scr_seq_0911_T26_05AC:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 7, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0911_T26_05C1:
	scrcmd_055 5, 0, 17, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0911_T26_05D8:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 6, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0911_T26_05ED:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 8, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0911_T26_0602:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0911_T26_0615:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0911_T26_0628:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
